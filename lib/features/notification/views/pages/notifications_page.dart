import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/zen_background.dart';
import '../../../../core/widgets/widgets.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  children: [
                    _buildSectionHeader('NEW'),
                    const SizedBox(height: AppSpacing.md),
                    _NotificationItem(
                      icon: Icons.celebration_rounded,
                      iconColor: AppColors.accent,
                      title: 'Course Completed!',
                      message: 'You have successfully finished "Advanced Flutter Architecture". Download your certificate now.',
                      time: '2 mins ago',
                      isUnread: true,
                    ),
                    const SizedBox(height: AppSpacing.md),
                     _NotificationItem(
                      icon: Icons.ondemand_video_rounded,
                      iconColor: AppColors.primary,
                      title: 'New Lesson Available',
                      message: 'Instructor Sarah just uploaded a new lesson in "Japanse N3 Mastery"',
                      time: '1 hour ago',
                      isUnread: true,
                    ),
                    
                    const SizedBox(height: AppSpacing.xxl),
                    _buildSectionHeader('EARLIER'),
                    const SizedBox(height: AppSpacing.md),
                    _NotificationItem(
                      icon: Icons.security_rounded,
                      iconColor: Colors.orange,
                      title: 'Security Alert',
                      message: 'A new login was detected from Chrome on Windows.',
                      time: 'Yesterday',
                      isUnread: false,
                    ),
                     const SizedBox(height: AppSpacing.md),
                    _NotificationItem(
                      icon: Icons.forum_rounded,
                      iconColor: Colors.blue,
                      title: 'New Reply',
                      message: 'Bao Nguyen replied to your comment in "Clean Code Discussion"',
                      time: '2 days ago',
                      isUnread: false,
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

  Widget _buildHeader(BuildContext context) {
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
            onPressed: () {}, 
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

class _NotificationItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String message;
  final String time;
  final bool isUnread;

  const _NotificationItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.message,
    required this.time,
    required this.isUnread,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: isUnread ? Colors.white : Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: isUnread ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
          width: 1,
        ),
        boxShadow: [
          if (isUnread)
            BoxShadow(
              color: AppColors.primary.withOpacity(0.05),
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
              color: iconColor.withOpacity(0.1),
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
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: isUnread ? AppTypography.bold : AppTypography.medium,
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (isUnread)
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
                  message,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
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
    );
  }
}
