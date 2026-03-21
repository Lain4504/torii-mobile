import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/bottom_icons_provider.dart';
import '../../../providers/participant_provider.dart';
import '../../../providers/active_speakers_provider.dart';

/// Video Tile Widget
/// Displays a single participant's video with name and status indicators
/// 1:1 clone of apps/meet/src/components/media-elements/video/index.tsx
class VideoTile extends ConsumerWidget {
  final Participant? participant;
  final String userId;
  final String name;
  final bool isSmall;

  const VideoTile({
    super.key,
    required this.userId,
    required this.name,
    this.participant,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Check if this participant is speaking
    final activeSpeakers = ref.watch(activeSpeakersProvider);
    final isSpeaking = activeSpeakers.speakers.values.any(
      (speaker) => speaker.userId == userId && speaker.isSpeaking,
    );
    // Raised hand from our participant list (synced from NATS metadata)
    final participantInfo = ref.watch(participantProvider).participants[userId];
    final isRaisedHand = participantInfo?.metadata.isHandRaised ?? false;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariantDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSpeaking
              ? Theme.of(context).colorScheme.primary.withOpacity(0.8)
              : AppColors.textPrimaryDark.withOpacity(0.2),
          width: isSpeaking ? 3 : 1,
        ),
        boxShadow: isSpeaking
            ? [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  blurRadius: 12,
                  spreadRadius: 2,
                )
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Video or placeholder
            _buildVideoContent(context, ref),
            
            // Overlay with name and status
            _buildOverlay(context, ref, isRaisedHand),
            
            // Speaking indicator (top right small dot)
            if (isSpeaking)
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                        blurRadius: 6,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoContent(BuildContext context, WidgetRef ref) {
    // If local user turned camera off from mobile controls, always show avatar.
    final localCameraMuted = ref.watch(
      bottomIconsProvider.select((s) => s.isWebcamMuted),
    );
    if (participant is LocalParticipant && localCameraMuted) {
      return _buildAvatarPlaceholder(context);
    }

    if (participant == null) {
      return _buildAvatarPlaceholder(context);
    }

    TrackPublication? videoPub;
    for (var pub in participant!.videoTrackPublications) {
      if (pub.source == TrackSource.camera || pub.kind == TrackType.VIDEO) {
        videoPub = pub;
        break;
      }
    }

    final hasVideo = videoPub != null &&
        videoPub.track != null &&
        videoPub.subscribed &&
        !videoPub.muted;

    if (hasVideo && videoPub.track is VideoTrack) {
      return VideoTrackRenderer(
        videoPub.track as VideoTrack,
        fit: VideoViewFit.cover,
      );
    }

    return _buildAvatarPlaceholder(context);
  }

  Widget _buildAvatarPlaceholder(BuildContext context) {
    return Container(
      color: AppColors.surfaceDark,
      child: Center(
        child: Container(
          width: isSmall ? 48 : 96,
          height: isSmall ? 48 : 96,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              _getInitials(name),
              style: TextStyle(
                fontSize: isSmall ? 18 : 36,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.primary,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverlay(BuildContext context, WidgetRef ref, bool isRaisedHand) {
    final isMicOn = _resolveMicOn(ref);

    return Positioned(
      left: 10,
      right: 10,
      bottom: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.textPrimary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.textOnPrimary.withOpacity(0.1),
                width: 0.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isRaisedHand) ...[
                  const Icon(Icons.back_hand_rounded, size: 14, color: AppColors.accent),
                  const SizedBox(width: 6),
                ],
                Icon(
                  isMicOn ? Icons.mic_rounded : Icons.mic_off_rounded,
                  size: 14,
                  color: isMicOn ? Theme.of(context).colorScheme.primary : AppColors.error,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textOnPrimary,
                      letterSpacing: 0.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                _buildConnectionQuality(
                  context,
                  participant?.connectionQuality ?? ConnectionQuality.unknown,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _resolveMicOn(WidgetRef ref) {
    if (participant is LocalParticipant) {
      // Must watch — ref.read would not rebuild overlay when footer/LiveKit updates mic state.
      final isMicMuted = ref.watch(
        bottomIconsProvider.select((s) => s.isMicMuted),
      );
      return !isMicMuted;
    }
    if (participant == null) return false;
    for (final pub in participant!.audioTrackPublications) {
      if (pub.source == TrackSource.microphone &&
          !pub.muted &&
          (pub.track != null || pub.subscribed)) {
        return true;
      }
    }
    return false;
  }

  Widget _buildConnectionQuality(BuildContext context, ConnectionQuality quality) {
    Color color;
    int bars;
    
    switch (quality) {
      case ConnectionQuality.excellent:
        color = AppColors.accent;
        bars = 3;
        break;
      case ConnectionQuality.good:
        color = AppColors.accent;
        bars = 2;
        break;
      case ConnectionQuality.poor:
        color = AppColors.error;
        bars = 1;
        break;
      default:
        color = AppColors.textOnPrimary.withOpacity(0.24);
        bars = 0;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return Container(
          width: 2.5,
          height: 4.0 + index * 2.5,
          margin: const EdgeInsets.only(left: 1.5),
          decoration: BoxDecoration(
            color: index < bars ? color : AppColors.textOnPrimary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(1),
          ),
        );
      }),
    );
  }

  String _getInitials(String name) {
    final normalized = name.trim();
    if (normalized.isEmpty) return '?';
    final parts = normalized.split(RegExp(r'\s+')).where((e) => e.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) {
      final first = parts[0];
      if (first.isEmpty) return '?';
      return first[0].toUpperCase();
    }
    final first = parts.first;
    final last = parts.last;
    if (first.isEmpty || last.isEmpty) return '?';
    return '${first[0]}${last[0]}'.toUpperCase();
  }
}
