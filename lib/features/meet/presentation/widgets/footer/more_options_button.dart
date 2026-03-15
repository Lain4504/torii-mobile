import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../chat/chat_bottom_sheet.dart';
import '../participants/participants_bottom_sheet.dart';
import '../settings/settings_bottom_sheet.dart';
import '../polls/polls_bottom_sheet.dart';
import '../translation/translation_bottom_sheet.dart';
import '../insights_ai/insights_ai_bottom_sheet.dart';
import '../waiting_room/waiting_room_bottom_sheet.dart';
import '../../../providers/whiteboard_provider.dart';
import '../../../providers/session_provider.dart';

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
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.textPrimaryDark.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.more_vert,
              color: AppColors.textPrimaryDark,
              size: isMobile ? 24 : 28,
            ),
            if (!isMobile) ...[
              const SizedBox(height: 4),
              const Text(
                'More',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.textPrimaryDark,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showOptionsMenu(BuildContext context, WidgetRef ref) {
    final isAdmin =
        ref.read(sessionProvider).currentUser?.metadata?.isAdmin ?? false;

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
      leading: Icon(icon, color: AppColors.textPrimaryDark),
      title: Text(title),
      onTap: onTap,
    );
  }
}
