import 'package:dio/dio.dart';
import '../models/course_model.dart';
import '../models/curriculum_model.dart';
import '../models/lesson_model.dart';
import '../models/lesson_material_model.dart';
import '../models/assignment_model.dart';
import '../models/certificate_model.dart';

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
        '/api/courses',
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
      final response = await _dio.get('/api/courses/$id');
      if (response.data == null) return null;
      
      final data = response.data;
      // Handle response structure: { success: true, data: { course: {...} } }
      Map<String, dynamic> courseData;
      if (data is Map<String, dynamic> && data.containsKey('data')) {
        final dataMap = data['data'] as Map<String, dynamic>?;
        // Check if data contains 'course' key (backend returns { course: {...} })
        if (dataMap != null && dataMap.containsKey('course')) {
          courseData = dataMap['course'] as Map<String, dynamic>;
        } else {
          // Fallback: assume data is the course object itself
          courseData = dataMap as Map<String, dynamic>;
        }
      } else {
        courseData = data as Map<String, dynamic>;
      }
      
      return Course.fromJson(courseData);
    } catch (e) {
      throw Exception('Failed to fetch course: $e');
    }
  }

  /// Fetch course by slug
  Future<Course?> findBySlug(String slug) async {
    try {
      final response = await _dio.get('/api/courses/slug/$slug');
      if (response.data == null) return null;
      
      final data = response.data;
      // Handle response structure: { success: true, data: { course: {...} } }
      Map<String, dynamic> courseData;
      if (data is Map<String, dynamic> && data.containsKey('data')) {
        final dataMap = data['data'] as Map<String, dynamic>?;
        // Check if data contains 'course' key (backend returns { course: {...} })
        if (dataMap != null && dataMap.containsKey('course')) {
          courseData = dataMap['course'] as Map<String, dynamic>;
        } else {
          // Fallback: assume data is the course object itself
          courseData = dataMap as Map<String, dynamic>;
        }
      } else {
        courseData = data as Map<String, dynamic>;
      }
      
      return Course.fromJson(courseData);
    } catch (e) {
      throw Exception('Failed to fetch course: $e');
    }
  }

  /// Get course by ID (alias for findOne with better error handling)
  Future<Course> getCourseById(String courseId) async {
    try {
      final response = await _dio.get('/api/courses/$courseId');
      
      if (response.statusCode == 200) {
        final data = response.data;
        
        // Handle response structure: { success: true, data: { course: {...} } }
        Map<String, dynamic> courseData;
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          final dataMap = data['data'] as Map<String, dynamic>?;
          // Check if data contains 'course' key (backend returns { course: {...} })
          if (dataMap != null && dataMap.containsKey('course')) {
            courseData = dataMap['course'] as Map<String, dynamic>;
          } else {
            // Fallback: assume data is the course object itself
            courseData = dataMap as Map<String, dynamic>;
          }
        } else {
          courseData = data as Map<String, dynamic>;
        }
        
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
      final response = await _dio.get('/api/courses/$courseId/curriculum');
      
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

  /// Get courses enrolled by current user
  Future<List<Course>> getMyCourses() async {
    try {
      final response = await _dio.get('/api/learning-progress/my-courses');
      
      if (response.statusCode == 200) {
        final data = response.data;
        
        // Handle response structure: { success: true, data: { courses: [...] } }
        List<dynamic> coursesList;
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          final dataMap = data['data'] as Map<String, dynamic>?;
          if (dataMap != null && dataMap.containsKey('courses')) {
            coursesList = dataMap['courses'] as List<dynamic>;
          } else if (dataMap is List) {
            // Fallback: data['data'] is directly a list
            coursesList = dataMap as List<dynamic>;
          } else {
            coursesList = [];
          }
        } else if (data is List) {
          // Fallback: response is directly a list
          coursesList = data;
        } else {
          coursesList = [];
        }
            
        return coursesList.map((item) {
          final courseJson = item as Map<String, dynamic>;
          // Ensure isEnrolled is true for courses from my-courses endpoint
          courseJson['isEnrolled'] = true;
          return Course.fromJson(courseJson);
        }).toList();
      } else {
        throw Exception('Failed to load my courses');
      }
    } catch (e) {
      throw Exception('Failed to load my courses: $e');
    }
  }

  /// Get learning statistics for user
  Future<Map<String, dynamic>> getLearningStats() async {
    try {
      final response = await _dio.get('/api/learning-progress/stats');
      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      }
      return {};
    } catch (_) {
      return {};
    }
  }

  /// Get lesson details by ID
  Future<Lesson> getLessonById(String lessonId) async {
    try {
      final response = await _dio.get('/api/lessons/$lessonId');
      
      if (response.statusCode == 200) {
        final data = response.data;
        
        // Handle response structure: { success: true, data: { lesson: {...} } }
        Map<String, dynamic> lessonData;
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          final dataMap = data['data'] as Map<String, dynamic>?;
          if (dataMap != null && dataMap.containsKey('lesson')) {
            lessonData = dataMap['lesson'] as Map<String, dynamic>;
          } else {
            // Fallback: assume data is the lesson object itself
            lessonData = dataMap as Map<String, dynamic>;
          }
        } else {
          lessonData = data as Map<String, dynamic>;
        }
        
        return Lesson.fromJson(lessonData);
      } else {
        throw Exception('Failed to load lesson: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('Lesson not found');
      }
      throw Exception('Failed to load lesson: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load lesson: $e');
    }
  }

  /// Fetch lesson materials by lesson ID
  Future<List<LessonMaterial>> getLessonMaterials(String lessonId) async {
    try {
      final response = await _dio.get(
        '/api/lesson-materials/by-lesson/$lessonId',
      );

      final data = response.data;
      
      // Backend returns: { success: true, data: { materials: [...] } }
      if (data != null && data['success'] == true && data['data'] != null) {
        final dataValue = data['data'];
        
        // Try both 'materials' and direct array
        List? materialsData;
        
        // Case 1: data is a Map with 'materials' key
        if (dataValue is Map<String, dynamic>) {
          if (dataValue.containsKey('materials')) {
            materialsData = dataValue['materials'] as List?;
          }
        }
        // Case 2: data is directly a List
        else if (dataValue is List) {
          materialsData = dataValue;
        }
        
        if (materialsData != null && materialsData.isNotEmpty) {
          final materials = <LessonMaterial>[];
          
          for (var i = 0; i < materialsData.length; i++) {
            try {
              final item = materialsData[i];
              
              if (item == null || item is! Map<String, dynamic>) {
                continue;
              }
              
              final material = LessonMaterial.fromJson(item);
              materials.add(material);
            } catch (_) {
              // Continue with next item instead of failing completely
            }
          }
          
          return materials;
        }
      }
      
      return [];
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return [];
      }
      if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized: Please login to view materials');
      }
      if (e.response?.statusCode == 403) {
        throw Exception('Access denied: You do not have permission to view these materials');
      }
      throw Exception('Failed to fetch lesson materials: ${e.message}');
    } catch (e) {
      throw Exception('Failed to fetch lesson materials: $e');
    }
  }

  /// Get all assignments for the learner
  Future<List<Assignment>> getAssignments({int page = 1, int limit = 50}) async {
    try {
      final response = await _dio.get('/api/assignments', queryParameters: {'page': page, 'limit': limit});
      if (response.statusCode == 200 && (response.data['success'] == true || response.data['success'] == null)) {
        final dynamic data = response.data['data'];
        final List list = data is List ? data : (data['data'] ?? []);
        return list.map((item) => Assignment.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch assignments: $e');
    }
  }

  /// Get all certificates for the learner
  Future<List<Certificate>> getCertificates({int page = 1, int limit = 50}) async {
    try {
      final response = await _dio.get('/api/certificates', queryParameters: {'page': page, 'limit': limit});
      if (response.statusCode == 200 && (response.data['success'] == true || response.data['success'] == null)) {
        final dynamic data = response.data['data'];
        final List list = data is List ? data : (data['data'] ?? []);
        return list.map((item) => Certificate.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch certificates: $e');
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
