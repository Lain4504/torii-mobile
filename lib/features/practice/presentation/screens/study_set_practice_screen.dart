import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/study_set_models.dart';
import 'package:torii_app/core/constants/app_design_system.dart';

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
    setState(() {
      _index = i;
      _flippedByIndex[i] = false; // Reset flip on page change or keep it? Web usually resets.
    });
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
    if (isLast) {
      setState(() {
        _busy = false;
        _sessionComplete = true;
      });
    } else {
      setState(() => _busy = false);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _restart() {
    setState(() {
      _sessionComplete = false;
      _index = 0;
      _flippedByIndex.clear();
    });
    _pageController.jumpToPage(0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardsAsync = ref.watch(studyCardsProvider(widget.setId));

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Flashcard', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () => setState(() => _autoSpeak = !_autoSpeak),
            icon: Icon(_autoSpeak ? Icons.volume_up : Icons.volume_off),
            tooltip: 'Âm thanh tự động',
          ),
        ],
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
      ),
      body: cardsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
        data: (cards) {
          if (cards.isEmpty) return const Center(child: Text('Không có thẻ nào để học.'));
          if (_sessionComplete) return _FinishView(onRestart: _restart);

          return Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _ProgressBar(current: _index + 1, total: cards.length),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: cards.length,
                  physics: const NeverScrollableScrollPhysics(), // Force user to use buttons
                  onPageChanged: (i) => _onPageChanged(i, cards),
                  itemBuilder: (context, i) {
                    return _FlashcardWidget(
                      card: cards[i],
                      isFlipped: _flippedByIndex[i] ?? false,
                      onFlip: (v) {
                        setState(() => _flippedByIndex[i] = v);
                        if (v) _speak(cards[i].definition);
                      },
                      onSpeak: () => _speak(_flippedByIndex[i] == true ? cards[i].definition : cards[i].term),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              _StudyActionButtons(
                isFlipped: _flippedByIndex[_index] ?? false,
                isBusy: _busy,
                onKnown: () => _review(cards[_index], 1, cards.length),
                onUnknown: () => _review(cards[_index], 0, cards.length),
                onFlip: () {
                   final current = _flippedByIndex[_index] ?? false;
                   setState(() => _flippedByIndex[_index] = !current);
                   if (!current) _speak(cards[_index].definition);
                },
              ),
              const SizedBox(height: 32),
            ],
          );
        },
      ),
    );
  }
}

class _FlashcardWidget extends StatefulWidget {
  final SetCardModel card;
  final bool isFlipped;
  final ValueChanged<bool> onFlip;
  final VoidCallback onSpeak;

  const _FlashcardWidget({
    required this.card,
    required this.isFlipped,
    required this.onFlip,
    required this.onSpeak,
  });

  @override
  State<_FlashcardWidget> createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<_FlashcardWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _anim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOutCubic));
    if (widget.isFlipped) _ctrl.value = 1.0;
  }

  @override
  void didUpdateWidget(_FlashcardWidget old) {
    super.didUpdateWidget(old);
    if (widget.isFlipped != old.isFlipped) {
      if (widget.isFlipped) _ctrl.forward(); else _ctrl.reverse();
    }
    // Handle card change (PageView)
    if (widget.card.id != old.card.id && !widget.isFlipped) {
      _ctrl.value = 0.0;
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        final double angle = _anim.value * math.pi;
        final bool isBack = angle > math.pi / 2;

        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GestureDetector(
              onTap: () => widget.onFlip(!widget.isFlipped),
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(angle),
                alignment: Alignment.center,
                child: isBack
                    ? Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateY(math.pi),
                        child: _CardSide(
                          title: 'Giải nghĩa',
                          text: widget.card.definition,
                          color: const Color(0xFF2563EB),
                          onSpeak: widget.onSpeak,
                        ),
                      )
                    : _CardSide(
                        title: 'Thuật ngữ',
                        text: widget.card.term,
                        hint: widget.card.hint,
                        color: theme.colorScheme.primary,
                        onSpeak: widget.onSpeak,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CardSide extends StatelessWidget {
  final String title;
  final String text;
  final String? hint;
  final Color color;
  final VoidCallback onSpeak;

  const _CardSide({
    required this.title,
    required this.text,
    this.hint,
    required this.color,
    required this.onSpeak,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: theme.colorScheme.outlineVariant, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 24,
            left: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                title.toUpperCase(),
                style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 10, letterSpacing: 1),
              ),
            ),
          ),
          Positioned(
             top: 16,
             right: 16,
             child: IconButton(
               onPressed: () {
                 onSpeak();
               },
               icon: const Icon(Icons.volume_up_rounded),
               color: color,
             ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  if (hint != null && hint!.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Text(
                      hint!,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Text(
              'Chạm để lật thẻ',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ],
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
    final theme = Theme.of(context);
    final ratio = total == 0 ? 0.0 : current / total;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$current/$total', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            Text('${(ratio * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: ratio,
            minHeight: 8,
            backgroundColor: theme.colorScheme.outlineVariant,
            valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

class _StudyActionButtons extends StatelessWidget {
  final bool isFlipped;
  final bool isBusy;
  final VoidCallback onKnown;
  final VoidCallback onUnknown;
  final VoidCallback onFlip;

  const _StudyActionButtons({
    required this.isFlipped,
    required this.isBusy,
    required this.onKnown,
    required this.onUnknown,
    required this.onFlip,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    if (!isFlipped) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: onFlip,
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
            ),
            child: const Text('Xem nghĩa', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 56,
              child: OutlinedButton(
                onPressed: isBusy ? null : onUnknown,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Chưa nhớ', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: isBusy ? null : onKnown,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3BB25E),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: const Text('Đã nhớ', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FinishView extends StatelessWidget {
  final VoidCallback onRestart;
  const _FinishView({required this.onRestart});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Icon(Icons.check_circle_outline, size: 80, color: Color(0xFF3BB25E)),
             const SizedBox(height: 24),
             const Text('Hoàn thành!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
             const SizedBox(height: 12),
             const Text('Bạn đã xem hết các thẻ trong bộ nhớ này.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
             const SizedBox(height: 32),
             ElevatedButton(
               onPressed: onRestart,
               style: ElevatedButton.styleFrom(
                 padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
               ),
               child: const Text('Luyện tập lại'),
             ),
             TextButton(onPressed: () => Navigator.pop(context), child: const Text('Về bảng điều khiển')),
          ],
        ),
      ),
    );
  }
}
