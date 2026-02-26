import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_providers.dart';
import '../repositories/learning_progress_repository.dart';

final learningProgressRepositoryProvider = Provider<LearningProgressRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return LearningProgressRepository(dio: apiClient.client);
});

final learningStatsProvider = FutureProvider<LearningStats>((ref) async {
  final repository = ref.watch(learningProgressRepositoryProvider);
  return repository.getStats();
});
