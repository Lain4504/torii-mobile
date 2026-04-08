import 'package:dio/dio.dart';

import '../database/app_database.dart';
import '../models/academy_models.dart';
// Removed legacy import
import '../models/academy_product_detail_model.dart';
import '../models/checkout_models.dart';
import '../models/jlpt_mock_models.dart';
import '../models/live_schedule_model.dart';
import '../models/live_session_join_result.dart';
import '../models/study_set_models.dart';
import '../../core/models/api_response.dart';
import '../../core/models/paginated_response.dart';
import '../../services/auth/token_service.dart';

/// Academy API: course offerings (public), enrollments/me, orders/my, live-sessions/me (lịch học viên)
class AcademyRepository {
  const AcademyRepository(this._dio, [this._database, this._tokenService]);

  final Dio _dio;
  final AppDatabase? _database;
  final TokenService? _tokenService;

  Future<Map<String, String>> _getRequestHeaders() async {
    final headers = <String, String>{};
    if (_tokenService != null) {
      final token = await _tokenService!.getAccessToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }

  // ---------- Class catalog (learner) ----------
  /// GET /api/academy/cohorts/public or /api/academy/vod-packages/public
  Future<List<AcademyProductModel>> getPublicClassCatalog({
    required String mode,
    String? level,
    String? q,
    String? month, // Legacy field, might no longer be used by new API
  }) async {
    final path = mode.toUpperCase() == 'LIVE'
        ? '/api/academy/live-classes/public'
        : '/api/academy/vod-packages/public';

    final response = await _dio.get<Map<String, dynamic>>(
      path,
      queryParameters: <String, dynamic>{
        if (level != null && level.isNotEmpty && level != 'Tất cả') 'level': level,
        if (q != null && q.isNotEmpty) 'q': q,
      },
    );
    
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return [];
    
    final items = api.data!['items'] as List<dynamic>? ?? [];
    return items.map((e) {
      final raw = Map<String, dynamic>.from(e as Map);
      raw['mode'] = mode.toUpperCase();
      return AcademyProductModel.fromJson(raw);
    }).toList();
  }

  /// GET /api/academy/cohorts/public/:id or /api/academy/vod-packages/public/:id
  Future<AcademyProductModel?> getPublicProductById(
    String id, {
    String mode = 'LIVE',
  }) async {
    final path = mode.toUpperCase() == 'LIVE'
        ? '/api/academy/cohorts/public/$id'
        : '/api/academy/vod-packages/public/$id';

    final response = await _dio.get<Map<String, dynamic>>(path);
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    
    final item = api.data!['item'];
    if (item is Map) {
      final raw = Map<String, dynamic>.from(item);
      raw['mode'] = mode.toUpperCase();
      return AcademyProductModel.fromJson(raw);
    }
    return null;
  }

  /// GET /api/academy/cohorts/public/:id or /api/academy/vod-packages/public/:id
  /// Returns more robust detail (including nested modules)
  Future<AcademyProductDetailModel?> getPublicProductDetailById(
    String id, {
    String mode = 'LIVE',
  }) async {
    final path = mode.toUpperCase() == 'LIVE'
        ? '/api/academy/cohorts/public/$id'
        : '/api/academy/vod-packages/public/$id';

    final response = await _dio.get<Map<String, dynamic>>(path);
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    
    final data = api.data!;
    return AcademyProductDetailModel.fromJson(data);
  }

  // ---------- Enrollments (me) ----------
  /// GET /api/academy/enrollments/me
  Future<PaginatedResponse<EnrollmentModel>> getMyEnrollments({
    int page = 1,
    int limit = 20,
    String? status,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/enrollments/me',
      queryParameters: <String, dynamic>{
        'page': page,
        'limit': limit,
        if (status != null && status.isNotEmpty) 'status': status,
      },
    );
    final rawData = response.data ?? {};
    final bool hasDataField = rawData.containsKey('data') && rawData['data'] != null;
    final bool hasItemsField = rawData.containsKey('items') && rawData['items'] != null;
    
    if (rawData['success'] == false || (!rawData.containsKey('success') && !hasDataField && !hasItemsField)) {
      throw Exception('${rawData['message'] ?? 'Lỗi danh sách khóa học'}. RAW: $rawData');
    }

    final dataList = hasDataField ? rawData['data'] : rawData;
    List<dynamic> items = [];
    int total = 0;
    int respPage = page;
    int respLimit = limit;
    int totalPages = 1;

    if (dataList is Map) {
      items = dataList['items'] as List<dynamic>? ?? dataList['data'] as List<dynamic>? ?? [];
      total = (dataList['total'] as num? ?? items.length).toInt();
      respPage = (dataList['page'] as num? ?? page).toInt();
      respLimit = (dataList['limit'] as num? ?? limit).toInt();
      totalPages = (dataList['totalPages'] as num? ?? 1).toInt();
    } else if (dataList is List) {
      items = dataList;
      total = items.length;
    } else if (hasItemsField) {
      items = rawData['items'] as List<dynamic>? ?? [];
      total = (rawData['total'] as num? ?? items.length).toInt();
      respPage = (rawData['page'] as num? ?? page).toInt();
      respLimit = (rawData['limit'] as num? ?? limit).toInt();
      totalPages = (rawData['totalPages'] as num? ?? 1).toInt();
    }

    return PaginatedResponse<EnrollmentModel>(
      data: items.map((e) => EnrollmentModel.fromJson(e as Map<String, dynamic>)).toList(),
      total: total,
      page: respPage,
      limit: respLimit,
      totalPages: totalPages,
    );
  }

  // ---------- Orders (my) ----------
  /// GET /api/academy/orders/my
  Future<PaginatedResponse<OrderModel>> getMyOrders({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/orders/my',
      queryParameters: <String, dynamic>{
        'page': page,
        'limit': limit,
        if (status != null && status.isNotEmpty) 'status': status,
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );
    final rawData = response.data ?? {};
    final bool hasDataField = rawData.containsKey('data') && rawData['data'] != null;
    final bool hasItemsField = rawData.containsKey('items') && rawData['items'] != null;

    if (rawData['success'] == false || (!rawData.containsKey('success') && !hasDataField && !hasItemsField)) {
      throw Exception('${rawData['message'] ?? 'Lỗi danh sách đơn hàng'}. RAW: $rawData');
    }

    final dataList = hasDataField ? rawData['data'] : rawData;
    List<dynamic> items = [];
    int total = 0;
    int respPage = page;
    int respLimit = limit;
    int totalPages = 1;

    if (dataList is Map) {
      items = dataList['items'] as List<dynamic>? ?? dataList['data'] as List<dynamic>? ?? [];
      total = (dataList['total'] as num? ?? items.length).toInt();
      respPage = (dataList['page'] as num? ?? page).toInt();
      respLimit = (dataList['limit'] as num? ?? limit).toInt();
      totalPages = (dataList['totalPages'] as num? ?? 1).toInt();
    } else if (dataList is List) {
      items = dataList;
      total = items.length;
    } else if (hasItemsField) {
      items = rawData['items'] as List<dynamic>? ?? [];
      total = (rawData['total'] as num? ?? items.length).toInt();
      respPage = (rawData['page'] as num? ?? page).toInt();
      respLimit = (rawData['limit'] as num? ?? limit).toInt();
      totalPages = (rawData['totalPages'] as num? ?? 1).toInt();
    }

    return PaginatedResponse<OrderModel>(
      data: items.map((e) => OrderModel.fromJson(e as Map<String, dynamic>)).toList(),
      total: total,
      page: respPage,
      limit: respLimit,
      totalPages: totalPages,
    );
  }

  /// GET /api/academy/orders/my/:id
  Future<OrderModel?> getMyOrderById(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/orders/my/$id',
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final item = api.data!['item'];
    return item != null
        ? OrderModel.fromJson(item as Map<String, dynamic>)
        : null;
  }

  /// GET /api/academy/orders/by-code/:orderCode
  Future<OrderModel?> getMyOrderByCode(String orderCode) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/orders/by-code/$orderCode',
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final raw = api.data;
    if (raw is Map<String, dynamic>) return OrderModel.fromJson(raw);
    return null;
  }

  /// Preview order: `POST /api/academy/orders/preview`
  Future<OrderPreviewModel?> previewOrder({
    required String productId,
    required String mode,
    String? classId,
    String? couponCode,
    Map<String, dynamic>? metadata,
  }) async {
    final isLive = mode.toUpperCase() == 'LIVE';
    
    try {
      final headers = await _getRequestHeaders();
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/academy/orders/preview',
        options: Options(headers: headers),
        data: <String, dynamic>{
          if (isLive) 'cohortIds': [productId] else 'vodPackageIds': [productId],
          if (isLive && classId != null && classId.isNotEmpty)
            'liveClassIdByCohort': <String, String>{productId: classId},
          if (couponCode != null && couponCode.trim().isNotEmpty)
            'couponCode': couponCode.trim(),
          if (metadata != null) 'metadata': metadata,
        },
      );

      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (!api.success || api.data == null) {
        throw Exception(api.message ?? 'Không thể tải thông tin thanh toán');
      }
      
      return OrderPreviewModel.fromJson(api.data!);
    } on DioException catch (e) {
      final msg = _extractErrorMessage(e);
      throw Exception(msg);
    } catch (e) {
      throw Exception('Lỗi hệ thống: $e');
    }
  }

