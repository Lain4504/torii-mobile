import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/gamification_repository.dart';
import '../models/gamification_models.dart';
import '../../auth/providers/auth_providers.dart';

final gamificationRepositoryProvider = Provider((ref) {
  final dio = ref.watch(apiClientProvider).client;
  return GamificationRepository(dio: dio);
});

final gamificationProfileProvider = FutureProvider<GamificationProfile>((ref) async {
  return ref.watch(gamificationRepositoryProvider).getProfile();
});

final leaderboardProvider = FutureProvider.family<LeaderboardResponse, String>((ref, type) async {
  return ref.watch(gamificationRepositoryProvider).getLeaderboard(type: type);
});

final achievementsProvider = FutureProvider<List<UserAchievement>>((ref) async {
  return ref.watch(gamificationRepositoryProvider).getAchievements();
});
