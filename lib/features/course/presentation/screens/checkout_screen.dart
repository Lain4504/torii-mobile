import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/checkout_models.dart';
import 'package:torii_app/data/models/live_offering_detail_model.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.offeringId,
    this.classId,
  });

  final String offeringId;
  final String? classId; // LIVE optional initial selection

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final TextEditingController _couponController = TextEditingController();
  Timer? _couponDebounce;

  String? _selectedClassId;
  OrderPreviewModel? _preview;
  bool _previewing = false;
  bool _processing = false;
  String? _previewError;

  @override
  void initState() {
    super.initState();
    _selectedClassId = widget.classId;
  }

  @override
  void dispose() {
    _couponDebounce?.cancel();
    _couponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final offeringAsync = ref.watch(liveOfferingDetailProvider(widget.offeringId));
    final theme = Theme.of(context);
    const bottomNavBarHeight = 64.0; // matches AppShell bottom bar
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final bottomSafePadding = bottomNavBarHeight + bottomInset + 12;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Thanh toán',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: AppTypography.bold,
            color: AppColors.textPrimary,
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: AppColors.textPrimary, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: offeringAsync.when(
        data: (detail) {
          if (detail == null) return const Center(child: Text('Không tìm thấy khóa học'));
          final offering = detail.offering;
          final isLive = offering.mode.toUpperCase() == 'LIVE';

          final classes = detail.classes.where((c) => c.isLive).toList();
          final selectedClass = isLive && _selectedClassId != null ? classes.where((c) => c.id == _selectedClassId).cast<LiveClassModel?>().firstOrNull : null;

          return Stack(
            children: [
              ListView(
                padding: EdgeInsets.fromLTRB(16, 12, 16, bottomSafePadding + 96),
                children: [
                  _CourseSummaryCard(
                    title: offering.title,
                    thumbnailUrl: offering.thumbnailUrl,
                    mode: offering.mode,
                    price: offering.displayPrice,
                    selectedClass: selectedClass,
                  ),
                  const SizedBox(height: 16),
                  if (isLive) ...[
                    Text(
                      'Chọn lớp học',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: AppTypography.bold,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (classes.isEmpty)
                      Text('Chưa có lớp LIVE khả dụng.', style: TextStyle(color: AppColors.grey700))
                    else
                      Column(
                        children: classes
                            .map(
                              (c) => _LiveClassRadioTile(
                                klass: c,
                                selected: _selectedClassId == c.id,
                                onTap: () {
                                  setState(() => _selectedClassId = c.id);
                                  _schedulePreview(detail);
                                },
                              ),
                            )
                            .toList(),
                      ),
                    const SizedBox(height: 16),
                  ],
                  Text(
                    'Mã giảm giá',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: AppTypography.bold,
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
                              borderSide:
                                  const BorderSide(color: AppColors.grey300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:
                                  const BorderSide(color: AppColors.grey300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:
                                  const BorderSide(color: AppColors.primary),
                            ),
                          ),
                          onChanged: (_) => _schedulePreview(detail),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: _previewing ? null : () => _previewNow(detail),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          side: const BorderSide(color: AppColors.borderLight),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text('Áp dụng', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _OrderTotalsCard(
                    basePrice: offering.displayPrice,
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
                    color: AppColors.surface,
                    boxShadow: [
                      BoxShadow(color: AppColors.textPrimary.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, -6)),
                    ],
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _processing
                          ? null
                          : () => _handleCheckout(detail),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textOnPrimary,
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
        error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: AppColors.error))),
      ),
    );
  }

  void _schedulePreview(LiveOfferingDetailModel detail) {
    _couponDebounce?.cancel();
    _couponDebounce = Timer(const Duration(milliseconds: 450), () => _previewNow(detail));
  }

  Future<void> _previewNow(LiveOfferingDetailModel detail) async {
    final offering = detail.offering;
    final isLive = offering.mode.toUpperCase() == 'LIVE';
    if (isLive && (_selectedClassId == null || _selectedClassId!.isEmpty)) {
      setState(() {
        _preview = null;
        _previewError = 'Vui lòng chọn lớp LIVE để xem tổng tiền.';
      });
      return;
    }

    setState(() {
      _previewing = true;
      _previewError = null;
    });

    try {
      final repo = ref.read(academyRepositoryProvider);
      final result = await repo.previewOrder(
        offeringId: widget.offeringId,
        classId: _selectedClassId,
        couponCode: _couponController.text,
      );
      if (!mounted) return;
      setState(() => _preview = result);
    } catch (e) {
      if (!mounted) return;
      setState(() => _previewError = e.toString());
    } finally {
      if (!mounted) return;
      setState(() => _previewing = false);
    }
  }

  Future<void> _handleCheckout(LiveOfferingDetailModel detail) async {
    final offering = detail.offering;
    final isLive = offering.mode.toUpperCase() == 'LIVE';
    if (isLive && (_selectedClassId == null || _selectedClassId!.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vui lòng chọn một lớp LIVE để thanh toán.')));
      return;
    }

    setState(() => _processing = true);
    try {
      final repo = ref.read(academyRepositoryProvider);
      final result = await repo.checkoutOrder(
        offeringId: widget.offeringId,
        classId: _selectedClassId,
        paymentMethod: 'PAYOS',
        couponCode: _couponController.text,
      );

      final paymentUrl = result.paymentUrl;
      final orderCode = result.orderCode;

      if (paymentUrl == null || paymentUrl.isEmpty || orderCode == null || orderCode.isEmpty) {
        throw Exception('Không nhận được paymentUrl hoặc orderCode.');
      }

      if (!mounted) return;
      context.push('/payment', extra: <String, dynamic>{'paymentUrl': paymentUrl, 'orderCode': orderCode});
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Thanh toán thất bại: $e')));
    } finally {
      if (!mounted) return;
      setState(() => _processing = false);
    }
  }
}

class _CourseSummaryCard extends StatelessWidget {
  const _CourseSummaryCard({
    required this.title,
    required this.thumbnailUrl,
    required this.mode,
    required this.price,
    required this.selectedClass,
  });

  final String title;
  final String? thumbnailUrl;
  final String mode;
  final double price;
  final LiveClassModel? selectedClass;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final priceStr = '${price.toInt().toString().replaceAllMapped(RegExp(r'(\\d{1,3})(?=(\\d{3})+(?!\\d))'), (m) => '${m[1]}.')}đ';
    final isLive = mode.toUpperCase() == 'LIVE';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
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
              errorBuilder: (_, __, ___) => Container(
                width: 84,
                height: 84,
                color: AppColors.grey200,
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
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isLive ? AppColors.error.withOpacity(0.08) : AppColors.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        isLive ? 'LIVE' : 'VOD',
                        style: TextStyle(
                          color: isLive ? AppColors.error : AppColors.primary,
                          fontWeight: FontWeight.w800,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      priceStr,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: AppTypography.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: AppTypography.extraBold,
                    letterSpacing: 0.1,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (selectedClass != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    'Lớp: ${selectedClass!.code.isNotEmpty ? selectedClass!.code : selectedClass!.name}',
                    style: TextStyle(color: AppColors.grey700, fontSize: 12, fontWeight: FontWeight.w600),
                  ),
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

    String fmt(double v) => '${v.toInt().toString().replaceAllMapped(RegExp(r'(\\d{1,3})(?=(\\d{3})+(?!\\d))'), (m) => '${m[1]}.')}đ';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chi tiết đơn hàng',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: AppTypography.bold,
              letterSpacing: 0.1,
            ),
          ),
          const SizedBox(height: 10),
          _row('Tạm tính', fmt(sub)),
          if (discount > 0) _row('Giảm giá', '-${fmt(discount)}', valueColor: AppColors.success),
          const Divider(height: 24),
          _row('Tổng cộng', fmt(total), isTotal: true),
          if (previewing) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
                const SizedBox(width: 10),
                Text('Đang tính lại...', style: TextStyle(color: AppColors.grey700, fontSize: 12)),
              ],
            ),
          ],
          if ((errorText ?? '').isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(errorText!, style: TextStyle(color: AppColors.error, fontSize: 12, height: 1.4)),
          ],
        ],
      ),
    );
  }

  Widget _row(String label, String value, {bool isTotal = false, Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: AppColors.grey700, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: isTotal ? 18 : 14, color: valueColor ?? AppColors.textPrimary)),
        ],
      ),
    );
  }
}

