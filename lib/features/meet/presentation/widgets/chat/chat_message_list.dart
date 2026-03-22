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
  /// -1 = chưa đồng bộ lần đầu (để cuộn khi mở sheet đã có tin).
  int _lastMessageCount = -1;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom({bool animated = true}) {
    if (!_scrollController.hasClients) return;
    final max = _scrollController.position.maxScrollExtent;
    if (animated) {
      _scrollController.animateTo(
        max,
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
      );
    } else {
      _scrollController.jumpTo(max);
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatMessagesProvider);
    final messages = chatState.messagesByKey(widget.chatKey);
    final currentUser = ref.watch(sessionProvider.select((s) => s.currentUser));

    final n = messages.length;
    if (n != _lastMessageCount) {
      _lastMessageCount = n;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _scrollToBottom(animated: n > 1);
      });
    }

    if (messages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 48,
              color: Theme.of(context).disabledColor.withValues(alpha: 0.2),
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
