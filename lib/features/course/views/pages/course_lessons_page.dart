import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/course_model.dart';
import '../../models/module_model.dart';
import '../../models/lesson_model.dart';
import '../../providers/course_providers.dart';

/// Course Lessons Page - Display modules and lessons for enrolled course
class CourseLessonsPage extends ConsumerWidget {
  final String courseId;

  const CourseLessonsPage({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final state = ref.watch(courseDetailProvider(courseId));

    if (state.isLoading && state.course == null) {
      return const AppLoadingScreen(text: 'Đang tải khóa học...');
    }

    if (state.error != null && state.course == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: AppBackground(
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
                AppButton(
                  text: 'THỬ LẠI',
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
      return const AppLoadingScreen(text: 'Không tìm thấy khóa học...');
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
                onPressed: () => context.pop(),
              ),
              title: Text(
                course.title,
                style: const TextStyle(
                  fontFamily: AppTypography.fontFamilySerif,
                  fontWeight: AppTypography.bold,
                  fontSize: 18,
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(4),
                child: Hero(
                  tag: 'course-progress-${course.id}',
                  child: LinearProgressIndicator(
                    value: course.enrolledCount > 0 ? 0.35 : 0.0, // Placeholder progress for demo
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                    minHeight: 2,
                  ),
                ),
              ),
            ),

            // Content
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Title
                    _buildSectionTitle('Nội dung khóa học'),
                    const SizedBox(height: AppSpacing.lg),
                    
                    if (state.isLoadingCurriculum)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: AppSpacing.xxxl),
                          child: AppLoading(text: 'Đang tải chương trình học...'),
                        ),
                      )
                    else if (state.curriculum != null && state.curriculum!.modules.isNotEmpty)
                      ...state.curriculum!.modules.asMap().entries.expand((moduleEntry) {
                        final moduleIndex = moduleEntry.key + 1;
                        final module = moduleEntry.value;
                        final isLastModule = moduleEntry.key == state.curriculum!.modules.length - 1;
                        
                        return [
                          _buildModuleHeader(context, theme, isDark, module, moduleIndex),
                          ...module.lessons.asMap().entries.map((lessonEntry) {
                            final lessonIndex = lessonEntry.key + 1;
                            final lesson = lessonEntry.value;
                            final isLastLessonInModule = lessonEntry.key == module.lessons.length - 1;
                            
                            return _buildLessonItem(
                              context,
                              theme,
                              isDark,
                              course,
                              module,
                              lesson,
                              '$moduleIndex.$lessonIndex',
                              isLast: isLastModule && isLastLessonInModule,
                            );
                          }),
                        ];
                      })
                    else
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Text(
                          'Không tìm thấy chương trình học',
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
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontSize: 10,
        fontWeight: AppTypography.black,
        letterSpacing: 3.0,
        color: AppColors.primary.withValues(alpha: 0.5),
      ),
    );
  }

  Widget _buildModuleHeader(BuildContext context, ThemeData theme, bool isDark, Module module, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.xl),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$index',
                  style: const TextStyle(
                    fontWeight: AppTypography.black,
                    color: AppColors.primary,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    module.title.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: AppTypography.black,
                      fontSize: 13,
                      letterSpacing: 1.5,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (module.durationLabel.isNotEmpty)
                    Text(
                      '${module.lessons.length} Bài học • ${module.durationLabel}',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textTertiary,
                        fontWeight: AppTypography.medium,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }

  Widget _buildLessonItem(
    BuildContext context,
    ThemeData theme,
    bool isDark,
    Course course,
    Module module,
    Lesson lesson,
    String index,
    {bool isLast = false}
  ) {
    final isLocked = course.isEnrolled 
        ? false 
        : (!lesson.isUnlocked && !lesson.isPreview);
    
    // Determine state for timeline node
    final isCompleted = false; // Placeholder for future completion tracking
    final isCurrent = false; // Placeholder for current lesson tracking

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline Node & Line
          _buildTimelineNode(context, isLocked, isCompleted, isCurrent, isLast),
          
          const SizedBox(width: 8),
          
          // Lesson Content Card
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(AppRadius.card),
                border: Border.all(
                  color: isLocked
                      ? AppColors.grey300.withValues(alpha: 0.2)
                      : AppColors.primary.withValues(alpha: 0.1),
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.03),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: isLocked
                      ? null
                      : () {
                          context.push(
                            '/learning/${course.id}/${lesson.id}',
                            extra: lesson,
                          );
                        },
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icon based on type
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: isLocked
                                ? AppColors.grey100
                                : AppColors.primarySurface.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            isLocked 
                                ? Icons.lock_outline_rounded
                                : (lesson.isVideo ? Icons.play_circle_fill_rounded : Icons.description_rounded),
                            color: isLocked ? AppColors.textTertiary : AppColors.primary,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 16),
                        
                        // Lesson Info
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lesson.title,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: AppTypography.bold,
                                  fontSize: 15,
                                  color: isLocked
                                      ? AppColors.textTertiary
                                      : AppColors.textPrimary,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  if (lesson.isPreview && !course.isEnrolled) ...[
                                    _buildBadge('XEM THỬ', AppColors.successLight, AppColors.success),
                                    const SizedBox(width: 8),
                                  ],
                                  Icon(
                                    lesson.isVideo ? Icons.timer_outlined : Icons.menu_book_outlined,
                                    size: 12,
                                    color: AppColors.textTertiary,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    lesson.isVideo ? lesson.durationLabel : 'Bản thảo',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: AppColors.textTertiary,
                                      fontWeight: AppTypography.medium,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        
                        // Action Arrow
                        if (!isLocked)
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14,
                            color: AppColors.primary.withValues(alpha: 0.3),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineNode(
    BuildContext context, 
    bool isLocked, 
    bool isCompleted, 
    bool isCurrent, 
    bool isLast
  ) {
    return SizedBox(
      width: 32,
      child: Column(
        children: [
          // Node
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted 
                  ? AppColors.success 
                  : (isCurrent ? AppColors.primary : Colors.white),
              border: Border.all(
                color: isLocked 
                    ? AppColors.grey300 
                    : (isCompleted || isCurrent ? Colors.transparent : AppColors.primary.withValues(alpha: 0.5)),
                width: 2,
              ),
              boxShadow: isCurrent ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                )
              ] : null,
            ),
            child: isCompleted 
                ? const Icon(Icons.check, size: 12, color: Colors.white)
                : null,
          ),
          
          // Line
          if (!isLast)
            Expanded(
              child: Container(
                width: 2,
                color: isCompleted 
                    ? AppColors.success.withValues(alpha: 0.3) 
                    : AppColors.grey300.withValues(alpha: 0.5),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color bg, Color textCol) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg.withValues(alpha: 0.1), 
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textCol, 
          fontSize: 8, 
          fontWeight: AppTypography.black, 
          letterSpacing: 0.5
        ),
      ),
    );
  }
}
