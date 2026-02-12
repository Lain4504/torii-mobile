import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/chat_messages_provider.dart';
import '../../../providers/session_provider.dart';

/// Chat Input Widget
/// Text field for sending chat messages
class ChatInput extends ConsumerStatefulWidget {
  const ChatInput({super.key});

  @override
  ConsumerState<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends ConsumerState<ChatInput> {
  final TextEditingController _controller = TextEditingController();
  bool _canSend = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final canSend = _controller.text.trim().isNotEmpty;
    if (canSend != _canSend) {
      setState(() {
        _canSend = canSend;
      });
    }
  }

  void _sendMessage() {
    if (!_canSend) return;

    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final currentUser = ref.read(sessionProvider).currentUser;
    if (currentUser == null) return;

    // Send message via provider
    // In a real implementation, this would call ConnectNats.sendDataMessage
    // For now, we simulate adding it to the local state (provider) or assuming provider handles logic
    // But typically the provider tracks received messages. Sending logic is usually in NATS layer.
    // However, the provider has addChatMessage.
    
    // We'll mimic the NATS behavior by dispatching to NATS service eventually.
    // Since we don't have direct access to ConnectNats instance here easily without injection,
    // we'll optimistically update the UI or use a method that triggers NATS.
    
    // For this Phase, simple local add is mostly for demo, but we should clear input.
    _controller.clear();
    
    // TODO: Connect to actual NATS sending logic. 
    // Right now, we depend on the underlying system. 
    // Usually we would use: ref.read(natsServiceProvider).sendChatMessage(...)
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: 24, // Safety padding for bottom area
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Send a message...',
                hintStyle: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                isDense: true,
              ),
              textCapitalization: TextCapitalization.sentences,
              maxLines: 3,
              minLines: 1,
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filled(
            onPressed: _canSend ? _sendMessage : null,
            icon: const Icon(Icons.send_rounded),
            color: Theme.of(context).colorScheme.primary,
            style: IconButton.styleFrom(
              backgroundColor: _canSend 
                ? Theme.of(context).colorScheme.primary 
                : Theme.of(context).disabledColor.withOpacity(0.1),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
