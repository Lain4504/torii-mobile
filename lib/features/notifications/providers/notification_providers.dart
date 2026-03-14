import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/api/api_client.dart';
import '../models/notification_model.dart';
import '../repositories/notification_repository.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final dio = ref.watch(apiClientProvider).client;
  return NotificationRepository(dio);
});

final notificationListProvider = StateNotifierProvider<NotificationNotifier, AsyncValue<List<AppNotification>>>((ref) {
  final repository = ref.watch(notificationRepositoryProvider);
  return NotificationNotifier(repository);
});

final unreadCountProvider = StateNotifierProvider<UnreadCountNotifier, int>((ref) {
  final repository = ref.watch(notificationRepositoryProvider);
  return UnreadCountNotifier(repository);
});

class NotificationNotifier extends StateNotifier<AsyncValue<List<AppNotification>>> {
  final NotificationRepository _repository;
  int _currentPage = 1;
  bool _hasMore = true;

  NotificationNotifier(this._repository) : super(const AsyncValue.loading()) {
    getNotifications();
  }

  Future<void> getNotifications({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _hasMore = true;
      state = const AsyncValue.loading();
    }

    if (!_hasMore) return;

    try {
      final result = await _repository.getNotifications(page: _currentPage, limit: 20);
      final List<AppNotification> currentList = refresh ? [] : (state.value ?? []);
      state = AsyncValue.data([...currentList, ...result.items]);
      _hasMore = result.page < result.totalPages;
      _currentPage++;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> markAsRead(String id) async {
    try {
      await _repository.markAsRead(id);
      if (state.hasValue) {
        final currentList = state.value!;
        state = AsyncValue.data(
          currentList.map((n) => n.id == id
              ? AppNotification(
                  id: n.id,
                  title: n.title,
                  message: n.message,
                  type: n.type,
                  isRead: true,
                  createdAt: n.createdAt,
                  metadata: n.metadata,
                )
              : n).toList(),
        );
      }
    } catch (_) {}
  }

  Future<void> markAllAsRead() async {
    try {
      await _repository.markAllAsRead();
      if (state.hasValue) {
        final currentList = state.value!;
        state = AsyncValue.data(
          currentList.map((n) => AppNotification(
                id: n.id,
                title: n.title,
                message: n.message,
                type: n.type,
                isRead: true,
                createdAt: n.createdAt,
                metadata: n.metadata,
              )).toList(),
        );
      }
    } catch (_) {}
  }

  Future<void> deleteNotification(String id) async {
    try {
      await _repository.deleteNotification(id);
      if (state.hasValue) {
        state = AsyncValue.data(state.value!.where((n) => n.id != id).toList());
      }
    } catch (_) {}
  }
}

class UnreadCountNotifier extends StateNotifier<int> {
  final NotificationRepository _repository;

  UnreadCountNotifier(this._repository) : super(0) {
    getUnreadCount();
  }

  Future<void> getUnreadCount() async {
    try {
      state = await _repository.getUnreadCount();
    } catch (_) {}
  }

  void decrement() {
    if (state > 0) state--;
  }

  void clear() {
    state = 0;
  }
}
