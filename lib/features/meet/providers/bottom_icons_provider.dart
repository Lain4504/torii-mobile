// Bottom Icons Provider - Riverpod State Management
// Simplified version of apps/meet/src/store/slices/bottomIconsActivitySlice.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomIconsState {
  final String? activeSidePanel; // 'CHAT', 'PARTICIPANTS', 'WHITEBOARD', etc.
  final int totalUnreadChatMsgs;
  final bool isActiveRaisehand;
  final bool isMicMuted;
  final bool isWebcamMuted;
  final bool isScreenSharing;
  final bool showManageWaitingRoomModal;

  const BottomIconsState({
    this.activeSidePanel,
    this.totalUnreadChatMsgs = 0,
    this.isActiveRaisehand = false,
    this.isMicMuted = true,
    this.isWebcamMuted = true,
    this.isScreenSharing = false,
    this.showManageWaitingRoomModal = false,
  });

  BottomIconsState copyWith({
    String? activeSidePanel,
    int? totalUnreadChatMsgs,
    bool? isActiveRaisehand,
    bool? isMicMuted,
    bool? isWebcamMuted,
    bool? isScreenSharing,
    bool? showManageWaitingRoomModal,
  }) {
    return BottomIconsState(
      activeSidePanel: activeSidePanel ?? this.activeSidePanel,
      totalUnreadChatMsgs: totalUnreadChatMsgs ?? this.totalUnreadChatMsgs,
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
    if (state.activeSidePanel == panel) {
       state = state.copyWith(activeSidePanel: null);
    } else {
       state = state.copyWith(activeSidePanel: panel);
    }
  }
  
  void updateTotalUnreadChatMsgs(int count) {
    state = state.copyWith(totalUnreadChatMsgs: count);
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
