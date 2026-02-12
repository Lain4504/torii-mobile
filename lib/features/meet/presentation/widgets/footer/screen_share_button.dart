import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/bottom_icons_provider.dart';
import 'control_button.dart';

/// Screen Share Button Widget
/// Toggles screen sharing on/off
/// 1:1 clone of apps/meet/src/components/footer/icons/screenShare.tsx
class ScreenShareButton extends ConsumerWidget {
  const ScreenShareButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isScreenSharing = ref.watch(
      bottomIconsProvider.select((s) => s.isScreenSharing),
    );

    return ControlButton(
      icon: isScreenSharing ? Icons.stop_screen_share : Icons.screen_share,
      label: isScreenSharing ? 'Stop Share' : 'Share',
      isActive: isScreenSharing,
      activeColor: Colors.green,
      onTap: () {
        ref.read(bottomIconsProvider.notifier).toggleScreenShare();
        // TODO: Integrate with LiveKit to actually start/stop screen share
      },
    );
  }
}