  /// Create order: `POST /api/academy/orders/checkout`
  Future<OrderCheckoutResultModel?> checkoutOrder({
    required String productId,
    required String mode,
    String? classId,
    required String paymentMethod,
    String? couponCode,
    Map<String, dynamic>? metadata,
  }) async {
    final isLive = mode.toUpperCase() == 'LIVE';
    
    try {
      final headers = await _getRequestHeaders();
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/academy/orders/checkout',
        options: Options(headers: headers),
        data: <String, dynamic>{
          if (isLive) 'cohortIds': [productId] else 'vodPackageIds': [productId],
          if (isLive && classId != null && classId.isNotEmpty)
            'liveClassIdByCohort': <String, String>{productId: classId},
          'paymentMethod': paymentMethod.toUpperCase(),
          if (couponCode != null && couponCode.trim().isNotEmpty)
            'couponCode': couponCode.trim(),
          if (metadata != null) 'metadata': metadata,
        },
      );

      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (!api.success || api.data == null) {
        throw Exception(api.message ?? 'Không thể tạo đơn hàng');
      }
      
      return OrderCheckoutResultModel.fromJson(api.data!);
    } on DioException catch (e) {
      final msg = _extractErrorMessage(e);
      throw Exception(msg);
    } catch (e) {
      throw Exception('Lỗi hệ thống: $e');
    }
  }

  /// Check gift recipient: `GET /api/academy/enrollments/check-gift-recipient`
  Future<GiftRecipientCheckResult?> checkGiftRecipient({
    required String recipientEmail,
    required String courseId,
  }) async {
    try {
      final headers = await _getRequestHeaders();
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/academy/enrollments/check-gift-recipient',
        options: Options(headers: headers),
        queryParameters: {
          'recipientEmail': recipientEmail,
          'courseId': courseId,
        },
      );

      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (!api.success || api.data == null) {
        return GiftRecipientCheckResult(
          isEnrolled: false, 
          isRegistered: false, 
          hasError: true,
          message: api.message ?? 'Không thể xác thực người nhận',
        );
      }

      return GiftRecipientCheckResult.fromJson(api.data!);
    } on DioException catch (e) {
      final msg = _extractErrorMessage(e);
      return GiftRecipientCheckResult(
        isEnrolled: false, 
        isRegistered: false, 
        hasError: true,
        message: msg,
      );
    } catch (e) {
      return GiftRecipientCheckResult(
        isEnrolled: false, 
        isRegistered: false, 
        hasError: true,
        message: 'Lỗi hệ thống: $e',
      );
    }
  }

  String _extractErrorMessage(DioException e) {
    if (e.response?.data is Map) {
      final data = e.response!.data as Map;
      // Handle ApiResponse format: { success: false, message: "...", data: { ... } }
      if (data.containsKey('message')) return data['message'].toString();
      if (data['data'] is Map && (data['data'] as Map).containsKey('message')) {
        return data['data']['message'].toString();
      }
      if (data.containsKey('error')) return data['error'].toString();
      return 'Lỗi kết nối server (Code: ${e.response?.statusCode})';
    }
    return e.message ?? 'Lỗi kết nối. Vui lòng thử lại.';
  }

  /// GET /api/academy/orders/by-code/:orderCode (fulfillment summary for current user)
  Future<OrderFulfillmentSummaryModel?> getOrderFulfillmentByCode(
    String orderCode,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/orders/by-code/$orderCode',
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final raw = api.data!;
    return OrderFulfillmentSummaryModel.fromJson(raw);
  }

  // ---------- Live schedules (learner) — parity web-learner getMySchedule ----------
  static const int _schedulePastWeeks = 2;
  static const int _scheduleFutureWeeks = 12;

  /// Lịch buổi LIVE của user: `GET /api/academy/live-sessions/me` (cùng backend với web-learner, kèm điểm danh).
  Future<List<LiveScheduleModel>> getLiveSchedules({
    String? startDate,
    String? endDate,
  }) async {
    try {
      final now = DateTime.now();
      final from = startDate != null
          ? DateTime.tryParse(startDate) ??
                now.subtract(Duration(days: _schedulePastWeeks * 7))
          : now.subtract(Duration(days: _schedulePastWeeks * 7));
      final to = endDate != null
          ? DateTime.tryParse(endDate) ??
                now.add(Duration(days: _scheduleFutureWeeks * 7))
          : now.add(Duration(days: _scheduleFutureWeeks * 7));
      final fromStr = _formatYmd(from);
      final toStr = _formatYmd(to);

      final response = await _dio.get<Map<String, dynamic>>(
        '/api/academy/live-sessions/me',
        queryParameters: <String, dynamic>{'from': fromStr, 'to': toStr},
      );
      final body = response.data ?? {};
      if (body['success'] != true) return [];
      
      final data = body['data'];
      final items = (data is Map ? data['items'] : data) as List<dynamic>? ?? [];
      final merged =
          items
              .map(
                (e) => _liveScheduleFromSessionRow(
                  Map<String, dynamic>.from(e as Map),
                ),
              )
              .where((m) => m.id.isNotEmpty)
              .toList()
            ..sort((a, b) {
              final as = a.startAt;
              final bs = b.startAt;
              if (as == null && bs == null) return 0;
              if (as == null) return 1;
              if (bs == null) return -1;
              return as.compareTo(bs);
            });
      return merged;
    } catch (_) {
      return [];
    }
  }

  /// POST /api/live-sessions/:sessionId/join/student
  Future<LiveSessionJoinResult?> joinLiveSessionAsStudent(
    String sessionId,
  ) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/live-sessions/$sessionId/join/student',
      );
      final body = response.data ?? {};
      if (body['success'] != true) return null;
      final data = body['data'];
      if (data is! Map) return null;
      final m = Map<String, dynamic>.from(data);
      final token = m['token']?.toString();
      if (token == null || token.isEmpty) return null;
      return LiveSessionJoinResult(
        token: token,
        roomId: m['roomId']?.toString(),
        roomTitle: m['roomTitle']?.toString(),
      );
    } catch (_) {
      return null;
    }
  }

  String _formatYmd(DateTime d) {
    final local = DateTime(d.year, d.month, d.day);
    return '${local.year.toString().padLeft(4, '0')}-'
        '${local.month.toString().padLeft(2, '0')}-'
        '${local.day.toString().padLeft(2, '0')}';
  }

  int _parseHHmmToMinutes(String time) {
    final parts = time.split(':');
    final h = int.tryParse(parts.isNotEmpty ? parts[0] : '0') ?? 0;
    final m = int.tryParse(parts.length > 1 ? parts[1] : '0') ?? 0;
    return h * 60 + m;
  }

  DateTime? _combineSessionDateAndMinutes(
    String sessionDateRaw,
    int minutesOfDay,
  ) {
    final dateStr = sessionDateRaw.toString().split('T').first;
    final ymd = dateStr.split('-');
    if (ymd.length != 3) return null;
    final y = int.tryParse(ymd[0]);
    final mo = int.tryParse(ymd[1]);
    final d = int.tryParse(ymd[2]);
    if (y == null || mo == null || d == null) return null;
    final h = minutesOfDay ~/ 60;
    final mi = minutesOfDay % 60;
    return DateTime(y, mo, d, h, mi);
  }

  LiveScheduleModel _liveScheduleFromSessionRow(Map<String, dynamic> json) {
    final id = (json['id'] ?? '').toString();
    final classId = (json['classId'] ?? json['liveClassId'])?.toString();
    final sessionDate = json['sessionDate']?.toString() ?? '';
    final startTime = json['startTime']?.toString() ?? '00:00';
    final endTime = json['endTime']?.toString() ?? '00:00';
    final startMin = _parseHHmmToMinutes(startTime);
    final endMin = _parseHHmmToMinutes(endTime);
    final startAt = _combineSessionDateAndMinutes(sessionDate, startMin);
    var endAt = _combineSessionDateAndMinutes(sessionDate, endMin);
    if (startAt != null && endAt != null && !endAt.isAfter(startAt)) {
      endAt = endAt.add(const Duration(days: 1));
    }
    final durationMinutes = (startAt != null && endAt != null)
        ? endAt.difference(startAt).inMinutes.clamp(1, 24 * 60)
        : 90;

    final note = json['note']?.toString().trim();
    final title = (note != null && note.isNotEmpty)
        ? note
        : 'Buổi học trực tuyến';
    final roomId = json['roomId']?.toString();
    final courseTitle = json['courseTitle']?.toString();
    final courseThumbnail = json['courseThumbnail']?.toString();
    final rawAtt = json['attendanceStatus'];
    final attendanceStatus = rawAtt == null ? null : rawAtt.toString();

    return LiveScheduleModel(
      id: id,
      classId: classId,
      title: title,
      startAt: startAt,
      endAt: endAt,
      instructorName: null,
      courseTitle: courseTitle,
      courseThumbnail: courseThumbnail,
      attendanceStatus: attendanceStatus,
      status: null,
      meetingUrl: null,
      roomId: roomId,
      durationMinutes: durationMinutes,
    );
  }

  // ---------- Study sets ----------
  /// GET /api/academy/study-sets
  Future<List<StudySetModel>> getStudySets() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/academy/study-sets',
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (api.success && api.data != null) {
        final items = api.data!['items'] as List<dynamic>? ?? [];
        final sets = items
            .map((e) => StudySetModel.fromJson(e as Map<String, dynamic>))
            .toList();
        
        // Background cache update
        _database?.saveStudySets(sets);
        
        return sets;
      }
    } catch (e) {
      // Fallback to cache on error (e.g. offline)
      if (_database != null) {
        final cached = await _database!.getStudySets();
        if (cached != null) return cached;
      }
    }
    return [];
  }

  /// GET /api/academy/study-set-catalogs
  Future<List<StudySetModel>> getPublicStudySets({String? q}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/academy/study-set-catalogs',
        queryParameters: {
          if (q != null && q.trim().isNotEmpty) 'q': q,
        },
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (api.success && api.data != null) {
        final items = api.data!['items'] as List<dynamic>? ?? [];
        return items
            .map((e) => StudySetModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    } catch (_) {}
    return [];
  }

  /// POST /api/academy/study-set-catalogs/:id/clone
  Future<StudySetModel?> cloneStudySet(String sourceId) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/academy/study-set-catalogs/$sourceId/clone',
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (api.success && api.data != null) {
        final item = api.data!['item'];
        if (item is Map<String, dynamic>) return StudySetModel.fromJson(item);
      }
    } catch (_) {}
    return null;
  }

  /// GET /api/academy/study-sets/:id
  Future<Map<String, dynamic>?> getStudySetById(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/academy/study-sets/$id',
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (api.success && api.data != null) {
        final item = api.data!['item'];
        if (item is Map) {
          final res = Map<String, dynamic>.from(item);

          // Injection: Ensure cardCount is accessible at top level (mirrors StudySetModel.fromJson)
          if (res['cardCount'] == null || res['cardCount'] == 0) {
            final count = res['_count'];
            if (count is Map && count.containsKey('setCards')) {
              res['cardCount'] = (count['setCards'] as num?)?.toInt();
            }
          }

          _database?.saveStudySetDetail(id, res);
          return res;
        }
      }
    } catch (_) {
      if (_database != null) {
        return await _database!.getStudySetDetail(id);
      }
    }
    return null;
  }

  /// GET /api/academy/study-sets/:id/study
  Future<List<SetCardModel>> getStudyCards(String setId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/academy/study-sets/$setId/study',
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (api.success && api.data != null) {
        final items = api.data!['items'] as List<dynamic>? ?? [];
        final cards = items
            .map((e) => SetCardModel.fromJson(e as Map<String, dynamic>))
            .toList();
            
        _database?.saveStudyCards(setId, cards);
        return cards;
      }
    } catch (_) {
      if (_database != null) {
        final cached = await _database!.getStudyCards(setId);
        if (cached != null) return cached;
      }
    }
    return [];
  }

  /// POST /api/academy/set-cards/:id/review - body { quality: 0|1 }
  Future<SetCardModel?> reviewStudyCard(
    String cardId, {
    required int quality,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/academy/set-cards/$cardId/review',
      data: <String, dynamic>{'quality': quality},
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final item = api.data!['item'];
    if (item is Map<String, dynamic>) return SetCardModel.fromJson(item);
    if (item is Map) return SetCardModel.fromJson(item.cast<String, dynamic>());
    return null;
  }

  /// POST /api/academy/study-sets
  Future<StudySetModel?> createStudySet({
    required String title,
    String? description,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/academy/study-sets',
      data: <String, dynamic>{
        'title': title,
        if (description != null) 'description': description,
      },
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final item = api.data!['item'];
    if (item is Map<String, dynamic>) return StudySetModel.fromJson(item);
    if (item is Map)
      return StudySetModel.fromJson(item.cast<String, dynamic>());
    return null;
  }

  /// POST /api/academy/study-sets/:id/cards
  Future<SetCardModel?> createStudySetCard({
    required String setId,
    required String term,
    required String definition,
    String? hint,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/academy/study-sets/$setId/cards',
      data: <String, dynamic>{
        'term': term,
        'definition': definition,
        if (hint != null && hint.trim().isNotEmpty) 'hint': hint.trim(),
      },
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final item = api.data!['item'];
    if (item is Map<String, dynamic>) return SetCardModel.fromJson(item);
    if (item is Map) return SetCardModel.fromJson(item.cast<String, dynamic>());
    return null;
  }

  /// PATCH /api/academy/set-cards/:id
  Future<SetCardModel?> updateStudySetCard({
    required String cardId,
    String? term,
    String? definition,
    String? hint,
  }) async {
    final payload = <String, dynamic>{
      if (term != null) 'term': term,
      if (definition != null) 'definition': definition,
      if (hint != null) 'hint': hint,
    };
    if (payload.isEmpty) return null;

    final response = await _dio.patch<Map<String, dynamic>>(
      '/api/academy/set-cards/$cardId',
      data: payload,
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final item = api.data!['item'];
    if (item is Map<String, dynamic>) return SetCardModel.fromJson(item);
    if (item is Map) return SetCardModel.fromJson(item.cast<String, dynamic>());
    return null;
  }

  /// DELETE /api/academy/set-cards/:id
  Future<bool> deleteStudySetCard({required String cardId}) async {
    final response = await _dio.delete<Map<String, dynamic>>(
      '/api/academy/set-cards/$cardId',
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return false;
    final result = api.data!['result'];
    if (result is bool) return result;
    return api.success == true;
  }

  /// PATCH /api/academy/study-sets/:id
  ///
  /// Used by mobile to support long-press edit "drawer" on Study Set items.
  /// Returns true on success, false otherwise (no throw to keep UI friendly).
  Future<bool> updateStudySet({
    required String setId,
    required String title,
    String? description,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/academy/study-sets/$setId',
        data: <String, dynamic>{'title': title, 'description': description},
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data ?? {},
      );
      return api.success == true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> deleteStudySet({required String setId}) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/api/academy/study-sets/$setId',
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data ?? {},
      );
      return api.success == true;
    } catch (_) {
      return false;
    }
  }

  /// GET /api/academy/study-sets/:id/study-modes/test
  Future<List<Map<String, dynamic>>> getStudySetTestQuiz(
    String setId, {
    int count = 20,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/study-sets/$setId/study-modes/test',
      queryParameters: <String, dynamic>{'count': count},
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return [];
    final items = api.data!['items'] as List<dynamic>? ?? [];
    return items.map((e) => (e as Map).cast<String, dynamic>()).toList();
  }

  /// GET /api/academy/study-sets/:id/study-modes/match
  Future<List<Map<String, dynamic>>> getStudySetMatchGame(
    String setId, {
    int count = 6,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/study-sets/$setId/study-modes/match',
      queryParameters: <String, dynamic>{'count': count},
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return [];
    final items = api.data!['items'] as List<dynamic>? ?? [];
    return items.map((e) => (e as Map).cast<String, dynamic>()).toList();
  }

  /// GET /api/academy/classes/:classId/progress — lessonId đã hoàn thành (parity web-learner).
  /// API trả `{ modules: [{ lessons: [{ id, isCompleted }] }] }` — không có `lessons` phẳng.
  /// GET /api/academy/classes/:classId/progress — lessonId đã hoàn thành (parity web-learner).
  /// API trả `{ modules: [{ lessons: [{ id, isCompleted }] }] }` — không có `lessons` phẳng.
  Future<List<String>> getCompletedLessonIds(
    String classId, {
    String mode = 'LIVE',
    String? productId,
  }) async {
    final isLive = mode.toUpperCase() == 'LIVE';
    final effectiveId = (isLive && productId != null && productId.isNotEmpty)
        ? productId
        : classId;
    final path = isLive
        ? '/api/academy/live-classes/$classId/completed-lessons'
        : '/api/academy/vod-packages/$effectiveId/progress';

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: {
          if (isLive && productId != null && productId.isNotEmpty)
            'productId': productId,
        },
      );
      final body = response.data ?? {};
      final data = body['data'] ?? body;
      
      // If the API directly returns a list of completed strings
      if (data is List) {
        print('=== SUCCESS: getCompletedLessonIds found IDs from List: $data ===');
        return data.map((e) => e.toString()).toList();
      }

      if (data is! Map) return [];
      
      final content = data['item'] ?? data;
      final profile = content['courseProfile'] ?? content;
      
      final out = <String>{};

      void addFromLessonMap(Map<String, dynamic> map) {
        final completed = map['isCompleted'] == true;
        final id = map['lessonId']?.toString() ?? map['id']?.toString();
        print('    -> Lesson map id: $id, isCompleted: $completed');
        if (completed && id != null && id.isNotEmpty) out.add(id);
      }

      final flat = profile['lessons'] ?? content['lessons'];
      if (flat is List) {
        for (final l in flat) {
          if (l is Map) addFromLessonMap(Map<String, dynamic>.from(l));
        }
      }
      final modules = profile['modules'] ?? content['modules'];
      if (modules is List) {
        print('-> modules found: ${modules.length}');
        for (final m in modules) {
          if (m is! Map) continue;
          final modLessons = m['lessons'];
          if (modLessons is! List) continue;
          print('  -> modLessons length for module ${m['title'] ?? m['id']}: ${modLessons.length}');
          for (final l in modLessons) {
            if (l is Map) addFromLessonMap(Map<String, dynamic>.from(l));
          }
        }
      }
      print('=== SUCCESS: getCompletedLessonIds found IDs: $out ===');
      return out.toList();
    } catch (e, st) {
      print('=== ERROR: getCompletedLessonIds ===\n$e\n$st');
      return [];
    }
  }

  /// POST /api/academy/classes/:classId/lessons/:lessonId/complete
  Future<bool> completeClassLesson({
    required String classId,
    required String lessonId,
    String? productId,
    String mode = 'LIVE',
  }) async {
    final isLive = mode.toUpperCase() == 'LIVE';

    final path = isLive
        ? '/api/academy/live-classes/$classId/lessons/$lessonId/complete'
        : '/api/academy/vod-packages/$classId/lessons/$lessonId/complete';

    try {
      final response = await _dio.post<dynamic>(
        path,
        data: {
          'classId': classId,
          if (productId != null) 'productId': productId,
        },
      );
      
      if (response.statusCode == 204 || response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      
      final data = response.data;
      if (data is Map<String, dynamic>) {
        final api = ApiResponse<Map<String, dynamic>>.fromJson(data);
        return api.success == true;
      }
      
      return false;
    } catch (_) {
      return false;
    }
  }

  // ---------- JLPT mock ----------
  Future<List<JlptMockTemplateItemModel>> getJlptMockTemplates({
    String? levelCode,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/jlpt-mock/templates',
      queryParameters: <String, dynamic>{
        if (levelCode != null && levelCode.isNotEmpty) 'levelCode': levelCode,
      },
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return [];
    final items = api.data!['items'] as List<dynamic>? ?? const [];
    return items
        .map(
          (e) => JlptMockTemplateItemModel.fromJson(
            (e as Map).cast<String, dynamic>(),
          ),
        )
        .toList();
  }

  Future<JlptMockTemplateModel?> getJlptMockTemplateById(
    String templateId,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/jlpt-mock/templates/$templateId',
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final item = api.data!['item'];
    if (item is! Map) return null;
    return JlptMockTemplateModel.fromJson(item.cast<String, dynamic>());
  }

  Future<JlptMockAttemptStartModel?> startJlptAttempt({
    required String templateId,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/academy/jlpt-mock/attempts/start',
      data: <String, dynamic>{'templateId': templateId},
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final item = api.data!['item'];
    if (item is! Map) return null;
    return JlptMockAttemptStartModel.fromJson(item.cast<String, dynamic>());
  }

  Future<bool> saveJlptAnswers({
    required String attemptId,
    required List<Map<String, dynamic>> answers,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/academy/jlpt-mock/attempts/save-answers',
      data: <String, dynamic>{'attemptId': attemptId, 'answers': answers},
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    return api.success == true;
  }

  Future<JlptMockNextSectionModel?> nextJlptSection({
    required String attemptId,
    required int currentSectionOrder,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/academy/jlpt-mock/attempts/next-section',
      data: <String, dynamic>{
        'attemptId': attemptId,
        'currentSectionOrder': currentSectionOrder,
      },
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final item = api.data!['item'];
    if (item is! Map) return null;
    return JlptMockNextSectionModel.fromJson(item.cast<String, dynamic>());
  }

  Future<bool> submitJlptAttempt({required String attemptId}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/academy/jlpt-mock/attempts/submit',
      data: <String, dynamic>{'attemptId': attemptId},
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    return api.success == true;
  }

  Future<List<Map<String, dynamic>>> getJlptAttemptAnswers(
    String attemptId,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/jlpt-mock/attempts/$attemptId/answers',
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return [];
    final items = api.data!['items'] as List<dynamic>? ?? const [];
    return items.map((e) => (e as Map).cast<String, dynamic>()).toList();
  }

  Future<List<JlptMockAttemptHistoryItemModel>> getJlptAttemptHistory() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/jlpt-mock/attempts/history',
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return [];
    final items = api.data!['items'] as List<dynamic>? ?? const [];
    return items
        .map(
          (e) => JlptMockAttemptHistoryItemModel.fromJson(
            (e as Map).cast<String, dynamic>(),
          ),
        )
        .toList();
  }

  Future<JlptMockAttemptResultModel?> getJlptAttemptResult(
    String attemptId,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/jlpt-mock/attempts/$attemptId',
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final item = api.data!['item'];
    if (item is! Map) return null;
    return JlptMockAttemptResultModel.fromJson(item.cast<String, dynamic>());
  }

  // ---------- Academy Resource & My Folders ----------
  /// GET /api/academy/my-folders/live-classes
  Future<List<AcademyFolder>> getMyFolders({String? classId}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/my-folders/live-classes',
      queryParameters: <String, dynamic>{
        if (classId != null && classId.isNotEmpty) 'classId': classId,
      },
    );
    final body = response.data ?? {};
    if (body['success'] != true) return [];
    
    final data = body['data'];
    if (data is List) {
      return data.map((e) => AcademyFolder.fromJson(e as Map<String, dynamic>)).toList();
    }
    return [];
  }

  /// GET /api/academy/folders/:folderId/resources
  Future<List<AcademyResource>> getFolderResources(String folderId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/folders/$folderId/resources',
    );
    final body = response.data ?? {};
    if (body['success'] != true) return [];

    final data = body['data'];
    if (data is List) {
      return data.map((e) => AcademyResource.fromJson(e as Map<String, dynamic>)).toList();
    }
    return [];
  }

  /// GET /api/academy/resources/:resourceId
  Future<AcademyResource?> getResourceDetail(String resourceId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/resources/$resourceId',
    );
    final body = response.data ?? {};
    if (body['success'] != true) return null;
    
    final data = body['data'];
    final item = (data is Map ? (data['item'] ?? data['data'] ?? data) : data);
    
    if (item is Map<String, dynamic>) {
      return AcademyResource.fromJson(item);
    }
    return null;
  }

  Future<List<AcademyResource>> getFolderResourcesByClass(String classId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/my-folders/live-classes/$classId/resources',
    );
    final body = response.data ?? {};
    if (body['success'] != true) return [];

    final data = body['data'];
    if (data is List) {
      return data.map((e) => AcademyResource.fromJson(Map<String, dynamic>.from(e))).toList();
    }
    return [];
  }

  Future<String?> getStorageSignedUrl({
    required String fileId,
    int? expiresIn,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/storage/signed-url',
      queryParameters: <String, dynamic>{
        'fileId': fileId,
        if (expiresIn != null) 'expiresIn': expiresIn,
      },
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final signedUrl = api.data!['signedUrl']?.toString();
    if (signedUrl == null || signedUrl.isEmpty) return null;
    return signedUrl;
  }

  // ---------- Assessment Plans (Quiz/Midterm/Final) ----------
  /// GET /api/academy/assessment-plans/learner/status?classId={{classId}}
  Future<List<AssessmentMilestoneModel>> getAssessmentStatus(
    String classId,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/academy/assessment-plans/learner/status',
        queryParameters: {'classId': classId},
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (api.success && api.data != null) {
        final items = api.data!['items'] as List? ?? [];
        return items
            .map((e) => AssessmentMilestoneModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    } catch (_) {}
    return [];
  }

  /// POST /api/academy/exams/{{examId}}/attempts
  /// Returns { attemptId, questions: [...] } or just attemptId
  /// POST /api/academy/assessment-plans/assessments/{{assessmentId}}/attempts
  Future<Map<String, dynamic>?> startAssessmentAttempt({
    String? examId,
    String? assessmentId,
    required String classId,
  }) async {
    try {
      // Dùng endpoint thực tế từ web: /api/academy/exam-attempts/start
      final path = '/api/academy/exam-attempts/start';

      final response = await _dio.post<Map<String, dynamic>>(
        path,
        data: {
          'classId': classId,
          if (examId != null) 'examId': examId,
          if (assessmentId != null) 'assessmentId': assessmentId,
        },
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (api.success && api.data != null) {
        var data = api.data!;
        
        // Response format is { "success": true, "data": { "item": { ... } } }
        if (data.containsKey('item') && data['item'] is Map) {
          data = Map<String, dynamic>.from(data['item']);
        }

        // Normalize attemptId if it's assessmentAttemptId
        if (data['assessmentAttemptId'] != null && data['id'] == null) {
          data['id'] = data['assessmentAttemptId'];
        }
        
        // Cần lấy chi tiết bài quiz (chứa questions) từ api /exams/:examId
        if (examId != null && examId.isNotEmpty && examId != 'unknown' && data['questions'] == null) {
            try {
              final detailRes = await _dio.get<Map<String, dynamic>>('/api/academy/exams/$examId');
              final detailApi = ApiResponse<Map<String, dynamic>>.fromJson(detailRes.data ?? {});
              if (detailApi.success && detailApi.data != null) {
                 var detailData = detailApi.data!;
                 if (detailData.containsKey('item') && detailData['item'] is Map) {
                     detailData = Map<String, dynamic>.from(detailData['item']);
                 }
                 
                 // Lấy các câu hỏi từ các 'sections'
                 if (detailData['sections'] != null && detailData['sections'] is List) {
                     final List<dynamic> sections = detailData['sections'];
                     final List<dynamic> flatQuestions = [];
                     for (final section in sections) {
                         if (section['questions'] is List) {
                             for (final q in section['questions']) {
                                 // Cấu trúc lồng nhau: q['question'] chứa nội dung câu hỏi
                                 // Nhưng cần giữ lại examQuestionId (q['id']) để submit đúng
                                 if (q['question'] != null) {
                                     final questionData = Map<String, dynamic>.from(q['question']);
                                     // Thêm examQuestionId để dùng khi submit
                                     questionData['examQuestionId'] = q['id'];
                                     flatQuestions.add(questionData);
                                 } else {
                                     flatQuestions.add(q);
                                 }
                             }
                         }
                     }
                     data['questions'] = flatQuestions;
                 } else if (detailData['questions'] != null) {
                     data['questions'] = detailData['questions'];
                 }
              }
            } catch (_) {}
        }
        return data;
      }
    } catch (_) {}
    return null;
  }

  /// POST /api/academy/exam-attempts/save-draft
  /// Lưu câu trả lời vào database trước khi submit
  Future<bool> saveDraftAnswers({
    required String attemptId,
    required Map<String, String> draftAnswers,
  }) async {
    try {
      // Backend expects: { attemptId, draftAnswers: { questionId: optionId } }
      // Key = question.id (ID gốc), Value = option.id hoặc optionKey
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/academy/exam-attempts/save-draft',
        data: {
          'attemptId': attemptId,
          'draftAnswers': draftAnswers,
        },
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      return api.success == true;
    } catch (_) {
      return false;
    }
  }

  /// POST /api/academy/exam-attempts/submit
  /// Backend tính điểm dựa trên draftAnswers đã lưu trước đó
  Future<Map<String, dynamic>?> submitAssessmentAttempt({
    required String attemptId,
  }) async {
    try {
      // Chỉ gửi attemptId, backend dùng draftAnswers đã save
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/academy/exam-attempts/submit',
        data: {
          'attemptId': attemptId,
        },
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (api.success == true) {
        return api.data ?? response.data;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getAssessmentAttempt(String attemptId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/api/academy/exam-attempts/$attemptId');
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (api.success == true) {
        return api.data;
      }
      return response.data; // Thử fallback nếu ko có base wrapper
    } catch (_) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getExam(String examId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/api/academy/exams/$examId');
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (api.success == true) {
        return api.data;
      }
      return response.data; // Thử fallback
    } catch (_) {
      return null;
    }
  }

  // ---------- Assignments (Live Class) ----------
  /// GET /api/academy/live-classes/{{classId}}/assignments
  Future<List<AssignmentModel>> getAssignments(String classId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/academy/live-classes/$classId/assignments',
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (api.success && api.data != null) {
        final items = api.data!['items'] as List? ?? [];
        return items
            .map((e) => AssignmentModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    } catch (_) {}
    return [];
  }

  /// POST /api/academy/assignment-submissions
  Future<bool> submitAssignment({
    required String classId,
    required String assignmentId,
    required String content,
    String? classAssessmentId,
    String? assignmentTemplateId,
    List<String>? fileUrls,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/academy/assignment-submissions',
        data: {
          'classId': classId,
          'liveClassAssignmentId': assignmentId,
          'classAssessmentId': classAssessmentId,
          'assignmentTemplateId': assignmentTemplateId,
          'content': content,
          if (fileUrls != null) 'fileUrls': fileUrls,
          'status': 'SUBMITTED',
        },
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      return api.success == true;
    } catch (_) {
      return false;
    }
  }
}
