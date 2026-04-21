// HandleMediaTracks - Track Subscription Handler
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
import 'package:torii_app/features/meet/providers/bottom_icons_provider.dart';

// Types
import 'livekit_types.dart';

/// Handle media track events
///
/// It manages track subscription/publication events and updates providers.
class HandleMediaTracks {
  final IConnectLivekit connectLivekit;
  final Ref ref;

  HandleMediaTracks({required this.connectLivekit, required this.ref});

  /// Handle local track published
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
  void trackSubscriptionFailed(
    RemoteParticipant participant, {
    String? trackSid,
    Object? reason,
  }) {
    if (kDebugMode) {
      print(
        'HandleMediaTracks: Track subscription failed - sid: $trackSid, reason: $reason',
      );
    }

    ref
        .read(roomSettingsProvider.notifier)
        .addUserNotification(
          UserNotification(
            message:
                'Không thể đăng ký track từ ${participant.name.isNotEmpty ? participant.name : participant.identity}',
            typeOption: 'error',
          ),
        );
  }

  /// Handle track muted
  void trackMuted(TrackPublication publication, Participant participant) {
    final localId = connectLivekit.localUserId;

    if (publication.source == TrackSource.microphone) {
      ref.read(participantProvider.notifier).updateParticipant(
            userId: participant.identity,
            changes: {'isMicMuted': true},
          );
      if (participant.identity == localId) {
        ref.read(bottomIconsProvider.notifier).updateMicStatus(true);
      }
      _removeSpeaker(publication, participant);
    }

    if (kDebugMode) {
      print(
        'HandleMediaTracks: Track muted - ${publication.source.name} from ${participant.identity}',
      );
    }
  }

  /// Handle track unmuted
  void trackUnmuted(TrackPublication publication, Participant participant) {
    final localId = connectLivekit.localUserId;

    if (publication.source == TrackSource.microphone) {
      ref.read(participantProvider.notifier).updateParticipant(
            userId: participant.identity,
            changes: {'isMicMuted': false},
          );
      if (participant.identity == localId) {
        ref.read(bottomIconsProvider.notifier).updateMicStatus(false);
      }
      _addSpeaker(publication, participant);
    }

    if (kDebugMode) {
      print(
        'HandleMediaTracks: Track unmuted - ${publication.source.name} from ${participant.identity}',
      );
    }
  }

  /// Handle track stream state changed
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

  /// Web `HandleMediaTracks._shouldAddWebcam` (thiếu `recordingFeatures` đầy đủ — model room chưa có).
  bool _shouldAddWebcam(Participant participant) {
    final localId = connectLivekit.localUserId;
    if (participant.identity == localId) {
      return true;
    }

    final user = ref.read(participantProvider).participants[participant.identity];
    if (user == null) {
      return false;
    }

    final ctx = connectLivekit.meetHandlerContext;
    if (ctx?.meetLocalIsRecorder == true) {
      // Web: recordWebcam / onlyRecordAdminWebcams — bỏ qua nếu không có trong RoomInfo/UserMetadata.
      return true;
    }

    final rf = ctx?.meetRoomFeatures;
    final adminOnlyWebcams = rf?.adminOnlyWebcams ?? false;
    final allowViewOtherWebcams = rf?.allowViewOtherWebcams ?? true;
    final currentIsAdmin = ctx?.meetLocalIsAdmin ?? false;

    if ((adminOnlyWebcams || !allowViewOtherWebcams) && !currentIsAdmin) {
      return user.metadata.isAdmin;
    }
    return true;
  }

  /// Add subscriber for track
  void _addSubscriber(TrackPublication track, Participant participant) {
    switch (track.source) {
      case TrackSource.camera:
        if (!_shouldAddWebcam(participant)) {
          return;
        }
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
        connectLivekit.removeScreenShareTrack(
          participant.identity,
          publicationSid: track.sid,
        );

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
          name: participant.name.isNotEmpty
              ? participant.name
              : participant.identity,
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
