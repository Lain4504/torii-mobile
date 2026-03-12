import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../providers/my_learning_provider.dart';
import '../widgets/enrolled_course_card.dart';

class MyLearningPage extends ConsumerWidget {
  const MyLearningPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myLearningProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'MY COURSES',
                style: TextStyle(
                  fontWeight: AppTypography.black,
                  fontSize: 16,
                  letterSpacing: 2.0,
                  color: AppColors.textPrimary,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search_rounded, color: AppColors.textPrimary),
                ),
                const SizedBox(width: AppSpacing.md),
              ],
            ),
            
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CONTINUE LEARNING',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: AppTypography.black,
                        letterSpacing: 2.0,
                        color: AppColors.textTertiary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    // If there are courses, show the first one as "Continue Learning"
                    if (!state.isLoading && state.myCourses.isNotEmpty)
                       _buildContinueLearningCard(state.myCourses.first),
                    
                    const SizedBox(height: AppSpacing.xl),
                    Text(
                      'ALL ENROLLED COURSES',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: AppTypography.black,
                        letterSpacing: 2.0,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (state.isLoading)
              const SliverFillRemaining(
                child: Center(child: AppLoading(text: 'Đang tải khóa học...')),
              )
            else if (state.myCourses.isEmpty)
              SliverFillRemaining(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxxl),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.auto_stories_rounded, size: 64, color: AppColors.primary.withValues(alpha: 0.1)),
                        const SizedBox(height: 24),
                        const Text(
                           'CHƯA CÓ DỮ LIỆU HỌC TẬP',

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: AppTypography.black,
                            letterSpacing: 2.0,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                           'Bạn chưa đăng ký khóa học nào. Hãy khám phá thư viện để bắt đầu.',

                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 40),
                        AppButton(
                            text: 'KHÁM PHÁ THƯ VIỆN', 
 
                          onPressed: () => context.go('/courses'),
                          isFullWidth: true,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final course = state.myCourses[index];
                      return EntryAnimation(
                        index: index,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                          child: EnrolledCourseCard(course: course),
                        ),
                      );
                    },
                    childCount: state.myCourses.length,
                  ),
                ),
              ),
            
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  Widget _buildContinueLearningCard(dynamic course) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: AppElevation.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.xs),
                  image: course.thumbnailUrl != null
                      ? DecorationImage(image: NetworkImage(course.thumbnailUrl!), fit: BoxFit.cover)
                      : null,
                  color: AppColors.grey100,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Next: Lesson ${course.completedLessons + 1}',
                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: course.progress,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                '${(course.progress * 100).toInt()}%',
                style: const TextStyle(fontSize: 12, fontWeight: AppTypography.bold),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          AppButton(
            text: 'CONTINUE',
            onPressed: () {},
            isFullWidth: true,
          ),
        ],
      ),
    );
  }
}
