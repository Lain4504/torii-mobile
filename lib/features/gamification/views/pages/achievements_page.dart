import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class AchievementsPage extends ConsumerWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'ACHIEVEMENTS',
                style: TextStyle(
                  fontWeight: AppTypography.black,
                  fontSize: 16,
                  letterSpacing: 2.0,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            
            // Stats Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    boxShadow: AppElevation.softShadow,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem('LEVEL', '12', Icons.trending_up_rounded),
                      _buildStatItem('TOTAL XP', '2,450', Icons.bolt_rounded),
                      _buildStatItem('STREAK', '7 DAYS', Icons.local_fire_department_rounded),
                    ],
                  ),
                ),
              ),
            ),

            // Badges Grid
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BADGES',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: AppTypography.black,
                        letterSpacing: 2.0,
                        color: AppColors.textTertiary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: AppSpacing.md,
                      crossAxisSpacing: AppSpacing.md,
                      childAspectRatio: 0.85,
                      children: [
                        _buildBadgeCard('FIRST COURSE', 'Complete your 1st course', Icons.school_rounded, true),
                        _buildBadgeCard('7 DAY STREAK', 'Study for 7 days straight', Icons.calendar_month_rounded, true),
                        _buildBadgeCard('N5 GRADUATE', 'Pass JLPT N5 mock exam', Icons.auto_awesome_rounded, false),
                        _buildBadgeCard('KANJI MASTER', 'Learn 100 Kanji characters', Icons.translate_rounded, false),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Milestones
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MILESTONES',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: AppTypography.black,
                        letterSpacing: 2.0,
                        color: AppColors.textTertiary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _buildMilestoneItem('Halfway to Level 13', 0.5),
                    _buildMilestoneItem('JLPT N4 Progress', 0.2),
                  ],
                ),
              ),
            ),
            
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.white.withValues(alpha: 0.7), size: 20),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: AppTypography.black,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: AppColors.white.withValues(alpha: 0.7),
            fontSize: 9,
            fontWeight: AppTypography.bold,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _buildBadgeCard(String title, String desc, IconData icon, bool isUnlocked) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(
          color: isUnlocked ? AppColors.primary.withValues(alpha: 0.2) : AppColors.borderLight,
          width: 2,
        ),
        boxShadow: isUnlocked ? AppElevation.softShadow : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isUnlocked ? AppColors.primary.withValues(alpha: 0.1) : AppColors.grey100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isUnlocked ? AppColors.primary : AppColors.textTertiary,
              size: 32,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: AppTypography.black,
              color: isUnlocked ? AppColors.textPrimary : AppColors.textTertiary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestoneItem(String title, double progress) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.xs),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 13),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(fontWeight: AppTypography.black, fontSize: 11, color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: AppColors.primary.withValues(alpha: 0.1),
              valueColor: const AlwaysStoppedAnimation(AppColors.primary),
              minHeight: 4,
            ),
          ),
        ],
      ),
    );
  }
}
