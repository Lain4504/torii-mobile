import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/chat_messages_provider.dart';
import 'chat_input.dart';
import 'chat_message_list.dart';

/// Chat Bottom Sheet
/// Displays chat messages and input in a bottom sheet
/// 1:1 clone of apps/meet/src/components/chat/index.tsx
class ChatBottomSheet extends ConsumerWidget {
  const ChatBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          // Header
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
          
          // Notice
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
          
          // Message List
          const Expanded(
            child: ChatMessageList(),
          ),
          
          // Input
          const ChatInput(),
        ],
      ),
    );
  }
}
