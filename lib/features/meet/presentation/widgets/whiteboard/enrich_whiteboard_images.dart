import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Payload tệp Excalidraw (trừ `id` — sẽ gán theo `fileId` từng phần tử).
typedef _CachedFilePayload = ({String mimeType, String dataUrl});

class WhiteboardEnrichResult {
  final String json;
  /// Số ảnh còn thiếu dataURL sau khi enrich (sẽ cần retry).
  final int missingImageCount;

  const WhiteboardEnrichResult({
    required this.json,
    required this.missingImageCount,
  });
}

/// LRU theo URL: nhiều lần sync NATS chỉ đổi vector, không tải lại cùng một ảnh.
const _maxImageUrlCacheEntries = 32;

final LinkedHashMap<String, _CachedFilePayload> _imageBytesByUrl =
    LinkedHashMap<String, _CachedFilePayload>();

void _cachePut(String url, _CachedFilePayload payload) {
  _imageBytesByUrl.remove(url);
  _imageBytesByUrl[url] = payload;
  while (_imageBytesByUrl.length > _maxImageUrlCacheEntries) {
    _imageBytesByUrl.remove(_imageBytesByUrl.keys.first);
  }
}

_CachedFilePayload? _cacheGet(String url) {
  final hit = _imageBytesByUrl.remove(url);
  if (hit != null) {
    _imageBytesByUrl[url] = hit;
  }
  return hit;
}

/// Web Excalidraw chỉ đồng bộ **mảng elements** qua NATS; phần tử `image` có
/// `customData.fileUrl` trỏ tới `GET .../download/uploadedFile/...` nhưng **không**
/// kèm map `files` (dataURL). [ExcalidrawJsonCodec] của markdraw **bắt buộc** có
/// `files[fileId].dataURL` mới hiển thị ảnh — hàm này tải blob theo URL và ghép
/// đúng format Excalidraw trước khi [MarkdrawController.loadFromContent].
Future<WhiteboardEnrichResult> enrichMeetWhiteboardJsonWithImageFiles(
  String trimmed,
) async {
  final trimmedIn = trimmed.trim();
  if (trimmedIn.isEmpty) {
    return const WhiteboardEnrichResult(json: '', missingImageCount: 0);
  }

  final Object? decoded;
  try {
    decoded = jsonDecode(trimmedIn);
  } catch (_) {
    return WhiteboardEnrichResult(json: trimmedIn, missingImageCount: 0);
  }

  late final Map<String, dynamic> root;
  late final List<dynamic> elementsList;

  if (decoded is List<dynamic>) {
    elementsList = decoded;
    root = <String, dynamic>{
      'type': 'excalidraw',
      'version': 2,
      'source': 'torii-meet-sync',
      'elements': elementsList,
      'files': <String, dynamic>{},
    };
  } else if (decoded is Map<String, dynamic>) {
    root = Map<String, dynamic>.from(decoded);
    final el = root['elements'];
    if (el is! List<dynamic>) {
      return WhiteboardEnrichResult(json: trimmedIn, missingImageCount: 0);
    }
    elementsList = el;
    final existing = root['files'];
    root['files'] = existing is Map<String, dynamic>
        ? Map<String, dynamic>.from(existing)
        : <String, dynamic>{};
  } else {
    return WhiteboardEnrichResult(json: trimmedIn, missingImageCount: 0);
  }

  final files = Map<String, dynamic>.from(
    root['files'] as Map<String, dynamic>? ?? {},
  );

  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 90),
      followRedirects: true,
      validateStatus: (code) => code != null && code >= 200 && code < 400,
    ),
  );

  var missingImageCount = 0;

  for (final el in elementsList) {
    if (el is! Map<String, dynamic>) continue;
    if (el['type'] != 'image') continue;
    final fileId = el['fileId']?.toString();
    if (fileId == null || fileId.isEmpty) continue;

    final existingFile = files[fileId];
    if (existingFile is Map<String, dynamic> &&
        existingFile['dataURL'] != null &&
        (existingFile['dataURL'] as String).isNotEmpty) {
      continue;
    }

    String? fileUrl;
    final customData = el['customData'];
    if (customData is Map<String, dynamic>) {
      fileUrl = customData['fileUrl'] as String?;
    }
    if (fileUrl == null || fileUrl.isEmpty) {
      if (kDebugMode) {
        debugPrint('Whiteboard enrich: missing fileUrl for image fileId=$fileId');
      }
      missingImageCount++;
      continue;
    }
    if (!_looksLikeHttpUrl(fileUrl)) {
      if (kDebugMode) {
        debugPrint(
          'Whiteboard enrich: invalid fileUrl for fileId=$fileId, url=$fileUrl',
        );
      }
      missingImageCount++;
      continue;
    }

    final cached = _cacheGet(fileUrl);
    if (cached != null) {
      if (kDebugMode) {
        debugPrint('Whiteboard enrich: cache hit for fileId=$fileId');
      }
      files[fileId] = <String, dynamic>{
        'mimeType': cached.mimeType,
        'id': fileId,
        'dataURL': cached.dataUrl,
        'created': DateTime.now().millisecondsSinceEpoch,
      };
      continue;
    }

    try {
      if (kDebugMode) {
        debugPrint('Whiteboard enrich: fetching image fileId=$fileId, url=$fileUrl');
      }
      final resp = await _fetchImageWithFallback(dio, fileUrl, fileId);
      final data = resp.data;
      if (data == null || data.isEmpty) continue;

      final bytes = Uint8List.fromList(data);
      final mime =
          _mimeFromResponse(resp) ?? _mimeFromUrl(fileUrl) ?? 'image/png';
      final b64 = base64Encode(bytes);
      final dataUrl = 'data:$mime;base64,$b64';
      _cachePut(fileUrl, (mimeType: mime, dataUrl: dataUrl));
      files[fileId] = <String, dynamic>{
        'mimeType': mime,
        'id': fileId,
        'dataURL': dataUrl,
        'created': DateTime.now().millisecondsSinceEpoch,
      };
      if (kDebugMode) {
        debugPrint(
          'Whiteboard enrich: fetch success fileId=$fileId, bytes=${bytes.length}',
        );
      }
    } catch (e) {
      // Bỏ qua ảnh lỗi mạng; các phần tử khác vẫn hiển thị.
      if (kDebugMode) {
        if (e is DioException) {
          debugPrint(
            'Whiteboard enrich: fetch failed fileId=$fileId, '
            'status=${e.response?.statusCode}, type=${e.type}, '
            'message=${e.message}, url=$fileUrl',
          );
        } else {
          debugPrint(
            'Whiteboard enrich: fetch failed fileId=$fileId, '
            'error=$e, url=$fileUrl',
          );
        }
      }
      missingImageCount++;
    }
  }

  root['files'] = files;
  return WhiteboardEnrichResult(
    json: jsonEncode(root),
    missingImageCount: missingImageCount,
  );
}

