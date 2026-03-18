import 'package:dio/dio.dart';

import '../models/gamification_models.dart';
import '../../core/models/api_response.dart';

/// Gamification API - profile, streak, history, rewards, redeem, achievements, activity-heatmap
class GamificationRepository {
  const GamificationRepository(this._dio);

  final Dio _dio;

  /// GET /api/gamification/profile
  Future<GamificationProfileModel?> getProfile() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/gamification/profile');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    return GamificationProfileModel.fromJson(api.data as Map<String, dynamic>);
  }

  /// GET /api/gamification/streak
  Future<StreakModel?> getStreak() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/gamification/streak');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    return StreakModel.fromJson(api.data as Map<String, dynamic>);
  }

  /// GET /api/gamification/history
  Future<Map<String, dynamic>> getHistory({int page = 1, int limit = 10, String? type}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/gamification/history',
      queryParameters: <String, dynamic>{
        'page': page,
        'limit': limit,
        if (type != null && type.isNotEmpty) 'type': type,
      },
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    return api.data ?? {};
  }

  /// GET /api/gamification/rewards
  Future<List<Map<String, dynamic>>> getAvailableRewards() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/gamification/rewards');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return [];
    final raw = api.data!;
    final list = raw['rewards'] as List<dynamic>? ?? raw['items'] as List<dynamic>? ?? [];
    return list
        .map((e) => e is Map<String, dynamic> ? e : <String, dynamic>{})
        .toList();
  }

  /// POST /api/gamification/redeem - body: { rewardId: string }
  Future<Map<String, dynamic>> redeem(String rewardId) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/gamification/redeem',
      data: <String, dynamic>{'rewardId': rewardId},
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success) throw Exception(api.message ?? 'Redeem failed');
    return api.data ?? {};
  }

  /// GET /api/gamification/achievements - returns { achievements: [...] }
  Future<List<AchievementModel>> getAchievements() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/gamification/achievements');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return [];
    final list = api.data!['achievements'] as List<dynamic>? ?? [];
    return list.map((e) => AchievementModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// GET /api/gamification/activity-heatmap
  Future<Map<String, dynamic>> getActivityHeatmap({String? startDate, String? endDate}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/gamification/activity-heatmap',
      queryParameters: <String, dynamic>{
        if (startDate != null) 'startDate': startDate,
        if (endDate != null) 'endDate': endDate,
      },
    );
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    return api.data ?? {};
  }

  /// GET /api/academy/coupons/my-coupons
  Future<List<Map<String, dynamic>>> getMyCoupons() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/academy/coupons/my-coupons');
    final api = ApiResponse<List<dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return [];
    final list = api.data!;
    return list
        .map((e) => e is Map<String, dynamic> ? e : <String, dynamic>{})
        .toList();
  }

  /// Leaderboard: if backend exposes a dedicated leaderboard endpoint use it.
  /// Otherwise we can use profile + history or a custom endpoint. Schema had LeaderboardDTO with users, currentUser, type.
  /// Gateway does not show a dedicated GET /api/gamification/leaderboard - web-learner may use a different path.
  /// For now we return empty list; you can add GET /api/gamification/leaderboard when backend supports it.
  Future<LeaderboardData?> getLeaderboard({String type = 'global'}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/gamification/leaderboard',
        queryParameters: <String, dynamic>{'type': type},
      );
      final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
      if (!api.success || api.data == null) return null;
      final d = api.data!;
      final users = (d['users'] as List<dynamic>?)?.map((e) => LeaderboardUserModel.fromJson(e as Map<String, dynamic>)).toList() ?? [];
      final currentUser = d['currentUser'] != null
          ? LeaderboardUserModel.fromJson(d['currentUser'] as Map<String, dynamic>)
          : null;
      return LeaderboardData(
        users: users,
        currentUser: currentUser,
        totalUsers: (d['totalUsers'] as num?)?.toInt() ?? users.length,
        type: d['type'] as String? ?? type,
      );
    } catch (_) {
      return null;
    }
  }
}

class LeaderboardData {
  final List<LeaderboardUserModel> users;
  final LeaderboardUserModel? currentUser;
  final int totalUsers;
  final String type;

  const LeaderboardData({
    required this.users,
    this.currentUser,
    required this.totalUsers,
    required this.type,
  });
}
