import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import '../models/study_set_model.dart';
import '../repositories/study_set_repository.dart';

final studySetRepositoryProvider = Provider<StudySetRepository>((ref) {
  final dio = ref.watch(apiClientProvider).client;
  return StudySetRepository(dio);
});

final studySetsProvider = StateNotifierProvider<StudySetsNotifier, AsyncValue<List<StudySet>>>((ref) {
  final repo = ref.read(studySetRepositoryProvider);
  return StudySetsNotifier(repo);
});

class StudySetsNotifier extends StateNotifier<AsyncValue<List<StudySet>>> {
  final StudySetRepository _repo;

  StudySetsNotifier(this._repo) : super(const AsyncValue.loading()) {
    loadData();
  }

  Future<void> loadData() async {
    state = const AsyncValue.loading();
    try {
      final list = await _repo.findAll();
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createSet(String title, String description) async {
    try {
      final created = await _repo.create(title: title, description: description.isNotEmpty ? description : null);
      final current = state.value ?? [];
      state = AsyncValue.data([created, ...current]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
