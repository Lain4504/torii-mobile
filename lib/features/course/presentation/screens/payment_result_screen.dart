import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';

class PaymentResultScreen extends ConsumerWidget {
  const PaymentResultScreen({super.key, required this.orderCode});

  final String orderCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSummary = ref.watch(orderFulfillmentByCodeProvider(orderCode));
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(
          'Kết quả thanh toán',
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary), onPressed: () => context.go('/discovery')),
      ),
      body: asyncSummary.when(
        data: (summary) {
          if (summary == null) {
            return _buildEmpty(context, 'Không tìm thấy đơn hàng.');
          }

          final status = summary.status.toUpperCase();
          final isPaid = status == 'PAID';
          final amountStr = '${summary.grandTotal.toInt().toString().replaceAllMapped(RegExp(r'(\\d{1,3})(?=(\\d{3})+(?!\\d))'), (m) => '${m[1]}.')}đ';

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: (isPaid ? AppColors.success : AppColors.grey200).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Icon(isPaid ? Icons.check_circle : Icons.schedule, size: 34, color: isPaid ? AppColors.success : AppColors.textTertiary),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isPaid ? 'Thanh toán thành công' : 'Đang xử lý thanh toán',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isPaid ? AppColors.success : AppColors.textPrimary),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              isPaid ? 'Bạn có thể vào học ngay trong "Khóa học của tôi".' : 'Nếu vừa thanh toán xong, hãy đợi vài giây rồi thử tải lại.',
                              style: TextStyle(color: AppColors.grey700, fontSize: 12, height: 1.4),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                const Text('Thông tin đơn hàng', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                _row('Mã đơn', summary.code),
                _row('Trạng thái', summary.status),
                _row('Tổng tiền', amountStr),
                const SizedBox(height: 22),
                const Text('Nội dung', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ...summary.items.map(
                  (it) => Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.grey200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(it.productName, style: const TextStyle(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 4),
                        Text('Mã: ${it.productCode}', style: TextStyle(color: AppColors.grey700, fontSize: 12)),
                        if (it.missingClassIds.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Text('Đang cấp quyền lớp học...', style: TextStyle(color: AppColors.grey700, fontSize: 12)),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => ref.refresh(orderFulfillmentByCodeProvider(orderCode)),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Tải lại', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => context.push('/my-courses'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Vào học', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _buildEmpty(context, 'Lỗi: $e'),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: AppColors.grey700)),
          Flexible(child: Text(value, style: const TextStyle(fontWeight: FontWeight.w600), textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  Widget _buildEmpty(BuildContext context, String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.go('/discovery'),
              child: const Text('Quay lại'),
            ),
          ],
        ),
      ),
    );
  }
}

