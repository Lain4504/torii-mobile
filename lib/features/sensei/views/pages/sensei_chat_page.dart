import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import '../../models/sensei_model.dart';
import '../../providers/sensei_providers.dart';
import '../widgets/sensei_quota_header.dart';

class SenseiChatPage extends ConsumerStatefulWidget {
  const SenseiChatPage({super.key});

  @override
  ConsumerState<SenseiChatPage> createState() => _SenseiChatPageState();
}

class _SenseiChatPageState extends ConsumerState<SenseiChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleSend() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    ref.read(senseiChatProvider.notifier).sendMessage(text);
    _messageController.clear();
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(senseiChatProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Sensei Chat',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              'Hỏi đáp thông minh',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7)),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
              itemCount: messages.isEmpty ? 1 : messages.length,
              itemBuilder: (context, index) {
                if (messages.isEmpty) {
                  return _EmptyChatView();
                }
                final message = messages[index];
                final isLatestMessage = index == messages.length - 1;
                return _ChatBubble(message: message, isLatestMessage: isLatestMessage);
              },
            ),
          ),
          _ChatInput(
            controller: _messageController,
            onSend: _handleSend,
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends ConsumerWidget {
  final ChatMessage message;
  final bool isLatestMessage;

  const _ChatBubble({required this.message, this.isLatestMessage = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isAssistant = message.role == ChatMessageRole.assistant;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isAssistant ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (isAssistant)
            _SenseiAvatar(),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: isAssistant ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: isAssistant ? theme.colorScheme.surface : theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(16).copyWith(
                      topLeft: isAssistant ? const Radius.circular(4) : null,
                      bottomRight: !isAssistant ? const Radius.circular(4) : null,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.onSurface.withOpacity(0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: message.isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: theme.colorScheme.primary),
                        )
                      : isAssistant
                          ? MarkdownBody(
                              data: message.content,
                              styleSheet: MarkdownStyleSheet(
                                p: TextStyle(
                                  color: theme.colorScheme.onSurface,
                                  fontSize: 14.5,
                                  height: 1.4,
                                ),
                              ),
                            )
                          : Text(
                              message.content,
                              style: TextStyle(
                                color: theme.colorScheme.onPrimary,
                                fontSize: 14.5,
                                height: 1.4,
                              ),
                            ),
                ),
                if (isAssistant && isLatestMessage && message.suggestions != null && message.suggestions!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: message.suggestions!.map((s) => ActionChip(
                      label: Text(s, style: TextStyle(fontSize: 12, color: theme.colorScheme.primary, fontWeight: FontWeight.w600)),
                      backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                      side: BorderSide(color: theme.colorScheme.primary.withOpacity(0.2)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                      onPressed: () {
                        ref.read(senseiChatProvider.notifier).sendMessage(s);
                      },
                    )).toList(),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (!isAssistant)
            CircleAvatar(
              radius: 16,
              backgroundColor: theme.colorScheme.secondary,
              child: Icon(Icons.person, size: 16, color: theme.colorScheme.onSecondary),
            ),
        ],
      ),
    );
  }
}

class _SenseiAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.2)),
      ),
      child: Center(
        child: Icon(Icons.auto_awesome, size: 16, color: theme.colorScheme.primary),
      ),
    );
  }
}

class _ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const _ChatInput({required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(top: BorderSide(color: theme.colorScheme.outlineVariant)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: null,
                onSubmitted: (_) => onSend(),
                decoration: InputDecoration(
                  hintText: 'Nhập câu hỏi tại đây...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: theme.colorScheme.primary),
                  ),
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 42,
              height: 42,
              child: ElevatedButton(
                onPressed: onSend,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: const CircleBorder(),
                  elevation: 0,
                ),
                child: const Icon(Icons.send, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 36),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.chat_bubble_outline, size: 28, color: theme.colorScheme.primary),
        ),
        const SizedBox(height: 14),
        Text(
          "Kon'nichiwa!",
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 6),
        Text(
          'Tôi là Sensei. Bạn có thắc mắc gì về Nhật ngữ không? Hãy hỏi tôi bất cứ điều gì nhé!',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7),
            height: 1.35,
          ),
        ),
        const SizedBox(height: 18),
        const _SuggestionChips(),
      ],
    );
  }
}

class _SuggestionChips extends StatelessWidget {
  const _SuggestionChips();

  @override
  Widget build(BuildContext context) {
    final suggestions = [
      'Giải thích ngữ pháp N3',
      'Cách dùng tự nhiên của "koto"',
      'Mẹo nhớ Hán tự N2',
      'Phân biệt "wa" và "ga"',
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: suggestions.map((s) => _Chip(label: s)).toList(),
    );
  }
}

class _Chip extends ConsumerWidget {
  final String label;

  const _Chip({required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return ActionChip(
      label: Text(label, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600)),
      backgroundColor: theme.colorScheme.surface,
      side: BorderSide(color: theme.colorScheme.outlineVariant),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      onPressed: () {
        ref.read(senseiChatProvider.notifier).sendMessage(label);
      },
    );
  }
}
