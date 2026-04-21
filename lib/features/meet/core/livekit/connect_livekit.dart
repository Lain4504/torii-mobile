// ConnectLivekit - LiveKit Connection Manager
//
// Core responsibilities:
// - Manage LiveKit room connection
// - Handle track subscriptions (audio/video/screen share)
// - E2EE encryption/decryption
// - Connection quality monitoring
// - Event emission for UI updates
// - Integration with NATS

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';

// Providers
import 'package:torii_app/features/meet/providers/session_provider.dart';
import 'package:torii_app/features/meet/providers/participant_provider.dart';
import 'package:torii_app/features/meet/providers/room_settings_provider.dart';
import 'package:torii_app/features/meet/providers/bottom_icons_provider.dart';
import 'package:torii_app/features/meet/providers/active_speakers_provider.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_analytics.pb.dart'
    as analytics;

// Types
import 'livekit_types.dart';
import 'handle_media_tracks.dart';
import '../meet_handler_context.dart';

// Constants matching web config
const bool kEnableDynacast = true;
const bool kEnableSimulcast = true;
const bool kStopMicTrackOnMute = false;
const String kVideoCodec = 'vp8'; // vp8, vp9, av1
/// Gom nhiều cập nhật chất lượng liên tiếp thành một lần gửi NATS (analytics + data).
const Duration kNatsConnectionQualityDebounce = Duration(milliseconds: 400);

/// LiveKit connection manager
///
/// It manages the LiveKit room connection, track subscriptions, and events.
class ConnectLivekit implements IConnectLivekit {
  // Subscriber maps
  final Map<String, RemoteParticipant> _audioSubscribersMap = {};
  final Map<String, Participant> _videoSubscribersMap = {};
  final Map<String, List<TrackPublication>> _screenShareTracksMap = {};

  // Riverpod ref for state management
  final Ref ref;

  MeetHandlerContext? _meetHandlerContext;

  // Connection config
  @override
  final String localUserId;
  final bool enabledE2EE;
  final String? encryptionKey;

  // Callbacks
  final Function(String title, String message) onError;
  final Function(String status) onConnectionStatusChange;

  // LiveKit instances
  late final Room _room;
  late final HandleMediaTracks handleMediaTracks;
  EventsListener<RoomEvent>? _roomEventListener;

  // State
  bool _wasNormalDisconnected = false;
  String? _activeLiveKitUrl;
  String? _activeLiveKitToken;
  ConnectionState? _lastLoggedConnectionState;

  /// Tránh spam toast khi duy trì poor/lost; vẫn luôn gửi NATS như web.
  ConnectionQuality? _lastLocalQualityForUiNotify;

  Timer? _natsConnectionQualityTimer;
  ConnectionQuality? _pendingNatsConnectionQuality;

  // Stream controllers for events
  final _screenShareStatusController = StreamController<bool>.broadcast();
  final _videoStatusController = StreamController<bool>.broadcast();
  final _audioSubscribersController =
      StreamController<Map<String, RemoteParticipant>>.broadcast();
  final _videoSubscribersController =
      StreamController<Map<String, Participant>>.broadcast();
  final _screenShareTracksController =
      StreamController<Map<String, List<TrackPublication>>>.broadcast();

  // Initial media state
  final bool initialAudioEnabled;
  final bool initialVideoEnabled;

  /// Constructor
  ConnectLivekit({
    required this.ref,
    required this.localUserId,
    required this.onError,
    required this.onConnectionStatusChange,
    this.enabledE2EE = false,
    this.encryptionKey,
    this.initialAudioEnabled = false,
    this.initialVideoEnabled = false,
  }) {
    // Initialize media tracks handler
    handleMediaTracks = HandleMediaTracks(connectLivekit: this, ref: ref);

    // Configure room
    _room = _configureRoom();
  }

  @override
  MeetHandlerContext? get meetHandlerContext => _meetHandlerContext;

  @override
  void attachMeetHandlerContext(MeetHandlerContext ctx) {
    _meetHandlerContext = ctx;
  }

  @override
  Room get room => _room;

  @override
  Map<String, Participant> get videoSubscribersMap => _videoSubscribersMap;

  @override
  Map<String, RemoteParticipant> get audioSubscribersMap =>
      _audioSubscribersMap;

