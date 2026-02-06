import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/data/models/notification_model.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/services/notification/notification_service.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return NotificationService(apiClient);
});

final notificationUnreadCountProvider = FutureProvider.autoDispose<int>((ref) async {
  final service = ref.watch(notificationServiceProvider);
  final response = await service.getUnreadCount();
  return response.data ?? 0;
});

class NotificationListNotifier extends AutoDisposeAsyncNotifier<List<NotificationModel>> {
  late NotificationService _service;
  int _currentPage = 1;
  bool _hasMore = true;

  @override
  Future<List<NotificationModel>> build() async {
    _service = ref.watch(notificationServiceProvider);
    // Always refresh on build to ensure up-to-date list when page is opened
    return _fetchNotifications(refresh: true);
  }

  Future<List<NotificationModel>> _fetchNotifications({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _hasMore = true;
    }

    final response = await _service.getNotifications(page: _currentPage);
    if (response.success && response.data != null) {
      final List<NotificationModel> newItems = response.data!;
      if (newItems.length < 10) {
        _hasMore = false;
      }
      return newItems;
    }
    return [];
  }

  Future<void> loadMore() async {
    if (!_hasMore || state.isLoading) return;

    _currentPage++;
    final result = await _fetchNotifications();
    state = AsyncValue.data([...state.value ?? [], ...result]);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchNotifications(refresh: true));
    ref.invalidate(notificationUnreadCountProvider);
  }

  Future<void> markAsRead(String id) async {
    final response = await _service.markAsRead(id);
    if (response.success) {
      state = AsyncValue.data(
        state.value?.map((n) => n.id == id ? NotificationModel(
          id: n.id,
          userId: n.userId,
          title: n.title,
          message: n.message,
          type: n.type,
          isRead: true,
          readAt: DateTime.now(),
          sentVia: n.sentVia,
          createdAt: n.createdAt,
          metadata: n.metadata,
        ) : n).toList() ?? [],
      );
      ref.invalidate(notificationUnreadCountProvider);
    }
  }

  Future<void> markAllAsRead() async {
    final response = await _service.markAllAsRead();
    if (response.success) {
      state = AsyncValue.data(
        state.value?.map((n) => NotificationModel(
          id: n.id,
          userId: n.userId,
          title: n.title,
          message: n.message,
          type: n.type,
          isRead: true,
          readAt: DateTime.now(),
          sentVia: n.sentVia,
          createdAt: n.createdAt,
          metadata: n.metadata,
        )).toList() ?? [],
      );
      ref.invalidate(notificationUnreadCountProvider);
    }
  }

  Future<void> delete(String id) async {
    final response = await _service.deleteNotification(id);
    if (response.success) {
      state = AsyncValue.data(
        state.value?.where((n) => n.id != id).toList() ?? [],
      );
      ref.invalidate(notificationUnreadCountProvider);
    }
  }
}

final notificationListProvider = AsyncNotifierProvider.autoDispose<NotificationListNotifier, List<NotificationModel>>(NotificationListNotifier.new);
