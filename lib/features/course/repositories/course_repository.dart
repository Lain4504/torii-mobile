import 'package:dio/dio.dart';
import '../models/course_model.dart';
import '../models/curriculum_model.dart';
import '../models/lesson_model.dart';
import '../models/assignment_model.dart';
import '../models/certificate_model.dart';
import '../models/lesson_material_model.dart';

/// Course repository – aligned with gateway API:
/// - GET /api/academy/course-offerings/public (list)
/// - GET /api/academy/course-offerings/public/:id (detail)
/// - GET /api/academy/classes/:id/curriculum (curriculum)
/// - GET /api/academy/enrollments/me (my enrollments)
/// - GET /api/academy/lessons/:id (lesson by id)
class CourseRepository {
  final Dio _dio;

  CourseRepository({required Dio dio}) : _dio = dio;

  /// Unwrap standard gateway response: { success, data: T }
  static T _data<T>(dynamic responseData, T Function(dynamic) fromData) {
    if (responseData is Map<String, dynamic> && responseData['data'] != null) {
      return fromData(responseData['data']);
    }
    return fromData(responseData);
  }

  /// Public course offerings (no auth). Query: status=PUBLISHED, optional q, mode (VOD|LIVE).
  /// Backend returns all matching items (no pagination).
  Future<CourseListResponse> getPublicOfferings({
    String? q,
    String? mode,
  }) async {
    final queryParams = <String, dynamic>{};
    if (q != null && q.trim().isNotEmpty) queryParams['q'] = q.trim();
    if (mode != null && (mode == 'VOD' || mode == 'LIVE')) queryParams['mode'] = mode;

    final response = await _dio.get(
      '/api/academy/course-offerings/public',
      queryParameters: queryParams,
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch offerings: ${response.statusCode}');
    }

    final items = _data<List<dynamic>>(
      response.data,
      (data) {
        if (data is Map<String, dynamic> && data['items'] != null) {
          return (data['items'] as List<dynamic>).cast<Map<String, dynamic>>();
        }
        if (data is List) return data.cast<Map<String, dynamic>>();
        return <Map<String, dynamic>>[];
      },
    );

    final courses = items
        .map((e) => Course.fromOfferingJson(e))
        .toList();

    return CourseListResponse(
      courses: courses,
      total: courses.length,
      page: 1,
      limit: courses.length,
      totalPages: 1,
    );
  }

