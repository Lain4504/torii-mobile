import 'package:dio/dio.dart';

class LearningStats {
  final int totalCourses;
  final int completedCourses;
  final int inProgressCourses;
  final int totalLearningHours;
  final double averageProgress;
  final int currentStreak;

  LearningStats({
    required this.totalCourses,
    required this.completedCourses,
    required this.inProgressCourses,
    required this.totalLearningHours,
    required this.averageProgress,
    required this.currentStreak,
  });

  factory LearningStats.fromJson(Map<String, dynamic> json) {
    return LearningStats(
      totalCourses: json['totalCourses'] ?? 0,
      completedCourses: json['completedCourses'] ?? 0,
      inProgressCourses: json['inProgressCourses'] ?? 0,
      totalLearningHours: (json['totalLearningHours'] as num?)?.toInt() ?? 0,
      averageProgress: (json['averageProgress'] as num?)?.toDouble() ?? 0.0,
      currentStreak: json['currentStreak'] ?? 0,
    );
  }
}

class LearningProgressRepository {
  final Dio _dio;

  LearningProgressRepository({required Dio dio}) : _dio = dio;

  Future<LearningStats> getStats() async {
    try {
      final response = await _dio.get('/api/learning-progress/stats');
      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic> && data['success'] == true) {
          return LearningStats.fromJson(data['data']['stats'] as Map<String, dynamic>);
        }
      }
      throw Exception('Failed to fetch learning stats');
    } catch (e) {
      throw Exception('Failed to fetch learning stats: $e');
    }
  }
}
