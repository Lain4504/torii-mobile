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

  const InitiatePrivateChat({required this.name, required this.userId});
}

class RoomSettingsState {
  final List<UserNotification> notifications;
  final String selectedChatOption; // 'public' or userId
  final String selectedChatTransLang;
  final Map<String, int> unreadMsgFrom; // userId -> count
  final bool playAudioNotification;
  final InitiatePrivateChat? initiatePrivateChat;

  /// Web `roomSettings.pinCamUserId` — ghim webcam lên vùng lớn (pinned layout).
  final String? pinCamUserId;

  /// Web `roomSettings.focusActiveSpeakerWebcam` — ưu tiên sắp xếp người đang nói.
  final bool focusActiveSpeakerWebcam;

  /// Web `roomAudioVolume` — 0.0–1.0 (slider header). Áp dụng renderer trong tương lai.
  final double roomAudioVolume;

  /// Web `roomScreenShareAudioVolume`.
  final double roomScreenShareAudioVolume;

  const RoomSettingsState({
    this.notifications = const [],
    this.selectedChatOption = 'public',
    this.selectedChatTransLang = '',
    this.unreadMsgFrom = const {},
    this.playAudioNotification = false,
    this.initiatePrivateChat,
    this.pinCamUserId,
    this.focusActiveSpeakerWebcam = true,
    this.roomAudioVolume = 1.0,
    this.roomScreenShareAudioVolume = 1.0,
  });

  RoomSettingsState copyWith({
    List<UserNotification>? notifications,
    String? selectedChatOption,
    String? selectedChatTransLang,
    Map<String, int>? unreadMsgFrom,
    bool? playAudioNotification,
    InitiatePrivateChat? initiatePrivateChat,
    String? pinCamUserId,
    bool? focusActiveSpeakerWebcam,
    bool clearPinCam = false,
    double? roomAudioVolume,
    double? roomScreenShareAudioVolume,
  }) {
    return RoomSettingsState(
      notifications: notifications ?? this.notifications,
      selectedChatOption: selectedChatOption ?? this.selectedChatOption,
      selectedChatTransLang:
          selectedChatTransLang ?? this.selectedChatTransLang,
      unreadMsgFrom: unreadMsgFrom ?? this.unreadMsgFrom,
      playAudioNotification:
          playAudioNotification ?? this.playAudioNotification,
      initiatePrivateChat: initiatePrivateChat ?? this.initiatePrivateChat,
      pinCamUserId: clearPinCam ? null : (pinCamUserId ?? this.pinCamUserId),
      focusActiveSpeakerWebcam:
          focusActiveSpeakerWebcam ?? this.focusActiveSpeakerWebcam,
      roomAudioVolume: roomAudioVolume ?? this.roomAudioVolume,
      roomScreenShareAudioVolume:
          roomScreenShareAudioVolume ?? this.roomScreenShareAudioVolume,
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

  /// Ghim / bỏ ghim webcam (clone web `updatePinCamUserId`).
  void updatePinCamUserId(String? userId) {
    state = state.copyWith(pinCamUserId: userId, clearPinCam: userId == null);
  }

  void updateFocusActiveSpeakerWebcam(bool enabled) {
    state = state.copyWith(focusActiveSpeakerWebcam: enabled);
  }

  void updateRoomAudioVolume(double volume) {
    state = state.copyWith(
      roomAudioVolume: volume.clamp(0.0, 1.0),
    );
  }

  void updateRoomScreenShareAudioVolume(double volume) {
    state = state.copyWith(
      roomScreenShareAudioVolume: volume.clamp(0.0, 1.0),
    );
  }

  void clearUserNotifications() {
    state = state.copyWith(notifications: const []);
  }
}

final roomSettingsProvider =
    StateNotifierProvider<RoomSettingsNotifier, RoomSettingsState>((ref) {
      return RoomSettingsNotifier();
    });
