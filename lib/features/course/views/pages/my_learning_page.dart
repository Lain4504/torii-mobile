import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../providers/my_learning_provider.dart';
import '../widgets/course_card.dart';

class MyLearningPage extends ConsumerWidget {
  const MyLearningPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myLearningProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
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
                'MY_LEARNING',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamilySerif,
                  fontWeight: AppTypography.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2.0,
                  color: AppColors.textPrimary,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () => context.push('/downloads'),
                  icon: const Icon(Icons.download_done_rounded, color: AppColors.textPrimary),
                  tooltip: 'Downloads',
                ),
                const SizedBox(width: AppSpacing.md),
              ],
            ),
            
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ENROLLED_COURSES',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: AppTypography.black,
                        letterSpacing: 3.0,
                        color: AppColors.primary.withValues(alpha: 0.5),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Active Lessons',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamilySerif,
                        fontSize: 32, 
                        fontWeight: AppTypography.bold,
                        letterSpacing: -1.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (state.isLoading)
              const SliverFillRemaining(
                child: Center(child: ZenLoading(text: 'Accessing Depositories...')),
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
                          'NO SYNCED PROTOCOLS',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: AppTypography.black,
                            letterSpacing: 2.0,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Your learning matrix is currently empty. Begin by enrolling in a curriculum.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 40),
                        ZenButton(
                          text: 'OPEN CATALOG', 
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
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final course = state.myCourses[index];
                      return EntryAnimation(
                        index: index,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                          child: CourseCard(course: course),
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
  }
}
