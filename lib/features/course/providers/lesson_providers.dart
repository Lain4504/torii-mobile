import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/course_repository.dart';
import '../models/lesson_model.dart';
import 'course_providers.dart';

/// Lesson detail state
class LessonDetailState {
  final String lessonId;
  final Lesson? lesson;
  final bool isLoading;
  final String? error;

  const LessonDetailState({
    required this.lessonId,
    this.lesson,
    this.isLoading = false,
    this.error,
  });

  LessonDetailState copyWith({
    String? lessonId,
    Lesson? lesson,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return LessonDetailState(
      lessonId: lessonId ?? this.lessonId,
      lesson: lesson ?? this.lesson,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

/// Provider function for lesson detail state (family provider with lessonId)
final lessonDetailProvider = NotifierProvider.family<LessonDetailNotifier, LessonDetailState, String>(
  LessonDetailNotifier.new,
);

/// Notifier for managing lesson detail state
class LessonDetailNotifier extends FamilyNotifier<LessonDetailState, String> {
  @override
  LessonDetailState build(String arg) {
    // Load lesson detail when provider is created
    Future.microtask(() => loadLessonDetail(arg));
    return LessonDetailState(lessonId: arg);
  }

  CourseRepository get _courseRepository => ref.read(courseRepositoryProvider);

  /// Load lesson detail
  Future<void> loadLessonDetail(String lessonId) async {
    state = state.copyWith(lessonId: lessonId, isLoading: true, error: null, clearError: true);

    try {
      final lesson = await _courseRepository.getLessonById(lessonId);
      state = state.copyWith(
        lesson: lesson,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