  @override
  Map<String, List<TrackPublication>> get screenShareTracksMap =>
      _screenShareTracksMap;

  // Event streams
  Stream<bool> get onScreenShareStatus => _screenShareStatusController.stream;
  Stream<bool> get onVideoStatus => _videoStatusController.stream;
  Stream<Map<String, RemoteParticipant>> get onAudioSubscribers =>
      _audioSubscribersController.stream;
  Stream<Map<String, Participant>> get onVideoSubscribers =>
      _videoSubscribersController.stream;
  Stream<Map<String, List<TrackPublication>>> get onScreenShareTracks =>
      _screenShareTracksController.stream;

  /// Initialize connection to LiveKit server
  @override
  Future<void> initializeConnection(String url, String token) async {
    if (_room.connectionState == ConnectionState.connected &&
        _activeLiveKitUrl == url &&
        _activeLiveKitToken == token) {
      if (kDebugMode) {
        print(
          'ConnectLivekit: Skip duplicate initializeConnection (same url/token)',
        );
      }
      return;
    }

    onConnectionStatusChange('media-server-conn-start');

    try {
      // Enable E2EE if configured
      if (enabledE2EE && encryptionKey != null && encryptionKey!.isNotEmpty) {
        // TODO: Implement E2EE key provider
        // await _e2eeManager?.setKey(encryptionKey!);
        // await _room.setE2EEEnabled(true);
        if (kDebugMode) {
          print('ConnectLivekit: E2EE enabled (implementation pending)');
        }
      }

      // Connect to room
      await _room.connect(url, token);
      _activeLiveKitUrl = url;
      _activeLiveKitToken = token;

      // Apply initial media state (tách try để một thất bại không chặn cái còn lại).
      try {
        if (initialAudioEnabled) {
          await _room.localParticipant?.setMicrophoneEnabled(true);
        }
      } catch (e, st) {
        if (kDebugMode) {
          print('ConnectLivekit: setMicrophoneEnabled failed: $e\n$st');
        }
      }
      try {
        if (initialVideoEnabled) {
          await _room.localParticipant?.setCameraEnabled(true);
        }
      } catch (e, st) {
        if (kDebugMode) {
          print('ConnectLivekit: setCameraEnabled failed: $e\n$st');
        }
      }
      _syncFooterIconsFromLocalParticipant();

      // Initialize participants
      await _initiateParticipants();

      final lpQuality = _room.localParticipant;
      if (lpQuality != null) {
        ref.read(participantProvider.notifier).updateParticipant(
              userId: localUserId,
              changes: {
                'connectionQuality': lpQuality.connectionQuality.name,
              },
            );
      }

      onConnectionStatusChange('media-server-conn-established');

      if (kDebugMode) {
        print('ConnectLivekit: Connected to LiveKit server');
      }
    } catch (error) {
      if (kDebugMode) {
        print('ConnectLivekit: Connection error - $error');
      }
      _activeLiveKitUrl = null;
      _activeLiveKitToken = null;
      onConnectionStatusChange('error');
      onError('Error', error.toString());
    }
  }

  /// Configure room with options
  Room _configureRoom() {
    // Determine video codec
    String videoCodec = kVideoCodec;
    // Note: VP9/AV1 support detection not available in Flutter SDK yet
    // Will default to VP8 for compatibility

    final roomOptions = RoomOptions(
      adaptiveStream: true,
      dynacast: kEnableDynacast,
      defaultVideoPublishOptions: VideoPublishOptions(
        simulcast: kEnableSimulcast,
        videoCodec: videoCodec,
      ),
      defaultAudioPublishOptions: const AudioPublishOptions(
        // stopMicTrackOnMute is deprecated in newer LiveKit SDK
      ),
      defaultCameraCaptureOptions: CameraCaptureOptions(
        maxFrameRate: 30,
        params: VideoParametersPresets.h720_169,
      ),
    );

    // TODO: E2EE configuration
    // if (enabledE2EE) {
    //   roomOptions.e2eeOptions = E2EEOptions(...);
    // }

    final room = Room(roomOptions: roomOptions);

    // Register event listeners
    _registerRoomEventListeners(room);

    return room;
  }

