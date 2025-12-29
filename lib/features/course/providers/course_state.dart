import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for course list
class CourseListState {
  final List<dynamic> courses; // TODO: Replace with Course model
  final bool isLoading;
  final String? error;

  const CourseListState({
    this.courses = const [],
    this.isLoading = false,
    this.error,
  });

  CourseListState copyWith({
    List<dynamic>? courses,
    bool? isLoading,
    String? error,
  }) {
    return CourseListState(
      courses: courses ?? this.courses,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

/// StateNotifier for managing course list
class CourseListNotifier extends Notifier<CourseListState> {
  @override
  CourseListState build() => const CourseListState();

  // TODO: Inject CourseRepository
  
  Future<void> loadCourses() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      // TODO: Call repository to fetch courses
      // final courses = await _repository.getCourses();
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      
      state = state.copyWith(
        courses: [], // TODO: Set actual courses
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
