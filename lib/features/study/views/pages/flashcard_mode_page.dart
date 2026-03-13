import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../providers/study_providers.dart';

class FlashcardModePage extends ConsumerStatefulWidget {
  final String setId;
  const FlashcardModePage({super.key, required this.setId});

  @override
  ConsumerState<FlashcardModePage> createState() => _FlashcardModePageState();
}

class _FlashcardModePageState extends ConsumerState<FlashcardModePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _isFlipped = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() => _isFlipped = !_isFlipped);
  }

  void _nextCard() {
    final studySets = ref.read(studySetsProvider).value;
    final set = studySets?.firstWhere((s) => s.id == widget.setId);
    if (set != null && _currentIndex < (set.setCards?.length ?? 0) - 1) {
      setState(() {
        _currentIndex++;
        _isFlipped = false;
        _controller.reset();
      });
    } else {
      // Show completion
      _showCompletion();
    }
  }

  void _showCompletion() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Hoàn thành!'),
        content: const Text('Bạn đã hoàn thành bộ thẻ này.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.pop();
            },
            child: const Text('Về danh sách'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final studySets = ref.watch(studySetsProvider).value;
    final set = studySets?.firstWhere((s) => s.id == widget.setId);
    final card = set?.setCards?[_currentIndex];

    if (card == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(
          '${_currentIndex + 1} / ${set!.cardCount}',
          style: const TextStyle(fontSize: 14, fontWeight: AppTypography.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.full),
              child: LinearProgressIndicator(
                value: (_currentIndex + 1) / set.cardCount,
                backgroundColor: AppColors.grey200,
                color: AppColors.primary,
                minHeight: 6,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: _flipCard,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                final angle = _animation.value * math.pi;
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(angle),
                  alignment: Alignment.center,
                  child: angle < math.pi / 2
                      ? _buildCardSide(card.term, card.hint, isFront: true)
                      : Transform(
                          transform: Matrix4.identity()..rotateY(math.pi),
                          alignment: Alignment.center,
                          child: _buildCardSide(card.definition, null, isFront: false),
                        ),
                );
              },
            ),
          ),
          const Spacer(),
          if (_isFlipped)
            EntryAnimation(
              index: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.xl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRateButton('Quên', AppColors.error, () => _nextCard()),
                    _buildRateButton('Khó', AppColors.warning, () => _nextCard()),
                    _buildRateButton('Tốt', AppColors.primary, () => _nextCard()),
                    _buildRateButton('Dễ', AppColors.success, () => _nextCard()),
                  ],
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
              child: Text(
                 'Chạm để lật thẻ',
                 style: TextStyle(color: AppColors.textTertiary, fontSize: 13),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCardSide(String text, String? hint, {required bool isFront}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 450,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: AppElevation.mediumShadow,
        border: Border.all(color: AppColors.grey200.withValues(alpha: 0.5)),
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (hint != null && isFront)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        hint,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.primary.withValues(alpha: 0.7),
                          fontFamily: AppTypography.fontFamilyJapanese,
                        ),
                      ),
                    ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isFront ? 48 : 32,
                      fontWeight: AppTypography.bold,
                      fontFamily: isFront ? AppTypography.fontFamilyJapanese : AppTypography.fontFamily,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: Icon(
                isFront ? Icons.flip_rounded : Icons.check_circle_outline_rounded,
                color: AppColors.grey300,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRateButton(String label, Color color, VoidCallback onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
              border: Border.all(color: color.withValues(alpha: 0.2)),
            ),
            child: Icon(Icons.sentiment_satisfied_alt_rounded, color: color),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: AppTypography.bold, color: color),
        ),
      ],
    );
  }
}
