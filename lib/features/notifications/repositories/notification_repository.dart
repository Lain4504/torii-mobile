import '../models/notification_model.dart';
import '../services/notification_service.dart';
import '../../../core/models/api_response.dart';

class NotificationRepository {
  final NotificationService _service;

  NotificationRepository(this._service);

  Future<ApiResponse<List<AppNotification>>> getNotifications({
    int page = 1,
    int limit = 20,
    bool? isRead,
  }) {
    return _service.getNotifications(page: page, limit: limit, isRead: isRead);
  }

  Future<ApiResponse<int>> getUnreadCount() {
    return _service.getUnreadCount();
  }

  Future<ApiResponse<void>> markAsRead(String id) {
    return _service.markAsRead(id);
  }

  Future<ApiResponse<void>> markAllAsRead() {
    return _service.markAllAsRead();
  }

  Future<ApiResponse<void>> deleteNotification(String id) {
    return _service.deleteNotification(id);
  }
}
