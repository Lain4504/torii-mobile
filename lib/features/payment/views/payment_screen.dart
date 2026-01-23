import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';
import 'package:torii_app/features/payment/providers/payment_providers.dart';
import 'package:torii_app/features/payment/models/order_model.dart';
import 'package:torii_app/features/course/providers/my_learning_provider.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  final String courseId;
  final double amount;
  final String? courseTitle;

  const PaymentScreen({
    super.key,
    required this.courseId,
    required this.amount,
    this.courseTitle,
  });

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  Timer? _pollingTimer;
  bool _isPolling = false;

  @override
  void initState() {
    super.initState();
    // Delay order creation until after widget tree is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _createOrder();
    });
  }

  @override
  void dispose() {
    _pollingTimer?.cancel();
    super.dispose();
  }

  Future<void> _createOrder() async {
    await ref.read(paymentProvider.notifier).createOrder(
      courseId: widget.courseId,
      amount: widget.amount,
      description: widget.courseTitle ?? 'Thanh toán khóa học',
    );

    final order = ref.read(paymentProvider).order;
    if (order != null) {
      _startPolling(order.id);
    }
  }

  void _startPolling(String orderId) {
    if (_isPolling) return;
    
    setState(() => _isPolling = true);
    
    _pollingTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await ref.read(paymentProvider.notifier).checkOrderStatus(orderId);
      
      final order = ref.read(paymentProvider).order;
      if (order != null && order.isCompleted) {
        timer.cancel();
        setState(() => _isPolling = false);
        
        // Refresh my courses
        await ref.read(myLearningProvider.notifier).loadData();
        
        if (mounted) {
          context.pop(true); // Return success
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Thanh toán thành công! Khóa học đã được thêm vào My Learning.'),
              backgroundColor: AppColors.success,
            ),
          );
        }
      } else if (order != null && order.isFailed) {
        timer.cancel();
        setState(() => _isPolling = false);
      }
    });
  }

  void _cancelOrder() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hủy thanh toán'),
          content: const Text('Bạn có chắc chắn muốn hủy giao dịch này?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Không'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.pop(false);
              },
              child: const Text(
                'Hủy giao dịch',
                style: TextStyle(color: AppColors.error),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(paymentProvider);
    final order = state.order;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: SafeArea(
          child: state.isLoading && order == null
              ? const Center(child: ZenLoading(text: 'Đang tạo đơn hàng...'))
              : state.error != null && order == null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.error),
                          const SizedBox(height: 16),
                          Text(state.error!),
                          const SizedBox(height: 24),
                          ZenButton(
                            text: 'THỬ LẠI',
                            onPressed: () => _createOrder(),
                          ),
                        ],
                      ),
                    )
                  : order == null
                      ? const Center(child: Text('Không có thông tin đơn hàng'))
                      : _buildPaymentContent(context, order, state),
        ),
      ),
    );
  }

  Widget _buildPaymentContent(BuildContext context, Order order, PaymentState state) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
            onPressed: () => context.pop(),
          ),
          title: const Text(
            'THANH TOÁN',
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
            delegate: SliverChildListDelegate([
              // Order Info
              _buildOrderInfo(order),
              const SizedBox(height: AppSpacing.xl),

              // Payment Info
              if (order.accountNumber != null && order.accountName != null) ...[
                _buildPaymentInfo(context, order),
                const SizedBox(height: AppSpacing.xl),
              ],

              // QR Code
              if (order.qrCode != null) ...[
                _buildQRCode(order),
                const SizedBox(height: AppSpacing.xl),
              ],

              // Checkout URL (fallback if no QR code)
              if (order.qrCode == null && order.checkoutUrl != null) ...[
                _buildCheckoutUrl(order),
                const SizedBox(height: AppSpacing.xl),
              ],

              // Status Check
              if (_isPolling) ...[
                _buildStatusCheck(),
                const SizedBox(height: AppSpacing.xl),
              ],

              // Cancel Button
              ZenButton(
                text: 'HỦY GIAO DỊCH',
                onPressed: _cancelOrder,
                type: ZenButtonType.secondary,
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderInfo(Order order) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        // Enhanced glassmorphic effect
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
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
            'THÔNG TIN ĐƠN HÀNG',
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
              const Text('Mã đơn hàng:', style: TextStyle(color: AppColors.textSecondary)),
              Text(
                order.id.substring(0, 8).toUpperCase(),
                style: const TextStyle(fontWeight: AppTypography.bold),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Số tiền:', style: TextStyle(color: AppColors.textSecondary)),
              Text(
                '${order.amount.toStringAsFixed(0)} ${order.currency}',
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
              const Text('Trạng thái:', style: TextStyle(color: AppColors.textSecondary)),
              _buildStatusBadge(order.status),
            ],
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
      case OrderStatus.cancelled:
        bgColor = AppColors.errorLight;
        textColor = AppColors.error;
        text = 'THẤT BẠI';
        break;
      default:
        bgColor = AppColors.grey200;
        textColor = AppColors.textTertiary;
        text = status.name.toUpperCase();
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

  Widget _buildPaymentInfo(BuildContext context, Order order) {
    if (order.accountNumber == null || order.accountName == null) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.12),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with bank info - enhanced gradient
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.08),
                  AppColors.primaryLight.withValues(alpha: 0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                // Logo ngân hàng placeholder (có thể thêm sau nếu có API bank list)
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
                  ),
                  child: const Icon(Icons.account_balance, size: 30, color: AppColors.primary),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ngân hàng',
                        style: TextStyle(
                          fontWeight: AppTypography.bold,
                          fontSize: 14,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        order.accountName!,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          // Thông tin chuyển khoản
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Column(
              children: [
                _buildInfoRow('Số tài khoản', order.accountNumber!),
                _buildInfoRow('Số tiền chuyển khoản', '${order.amount.toStringAsFixed(0)} ${order.currency}'),
                _buildInfoRow('Nội dung chuyển khoản', order.description ?? order.id.substring(0, 8).toUpperCase()),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          // Notice
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.md, 0, AppSpacing.md, AppSpacing.md),
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.warningLight.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: AppColors.warningDark.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline_rounded, size: 18, color: AppColors.warningDark),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'Mở App Ngân hàng bất kỳ để quét mã VietQR hoặc chuyển khoản chính xác nội dung bên trên',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.warningDark,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return _CopyableInfoRow(label: label, value: value);
  }

  Widget _buildQRCode(Order order) {
    if (order.qrCode == null) {
      return const SizedBox.shrink();
    }

    return PaymentQRCard(
      qrData: order.qrCode!,
      title: 'QUÉT MÃ QR ĐỂ THANH TOÁN',
      subtitle: 'Sử dụng ứng dụng ngân hàng bất kỳ để quét mã QR và thanh toán',
      size: 250,
      animate: true,
    );
  }

  Widget _buildCheckoutUrl(Order order) {
    if (order.checkoutUrl == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          const Text(
            'THANH TOÁN QUA PAYOS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: AppTypography.black,
              letterSpacing: 2.0,
              color: AppColors.textTertiary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          ZenButton(
            text: 'MỞ TRANG THANH TOÁN',
            onPressed: () async {
              final checkoutUrl = order.checkoutUrl;
              if (checkoutUrl == null || checkoutUrl.isEmpty) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Không có liên kết thanh toán'),
                      backgroundColor: AppColors.error,
                    ),
                  );
                }
                return;
              }

              // Mở PayOS trong WebView
              final result = await context.push<bool>(
                '/payment/webview',
                extra: {
                  'checkoutUrl': checkoutUrl,
                  'orderId': order.id,
                },
              );

              // Nếu thanh toán thành công, refresh order status
              if (result == true && mounted) {
                await ref.read(paymentProvider.notifier).checkOrderStatus(order.id);
                final updatedOrder = ref.read(paymentProvider).order;
                if (updatedOrder != null && updatedOrder.isCompleted) {
                  // Refresh my courses
                  await ref.read(myLearningProvider.notifier).loadData();
                  if (mounted) {
                    context.pop(true); // Return success to course detail
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Thanh toán thành công! Khóa học đã được thêm vào My Learning.'),
                        backgroundColor: AppColors.success,
                      ),
                    );
                  }
                }
              }
            },
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Nhấn nút trên để mở trang thanh toán PayOS',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCheck() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.primarySurface.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            'Đang kiểm tra trạng thái thanh toán...',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

/// Copyable Info Row - Giống payos-flutter-demo với nút copy
class _CopyableInfoRow extends StatefulWidget {
  final String label;
  final String value;

  const _CopyableInfoRow({
    required this.label,
    required this.value,
  });

  @override
  State<_CopyableInfoRow> createState() => _CopyableInfoRowState();
}

class _CopyableInfoRowState extends State<_CopyableInfoRow> {
  bool _isCopied = false;

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.value));
    setState(() => _isCopied = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isCopied = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey300.withValues(alpha: 0.3),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.value,
                  style: const TextStyle(
                    fontWeight: AppTypography.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: _copyToClipboard,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                backgroundColor: _isCopied 
                    ? AppColors.successLight 
                    : AppColors.primarySurface,
                foregroundColor: _isCopied 
                    ? AppColors.successDark 
                    : AppColors.primary,
              ),
              child: _isCopied
                  ? const Icon(Icons.check, size: 18)
                  : const Text(
                      'Sao chép',
                      style: TextStyle(fontSize: 12),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
