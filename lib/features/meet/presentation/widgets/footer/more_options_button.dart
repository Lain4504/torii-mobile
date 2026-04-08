import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../participants/participants_bottom_sheet.dart';
import '../settings/settings_bottom_sheet.dart';
import '../translation/translation_bottom_sheet.dart';
import '../insights_ai/insights_ai_bottom_sheet.dart';
import '../waiting_room/waiting_room_bottom_sheet.dart';
import '../breakout_rooms/breakout_rooms_bottom_sheet.dart';
import 'control_button.dart';
import '../../../providers/whiteboard_provider.dart';
import '../../../providers/session_provider.dart';

/// More Options Button Widget
/// Shows menu with additional options (chat, participants, settings, etc.)
/// 1:1 clone of apps/meet/src/components/footer/icons/more.tsx
class MoreOptionsButton extends ConsumerWidget {
  const MoreOptionsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ControlButton(
      icon: Icons.more_horiz_rounded,
      label: 'Khác',
      isActive: false,
      onTap: () => _showOptionsMenu(context, ref),
    );
  }

  void _showOptionsMenu(BuildContext context, WidgetRef ref) {
    final isAdmin =
        ref.read(sessionProvider).currentUser?.metadata?.isAdmin ?? false;
    final breakoutAllowed = ref
            .read(sessionProvider)
            .currentRoom
            .metadata
            ?.roomFeatures
            ?.breakoutRoomFeatures
            ?.isAllow ==
        true;

    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
              icon: Icons.subtitles,
              title: 'Translation / Subtitles',
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const TranslationBottomSheet(),
                );
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.smart_toy,
              title: 'Insights AI',
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const InsightsAiBottomSheet(),
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
            if (isAdmin && breakoutAllowed)
              _buildMenuItem(
                context,
                icon: Icons.meeting_room_outlined,
                title: 'Breakout Rooms',
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      final mq = MediaQuery.of(context);
                      return SizedBox(
                        height:
                            (mq.size.height * 0.80).clamp(320.0, mq.size.height),
                        child: const BreakoutRoomsBottomSheet(),
                      );
                    },
                  );
                },
              ),
            if (isAdmin)
              _buildMenuItem(
                context,
                icon: Icons.person_add,
                title: 'Manage Waiting Room',
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const WaitingRoomBottomSheet(),
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
      dense: true,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -1),
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
    );
  }
}
