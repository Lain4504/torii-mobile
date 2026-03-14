import 'package:dio/dio.dart';
import '../models/blog_model.dart';

/// Blog repository – gateway GET /api/blogs (paginated), GET /api/blogs/slug/:slug, GET /api/blogs/:id.
/// Response: list = { success, data: [], total, page, limit, totalPages }, single = { success, data: { blog } }.
class BlogRepository {
  final Dio _dio;
  static const String _base = '/api/blogs';

  BlogRepository(this._dio);

  /// Unwrap { success, data } and optional nested { blog }.
  static List<Blog> _parseList(dynamic body) {
    if (body is! Map<String, dynamic>) return [];
    final data = body['data'];
    if (data is List) {
      return data.map((e) => Blog.fromJson(e as Map<String, dynamic>)).toList();
    }
    if (data is Map && data['data'] is List) {
      return (data['data'] as List).map((e) => Blog.fromJson(e as Map<String, dynamic>)).toList();
    }
    return [];
  }

  static Blog _parseOne(dynamic body) {
    if (body is Map<String, dynamic> && body['data'] != null) {
      final d = body['data'];
      if (d is Map<String, dynamic> && d['blog'] != null) {
        return Blog.fromJson(d['blog'] as Map<String, dynamic>);
      }
      if (d is Map<String, dynamic>) {
        return Blog.fromJson(d);
      }
    }
    throw Exception('Unexpected blog response');
  }

  /// GET /api/blogs?page=&limit=&search=
  /// Returns list and pagination. Gateway: successPaginatedResponse → { success, data: [], total, page, limit, totalPages }.
  Future<BlogListResult> getBlogs({
    int page = 1,
    int limit = 10,
    String? search,
  }) async {
    final query = <String, dynamic>{'page': page, 'limit': limit};
    if (search != null && search.trim().isNotEmpty) query['search'] = search.trim();
    final res = await _dio.get(_base, queryParameters: query);
    if (res.statusCode != 200) throw Exception('Failed to fetch blogs: ${res.statusCode}');
    final body = res.data;
    final list = body is Map && body['data'] is List
        ? (body['data'] as List).map((e) => Blog.fromJson(e as Map<String, dynamic>)).toList()
        : _parseList(body);
    return BlogListResult(
      blogs: list,
      total: (body is Map && body['total'] != null) ? (body['total'] as num).toInt() : list.length,
      page: (body is Map && body['page'] != null) ? (body['page'] as num).toInt() : page,
      limit: (body is Map && body['limit'] != null) ? (body['limit'] as num).toInt() : limit,
      totalPages: (body is Map && body['totalPages'] != null) ? (body['totalPages'] as num).toInt() : 1,
    );
  }

  /// GET /api/blogs/slug/:slug
  Future<Blog> getBlogBySlug(String slug) async {
    final res = await _dio.get('$_base/slug/$slug');
    if (res.statusCode != 200) throw Exception('Failed to fetch blog: ${res.statusCode}');
    return _parseOne(res.data);
  }

  /// GET /api/blogs/:id
  Future<Blog> getBlogById(String id) async {
    final res = await _dio.get('$_base/$id');
    if (res.statusCode != 200) throw Exception('Failed to fetch blog: ${res.statusCode}');
    return _parseOne(res.data);
  }

  /// PATCH /api/blogs/:id/view – increment view count (public).
  Future<void> incrementView(String id) async {
    await _dio.patch('$_base/$id/view');
  }
}

class BlogListResult {
  final List<Blog> blogs;
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  const BlogListResult({
    required this.blogs,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });
}
