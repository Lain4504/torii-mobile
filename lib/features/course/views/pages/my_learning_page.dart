import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../providers/my_learning_provider.dart';
import '../widgets/course_card.dart';
import '../../../../core/widgets/zen_background.dart';
import '../../../../core/widgets/animations/entry_animation.dart';

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
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'NEURAL_DEPOSITORIES',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamilySerif,
                  fontWeight: AppTypography.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ENROLLED PROTOCOLS',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: AppTypography.black,
                        letterSpacing: 3.0,
                        color: AppColors.primary.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your Active Curriculums',
                      style: TextStyle(fontSize: 24, fontWeight: AppTypography.extraBold),
                    ),
                  ],
                ),
              ),
            ),

            if (state.isLoading)
              const SliverFillRemaining(child: Center(child: CircularProgressIndicator()))
            else if (state.myCourses.isEmpty)
              SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.auto_stories_rounded, size: 64, color: AppColors.grey300),
                      const SizedBox(height: 16),
                      const Text('No courses found', style: TextStyle(fontWeight: AppTypography.bold)),
                      const SizedBox(height: 24),
                      ZenButton(text: 'EXPLORE CATALOG', onPressed: () => Navigator.pop(context)),
                    ],
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
