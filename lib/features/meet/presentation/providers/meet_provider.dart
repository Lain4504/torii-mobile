import 'dart:convert';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:torii_app/features/meet/data/datasources/livekit_service.dart';
import 'package:torii_app/features/meet/data/datasources/meet_api_service.dart';
import 'package:torii_app/features/meet/data/datasources/nats_service.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart' as nats_msg;
import 'package:torii_app/features/meet/data/models/proto/wajlc_analytics.pb.dart' as analytics;
import 'package:torii_app/features/meet/data/models/proto/wajlc_datamessage.pb.dart' as data_msg;
import 'package:torii_app/features/meet/data/models/proto/wajlc_gen_token.pb.dart' as gen_token;

enum MeetStatus { initial, signaling, natsConnecting, natsConnected, mediaConnecting, connected, disconnected, error }

class MeetState {
  final MeetStatus status;
  final VerifyTokenRes? roomInfo;
  final List<Participant> participants;
  final String? errorMessage;
  final String? statusMessage;
  final String? userId;
  final String? roomId;
  final Participant? screenSharingParticipant;
  final List<nats_msg.ChatMessage> messages;
  final bool isMicEnabled;
  final bool isCamEnabled;
  final bool isScreenSharingEnabled;
  final bool isSpeakerphoneOn;
  final nats_msg.NatsKvRoomInfo? roomMetadata;
  final nats_msg.NatsKvUserInfo? localUser;
  final gen_token.UserMetadata? localMetadata;
  final Map<String, nats_msg.NatsKvUserInfo> remoteParticipantsMap;
  final Map<String, gen_token.UserMetadata> participantsMetadata;
  final bool isRecording;
  final String? notification;

  MeetState({
    this.status = MeetStatus.initial,
    this.roomInfo,
    this.participants = const [],
    this.errorMessage,
    this.statusMessage,
    this.userId,
    this.roomId,
    this.screenSharingParticipant,
    this.messages = const [],
    this.isMicEnabled = false,
    this.isCamEnabled = false,
    this.isScreenSharingEnabled = false,
    this.isSpeakerphoneOn = true,
    this.roomMetadata,
    this.localUser,
    this.localMetadata,
    this.remoteParticipantsMap = const {},
    this.participantsMetadata = const {},
    this.isRecording = false,
    this.notification,
  });

  MeetState copyWith({
    MeetStatus? status,
    VerifyTokenRes? roomInfo,
    List<Participant>? participants,
    String? errorMessage,
    String? statusMessage,
    String? userId,
    String? roomId,
    Participant? screenSharingParticipant,
    List<nats_msg.ChatMessage>? messages,
    bool clearScreenSharing = false,
    bool? isMicEnabled,
    bool? isCamEnabled,
    bool? isScreenSharingEnabled,
    bool? isSpeakerphoneOn,
    nats_msg.NatsKvRoomInfo? roomMetadata,
    nats_msg.NatsKvUserInfo? localUser,
    gen_token.UserMetadata? localMetadata,
    Map<String, nats_msg.NatsKvUserInfo>? remoteParticipantsMap,
    Map<String, gen_token.UserMetadata>? participantsMetadata,
    bool? isRecording,
    String? notification,
    bool clearNotification = false,
  }) {
    return MeetState(
      status: status ?? this.status,
      roomInfo: roomInfo ?? this.roomInfo,
      participants: participants ?? this.participants,
      errorMessage: errorMessage ?? this.errorMessage,
      statusMessage: statusMessage ?? this.statusMessage,
      userId: userId ?? this.userId,
      roomId: roomId ?? this.roomId,
      screenSharingParticipant: clearScreenSharing ? null : (screenSharingParticipant ?? this.screenSharingParticipant),
      messages: messages ?? this.messages,
      isMicEnabled: isMicEnabled ?? this.isMicEnabled,
      isCamEnabled: isCamEnabled ?? this.isCamEnabled,
      isScreenSharingEnabled: isScreenSharingEnabled ?? this.isScreenSharingEnabled,
      isSpeakerphoneOn: isSpeakerphoneOn ?? this.isSpeakerphoneOn,
      roomMetadata: roomMetadata ?? this.roomMetadata,
      localUser: localUser ?? this.localUser,
      localMetadata: localMetadata ?? this.localMetadata,
      remoteParticipantsMap: remoteParticipantsMap ?? this.remoteParticipantsMap,
      participantsMetadata: participantsMetadata ?? this.participantsMetadata,
      isRecording: isRecording ?? this.isRecording,
      notification: clearNotification ? null : (notification ?? this.notification),
    );
  }
}

