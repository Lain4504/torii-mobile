import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/exam_model.dart';

/// Exam List Page - Minimalist Practice Test Interface
class ExamListPage extends ConsumerWidget {
  const ExamListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Mock Exams if provider is empty (for demo)
    final exams = _getMockExams();

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
            expandedHeight: 120, // Taller header for Zen feel
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.pageHorizontal,
                  60,
                  AppSpacing.pageHorizontal,
                  0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Practice Center',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: AppTypography.bold,
                        color: theme.textTheme.titleLarge?.color,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Prepare for success',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.history_rounded),
                onPressed: () {},
                tooltip: 'History',
                color: AppColors.textSecondary,
              ),
            ],
          ),

          // Stats Overview (Optional, keeping it clean for now)
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
                  fontSize: 18,
                ),
              ),
            ),
          ),

          // Exam List
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.pageHorizontal),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: EntryAnimation(
                      index: index,
                      child: _ExamCard(exam: exams[index]),
                    ),
                  );
                },
                childCount: exams.length,
              ),
            ),
          ),
          
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }

  Widget _buildStatsOverview(BuildContext context, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
      child: MinimalCard(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: Row(
          children: [
            Expanded(
              child: _buildStatColumn(
                context,
                icon: Icons.check_circle_outline_rounded,
                value: '12',
                label: 'Passed',
                color: AppColors.primary,
              ),
            ),
            Container(
              width: 1,
              height: 40,
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
            Expanded(
              child: _buildStatColumn(
                context,
                icon: Icons.insert_chart_outlined_rounded,
                value: '78%',
                label: 'Avg. Score',
                color: AppColors.success,
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
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
        ),
      ],
    );
  }

  List<Exam> _getMockExams() {
    return [
      const Exam(
        id: '1',
        title: 'JLPT N5 Mock Test',
        description: 'Comprehensive test covering vocabulary, grammar, and reading.',
        level: 'N5',
        questionCount: 50,
        durationMinutes: 60,
        difficulty: 'Beginner',
      ),
      const Exam(
        id: '2',
        title: 'JLPT N4 Mock Test',
        description: 'Challenge your elementary skills with this full-length test.',
        level: 'N4',
        questionCount: 60,
        durationMinutes: 75,
        difficulty: 'Elementary',
      ),
      const Exam(
        id: '3',
        title: 'Kanji Mastery - N5',
        description: 'Focused practice on correct readings and stroke order identification.',
        level: 'N5',
        questionCount: 30,
        durationMinutes: 30,
        difficulty: 'Beginner',
      ),
      const Exam(
        id: '4',
        title: 'Grammar Particles',
        description: 'Deep dive into wa, ga, ni, de, and other essential particles.',
        level: 'N5',
        questionCount: 25,
        durationMinutes: 20,
        difficulty: 'Beginner',
      ),
    ];
  }
}

class _ExamCard extends StatelessWidget {
  final Exam exam;

  const _ExamCard({required this.exam});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MinimalCard(
      onTap: () => _showStartDialog(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Level Badge
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(
                color: isDark ? AppColors.borderDark : AppColors.borderLight,
              ),
            ),
            child: Center(
              child: Text(
                exam.level,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          
          // Info
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
                const SizedBox(height: 4),
                Text(
                  exam.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textTertiary,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.sm),
                
                // Metadata
                Row(
                  children: [
                    _DetailChip(icon: Icons.timer_outlined, label: exam.durationLabel),
                    const SizedBox(width: 12),
                    _DetailChip(icon: Icons.quiz_outlined, label: '${exam.questionCount} Qs'),
                  ],
                ),
              ],
            ),
          ),
          
          // Arrow
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 16),
            child: Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }

  void _showStartDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _StartExamSheet(exam: exam),
    );
  }
}

class _DetailChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _DetailChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textTertiary),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textTertiary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _StartExamSheet extends StatelessWidget {
  final Exam exam;

  const _StartExamSheet({required this.exam});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: isDark ? AppColors.grey700 : AppColors.grey300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          
          // Title
          Text(
            exam.title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: AppTypography.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Are you ready to start?',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          
          // Stats Row
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _SheetStat(label: 'Duration', value: exam.durationLabel, icon: Icons.timer),
                _SheetStat(label: 'Questions', value: '${exam.questionCount}', icon: Icons.quiz),
                _SheetStat(label: 'Level', value: exam.level, icon: Icons.school),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          
          // Buttons
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close sheet
                context.push('/exams/take', extra: exam);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Start Exam',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Maybe Later'),
          ),
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }
}

class _SheetStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _SheetStat({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.textTertiary),
        ),
      ],
    );
  }
}
