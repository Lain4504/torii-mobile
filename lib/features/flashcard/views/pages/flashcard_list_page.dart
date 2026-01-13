import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/flashcard_model.dart';

/// Flashcard List Page - Premium Deck Interface
class FlashcardListPage extends StatelessWidget {
  const FlashcardListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Mock Data
    final decks = [
      const FlashcardDeck(
        id: '1', 
        title: 'JLPT N5 Lexicon', 
        description: 'Primary linguistic building blocks', 
        totalCards: 100, 
        learnedCards: 45,
        emoji: '🌱',
      ),
      const FlashcardDeck(
        id: '2', 
        title: 'Fundamental Kanji', 
        description: 'The first century of characters', 
        totalCards: 100, 
        learnedCards: 12,
        emoji: '字',
      ),
      const FlashcardDeck(
        id: '3', 
        title: 'Protocol Greetings', 
        description: 'Essential social synchronization', 
        totalCards: 50, 
        learnedCards: 50,
        emoji: '🗣️',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 140,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        'PRACTICE_DECKS',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: AppTypography.black,
                          letterSpacing: 3.0,
                          color: AppColors.primary.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Flashcard Sets',
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamilySerif,
                          fontWeight: AppTypography.bold,
                          fontSize: 32,
                          letterSpacing: -1.0,
                          fontStyle: FontStyle.italic,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.search_rounded, size: 20, color: AppColors.textPrimary),
                    ),
                  ),
                ),
              ],
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                      child: EntryAnimation(
                        index: index % 5,
                        verticalOffset: 20,
                        child: _DeckCard(deck: decks[index]),
                      ),
                    );
                  },
                  childCount: decks.length,
                ),
              ),
            ),
            
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 8),
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: AppColors.primary,
          elevation: 12,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.full)),
          icon: const Icon(Icons.add_rounded, color: Colors.white, size: 20),
          label: const Text(
            'NEW DECK',
            style: TextStyle(
              color: Colors.white, 
              fontWeight: AppTypography.black, 
              letterSpacing: 1.5, 
              fontSize: 10,
            ),
          ),
        ),
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
    final progress = deck.progress;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.03),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => context.push('/flashcards/practice', extra: deck),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: AppColors.primarySurface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
                        ),
                        child: Center(
                          child: Text(
                            deck.emoji ?? '📝',
                            style: const TextStyle(fontSize: 28),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              deck.title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: AppTypography.extraBold,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              deck.description,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.textTertiary,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                _StatLabel(
                                  label: '${(progress * 100).toInt()}% SYNCED',
                                  color: AppColors.primary,
                                ),
                                const SizedBox(width: 12),
                                _StatLabel(
                                  label: '${deck.totalCards} NODES',
                                  color: AppColors.textTertiary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded, color: AppColors.textTertiary, size: 24),
                    ],
                  ),
                ),
                if (progress > 0)
                  Container(
                    height: 3,
                    width: double.infinity,
                    color: AppColors.grey300.withValues(alpha: 0.2),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: progress,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          boxShadow: [
                            BoxShadow(color: AppColors.primary.withValues(alpha: 0.3), blurRadius: 4),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatLabel extends StatelessWidget {
  final String label;
  final Color color;

  const _StatLabel({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final isPrimary = color == AppColors.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isPrimary ? color.withValues(alpha: 0.1) : AppColors.primary.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: (isPrimary ? color : AppColors.grey300).withValues(alpha: 0.15)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 9,
          fontWeight: AppTypography.black,
          letterSpacing: 1.0,
          color: isPrimary ? color : AppColors.textTertiary,
        ),
      ),
    );
  }
}
