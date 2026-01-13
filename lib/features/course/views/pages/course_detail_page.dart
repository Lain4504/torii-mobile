import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/course_model.dart';
import '../../models/curriculum_model.dart';
import '../../models/module_model.dart';
import '../../providers/course_providers.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

/// Course Detail Page - Premium Zen UI Rebuild
class CourseDetailPage extends ConsumerWidget {
  final String courseId;

  const CourseDetailPage({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final state = ref.watch(courseDetailProvider(courseId));

    if (state.isLoading && state.course == null) {
      return const ZenLoadingScreen(text: 'Loading course...');
    }

    if (state.error != null && state.course == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: ZenBackground(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.error),
                const SizedBox(height: 16),
                Text(
                  state.error!,
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ZenButton(
                  text: 'TRY AGAIN',
                  onPressed: () {
                    ref.read(courseDetailProvider(courseId).notifier).loadCourseDetail(courseId);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    final course = state.course;
    if (course == null) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: Text('Protocol Missing')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildHeader(context, isDark, course, state.isWishlisted, state.isTogglingWishlist, ref),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EntryAnimation(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildMetaBadges(course),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            course.title,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: AppTypography.extraBold,
                              fontSize: 26,
                              letterSpacing: -0.5,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          _buildInstructorRow(theme, course),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.xl),
                    
                    EntryAnimation(
                      delay: const Duration(milliseconds: 200),
                      child: _buildStatsRow(theme, isDark, course, state.curriculum),
                    ),

                    const SizedBox(height: AppSpacing.xxl),

                    if (course.description != null && course.description!.isNotEmpty) ...[
                      EntryAnimation(
                        delay: const Duration(milliseconds: 300),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Course Overview'),
                            const SizedBox(height: AppSpacing.md),
                            Text(
                              course.description!,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: AppColors.textSecondary,
                                height: 1.8,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                    ],

                    if (course.learningOutcomes.isNotEmpty) ...[
                      EntryAnimation(
                        delay: const Duration(milliseconds: 400),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('What you\'ll learn'),
                            const SizedBox(height: AppSpacing.lg),
                            _buildLearningPoints(theme, course),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                    ],

                    EntryAnimation(
                      delay: const Duration(milliseconds: 500),
                      child: _buildSectionTitle('Course Content'),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    
                    if (state.isLoadingCurriculum)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: AppSpacing.xxxl),
                          child: ZenLoading(text: 'Syncing curriculum blocks...'),
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
                          'No curriculum archive found',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textTertiary,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
      expandedHeight: 240,
      pinned: true,
      elevation: 0,
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,
      leadingWidth: 70,
      leading: Container(
        margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      actions: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            icon: isTogglingWishlist
                ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                : Icon(
                    isWishlisted ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                    size: 20,
                    color: isWishlisted ? AppColors.error : AppColors.textPrimary,
                  ),
            onPressed: isTogglingWishlist ? null : () => ref.read(courseDetailProvider(course.id).notifier).toggleWishlist(),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.share_rounded, size: 20, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'course-${course.id}',
              child: course.thumbnailUrl != null
                  ? Image.network(course.thumbnailUrl!, fit: BoxFit.cover)
                  : Container(color: AppColors.grey200),
            ),
            Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black.withOpacity(0.3), Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.center))),
            if (course.previewVideoUrl != null)
              Center(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.8), width: 2),
                  ),
                  child: ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(Icons.play_arrow_rounded, size: 48, color: Colors.white),
                      ),
                    ),
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
        _buildBadge(course.levelLabel, AppColors.primarySurface, AppColors.primary),
        const SizedBox(width: 8),
        _buildBadge(course.typeLabel, AppColors.accentSurface, AppColors.accentDark),
        if (course.isEnrolled) ...[
          const SizedBox(width: 8),
          _buildBadge('SYNCHRONIZED', AppColors.successLight, AppColors.successDark),
        ],
      ],
    );
  }

  Widget _buildBadge(String text, Color bg, Color textCol) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg.withOpacity(0.1), 
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: textCol.withOpacity(0.2)),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: textCol, fontSize: 9, fontWeight: AppTypography.black, letterSpacing: 2.0),
      ),
    );
  }

  Widget _buildInstructorRow(ThemeData theme, Course course) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.primary.withOpacity(0.1))),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.primarySurface,
            backgroundImage: course.instructorAvatarUrl.isNotEmpty ? NetworkImage(course.instructorAvatarUrl) : null,
            child: course.instructorAvatarUrl.isEmpty ? const Icon(Icons.person_rounded, size: 16, color: AppColors.primary) : null,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(course.instructorName, style: theme.textTheme.titleSmall?.copyWith(fontWeight: AppTypography.bold)),
              Text('Principal Instructor', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary)),
            ],
          ),
        ),
        Row(
          children: [
            const Icon(Icons.star_rounded, size: 18, color: AppColors.accent),
            const SizedBox(width: 4),
            Text(course.rating.toStringAsFixed(1), style: theme.textTheme.titleSmall?.copyWith(fontWeight: AppTypography.black)),
            Text(' (${course.reviewCount})', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsRow(ThemeData theme, bool isDark, Course course, Curriculum? curriculum) {
    String duration = curriculum?.totalDurationLabel ?? (course.durationWeeks != null ? '${course.durationWeeks} weeks' : 'N/A');
    String studentCount = course.enrolledCount >= 1000 ? '${(course.enrolledCount / 1000).toStringAsFixed(1)}k' : course.enrolledCount.toString();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(color: AppColors.borderLight.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.04),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildStatItem(Icons.timer_rounded, duration, 'HOURS'),
          _buildVerticalDivider(),
          _buildStatItem(Icons.layers_rounded, course.totalLessons.toString(), 'LESSONS'),
          _buildVerticalDivider(),
          _buildStatItem(Icons.group_rounded, studentCount, 'STUDENTS'),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 20, color: AppColors.primary.withOpacity(0.7)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontWeight: AppTypography.black, fontSize: 16, letterSpacing: -0.5)),
          Text(label, style: const TextStyle(fontSize: 9, fontWeight: AppTypography.black, letterSpacing: 1.5, color: AppColors.textTertiary)),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() => Container(width: 1, height: 30, color: AppColors.borderLight.withOpacity(0.5));

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(width: 4, height: 16, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 12),
        Text(
          title.toUpperCase(),
          style: const TextStyle(fontSize: 12, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textPrimary),
        ),
      ],
    );
  }

  Widget _buildLearningPoints(ThemeData theme, Course course) {
    return Column(
      children: course.learningOutcomes.map((point) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.check_circle_rounded, size: 18, color: AppColors.success),
            const SizedBox(width: 12),
            Expanded(child: Text(point, style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15, color: AppColors.textSecondary))),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildModuleHeader(BuildContext context, ThemeData theme, bool isDark, Module module, int index) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.primarySurface.withOpacity(0.5), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Text('M$index', style: const TextStyle(fontWeight: AppTypography.black, color: AppColors.primary, fontSize: 18)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(module.title, style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 16)),
                if (module.durationLabel.isNotEmpty) Text(module.durationLabel, style: const TextStyle(fontSize: 12, color: AppColors.textTertiary)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurriculumItem(BuildContext context, String num, String title, String duration, {bool isFree = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(color: AppColors.borderLight.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(num, style: const TextStyle(fontWeight: AppTypography.black, color: AppColors.textTertiary, fontSize: 12)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: AppTypography.semiBold, fontSize: 14)),
                Text(duration, style: const TextStyle(fontSize: 11, color: AppColors.textTertiary, fontWeight: AppTypography.medium)),
              ],
            ),
          ),
          if (isFree) _buildBadge('PREVIEW', AppColors.successLight, AppColors.successDark)
          else const Icon(Icons.lock_outline_rounded, size: 18, color: AppColors.textTertiary),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, ThemeData theme, bool isDark, Course course) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).padding.bottom + 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.xxl)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.05),
            blurRadius: 30,
            offset: const Offset(0, -10),
          ),
        ],
        border: Border(top: BorderSide(color: AppColors.borderLight.withOpacity(0.3))),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('ACCESS COST', style: TextStyle(fontSize: 9, fontWeight: AppTypography.black, letterSpacing: 1.5, color: AppColors.textTertiary)),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(course.priceLabel, style: const TextStyle(fontSize: 24, fontWeight: AppTypography.black, color: AppColors.primary)),
                    if (course.hasDiscount) ...[
                      const SizedBox(width: 8),
                      Text(course.originalPriceLabel, style: const TextStyle(fontSize: 14, decoration: TextDecoration.lineThrough, color: AppColors.textTertiary)),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: ZenButton(
                text: course.isEnrolled ? 'RESUME NEURAL LINK' : 'INITIALIZE ENROLLMENT',
                onPressed: () {
                  if (course.isEnrolled) {
                    // Navigate to course content
                  } else {
                    context.push('/payment');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
