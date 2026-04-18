// LiveKit Types - Type Definitions
// 1:1 clone of apps/meet/src/helpers/livekit/types.ts
//
// Defines interfaces and enums for LiveKit integration

import 'package:livekit_client/livekit_client.dart';

/// Events emitted by ConnectLivekit
enum CurrentConnectionEvents {
  screenShareStatus,
  videoStatus,
  audioSubscribers,
  videoSubscribers,
  screenShareTracks,
}

/// LiveKit connection information
class LivekitInfo {
  final String livekitHost;
  final String token;
  final bool? enabledE2EE;
  final String? encryptionKey;

  LivekitInfo({
    required this.livekitHost,
    required this.token,
    this.enabledE2EE,
    this.encryptionKey,
  });

  factory LivekitInfo.fromJson(Map<String, dynamic> json) {
    return LivekitInfo(
      livekitHost: json['livekit_host'] as String,
      token: json['token'] as String,
      enabledE2EE: json['enabledE2EE'] as bool?,
      encryptionKey: json['encryption_key'] as String?,
    );
  }
}

/// Interface for ConnectLivekit
/// Matches: IConnectLivekit in types.ts
abstract class IConnectLivekit {
  /// Get the LiveKit room instance
  Room get room;

  /// Get video subscribers map
  Map<String, Participant> get videoSubscribersMap;

  /// Get audio subscribers map
  Map<String, RemoteParticipant> get audioSubscribersMap;

  /// Get screen share tracks map
  Map<String, List<TrackPublication>> get screenShareTracksMap;

  /// Initialize connection to LiveKit server
  Future<void> initializeConnection(String url, String token);

  /// Disconnect from room
  Future<void> disconnectRoom(bool normalDisconnect);

  /// Set error status
  void setErrorStatus(String title, String reason);

  /// Add audio subscriber
  void addAudioSubscriber(Participant participant);

  /// Remove audio subscriber
  void removeAudioSubscriber(String userId);

  /// Add video subscriber
  void addVideoSubscriber(Participant participant);

  /// Remove video subscriber
  void removeVideoSubscriber(String userId);

  /// Toggle audio
  Future<void> toggleAudio(bool enable);

  /// Toggle video
  Future<void> toggleVideo(bool enable);

  /// Add screen share track
  void addScreenShareTrack(String userId, TrackPublication track);

  /// Remove screen share track
  void removeScreenShareTrack(String userId, {String? publicationSid});
}
