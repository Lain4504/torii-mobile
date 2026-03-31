import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/checkout_models.dart';
import 'package:torii_app/data/models/academy_models.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.productId,
    this.classId,
    required this.mode,
  });

  final String productId;
  final String? classId;
  final String mode;

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final TextEditingController _couponController = TextEditingController();
  Timer? _couponDebounce;

  OrderPreviewModel? _preview;
  bool _previewing = false;
  bool _processing = false;
  String? _previewError;
  bool _scheduledInitialPreview = false;

  @override
  void dispose() {
    _couponDebounce?.cancel();
    _couponController.dispose();
    super.dispose();
  }

  void _schedulePreview(AcademyProductModel item) {
    _couponDebounce?.cancel();
    _couponDebounce = Timer(const Duration(milliseconds: 500), () => _previewNow(item));
  }

  Future<void> _previewNow(AcademyProductModel item) async {
    setState(() {
      _previewing = true;
      _previewError = null;
    });

    try {
      final repo = ref.read(academyRepositoryProvider);
      final result = await repo.previewOrder(
        productId: item.id,
        classId: widget.mode == 'LIVE' ? widget.classId : null,
        couponCode: _couponController.text,
      );
      if (!mounted) return;
      setState(() => _preview = result);
    } catch (e) {
      if (!mounted) return;
      setState(() => _previewError = e.toString());
    } finally {
      if (mounted) setState(() => _previewing = false);
    }
  }

  Future<void> _handleCheckout(AcademyProductModel item) async {
    setState(() => _processing = true);
    try {
      final repo = ref.read(academyRepositoryProvider);
      final result = await repo.checkoutOrder(
        productId: item.id,
        classId: widget.mode == 'LIVE' ? widget.classId : null,
        paymentMethod: 'PAYOS',
        couponCode: _couponController.text,
      );

      if (!mounted) return;
      if (result.paymentUrl != null) {
        context.push('/payment', extra: {
          'paymentUrl': result.paymentUrl,
          'orderCode': result.orderCode,
        });
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Thanh toán lỗi: $e')));
    } finally {
      if (mounted) setState(() => _processing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailAsync = widget.mode == 'LIVE'
        ? ref.watch(classCatalogLiveDetailProvider(widget.productId))
        : ref.watch(classCatalogVodDetailProvider(widget.productId));
    
    final theme = Theme.of(context);
    final bottomPadding = MediaQuery.of(context).padding.bottom + 16;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Thanh toán', style: TextStyle(fontWeight: FontWeight.w800)),
        centerTitle: true,
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
      ),
      body: detailAsync.when(
        data: (item) {
          if (item == null) return const Center(child: Text('Không tìm thấy sản phẩm'));
          if (!_scheduledInitialPreview) {
            _scheduledInitialPreview = true;
            WidgetsBinding.instance.addPostFrameCallback((_) => _previewNow(item));
          }

          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  _buildSummary(theme, item),
                  const SizedBox(height: 32),
                  const Text('Mã giảm giá', style: TextStyle(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 12),
                  _buildCouponInput(theme, item),
                  const SizedBox(height: 32),
                  _buildOrderTotals(theme, item),
                  if (_previewError != null) ...[
                    const SizedBox(height: 12),
                    Text(_previewError!, style: TextStyle(color: theme.colorScheme.error, fontSize: 13)),
                  ],
                ],
              ),
              _buildBottomBar(theme, item, bottomPadding),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }

  Widget _buildSummary(ThemeData theme, AcademyProductModel item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item.thumbnailUrl ?? '',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: theme.colorScheme.primaryContainer, child: const Icon(Icons.school)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15), maxLines: 2),
                const SizedBox(height: 8),
                Text(
                  NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0).format(item.displayPrice),
                  style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponInput(ThemeData theme, AcademyProductModel item) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _couponController,
            decoration: InputDecoration(
              hintText: 'Nhập mã giảm giá...',
              filled: true,
              fillColor: theme.colorScheme.surfaceVariant.withValues(alpha: 0.3),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
            onChanged: (_) => _schedulePreview(item),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderTotals(ThemeData theme, AcademyProductModel item) {
    final subTotal = _preview?.subTotal ?? item.displayPrice;
    final discount = _preview?.discountTotal ?? 0;
    final total = _preview?.grandTotal ?? subTotal;

    return Column(
      children: [
        _totalRow('Tạm tính', subTotal),
        if (discount > 0) _totalRow('Giảm giá', -discount, color: Colors.green),
        const Divider(height: 32),
        _totalRow('Tổng thanh toán', total, isBold: true, fontSize: 18),
      ],
    );
  }

  Widget _totalRow(String label, double value, {bool isBold = false, double fontSize = 14, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.w800 : FontWeight.normal)),
          Text(
            NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0).format(value),
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: fontSize, color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(ThemeData theme, AcademyProductModel item, double padding) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.fromLTRB(24, 16, 24, padding),
        decoration: BoxDecoration(color: theme.colorScheme.surface, boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -5))]),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: _processing || _previewing ? null : () => _handleCheckout(item),
            style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.primary, foregroundColor: theme.colorScheme.onPrimary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
            child: Text(_processing ? 'Đang xử lý...' : 'Thanh toán ngay', style: const TextStyle(fontWeight: FontWeight.w800)),
          ),
        ),
      ),
    );
  }
}
