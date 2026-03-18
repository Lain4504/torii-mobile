import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';
import 'dart:typed_data';
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
  String _lastFinalTranscript = '';
  bool _holdToTalkActive = false;
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
    _speech.stop();
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
      final roleplayState = ref.read(senseiRoleplayProvider(widget.topic));
      if (roleplayState.isLoading || roleplayState.isFinished) return;

      final mic = await Permission.microphone.request();
      if (!mic.isGranted) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Vui lòng cấp quyền micro để luyện nói.')),
          );
        }
        return;
      }

      bool available = await _speech.initialize(
        onStatus: (status) {
          if (status == 'notListening' && mounted) {
            setState(() => _isListening = false);
          }
        },
        onError: (err) {
          if (mounted) {
            setState(() => _isListening = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Nhận diện giọng nói lỗi: ${err.errorMsg}')),
            );
          }
        },
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          localeId: 'ja-JP',
          partialResults: true,
          listenFor: const Duration(seconds: 30),
          pauseFor: const Duration(seconds: 2),
          onResult: (val) async {
            if (!mounted) return;
            setState(() {
              _messageController.text = val.recognizedWords;
            });

            // Turn-based: only send once when final transcript is ready
            if (val.finalResult) {
              final transcript = val.recognizedWords.trim();
              setState(() => _isListening = false);
              await _speech.stop();

              // Guard against duplicate final callbacks
              if (transcript.isEmpty || transcript == _lastFinalTranscript) return;
              _lastFinalTranscript = transcript;

              final notifier = ref.read(senseiRoleplayProvider(widget.topic).notifier);
              notifier.sendMessage(transcript);
              _messageController.clear();
            }
          },
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  Future<void> _stopListeningAndMaybeSend({required bool forceSend}) async {
    if (!_isListening) return;
    setState(() => _isListening = false);
    await _speech.stop();

    final transcript = _messageController.text.trim();
    if (!forceSend) return;

    if (transcript.isEmpty || transcript == _lastFinalTranscript) return;
    _lastFinalTranscript = transcript;
    final notifier = ref.read(senseiRoleplayProvider(widget.topic).notifier);
    notifier.sendMessage(transcript);
    _messageController.clear();
  }

  Uint8List? _tryDecodeDataAudioUrl(String url) {
    if (!url.startsWith('data:audio')) return null;
    final idx = url.indexOf('base64,');
    if (idx < 0) return null;
    final b64 = url.substring(idx + 'base64,'.length);
    return base64Decode(b64);
  }

  Future<void> _playResponse(RoleplayMessage message) async {
    if (!_autoPlay) return;
    
    try {
      final repo = ref.read(senseiRepositoryProvider);
      final tts = await repo.getTTS(message.content);
      if (tts.url.isNotEmpty) {
        final bytes = _tryDecodeDataAudioUrl(tts.url);
        if (bytes != null) {
          await _audioPlayer.stop();
          await _audioPlayer.play(BytesSource(bytes));
        } else {
          await _audioPlayer.stop();
          await _audioPlayer.play(UrlSource(tts.url));
        }
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
    final theme = Theme.of(context);

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
            Text(
              widget.topic,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              state.isFinished ? 'Đã kết thúc' : 'Sensei đang hội thoại...',
              style: theme.textTheme.bodySmall?.copyWith(
                color: state.isFinished ? AppColors.success : AppColors.accent,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(_autoPlay ? Icons.volume_up : Icons.volume_off),
            onPressed: () => setState(() => _autoPlay = !_autoPlay),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints.tightFor(width: 40, height: 40),
          ),
          if (!state.isFinished && state.messages.where((m) => m.role == ChatMessageRole.user).length >= 5)
            TextButton(
              onPressed: () => notifier.finish(),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                minimumSize: const Size(0, 36),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'KẾT THÚC',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.success,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
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
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: isAI ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: msg.isFeedback 
                  ? AppColors.success.withOpacity(0.1) 
                  : (isAI ? AppColors.grey200 : AppColors.primary),
              borderRadius: BorderRadius.circular(20).copyWith(
                bottomLeft: isAI ? const Radius.circular(0) : const Radius.circular(20),
                bottomRight: isAI ? const Radius.circular(20) : const Radius.circular(0),
              ),
              border: msg.isFeedback ? Border.all(color: AppColors.success.withOpacity(0.4)) : null,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textPrimary.withOpacity(0.05),
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
                    color: isAI ? AppColors.textPrimary : AppColors.textOnPrimary,
                    fontSize: 14.5,
                  ),
                ),
                if (isAI && !msg.isFeedback) ...[
                  if (msg.romaji != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        msg.romaji!,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 11.5,
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
                          fontSize: 11.5,
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
              color: AppColors.grey200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const SizedBox(
              width: 40,
              child: LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.grey300),
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
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () => context.pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
            ),
            child: const Text('QUAY LẠI', style: TextStyle(fontWeight: FontWeight.w800, color: AppColors.textOnPrimary)),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onLongPressStart: state.isLoading
                  ? null
                  : (_) async {
                      _holdToTalkActive = true;
                      if (!_isListening) {
                        _listen();
                      }
                    },
              onLongPressEnd: state.isLoading
                  ? null
                  : (_) async {
                      // Hold-to-talk: thả tay là gửi luôn (turn-based)
                      await _stopListeningAndMaybeSend(forceSend: true);
                      _holdToTalkActive = false;
                    },
              child: IconButton(
                icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
                color: _isListening ? AppColors.error : AppColors.textSecondary,
                onPressed: state.isLoading
                    ? null
                    : () async {
                        // Tap: toggle listen. Nếu đang nghe và tap để dừng -> gửi luôn nếu có text.
                        if (_isListening) {
                          await _stopListeningAndMaybeSend(forceSend: true);
                        } else {
                          _listen();
                        }
                      },
                tooltip: 'Nhấn giữ để nói',
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints.tightFor(width: 40, height: 40),
              ),
            ),
            if (_isListening)
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: VoiceWaveAnimation(isListening: true, color: AppColors.error),
              ),
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: _holdToTalkActive ? 'Đang nghe… thả tay để gửi' : 'Nhập câu trả lời...',
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
                onSubmitted: (val) {
                  notifier.sendMessage(val.trim());
                  _messageController.clear();
                },
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                final text = _messageController.text.trim();
                if (text.isEmpty) return;
                notifier.sendMessage(text);
                _messageController.clear();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textOnPrimary,
                  shape: const CircleBorder(),
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