final meetControllerProvider = StateNotifierProvider<MeetNotifier, MeetState>((ref) {
  final apiService = ref.watch(meetApiServiceProvider);
  final liveKitService = ref.watch(liveKitServiceProvider);
  final natsService = ref.watch(natsServiceProvider);
  return MeetNotifier(apiService, liveKitService, natsService);
});

class MeetNotifier extends StateNotifier<MeetState> {
  final MeetApiService _apiService;
  final LiveKitService _liveKitService;
  final NatsService _natsService;

  MeetNotifier(this._apiService, this._liveKitService, this._natsService) : super(MeetState()) {
    // Sync participants from LiveKit to state
    _liveKitService.onParticipantsChanged = (participants) {
      state = state.copyWith(participants: _sortParticipants(participants));
    };
    
    _liveKitService.onActiveSpeakersChanged = (speakers) {
      state = state.copyWith(participants: _sortParticipants(state.participants));
    };

    _liveKitService.onTrackSubscribed = (participant, publication) {
      if (publication.source == TrackSource.screenShareVideo) {
        state = state.copyWith(screenSharingParticipant: participant);
      }
    };

    _liveKitService.onTrackUnsubscribed = (participant, publication) {
      if (publication.source == TrackSource.screenShareVideo) {
        if (state.screenSharingParticipant?.identity == participant.identity) {
          state = state.copyWith(clearScreenSharing: true);
        }
      }
    };

    _liveKitService.onConnectionStateChanged = (connected) {
      if (!connected) {
        state = state.copyWith(status: MeetStatus.disconnected);
      }
    };
    
    _liveKitService.onConnectionQualityChanged = (participant, quality) {
      if (participant.identity == state.userId) {
        _sendAnalytics(
          analytics.AnalyticsEvents.ANALYTICS_EVENT_USER_CONNECTION_QUALITY,
          valueString: quality.toString(),
        );
      }
    };
    
    // NATS event handling
    _natsService.onSystemEvent = _handleNatsSystemEvent;
  }

  List<Participant> _sortParticipants(List<Participant> participants) {
    final sorted = List<Participant>.from(participants);
    sorted.sort((a, b) {
      // 1. Active Speaker
      if (a.isSpeaking != b.isSpeaking) {
        return a.isSpeaking ? -1 : 1;
      }
      
      // 2. Last Spoke At (from LiveKit)
      final aSpoke = a.lastSpokeAt?.millisecondsSinceEpoch ?? 0;
      final bSpoke = b.lastSpokeAt?.millisecondsSinceEpoch ?? 0;
      if (aSpoke != bSpoke) {
        return bSpoke.compareTo(aSpoke);
      }
      
      // 3. Joined At (if available via NATS metadata)
      final aJoined = state.remoteParticipantsMap[a.identity]?.joinedAt ?? Int64(0);
      final bJoined = state.remoteParticipantsMap[b.identity]?.joinedAt ?? Int64(0);
      if (aJoined != bJoined) {
        return aJoined.compareTo(bJoined);
      }

      return a.identity.compareTo(b.identity);
    });
    return sorted;
  }

  Future<void> joinMeetingWithToken(String token) async {
    _apiService.setManualToken(token);
    await joinMeeting();
  }

