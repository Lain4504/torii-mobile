// ConnectLivekit - LiveKit Connection Manager
// 1:1 clone of apps/meet/src/helpers/livekit/ConnectLivekit.ts
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
import 'package:event/event.dart' as evt;

// Providers
import 'package:torii_app/features/meet/providers/session_provider.dart';
import 'package:torii_app/features/meet/providers/participant_provider.dart';
import 'package:torii_app/features/meet/providers/room_settings_provider.dart';

// Types
import 'livekit_types.dart';
import 'handle_media_tracks.dart';

// NATS (for analytics)
import '../nats/connect_nats.dart';

// Constants matching web config
const bool kEnableDynacast = true;
const bool kEnableSimulcast = true;
const bool kStopMicTrackOnMute = false;
const String kVideoCodec = 'vp8'; // vp8, vp9, av1

/// LiveKit connection manager
/// 
/// This class is a 1:1 clone of the web ConnectLivekit.ts class.
/// It manages the LiveKit room connection, track subscriptions, and events.
class ConnectLivekit implements IConnectLivekit {
  // Subscriber maps
  final Map<String, RemoteParticipant> _audioSubscribersMap = {};
  final Map<String, Participant> _videoSubscribersMap = {};
  final Map<String, List<TrackPublication>> _screenShareTracksMap = {};
  
  // Riverpod ref for state management
  final Ref ref;
  
  // NATS connection reference (for analytics)
  ConnectNats? _natsConn;
  
  // Connection config
  final String localUserId;
  final bool enabledE2EE;
  final String? encryptionKey;
  
  // Callbacks
  final Function(String title, String message) onError;
  final Function(String status) onConnectionStatusChange;
  
  // LiveKit instances
  late final Room _room;
  E2EEManager? _e2eeManager;
  late final HandleMediaTracks handleMediaTracks;
  
  // State
  bool _wasNormalDisconnected = false;
  
  // Event emitters (simplified - using Stream controllers)
  final _screenShareStatusController = StreamController<bool>.broadcast();
  final _videoStatusController = StreamController<bool>.broadcast();
  final _audioSubscribersController = StreamController<Map<String, RemoteParticipant>>.broadcast();
  final _videoSubscribersController = StreamController<Map<String, Participant>>.broadcast();
  final _screenShareTracksController = StreamController<Map<String, List<TrackPublication>>>.broadcast();
  
  /// Constructor
  /// Matches: constructor() in ConnectLivekit.ts
  ConnectLivekit({
    required this.ref,
    required this.localUserId,
    required this.onError,
    required this.onConnectionStatusChange,
    this.enabledE2EE = false,
    this.encryptionKey,
    ConnectNats? natsConn,
  }) : _natsConn = natsConn {
    // Initialize media tracks handler
    handleMediaTracks = HandleMediaTracks(connectLivekit: this, ref: ref);
    
    // Configure room
    _room = _configureRoom();
  }
  
  /// Set NATS connection for analytics
  void setNatsConn(ConnectNats conn) {
    _natsConn = conn;
  }
  
  @override
  Room get room => _room;
  
  @override
  Map<String, Participant> get videoSubscribersMap => _videoSubscribersMap;
  
  @override
  Map<String, RemoteParticipant> get audioSubscribersMap => _audioSubscribersMap;
  
  @override
  Map<String, List<TrackPublication>> get screenShareTracksMap => _screenShareTracksMap;
  
  // Event streams
  Stream<bool> get onScreenShareStatus => _screenShareStatusController.stream;
  Stream<bool> get onVideoStatus => _videoStatusController.stream;
  Stream<Map<String, RemoteParticipant>> get onAudioSubscribers => _audioSubscribersController.stream;
  Stream<Map<String, Participant>> get onVideoSubscribers => _videoSubscribersController.stream;
  Stream<Map<String, List<TrackPublication>>> get onScreenShareTracks => _screenShareTracksController.stream;
  
