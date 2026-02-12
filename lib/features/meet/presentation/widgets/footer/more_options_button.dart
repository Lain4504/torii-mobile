import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../chat/chat_bottom_sheet.dart';
import '../participants/participants_bottom_sheet.dart';
import '../settings/settings_bottom_sheet.dart';
import '../polls/polls_bottom_sheet.dart';
import '../../../providers/whiteboard_provider.dart';

/// More Options Button Widget
/// Shows menu with additional options (chat, participants, settings, etc.)
/// 1:1 clone of apps/meet/src/components/footer/icons/more.tsx
class MoreOptionsButton extends ConsumerWidget {
  const MoreOptionsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return InkWell(
      onTap: () => _showOptionsMenu(context, ref),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: isMobile ? 56 : 64,
        height: isMobile ? 56 : 64,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.more_vert,
              color: Colors.white70,
              size: isMobile ? 24 : 28,
            ),
            if (!isMobile) ...[
              const SizedBox(height: 4),
              const Text(
                'More',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white70,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showOptionsMenu(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMenuItem(
              context,
              icon: Icons.chat,
              title: 'Chat',
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const ChatBottomSheet(),
                );
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.people,
              title: 'Participants',
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const ParticipantsBottomSheet(),
                );
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.poll,
              title: 'Polls',
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const PollsBottomSheet(),
                );
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.draw,
              title: 'Whiteboard',
              onTap: () {
                Navigator.pop(context);
                ref.read(whiteboardProvider.notifier).setIsVisible(true);
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const SettingsBottomSheet(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title),
      onTap: onTap,
    );
  }
}
