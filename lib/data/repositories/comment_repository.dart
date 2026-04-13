import 'package:dio/dio.dart';

import '../../core/models/api_response.dart';
import '../../core/models/paginated_response.dart';
import '../models/comment_model.dart';

/// Comment API wrapper for course discussions.
///
/// Backend endpoints:
/// - GET  /api/comments
/// - POST /api/comments
/// - POST /api/comments/:id/like (not used in this minimal mobile UI)
class CommentRepository {
  const CommentRepository(this._dio);

  final Dio _dio;

  Future<List<CommentModel>> getDiscussionTopics({
    required String discussionEntityId,
    int page = 1,
    int limit = 50,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/comments',
      queryParameters: <String, dynamic>{
        'entityId': discussionEntityId,
        'targetType': 'DISCUSSION',
        'page': page,
        'limit': limit,
      },
    );

    final body = response.data ?? {};
    if (body['success'] != true) {
      throw Exception(body['message'] ?? 'Failed to fetch discussion');
    }

    final paginated = PaginatedResponse.fromJson(
      body,
      (e) => CommentModel.fromJson(e as Map<String, dynamic>),
    );
    return paginated.data;
  }

  Future<CommentModel> createTopic({
    required String discussionEntityId,
    required String userId,
    required String title,
    required String content,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/comments',
      data: <String, dynamic>{
        'targetType': 'DISCUSSION',
        'entityId': discussionEntityId,
        'userId': userId,
        'content': '${title.trim()}\n\n${content.trim()}',
      },
    );

    final api = ApiResponse<CommentModel>.fromJson(
      response.data ?? {},
      (json) => CommentModel.fromJson(json as Map<String, dynamic>),
    );
    if (!api.success || api.data == null) {
      throw Exception(api.message ?? 'Failed to create topic');
    }
    return api.data!;
  }

  Future<CommentModel> replyToTopic({
    required String discussionEntityId,
    required String userId,
    required String parentId,
    required String content,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/comments',
      data: <String, dynamic>{
        'targetType': 'DISCUSSION',
        'entityId': discussionEntityId,
        'userId': userId,
        'parentId': parentId,
        'content': content.trim(),
      },
    );

    final api = ApiResponse<CommentModel>.fromJson(
      response.data ?? {},
      (json) => CommentModel.fromJson(json as Map<String, dynamic>),
    );
    if (!api.success || api.data == null) {
      throw Exception(api.message ?? 'Failed to reply');
    }
    return api.data!;
  }
}

