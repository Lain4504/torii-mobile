import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
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

    void onPinTap() {
      final notifier = ref.read(roomSettingsProvider.notifier);
      final cur = ref.read(roomSettingsProvider).pinCamUserId;
      notifier.updatePinCamUserId(cur == userId ? null : userId);
    }

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: LayoutBuilder(
        builder: (context, c) {
          final maxW = c.maxWidth;
          // Tile nhỏ (strip ghim): padding trái/phải đối xứng, action nhỏ hơn — tránh lệch lề.
          final narrow = isSmall || maxW < 220;
          final needsTwoLines = isSmall || maxW < 208;
          final hPad = narrow ? 4.0 : 8.0;
          final bottomPad = narrow ? 3.0 : 6.0;
          final topPad = narrow ? 10.0 : 18.0;
          final actionSize = narrow ? 30.0 : 40.0;
          final statusIconSize = narrow ? 14.0 : 17.0;
          final pinIconSize = narrow ? 15.0 : 20.0;

          final nameStyle = TextStyle(
            fontSize: narrow ? 11 : 12,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 0.15,
            height: 1.15,
            shadows: const [
              Shadow(blurRadius: 6, color: Colors.black54, offset: Offset(0, 1)),
              Shadow(blurRadius: 2, color: Colors.black87, offset: Offset(0, 0)),
            ],
          );

          Widget micHandRow() {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isMicOn ? Icons.mic_rounded : Icons.mic_off_rounded,
                  size: statusIconSize,
                  color: isMicOn
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.error,
                ),
                if (isRaisedHand) ...[
                  SizedBox(width: narrow ? 3 : 6),
                  Icon(
                    Icons.back_hand_rounded,
                    size: statusIconSize,
                    color: Colors.amber.shade200,
                  ),
                ],
              ],
            );
          }

          Widget pinButton() {
            if (!showPinButton) return const SizedBox.shrink();
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPinTap,
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: actionSize,
                  height: actionSize,
                  child: Icon(
                    isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                    size: pinIconSize,
                    color: isPinned
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white,
                  ),
                ),
              ),
            );
          }

          Widget qualityCell() {
            return SizedBox(
              width: actionSize,
              height: actionSize,
              child: Center(
                child: _buildConnectionQuality(
                  context,
                  participant?.connectionQuality ?? ConnectionQuality.unknown,
                  compact: narrow,
                ),
              ),
            );
          }

          return ClipRRect(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(19)),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: isSpeaking ? 0.62 : 0.5),
                    Colors.black.withValues(alpha: 0.0),
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(hPad, topPad, hPad, bottomPad),
                child: needsTwoLines
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              micHandRow(),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  pinButton(),
                                  qualityCell(),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            name,
                            style: nameStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          micHandRow(),
                          SizedBox(width: narrow ? 6 : 8),
                          Expanded(
                            child: Text(
                              name,
                              style: nameStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          pinButton(),
                          qualityCell(),
                        ],
                      ),
              ),
            ),
          );
        },
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
    ConnectionQuality quality, {
    required bool compact,
  }) {
    Color color;
    int bars;

    switch (quality) {
      case ConnectionQuality.excellent:
        color = Colors.greenAccent.shade200;
        bars = 3;
        break;
      case ConnectionQuality.good:
        color = Colors.lightGreenAccent.shade200;
        bars = 2;
        break;
      case ConnectionQuality.poor:
        color = Theme.of(context).colorScheme.error;
        bars = 1;
        break;
      default:
        color = Colors.white.withValues(alpha: 0.35);
        bars = 0;
    }

    final barW = compact ? 3.0 : 4.0;
    final baseH = compact ? 5.0 : 7.0;
    final step = compact ? 3.5 : 5.0;
    final dim = Colors.white.withValues(alpha: 0.22);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(3, (index) {
        return Container(
          width: barW,
          height: baseH + index * step,
          margin: EdgeInsets.only(left: index == 0 ? 0 : 2.5),
          decoration: BoxDecoration(
            color: index < bars ? color : dim,
            borderRadius: BorderRadius.circular(1.5),
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