  /// Register room event listeners
  void _registerRoomEventListeners(Room room) {
    // Connection state events
    room.addListener(_onRoomStateChanged);

    // Track events
    room.addListener(_onTrackEvent);

    // Participant events
    room.addListener(_onParticipantEvent);

    // Clone web behavior: react to realtime media/participant events and
    // keep camera/audio/screenshare maps always in sync.
    _roomEventListener?.dispose();
    _roomEventListener = room.createListener();
    _roomEventListener!
      ..on<RoomReconnectedEvent>((_) {
        _lastLocalQualityForUiNotify = null;
        _cancelNatsConnectionQualityDebounce();
        // Sau reconnect, đồng bộ nút mic/cam với trạng thái track thật (tránh UI lệch).
        _syncFooterIconsFromLocalParticipant();
        // Rebuild đầy đủ sau reconnect để tránh lệch state
        _rebuildTrackSubscribersFromRoom();
      })
      ..on<ParticipantConnectedEvent>((_) {
        _rebuildTrackSubscribersFromRoom();
      })
      ..on<ParticipantDisconnectedEvent>((_) {
        _rebuildTrackSubscribersFromRoom();
      })
      ..on<TrackSubscribedEvent>((event) {
        // Web ConnectLivekit: RoomEvent.TrackSubscribed → HandleMediaTracks.trackSubscribed
        handleMediaTracks.trackSubscribed(
          event.track,
          event.publication,
          event.participant,
        );
        // Không rebuild toàn bộ screenShare map ở đây (dễ gây lag khi screen share bật/tắt).
        // Screen share map: chỉ [HandleMediaTracks.trackSubscribed] → addScreenShareTrack (tránh double-add).
        _rebuildAudioVideoSubscribersFromRoom();
      })
      ..on<TrackUnsubscribedEvent>((event) {
        handleMediaTracks.trackUnsubscribed(
          event.track,
          event.publication,
          event.participant,
        );
        _rebuildAudioVideoSubscribersFromRoom();
        if (event.publication.source == TrackSource.screenShareVideo ||
            event.publication.source == TrackSource.screenShareAudio) {
          removeScreenShareTrack(
            event.participant.identity,
            publicationSid: event.publication.sid,
          );
        }
      })
      ..on<TrackPublishedEvent>((_) {
        _rebuildAudioVideoSubscribersFromRoom();
      })
      ..on<TrackUnpublishedEvent>((event) {
        handleMediaTracks.trackUnsubscribed(
          event.publication.track,
          event.publication,
          event.participant,
        );
        _rebuildAudioVideoSubscribersFromRoom();
        if (event.publication.source == TrackSource.screenShareVideo ||
            event.publication.source == TrackSource.screenShareAudio) {
          removeScreenShareTrack(
            event.participant.identity,
            publicationSid: event.publication.sid,
          );
        }
      })
      ..on<LocalTrackPublishedEvent>((event) {
        handleMediaTracks.localTrackPublished(
          event.publication,
          event.participant,
        );
        _rebuildAudioVideoSubscribersFromRoom();
        // Screen share: [HandleMediaTracks.localTrackPublished] đã addScreenShareTrack — không gọi lại.
      })
      ..on<LocalTrackUnpublishedEvent>((event) {
        handleMediaTracks.localTrackUnpublished(
          event.publication,
          event.participant,
        );
        _rebuildAudioVideoSubscribersFromRoom();
        if (event.publication.source == TrackSource.screenShareVideo ||
            event.publication.source == TrackSource.screenShareAudio) {
          removeScreenShareTrack(
            event.participant.identity,
            publicationSid: event.publication.sid,
          );
        }
      })
      ..on<TrackMutedEvent>((event) {
        handleMediaTracks.trackMuted(event.publication, event.participant);
        if (event.participant.identity == localUserId &&
            event.publication.source == TrackSource.camera) {
          ref.read(bottomIconsProvider.notifier).updateWebcamStatus(true);
        }
        _rebuildAudioVideoSubscribersFromRoom();
      })
      ..on<TrackUnmutedEvent>((event) {
        handleMediaTracks.trackUnmuted(event.publication, event.participant);
        if (event.participant.identity == localUserId &&
            event.publication.source == TrackSource.camera) {
          ref.read(bottomIconsProvider.notifier).updateWebcamStatus(false);
        }
        _rebuildAudioVideoSubscribersFromRoom();
      })
      ..on<TrackSubscriptionExceptionEvent>((event) {
        final p = event.participant;
        if (p != null) {
          handleMediaTracks.trackSubscriptionFailed(
            p,
            trackSid: event.sid,
            reason: event.reason,
          );
        }
      })
      ..on<TrackStreamStateUpdatedEvent>((event) {
        handleMediaTracks.trackStreamStateChanged(
          event.publication,
          event.streamState,
          event.participant,
        );
      })
      ..on<ParticipantConnectionQualityUpdatedEvent>((event) {
        final local = _room.localParticipant;
        if (local == null || event.participant.identity != local.identity) {
          return;
        }
        _onLocalConnectionQualityChanged(event.connectionQuality);
      })
      ..on<ActiveSpeakersChangedEvent>(_onActiveSpeakersChanged);

    if (kDebugMode) {
      print('ConnectLivekit: Event listeners registered');
    }
  }

