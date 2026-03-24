import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/breakout_room_provider.dart';
import '../../../providers/session_provider.dart';
import '../../../providers/whiteboard_provider.dart';
import '../../../data/datasources/meet_api_service.dart';
import '../../widgets/header/meeting_header.dart';
import '../../widgets/main_area/video_grid.dart';
import '../../widgets/main_area/external_content_view.dart';
import '../../widgets/footer/control_bar.dart';
import '../../widgets/whiteboard/whiteboard_widget.dart';

/// Meeting Room Screen
/// 1:1 clone of apps/meet/src/components/app/index.tsx (main meeting view)
class MeetingRoomScreen extends ConsumerWidget {
  const MeetingRoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // Listen for breakout room invitations
    ref.listen(breakoutRoomProvider, (previous, next) {
      if (next.receivedInvitationFor != null && 
          next.receivedInvitationFor != previous?.receivedInvitationFor) {
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
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('Breakout Room Invitation'),
        content: Text('You have been invited to join breakout room $roomId'),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(breakoutRoomProvider.notifier).clearInvitation();
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Decline'),
          ),
          ElevatedButton(
            onPressed: () => _joinBreakoutRoom(context, ref, dialogContext, roomId),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Join'),
          ),
        ],
      ),
    );
  }

  Future<void> _joinBreakoutRoom(
    BuildContext context,
    WidgetRef ref,
    BuildContext dialogContext,
    String breakoutRoomId,
  ) async {
    final session = ref.read(sessionProvider);
    final userId = session.currentUser?.userId;
    if (userId == null || userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot join: user not found')),
      );
      return;
    }

    ref.read(breakoutRoomProvider.notifier).clearInvitation();
    Navigator.of(dialogContext).pop();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Joining breakout room...')),
    );

    try {
      final api = ref.read(meetApiServiceProvider);
      final res = await api.joinBreakoutRoom(
        breakoutRoomId: breakoutRoomId,
        userId: userId,
        roomId: session.currentRoom.roomId.isNotEmpty ? session.currentRoom.roomId : null,
      );

      if (!context.mounted) return;
      if (res.status && res.token.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Joined breakout room. Reconnect with the new link to enter.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(res.msg.isNotEmpty ? res.msg : 'Failed to join breakout room')),
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
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
