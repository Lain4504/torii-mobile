import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/presentation/providers/meet_provider.dart';

class MeetingControls extends ConsumerWidget {
  const MeetingControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(meetControllerProvider);
    final notifier = ref.read(meetControllerProvider.notifier);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: Colors.grey[900],
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Mic Toggle
            _ControlButton(
              icon: state.isMicEnabled ? Icons.mic : Icons.mic_off,
              color: state.isMicEnabled ? Colors.green : Colors.red,
              onPressed: () => notifier.toggleMic(),
              label: 'Mic',
            ),
            // Cam Toggle
            _ControlButton(
              icon: state.isCamEnabled ? Icons.videocam : Icons.videocam_off,
              color: state.isCamEnabled ? Colors.blue : Colors.red,
              onPressed: () => notifier.toggleCam(),
              label: 'Cam',
            ),
            // Screen Share Toggle
            _ControlButton(
              icon: state.isScreenSharingEnabled ? Icons.stop_screen_share : Icons.screen_share,
              color: state.isScreenSharingEnabled ? Colors.orange : Colors.grey,
              onPressed: () => notifier.toggleScreenShare(),
              label: 'Share',
            ),
            // Speaker Toggle
            _ControlButton(
              icon: state.isSpeakerphoneOn ? Icons.volume_up : Icons.phone_android,
              color: state.isSpeakerphoneOn ? Colors.purple : Colors.grey,
              onPressed: () => notifier.toggleSpeakerphone(),
              label: 'Speaker',
            ),
            // Leave Button
            _ControlButton(
              icon: Icons.call_end,
              color: Colors.red,
              onPressed: () => _confirmLeave(context, notifier),
              label: 'Leave',
            ),
          ],
        ),
      ),
    );
  }

  void _confirmLeave(BuildContext context, MeetNotifier notifier) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Leave Meeting'),
        content: const Text('Are you sure you want to leave the meeting?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () {
              notifier.leaveMeeting();
              Navigator.pop(context);
            },
            child: const Text('Leave'),
          ),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final String label;

  const _ControlButton({
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 2),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
      ],
    );
  }
}
