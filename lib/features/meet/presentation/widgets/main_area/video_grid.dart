import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../core/livekit/livekit_participant_lookup.dart';
import '../../../providers/active_speakers_provider.dart';
import '../../../providers/participant_provider.dart';
import '../../../providers/livekit_providers.dart';
import '../../../providers/room_settings_provider.dart';
import '../../../providers/session_provider.dart';
import 'video_tile.dart';

/// Video Grid Widget
/// Displays all participant videos in a responsive grid
/// 1:1 clone of apps/meet/src/components/main-area/index.tsx
class VideoGrid extends ConsumerWidget {
  const VideoGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // Source of truth for who should appear on grid is NATS participant list.
    // LiveKit participant is attached when available to render video/audio state.
    final participantInfos = ref.watch(allParticipantsProvider);
    // Rebuild khi LiveKit subscribers thay đổi (web: videoSubscribersMap emit).
    ref.watch(sessionProvider.select((s) => s.totalVideoSubscribers));
    final livekitConn = ref.read(sessionProvider.notifier).livekitConn;
    final localIdentity = livekitConn?.room.localParticipant?.identity;

    var tiles = participantInfos.where((p) => p.metadata.isOnline).map((info) {
      final livekitParticipant = resolveLivekitParticipant(
        room: livekitConn?.room,
        info: info,
        localIdentity: localIdentity,
      );

      return _TileData(
        userId: info.userId,
        name: info.name,
        livekitParticipant: livekitParticipant,
      );
    }).toList();

    final focusOnSpeaker = ref.watch(
      roomSettingsProvider.select((s) => s.focusActiveSpeakerWebcam),
    );
    if (focusOnSpeaker) {
      final speakingIds = ref
          .watch(currentlySpeakingProvider)
          .map((s) => s.userId)
          .toSet();
      tiles = List<_TileData>.from(tiles)
        ..sort((a, b) {
          final aSp = speakingIds.contains(a.userId);
          final bSp = speakingIds.contains(b.userId);
          if (aSp == bSp) return 0;
          return aSp ? -1 : 1;
        });
    }

