import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/chat_messages_provider.dart';
import 'chat_input.dart';
import 'chat_message_list.dart';

/// Chat Bottom Sheet with Public/Private tabs.
/// Chiều cao do parent [SizedBox] truyền vào (đã trừ vùng bàn phím ở menu Khác).
class ChatBottomSheet extends ConsumerWidget {
  const ChatBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatMessagesProvider);
    final keys = chatState.chatKeys;
    final divider = Theme.of(context).dividerColor.withValues(alpha: 0.35);
    final onSurface = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6);

    return Material(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      clipBehavior: Clip.antiAlias,
      child: DefaultTabController(
        length: keys.length < 2 ? 1 : keys.length,
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: divider,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.chat_bubble_outline,
                      size: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'In-call messages',
                    style: TextStyle(
                      fontSize: 15,
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
                labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                tabs: keys
                    .map((k) => Tab(
                          text: k == 'public' ? 'Public' : 'Private',
                        ))
                    .toList(),
              ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
              child: Text(
                'Messages can only be seen by people in the call and are deleted when the call ends.',
                style: TextStyle(
                  fontSize: 12,
                  color: onSurface,
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
