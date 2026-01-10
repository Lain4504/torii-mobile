import '../models/course_model.dart';
import '../models/curriculum_model.dart';

/// State for course detail page
class CourseDetailState {
  final String courseId;
  final Course? course;
  final Curriculum? curriculum;
  final bool isWishlisted;
  final String? wishlistId;
  final bool isLoading;
  final bool isLoadingCurriculum;
  final bool isTogglingWishlist;
  final String? error;

  const CourseDetailState({
    required this.courseId,
    this.course,
    this.curriculum,
    this.isWishlisted = false,
    this.wishlistId,
    this.isLoading = false,
    this.isLoadingCurriculum = false,
    this.isTogglingWishlist = false,
    this.error,
  });

  CourseDetailState copyWith({
    String? courseId,
    Course? course,
    Curriculum? curriculum,
    bool? isWishlisted,
    String? wishlistId,
    bool? isLoading,
    bool? isLoadingCurriculum,
    bool? isTogglingWishlist,
    String? error,
    bool clearError = false,
    bool clearCurriculum = false,
  }) {
    return CourseDetailState(
      courseId: courseId ?? this.courseId,
      course: course ?? this.course,
      curriculum: clearCurriculum ? null : (curriculum ?? this.curriculum),
      isWishlisted: isWishlisted ?? this.isWishlisted,
      wishlistId: wishlistId ?? this.wishlistId,
      isLoading: isLoading ?? this.isLoading,
      isLoadingCurriculum: isLoadingCurriculum ?? this.isLoadingCurriculum,
      isTogglingWishlist: isTogglingWishlist ?? this.isTogglingWishlist,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

