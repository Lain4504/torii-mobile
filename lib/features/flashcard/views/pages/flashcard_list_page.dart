import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/flashcard_model.dart';
import '../../providers/flashcard_providers.dart';

/// Flashcard List Page - Premium Deck Interface
// ... imports

class FlashcardListPage extends ConsumerWidget {
  const FlashcardListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final decksAsync = ref.watch(flashcardDecksProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
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
                        'BỘ THẺ HỌC',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: AppTypography.black,
                          letterSpacing: 3.0,
                          color: AppColors.primary.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Bộ Thẻ Ghi Nhớ',
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
                IconButton(
                   icon: const Icon(Icons.refresh_rounded, color: AppColors.textPrimary),
                   onPressed: () => ref.refresh(flashcardDecksProvider),
                ),
              ],
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
              sliver: decksAsync.when(
                data: (decks) {
                  if (decks.isEmpty) {
                    return SliverToBoxAdapter(
                      child: Center(
                         child: Padding(
                           padding: const EdgeInsets.only(top: 50),
                           child: Column(
                             children: [
                               const Text('Không tìm thấy bộ thẻ nào. Hãy tạo một bộ để bắt đầu!', style: TextStyle(color: AppColors.textTertiary)),
                               const SizedBox(height: 20),
                               AppButton(
                                 text: 'TẠO BỘ THẺ ĐẦU TIÊN',
                                 onPressed: () => context.push('/flashcards/add-deck'),
                                 icon: Icons.add_circle_outline_rounded,
                               ),
                             ],
                           ),
                         ),
                      ),
                    );
                  }
                  return SliverList(
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
                  );
                },
                loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
                error: (err, stack) => SliverToBoxAdapter(child: Center(child: Text('Error: $err'))),
              ),
            ),
            
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 110, right: 8),
        child: FloatingActionButton.extended(
          onPressed: () => context.push('/flashcards/add-deck'),
          backgroundColor: AppColors.primary,
          elevation: 12,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.full)),
          icon: const Icon(Icons.add_rounded, color: Colors.white, size: 20),
          label: const Text(
            'BỘ THẺ MỚI',
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

class _DeckCard extends ConsumerWidget {
  final FlashcardDeck deck;

  const _DeckCard({required this.deck});

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xóa bộ thẻ'),
        content: const Text('Bạn có chắc chắn muốn xóa bộ thẻ này? Hành động này không thể hoàn tác.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );

    if (confirm == true) {
       final success = await ref.read(flashcardControllerProvider.notifier).deleteDeck(deck.id);
       if (success && context.mounted) {
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('Đã xóa bộ thẻ thành công')),
         );
       }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark; // Detect Dark Mode
    final progress = deck.progress;

    return Container(
      decoration: BoxDecoration(
        // UI/UX Pro Max: Dark mode adaptive color
        color: isDark 
            ? AppColors.textPrimary.withValues(alpha: 0.05) 
            : Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(
            color: isDark 
                ? Colors.white.withValues(alpha: 0.1) 
                : AppColors.grey300.withValues(alpha: 0.3)
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: isDark ? 0.0 : 0.03),
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
                          color: isDark ? AppColors.primary.withValues(alpha: 0.2) : AppColors.primarySurface,
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
                                color: isDark ? Colors.white : AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              deck.description,
                              maxLines: 2, // Limit lines to prevent vertical layout issues
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.textTertiary,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // UI/UX Fix: Use Wrap to prevent overflow on small screens
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                // Mastery percentage hidden due to backend calculation issue
                                // _StatLabel(
                                //   label: '${(progress * 100).toInt()}% MASTERED',
                                //   color: AppColors.primary,
                                // ),
                                _StatLabel(
                                  label: '${deck.totalCards} THẺ',
                                  color: AppColors.textTertiary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                       // Actions Menu
                       PopupMenuButton<String>(
                         icon: const Icon(Icons.more_vert_rounded, color: AppColors.textTertiary),
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                         onSelected: (value) {
                           if (value == 'add') {
                             context.push('/flashcards/add-card', extra: deck);
                           } else if (value == 'delete') {
                             _confirmDelete(context, ref);
                           } else if (value == 'edit') {
                             context.push('/flashcards/add-deck', extra: deck);
                           } else if (value == 'manage') {
                             context.push('/flashcards/deck-detail', extra: deck);
                           }
                         },
                         itemBuilder: (context) => [
                           const PopupMenuItem(
                             value: 'manage',
                             child: Row(
                               children: [
                                 Icon(Icons.list_alt_rounded, color: AppColors.textSecondary, size: 20),
                                 SizedBox(width: 8),
                                 Text('Quản lý thẻ'),
                               ],
                             ),
                           ),
                           const PopupMenuItem(
                             value: 'add',
                             child: Row(
                               children: [
                                 Icon(Icons.add_rounded, color: AppColors.textSecondary, size: 20),
                                 SizedBox(width: 8),
                                 Text('Thêm thẻ'),
                               ],
                             ),
                           ),
                           const PopupMenuItem(
                             value: 'edit',
                             child: Row(
                               children: [
                                 Icon(Icons.edit_rounded, size: 20),
                                 SizedBox(width: 8),
                                 Text('Sửa bộ thẻ'),
                               ],
                             ),
                           ),
                           const PopupMenuItem(
                             value: 'delete',
                             child: Row(
                               children: [
                                 Icon(Icons.delete_outline_rounded, size: 20, color: AppColors.error),
                                 SizedBox(width: 8),
                                 Text('Xóa', style: TextStyle(color: AppColors.error)),
                               ],
                             ),
                           ),
                         ],
                       ),
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
