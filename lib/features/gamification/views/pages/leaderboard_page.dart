import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final topThree = [
      {'name': 'Nguyễn Văn A', 'xp': '15,200', 'rank': 2},
      {'name': 'Trần Thị B', 'xp': '18,500', 'rank': 1},
      {'name': 'Lê Văn C', 'xp': '12,900', 'rank': 3},
    ];

    final others = [
      {'name': 'Phạm Văn D', 'xp': '10,200', 'rank': 4},
      {'name': 'Hoàng Thị E', 'xp': '9,800', 'rank': 5},
      {'name': 'You', 'xp': '8,500', 'rank': 6, 'isMe': true},
      {'name': 'Vũ Văn G', 'xp': '7,200', 'rank': 7},
      {'name': 'Đặng Thị H', 'xp': '6,500', 'rank': 8},
      {'name': 'Bùi Văn I', 'xp': '5,800', 'rank': 9},
      {'name': 'Ngô Thị K', 'xp': '4,500', 'rank': 10},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildAppBar(context),
            SliverToBoxAdapter(
              child: _buildTopThree(topThree),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.xl),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final user = others[index];
                    return _LeaderboardItem(
                      rank: user['rank'] as int,
                      name: user['name'] as String,
                      xp: user['xp'] as String,
                      isMe: user['isMe'] as bool? ?? false,
                    );
                  },
                  childCount: others.length,
                ),
              ),
            ),
          ],
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

  Widget _buildTopThree(List<Map<String, dynamic>> users) {
    final first = users.firstWhere((u) => u['rank'] == 1);
    final second = users.firstWhere((u) => u['rank'] == 2);
    final third = users.firstWhere((u) => u['rank'] == 3);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _PodiumItem(name: second['name'] as String, xp: second['xp'] as String, rank: 2, height: 120),
          const SizedBox(width: 16),
          _PodiumItem(name: first['name'] as String, xp: first['xp'] as String, rank: 1, height: 160),
          const SizedBox(width: 16),
          _PodiumItem(name: third['name'] as String, xp: third['xp'] as String, rank: 3, height: 100),
        ],
      ),
    );
  }
}

class _PodiumItem extends StatelessWidget {
  final String name;
  final String xp;
  final int rank;
  final double height;

  const _PodiumItem({required this.name, required this.xp, required this.rank, required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: rank == 1 ? 40 : 30,
          backgroundColor: AppColors.grey200,
          child: Text(name[0], style: TextStyle(fontSize: rank == 1 ? 24 : 18, fontWeight: AppTypography.bold)),
        ),
        const SizedBox(height: 12),
        Text(name, style: const TextStyle(fontSize: 12, fontWeight: AppTypography.bold)),
        Text('$xp XP', style: const TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: AppTypography.bold)),
        const SizedBox(height: 12),
        Container(
          width: 60,
          height: height,
          decoration: BoxDecoration(
            color: rank == 1 ? AppColors.primary : AppColors.primary.withValues(alpha: 0.1),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              '#$rank',
              style: TextStyle(
                fontWeight: AppTypography.black,
                color: rank == 1 ? Colors.white : AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LeaderboardItem extends StatelessWidget {
  final int rank;
  final String name;
  final String xp;
  final bool isMe;

  const _LeaderboardItem({required this.rank, required this.name, required this.xp, required this.isMe});

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
              '#$rank',
              style: const TextStyle(fontWeight: AppTypography.black, color: AppColors.textTertiary),
            ),
          ),
          const CircleAvatar(radius: 16, backgroundColor: AppColors.grey200),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: TextStyle(fontWeight: isMe ? AppTypography.bold : AppTypography.medium),
            ),
          ),
          Text(
            '$xp XP',
            style: const TextStyle(fontWeight: AppTypography.bold, color: AppColors.primary, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
