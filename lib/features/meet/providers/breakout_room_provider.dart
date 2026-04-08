// Breakout Room Provider - Riverpod State Management
// Simplified version of apps/meet/src/store/slices/breakoutRoomSlice.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';

class BreakoutRoomState {
  final String? receivedInvitationFor;
  final String? parentToken;
  final String? parentRoomId;
  final bool isInBreakoutRoom;
  /// Tăng mỗi lần nhận invitation mới (dù cùng roomId).
  /// Mục tiêu: listener UI không phụ thuộc so sánh chuỗi roomId.
  final int invitationSeq;
  /// Tăng khi danh sách breakout rooms cần được refetch (event-driven).
  final int roomsRefreshSeq;
  
  const BreakoutRoomState({
    this.receivedInvitationFor,
    this.parentToken,
    this.parentRoomId,
    this.isInBreakoutRoom = false,
    this.invitationSeq = 0,
    this.roomsRefreshSeq = 0,
  });
  
  BreakoutRoomState copyWith({
    String? receivedInvitationFor,
    String? parentToken,
    String? parentRoomId,
    bool? isInBreakoutRoom,
    int? invitationSeq,
    int? roomsRefreshSeq,
  }) {
    return BreakoutRoomState(
      receivedInvitationFor: receivedInvitationFor ?? this.receivedInvitationFor,
      parentToken: parentToken ?? this.parentToken,
      parentRoomId: parentRoomId ?? this.parentRoomId,
      isInBreakoutRoom: isInBreakoutRoom ?? this.isInBreakoutRoom,
      invitationSeq: invitationSeq ?? this.invitationSeq,
      roomsRefreshSeq: roomsRefreshSeq ?? this.roomsRefreshSeq,
    );
  }
}

class BreakoutRoomNotifier extends StateNotifier<BreakoutRoomState> {
  BreakoutRoomNotifier() : super(const BreakoutRoomState());
  
  void updateReceivedInvitationFor(String roomId) {
    // Increment để UI chắc chắn re-open khi invitation mới về (dù cùng roomId).
    state = state.copyWith(
      receivedInvitationFor: roomId,
      invitationSeq: state.invitationSeq + 1,
    );
  }
  
  void clearInvitation() {
    state = state.copyWith(receivedInvitationFor: null);
  }

  /// Signal UI to refetch breakout rooms list/my room.
  void bumpRoomsRefresh() {
    state = state.copyWith(roomsRefreshSeq: state.roomsRefreshSeq + 1);
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
