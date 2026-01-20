import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../models/flashcard_model.dart';
import '../../../../core/widgets/widgets.dart';
import '../../providers/flashcard_providers.dart';

/// Flashcard Practice Page - Premium Spaced Repetition Interface
class FlashcardPracticePage extends ConsumerStatefulWidget {
  final FlashcardDeck? deck;

  const FlashcardPracticePage({super.key, this.deck});

  @override
  ConsumerState<FlashcardPracticePage> createState() => _FlashcardPracticePageState();
}

class _FlashcardPracticePageState extends ConsumerState<FlashcardPracticePage> {
  int _currentIndex = 0;
  bool _isFlipped = false;
  List<Flashcard> _cards = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  Future<void> _loadCards() async {
    if (widget.deck == null) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }
    
    // Fetch ALL cards for the deck (not just due cards)
    // This allows users to practice the same deck multiple times
    try {
      final repository = ref.read(flashcardRepositoryProvider);
      final cards = await repository.getDeckCards(widget.deck!.id);
      if (mounted) {
        setState(() {
          _cards = cards;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_cards.isEmpty) {
      return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No cards in this deck yet!'),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Go Back'),
              )
            ],
          ),
        ),
      );
    }

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
                decoration: BoxDecoration(color: AppColors.grey300.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(1)),
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
    // Show completion screen when all cards are done
    if (_currentIndex >= _cards.length) {
      return _buildCompletionScreen(theme, isDark);
    }
    
    final card = _cards[_currentIndex];
    
    // Use Getters from the Refactored Model (front, back, reading)
    // Model has: frontText, backText. Getters map front->frontText.
    final frontText = card.front; 
    final backText = card.back;
    final readingText = card.reading;

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
          color: Colors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.grey300.withValues(alpha: 0.5)),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 40, offset: const Offset(0, 20)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _isFlipped ? AppColors.accent.withValues(alpha: 0.1) : AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppRadius.full),
                border: Border.all(color: (_isFlipped ? AppColors.accent : AppColors.primary).withValues(alpha: 0.2)),
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
              _isFlipped ? backText : frontText,
              style: TextStyle(
                // Replaced fontFamilySans with fontFamily
                fontFamily: _isFlipped ? AppTypography.fontFamilySerif : AppTypography.fontFamily,
                fontSize: _isFlipped ? 32 : 54,
                fontWeight: AppTypography.black,
                height: 1.2,
                fontStyle: _isFlipped ? FontStyle.italic : FontStyle.normal,
              ),
              textAlign: TextAlign.center,
            ),
            
            if (!_isFlipped && readingText != null) ...[
              const SizedBox(height: 24),
              Text(
                readingText,
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

  Widget _buildCompletionScreen(ThemeData theme, bool isDark) {
    return Container(
      constraints: const BoxConstraints(minHeight: 400, minWidth: double.infinity),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.grey300.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 40, offset: const Offset(0, 20)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Success Icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.success.withValues(alpha: 0.2), width: 2),
            ),
            child: const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 48),
          ),
          
          const SizedBox(height: 32),
          
          // Completion Message
          Text(
            'SESSION COMPLETE',
            style: TextStyle(
              fontSize: 12,
              fontWeight: AppTypography.black,
              letterSpacing: 3.0,
              color: AppColors.success.withValues(alpha: 0.8),
            ),
          ),
          
          const SizedBox(height: 12),
          
          Text(
            'Well Done!',
            style: const TextStyle(
              fontFamily: AppTypography.fontFamilySerif,
              fontSize: 36,
              fontWeight: AppTypography.black,
              fontStyle: FontStyle.italic,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'You\'ve completed all ${_cards.length} cards in this deck.',
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.textTertiary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 48),
          
          // Action Buttons
          Column(
            children: [
              // Learn Again Button (Primary)
              SizedBox(
                width: double.infinity,
                child: ZenButton(
                  text: 'LEARN AGAIN',
                  onPressed: _restartSession,
                  icon: Icons.refresh_rounded,
                  isFullWidth: true,
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Back Button (Secondary)
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    ref.invalidate(flashcardDecksProvider);
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(AppRadius.full),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      color: AppColors.grey300.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3), width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.arrow_back_rounded, color: AppColors.textSecondary, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          'BACK TO DECKS',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontWeight: AppTypography.black,
                            fontSize: 11,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildControls(ThemeData theme, bool isDark) {
    // Hide controls when session is complete
    if (_currentIndex >= _cards.length) {
      return const SizedBox.shrink();
    }
    
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

    // Quality: 0=Retry (Forgot), 3=Hard, 4=Good, 5=Easy
    // Logic: 0->Again, 3->Hard, 4->Good, 5->Easy
    // Service.submitProgress handles mapping these ints to Enum Strings.
    return EntryAnimation(
      verticalOffset: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _ResponseButton(label: 'RETRY', color: AppColors.error, onTap: () => _handleResponse(0))),
                const SizedBox(width: 12),
                Expanded(child: _ResponseButton(label: 'CHALLENGING', color: AppColors.warning, onTap: () => _handleResponse(3))),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _ResponseButton(label: 'COHERENT', color: AppColors.primary, onTap: () => _handleResponse(4))),
                const SizedBox(width: 12),
                Expanded(child: _ResponseButton(label: 'MASTERED', color: AppColors.success, onTap: () => _handleResponse(5))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleResponse(int quality) async {
    if (_currentIndex < _cards.length) {
      final card = _cards[_currentIndex];
      // Fire and forget progress update
      await ref.read(flashcardControllerProvider.notifier).submitProgress(card.id, quality);
    }
    
    _nextCard();
  }

  void _nextCard() {
    if (_currentIndex < _cards.length - 1) {
      setState(() {
        _currentIndex++;
        _isFlipped = false;
      });
    } else {
      // Show completion screen instead of auto-redirect
      setState(() {
        _currentIndex++; // Move past last card to trigger completion UI
      });
    }
  }

  void _restartSession() {
    setState(() {
      // Shuffle cards for variety
      _cards.shuffle();
      _currentIndex = 0;
      _isFlipped = false;
    });
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
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppRadius.full),
          border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
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
