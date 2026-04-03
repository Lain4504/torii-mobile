// HandleMediaTracks - Track Subscription Handler
// 1:1 clone of apps/meet/src/helpers/livekit/HandleMediaTracks.ts
//
// Responsibilities:
// - Handle local track published/unpublished
// - Handle remote track subscribed/unsubscribed
// - Handle track muted/unmuted events
// - Manage active speakers
// - Update participant provider with track states

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';

// Providers
import 'package:torii_app/features/meet/providers/participant_provider.dart';
import 'package:torii_app/features/meet/providers/room_settings_provider.dart';
import 'package:torii_app/features/meet/providers/active_speakers_provider.dart';

// Types
import 'livekit_types.dart';

/// Handle media track events
///
/// This class is a 1:1 clone of the web HandleMediaTracks.ts class.
/// It manages track subscription/publication events and updates providers.
class HandleMediaTracks {
  final IConnectLivekit connectLivekit;
  final Ref ref;

  HandleMediaTracks({required this.connectLivekit, required this.ref});

  /// Handle local track published
  /// Matches: localTrackPublished() in HandleMediaTracks.ts
  void localTrackPublished(
    TrackPublication track,
    LocalParticipant participant,
  ) {
    _addSubscriber(track, participant);
    _addSpeaker(track, participant);

    if (kDebugMode) {
      print('HandleMediaTracks: Local track published - ${track.source.name}');
    }
  }

  /// Handle local track unpublished
  /// Matches: localTrackUnpublished() in HandleMediaTracks.ts
  void localTrackUnpublished(
    TrackPublication track,
    LocalParticipant participant,
  ) {
    _removeSubscriber(track, participant);
    _removeSpeaker(track, participant);

    if (kDebugMode) {
      print(
        'HandleMediaTracks: Local track unpublished - ${track.source.name}',
      );
    }
  }

  /// Handle remote track subscribed
  /// Matches: trackSubscribed() in HandleMediaTracks.ts
  void trackSubscribed(
    Track track,
    TrackPublication publication,
    RemoteParticipant participant,
  ) {
    _addSubscriber(publication, participant);
    _addSpeaker(publication, participant);

    // Update connection quality
    ref
        .read(participantProvider.notifier)
        .updateParticipant(
          userId: participant.identity,
          changes: {'connectionQuality': participant.connectionQuality.name},
        );

    if (kDebugMode) {
      print(
        'HandleMediaTracks: Track subscribed - ${publication.source.name} from ${participant.identity}',
      );
    }
  }

  /// Handle remote track unsubscribed / unpublished
  /// Matches: trackUnsubscribed() in HandleMediaTracks.ts
  /// [track] có thể null khi [TrackUnpublishedEvent] (track đã gỡ).
  void trackUnsubscribed(
    Track? track,
    TrackPublication publication,
    RemoteParticipant participant,
  ) {
    _removeSubscriber(publication, participant);
    _removeSpeaker(publication, participant);

    if (kDebugMode) {
        print(
        'HandleMediaTracks: Track unsubscribed - ${publication.source.name} from ${participant.identity}',
      );
    }
  }

  /// Handle track subscription failed
  /// Matches: trackSubscriptionFailed() in HandleMediaTracks.ts
  void trackSubscriptionFailed(
    String sid,
    Exception? error,
    RemoteParticipant participant,
  ) {
    if (kDebugMode) {
      print(
        'HandleMediaTracks: Track subscription failed - $sid, error: $error',
      );
    }

    // Show notification
    ref
        .read(roomSettingsProvider.notifier)
        .addUserNotification(
          UserNotification(
            message:
                'Không thể đăng ký track từ ${participant.name ?? participant.identity}',
            typeOption: 'error',
          ),
        );
  }

  /// Handle track muted
  /// Matches: trackMuted() in HandleMediaTracks.ts
  void trackMuted(TrackPublication publication, Participant participant) {
    if (publication.source == TrackSource.microphone) {
      // Update participant mic muted state
      ref
          .read(participantProvider.notifier)
          .updateParticipant(
            userId: participant.identity,
            changes: {
              'metadata': {
                ...ref
                        .read(participantProvider)
                        .participants[participant.identity]
                        ?.metadata
                        .toJson() ??
                    {},
                'isMicMuted': true,
              },
            },
          );

      // Remove from active speakers
      _removeSpeaker(publication, participant);
    }

    if (kDebugMode) {
      print(
        'HandleMediaTracks: Track muted - ${publication.source.name} from ${participant.identity}',
      );
    }
  }

  /// Handle track unmuted
  /// Matches: trackUnmuted() in HandleMediaTracks.ts
  void trackUnmuted(TrackPublication publication, Participant participant) {
    if (publication.source == TrackSource.microphone) {
      // Update participant mic unmuted state
      ref
          .read(participantProvider.notifier)
          .updateParticipant(
            userId: participant.identity,
            changes: {
              'metadata': {
                ...ref
                        .read(participantProvider)
                        .participants[participant.identity]
                        ?.metadata
                        .toJson() ??
                    {},
                'isMicMuted': false,
              },
            },
          );

      // Add to active speakers
      _addSpeaker(publication, participant);
    }

    if (kDebugMode) {
      print(
        'HandleMediaTracks: Track unmuted - ${publication.source.name} from ${participant.identity}',
      );
    }
  }

