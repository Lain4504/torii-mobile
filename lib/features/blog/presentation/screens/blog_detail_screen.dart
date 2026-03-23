import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/blog_model.dart';

class BlogDetailScreen extends ConsumerWidget {
  const BlogDetailScreen({super.key, required this.slug});
  final String slug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogAsync = ref.watch(blogDetailBySlugProvider(slug));

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: blogAsync.when(
        data: (blog) {
          if (blog == null) return const Center(child: Text('Không tìm thấy bài viết'));
          return _buildContent(context, blog);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: theme.colorScheme.error))),
      ),
    );
  }

  Widget _buildContent(BuildContext context, BlogModel blog) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              blog.coverImageUrl ?? 'https://picsum.photos/seed/blog_detail/800/600',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.3), child: const Icon(Icons.article, size: 64)),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              child: IconButton(icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onSurface, size: 20), onPressed: () => Navigator.pop(context)),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(blog.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 1.3)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CircleAvatar(radius: 12, backgroundImage: blog.author?.avatarUrl != null ? NetworkImage(blog.author!.avatarUrl!) : null, child: blog.author?.avatarUrl == null ? const Icon(Icons.person, size: 16) : null),
                    const SizedBox(width: 8),
                    Text(blog.author?.displayName ?? 'Admin Torii', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(width: 16),
                    Text(blog.formattedDate, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.7), fontSize: 13)),
                  ],
                ),
                const Divider(height: 48),
                Text(blog.content.replaceAll(RegExp(r'<[^>]*>'), '\n').trim(), style: TextStyle(fontSize: 16, height: 1.7, color: Theme.of(context).colorScheme.onSurface)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
