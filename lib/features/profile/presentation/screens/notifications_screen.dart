import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/notification_model.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final notificationsAsync = ref.watch(notificationsListProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('Thông báo', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () async {
              final repo = ref.read(notificationRepositoryProvider);
              await repo.markAllAsRead();
              ref.invalidate(notificationsListProvider);
              ref.invalidate(notificationsUnreadCountProvider);
            },
            child: const Text('Đánh dấu đã đọc', style: TextStyle(color: AppColors.primary, fontSize: 13)),
          ),
        ],
      ),
      body: notificationsAsync.when(
        data: (paginated) {
          final list = paginated.data;
          if (list.isEmpty) return const Center(child: Text('Chưa có thông báo'));
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: list.length,
            separatorBuilder: (_, __) => const Divider(height: 1, indent: 80),
            itemBuilder: (context, index) {
              final n = list[index];
              return _buildNotificationItem(n);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: AppColors.error))),
      ),
    );
  }

  Widget _buildNotificationItem(NotificationModel n) {
    IconData icon = Icons.notifications_rounded;
    Color iconColor = AppColors.primary;
    if (n.notificationType.toUpperCase().contains('COURSE') || n.title.toLowerCase().contains('bài học')) {
      icon = Icons.book_rounded;
    } else if (n.notificationType.toUpperCase().contains('LIVE') || n.title.toLowerCase().contains('live')) {
      icon = Icons.videocam_rounded;
    } else if (n.title.toLowerCase().contains('hạng') || n.title.toLowerCase().contains('xp')) {
      icon = Icons.workspace_premium_rounded;
      iconColor = AppColors.accent;
    }

    return InkWell(
      onTap: () async {
        if (n.isRead) return;
        final repo = ref.read(notificationRepositoryProvider);
        await repo.markAsRead(n.id);
        ref.invalidate(notificationsListProvider);
        ref.invalidate(notificationsUnreadCountProvider);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        color: n.isRead ? Colors.transparent : AppColors.primary.withOpacity(0.03),
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
                if (!n.isRead)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle, border: Border.all(color: AppColors.surface, width: 2)),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(n.title, style: TextStyle(fontWeight: n.isRead ? FontWeight.w600 : FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 4),
                  Text(n.message, style: TextStyle(color: AppColors.grey700, fontSize: 13, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 8),
                  Text(n.timeAgo, style: TextStyle(color: AppColors.textTertiary, fontSize: 11)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
