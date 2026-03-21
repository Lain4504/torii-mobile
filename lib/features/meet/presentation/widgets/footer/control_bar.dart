import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mic_button.dart';
import 'camera_button.dart';
import 'screen_share_button.dart';
import 'raise_hand_button.dart';
import 'leave_button.dart';
import 'more_options_button.dart';

/// Control Bar Widget
/// Shows mic, camera, screen share, leave, and more options buttons
/// 1:1 clone of apps/meet/src/components/footer/index.tsx
class ControlBar extends ConsumerWidget {
  const ControlBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return SafeArea(
      top: false,
      child: SizedBox(
        height: isMobile ? 64 : 78,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MicButton(),
            SizedBox(width: isMobile ? 7 : 12),
            const CameraButton(),
            SizedBox(width: isMobile ? 7 : 12),
            if (!isMobile) ...[
              const ScreenShareButton(),
              const SizedBox(width: 12),
            ],
            const RaiseHandButton(),
            SizedBox(width: isMobile ? 7 : 12),
            const MoreOptionsButton(),
            SizedBox(width: isMobile ? 7 : 12),
            const LeaveButton(),
          ],
        ),
      ),
    );
  }
}
