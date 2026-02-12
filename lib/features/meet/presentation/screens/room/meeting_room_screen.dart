import '../../../../providers/breakout_room_provider.dart';

// ... existing imports ...

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

  void _showBreakoutInvitation(BuildContext context, WidgetRef ref, String roomId) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Breakout Room Invitation'),
        content: Text('You have been invited to join breakout room $roomId'),
        actions: [
          TextButton(
            onPressed: () {
              // Decline
              ref.read(breakoutRoomProvider.notifier).clearInvitation();
              Navigator.of(context).pop();
            },
            child: const Text('Decline'),
          ),
          ElevatedButton(
            onPressed: () {
              // Accept
              ref.read(breakoutRoomProvider.notifier).clearInvitation();
              Navigator.of(context).pop();
              // TODO: Implement join logic
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Joining breakout room...')),
              );
            },
            child: const Text('Join'),
          ),
        ],
      ),
    );
  }
}
