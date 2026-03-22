import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/study_set_models.dart';

class StudySetPracticeScreen extends ConsumerStatefulWidget {
  final String setId;
  const StudySetPracticeScreen({super.key, required this.setId});

  @override
  ConsumerState<StudySetPracticeScreen> createState() => _StudySetPracticeScreenState();
}

class _StudySetPracticeScreenState extends ConsumerState<StudySetPracticeScreen> {
  late final PageController _pageController;
  int _index = 0;
  bool _autoSpeak = true;
  bool _busy = false;
  bool _sessionComplete = false;
  bool _scheduledInitialSpeak = false;
  final Map<int, bool> _flippedByIndex = {};
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);
    _initTts();
  }

  Future<void> _initTts() async {
    await _tts.setLanguage('ja-JP');
    await _tts.setSpeechRate(0.45);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tts.stop();
    super.dispose();
  }

  Future<void> _speak(String text) async {
    if (!_autoSpeak) return;
    if (text.trim().isEmpty) return;
    await _tts.stop();
    await _tts.speak(text);
  }

  void _onPageChanged(int i, List<SetCardModel> cards) {
    setState(() => _index = i);
    if (i >= 0 && i < cards.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _speak(cards[i].term);
      });
    }
  }

  Future<void> _review(SetCardModel card, int quality, int total) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await ref.read(academyRepositoryProvider).reviewStudyCard(card.id, quality: quality);
    } catch (_) {}
    if (!mounted) return;
    HapticFeedback.lightImpact();
    final isLast = _index >= total - 1;
    setState(() {
      _busy = false;
      if (isLast) _sessionComplete = true;
    });
    if (!isLast) {
      await _pageController.nextPage(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void _restartSession() {
    setState(() {
      _sessionComplete = false;
      _index = 0;
      _scheduledInitialSpeak = false;
    });
    _pageController.jumpToPage(0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardsAsync = ref.watch(studyCardsProvider(widget.setId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Flashcard',
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => setState(() => _autoSpeak = !_autoSpeak),
            icon: Icon(_autoSpeak ? Icons.volume_up_rounded : Icons.volume_off_rounded),
            tooltip: 'Âm thanh',
          ),
        ],
      ),
      body: cardsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e', style: const TextStyle(color: AppColors.error))),
        data: (cards) {
          if (cards.isEmpty) {
            return const Center(
              child: Text(
                'Không có thẻ để luyện tập.',
                style: TextStyle(color: AppColors.textTertiary),
              ),
            );
          }
          if (_sessionComplete) {
            return _DoneView(onRestart: _restartSession);
          }

          if (!_scheduledInitialSpeak && cards.isNotEmpty) {
            _scheduledInitialSpeak = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) _speak(cards[0].term);
            });
          }

          final bottomPadding = MediaQuery.of(context).padding.bottom;
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 16 + bottomPadding),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _ProgressBar(current: _index + 1, total: cards.length),
                ),
                const SizedBox(height: 8),
                Text(
                  'Vuốt ngang để đổi thẻ • Chạm thẻ để lật',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.textTertiary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: cards.length,
                    onPageChanged: (i) => _onPageChanged(i, cards),
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: _FlipFlashcard(
                          key: ValueKey(cards[i].id),
                          card: cards[i],
                          autoSpeak: _autoSpeak,
                          onSpeak: _speak,
                          onFlipChanged: (flipped) => setState(() => _flippedByIndex[i] = flipped),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 56,
                  child: _flippedByIndex[_index] == true
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 48,
                                    child: OutlinedButton(
                                      onPressed: _busy ? null : () => _review(cards[_index], 0, cards.length),
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: AppColors.error,
                                        side: BorderSide(color: AppColors.error.withValues(alpha: 0.55)),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                      ),
                                      child: const Text('Chưa nhớ', style: TextStyle(fontWeight: FontWeight.w900)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: SizedBox(
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: _busy ? null : () => _review(cards[_index], 1, cards.length),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.success,
                                        foregroundColor: AppColors.textOnPrimary,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                      ),
                                      child: const Text('Đã nhớ', style: TextStyle(fontWeight: FontWeight.w900)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Thẻ 3D: tap để lật (rotateY), hai mặt front/back.
class _FlipFlashcard extends StatefulWidget {
  final SetCardModel card;
  final bool autoSpeak;
  final Future<void> Function(String text) onSpeak;
  final void Function(bool isFlipped)? onFlipChanged;

  const _FlipFlashcard({
    super.key,
    required this.card,
    required this.autoSpeak,
    required this.onSpeak,
    this.onFlipChanged,
  });

  @override
  State<_FlipFlashcard> createState() => _FlipFlashcardState();
}

class _FlipFlashcardState extends State<_FlipFlashcard> with SingleTickerProviderStateMixin {
  late AnimationController _flipCtrl;
  late Animation<double> _turn;

  @override
  void initState() {
    super.initState();
    _flipCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 420));
    _turn = CurvedAnimation(parent: _flipCtrl, curve: Curves.easeInOutCubic);
    _turn.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _flipCtrl.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _FlipFlashcard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.card.id != widget.card.id) {
      _flipCtrl.value = 0;
    }
  }

  Future<void> _toggleFlip() async {
    HapticFeedback.selectionClick();
    if (_flipCtrl.isAnimating) return;
    if (_flipCtrl.value < 0.5) {
      await _flipCtrl.forward();
      widget.onFlipChanged?.call(true);
      if (widget.autoSpeak) await widget.onSpeak(widget.card.definition);
    } else {
      await _flipCtrl.reverse();
      widget.onFlipChanged?.call(false);
      if (widget.autoSpeak) await widget.onSpeak(widget.card.term);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final angle = _turn.value * math.pi;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Material(
            color: Colors.transparent,
            elevation: 8,
            shadowColor: Colors.black.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(28),
            child: InkWell(
              onTap: _toggleFlip,
              borderRadius: BorderRadius.circular(28),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0012)
                    ..rotateY(angle),
                  child: angle < math.pi / 2
                      ? _CardFace(label: 'Thuật ngữ', labelColor: AppColors.primary, child: _buildFront(theme))
                      : Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..rotateY(math.pi),
                          child: _CardFace(label: 'Nghĩa', labelColor: AppColors.success, child: _buildBack(theme)),
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFront(ThemeData theme) {
    final hint = (widget.card.hint ?? '').trim();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.card.term,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w900,
            height: 1.2,
            letterSpacing: -0.3,
          ),
        ),
        if (hint.isNotEmpty) ...[
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              hint,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.35,
              ),
            ),
          ),
        ],
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flip_rounded, size: 18, color: AppColors.textTertiary.withValues(alpha: 0.9)),
            const SizedBox(width: 8),
            Text(
              'Chạm để lật thẻ',
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColors.textTertiary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBack(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.card.definition,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 20),
        IconButton(
          onPressed: () => widget.onSpeak(widget.card.definition),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.success.withValues(alpha: 0.15),
            foregroundColor: AppColors.success,
          ),
          icon: const Icon(Icons.volume_up_rounded, size: 22),
        ),
      ],
    );
  }
}

class _CardFace extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Widget child;

  const _CardFace({
    required this.label,
    required this.labelColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.grey300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(27),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 22, 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: labelColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          label.toUpperCase(),
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                            color: labelColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Center(child: SingleChildScrollView(child: child))),
                ],
              ),
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final int current;
  final int total;
  const _ProgressBar({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    final ratio = total == 0 ? 0.0 : current / total;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$current/$total',
              style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.textSecondary),
            ),
            Text(
              '${(ratio * 100).toInt()}%',
              style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.textSecondary),
            ),
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

class _DoneView extends StatelessWidget {
  final VoidCallback onRestart;
  const _DoneView({required this.onRestart});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                color: AppColors.success.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 40),
            ),
            const SizedBox(height: 14),
            Text(
              'Hoàn thành!',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 6),
            Text(
              'Tốt lắm. Tiếp tục duy trì streak mỗi ngày nhé.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary, height: 1.35),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textOnPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: const Text('Luyện lại', style: TextStyle(fontWeight: FontWeight.w900)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
