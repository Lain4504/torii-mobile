// Room Settings Provider - Riverpod State Management
// Simplified version of apps/meet/src/store/slices/roomSettingsSlice.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotification {
  final String message;
  final String typeOption; // 'info', 'warning', 'error'
  final String? notificationCat;
  final bool autoClose;
  final bool disableToastNotification;
  
  const UserNotification({
    required this.message,
    required this.typeOption,
    this.notificationCat,
    this.autoClose = true,
    this.disableToastNotification = false,
  });
}

class InitiatePrivateChat {
  final String name;
  final String userId;
  
  const InitiatePrivateChat({
    required this.name,
    required this.userId,
  });
}

class RoomSettingsState {
  final List<UserNotification> notifications;
  final String selectedChatOption; // 'public' or userId
  final String selectedChatTransLang;
  final Map<String, int> unreadMsgFrom; // userId -> count
  final bool playAudioNotification;
  final InitiatePrivateChat? initiatePrivateChat;
  
  const RoomSettingsState({
    this.notifications = const [],
    this.selectedChatOption = 'public',
    this.selectedChatTransLang = '',
    this.unreadMsgFrom = const {},
    this.playAudioNotification = false,
    this.initiatePrivateChat,
  });
  
  RoomSettingsState copyWith({
    List<UserNotification>? notifications,
    String? selectedChatOption,
    String? selectedChatTransLang,
    Map<String, int>? unreadMsgFrom,
    bool? playAudioNotification,
    InitiatePrivateChat? initiatePrivateChat,
  }) {
    return RoomSettingsState(
      notifications: notifications ?? this.notifications,
      selectedChatOption: selectedChatOption ?? this.selectedChatOption,
      selectedChatTransLang: selectedChatTransLang ?? this.selectedChatTransLang,
      unreadMsgFrom: unreadMsgFrom ?? this.unreadMsgFrom,
      playAudioNotification: playAudioNotification ?? this.playAudioNotification,
      initiatePrivateChat: initiatePrivateChat ?? this.initiatePrivateChat,
    );
  }
}

class RoomSettingsNotifier extends StateNotifier<RoomSettingsState> {
  RoomSettingsNotifier() : super(const RoomSettingsState());
  
  void addUserNotification(UserNotification notification) {
    state = state.copyWith(
      notifications: [...state.notifications, notification],
    );
  }
  
  void updateSelectedChatOption(String option) {
    state = state.copyWith(selectedChatOption: option);
  }
  
  void updateSelectedChatTransLang(String lang) {
    state = state.copyWith(selectedChatTransLang: lang);
  }
  
  void updateUnreadMsgFrom(String userId, int count) {
    final newUnread = Map<String, int>.from(state.unreadMsgFrom);
    newUnread[userId] = count;
    state = state.copyWith(unreadMsgFrom: newUnread);
  }
  
  void clearUnreadMsgFrom(String userId) {
    final newUnread = Map<String, int>.from(state.unreadMsgFrom);
    newUnread.remove(userId);
    state = state.copyWith(unreadMsgFrom: newUnread);
  }

  void updatePlayAudioNotification(bool play) {
    state = state.copyWith(playAudioNotification: play);
  }

  void updateInitiatePrivateChat(InitiatePrivateChat? chat) {
    state = state.copyWith(initiatePrivateChat: chat);
  }
}

final roomSettingsProvider = StateNotifierProvider<RoomSettingsNotifier, RoomSettingsState>((ref) {
  return RoomSettingsNotifier();
});
