import 'package:dio/dio.dart';
import '../../../core/models/api_response.dart';
import '../../../data/api/api_client.dart';
import '../models/notification_model.dart';

class NotificationService {
  final ApiClient _apiClient;

  NotificationService(this._apiClient);

  Future<ApiResponse<List<AppNotification>>> getNotifications({
    int page = 1,
    int limit = 20,
    bool? isRead,
  }) async {
    try {
      final response = await _apiClient.client.get(
        '/api/notifications',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (isRead != null) 'isRead': isRead,
        },
      );

      // result for Get /api/notifications in gateway is successPaginatedResponse(result)
      // which returns { success: true, data: { data: [], meta: {} } }
      return ApiResponse.fromJson(
        response.data,
        (json) {
          final list = json['data'] as List;
          return list.map((e) => AppNotification.fromJson(e)).toList();
        },
      );
    } on DioException catch (e) {
      return ApiResponse(
        success: false,
        message: e.message ?? 'Unknown error',
      );
    }
  }

  Future<ApiResponse<int>> getUnreadCount() async {
    try {
      final response = await _apiClient.client.get('/api/notifications/unread-count');
      // result is successResponse(result) where result is { count: number }
      return ApiResponse.fromJson(
        response.data,
        (json) => json['count'] as int,
      );
    } on DioException catch (e) {
      return ApiResponse(
        success: false,
        message: e.message ?? 'Unknown error',
      );
    }
  }

  Future<ApiResponse<void>> markAsRead(String id) async {
    try {
      final response = await _apiClient.client.patch('/api/notifications/$id/read');
      return ApiResponse.fromJson(response.data, (_) => null);
    } on DioException catch (e) {
      return ApiResponse(
        success: false,
        message: e.message ?? 'Unknown error',
      );
    }
  }

  Future<ApiResponse<void>> markAllAsRead() async {
    try {
      final response = await _apiClient.client.patch('/api/notifications/read-all');
      return ApiResponse.fromJson(response.data, (_) => null);
    } on DioException catch (e) {
      return ApiResponse(
        success: false,
        message: e.message ?? 'Unknown error',
      );
    }
  }

  Future<ApiResponse<void>> deleteNotification(String id) async {
    try {
      final response = await _apiClient.client.delete('/api/notifications/$id');
      return ApiResponse.fromJson(response.data, (_) => null);
    } on DioException catch (e) {
      return ApiResponse(
        success: false,
        message: e.message ?? 'Unknown error',
      );
    }
  }
}
