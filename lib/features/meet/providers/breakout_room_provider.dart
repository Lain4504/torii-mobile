// Breakout Room Provider - Riverpod State Management
// Simplified version of apps/meet/src/store/slices/breakoutRoomSlice.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';

class BreakoutRoomState {
  final String? receivedInvitationFor;
  final String? parentToken;
  final String? parentRoomId;
  final bool isInBreakoutRoom;
  
  const BreakoutRoomState({
    this.receivedInvitationFor,
    this.parentToken,
    this.parentRoomId,
    this.isInBreakoutRoom = false,
  });
  
  BreakoutRoomState copyWith({
    String? receivedInvitationFor,
    String? parentToken,
    String? parentRoomId,
    bool? isInBreakoutRoom,
  }) {
    return BreakoutRoomState(
      receivedInvitationFor: receivedInvitationFor ?? this.receivedInvitationFor,
      parentToken: parentToken ?? this.parentToken,
      parentRoomId: parentRoomId ?? this.parentRoomId,
      isInBreakoutRoom: isInBreakoutRoom ?? this.isInBreakoutRoom,
    );
  }
}

class BreakoutRoomNotifier extends StateNotifier<BreakoutRoomState> {
  BreakoutRoomNotifier() : super(const BreakoutRoomState());
  
  void updateReceivedInvitationFor(String roomId) {
    state = state.copyWith(receivedInvitationFor: roomId);
  }
  
  void clearInvitation() {
    state = state.copyWith(receivedInvitationFor: null);
  }

  /// Khi chuyển sang breakout room: lưu snapshot phiên phòng chính để có thể quay lại.
  void markEnteredBreakoutRoom({
    required String parentToken,
    required String parentRoomId,
  }) {
    state = state.copyWith(
      parentToken: parentToken,
      parentRoomId: parentRoomId,
      isInBreakoutRoom: true,
      receivedInvitationFor: null,
    );
  }

  void clearBreakoutSession() {
    state = state.copyWith(
      parentToken: null,
      parentRoomId: null,
      isInBreakoutRoom: false,
    );
  }
}

final breakoutRoomProvider = StateNotifierProvider<BreakoutRoomNotifier, BreakoutRoomState>((ref) {
  return BreakoutRoomNotifier();
});
