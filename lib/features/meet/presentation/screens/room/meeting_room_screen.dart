import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/breakout_room_provider.dart';
import '../../../providers/session_provider.dart';
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
    // Listen for breakout room invitations
    ref.listen(breakoutRoomProvider, (previous, next) {
      if (next.receivedInvitationFor != null && 
          next.receivedInvitationFor != previous?.receivedInvitationFor) {
        _showBreakoutInvitation(context, ref, next.receivedInvitationFor!);
      }
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header
                const MeetingHeader(),
                
                // Main area: external media/link (when active) or video grid
                const Expanded(
                  child: _MainAreaContent(),
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

  void _showBreakoutInvitation(BuildContext context, WidgetRef ref, String roomId) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
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
        // Optional: trigger reconnection with res.token (would require meet controller to support it)
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
      return const ExternalContentView();
    }
    return const VideoGrid();
  }
}
