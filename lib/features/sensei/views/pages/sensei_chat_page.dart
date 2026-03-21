import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../models/sensei_model.dart';
import '../../providers/sensei_providers.dart';

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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Sensei Chat',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              'Hỏi đáp thông minh',
              style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        actions: const [],
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
                return _ChatBubble(message: message);
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

class _ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: isAssistant ? AppColors.textOnPrimary : AppColors.primary,
                borderRadius: BorderRadius.circular(16).copyWith(
                  topLeft: isAssistant ? const Radius.circular(4) : null,
                  bottomRight: !isAssistant ? const Radius.circular(4) : null,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textPrimary.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: message.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
                    )
                  : isAssistant
                      ? MarkdownBody(
                          data: message.content,
                          styleSheet: MarkdownStyleSheet(
                            p: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14.5,
                              height: 1.4,
                            ),
                          ),
                        )
                      : Text(
                          message.content,
                          style: const TextStyle(
                            color: AppColors.textOnPrimary,
                            fontSize: 14.5,
                            height: 1.4,
                          ),
                        ),
            ),
          ),
          const SizedBox(width: 8),
          if (!isAssistant)
            const CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.secondary,
              child: Icon(Icons.person, size: 16, color: AppColors.textOnPrimary),
            ),
        ],
      ),
    );
  }
}

class _SenseiAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
      ),
      child: const Center(
        child: Icon(Icons.auto_awesome, size: 16, color: AppColors.primary),
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
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.borderLight)),
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
                    borderSide: const BorderSide(color: AppColors.grey300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.grey300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
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
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textOnPrimary,
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
            color: AppColors.primary.withOpacity(0.05),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.chat_bubble_outline, size: 28, color: AppColors.primary),
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
            color: AppColors.textTertiary,
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
    return ActionChip(
      label: Text(label, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600)),
      backgroundColor: AppColors.surface,
      side: const BorderSide(color: AppColors.borderLight),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      onPressed: () {
        ref.read(senseiChatProvider.notifier).sendMessage(label);
      },
    );
  }
}