  /// Rebuild chỉ audio/video subscriber maps (không đụng tới screenShareTracksMap).
  /// Mục tiêu: tránh rebuild toàn bộ track map khi screen share bật/tắt,
  /// gây trễ UI vì `pub.track`/room state cập nhật không đồng bộ ngay lập tức.
  void _rebuildAudioVideoSubscribersFromRoom() {
    _audioSubscribersMap.clear();
    _videoSubscribersMap.clear();

    final local = _room.localParticipant;
    if (local != null) {
      for (final pub in local.trackPublications.values) {
        if (!pub.subscribed || pub.muted) continue;
        if (pub.source == TrackSource.camera) {
          _videoSubscribersMap[local.identity] = local;
          continue;
        }
        if (pub.track == null) continue;
        if (pub.source == TrackSource.microphone) {
          // local audio không render theo logic mobile (giữ consistent với addAudioSubscriber)
        }
      }
    }

    for (final p in _room.remoteParticipants.values) {
      for (final pub in p.trackPublications.values) {
        if (!pub.subscribed || pub.muted) continue;
        if (pub.source == TrackSource.camera) {
          _videoSubscribersMap[p.identity] = p;
          continue;
        }
        if (pub.track == null) continue;
        if (pub.source == TrackSource.microphone) {
          _audioSubscribersMap[p.identity] = p;
        }
      }
    }

    _syncAudioSubscribers();
    _syncVideoSubscribers();
  }

  /// Web `AudioActivityManager` + Redux: cập nhật ai đang nói từ server LiveKit.
  void _onActiveSpeakersChanged(ActiveSpeakersChangedEvent event) {
    final notifier = ref.read(activeSpeakersProvider.notifier);
    final current = ref.read(activeSpeakersProvider).speakers;
    final speakingIds = event.speakers.map((p) => p.identity).toSet();

    for (final entry in current.entries) {
      if (!speakingIds.contains(entry.key) && entry.value.isSpeaking) {
        notifier.addOrUpdateSpeaker(
          userId: entry.key,
          name: entry.value.name,
          isSpeaking: false,
          audioLevel: 0.0,
        );
      }
    }

    for (final p in event.speakers) {
      final name = p.name.isNotEmpty ? p.name : p.identity;
      notifier.addOrUpdateSpeaker(
        userId: p.identity,
        name: name,
        isSpeaking: true,
        audioLevel: 1.0,
      );
    }

    if (_videoSubscribersMap.length > 1) {
      _syncVideoSubscribers();
    }
  }

  /// Handle room state changes
  void _onRoomStateChanged() {
    if (_lastLoggedConnectionState == _room.connectionState) {
      return;
    }
    _lastLoggedConnectionState = _room.connectionState;
    switch (_room.connectionState) {
      case ConnectionState.connecting:
        if (kDebugMode) {
          print('ConnectLivekit: Connecting...');
        }
        break;

      case ConnectionState.connected:
        if (kDebugMode) {
          print('ConnectLivekit: Connected');
        }
        // Dismiss any reconnecting notifications
        break;

      case ConnectionState.reconnecting:
        if (kDebugMode) {
          print('ConnectLivekit: Reconnecting...');
        }
        // Show reconnecting notification
        ref
            .read(roomSettingsProvider.notifier)
            .addUserNotification(
              UserNotification(
                message: 'Máy chủ truyền thông mất kết nối - Đang kết nối lại',
                typeOption: 'warning',
              ),
            );
        break;

      case ConnectionState.disconnected:
        _onDisconnected();
        break;
    }
  }

