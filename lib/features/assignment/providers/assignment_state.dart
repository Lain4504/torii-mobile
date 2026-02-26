import '../models/assignment_model.dart';

class AssignmentListState {
  final bool isLoading;
  final String? error;
  final List<Assignment> assignments;
  final int total;
  final bool hasMore;

  const AssignmentListState({
    this.isLoading = false,
    this.error,
    this.assignments = const [],
    this.total = 0,
    this.hasMore = false,
  });

  AssignmentListState copyWith({
    bool? isLoading,
    String? error,
    List<Assignment>? assignments,
    int? total,
    bool? hasMore,
  }) {
    return AssignmentListState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      assignments: assignments ?? this.assignments,
      total: total ?? this.total,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

class SubmissionListState {
  final bool isLoading;
  final String? error;
  final List<Submission> submissions;

  const SubmissionListState({
    this.isLoading = false,
    this.error,
    this.submissions = const [],
  });

  SubmissionListState copyWith({
    bool? isLoading,
    String? error,
    List<Submission>? submissions,
  }) {
    return SubmissionListState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      submissions: submissions ?? this.submissions,
    );
  }
}
