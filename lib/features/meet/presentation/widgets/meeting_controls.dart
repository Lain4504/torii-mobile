import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/presentation/providers/meet_provider.dart';
import 'package:torii_app/features/meet/presentation/widgets/chat_bottom_sheet.dart';
import 'package:torii_app/features/meet/presentation/widgets/polls_bottom_sheet.dart';
import 'package:torii_app/features/meet/presentation/widgets/participants_bottom_sheet.dart';

class MeetingControls extends ConsumerWidget {
  const MeetingControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(meetControllerProvider);
    final notifier = ref.read(meetControllerProvider.notifier);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A).withValues(alpha: 0.95),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
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
            // Chat
            _ControlButton(
              icon: Icons.chat_bubble_outline,
              color: Colors.white70,
              onPressed: () => _showChat(context),
              label: 'Chat',
            ),
            // Participants
            _ControlButton(
              icon: Icons.people_alt_outlined,
              color: Colors.white70,
              onPressed: () => _showParticipants(context),
              label: 'Mọi người',
            ),
            // More Menu
            PopupMenuButton<String>(
              offset: const Offset(0, -180),
              color: const Color(0xFF2E2E3E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              icon: _ControlButtonIcon(
                icon: Icons.more_horiz,
                color: Colors.white70,
                label: 'Thêm',
              ),
              onSelected: (value) {
                switch (value) {
                  case 'hand':
                    notifier.toggleHandRaise();
                    break;
                  case 'speaker':
                    notifier.toggleSpeakerphone();
                    break;
                  case 'polls':
                    _showPolls(context);
                    break;
                  case 'leave':
                    _confirmLeave(context, notifier);
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'hand',
                  child: Row(
                    children: [
                      Icon(
                        state.localMetadata?.raisedHand ?? false ? Icons.back_hand : Icons.back_hand_outlined,
                        color: state.localMetadata?.raisedHand ?? false ? Colors.yellowAccent : Colors.white70,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        state.localMetadata?.raisedHand ?? false ? 'Hạ tay' : 'Giơ tay',
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'speaker',
                  child: Row(
                    children: [
                      Icon(
                        state.isSpeakerphoneOn ? Icons.volume_up : Icons.phone_android,
                        color: Colors.white70,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        state.isSpeakerphoneOn ? 'Loa ngoài: Bật' : 'Loa ngoài: Tắt',
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'polls',
                  child: Row(
                    children: [
                      Icon(Icons.poll_outlined, color: Colors.white70, size: 20),
                      const SizedBox(width: 12),
                      Text('Bình chọn', style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ),
                const PopupMenuDivider(height: 1),
                PopupMenuItem(
                  value: 'leave',
                  child: Row(
                    children: [
                      const Icon(Icons.call_end, color: Colors.redAccent, size: 20),
                      const SizedBox(width: 12),
                      const Text('Rời cuộc họp', style: TextStyle(color: Colors.redAccent, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showChat(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ChatBottomSheet(),
    );
  }

  void _showPolls(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const PollsBottomSheet(),
    );
  }

  void _showParticipants(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ParticipantsBottomSheet(),
    );
  }

  void _confirmLeave(BuildContext context, MeetNotifier notifier) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rời cuộc họp'),
        content: const Text('Bạn có chắc chắn muốn rời cuộc họp không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () {
              notifier.leaveMeeting();
              Navigator.pop(context);
            },
            child: const Text('Rời'),
          ),
        ],
      ),
    );
  }
}

class _ControlButtonIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _ControlButtonIcon({
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            shape: BoxShape.circle,
            border: Border.all(color: color.withValues(alpha: 0.4), width: 1.5),
          ),
          child: Icon(icon, color: color, size: 24),
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
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              border: Border.all(color: color.withValues(alpha: 0.4), width: 1.5),
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
