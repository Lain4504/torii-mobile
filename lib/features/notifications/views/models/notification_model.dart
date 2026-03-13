import 'package:flutter/material.dart';

class AppNotification {
  final String id;
  final String title;
  final String message;
  final DateTime createdAt;
  final bool isRead;
  final NotificationType type;

  AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.createdAt,
    this.isRead = false,
    this.type = NotificationType.general,
  });
}

enum NotificationType { general, success, warning, error }

extension NotificationTypeIcon on NotificationType {
  IconData get icon {
    switch (this) {
      case NotificationType.success:
        return Icons.check_circle_outline;
      case NotificationType.warning:
        return Icons.warning_amber_outlined;
      case NotificationType.error:
        return Icons.error_outline;
      case NotificationType.general:
        return Icons.notifications_outlined;
    }
  }
}