  Future<void> joinRoomById({
    required String roomId,
    required String name,
    bool isAdmin = false,
  }) async {
    state = state.copyWith(
      status: MeetStatus.signaling, 
      statusMessage: 'Checking room status...',
      roomId: roomId,
    );
    
    try {
      // 1. Check if active
      final isActive = await _apiService.isRoomActive(roomId);
      
      if (!isActive) {
        state = state.copyWith(statusMessage: 'Creating room...');
        final created = await _apiService.createRoom(roomId);
        if (!created) {
          state = state.copyWith(status: MeetStatus.error, errorMessage: 'Failed to create room');
          return;
        }
      }
      
      // 2. Get token
      state = state.copyWith(statusMessage: 'Retrieving join token...');
      final userId = 'u-${DateTime.now().millisecondsSinceEpoch % 100000}';
      final token = await _apiService.getJoinToken(
        roomId: roomId,
        name: name,
        userId: userId,
        isAdmin: isAdmin,
      );
      
      if (token == null) {
        state = state.copyWith(status: MeetStatus.error, errorMessage: 'Failed to get join token');
        return;
      }
      
      // 3. Join with token
      await joinMeetingWithToken(token);
      
    } catch (e) {
      if (kDebugMode) print('joinRoomById error: $e');
      state = state.copyWith(status: MeetStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> joinMeeting() async {
    state = state.copyWith(status: MeetStatus.signaling, statusMessage: 'Verifying token...');

    try {
      // 1. Verify Token
      final res = await _apiService.verifyToken();
      if (!res.status) {
        state = state.copyWith(status: MeetStatus.error, errorMessage: res.msg);
        return;
      }

      state = state.copyWith(
        status: MeetStatus.natsConnecting,
        statusMessage: 'Connecting to signaling server...',
        roomInfo: res,
        userId: res.userId,
        roomId: res.roomId,
      );

      // 2. Connect to NATS
      await _natsService.connect(
        urls: res.natsWsUrls.toList(),
        token: _apiService.token ?? '',
      );

      state = state.copyWith(status: MeetStatus.natsConnected, statusMessage: 'Connected to signaling. Fetching room data...');

      // 3. Set identity and subscribe to subjects
      final natsSubjects = res.natsSubjects;
      _natsService.setIdentity(res.roomId, res.userId, natsSubjects.systemJsWorker);
      
      await _natsService.subscribe(
        subject: natsSubjects.systemPublic,
        onData: (data) => _handleNatsSystemEvent(nats_msg.NatsMsgServerToClient.fromBuffer(data)),
      );
      await _natsService.subscribe(
        subject: natsSubjects.systemPrivate,
        onData: (data) => _handleNatsSystemEvent(nats_msg.NatsMsgServerToClient.fromBuffer(data)),
      );

      // Subscribe to Chat
      await _natsService.subscribe(
        subject: '${res.roomId}:${natsSubjects.chat}',
        onData: (data) => _handleChatMessage(nats_msg.ChatMessage.fromBuffer(data)),
      );

      _natsService.sendMessageToSystemWorker(
        baseSubject: natsSubjects.systemJsWorker,
        payload: nats_msg.NatsMsgClientToServer(event: nats_msg.NatsMsgClientToServerEvents.REQ_INITIAL_DATA).writeToBuffer(),
      );

    } catch (e) {
      state = state.copyWith(status: MeetStatus.error, errorMessage: e.toString());
    }
  }

  void _handleNatsSystemEvent(nats_msg.NatsMsgServerToClient payload) {
    if (kDebugMode) print('NATS Event: ${payload.event}');
    
    switch (payload.event) {
      case nats_msg.NatsMsgServerToClientEvents.RES_INITIAL_DATA:
        _handleResInitialData(payload.msg);
        break;

      case nats_msg.NatsMsgServerToClientEvents.ROOM_METADATA_UPDATE:
        _handleRoomMetadataUpdate(payload.msg);
        break;

      case nats_msg.NatsMsgServerToClientEvents.RES_MEDIA_SERVER_DATA:
        _handleResMediaServerData(payload.msg);
        break;

      case nats_msg.NatsMsgServerToClientEvents.USER_JOINED:
        _handleUserJoined(payload.msg);
        break;

      case nats_msg.NatsMsgServerToClientEvents.USER_OFFLINE:
        _handleUserOffline(payload.msg);
        break;

      case nats_msg.NatsMsgServerToClientEvents.USER_METADATA_UPDATE:
        _handleUserMetadataUpdate(payload.msg);
        break;

      case nats_msg.NatsMsgServerToClientEvents.POLL_CREATED:
        showNotification('A new poll has been created!');
        break;
      case nats_msg.NatsMsgServerToClientEvents.POLL_CLOSED:
        showNotification('The poll has been closed.');
        break;
      case nats_msg.NatsMsgServerToClientEvents.JOIN_BREAKOUT_ROOM:
        showNotification('Join breakout room: ${payload.msg}');
        break;

      case nats_msg.NatsMsgServerToClientEvents.SESSION_ENDED:
        leaveMeeting();
        state = state.copyWith(status: MeetStatus.disconnected, statusMessage: 'Session ended by server.');
        showNotification('The meeting has been ended.');
        break;
        
      default:
        break;
    }
  }

  void _handleResInitialData(String jsonStr) {
    try {
      final initialData = nats_msg.NatsInitialData.fromJson(jsonStr);
      final localMeta = gen_token.UserMetadata.fromJson(initialData.localUser.metadata);
      
      state = state.copyWith(
        roomMetadata: initialData.room,
        localUser: initialData.localUser,
        localMetadata: localMeta,
        statusMessage: 'Initial data received. Requesting media...',
      );
      
      final natsSubjects = state.roomInfo!.natsSubjects;
      _natsService.setIdentity(state.roomId!, state.userId!, natsSubjects.systemJsWorker);

      // Subscribe to Chat and others now that we have initial data
      _natsService.subscribe(
        subject: '${state.roomId}:${natsSubjects.chat}',
        onData: (data) => _handleChatMessage(nats_msg.ChatMessage.fromBuffer(data)),
      );

      _natsService.subscribe(
        subject: '${state.roomId}:${natsSubjects.dataChannel}',
        onData: (data) => _handleDataChannelMessage(data_msg.DataChannelMessage.fromBuffer(data)),
      );

      _natsService.subscribe(
        subject: '${state.roomId}:${natsSubjects.whiteboard}',
        onData: (data) => _handleWhiteboardMessage(data_msg.DataChannelMessage.fromBuffer(data)),
      );

      // Request Media Server Data
      _natsService.sendMessageToSystemWorker(
        baseSubject: natsSubjects.systemJsWorker,
        payload: nats_msg.NatsMsgClientToServer(event: nats_msg.NatsMsgClientToServerEvents.REQ_MEDIA_SERVER_DATA).writeToBuffer(),
      );
      
      // Request Joined Users
      _natsService.sendMessageToSystemWorker(
        baseSubject: natsSubjects.systemJsWorker,
        payload: nats_msg.NatsMsgClientToServer(event: nats_msg.NatsMsgClientToServerEvents.REQ_JOINED_USERS_LIST).writeToBuffer(),
      );

    } catch (e) {
      if (kDebugMode) print('Error parsing initial data: $e');
    }
  }

  void _handleRoomMetadataUpdate(String metadataStr) {
    try {
      final Map<String, dynamic> metadata = jsonDecode(metadataStr);
      
      state = state.copyWith(
        isRecording: metadata['is_recording'] ?? false,
      );
      
      if (kDebugMode) print('Room Metadata Updated: $metadata');
    } catch (e) {
      if (kDebugMode) print('Error parsing room metadata string: $e');
    }
  }

  void _handleResMediaServerData(String jsonStr) {
    try {
      final mediaInfo = nats_msg.MediaServerConnInfo.fromJson(jsonStr);
      _connectToLiveKit(mediaInfo.url, mediaInfo.token);
    } catch (e) {
      if (kDebugMode) print('Error parsing media server info: $e');
    }
  }

  void _handleUserJoined(String jsonStr) {
     try {
       final user = nats_msg.NatsKvUserInfo.fromJson(jsonStr);
       final newMap = Map<String, nats_msg.NatsKvUserInfo>.from(state.remoteParticipantsMap);
       newMap[user.userId] = user;
       
       final metaMap = Map<String, gen_token.UserMetadata>.from(state.participantsMetadata);
       metaMap[user.userId] = gen_token.UserMetadata.fromJson(user.metadata);

       state = state.copyWith(
         remoteParticipantsMap: newMap,
         participantsMetadata: metaMap,
       );
       showNotification('${user.name} joined');
     } catch (e) {}
  }

  void _handleUserMetadataUpdate(String jsonStr) {
    try {
      final update = nats_msg.NatsUserMetadataUpdate.fromJson(jsonStr);
      final meta = gen_token.UserMetadata.fromJson(update.metadata);
      
      if (update.userId == state.userId) {
        state = state.copyWith(localMetadata: meta);
      } else {
        final metaMap = Map<String, gen_token.UserMetadata>.from(state.participantsMetadata);
        metaMap[update.userId] = meta;
        state = state.copyWith(participantsMetadata: metaMap);
      }
      
      if (kDebugMode) print('Metadata Updated for ${update.userId}: Raised Hand=${meta.raisedHand}');
    } catch (e) {
       if (kDebugMode) print('Error parsing metadata update: $e');
    }
  }

  void _handleUserOffline(String jsonStr) {
     try {
       final user = nats_msg.NatsKvUserInfo.fromJson(jsonStr);
       final newMap = Map<String, nats_msg.NatsKvUserInfo>.from(state.remoteParticipantsMap);
       newMap.remove(user.userId);
       state = state.copyWith(remoteParticipantsMap: newMap);
       showNotification('${user.name} left');
     } catch (e) {}
  }

  Future<void> _connectToLiveKit(String url, String token) async {
    state = state.copyWith(status: MeetStatus.mediaConnecting, statusMessage: 'Connecting to media server...');
    try {
      await _liveKitService.connect(url, token);
      state = state.copyWith(status: MeetStatus.connected, statusMessage: 'Connected');
    } catch (e) {
      state = state.copyWith(status: MeetStatus.error, errorMessage: 'Media Server Connection Failed: $e');
    }
  }

  void _handleChatMessage(nats_msg.ChatMessage msg) {
    state = state.copyWith(messages: [...state.messages, msg]);
  }

  void _handleDataChannelMessage(data_msg.DataChannelMessage payload) {
    if (kDebugMode) print('DataChannel Event: ${payload.type}');

    switch (payload.type) {
      case data_msg.DataMsgBodyType.INFO:
        if (payload.fromUserId != state.userId) {
          showNotification(payload.message);
        }
        break;
      case data_msg.DataMsgBodyType.ALERT:
        if (payload.fromUserId != state.userId) {
          showNotification('ALERT: ${payload.message}');
        }
        break;
      case data_msg.DataMsgBodyType.USER_CONNECTION_QUALITY_CHANGE:
        // Update participant quality in state if needed (though LiveKit also handles this)
        break;
      case data_msg.DataMsgBodyType.USER_VISIBILITY_CHANGE:
        // Admin logic
        break;
      default:
        break;
    }
  }

  void _handleWhiteboardMessage(data_msg.DataChannelMessage payload) {
    // Basic whiteboard message handling (log for now)
    if (kDebugMode) print('Whiteboard Message from ${payload.fromUserId}');
  }

  void showNotification(String msg) {
    state = state.copyWith(notification: msg);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        state = state.copyWith(clearNotification: true);
      }
    });
  }

