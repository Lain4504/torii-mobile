import 'package:dio/dio.dart';
import '../models/gamification_models.dart';

class GamificationRepository {
  final Dio _dio;

  GamificationRepository({required Dio dio}) : _dio = dio;

  Future<GamificationProfile> getProfile() async {
    try {
      final response = await _dio.get('/api/gamification/profile');
      if (response.statusCode == 200 && response.data['success'] == true) {
        return GamificationProfile.fromJson(response.data['data']);
      }
      throw Exception('Failed to load gamification profile');
    } catch (e) {
      throw Exception('Failed to load gamification profile: $e');
    }
  }

  Future<LeaderboardResponse> getLeaderboard({String type = 'global'}) async {
    try {
      final response = await _dio.get('/api/gamification/leaderboard', queryParameters: {'type': type});
      if (response.statusCode == 200 && response.data['success'] == true) {
        return LeaderboardResponse.fromJson(response.data['data']);
      }
      throw Exception('Failed to load leaderboard');
    } catch (e) {
      throw Exception('Failed to load leaderboard: $e');
    }
  }

  Future<List<UserAchievement>> getAchievements() async {
    try {
      final response = await _dio.get('/api/gamification/achievements');
      if (response.statusCode == 200 && response.data['success'] == true) {
        final dynamic data = response.data['data'];
        final List list = data is List ? data : (data['achievements'] ?? []);
        return list.map((item) => UserAchievement.fromJson(item)).toList();
      }
      throw Exception('Failed to load achievements');
    } catch (e) {
      throw Exception('Failed to load achievements: $e');
    }
  }
}
