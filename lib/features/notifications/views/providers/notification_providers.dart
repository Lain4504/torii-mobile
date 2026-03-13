import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/notification_model.dart';

class NotificationListNotifier
    extends StateNotifier<AsyncValue<List<AppNotification>>> {
  NotificationListNotifier() : super(const AsyncValue.data([]));

  Future<void> getNotifications({bool refresh = false}) async {
    // Placeholder: keep empty list; backend mapping can be added later.
    if (refresh) {
      state = const AsyncValue.data([]);
    }
  }

  void markAllAsRead() {
    state.whenData((list) {
      state = AsyncValue.data(
        list.map((n) => AppNotification(
          id: n.id,
          title: n.title,
          message: n.message,
          createdAt: n.createdAt,
          isRead: true,
          type: n.type,
        )).toList(),
      );
    });
  }

  void markAsRead(String id) {
    state.whenData((list) {
      state = AsyncValue.data(
        list.map((n) => n.id == id
            ? AppNotification(
                id: n.id,
                title: n.title,
                message: n.message,
                createdAt: n.createdAt,
                isRead: true,
                type: n.type,
              )
            : n).toList(),
      );
    });
  }
}

final notificationListProvider = StateNotifierProvider<
    NotificationListNotifier, AsyncValue<List<AppNotification>>>(
  (ref) => NotificationListNotifier(),
);

class UnreadCountNotifier extends StateNotifier<int> {
  UnreadCountNotifier() : super(0);

  Future<void> getUnreadCount() async {
    // Placeholder
    state = 0;
  }

  void clear() => state = 0;
  void decrement() {
    if (state > 0) state = state - 1;
  }
}

final unreadCountProvider =
    StateNotifierProvider<UnreadCountNotifier, int>((ref) {
  return UnreadCountNotifier();
});

