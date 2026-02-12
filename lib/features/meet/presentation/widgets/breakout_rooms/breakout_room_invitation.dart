import 'package:flutter/material.dart';

/// Breakout Room Invitation Dialog
/// Shows when invited to a breakout room
class BreakoutRoomInvitation extends StatelessWidget {
  final String roomName;
  final VoidCallback onJoin;
  final VoidCallback onDecline;

  const BreakoutRoomInvitation({
    super.key,
    required this.roomName,
    required this.onJoin,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Join Breakout Room'),
      content: Text('You have been invited to join $roomName'),
      actions: [
        TextButton(
          onPressed: onDecline,
          child: const Text('Later'),
        ),
        ElevatedButton(
          onPressed: onJoin,
          child: const Text('Join Now'),
        ),
      ],
    );
  }
}
