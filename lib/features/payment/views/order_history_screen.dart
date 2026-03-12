import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';
import 'package:torii_app/features/payment/models/order_model.dart';
import 'package:torii_app/features/payment/providers/payment_providers.dart';

class OrderHistoryScreen extends ConsumerStatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  ConsumerState<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends ConsumerState<OrderHistoryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(orderListProvider.notifier).loadOrders(refresh: true);
    });
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      final state = ref.read(orderListProvider);
      if (!state.isLoading && state.hasMore) {
        ref.read(orderListProvider.notifier).loadOrders();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderListProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: state.isLoading && state.orders.isEmpty
                    ? const Center(child: AppLoading(text: 'Đang tải lịch sử...'))
                    : state.orders.isEmpty
                        ? _buildEmptyState()
                        : RefreshIndicator(
                            onRefresh: () => ref.read(orderListProvider.notifier).loadOrders(refresh: true),
                            child: ListView.separated(
                              controller: _scrollController,
                              padding: const EdgeInsets.all(AppSpacing.md),
                              itemCount: state.orders.length + (state.isLoading ? 1 : 0),
                              separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.md),
                              itemBuilder: (context, index) {
                                if (index == state.orders.length) {
                                  return const Padding(
                                    padding: EdgeInsets.all(AppSpacing.md),
                                    child: Center(child: CircularProgressIndicator()),
                                  );
                                }
                                return _OrderCard(order: state.orders[index]);
                              },
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
            onPressed: () => context.pop(),
          ),
          const SizedBox(width: AppSpacing.sm),
          const Text(
            'LỊCH SỬ THANH TOÁN',
            style: TextStyle(
              fontFamily: AppTypography.fontFamilySerif,
              fontWeight: AppTypography.black,
              fontSize: 18,
              letterSpacing: 2.0,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.receipt_long_rounded, size: 64, color: AppColors.grey300),
          const SizedBox(height: AppSpacing.lg),
          const Text(
            'Chưa có giao dịch nào',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              fontWeight: AppTypography.medium,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            text: 'TẢI LẠI',
            onPressed: () => ref.read(orderListProvider.notifier).loadOrders(refresh: true),
            type: AppButtonType.ghost,
          ),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final Order order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd/MM/yyyy HH:mm');
    final currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');

    return InkWell(
      onTap: () => context.push('/payment/order/${order.id}'),
      borderRadius: BorderRadius.circular(AppRadius.xl),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(color: AppColors.grey300.withValues(alpha: 0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateFormatter.format(order.createdAt),
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textTertiary,
                  ),
                ),
                _buildStatusBadge(order.status),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              order.description ?? 'Thanh toán đơn hàng',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: AppTypography.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              '#${order.id.substring(0, 8).toUpperCase()}',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
                fontFamily: 'Courier',
              ),
            ),
            const Divider(height: 24, thickness: 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _getPaymentMethodName(
                      order.paymentMethod, order.paymentGateway),
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  currencyFormatter.format(order.amount),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: AppTypography.black,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getPaymentMethodName(PaymentMethod method, PaymentGateway? gateway) {
    switch (method) {
      case PaymentMethod.creditCard:
        return 'Thẻ Tín Dụng';
      case PaymentMethod.bankTransfer:
        return 'Chuyển Khoản';
      case PaymentMethod.momo:
        return 'Ví MoMo';
      case PaymentMethod.zalopay:
        return 'Ví ZaloPay';
      case PaymentMethod.vnpay:
        return 'VNPAY';
      case PaymentMethod.payos:
        return 'PayOS';
      case PaymentMethod.sepay:
        return 'SePay';
      case PaymentMethod.mock:
        return 'Mock Payment';
    }
  }

  Widget _buildStatusBadge(OrderStatus status) {
    Color color;
    String text;

    switch (status) {
      case OrderStatus.pending:
        color = AppColors.warningDark;
        text = 'Chờ thanh toán';
        break;
      case OrderStatus.processing:
        color = AppColors.primary;
        text = 'Đang xử lý';
        break;
      case OrderStatus.completed:
        color = AppColors.successDark;
        text = 'Hoàn thành';
        break;
      case OrderStatus.failed:
      case OrderStatus.cancelled:
        color = AppColors.error;
        text = 'Thất bại';
        break;
      default:
        color = AppColors.textTertiary;
        text = status.name;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: AppTypography.bold,
        ),
      ),
    );
  }
}
