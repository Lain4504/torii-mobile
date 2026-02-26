import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../gamification/providers/gamification_providers.dart'
    hide myCouponsProvider;
import '../../providers/coupon_providers.dart';
import '../../providers/payment_providers.dart';
import 'package:intl/intl.dart';

class WalletPage extends ConsumerStatefulWidget {
  const WalletPage({super.key});

  @override
  ConsumerState<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends ConsumerState<WalletPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Data will auto-fetch when providers are watched
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(gamificationProfileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xl,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: AppSpacing.md),
                            _buildBalanceSection(profileAsync),
                            const SizedBox(height: AppSpacing.xl),
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                        TabBar(
                          controller: _tabController,
                          labelColor: AppColors.primary,
                          unselectedLabelColor: AppColors.textSecondary,
                          indicatorColor: AppColors.primary,
                          indicatorWeight: 3,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: const TextStyle(
                            fontWeight: AppTypography.black,
                            fontSize: 10,
                            letterSpacing: 1.5,
                          ),
                          tabs: const [
                            Tab(text: 'LỊCH SỬ'),
                            Tab(text: 'MÃ GIẢM GIÁ'),
                          ],
                        ),
                      ),
                    ),
                  ],
                  body: TabBarView(
                    controller: _tabController,
                    children: [_buildHistoryTab(), _buildCouponsTab()],
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
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppButton(
            text: 'BACK',
            onPressed: () => context.pop(),
            type: AppButtonType.ghost,
          ),
          const Text(
            'WALLET & REWARDS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: AppTypography.black,
              letterSpacing: 3.0,
            ),
          ),
          const SizedBox(width: 48), // Spacer to balance back button
        ],
      ),
    );
  }

  Widget _buildBalanceSection(AsyncValue<dynamic> profileAsync) {
    return profileAsync.when(
      data: (profile) => Column(
        children: [
          _buildWalletCard(
            title: 'SỐ DƯ VÍ TORII',
            value: NumberFormat('#,###').format(profile.balance ?? 0),
            unit: 'COINS',
            icon: Icons.account_balance_wallet_rounded,
            color: AppColors.primary,
            onAction: () {
              // TODO: Navigation to Top-up if needed or just info
            },
            actionLabel: 'NẠP THÊM',
          ),
          const SizedBox(height: AppSpacing.md),
          _buildWalletCard(
            title: 'ĐIỂM THƯỞNG (XP)',
            value: NumberFormat('#,###').format(profile.points),
            unit: 'POINTS',
            icon: Icons.stars_rounded,
            color: Colors.orange,
            onAction: () => context.push('/rewards'),
            actionLabel: 'ĐỔI QUÀ',
          ),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Lỗi tải dữ liệu: $err')),
    );
  }

  Widget _buildWalletCard({
    required String title,
    required String value,
    required String unit,
    required IconData icon,
    required Color color,
    required VoidCallback onAction,
    required String actionLabel,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.grey200),
        boxShadow: AppElevation.softShadow,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: AppTypography.black,
                    letterSpacing: 1.0,
                    color: AppColors.textSecondary.withValues(alpha: 0.7),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: AppTypography.black,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      unit,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: AppTypography.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppButton(
            text: actionLabel,
            onPressed: onAction,
            type: AppButtonType.primary,
            size: AppButtonSize.small,
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryTab() {
    return Consumer(
      builder: (context, ref, child) {
        final pointsHistory = ref.watch(gamificationHistoryProvider);
        final coinsHistoryState = ref.watch(balanceHistoryProvider);

        if (coinsHistoryState.isLoading && coinsHistoryState.items.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return pointsHistory.when(
          data: (pointsData) {
            final allItems = <_HistoryItem>[
              ...pointsData.map(
                (e) => _HistoryItem(
                  title: e['description']?.toString() ?? 'Thưởng hoạt động',
                  subtitle: DateFormat('HH:mm, dd/MM/yyyy').format(
                    e['createdAt'] is DateTime
                        ? e['createdAt']
                        : DateTime.parse(e['createdAt'].toString()),
                  ),
                  amount: (e['amount'] as num?)?.toInt() ?? 0,
                  isPoints: true,
                  icon: Icons.stars_rounded,
                ),
              ),
              ...coinsHistoryState.items.map(
                (e) => _HistoryItem(
                  title: e['description']?.toString() ?? 'Giao dịch ví',
                  subtitle: DateFormat('HH:mm, dd/MM/yyyy').format(
                    e['createdAt'] is DateTime
                        ? e['createdAt']
                        : DateTime.parse(e['createdAt'].toString()),
                  ),
                  amount: (e['amount'] as num?)?.toInt() ?? 0,
                  isPoints: false,
                  icon: Icons.account_balance_wallet_rounded,
                ),
              ),
            ];

            if (allItems.isEmpty) {
              return const Center(
                child: Text(
                  'Chưa có lịch sử giao dịch',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              );
            }

            allItems.sort((a, b) => b.subtitle.compareTo(a.subtitle));

            return ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.xl),
              itemCount: allItems.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) {
                final item = allItems[index];
                final isPositive = item.amount > 0;

                return Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    border: Border.all(
                      color: AppColors.grey200.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color:
                              (item.isPoints
                                      ? Colors.orange
                                      : AppColors.primary)
                                  .withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          item.icon,
                          size: 20,
                          color: item.isPoints
                              ? Colors.orange
                              : AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontWeight: AppTypography.bold,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              item.subtitle,
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '${isPositive ? "+" : ""}${NumberFormat('#,###').format(item.amount)}',
                        style: TextStyle(
                          fontWeight: AppTypography.black,
                          fontSize: 15,
                          color: isPositive
                              ? Colors.green
                              : AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Lỗi: $err')),
        );
      },
    );
  }

  Widget _buildCouponsTab() {
    return Consumer(
      builder: (context, ref, child) {
        final couponsAsync = ref.watch(myCouponsProvider);

        return couponsAsync.when(
          data: (coupons) {
            if (coupons.isEmpty) {
              return const Center(child: Text('Bạn chưa có mã giảm giá nào'));
            }
            return ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.xl),
              itemCount: coupons.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) {
                final coupon = coupons[index];
                return Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.confirmation_number_rounded,
                        color: AppColors.primary,
                        size: 32,
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              coupon.code,
                              style: const TextStyle(
                                fontWeight: AppTypography.black,
                                fontSize: 16,
                                color: AppColors.primary,
                                letterSpacing: 1.5,
                              ),
                            ),
                            Text(
                              coupon.name,
                              style: const TextStyle(
                                fontWeight: AppTypography.bold,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Hết hạn: ${DateFormat('dd/MM/yyyy').format(coupon.validUntil)}',
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppButton(
                        text: 'SAO CHÉP',
                        onPressed: () {
                          // TODO: Clipboard functionality
                        },
                        size: AppButtonSize.small,
                        type: AppButtonType.outline,
                      ),
                    ],
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Lỗi: $err')),
        );
      },
    );
  }
}

class _HistoryItem {
  final String title;
  final String subtitle;
  final int amount;
  final bool isPoints;
  final IconData icon;

  _HistoryItem({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isPoints,
    required this.icon,
  });
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: AppColors.background, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
