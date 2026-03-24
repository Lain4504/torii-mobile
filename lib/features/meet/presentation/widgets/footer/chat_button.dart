import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/bottom_icons_provider.dart';
import '../chat/chat_bottom_sheet.dart';
import 'control_button.dart';

/// Chat icon button on footer (mobile).
class ChatButton extends ConsumerWidget {
  const ChatButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeSidePanel = ref.watch(
      bottomIconsProvider.select((s) => s.activeSidePanel),
    );
    final totalUnreadChatMsgs = ref.watch(
      bottomIconsProvider.select((s) => s.totalUnreadChatMsgs),
    );

    final isActive = activeSidePanel == 'CHAT';
    final badgeCount = isActive ? 0 : totalUnreadChatMsgs;

    return ControlButton(
      icon: Icons.chat_bubble_outline,
      label: 'Chat',
      isActive: isActive,
      badgeCount: badgeCount,
      onTap: () async {
        // Mark as read + stop unread counting while sheet is open.
        ref.read(bottomIconsProvider.notifier).setActiveSidePanel('CHAT');
        ref.read(bottomIconsProvider.notifier).resetTotalUnreadChatMsgs();

        try {
          // Close sheet -> disable "active chat panel".
          await showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (ctx) {
              final mq = MediaQuery.of(ctx);
              final kb = mq.viewInsets.bottom;
              final visibleH = mq.size.height - kb;
              final sheetH = (visibleH * 0.78).clamp(240.0, mq.size.height);
              return Padding(
                padding: EdgeInsets.only(bottom: kb),
                child: SizedBox(
                  height: sheetH,
                  child: const ChatBottomSheet(),
                ),
              );
            },
          );
        } finally {
          // Luôn clear dù sheet đóng bằng cách nào.
          ref.read(bottomIconsProvider.notifier).setActiveSidePanel(null);
        }
      },
    );
  }
}

