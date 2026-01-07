import 'package:dio/dio.dart';
import '../models/course_model.dart';

/// Course Repository - Handles API calls for courses
class CourseRepository {
  final Dio _dio;
  final String _baseUrl;

  CourseRepository({
    required Dio dio,
    String? baseUrl,
  })  : _dio = dio,
        _baseUrl = baseUrl ?? 'http://localhost:8080/api';

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
        '$_baseUrl/courses',
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
      final response = await _dio.get('$_baseUrl/courses/$id');
      if (response.data == null) return null;
      return Course.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch course: $e');
    }
  }

  /// Fetch course by slug
  Future<Course?> findBySlug(String slug) async {
    try {
      final response = await _dio.get('$_baseUrl/courses/slug/$slug');
      if (response.data == null) return null;
      return Course.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch course: $e');
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
