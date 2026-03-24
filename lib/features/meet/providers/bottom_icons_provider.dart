// Bottom Icons Provider - Riverpod State Management
// Simplified version of apps/meet/src/store/slices/bottomIconsActivitySlice.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomIconsState {
  final String? activeSidePanel; // 'CHAT', 'PARTICIPANTS', 'WHITEBOARD', etc.
  final int totalUnreadChatMsgs;
  final int unreadPolls;
  final bool isActiveRaisehand;
  final bool isMicMuted;
  final bool isWebcamMuted;
  final bool isScreenSharing;
  final bool showManageWaitingRoomModal;

  const BottomIconsState({
    this.activeSidePanel,
    this.totalUnreadChatMsgs = 0,
    this.unreadPolls = 0,
    this.isActiveRaisehand = false,
    this.isMicMuted = true,
    this.isWebcamMuted = true,
    this.isScreenSharing = false,
    this.showManageWaitingRoomModal = false,
  });

  static const Object _noChange = Object();

  BottomIconsState copyWith({
    Object? activeSidePanel = _noChange,
    int? totalUnreadChatMsgs,
    int? unreadPolls,
    bool? isActiveRaisehand,
    bool? isMicMuted,
    bool? isWebcamMuted,
    bool? isScreenSharing,
    bool? showManageWaitingRoomModal,
  }) {
    return BottomIconsState(
      activeSidePanel: identical(activeSidePanel, _noChange)
          ? this.activeSidePanel
          : activeSidePanel as String?,
      totalUnreadChatMsgs: totalUnreadChatMsgs ?? this.totalUnreadChatMsgs,
      unreadPolls: unreadPolls ?? this.unreadPolls,
      isActiveRaisehand: isActiveRaisehand ?? this.isActiveRaisehand,
      isMicMuted: isMicMuted ?? this.isMicMuted,
      isWebcamMuted: isWebcamMuted ?? this.isWebcamMuted,
      isScreenSharing: isScreenSharing ?? this.isScreenSharing,
      showManageWaitingRoomModal:
          showManageWaitingRoomModal ?? this.showManageWaitingRoomModal,
    );
  }
}

class BottomIconsNotifier extends StateNotifier<BottomIconsState> {
  BottomIconsNotifier() : super(const BottomIconsState());
  
  void setActiveSidePanel(String? panel) {
    // Explicit setter (không toggle) to keep unread logic predictable.
    state = state.copyWith(activeSidePanel: panel);
  }
  
  void updateTotalUnreadChatMsgs(int count) {
    state = state.copyWith(totalUnreadChatMsgs: count);
  }

  void resetTotalUnreadChatMsgs() {
    state = state.copyWith(totalUnreadChatMsgs: 0);
  }

  void incrementUnreadPolls() {
    state = state.copyWith(unreadPolls: state.unreadPolls + 1);
  }

  void updateUnreadPolls(int count) {
    state = state.copyWith(unreadPolls: count);
  }

  void resetUnreadPolls() {
    state = state.copyWith(unreadPolls: 0);
  }
  
  void updateIsActiveRaisehand(bool isActive) {
    state = state.copyWith(isActiveRaisehand: isActive);
  }

  void toggleMic() {
    state = state.copyWith(isMicMuted: !state.isMicMuted);
  }

  void toggleWebcam() {
    state = state.copyWith(isWebcamMuted: !state.isWebcamMuted);
  }

  void toggleScreenShare() {
    state = state.copyWith(isScreenSharing: !state.isScreenSharing);
  }

  void updateMicStatus(bool isMuted) {
    state = state.copyWith(isMicMuted: isMuted);
  }

  void updateWebcamStatus(bool isMuted) {
    state = state.copyWith(isWebcamMuted: isMuted);
  }

  void updateScreenShareStatus(bool isActive) {
    state = state.copyWith(isScreenSharing: isActive);
  }

  void updateShowManageWaitingRoomModal(bool show) {
    state = state.copyWith(showManageWaitingRoomModal: show);
  }
}

final bottomIconsProvider = StateNotifierProvider<BottomIconsNotifier, BottomIconsState>((ref) {
  return BottomIconsNotifier();
});
