// Breakout Room Provider - Riverpod State Management
// Simplified version of apps/meet/src/store/slices/breakoutRoomSlice.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/datasources/meet_api_service.dart';
import '../data/models/proto/wajlc_breakout_room.pb.dart' as breakout_room;

/// Khớp web `breakoutRoomApi.util.invalidateTags(['List','My_Rooms'])`.
final breakoutRoomsListRevisionProvider = StateProvider<int>((ref) => 0);

class _Unset {
  const _Unset();
}

const _unset = _Unset();

class BreakoutRoomState {
  final String? receivedInvitationFor;
  final String? parentToken;
  final String? parentRoomId;
  final bool isInBreakoutRoom;
  /// Tăng mỗi lần nhận invitation mới (dù cùng roomId).
  /// Mục tiêu: listener UI không phụ thuộc so sánh chuỗi roomId.
  final int invitationSeq;
  
  const BreakoutRoomState({
    this.receivedInvitationFor,
    this.parentToken,
    this.parentRoomId,
    this.isInBreakoutRoom = false,
    this.invitationSeq = 0,
  });
  
  BreakoutRoomState copyWith({
    Object? receivedInvitationFor = _unset,
    Object? parentToken = _unset,
    Object? parentRoomId = _unset,
    bool? isInBreakoutRoom,
    int? invitationSeq,
  }) {
    return BreakoutRoomState(
      receivedInvitationFor: identical(receivedInvitationFor, _unset)
          ? this.receivedInvitationFor
          : receivedInvitationFor as String?,
      parentToken: identical(parentToken, _unset)
          ? this.parentToken
          : parentToken as String?,
      parentRoomId: identical(parentRoomId, _unset)
          ? this.parentRoomId
          : parentRoomId as String?,
      isInBreakoutRoom: isInBreakoutRoom ?? this.isInBreakoutRoom,
      invitationSeq: invitationSeq ?? this.invitationSeq,
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

/// Khớp web `useGetMyBreakoutRoomsQuery` — phòng breakout server gán cho user hiện tại.
final myBreakoutRoomsProvider =
    FutureProvider.autoDispose<List<breakout_room.BreakoutRoom>>((ref) async {
  ref.watch(breakoutRoomsListRevisionProvider);
  final api = ref.read(meetApiServiceProvider);
  final res = await api.listMyBreakoutRooms();
  if (!res.status) {
    return [];
  }
  return List<breakout_room.BreakoutRoom>.from(res.rooms);
});
