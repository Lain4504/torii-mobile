import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/checkout_models.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/data/models/academy_product_detail_model.dart';
import 'package:torii_app/data/models/live_product_detail_model.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.productId,
    this.liveClassId,
    required this.mode,
  });

  final String productId;
  final String? liveClassId;
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

  // Gifting state
  bool _isGift = false;
  final TextEditingController _recipientEmailController = TextEditingController();
  final TextEditingController _giftMessageController = TextEditingController();
  GiftRecipientCheckResult? _giftCheckResult;
  bool _checkingGift = false;
  Timer? _giftDebounce;
  String? _lastCheckedEmail;

  @override
  void dispose() {
    _couponDebounce?.cancel();
    _giftDebounce?.cancel();
    _couponController.dispose();
    _recipientEmailController.dispose();
    _giftMessageController.dispose();
    super.dispose();
  }

  void _schedulePreview(AcademyProductDetailModel item) {
    _couponDebounce?.cancel();
    _couponDebounce = Timer(const Duration(milliseconds: 500), () => _previewNow(item));
  }

  Future<void> _previewNow(AcademyProductDetailModel item) async {
    if (_previewing) return;
    setState(() {
      _previewing = true;
      _previewError = null;
    });
    try {
      final repo = ref.read(academyRepositoryProvider);
      final res = await repo.previewOrder(
        productId: item.id,
        mode: widget.mode,
        liveClassId: widget.mode == 'LIVE' ? widget.liveClassId : null,
        couponCode: _couponController.text,
        metadata: _isGift ? {
          'isGift': true,
          'recipientEmail': _recipientEmailController.text.trim(),
          'giftMessage': _giftMessageController.text.trim(),
        } : null,
      );
      if (mounted) setState(() => _preview = res);
    } catch (e) {
      if (mounted) setState(() => _previewError = e.toString());
    } finally {
      if (mounted) setState(() => _previewing = false);
    }
  }

  void _onRecipientEmailChanged(AcademyProductDetailModel item) {
    _giftCheckResult = null;
    _giftDebounce?.cancel();
    _lastCheckedEmail = null;
    final email = _recipientEmailController.text.trim().toLowerCase();
    
    if (email.isEmpty || !email.contains('@')) {
      if (mounted) setState(() => _checkingGift = false);
      return;
    }

    final currentUser = ref.read(authStateProvider).asData?.value.user;
    if (currentUser != null && email == currentUser.email.toLowerCase()) {
      if (mounted) {
        setState(() {
          _checkingGift = false;
          _giftCheckResult = GiftRecipientCheckResult(
            isEnrolled: true, 
            isRegistered: true,
            message: 'Bạn không thể tự tặng khóa học cho chính mình',
          );
        });
      }
      return;
    }
    
    
    _giftDebounce = Timer(const Duration(milliseconds: 1000), () => _checkRecipient(item));
  }

  Future<void> _checkRecipient(AcademyProductDetailModel item) async {
    final email = _recipientEmailController.text.trim().toLowerCase();
    if (email.isEmpty || email == _lastCheckedEmail) {
      if (mounted) setState(() => _checkingGift = false);
      return;
    }

    _lastCheckedEmail = email;
    if (mounted) setState(() => _checkingGift = true);
    
    try {
      final repo = ref.read(academyRepositoryProvider);
      final res = await repo.checkGiftRecipient(
        recipientEmail: email,
        courseId: item.id,
      );
      if (mounted) {
        setState(() {
          _giftCheckResult = res;
          _checkingGift = false;
        });
        // Trigger preview after gift check to update totals if needed
        _previewNow(item);
      }
    } catch (_) {
      if (mounted) setState(() => _checkingGift = false);
    }
  }

  Future<void> _handleCheckout(AcademyProductDetailModel item) async {
    setState(() => _processing = true);
    try {
      final repo = ref.read(academyRepositoryProvider);
      final result = await repo.checkoutOrder(
        productId: item.id,
        mode: widget.mode,
        liveClassId: widget.mode == 'LIVE' ? widget.liveClassId : null,
        paymentMethod: 'PAYOS',
        couponCode: _couponController.text,
        metadata: {
          'isGift': _isGift,
          if (_isGift) 'recipientEmail': _recipientEmailController.text.trim(),
          if (_isGift) 'giftMessage': _giftMessageController.text.trim(),
        },
      );

      if (mounted) setState(() => _processing = false);
      
      if (result != null && result.paymentUrl != null) {
        context.push('/payment', extra: {
          'paymentUrl': result.paymentUrl,
          'orderCode': result.orderCode,
        });
      } else if (result != null && result.orderCode != null) {
        context.replace('/payment-result/${result.orderCode}');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Không thể tạo liên kết thanh toán')),
        );
      }
    } catch (e) {
      if (mounted) setState(() => _processing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi: $e'),
          backgroundColor: AppColors.error,
        ),
      );
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
                  _buildGiftingSection(theme, item),
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

  Widget _buildGiftingSection(ThemeData theme, AcademyProductDetailModel item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Mua làm quà tặng', style: TextStyle(fontWeight: FontWeight.w800)),
            Switch(
              value: _isGift,
              onChanged: (val) {
                setState(() => _isGift = val);
                if (val) {
                  _previewNow(item);
                }
              },
            ),
          ],
        ),
        if (_isGift) ...[
          const SizedBox(height: 12),
          TextField(
            controller: _recipientEmailController,
            decoration: InputDecoration(
              hintText: 'Email người nhận...',
              filled: true,
              fillColor: theme.colorScheme.surfaceVariant.withValues(alpha: 0.3),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              prefixIcon: const Icon(Icons.email_outlined, size: 20),
              suffixIcon: _checkingGift ? const SizedBox(width: 20, height: 20, child: Padding(padding: EdgeInsets.all(12), child: CircularProgressIndicator(strokeWidth: 2))) : null,
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (_) => _onRecipientEmailChanged(item),
          ),
          if (_giftCheckResult != null && !_giftCheckResult!.hasError) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  (_giftCheckResult!.hasError || _giftCheckResult!.isEnrolled) ? Icons.warning_amber_rounded : Icons.check_circle_outline,
                  size: 16,
                  color: (_giftCheckResult!.hasError || _giftCheckResult!.isEnrolled) ? theme.colorScheme.error : Colors.green,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    _giftCheckResult!.message ?? (_giftCheckResult!.isEnrolled 
                        ? 'Người nhận đã sở hữu khóa học này'
                        : (_giftCheckResult!.isRegistered ? 'Người nhận đã có tài khoản Torii' : 'Người nhận chưa có tài khoản (Hệ thống sẽ tự động tạo)')),
                    style: TextStyle(
                      fontSize: 12, 
                      color: (_giftCheckResult!.hasError || _giftCheckResult!.isEnrolled) ? theme.colorScheme.error : Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          TextField(
            controller: _giftMessageController,
            decoration: InputDecoration(
              hintText: 'Lời nhắn gửi kèm (tùy chọn)...',
              filled: true,
              fillColor: theme.colorScheme.surfaceVariant.withValues(alpha: 0.3),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              prefixIcon: const Icon(Icons.chat_bubble_outline, size: 20),
            ),
            maxLines: 2,
            onChanged: (_) => _schedulePreview(item),
          ),
        ],
      ],
    );
  }

  Widget _buildSummary(ThemeData theme, AcademyProductDetailModel item) {
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
              item.product.thumbnailUrl ?? '',
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
                Builder(builder: (context) {
                  double displayPrice = item.product.displayPrice;
                  if (widget.mode == 'LIVE' && widget.liveClassId != null) {
                    final selectedClass = item.siblingClasses.where((c) => c.id == widget.liveClassId).firstOrNull;
                    if (selectedClass != null && (selectedClass.price != null || selectedClass.discountPrice != null)) {
                      displayPrice = selectedClass.displayPrice;
                    }
                  }
                  return Text(
                    NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0).format(displayPrice),
                    style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.w700),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponInput(ThemeData theme, AcademyProductDetailModel item) {
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

  Widget _buildOrderTotals(ThemeData theme, AcademyProductDetailModel item) {
    double basePrice = item.product.displayPrice;
    if (widget.mode == 'LIVE' && widget.liveClassId != null) {
      final selectedClass = item.siblingClasses.where((c) => c.id == widget.liveClassId).firstOrNull;
      if (selectedClass != null && (selectedClass.price != null || selectedClass.discountPrice != null)) {
        basePrice = selectedClass.displayPrice;
      }
    }
    
    final subTotal = _preview?.subTotal ?? basePrice;
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

  Widget _buildBottomBar(ThemeData theme, AcademyProductDetailModel item, double padding) {
    final isEmailValid = !_isGift || (_recipientEmailController.text.contains('@') && _giftCheckResult != null && !_giftCheckResult!.isEnrolled);
    
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.fromLTRB(24, 16, 24, padding),
        decoration: BoxDecoration(color: theme.colorScheme.surface, boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -5))]),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: (_processing || _previewing || !isEmailValid) ? null : () => _handleCheckout(item),
            style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.primary, foregroundColor: theme.colorScheme.onPrimary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
            child: Text(_processing ? 'Đang xử lý...' : 'Thanh toán ngay', style: const TextStyle(fontWeight: FontWeight.w800)),
          ),
        ),
      ),
    );
  }
}
