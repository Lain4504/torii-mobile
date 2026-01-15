import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/course_model.dart';

// Import provider - Riverpod handles this even with potential circular dependency
import 'course_providers.dart' show courseRepositoryProvider;

/// State for course list
class CourseListState {
  final List<Course> courses;
  final bool isLoading;
  final String? error;
  final int currentPage;
  final int totalPages;
  final bool hasMore;

  const CourseListState({
    this.courses = const [],
    this.isLoading = false,
    this.error,
    this.currentPage = 1,
    this.totalPages = 1,
    this.hasMore = true,
  });

  CourseListState copyWith({
    List<Course>? courses,
    bool? isLoading,
    String? error,
    int? currentPage,
    int? totalPages,
    bool? hasMore,
  }) {
    return CourseListState(
      courses: courses ?? this.courses,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

/// StateNotifier for managing course list
/// Note: Uses courseRepositoryProvider from course_providers.dart
class CourseListNotifier extends Notifier<CourseListState> {
  @override
  CourseListState build() => const CourseListState();
  
  Future<void> loadCourses({
    JLPTLevel? level,
    String? search,
    bool refresh = true,
  }) async {
    // Guard: Prevent multiple simultaneous loads
    if (state.isLoading) return;
    
    final repository = ref.read(courseRepositoryProvider);
    
    // If refreshing, reset to page 1
    final page = refresh ? 1 : state.currentPage;
    
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final response = await repository.findAll(
        page: page,
        limit: 20,
        level: level,
        search: search,
      );
      
      final newCourses = refresh 
          ? response.courses 
          : [...state.courses, ...response.courses];
      
      state = state.copyWith(
        courses: newCourses,
        isLoading: false,
        currentPage: response.page,
        totalPages: response.totalPages,
        hasMore: response.page < response.totalPages,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> loadMore({
    JLPTLevel? level,
    String? search,
  }) async {
    if (!state.hasMore || state.isLoading) return;
    
    final repository = ref.read(courseRepositoryProvider);
    final nextPage = state.currentPage + 1;
    
    try {
      final response = await repository.findAll(
        page: nextPage,
        limit: 20,
        level: level,
        search: search,
      );
      
      state = state.copyWith(
        courses: [...state.courses, ...response.courses],
        currentPage: response.page,
        totalPages: response.totalPages,
        hasMore: response.page < response.totalPages,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