  /// Initialize connection to LiveKit server
  /// Matches: initializeConnection() in ConnectLivekit.ts
  @override
  Future<void> initializeConnection(String url, String token) async {
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
      
      // Initialize participants
      await _initiateParticipants();
      
      onConnectionStatusChange('media-server-conn-established');
      
      if (kDebugMode) {
        print('ConnectLivekit: Connected to LiveKit server');
      }
    } catch (error) {
      if (kDebugMode) {
        print('ConnectLivekit: Connection error - $error');
      }
      onConnectionStatusChange('error');
      onError('Error', error.toString());
    }
  }
  
  /// Configure room with options
  /// Matches: configureRoom() in ConnectLivekit.ts
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
      defaultAudioPublishOptions: AudioPublishOptions(
        stopMicTrackOnMute: kStopMicTrackOnMute,
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
  /// Matches: room.on() calls in ConnectLivekit.ts
  void _registerRoomEventListeners(Room room) {
    // Connection state events
    room.addListener(_onRoomStateChanged);
    
    // Track events
    room.addListener(_onTrackEvent);
    
    // Participant events
    room.addListener(_onParticipantEvent);
    
    if (kDebugMode) {
      print('ConnectLivekit: Event listeners registered');
    }
  }
  
  /// Handle room state changes
  void _onRoomStateChanged() {
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
        ref.read(roomSettingsProvider.notifier).addUserNotification(
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
    // Track subscribed
    _room.onTrackSubscribed = (track, publication, participant) {
      handleMediaTracks.trackSubscribed(track, publication, participant);
    };
    
    // Track unsubscribed
    _room.onTrackUnsubscribed = (track, publication, participant) {
      handleMediaTracks.trackUnsubscribed(track, publication, participant);
    };
    
    // Local track published
    _room.localParticipant?.onTrackPublished = (publication) {
      handleMediaTracks.localTrackPublished(publication, _room.localParticipant!);
    };
    
    // Local track unpublished
    _room.localParticipant?.onTrackUnpublished = (publication) {
      handleMediaTracks.localTrackUnpublished(publication, _room.localParticipant!);
    };
    
    // Track muted
    _room.onTrackMuted = (publication, participant) {
      handleMediaTracks.trackMuted(publication, participant);
    };
    
    // Track unmuted
    _room.onTrackUnmuted = (publication, participant) {
      handleMediaTracks.trackUnmuted(publication, participant);
    };
    
    // Track subscription failed
    _room.onTrackSubscriptionFailed = (sid, error, participant) {
      handleMediaTracks.trackSubscriptionFailed(sid, error, participant);
    };
  }
  
  /// Handle participant events
  void _onParticipantEvent() {
    // Connection quality changed for local participant
    _room.localParticipant?.onConnectionQualityChanged = (quality) {
      _localUserConnectionQualityChanged(quality);
    };
  }
  
  /// Initialize participants after connection
  /// Matches: initiateParticipants() in ConnectLivekit.ts
  Future<void> _initiateParticipants() async {
    // Process all remote participants
    for (final participant in _room.remoteParticipants.values) {
      for (final publication in participant.trackPublications.values) {
        if (publication.subscribed) {
          if (publication.source == TrackSource.screenShareVideo ||
              publication.source == TrackSource.screenShareAudio) {
            // Screen share track
            ref.read(participantProvider.notifier).updateParticipant(
              userId: participant.identity,
              changes: {'screenShareTrack': 1},
            );
            addScreenShareTrack(participant.identity, publication);
          } else if (publication.source == TrackSource.camera) {
            // Video track
            addVideoSubscriber(participant);
          }
        }
      }
    }
    
    if (kDebugMode) {
      print('ConnectLivekit: Initialized ${_room.remoteParticipants.length} participants');
    }
  }
  
  /// Close local tracks
  void _closeLocalTracks() {
    for (final publication in _room.localParticipant?.trackPublications.values ?? []) {
      publication.track?.stop();
    }
  }
  
  /// Disconnect from room
  /// Matches: disconnectRoom() in ConnectLivekit.ts
  @override
  Future<void> disconnectRoom(bool normalDisconnect) async {
    if (_room.connectionState == ConnectionState.connected) {
      _wasNormalDisconnected = normalDisconnect;
      _closeLocalTracks();
      await _room.disconnect();
    }
  }
  
  /// Set error status
  @override
  void setErrorStatus(String title, String reason) {
    onConnectionStatusChange('error');
    onError(title, reason);
  }
  
  /// Handle disconnection
  /// Matches: onDisconnected() in ConnectLivekit.ts
  void _onDisconnected() {
    if (_wasNormalDisconnected) {
      // Normal disconnect, no error message
      return;
    }
    
    _closeLocalTracks();
    
    final reason = _room.disconnectReason;
    onError(
      'Phòng bị ngắt kết nối',
      _getDisconnectErrorReasonText(reason),
    );
  }
  
  /// Get disconnect error reason text
  /// Matches: getDisconnectErrorReasonText() in ConnectLivekit.ts
  String _getDisconnectErrorReasonText(DisconnectReason? reason) {
    String msg = 'Ngắt kết nối phòng (Lý do: ${reason?.toString() ?? 'KHÔNG XÁC ĐỊNH'})';
    
    switch (reason) {
      case DisconnectReason.clientInitiated:
        msg = 'Ngắt kết nối bởi người dùng';
        break;
      case DisconnectReason.duplicateIdentity:
        msg = 'Tài khoản đang đăng nhập ở nơi khác';
        break;
      case DisconnectReason.serverShutdown:
        msg = 'Máy chủ đã tắt';
        break;
      case DisconnectReason.participantRemoved:
        msg = 'Người tham gia đã bị xóa';
        break;
      case DisconnectReason.roomDeleted:
        msg = 'Phòng họp đã kết thúc';
        break;
      case DisconnectReason.stateMismatch:
        msg = 'Trạng thái không khớp';
        break;
      default:
        break;
    }
    
    return msg;
  }
  
  /// Handle local user connection quality changed
  /// Matches: localUserConnectionQualityChanged() in ConnectLivekit.ts
  void _localUserConnectionQualityChanged(ConnectionQuality quality) {
    // Update participant provider
    ref.read(participantProvider.notifier).updateParticipant(
      userId: localUserId,
      changes: {'connectionQuality': quality.name},
    );
    
    // Show notification for poor/lost connection
    if (quality == ConnectionQuality.poor || quality == ConnectionQuality.lost) {
      String msg = 'Chất lượng kết nối của bạn không tốt';
      if (quality == ConnectionQuality.lost) {
        msg = 'Mất kết nối hoàn toàn';
      }
      
      ref.read(roomSettingsProvider.notifier).addUserNotification(
        UserNotification(
          message: msg,
          typeOption: 'error',
        ),
      );
    }
    
    // TODO: Send analytics data to NATS
    // conn.sendAnalyticsData(...)
    // conn.sendDataMessage(USER_CONNECTION_QUALITY_CHANGE, quality)
    
    if (kDebugMode) {
      print('ConnectLivekit: Connection quality changed - ${quality.name}');
    }
  }
  
  /// Add screen share track
  /// Matches: addScreenShareTrack() in ConnectLivekit.ts
  @override
  void addScreenShareTrack(String userId, TrackPublication track) {
    final participant = ref.read(participantProvider).participants[userId];
    if (participant == null || !participant.metadata.isOnline) {
      return;
    }
    
    final tracks = <TrackPublication>[];
    if (_screenShareTracksMap.containsKey(userId)) {
      tracks.addAll(_screenShareTracksMap[userId]!);
    }
    tracks.add(track);
    
    _screenShareTracksMap[userId] = tracks;
    _syncScreenShareTracks(userId);
  }
  
  /// Remove screen share track
  /// Matches: removeScreenShareTrack() in ConnectLivekit.ts
  @override
  void removeScreenShareTrack(String userId) {
    _screenShareTracksMap.remove(userId);
    _syncScreenShareTracks(userId);
  }
  
  /// Sync screen share tracks
  /// Matches: syncScreenShareTracks() in ConnectLivekit.ts
  void _syncScreenShareTracks(String userId) {
    // Notify about status
    if (_screenShareTracksMap.isNotEmpty) {
      _screenShareStatusController.add(true);
      ref.read(sessionProvider.notifier).updateScreenSharing(
        isActive: true,
        sharedBy: userId,
      );
    } else {
      _screenShareStatusController.add(false);
      ref.read(sessionProvider.notifier).updateScreenSharing(
        isActive: false,
        sharedBy: '',
      );
    }
    
    // Emit new tracks map
    _screenShareTracksController.add(Map.from(_screenShareTracksMap));
  }
  
  /// Add audio subscriber
  /// Matches: addAudioSubscriber() in ConnectLivekit.ts
  @override
  void addAudioSubscriber(Participant participant) {
    if (participant.audioTrackPublications.isEmpty) {
      return;
    }
    
    final userId = participant.identity;
    final existUser = ref.read(participantProvider).participants[userId];
    if (existUser == null || !existUser.metadata.isOnline) {
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
  /// Matches: removeAudioSubscriber() in ConnectLivekit.ts
  @override
  void removeAudioSubscriber(String userId) {
    if (!_audioSubscribersMap.containsKey(userId)) {
      return;
    }
    
    _audioSubscribersMap.remove(userId);
    _syncAudioSubscribers();
  }
  
  /// Sync audio subscribers
  /// Matches: syncAudioSubscribers() in ConnectLivekit.ts
  void _syncAudioSubscribers() {
    _audioSubscribersController.add(Map.from(_audioSubscribersMap));
    
    // Update session provider
    ref.read(sessionProvider.notifier).updateTotalAudioSubscribers(
      _audioSubscribersMap.length,
    );
  }
  
  /// Add video subscriber
  /// Matches: addVideoSubscriber() in ConnectLivekit.ts
  @override
  void addVideoSubscriber(Participant participant) {
    if (participant.videoTrackPublications.isEmpty) {
      return;
    }
    
    final existUser = ref.read(participantProvider).participants[participant.identity];
    if (existUser == null || !existUser.metadata.isOnline) {
      return;
    }
    
    _videoSubscribersMap[participant.identity] = participant;
    _syncVideoSubscribers();
  }
  
  /// Remove video subscriber
  /// Matches: removeVideoSubscriber() in ConnectLivekit.ts
  @override
  void removeVideoSubscriber(String userId) {
    if (!_videoSubscribersMap.containsKey(userId)) {
      return;
    }
    
    _videoSubscribersMap.remove(userId);
    _syncVideoSubscribers();
  }
  
  /// Sync video subscribers
  /// Matches: syncVideoSubscribers() in ConnectLivekit.ts
  void _syncVideoSubscribers() {
    // Update session provider
    ref.read(sessionProvider.notifier).updateTotalVideoSubscribers(
      _videoSubscribersMap.length,
    );
    
    // Emit status
    if (_videoSubscribersMap.isNotEmpty) {
      _videoStatusController.add(true);
    } else {
      _videoStatusController.add(false);
    }
    
    // Sort by active speakers (simplified - full implementation in HandleMediaTracks)
    _videoSubscribersController.add(Map.from(_videoSubscribersMap));
  }
  
  /// Dispose resources
  void dispose() {
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
