import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
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
  bool _locked = false;
  String? _selectedOption;
  final FlutterTts _tts = FlutterTts();
  bool _ttsReady = false;
  late Future<List<Map<String, dynamic>>> _quizFuture;

  @override
  void initState() {
    super.initState();
    _quizFuture = _loadQuiz();
    _initTts();
  }

  Future<List<Map<String, dynamic>>> _loadQuiz() {
    return ref
        .read(academyRepositoryProvider)
        .getStudySetTestQuiz(widget.setId, count: 10);
  }

  void _retryWithFreshQuiz() {
    setState(() {
      _index = 0;
      _correct = 0;
      _locked = false;
      _selectedOption = null;
      _quizFuture = _loadQuiz();
    });
  }

  Future<void> _initTts() async {
    try {
      await _tts.setLanguage('ja-JP');
      await _tts.setSpeechRate(0.45);
      _ttsReady = true;
    } catch (_) {
      _ttsReady = false;
    }
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _speak(String text) async {
    if (!_ttsReady || text.trim().isEmpty) return;
    await _tts.stop();
    await _tts.speak(text);
  }

  Future<void> _handleAnswer(dynamic selected, dynamic correct, List<Map<String, dynamic>> all) async {
    if (_locked) return;
    final isCorrect = selected == correct;
    
    HapticFeedback.lightImpact();
    if (!isCorrect) HapticFeedback.heavyImpact();

    setState(() {
      _locked = true;
      _selectedOption = selected.toString();
      if (isCorrect) _correct += 1;
    });

    await Future.delayed(const Duration(milliseconds: 600));

    if (!mounted) return;
    setState(() {
      _index += 1;
      _locked = false;
      _selectedOption = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text('Trắc nghiệm', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _quizFuture,
        builder: (context, snap) {
           if (snap.connectionState == ConnectionState.waiting) {
             return const Center(child: CircularProgressIndicator());
           }
           if (snap.hasError) {
              return Center(child: Text('Lỗi: ${snap.error}', style: TextStyle(color: theme.colorScheme.error)));
           }
           final questions = snap.data ?? [];
           if (questions.isEmpty) {
              return const Center(child: Text('Không đủ thẻ để tạo bài thi.'));
           }

           if (_index >= questions.length) {
              return _QuizResultView(
                correct: _correct,
                total: questions.length,
                onRetry: _retryWithFreshQuiz,
              );
           }

           final q = questions[_index];
           final type = q['type']?.toString();
           final questionText = q['question']?.toString() ?? '';
           final correctAnswer = q['correctAnswer'];

           return Padding(
             padding: const EdgeInsets.all(24),
             child: Column(
               children: [
                   _QuizProgressBar(current: _index + 1, total: questions.length),
                   const SizedBox(height: 32),
                   _QuestionCard(
                     question: questionText,
                     type: type,
                     displayedAnswer: q['displayedAnswer']?.toString(),
                     onSpeak: () => _speak(questionText),
                   ),
                   const SizedBox(height: 32),
                   if (type == 'multiple_choice') 
                     ...((q['options'] as List?) ?? []).map((opt) {
                        final optText = opt.toString();
                        return _OptionButton(
                          text: optText,
                          isSelected: _selectedOption == optText,
                          isCorrect: _locked && optText == correctAnswer.toString(),
                          isWrong: _locked && _selectedOption == optText && optText != correctAnswer.toString(),
                          onTap: () => _handleAnswer(optText, correctAnswer, questions),
                        );
                     })
                   else 
                     Row(
                       children: [
                         Expanded(
                           child: _TrueFalseButton(
                             isTrue: true,
                             isSelected: _selectedOption == 'true',
                             isCorrect: _locked && correctAnswer == true,
                             isWrong: _locked && _selectedOption == 'true' && correctAnswer != true,
                             onTap: () => _handleAnswer(true, correctAnswer, questions),
                           ),
                         ),
                         const SizedBox(width: 16),
                         Expanded(
                           child: _TrueFalseButton(
                             isTrue: false,
                             isSelected: _selectedOption == 'false',
                             isCorrect: _locked && correctAnswer == false,
                             isWrong: _locked && _selectedOption == 'false' && correctAnswer != false,
                             onTap: () => _handleAnswer(false, correctAnswer, questions),
                           ),
                         ),
                       ],
                     ),
               ],
             ),
           );
        },
      ),
    );
  }
}

class _QuizProgressBar extends StatelessWidget {
  final int current;
  final int total;
  const _QuizProgressBar({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ratio = current / total;
    return Column(
      children: [
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text('CÂU HỎI $current', style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.grey, fontSize: 13, letterSpacing: 1)),
             Text('${(ratio * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.grey, fontSize: 13)),
           ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: ratio,
            minHeight: 10,
            backgroundColor: theme.colorScheme.outlineVariant,
            valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

class _QuestionCard extends StatelessWidget {
  final String question;
  final String? type;
  final String? displayedAnswer;
  final VoidCallback onSpeak;

  const _QuestionCard({required this.question, this.type, this.displayedAnswer, required this.onSpeak});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                 decoration: BoxDecoration(color: Colors.orange.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                 child: const Text('TRẮC NGHIỆM', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 10)),
               ),
               IconButton(onPressed: onSpeak, icon: const Icon(Icons.volume_up_rounded, color: Colors.grey, size: 20)),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            question,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, height: 1.3),
          ),
          if (type == 'true_false' && displayedAnswer != null) ...[
             const SizedBox(height: 24),
             const Text('Có nghĩa là:', style: TextStyle(color: Colors.grey, fontSize: 14)),
             const SizedBox(height: 8),
             Text(
               displayedAnswer!,
               textAlign: TextAlign.center,
               style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
             ),
          ]
        ],
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool isWrong;
  final VoidCallback onTap;

  const _OptionButton({
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.isWrong,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    Color borderColor = theme.colorScheme.outlineVariant;
    Color? bgColor = theme.colorScheme.surface;
    Color textColor = theme.colorScheme.onSurface;

    if (isCorrect) {
      borderColor = const Color(0xFF3BB25E);
      bgColor = const Color(0xFF3BB25E).withOpacity(0.1);
      textColor = const Color(0xFF3BB25E);
    } else if (isWrong) {
      borderColor = theme.colorScheme.error;
      bgColor = theme.colorScheme.error.withOpacity(0.1);
      textColor = theme.colorScheme.error;
    } else if (isSelected) {
      borderColor = theme.colorScheme.primary;
      bgColor = theme.colorScheme.primary.withOpacity(0.05);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 2),
          ),
          child: Row(
            children: [
               Expanded(
                 child: Text(text, style: theme.textTheme.bodyLarge?.copyWith(
                   fontWeight: FontWeight.bold,
                   color: textColor,
                 )),
               ),
               if (isCorrect) const Icon(Icons.check_circle, color: Color(0xFF3BB25E))
               else if (isWrong) const Icon(Icons.cancel, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrueFalseButton extends StatelessWidget {
  final bool isTrue;
  final bool isSelected;
  final bool isCorrect;
  final bool isWrong;
  final VoidCallback onTap;

  const _TrueFalseButton({
    required this.isTrue,
    required this.isSelected,
    required this.isCorrect,
    required this.isWrong,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isTrue ? const Color(0xFF3BB25E) : Colors.red;
    final theme = Theme.of(context);
    
    Color borderColor = theme.colorScheme.outlineVariant;
    Color? bgColor = theme.colorScheme.surface;

    if (isCorrect) {
      borderColor = const Color(0xFF3BB25E);
      bgColor = const Color(0xFF3BB25E).withOpacity(0.1);
    } else if (isWrong) {
      borderColor = Colors.red;
      bgColor = Colors.red.withOpacity(0.1);
    } else if (isSelected) {
       borderColor = color;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 100,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(isTrue ? Icons.check : Icons.close, color: isSelected || isLockedLocal(isCorrect, isWrong) ? color : Colors.grey, size: 32),
             const SizedBox(height: 8),
             Text(isTrue ? 'ĐÚNG' : 'SAI', style: TextStyle(fontWeight: FontWeight.w900, color: isSelected || isLockedLocal(isCorrect, isWrong) ? color : Colors.grey)),
          ],
        ),
      ),
    );
  }

  bool isLockedLocal(bool c, bool w) => c || w;
}

class _QuizResultView extends StatelessWidget {
  final int correct;
  final int total;
  final VoidCallback onRetry;

  const _QuizResultView({required this.correct, required this.total, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final score = (correct / total * 100).toInt();
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Stack(
               alignment: Alignment.center,
               children: [
                 SizedBox(
                   width: 140,
                   height: 140,
                   child: CircularProgressIndicator(
                     value: correct / total,
                     strokeWidth: 12,
                     backgroundColor: theme.colorScheme.outlineVariant,
                     valueColor: AlwaysStoppedAnimation<Color>(score >= 80 ? const Color(0xFF3BB25E) : Colors.orange),
                   ),
                 ),
                 Column(
                   children: [
                      Text('$score%', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900)),
                      Text('$correct/$total đúng', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                   ],
                 ),
               ],
             ),
             const SizedBox(height: 48),
             Text(
               score >= 80 ? 'Tuyệt đỉnh!' : (score >= 50 ? 'Làm tốt lắm!' : 'Cần cố gắng thêm.'),
               style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
             ),
             const SizedBox(height: 12),
             const Text('Tiếp tục luyện tập để ghi nhớ lâu hơn nhé.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
             const SizedBox(height: 48),
             SizedBox(
               width: double.infinity,
               height: 56,
               child: ElevatedButton(
                 onPressed: onRetry,
                 style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                 child: const Text('Làm lại bài thi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
               ),
             ),
             const SizedBox(height: 16),
             TextButton(onPressed: () => Navigator.pop(context), child: const Text('Quay lại bộ thẻ')),
          ],
        ),
      ),
    );
  }
}
