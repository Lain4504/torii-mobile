// Session Provider - Riverpod State Management
// 1:1 clone of apps/meet/src/store/slices/sessionSlice.ts
//
// Manages:
// - Current user info (userId, name, metadata)
// - Current room info (roomId, metadata)
// - Recording/RTMP status
// - Screen sharing status
// - Token management

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart' as nats_msg;
import '../core/nats/connect_nats.dart';

part 'session_provider.freezed.dart';

// ============================================================================
// STATE CLASSES
// ============================================================================

/// Screen sharing state
@freezed
class ScreenSharingState with _$ScreenSharingState {
  const factory ScreenSharingState({
    @Default(false) bool isActive,
    @Default('') String sharedBy,
  }) = _ScreenSharingState;
}

/// Current user info
@freezed
class CurrentUser with _$CurrentUser {
  const factory CurrentUser({
    required String sid,
    required String userId,
    required String name,
    @Default(false) bool isRecorder,
    UserMetadata? metadata,
  }) = _CurrentUser;
}

/// Current room info
@freezed
class CurrentRoom with _$CurrentRoom {
  const factory CurrentRoom({
    required String sid,
    required String roomId,
    RoomInfo? metadata,
  }) = _CurrentRoom;
}

/// User device type
enum UserDeviceType {
  mobile,
  tablet,
  desktop,
}

/// Main session state
@freezed
class SessionState with _$SessionState {
  const factory SessionState({
    @Default('') String token,
    String? serverVersion,
    CurrentUser? currentUser,
    required CurrentRoom currentRoom,
    @Default(ScreenSharingState()) ScreenSharingState screenSharing,
    @Default(false) bool isActiveRtmpBroadcasting,
    @Default(false) bool isActiveRecording,
    @Default(false) bool isWebcamPaginating,
    @Default(true) bool isStartup,
    @Default(0) int totalVideoSubscribers,
    @Default(0) int totalAudioSubscribers,
    @Default(UserDeviceType.mobile) UserDeviceType userDeviceType,
    @Default(false) bool isCloud,
  }) = _SessionState;
  
  /// Factory for initial state
  factory SessionState.initial() {
    return SessionState(
      currentRoom: CurrentRoom(
        sid: '',
        roomId: '',
        metadata: null,
      ),
    );
  }
}

// ============================================================================
// NOTIFIER
// ============================================================================

/// Session state notifier
/// Matches: sessionSlice reducers in sessionSlice.ts
class SessionNotifier extends StateNotifier<SessionState> {
  ConnectNats? _connectNats;

  SessionNotifier() : super(SessionState.initial());
  
  /// Add JWT token
  /// Matches: addToken
  void addToken(String token) {
    state = state.copyWith(token: token);
  }
  
  /// Add server version
  /// Matches: addServerVersion
  void addServerVersion(String version) {
    state = state.copyWith(serverVersion: version);
  }
  
  /// Toggle startup state
  /// Matches: toggleStartup
  void toggleStartup(bool isStartup) {
    state = state.copyWith(isStartup: isStartup);
  }
  
  /// Add current user
  /// Matches: addCurrentUser
  void addCurrentUser(CurrentUser user) {
    state = state.copyWith(currentUser: user);
  }
  
  /// Add current room
  /// Matches: addCurrentRoom
  void addCurrentRoom(CurrentRoom room) {
    state = state.copyWith(currentRoom: room);
  }
  
  /// Update screen sharing
  /// Matches: updateScreenSharing
  void updateScreenSharing({required bool isActive, required String sharedBy}) {
    state = state.copyWith(
      screenSharing: ScreenSharingState(isActive: isActive, sharedBy: sharedBy),
    );
  }
  
  /// Update screen sharing (alternative signature)
  void updateScreenSharingState(ScreenSharingState screenSharing) {
    state = state.copyWith(screenSharing: screenSharing);
  }
  
