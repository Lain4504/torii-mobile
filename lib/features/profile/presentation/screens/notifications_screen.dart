import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFE53935);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Thông báo', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Đánh dấu đã đọc', style: TextStyle(color: primaryRed, fontSize: 13)),
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            labelColor: primaryRed,
            unselectedLabelColor: Colors.grey,
            indicatorColor: primaryRed,
            tabs: [
              Tab(text: 'Tất cả'),
              Tab(text: 'Khóa học'),
              Tab(text: 'Hệ thống'),
              Tab(text: 'Lớp Live'),
            ],
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: 8,
          separatorBuilder: (_, __) => const Divider(height: 1, indent: 80),
          itemBuilder: (context, index) {
            bool isUnread = index < 2;
            return _buildNotificationItem(index, isUnread, primaryRed);
          },
        ),
      ),
    );
  }

  Widget _buildNotificationItem(int index, bool isUnread, Color primaryRed) {
    IconData icon;
    Color iconColor;
    String title;
    String desc;

    if (index % 3 == 0) {
      icon = Icons.book_rounded;
      iconColor = Colors.blue;
      title = 'Bài học mới đã được mở';
      desc = 'Bài Hiragana nâng cao đã được mở trong khóa học N5 của bạn.';
    } else if (index % 3 == 1) {
      icon = Icons.videocam_rounded;
      iconColor = primaryRed;
      title = 'Lớp học live sắp bắt đầu';
      desc = 'Lớp Kaiwa N3 với Sensei Tanaka sẽ bắt đầu sau 15 phút nữa.';
    } else {
      icon = Icons.workspace_premium_rounded;
      iconColor = Colors.amber;
      title = 'Chúc mừng! Bạn đã lên hạng';
      desc = 'Bạn hiện đang đứng thứ #4 trên bảng xếp hạng tuần này.';
    }

    return Container(
      padding: const EdgeInsets.all(16),
      color: isUnread ? primaryRed.withOpacity(0.03) : Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: iconColor.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              if (isUnread)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(color: primaryRed, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: isUnread ? FontWeight.bold : FontWeight.w600, fontSize: 15)),
                const SizedBox(height: 4),
                Text(desc, style: TextStyle(color: Colors.grey[600], fontSize: 13, height: 1.4)),
                const SizedBox(height: 8),
                Text('2 giờ trước', style: TextStyle(color: Colors.grey[400], fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
