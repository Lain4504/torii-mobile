import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../providers/gamification_providers.dart';
import '../../models/gamification_models.dart';

class LeaderboardPage extends ConsumerWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaderboardAsync = ref.watch(leaderboardProvider('global'));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: RefreshIndicator(
          onRefresh: () => ref.refresh(leaderboardProvider('global').future),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildAppBar(context),
              leaderboardAsync.when(
                data: (response) {
                  final users = response.users;
                  final topThree = users.take(3).toList();
                  final others = users.skip(3).toList();

                  return SliverList(
                    delegate: SliverChildListDelegate([
                      if (topThree.isNotEmpty)
                        _buildTopThree(topThree),
                      if (others.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.xl),
                          child: Column(
                            children: others.map((user) => _LeaderboardItem(
                              user: user,
                              isMe: user.id == response.currentUser?.id,
                            )).toList(),
                          ),
                        ),
                    ]),
                  );
                },
                loading: () => const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (err, _) => SliverFillRemaining(
                  child: Center(child: Text('Lỗi: $err')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const Text(
        'BẢNG XẾP HẠNG',
        style: TextStyle(
          fontSize: 12,
          fontWeight: AppTypography.black,
          letterSpacing: 2.0,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildTopThree(List<LeaderboardUser> users) {
    if (users.isEmpty) return const SizedBox.shrink();

    // Map by rank 1, 2, 3
    final first = users.firstWhere((u) => u.rank == 1, orElse: () => users[0]);
    final second = users.length > 1 ? users.firstWhere((u) => u.rank == 2, orElse: () => users[1]) : null;
    final third = users.length > 2 ? users.firstWhere((u) => u.rank == 3, orElse: () => users[2]) : null;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (second != null)
            _PodiumItem(user: second, height: 120),
          const SizedBox(width: 16),
          _PodiumItem(user: first, height: 160),
          const SizedBox(width: 16),
          if (third != null)
            _PodiumItem(user: third, height: 100),
        ],
      ),
    );
  }
}

class _PodiumItem extends StatelessWidget {
  final LeaderboardUser user;
  final double height;

  const _PodiumItem({required this.user, required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (user.avatarUrl != null)
           CircleAvatar(
             radius: user.rank == 1 ? 40 : 30,
             backgroundImage: NetworkImage(user.avatarUrl!),
           )
        else
          CircleAvatar(
            radius: user.rank == 1 ? 40 : 30,
            backgroundColor: AppColors.grey200,
            child: Text(user.displayName?[0] ?? '?', style: TextStyle(fontSize: user.rank == 1 ? 24 : 18, fontWeight: AppTypography.bold)),
          ),
        const SizedBox(height: 12),
        Text(user.displayName ?? '?', style: const TextStyle(fontSize: 12, fontWeight: AppTypography.bold)),
        Text('${user.xp} XP', style: const TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: AppTypography.bold)),
        const SizedBox(height: 12),
        Container(
          width: 60,
          height: height,
          decoration: BoxDecoration(
            color: user.rank == 1 ? AppColors.primary : AppColors.primary.withValues(alpha: 0.1),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              '#${user.rank}',
              style: TextStyle(
                fontWeight: AppTypography.black,
                color: user.rank == 1 ? Colors.white : AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LeaderboardItem extends StatelessWidget {
  final LeaderboardUser user;
  final bool isMe;

  const _LeaderboardItem({required this.user, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: isMe ? AppColors.primary.withValues(alpha: 0.05) : AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: isMe ? AppColors.primary.withValues(alpha: 0.3) : AppColors.grey200.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              '#${user.rank}',
              style: const TextStyle(fontWeight: AppTypography.black, color: AppColors.textTertiary),
            ),
          ),
          if (user.avatarUrl != null)
            CircleAvatar(radius: 16, backgroundImage: NetworkImage(user.avatarUrl!))
          else
            const CircleAvatar(radius: 16, backgroundColor: AppColors.grey200),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              user.displayName ?? '?',
              style: TextStyle(fontWeight: isMe ? AppTypography.bold : AppTypography.medium),
            ),
          ),
          Text(
            '${user.xp} XP',
            style: const TextStyle(fontWeight: AppTypography.bold, color: AppColors.primary, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
