import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/gamification_repository.dart';
import '../models/gamification_models.dart';
import '../../auth/providers/auth_providers.dart';

final gamificationRepositoryProvider = Provider((ref) {
  final dio = ref.watch(apiClientProvider).client;
  return GamificationRepository(dio: dio);
});

final gamificationProfileProvider = FutureProvider<GamificationProfile>((
  ref,
) async {
  return ref.watch(gamificationRepositoryProvider).getProfile();
});

final leaderboardProvider = FutureProvider.family<LeaderboardResponse, String>((
  ref,
  type,
) async {
  return ref.watch(gamificationRepositoryProvider).getLeaderboard(type: type);
});

final achievementsProvider = FutureProvider<List<UserAchievement>>((ref) async {
  return ref.watch(gamificationRepositoryProvider).getAchievements();
});

// Rewards list provider - temporary stub until backend endpoint is ready
final gamificationRewardsProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  // TODO: Replace with actual rewards endpoint
  return [
    {
      'id': '1',
      'name': 'Voucher 10%',
      'description': 'Giảm giá 10% cho khóa học',
      'points': 100,
      'image': '',
    },
    {
      'id': '2',
      'name': 'Voucher 20%',
      'description': 'Giảm giá 20% cho khóa học',
      'points': 200,
      'image': '',
    },
  ];
});

// Placeholder providers for history and coupons (to be implemented)
final gamificationHistoryProvider = FutureProvider<List<dynamic>>((ref) async {
  // TODO: Implement gamification history endpoint
  return [];
});

final myCouponsProvider = FutureProvider<List<dynamic>>((ref) async {
  // TODO: Implement coupons endpoint
  return [];
});
