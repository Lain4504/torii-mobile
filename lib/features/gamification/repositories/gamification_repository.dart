import 'package:dio/dio.dart';

import '../models/gamification_models.dart';

class GamificationRepository {
  final Dio _dio;

  GamificationRepository(this._dio);

  Future<GamificationProfile> getProfile() async {
    final res = await _dio.get('/api/gamification/profile');
    if (res.statusCode != 200) {
      throw Exception('Failed to fetch gamification profile');
    }

    final data = res.data;
    // successResponse(result) or successResponse({ profile })
    dynamic inner = data is Map<String, dynamic> && data['data'] != null
        ? data['data']
        : data;

    if (inner is Map<String, dynamic> && inner['profile'] is Map) {
      inner = inner['profile'];
    }

    if (inner is! Map<String, dynamic>) {
      throw Exception('Invalid profile response format');
    }

    return GamificationProfile.fromJson(inner);
  }

  Future<List<Achievement>> getAchievements() async {
    final res = await _dio.get('/api/gamification/achievements');
    if (res.statusCode != 200) {
      throw Exception('Failed to fetch achievements');
    }

    final data = res.data;
    // successResponse({ achievements: result })
    dynamic inner = data is Map<String, dynamic> && data['data'] != null
        ? data['data']
        : data;

    List list;
    if (inner is Map<String, dynamic> && inner['achievements'] is List) {
      list = inner['achievements'] as List;
    } else if (inner is List) {
      list = inner;
    } else {
      list = const [];
    }

    return list
        .whereType<Map<String, dynamic>>()
        .map(Achievement.fromJson)
        .toList();
  }
}

