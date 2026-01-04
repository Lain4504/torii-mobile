import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../models/flashcard_model.dart';

/// Flashcard Practice Page - Spaced Repetition Interface
class FlashcardPracticePage extends StatefulWidget {
  final FlashcardDeck? deck;

  const FlashcardPracticePage({super.key, this.deck});

  @override
  State<FlashcardPracticePage> createState() => _FlashcardPracticePageState();
}

class _FlashcardPracticePageState extends State<FlashcardPracticePage> {
  int _currentIndex = 0;
  bool _isFlipped = false;
  
  // Mock Cards based on deck (in real app, fetch from ID)
  late final List<Flashcard> _cards;

  @override
  void initState() {
    super.initState();
    _cards = _getMockCards(widget.deck?.id);
  }

  List<Flashcard> _getMockCards(String? deckId) {
    // Return different cards based on deck, or default set
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
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              widget.deck?.title ?? 'Practice',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: AppTypography.bold,
              ),
            ),
            if (widget.deck != null)
              Text(
                '${_currentIndex + 1} / ${_cards.length}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textTertiary,
                ),
              ),
          ],
        ),
        centerTitle: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Bar
          LinearProgressIndicator(
            value: (_currentIndex + 1) / _cards.length,
            backgroundColor: isDark ? AppColors.surfaceVariantDark : AppColors.grey100,
            color: AppColors.primary,
            minHeight: 2,
          ),
          
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _isFlipped = !_isFlipped),
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: _buildCard(theme, isDark),
                ),
              ),
            ),
          ),

          // Controls
          _buildControls(theme, isDark),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Widget _buildCard(ThemeData theme, bool isDark) {
    final card = _cards[_currentIndex];
    
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        final rotate = Tween(begin: 3.14, end: 0.0).animate(animation);
        return AnimatedBuilder(
          animation: rotate,
          builder: (context, child) {
            // Simple fade/scale for "Zen" feel instead of heavy 3D flip which can glitch
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(scale: animation, child: child),
            );
          },
          child: child,
        );
      },
      layoutBuilder: (currentChild, previousChildren) => currentChild!,
      child: Container(
        key: ValueKey('$_currentIndex-$_isFlipped'),
        constraints: const BoxConstraints(minHeight: 320, minWidth: double.infinity),
        padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black26 : Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             // Hint / Label
            Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.xl),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _isFlipped ? AppColors.accentSurface : AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Text(
                _isFlipped ? 'Meaning' : 'Vocabulary',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: _isFlipped ? AppColors.accentDark : AppColors.textSecondary,
                ),
              ),
            ),

            // Main Text
            Text(
              _isFlipped ? card.back : card.front,
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: _isFlipped ? 32 : 48,
                fontWeight: AppTypography.bold,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            
            // Reading (only front)
            if (!_isFlipped && card.reading != null) ...[
              const SizedBox(height: AppSpacing.lg),
              Text(
                card.reading!,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],

            // Tap hint
            const SizedBox(height: 60),
            Text(
              'Tap card to flip',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControls(ThemeData theme, bool isDark) {
    if (!_isFlipped) {
      // Show "Show Answer" button or just empty to force tap?
      // "Zen" usually implies forcing interaction.
      // But we can show a "Flip" button for accessibility.
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.md),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () => setState(() => _isFlipped = true),
            style: ElevatedButton.styleFrom(
              backgroundColor: isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant,
              foregroundColor: theme.textTheme.bodyLarge?.color,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
            ),
            child: const Text('Show Answer'),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _ResponseButton(
                  label: 'Again',
                  color: AppColors.error,
                  icon: Icons.refresh_rounded,
                  onTap: _nextCard,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _ResponseButton(
                  label: 'Hard',
                  color: AppColors.warning,
                  icon: Icons.warning_amber_rounded,
                  onTap: _nextCard,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: _ResponseButton(
                  label: 'Good',
                  color: AppColors.primary, // Teal
                  icon: Icons.thumb_up_off_alt_rounded,
                  onTap: _nextCard,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _ResponseButton(
                  label: 'Easy',
                  color: AppColors.success,
                  icon: Icons.sentiment_very_satisfied_rounded,
                  onTap: _nextCard,
                ),
              ),
            ],
          ),
        ],
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
      Navigator.pop(context); // Or show summary
    }
  }
}

class _ResponseButton extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  const _ResponseButton({
    required this.label,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(
            color: color.withValues(alpha: 0.3),
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
