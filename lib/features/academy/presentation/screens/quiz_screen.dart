import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'exam_result_screen.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({
    super.key,
    required this.examId,
    required this.classId,
    this.assessmentId,
  });

  final String examId;
  final String classId;
  final String? assessmentId;

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  bool _loading = true;
  bool _submitting = false;
  String? _attemptId;
  List<AssessmentQuestionModel> _questions = [];
  final Map<String, String> _selectedAnswers = {};
  String? _errorMessage;
  
  Timer? _timer;
  DateTime? _deadlineAt;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _startQuiz();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    if (_deadlineAt == null) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted || _submitting) {
        timer.cancel();
        return;
      }
      
      final now = DateTime.now();
      if (_deadlineAt!.isAfter(now)) {
        setState(() {
          _remainingTime = _deadlineAt!.difference(now);
        });
      } else {
        timer.cancel();
        setState(() {
          _remainingTime = Duration.zero;
        });
        // Tự động nộp bài khi hết giờ
        _submitQuiz(autoSubmit: true);
      }
    });
  }

  Future<void> _startQuiz() async {
    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    try {
      final repo = ref.read(academyRepositoryProvider);
      final resolvedExamId = (widget.examId == 'unknown' || widget.examId.isEmpty) ? null : widget.examId;
      final result = await repo.startAssessmentAttempt(
        examId: resolvedExamId,
        assessmentId: widget.assessmentId,
        classId: widget.classId,
      );

      if (result == null) {
        setState(() {
          _loading = false;
          _errorMessage = 'Không thể bắt đầu bài kiểm tra. Vui lòng thử lại.';
        });
        return;
      }

      _attemptId = result['id']?.toString() ?? result['attemptId']?.toString();
      final rawQuestions = result['questions'] as List?;

      final deadlineStr = result['deadlineAt']?.toString() ?? result['expiredAt']?.toString();
      if (deadlineStr != null) {
        _deadlineAt = DateTime.tryParse(deadlineStr);
        if (_deadlineAt != null) {
          _startTimer();
        }
      }

      if (rawQuestions != null) {
        _questions = rawQuestions.map((e) => AssessmentQuestionModel.fromJson(e)).toList();
      }

      setState(() => _loading = false);
    } catch (e) {
      setState(() {
        _loading = false;
        _errorMessage = 'Lỗi hệ thống: $e';
      });
    }
  }

  Future<void> _submitQuiz({bool autoSubmit = false}) async {
    if (_attemptId == null || _submitting) return;

    if (!autoSubmit && _selectedAnswers.length < _questions.length) {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Chưa hoàn thành'),
          content: const Text('Bạn chưa trả lời hết các câu hỏi. Bạn vẫn muốn nộp bài chứ?'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Tiếp tục làm')),
            TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Nộp bài')),
          ],
        ),
      );
      if (confirm != true) return;
    }

    setState(() => _submitting = true);

    try {
      final repo = ref.read(academyRepositoryProvider);
      final result = await repo.submitAssessmentAttempt(
        attemptId: _attemptId!,
        answers: _selectedAnswers,
      );

      if (!mounted) return;

      if (result != null) {
        // Refresh status so curriculum updates
        ref.invalidate(assessmentStatusProvider(widget.classId));

        final score = result['score'] ?? result['actualScore'];
        final totalScore = result['totalScore'];
        final isPassed = result['isPassed'] ?? result['passed'];
        final totalCorrect = result['totalCorrect'] ?? result['correctItemsCount'] ?? result['numOfCorrectQuestions'];

        String resultText = 'Bạn đã nộp bài kiểm tra thành công!\n\n';
        if (score != null) resultText += 'Điểm số: $score${totalScore != null ? '/$totalScore' : ''}\n';
        if (totalCorrect != null) resultText += 'Số câu đúng: $totalCorrect/${_questions.length}\n';
        if (isPassed != null) resultText += 'Kết quả: ${isPassed ? 'Đạt' : 'Chưa đạt'}\n';

        Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => ExamResultScreen(
      attemptId: _attemptId!,
      examId: widget.examId,
    ),
  ),
);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lỗi khi nộp bài. Vui lòng thử lại.')),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_errorMessage != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Lỗi')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_errorMessage!, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: _startQuiz, child: const Text('Thử lại')),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Bài kiểm tra', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,        actions: [
          if (_deadlineAt != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Center(
                child: Text(
                  '${_remainingTime.inMinutes.toString().padLeft(2, '0')}:${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent),
                ),
              ),
            ),
          TextButton(
            onPressed: _submitting ? null : () => _submitQuiz(),
            child: _submitting 
              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
              : const Text('Nộp bài', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 8),
        ],      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: _questions.isEmpty ? 0 : _selectedAnswers.length / _questions.length,
            backgroundColor: theme.colorScheme.surfaceVariant,
          ),
          if (_questions.isEmpty)
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Bài kiểm tra này chưa được cập nhật câu hỏi.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  final q = _questions[index];
                  return _buildQuestionCard(index + 1, q);
                },
              ),
            ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -5))],
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _submitting ? null : _submitQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: _submitting
                  ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Text('Nộp bài kiểm tra', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard(int number, AssessmentQuestionModel question) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Câu $number', style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(question.stemText, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, height: 1.4)),
          const SizedBox(height: 16),
          ...question.options.map((option) {
            final isSelected = _selectedAnswers[question.id] == option.id;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () => setState(() => _selectedAnswers[question.id] = option.id),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: isSelected ? theme.colorScheme.primary.withValues(alpha: 0.05) : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outlineVariant, width: isSelected ? 2 : 1),
                  ),
                  child: Row(
                    children: [
                      if (option.optionKey.isNotEmpty)
                        Container(
                          width: 28,
                          height: 28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outline, width: 2),
                            color: isSelected ? theme.colorScheme.primary : Colors.transparent,
                          ),
                          child: Text(
                            option.optionKey,
                            style: TextStyle(
                              color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        )
                      else
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outline, width: 2),
                            color: isSelected ? theme.colorScheme.primary : Colors.transparent,
                          ),
                          child: isSelected ? const Icon(Icons.check, size: 14, color: Colors.white) : null,
                        ),
                      const SizedBox(width: 12),
                      Expanded(child: Text(option.contentText, style: TextStyle(fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal))),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
