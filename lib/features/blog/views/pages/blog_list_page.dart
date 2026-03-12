import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class BlogListPage extends StatefulWidget {
  const BlogListPage({super.key});

  @override
  State<BlogListPage> createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> {
  String selectedCategory = 'All';
  final categories = ['All', 'JLPT Tips', 'Grammar', 'Kanji', 'Culture'];

  @override
  Widget build(BuildContext context) {
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
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppRadius.xs),
                        border: Border.all(color: AppColors.borderLight),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Search articles...',
                          border: InputBorder.none,
                          icon: Icon(Icons.search_rounded, color: AppColors.textTertiary),
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
                            onTap: () => setState(() => selectedCategory = cat),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primary : AppColors.white,
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(
                                  color: isSelected ? AppColors.primary : AppColors.borderLight,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                cat.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: AppTypography.black,
                                  color: isSelected ? AppColors.white : AppColors.textTertiary,
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
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return EntryAnimation(
                      index: index,
                      child: _buildBlogCard(context),
                    );
                  },
                  childCount: 5,
                ),
              ),
            ),
            
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }

  Widget _buildBlogCard(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/blog/detail'),
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
              child: Image.network(
                'https://picsum.photos/seed/${DateTime.now().millisecond}/800/450',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Text(
                      'GRAMMAR',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: AppTypography.black,
                        color: AppColors.primary,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Mastering Keigo: The Ultimate Guide to Polite Japanese',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: AppTypography.black,
                      letterSpacing: -0.5,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Understanding Japanese honorifics is crucial for professional communication. Here is everything you need to know...',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
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
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=sensei'),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Kenji Sensei',
                        style: TextStyle(fontSize: 12, fontWeight: AppTypography.bold),
                      ),
                      const Spacer(),
                      const Text(
                        'Oct 24, 2023',
                        style: TextStyle(fontSize: 11, color: AppColors.textTertiary),
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
