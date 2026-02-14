// Breakout Room Provider - Riverpod State Management
// Simplified version of apps/meet/src/store/slices/breakoutRoomSlice.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';

class BreakoutRoomState {
  final String? receivedInvitationFor;
  
  const BreakoutRoomState({
    this.receivedInvitationFor,
  });
  
  BreakoutRoomState copyWith({
    String? receivedInvitationFor,
  }) {
    return BreakoutRoomState(
      receivedInvitationFor: receivedInvitationFor ?? this.receivedInvitationFor,
    );
  }
}

class BreakoutRoomNotifier extends StateNotifier<BreakoutRoomState> {
  BreakoutRoomNotifier() : super(const BreakoutRoomState());
  
  void updateReceivedInvitationFor(String roomId) {
    state = state.copyWith(receivedInvitationFor: roomId);
  }
  
  void clearInvitation() {
    state = const BreakoutRoomState();
  }
}

final breakoutRoomProvider = StateNotifierProvider<BreakoutRoomNotifier, BreakoutRoomState>((ref) {
  return BreakoutRoomNotifier();
});
