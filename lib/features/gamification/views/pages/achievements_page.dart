import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLevelCard(),
                      const SizedBox(height: AppSpacing.xxl),
                      _buildSectionHeader('CURRENT BADGES'),
                      const SizedBox(height: AppSpacing.md),
                      _buildBadgesGrid(),
                      const SizedBox(height: AppSpacing.xxl),
                      GestureDetector(
                        onTap: () => context.push('/leaderboard'),
                        child: _buildSectionHeader('WEEKLY LEADERBOARD'),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      GestureDetector(
                        onTap: () => context.push('/leaderboard'),
                        child: _buildLeaderboard(),
                      ),
                       const SizedBox(height: AppSpacing.xxl),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppButton(
            text: 'BACK',
            onPressed: () => context.pop(),
            type: AppButtonType.ghost,
          ),
          const Text(
            'ACHIEVEMENTS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: AppTypography.black,
              letterSpacing: 3.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_rounded, size: 20, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary.withValues(alpha: 0.1), Colors.white.withValues(alpha: 0.5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.auto_awesome_rounded, size: 48, color: AppColors.primary),
          const SizedBox(height: 16),
          const Text(
            'LEVEL 12',
            style: TextStyle(
              fontSize: 10,
              fontWeight: AppTypography.black,
              letterSpacing: 2.0,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Master Learner',
            style: TextStyle(
              fontSize: 24,
              fontWeight: AppTypography.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('2,450 XP', style: TextStyle(fontWeight: AppTypography.bold)),
              Text('3,000 XP', style: TextStyle(color: AppColors.textTertiary)),
            ],
          ),
          const SizedBox(height: 8),
          const ProgressBar(progress: 0.8, height: 8),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: AppTypography.black,
        letterSpacing: 2.0,
        color: AppColors.textTertiary,
      ),
    );
  }

  Widget _buildBadgesGrid() {
    final badges = [
      {'icon': Icons.local_fire_department_rounded, 'color': const Color(0xFFE63946), 'label': '7 Day Streak'},
      {'icon': Icons.menu_book_rounded, 'color': Colors.blue, 'label': 'Bookworm'},
      {'icon': Icons.timer_rounded, 'color': Colors.orange, 'label': 'Early Bird'},
      {'icon': Icons.psychology_rounded, 'color': Colors.purple, 'label': 'Focus Zen'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: badges.length,
      itemBuilder: (context, index) {
        final badge = badges[index];
        return EntryAnimation(
          index: index,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(AppRadius.xl),
              border: Border.all(color: AppColors.grey300),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(badge['icon'] as IconData, color: badge['color'] as Color, size: 32),
                const SizedBox(height: 8),
                Text(
                  badge['label'] as String,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: AppTypography.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLeaderboard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Column(
        children: [
          _buildLeaderboardItem(1, 'Sarah Chen', '3,200 XP', true),
          _buildDivider(),
          _buildLeaderboardItem(2, 'Mike Ross', '2,950 XP', false),
          _buildDivider(),
          _buildLeaderboardItem(3, 'You', '2,450 XP', false, isMe: true),
          _buildDivider(),
          _buildLeaderboardItem(4, 'Amanda Lee', '2,100 XP', false),
        ],
      ),
    );
  }

  Widget _buildLeaderboardItem(int rank, String name, String xp, bool isFirst, {bool isMe = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: isMe ? AppColors.primary.withValues(alpha: 0.05) : Colors.transparent,
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              '#$rank',
              style: TextStyle(
                fontWeight: AppTypography.black,
                color: isFirst ? const Color(0xFFFFD700) : AppColors.textTertiary,
                fontSize: 14,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: AppColors.grey200,
            radius: 16,
            child: Text(name[0], style: const TextStyle(fontSize: 12, color: AppColors.textPrimary)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontWeight: isMe ? AppTypography.bold : AppTypography.medium,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Text(
            xp,
            style: const TextStyle(
              fontWeight: AppTypography.bold,
              color: AppColors.primary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: AppColors.grey300.withValues(alpha: 0.5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
