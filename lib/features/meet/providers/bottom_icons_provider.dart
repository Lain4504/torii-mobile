// Bottom Icons Provider - Riverpod State Management
// Simplified version of apps/meet/src/store/slices/bottomIconsActivitySlice.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomIconsState {
  final String? activeSidePanel; // 'CHAT', 'PARTICIPANTS', 'WHITEBOARD', etc.
  final int totalUnreadChatMsgs;
  final bool isActiveRaisehand;
  
  const BottomIconsState({
    this.activeSidePanel,
    this.totalUnreadChatMsgs = 0,
    this.isActiveRaisehand = false,
  });
  
  BottomIconsState copyWith({
    String? activeSidePanel,
    int? totalUnreadChatMsgs,
    bool? isActiveRaisehand,
  }) {
    return BottomIconsState(
      activeSidePanel: activeSidePanel ?? this.activeSidePanel,
      totalUnreadChatMsgs: totalUnreadChatMsgs ?? this.totalUnreadChatMsgs,
      isActiveRaisehand: isActiveRaisehand ?? this.isActiveRaisehand,
    );
  }
}

class BottomIconsNotifier extends StateNotifier<BottomIconsState> {
  BottomIconsNotifier() : super(const BottomIconsState());
  
  void setActiveSidePanel(String? panel) {
    state = state.copyWith(activeSidePanel: panel);
  }
  
  void updateTotalUnreadChatMsgs(int count) {
    state = state.copyWith(totalUnreadChatMsgs: count);
  }
  
  void updateIsActiveRaisehand(bool isActive) {
    state = state.copyWith(isActiveRaisehand: isActive);
  }
}

final bottomIconsProvider = StateNotifierProvider<BottomIconsNotifier, BottomIconsState>((ref) {
  return BottomIconsNotifier();
});