class _LiveClassRadioTile extends StatelessWidget {
  const _LiveClassRadioTile({
    required this.klass,
    required this.selected,
    required this.onTap,
  });

  final LiveClassModel klass;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderColor = selected ? AppColors.primary : AppColors.borderLight;
    final bgColor = selected ? AppColors.primary.withOpacity(0.04) : AppColors.surface;
    final title = klass.name.isNotEmpty ? klass.name : (klass.code.isNotEmpty ? klass.code : 'Lớp học');

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 22,
              height: 22,
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: selected ? AppColors.primary : AppColors.grey700, width: 2),
              ),
              child: selected
                  ? Center(child: Container(width: 10, height: 10, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)))
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                  const SizedBox(height: 4),
                  if (klass.code.isNotEmpty && klass.name.isNotEmpty)
                    Text('Mã lớp: ${klass.code}', style: TextStyle(color: AppColors.grey700, fontSize: 12, fontWeight: FontWeight.w600)),
                  if ((klass.instructorName ?? '').isNotEmpty) ...[
                    const SizedBox(height: 3),
                    Text('GV: ${klass.instructorName}', style: TextStyle(color: AppColors.grey700, fontSize: 12)),
                  ],
                ],
              ),
            ),
            if (klass.isEnrollableNow)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(999)),
                child: const Text('Mở đăng ký', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w800, fontSize: 10)),
              ),
          ],
        ),
      ),
    );
  }
}

extension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

