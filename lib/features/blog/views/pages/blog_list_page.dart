import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import 'package:torii_app/features/blog/providers/blog_providers.dart';
import 'package:torii_app/features/blog/models/blog_model.dart';

class BlogListPage extends ConsumerStatefulWidget {
  const BlogListPage({super.key});

  @override
  ConsumerState<BlogListPage> createState() => _BlogListPageState();
}

class _BlogListPageState extends ConsumerState<BlogListPage> {
  String selectedCategory = 'All';
  final categories = ['All', 'JLPT Tips', 'Grammar', 'Kanji', 'Culture'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(blogListProvider.notifier).loadBlogs(refresh: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(blogListProvider);
    final blogs = state.blogs;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'BLOG',
                style: TextStyle(
                  fontWeight: AppTypography.black,
                  fontSize: 16,
                  letterSpacing: 2.0,
                  color: AppColors.textPrimary,
                ),
              ),
            ),

            // Search and Categories
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppRadius.xs),
                        border: Border.all(color: AppColors.borderLight),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Search articles...',
                          border: InputBorder.none,
                          icon: Icon(Icons.search_rounded,
                              color: AppColors.textTertiary),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    SizedBox(
                      height: 32,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final cat = categories[index];
                          final isSelected = selectedCategory == cat;
                          return GestureDetector(
                            onTap: () =>
                                setState(() => selectedCategory = cat),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.borderLight,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                cat.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: AppTypography.black,
                                  color: isSelected
                                      ? AppColors.white
                                      : AppColors.textTertiary,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Blog List
            if (state.isLoading && blogs.isEmpty)
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (blogs.isEmpty)
              const SliverFillRemaining(
                child: Center(
                  child: Text(
                    'Chưa có bài viết nào.',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              )
            else
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final blog = blogs[index];
                      return EntryAnimation(
                        index: index,
                        child: _buildBlogCard(context, blog),
                      );
                    },
                    childCount: blogs.length,
                  ),
                ),
              ),

            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }

  Widget _buildBlogCard(BuildContext context, Blog blog) {
    final dateFormatter = DateFormat('dd MMM, yyyy');

    return GestureDetector(
      onTap: () => context.push('/blog/detail', extra: blog),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.sm),
          border: Border.all(color: AppColors.borderLight),
          boxShadow: AppElevation.softShadow,
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: blog.thumbnailUrl != null &&
                      blog.thumbnailUrl!.isNotEmpty
                  ? Image.network(
                      blog.thumbnailUrl!,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: AppColors.grey100,
                      child: const Icon(Icons.article_outlined,
                          color: AppColors.primary),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (blog.category != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        blog.category!.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 8,
                          fontWeight: AppTypography.black,
                          color: AppColors.primary,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  const SizedBox(height: 12),
                  Text(
                    blog.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: AppTypography.black,
                      letterSpacing: -0.5,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (blog.excerpt != null)
                    Text(
                      blog.excerpt!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?u=sensei'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        blog.authorName ?? 'Torii Team',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: AppTypography.bold),
                      ),
                      const Spacer(),
                      if (blog.publishedAt != null)
                        Text(
                          dateFormatter.format(blog.publishedAt!),
                          style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.textTertiary),
                        ),
                    ],
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
