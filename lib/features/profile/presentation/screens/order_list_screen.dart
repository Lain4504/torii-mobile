import 'package:flutter/material.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFE53935);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Đơn hàng của tôi', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
          bottom: TabBar(
            isScrollable: true,
            labelColor: primaryRed,
            unselectedLabelColor: Colors.grey,
            indicatorColor: primaryRed,
            tabs: const [
              Tab(text: 'Tất cả'),
              Tab(text: 'Đã thanh toán'),
              Tab(text: 'Đang xử lý'),
              Tab(text: 'Đã hủy'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrderList(primaryRed),
            _buildOrderList(primaryRed, filter: 'Paid'),
            _buildOrderList(primaryRed, filter: 'Processing'),
            _buildOrderList(primaryRed, filter: 'Cancelled'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(Color primaryRed, {String? filter}) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildOrderCard(context, primaryRed);
      },
    );
  }

  Widget _buildOrderCard(BuildContext context, Color primaryRed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[100]!),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('#TORII-10231', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(8)),
                child: const Text('Đã thanh toán', style: TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network('https://picsum.photos/100/100', width: 60, height: 60, fit: BoxFit.cover),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tiếng Nhật N5 từ cơ bản', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    const SizedBox(height: 4),
                    Text('Ngày mua: 12/03/2026', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('890.000đ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryRed)),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Xem chi tiết', style: TextStyle(color: Colors.black87, fontSize: 13)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
