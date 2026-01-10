import 'package:dio/dio.dart';
import '../models/course_model.dart';
import '../models/curriculum_model.dart';

/// Course Repository - Handles API calls for courses
class CourseRepository {
  final Dio _dio;

  CourseRepository({
    required Dio dio,
  })  : _dio = dio;

  /// Fetch all courses with pagination and filters
  Future<CourseListResponse> findAll({
    int page = 1,
    int limit = 20,
    JLPTLevel? level,
    CourseType? type,
    String? search,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
      };

      if (level != null) {
        queryParams['jlptLevel'] = level.name.toUpperCase();
      }

      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }

      final response = await _dio.get(
        '/courses',
        queryParameters: queryParams,
      );

      return CourseListResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch courses: $e');
    }
  }

  /// Fetch single course by ID
  Future<Course?> findOne(String id) async {
    try {
      final response = await _dio.get('/courses/$id');
      if (response.data == null) return null;
      
      final data = response.data;
      // Handle both direct data and wrapped response
      final courseData = data is Map<String, dynamic> && data.containsKey('data')
          ? data['data'] as Map<String, dynamic>
          : data as Map<String, dynamic>;
      
      return Course.fromJson(courseData);
    } catch (e) {
      throw Exception('Failed to fetch course: $e');
    }
  }

  /// Fetch course by slug
  Future<Course?> findBySlug(String slug) async {
    try {
      final response = await _dio.get('/courses/slug/$slug');
      if (response.data == null) return null;
      
      final data = response.data;
      // Handle both direct data and wrapped response
      final courseData = data is Map<String, dynamic> && data.containsKey('data')
          ? data['data'] as Map<String, dynamic>
          : data as Map<String, dynamic>;
      
      return Course.fromJson(courseData);
    } catch (e) {
      throw Exception('Failed to fetch course: $e');
    }
  }

  /// Get course by ID (alias for findOne with better error handling)
  Future<Course> getCourseById(String courseId) async {
    try {
      final response = await _dio.get('/courses/$courseId');
      
      if (response.statusCode == 200) {
        final data = response.data;
        
        // Handle both direct data and wrapped response
        final courseData = data is Map<String, dynamic> && data.containsKey('data')
            ? data['data'] as Map<String, dynamic>
            : data as Map<String, dynamic>;
        
        return Course.fromJson(courseData);
      } else {
        throw Exception('Failed to load course: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('Course not found');
      }
      throw Exception('Failed to load course: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load course: $e');
    }
  }

  /// Get course curriculum (modules and lessons)
  Future<Curriculum> getCourseCurriculum(String courseId) async {
    try {
      final response = await _dio.get('/courses/$courseId/curriculum');
      
      if (response.statusCode == 200) {
        final data = response.data;
        
        // Handle both direct data and wrapped response
        final curriculumData = data is Map<String, dynamic> && data.containsKey('data')
            ? data['data'] as Map<String, dynamic>
            : data as Map<String, dynamic>;
        
        return Curriculum.fromJson(curriculumData);
      } else {
        throw Exception('Failed to load curriculum: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('Curriculum not found');
      }
      throw Exception('Failed to load curriculum: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load curriculum: $e');
    }
  }
}

/// Response model for paginated course list
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

  factory CourseListResponse.fromJson(Map<String, dynamic> json) {
    return CourseListResponse(
      courses: (json['data'] as List)
          .map((item) => Course.fromJson(item))
          .toList(),
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['totalPages'] ?? 0,
    );
  }
}
