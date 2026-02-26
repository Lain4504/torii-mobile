import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/chat_messages_provider.dart';
import '../../../providers/session_provider.dart';
import 'chat_message_item.dart';

/// Chat Message List Widget
/// Displays list of chat messages for a given chat key (public or private)
class ChatMessageList extends ConsumerStatefulWidget {
  final String chatKey;

  const ChatMessageList({super.key, this.chatKey = 'public'});

  @override
  ConsumerState<ChatMessageList> createState() => _ChatMessageListState();
}

class _ChatMessageListState extends ConsumerState<ChatMessageList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatMessagesProvider);
    final messages = chatState.messagesByKey(widget.chatKey);
    final currentUser = ref.watch(sessionProvider.select((s) => s.currentUser));
    
    // Auto-scroll to bottom when new messages arrive
    // Note: In production, consider using a reverse list or smarter scrolling logic
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    if (messages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 48,
              color: Theme.of(context).disabledColor.withOpacity(0.2),
            ),
            const SizedBox(height: 16),
            Text(
              'No messages yet',
              style: TextStyle(
                color: Theme.of(context).disabledColor,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final isMe = message.senderId == currentUser?.userId;
        
        // Check if previous message was from same sender
        final isSequence = index > 0 && messages[index - 1].senderId == message.senderId;

        return Padding(
          padding: EdgeInsets.only(top: isSequence ? 4 : 16),
          child: ChatMessageItem(
            message: message,
            isMe: isMe,
            showAvatar: !isSequence || !isMe,
          ),
        );
      },
    );
  }
}
