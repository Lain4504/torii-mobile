import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'course_state.dart';
import 'course_detail_state.dart';
import '../repositories/course_repository.dart';
import '../models/course_model.dart';
import '../models/assignment_model.dart';
import '../models/certificate_model.dart';
import '../../../features/auth/providers/auth_providers.dart';

/// Provider for course list state
final courseListProvider = NotifierProvider<CourseListNotifier, CourseListState>(
  CourseListNotifier.new,
);

/// Provider for CourseRepository
final courseRepositoryProvider = Provider<CourseRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return CourseRepository(dio: apiClient.client);
});


/// Provider function for course detail state (family provider with courseId)
final courseDetailProvider = NotifierProvider.family<CourseDetailNotifier, CourseDetailState, String>(
  CourseDetailNotifier.new,
);

/// Notifier for managing course detail state
class CourseDetailNotifier extends FamilyNotifier<CourseDetailState, String> {
  // String _courseId is NOT needed as field, use arg from build

  @override
  CourseDetailState build(String arg) {
    // Load course detail when provider is created
    Future.microtask(() => loadCourseDetail(arg));
    return CourseDetailState(courseId: arg);
  }

  CourseRepository get _courseRepository => ref.read(courseRepositoryProvider);

  /// Load course detail
  Future<void> loadCourseDetail(String courseId) async {
    state = state.copyWith(courseId: courseId, isLoading: true, error: null, clearError: true);

    try {
      final course = await _courseRepository.getCourseById(courseId);
      
      // Check if course is in my-courses (user is enrolled)
      final asyncAuth = ref.read(authStateProvider);
      final currentUser = asyncAuth.asData?.value.user;
      bool isEnrolled = course.isEnrolled;
      
      if (!isEnrolled && currentUser != null) {
        // Check if course is in my-courses
        try {
          final myCourses = await _courseRepository.getMyCourses();
          isEnrolled = myCourses.any((c) => c.id == courseId);
        } catch (_) {
          // Silently fail - enrollment check is not critical
        }
      }
      
      // Update course with enrollment status if needed
      final updatedCourse = isEnrolled != course.isEnrolled
          ? Course(
              id: course.id,
              classId: course.classId,
              title: course.title,
              code: course.code,
              thumbnailUrl: course.thumbnailUrl,
              instructorName: course.instructorName,
              instructorAvatarUrl: course.instructorAvatarUrl,
              level: course.level,
              mode: course.mode,
              price: course.price,
              salePrice: course.salePrice,
              isEnrolled: isEnrolled,
              isFree: course.isFree,
              description: course.description,
              expiresAt: course.expiresAt,
            )
          : course;
      
      state = state.copyWith(
        course: updatedCourse,
        isLoading: false,
      );

      await loadCurriculum(courseId);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Load curriculum
  Future<void> loadCurriculum(String courseId) async {
    state = state.copyWith(isLoadingCurriculum: true);

    try {
      final idForCurriculum = state.course?.classId ?? courseId;
      final curriculum =
          await _courseRepository.getCourseCurriculum(idForCurriculum);
      state = state.copyWith(
        curriculum: curriculum,
        isLoadingCurriculum: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingCurriculum: false,
        error: e.toString(),
      );
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}

/// Provider for user assignments
final assignmentsProvider = FutureProvider<List<Assignment>>((ref) async {
  return ref.watch(courseRepositoryProvider).getAssignments();
});

/// Provider for user certificates
final certificatesProvider = FutureProvider<List<Certificate>>((ref) async {
  return ref.watch(courseRepositoryProvider).getCertificates();
});
