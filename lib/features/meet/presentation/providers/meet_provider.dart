import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:torii_app/features/meet/data/datasources/livekit_service.dart';
import 'package:torii_app/features/meet/data/datasources/meet_api_service.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';

enum MeetStatus { initial, connecting, signaling, connected, disconnected, error }

class MeetState {
  final MeetStatus status;
  final VerifyTokenRes? roomInfo;
  final List<Participant> participants;
  final String? errorMessage;
  final bool isMicEnabled;
  final bool isCamEnabled;
  final bool isScreenSharingEnabled;

  MeetState({
    this.status = MeetStatus.initial,
    this.roomInfo,
    this.participants = const [],
    this.errorMessage,
    this.isMicEnabled = false,
    this.isCamEnabled = false,
    this.isScreenSharingEnabled = false,
  });

  MeetState copyWith({
    MeetStatus? status,
    VerifyTokenRes? roomInfo,
    List<Participant>? participants,
    String? errorMessage,
    bool? isMicEnabled,
    bool? isCamEnabled,
    bool? isScreenSharingEnabled,
  }) {
    return MeetState(
      status: status ?? this.status,
      roomInfo: roomInfo ?? this.roomInfo,
      participants: participants ?? this.participants,
      errorMessage: errorMessage ?? this.errorMessage,
      isMicEnabled: isMicEnabled ?? this.isMicEnabled,
      isCamEnabled: isCamEnabled ?? this.isCamEnabled,
      isScreenSharingEnabled: isScreenSharingEnabled ?? this.isScreenSharingEnabled,
    );
  }
}

final meetControllerProvider = StateNotifierProvider<MeetNotifier, MeetState>((ref) {
  final apiService = ref.watch(meetApiServiceProvider);
  final liveKitService = ref.watch(liveKitServiceProvider);
  return MeetNotifier(apiService, liveKitService);
});

class MeetNotifier extends StateNotifier<MeetState> {
  final MeetApiService _apiService;
  final LiveKitService _liveKitService;

  MeetNotifier(this._apiService, this._liveKitService) : super(MeetState()) {
    // Sync participants from LiveKit to state
    _liveKitService.onParticipantsChanged = (participants) {
      state = state.copyWith(participants: _sortParticipants(participants));
    };
    
    _liveKitService.onActiveSpeakersChanged = (speakers) {
      // Re-sort current participants when active speakers change
      state = state.copyWith(participants: _sortParticipants(state.participants));
    };

    _liveKitService.onConnectionStateChanged = (connected) {
      if (!connected) {
        state = state.copyWith(status: MeetStatus.disconnected);
      }
    };
  }

  List<Participant> _sortParticipants(List<Participant> participants) {
    final sorted = List<Participant>.from(participants);
    sorted.sort((a, b) {
      // 1. Active speakers first
      if (a.isSpeaking && !b.isSpeaking) return -1;
      if (!a.isSpeaking && b.isSpeaking) return 1;

      // 2. Local participant usually last or first? 
      // In web it depends, but let's keep it simple.
      
      // 3. Alphabetical or by join time (not readily avail on Participant object easily without metadata)
      return a.identity.compareTo(b.identity);
    });
    return sorted;
  }

  Future<void> joinMeeting() async {
    state = state.copyWith(status: MeetStatus.signaling);

    try {
      // 1. Verify Token and get Room Info (NATS URLs, Media Server Token)
      final res = await _apiService.verifyToken();
      if (!res.status) {
        state = state.copyWith(
          status: MeetStatus.error,
          errorMessage: res.msg,
        );
        return;
      }

      state = state.copyWith(
        status: MeetStatus.connecting,
        roomInfo: res,
      );

      // 2. Connect to LiveKit
      // In a real scenario, we might need to pick one of the NATS URLs or a specific Media Server URL
      // For now, we assume the token includes the necessary info or we have a primary URL.
      // Based on Web code: res.natsWsUrls is for NATS, but LiveKit client needs its own URL.
      // Usually the backend provides a LiveKit URL or the mobile app has a configured one.
      // NOTE: We need to ensure we have the correct LiveKit URL. 
      // In the Web app, handleMediaServerData decodes serverInfo.url.
      
      // Since we are mocking the flow for now, let's wait for actual connection logic requirements.
      // For implement.md parity, we should implement the NATS connection too eventually.
    } catch (e) {
      state = state.copyWith(
        status: MeetStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> connectToLiveKit(String url, String token) async {
    try {
      await _liveKitService.connect(url, token);
      state = state.copyWith(status: MeetStatus.connected);
    } catch (e) {
      state = state.copyWith(
        status: MeetStatus.error,
        errorMessage: 'Media Server Connection Failed: $e',
      );
    }
  }

  Future<void> leaveMeeting() async {
    await _liveKitService.disconnect();
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
}
