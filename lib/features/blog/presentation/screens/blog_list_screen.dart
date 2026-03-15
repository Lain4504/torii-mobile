import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/blog_model.dart';

class BlogListScreen extends ConsumerStatefulWidget {
  const BlogListScreen({super.key});

  @override
  ConsumerState<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends ConsumerState<BlogListScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final blogListAsync = ref.watch(blogListProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('Blog học tiếng Nhật', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm bài viết...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.grey200,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
              onChanged: (v) => setState(() => _searchQuery = v),
            ),
          ),
          Expanded(
            child: blogListAsync.when(
              data: (paginated) => _buildList(paginated.data),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: AppColors.error))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<BlogModel> list) {
    final filtered = _searchQuery.isEmpty
        ? list
        : list.where((b) =>
            b.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            (b.excerpt ?? '').toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    if (filtered.isEmpty) {
      return Center(child: Text(_searchQuery.isEmpty ? 'Chưa có bài viết nào' : 'Không tìm thấy bài viết'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final blog = filtered[index];
        return _buildBlogCard(blog);
      },
    );
  }

  Widget _buildBlogCard(BlogModel blog) {
    final tag = blog.tags.isNotEmpty ? blog.tags.first : 'Kinh nghiệm';
    return InkWell(
      onTap: () => context.push('/blog-detail/${blog.slug}'),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: AppColors.textPrimary.withOpacity(0.04), blurRadius: 15, offset: const Offset(0, 5)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                blog.coverImageUrl ?? 'https://picsum.photos/seed/blog${blog.id}/600/300',
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(height: 160, color: AppColors.grey200, child: const Icon(Icons.article, size: 48)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(tag, style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                      Text(blog.formattedDate, style: TextStyle(color: AppColors.textTertiary, fontSize: 11)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(blog.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 8),
                  Text(
                    () {
                      final plain = blog.content.replaceAll(RegExp(r'<[^>]*>'), '').trim();
                      final text = blog.excerpt ?? plain;
                      return text.length > 100 ? '${text.substring(0, 100)}...' : text;
                    }(),
                    style: TextStyle(color: AppColors.grey700, fontSize: 13, height: 1.5),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
