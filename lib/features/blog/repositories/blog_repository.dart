import 'package:dio/dio.dart';
import 'package:torii_app/features/blog/models/blog_model.dart';

class BlogRepository {
  final Dio _dio;
  static const String _basePath = '/api/blogs';

  BlogRepository(this._dio);

  Future<List<Blog>> getBlogs({
    int page = 1,
    int limit = 10,
    String? search,
  }) async {
    try {
      final query = <String, dynamic>{
        'page': page,
        'limit': limit,
      };
      if (search != null && search.isNotEmpty) {
        query['search'] = search;
      }

      final res = await _dio.get(_basePath, queryParameters: query);
      if (res.statusCode != 200) {
        throw Exception('Failed to fetch blogs: ${res.statusCode}');
      }

      final root = res.data;
      final dynamic inner =
          root is Map<String, dynamic> && root['data'] != null
              ? root['data']
              : root;

      List list;
      if (inner is Map<String, dynamic> && inner['data'] is List) {
        list = inner['data'] as List;
      } else if (inner is List) {
        list = inner;
      } else {
        list = const [];
      }

      return list
          .whereType<Map<String, dynamic>>()
          .map((e) => Blog.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch blogs: $e');
    }
  }

  Future<Blog> getBlogBySlug(String slug) async {
    try {
      final res = await _dio.get('$_basePath/slug/$slug');
      if (res.statusCode != 200) {
        throw Exception('Failed to fetch blog: ${res.statusCode}');
      }

      final root = res.data;
      final dynamic inner =
          root is Map<String, dynamic> && root['data'] != null
              ? root['data']
              : root;

      Map<String, dynamic> json;
      if (inner is Map<String, dynamic> && inner['blog'] is Map) {
        json = inner['blog'] as Map<String, dynamic>;
      } else if (inner is Map<String, dynamic>) {
        json = inner;
      } else {
        throw Exception('Unexpected blog response format');
      }

      return Blog.fromJson(json);
    } catch (e) {
      throw Exception('Failed to fetch blog: $e');
    }
  }
}

