
enum NotificationType {
  system,
  course,
  liveClass,
  payment,
  achievement,
  reminder,
  commentReply,
  orderSuccess,
  orderStatusUpdate;

  String toJson() => name.replaceAllMapped(RegExp(r'[A-Z]'), (match) => '_${match.group(0)!.toLowerCase()}');

  static NotificationType fromString(String value) {
    switch (value) {
      case 'system':
        return NotificationType.system;
      case 'course':
        return NotificationType.course;
      case 'live_class':
        return NotificationType.liveClass;
      case 'payment':
        return NotificationType.payment;
      case 'achievement':
        return NotificationType.achievement;
      case 'reminder':
        return NotificationType.reminder;
      case 'comment_reply':
        return NotificationType.commentReply;
      case 'order_success':
        return NotificationType.orderSuccess;
      case 'order_status_update':
        return NotificationType.orderStatusUpdate;
      default:
        return NotificationType.system;
    }
  }
}

class NotificationModel {
  final String id;
  final String userId;
  final String title;
  final String message;
  final NotificationType type;
  final Map<String, dynamic>? metadata;
  final bool isRead;
  final DateTime? readAt;
  final List<String> sentVia;
  final DateTime createdAt;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.type,
    this.metadata,
    required this.isRead,
    this.readAt,
    required this.sentVia,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      type: NotificationType.fromString(json['notificationType'] ?? 'system'),
      metadata: json['metadata'] ?? json['data'],
      isRead: json['isRead'] ?? false,
      readAt: json['readAt'] != null ? DateTime.parse(json['readAt']) : null,
      sentVia: List<String>.from(json['sentVia'] ?? []),
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'message': message,
      'notificationType': type.toJson(),
      'metadata': metadata,
      'isRead': isRead,
      'readAt': readAt?.toIso8601String(),
      'sentVia': sentVia,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
