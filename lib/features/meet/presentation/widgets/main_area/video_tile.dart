import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/bottom_icons_provider.dart';
import '../../../providers/participant_provider.dart';
import '../../../providers/active_speakers_provider.dart';
import '../../../providers/room_settings_provider.dart';

/// Video Tile Widget
/// Displays a single participant's video with name and status indicators
/// 1:1 clone of apps/meet/src/components/media-elements/video/index.tsx
class VideoTile extends ConsumerWidget {
  final Participant? participant;
  final String userId;
  final String name;
  final bool isSmall;

  /// Web `PinWebcam`: hiện nút ghim khi có từ 2 người trở lên.
  final bool showPinButton;

  const VideoTile({
    super.key,
    required this.userId,
    required this.name,
    this.participant,
    this.isSmall = false,
    this.showPinButton = false,
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
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSpeaking
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.8)
              : Theme.of(context).colorScheme.outlineVariant,
          width: isSpeaking ? 3 : 1,
        ),
        boxShadow: isSpeaking
            ? [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
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
            _buildOverlay(context, ref, isRaisedHand, isSpeaking),

            // Đang nói: chấm pulse (LiveKit ActiveSpeakersChangedEvent).
            if (isSpeaking)
              Positioned(
                top: 12,
                right: 12,
                child: _SpeakingPulseDot(
                  color: Theme.of(context).colorScheme.primary,
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

    final hasVideo =
        videoPub != null &&
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
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
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

  Widget _buildOverlay(
    BuildContext context,
    WidgetRef ref,
    bool isRaisedHand,
    bool isSpeaking,
  ) {
    final isMicOn = _resolveMicOn(ref);
    final isPinned = ref.watch(
      roomSettingsProvider.select((s) => s.pinCamUserId == userId),
    );

    return Positioned(
      left: 10,
      right: 10,
      bottom: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: isSpeaking ? 0.52 : 0.4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSpeaking
                    ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.55)
                    : Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.1),
                width: isSpeaking ? 1.2 : 0.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isRaisedHand) ...[
                   Icon(
                    Icons.back_hand_rounded,
                    size: 14,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 6),
                ],
                Icon(
                  isMicOn ? Icons.mic_rounded : Icons.mic_off_rounded,
                  size: 14,
                  color: isMicOn
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.error,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onPrimary,
                      letterSpacing: 0.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (showPinButton) ...[
                  const SizedBox(width: 2),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        final notifier = ref.read(
                          roomSettingsProvider.notifier,
                        );
                        final cur = ref.read(roomSettingsProvider).pinCamUserId;
                        notifier.updatePinCamUserId(
                          cur == userId ? null : userId,
                        );
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                          size: 15,
                          color: isPinned
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.85),
                        ),
                      ),
                    ),
                  ),
                ],
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

  Widget _buildConnectionQuality(
    BuildContext context,
    ConnectionQuality quality,
  ) {
    Color color;
    int bars;

    switch (quality) {
      case ConnectionQuality.excellent:
        color = Theme.of(context).colorScheme.primary;
        bars = 3;
        break;
      case ConnectionQuality.good:
        color = Theme.of(context).colorScheme.primary;
        bars = 2;
        break;
      case ConnectionQuality.poor:
        color = Theme.of(context).colorScheme.error;
        bars = 1;
        break;
      default:
        color = Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.24);
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
            color: index < bars
                ? color
                : Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(1),
          ),
        );
      }),
    );
  }

  String _getInitials(String name) {
    final normalized = name.trim();
    if (normalized.isEmpty) return '?';
    final parts = normalized
        .split(RegExp(r'\s+'))
        .where((e) => e.isNotEmpty)
        .toList();
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

/// Chấm sáng pulse khi LiveKit báo participant đang nói.
class _SpeakingPulseDot extends StatefulWidget {
  final Color color;

  const _SpeakingPulseDot({required this.color});

  @override
  State<_SpeakingPulseDot> createState() => _SpeakingPulseDotState();
}

class _SpeakingPulseDotState extends State<_SpeakingPulseDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    )..repeat(reverse: true);
    _scale = Tween<double>(
      begin: 0.88,
      end: 1.12,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scale,
      builder: (context, child) {
        return Transform.scale(
          scale: _scale.value,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(0.65),
                  blurRadius: 10 * _scale.value,
                  spreadRadius: 1.5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
