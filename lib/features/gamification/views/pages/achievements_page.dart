import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../providers/gamification_providers.dart';
import '../../models/gamification_models.dart';

class AchievementsPage extends ConsumerWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(gamificationProfileProvider);
    final achievementsAsync = ref.watch(achievementsProvider);
    final leaderboardAsync = ref.watch(leaderboardProvider('global'));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(gamificationProfileProvider);
              ref.invalidate(achievementsProvider);
              ref.invalidate(leaderboardProvider('global'));
            },
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
                        profileAsync.when(
                          data: (profile) => _buildLevelCard(profile),
                          loading: () => const Center(child: CircularProgressIndicator()),
                          error: (err, _) => Text('Lỗi: $err'),
                        ),
                        const SizedBox(height: AppSpacing.xxl),
                        _buildSectionHeader('HUY HIỆU HIỆN TẠI'),
                        const SizedBox(height: AppSpacing.md),
                        achievementsAsync.when(
                          data: (achievements) => _buildBadgesGrid(achievements),
                          loading: () => const Center(child: CircularProgressIndicator()),
                          error: (err, _) => Text('Lỗi: $err'),
                        ),
                        const SizedBox(height: AppSpacing.xxl),
                        GestureDetector(
                          onTap: () => context.push('/leaderboard'),
                          child: _buildSectionHeader('BẢNG XẾP HẠNG TUẦN'),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        leaderboardAsync.when(
                          data: (response) => GestureDetector(
                            onTap: () => context.push('/leaderboard'),
                            child: _buildLeaderboard(response),
                          ),
                          loading: () => const Center(child: CircularProgressIndicator()),
                          error: (err, _) => Text('Lỗi: $err'),
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

  Widget _buildLevelCard(GamificationProfile profile) {
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
          Text(
            'LEVEL ${profile.level}',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: AppTypography.black,
              letterSpacing: 2.0,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Học Viên Tích Cực',
            style: TextStyle(
              fontSize: 24,
              fontWeight: AppTypography.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${profile.currentXp} XP', style: const TextStyle(fontWeight: AppTypography.bold)),
              Text('${profile.nextLevelXp} XP', style: const TextStyle(color: AppColors.textTertiary)),
            ],
          ),
          const SizedBox(height: 8),
          ProgressBar(progress: (profile.currentXp / profile.nextLevelXp).clamp(0.0, 1.0), height: 8),
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

  Widget _buildBadgesGrid(List<UserAchievement> achievements) {
    if (achievements.isEmpty) {
      return const Center(child: Text('Chưa có huy hiệu nào', style: TextStyle(color: AppColors.textTertiary)));
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        final userAch = achievements[index];
        final ach = userAch.achievement;
        
        return EntryAnimation(
          index: index,
          child: Container(
            decoration: BoxDecoration(
              color: userAch.isUnlocked 
                  ? Colors.white.withValues(alpha: 0.8)
                  : AppColors.grey100.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(AppRadius.xl),
              border: Border.all(
                color: userAch.isUnlocked ? AppColors.primary.withValues(alpha: 0.3) : AppColors.grey300
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _getAchievementIcon(ach.icon), 
                  color: userAch.isUnlocked ? AppColors.primary : AppColors.textTertiary, 
                  size: 32
                ),
                const SizedBox(height: 8),
                Text(
                  ach.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: AppTypography.bold,
                    color: userAch.isUnlocked ? AppColors.textPrimary : AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  IconData _getAchievementIcon(String iconName) {
    switch (iconName) {
      case 'Flame': return Icons.local_fire_department_rounded;
      case 'Calendar': return Icons.calendar_month_rounded;
      case 'TrendingUp': return Icons.trending_up_rounded;
      case 'Trophy': return Icons.emoji_events_rounded;
      case 'Star': return Icons.star_rounded;
      case 'BookOpen': return Icons.menu_book_rounded;
      case 'Target': return Icons.track_changes_rounded;
      case 'GraduationCap': return Icons.school_rounded;
      case 'Award': return Icons.workspace_premium_rounded;
      case 'Zap': return Icons.bolt_rounded;
      case 'Heart': return Icons.favorite_rounded;
      default: return Icons.stars_rounded;
    }
  }

  Widget _buildLeaderboard(LeaderboardResponse response) {
    final topThree = response.users.take(3).toList();
    final currentUserInTop = topThree.any((u) => u.id == response.currentUser?.id);
    
    // If user not in top 3, add them at the end for preview
    final previewUsers = [...topThree];
    if (!currentUserInTop && response.currentUser != null) {
      previewUsers.add(response.currentUser!);
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Column(
        children: previewUsers.asMap().entries.map((entry) {
          final idx = entry.key;
          final user = entry.value;
          final isLast = idx == previewUsers.length - 1;
          
          return Column(
            children: [
              _buildLeaderboardItem(
                user.rank, 
                user.displayName ?? '?', 
                '${user.xp} XP', 
                user.rank == 1, 
                isMe: user.id == response.currentUser?.id
              ),
              if (!isLast) _buildDivider(),
            ],
          );
        }).toList(),
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
