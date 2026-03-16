import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';

class OrderDetailScreen extends ConsumerWidget {
  const OrderDetailScreen({super.key, required this.orderId});
  final String orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(orderDetailProvider(orderId));

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('Chi tiết đơn hàng', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary), onPressed: () => Navigator.pop(context)),
      ),
      body: orderAsync.when(
        data: (order) {
          if (order == null) return const Center(child: Text('Không tìm thấy đơn hàng'));
          return _buildContent(context, order);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: AppColors.error))),
      ),
    );
  }

  Widget _buildContent(BuildContext context, OrderModel order) {
    final isPaid = order.status.toUpperCase() == 'PAID';
    final amountStr = '${order.amount.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}đ';
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: (isPaid ? AppColors.success : AppColors.grey200).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(isPaid ? Icons.check_circle : Icons.schedule, color: isPaid ? AppColors.success : AppColors.textTertiary, size: 32),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.statusLabel, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isPaid ? AppColors.success : AppColors.textPrimary)),
                    const SizedBox(height: 4),
                    Text(isPaid ? 'Cảm ơn bạn đã tin tưởng Torii Nihongo!' : 'Đơn hàng đang được xử lý', style: TextStyle(color: isPaid ? AppColors.success : AppColors.grey700, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Text('Thông tin đơn hàng', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildInfoRow('Mã đơn hàng', '#${order.code ?? order.id.substring(0, 8)}'),
          _buildInfoRow('Ngày đặt hàng', order.formattedDate),
          _buildInfoRow('Phương thức', 'Thẻ ngân hàng'),
          _buildInfoRow('Trạng thái', order.statusLabel),
          const Divider(height: 48),
          const Text('Khóa học đã mua', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(border: Border.all(color: AppColors.grey200), borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    order.courseThumbnail ?? 'https://picsum.photos/200/200',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(width: 80, height: 80, color: AppColors.grey200, child: const Icon(Icons.school)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order.courseName ?? 'Khóa học', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(amountStr, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 48),
          const Text('Tổng kết đơn hàng', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildPriceRow('Tổng cộng', amountStr, isTotal: true),
          const SizedBox(height: 48),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: const Text('Tải hóa đơn', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => context.push('/my-courses'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textOnPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  child: const Text('Xem khóa học', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: AppColors.grey700)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: isTotal ? 16 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontSize: isTotal ? 20 : 14, fontWeight: FontWeight.bold, color: AppColors.primary)),
        ],
      ),
    );
  }
}