  /// Handle track events
  void _onTrackEvent() {
    // Track/participant thực tế xử lý qua [EventsListener] trong [_registerRoomEventListeners].
    // Tuyệt đối không gọi [_room.addListener] ở đây: mỗi lần notify sẽ chồng listener → mất ổn định.
  }

  /// Handle participant events
  void _onParticipantEvent() {
    // Giữ callback rỗng; cùng lý do như [_onTrackEvent].
  }

  /// Initialize participants after connection
  Future<void> _initiateParticipants() async {
    _rebuildTrackSubscribersFromRoom();

    if (kDebugMode) {
      print(
        'ConnectLivekit: Initialized ${_room.remoteParticipants.length} participants',
      );
    }
  }

  /// Close local tracks
  void _closeLocalTracks() {
    final trackPublications =
        _room.localParticipant?.trackPublications.values.toList() ?? [];
    for (final publication in trackPublications) {
      publication.track?.stop();
    }
  }

  /// Disconnect from room
  @override
  Future<void> disconnectRoom(bool normalDisconnect) async {
    if (_room.connectionState == ConnectionState.disconnected) {
      _activeLiveKitUrl = null;
      _activeLiveKitToken = null;
      return;
    }
    _lastLocalQualityForUiNotify = null;
    _cancelNatsConnectionQualityDebounce();
    _wasNormalDisconnected = normalDisconnect;
    _closeLocalTracks();
    await _room.disconnect();
    _activeLiveKitUrl = null;
    _activeLiveKitToken = null;
  }

  /// Set error status
  @override
  void setErrorStatus(String title, String reason) {
    onConnectionStatusChange('error');
    onError(title, reason);
  }

  /// Handle disconnection
  void _onDisconnected() {
    if (_wasNormalDisconnected) {
      // Normal disconnect, no error message
      return;
    }

    _closeLocalTracks();

    // Note: disconnectReason getter is not available in newer LiveKit SDK
    onError('Phòng bị ngắt kết nối', 'Kết nối đến phòng họp đã bị ngắt');
  }

  /// Khớp web [ConnectLivekit.localUserConnectionQualityChanged].
  void _onLocalConnectionQualityChanged(ConnectionQuality q) {
    ref.read(participantProvider.notifier).updateParticipant(
          userId: localUserId,
          changes: {'connectionQuality': q.name},
        );

    final isBad =
        q == ConnectionQuality.poor || q == ConnectionQuality.lost;
    final wasBad = _lastLocalQualityForUiNotify == ConnectionQuality.poor ||
        _lastLocalQualityForUiNotify == ConnectionQuality.lost;
    if (isBad && !wasBad) {
      final msg = q == ConnectionQuality.lost
          ? 'Mất kết nối hoàn toàn'
          : 'Chất lượng kết nối của bạn không tốt';
      ref.read(roomSettingsProvider.notifier).addUserNotification(
            UserNotification(
              message: msg,
              typeOption: 'error',
            ),
          );
    }
    _lastLocalQualityForUiNotify = q;

    _scheduleNatsConnectionQualityPush(q);
  }

  void _scheduleNatsConnectionQualityPush(ConnectionQuality q) {
    _pendingNatsConnectionQuality = q;
    _natsConnectionQualityTimer?.cancel();
    _natsConnectionQualityTimer = Timer(
      kNatsConnectionQualityDebounce,
      _flushPendingNatsConnectionQuality,
    );
  }

  void _flushPendingNatsConnectionQuality() {
    _natsConnectionQualityTimer = null;
    final q = _pendingNatsConnectionQuality;
    _pendingNatsConnectionQuality = null;
    if (q == null) return;

    final nats = ref.read(sessionProvider.notifier).natsConn;
    if (nats == null) return;
    nats.sendAnalyticsData(
      eventName:
          analytics.AnalyticsEvents.ANALYTICS_EVENT_USER_CONNECTION_QUALITY,
      eventType: analytics.AnalyticsEventType.ANALYTICS_EVENT_TYPE_USER,
      eventValueString: q.name,
    );
    unawaited(
      nats.sendDataMessage(
        type: 'USER_CONNECTION_QUALITY_CHANGE',
        msg: q.name,
      ),
    );
  }

