import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/header/meeting_header.dart';
import '../../widgets/main_area/video_grid.dart';
import '../../widgets/footer/control_bar.dart';
import '../../widgets/whiteboard/whiteboard_widget.dart';

/// Meeting Room Screen
/// 1:1 clone of apps/meet/src/components/app/index.tsx (main meeting view)
class MeetingRoomScreen extends ConsumerWidget {
  const MeetingRoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header
                const MeetingHeader(),
                
                // Main video area
                const Expanded(
                  child: VideoGrid(),
                ),
                
                // Control bar
                const ControlBar(),
              ],
            ),
            
            // Whiteboard overlay
            const Positioned.fill(
              child: WhiteboardWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
