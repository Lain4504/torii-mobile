import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'NOTIFICATIONS',
                style: TextStyle(
                  fontWeight: AppTypography.black,
                  fontSize: 16,
                  letterSpacing: 2.0,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildNotificationItem(
                    'Course Update',
                    'JLPT N5 Grammar course has been updated with new materials.',
                    '2 hours ago',
                    Icons.update_rounded,
                    true,
                  ),
                  _buildNotificationItem(
                    'New Lesson Available',
                    'Lesson 12: Honorifics (Keigo) is now available in your course.',
                    '5 hours ago',
                    Icons.play_circle_outline_rounded,
                    true,
                  ),
                  _buildNotificationItem(
                    'Seminar Reminder',
                    'Live seminar "Speaking Like a Native" starts in 30 minutes!',
                    '1 day ago',
                    Icons.notification_important_rounded,
                    false,
                  ),
                  _buildNotificationItem(
                    'Achievement Unlocked',
                    'Congratulations! You earned the "7 Day Streak" badge.',
                    '2 days ago',
                    Icons.military_tech_rounded,
                    false,
                  ),
                   _buildNotificationItem(
                    'Study Goal Reached',
                    'You reached your daily study goal of 30 minutes. Keep it up!',
                    '3 days ago',
                    Icons.auto_awesome_rounded,
                    false,
                  ),
                ]),
              ),
            ),
            
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(String title, String desc, String time, IconData icon, bool isUnread) {
    return Container(
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
                icon,
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
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: AppTypography.bold,
                          fontSize: 14,
                          color: isUnread ? AppColors.primary : AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        time,
                        style: const TextStyle(fontSize: 10, color: AppColors.textTertiary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
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
    );
  }
}
