import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../providers/gamification_providers.dart';
import 'package:intl/intl.dart';

class RewardsPage extends ConsumerWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(gamificationProfileProvider);
    final rewardsAsync = ref.watch(gamificationRewardsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              _buildPointsHeader(profileAsync),
              Expanded(
                child: rewardsAsync.when(
                  data: (rewards) {
                    if (rewards.isEmpty) {
                      return const Center(child: Text('Hiện không có quà tặng nào khả dụng'));
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      itemCount: rewards.length,
                      separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.lg),
                      itemBuilder: (context, index) {
                        final reward = rewards[index];
                        return _buildRewardCard(context, ref, reward, profileAsync.asData?.value.points ?? 0);
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('Lỗi: $err')),
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
            'REWARDS SHOP',
            style: TextStyle(
              fontSize: 12,
              fontWeight: AppTypography.black,
              letterSpacing: 3.0,
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildPointsHeader(AsyncValue<dynamic> profileAsync) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: Colors.orange.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.stars_rounded, color: Colors.orange, size: 28),
          const SizedBox(width: AppSpacing.md),
          Column(
            children: [
              Text(
                'ĐIỂM HIỆN CÓ',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: AppTypography.black,
                  letterSpacing: 1.0,
                  color: Colors.orange.darken(0.2),
                ),
              ),
              profileAsync.when(
                data: (profile) => Text(
                  NumberFormat('#,###').format(profile.points),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: AppTypography.black,
                    color: AppColors.textPrimary,
                  ),
                ),
                loading: () => const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2)),
                error: (_, __) => const Text('---'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRewardCard(BuildContext context, WidgetRef ref, dynamic reward, int currentPoints) {
    final canAfford = currentPoints >= reward.points;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.grey200),
        boxShadow: AppElevation.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                child: const Icon(Icons.confirmation_number_outlined, color: AppColors.primary),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reward.name,
                      style: const TextStyle(fontWeight: AppTypography.black, fontSize: 16),
                    ),
                    if (reward.description != null)
                      Text(
                        reward.description!,
                        style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.stars_rounded, color: Colors.orange, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '${NumberFormat('#,###').format(reward.points)} POINTS',
                    style: const TextStyle(
                      fontWeight: AppTypography.black,
                      fontSize: 14,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              AppButton(
                text: 'ĐỔI QUÀ',
                onPressed: canAfford ? () => _handleRedeem(context, ref, reward) : null,
                type: canAfford ? AppButtonType.primary : AppButtonType.disabled,
                size: AppButtonSize.small,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleRedeem(BuildContext context, WidgetRef ref, dynamic reward) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xác nhận đổi quà'),
        content: Text('Bạn có chắc chắn muốn dùng ${reward.points} điểm để đổi lấy "${reward.name}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('HỦY')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('ĐỔI NGAY')),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final success = await ref.read(gamificationRepositoryProvider).redeemPoints(reward.id);
        if (success) {
          // Refresh data
          ref.invalidate(gamificationProfileProvider);
          ref.invalidate(gamificationHistoryProvider);
          ref.invalidate(myCouponsProvider);
          
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (context) => _RedeemSuccessDialog(rewardName: reward.name),
            );
          }
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Lỗi: $e')),
          );
        }
      }
    }
  }
}

class _RedeemSuccessDialog extends StatelessWidget {
  final String rewardName;

  const _RedeemSuccessDialog({required this.rewardName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.card)),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle_rounded, color: Colors.green, size: 64),
            ),
            const SizedBox(height: AppSpacing.xl),
            const Text(
              'ĐỔI QUÀ THÀNH CÔNG!',
              style: TextStyle(fontWeight: AppTypography.black, fontSize: 18, letterSpacing: 1.0),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Bạn đã đổi thành công "$rewardName". Mã giảm giá đã được thêm vào ví của bạn.',
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.xl),
            AppButton(
              text: 'XEM TRONG VÍ',
              onPressed: () {
                Navigator.pop(context);
                context.push('/wallet');
              },
              width: double.infinity,
            ),
            const SizedBox(height: AppSpacing.md),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ĐÓNG', style: TextStyle(color: AppColors.textTertiary, fontWeight: AppTypography.black)),
            ),
          ],
        ),
      ),
    );
  }
}

extension ColorExtension on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