  /// Handle track stream state changed
  /// Matches: trackStreamStateChanged() in HandleMediaTracks.ts
  void trackStreamStateChanged(
    TrackPublication publication,
    StreamState streamState,
    Participant participant,
  ) {
    if (kDebugMode) {
      print(
        'HandleMediaTracks: Track stream state changed - ${publication.source.name} to ${streamState.name}',
      );
    }

    // Update participant state based on stream state
    if (streamState == StreamState.paused) {
      // Track is paused (e.g., due to bandwidth constraints)
      if (publication.source == TrackSource.camera) {
        ref
            .read(participantProvider.notifier)
            .updateParticipant(
              userId: participant.identity,
              changes: {'videoTrackPaused': true},
            );
      }
    } else if (streamState == StreamState.active) {
      // Track is active
      if (publication.source == TrackSource.camera) {
        ref
            .read(participantProvider.notifier)
            .updateParticipant(
              userId: participant.identity,
              changes: {'videoTrackPaused': false},
            );
      }
    }
  }

  /// Add subscriber for track
  /// Matches: addSubscriber() in HandleMediaTracks.ts
  void _addSubscriber(TrackPublication track, Participant participant) {
    switch (track.source) {
      case TrackSource.camera:
        connectLivekit.addVideoSubscriber(participant);

        // Update participant video track state
        ref
            .read(participantProvider.notifier)
            .updateParticipant(
              userId: participant.identity,
              changes: {'hasVideoTrack': true},
            );
        break;

      case TrackSource.microphone:
        connectLivekit.addAudioSubscriber(participant);

        // Update participant audio track state
        ref
            .read(participantProvider.notifier)
            .updateParticipant(
              userId: participant.identity,
              changes: {'hasAudioTrack': true},
            );
        break;

      case TrackSource.screenShareVideo:
      case TrackSource.screenShareAudio:
        connectLivekit.addScreenShareTrack(participant.identity, track);

        // Update participant screen share state
        ref
            .read(participantProvider.notifier)
            .updateParticipant(
              userId: participant.identity,
              changes: {'screenShareTrack': 1},
            );
        break;

      default:
        break;
    }
  }

  /// Remove subscriber for track
  /// Matches: removeSubscriber() in HandleMediaTracks.ts
  void _removeSubscriber(TrackPublication track, Participant participant) {
    switch (track.source) {
      case TrackSource.camera:
        connectLivekit.removeVideoSubscriber(participant.identity);

        // Update participant video track state
        ref
            .read(participantProvider.notifier)
            .updateParticipant(
              userId: participant.identity,
              changes: {'hasVideoTrack': false},
            );

        // Web HandleMediaTracks.removeSubscriber(camera): clear pin if pinned user turned cam off.
        final pinned = ref.read(roomSettingsProvider).pinCamUserId;
        if (pinned != null && pinned == participant.identity) {
          ref.read(roomSettingsProvider.notifier).updatePinCamUserId(null);
        }
        break;

      case TrackSource.microphone:
        connectLivekit.removeAudioSubscriber(participant.identity);

        // Update participant audio track state
        ref
            .read(participantProvider.notifier)
            .updateParticipant(
              userId: participant.identity,
              changes: {'hasAudioTrack': false},
            );
        break;

      case TrackSource.screenShareVideo:
      case TrackSource.screenShareAudio:
        connectLivekit.removeScreenShareTrack(participant.identity);

        // Update participant screen share state
        ref
            .read(participantProvider.notifier)
            .updateParticipant(
              userId: participant.identity,
              changes: {'screenShareTrack': 0},
            );
        break;

      default:
        break;
    }
  }

  /// Add speaker for active speaker detection
  /// Matches: addSpeaker() in HandleMediaTracks.ts
  void _addSpeaker(TrackPublication track, Participant participant) {
    if (track.source != TrackSource.microphone) {
      return;
    }

    // Check if participant exists and is online
    final existUser = ref
        .read(participantProvider)
        .participants[participant.identity];
    if (existUser == null || !existUser.metadata.isOnline) {
      return;
    }

    // Check if mic is muted
    final isMuted = track.muted;
    if (isMuted) {
      return;
    }

    // Add to active speakers provider
    ref
        .read(activeSpeakersProvider.notifier)
        .addOrUpdateSpeaker(
          userId: participant.identity,
          name: participant.name ?? participant.identity,
          isSpeaking: false,
          audioLevel: 0.0,
        );

    // TODO: Add audio stream for activity detection
    // This would require audio processing to detect voice activity
    // For now, we rely on LiveKit's isSpeaking events

    if (kDebugMode) {
      print('HandleMediaTracks: Added speaker - ${participant.identity}');
    }
  }

  /// Remove speaker from active speaker detection
  /// Matches: removeSpeaker() in HandleMediaTracks.ts
  void _removeSpeaker(TrackPublication track, Participant participant) {
    if (track.source != TrackSource.microphone) {
      return;
    }

    // Remove from active speakers provider
    ref
        .read(activeSpeakersProvider.notifier)
        .removeOneSpeaker(participant.identity);

    // TODO: Remove audio stream
    // This would stop audio processing for this participant

    if (kDebugMode) {
      print('HandleMediaTracks: Removed speaker - ${participant.identity}');
    }
  }
}
