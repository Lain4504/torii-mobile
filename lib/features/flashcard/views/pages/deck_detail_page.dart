import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/flashcard_model.dart';
import '../../providers/flashcard_providers.dart';

class DeckDetailPage extends ConsumerWidget {
  final FlashcardDeck deck;

  const DeckDetailPage({super.key, required this.deck});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardsAsync = ref.watch(deckContentProvider(deck.id));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              pinned: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
                onPressed: () => context.pop(),
              ),
              title: Text(
                deck.title.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: AppTypography.bold,
                  letterSpacing: 1.5,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add_circle_outline_rounded, color: AppColors.primary),
                  onPressed: () => context.push('/flashcards/add-card', extra: deck),
                ),
              ],
            ),
            
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              sliver: cardsAsync.when(
                data: (cards) {
                  if (cards.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child:  Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text('No cards yet. Add one!', style: TextStyle(color: AppColors.textTertiary)),
                        ),
                      ),
                    );
                  }
                  
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                         final card = cards[index];
                         return Padding(
                           padding: const EdgeInsets.only(bottom: AppSpacing.md),
                           child: _CardItem(card: card, deck: deck),
                         );
                      },
                      childCount: cards.length,
                    ),
                  );
                },
                loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
                error: (error, stack) => SliverToBoxAdapter(child: Center(child: Text('Error: $error'))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardItem extends ConsumerWidget {
  final Flashcard card;
  final FlashcardDeck deck;

  const _CardItem({required this.card, required this.deck});

  Future<void> _deleteCard(BuildContext context, WidgetRef ref) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Card'),
        content: const Text('Permanently delete this card?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true), 
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete')
          ),
        ],
      ),
    );

    if (confirm == true) {
      final success = await ref.read(flashcardControllerProvider.notifier).deleteCard(card.id, deck.id);
      if (success) {
         // Invalidate the provider to refresh the list
         // (Handled in controller, but invalidate here is redundant but safe)
         // ref.invalidate(deckContentProvider(deck.id));
         if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Card deleted')));
         }
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.grey300.withValues(alpha: 0.5)),
        boxShadow: [
           BoxShadow(color: AppColors.grey300.withValues(alpha: 0.1), blurRadius: 4, offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.front,
                  style: const TextStyle(
                    fontSize: 16, 
                    fontWeight: AppTypography.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (card.reading != null && card.reading!.isNotEmpty)
                  Text(
                    card.reading!,
                    style: const TextStyle(fontSize: 12, color: AppColors.textTertiary),
                  ),
                const SizedBox(height: 4),
                Text(
                  card.back,
                  style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit_rounded, color: AppColors.textSecondary, size: 20),
            onPressed: () {
               context.push('/flashcards/add-card', extra: {'deck': deck, 'card': card});
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded, color: AppColors.error, size: 20),
            onPressed: () => _deleteCard(context, ref),
          ),
        ],
      ),
    );
  }
}
