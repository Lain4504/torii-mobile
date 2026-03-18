import 'package:dio/dio.dart';

import '../models/academy_models.dart';
import '../models/checkout_models.dart';
import '../models/live_schedule_model.dart';
import '../models/live_offering_detail_model.dart';
import '../models/study_set_models.dart';
import '../../core/models/api_response.dart';
import '../../core/models/paginated_response.dart';

/// Academy API: course offerings (public), enrollments/me, orders/my, live-schedules
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

  // ---------- Live schedules ----------
  /// GET /api/academy/live-schedules (requires auth; may require academy.delivery.read)
  Future<List<LiveScheduleModel>> getLiveSchedules({
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/academy/live-schedules',
        queryParameters: <String, dynamic>{
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
        },
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (!api.success || api.data == null) return [];
      final items = api.data!['items'] as List<dynamic>? ?? [];
      return items.map((e) => LiveScheduleModel.fromJson(e as Map<String, dynamic>)).toList();
    } catch (_) {
      return [];
    }
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
}
