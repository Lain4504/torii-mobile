import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/study_set_model.dart';
import '../../providers/study_providers.dart';

class StudySetsPage extends ConsumerStatefulWidget {
  const StudySetsPage({super.key});

  @override
  ConsumerState<StudySetsPage> createState() => _StudySetsPageState();
}

class _StudySetsPageState extends ConsumerState<StudySetsPage> {
  String? _selectedSetId;

  @override
  Widget build(BuildContext context) {
    final studySetsAsync = ref.watch(studySetsProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: studySetsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
          data: (sets) {
            if (_selectedSetId == null && sets.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                 setState(() {
                   _selectedSetId = sets.first.id;
                 });
              });
            }

            final selectedSet = sets.firstWhere(
              (s) => s.id == _selectedSetId,
              orElse: () => sets.first,
            );

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                _buildAppBar(context, isDark),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Học tự chủ',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: AppTypography.extraBold,
                            fontStyle: FontStyle.italic,
                            fontFamily: AppTypography.fontFamilySerif,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Tự tạo bộ thẻ và chọn chế độ học phù hợp với bạn.',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _buildSectionHeader(
                    context,
                    title: 'DANH SÁCH BÀI',
                    onActionTap: () => _showCreateSetDialog(context),
                    actionLabel: 'TẠO BÀI MỚI',
                    icon: Icons.add_circle_outline_rounded,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 140,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                      scrollDirection: Axis.horizontal,
                      itemCount: sets.length,
                      itemBuilder: (context, index) {
                        final set = sets[index];
                        final isActive = _selectedSetId == set.id;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedSetId = set.id),
                          child: AnimatedContainer(
                            duration: AppDuration.fast,
                            width: 160,
                            margin: const EdgeInsets.only(right: AppSpacing.md, bottom: 8),
                            padding: const EdgeInsets.all(AppSpacing.md),
                            decoration: BoxDecoration(
                              color: isActive ? AppColors.white : AppColors.surface,
                              borderRadius: BorderRadius.circular(AppRadius.card),
                              border: Border.all(
                                color: isActive ? AppColors.primary : AppColors.grey200.withValues(alpha: 0.5),
                                width: 2,
                              ),
                              boxShadow: isActive ? AppElevation.mediumShadow : AppElevation.softShadow,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: isActive ? AppColors.primarySurface : AppColors.grey100,
                                        borderRadius: BorderRadius.circular(AppRadius.full),
                                      ),
                                      child: Text(
                                        'Bài ${index + 1}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: AppTypography.bold,
                                          color: isActive ? AppColors.primary : AppColors.textTertiary,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      set.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: AppTypography.extraBold,
                                        color: isActive ? AppColors.primaryDark : AppColors.textPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${set.cardCount} thẻ',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: isActive ? AppColors.primary : AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.xl),
                    child: _buildSectionHeader(context, title: 'BẮT ĐẦU HỌC'),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _buildStudyModes(context, selectedSet),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.xl),
                    child: _buildSectionHeader(
                      context,
                      title: 'DANH SÁCH THẺ (${selectedSet.cardCount})',
                      onActionTap: () => _showAddCardDialog(context, selectedSet),
                      actionLabel: 'THÊM THẺ',
                      icon: Icons.add_rounded,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final card = selectedSet.setCards?[index];
                      if (card == null) return const SizedBox.shrink();
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: 6),
                        child: MinimalCard(
                          child: Padding(
                            padding: const EdgeInsets.all(AppSpacing.md),
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.primarySurface,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                        fontWeight: AppTypography.bold,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.md),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        card.term,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: AppTypography.bold,
                                          fontFamily: AppTypography.fontFamilyJapanese,
                                        ),
                                      ),
                                      Text(
                                        card.definition,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (card.hint != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: AppColors.grey100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      card.hint!,
                                      style: const TextStyle(fontSize: 10, color: AppColors.textTertiary),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: selectedSet.setCards?.length ?? 0,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, bool isDark) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        onPressed: () => context.pop(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline_rounded),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, {
    required String title,
    VoidCallback? onActionTap,
    String? actionLabel,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: AppTypography.black,
              letterSpacing: 2.0,
              color: AppColors.primary,
            ),
          ),
          if (onActionTap != null)
            TextButton.icon(
              onPressed: onActionTap,
              icon: Icon(icon, size: 16),
              label: Text(
                actionLabel!,
                style: const TextStyle(fontSize: 11, fontWeight: AppTypography.bold),
              ),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStudyModes(BuildContext context, StudySet set) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Row(
        children: [
          Expanded(
            child: _StudyModeCard(
              title: 'Lật thẻ',
              subtitle: 'Flashcards',
              icon: Icons.layers_rounded,
              color: AppColors.primary,
              onTap: () => context.push('/flashcards/${set.id}/mode/card'),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: _StudyModeCard(
              title: 'Ghép cặp',
              subtitle: 'Match game',
              icon: Icons.extension_rounded,
              color: AppColors.warning,
              onTap: () => context.push('/flashcards/${set.id}/mode/match'),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: _StudyModeCard(
              title: 'Review',
              subtitle: 'Quiz',
              icon: Icons.quiz_rounded,
              color: AppColors.accent,
              onTap: () => context.push('/flashcards/${set.id}/mode/review'),
            ),
          ),
        ],
      ),
    );
  }

  void _showCreateSetDialog(BuildContext context) {
    // Boilerplate for dialog
  }

  void _showAddCardDialog(BuildContext context, StudySet set) {
    // Boilerplate for dialog
  }
}

class _StudyModeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _StudyModeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(color: AppColors.grey200.withValues(alpha: 0.5), width: 1.5),
          boxShadow: AppElevation.softShadow,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 13),
            ),
            Text(
              subtitle,
              style: TextStyle(color: AppColors.textTertiary, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
