import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../providers/sensei_providers.dart';
import '../../models/sensei_model.dart';

class SenseiRoleplayChatPage extends ConsumerStatefulWidget {
  final String topic;
  const SenseiRoleplayChatPage({super.key, required this.topic});

  @override
  ConsumerState<SenseiRoleplayChatPage> createState() => _SenseiRoleplayChatPageState();
}

class _SenseiRoleplayChatPageState extends ConsumerState<SenseiRoleplayChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  
  // Audio & Speech
  late stt.SpeechToText _speech;
  bool _isListening = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  final FlutterTts _flutterTts = FlutterTts();
  bool _autoPlay = true;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _initTts();
    
    // Start roleplay on entry
    Future.microtask(() => ref.read(senseiRoleplayProvider(widget.topic).notifier).start());
  }

  void _initTts() async {
    await _flutterTts.setLanguage("ja-JP");
    await _flutterTts.setSpeechRate(0.5);
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _audioPlayer.dispose();
    _flutterTts.stop();
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

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: null,
        onError: null,
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          localeId: 'ja-JP',
          onResult: (val) => setState(() {
            _messageController.text = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  Future<void> _playResponse(RoleplayMessage message) async {
    if (!_autoPlay) return;
    
    try {
      final repo = ref.read(senseiRepositoryProvider);
      final tts = await repo.getTTS(message.content);
      if (tts.url.isNotEmpty) {
        await _audioPlayer.play(UrlSource(tts.url));
      } else {
        // Fallback to local TTS
        await _flutterTts.speak(message.content);
      }
    } catch (e) {
      // Fallback
      await _flutterTts.speak(message.content);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(senseiRoleplayProvider(widget.topic));
    final notifier = ref.read(senseiRoleplayProvider(widget.topic).notifier);

    // Auto-scroll on new messages
    ref.listen(senseiRoleplayProvider(widget.topic), (previous, next) {
      if (next.messages.length > (previous?.messages.length ?? 0)) {
        Future.delayed(const Duration(milliseconds: 100), _scrollToBottom);
        
        // Auto-play last AI message
        final lastMsg = next.messages.last;
        if (lastMsg.role == ChatMessageRole.assistant && !lastMsg.isFeedback) {
          _playResponse(lastMsg);
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.topic, style: TextStyle(fontSize: 18, fontWeight: AppTypography.bold)),
            Text(
              state.isFinished ? 'Đã kết thúc' : 'Sensei đang hội thoại...',
              style: TextStyle(fontSize: 12, color: state.isFinished ? Colors.green : Colors.orange),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(_autoPlay ? Icons.volume_up : Icons.volume_off),
            onPressed: () => setState(() => _autoPlay = !_autoPlay),
          ),
          if (!state.isFinished && state.messages.where((m) => m.role == ChatMessageRole.user).length >= 5)
            TextButton(
              onPressed: () => notifier.finish(),
              child: Text('KẾT THÚC', style: TextStyle(color: Colors.green, fontWeight: AppTypography.bold)),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: state.messages.length + (state.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == state.messages.length) {
                  return _buildTypingIndicator();
                }
                final msg = state.messages[index];
                return _buildMessageBubble(msg);
              },
            ),
          ),
          _buildInputBar(state, notifier),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(RoleplayMessage msg) {
    final isAI = msg.role == ChatMessageRole.assistant;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: isAI ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: msg.isFeedback 
                  ? Colors.green[50] 
                  : (isAI ? Colors.grey[100] : AppColors.primary),
              borderRadius: BorderRadius.circular(20).copyWith(
                bottomLeft: isAI ? const Radius.circular(0) : const Radius.circular(20),
                bottomRight: isAI ? const Radius.circular(20) : const Radius.circular(0),
              ),
              border: msg.isFeedback ? Border.all(color: Colors.green[200]!) : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  msg.content,
                  style: TextStyle(
                    color: isAI ? AppColors.textPrimary : Colors.white,
                    fontSize: 16,
                  ),
                ),
                if (isAI && !msg.isFeedback) ...[
                  if (msg.romaji != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        msg.romaji!,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  if (msg.english != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        msg.english!,
                        style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const SizedBox(
              width: 40,
              child: LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputBar(RoleplayState state, dynamic notifier) {
    if (state.isFinished) {
      return Container(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () => context.pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: Text('QUAY LẠI', style: TextStyle(fontWeight: AppTypography.bold, color: Colors.white)),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
              color: _isListening ? Colors.red : AppColors.textSecondary,
              onPressed: _listen,
            ),
            if (_isListening)
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: VoiceWaveAnimation(isListening: true, color: Colors.red),
              ),
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Nhập câu trả lời...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onSubmitted: (val) {
                  notifier.sendMessage(val);
                  _messageController.clear();
                },
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.send),
              color: AppColors.primary,
              onPressed: () {
                notifier.sendMessage(_messageController.text);
                _messageController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
