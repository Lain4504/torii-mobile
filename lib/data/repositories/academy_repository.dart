import 'package:dio/dio.dart';

import '../models/academy_models.dart';
import '../models/checkout_models.dart';
import '../models/live_schedule_model.dart';
import '../models/live_session_join_result.dart';
import '../models/live_offering_detail_model.dart';
import '../models/study_set_models.dart';
import '../../core/models/api_response.dart';
import '../../core/models/paginated_response.dart';

/// Academy API: course offerings (public), enrollments/me, orders/my, live-sessions (lịch học viên)
class AcademyRepository {
  const AcademyRepository(this._dio);

  final Dio _dio;

  // ---------- Course offerings (public) ----------
  /// GET /api/academy/course-offerings/public
  Future<List<CourseOfferingModel>> getPublicCourseOfferings({
    String? q,
    String? mode,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/course-offerings/public',
      queryParameters: <String, dynamic>{
        if (q != null && q.isNotEmpty) 'q': q,
        if (mode != null && mode.isNotEmpty) 'mode': mode,
      },
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return [];
    final items = api.data!['items'] as List<dynamic>? ?? [];
    return items.map((e) => CourseOfferingModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// GET /api/academy/course-offerings/public/:id
  Future<CourseOfferingModel?> getPublicCourseOfferingById(String id) async {
    final response = await _dio.get<Map<String, dynamic>>('/api/academy/course-offerings/public/$id');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final raw = api.data!;
    final item = raw['item'] ?? raw['data'] ?? raw;
    if (item is Map<String, dynamic>) {
      return CourseOfferingModel.fromJson(item);
    }
    if (item is Map) {
      return CourseOfferingModel.fromJson(item.cast<String, dynamic>());
    }
    return null;
  }

  /// GET /api/academy/course-offerings/public/:id (raw detail including classes)
  Future<LiveOfferingDetailModel?> getPublicLiveOfferingDetailById(String id) async {
    final response = await _dio.get<Map<String, dynamic>>('/api/academy/course-offerings/public/$id');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final raw = api.data!;
    final item = raw['item'] ?? raw['data'] ?? raw;
    if (item is Map<String, dynamic>) {
      return LiveOfferingDetailModel.fromJson(item);
    }
    if (item is Map) {
      return LiveOfferingDetailModel.fromJson(item.cast<String, dynamic>());
    }
    return null;
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
    final body = response.data ?? {};
    if (body['success'] != true) {
      throw Exception(body['message'] ?? 'Failed to fetch enrollments');
    }

    // API shape: { success, data: { items, total, page, limit, totalPages } }
    final inner = body['data'];
    final List<dynamic> items;
    int total;
    int totalPages;

    if (inner is Map<String, dynamic>) {
      items = inner['items'] as List<dynamic>? ?? [];
      total = (inner['total'] as num?)?.toInt() ?? items.length;
      totalPages = (inner['totalPages'] as num?)?.toInt() ?? 1;
    } else {
      items = body['items'] as List<dynamic>? ?? [];
      total = (body['total'] as num?)?.toInt() ?? items.length;
      totalPages = (body['totalPages'] as num?)?.toInt() ?? 1;
    }

    return PaginatedResponse<EnrollmentModel>(
      data: items.map((e) => EnrollmentModel.fromJson(e as Map<String, dynamic>)).toList(),
      total: total,
      page: (inner is Map<String, dynamic>
              ? (inner['page'] as num?)?.toInt()
              : (body['page'] as num?)?.toInt()) ??
          1,
      limit: (inner is Map<String, dynamic>
              ? (inner['limit'] as num?)?.toInt()
              : (body['limit'] as num?)?.toInt()) ??
          limit,
      totalPages: totalPages,
    );
  }

  // ---------- Orders (my) ----------
  /// GET /api/academy/orders/my - gateway returns successResponse(result) with result = { data, total, page, limit, totalPages }
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
    final body = response.data ?? {};
    if (body['success'] != true) {
      throw Exception(body['message'] ?? 'Failed to fetch orders');
    }
    final inner = body['data'];
    final List<dynamic> data;
    int total;
    int totalPages;
    if (inner is Map<String, dynamic>) {
      data = inner['data'] as List<dynamic>? ?? inner['items'] as List<dynamic>? ?? [];
      total = (inner['total'] as num?)?.toInt() ?? data.length;
      totalPages = (inner['totalPages'] as num?)?.toInt() ?? 1;
    } else {
      data = body['data'] as List<dynamic>? ?? body['items'] as List<dynamic>? ?? [];
      total = (body['total'] as num?)?.toInt() ?? data.length;
      totalPages = (body['totalPages'] as num?)?.toInt() ?? 1;
    }
    return PaginatedResponse<OrderModel>(
      data: data.map((e) => OrderModel.fromJson(e as Map<String, dynamic>)).toList(),
      total: total,
      page: (body['page'] as num?)?.toInt() ?? (inner is Map ? (inner['page'] as num?)?.toInt() : null) ?? 1,
      limit: (body['limit'] as num?)?.toInt() ?? (inner is Map ? (inner['limit'] as num?)?.toInt() : null) ?? limit,
      totalPages: totalPages,
    );
  }

  /// GET /api/academy/orders/my/:id
  Future<OrderModel?> getMyOrderById(String id) async {
    final response = await _dio.get<Map<String, dynamic>>('/api/academy/orders/my/$id');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final item = api.data!['item'];
    return item != null ? OrderModel.fromJson(item as Map<String, dynamic>) : null;
  }

  /// GET /api/academy/orders/by-code/:orderCode
  Future<OrderModel?> getMyOrderByCode(String orderCode) async {
    final response = await _dio.get<Map<String, dynamic>>('/api/academy/orders/by-code/$orderCode');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final raw = api.data;
    if (raw is Map<String, dynamic>) return OrderModel.fromJson(raw);
    return null;
  }

  /// POST /api/academy/orders/preview
  Future<OrderPreviewModel> previewOrder({
    required String offeringId,
    String? classId,
    String? couponCode,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/academy/orders/preview',
      data: <String, dynamic>{
        'offeringIds': [offeringId],
        if (classId != null && classId.isNotEmpty) 'classIdByOffering': {offeringId: classId},
        if (couponCode != null && couponCode.trim().isNotEmpty) 'couponCode': couponCode.trim(),
      },
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) {
      throw Exception(api.message ?? 'Failed to preview order');
    }
    final raw = api.data!;
    return OrderPreviewModel.fromJson(raw);
  }

  /// POST /api/academy/orders/checkout
  Future<OrderCheckoutResultModel> checkoutOrder({
    required String offeringId,
    String? classId,
    String paymentMethod = 'PAYOS',
    String? couponCode,
    Map<String, dynamic>? metadata,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/academy/orders/checkout',
      data: <String, dynamic>{
        'offeringIds': [offeringId],
        if (classId != null && classId.isNotEmpty) 'classIdByOffering': {offeringId: classId},
        'paymentMethod': paymentMethod,
        if (couponCode != null && couponCode.trim().isNotEmpty) 'couponCode': couponCode.trim(),
        if (metadata != null) 'metadata': metadata,
      },
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) {
      throw Exception(api.message ?? 'Failed to create order');
    }
    return OrderCheckoutResultModel.fromJson(api.data!);
  }

  /// GET /api/academy/orders/by-code/:orderCode (fulfillment summary for current user)
  Future<OrderFulfillmentSummaryModel?> getOrderFulfillmentByCode(String orderCode) async {
    final response = await _dio.get<Map<String, dynamic>>('/api/academy/orders/by-code/$orderCode');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final raw = api.data!;
    return OrderFulfillmentSummaryModel.fromJson(raw);
  }

  // ---------- Live schedules (learner) — parity web-learner getMySchedule ----------
  static const int _schedulePastWeeks = 2;
  static const int _scheduleFutureWeeks = 12;

  /// Gom buổi học từ các lớp LIVE đã đăng ký: GET enrollments/me + GET /api/academy/live-sessions theo từng classId.
  Future<List<LiveScheduleModel>> getLiveSchedules({
    String? startDate,
    String? endDate,
  }) async {
    try {
      final enrollments = await getMyEnrollments(page: 1, limit: 100, status: 'ACTIVE');
      final liveEnrollments = enrollments.data.where((e) {
        final m = (e.mode ?? '').toUpperCase();
        return m == 'LIVE';
      }).toList();
      if (liveEnrollments.isEmpty) return [];

      final now = DateTime.now();
      final from = startDate != null
          ? DateTime.tryParse(startDate) ?? now.subtract(Duration(days: _schedulePastWeeks * 7))
          : now.subtract(Duration(days: _schedulePastWeeks * 7));
      final to = endDate != null
          ? DateTime.tryParse(endDate) ?? now.add(Duration(days: _scheduleFutureWeeks * 7))
          : now.add(Duration(days: _scheduleFutureWeeks * 7));
      final fromStr = _formatYmd(from);
      final toStr = _formatYmd(to);

      final buckets = await Future.wait(
        liveEnrollments.map((e) async {
          try {
            final raw = await _fetchLiveSessionRows(e.classId, fromStr, toStr);
            return raw
                .map(
                  (row) => _liveScheduleFromSessionRow(
                    row,
                    classId: e.classId,
                    courseTitle: e.courseTitle,
                    instructorName: e.instructorName,
                    courseThumbnail: e.thumbnailUrl,
                  ),
                )
                .toList();
          } catch (_) {
            return <LiveScheduleModel>[];
          }
        }),
      );

      final merged = buckets.expand((x) => x).toList()
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
  Future<LiveSessionJoinResult?> joinLiveSessionAsStudent(String sessionId) async {
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

  Future<List<Map<String, dynamic>>> _fetchLiveSessionRows(
    String classId,
    String from,
    String to,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/academy/live-sessions',
      queryParameters: <String, dynamic>{
        'classId': classId,
        'from': from,
        'to': to,
      },
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return [];
    final items = api.data!['items'] as List<dynamic>? ?? [];
    return items.map((e) => Map<String, dynamic>.from(e as Map)).toList();
  }

  int _parseHHmmToMinutes(String time) {
    final parts = time.split(':');
    final h = int.tryParse(parts.isNotEmpty ? parts[0] : '0') ?? 0;
    final m = int.tryParse(parts.length > 1 ? parts[1] : '0') ?? 0;
    return h * 60 + m;
  }

  DateTime? _combineSessionDateAndMinutes(String sessionDateRaw, int minutesOfDay) {
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

  LiveScheduleModel _liveScheduleFromSessionRow(
    Map<String, dynamic> json, {
    required String classId,
    String? courseTitle,
    String? instructorName,
    String? courseThumbnail,
  }) {
    final id = (json['id'] ?? '').toString();
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
    final title = (note != null && note.isNotEmpty) ? note : 'Buổi học trực tuyến';
    final roomId = json['roomId']?.toString();

    return LiveScheduleModel(
      id: id,
      classId: classId,
      title: title,
      startAt: startAt,
      endAt: endAt,
      instructorName: instructorName,
      courseTitle: courseTitle,
      courseThumbnail: courseThumbnail,
      status: null,
      meetingUrl: null,
      roomId: roomId,
      durationMinutes: durationMinutes,
    );
  }

  // ---------- Study sets ----------
  /// GET /api/academy/study-sets
  Future<List<StudySetModel>> getStudySets() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/academy/study-sets');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return [];
    final items = api.data!['items'] as List<dynamic>? ?? [];
    return items.map((e) => StudySetModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// GET /api/academy/study-sets/:id
  Future<Map<String, dynamic>?> getStudySetById(String id) async {
    final response = await _dio.get<Map<String, dynamic>>('/api/academy/study-sets/$id');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    return api.data!;
  }

  /// GET /api/academy/study-sets/:id/study
  Future<List<SetCardModel>> getStudyCards(String setId) async {
    final response = await _dio.get<Map<String, dynamic>>('/api/academy/study-sets/$setId/study');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return [];
    final items = api.data!['items'] as List<dynamic>? ?? [];
    return items.map((e) => SetCardModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// POST /api/academy/set-cards/:id/review - body { quality: 0|1 }
  Future<SetCardModel?> reviewStudyCard(String cardId, {required int quality}) async {
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
    if (item is Map) return StudySetModel.fromJson(item.cast<String, dynamic>());
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
    final response = await _dio.delete<Map<String, dynamic>>('/api/academy/set-cards/$cardId');
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
        data: <String, dynamic>{
          'title': title,
          'description': description,
        },
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      return api.success == true;
    } catch (_) {
      return false;
    }
  }

  /// GET /api/academy/study-sets/:id/study-modes/test
  Future<List<Map<String, dynamic>>> getStudySetTestQuiz(String setId, {int count = 20}) async {
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
  Future<List<Map<String, dynamic>>> getStudySetMatchGame(String setId, {int count = 6}) async {
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
  Future<List<String>> getCompletedLessonIds(String classId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/api/academy/classes/$classId/progress');
      final body = response.data ?? {};
      final data = body['data'] ?? body;
      if (data is! Map) return [];
      final out = <String>{};

      void addFromLessonMap(Map<String, dynamic> map) {
        final completed = map['isCompleted'] == true;
        final id = map['lessonId']?.toString() ?? map['id']?.toString();
        if (completed && id != null && id.isNotEmpty) out.add(id);
      }

      final flat = data['lessons'];
      if (flat is List) {
        for (final l in flat) {
          if (l is Map) addFromLessonMap(Map<String, dynamic>.from(l));
        }
      }
      final modules = data['modules'];
      if (modules is List) {
        for (final m in modules) {
          if (m is! Map) continue;
          final modLessons = m['lessons'];
          if (modLessons is! List) continue;
          for (final l in modLessons) {
            if (l is Map) addFromLessonMap(Map<String, dynamic>.from(l));
          }
        }
      }
      return out.toList();
    } catch (_) {
      return [];
    }
  }

  /// POST /api/academy/classes/:classId/lessons/:lessonId/complete
  Future<bool> completeClassLesson({
    required String classId,
    required String lessonId,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/academy/classes/$classId/lessons/$lessonId/complete',
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      return api.success == true;
    } catch (_) {
      return false;
    }
  }
}
