import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/bottom_icons_provider.dart';
import 'mic_button.dart';

/// Camera Button Widget
/// Toggles camera on/off
/// 1:1 clone of apps/meet/src/components/footer/icons/webcam.tsx
class CameraButton extends ConsumerWidget {
  const CameraButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWebcamMuted = ref.watch(
      bottomIconsProvider.select((s) => s.isWebcamMuted),
    );

    return _ControlButton(
      icon: isWebcamMuted ? Icons.videocam_off : Icons.videocam,
      label: isWebcamMuted ? 'Start Video' : 'Stop Video',
      isActive: !isWebcamMuted,
      onTap: () {
        ref.read(bottomIconsProvider.notifier).toggleWebcam();
        // TODO: Integrate with LiveKit to actually start/stop video
      },
    );
  }
}