  void _updateRoomMetadata(String jsonStr) {
    try {
      final data = jsonDecode(jsonStr);
      // Depending on if it's NatsInitialData or just room metadata string
      // In RES_INITIAL_DATA web does: data.room.metadata
      // In ROOM_METADATA_UPDATE web does: payload.msg
      
      var metadata = data;
      if (data is Map && data.containsKey('room')) {
        metadata = jsonDecode(data['room']['metadata']);
      } else if (data is String) {
        metadata = jsonDecode(data);
      }

      if (metadata is Map) {
        state = state.copyWith(
          isRecording: metadata['is_recording'] ?? false,
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error parsing room metadata: $e');
    }
  }

  void sendChatMessage(String text) {
    if (state.roomInfo == null) return;
    
    final msg = nats_msg.ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fromName: state.roomInfo!.userId, // Or get user name from localUser
      fromUserId: state.userId,
      sentAt: Int64(DateTime.now().millisecondsSinceEpoch),
      message: text,
    );

    _natsService.sendMessage(
      '${state.roomId}:${state.roomInfo!.natsSubjects.chat}',
      msg.writeToBuffer(),
    );
  }

  Future<void> leaveMeeting() async {
    await _liveKitService.disconnect();
    await _natsService.disconnect();
    _apiService.setManualToken(null);
    state = MeetState();
  }

  // Media toggles
  Future<void> toggleMic() async {
    final locked = state.localMetadata?.lockSettings.lockMicrophone ?? false;
    if (locked && !state.localUser!.isAdmin) {
      showNotification('Microphone is locked by administrator');
      return;
    }

    final newStatus = !state.isMicEnabled;
    await _liveKitService.setMicrophoneEnabled(newStatus);
    state = state.copyWith(isMicEnabled: newStatus);
    
    _sendAnalytics(
      analytics.AnalyticsEvents.ANALYTICS_EVENT_USER_MIC_STATUS,
      valueString: newStatus ? 'unmuted' : 'muted',
    );
  }

  Future<void> toggleCam() async {
    final locked = state.localMetadata?.lockSettings.lockWebcam ?? false;
    if (locked && !state.localUser!.isAdmin) {
      showNotification('Webcam is locked by administrator');
      return;
    }

    final newStatus = !state.isCamEnabled;
    await _liveKitService.setCameraEnabled(newStatus);
    state = state.copyWith(isCamEnabled: newStatus);

    _sendAnalytics(
      analytics.AnalyticsEvents.ANALYTICS_EVENT_USER_WEBCAM_STATUS,
      valueString: newStatus ? 'unmuted' : 'muted',
    );
  }

  Future<void> toggleScreenShare() async {
    final newStatus = !state.isScreenSharingEnabled;
    await _liveKitService.setScreenShareEnabled(newStatus);
    state = state.copyWith(isScreenSharingEnabled: newStatus);
  }

  Future<void> toggleSpeakerphone() async {
    final newStatus = !state.isSpeakerphoneOn;
    await _liveKitService.setSpeakerphoneEnabled(newStatus);
    state = state.copyWith(isSpeakerphoneOn: newStatus);
  }

  void toggleHandRaise() {
    if (state.localMetadata == null) return;
    
    final isRaising = !state.localMetadata!.raisedHand;
    final event = isRaising 
        ? nats_msg.NatsMsgClientToServerEvents.REQ_RAISE_HAND 
        : nats_msg.NatsMsgClientToServerEvents.REQ_LOWER_HAND;
        
    _natsService.sendMessageToSystemWorker(
      baseSubject: state.roomInfo!.natsSubjects.systemJsWorker,
      payload: nats_msg.NatsMsgClientToServer(event: event).writeToBuffer(),
    );
  }

  void _sendAnalytics(analytics.AnalyticsEvents eventName, {String? valueString, Int64? valueInt}) {
    if (state.roomId == null || state.userId == null || state.roomInfo == null) return;
    
    final msg = analytics.AnalyticsDataMsg(
      eventType: analytics.AnalyticsEventType.ANALYTICS_EVENT_TYPE_USER,
      eventName: eventName,
      roomId: state.roomId,
      userId: state.userId,
      time: Int64(DateTime.now().millisecondsSinceEpoch),
      eventValueString: valueString,
      eventValueInteger: valueInt,
    );

    _natsService.sendMessageToSystemWorker(
      baseSubject: state.roomInfo!.natsSubjects.systemJsWorker,
      payload: nats_msg.NatsMsgClientToServer(
        event: nats_msg.NatsMsgClientToServerEvents.PUSH_ANALYTICS_DATA,
        msg: jsonEncode(msg.toProto3Json()),
      ).writeToBuffer(),
    );
  }
}
