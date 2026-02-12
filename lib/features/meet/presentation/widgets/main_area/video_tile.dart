import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import '../../../providers/participant_provider.dart';
import '../../../providers/active_speakers_provider.dart';

/// Video Tile Widget
/// Displays a single participant's video with name and status indicators
/// 1:1 clone of apps/meet/src/components/media-elements/video/index.tsx
class VideoTile extends ConsumerWidget {
  final Participant participant;
  final bool isSmall;

  const VideoTile({
    super.key,
    required this.participant,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Check if this participant is speaking
    final activeSpeakers = ref.watch(activeSpeakersProvider);
    final isSpeaking = activeSpeakers.speakers.values.any(
      (speaker) => speaker.userId == participant.identity && speaker.isSpeaking,
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSpeaking
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          width: isSpeaking ? 3 : 0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Video or placeholder
            _buildVideoContent(context),
            
            // Overlay with name and status
            _buildOverlay(context),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoContent(BuildContext context) {
    // Check if participant has video track
    TrackPublication? videoPub;
    
    // Check track publications
    for (var pub in participant.videoTrackPublications) {
      if (pub.source == TrackSource.camera || pub.kind.name.toLowerCase() == 'video') {
        videoPub = pub;
        break;
      }
    }

    final hasVideo = videoPub != null && videoPub.subscribed;

    if (hasVideo && videoPub.track is VideoTrack) {
      return VideoTrackRenderer(
        videoPub.track as VideoTrack,
        fit: VideoViewFit.cover,
      );
    }

    // No video - show avatar
    return Container(
      color: Colors.black87,
      child: Center(
        child: CircleAvatar(
          radius: isSmall ? 24 : 48,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            _getInitials(participant.name ?? participant.identity),
            style: TextStyle(
              fontSize: isSmall ? 16 : 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverlay(BuildContext context) {
    // Find audio track
    bool isMicOn = false;
    for (var pub in participant.audioTrackPublications) {
       if (pub.subscribed && !pub.muted) {
         isMicOn = true;
         break;
       }
    }

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(isSmall ? 4 : 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
        child: Row(
          children: [
            // Microphone status
            Icon(
              isMicOn ? Icons.mic : Icons.mic_off,
              size: isSmall ? 12 : 16,
              color: isMicOn ? Colors.white : Colors.red,
            ),
            const SizedBox(width: 4),
            
            // Name
            Expanded(
              child: Text(
                participant.name ?? participant.identity,
                style: TextStyle(
                  fontSize: isSmall ? 10 : 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            
            // Connection quality indicator
            _buildConnectionQuality(context, participant.connectionQuality),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectionQuality(BuildContext context, ConnectionQuality quality) {
    Color color;
    int bars;
    
    switch (quality) {
      case ConnectionQuality.excellent:
        color = Colors.green;
        bars = 3;
        break;
      case ConnectionQuality.good:
        color = Colors.yellow;
        bars = 2;
        break;
      case ConnectionQuality.poor:
        color = Colors.red;
        bars = 1;
        break;
      default:
        color = Colors.grey;
        bars = 0;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return Container(
          width: isSmall ? 2 : 3,
          height: isSmall ? (4.0 + index * 2) : (6.0 + index * 3),
          margin: const EdgeInsets.only(left: 1),
          decoration: BoxDecoration(
            color: index < bars ? color : Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(1),
          ),
        );
      }),
    );
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }
}
