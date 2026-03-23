import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/bottom_icons_provider.dart';
import '../polls/polls_bottom_sheet.dart';
import 'control_button.dart';

/// Polls icon button on footer (mobile).
class PollsButton extends ConsumerWidget {
  const PollsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeSidePanel = ref.watch(
      bottomIconsProvider.select((s) => s.activeSidePanel),
    );
    final unreadPolls = ref.watch(bottomIconsProvider.select((s) => s.unreadPolls));

    final isActive = activeSidePanel == 'POLLS';
    final badgeCount = isActive ? 0 : unreadPolls;

    return ControlButton(
      icon: Icons.poll,
      label: 'Polls',
      isActive: isActive,
      badgeCount: badgeCount,
      onTap: () async {
        ref.read(bottomIconsProvider.notifier).setActiveSidePanel('POLLS');
        ref.read(bottomIconsProvider.notifier).resetUnreadPolls();

        try {
          await showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              final mq = MediaQuery.of(context);
              // polls sheet không cần inset bàn phím, nhưng vẫn giữ logic chung.
              return SizedBox(
                height: (mq.size.height * 0.75).clamp(240.0, mq.size.height),
                child: const PollsBottomSheet(),
              );
            },
          );
        } finally {
          ref.read(bottomIconsProvider.notifier).setActiveSidePanel(null);
        }
      },
    );
  }
}

