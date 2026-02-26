import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import '../repositories/assessment_repository.dart';
import '../models/placement_test_model.dart';

final assessmentRepositoryProvider = Provider<AssessmentRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AssessmentRepository(apiClient);
});

enum PlacementStatus { intro, loading, testing, evaluating, result, error }

class PlacementState {
  final PlacementStatus status;
  final PlacementTest? test;
  final PlacementEvaluation? result;
  final Map<String, String> answers;
  final int currentIndex;
  final String? error;

  PlacementState({
    this.status = PlacementStatus.intro,
    this.test,
    this.result,
    this.answers = const {},
    this.currentIndex = 0,
    this.error,
  });

  PlacementState copyWith({
    PlacementStatus? status,
    PlacementTest? test,
    PlacementEvaluation? result,
    Map<String, String>? answers,
    int? currentIndex,
    String? error,
  }) {
    return PlacementState(
      status: status ?? this.status,
      test: test ?? this.test,
      result: result ?? this.result,
      answers: answers ?? this.answers,
      currentIndex: currentIndex ?? this.currentIndex,
      error: error ?? this.error,
    );
  }
}

class PlacementNotifier extends Notifier<PlacementState> {
  AssessmentRepository get _repository =>
      ref.read(assessmentRepositoryProvider);

  @override
  PlacementState build() {
    return PlacementState();
  }

  Future<void> startTest() async {
    state = state.copyWith(status: PlacementStatus.loading);
    try {
      final test = await _repository.generatePlacementTest(15);
      if (test != null) {
        state = state.copyWith(
          status: PlacementStatus.testing,
          test: test,
          answers: {},
          currentIndex: 0,
        );
      } else {
        state = state.copyWith(
          status: PlacementStatus.error,
          error: 'Failed to generate test',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: PlacementStatus.error,
        error: e.toString(),
      );
    }
  }

  void selectAnswer(String questionId, String answer) {
    final newAnswers = Map<String, String>.from(state.answers);
    newAnswers[questionId] = answer;
    state = state.copyWith(answers: newAnswers);
  }

  void nextQuestion() {
    if (state.test == null) return;
    if (state.currentIndex < state.test!.questions.length - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    } else {
      submitTest();
    }
  }

  void previousQuestion() {
    if (state.currentIndex > 0) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  Future<void> submitTest() async {
    if (state.test == null) return;
    state = state.copyWith(status: PlacementStatus.evaluating);
    try {
      final result = await _repository.evaluatePlacementTest(
        state.test!.testId,
        state.answers,
      );
      if (result != null) {
        state = state.copyWith(status: PlacementStatus.result, result: result);
      } else {
        state = state.copyWith(
          status: PlacementStatus.error,
          error: 'Failed to evaluate test',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: PlacementStatus.error,
        error: e.toString(),
      );
    }
  }

  void reset() {
    state = PlacementState();
  }
}

final placementProvider = NotifierProvider<PlacementNotifier, PlacementState>(
  () {
    return PlacementNotifier();
  },
);

// Using a simple StateProvider for tokenService because I don't want to overcomplicate the imports,
// but I should check where tokenServiceProvider is defined if possible.
// Actually, I'll just look for auth_providers.dart again.
