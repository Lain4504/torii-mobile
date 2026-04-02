import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fixnum/fixnum.dart';
import 'package:torii_app/features/meet/data/datasources/meet_api_service.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_breakout_room.pb.dart'
    as breakout_room;

@immutable
class BreakoutRoomsState {
  final List<breakout_room.BreakoutRoom> activeRooms;
  final breakout_room.BreakoutRoom? myRoom;
  final bool isLoading;
  final String? error;

  const BreakoutRoomsState({
    this.activeRooms = const [],
    this.myRoom,
    this.isLoading = false,
    this.error,
  });

  BreakoutRoomsState copyWith({
    List<breakout_room.BreakoutRoom>? activeRooms,
    breakout_room.BreakoutRoom? myRoom,
    bool? isLoading,
    String? error,
  }) {
    return BreakoutRoomsState(
      activeRooms: activeRooms ?? this.activeRooms,
      myRoom: myRoom ?? this.myRoom,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class BreakoutRoomsNotifier extends StateNotifier<BreakoutRoomsState> {
  final Ref ref;
  Timer? _pollingTimer;

  BreakoutRoomsNotifier(this.ref) : super(const BreakoutRoomsState());

  Future<void> fetchList({bool silent = false}) async {
    if (!silent) {
      state = state.copyWith(isLoading: true, error: null);
    }
    try {
      final api = ref.read(meetApiServiceProvider);
      final res = await api.getBreakoutRooms();
      if (!res.status) {
        state = state.copyWith(
          isLoading: false,
          error: res.msg.isNotEmpty ? res.msg : 'Không tải được danh sách phòng nhóm',
        );
        return;
      }
      final rooms = res.rooms.toList();
      rooms.sort((a, b) => b.title.compareTo(a.title));
      state = state.copyWith(activeRooms: rooms, isLoading: false, error: null);
    } catch (e) {
      if (kDebugMode) {
        debugPrint('BreakoutRoomsNotifier.fetchList error: $e');
      }
      if (!silent) {
        state = state.copyWith(isLoading: false, error: e.toString());
      }
    }
  }

  Future<void> fetchMyRoom({bool silent = false}) async {
    try {
      final api = ref.read(meetApiServiceProvider);
      final res = await api.getMyBreakoutRooms();
      if (!res.status) {
        if (!silent) {
          state = state.copyWith(error: res.msg.isNotEmpty ? res.msg : null);
        }
        return;
      }
      final room = res.hasRoom() ? res.room : null;
      state = state.copyWith(myRoom: room, error: null);
    } catch (e) {
      if (kDebugMode) {
        debugPrint('BreakoutRoomsNotifier.fetchMyRoom error: $e');
      }
      if (!silent) {
        state = state.copyWith(error: e.toString());
      }
    }
  }

  void clear() {
    stopPolling();
    state = const BreakoutRoomsState();
  }

  void startPolling({Duration interval = const Duration(seconds: 10)}) {
    _pollingTimer?.cancel();
    // Fetch immediately then poll
    unawaited(fetchList(silent: true));
    _pollingTimer = Timer.periodic(interval, (_) {
      unawaited(fetchList(silent: true));
    });
  }

  void stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
  }

  Future<breakout_room.BreakoutRoomRes> endSingleRoom({
    required String breakoutRoomId,
    required String roomId,
  }) async {
    final api = ref.read(meetApiServiceProvider);
    final res = await api.endSingleBreakoutRoom(
      breakout_room.EndBreakoutRoomReq(breakoutRoomId: breakoutRoomId, roomId: roomId),
    );
    await fetchList(silent: true);
    return res;
  }

  Future<breakout_room.BreakoutRoomRes> endAllRooms() async {
    final api = ref.read(meetApiServiceProvider);
    final res = await api.endAllBreakoutRooms();
    await fetchList(silent: true);
    return res;
  }

  Future<breakout_room.BreakoutRoomRes> extendDuration({
    required String breakoutRoomId,
    required int minutes,
    required String roomId,
  }) async {
    final api = ref.read(meetApiServiceProvider);
    final res = await api.increaseBreakoutRoomDuration(
      breakout_room.IncreaseBreakoutRoomDurationReq(
        breakoutRoomId: breakoutRoomId,
        duration: Int64(minutes),
        roomId: roomId,
      ),
    );
    await fetchList(silent: true);
    return res;
  }

  Future<breakout_room.BreakoutRoomRes> broadcastMessage({
    required String msg,
    required String roomId,
  }) async {
    final api = ref.read(meetApiServiceProvider);
    final res = await api.sendBreakoutRoomMsg(
      breakout_room.BroadcastBreakoutRoomMsgReq(msg: msg, roomId: roomId),
    );
    return res;
  }
}

final breakoutRoomsProvider =
    StateNotifierProvider<BreakoutRoomsNotifier, BreakoutRoomsState>((ref) {
  return BreakoutRoomsNotifier(ref);
});

void unawaited(Future<void> f) {
  // Fire-and-forget but don't swallow errors silently in debug.
  f.catchError((e, st) {
    if (kDebugMode) {
      debugPrint('unawaited error: $e\n$st');
    }
  });
}

