import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/chat_messages_provider.dart';
import 'chat_input.dart';
import 'chat_message_list.dart';

/// Chat Bottom Sheet with Public/Private tabs
/// 1:1 clone of apps/meet/src/components/chat/index.tsx
class ChatBottomSheet extends ConsumerWidget {
  const ChatBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatMessagesProvider);
    final keys = chatState.chatKeys;

    return DefaultTabController(
      length: keys.length < 2 ? 1 : keys.length,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor.withOpacity(0.1),
                  ),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.chat_bubble_outline, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'In-call messages',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),
            if (keys.length > 1)
              TabBar(
                tabs: keys
                    .map((k) => Tab(
                          text: k == 'public' ? 'Public' : 'Private',
                        ))
                    .toList(),
              ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
              child: Text(
                'Messages can only be seen by people in the call and are deleted when the call ends.',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: keys.length > 1
                  ? TabBarView(
                      children: keys
                          .map((k) => ChatMessageList(chatKey: k))
                          .toList(),
                    )
                  : const ChatMessageList(chatKey: 'public'),
            ),
            const ChatInput(),
          ],
        ),
      ),
    );
  }
}
