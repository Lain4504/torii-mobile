import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/gamification/models/gamification_models.dart';
import 'package:torii_app/features/gamification/repositories/gamification_repository.dart';

final gamificationRepositoryProvider =
    Provider<GamificationRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return GamificationRepository(apiClient.client);
});

class GamificationState {
  final GamificationProfile? profile;
  final List<Achievement> achievements;
  final bool isLoading;
  final String? error;

  const GamificationState({
    this.profile,
    this.achievements = const [],
    this.isLoading = false,
    this.error,
  });

  GamificationState copyWith({
    GamificationProfile? profile,
    List<Achievement>? achievements,
    bool? isLoading,
    String? error,
  }) {
    return GamificationState(
      profile: profile ?? this.profile,
      achievements: achievements ?? this.achievements,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class GamificationNotifier extends Notifier<GamificationState> {
  @override
  GamificationState build() => const GamificationState();

  Future<void> load() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, error: null);

    final repo = ref.read(gamificationRepositoryProvider);
    try {
      final profile = await repo.getProfile();
      final achievements = await repo.getAchievements();
      state = GamificationState(
        profile: profile,
        achievements: achievements,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

final gamificationProvider =
    NotifierProvider<GamificationNotifier, GamificationState>(
        GamificationNotifier.new);

