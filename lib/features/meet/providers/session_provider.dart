// Session Provider - Riverpod State Management
//
// Manages:
// - Current user info (userId, name, metadata)
// - Current room info (roomId, metadata)
// - Recording/RTMP status
// - Screen sharing status
// - Token management

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart' as nats_msg;
import '../core/nats/connect_nats.dart';
import '../core/livekit/connect_livekit.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kReleaseMode, debugPrint;
import 'package:torii_app/features/meet/data/models/room_info.dart';
import 'package:torii_app/features/meet/data/models/user_metadata.dart';
import 'package:torii_app/features/meet/data/datasources/meet_api_service.dart';
import 'package:torii_app/features/meet/providers/breakout_room_provider.dart';
import 'package:torii_app/features/meet/providers/bottom_icons_provider.dart';
import 'package:torii_app/features/meet/providers/room_settings_provider.dart';

part 'session_provider.freezed.dart';

// ============================================================================
// STATE CLASSES
// ============================================================================

/// Screen sharing state
class ScreenSharingState {
  final bool isActive;
  final String sharedBy;

  const ScreenSharingState({
    this.isActive = false,
    this.sharedBy = '',
  });

  ScreenSharingState copyWith({
    bool? isActive,
    String? sharedBy,
  }) {
    return ScreenSharingState(
      isActive: isActive ?? this.isActive,
      sharedBy: sharedBy ?? this.sharedBy,
    );
  }
}

/// Current user info
class CurrentUser {
  final String sid;
  final String userId;
  final String name;
  final bool isRecorder;
  final UserMetadata? metadata;

  const CurrentUser({
    required this.sid,
    required this.userId,
    required this.name,
    this.isRecorder = false,
    this.metadata,
  });

  CurrentUser copyWith({
    String? sid,
    String? userId,
    String? name,
    bool? isRecorder,
    UserMetadata? metadata,
  }) {
    return CurrentUser(
      sid: sid ?? this.sid,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      isRecorder: isRecorder ?? this.isRecorder,
      metadata: metadata ?? this.metadata,
    );
  }
}

/// Current room info
class CurrentRoom {
  final String sid;
  final String roomId;
  final RoomInfo? metadata;

  const CurrentRoom({
    required this.sid,
    required this.roomId,
    this.metadata,
  });

  CurrentRoom copyWith({
    String? sid,
    String? roomId,
    RoomInfo? metadata,
  }) {
    return CurrentRoom(
      sid: sid ?? this.sid,
      roomId: roomId ?? this.roomId,
      metadata: metadata ?? this.metadata,
    );
  }
}

/// User device type
enum UserDeviceType {
  mobile,
  tablet,
  desktop,
}

/// Main session state
@freezed
abstract class SessionState with _$SessionState {
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
    @Default(0) int totalParticipants,
    @Default(UserDeviceType.mobile) UserDeviceType userDeviceType,
    @Default(false) bool isCloud,
    @Default(false) bool isNatsConnected,
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
class SessionNotifier extends StateNotifier<SessionState> {
  final Ref ref;
  ConnectNats? _connectNats;
  ConnectLivekit? _connectLivekit;
  void Function()? _onRemoteSessionEnded;
  bool _resumeReconnectInProgress = false;
  DateTime? _lastResumeReconnectAt;
  Timer? _connectionHealthTimer;
  int _staleInboundStrikeCount = 0;

  SessionNotifier(this.ref) : super(SessionState.initial());
  
  /// Add JWT token
  /// Matches: addToken
  void addToken(String token) {
    state = state.copyWith(token: token);
  }
  
