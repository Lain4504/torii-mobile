import 'package:dio/dio.dart';
import '../../data/api/api_client.dart';
import '../../core/models/api_response.dart';
import '../../features/comment/models/comment_model.dart';

/// Comment Service - API Integration
/// Handles operations for blog/post comments
class CommentService {
  final ApiClient _apiClient;

  CommentService(this._apiClient);

  /// Get comments for a post/blog
  /// GET /api/comments
  Future<ApiResponse<PaginatedComments>> getComments({
    required String postId,
    int page = 1,
    int limit = 20,
    String? sortBy, // 'createdAt', 'likes'
    String sortOrder = 'desc',
  }) async {
    try {
      final response = await _apiClient.client.get(
        '/api/comments',
        queryParameters: {
          'postId': postId,
          'page': page,
          'limit': limit,
          'sortBy': sortBy,
          'sortOrder': sortOrder,
        },
      );

      return ApiResponse.fromJson(
        response.data,
        (json) => PaginatedComments.fromJson(json),
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Create a new comment
  /// POST /api/comments
  Future<ApiResponse<Comment>> createComment({
    required String postId,
    required String content,
    String? parentId,
  }) async {
    try {
      final response = await _apiClient.client.post(
        '/api/comments',
        data: {
          'postId': postId,
          'content': content,
          if (parentId != null) 'parentCommentId': parentId,
        },
      );

      // Backend returns directly the object in data often
      // Checking post-comment-api.ts: returns transformComment(responseData.data)
      return ApiResponse.fromJson(
        response.data,
        (json) => Comment.fromJson(json),
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Update a comment
  /// PATCH /api/comments/:id
  Future<ApiResponse<Comment>> updateComment({
    required String commentId,
    required String content,
  }) async {
    try {
      final response = await _apiClient.client.patch(
        '/api/comments/$commentId',
        data: {'content': content},
      );

      return ApiResponse.fromJson(
        response.data,
        (json) => Comment.fromJson(json),
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Delete a comment
  /// DELETE /api/comments/:id
  Future<ApiResponse<void>> deleteComment(String commentId) async {
    try {
      final response = await _apiClient.client.delete(
        '/api/comments/$commentId',
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
