import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/session_provider.dart';

/// Leave Button Widget
/// Leaves the meeting
/// 1:1 clone of apps/meet/src/components/footer/icons/leave.tsx
class LeaveButton extends ConsumerWidget {
  const LeaveButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => _showLeaveDialog(context, ref),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: MediaQuery.of(context).size.width < 768 ? 56 : 64,
        height: MediaQuery.of(context).size.width < 768 ? 56 : 64,
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.red,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.call_end,
              color: Colors.red,
              size: 28,
            ),
            if (MediaQuery.of(context).size.width >= 768) ...[
              const SizedBox(height: 4),
              const Text(
                'Leave',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.red,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showLeaveDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Leave Meeting?'),
        content: const Text('Are you sure you want to leave this meeting?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _leaveMeeting(ref);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Leave'),
          ),
        ],
      ),
    );
  }

  void _leaveMeeting(WidgetRef ref) {
    // Reset to startup state
    ref.read(sessionProvider.notifier).toggleStartup(true);
    
    // TODO: Disconnect from LiveKit and NATS
    // This will be implemented when integrating with LiveKit/NATS
  }
}
