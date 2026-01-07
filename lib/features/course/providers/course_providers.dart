import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'course_state.dart';
import 'course_detail_state.dart';
import '../repositories/course_repository.dart';
import '../repositories/wishlist_repository.dart';
import '../../../features/auth/providers/auth_providers.dart';

/// Provider for course list state
final courseListProvider = NotifierProvider<CourseListNotifier, CourseListState>(
  CourseListNotifier.new,
);

/// Provider for CourseRepository
final courseRepositoryProvider = Provider<CourseRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return CourseRepository(apiClient);
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
class CourseDetailNotifier extends Notifier<CourseDetailState> {
  final String _courseId;

  CourseDetailNotifier(this._courseId);

  @override
  CourseDetailState build() {
    // Load course detail when provider is created
    Future.microtask(() => loadCourseDetail(_courseId));
    return CourseDetailState(courseId: _courseId);
  }

  CourseRepository get _courseRepository => ref.read(courseRepositoryProvider);
  WishlistRepository get _wishlistRepository => ref.read(wishlistRepositoryProvider);

  /// Load course detail
  Future<void> loadCourseDetail(String courseId) async {
    state = state.copyWith(courseId: courseId, isLoading: true, error: null, clearError: true);

    try {
      final course = await _courseRepository.getCourseById(courseId);
      state = state.copyWith(
        course: course,
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
    final currentUser = ref.read(authStateProvider.notifier).currentUser;
    if (currentUser == null) {
      // User not authenticated, can't check wishlist
      return;
    }

    try {
      final wishlistId = await _wishlistRepository.checkWishlist(
        currentUser.id,
        courseId,
      );

      state = state.copyWith(
        isWishlisted: wishlistId != null,
        wishlistId: wishlistId,
      );
    } catch (e) {
      // Silently fail - wishlist check is not critical
      // Don't update state on error
    }
  }

  /// Toggle wishlist (add or remove)
  Future<void> toggleWishlist() async {
    final courseId = state.courseId;
    final currentUser = ref.read(authStateProvider.notifier).currentUser;
    
    if (currentUser == null) {
      state = state.copyWith(error: 'Please login to add to wishlist');
      return;
    }

    state = state.copyWith(isTogglingWishlist: true, error: null, clearError: true);

    try {
      if (state.isWishlisted && state.wishlistId != null) {
        // Remove from wishlist
        await _wishlistRepository.removeFromWishlist(state.wishlistId!);
        state = state.copyWith(
          isWishlisted: false,
          wishlistId: null,
          isTogglingWishlist: false,
        );
      } else {
        // Add to wishlist
        final wishlistId = await _wishlistRepository.addToWishlist(courseId);
        state = state.copyWith(
          isWishlisted: true,
          wishlistId: wishlistId,
          isTogglingWishlist: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isTogglingWishlist: false,
        error: e.toString(),
      );
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
