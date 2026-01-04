import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/flashcard_model.dart';

/// Flashcard List Page - Deck Selection
class FlashcardListPage extends StatelessWidget {
  const FlashcardListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Mock Data
    final decks = [
      const FlashcardDeck(
        id: '1', 
        title: 'JLPT N5 Vocabulary', 
        description: 'Essential words for N5', 
        totalCards: 100, 
        learnedCards: 45,
        emoji: '🌱',
      ),
      const FlashcardDeck(
        id: '2', 
        title: 'Basic Kanji', 
        description: 'First 100 Kanji characters', 
        totalCards: 100, 
        learnedCards: 12,
        emoji: '字',
      ),
      const FlashcardDeck(
        id: '3', 
        title: 'Common Phrases', 
        description: 'Daily life greetings', 
        totalCards: 50, 
        learnedCards: 50,
        emoji: '🗣️',
      ),
      const FlashcardDeck(
        id: '4', 
        title: 'Food & Drink', 
        description: 'Restaurant vocabulary', 
        totalCards: 30, 
        learnedCards: 0,
        emoji: '🍱',
      ),
      const FlashcardDeck(
        id: '5', 
        title: 'JLPT N4 Grammar', 
        description: 'Grammar points for N4', 
        totalCards: 80, 
        learnedCards: 5,
        emoji: '📚',
      ),
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            pinned: true,
            expandedHeight: 120,
            backgroundColor: theme.scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.pageHorizontal, 
                vertical: AppSpacing.md,
              ),
              title: Text(
                'My Decks',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: AppTypography.bold,
                  color: theme.textTheme.titleLarge?.color,
                ),
              ),
              background: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(top: 60, right: 20),
                child: Opacity(
                  opacity: 0.1,
                  child: Icon(
                    Icons.style_outlined,
                    size: 80,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),

          // Deck List
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.pageHorizontal),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final deck = decks[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: EntryAnimation(
                      index: index,
                      child: _DeckCard(deck: deck),
                    ),
                  );
                },
                childCount: decks.length,
              ),
            ),
          ),
          
          // Bottom spacing
          const SliverToBoxAdapter(
            child: SizedBox(height: 80),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
    );
  }
}

class _DeckCard extends StatelessWidget {
  final FlashcardDeck deck;

  const _DeckCard({required this.deck});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final progress = deck.progress;

    return MinimalCard(
      padding: EdgeInsets.zero,
      onTap: () {
        context.push('/flashcards/practice', extra: deck);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Center(
                    child: Text(
                      deck.emoji ?? '📝',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deck.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: AppTypography.semiBold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        deck.description,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textTertiary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      
                      // Stats Row
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6, 
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.success.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(AppRadius.xs),
                            ),
                            child: Text(
                              '${deck.learnedCards} learned',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.success,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${deck.totalCards} cards',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 10,
                              color: AppColors.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Play Icon
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: AppColors.textTertiary,
                ),
              ],
            ),
          ),
          
          // Progress Bar
          if (progress > 0)
            Container(
              height: 4,
              width: double.infinity,
              color: isDark ? AppColors.surfaceVariantDark : AppColors.grey100,
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
