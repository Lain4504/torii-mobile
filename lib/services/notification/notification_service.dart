import 'package:dio/dio.dart';
import 'package:torii_app/data/api/api_client.dart';
import 'package:torii_app/data/models/notification_model.dart';
import 'package:torii_app/core/models/api_response.dart';

class NotificationService {
  final ApiClient _apiClient;

  NotificationService(this._apiClient);

  /// Get all notifications with pagination
  Future<ApiResponse<List<NotificationModel>>> getNotifications({
    int page = 1,
    int limit = 10,
    bool? isRead,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {
        'page': page,
        'limit': limit,
      };
      if (isRead != null) {
        queryParams['isRead'] = isRead;
      }

      final response = await _apiClient.client.get(
        '/api/notifications',
        queryParameters: queryParams,
      );

      return ApiResponse.fromJson(
        response.data,
        (json) {
          // Handle both direct list and paginated object { data: [], meta: {} }
          List? list;
          if (json is List) {
            list = json;
          } else if (json is Map && json['data'] is List) {
            list = json['data'] as List;
          }
          
          
          
          
          final parsedList = list?.map((e) => NotificationModel.fromJson(e)).toList() ?? [];
          return parsedList;
        },
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Get unread notifications count
  Future<ApiResponse<int>> getUnreadCount() async {
    try {
      final response = await _apiClient.client.get('/api/notifications/unread-count');
      return ApiResponse.fromJson(
        response.data,
        (json) {
          if (json is int) return json;
          if (json is Map && json['count'] != null) return json['count'] as int;
          return 0;
        },
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Mark a notification as read
  Future<ApiResponse<void>> markAsRead(String notificationId) async {
    try {
      final response = await _apiClient.client.patch('/api/notifications/$notificationId/read');
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Mark all notifications as read
  Future<ApiResponse<void>> markAllAsRead() async {
    try {
      final response = await _apiClient.client.patch('/api/notifications/read-all');
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Delete a notification
  Future<ApiResponse<void>> deleteNotification(String notificationId) async {
    try {
      final response = await _apiClient.client.delete('/api/notifications/$notificationId');
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  ApiResponse<T> _handleError<T>(DioException e) {
    if (e.response?.data != null && e.response?.data is Map) {
      return ApiResponse.fromJson(e.response!.data, (_) => null as T);
    }
    return ApiResponse(
      success: false,
      message: e.message ?? 'Unknown error occurred',
    );
  }
}