bool _looksLikeHttpUrl(String u) {
  final lower = u.toLowerCase();
  return lower.startsWith('https://') || lower.startsWith('http://');
}

String? _mimeFromResponse(Response<dynamic> r) {
  final raw = r.headers.value('content-type') ?? r.headers.value('Content-Type');
  if (raw == null || raw.isEmpty) return null;
  final main = raw.split(';').first.trim().toLowerCase();
  if (main.startsWith('image/')) return main;
  return null;
}

String? _mimeFromUrl(String url) {
  final lower = url.toLowerCase();
  if (lower.endsWith('.png')) return 'image/png';
  if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) return 'image/jpeg';
  if (lower.endsWith('.gif')) return 'image/gif';
  if (lower.endsWith('.webp')) return 'image/webp';
  if (lower.endsWith('.svg')) return 'image/svg+xml';
  return null;
}

Future<Response<List<int>>> _fetchImageWithFallback(
  Dio dio,
  String fileUrl,
  String fileId,
) async {
  try {
    return await dio.get<List<int>>(
      fileUrl,
      options: Options(responseType: ResponseType.bytes),
    );
  } on DioException catch (e) {
    final status = e.response?.statusCode;
    if (status != HttpStatus.notFound) rethrow;

    final fallbackUrls = _buildOfficeFallbackUrls(fileUrl);
    for (final fallbackUrl in fallbackUrls) {
      try {
        if (kDebugMode) {
          debugPrint(
            'Whiteboard enrich: fallback fetching fileId=$fileId, url=$fallbackUrl',
          );
        }
        return await dio.get<List<int>>(
          fallbackUrl,
          options: Options(responseType: ResponseType.bytes),
        );
      } on DioException {
        // try next fallback
      }
    }

    rethrow;
  }
}

List<String> _buildOfficeFallbackUrls(String fileUrl) {
  final uri = Uri.tryParse(fileUrl);
  if (uri == null) return const [];

  final marker = '/download/uploadedFile/';
  final full = uri.toString();
  final markerIndex = full.indexOf(marker);
  if (markerIndex == -1) return const [];

  final suffix = full.substring(markerIndex + marker.length);
  if (suffix.isEmpty) return const [];

  final origin = '${uri.scheme}://${uri.authority}';
  final normalizedSuffix = suffix.startsWith('/') ? suffix.substring(1) : suffix;

  // Hỗ trợ cả route đúng lẫn route web hiện đang ghép thiếu "/" (legacy behavior).
  return [
    '$origin/api/whiteboard/listOfficeFiles/$normalizedSuffix',
    '$origin/api/whiteboard/listOfficeFiles$normalizedSuffix',
  ];
}

/// Có ít nhất một ảnh cần tải từ mạng (chưa có `files[fileId].dataURL` trong JSON).
bool sceneJsonNeedsRemoteImageFetch(String trimmed) {
  final trimmedIn = trimmed.trim();
  if (trimmedIn.isEmpty) return false;

  final Object? decoded;
  try {
    decoded = jsonDecode(trimmedIn);
  } catch (_) {
    return false;
  }

  late final List<dynamic> elementsList;
  Map<String, dynamic>? existingFiles;

  if (decoded is List<dynamic>) {
    elementsList = decoded;
  } else if (decoded is Map<String, dynamic>) {
    final el = decoded['elements'];
    if (el is! List<dynamic>) return false;
    elementsList = el;
    final f = decoded['files'];
    if (f is Map) {
      existingFiles = Map<String, dynamic>.from(
        f.map((k, v) => MapEntry(k.toString(), v)),
      );
    }
  } else {
    return false;
  }

  for (final el in elementsList) {
    if (el is! Map<String, dynamic>) continue;
    if (el['type'] != 'image') continue;
    final fileId = el['fileId']?.toString();
    if (fileId == null || fileId.isEmpty) continue;

    final existing = existingFiles?[fileId];
    if (existing is Map<String, dynamic> &&
        (existing['dataURL'] as String?)?.isNotEmpty == true) {
      continue;
    }

    final customData = el['customData'];
    String? fileUrl;
    if (customData is Map<String, dynamic>) {
      fileUrl = customData['fileUrl'] as String?;
    }
    if (fileUrl == null || fileUrl.isEmpty) continue;
    if (!_looksLikeHttpUrl(fileUrl)) continue;
    return true;
  }

  return false;
}
