import 'package:dio/dio.dart';

import '../models/academy_models.dart';
import '../models/live_schedule_model.dart';
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
    final item = api.data!['item'];
    return item != null ? CourseOfferingModel.fromJson(item as Map<String, dynamic>) : null;
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
    final items = body['items'] as List<dynamic>? ?? body['data'] as List<dynamic>? ?? [];
    final total = (body['total'] as num?)?.toInt() ?? items.length;
    final totalPages = (body['totalPages'] as num?)?.toInt() ?? 1;
    return PaginatedResponse<EnrollmentModel>(
      data: items.map((e) => EnrollmentModel.fromJson(e as Map<String, dynamic>)).toList(),
      total: total,
      page: (body['page'] as num?)?.toInt() ?? 1,
      limit: (body['limit'] as num?)?.toInt() ?? limit,
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
}
