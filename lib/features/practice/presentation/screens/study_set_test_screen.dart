import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';

class StudySetTestScreen extends ConsumerStatefulWidget {
  final String setId;
  const StudySetTestScreen({super.key, required this.setId});

  @override
  ConsumerState<StudySetTestScreen> createState() => _StudySetTestScreenState();
}

class _StudySetTestScreenState extends ConsumerState<StudySetTestScreen> {
  int _index = 0;
  int _correct = 0;
  bool _autoSpeak = true;
  bool _locked = false;
  /// Tránh đọc TTS lặp lại mỗi lần rebuild (gây nhấp nháy / giật UI).
  int _lastSpokenIndex = -1;
  late final Future<List<Map<String, dynamic>>> _quizFuture;
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _quizFuture = ref.read(academyRepositoryProvider).getStudySetTestQuiz(widget.setId, count: 20);
    _initTts();
  }

  Future<void> _initTts() async {
    await _tts.setLanguage('ja-JP');
    await _tts.setSpeechRate(0.45);
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _speak(String text) async {
    if (!_autoSpeak) return;
    await _tts.stop();
    await _tts.speak(text);
  }

  void _scheduleSpeakIfNewQuestion(String questionText, int questionIndex) {
    if (_lastSpokenIndex == questionIndex) return;
    _lastSpokenIndex = questionIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _speak(questionText);
    });
  }

  Future<void> _onAnswerMultipleChoice({
    required String selected,
    required String correctAnswer,
  }) async {
    if (_locked) return;
    final isCorrect = selected == correctAnswer;
    HapticFeedback.lightImpact();
    if (!isCorrect) HapticFeedback.heavyImpact();
    setState(() {
      _locked = true;
      if (isCorrect) _correct += 1;
    });
    await Future.delayed(const Duration(milliseconds: 350));
    if (!mounted) return;
    setState(() {
      _index += 1;
      _locked = false;
    });
  }

  Future<void> _onAnswerTrueFalse({
    required List<Map<String, dynamic>> questions,
    required bool choseTrue,
  }) async {
    if (_locked) return;
    final q = questions[_index];
    final correctIsTrue = q['correctAnswer'] == true;
    final isCorrect = choseTrue ? correctIsTrue : !correctIsTrue;
    HapticFeedback.lightImpact();
    if (!isCorrect) HapticFeedback.heavyImpact();
    setState(() {
      _locked = true;
      if (isCorrect) _correct += 1;
    });
    await Future.delayed(const Duration(milliseconds: 280));
    if (!mounted) return;
    setState(() {
      _index += 1;
      _locked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Trắc nghiệm', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => setState(() => _autoSpeak = !_autoSpeak),
            icon: Icon(_autoSpeak ? Icons.volume_up : Icons.volume_off),
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _quizFuture,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Lỗi: ${snap.error}', style: const TextStyle(color: AppColors.error)));
          }
          final questions = snap.data ?? [];
          if (questions.isEmpty) {
            return const Center(child: Text('Không tạo được bài test', style: TextStyle(color: AppColors.textTertiary)));
          }
          if (_index >= questions.length) {
            final score = ((_correct / questions.length) * 100).toInt();
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.10),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.flag_rounded, color: AppColors.primary, size: 38),
                    ),
                    const SizedBox(height: 14),
                    Text('Hoàn thành', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                    const SizedBox(height: 6),
                    Text(
                      'Đúng $_correct/${questions.length} • $score%',
                      style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () => setState(() {
                          _index = 0;
                          _correct = 0;
                          _locked = false;
                          _lastSpokenIndex = -1;
                        }),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.textOnPrimary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: const Text('Làm lại', style: TextStyle(fontWeight: FontWeight.w900)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          final q = questions[_index];
          final type = (q['type'] ?? '').toString();
          final questionText = (q['question'] ?? '').toString();
          _scheduleSpeakIfNewQuestion(questionText, _index);

          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              children: [
                _TopProgress(current: _index + 1, total: questions.length, correct: _correct),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.grey300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        type == 'true_false' ? 'Đúng / Sai' : 'Chọn đáp án',
                        style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        questionText,
                        style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900, height: 1.15),
                      ),
                      const SizedBox(height: 6),
                      if (type == 'true_false')
                        Text(
                          'Định nghĩa: ${(q['displayedAnswer'] ?? '').toString()}',
                          style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                if (type == 'multiple_choice') ...[
                  ...(((q['options'] as List?) ?? const []).cast<dynamic>()).map((opt) {
                    final text = opt.toString();
                    final correctAnswer = (q['correctAnswer'] ?? '').toString();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: _locked
                              ? null
                              : () => _onAnswerMultipleChoice(
                                    selected: text,
                                    correctAnswer: correctAnswer,
                                  ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.textPrimary,
                            side: const BorderSide(color: AppColors.grey300),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          child: Text(text, style: const TextStyle(fontWeight: FontWeight.w800)),
                        ),
                      ),
                    );
                  }),
                ] else ...[
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: OutlinedButton(
                            onPressed: _locked
                                ? null
                                : () => _onAnswerTrueFalse(questions: questions, choseTrue: true),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.success,
                              side: BorderSide(color: AppColors.success.withValues(alpha: 0.5)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            ),
                            child: const Text('Đúng', style: TextStyle(fontWeight: FontWeight.w900)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: OutlinedButton(
                            onPressed: _locked
                                ? null
                                : () => _onAnswerTrueFalse(questions: questions, choseTrue: false),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.error,
                              side: BorderSide(color: AppColors.error.withValues(alpha: 0.5)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            ),
                            child: const Text('Sai', style: TextStyle(fontWeight: FontWeight.w900)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TopProgress extends StatelessWidget {
  final int current;
  final int total;
  final int correct;
  const _TopProgress({required this.current, required this.total, required this.correct});

  @override
  Widget build(BuildContext context) {
    final ratio = total == 0 ? 0.0 : current / total;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$current/$total', style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.textSecondary)),
            Text('Đúng: $correct', style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.textSecondary)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: ratio.clamp(0.0, 1.0),
            minHeight: 10,
            backgroundColor: AppColors.grey200,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      ],
    );
  }
}
