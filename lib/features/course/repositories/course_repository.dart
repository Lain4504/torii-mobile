import 'package:dio/dio.dart';
import '../../../data/api/api_client.dart';
import '../models/course_model.dart';
import '../models/curriculum_model.dart';

/// Repository for course-related API calls
class CourseRepository {
  final ApiClient _apiClient;

  CourseRepository(this._apiClient);

  /// Get course by ID
  Future<Course> getCourseById(String courseId) async {
    try {
      final response = await _apiClient.client.get('/api/courses/$courseId');
      
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
      final response = await _apiClient.client.get('/api/courses/$courseId/curriculum');
      
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

