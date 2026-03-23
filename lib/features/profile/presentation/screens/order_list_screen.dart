import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';

class OrderListScreen extends ConsumerWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(myOrdersProvider);
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          title: Text(
            'Đơn hàng của tôi',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          backgroundColor: theme.colorScheme.surface,
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface), onPressed: () => Navigator.pop(context)),
          bottom: TabBar(
            isScrollable: true,
            labelColor: theme.colorScheme.primary,
            unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
            indicatorColor: theme.colorScheme.primary,
            tabs: const [
              Tab(text: 'Tất cả'),
              Tab(text: 'Đã thanh toán'),
              Tab(text: 'Đang xử lý'),
              Tab(text: 'Đã hủy'),
            ],
          ),
        ),
        body: ordersAsync.when(
          data: (paginated) {
            final all = paginated.data;
            final paid = all.where((o) => o.status.toUpperCase() == 'PAID').toList();
            final processing = all.where((o) => o.status.toUpperCase() == 'PROCESSING').toList();
            final cancelled = all.where((o) => o.status.toUpperCase() == 'CANCELLED').toList();
            return TabBarView(
              children: [
                _buildOrderList(context, all),
                _buildOrderList(context, paid),
                _buildOrderList(context, processing),
                _buildOrderList(context, cancelled),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: theme.colorScheme.error))),
        ),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, List<OrderModel> list) {
    if (list.isEmpty) return const Center(child: Text('Không có đơn hàng'));
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: list.length,
      itemBuilder: (context, index) => _buildOrderCard(context, list[index]),
    );
  }

  Widget _buildOrderCard(BuildContext context, OrderModel order) {
    final theme = Theme.of(context);
    final isPaid = order.status.toUpperCase() == 'PAID';
    final amountStr = '${order.amount.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}đ';
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor),
        boxShadow: [BoxShadow(color: theme.colorScheme.onSurface.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('#${order.code ?? order.id.substring(0, 8).toUpperCase()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: (isPaid ? Colors.green : theme.dividerColor).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(order.statusLabel, style: TextStyle(color: isPaid ? Colors.green : theme.colorScheme.onSurfaceVariant, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  order.courseThumbnail ?? 'https://picsum.photos/100/100',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(width: 60, height: 60, color: theme.dividerColor, child: const Icon(Icons.shopping_bag)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.courseName ?? 'Đơn hàng', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Text('Ngày mua: ${order.formattedDate}', style: TextStyle(color: theme.colorScheme.onSurfaceVariant, fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(amountStr, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: theme.colorScheme.primary)),
              OutlinedButton(
                onPressed: () => context.push('/order-detail/${order.id}'),
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                child: Text('Xem chi tiết', style: TextStyle(color: theme.colorScheme.onSurface, fontSize: 13)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
