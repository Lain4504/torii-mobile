import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'course_state.dart';
import 'course_detail_state.dart';
import '../repositories/course_repository.dart';
import '../repositories/wishlist_repository.dart';
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

/// Provider for WishlistRepository
final wishlistRepositoryProvider = Provider<WishlistRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return WishlistRepository(apiClient);
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
  WishlistRepository get _wishlistRepository => ref.read(wishlistRepositoryProvider);

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
              title: course.title,
              slug: course.slug,
              thumbnailUrl: course.thumbnailUrl,
              previewVideoUrl: course.previewVideoUrl,
              instructorName: course.instructorName,
              instructorAvatarUrl: course.instructorAvatarUrl,
              level: course.level,
              type: course.type,
              price: course.price,
              discountPrice: course.discountPrice,
              rating: course.rating,
              reviewCount: course.reviewCount,
              enrolledCount: course.enrolledCount,
              totalLessons: course.totalLessons,
              totalQuizzes: course.totalQuizzes,
              durationWeeks: course.durationWeeks,
              isEnrolled: isEnrolled,
              isFree: course.isFree,
              featured: course.featured,
              description: course.description,
              shortDescription: course.shortDescription,
              tags: course.tags,
              learningOutcomes: course.learningOutcomes,
              requirements: course.requirements,
            )
          : course;
      
      state = state.copyWith(
        course: updatedCourse,
        isLoading: false,
      );

      // Load curriculum and check wishlist in parallel
      await Future.wait([
        loadCurriculum(courseId),
        checkWishlistStatus(courseId),
      ]);
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
      final curriculum = await _courseRepository.getCourseCurriculum(courseId);
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

  /// Check wishlist status
  Future<void> checkWishlistStatus(String courseId) async {
    final asyncAuth = ref.read(authStateProvider);
    final currentUser = asyncAuth.asData?.value.user;
    if (currentUser == null) {
      // User not authenticated, can't check wishlist
      return;
    }

    try {
      final isInWishlist = await _wishlistRepository.checkWishlist(courseId);

      state = state.copyWith(
        isWishlisted: isInWishlist,
        wishlistId: isInWishlist ? 'placeholder' : null, // Keep for backward compatibility
      );
    } catch (e) {
      // Silently fail - wishlist check is not critical
      // Don't update state on error
    }
  }

  /// Toggle wishlist (add or remove)
  /// Returns true if added, false if removed (for showing toast message)
  Future<bool?> toggleWishlist() async {
    final courseId = state.courseId;
    final asyncAuth = ref.read(authStateProvider);
    final currentUser = asyncAuth.asData?.value.user;
    
    if (currentUser == null) {
      state = state.copyWith(error: 'Please login to add to wishlist');
      return null;
    }

    state = state.copyWith(isTogglingWishlist: true, error: null, clearError: true);

    try {
      final isInWishlist = await _wishlistRepository.toggleWishlist(courseId);
      
      state = state.copyWith(
        isWishlisted: isInWishlist,
        wishlistId: isInWishlist ? 'placeholder' : null, // Keep for backward compatibility
        isTogglingWishlist: false,
      );
      
      // Return true if added, false if removed
      return isInWishlist;
    } catch (e) {
      state = state.copyWith(
        isTogglingWishlist: false,
        error: e.toString(),
      );
      return null;
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
