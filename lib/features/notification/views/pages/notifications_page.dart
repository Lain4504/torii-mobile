import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';
import 'package:torii_app/data/models/notification_model.dart';
import 'package:torii_app/features/notification/providers/notification_providers.dart';

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(notificationListProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, ref),
              Expanded(
                child: notificationsAsync.when(
                  data: (notifications) {
                    if (notifications.isEmpty) {
                      return const Center(
                        child: Text(
                          'Chưa có thông báo nào',
                          style: TextStyle(color: AppColors.textTertiary),
                        ),
                      );
                    }
                    
                    final newNotifications = notifications.where((n) => !n.isRead).toList();
                    final earlierNotifications = notifications.where((n) => n.isRead).toList();

                    return RefreshIndicator(
                      onRefresh: () => ref.read(notificationListProvider.notifier).refresh(),
                      child: ListView(
                        padding: const EdgeInsets.all(AppSpacing.xl),
                        children: [
                          if (newNotifications.isNotEmpty) ...[
                            _buildSectionHeader('MỚI'),
                            const SizedBox(height: AppSpacing.md),
                            ...newNotifications.map((n) => Padding(
                              padding: const EdgeInsets.only(bottom: AppSpacing.md),
                              child: _NotificationItem(notification: n),
                            )),
                            const SizedBox(height: AppSpacing.xxl),
                          ],
                          
                          if (earlierNotifications.isNotEmpty) ...[
                            _buildSectionHeader('CŨ HƠN'),
                            const SizedBox(height: AppSpacing.md),
                            ...earlierNotifications.map((n) => Padding(
                              padding: const EdgeInsets.only(bottom: AppSpacing.md),
                              child: _NotificationItem(notification: n),
                            )),
                          ],
                        ],
                      ),
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('Lỗi: $err')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ZenButton(
            text: 'QUAY LẠI',
            onPressed: () => context.pop(),
            type: ZenButtonType.ghost, 
          ),
          const Text(
            'THÔNG BÁO',
            style: TextStyle(
              fontSize: 12,
              fontWeight: AppTypography.black,
              letterSpacing: 3.0,
            ),
          ),
          IconButton(
            onPressed: () => ref.read(notificationListProvider.notifier).markAllAsRead(), 
            icon: const Icon(Icons.done_all_rounded, size: 20, color: AppColors.textSecondary),
            tooltip: 'Đánh dấu tất cả là đã đọc',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: AppTypography.black,
        letterSpacing: 2.0,
        color: AppColors.textTertiary,
      ),
    );
  }
}

class _NotificationItem extends ConsumerWidget {
  final NotificationModel notification;

  const _NotificationItem({required this.notification});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final IconData icon;
    final Color iconColor;
    final Color backgroundColor;

    switch (notification.type) {
      case NotificationType.course:
        icon = Icons.school_rounded;
        iconColor = const Color(0xFF4361EE); // Bright Blue
        backgroundColor = const Color(0xFFE8EBFF);
        break;
      case NotificationType.liveClass:
        icon = Icons.videocam_rounded;
        iconColor = const Color(0xFFFF4D6D); // Pink/Red
        backgroundColor = const Color(0xFFFFEDF0);
        break;
      case NotificationType.payment:
      case NotificationType.orderSuccess:
        icon = Icons.receipt_long_rounded;
        iconColor = const Color(0xFF2EC4B6); // Teal/Green
        backgroundColor = const Color(0xFFEAF9F7);
        break;
      case NotificationType.orderStatusUpdate:
        icon = Icons.local_shipping_rounded;
        iconColor = const Color(0xFFFF9F1C); // Orange
        backgroundColor = const Color(0xFFFFF5E6);
        break;
      case NotificationType.achievement:
        icon = Icons.emoji_events_rounded;
        iconColor = const Color(0xFFFFBF00); // Admin/Gold
        backgroundColor = const Color(0xFFFFF9E6);
        break;
      case NotificationType.reminder:
        icon = Icons.alarm_rounded;
        iconColor = const Color(0xFF9D4EDD); // Purple
        backgroundColor = const Color(0xFFF5EAFC);
        break;
      case NotificationType.commentReply:
        icon = Icons.chat_bubble_rounded;
        iconColor = const Color(0xFF3A86FF); // Blue
        backgroundColor = const Color(0xFFEBF3FF);
        break;
      case NotificationType.system:
      default:
        icon = Icons.notifications_rounded;
        iconColor = AppColors.textSecondary;
        backgroundColor = AppColors.grey200.withValues(alpha: 0.5);
    }

    final String timeAgo = _formatTime(notification.createdAt);

    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
        child: const Icon(Icons.delete_outline, color: AppColors.error),
      ),
      onDismissed: (_) {
        ref.read(notificationListProvider.notifier).delete(notification.id);
      },
      child: InkWell(
        onTap: () {
          if (!notification.isRead) {
            ref.read(notificationListProvider.notifier).markAsRead(notification.id);
          }
        },
        borderRadius: BorderRadius.circular(AppRadius.xl),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: notification.isRead ? Colors.transparent : Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(
              color: !notification.isRead ? AppColors.primary.withValues(alpha: 0.05) : Colors.transparent,
              width: 1,
            ),
            boxShadow: [
              if (!notification.isRead)
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: TextStyle(
                              fontWeight: !notification.isRead ? AppTypography.bold : AppTypography.medium,
                              fontSize: 14,
                              color: !notification.isRead ? AppColors.textPrimary : AppColors.textSecondary,
                              height: 1.2,
                            ),
                          ),
                        ),
                        if (!notification.isRead)
                          Container(
                            margin: const EdgeInsets.only(left: 8, top: 4),
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.accent,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      notification.message,
                      style: TextStyle(
                        fontSize: 13,
                        color: notification.isRead ? AppColors.textTertiary : AppColors.textSecondary,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      timeAgo,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 1) return 'vừa xong';
    if (difference.inMinutes < 60) return '${difference.inMinutes} phút trước';
    if (difference.inHours < 24) return '${difference.inHours} giờ trước';
    if (difference.inDays < 7) return '${difference.inDays} ngày trước';
    return DateFormat('dd/MM').format(date);
  }
}
