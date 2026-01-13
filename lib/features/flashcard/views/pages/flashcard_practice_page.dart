import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../models/flashcard_model.dart';
import '../../../../core/widgets/widgets.dart';

/// Flashcard Practice Page - Premium Spaced Repetition Interface
class FlashcardPracticePage extends StatefulWidget {
  final FlashcardDeck? deck;

  const FlashcardPracticePage({super.key, this.deck});

  @override
  State<FlashcardPracticePage> createState() => _FlashcardPracticePageState();
}

class _FlashcardPracticePageState extends State<FlashcardPracticePage> {
  int _currentIndex = 0;
  bool _isFlipped = false;
  late final List<Flashcard> _cards;

  @override
  void initState() {
    super.initState();
    _cards = _getMockCards(widget.deck?.id);
  }

  List<Flashcard> _getMockCards(String? deckId) {
    return [
      const Flashcard(id: '1', front: 'こんにちは', back: 'Hello / Good Afternoon', reading: 'konnichiwa'),
      const Flashcard(id: '2', front: 'ありがとう', back: 'Thank you', reading: 'arigatou'),
      const Flashcard(id: '3', front: '猫', back: 'Cat', reading: 'neko'),
      const Flashcard(id: '4', front: '犬', back: 'Dog', reading: 'inu'),
      const Flashcard(id: '5', front: '水', back: 'Water', reading: 'mizu'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              (widget.deck?.title ?? 'SESSION').toUpperCase(),
              style: const TextStyle(fontSize: 12, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.primary),
            ),
            const SizedBox(height: 4),
            Text(
              '${_currentIndex + 1} / ${_cards.length} NODES',
              style: const TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 1.0, color: AppColors.textTertiary),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded, size: 20, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: ZenBackground(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 2,
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.borderLight.withOpacity(0.5), borderRadius: BorderRadius.circular(1)),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: (_currentIndex + 1) / _cards.length,
                  child: Container(decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(1))),
                ),
              ),
            ),
            
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _isFlipped = !_isFlipped),
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: _buildCard(theme, isDark),
                  ),
                ),
              ),
            ),

            _buildControls(theme, isDark),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(ThemeData theme, bool isDark) {
    final card = _cards[_currentIndex];
    
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: ScaleTransition(scale: animation, child: child));
      },
      child: Container(
        key: ValueKey('$_currentIndex-$_isFlipped'),
        constraints: const BoxConstraints(minHeight: 400, minWidth: double.infinity),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.borderLight.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 40, offset: const Offset(0, 20)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _isFlipped ? AppColors.accent.withOpacity(0.1) : AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppRadius.full),
                border: Border.all(color: (_isFlipped ? AppColors.accent : AppColors.primary).withOpacity(0.2)),
              ),
              child: Text(
                (_isFlipped ? 'SYNTHESIS' : 'STIMULUS').toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: AppTypography.black,
                  letterSpacing: 2.0,
                  color: _isFlipped ? AppColors.accentDark : AppColors.primary,
                ),
              ),
            ),

            Text(
              _isFlipped ? card.back : card.front,
              style: TextStyle(
                fontFamily: _isFlipped ? AppTypography.fontFamilySerif : theme.textTheme.headlineLarge?.fontFamily,
                fontSize: _isFlipped ? 32 : 54,
                fontWeight: AppTypography.black,
                height: 1.2,
                fontStyle: _isFlipped ? FontStyle.italic : FontStyle.normal,
              ),
              textAlign: TextAlign.center,
            ),
            
            if (!_isFlipped && card.reading != null) ...[
              const SizedBox(height: 24),
              Text(
                card.reading!,
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.textTertiary,
                  fontWeight: AppTypography.medium,
                  letterSpacing: 0.5,
                ),
              ),
            ],

            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.flip_rounded, size: 14, color: AppColors.textTertiary),
                const SizedBox(width: 8),
                Text(
                  'TAP TO FLIP'.toUpperCase(),
                  style: const TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textTertiary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControls(ThemeData theme, bool isDark) {
    if (!_isFlipped) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ZenButton(
          text: 'REVEAL TRUTH',
          onPressed: () => setState(() => _isFlipped = true),
          isFullWidth: true,
        ),
      );
    }

    return EntryAnimation(
      verticalOffset: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _ResponseButton(label: 'RETRY', color: AppColors.error, onTap: _nextCard)),
                const SizedBox(width: 12),
                Expanded(child: _ResponseButton(label: 'CHALLENGING', color: AppColors.warning, onTap: _nextCard)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _ResponseButton(label: 'COHERENT', color: AppColors.primary, onTap: _nextCard)),
                const SizedBox(width: 12),
                Expanded(child: _ResponseButton(label: 'MASTERED', color: AppColors.success, onTap: _nextCard)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _nextCard() {
    if (_currentIndex < _cards.length - 1) {
      setState(() {
        _currentIndex++;
        _isFlipped = false;
      });
    } else {
      Navigator.pop(context);
    }
  }
}

class _ResponseButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ResponseButton({required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.full),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppRadius.full),
          border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        ),
        child: Center(
          child: Text(
            label.toUpperCase(),
            style: TextStyle(color: color, fontWeight: AppTypography.black, fontSize: 11, letterSpacing: 2.0),
          ),
        ),
      ),
    );
  }
}