  void _cancelNatsConnectionQualityDebounce() {
    _natsConnectionQualityTimer?.cancel();
    _natsConnectionQualityTimer = null;
    _pendingNatsConnectionQuality = null;
  }

  /// Gợi ý lỗi thân thiện khi không mở được mic/camera (Flutter không có RoomEvent MediaDevicesError như web).
  static String _mediaToggleErrorMessage(Object error, {required bool isVideo}) {
    final s = error.toString().toLowerCase();
    if (s.contains('permission') ||
        s.contains('denied') ||
        s.contains('authorized')) {
      return isVideo
          ? 'Không có quyền truy cập camera. Hãy bật quyền trong Cài đặt ứng dụng.'
          : 'Không có quyền truy cập micro. Hãy bật quyền trong Cài đặt ứng dụng.';
    }
    if (s.contains('in use') ||
        s.contains('busy') ||
        s.contains('could not start') ||
        s.contains('failed to')) {
      return isVideo
          ? 'Không thể dùng camera. Thử đóng ứng dụng khác đang dùng camera.'
          : 'Không thể dùng micro. Kiểm tra thiết bị âm thanh hoặc app khác đang chiếm micro.';
    }
    return isVideo
        ? 'Không thể điều chỉnh camera. Kiểm tra kết nối mạng và thử lại.'
        : 'Không thể điều chỉnh micro. Kiểm tra kết nối mạng và thử lại.';
  }

  /// Add screen share track
  @override
  void addScreenShareTrack(String userId, TrackPublication track) {
    final tracks = <TrackPublication>[];
    if (_screenShareTracksMap.containsKey(userId)) {
      tracks.addAll(_screenShareTracksMap[userId]!);
    }
    tracks.add(track);

    _screenShareTracksMap[userId] = tracks;
    _syncScreenShareTracks();
  }

  /// Remove screen share track
  @override
  void removeScreenShareTrack(String userId, {String? publicationSid}) {
    final existing = _screenShareTracksMap[userId];
    if (existing == null || existing.isEmpty) {
      return;
    }
    if (publicationSid == null || publicationSid.isEmpty) {
      _screenShareTracksMap.remove(userId);
      _syncScreenShareTracks();
      return;
    }

    existing.removeWhere((pub) => pub.sid == publicationSid);
    if (existing.isEmpty) {
      _screenShareTracksMap.remove(userId);
    } else {
      _screenShareTracksMap[userId] = existing;
    }
    _syncScreenShareTracks();
  }

  /// Sync screen share tracks
  void _syncScreenShareTracks() {
    _emitScreenShareSessionFromMap();
  }

  /// Pushes map to listeners and updates session only when a screen-share *video* track is active.
  void _emitScreenShareSessionFromMap() {
    _screenShareTracksController.add(Map.from(_screenShareTracksMap));

    String? activeSharerUserId;
    for (final e in _screenShareTracksMap.entries) {
      for (final pub in e.value) {
        if (pub.source == TrackSource.screenShareVideo &&
            pub.track is VideoTrack &&
            !pub.muted) {
          activeSharerUserId = e.key;
          break;
        }
      }
      if (activeSharerUserId != null) break;
    }

    if (activeSharerUserId != null) {
      _screenShareStatusController.add(true);
      ref
          .read(sessionProvider.notifier)
          .updateScreenSharing(isActive: true, sharedBy: activeSharerUserId);
    } else {
      _screenShareStatusController.add(false);
      ref
          .read(sessionProvider.notifier)
          .updateScreenSharing(isActive: false, sharedBy: '');
    }
  }

  /// Add audio subscriber
  @override
  void addAudioSubscriber(Participant participant) {
    if (participant.audioTrackPublications.isEmpty) {
      return;
    }

    final userId = participant.identity;
    final existUser = ref.read(participantProvider).participants[userId];
    if (existUser != null && !existUser.metadata.isOnline) {
      return;
    }

    // Don't add local audio
    if (participant.identity == _room.localParticipant?.identity) {
      return;
    }

    if (participant is RemoteParticipant) {
      _audioSubscribersMap[participant.identity] = participant;
      _syncAudioSubscribers();
    }
  }

  /// Remove audio subscriber
  @override
  void removeAudioSubscriber(String userId) {
    if (!_audioSubscribersMap.containsKey(userId)) {
      return;
    }

    _audioSubscribersMap.remove(userId);
    _syncAudioSubscribers();
  }

