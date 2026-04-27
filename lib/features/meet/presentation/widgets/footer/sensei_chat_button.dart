import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../sensei/sensei_chat_sheet.dart';
import '../../../../sensei/providers/sensei_meet_chat_provider.dart';

class SenseiChatButton extends ConsumerWidget {
  const SenseiChatButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    return IconButton(
      onPressed: () {
        ref.read(senseiMeetChatProvider.notifier).reset();
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const SenseiChatSheet(),
        );
      },
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.auto_awesome,
          color: theme.colorScheme.primary,
          size: 24,
        ),
      ),
      tooltip: 'AI Sensei',
    );
  }
}
