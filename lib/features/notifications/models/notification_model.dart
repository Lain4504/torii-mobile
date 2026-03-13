import 'package:flutter/material.dart';

enum NotificationType {
  system,
  course,
  liveClass,
  payment,
  achievement,
  reminder,
  commentReply,
  comment,
  blogAnalytics,
  orderSuccess,
  orderStatusUpdate;

  static NotificationType fromString(String value) {
    switch (value) {
      case 'system': return NotificationType.system;
      case 'course': return NotificationType.course;
      case 'live_class': return NotificationType.liveClass;
      case 'payment': return NotificationType.payment;
      case 'achievement': return NotificationType.achievement;
      case 'reminder': return NotificationType.reminder;
      case 'comment_reply': return NotificationType.commentReply;
      case 'comment': return NotificationType.comment;
      case 'blog_analytics': return NotificationType.blogAnalytics;
      case 'order_success': return NotificationType.orderSuccess;
      case 'order_status_update': return NotificationType.orderStatusUpdate;
      default: return NotificationType.system;
    }
  }

  String toJson() {
    switch (this) {
      case NotificationType.system: return 'system';
      case NotificationType.course: return 'course';
      case NotificationType.liveClass: return 'live_class';
      case NotificationType.payment: return 'payment';
      case NotificationType.achievement: return 'achievement';
      case NotificationType.reminder: return 'reminder';
      case NotificationType.commentReply: return 'comment_reply';
      case NotificationType.comment: return 'comment';
      case NotificationType.blogAnalytics: return 'blog_analytics';
      case NotificationType.orderSuccess: return 'order_success';
      case NotificationType.orderStatusUpdate: return 'order_status_update';
    }
  }

  IconData get icon {
    switch (this) {
      case NotificationType.system: return Icons.info_outline_rounded;
      case NotificationType.course: return Icons.auto_stories_rounded;
      case NotificationType.liveClass: return Icons.notification_important_rounded;
      case NotificationType.payment: return Icons.payments_rounded;
      case NotificationType.achievement: return Icons.military_tech_rounded;
      case NotificationType.reminder: return Icons.alarm_rounded;
      case NotificationType.commentReply: return Icons.reply_rounded;
      case NotificationType.comment: return Icons.comment_rounded;
      case NotificationType.blogAnalytics: return Icons.bar_chart_rounded;
      case NotificationType.orderSuccess: return Icons.check_circle_outline_rounded;
      case NotificationType.orderStatusUpdate: return Icons.local_shipping_rounded;
    }
  }
}

class AppNotification {
  final String id;
  final String title;
  final String message;
  final NotificationType type;
  final bool isRead;
  final DateTime createdAt;
  final Map<String, dynamic>? metadata;

  AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.isRead,
    required this.createdAt,
    this.metadata,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      type: NotificationType.fromString(json['notificationType'] ?? 'system'),
      isRead: json['isRead'] ?? false,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      metadata: json['metadata'],
    );
  }
}
