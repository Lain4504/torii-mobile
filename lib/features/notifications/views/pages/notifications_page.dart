import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../models/notification_model.dart';
import '../providers/notification_providers.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({super.key});

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(notificationListProvider.notifier).getNotifications();
    }
  }

  @override
  Widget build(BuildContext context) {
    final notificationsAsync = ref.watch(notificationListProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'NOTIFICATIONS',
                style: TextStyle(
                  fontWeight: AppTypography.black,
                  fontSize: 16,
                  letterSpacing: 2.0,
                  color: AppColors.textPrimary,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    ref.read(notificationListProvider.notifier).markAllAsRead();
                    ref.read(unreadCountProvider.notifier).clear();
                  },
                  icon: const Icon(Icons.done_all_rounded, size: 20),
                  tooltip: 'Mark all as read',
                ),
              ],
            ),
            
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                await ref.read(notificationListProvider.notifier).getNotifications(refresh: true);
                await ref.read(unreadCountProvider.notifier).getUnreadCount();
              },
            ),

            notificationsAsync.when(
              data: (notifications) {
                if (notifications.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.notifications_off_outlined,
                              size: 64,
                              color:
                                  AppColors.textTertiary.withValues(alpha: 0.2)),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            'No notifications yet',
                            style: TextStyle(
                              color: AppColors.textTertiary,
                              fontSize: 14,
                              fontWeight: AppTypography.medium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final notification = notifications[index];
                        return _buildNotificationItem(notification);
                      },
                      childCount: notifications.length,
                    ),
                  ),
                );
              },
              loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, _) => SliverFillRemaining(
                child: Center(child: Text('Error: $error')),
              ),
            ),
            
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(AppNotification notification) {
    final isUnread = !notification.isRead;
    
    return GestureDetector(
      onTap: () {
        if (isUnread) {
          ref.read(notificationListProvider.notifier).markAsRead(notification.id);
          ref.read(unreadCountProvider.notifier).decrement();
        }
        // Handle navigation based on metadata if needed
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        decoration: BoxDecoration(
          color: isUnread ? AppColors.primary.withValues(alpha: 0.05) : AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.xs),
          border: Border.all(
            color: isUnread ? AppColors.primary.withValues(alpha: 0.2) : AppColors.borderLight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isUnread ? AppColors.primary.withValues(alpha: 0.1) : AppColors.grey100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  notification.type.icon,
                  color: isUnread ? AppColors.primary : AppColors.textTertiary,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            notification.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: AppTypography.bold,
                              fontSize: 14,
                              color: isUnread ? AppColors.primary : AppColors.textPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _formatTime(notification.createdAt),
                          style: const TextStyle(fontSize: 10, color: AppColors.textTertiary),
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

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }
}
