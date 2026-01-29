import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../services/review/review_service.dart';
import '../models/review_model.dart';
import '../../auth/providers/auth_providers.dart';

/// Review Service Provider
final reviewServiceProvider = Provider<ReviewService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ReviewService(apiClient);
});

/// Review State for a specific entity (course or blog)
class ReviewState {
  final List<Review> reviews;
  final RatingDistribution? distribution;
  final bool isLoading;
  final bool isLoadingMore;
  final bool isSubmitting;
  final String? error;
  final int currentPage;
  final bool hasMore;

  ReviewState({
    this.reviews = const [],
    this.distribution,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.isSubmitting = false,
    this.error,
    this.currentPage = 1,
    this.hasMore = true,
  });

  ReviewState copyWith({
    List<Review>? reviews,
    RatingDistribution? distribution,
    bool? isLoading,
    bool? isLoadingMore,
    bool? isSubmitting,
    String? error,
    int? currentPage,
    bool? hasMore,
  }) {
    return ReviewState(
      reviews: reviews ?? this.reviews,
      distribution: distribution ?? this.distribution,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

/// Review Notifier for managing review state
class ReviewNotifier extends StateNotifier<ReviewState> {
  final ReviewService _reviewService;
  final String entityId;
  final ReviewType type;

  ReviewNotifier(this._reviewService, this.entityId, this.type)
    : super(ReviewState());

  /// Load reviews and distribution
  Future<void> loadReviews({bool refresh = false}) async {
    if (refresh) {
      state = ReviewState(isLoading: true);
    } else if (state.isLoading || state.isLoadingMore) {
      return;
    }

    try {
      // Load reviews
      final reviewsResponse = type == ReviewType.course
          ? await _reviewService.getReviewsByCourse(
              courseId: entityId,
              page: 1,
              limit: 10,
            )
          : await _reviewService.getReviewsByBlog(
              blogId: entityId,
              page: 1,
              limit: 10,
            );

      if (!reviewsResponse.success) {
        state = state.copyWith(
          isLoading: false,
          error: reviewsResponse.message ?? 'Failed to load reviews',
        );
        return;
      }

      final paginatedReviews = reviewsResponse.data!;

      // Load distribution (only for courses)
      RatingDistribution? distribution;
      if (type == ReviewType.course) {
        final distResponse = await _reviewService.getRatingDistribution(
          courseId: entityId,
        );
        if (distResponse.success) {
          distribution = distResponse.data;
        }
      }

      state = state.copyWith(
        reviews: paginatedReviews.reviews,
        distribution: distribution,
        isLoading: false,
        currentPage: 1,
        hasMore: paginatedReviews.hasMore,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Load more reviews (pagination)
  Future<void> loadMoreReviews() async {
    if (!state.hasMore || state.isLoadingMore || state.isLoading) {
      return;
    }

    state = state.copyWith(isLoadingMore: true);

    try {
      final nextPage = state.currentPage + 1;
      final response = type == ReviewType.course
          ? await _reviewService.getReviewsByCourse(
              courseId: entityId,
              page: nextPage,
              limit: 10,
            )
          : await _reviewService.getReviewsByBlog(
              blogId: entityId,
              page: nextPage,
              limit: 10,
            );

      if (!response.success) {
        state = state.copyWith(
          isLoadingMore: false,
          error: response.message ?? 'Failed to load more reviews',
        );
        return;
      }

      final paginatedReviews = response.data!;

      state = state.copyWith(
        reviews: [...state.reviews, ...paginatedReviews.reviews],
        isLoadingMore: false,
        currentPage: nextPage,
        hasMore: paginatedReviews.hasMore,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false, error: e.toString());
    }
  }

  /// Submit a new review
  Future<bool> submitReview({required int rating, String? comment}) async {
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      final response = type == ReviewType.course
          ? await _reviewService.createCourseReview(
              courseId: entityId,
              rating: rating,
              comment: comment,
            )
          : await _reviewService.createBlogReview(
              blogId: entityId,
              rating: rating,
              comment: comment,
            );

      if (!response.success) {
        state = state.copyWith(
          isSubmitting: false,
          error: response.message ?? 'Failed to submit review',
        );
        return false;
      }

      // Refresh reviews after successful submission
      await loadReviews(refresh: true);

      state = state.copyWith(isSubmitting: false, error: null);
      return true;
    } catch (e) {
      state = state.copyWith(isSubmitting: false, error: e.toString());
      return false;
    }
  }

  /// Delete a review
  Future<bool> deleteReview(String reviewId) async {
    try {
      final response = await _reviewService.deleteReview(reviewId);

      if (!response.success) {
        state = state.copyWith(
          error: response.message ?? 'Failed to delete review',
        );
        return false;
      }

      // Refresh reviews after deletion
      await loadReviews(refresh: true);
      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    }
  }
}

/// Review Type Enum
enum ReviewType { course, blog }

/// Review Provider Factory
final reviewProvider =
    StateNotifierProvider.family<ReviewNotifier, ReviewState, ReviewParams>((
      ref,
      params,
    ) {
      final service = ref.watch(reviewServiceProvider);
      return ReviewNotifier(service, params.entityId, params.type);
    });

/// Review Params for provider family
class ReviewParams {
  final String entityId;
  final ReviewType type;

  ReviewParams({required this.entityId, required this.type});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewParams &&
          runtimeType == other.runtimeType &&
          entityId == other.entityId &&
          type == other.type;

  @override
  int get hashCode => entityId.hashCode ^ type.hashCode;
}
