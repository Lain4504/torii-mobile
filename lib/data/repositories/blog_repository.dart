import 'package:dio/dio.dart';

import '../models/blog_model.dart';
import '../../core/models/api_response.dart';
import '../../core/models/paginated_response.dart';

/// Blog API - GET /api/blogs, /api/blogs/slug/:slug, /api/blogs/:id, PATCH :id/view
class BlogRepository {
  const BlogRepository(this._dio);

  final Dio _dio;

  /// GET /api/blogs - list (public, paginated)
  Future<PaginatedResponse<BlogModel>> getBlogs({
    int page = 1,
    int limit = 12,
    String? search,
    String? status,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/blogs',
      queryParameters: <String, dynamic>{
        'page': page,
        'limit': limit,
        if (search != null && search.isNotEmpty) 'search': search,
        if (status != null && status.isNotEmpty) 'status': status,
      },
    );
    final body = response.data ?? {};
    if (body['success'] != true) {
      throw Exception(body['message'] ?? 'Failed to fetch blogs');
    }
    return PaginatedResponse.fromJson(body, (e) => BlogModel.fromJson(e as Map<String, dynamic>));
  }

  /// GET /api/blogs/slug/:slug - by slug (public)
  Future<BlogModel?> getBlogBySlug(String slug) async {
    final response = await _dio.get<Map<String, dynamic>>('/api/blogs/slug/$slug');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final blogJson = api.data!['blog'] ?? api.data;
    return BlogModel.fromJson(blogJson as Map<String, dynamic>);
  }

  /// GET /api/blogs/:id - by id (public)
  Future<BlogModel?> getBlogById(String id) async {
    final response = await _dio.get<Map<String, dynamic>>('/api/blogs/$id');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return null;
    final blogJson = api.data!['blog'] ?? api.data;
    return BlogModel.fromJson(blogJson as Map<String, dynamic>);
  }

  /// PATCH /api/blogs/:id/view - increment view count
  Future<void> incrementView(String id) async {
    await _dio.patch<void>('/api/blogs/$id/view');
  }
}
