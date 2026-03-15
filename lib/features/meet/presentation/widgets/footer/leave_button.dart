import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
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
          color: AppColors.error.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.error,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.call_end,
              color: AppColors.error,
              size: 28,
            ),
            if (MediaQuery.of(context).size.width >= 768) ...[
              const SizedBox(height: 4),
              const Text(
                'Leave',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.error,
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
      builder: (dialogContext) => AlertDialog(
        title: const Text('Leave Meeting?'),
        content: const Text('Are you sure you want to leave this meeting?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _leaveMeeting(context, ref);
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Leave'),
          ),
        ],
      ),
    );
  }

  Future<void> _leaveMeeting(BuildContext context, WidgetRef ref) async {
    // Disconnect from LiveKit and NATS
    await ref.read(sessionProvider.notifier).disconnect();
    
    // Reset to startup state
    ref.read(sessionProvider.notifier).toggleStartup(true);
    
    if (context.mounted) {
      // Navigate back to landing/join screen
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }
}
