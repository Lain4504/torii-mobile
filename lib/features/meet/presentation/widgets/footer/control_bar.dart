import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/bottom_icons_provider.dart';
import '../../../providers/session_provider.dart';
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

    return Container(
      height: isMobile ? 72 : 80,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 8 : 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Mic button
          const MicButton(),
          SizedBox(width: isMobile ? 8 : 12),
          
          // Camera button
          const CameraButton(),
          SizedBox(width: isMobile ? 8 : 12),
          
          // Screen share button (desktop only)
          if (!isMobile) ...[
            const ScreenShareButton(),
            const SizedBox(width: 12),
          ],

          // Raise hand
          const RaiseHandButton(),
          SizedBox(width: isMobile ? 8 : 12),

          // Leave button
          const LeaveButton(),
          SizedBox(width: isMobile ? 8 : 12),
          
          // More options button
          const MoreOptionsButton(),
        ],
      ),
    );
  }
}
