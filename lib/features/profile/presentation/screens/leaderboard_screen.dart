import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/repositories/gamification_repository.dart';
import 'package:torii_app/data/models/gamification_models.dart';

class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  ConsumerState<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends ConsumerState<LeaderboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
    // Set initial index based on current provider state if needed, 
    // but here we just start at 0 (global)
    final currentType = ref.read(leaderboardTypeProvider);
    if (currentType == 'streak') _tabController.index = 1;
    else if (currentType == 'active') _tabController.index = 2;

    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) return;
    
    final types = ['global', 'streak', 'active'];
    final newType = types[_tabController.index];
    
    if (ref.read(leaderboardTypeProvider) != newType) {
      ref.read(leaderboardTypeProvider.notifier).state = newType;
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final leaderboardAsync = ref.watch(leaderboardProvider);
    final currentType = ref.watch(leaderboardTypeProvider);
    final theme = Theme.of(context);

    return Scaffold(
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: theme.colorScheme.primary,
          unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
          indicatorColor: theme.colorScheme.primary,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          tabs: const [
            Tab(text: 'Toàn cầu'),
            Tab(text: 'Chuỗi học'),
            Tab(text: 'Năng nổ'),
          ],
        ),
      ),
      body: leaderboardAsync.when(
        data: (data) {
          if (data == null || data.users.isEmpty) {
            return _buildEmptyLeaderboard(theme);
          }
          return _buildLeaderboardContent(theme, data, currentType);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) {
          debugPrint('Leaderboard Error: $err\n$stack');
          return _buildEmptyLeaderboard(theme);
        },
      ),
    );
  }

  Widget _buildEmptyLeaderboard(ThemeData theme) {
    return Column(
      children: [
        const Expanded(child: Center(child: Text('Chưa có dữ liệu xếp hạng'))),
        _buildFooterNote(theme),
      ],
    );
  }

  Widget _buildFooterNote(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          )
        ],
      ),
      child: SafeArea(
        top: false,
        child: Text(
          'Hoàn thành bài học để leo bảng xếp hạng!',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboardContent(ThemeData theme, LeaderboardData data, String type) {
    final top3 = data.users.take(3).toList();
    final rest = data.users.length > 3 ? data.users.sublist(3) : <LeaderboardUserModel>[];
    final currentUserId = data.currentUser?.id;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.05),
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (top3.length > 1) Expanded(child: _buildTopUser(theme, top3[1], 2, theme.colorScheme.onSurfaceVariant, type)),
              if (top3.isNotEmpty) Expanded(child: _buildTopUser(theme, top3[0], 1, Colors.amber, type)),
              if (top3.length > 2) Expanded(child: _buildTopUser(theme, top3[2], 3, Colors.brown, type)),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            itemCount: rest.length,
            itemBuilder: (context, index) {
              final u = rest[index];
              final rank = index + 4;
              final isMe = u.id == currentUserId;
              return _buildLeaderboardRow(theme, u, rank, isMe, type);
            },
          ),
        ),
        _buildFooterNote(theme),
      ],
    );
  }

  Widget _buildTopUser(ThemeData theme, LeaderboardUserModel u, int rank, Color color, String type) {
    double size = rank == 1 ? 80 : 65;
    final isStreak = type == 'streak';
    final valueText = isStreak 
        ? '${u.currentStreak ?? 0} ngày' 
        : '${u.xp} XP';

    return Column(
      children: [
        if (rank == 1) const Icon(Icons.workspace_premium, color: Colors.amber, size: 32),
        const SizedBox(height: 8),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle, 
                border: Border.all(color: color, width: 3),
              ),
              child: CircleAvatar(
                radius: size / 2, 
                backgroundImage: u.avatarUrl != null ? NetworkImage(u.avatarUrl!) : null, 
                child: u.avatarUrl == null ? const Icon(Icons.person) : null,
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, 10, 0),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: color, 
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '#$rank', 
                style: theme.textTheme.labelSmall?.copyWith(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          u.displayName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        Text(
          valueText, 
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.primary, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardRow(ThemeData theme, LeaderboardUserModel u, int rank, bool isMe, String type) {
    final isStreak = type == 'streak';
    final valueText = isStreak 
        ? '${u.currentStreak ?? 0} ngày' 
        : '${u.xp} XP';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isMe ? theme.colorScheme.primary.withValues(alpha: 0.1) : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isMe ? theme.colorScheme.primary.withValues(alpha: 0.2) : theme.colorScheme.outlineVariant,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30, 
            child: Text(
              '#$rank', 
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold, 
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          CircleAvatar(
            radius: 20, 
            backgroundImage: u.avatarUrl != null ? NetworkImage(u.avatarUrl!) : null, 
            child: u.avatarUrl == null ? const Icon(Icons.person) : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isMe ? 'Bạn' : u.displayName, 
                  style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Cấp độ ${u.level}', 
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          Text(
            valueText, 
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold, 
              color: isMe ? theme.colorScheme.primary : theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
