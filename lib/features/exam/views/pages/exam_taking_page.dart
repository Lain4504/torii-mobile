import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../models/exam_model.dart';

/// Exam Taking Page - The actual test interface
class ExamTakingPage extends StatefulWidget {
  final Exam? exam;

  const ExamTakingPage({super.key, this.exam});

  @override
  State<ExamTakingPage> createState() => _ExamTakingPageState();
}

class _ExamTakingPageState extends State<ExamTakingPage> {
  late List<Question> _questions;
  int _currentIndex = 0;
  final Map<int, int> _answers = {}; // Index -> Selected Option Index
  Timer? _timer;
  int _secondsRemaining = 0;

  @override
  void initState() {
    super.initState();
    _questions = _getMockQuestions();
    
    // Set duration (default 60 min if null)
    _secondsRemaining = (widget.exam?.durationMinutes ?? 60) * 60;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        _timer?.cancel();
        _submitExam();
      }
    });
  }

  List<Question> _getMockQuestions() {
    return [
      const Question(
        id: '1',
        text: 'Select the correct reading for: 学生',
        options: ['Gakusei', 'Sensei', 'Kaishain', 'Isha'],
        correctIndex: 0,
      ),
      const Question(
        id: '2',
        text: 'Select the correct particle: 私は寿司__好きです。',
        options: ['は', 'が', 'を', 'に'],
        correctIndex: 1,
      ),
      const Question(
        id: '3',
        text: 'Meaning of: 食べる',
        options: ['To drink', 'To see', 'To eat', 'To sleep'],
        correctIndex: 2,
      ),
      const Question(
        id: '4',
        text: 'Choose the correct Kanji for "Mountain"',
        options: ['川', '田', '山', '刀'],
        correctIndex: 2,
      ),
      const Question(
        id: '5',
        text: 'Complete: "Ohayou ______"',
        options: ['Gozaimasu', 'Kudasai', 'Desu', 'Masu'],
        correctIndex: 0,
      ),
    ];
  }

  String get _timerText {
    final minutes = (_secondsRemaining / 60).floor();
    final seconds = _secondsRemaining % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return PopScope(
      canPop: false, // Prevent accidental back
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _showExitDialog();
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: theme.scaffoldBackgroundColor,
          surfaceTintColor: Colors.transparent,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () async {
                  if (await _showExitDialog()) {
                    if (context.mounted) Navigator.pop(context);
                  }
                },
                tooltip: 'Quit',
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.timer_outlined, size: 16, color: AppColors.primary),
                        const SizedBox(width: 8),
                        Text(
                          _timerText,
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: _submitExam,
                child: const Text('Submit'),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: LinearProgressIndicator(
              value: (_currentIndex + 1) / _questions.length,
              backgroundColor: isDark ? AppColors.surfaceVariantDark : AppColors.grey200,
              color: AppColors.primary,
              minHeight: 2,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question Number
                    Text(
                      'Question ${_currentIndex + 1}/${_questions.length}',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    
                    // Question Text
                    Text(
                      _questions[_currentIndex].text,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: AppTypography.bold,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    
                    // Options
                    ...List.generate(
                      _questions[_currentIndex].options.length,
                      (index) => _OptionCard(
                        text: _questions[_currentIndex].options[index],
                        isSelected: _answers[_currentIndex] == index,
                        onTap: () {
                          setState(() {
                            _answers[_currentIndex] = index;
                          });
                        },
                        isDark: isDark,
                        index: index,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom Bar
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                border: Border(
                  top: BorderSide(
                    color: isDark ? AppColors.borderDark : AppColors.borderLight,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: _currentIndex > 0
                        ? () => setState(() => _currentIndex--)
                        : null,
                    icon: const Icon(Icons.arrow_back_rounded),
                    label: const Text('Previous'),
                  ),
                  
                  if (_currentIndex < _questions.length - 1)
                    ElevatedButton.icon(
                      onPressed: () => setState(() => _currentIndex++),
                      icon: const Icon(Icons.arrow_forward_rounded),
                      label: const Text('Next'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                      ),
                    )
                  else
                    ElevatedButton.icon(
                      onPressed: _submitExam,
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text('Finish'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _showExitDialog() async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quit Exam?'),
        content: const Text('Your progress will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Continue'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Quit', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    ) ?? false;
  }

  void _submitExam() {
    _timer?.cancel();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Exam Completed! 🎉'),
        content: Text('You answered ${_answers.length} out of ${_questions.length} questions.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close page
            },
            child: const Text('Return Home'),
          ),
        ],
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDark;
  final int index;

  const _OptionCard({
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.isDark,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final letters = ['A', 'B', 'C', 'D'];
    
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: AnimatedContainer(
          duration: AppDuration.fast,
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: isSelected 
                ? AppColors.primarySurface
                : isDark ? AppColors.surfaceVariantDark : AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: isSelected
                  ? AppColors.primary
                  : isDark ? AppColors.borderDark : AppColors.borderLight,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.textTertiary,
                    width: isSelected ? 0 : 1.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    letters[index % 4],
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.textTertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected 
                        ? AppColors.primary 
                        : isDark ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
