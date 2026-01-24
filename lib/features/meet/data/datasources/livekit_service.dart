import 'dart:async';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/core/meet_config.dart';

final liveKitServiceProvider = Provider<LiveKitService>((ref) {
  return LiveKitService();
});

class LiveKitService {
  Room? _room;
  
  // Event callbacks (will be set by the Controller/Notifier)
  Function(List<Participant>)? onParticipantsChanged;
  Function(Participant, TrackPublication)? onTrackSubscribed;
  Function(Participant, TrackPublication)? onTrackUnsubscribed;
  Function(List<Participant>)? onActiveSpeakersChanged;
  Function(bool)? onConnectionStateChanged;

  Room? get room => _room;

  Future<void> connect(String url, String token) async {
    // Configure Room Options matching Web frontend
    final roomOptions = RoomOptions(
      adaptiveStream: true,
      dynacast: MeetConfig.enableDynacast,
      defaultVideoPublishOptions: const VideoPublishOptions(
        simulcast: MeetConfig.enableSimulcast,
        videoCodec: MeetConfig.videoCodec,
      ),
      defaultAudioPublishOptions: const AudioPublishOptions(
        // stopMicTrackOnMute: MeetConfig.stopMicTrackOnMute,
      ),
    );

    _room = Room(roomOptions: roomOptions);

    // Setup Listeners
    final listener = _room!.createListener();
    _setupListeners(listener);

    try {
      await _room!.connect(url, token);
      if (kDebugMode) {
        print('Connected to LiveKit room: ${_room!.name}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error connecting to LiveKit: $e');
      }
      rethrow;
    }
  }

  void _setupListeners(EventsListener<RoomEvent> listener) {
    listener
      ..on<RoomDisconnectedEvent>((event) {
        onConnectionStateChanged?.call(false);
      })
      ..on<ParticipantConnectedEvent>((event) {
        _notifyParticipants();
      })
      ..on<ParticipantDisconnectedEvent>((event) {
        _notifyParticipants();
      })
      ..on<TrackSubscribedEvent>((event) {
        onTrackSubscribed?.call(event.participant, event.publication);
      })
      ..on<TrackUnsubscribedEvent>((event) {
        onTrackUnsubscribed?.call(event.participant, event.publication);
      })
      ..on<ActiveSpeakersChangedEvent>((event) {
        onActiveSpeakersChanged?.call(event.speakers);
      });
  }

  void _notifyParticipants() {
    onParticipantsChanged?.call(allParticipants);
  }

  List<Participant> get allParticipants {
    if (_room == null) return [];
    
    final allParticipants = <Participant>[];
    allParticipants.add(_room!.localParticipant);
    allParticipants.addAll(_room!.remoteParticipants.values);
    return allParticipants;
  }

  Future<void> disconnect() async {
    await _room?.disconnect();
    _room = null;
  }

  // Media controls
  Future<void> setMicrophoneEnabled(bool enabled) async {
    await _room?.localParticipant.setMicrophoneEnabled(enabled);
  }

  Future<void> setCameraEnabled(bool enabled) async {
    await _room?.localParticipant.setCameraEnabled(enabled);
  }

  Future<void> setScreenShareEnabled(bool enabled) async {
    await _room?.localParticipant.setScreenShareEnabled(enabled);
  }

  Future<void> setSpeakerphoneEnabled(bool enabled) async {
    await Helper.setSpeakerphoneOn(enabled);
  }
}
