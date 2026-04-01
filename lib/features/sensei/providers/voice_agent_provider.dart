import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:permission_handler/permission_handler.dart';
import '../repositories/sensei_repository.dart';
import 'sensei_providers.dart';
import 'sensei_subscription_providers.dart';

class VoiceAgentState {
  final Room? room;
  final bool isConnecting;
  final bool isConnected;
  final bool isReconnecting;
  final bool isMicOn;
  final String? error;
  final String? errorCode;
  final bool isAgentSpeaking;
  final bool isUserSpeaking;

  VoiceAgentState({
    this.room,
    this.isConnecting = false,
    this.isConnected = false,
    this.isReconnecting = false,
    this.isMicOn = false,
    this.error,
    this.errorCode,
    this.isAgentSpeaking = false,
    this.isUserSpeaking = false,
  });

  VoiceAgentState copyWith({
    Room? room,
    bool? isConnecting,
    bool? isConnected,
    bool? isReconnecting,
    bool? isMicOn,
    String? error,
    String? errorCode,
    bool? isAgentSpeaking,
    bool? isUserSpeaking,
  }) {
    return VoiceAgentState(
      room: room ?? this.room,
      isConnecting: isConnecting ?? this.isConnecting,
      isConnected: isConnected ?? this.isConnected,
      isReconnecting: isReconnecting ?? this.isReconnecting,
      isMicOn: isMicOn ?? this.isMicOn,
      error: error,
      errorCode: errorCode,
      isAgentSpeaking: isAgentSpeaking ?? this.isAgentSpeaking,
      isUserSpeaking: isUserSpeaking ?? this.isUserSpeaking,
    );
  }
}

class VoiceAgentNotifier extends StateNotifier<VoiceAgentState> {
  final SenseiRepository _repository;
  final Ref _ref;
  EventsListener<RoomEvent>? _listener;

  VoiceAgentNotifier(this._repository, this._ref) : super(VoiceAgentState());

  Future<void> connect(String graphName) async {
    if (state.isConnecting || state.isConnected) return;

    state = state.copyWith(isConnecting: true, error: null);

    try {
      // 1. Request Mic Permissions
      final status = await Permission.microphone.request();
      if (status.isPermanentlyDenied) {
        throw Exception('microphone_permanently_denied');
      }
      if (!status.isGranted) {
        throw Exception('microphone_denied');
      }

      // 2. Get credentials
      final config = await _repository.getLiveKitToken(graphName);
      _ref.invalidate(senseiQuotaStatusProvider);
      
      final String wsUrl = config['wsUrl'];
      final String token = config['token'];

      // 3. Connect to Room
      final room = Room();
      _listener = room.createListener();
      
      _listener!.on<RoomDisconnectedEvent>((event) {
        if (mounted) {
          state = state.copyWith(
            isConnected: false,
            isReconnecting: false,
            isMicOn: false,
            error: event.reason?.name ?? 'Disconnected',
          );
        }
      });

      _listener!.on<RoomAttemptReconnectEvent>((event) {
        if (mounted) state = state.copyWith(isReconnecting: true);
      });

      _listener!.on<RoomReconnectedEvent>((event) {
        if (mounted) state = state.copyWith(isReconnecting: false);
      });

      _listener!.on<ActiveSpeakersChangedEvent>((event) {
        if (!mounted) return;
        bool agentSpeaking = false;
        bool userSpeaking = false;

        for (final p in event.speakers) {
          if (p is LocalParticipant) {
            userSpeaking = true;
          } else {
            agentSpeaking = true;
          }
        }

        if (state.isAgentSpeaking != agentSpeaking || state.isUserSpeaking != userSpeaking) {
          state = state.copyWith(isAgentSpeaking: agentSpeaking, isUserSpeaking: userSpeaking);
        }
      });

      await room.connect(
        wsUrl,
        token,
        fastConnectOptions: FastConnectOptions(
          microphone: const TrackOption(enabled: true),
        ),
      );

      // Turn on mic explicitly
      await room.localParticipant?.setMicrophoneEnabled(true);

      if (mounted) {
        state = state.copyWith(
          room: room,
          isConnecting: false,
          isConnected: true,
          isMicOn: true,
        );
      }
    } catch (e) {
      if (mounted) {
        final isQuota = e is SenseiQuotaExceededException;
        state = state.copyWith(
          isConnecting: false,
          error: isQuota ? (e as SenseiQuotaExceededException).message : e.toString(),
          errorCode: isQuota ? 'quota_exceeded' : null,
        );
      }
    }
  }

  Future<void> toggleMicrophone() async {
    final room = state.room;
    if (room == null || !state.isConnected) return;

    final isCurrentlyOn = state.isMicOn;
    try {
      await room.localParticipant?.setMicrophoneEnabled(!isCurrentlyOn);
      if (mounted) {
        state = state.copyWith(isMicOn: !isCurrentlyOn);
      }
    } catch (e) {
      if (mounted) {
        state = state.copyWith(error: 'Failed to toggle microphone: $e');
      }
    }
  }

  Future<void> disconnect() async {
    final room = state.room;
    if (room != null) {
      await _listener?.dispose();
      await room.disconnect();
    }
    if (mounted) {
      state = VoiceAgentState();
    }
  }

  @override
  void dispose() {
    disconnect();
    super.dispose();
  }
}

final voiceAgentProvider = StateNotifierProvider<VoiceAgentNotifier, VoiceAgentState>((ref) {
  final repository = ref.watch(senseiRepositoryProvider);
  return VoiceAgentNotifier(repository, ref);
});