    final pinCamUserId = ref.watch(
      roomSettingsProvider.select((s) => s.pinCamUserId),
    );
    if (pinCamUserId != null) {
      final hasPin = tiles.any((t) => t.userId == pinCamUserId);
      if (!hasPin || tiles.length <= 1) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(roomSettingsProvider.notifier).updatePinCamUserId(null);
        });
      }
    }

    final screenShareTracksAsync = ref.watch(screenShareTracksProvider);
    final screenShareTracks =
        screenShareTracksAsync.valueOrNull ??
        (livekitConn?.screenShareTracksMap ??
            const <String, List<TrackPublication>>{});
    final focusedScreenShare = _findActiveScreenShareFromMap(
      screenShareTracks,
      participantInfos,
    );
    final fallbackScreenShare =
        focusedScreenShare ??
        _findActiveScreenShareFromRoom(livekitConn?.room, participantInfos);

    final screenShareToShow = focusedScreenShare ?? fallbackScreenShare;

    // Only show screen-share layout when there is a real video track. Session flag can stay
    // true briefly (e.g. audio-only publication left) and would otherwise keep a black/placeholder panel.
    if (screenShareToShow != null && screenShareToShow.track != null) {
      return _buildScreenShareLayout(context, ref, tiles, screenShareToShow);
    }

    // Web VideosComponent: ghim webcam (pinCamUserId) khi có ≥ 2 người.
    if (pinCamUserId != null && tiles.length > 1) {
      _TileData? pinTile;
      for (final t in tiles) {
        if (t.userId == pinCamUserId) {
          pinTile = t;
          break;
        }
      }
      if (pinTile != null) {
        final others = tiles.where((t) => t.userId != pinCamUserId).toList();
        return _buildPinnedCamLayout(context, pinTile, others);
      }
    }

    return _buildGridLayout(context, tiles);
  }

  Widget _buildScreenShareLayout(
    BuildContext context,
    WidgetRef ref,
    List<_TileData> participants,
    _ScreenShareFocus? focusedScreenShare,
  ) {
    final theme = Theme.of(context);
    final screenSharing = ref.watch(
      sessionProvider.select((s) => s.screenSharing),
    );

    return Column(
      children: [
        // Screen share (main area)
        Expanded(
          flex: 3,
          child: Container(
            color: theme.colorScheme.onSurface,
            child: focusedScreenShare?.track != null
                ? VideoTrackRenderer(
                    focusedScreenShare!.track!,
                    fit: VideoViewFit.contain,
                  )
                : Center(
                    child: Text(
                      'Screen Share by ${focusedScreenShare?.sharedBy ?? screenSharing.sharedBy}',
                      style: TextStyle(color: theme.colorScheme.onPrimary),
                    ),
                  ),
          ),
        ),

        if (focusedScreenShare != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            color: theme.colorScheme.surfaceContainer,
            child: Text(
              'Đang chia sẻ màn hình: ${focusedScreenShare.sharedBy}',
              style: TextStyle(
                color: theme.colorScheme.onSurface,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

        // Participant thumbnails
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemCount: participants.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  width: 160,
                  child: VideoTile(
                    userId: participants[index].userId,
                    name: participants[index].name,
                    participant: participants[index].livekitParticipant,
                    isSmall: true,
                    showPinButton: participants.length > 1,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGridLayout(BuildContext context, List<_TileData> participants) {
    final theme = Theme.of(context);
    if (participants.isEmpty) {
      return Center(
        child: Text(
          'Waiting for participants...',
          style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
        ),
      );
    }

    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;

    // Calculate grid columns based on participant count and orientation
    int crossAxisCount;
    if (participants.length == 1) {
      crossAxisCount = 1;
    } else if (participants.length == 2) {
      crossAxisCount = isPortrait ? 1 : 2;
    } else if (participants.length <= 4) {
      crossAxisCount = 2;
    } else if (participants.length <= 9) {
      crossAxisCount = isPortrait ? 2 : 3;
    } else {
      crossAxisCount = isPortrait ? 3 : 4;
    }

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 14 / 9,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: participants.length,
      itemBuilder: (context, index) {
        return VideoTile(
          userId: participants[index].userId,
          name: participants[index].name,
          participant: participants[index].livekitParticipant,
          showPinButton: participants.length > 1,
        );
      },
    );
  }

  /// Web `PinnedLayout`: một ô lớn + strip ngang (không có screen share).
  Widget _buildPinnedCamLayout(
    BuildContext context,
    _TileData pinned,
    List<_TileData> others,
  ) {
    final theme = Theme.of(context);
    final showPin = others.isNotEmpty;
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: VideoTile(
              userId: pinned.userId,
              name: pinned.name,
              participant: pinned.livekitParticipant,
              showPinButton: showPin,
            ),
          ),
        ),
        SizedBox(
          height: 128,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            itemCount: others.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  width: 160,
                  child: VideoTile(
                    userId: others[index].userId,
                    name: others[index].name,
                    participant: others[index].livekitParticipant,
                    isSmall: true,
                    showPinButton: showPin,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ScreenShareFocus {
  final String sharedBy;
  final VideoTrack? track;

  _ScreenShareFocus({required this.sharedBy, required this.track});
}

_ScreenShareFocus? _findActiveScreenShareFromMap(
  Map<String, List<TrackPublication>> screenShareTracks,
  List<ParticipantInfo> participants,
) {
  if (screenShareTracks.isEmpty) return null;

  for (final entry in screenShareTracks.entries) {
    final userId = entry.key;
    final tracks = entry.value;
    for (final pub in tracks) {
      if (pub.source == TrackSource.screenShareVideo &&
          pub.track is VideoTrack &&
          !pub.muted) {
        final p = participants.where((e) => e.userId == userId).toList();
        final name = p.isNotEmpty ? p.first.name : userId;
        return _ScreenShareFocus(
          sharedBy: name,
          track: pub.track as VideoTrack,
        );
      }
    }
  }
  return null;
}

_ScreenShareFocus? _findActiveScreenShareFromRoom(
  Room? room,
  List<ParticipantInfo> participants,
) {
  if (room == null) return null;

  final remoteParticipants = room.remoteParticipants.values.toList();
  for (final participant in remoteParticipants) {
    for (final pub in participant.trackPublications.values) {
      if (pub.source == TrackSource.screenShareVideo &&
          pub.track is VideoTrack &&
          !pub.muted) {
        final p = participants
            .where((e) => e.userId == participant.identity)
            .toList();
        final name = p.isNotEmpty ? p.first.name : participant.identity;
        return _ScreenShareFocus(
          sharedBy: name,
          track: pub.track as VideoTrack,
        );
      }
    }
  }

  final local = room.localParticipant;
  if (local != null) {
    for (final pub in local.trackPublications.values) {
      if (pub.source == TrackSource.screenShareVideo &&
          pub.track is VideoTrack &&
          !pub.muted) {
        final p = participants
            .where((e) => e.userId == local.identity)
            .toList();
        final name = p.isNotEmpty ? p.first.name : local.identity;
        return _ScreenShareFocus(
          sharedBy: name,
          track: pub.track as VideoTrack,
        );
      }
    }
  }

  return null;
}

class _TileData {
  final String userId;
  final String name;
  final Participant? livekitParticipant;

  _TileData({
    required this.userId,
    required this.name,
    required this.livekitParticipant,
  });
}
