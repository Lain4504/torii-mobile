import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../models/sensei_model.dart';
// Temporary: use Material icons instead of lucide-react
// and keep providers decoupled to avoid missing package issues.
import '../providers/sensei_providers.dart';

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

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Sensei Chat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('Hỏi đáp thông minh', style: TextStyle(fontSize: 12, color: AppColors.grey700, fontWeight: FontWeight.normal)),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isAssistant ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (isAssistant)
            _SenseiAvatar(),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
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
                  : Text(
                      message.content,
                      style: TextStyle(
                        color: isAssistant ? AppColors.textPrimary : AppColors.textOnPrimary,
                        fontSize: 15,
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.borderLight)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: controller,
                maxLines: null,
                onSubmitted: (_) => onSend(),
                decoration: const InputDecoration(
                  hintText: 'Nhập câu hỏi tại đây...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onSend,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, color: AppColors.textOnPrimary, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.05),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.chat_bubble_outline, size: 48, color: AppColors.primary),
        ),
        const SizedBox(height: 24),
        const Text(
          "Kon'nichiwa!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tôi là Sensei. Bạn có thắc mắc gì về Nhật ngữ không? Hãy hỏi tôi bất cứ điều gì nhé!',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textSecondary, height: 1.5),
        ),
        const SizedBox(height: 40),
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
      label: Text(label, style: const TextStyle(fontSize: 12)),
      backgroundColor: AppColors.surface,
      side: const BorderSide(color: AppColors.borderLight),
      onPressed: () {
        ref.read(senseiChatProvider.notifier).sendMessage(label);
      },
    );
  }
}
