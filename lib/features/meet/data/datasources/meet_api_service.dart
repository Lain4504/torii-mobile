import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/config/app_config.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';
import 'package:torii_app/services/auth/token_service.dart';

final meetApiServiceProvider = Provider<MeetApiService>((ref) {
  final tokenService = ref.watch(tokenServiceProvider);
  return MeetApiService(tokenService);
});

class MeetApiService {
  final TokenService _tokenService;
  late final Dio _dio;
  String? _currentToken;
  String? _manualToken;

  /// Web client sends raw JWT; set true if gateway/proxy expect "Bearer <token>".
  static const bool _useBearerPrefix = false;

  MeetApiService(this._tokenService) {
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      contentType: 'application/protobuf',
      responseType: ResponseType.bytes,
    ));

    // Add interceptor for Authorization header (JWT from getJoinToken for verifyToken; raw token by default like web)
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token;
        if (_manualToken != null) {
          token = _manualToken;
          _currentToken = _manualToken;
        } else {
          token = await _tokenService.getAccessToken();
          _currentToken = token;
        }
        if (token != null) {
          options.headers['Authorization'] = _useBearerPrefix ? 'Bearer $token' : token;
        }
        return handler.next(options);
      },
    ));

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }
  }

  String? get token => _currentToken;

  void setManualToken(String? token) {
    _manualToken = token;
  }

  Future<VerifyTokenRes> verifyToken({bool isProduction = false}) async {
    try {
      final req = VerifyTokenReq(isProduction: isProduction);
      final response = await _dio.post(
        '/api/verifyToken',
        data: req.writeToBuffer(),
      );

      return VerifyTokenRes.fromBuffer(response.data as List<int>);
    } on DioException catch (e) {
      return VerifyTokenRes(status: false, msg: e.message ?? 'Unknown error');
    } catch (e) {
      return VerifyTokenRes(status: false, msg: e.toString());
    }
  }

  // --- Auth & Room Management (JSON based to match Web) ---

  Future<String> _getHashSignature(String message) async {
    final key = utf8.encode(AppConfig.meetApiSecret);
    final bytes = utf8.encode(message);
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    return digest.toString();
  }

  /// Auth room endpoints expect JSON with snake_case keys (room_id, user_info) per gateway proto parsing.
  Future<Map<String, dynamic>> _sendAuthRequest(String method, Map<String, dynamic> body) async {
    final jsonBody = jsonEncode(body);
    final signature = await _getHashSignature(jsonBody);

    final response = await _dio.post(
      '/auth/$method',
      data: jsonBody,
      options: Options(
        contentType: 'application/json',
        responseType: ResponseType.json,
        headers: {
          'API-KEY': AppConfig.meetApiKey,
          'HASH-SIGNATURE': signature,
        },
      ),
    );

    return response.data as Map<String, dynamic>;
  }

  Future<bool> isRoomActive(String roomId) async {
    try {
      final data = await _sendAuthRequest('room/isRoomActive', {'room_id': roomId});
      return data['is_active'] == true;
    } catch (e) {
      if (kDebugMode) print('isRoomActive error: $e');
      return false;
    }
  }

  Future<bool> createRoom(String roomId) async {
    try {
      // Simplified default room info matching Web (helper/roomConfig.ts)
      final body = {
        'roomId': roomId,
        'emptyTimeout': 7200,
        'metadata': {
          'roomTitle': 'Mobile Meeting',
          'welcomeMessage': 'Welcome from Torii Mobile!',
          'roomFeatures': {
            'allowWebcams': true,
            'muteOnStart': false,
            'allowScreenShare': true,
            'allowRaiseHand': true,
            'chatFeatures': {'isAllow': true},
          }
        }
      };
      final data = await _sendAuthRequest('room/create', body);
      return data['status'] == true;
    } catch (e) {
      if (kDebugMode) print('createRoom error: $e');
      return false;
    }
  }

  Future<String?> getJoinToken({
    required String roomId,
    required String name,
    required String userId,
    bool isAdmin = false,
  }) async {
    try {
      final body = {
        'room_id': roomId,
        'user_info': {
          'is_admin': isAdmin,
          'name': name,
          'user_id': userId,
        }
      };
      final data = await _sendAuthRequest('room/getJoinToken', body);
      if (data['status'] == true) {
        return data['token'] as String?;
      }
      return null;
    } catch (e) {
      if (kDebugMode) print('getJoinToken error: $e');
      return null;
    }
  }
}
