import 'package:dio/dio.dart';
import '../models/post_model.dart';

class PostRepository {
  final Dio _dio;

  PostRepository(this._dio);

  Future<List<Post>> getPosts({int page = 1, int limit = 10}) async {
    try {
      final response = await _dio.get('/api/posts', queryParameters: {
        'page': page,
        'limit': limit,
      });
      
      final data = response.data;
      final list = data is Map<String, dynamic> && data.containsKey('data')
          ? data['data'] as List
          : data as List;
          
      return list.map((item) => Post.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }

  Future<Post> getPostDetail(String id) async {
    try {
      final response = await _dio.get('/api/posts/$id');
      final data = response.data;
      final postData = data is Map<String, dynamic> && data.containsKey('data')
          ? data['data'] as Map<String, dynamic>
          : data as Map<String, dynamic>;
      return Post.fromJson(postData);
    } catch (e) {
      throw Exception('Failed to load post detail: $e');
    }
  }

  Future<List<Comment>> getComments(String postId) async {
    try {
      final response = await _dio.get('/api/posts/$postId/comments');
      final data = response.data;
      final list = data is Map<String, dynamic> && data.containsKey('data')
          ? data['data'] as List
          : data as List;
      return list.map((item) => Comment.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Failed to load comments: $e');
    }
  }

  Future<void> likePost(String id) async {
    await _dio.post('/api/posts/$id/like');
  }

  Future<Comment> addComment(String postId, String content) async {
    final response = await _dio.post('/api/posts/$postId/comments', data: {'content': content});
    return Comment.fromJson(response.data['data'] ?? response.data);
  }
}