  /// Update NATS connection status
  /// Matches: updateIsNatsServerConnected
  void updateIsNatsServerConnected(bool isConnected) {
    state = state.copyWith(isNatsConnected: isConnected);
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

  void updateTotalParticipants(int count) {
    state = state.copyWith(totalParticipants: count);
  }
  
  /// Update user device type
  /// Matches: updateUserDeviceType
  void updateUserDeviceType(UserDeviceType deviceType) {
    state = state.copyWith(userDeviceType: deviceType);
  }
  
  /// Đóng NATS + LiveKit hiện tại trước khi [connect] lại (breakout ↔ main).
  /// Tránh [TrackPublishException] khi publish vào phòng mới trong khi track/socket cũ chưa giải phóng.
  Future<void> _teardownBeforeReconnect() async {
    final nats = _connectNats;
    final lk = _connectLivekit;
    if (nats != null) {
      await nats.endSession(
        'meet.room-switch',
        userInitiatedLeave: true,
        absorbSessionState: false,
      );
      _connectNats = null;
      if (lk != null) {
        try {
          lk.dispose();
        } catch (_) {}
      }
      _connectLivekit = null;
      return;
    }
    if (lk != null) {
      try {
        await lk.disconnectRoom(true);
        lk.dispose();
      } catch (_) {}
      _connectLivekit = null;
    }
  }

  /// Connect to NATS and LiveKit
  /// This initializes the ConnectNats service and starts the connection process
  /// [keepMeetingRoomVisible]: khi đang đổi phòng trong cùng phiên (breakout ↔ main), tránh reset
  /// [isStartup] → `true` (sẽ hiện lại màn chọn cam/mic + [JoinMeetingScreen] dùng token phòng chính).
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
    bool initialAudioEnabled = false,
    bool initialVideoEnabled = false,
    bool keepMeetingRoomVisible = false,
    /// Host/web client kết thúc phòng → [ConnectNats.endSession]; reset session + pop khỏi `/meet`.
    void Function()? onRemoteSessionEnded,
  }) async {
    _onRemoteSessionEnded = onRemoteSessionEnded;
    if (_connectNats != null || _connectLivekit != null) {
      _connectionHealthTimer?.cancel();
      _connectionHealthTimer = null;
      await _teardownBeforeReconnect();
    }
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
      onRemoteSessionEnded: onRemoteSessionEnded,
    );

    // Initialize ConnectLivekit (media server connection)
    _connectLivekit = ConnectLivekit(
      ref: ref,
      localUserId: userId,
      onError: setErrorState,
      // Forward LiveKit connection status to the same callback as web (roomConnectionStatus)
      onConnectionStatusChange: (status) {
        if (kDebugMode) {
          debugPrint('SessionProvider: LiveKit status - $status');
        }
        // Web: uses roomConnectionStatus = 'media-server-conn-start' / 'media-server-conn-established'
        // Mobile: reuse the same status string via setRoomConnectionStatusState callback
        setRoomConnectionStatusState(status);
      },
      initialAudioEnabled: initialAudioEnabled,
      initialVideoEnabled: initialVideoEnabled,
    );

    // Link NATS and LiveKit
    _connectNats!.setMediaServerConn(_connectLivekit!);

    // Update state with token
    addToken(token);
    if (keepMeetingRoomVisible) {
      toggleStartup(false);
    }

    // Open connection
    await _connectNats!.openConn();
    _startConnectionHealthWatchdog();
    
