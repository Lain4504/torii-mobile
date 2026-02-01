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
                          'No notifications yet',
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
                            _buildSectionHeader('NEW'),
                            const SizedBox(height: AppSpacing.md),
                            ...newNotifications.map((n) => Padding(
                              padding: const EdgeInsets.only(bottom: AppSpacing.md),
                              child: _NotificationItem(notification: n),
                            )),
                            const SizedBox(height: AppSpacing.xxl),
                          ],
                          
                          if (earlierNotifications.isNotEmpty) ...[
                            _buildSectionHeader('EARLIER'),
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
                  error: (err, stack) => Center(child: Text('Error: $err')),
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
            text: 'BACK',
            onPressed: () => context.pop(),
            type: ZenButtonType.ghost, 
          ),
          const Text(
            'NOTIFICATIONS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: AppTypography.black,
              letterSpacing: 3.0,
            ),
          ),
          IconButton(
            onPressed: () => ref.read(notificationListProvider.notifier).markAllAsRead(), 
            icon: const Icon(Icons.done_all_rounded, size: 20, color: AppColors.textSecondary),
            tooltip: 'Mark all as read',
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

    switch (notification.type) {
      case NotificationType.course:
        icon = Icons.celebration_rounded;
        iconColor = AppColors.accent;
        break;
      case NotificationType.liveClass:
        icon = Icons.video_camera_front_rounded;
        iconColor = AppColors.primary;
        break;
      case NotificationType.payment:
      case NotificationType.orderSuccess:
        icon = Icons.account_balance_wallet_rounded;
        iconColor = Colors.green;
        break;
      case NotificationType.commentReply:
        icon = Icons.forum_rounded;
        iconColor = Colors.blue;
        break;
      default:
        icon = Icons.notifications_rounded;
        iconColor = AppColors.textTertiary;
    }

    final String timeAgo = _formatTime(notification.createdAt);

    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: AppColors.error,
        child: const Icon(Icons.delete_outline, color: Colors.white),
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
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: notification.isRead ? Colors.white.withValues(alpha: 0.6) : Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(
              color: !notification.isRead ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent,
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
                  color: iconColor.withValues(alpha: 0.1),
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
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: TextStyle(
                              fontWeight: !notification.isRead ? AppTypography.bold : AppTypography.medium,
                              fontSize: 14,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        if (!notification.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.accent,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.message,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      timeAgo,
                      style: const TextStyle(
                        fontSize: 10,
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

    if (difference.inMinutes < 1) return 'now';
    if (difference.inMinutes < 60) return '${difference.inMinutes}m ago';
    if (difference.inHours < 24) return '${difference.inHours}h ago';
    if (difference.inDays < 7) return '${difference.inDays}d ago';
    return DateFormat('MMM d').format(date);
  }
}
