import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/course_model.dart';
import '../../models/curriculum_model.dart';
import '../../models/module_model.dart';
import '../../providers/course_providers.dart';
import '../../../../core/constants/app_design_system.dart';


/// Course Detail Page - Minimalist Course Information
/// 
/// A clean, focused course detail view with clear hierarchy.
class CourseDetailPage extends ConsumerWidget {
  final String courseId;

  const CourseDetailPage({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final state = ref.watch(courseDetailProvider(courseId));

    // Show loading state
    if (state.isLoading && state.course == null) {
      return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Show error state
    if (state.error != null && state.course == null) {
      return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.error!,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.lg),
              ElevatedButton(
                onPressed: () {
                  ref.read(courseDetailProvider(courseId).notifier).loadCourseDetail(courseId);
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    final course = state.course;
    if (course == null) {
      return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: const Center(
          child: Text('Course not found'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // Header with thumbnail
          _buildHeader(context, isDark, course, state.isWishlisted, state.isTogglingWishlist, ref),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.pageHorizontal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Meta badges
                  _buildMetaBadges(course),
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
                  _buildInstructorRow(theme, course),
                  
                  const SizedBox(height: AppSpacing.lg),
                  
                  // Stats Row
                  _buildStatsRow(theme, isDark, course, state.curriculum),

                  const SizedBox(height: AppSpacing.xl),

                  // About Section
                  if (course.description != null && course.description!.isNotEmpty) ...[
                    _buildSectionTitle(theme, 'About This Course'),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      course.description!,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                  ],

                  // What You'll Learn
                  if (course.learningOutcomes.isNotEmpty) ...[
                    _buildSectionTitle(theme, 'What You\'ll Learn'),
                    const SizedBox(height: AppSpacing.md),
                    _buildLearningPoints(theme, course),
                    const SizedBox(height: AppSpacing.xl),
                  ],

                  // Curriculum Section
                  _buildSectionTitle(theme, 'Curriculum'),
                  const SizedBox(height: AppSpacing.md),
                  if (state.isLoadingCurriculum)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(AppSpacing.xl),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (state.curriculum != null && state.curriculum!.modules.isNotEmpty)
                    ...state.curriculum!.modules.expand((module) {
                      final moduleIndex = state.curriculum!.modules.indexOf(module) + 1;
                      return [
                        _buildModuleHeader(context, theme, isDark, module, moduleIndex),
                        ...module.lessons.map((lesson) {
                          final lessonIndex = module.lessons.indexOf(lesson) + 1;
                          return _buildCurriculumItem(
                            context,
                            '$moduleIndex.$lessonIndex',
                            lesson.title,
                            lesson.durationLabel,
                            isFree: lesson.isPreview,
                          );
                        }),
                      ];
                    })
                  else
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Text(
                        'No curriculum available',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  
                  // Bottom spacing for action bar
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
      
      // Bottom Action Bar
      bottomNavigationBar: _buildBottomBar(context, theme, isDark, course),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    bool isDark,
    Course course,
    bool isWishlisted,
    bool isTogglingWishlist,
    WidgetRef ref,
  ) {
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
            icon: isTogglingWishlist
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Icon(
                    isWishlisted ? Icons.favorite : Icons.favorite_border_outlined,
                    color: isWishlisted ? Colors.red : null,
                  ),
            onPressed: isTogglingWishlist
                ? null
                : () {
                    ref.read(courseDetailProvider(course.id).notifier).toggleWishlist();
                  },
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
            onPressed: () {
              // TODO: Implement share functionality
            },
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            course.thumbnailUrl != null
                ? Image.network(
                    course.thumbnailUrl!,
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
                  )
                : Container(
                    color: isDark ? AppColors.surfaceVariantDark : AppColors.grey200,
                    child: const Center(
                      child: Icon(
                        Icons.school_outlined,
                        size: 48,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ),
            // Play button overlay (only if preview video exists)
            if (course.previewVideoUrl != null)
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

  Widget _buildMetaBadges(Course course) {
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
        if (course.isFree) ...[
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
              'Free',
              style: TextStyle(
                color: AppColors.successDark,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
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

  Widget _buildInstructorRow(ThemeData theme, Course course) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundImage: course.instructorAvatarUrl.isNotEmpty
              ? NetworkImage(course.instructorAvatarUrl)
              : null,
          backgroundColor: AppColors.grey200,
          child: course.instructorAvatarUrl.isEmpty
              ? const Icon(Icons.person, size: 18)
              : null,
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
              course.rating.toStringAsFixed(1),
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

  Widget _buildStatsRow(ThemeData theme, bool isDark, Course course, Curriculum? curriculum) {
    // Calculate duration from curriculum
    String durationLabel = 'N/A';
    if (curriculum != null && curriculum.totalDurationMinutes > 0) {
      durationLabel = curriculum.totalDurationLabel;
    } else if (course.durationWeeks != null) {
      durationLabel = '${course.durationWeeks} weeks';
    }

    // Format student count
    String studentCount = course.enrolledCount.toString();
    if (course.enrolledCount >= 1000) {
      studentCount = '${(course.enrolledCount / 1000).toStringAsFixed(1)}k';
    }

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
          _buildStat(theme, Icons.schedule_outlined, durationLabel, 'Duration'),
          _buildStatDivider(isDark),
          _buildStat(theme, Icons.library_books_outlined, course.totalLessons.toString(), 'Lessons'),
          _buildStatDivider(isDark),
          _buildStat(theme, Icons.people_outline, studentCount, 'Students'),
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

  Widget _buildLearningPoints(ThemeData theme, Course course) {
    final points = course.learningOutcomes;
    
    if (points.isEmpty) {
      return const SizedBox.shrink();
    }
    
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

  Widget _buildModuleHeader(
    BuildContext context,
    ThemeData theme,
    bool isDark,
    Module module,
    int moduleIndex,
  ) {
    return Container(
      margin: EdgeInsets.only(
        top: moduleIndex > 1 ? AppSpacing.lg : 0,
        bottom: AppSpacing.sm,
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primarySurface,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Center(
              child: Text(
                'M$moduleIndex',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: AppTypography.bold,
                  color: AppColors.primary,
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
                  module.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: AppTypography.semiBold,
                  ),
                ),
                if (module.durationLabel.isNotEmpty)
                  Text(
                    module.durationLabel,
                    style: theme.textTheme.bodySmall,
                  ),
              ],
            ),
          ),
        ],
      ),
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

  Widget _buildBottomBar(BuildContext context, ThemeData theme, bool isDark, Course course) {
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (course.hasDiscount)
                      Text(
                        course.originalPriceLabel,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    if (course.hasDiscount) const SizedBox(width: AppSpacing.xs),
                    Text(
                      course.priceLabel,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: AppTypography.bold,
                      ),
                    ),
                  ],
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
