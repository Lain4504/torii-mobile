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
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A).withOpacity(0.95),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.1))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Mic Toggle
            _ControlButton(
              icon: (state.localMetadata?.lockSettings.lockMicrophone ?? false) && !(state.localUser?.isAdmin ?? false)
                  ? Icons.mic_off
                  : (state.isMicEnabled ? Icons.mic : Icons.mic_off),
              color: (state.localMetadata?.lockSettings.lockMicrophone ?? false) && !(state.localUser?.isAdmin ?? false)
                  ? Colors.grey
                  : (state.isMicEnabled ? Colors.greenAccent : Colors.redAccent),
              onPressed: () => notifier.toggleMic(),
              label: 'Mic',
            ),
            // Cam Toggle
            _ControlButton(
              icon: (state.localMetadata?.lockSettings.lockWebcam ?? false) && !(state.localUser?.isAdmin ?? false)
                  ? Icons.videocam_off
                  : (state.isCamEnabled ? Icons.videocam : Icons.videocam_off),
              color: (state.localMetadata?.lockSettings.lockWebcam ?? false) && !(state.localUser?.isAdmin ?? false)
                  ? Colors.grey
                  : (state.isCamEnabled ? Colors.blueAccent : Colors.redAccent),
              onPressed: () => notifier.toggleCam(),
              label: 'Cam',
            ),
            // Hand Raise
            _ControlButton(
              icon: state.localMetadata?.raisedHand ?? false ? Icons.back_hand : Icons.back_hand_outlined,
              color: state.localMetadata?.raisedHand ?? false ? Colors.yellowAccent : Colors.white70,
              onPressed: () => notifier.toggleHandRaise(),
              label: 'Hand',
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
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
              border: Border.all(color: color.withOpacity(0.4), width: 1.5),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
