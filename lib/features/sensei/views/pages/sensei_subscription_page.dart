import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/providers/api_providers.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../features/auth/providers/auth_providers.dart';
import '../../../../features/auth/models/auth_state.dart';
import '../../models/sensei_subscription_models.dart';
import '../../providers/sensei_providers.dart';
import '../../providers/sensei_subscription_providers.dart';

class SenseiSubscriptionPage extends ConsumerStatefulWidget {
  const SenseiSubscriptionPage({super.key});

  @override
  ConsumerState<SenseiSubscriptionPage> createState() => _SenseiSubscriptionPageState();
}

class _SenseiSubscriptionPageState extends ConsumerState<SenseiSubscriptionPage> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final authAsync = ref.watch(authStateProvider);
    final plansAsync = ref.watch(senseiSubscriptionPlansProvider);
    final quotaAsync = ref.watch(senseiQuotaStatusProvider);

    return Stack(
      children: [
        authAsync.when(
          loading: () => Scaffold(
            appBar: AppBar(title: const Text('Gói AI Sensei')),
            body: const Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Scaffold(
            appBar: AppBar(title: const Text('Gói AI Sensei')),
            body: Center(child: Text('Lỗi đăng nhập: $e')),
          ),
          data: (authState) {
            if (authState.status != AuthStatus.authenticated || authState.user == null) {
              return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                appBar: AppBar(
                  title: const Text('Gói AI Sensei'),
                  centerTitle: true,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.lock_outline, size: 46, color: Theme.of(context).colorScheme.primary),
                      const SizedBox(height: 14),
                      const Text(
                        'Bạn cần đăng nhập để nâng cấp gói AI Sensei.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => context.go('/login'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: Theme.of(context).colorScheme.onPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text('Đi đến trang đăng nhập'),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }

            final theme = Theme.of(context);
            return Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 120,
                    floating: false,
                    pinned: true,
                    stretch: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        'Gói AI Sensei',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      centerTitle: true,
                      titlePadding: const EdgeInsets.only(bottom: 16),
                      background: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              theme.colorScheme.primaryContainer.withOpacity(0.4),
                              theme.colorScheme.surface,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      onPressed: () => context.pop(),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        _QuotaDisplayCard(quotaAsync: quotaAsync),
                        const SizedBox(height: 28),
                        Row(
                          children: [
                            const Icon(Icons.stars_rounded, color: Colors.orange, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              'Các gói cước hội viên',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w900,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        plansAsync.when(
                          loading: () => const Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          error: (e, _) => Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text('Lỗi tải gói: $e', textAlign: TextAlign.center),
                          ),
                          data: (plans) => Column(
                            children: plans.map((plan) {
                              final currentTier = quotaAsync.value?.tier ?? 'free';
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: _PlanCard(
                                  plan: plan,
                                  currentUserTier: currentTier,
                                  onUpgrade: (method) {
                                    debugPrint('SenseiSubscription: onUpgrade triggered with $method');
                                    // Give immediate feedback
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Bắt đầu xử lý đăng ký ($method)...'),
                                        duration: const Duration(milliseconds: 800),
                                      ),
                                    );
                                    
                                    Navigator.of(context).pop();
                                    return handleCheckout(
                                      context: context,
                                      plan: plan,
                                      paymentMethod: method,
                                    );
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        if (_isProcessing)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4),
              child: Center(
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(height: 20),
                        Text(
                          'Đang xử lý thanh toán...',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Vui lòng không thoát ứng dụng.',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Future<void> handleCheckout({
    required BuildContext context,
    required SenseiSubscriptionPlan plan,
    required String paymentMethod,
  }) async {
    debugPrint('SenseiSubscription: handleCheckout started');
    if (_isProcessing) return;
    setState(() => _isProcessing = true);
    try {
      final repo = ref.read(senseiRepositoryProvider);
      final isCoin = paymentMethod.toUpperCase() == 'COIN';
      
      debugPrint('SenseiSubscription: Calling repository checkout (method: $paymentMethod, useWallet: $isCoin)');
      final result = await repo.checkoutSubscriptionPlan(
        subscriptionPlanIds: [plan.id],
        paymentMethod: paymentMethod, // Use actual method (COIN or PAYOS)
        description: 'Đăng ký gói ${plan.name} - Mobile App',
        useWalletBalance: isCoin,
      );
      debugPrint('SenseiSubscription: Repository checkout success. paymentUrl: ${result.paymentUrl}');

      if (isCoin || result.paymentUrl == null) {
        // Immediate success (usually for COIN or 100% wallet discount)
        ref.invalidate(senseiQuotaStatusProvider);
        ref.invalidate(walletBalanceProvider);
        ref.invalidate(walletTransactionsProvider);
        ref.invalidate(senseiSubscriptionPlansProvider);
        
        if (!mounted) return;
        setState(() => _isProcessing = false);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Colors.green,
            content: Row(
              children: [
                const Icon(Icons.check_circle_rounded, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text('Nâng cấp thành công! Chào mừng bạn đến với ${plan.name}.'),
                ),
              ],
            ),
          ),
        );
        return;
      }

      if (mounted) setState(() => _isProcessing = false);
      final paymentUrl = result.paymentUrl ?? '';
      final orderCode = result.code ?? '';
      if (paymentUrl.isEmpty || orderCode.isEmpty) {
        throw Exception('Không nhận được thông tin thanh toán.');
      }

      if (!mounted) return;
      context.push(
        '/sensei/subscription/payment-webview',
        extra: <String, dynamic>{
          'paymentUrl': paymentUrl,
          'orderCode': orderCode,
        },
      );
    } catch (e) {
      debugPrint('SenseiSubscription: handleCheckout error: $e');
      if (mounted) setState(() => _isProcessing = false);
      final msg = e.toString().replaceFirst('Exception: ', '');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Theme.of(context).colorScheme.error,
          content: Row(
            children: [
              const Icon(Icons.error_outline_rounded, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(child: Text(msg)),
            ],
          ),
        ),
      );
    }
  }
}

class _QuotaDisplayCard extends StatelessWidget {
  const _QuotaDisplayCard({required this.quotaAsync});

  final AsyncValue<SenseiQuotaStatus> quotaAsync;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return quotaAsync.when(
      loading: () => _cardSkeleton(theme),
      error: (e, _) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.errorContainer.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: theme.colorScheme.error.withOpacity(0.2)),
        ),
        child: Text('Lỗi: $e', style: TextStyle(color: theme.colorScheme.error)),
      ),
      data: (q) {
        final isPlus = q.tier.toLowerCase().contains('plus');
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isPlus
                  ? [const Color(0xFF6366F1), const Color(0xFF8B5CF6)]
                  : [theme.colorScheme.surface, theme.colorScheme.surface],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isPlus ? Colors.white.withOpacity(0.2) : theme.colorScheme.outlineVariant,
            ),
            boxShadow: [
              BoxShadow(
                color: (isPlus ? const Color(0xFF6366F1) : theme.colorScheme.onSurface)
                    .withOpacity(isPlus ? 0.3 : 0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gói hiện tại',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: isPlus ? Colors.white.withOpacity(0.8) : theme.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        q.tier.toUpperCase(),
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: isPlus ? Colors.white : theme.colorScheme.primary,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  if (isPlus)
                    const Icon(Icons.auto_awesome, color: Colors.white, size: 32)
                  else
                    Icon(Icons.info_outline_rounded, color: theme.colorScheme.primary, size: 32),
                ],
              ),
              const SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: q.limit > 0 ? q.remaining / q.limit : 0,
                  backgroundColor: (isPlus ? Colors.black : theme.colorScheme.primary).withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(isPlus ? Colors.white : theme.colorScheme.primary),
                  minHeight: 12,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dung lượng sử dụng',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isPlus ? Colors.white.withOpacity(0.9) : theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${q.remaining}/${q.limit} lượt còn lại',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isPlus ? Colors.white : theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              if (q.resetAt != null) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: (isPlus ? Colors.black : theme.colorScheme.onSurface).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.refresh_rounded,
                        size: 14,
                        color: isPlus ? Colors.white.withOpacity(0.7) : theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Làm mới lúc: ${_formatDate(q.resetAt!)}',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: isPlus ? Colors.white.withOpacity(0.7) : theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.day}/${dt.month}/${dt.year} ${dt.hour}:${dt.minute.toString().padLeft(2, '0')}';
  }

  Widget _cardSkeleton(ThemeData theme) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}

class _PlanCard extends ConsumerWidget {
  const _PlanCard({
    required this.plan,
    required this.currentUserTier,
    required this.onUpgrade,
  });

  final SenseiSubscriptionPlan plan;
  final String currentUserTier;
  final Future<void> Function(String method) onUpgrade;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Pre-fetch wallet balance so it's ready when the payment sheet opens
    ref.watch(walletBalanceProvider);
    
    final theme = Theme.of(context);
    final isPlus = plan.code.toLowerCase().contains('plus');

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isPlus ? theme.colorScheme.primary.withOpacity(0.5) : theme.colorScheme.outlineVariant,
          width: isPlus ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isPlus)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              color: theme.colorScheme.primary,
              child: const Text(
                'PHỔ BIẾN NHẤT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        plan.name,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      '${plan.price > 0 ? _formatPrice(plan.price) : 'Miễn Phí'}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '${plan.aiTurns} lượt AI / ngày',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(height: 1),
                const SizedBox(height: 20),
                ...plan.features.map((f) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            size: 18,
                            color: isPlus ? theme.colorScheme.primary : Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              f,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: Builder(builder: (ctx) {
                    final isActive = plan.code.toLowerCase() == currentUserTier.toLowerCase();
                    final isFree = plan.code.toLowerCase().contains('free');

                    return ElevatedButton(
                      onPressed: isActive ? null : () => _showPaymentSheet(context, ref),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isActive
                            ? theme.colorScheme.surfaceVariant
                            : (plan.price > 0 ? theme.colorScheme.primary : theme.colorScheme.surfaceVariant),
                        foregroundColor: isActive
                            ? theme.colorScheme.onSurfaceVariant
                            : (plan.price > 0 ? theme.colorScheme.onPrimary : theme.colorScheme.onSurfaceVariant),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: Text(
                        isActive ? 'Đang sử dụng' : (plan.price > 0 ? 'Nâng cấp ngay' : 'Gói cơ bản'),
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatPrice(int price) {
    return '${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')} đ';
  }

  void _showPaymentSheet(BuildContext context, WidgetRef ref) {
    if (plan.price == 0) return;
    
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
        decoration: BoxDecoration(
          color: Theme.of(ctx).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(ctx).colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Thanh toán gói ${plan.name}',
              style: Theme.of(ctx).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            Text(
              'Chọn phương thức thanh toán phù hợp với bạn',
              style: Theme.of(ctx).textTheme.bodyMedium?.copyWith(color: Theme.of(ctx).colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 28),
            _PaymentButton(
              onPressed: () => onUpgrade('PAYOS'),
              icon: Icons.account_balance_rounded,
              label: 'Thẻ ngân hàng / Chuyển khoản',
              subtitle: 'Thanh toán qua PayOS',
              isPrimary: true,
            ),
            const SizedBox(height: 12),
            Builder(builder: (c) {
              final balanceAsync = ref.watch(walletBalanceProvider);
              final balance = balanceAsync.valueOrNull ?? 0;
              final canAfford = balance >= (plan.price);
              
              // Simplified check to avoid issues during loading
              return _PaymentButton(
                onPressed: () => onUpgrade('COIN'),
                icon: Icons.toll_rounded,
                label: 'Thanh toán bằng Xu',
                subtitle: balanceAsync.isLoading 
                    ? 'Đang kiểm tra số dư...'
                    : (canAfford
                        ? 'Số dư hiện tại: ${balance.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')} Xu'
                        : 'Số dư không đủ (${balance.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')} Xu)'),
                isPrimary: false,
                isEnabled: true, // Always enabled for interactive feedback
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _PaymentButton extends StatelessWidget {
  const _PaymentButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.subtitle,
    this.isPrimary = false,
    this.isEnabled = true,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final String label;
  final String subtitle;
  final bool isPrimary;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = isEnabled 
        ? (isPrimary ? theme.colorScheme.primaryContainer.withOpacity(0.3) : theme.colorScheme.surface)
        : theme.colorScheme.surfaceVariant.withOpacity(0.3);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(20),
        child: Opacity(
          opacity: isEnabled ? 1.0 : 0.6,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: effectiveColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isEnabled 
                    ? (isPrimary ? theme.colorScheme.primary.withOpacity(0.3) : theme.colorScheme.outlineVariant)
                    : theme.colorScheme.outlineVariant.withOpacity(0.5),
                width: isPrimary ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isEnabled 
                        ? (isPrimary ? theme.colorScheme.primary : theme.colorScheme.surfaceVariant)
                        : theme.colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: isPrimary ? theme.colorScheme.onPrimary : theme.colorScheme.onSurfaceVariant, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                      Text(subtitle, style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                    ],
                  ),
                ),
                if (isEnabled) Icon(Icons.chevron_right_rounded, color: theme.colorScheme.onSurfaceVariant),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
