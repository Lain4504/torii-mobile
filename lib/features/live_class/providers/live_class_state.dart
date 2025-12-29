import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for live class/WebRTC connection
class LiveClassState {
  final bool isConnected;
  final bool isMicEnabled;
  final bool isCameraEnabled;
  final bool isScreenSharing;
  final List<dynamic> participants; // TODO: Replace with Participant model
  final bool isLoading;
  final String? error;

  const LiveClassState({
    this.isConnected = false,
    this.isMicEnabled = false,
    this.isCameraEnabled = false,
    this.isScreenSharing = false,
    this.participants = const [],
    this.isLoading = false,
    this.error,
  });

  LiveClassState copyWith({
    bool? isConnected,
    bool? isMicEnabled,
    bool? isCameraEnabled,
    bool? isScreenSharing,
    List<dynamic>? participants,
    bool? isLoading,
    String? error,
  }) {
    return LiveClassState(
      isConnected: isConnected ?? this.isConnected,
      isMicEnabled: isMicEnabled ?? this.isMicEnabled,
      isCameraEnabled: isCameraEnabled ?? this.isCameraEnabled,
      isScreenSharing: isScreenSharing ?? this.isScreenSharing,
      participants: participants ?? this.participants,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

/// Notifier for live class WebRTC connection
class LiveClassNotifier extends Notifier<LiveClassState> {
  @override
  LiveClassState build() => const LiveClassState();

  // TODO: Inject WebRTC service
  
  Future<void> joinRoom(String roomId) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      // TODO: Call WebRTC service to join room
      await Future.delayed(const Duration(seconds: 2)); // Simulate connection
      
      state = state.copyWith(
        isConnected: true,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> leaveRoom() async {
    // TODO: Call WebRTC service to leave room
    state = state.copyWith(
      isConnected: false,
      isMicEnabled: false,
      isCameraEnabled: false,
      isScreenSharing: false,
      participants: [],
    );
  }

  void toggleMicrophone() {
    // TODO: Call WebRTC service to toggle mic
    state = state.copyWith(isMicEnabled: !state.isMicEnabled);
  }

  void toggleCamera() {
    // TODO: Call WebRTC service to toggle camera
    state = state.copyWith(isCameraEnabled: !state.isCameraEnabled);
  }

  void toggleScreenSharing() {
    // TODO: Call WebRTC service to toggle screen sharing
    state = state.copyWith(isScreenSharing: !state.isScreenSharing);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

