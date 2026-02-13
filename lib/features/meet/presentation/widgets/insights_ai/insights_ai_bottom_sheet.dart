import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/insights_ai_text_chat_provider.dart';
import '../../../data/datasources/meet_api_service.dart';

/// Insights AI Text Chat Bottom Sheet
/// Shows AI chat messages (user + model stream)
/// 1:1 clone of apps/meet insights-ai panel for mobile
class InsightsAiBottomSheet extends ConsumerStatefulWidget {
  const InsightsAiBottomSheet({super.key});

  @override
  ConsumerState<InsightsAiBottomSheet> createState() => _InsightsAiBottomSheetState();
}

class _InsightsAiBottomSheetState extends ConsumerState<InsightsAiBottomSheet> {
  final _inputController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(insightsAiTextChatProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: state.finalMessages.length +
                  (state.interimMessage != null ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < state.finalMessages.length) {
                  return _buildMessageItem(
                    context,
                    state.finalMessages[index],
                  );
                }
                return _buildMessageItem(
                  context,
                  state.interimMessage!,
                  isInterim: true,
                );
              },
            ),
          ),
          if (state.isAwaitingResponse)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'AI is thinking...',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          _buildInput(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
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
          Icon(Icons.smart_toy, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          const Text(
            'Insights AI',
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
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(
    BuildContext context,
    InsightsAITextChatMessage message, {
    bool isInterim = false,
  }) {
    final isUser = message.role == 'user';
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            CircleAvatar(
              radius: 14,
              backgroundColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.3),
              child: const Icon(Icons.smart_toy, size: 16),
            ),
          if (!isUser) const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isUser
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                    : Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                message.parts.join(),
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: isInterim ? FontStyle.italic : null,
                ),
              ),
            ),
          ),
          if (isUser) const SizedBox(width: 8),
          if (isUser)
            CircleAvatar(
              radius: 14,
              backgroundColor:
                  Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              child: const Icon(Icons.person, size: 16),
            ),
        ],
      ),
    );
  }

  Widget _buildInput(BuildContext context) {
    final chatState = ref.watch(insightsAiTextChatProvider);
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 8 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _inputController,
              enabled: !chatState.isAwaitingResponse,
              decoration: InputDecoration(
                hintText: chatState.isAwaitingResponse
                    ? 'AI is responding...'
                    : 'Ask AI...',
                border: const OutlineInputBorder(),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
              maxLines: 1,
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filled(
            onPressed: chatState.isAwaitingResponse ? null : _sendMessage,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  Future<void> _sendMessage() async {
    final text = _inputController.text.trim();
    if (text.isEmpty) return;
    final notifier = ref.read(insightsAiTextChatProvider.notifier);
    notifier.addAiTextChatUserMessage(text);
    _inputController.clear();

    try {
      final api = ref.read(meetApiServiceProvider);
      final res = await api.executeInsightsAiTextChat(text);
      if (!res.status && mounted) {
        notifier.clearIsAwaitingResponse();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(res.msg.isNotEmpty ? res.msg : 'AI request failed')),
        );
      }
    } catch (e) {
      if (mounted) {
        notifier.clearIsAwaitingResponse();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }
}
