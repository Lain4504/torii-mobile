import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import 'session_provider.dart';
import '../core/livekit/connect_livekit.dart';

// Stream provider for video subscribers
final videoSubscribersProvider = StreamProvider<Map<String, Participant>>((ref) {
  // Watch session provider to ensure we rebuild when connection changes
  ref.watch(sessionProvider);
  
  final notifier = ref.read(sessionProvider.notifier);
  final conn = notifier.livekitConn;
  
  if (conn == null) {
    return Stream.value({});
  }
  
  return conn.onVideoSubscribers;
});

// Stream provider for audio subscribers
final audioSubscribersProvider = StreamProvider<Map<String, RemoteParticipant>>((ref) {
  ref.watch(sessionProvider);
  
  final notifier = ref.read(sessionProvider.notifier);
  final conn = notifier.livekitConn;
  
  if (conn == null) {
    return Stream.value({});
  }
  
  return conn.onAudioSubscribers;
});

// Stream provider for screen share tracks
final screenShareTracksProvider = StreamProvider<Map<String, List<TrackPublication>>>((ref) {
  ref.watch(sessionProvider);
  
  final notifier = ref.read(sessionProvider.notifier);
  final conn = notifier.livekitConn;
  
  if (conn == null) {
    return Stream.value({});
  }
  
  return conn.onScreenShareTracks;
});

// Provider for local participant
final localParticipantProvider = Provider<LocalParticipant?>((ref) {
  ref.watch(sessionProvider);
  
  final notifier = ref.read(sessionProvider.notifier);
  final conn = notifier.livekitConn;
  
  return conn?.room.localParticipant;
});
