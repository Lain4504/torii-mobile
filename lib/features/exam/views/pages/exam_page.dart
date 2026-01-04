import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/exam_providers.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

/// Exam Page - Minimalist Practice Test Interface
/// 
/// A clean, focused exam center for JLPT practice.
class ExamPage extends ConsumerWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(examListProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: theme.scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.pageHorizontal,
                  80,
                  AppSpacing.pageHorizontal,
                  0,
                ),
                child: Text(
                  'Practice Center',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: AppTypography.bold,
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.history_outlined),
                onPressed: () {
                  // TODO: Show exam history
                },
                tooltip: 'History',
              ),
            ],
          ),

          // Stats Overview
          SliverToBoxAdapter(
            child: _buildStatsOverview(context, isDark),
          ),

          // Section Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.pageHorizontal,
                AppSpacing.lg,
                AppSpacing.pageHorizontal,
                AppSpacing.md,
              ),
              child: Text(
                'Available Exams',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: AppTypography.semiBold,
                ),
              ),
            ),
          ),

          // Exam List
          if (state.isLoading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (state.error != null)
            SliverFillRemaining(
              child: _buildErrorState(context, ref, state.error!),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.pageHorizontal),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final exams = _getMockExams();
                    if (index >= exams.length) return null;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: _ExamCard(exam: exams[index]),
                    );
                  },
                  childCount: _getMockExams().length,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatsOverview(BuildContext context, bool isDark) {
    
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.pageHorizontal),
      child: MinimalCard(
        child: Row(
          children: [
            Expanded(
              child: _buildStatColumn(
                context,
                icon: Icons.assignment_outlined,
                value: '12',
                label: 'Completed',
                color: AppColors.primary,
              ),
            ),
            Container(
              width: 1,
              height: 48,
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
            Expanded(
              child: _buildStatColumn(
                context,
                icon: Icons.trending_up_outlined,
                value: '78%',
                label: 'Avg. Score',
                color: AppColors.success,
              ),
            ),
            Container(
              width: 1,
              height: 48,
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
            Expanded(
              child: _buildStatColumn(
                context,
                icon: Icons.timer_outlined,
                value: '4h',
                label: 'Study Time',
                color: AppColors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(
    BuildContext context, {
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: AppIconSize.md),
        const SizedBox(height: AppSpacing.sm),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: AppTypography.bold,
          ),
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              error,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            OutlinedButton(
              onPressed: () => ref.read(examListProvider.notifier).loadExams(),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  List<_ExamData> _getMockExams() {
    return [
      _ExamData(
        id: '1',
        title: 'JLPT N5 Mock Test',
        description: 'Basic vocabulary, grammar, and reading',
        level: 'N5',
        questionCount: 50,
        duration: '60 min',
        difficulty: 'Beginner',
      ),
      _ExamData(
        id: '2',
        title: 'JLPT N4 Mock Test',
        description: 'Elementary vocabulary, grammar, and reading',
        level: 'N4',
        questionCount: 60,
        duration: '75 min',
        difficulty: 'Elementary',
      ),
      _ExamData(
        id: '3',
        title: 'Kanji Practice - N5',
        description: 'Practice writing and reading N5 kanji',
        level: 'N5',
        questionCount: 30,
        duration: '30 min',
        difficulty: 'Beginner',
      ),
      _ExamData(
        id: '4',
        title: 'Grammar Drill - Particles',
        description: 'Master Japanese particles usage',
        level: 'N5',
        questionCount: 25,
        duration: '20 min',
        difficulty: 'Beginner',
      ),
      _ExamData(
        id: '5',
        title: 'Listening Practice',
        description: 'Improve your listening comprehension',
        level: 'N4',
        questionCount: 20,
        duration: '40 min',
        difficulty: 'Elementary',
      ),
    ];
  }
}

/// Exam Card - Clean exam item display
class _ExamCard extends StatelessWidget {
  final _ExamData exam;

  const _ExamCard({required this.exam});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return MinimalCard(
      onTap: () {
        // TODO: Navigate to exam
        _showStartDialog(context);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Level Badge
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primarySurface,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Center(
              child: Text(
                exam.level,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exam.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: AppTypography.semiBold,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  exam.description,
                  style: theme.textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.sm),
                
                // Metadata
                Row(
                  children: [
                    _buildMeta(
                      Icons.quiz_outlined,
                      '${exam.questionCount} questions',
                    ),
                    const SizedBox(width: AppSpacing.md),
                    _buildMeta(
                      Icons.timer_outlined,
                      exam.duration,
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Arrow
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColors.textTertiary,
          ),
        ],
      ),
    );
  }

  Widget _buildMeta(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppColors.textTertiary),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textTertiary,
          ),
        ),
      ],
    );
  }

  void _showStartDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.grey300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            
            Text(
              exam.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: AppTypography.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.md),
            
            // Info cards
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _InfoChip(label: exam.level, icon: Icons.school_outlined),
                const SizedBox(width: AppSpacing.sm),
                _InfoChip(label: exam.duration, icon: Icons.timer_outlined),
                const SizedBox(width: AppSpacing.sm),
                _InfoChip(label: '${exam.questionCount}Q', icon: Icons.quiz_outlined),
              ],
            ),
            
            const SizedBox(height: AppSpacing.lg),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: Start exam
                },
                child: const Text('Start Exam'),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            const SizedBox(height: AppSpacing.md),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const _InfoChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.textSecondary),
          const SizedBox(width: AppSpacing.xs),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

/// Mock exam data
class _ExamData {
  final String id;
  final String title;
  final String description;
  final String level;
  final int questionCount;
  final String duration;
  final String difficulty;

  _ExamData({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.questionCount,
    required this.duration,
    required this.difficulty,
  });
}
