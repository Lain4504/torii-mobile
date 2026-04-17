import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/breakout_room_provider.dart';
import '../../../providers/session_provider.dart';
import '../../../providers/whiteboard_provider.dart';
import '../../widgets/header/meeting_header.dart';
import '../../widgets/main_area/video_grid.dart';
import '../../widgets/main_area/external_content_view.dart';
import '../../widgets/footer/control_bar.dart';
import '../../widgets/whiteboard/whiteboard_widget.dart';
import '../../widgets/breakout_rooms/breakout_room_invitation.dart';
import '../../../core/breakout/breakout_room_switcher.dart';

/// Meeting Room Screen
/// 1:1 clone of apps/meet/src/components/app/index.tsx (main meeting view)
class MeetingRoomScreen extends ConsumerStatefulWidget {
  const MeetingRoomScreen({super.key});

  @override
  ConsumerState<MeetingRoomScreen> createState() => _MeetingRoomScreenState();
}

class _MeetingRoomScreenState extends ConsumerState<MeetingRoomScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(sessionProvider.notifier).reconnectAfterResume();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ref.listen(breakoutRoomProvider, (previous, next) {
      if (next.receivedInvitationFor != null &&
          (previous == null || next.invitationSeq != previous.invitationSeq)) {
        _showBreakoutInvitation(context, ref, next.receivedInvitationFor!);
      }
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: const [
                // Header
                MeetingHeader(),
                
                // Main area: external media/link (when active) or video grid
                Expanded(
                  child: _MainAreaContent(),
                ),
                
                // Footer controls integrated into layout
                ControlBar(),
              ],
            ),
            
            // Whiteboard overlay
            const _WhiteboardOverlay(),
          ],
        ),
      ),
    );
  }

  void _showBreakoutInvitation(BuildContext context, WidgetRef ref, String roomId) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => BreakoutRoomInvitation(
        roomName: roomId,
        onDecline: () {
          ref.read(breakoutRoomProvider.notifier).clearInvitation();
          Navigator.of(dialogContext).pop();
        },
        onJoin: () async {
          ref.read(breakoutRoomProvider.notifier).clearInvitation();
          Navigator.of(dialogContext).pop();
          await joinAndSwitchToBreakoutRoom(
            context: context,
            ref: ref,
            breakoutRoomId: roomId,
            isAdmin: ref.read(sessionProvider).currentUser?.metadata?.isAdmin ?? false,
          );
        },
      ),
    );
  }
}

/// Chooses between external media/link view and video grid based on room metadata.
class _MainAreaContent extends ConsumerWidget {
  const _MainAreaContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final room = ref.watch(sessionProvider.select((s) => s.currentRoom));
    final ext = room.metadata?.roomFeatures?.externalMediaPlayerFeatures;
    final link = room.metadata?.roomFeatures?.displayExternalLinkFeatures;
    final showExternal = (ext != null && ext.isActive && ext.url.isNotEmpty) ||
        (link != null && link.isActive && link.link.isNotEmpty);
    if (showExternal) {
      return const Padding(
        padding: EdgeInsets.fromLTRB(12, 8, 12, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: ExternalContentView(),
        ),
      );
    }
    return const Padding(
      padding: EdgeInsets.fromLTRB(8, 6, 8, 8),
      child: VideoGrid(),
    );
  }
}

/// Whiteboard overlay with visibility check
class _WhiteboardOverlay extends ConsumerWidget {
  const _WhiteboardOverlay();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isWhiteboardVisible = ref.watch(
      whiteboardProvider.select((s) => s.isVisible),
    );

    if (!isWhiteboardVisible) {
      return const SizedBox.shrink();
    }

    return Positioned.fill(
      child: Container(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
        child: const WhiteboardWidget(),
      ),
    );
  }
}
