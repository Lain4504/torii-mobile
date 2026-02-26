import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/api/api_client.dart';
import '../repositories/assignment_repository.dart';
import '../models/assignment_model.dart';
import 'assignment_state.dart';

final assignmentRepositoryProvider = Provider<AssignmentRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AssignmentRepository(dio: apiClient.client);
});

class AssignmentListNotifier extends Notifier<AssignmentListState> {
  int _currentPage = 1;
  static const int _limit = 10;
  String? _currentStatus;

  @override
  AssignmentListState build() {
    return const AssignmentListState();
  }

  Future<void> loadAssignments({bool refresh = false, String? status}) async {
    if (state.isLoading) return;
    if (!refresh && !state.hasMore) return;

    if (refresh) {
      _currentPage = 1;
      _currentStatus = status;
      state = state.copyWith(isLoading: true, assignments: [], error: null);
    } else {
      state = state.copyWith(isLoading: true, error: null);
    }

    try {
      final repository = ref.read(assignmentRepositoryProvider);
      final response = await repository.getMyAssignments(
        page: _currentPage,
        limit: _limit,
        status: _currentStatus,
      );

      final newAssignments = refresh 
          ? response.assignments 
          : [...state.assignments, ...response.assignments];

      state = state.copyWith(
        isLoading: false,
        assignments: newAssignments,
        total: response.total,
        hasMore: newAssignments.length < response.total,
      );
      
      _currentPage++;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void updateFilter(String? status) {
    if (_currentStatus != status) {
      loadAssignments(refresh: true, status: status);
    }
  }
}

final assignmentListProvider = NotifierProvider<AssignmentListNotifier, AssignmentListState>(
  AssignmentListNotifier.new,
);

final assignmentDetailProvider = FutureProvider.family<Assignment, String>((ref, id) async {
  final repository = ref.watch(assignmentRepositoryProvider);
  return await repository.getAssignmentDetails(id);
});
