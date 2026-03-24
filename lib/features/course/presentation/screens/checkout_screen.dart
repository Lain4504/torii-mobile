import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/checkout_models.dart';
import 'package:torii_app/data/models/class_catalog_model.dart';
import 'package:torii_app/data/models/live_product_detail_model.dart';

/// Thanh toán theo class/product id và mode cụ thể.
class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key, required this.classId, required this.mode});

  final String classId;
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

  void _schedulePreview(ClassCatalogDetailModel detail) {
    _couponDebounce?.cancel();
    _couponDebounce = Timer(
      const Duration(milliseconds: 450),
      () => _previewNow(detail),
    );
  }

  Future<void> _previewNow(ClassCatalogDetailModel detail) async {
    final pid = detail.catalogProductId;
    if (pid.isEmpty) {
      setState(() {
        _preview = null;
        _previewError = 'Thiếu gói bán (catalogProductId).';
      });
      return;
    }

    final isLive = detail.isLive;
    if (isLive) {
      final lc = detail.liveClass;
      if (lc != null && lc.isLiveCapacityFull) {
        setState(() {
          _preview = null;
          _previewError = 'Lớp đã đầy. Không thể thanh toán.';
        });
        return;
      }
    }

    setState(() {
      _previewing = true;
      _previewError = null;
    });

    try {
      final repo = ref.read(academyRepositoryProvider);
      final result = await repo.previewOrder(
        productId: pid,
        classId: isLive ? widget.classId : null,
        couponCode: _couponController.text,
      );
      if (!mounted) return;
      setState(() => _preview = result);
    } catch (e) {
      if (!mounted) return;
      setState(() => _previewError = e.toString());
    } finally {
      if (mounted) {
        setState(() => _previewing = false);
      }
    }
  }

  Future<void> _handleCheckout(ClassCatalogDetailModel detail) async {
    final pid = detail.catalogProductId;
    if (pid.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Thiếu thông tin gói bán.')));
      return;
    }
    final isLive = detail.isLive;
    if (isLive) {
      final lc = detail.liveClass;
      if (lc != null && lc.isLiveCapacityFull) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Lớp đã đầy.')));
        return;
      }
    }

    setState(() => _processing = true);
    try {
      final repo = ref.read(academyRepositoryProvider);
      final result = await repo.checkoutOrder(
        productId: pid,
        classId: isLive ? widget.classId : null,
        paymentMethod: 'PAYOS',
        couponCode: _couponController.text,
      );

      final paymentUrl = result.paymentUrl;
      final orderCode = result.orderCode;

      if (paymentUrl == null ||
          paymentUrl.isEmpty ||
          orderCode == null ||
          orderCode.isEmpty) {
        throw Exception('Không nhận được paymentUrl hoặc orderCode.');
      }

      if (!mounted) return;
      context.push(
        '/payment',
        extra: <String, dynamic>{
          'paymentUrl': paymentUrl,
          'orderCode': orderCode,
        },
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Thanh toán thất bại: $e')));
    } finally {
      if (mounted) {
        setState(() => _processing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailAsync = widget.mode == 'LIVE'
        ? ref.watch(classCatalogLiveDetailProvider(widget.classId))
        : ref.watch(classCatalogVodDetailProvider(widget.classId));
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final bottomSafePadding = bottomInset + 12;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Thanh toán',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurface,
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: theme.colorScheme.onSurface,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return const Center(child: Text('Không tìm thấy lớp học'));
          }

          if (!_scheduledInitialPreview) {
            _scheduledInitialPreview = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                _previewNow(detail);
              }
            });
          }

          final isLive = detail.isLive;
          final live = detail.liveClass;
          final hasProduct = detail.catalogProductId.isNotEmpty;
          final canPayLive =
              hasProduct &&
              (!isLive || (live != null && !live.isLiveCapacityFull));
          final title = detail.item.name.isNotEmpty
              ? detail.item.name
              : (detail.item.profileTitle ?? 'Khóa học');
          final thumb = detail.item.thumbnailUrl;

          return Stack(
            children: [
              ListView(
                padding: EdgeInsets.fromLTRB(
                  16,
                  12,
                  16,
                  bottomSafePadding + 96,
                ),
                children: [
                  _CourseSummaryCard(
                    displayTitle: title,
                    liveContextLine: null,
                    marketingPackageLine: null,
                    thumbnailUrl: thumb,
                    mode: detail.item.mode,
                    price: detail.displayPrice,
                    selectedClass: live,
                  ),
                  const SizedBox(height: 16),
                  if (isLive && live != null) ...[
                    Text(
                      'Lớp đăng ký',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${live.name.isNotEmpty ? live.name : live.code} • ${live.code}',
                      style: TextStyle(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  if (!hasProduct) ...[
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.errorContainer.withValues(
                          alpha: 0.4,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: theme.colorScheme.error.withValues(alpha: 0.3),
                        ),
                      ),
                      child: const Text(
                        'Khóa học chưa gắn gói thanh toán. Vui lòng thử lại sau.',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                  Text(
                    'Mã giảm giá',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _couponController,
                          decoration: InputDecoration(
                            hintText: 'Nhập mã (nếu có)',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(
                                color: theme.colorScheme.outlineVariant,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(
                                color: theme.colorScheme.outlineVariant,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                          onChanged: (_) => _schedulePreview(detail),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: _previewing
                            ? null
                            : () => _previewNow(detail),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          side: BorderSide(
                            color: theme.colorScheme.outlineVariant,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Áp dụng',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _OrderTotalsCard(
                    basePrice: detail.displayPrice,
                    preview: _preview,
                    previewing: _previewing,
                    errorText: _previewError,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 12, 16, bottomSafePadding),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.05,
                        ),
                        blurRadius: 12,
                        offset: const Offset(0, -6),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _processing || !canPayLive
                          ? null
                          : () => _handleCheckout(detail),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        _processing ? 'Đang xử lý...' : 'Thanh toán ngay',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(
            'Lỗi: $e',
            style: TextStyle(color: theme.colorScheme.error),
          ),
        ),
      ),
    );
  }
}

class _CourseSummaryCard extends StatelessWidget {
  const _CourseSummaryCard({
    required this.displayTitle,
    this.liveContextLine,
    this.marketingPackageLine,
    required this.thumbnailUrl,
    required this.mode,
    required this.price,
    required this.selectedClass,
  });

  final String displayTitle;
  final String? liveContextLine;
  final String? marketingPackageLine;
  final String? thumbnailUrl;
  final String mode;
  final double price;
  final LiveClassModel? selectedClass;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final priceStr =
        '${price.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}đ';
    final isLive = mode.toUpperCase() == 'LIVE';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              thumbnailUrl ?? 'https://picsum.photos/seed/checkout/300/300',
              width: 84,
              height: 84,
              fit: BoxFit.cover,
              errorBuilder: (_, error, stackTrace) => Container(
                width: 84,
                height: 84,
                color: theme.colorScheme.surfaceContainerHighest,
                child: const Icon(Icons.school),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isLive
                            ? theme.colorScheme.error.withValues(alpha: 0.08)
                            : theme.colorScheme.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        isLive ? 'LIVE' : 'VOD',
                        style: TextStyle(
                          color: isLive
                              ? theme.colorScheme.error
                              : theme.colorScheme.primary,
                          fontWeight: FontWeight.w800,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      priceStr,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  displayTitle,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.1,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (liveContextLine != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    liveContextLine!,
                    style: TextStyle(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if (marketingPackageLine != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    marketingPackageLine!,
                    style: TextStyle(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 11,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if (selectedClass != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    'Lớp: ${selectedClass!.code.isNotEmpty ? selectedClass!.code : selectedClass!.name}',
                    style: TextStyle(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (selectedClass!.liveCapacitySubtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      selectedClass!.liveCapacitySubtitle!,
                      style: TextStyle(
                        color: selectedClass!.isLiveCapacityFull
                            ? theme.colorScheme.error
                            : theme.colorScheme.onSurfaceVariant,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderTotalsCard extends StatelessWidget {
  const _OrderTotalsCard({
    required this.basePrice,
    required this.preview,
    required this.previewing,
    required this.errorText,
  });

  final double basePrice;
  final OrderPreviewModel? preview;
  final bool previewing;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sub = preview?.subTotal ?? basePrice;
    final discount = preview?.discountTotal ?? 0;
    final total = preview?.grandTotal ?? sub;

    String fmt(double v) =>
        '${v.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}đ';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chi tiết đơn hàng',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.1,
            ),
          ),
          const SizedBox(height: 10),
          _row(context, 'Tạm tính', fmt(sub)),
          if (discount > 0)
            _row(
              context,
              'Giảm giá',
              '-${fmt(discount)}',
              valueColor: Colors.green,
            ),
          const Divider(height: 24),
          _row(context, 'Tổng cộng', fmt(total), isTotal: true),
          if (previewing) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: 10),
                Text(
                  'Đang tính lại...',
                  style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
          if ((errorText ?? '').isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              errorText!,
              style: TextStyle(
                color: theme.colorScheme.error,
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _row(
    BuildContext context,
    String label,
    String value, {
    bool isTotal = false,
    Color? valueColor,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isTotal ? 18 : 14,
              color: valueColor ?? theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
