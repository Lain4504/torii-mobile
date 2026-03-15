import 'package:dio/dio.dart';

import '../models/notification_model.dart';
import '../../core/models/api_response.dart';
import '../../core/models/paginated_response.dart';

/// Notifications API - GET /api/notifications, unread-count, PATCH read, read-all, DELETE
class NotificationRepository {
  const NotificationRepository(this._dio);

  final Dio _dio;

  /// GET /api/notifications
  Future<PaginatedResponse<NotificationModel>> getNotifications({
    int page = 1,
    int limit = 20,
    bool? isRead,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/notifications',
      queryParameters: <String, dynamic>{
        'page': page,
        'limit': limit,
        if (isRead != null) 'isRead': isRead,
      },
    );
    final body = response.data ?? {};
    if (body['success'] != true) {
      throw Exception(body['message'] ?? 'Failed to fetch notifications');
    }
    return PaginatedResponse.fromJson(body, (e) => NotificationModel.fromJson(e as Map<String, dynamic>));
  }

  /// GET /api/notifications/unread-count
  Future<int> getUnreadCount() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/notifications/unread-count');
    final api = ApiResponse<Map<String, dynamic>>.fromJson(response.data ?? {});
    if (!api.success || api.data == null) return 0;
    final count = api.data!['count'];
    return (count is num) ? count.toInt() : 0;
  }

  /// PATCH /api/notifications/:id/read
  Future<void> markAsRead(String notificationId) async {
    await _dio.patch<void>('/api/notifications/$notificationId/read');
  }

  /// PATCH /api/notifications/read-all
  Future<void> markAllAsRead() async {
    await _dio.patch<void>('/api/notifications/read-all');
  }

  /// DELETE /api/notifications/:id
  Future<void> delete(String notificationId) async {
    await _dio.delete<void>('/api/notifications/$notificationId');
  }
}
