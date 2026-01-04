import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/course_model.dart';
import '../../../../core/constants/app_design_system.dart';


/// Course Detail Page - Minimalist Course Information
/// 
/// A clean, focused course detail view with clear hierarchy.
class CourseDetailPage extends StatelessWidget {
  final Course course;

  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // Header with thumbnail
          _buildHeader(context, isDark),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.pageHorizontal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Meta badges
                  _buildMetaBadges(),
                  const SizedBox(height: AppSpacing.md),

                  // Title
                  Text(
                    course.title,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: AppTypography.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // Instructor & Rating
                  _buildInstructorRow(theme),
                  
                  const SizedBox(height: AppSpacing.lg),
                  
                  // Stats Row
                  _buildStatsRow(theme, isDark),

                  const SizedBox(height: AppSpacing.xl),

                  // About Section
                  _buildSectionTitle(theme, 'About This Course'),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    course.description,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // What You'll Learn
                  _buildSectionTitle(theme, 'What You\'ll Learn'),
                  const SizedBox(height: AppSpacing.md),
                  _buildLearningPoints(theme),

                  const SizedBox(height: AppSpacing.xl),

                  // Curriculum Section
                  _buildSectionTitle(theme, 'Curriculum'),
                  const SizedBox(height: AppSpacing.md),
                  _buildCurriculumItem(context, '1', 'Introduction to ${course.levelLabel}', '5 min', isFree: true),
                  _buildCurriculumItem(context, '2', 'Essential Grammar Patterns', '12 min'),
                  _buildCurriculumItem(context, '3', 'Vocabulary Building', '15 min'),
                  _buildCurriculumItem(context, '4', 'Listening Comprehension', '20 min'),
                  _buildCurriculumItem(context, '5', 'Practice Exercises', '18 min'),
                  
                  // Bottom spacing for action bar
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
      
      // Bottom Action Bar
      bottomNavigationBar: _buildBottomBar(context, theme, isDark),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDark 
              ? Colors.black.withValues(alpha: 0.5)
              : Colors.white.withValues(alpha: 0.9),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDark 
                ? Colors.black.withValues(alpha: 0.5)
                : Colors.white.withValues(alpha: 0.9),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.favorite_border_outlined),
            onPressed: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: isDark 
                ? Colors.black.withValues(alpha: 0.5)
                : Colors.white.withValues(alpha: 0.9),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {},
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              course.thumbnailUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: isDark ? AppColors.surfaceVariantDark : AppColors.grey200,
                child: const Center(
                  child: Icon(
                    Icons.school_outlined,
                    size: 48,
                    color: AppColors.textTertiary,
                  ),
                ),
              ),
            ),
            // Play button overlay
            Center(
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                  boxShadow: AppElevation.softShadow,
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 36,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetaBadges() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.primarySurface,
            borderRadius: BorderRadius.circular(AppRadius.xs),
          ),
          child: Text(
            course.levelLabel,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: course.type == CourseType.liveClass 
                ? AppColors.accentSurface
                : AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(AppRadius.xs),
          ),
          child: Text(
            course.typeLabel,
            style: TextStyle(
              color: course.type == CourseType.liveClass 
                  ? AppColors.accentDark
                  : AppColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (course.isEnrolled) ...[
          const SizedBox(width: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: AppColors.successLight,
              borderRadius: BorderRadius.circular(AppRadius.xs),
            ),
            child: const Text(
              'Enrolled',
              style: TextStyle(
                color: AppColors.successDark,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildInstructorRow(ThemeData theme) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage(course.instructorAvatarUrl),
          backgroundColor: AppColors.grey200,
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.instructorName,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: AppTypography.semiBold,
                ),
              ),
              Text(
                'Instructor',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Row(
          children: [
            const Icon(Icons.star_rounded, size: 18, color: AppColors.accent),
            const SizedBox(width: 4),
            Text(
              '${course.rating}',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: AppTypography.bold,
              ),
            ),
            Text(
              ' (${course.reviewCount})',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsRow(ThemeData theme, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          _buildStat(theme, Icons.schedule_outlined, '4.5 hours', 'Duration'),
          _buildStatDivider(isDark),
          _buildStat(theme, Icons.library_books_outlined, '24', 'Lessons'),
          _buildStatDivider(isDark),
          _buildStat(theme, Icons.people_outline, '1.2k', 'Students'),
        ],
      ),
    );
  }

  Widget _buildStat(ThemeData theme, IconData icon, String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          const SizedBox(height: AppSpacing.xs),
          Text(
            value,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: AppTypography.bold,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildStatDivider(bool isDark) {
    return Container(
      width: 1,
      height: 40,
      color: isDark ? AppColors.borderDark : AppColors.borderLight,
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(
        fontWeight: AppTypography.semiBold,
      ),
    );
  }

  Widget _buildLearningPoints(ThemeData theme) {
    final points = [
      'Understand essential grammar patterns',
      'Build vocabulary for everyday conversations',
      'Practice listening and reading comprehension',
      'Prepare for JLPT ${course.levelLabel} exam',
    ];
    
    return Column(
      children: points.map((point) => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 2),
              child: const Icon(
                Icons.check_circle_rounded,
                size: 18,
                color: AppColors.success,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                point,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildCurriculumItem(
    BuildContext context,
    String number,
    String title,
    String duration, {
    bool isFree = false,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Center(
              child: Text(
                number,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: AppTypography.semiBold,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: AppTypography.medium,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  duration,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          if (isFree)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xxs,
              ),
              decoration: BoxDecoration(
                color: AppColors.successLight,
                borderRadius: BorderRadius.circular(AppRadius.xs),
              ),
              child: const Text(
                'Preview',
                style: TextStyle(
                  color: AppColors.successDark,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          else
            const Icon(
              Icons.lock_outline,
              size: 18,
              color: AppColors.textTertiary,
            ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, ThemeData theme, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surface,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  course.priceLabel,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: AppColors.primary,
                    fontWeight: AppTypography.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(width: AppSpacing.lg),
            Expanded(
              child: SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    if (course.isEnrolled) {
                      // TODO: Go to learning
                    } else {
                      context.push('/payment');
                    }
                  },
                  child: Text(
                    course.isEnrolled ? 'Continue Learning' : 'Enroll Now',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
