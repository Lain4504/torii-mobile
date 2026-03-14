import '../models/course_model.dart';
import '../models/curriculum_model.dart';

/// State for course detail page
class CourseDetailState {
  final String courseId;
  final Course? course;
  final Curriculum? curriculum;
  final bool isLoading;
  final bool isLoadingCurriculum;
  final String? error;

  const CourseDetailState({
    required this.courseId,
    this.course,
    this.curriculum,
    this.isLoading = false,
    this.isLoadingCurriculum = false,
    this.error,
  });

  CourseDetailState copyWith({
    String? courseId,
    Course? course,
    Curriculum? curriculum,
    bool? isLoading,
    bool? isLoadingCurriculum,
    String? error,
    bool clearError = false,
    bool clearCurriculum = false,
  }) {
    return CourseDetailState(
      courseId: courseId ?? this.courseId,
      course: course ?? this.course,
      curriculum: clearCurriculum ? null : (curriculum ?? this.curriculum),
      isLoading: isLoading ?? this.isLoading,
      isLoadingCurriculum: isLoadingCurriculum ?? this.isLoadingCurriculum,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