  /// Sync audio subscribers
  void _syncAudioSubscribers() {
    _audioSubscribersController.add(Map.from(_audioSubscribersMap));

    // Update session provider
    ref
        .read(sessionProvider.notifier)
        .updateTotalAudioSubscribers(_audioSubscribersMap.length);
  }

  /// Add video subscriber
  @override
  void addVideoSubscriber(Participant participant) {
    if (participant.videoTrackPublications.isEmpty) {
      return;
    }

    final existUser =
        ref.read(participantProvider).participants[participant.identity];
    // Chỉ chặn khi NATS đã biết user và đánh dấu offline. Bỏ chặn `existUser == null`
    // để tránh race: track subscribe trước khi REQ_JOINED_USERS_LIST/reconcile (giống hậu quả web).
    if (existUser != null && !existUser.metadata.isOnline) {
      return;
    }

    _videoSubscribersMap[participant.identity] = participant;
    _syncVideoSubscribers();
  }

  /// Remove video subscriber
  @override
  void removeVideoSubscriber(String userId) {
    if (!_videoSubscribersMap.containsKey(userId)) {
      return;
    }

    _videoSubscribersMap.remove(userId);
    _syncVideoSubscribers();
  }

  /// Sync video subscribers
  void _syncVideoSubscribers() {
    // Update session provider
    ref
        .read(sessionProvider.notifier)
        .updateTotalVideoSubscribers(_videoSubscribersMap.length);

    // Emit status
    if (_videoSubscribersMap.isNotEmpty) {
      _videoStatusController.add(true);
    } else {
      _videoStatusController.add(false);
    }

    if (_videoSubscribersMap.length <= 1) {
      _videoSubscribersController.add(Map.from(_videoSubscribersMap));
      return;
    }

    final speakersState = ref.read(activeSpeakersProvider).speakers;
    final entries = _videoSubscribersMap.entries.toList();
    entries.sort((a, b) {
      final aSpeaker = speakersState[a.key];
      final bSpeaker = speakersState[b.key];
      final aIsSpeaking = aSpeaker?.isSpeaking ?? false;
      final bIsSpeaking = bSpeaker?.isSpeaking ?? false;
      if (aIsSpeaking != bIsSpeaking) {
        return aIsSpeaking ? -1 : 1;
      }
      final aLast = aSpeaker?.lastSpokeAt ?? 0;
      final bLast = bSpeaker?.lastSpokeAt ?? 0;
      if (aLast != bLast) {
        return bLast.compareTo(aLast);
      }
      final aLive = a.value.lastSpokeAt?.millisecondsSinceEpoch ?? 0;
      final bLive = b.value.lastSpokeAt?.millisecondsSinceEpoch ?? 0;
      if (aLive != bLive) {
        return bLive.compareTo(aLive);
      }
      return a.value.joinedAt.millisecondsSinceEpoch
          .compareTo(b.value.joinedAt.millisecondsSinceEpoch);
    });
    _videoSubscribersController.add(Map.fromEntries(entries));
  }

  /// Rebuild all track subscriber maps from current LiveKit room state.
  /// This keeps mobile behavior aligned with web's HandleMediaTracks flow.
  void _rebuildTrackSubscribersFromRoom() {
    _audioSubscribersMap.clear();
    _videoSubscribersMap.clear();
    _screenShareTracksMap.clear();

    final local = _room.localParticipant;
    if (local != null) {
      for (final pub in local.trackPublications.values) {
        if (pub.source == TrackSource.screenShareVideo ||
            pub.source == TrackSource.screenShareAudio) {
          _screenShareTracksMap.putIfAbsent(local.identity, () => []).add(pub);
          continue;
        }
        if (!pub.subscribed || pub.muted) continue;
        if (pub.source == TrackSource.camera) {
          _videoSubscribersMap[local.identity] = local;
          continue;
        }
        if (pub.track == null) continue;
      }
    }

    for (final p in _room.remoteParticipants.values) {
      for (final pub in p.trackPublications.values) {
        if (pub.source == TrackSource.screenShareVideo ||
            pub.source == TrackSource.screenShareAudio) {
          _screenShareTracksMap.putIfAbsent(p.identity, () => []).add(pub);
          continue;
        }
        if (!pub.subscribed || pub.muted) continue;
        if (pub.source == TrackSource.camera) {
          _videoSubscribersMap[p.identity] = p;
          continue;
        }
        if (pub.track == null) continue;
        if (pub.source == TrackSource.microphone) {
          _audioSubscribersMap[p.identity] = p;
        }
      }
    }

    _syncAudioSubscribers();
    _syncVideoSubscribers();
    _emitScreenShareSessionFromMap();
  }

