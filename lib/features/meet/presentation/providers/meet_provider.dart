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
    
    // NATS event handling
    _natsService.onSystemEvent = _handleNatsSystemEvent;
  }

  List<Participant> _sortParticipants(List<Participant> participants) {
    final sorted = List<Participant>.from(participants);
    sorted.sort((a, b) {
      if (a.isSpeaking && !b.isSpeaking) return -1;
      if (!a.isSpeaking && b.isSpeaking) return 1;
      return a.identity.compareTo(b.identity);
    });
    return sorted;
  }

  Future<void> joinMeetingWithToken(String token) async {
    _apiService.setManualToken(token);
    await joinMeeting();
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

      // 3. Subscribe to subjects
      final natsSubjects = res.natsSubjects;
      await _natsService.subscribe(
        subject: natsSubjects.systemPublic,
        onData: (data) => _handleNatsSystemEvent(NatsMsgServerToClient.fromBuffer(data)),
      );
      await _natsService.subscribe(
        subject: natsSubjects.systemPrivate,
        onData: (data) => _handleNatsSystemEvent(NatsMsgServerToClient.fromBuffer(data)),
      );

      // Subscribe to Chat
      await _natsService.subscribe(
        subject: '${res.roomId}:${natsSubjects.chat}',
        onData: (data) => _handleChatMessage(nats_msg.ChatMessage.fromBuffer(data)),
      );

      // 4. Request Initial Data
      _natsService.sendMessageToSystemWorker(
        subject: '${natsSubjects.systemJsWorker}.${res.roomId}.${res.userId}',
        data: NatsMsgClientToServer(event: NatsMsgClientToServerEvents.REQ_INITIAL_DATA),
      );

    } catch (e) {
      state = state.copyWith(status: MeetStatus.error, errorMessage: e.toString());
    }
  }

  void _handleNatsSystemEvent(NatsMsgServerToClient payload) {
    switch (payload.event) {
      case NatsMsgServerToClientEvents.RES_INITIAL_DATA:
        // Assume initial data is JSON in msg or it's not needed directly if we just request more
        _updateRoomMetadata(payload.msg); 

        // After initial data, request participants and media server info
        final natsSubjects = state.roomInfo!.natsSubjects;
        _natsService.sendMessageToSystemWorker(
          subject: '${natsSubjects.systemJsWorker}.${state.roomId}.${state.userId}',
          data: NatsMsgClientToServer(event: NatsMsgClientToServerEvents.REQ_JOINED_USERS_LIST),
        );
        _natsService.sendMessageToSystemWorker(
          subject: '${natsSubjects.systemJsWorker}.${state.roomId}.${state.userId}',
          data: NatsMsgClientToServer(event: NatsMsgClientToServerEvents.REQ_MEDIA_SERVER_DATA),
        );
        break;

      case NatsMsgServerToClientEvents.ROOM_METADATA_UPDATE:
        _updateRoomMetadata(payload.msg);
        break;

      case NatsMsgServerToClientEvents.RES_MEDIA_SERVER_DATA:
        final serverInfo = jsonDecode(payload.msg);
        _connectToLiveKit(serverInfo['url'], serverInfo['token']);
        break;

      case NatsMsgServerToClientEvents.SESSION_ENDED:
        leaveMeeting();
        state = state.copyWith(status: MeetStatus.disconnected, statusMessage: 'Session ended by server.');
        showNotification('The meeting has been ended.');
        break;

      case NatsMsgServerToClientEvents.USER_JOINED:
        // If it's not binary, we might need another way to get name.
        // For now, let's just log or use a generic msg.
        showNotification('Someone joined the meeting.');
        break;

      case NatsMsgServerToClientEvents.USER_OFFLINE:
        showNotification('Someone left the meeting.');
        break;
        
      default:
        break;
    }
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
    final newStatus = !state.isMicEnabled;
    await _liveKitService.setMicrophoneEnabled(newStatus);
    state = state.copyWith(isMicEnabled: newStatus);
  }

  Future<void> toggleCam() async {
    final newStatus = !state.isCamEnabled;
    await _liveKitService.setCameraEnabled(newStatus);
    state = state.copyWith(isCamEnabled: newStatus);
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
}
