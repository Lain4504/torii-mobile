import 'package:dio/dio.dart';
import '../models/notification_model.dart';

/// Notification repository – gateway GET /api/notifications (paginated), unread-count, PATCH :id/read, PATCH read-all, DELETE :id.
/// List response: { success, data: [], total, page, limit, totalPages }. Unread: { success, data: { count } }.
class NotificationRepository {
  final Dio _dio;
  static const String _base = '/api/notifications';

  NotificationRepository(this._dio);

  /// GET /api/notifications?page=&limit=&isRead=
  Future<NotificationListResult> getNotifications({
    int page = 1,
    int limit = 20,
    bool? isRead,
  }) async {
    final query = <String, dynamic>{'page': page, 'limit': limit};
    if (isRead != null) query['isRead'] = isRead;
    final res = await _dio.get(_base, queryParameters: query);
    if (res.statusCode != 200) throw Exception('Failed to fetch notifications: ${res.statusCode}');
    final body = res.data as Map<String, dynamic>? ?? {};
    final list = body['data'] is List
        ? (body['data'] as List).map((e) => AppNotification.fromJson(e as Map<String, dynamic>)).toList()
        : <AppNotification>[];
    return NotificationListResult(
      items: list,
      total: (body['total'] as num?)?.toInt() ?? list.length,
      page: (body['page'] as num?)?.toInt() ?? page,
      limit: (body['limit'] as num?)?.toInt() ?? limit,
      totalPages: (body['totalPages'] as num?)?.toInt() ?? 1,
    );
  }

  /// GET /api/notifications/unread-count → { success, data: { count } }
  Future<int> getUnreadCount() async {
    final res = await _dio.get('$_base/unread-count');
    if (res.statusCode != 200) return 0;
    final data = res.data is Map ? (res.data as Map)['data'] : null;
    if (data is Map && data['count'] != null) return (data['count'] as num).toInt();
    return 0;
  }

  Future<void> markAsRead(String id) async {
    final res = await _dio.patch('$_base/$id/read');
    if (res.statusCode != 200) throw Exception('Failed to mark as read: ${res.statusCode}');
  }

  Future<void> markAllAsRead() async {
    final res = await _dio.patch('$_base/read-all');
    if (res.statusCode != 200) throw Exception('Failed to mark all as read: ${res.statusCode}');
  }

  Future<void> deleteNotification(String id) async {
    final res = await _dio.delete('$_base/$id');
    if (res.statusCode != 200) throw Exception('Failed to delete: ${res.statusCode}');
  }
}

class NotificationListResult {
  final List<AppNotification> items;
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  const NotificationListResult({
    required this.items,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });
}
