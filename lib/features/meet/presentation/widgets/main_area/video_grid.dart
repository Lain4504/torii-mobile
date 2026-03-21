import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/participant_provider.dart';
import '../../../providers/livekit_providers.dart';
import '../../../providers/session_provider.dart';
import 'video_tile.dart';

/// Video Grid Widget
/// Displays all participant videos in a responsive grid
/// 1:1 clone of apps/meet/src/components/main-area/index.tsx
class VideoGrid extends ConsumerWidget {
  const VideoGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Source of truth for who should appear on grid is NATS participant list.
    // LiveKit participant is attached when available to render video/audio state.
    final participantInfos = ref.watch(allParticipantsProvider);
    final livekitConn = ref.read(sessionProvider.notifier).livekitConn;
    final localIdentity = livekitConn?.room.localParticipant?.identity;

    final tiles = participantInfos
        .where((p) => p.metadata.isOnline)
        .map((info) {
      Participant? livekitParticipant;
      if (livekitConn != null) {
        if (localIdentity != null && info.userId == localIdentity) {
          livekitParticipant = livekitConn.room.localParticipant;
        } else {
          livekitParticipant = livekitConn.room.remoteParticipants[info.userId];
        }
      }

      return _TileData(
        userId: info.userId,
        name: info.name,
        livekitParticipant: livekitParticipant,
      );
    }).toList();

    final screenShareTracksAsync = ref.watch(screenShareTracksProvider);
    final screenShareTracks = screenShareTracksAsync.valueOrNull ??
        (livekitConn?.screenShareTracksMap ?? const <String, List<TrackPublication>>{});
    final focusedScreenShare = _findActiveScreenShareFromMap(
      screenShareTracks,
      participantInfos,
    );
    final fallbackScreenShare = focusedScreenShare ??
        _findActiveScreenShareFromRoom(
          livekitConn?.room,
          participantInfos,
        );

    final screenShareToShow = focusedScreenShare ?? fallbackScreenShare;

    // Only show screen-share layout when there is a real video track. Session flag can stay
    // true briefly (e.g. audio-only publication left) and would otherwise keep a black/placeholder panel.
    if (screenShareToShow != null && screenShareToShow.track != null) {
      return _buildScreenShareLayout(
        context,
        ref,
        tiles,
        screenShareToShow,
      );
    }

    // Normal grid layout
    return _buildGridLayout(context, tiles);
  }

  Widget _buildScreenShareLayout(
    BuildContext context,
    WidgetRef ref,
    List<_TileData> participants,
    _ScreenShareFocus? focusedScreenShare,
  ) {
    final screenSharing = ref.watch(
      sessionProvider.select((s) => s.screenSharing),
    );
    
    return Column(
      children: [
        // Screen share (main area)
        Expanded(
          flex: 3,
          child: Container(
            color: AppColors.textPrimary,
            child: focusedScreenShare?.track != null
                ? VideoTrackRenderer(
                    focusedScreenShare!.track!,
                    fit: VideoViewFit.contain,
                  )
                : Center(
                    child: Text(
                      'Screen Share by ${focusedScreenShare?.sharedBy ?? screenSharing.sharedBy}',
                      style: const TextStyle(color: AppColors.textOnPrimary),
                    ),
                  ),
          ),
        ),

        if (focusedScreenShare != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            color: AppColors.surfaceDark,
            child: Text(
              'Đang chia sẻ màn hình: ${focusedScreenShare.sharedBy}',
              style: const TextStyle(
                color: AppColors.textOnPrimary,
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
    if (participants.isEmpty) {
      return Center(
        child: Text(
          'Waiting for participants...',
          style: TextStyle(color: AppColors.textOnPrimary.withOpacity(0.7)),
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
        );
      },
    );
  }
}

class _ScreenShareFocus {
  final String sharedBy;
  final VideoTrack? track;

  _ScreenShareFocus({
    required this.sharedBy,
    required this.track,
  });
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
        final p = participants.where((e) => e.userId == participant.identity).toList();
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
        final p = participants.where((e) => e.userId == local.identity).toList();
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
