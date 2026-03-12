import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';
import 'package:torii_app/features/payment/models/order_model.dart';
import 'package:torii_app/features/payment/providers/payment_providers.dart';
import 'package:go_router/go_router.dart';

class OrderDetailScreen extends ConsumerStatefulWidget {
  final String orderId;

  const OrderDetailScreen({super.key, required this.orderId});

  @override
  ConsumerState<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends ConsumerState<OrderDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(paymentProvider.notifier).loadOrder(widget.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(paymentProvider);
    final order = state.order;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: SafeArea(
          child: order == null && state.isLoading
              ? const Center(child: AppLoading(text: 'Đang tải chi tiết đơn hàng...'))
              : order == null && state.error != null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.xl),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.error),
                            const SizedBox(height: AppSpacing.lg),
                            Text(
                              state.error!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: AppColors.textSecondary),
                            ),
                            const SizedBox(height: AppSpacing.xl),
                            AppButton(
                              text: 'THỬ LẠI',
                              onPressed: () =>
                                  ref.read(paymentProvider.notifier).loadOrder(widget.orderId),
                            ),
                          ],
                        ),
                      ),
                    )
                  : order == null
                      ? const Center(child: Text('Không tìm thấy đơn hàng'))
                      : _buildContent(context, order),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, Order order) {
    final dateFormatter = DateFormat('dd/MM/yyyy HH:mm');
    final currencyFormatter =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫');

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: AppColors.textPrimary),
            onPressed: () => context.pop(),
          ),
          title: const Text(
            'CHI TIẾT ĐƠN HÀNG',
            style: TextStyle(
              fontFamily: AppTypography.fontFamilySerif,
              fontWeight: AppTypography.black,
              fontSize: 18,
              letterSpacing: 2.0,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                // Order summary
                Container(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.95),
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.15),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.08),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'TỔNG QUAN',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: AppTypography.black,
                          letterSpacing: 2.0,
                          color: AppColors.textTertiary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Mã đơn hàng',
                              style:
                                  TextStyle(color: AppColors.textSecondary)),
                          Text(
                            order.id.substring(0, 8).toUpperCase(),
                            style: const TextStyle(
                                fontWeight: AppTypography.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Ngày tạo',
                              style:
                                  TextStyle(color: AppColors.textSecondary)),
                          Text(
                            dateFormatter.format(order.createdAt),
                            style:
                                const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Số tiền',
                              style:
                                  TextStyle(color: AppColors.textSecondary)),
                          Text(
                            currencyFormatter.format(order.amount),
                            style: const TextStyle(
                              fontWeight: AppTypography.black,
                              fontSize: 18,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Trạng thái',
                              style:
                                  TextStyle(color: AppColors.textSecondary)),
                          _buildStatusBadge(order.status),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),

                // Payment info (if available)
                if (order.paymentMethod != PaymentMethod.mock) ...[
                  _buildInfoTile(
                    'Phương thức thanh toán',
                    order.paymentMethod.toApiValue(),
                  ),
                  if (order.paymentGateway != null)
                    _buildInfoTile(
                      'Cổng thanh toán',
                      order.paymentGateway!.name.toUpperCase(),
                    ),
                  if (order.transactionId != null)
                    _buildInfoTile(
                      'Mã giao dịch',
                      order.transactionId!,
                    ),
                  if (order.gatewayTransactionId != null)
                    _buildInfoTile(
                      'Mã giao dịch cổng',
                      order.gatewayTransactionId!,
                    ),
                  const SizedBox(height: AppSpacing.xl),
                ],

                // Description / metadata
                if (order.description != null ||
                    (order.metadata.isNotEmpty)) ...[
                  const Text(
                    'CHI TIẾT KHÁC',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: AppTypography.black,
                      letterSpacing: 2.0,
                      color: AppColors.textTertiary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  if (order.description != null)
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: Text(
                        order.description!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  if (order.metadata.isNotEmpty)
                    Text(
                      order.metadata.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.grey300.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: AppTypography.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(OrderStatus status) {
    Color bgColor;
    Color textColor;
    String text;

    switch (status) {
      case OrderStatus.pending:
        bgColor = AppColors.warningLight;
        textColor = AppColors.warningDark;
        text = 'CHỜ THANH TOÁN';
        break;
      case OrderStatus.processing:
        bgColor = AppColors.primarySurface;
        textColor = AppColors.primary;
        text = 'ĐANG XỬ LÝ';
        break;
      case OrderStatus.completed:
        bgColor = AppColors.successLight;
        textColor = AppColors.successDark;
        text = 'HOÀN THÀNH';
        break;
      case OrderStatus.failed:
      case OrderStatus.refunded:
      case OrderStatus.cancelled:
        bgColor = AppColors.errorLight;
        textColor = AppColors.error;
        text = 'THẤT BẠI';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: textColor.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 10,
          fontWeight: AppTypography.black,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}