    // Note: LiveKit connection should be triggered when Room Info is received
    // and contains LiveKit URL/Token. specific logic depends on backend implementation.
    // For now, we assume NATS connection success is enough to proceed.
  }

  void _startConnectionHealthWatchdog() {
    _connectionHealthTimer?.cancel();
    _staleInboundStrikeCount = 0;
    _connectionHealthTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      final natsConn = _connectNats;
      if (natsConn == null) return;
      if (!natsConn.isConnected) return;

      final idle = DateTime.now().difference(natsConn.lastInboundAt);
      if (idle > const Duration(seconds: 120)) {
        _staleInboundStrikeCount++;
        if (kDebugMode) {
          debugPrint(
            'SessionProvider watchdog: stale inbound (${idle.inSeconds}s), strike=$_staleInboundStrikeCount',
          );
        }
        if (_staleInboundStrikeCount >= 3) {
          _staleInboundStrikeCount = 0;
          reconnectAfterResume();
        }
      } else {
        _staleInboundStrikeCount = 0;
      }
    });
  }

  /// Khi app resume: nếu NATS + LiveKit còn sống thì không teardown (tránh lỗi/toast giả);
  /// chỉ reconnect đầy đủ khi phiên thật sự gãy.
  Future<void> reconnectAfterResume() async {
    if (_resumeReconnectInProgress) return;
    final now = DateTime.now();
    if (_lastResumeReconnectAt != null &&
        now.difference(_lastResumeReconnectAt!) < const Duration(seconds: 5)) {
      return;
    }

    // Tránh teardown khi NATS + LiveKit vẫn ổn — reconnect đầy đủ hay gây lỗi LiveKit giả và toast lỗi.
    final nats = _connectNats;
    final lk = _connectLivekit;
    final lkState = lk?.room.connectionState;
    if (nats != null &&
        nats.isConnected &&
        lk != null &&
        (lkState == ConnectionState.connected ||
            lkState == ConnectionState.reconnecting)) {
      if (lkState == ConnectionState.connected) {
        lk.syncFooterWithLocalParticipant();
      }
      _lastResumeReconnectAt = now;
      if (kDebugMode) {
        debugPrint(
          'reconnectAfterResume: giữ phiên (không disconnect), NATS+LiveKit còn sống',
        );
      }
      return;
    }

    _lastResumeReconnectAt = now;
    _resumeReconnectInProgress = true;

    try {
      _staleInboundStrikeCount = 0;
      final jwt = state.token;
      if (jwt.isEmpty) return;

      final api = ref.read(meetApiServiceProvider);
      api.setManualToken(jwt);
      final verify = await api.verifyToken(isProduction: kReleaseMode);
      if (!verify.status) {
        ref.read(roomSettingsProvider.notifier).addUserNotification(
              UserNotification(
                message: verify.msg.isNotEmpty
                    ? verify.msg
                    : 'Không thể xác thực lại phiên họp. Vui lòng kiểm tra mạng.',
                typeOption: 'warning',
              ),
            );
        return;
      }
      if (verify.natsWsUrls.isEmpty ||
          verify.roomId.isEmpty ||
          verify.userId.isEmpty ||
          verify.roomStreamName.isEmpty) {
        ref.read(roomSettingsProvider.notifier).addUserNotification(
              const UserNotification(
                message: 'Thiếu thông tin kết nối từ server khi đồng bộ lại phiên',
                typeOption: 'warning',
              ),
            );
        return;
      }

      final subjects = verify.hasNatsSubjects()
          ? verify.natsSubjects
          : nats_msg.NatsSubjects(
              systemApiWorker: 'sysApiWorker',
              systemJsWorker: 'sysJsWorker',
              systemPublic: 'sysPublic',
              systemPrivate: 'sysPrivate',
              chat: 'chat',
              whiteboard: 'whiteboard',
              dataChannel: 'dataChannel',
            );

      final bottom = ref.read(bottomIconsProvider);
      final initialAudioEnabled = !bottom.isMicMuted;
      final initialVideoEnabled = !bottom.isWebcamMuted;

      await disconnect(
        userInitiatedLeave: true,
        sessionEndMessage: 'resume-reconnect',
        preserveMeetingRoomUi: true,
      );

      await connect(
        natsWSUrls: verify.natsWsUrls,
        token: jwt,
        roomId: verify.roomId,
        userId: verify.userId,
        roomStreamName: verify.roomStreamName,
        subjects: subjects,
        keepMeetingRoomVisible: true,
        initialAudioEnabled: initialAudioEnabled,
        initialVideoEnabled: initialVideoEnabled,
        setErrorState: (title, message) {
          ref.read(roomSettingsProvider.notifier).addUserNotification(
                UserNotification(
                  message: '$title: $message',
                  typeOption: 'error',
                ),
              );
        },
        setRoomConnectionStatusState: (status) {
          if (kDebugMode) {
            debugPrint('reconnectAfterResume status: $status');
          }
          if (status == 'media-server-conn-established') {
            toggleStartup(false);
            ref.read(roomSettingsProvider.notifier).addUserNotification(
                  const UserNotification(
                    message: 'Đã kết nối lại thành công',
                    typeOption: 'info',
                  ),
                );
          }
        },
        setCurrentMediaServerConn: (_) {},
        onRemoteSessionEnded: _onRemoteSessionEnded,
      );
    } catch (e, st) {
      if (kDebugMode) {
        debugPrint('reconnectAfterResume error: $e\n$st');
      }
      ref.read(roomSettingsProvider.notifier).addUserNotification(
            UserNotification(
              message: 'Đồng bộ lại kết nối thất bại: $e',
              typeOption: 'error',
            ),
          );
    } finally {
      _resumeReconnectInProgress = false;
    }
  }

  /// Sau khi [ConnectNats.endSession] dọn LiveKit/NATS (vd. SESSION_ENDED từ server).
  /// Tránh gọi [disconnect] lại → lặp vô hạn.
  void absorbRemoteSessionEnd() {
    _connectionHealthTimer?.cancel();
    _connectionHealthTimer = null;
    final lk = _connectLivekit;
    _connectLivekit = null;
    _connectNats = null;
    if (lk != null) {
      try {
        lk.dispose();
      } catch (_) {}
    }
    // Đang ở breakout và còn token phòng cha → sắp reconnect về main; không bật lại màn chọn cam/mic.
    final bk = ref.read(breakoutRoomProvider);
    final reconnectingToParent = bk.isInBreakoutRoom &&
        (bk.parentToken != null && bk.parentToken!.isNotEmpty);
    state = SessionState.initial().copyWith(
      isStartup: reconnectingToParent ? false : true,
    );
  }

  /// Ngắt kết nối phiên họp.
  ///
  /// * [userInitiatedLeave]: `true` khi người dùng rời phòng hoặc sau khi host gọi API kết thúc —
  ///   dùng thông điệp giống web, không kích hoạt snackbar lỗi từ [ConnectNats.endSession].
  /// * [sessionEndMessage]: ví dụ web `notifications.user-logged-out`, header `Người dùng đã đăng xuất`.
  /// * [preserveMeetingRoomUi]: `true` khi chuyển phòng breakout ↔ main — giữ [isStartup]=false
  ///   (không về [JoinMeetingScreen] chọn cam/mic).
  Future<void> disconnect({
    bool userInitiatedLeave = false,
    String sessionEndMessage = 'notifications.user-logged-out',
    bool preserveMeetingRoomUi = false,
  }) async {
    _connectionHealthTimer?.cancel();
    _connectionHealthTimer = null;
    if (_connectLivekit != null) {
      await _connectLivekit!.disconnectRoom(true);
      _connectLivekit!.dispose();
      _connectLivekit = null;
    }

    if (_connectNats != null) {
      await _connectNats!.endSession(
        sessionEndMessage,
        userInitiatedLeave: userInitiatedLeave,
      );
      _connectNats = null;
    }

    if (preserveMeetingRoomUi) {
      state = SessionState.initial().copyWith(isStartup: false);
      return;
    }
    state = SessionState.initial();
  }

  /// Trưởng phòng kết thúc phòng cho tất cả (web [EndMeetingButton] khi `isAdmin`).
  /// Sau khi API thành công: đóng LiveKit/NATS và reset state như người rời chủ động.
  Future<({bool ok, String message})> endRoomAsAdmin() async {
    final roomId = state.currentRoom.roomId;
    if (roomId.isEmpty) {
      return (ok: false, message: 'Thiếu roomId');
    }
    final bk = ref.read(breakoutRoomProvider);
    final isEndingBreakoutRoom = bk.isInBreakoutRoom &&
        (bk.parentToken?.isNotEmpty ?? false) &&
        (bk.parentRoomId?.isNotEmpty ?? false);
    final jwt = state.token;
    if (jwt.isEmpty) {
      return (ok: false, message: 'Thiếu token phiên');
    }
    final api = ref.read(meetApiServiceProvider);
    api.setManualToken(jwt);
    try {
      final res = await api.endRoom(roomId: roomId);
      if (!res.status) {
        return (
          ok: false,
          message: res.msg.isNotEmpty ? res.msg : 'Không kết thúc được phòng',
        );
      }
      await disconnect(
        userInitiatedLeave: true,
        sessionEndMessage: 'notifications.room-ended-by-host',
        // Nếu đang ở breakout thì server sẽ kích hoạt luồng "SESSION_ENDED -> reconnect
        // về parent room". Giữ isStartup=false để tránh bật lại màn chọn cam/mic.
        preserveMeetingRoomUi: isEndingBreakoutRoom,
      );
      return (ok: true, message: '');
    } on MeetApiException catch (e) {
      return (ok: false, message: e.message);
    }
  }

  /// Khi app vào nền / tắt màn hình, OS thường dừng camera trong khi [bottomIconsProvider]
  /// vẫn có thể báo đang bật → remote không nhận được video, nút bấm lệch với thực tế.
  /// Tắt camera có chủ đích để đồng bộ với LiveKit; user bật lại sau khi mở app.
  void muteCameraForBackgroundIfNeeded() {
    final bottom = ref.read(bottomIconsProvider);
    if (bottom.isWebcamMuted) return;
    _connectLivekit?.toggleVideo(false);
  }

  /// Khớp web [useWatchVisibilityChange]: báo phòng khi UI app hidden/visible (admin/participant list).
  void notifyAppVisibilityToRoom({required bool isVisible}) {
    final n = _connectNats;
    if (n == null || !n.isConnected) return;
    n.notifyUserInterfaceVisibility(isVisible: isVisible);
  }

  /// Get the LiveKit connection instance
  ConnectLivekit? get livekitConn => _connectLivekit;
  
  /// Get the NATS connection instance
  ConnectNats? get natsConn => _connectNats;
}

/// Session provider
/// Matches: sessionSlice in Redux store
final sessionProvider = StateNotifierProvider<SessionNotifier, SessionState>((ref) {
  return SessionNotifier(ref);
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
