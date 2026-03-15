/// Notification from GET /api/notifications
class NotificationModel {
  final String id;
  final String userId;
  final String title;
  final String message;
  final String notificationType;
  final Map<String, dynamic>? metadata;
  final bool isRead;
  final DateTime? readAt;
  final List<String> sentVia;
  final DateTime createdAt;

  const NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.notificationType,
    this.metadata,
    required this.isRead,
    this.readAt,
    this.sentVia = const [],
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      notificationType: json['notificationType'] as String? ?? 'SYSTEM',
      metadata: json['metadata'] as Map<String, dynamic>?,
      isRead: json['isRead'] as bool? ?? false,
      readAt: json['readAt'] != null
          ? DateTime.tryParse(json['readAt'].toString())
          : null,
      sentVia: (json['sentVia'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      createdAt: DateTime.parse(json['createdAt'].toString()),
    );
  }

  String get timeAgo {
    final now = DateTime.now();
    final diff = now.difference(createdAt);
    if (diff.inMinutes < 60) return '${diff.inMinutes} phút trước';
    if (diff.inHours < 24) return '${diff.inHours} giờ trước';
    if (diff.inDays < 7) return '${diff.inDays} ngày trước';
    return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
  }
}
