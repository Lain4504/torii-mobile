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
  bool _needsPreview = false;
  bool _useWallet = false;

  // Gifting state
  bool _isGift = false;
  final TextEditingController _recipientEmailController = TextEditingController();
  final TextEditingController _giftMessageController = TextEditingController();
  GiftRecipientCheckResult? _giftCheckResult;
  bool _checkingGift = false;
  Timer? _giftDebounce;
  String? _lastCheckedEmail;
  String? _lastPreviewedEmail;

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
    if (_previewing) {
      _needsPreview = true;
      return;
    }
    _needsPreview = false;
    
    final targetEmail = _isGift ? _recipientEmailController.text.trim() : null;
    setState(() {
      _previewing = true;
      _previewError = null;
    });
    try {
      final repo = ref.read(academyRepositoryProvider);
      final bool hasEmail = targetEmail != null && targetEmail.isNotEmpty;
      final res = await repo.previewOrder(
        productId: item.id,
        mode: widget.mode,
        liveClassId: widget.mode == 'LIVE' ? widget.liveClassId : null,
        couponCode: _couponController.text,
        useWalletBalance: _useWallet,
        metadata: (_isGift && hasEmail) ? {
          'isGift': true,
          'recipientEmail': targetEmail,
          'giftMessage': _giftMessageController.text.trim(),
        } : null,
      );
      if (mounted) {
        setState(() {
          _preview = res;
          _lastPreviewedEmail = targetEmail;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _previewError = e.toString().replaceAll('Exception: ', '').replaceAll('Exception ', '');
          _lastPreviewedEmail = targetEmail;
        });
      }
    } finally {
      if (mounted) {
        setState(() => _previewing = false);
        if (_needsPreview) {
          _previewNow(item);
        }
      }
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
    
    // Always trigger preview concurrently so we get the correct order totals and preview errors
    _previewNow(item);
    
    // Call the check API. Note: The Torii backend has a bug where it hangs if the email is not registered.
    // The academy_repository has a strict 3-second timeout to handle this hang.
    // If it successfully returns (e.g. when the user already owns the course), we capture the result to block it.
    try {
      final repo = ref.read(academyRepositoryProvider);
      final res = await repo.checkGiftRecipient(
        recipientEmail: email,
        commerceTargetId: item.id,
      );
      if (mounted) {
        setState(() {
          _giftCheckResult = res;
          _checkingGift = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _checkingGift = false);
    }
  }

  Future<void> _handleCheckout(AcademyProductDetailModel item) async {
    setState(() => _processing = true);
    
    // Calculate final total including frontend-side wallet subtraction if necessary
    final user = ref.read(authStateProvider).asData?.value.user;
    final balance = ref.read(walletBalanceProvider).value ?? user?.walletBalance ?? 0;
    
    final subTotal = _preview?.subTotal ?? item.product.displayPrice;
    final discount = _preview?.discountTotal ?? 0;
    final backendWalletDiscount = _preview?.walletDiscount ?? 0;
    
    double effectiveTotal = _preview?.grandTotal ?? (subTotal - discount);
    
    if (_useWallet && backendWalletDiscount == 0 && balance > 0) {
      effectiveTotal = (effectiveTotal - balance).clamp(0, double.infinity);
    }
    
    String paymentMethod = 'PAYOS';
    if (_useWallet && effectiveTotal == 0) {
      paymentMethod = 'COIN';
    }

    try {
      final repo = ref.read(academyRepositoryProvider);
      final result = await repo.checkoutOrder(
        productId: item.id,
        mode: widget.mode,
        liveClassId: widget.mode == 'LIVE' ? widget.liveClassId : null,
        paymentMethod: paymentMethod,
        couponCode: _couponController.text,
        useWalletBalance: _useWallet,
        metadata: {
          'isGift': _isGift,
          if (_isGift) 'recipientEmail': _recipientEmailController.text.trim(),
          if (_isGift) 'giftMessage': _giftMessageController.text.trim(),
        },
      );

      if (mounted) setState(() => _processing = false);
      
      if (paymentMethod == 'COIN') {
        // If paid by coin, we expect immediate success
        // Refresh data sources that change after payment
        ref.invalidate(walletBalanceProvider);
        ref.invalidate(walletTransactionsProvider);
        ref.invalidate(myOrdersProvider);
        ref.invalidate(myEnrollmentsProvider);
        ref.invalidate(liveSchedulesProvider);
        
        if (result != null && result.orderCode != null) {
          context.replace('/payment-result/${result.orderCode}');
        } else {
           ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Thanh toán thành công!'), backgroundColor: Colors.green),
          );
          context.pop();
        }
        return;
      }
      
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
                  _buildWalletSection(theme, item),
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
                setState(() {
                  _isGift = val;
                  if (!val) {
                    _previewError = null;
                    _giftCheckResult = null;
                    _checkingGift = false;
                    _recipientEmailController.clear();
                    _giftMessageController.clear();
                  }
                });
                _previewNow(item);
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
          // The icon logic combines checkGiftResult and preview
          if (_previewError == null && 
              _recipientEmailController.text.trim() == _lastPreviewedEmail && 
              _lastPreviewedEmail != null && 
              _lastPreviewedEmail!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  (_giftCheckResult != null && _giftCheckResult!.isEnrolled) ? Icons.warning_amber_rounded : Icons.check_circle_outline,
                  size: 16,
                  color: (_giftCheckResult != null && _giftCheckResult!.isEnrolled) ? theme.colorScheme.error : Colors.green,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    (_giftCheckResult != null && _giftCheckResult!.isEnrolled) 
                        ? 'Người nhận đã sở hữu khóa học này'
                        : 'Người nhận hợp lệ',
                    style: TextStyle(
                      fontSize: 12, 
                      color: (_giftCheckResult != null && _giftCheckResult!.isEnrolled) ? theme.colorScheme.error : Colors.green,
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

  Widget _buildWalletSection(ThemeData theme, AcademyProductDetailModel item) {
    final user = ref.watch(authStateProvider).asData?.value.user;
    final walletBalanceAsync = ref.watch(walletBalanceProvider);
    final int balance = walletBalanceAsync.value ?? user?.walletBalance ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Dùng Xu để giảm giá', style: TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 2),
                Text(
                  'Số dư: ${NumberFormat.currency(locale: 'vi_VN', symbol: 'Xu', decimalDigits: 0).format(balance)}',
                  style: TextStyle(fontSize: 12, color: theme.colorScheme.primary, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Switch(
              value: _useWallet,
              onChanged: (val) {
                setState(() => _useWallet = val);
                _previewNow(item);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderTotals(ThemeData theme, AcademyProductDetailModel item) {
    final user = ref.read(authStateProvider).asData?.value.user;
    final balance = ref.read(walletBalanceProvider).value ?? user?.walletBalance ?? 0;

    double basePrice = item.product.displayPrice;
    if (widget.mode == 'LIVE' && widget.liveClassId != null) {
      final selectedClass = item.siblingClasses.where((c) => c.id == widget.liveClassId).firstOrNull;
      if (selectedClass != null && (selectedClass.price != null || selectedClass.discountPrice != null)) {
        basePrice = selectedClass.displayPrice;
      }
    }
    
    final subTotal = _preview?.subTotal ?? basePrice;
    final discount = _preview?.discountTotal ?? 0;
    double walletDiscount = _preview?.walletDiscount ?? 0;
    
    // Backend fallback: if backend didn't return a wallet discount but toggle is ON and balance > 0
    if (_useWallet && walletDiscount == 0 && balance > 0) {
      walletDiscount = (subTotal - discount).clamp(0, balance.toDouble());
    }

    final total = (_preview != null 
        ? (_useWallet && _preview!.walletDiscount == 0 ? (subTotal - discount - walletDiscount).clamp(0, double.infinity) : _preview!.grandTotal)
        : (subTotal - discount - (_useWallet ? walletDiscount : 0))).toDouble();

    return Column(
      children: [
        _totalRow('Tạm tính', subTotal),
        if (discount > 0) _totalRow('Giảm giá', -discount, color: Colors.green),
        if (walletDiscount > 0) _totalRow('Dùng Xu', -walletDiscount, color: theme.colorScheme.primary),
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
    final currentEmail = _recipientEmailController.text.trim();
    final isEmailValid = !_isGift || 
        (currentEmail.contains('@') && 
         currentEmail == _lastPreviewedEmail &&
         _previewError == null &&
         (_giftCheckResult == null || !_giftCheckResult!.isEnrolled));
    
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
