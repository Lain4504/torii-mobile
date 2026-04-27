import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../models/sensei_model.dart';
import '../../providers/sensei_providers.dart';

class LessonSenseiChatSheet extends ConsumerStatefulWidget {
  final String lessonId;
  final String? courseId;
  final String? initialMessage;
  final String? currentTimestamp;

  const LessonSenseiChatSheet({
    super.key,
    required this.lessonId,
    this.courseId,
    this.initialMessage,
    this.currentTimestamp,
  });

  @override
  ConsumerState<LessonSenseiChatSheet> createState() => _LessonSenseiChatSheetState();
}

class _LessonSenseiChatSheetState extends ConsumerState<LessonSenseiChatSheet> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.initialMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _sendChatMessage(widget.initialMessage!);
      });
    }
  }

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

  void _sendChatMessage(String text) {
    ref.read(lessonSenseiChatProvider((
      lessonId: widget.lessonId,
      courseId: widget.courseId,
    )).notifier).sendMessage(text, timestamp: widget.currentTimestamp);
    _scrollToBottom();
  }

  void _handleSend() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    _sendChatMessage(text);
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(lessonSenseiChatProvider((
      lessonId: widget.lessonId,
      courseId: widget.courseId,
    )));
    final theme = Theme.of(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.grey200)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.auto_awesome, size: 20, color: AppColors.primary),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AI Sensei Assistant',
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                      Text(
                        'Hỏi về bài học này',
                        style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          // Chat Body
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: messages.isEmpty ? 1 : messages.length,
              itemBuilder: (context, index) {
                if (messages.isEmpty) {
                  return const _EmptyLessonChat();
                }
                final message = messages[index];
                final isLast = index == messages.length - 1;
                return _LessonChatBubble(
                  message: message,
                  isLast: isLast,
                  onSuggestionTap: _sendChatMessage,
                );
              },
            ),
          ),

          // Input Area
          _ChatInputArea(
            controller: _messageController,
            onSend: _handleSend,
            timestamp: widget.currentTimestamp,
          ),
        ],
      ),
    );
  }
}

class _LessonChatBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isLast;
  final Function(String) onSuggestionTap;

  const _LessonChatBubble({
    required this.message,
    required this.isLast,
    required this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    final isAssistant = message.role == ChatMessageRole.assistant;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isAssistant ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (isAssistant) ...[
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.auto_awesome, size: 16, color: AppColors.primary),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: isAssistant ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isAssistant ? AppColors.secondary : AppColors.primary,
                    borderRadius: BorderRadius.circular(16).copyWith(
                      topLeft: isAssistant ? const Radius.circular(0) : null,
                      bottomRight: !isAssistant ? const Radius.circular(0) : null,
                    ),
                  ),
                  child: message.isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
                        )
                      : isAssistant
                          ? _TypingMarkdown(data: message.content, animate: isLast)
                          : Text(
                              message.content,
                              style: const TextStyle(color: Colors.white, fontSize: 14),
                            ),
                ),
              ],
            ),
          ),
          if (!isAssistant) ...[
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.grey200,
              child: Icon(Icons.person, size: 16, color: AppColors.textTertiary),
            ),
          ],
        ],
      ),
    );
  }
}

class _TypingMarkdown extends StatefulWidget {
  final String data;
  final bool animate;

  const _TypingMarkdown({required this.data, this.animate = false});

  @override
  State<_TypingMarkdown> createState() => _TypingMarkdownState();
}

class _TypingMarkdownState extends State<_TypingMarkdown> {
  String _displayData = "";
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    if (widget.animate) {
      _startTyping();
    } else {
      _displayData = widget.data;
    }
  }

  @override
  void didUpdateWidget(_TypingMarkdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      if (widget.animate) {
        _startTyping();
      } else {
        _displayData = widget.data;
      }
    }
  }

  void _startTyping() async {
    if (_isTyping) return;
    _isTyping = true;
    _displayData = "";
    
    final characters = widget.data.characters.toList();
    for (var i = 0; i < characters.length; i++) {
      if (!mounted) break;
      setState(() {
        _displayData += characters[i];
      });
      await Future.delayed(const Duration(milliseconds: 10));
    }
    _isTyping = false;
  }

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: _displayData,
      styleSheet: MarkdownStyleSheet(
        p: const TextStyle(fontSize: 14, height: 1.5, color: AppColors.textPrimary),
      ),
    );
  }
}

class _ChatInputArea extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final String? timestamp;

  const _ChatInputArea({
    required this.controller,
    required this.onSend,
    this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.grey200)),
      ),
      child: Row(
        children: [
          if (timestamp != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.schedule, size: 14, color: AppColors.primary),
                    const SizedBox(width: 4),
                    Text(
                      timestamp!,
                      style: const TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Hỏi Sensei về bài học...',
                hintStyle: const TextStyle(fontSize: 14, color: AppColors.textTertiary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.grey300),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                filled: true,
                fillColor: AppColors.secondary,
              ),
              onSubmitted: (_) => onSend(),
            ),
          ),
          const SizedBox(width: 12),
          IconButton.filled(
            onPressed: onSend,
            icon: const Icon(Icons.send_rounded),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyLessonChat extends StatelessWidget {
  const _EmptyLessonChat();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        const Icon(Icons.auto_awesome, size: 64, color: AppColors.grey200),
        const SizedBox(height: 20),
        const Text(
          'Bạn có thắc mắc về bài học?',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Hãy đặt câu hỏi cho AI Sensei để được giải đáp ngay lập tức về nội dung bài học này.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textTertiary, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
