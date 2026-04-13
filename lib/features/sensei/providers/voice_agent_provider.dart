import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:permission_handler/permission_handler.dart';
import '../repositories/sensei_repository.dart';
import 'sensei_providers.dart';
import 'sensei_subscription_providers.dart';

const _backgroundDisconnectThreshold = Duration(seconds: 30);
const _tokenRefreshThreshold = Duration(minutes: 105);
const _reconnectBackoffMs = <int>[300, 700, 1500, 3000, 5000];

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
  Room? _room;
  EventsListener<RoomEvent>? _listener;
  String? _lastGraphName;
  DateTime? _connectedAt;
  DateTime? _pausedAt;
  bool _wasMicOnBeforePause = false;

  VoiceAgentNotifier(this._repository, this._ref) : super(VoiceAgentState());

  Future<void> connect(String graphName) async {
    if (state.isConnecting || state.isConnected) return;

    _lastGraphName = graphName;
    state = state.copyWith(
      isConnecting: true,
      isReconnecting: false,
      error: null,
      errorCode: null,
    );

    try {
      await _ensureMicrophonePermission();
      await _connectWithBackoff(graphName);
    } catch (e) {
      if (!mounted) return;
      final isQuota = e is SenseiQuotaExceededException;
      state = state.copyWith(
        isConnecting: false,
        isConnected: false,
        isReconnecting: false,
        isMicOn: false,
        error: isQuota ? e.message : e.toString(),
        errorCode: isQuota ? 'quota_exceeded' : null,
      );
    }
  }

  Future<void> _ensureMicrophonePermission() async {
    final status = await Permission.microphone.request();
    if (status.isPermanentlyDenied) {
      throw Exception('microphone_permanently_denied');
    }
    if (!status.isGranted) {
      throw Exception('microphone_denied');
    }
  }

  Future<void> _connectWithBackoff(String graphName) async {
    Object? lastError;
    var attempt = 0;

    while (attempt <= _reconnectBackoffMs.length) {
      if (attempt > 0) {
        await Future.delayed(Duration(milliseconds: _reconnectBackoffMs[attempt - 1]));
      }

      try {
        await _connectOnce(graphName);
        return;
      } catch (e) {
        lastError = e;
        await _cleanupRoomResources();

        // Do not retry on deterministic auth/quota/permission failures.
        if (e is SenseiQuotaExceededException) rethrow;
        final msg = e.toString();
        final isPermissionError =
            msg.contains('microphone_permanently_denied') || msg.contains('microphone_denied');
        if (isPermissionError) rethrow;
      }

      attempt++;
    }

    throw lastError ?? Exception('Failed to connect LiveKit room');
  }

  Future<void> _connectOnce(String graphName) async {
    final config = await _repository.getLiveKitToken(graphName);
    _ref.invalidate(senseiQuotaStatusProvider);

    final wsUrl = (config['wsUrl'] ?? '').toString();
    final token = (config['token'] ?? '').toString();

    if (wsUrl.isEmpty || token.isEmpty) {
      throw Exception('invalid_voice_token_response');
    }

    final room = Room();
    _room = room;
    _listener = room.createListener();

    _listener!.on<RoomDisconnectedEvent>((event) {
      if (!mounted) return;
      _room = null;
      state = state.copyWith(
        isConnected: false,
        isReconnecting: false,
        isMicOn: false,
        error: event.reason?.name ?? 'Disconnected',
      );
    });

    _listener!.on<RoomAttemptReconnectEvent>((event) {
      if (mounted) state = state.copyWith(isReconnecting: true);
    });

    _listener!.on<RoomReconnectedEvent>((event) {
      if (mounted) state = state.copyWith(isReconnecting: false);
    });

    _listener!.on<ActiveSpeakersChangedEvent>((event) {
      if (!mounted) return;
      var agentSpeaking = false;
      var userSpeaking = false;

      for (final participant in event.speakers) {
        if (participant is LocalParticipant) {
          userSpeaking = true;
        } else {
          agentSpeaking = true;
        }
      }

      if (state.isAgentSpeaking != agentSpeaking || state.isUserSpeaking != userSpeaking) {
        state = state.copyWith(
          isAgentSpeaking: agentSpeaking,
          isUserSpeaking: userSpeaking,
        );
      }
    });

    await room.connect(
      wsUrl,
      token,
      fastConnectOptions: FastConnectOptions(
        microphone: const TrackOption(enabled: true),
      ),
    );

    await room.localParticipant?.setMicrophoneEnabled(true);

    if (!mounted) {
      await room.disconnect();
      await _listener?.dispose();
      _listener = null;
      return;
    }

    state = state.copyWith(
      room: room,
      isConnecting: false,
      isConnected: true,
      isReconnecting: false,
      isMicOn: true,
      error: null,
      errorCode: null,
    );
    _connectedAt = DateTime.now();
  }

  Future<void> onAppPaused() async {
    _pausedAt = DateTime.now();
    _wasMicOnBeforePause = state.isMicOn;

    if (state.isConnected && state.isMicOn) {
      await _setMicrophoneEnabled(false, clearError: false);
    }
  }

  Future<void> onAppResumed() async {
    final pausedAt = _pausedAt;
    _pausedAt = null;

    if (pausedAt == null) return;

    final wasBackgroundTooLong =
        DateTime.now().difference(pausedAt) >= _backgroundDisconnectThreshold;
    final tokenTooOld =
        _connectedAt != null && DateTime.now().difference(_connectedAt!) >= _tokenRefreshThreshold;

    if (wasBackgroundTooLong || tokenTooOld) {
      final graphName = _lastGraphName;
      await disconnect();
      if (graphName != null) {
        await connect(graphName);
      }
      return;
    }

    if (state.isConnected && _wasMicOnBeforePause) {
      await _setMicrophoneEnabled(true, clearError: false);
    }

    _wasMicOnBeforePause = false;
  }

  Future<void> _setMicrophoneEnabled(bool enable, {bool clearError = true}) async {
    final room = _room ?? state.room;
    if (room == null || !state.isConnected) return;

    try {
      await room.localParticipant?.setMicrophoneEnabled(enable);
      if (!mounted) return;
      state = state.copyWith(
        isMicOn: enable,
        error: clearError ? null : state.error,
      );
    } catch (e) {
      if (mounted) {
        state = state.copyWith(error: 'Failed to toggle microphone: $e');
      }
    }
  }

  Future<void> toggleMicrophone() async {
    await _setMicrophoneEnabled(!state.isMicOn);
  }

  Future<void> _cleanupRoomResources() async {
    final room = _room ?? state.room;
    _room = null;

    await _listener?.dispose();
    _listener = null;

    if (room != null) {
      try {
        await room.disconnect();
      } catch (_) {
        // Ignore cleanup failure.
      }
    }
  }

  Future<void> disconnect() async {
    _connectedAt = null;
    _pausedAt = null;
    _wasMicOnBeforePause = false;
    await _cleanupRoomResources();

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