  /// Single public offering by id (no auth).
  Future<Course> getPublicOfferingById(String id) async {
    final response = await _dio.get('/api/academy/course-offerings/public/$id');
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch offering: ${response.statusCode}');
    }
    final item = _data<Map<String, dynamic>>(
      response.data,
      (data) {
        if (data is Map<String, dynamic> && data['item'] != null) {
          return data['item'] as Map<String, dynamic>;
        }
        return data as Map<String, dynamic>;
      },
    );
    return Course.fromOfferingJson(item);
  }

  /// Curriculum for a class (requires auth for academy.delivery.read).
  Future<Curriculum> getClassCurriculum(String classId) async {
    final response = await _dio.get('/api/academy/classes/$classId/curriculum');
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch curriculum: ${response.statusCode}');
    }
    final curriculumMap = _data<Map<String, dynamic>>(
      response.data,
      (data) {
        if (data is Map<String, dynamic> && data['curriculum'] != null) {
          return data['curriculum'] as Map<String, dynamic>;
        }
        return data as Map<String, dynamic>;
      },
    );
    return Curriculum.fromJson(curriculumMap);
  }

  /// My enrollments (auth required). Returns list of enrollment objects with courseTitle, thumbnailUrl, etc.
  Future<List<Map<String, dynamic>>> getMyEnrollments() async {
    final response = await _dio.get('/api/academy/enrollments/me');
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch enrollments: ${response.statusCode}');
    }
    final data = response.data;
    List<dynamic> list = [];
    if (data is Map<String, dynamic> && data['data'] != null) {
      final d = data['data'];
      if (d is Map && d['items'] != null) list = d['items'] as List<dynamic>;
      else if (d is List) list = d;
    } else if (data is List) list = data;
    return list.map((e) => e as Map<String, dynamic>).toList();
  }

  /// My courses as Course list (from enrollments/me). Auth required.
  Future<List<Course>> getMyCourses() async {
    final enrollments = await getMyEnrollments();
    return enrollments.map((e) => Course.fromEnrollmentJson(e)).toList();
  }

  // --- Aliases for existing callers ---

  /// Alias for getPublicOfferingById.
  Future<Course> getCourseById(String courseId) async {
    return getPublicOfferingById(courseId);
  }

  /// Alias for getClassCurriculum (courseId here is classId for curriculum).
  Future<Curriculum> getCourseCurriculum(String courseId) async {
    return getClassCurriculum(courseId);
  }

  /// List with optional filters. Backend has no pagination; returns single page.
  Future<CourseListResponse> findAll({
    int page = 1,
    int limit = 20,
    JLPTLevel? level,
    String? search,
  }) async {
    final res = await getPublicOfferings(
      q: search,
      mode: null,
    );
    if (level != null) {
      final filtered = res.courses.where((c) => c.level == level).toList();
      return CourseListResponse(
        courses: filtered,
        total: filtered.length,
        page: 1,
        limit: filtered.length,
        totalPages: 1,
      );
    }
    return res;
  }

  /// Single offering by id (alias).
  Future<Course?> findOne(String id) async {
    try {
      return await getPublicOfferingById(id);
    } catch (_) {
      return null;
    }
  }

  /// Lesson by id – GET /api/academy/lessons/:id (auth required).
  Future<Lesson> getLessonById(String lessonId) async {
    final response = await _dio.get('/api/academy/lessons/$lessonId');
    if (response.statusCode != 200) {
      throw Exception('Failed to load lesson: ${response.statusCode}');
    }
    final item = _data<Map<String, dynamic>>(
      response.data,
      (data) {
        if (data is Map<String, dynamic> && data['item'] != null) {
          return data['item'] as Map<String, dynamic>;
        }
        return data as Map<String, dynamic>;
      },
    );
    return Lesson.fromJson(item);
  }

  /// Assignments – stub; use academy assignment-submissions if needed.
  Future<List<Assignment>> getAssignments({int page = 1, int limit = 50}) async {
    try {
      final response = await _dio.get(
        '/api/academy/assignment-submissions',
        queryParameters: {'page': page, 'limit': limit},
      );
      if (response.statusCode == 200) {
        final data = response.data;
        List<dynamic> list = [];
        if (data is Map && data['data'] != null) {
          final d = data['data'];
          if (d is Map && d['items'] != null) list = d['items'] as List;
          else if (d is List) list = d;
        }
        return list.map((e) => Assignment.fromJson(e as Map<String, dynamic>)).toList();
      }
    } catch (_) {}
    return [];
  }

  /// Certificates – stub; implement when backend endpoint is available.
  Future<List<Certificate>> getCertificates({int page = 1, int limit = 50}) async {
    return [];
  }

  /// Lesson materials – stub; implement when backend endpoint is available.
  Future<List<LessonMaterial>> getLessonMaterials(String lessonId) async {
    try {
      final response = await _dio.get('/api/academy/lessons/$lessonId/materials');
      if (response.statusCode == 200) {
        final data = response.data;
        List<dynamic> list = [];
        if (data is Map && data['data'] != null) {
          final d = data['data'];
          if (d is Map && d['materials'] != null) list = d['materials'] as List;
          else if (d is List) list = d;
        }
        return list.map((e) => LessonMaterial.fromJson(e as Map<String, dynamic>)).toList();
      }
    } catch (_) {}
    return [];
  }

  /// Learning stats – from enrollments count.
  Future<Map<String, dynamic>> getLearningStats() async {
    try {
      final list = await getMyEnrollments();
      return {'enrolledCount': list.length};
    } catch (_) {
      return {};
    }
  }
}

class CourseListResponse {
  final List<Course> courses;
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  CourseListResponse({
    required this.courses,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });
}
