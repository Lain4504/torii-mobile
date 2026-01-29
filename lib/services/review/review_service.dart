import 'package:dio/dio.dart';
import '../../data/api/api_client.dart';
import '../../core/models/api_response.dart';
import '../../features/review/models/review_model.dart';

/// Review Service - API Integration
/// Follows the same pattern as FlashcardService for consistency
class ReviewService {
  final ApiClient _apiClient;

  ReviewService(this._apiClient);

  /// Get reviews for a course
  /// GET /api/courses/:courseId/reviews
  Future<ApiResponse<PaginatedReviews>> getReviewsByCourse({
    required String courseId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _apiClient.client.get(
        '/api/courses/$courseId/reviews',
        queryParameters: {'page': page, 'limit': limit},
      );

      return ApiResponse.fromJson(
        response.data,
        (json) => PaginatedReviews.fromJson(json),
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Get reviews for a blog post
  /// GET /api/blogs/:blogId/reviews
  Future<ApiResponse<PaginatedReviews>> getReviewsByBlog({
    required String blogId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _apiClient.client.get(
        '/api/blogs/$blogId/reviews',
        queryParameters: {'page': page, 'limit': limit},
      );

      return ApiResponse.fromJson(
        response.data,
        (json) => PaginatedReviews.fromJson(json),
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Get rating distribution for a course
  /// GET /api/courses/:courseId/reviews/distribution
  Future<ApiResponse<RatingDistribution>> getRatingDistribution({
    required String courseId,
  }) async {
    try {
      final response = await _apiClient.client.get(
        '/api/courses/$courseId/reviews/distribution',
      );

      return ApiResponse.fromJson(
        response.data,
        (json) => RatingDistribution.fromJson(json),
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Create a review for a course
  /// POST /api/courses/:courseId/reviews
  Future<ApiResponse<Review>> createCourseReview({
    required String courseId,
    required int rating,
    String? comment,
  }) async {
    try {
      final response = await _apiClient.client.post(
        '/api/courses/$courseId/reviews',
        data: {
          'rating': rating,
          if (comment != null && comment.isNotEmpty) 'comment': comment,
        },
      );

      // Response: { success: true, data: { review: {...} } }
      return ApiResponse.fromJson(
        response.data,
        (json) => Review.fromJson(json['review']),
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Create a review for a blog post
  /// POST /api/blogs/:blogId/reviews
  Future<ApiResponse<Review>> createBlogReview({
    required String blogId,
    required int rating,
    String? comment,
  }) async {
    try {
      final response = await _apiClient.client.post(
        '/api/blogs/$blogId/reviews',
        data: {
          'rating': rating,
          if (comment != null && comment.isNotEmpty) 'comment': comment,
        },
      );

      return ApiResponse.fromJson(
        response.data,
        (json) => Review.fromJson(json['review']),
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Delete a review
  /// DELETE /api/courses/reviews/:reviewId
  Future<ApiResponse<void>> deleteReview(String reviewId) async {
    try {
      final response = await _apiClient.client.delete(
        '/api/courses/reviews/$reviewId',
      );
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  ApiResponse<T> _handleError<T>(DioException e) {
    if (e.response?.data != null && e.response?.data is Map) {
      try {
        return ApiResponse.fromJson(e.response!.data, (_) => null as T);
      } catch (_) {
        // Fallback
      }
    }
    return ApiResponse(
      success: false,
      message: e.message ?? 'Unknown error occurred',
    );
  }
}
