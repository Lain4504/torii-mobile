import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../models/exam_model.dart';
import '../../../../core/widgets/widgets.dart';

/// Exam Taking Page - Premium Simulation Interface
class ExamTakingPage extends StatefulWidget {
  final Exam? exam;

  const ExamTakingPage({super.key, this.exam});

  @override
  State<ExamTakingPage> createState() => _ExamTakingPageState();
}

class _ExamTakingPageState extends State<ExamTakingPage> {
  late List<Question> _questions;
  int _currentIndex = 0;
  final Map<int, int> _answers = {};
  Timer? _timer;
  int _secondsRemaining = 0;

  @override
  void initState() {
    super.initState();
    _questions = _getMockQuestions();
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

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _showExitDialog();
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.close_rounded, color: AppColors.textPrimary),
                onPressed: () async {
                  if (await _showExitDialog()) {
                    if (context.mounted) Navigator.pop(context);
                  }
                },
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.timer_rounded, size: 16, color: AppColors.primary),
                        const SizedBox(width: 10),
                        Text(
                          _timerText,
                          style: const TextStyle(
                            fontFamily: 'Courier',
                            fontWeight: AppTypography.black,
                            fontSize: 15,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppButton(
                text: 'HOÀN THÀNH',
                onPressed: _submitExam,
                // small size
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: LinearProgressIndicator(
              value: (_currentIndex + 1) / _questions.length,
              backgroundColor: AppColors.grey300.withValues(alpha: 0.5),
              color: AppColors.primary,
              minHeight: 2,
            ),
          ),
        ),
        body: AppBackground(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CÂU ${_currentIndex + 1} / ${_questions.length}',
                        style: const TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textTertiary),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        _questions[_currentIndex].text,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: AppTypography.extraBold,
                          fontSize: 24,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 40),
                      ...List.generate(
                        _questions[_currentIndex].options.length,
                        (index) => EntryAnimation(
                          index: index,
                          child: _OptionCard(
                            text: _questions[_currentIndex].options[index],
                            isSelected: _answers[_currentIndex] == index,
                            onTap: () {
                              setState(() {
                                _answers[_currentIndex] = index;
                              });
                            },
                            index: index,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: MediaQuery.of(context).padding.bottom + 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.card)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.05),
                      blurRadius: 30,
                      offset: const Offset(0, -10),
                    ),
                  ],
                  border: Border(top: BorderSide(color: AppColors.grey300.withValues(alpha: 0.3))),
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _NavButton(
                        icon: Icons.chevron_left_rounded,
                        label: 'CÂU TRƯỚC',
                        onPressed: _currentIndex > 0 ? () => setState(() => _currentIndex--) : null,
                      ),
                      _NavButton(
                        icon: Icons.chevron_right_rounded,
                        label: _currentIndex < _questions.length - 1 ? 'TIẾP THEO' : 'NỘP BÀI',
                        isPrimary: true,
                        onPressed: () {
                          if (_currentIndex < _questions.length - 1) {
                            setState(() => _currentIndex++);
                          } else {
                            _submitExam();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _showExitDialog() async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hủy bỏ làm bài?', style: TextStyle(fontWeight: AppTypography.black)),
        content: const Text('Tiến trình làm bài hiện tại của bạn sẽ bị xóa bỏ.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('TIẾP TỤC')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('HỦY BỎ', style: TextStyle(color: AppColors.error))),
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
        title: const Text('HOÀN THÀNH 🎉', style: TextStyle(fontWeight: AppTypography.black)),
        content: Text('Bạn đã hoàn thành ${_answers.length} trên tổng số ${_questions.length} câu hỏi.'),
        actions: [
          AppButton(
            text: 'QUAY LẠI',
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
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
  final int index;

  const _OptionCard({required this.text, required this.isSelected, required this.onTap, required this.index});

  @override
  Widget build(BuildContext context) {
    final letters = ['A', 'B', 'C', 'D'];
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary.withValues(alpha: 0.05) : Colors.white.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.grey300.withValues(alpha: 0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : AppColors.primary.withValues(alpha: 0.02),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.background,
                  shape: BoxShape.circle,
                  border: Border.all(color: isSelected ? AppColors.primary : AppColors.grey300, width: 1),
                ),
                child: Center(
                  child: Text(
                    letters[index % 4],
                    style: TextStyle(color: isSelected ? Colors.white : AppColors.textTertiary, fontWeight: AppTypography.black, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? AppTypography.bold : AppTypography.medium,
                    color: isSelected ? AppColors.primary : AppColors.textPrimary,
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

class _NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final bool isPrimary;

  const _NavButton({required this.icon, required this.label, this.onPressed, this.isPrimary = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            if (!isPrimary) Icon(icon, size: 20, color: onPressed == null ? AppColors.textTertiary : AppColors.textPrimary),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: AppTypography.black,
                letterSpacing: 1.0,
                color: isPrimary ? Colors.white : (onPressed == null ? AppColors.textTertiary : AppColors.textPrimary),
              ),
            ),
            const SizedBox(width: 8),
            if (isPrimary) Icon(icon, size: 20, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
