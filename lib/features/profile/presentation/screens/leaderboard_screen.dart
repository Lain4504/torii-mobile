import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/repositories/gamification_repository.dart';
import 'package:torii_app/data/models/gamification_models.dart';

class LeaderboardScreen extends ConsumerWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaderboardAsync = ref.watch(leaderboardProvider);
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            'Bảng xếp hạng',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          backgroundColor: theme.colorScheme.surface,
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface), onPressed: () => Navigator.pop(context)),
          bottom: TabBar(
            labelColor: theme.colorScheme.primary,
            unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
            indicatorColor: theme.colorScheme.primary,
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
              return _buildEmptyLeaderboard(theme);
            }
            return _buildLeaderboardContent(theme, data);
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => _buildEmptyLeaderboard(theme),
        ),
      ),
    );
  }

  Widget _buildEmptyLeaderboard(ThemeData theme) {
    return Column(
      children: [
        const Expanded(child: Center(child: Text('Chưa có dữ liệu xếp hạng'))),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            boxShadow: [BoxShadow(color: theme.colorScheme.onSurface.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, -5))],
          ),
          child: Text(
            'Hoàn thành bài học để kiếm thêm XP và leo bảng xếp hạng!',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant, fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardContent(ThemeData theme, LeaderboardData data) {
    final top3 = data.users.take(3).toList();
    final rest = data.users.length > 3 ? data.users.sublist(3) : <LeaderboardUserModel>[];
    final currentUserId = data.currentUser?.id;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.05),
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (top3.length > 1) _buildTopUser(theme, top3[1], 2, theme.colorScheme.onSurfaceVariant),
              if (top3.isNotEmpty) _buildTopUser(theme, top3[0], 1, Colors.amber), // Gold color for #1
              if (top3.length > 2) _buildTopUser(theme, top3[2], 3, Colors.brown), // Bronze color for #3
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
              return _buildLeaderboardRow(theme, u, rank, isMe);
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            boxShadow: [BoxShadow(color: theme.colorScheme.onSurface.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, -5))],
          ),
          child: Text(
            'Hoàn thành bài học để kiếm thêm XP và leo bảng xếp hạng!',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant, fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }

  Widget _buildTopUser(ThemeData theme, LeaderboardUserModel u, int rank, Color color) {
    double size = rank == 1 ? 80 : 65;
    return Column(
      children: [
        if (rank == 1) Icon(Icons.workspace_premium, color: Colors.amber, size: 32),
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
              child: Text('#$rank', style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(u.displayName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        Text('${u.xp} XP', style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildLeaderboardRow(ThemeData theme, LeaderboardUserModel u, int rank, bool isMe) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isMe ? theme.colorScheme.primary.withValues(alpha: 0.1) : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isMe ? theme.colorScheme.primary.withValues(alpha: 0.2) : theme.colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          SizedBox(width: 30, child: Text('#$rank', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onSurfaceVariant))),
          CircleAvatar(radius: 20, backgroundImage: u.avatarUrl != null ? NetworkImage(u.avatarUrl!) : null, child: u.avatarUrl == null ? const Icon(Icons.person) : null),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isMe ? 'Bạn' : u.displayName, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                Text('Cấp độ ${u.level}', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
              ],
            ),
          ),
          Text('${u.xp} XP', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: isMe ? theme.colorScheme.primary : theme.colorScheme.onSurface)),
        ],
      ),
    );
  }
}
