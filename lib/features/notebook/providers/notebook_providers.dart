import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_providers.dart';
import '../repositories/notebook_repository.dart';
import '../models/notebook_model.dart';
import 'notebook_state.dart';

final notebookRepositoryProvider = Provider<NotebookRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return NotebookRepository(dio: apiClient.client);
});

class NotebookListNotifier extends Notifier<NotebookListState> {
  @override
  NotebookListState build() {
    return const NotebookListState();
  }

  Future<void> loadNotebooks() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, error: null);

    try {
      final repository = ref.read(notebookRepositoryProvider);

      final results = await Future.wait([
        repository.getMyNotebooks(),
        repository.getPublicNotebooks(),
      ]);

      state = state.copyWith(
        isLoading: false,
        myNotebooks: results[0],
        publicNotebooks: results[1],
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> createNotebook(
    String name,
    String? description,
    bool isPublic,
  ) async {
    try {
      final repository = ref.read(notebookRepositoryProvider);
      final newNotebook = await repository.createNotebook(
        name: name,
        description: description,
        isPublic: isPublic,
      );

      state = state.copyWith(myNotebooks: [newNotebook, ...state.myNotebooks]);
      return true;
    } catch (e) {
      return false;
    }
  }
}

final notebookListProvider =
    NotifierProvider<NotebookListNotifier, NotebookListState>(
      NotebookListNotifier.new,
    );

final notebookDetailProvider = FutureProvider.family<Notebook, String>((
  ref,
  id,
) async {
  final repository = ref.watch(notebookRepositoryProvider);
  return await repository.getNotebookById(id);
});