  /// Chỉ publish khi engine đã [ConnectionState.connected] (SDK sẽ throw `UnexpectedConnectionState` nếu không).
  bool get _canPublishMedia =>
      _room.connectionState == ConnectionState.connected;

  void _notifyMediaUnavailable(String detail) {
    ref.read(roomSettingsProvider.notifier).addUserNotification(
          UserNotification(
            message: detail,
            typeOption: 'warning',
          ),
        );
  }

  /// Đồng bộ footer mic/cam với publication thực tế (sau lỗi publish hoặc reconnect).
  void _syncFooterIconsFromLocalParticipant() {
    final lp = _room.localParticipant;
    if (lp == null) return;
    final micPub = lp.getTrackPublicationBySource(TrackSource.microphone);
    final camPub = lp.getTrackPublicationBySource(TrackSource.camera);
    final micMuted = micPub == null || micPub.muted;
    final camMuted = camPub == null || camPub.muted;
    ref.read(bottomIconsProvider.notifier).updateMicStatus(micMuted);
    ref.read(bottomIconsProvider.notifier).updateWebcamStatus(camMuted);
  }

  /// Khi app resume mà không gọi [disconnect]: chỉ cập nhật nút mic/cam theo publication thật.
  void syncFooterWithLocalParticipant() {
    _syncFooterIconsFromLocalParticipant();
  }

  /// Toggle audio
  @override
  Future<void> toggleAudio(bool enable) async {
    if (_room.localParticipant == null) return;

    // Bật mic cần publisher — khi mất kết nối / đang reconnect sẽ throw.
    if (enable && !_canPublishMedia) {
      _notifyMediaUnavailable(
        'Chưa kết nối tới máy chủ media. Đợi kết nối lại rồi thử bật micro.',
      );
      _syncFooterIconsFromLocalParticipant();
      return;
    }

    try {
      await _room.localParticipant!.setMicrophoneEnabled(enable);
      ref.read(bottomIconsProvider.notifier).updateMicStatus(!enable);
      if (kDebugMode) {
        print('ConnectLivekit: Audio toggled to $enable');
      }
    } catch (e, st) {
      if (kDebugMode) {
        print('ConnectLivekit: toggleAudio failed $e\n$st');
      }
      _notifyMediaUnavailable(
        _mediaToggleErrorMessage(e, isVideo: false),
      );
      _syncFooterIconsFromLocalParticipant();
    }
  }

  /// Toggle video
  @override
  Future<void> toggleVideo(bool enable) async {
    if (_room.localParticipant == null) return;

    if (enable && !_canPublishMedia) {
      _notifyMediaUnavailable(
        'Chưa kết nối tới máy chủ media. Đợi kết nối lại rồi thử bật camera.',
      );
      _syncFooterIconsFromLocalParticipant();
      return;
    }

    try {
      await _room.localParticipant!.setCameraEnabled(enable);
      ref.read(bottomIconsProvider.notifier).updateWebcamStatus(!enable);
      if (kDebugMode) {
        print('ConnectLivekit: Video toggled to $enable');
      }
    } catch (e, st) {
      if (kDebugMode) {
        print('ConnectLivekit: toggleVideo failed $e\n$st');
      }
      _notifyMediaUnavailable(
        _mediaToggleErrorMessage(e, isVideo: true),
      );
      _syncFooterIconsFromLocalParticipant();
    }
  }

  /// Dispose resources
  void dispose() {
    _cancelNatsConnectionQualityDebounce();
    _roomEventListener?.dispose();
    _screenShareStatusController.close();
    _videoStatusController.close();
    _audioSubscribersController.close();
    _videoSubscribersController.close();
    _screenShareTracksController.close();

    _room.removeListener(_onRoomStateChanged);
    _room.removeListener(_onTrackEvent);
    _room.removeListener(_onParticipantEvent);

    _room.dispose();
  }
}
