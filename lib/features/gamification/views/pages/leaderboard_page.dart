import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: Column(
          children: [
            // Header
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.textPrimary,
                        padding: const EdgeInsets.all(8),
                        minimumSize: const Size(40, 40),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'LEADERBOARD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: AppTypography.black,
                          letterSpacing: 2.0,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // Spacer for balance
                  ],
                ),
              ),
            ),

            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppRadius.xs),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppRadius.xs - 2),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: AppColors.white,
                  unselectedLabelColor: AppColors.textTertiary,
                  labelStyle: const TextStyle(fontWeight: AppTypography.bold, fontSize: 13),
                  unselectedLabelStyle: const TextStyle(fontWeight: AppTypography.medium, fontSize: 13),
                  dividerColor: Colors.transparent,
                  indicatorPadding: const EdgeInsets.all(4),
                  tabs: const [
                    Tab(text: 'WEEKLY'),
                    Tab(text: 'MONTHLY'),
                    Tab(text: 'ALL TIME'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            // Podium and List
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _LeaderboardListView(period: 'weekly'),
                  _LeaderboardListView(period: 'monthly'),
                  _LeaderboardListView(period: 'all_time'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LeaderboardListView extends StatelessWidget {
  final String period;
  const _LeaderboardListView({required this.period});

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final topThree = [
      _User(rank: 2, name: 'Yuki.Chan', points: 2840, avatarId: 1),
      _User(rank: 1, name: 'Kenji Master', points: 3150, avatarId: 2),
      _User(rank: 3, name: 'Hana JP', points: 2610, avatarId: 3),
    ];

    final others = List.generate(
      10,
      (index) => _User(
        rank: index + 4,
        name: 'Learner ${index + 4}',
        points: 2500 - (index * 150),
        avatarId: index + 4,
        isCurrentUser: index == 2, // Highlight rank 6 as current user
      ),
    );

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Podium section
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPodiumItem(topThree[0], 140, Colors.grey.shade300),
                const SizedBox(width: AppSpacing.md),
                _buildPodiumItem(topThree[1], 180, const Color(0xFFFFD700)), // Gold
                const SizedBox(width: AppSpacing.md),
                _buildPodiumItem(topThree[2], 120, const Color(0xFFCD7F32)), // Bronze
              ],
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),

        // Ranking List
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final user = others[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md),
                    decoration: BoxDecoration(
                      color: user.isCurrentUser
                          ? AppColors.primary.withValues(alpha: 0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(AppRadius.xs),
                      border: Border.all(
                        color: user.isCurrentUser ? AppColors.primary : AppColors.borderLight,
                        width: user.isCurrentUser ? 1.5 : 1.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 24,
                          child: Text(
                            '${user.rank}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: AppTypography.black,
                              color: user.isCurrentUser ? AppColors.primary : AppColors.textTertiary,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.grey200,
                          child: Icon(Icons.person, color: AppColors.textTertiary, size: 20),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(
                            user.name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: user.isCurrentUser ? AppTypography.black : AppTypography.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.bolt, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '${user.points}',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: AppTypography.black,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: others.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
      ],
    );
  }

  Widget _buildPodiumItem(_User user, double height, Color crownColor) {
    return Expanded(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: height,
                decoration: BoxDecoration(
                  color: user.rank == 1 ? AppColors.primary : AppColors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.xs)),
                  border: Border.all(color: AppColors.borderLight),
                  boxShadow: user.rank == 1 ? AppElevation.softShadow : null,
                ),
                child: Center(
                  child: Text(
                    '${user.rank}',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: AppTypography.black,
                      color: user.rank == 1 ? AppColors.white : AppColors.textTertiary,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -45,
                child: Column(
                  children: [
                    if (user.rank == 1)
                      Icon(Icons.workspace_premium_rounded, color: crownColor, size: 24),
                    const SizedBox(height: 4),
                    CircleAvatar(
                      radius: user.rank == 1 ? 24 : 20,
                      backgroundColor: AppColors.grey200,
                      child: Icon(Icons.person, color: AppColors.textTertiary, size: user.rank == 1 ? 28 : 24),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            user.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 11, fontWeight: AppTypography.bold),
          ),
          Text(
            '${user.points} XP',
            style: const TextStyle(fontSize: 10, fontWeight: AppTypography.black, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}

class _User {
  final int rank;
  final String name;
  final int points;
  final int avatarId;
  final bool isCurrentUser;

  _User({
    required this.rank,
    required this.name,
    required this.points,
    required this.avatarId,
    this.isCurrentUser = false,
  });
}
