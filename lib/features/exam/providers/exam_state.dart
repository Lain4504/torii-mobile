import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for exam list
class ExamListState {
  final List<dynamic> exams; // TODO: Replace with Exam model
  final bool isLoading;
  final String? error;

  const ExamListState({
    this.exams = const [],
    this.isLoading = false,
    this.error,
  });

  ExamListState copyWith({
    List<dynamic>? exams,
    bool? isLoading,
    String? error,
  }) {
    return ExamListState(
      exams: exams ?? this.exams,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

/// Notifier for managing exam list
class ExamListNotifier extends Notifier<ExamListState> {
  @override
  ExamListState build() => const ExamListState();

  // TODO: Inject ExamRepository
  
  Future<void> loadExams() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      // TODO: Call repository to fetch exams
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      
      state = state.copyWith(
        exams: [], // TODO: Set actual exams
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
