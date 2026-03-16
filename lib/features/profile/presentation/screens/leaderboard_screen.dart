import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/repositories/gamification_repository.dart';
import 'package:torii_app/data/models/gamification_models.dart';

class LeaderboardScreen extends ConsumerWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaderboardAsync = ref.watch(leaderboardProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.surface,
        appBar: AppBar(
          title: const Text('Bảng xếp hạng', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
          backgroundColor: AppColors.surface,
          elevation: 0,
          leading: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary), onPressed: () => Navigator.pop(context)),
          bottom: const TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textTertiary,
            indicatorColor: AppColors.primary,
            tabs: [
              Tab(text: 'Tuần này'),
              Tab(text: 'Tháng này'),
              Tab(text: 'Toàn thời gian'),
            ],
          ),
        ),
        body: leaderboardAsync.when(
          data: (data) {
            if (data == null || data.users.isEmpty) {
              return _buildEmptyLeaderboard();
            }
            return _buildLeaderboardContent(data);
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => _buildEmptyLeaderboard(),
        ),
      ),
    );
  }

  Widget _buildEmptyLeaderboard() {
    return Column(
      children: [
        const Expanded(child: Center(child: Text('Chưa có dữ liệu xếp hạng'))),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            boxShadow: [BoxShadow(color: AppColors.textPrimary.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
          ),
          child: const Text(
            'Hoàn thành bài học để kiếm thêm XP và leo bảng xếp hạng!',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textTertiary, fontSize: 13, fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardContent(LeaderboardData data) {
    final top3 = data.users.take(3).toList();
    final rest = data.users.length > 3 ? data.users.sublist(3) : <LeaderboardUserModel>[];
    final currentUserId = data.currentUser?.id;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.05),
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (top3.length > 1) _buildTopUser(top3[1], 2, AppColors.textTertiary),
              if (top3.isNotEmpty) _buildTopUser(top3[0], 1, AppColors.accent),
              if (top3.length > 2) _buildTopUser(top3[2], 3, AppColors.detail),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            itemCount: rest.length,
            itemBuilder: (context, index) {
              final u = rest[index];
              final rank = index + 4;
              final isMe = u.id == currentUserId;
              return _buildLeaderboardRow(u, rank, isMe);
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            boxShadow: [BoxShadow(color: AppColors.textPrimary.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
          ),
          child: const Text(
            'Hoàn thành bài học để kiếm thêm XP và leo bảng xếp hạng!',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textTertiary, fontSize: 13, fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }

  Widget _buildTopUser(LeaderboardUserModel u, int rank, Color color) {
    double size = rank == 1 ? 80 : 65;
    return Column(
      children: [
        if (rank == 1) const Icon(Icons.workspace_premium, color: AppColors.accent, size: 32),
        const SizedBox(height: 8),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: color, width: 3)),
              child: CircleAvatar(radius: size / 2, backgroundImage: u.avatarUrl != null ? NetworkImage(u.avatarUrl!) : null, child: u.avatarUrl == null ? const Icon(Icons.person) : null),
            ),
            Container(
              transform: Matrix4.translationValues(0, 10, 0),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
              child: Text('#$rank', style: const TextStyle(color: AppColors.textOnPrimary, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(u.displayName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        Text('${u.xp} XP', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
      ],
    );
  }

  Widget _buildLeaderboardRow(LeaderboardUserModel u, int rank, bool isMe) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isMe ? AppColors.primary.withOpacity(0.1) : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isMe ? AppColors.primary.withOpacity(0.2) : AppColors.grey200),
      ),
      child: Row(
        children: [
          SizedBox(width: 30, child: Text('#$rank', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.grey700))),
          CircleAvatar(radius: 20, backgroundImage: u.avatarUrl != null ? NetworkImage(u.avatarUrl!) : null, child: u.avatarUrl == null ? const Icon(Icons.person) : null),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isMe ? 'Bạn' : u.displayName, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Cấp độ ${u.level}', style: TextStyle(color: AppColors.grey700, fontSize: 11)),
              ],
            ),
          ),
          Text('${u.xp} XP', style: TextStyle(fontWeight: FontWeight.bold, color: isMe ? AppColors.primary : AppColors.textPrimary)),
        ],
      ),
    );
  }
}
