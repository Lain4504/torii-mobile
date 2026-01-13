import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/exam_model.dart';

/// Exam List Page - Premium Practice Interface
class ExamListPage extends ConsumerWidget {
  const ExamListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final exams = _getMockExams();

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
              expandedHeight: 140,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        'EXAM_CENTER',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: AppTypography.black,
                          letterSpacing: 3.0,
                          color: AppColors.primary.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Practice Exams',
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamilySerif,
                          fontWeight: AppTypography.bold,
                          fontSize: 32,
                          letterSpacing: -1.0,
                          fontStyle: FontStyle.italic,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.history_rounded, size: 20, color: AppColors.textPrimary),
                    ),
                  ),
                ),
              ],
            ),

            SliverToBoxAdapter(
              child: EntryAnimation(
                delay: const Duration(milliseconds: 200),
                child: _buildStatsOverview(context, isDark),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(AppSpacing.xl, AppSpacing.xl, AppSpacing.xl, AppSpacing.md),
                child: Row(
                  children: [
                    Container(width: 4, height: 16, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(width: 12),
                    const Text(
                      'AVAILABLE_EXAMS',
                      style: TextStyle(fontSize: 12, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textPrimary),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                      child: EntryAnimation(
                        index: index % 5,
                        verticalOffset: 20,
                        child: _ExamCard(exam: exams[index]),
                      ),
                    );
                  },
                  childCount: exams.length,
                ),
              ),
            ),
            
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsOverview(BuildContext context, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Container(
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
            _buildStatItem(Icons.verified_rounded, '12', 'SYNCED', AppColors.primary),
            _buildVerticalDivider(),
            _buildStatItem(Icons.analytics_rounded, '78%', 'NEURAL BAND', AppColors.accentDark),
            _buildVerticalDivider(),
            _buildStatItem(Icons.bolt_rounded, '45h', 'RUNTIME', AppColors.successDark),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalDivider() => Container(width: 1, height: 30, color: AppColors.borderLight.withOpacity(0.5));

  Widget _buildStatItem(IconData icon, String value, String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 20, color: color.withOpacity(0.7)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontWeight: AppTypography.black, fontSize: 18, letterSpacing: -0.5)),
          Text(label, style: const TextStyle(fontSize: 9, fontWeight: AppTypography.black, letterSpacing: 1.5, color: AppColors.textTertiary)),
        ],
      ),
    );
  }

  List<Exam> _getMockExams() {
    return [
      const Exam(
        id: '1',
        title: 'JLPT N5 Proficiency Grid',
        description: 'Comprehensive evaluation of standard grammar, lexicon, and synthesis.',
        level: 'N5',
        questionCount: 50,
        durationMinutes: 60,
        difficulty: 'Entry',
      ),
      const Exam(
        id: '2',
        title: 'JLPT N4 Technical Bench',
        description: 'Advanced elementary structures and kanji node recognition.',
        level: 'N4',
        questionCount: 60,
        durationMinutes: 75,
        difficulty: 'Elementary',
      ),
      const Exam(
        id: '3',
        title: 'Kanji Node Master - N5',
        description: 'Pure visual identification and phonetic mapping protocols.',
        level: 'N5',
        questionCount: 30,
        durationMinutes: 30,
        difficulty: 'Entry',
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
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(color: AppColors.borderLight.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.03),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _showStartDialog(context),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: AppColors.primarySurface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.primary.withOpacity(0.1)),
                    ),
                    child: Center(
                      child: Text(
                        exam.level,
                        style: const TextStyle(color: AppColors.primary, fontWeight: AppTypography.black, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exam.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: AppTypography.extraBold,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          exam.description,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textTertiary,
                            height: 1.4,
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            _DetailChip(icon: Icons.timer_rounded, label: exam.durationLabel),
                            const SizedBox(width: 16),
                            _DetailChip(icon: Icons.grid_view_rounded, label: '${exam.questionCount} POINTS'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded, color: AppColors.textTertiary, size: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showStartDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
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
        Icon(icon, size: 14, color: AppColors.primary.withOpacity(0.6)),
        const SizedBox(width: 6),
        Text(
          label.toUpperCase(),
          style: const TextStyle(fontSize: 10, color: AppColors.textTertiary, fontWeight: AppTypography.black, letterSpacing: 1.0),
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

    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.xxl)),
        border: Border(top: BorderSide(color: AppColors.borderLight.withOpacity(0.4))),
      ),
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.grey200, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 32),
          Text(
            exam.title.toUpperCase(),
            style: const TextStyle(fontSize: 12, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.primary),
          ),
          const SizedBox(height: 12),
          const Text(
            'Initialize Simulation?',
            style: TextStyle(fontFamily: AppTypography.fontFamilySerif, fontSize: 24, fontWeight: AppTypography.extraBold, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.background.withOpacity(0.5),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.borderLight.withOpacity(0.5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _SheetStat(label: 'LIMIT', value: exam.durationLabel, icon: Icons.timer_rounded),
                _SheetStat(label: 'BLOCKS', value: '${exam.questionCount}', icon: Icons.grid_view_rounded),
                _SheetStat(label: 'GRADE', value: exam.level, icon: Icons.school_rounded),
              ],
            ),
          ),
          const SizedBox(height: 40),
          ZenButton(
            text: 'COMMENCE EVALUATION',
            onPressed: () {
              Navigator.pop(context);
              context.push('/exams/take', extra: exam);
            },
            isFullWidth: true,
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'ABORT MISSION',
              style: TextStyle(fontSize: 12, fontWeight: AppTypography.black, letterSpacing: 1.0, color: AppColors.textTertiary),
            ),
          ),
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
        const SizedBox(height: 12),
        Text(value, style: const TextStyle(fontWeight: AppTypography.black, fontSize: 18, letterSpacing: -0.5)),
        Text(label, style: const TextStyle(fontSize: 9, fontWeight: AppTypography.black, letterSpacing: 1.5, color: AppColors.textTertiary)),
      ],
    );
  }
}
