import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mic_button.dart';
import 'camera_button.dart';
import 'screen_share_button.dart';
import 'raise_hand_button.dart';
import 'leave_button.dart';
import 'more_options_button.dart';
import 'chat_button.dart';
import 'polls_button.dart';

/// Control Bar Widget
/// Shows mic, camera, screen share, leave, and more options buttons
class ControlBar extends ConsumerWidget {
  const ControlBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final gap = isMobile ? 5.0 : 12.0;

    return SafeArea(
      top: false,
      child: SizedBox(
        height: isMobile ? 64 : 78,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MicButton(),
            SizedBox(width: gap),
            const CameraButton(),
            SizedBox(width: gap),
            if (!isMobile) ...[
              const ScreenShareButton(),
              SizedBox(width: gap),
            ],
            const RaiseHandButton(),
            SizedBox(width: gap),
            const ChatButton(),
            SizedBox(width: gap),
            const PollsButton(),
            SizedBox(width: gap),
            const MoreOptionsButton(),
            SizedBox(width: gap),
            const LeaveButton(),
          ],
        ),
      ),
    );
  }
}