  /// Set webcam paginating
  /// Matches: setWebcamPaginating
  void setWebcamPaginating(bool isPaginating) {
    state = state.copyWith(isWebcamPaginating: isPaginating);
  }
  
  /// Update current user metadata
  /// Matches: updateCurrentUserMetadata
  void updateCurrentUserMetadata(UserMetadata metadata) {
    if (state.currentUser != null) {
      state = state.copyWith(
        currentUser: state.currentUser!.copyWith(metadata: metadata),
      );
    }
  }
  
  /// Update current room metadata
  /// Matches: updateCurrentRoomMetadata
  void updateCurrentRoomMetadata(RoomInfo metadata) {
    state = state.copyWith(
      currentRoom: state.currentRoom.copyWith(metadata: metadata),
      isActiveRtmpBroadcasting: metadata.isActiveRtmp,
      isActiveRecording: metadata.isRecording,
    );
  }
  
  /// Update total video subscribers
  /// Matches: updateTotalVideoSubscribers
  void updateTotalVideoSubscribers(int count) {
    state = state.copyWith(totalVideoSubscribers: count);
  }
  
  /// Update total audio subscribers
  /// Matches: updateTotalAudioSubscribers
  void updateTotalAudioSubscribers(int count) {
    state = state.copyWith(totalAudioSubscribers: count);
  }
  
  /// Update user device type
  /// Matches: updateUserDeviceType
  void updateUserDeviceType(UserDeviceType deviceType) {
    state = state.copyWith(userDeviceType: deviceType);
  }
  
  /// Connect to NATS and LiveKit
  /// This initializes the ConnectNats service and starts the connection process
  Future<void> connect({
    required List<String> natsWSUrls,
    required String token,
    required String roomId,
    required String userId,
    required String roomStreamName,
    required nats_msg.NatsSubjects subjects,
    required Function(String, String) setErrorState,
    required Function(String) setRoomConnectionStatusState,
    required Function(dynamic) setCurrentMediaServerConn,
    required Ref ref,
  }) async {
    // Initialize ConnectNats
    _connectNats = ConnectNats(
      natsWSUrls: natsWSUrls,
      token: token,
      roomId: roomId,
      userId: userId,
      roomStreamName: roomStreamName,
      subjects: subjects,
      setErrorState: setErrorState,
      setRoomConnectionStatusState: setRoomConnectionStatusState,
      setCurrentMediaServerConn: setCurrentMediaServerConn,
      ref: ref,
    );

    // Update state with token
    addToken(token);

    // Open connection
    await _connectNats!.openConn();
  }

  /// Disconnect from session
  Future<void> disconnect() async {
    if (_connectNats != null) {
      await _connectNats!.endSession('User requested disconnect');
      _connectNats = null;
    }
    // Reset state
    state = SessionState.initial();
  }
}

/// Session provider
/// Matches: sessionSlice in Redux store
final sessionProvider = StateNotifierProvider<SessionNotifier, SessionState>((ref) {
  return SessionNotifier();
});

// ============================================================================
// SELECTORS (for convenience)
// ============================================================================

/// Get current user
final currentUserProvider = Provider<CurrentUser?>((ref) {
  return ref.watch(sessionProvider).currentUser;
});

/// Get current room
final currentRoomProvider = Provider<CurrentRoom>((ref) {
  return ref.watch(sessionProvider).currentRoom;
});

/// Check if recording is active
final isActiveRecordingProvider = Provider<bool>((ref) {
  return ref.watch(sessionProvider).isActiveRecording;
});

/// Check if RTMP is active
final isActiveRtmpProvider = Provider<bool>((ref) {
  return ref.watch(sessionProvider).isActiveRtmpBroadcasting;
});

/// Check if user is presenter
final isPresenterProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.metadata?.isPresenter ?? false;
});

/// Check if user is admin
final isAdminProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.metadata?.isAdmin ?? false;
});
