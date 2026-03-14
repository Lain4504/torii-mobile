import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';
import 'package:torii_app/features/course/providers/course_providers.dart';
import 'package:torii_app/features/blog/providers/blog_providers.dart';
import 'package:torii_app/features/course/models/course_model.dart';
import 'package:torii_app/features/blog/models/blog_model.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/auth/models/auth_state.dart';
import 'package:torii_app/core/theme/theme_provider.dart';


class MarketplaceHomePage extends ConsumerStatefulWidget {
  const MarketplaceHomePage({super.key});

  @override
  ConsumerState<MarketplaceHomePage> createState() => _MarketplaceHomePageState();
}

class _MarketplaceHomePageState extends ConsumerState<MarketplaceHomePage> {
  final List<String> _categories = const [
    'JLPT N5',
    'JLPT N4',
    'Hán tự',
    'Ngữ pháp',
    'Giao tiếp',
    'Nghe hiểu',
  ];



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final courseState = ref.read(courseListProvider);
      if (courseState.courses.isEmpty) {
        ref.read(courseListProvider.notifier).loadCourses(refresh: true);
      }
      final blogState = ref.read(blogListProvider);
      if (blogState.blogs.isEmpty) {
        ref.read(blogListProvider.notifier).loadBlogs(refresh: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(courseListProvider);
    final blogState = ref.watch(blogListProvider);
    final recommendedCourses = courseState.courses.take(4).toList();
    final latestBlogs = blogState.blogs.take(4).toList();

    return Scaffold(
      body: AppBackground(
        pattern: BackgroundPattern.none,

        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer(
                        builder: (context, ref, child) {
                          final authState = ref.watch(authStateProvider);
                          final user = authState.asData?.value.user;
                          final isAuthenticated = authState.asData?.value.status == AuthStatus.authenticated;

                          if (isAuthenticated && user != null) {
                            return GestureDetector(
                              onTap: () => context.push('/profile'),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(user.avatarUrl ?? 'https://i.pravatar.cc/150?u=${user.id}'),
                                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                              ),
                            );
                          }

                          return Row(
                            children: [
                              TextButton(
                                onPressed: () => context.push('/login'),
                                style: TextButton.styleFrom(
                                  foregroundColor: AppColors.primary,
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lexend',
                                    fontSize: 12,
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text('Đăng nhập'),
                              ),
                              const SizedBox(width: 4),
                              ElevatedButton(
                                onPressed: () => context.push('/register'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(AppRadius.sm),
                                  ),
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lexend',
                                    fontSize: 12,
                                  ),
                                ),
                                child: const Text('Đăng ký'),
                              ),
                            ],
                          );
                        },
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => context.push('/notifications'),
                            icon: const Icon(
                              Icons.notifications_none_rounded,
                              color: AppColors.secondary,
                            ),
                          ),
                          IconButton(
                            onPressed: () => ref.read(themeModeProvider.notifier).toggleTheme(),
                            icon: Icon(
                              ref.watch(themeModeProvider) == ThemeMode.dark
                                  ? Icons.light_mode_outlined
                                  : Icons.dark_mode_outlined,
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Hero banner
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: EntryAnimation(
                    index: 0,
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.secondary, AppColors.primary],
                        ),
                        borderRadius: BorderRadius.circular(AppRadius.lg),

                        boxShadow: AppElevation.mediumShadow,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: -20,
                            bottom: -20,
                            child: Opacity(
                              opacity: 0.1,
                              child: Icon(
                                Icons.language,
                                size: 150,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Chinh phục Tiếng Nhật\nngay hôm nay!',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 22,
                                    fontWeight: AppTypography.bold,
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.md),
                                GestureDetector(
                                  onTap: () => context.push('/courses'),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppSpacing.md,
                                      vertical: AppSpacing.xs,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.accent,
                                      borderRadius: BorderRadius.circular(AppRadius.md),

                                    ),
                                    child: const Text(
                                      'Khám phá ngay',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: AppTypography.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),

              // Continue learning
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader('Tiếp tục học tập'),
                      const SizedBox(height: AppSpacing.md),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildContinueCard(
                              'Ngữ pháp N4 cơ bản',
                              'Học phần 12: Kính ngữ',
                              0.45,
                              '45%',
                            ),
                            const SizedBox(width: AppSpacing.md),
                            _buildContinueCard(
                              'Hán tự N5 cấp tốc',
                              'Bài 5: Các hán tự số',
                              0.8,
                              '80%',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),

              // Recommended courses
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSectionHeader('Khóa học đề xuất'),
                          TextButton(
                            onPressed: () => context.push('/courses'),
                            child: const Text(
                              'Xem tất cả',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.sm),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                sliver: recommendedCourses.isEmpty
                    ? const SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(AppSpacing.lg),
                            child: Text(
                              'Chưa có khóa học nào.',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.72,
                          crossAxisSpacing: AppSpacing.md,
                          mainAxisSpacing: AppSpacing.md,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              _buildCourseCard(context, recommendedCourses[index]),
                          childCount: recommendedCourses.length,
                        ),
                      ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),

              // Course categories
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader('Danh mục khóa học'),
                      const SizedBox(height: AppSpacing.md),
                      Wrap(
                        spacing: AppSpacing.sm,
                        runSpacing: AppSpacing.xs,
                        children: List.generate(_categories.length, (index) {
                          return ChoiceChip(
                            label: Text(_categories[index]),
                            selected: false,

                            onSelected: (selected) {
                              context.push('/courses');
                            },

                            backgroundColor: AppColors.white,
                            selectedColor: AppColors.primary,
                            labelStyle: const TextStyle(
                              color: AppColors.secondary,
                              fontWeight: AppTypography.medium,
                              fontSize: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppRadius.lg),

                              side: const BorderSide(
                                color: AppColors.borderLight,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),

              // Latest from blog
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSectionHeader('Blog Nhật ngữ'),
                          TextButton(
                            onPressed: () => context.push('/blog'),
                            child: const Text('Xem tất cả', style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),
                      if (blogState.isLoading && latestBlogs.isEmpty)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(AppSpacing.lg),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      else if (latestBlogs.isEmpty)
                        const Text(
                          'Chưa có bài viết nào.',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        )
                      else
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (final blog in latestBlogs) ...[
                                _buildBlogMiniCard(context, blog),
                                const SizedBox(width: AppSpacing.md),
                              ],
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxxl)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: AppTypography.bold,
        color: AppColors.secondary,
        letterSpacing: -0.5,
      ),
    );
  }

  Widget _buildContinueCard(String title, String subtitle, double progress, String percent) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),

        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: AppColors.grey100,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accent),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                percent,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: AppTypography.bold,
                  color: AppColors.accent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, Course course) {
    return GestureDetector(
      onTap: () => context.push('/courses/${course.id}'),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.lg),

          border: Border.all(color: AppColors.borderLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppRadius.lg)),

              child: course.thumbnailUrl != null &&
                      course.thumbnailUrl!.isNotEmpty
                  ? Image.network(
                      course.thumbnailUrl!,
                      height: 90,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 90,
                          width: double.infinity,
                          color: AppColors.grey100,
                          child: const Icon(
                            Icons.menu_book_rounded,
                            color: AppColors.primary,
                          ),
                        );
                      },
                    )
                  : Container(
                      height: 90,
                      width: double.infinity,
                      color: AppColors.grey100,
                      child: const Icon(Icons.menu_book_rounded,
                          color: AppColors.primary),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: AppTypography.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    course.instructorName,
                    style: const TextStyle(
                        fontSize: 10, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 12),
                      const SizedBox(width: 2),
                      Text(
                        '4.9',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: AppTypography.bold,
                          color: AppColors.grey700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course.priceLabel,
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontWeight: AppTypography.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlogMiniCard(BuildContext context, Blog blog) {
    return GestureDetector(
      onTap: () => context.push('/blog/detail', extra: blog),
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.lg),

          border: Border.all(color: AppColors.borderLight),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (blog.thumbnailUrl != null && blog.thumbnailUrl!.isNotEmpty)
              Image.network(
                blog.thumbnailUrl!,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            else
              Container(
                height: 100,
                width: double.infinity,
                color: AppColors.grey100,
                child: const Icon(Icons.article_outlined,
                    color: AppColors.primary),
              ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blog.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: AppTypography.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (blog.authorName != null)
                    Text(
                      blog.authorName!,
                      style: const TextStyle(
                          fontSize: 10, color: AppColors.textSecondary),
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

