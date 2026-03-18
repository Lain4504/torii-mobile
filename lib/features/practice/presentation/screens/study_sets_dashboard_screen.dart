import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';

class StudySetsDashboardScreen extends ConsumerStatefulWidget {
  const StudySetsDashboardScreen({super.key});

  @override
  ConsumerState<StudySetsDashboardScreen> createState() => _StudySetsDashboardScreenState();
}

class _StudySetsDashboardScreenState extends ConsumerState<StudySetsDashboardScreen> {
  String? _selectedSetId;

  final _newTermCtrl = TextEditingController();
  final _newDefCtrl = TextEditingController();

  @override
  void dispose() {
    _newTermCtrl.dispose();
    _newDefCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final setsAsync = ref.watch(studySetsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Thẻ ghi nhớ của tôi',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => _showCreateSetSheet(context),
            icon: const Icon(Icons.add_circle_outline_rounded),
            tooltip: 'Tạo bài mới',
          ),
        ],
      ),
      body: setsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e', style: const TextStyle(color: AppColors.error))),
        data: (sets) {
          if (sets.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.08),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.psychology_rounded, color: AppColors.primary, size: 32),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Chưa có bộ thẻ nào',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Tạo bộ thẻ đầu tiên để bắt đầu học tự chủ.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.textTertiary),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton.icon(
                        onPressed: () => _showCreateSetSheet(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.textOnPrimary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        icon: const Icon(Icons.add),
                        label: const Text('Tạo bộ thẻ ngay', style: TextStyle(fontWeight: FontWeight.w900)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          _selectedSetId ??= sets.first.id;
          final selectedId = _selectedSetId!;
          final selectedAsync = ref.watch(studySetDetailProvider(selectedId));
          final selected = selectedAsync.asData?.value?['item'] as Map<String, dynamic>?;
          final selectedCards = (selected?['setCards'] as List?)?.cast<dynamic>() ?? const [];
          final selectedCount = selectedCards.length;

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(studySetsProvider);
              ref.invalidate(studySetDetailProvider(selectedId));
              ref.invalidate(studyCardsProvider(selectedId));
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              children: [
                // List of sets (mobile adaptation of the web grid)
                _SectionCard(
                  title: 'Danh sách bài',
                  subtitle: 'Mỗi bộ thẻ tương ứng với một bài học/tập từ vựng riêng.',
                  trailing: SizedBox(
                    height: 32,
                    child: OutlinedButton.icon(
                      onPressed: () => _showCreateSetSheet(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text('Tạo bài', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12.5)),
                    ),
                  ),
                  child: SizedBox(
                    height: 98,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: sets.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final s = sets[index];
                        final isActive = s.id == selectedId;
                        return InkWell(
                          onTap: () => setState(() => _selectedSetId = s.id),
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            width: 220,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isActive ? AppColors.primary.withOpacity(0.06) : AppColors.surface,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isActive ? AppColors.primary.withOpacity(0.35) : AppColors.grey300,
                                width: 1.2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: isActive ? AppColors.primary.withOpacity(0.14) : AppColors.grey200,
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: Text(
                                    'Bài ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800,
                                      color: isActive ? AppColors.primary : AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  s.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: isActive ? AppColors.primary : AppColors.textPrimary,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '${s.cardCount} thẻ',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: isActive ? AppColors.primary.withOpacity(0.75) : AppColors.textTertiary,
                                    fontWeight: FontWeight.w700,
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
                const SizedBox(height: 12),

                // Cards list + quick add (web parity)
                _SectionCard(
                  title: 'Danh sách thẻ ($selectedCount)',
                  subtitle: 'Xem nhanh và thêm thẻ ngay trên mobile.',
                  child: selectedAsync.when(
                    loading: () => const Padding(
                      padding: EdgeInsets.all(18),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (e, _) => Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text('Lỗi: $e', style: const TextStyle(color: AppColors.error)),
                    ),
                    data: (_) {
                      return Column(
                        children: [
                          if (selectedCards.isEmpty)
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Bộ thẻ này chưa có thẻ nào.',
                                style: TextStyle(color: AppColors.textTertiary),
                              ),
                            )
                          else
                            ...List.generate(selectedCards.length, (i) {
                              final c = selectedCards[i] as Map;
                              final term = (c['term'] ?? '').toString();
                              final def = (c['definition'] ?? '').toString();
                              final hint = c['hint']?.toString();
                              return Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: AppColors.grey300),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      term,
                                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      def,
                                      style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary, height: 1.35),
                                    ),
                                    if (hint != null && hint.trim().isNotEmpty) ...[
                                      const SizedBox(height: 6),
                                      Text(
                                        'Gợi ý: $hint',
                                        style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary),
                                      ),
                                    ],
                                  ],
                                ),
                              );
                            }),
                          const SizedBox(height: 2),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: AppColors.grey300),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Thêm thuật ngữ mới',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: AppColors.textTertiary,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: _newTermCtrl,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    labelText: 'Mặt trước (term)',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: _newDefCtrl,
                                  textInputAction: TextInputAction.done,
                                  onSubmitted: (_) => _createCard(selectedId),
                                  decoration: const InputDecoration(
                                    labelText: 'Mặt sau (definition)',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 44,
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    onPressed: () => _createCard(selectedId),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: AppColors.textOnPrimary,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                    ),
                                    icon: const Icon(Icons.add),
                                    label: const Text('Thêm thẻ', style: TextStyle(fontWeight: FontWeight.w900)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),

                // Mode selection (web parity)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primary.withOpacity(0.20)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.10),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.info_outline_rounded, color: AppColors.primary, size: 18),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Nên dùng bộ gõ tiếng Việt hoặc Nhật cho các chế độ luyện gõ để tăng hiệu quả ghi nhớ.',
                          style: TextStyle(color: AppColors.textSecondary, height: 1.35),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text('Chọn chế độ học', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w900)),
                const SizedBox(height: 10),
                _ModeCard(
                  icon: Icons.layers_rounded,
                  title: 'Flashcard',
                  subtitle: 'Lật thẻ để xem đáp án. Phù hợp để làm quen với từ mới.',
                  buttonText: 'Bắt đầu Flashcard',
                  enabled: selectedCount > 0,
                  onTap: () => context.push('/study-sets/$selectedId/review'),
                ),
                const SizedBox(height: 10),
                _ModeCard(
                  icon: Icons.my_location_rounded,
                  title: 'Trắc nghiệm',
                  subtitle: 'Xem từ vựng, chọn đáp án. Kiểm tra nhanh kiến thức.',
                  buttonText: 'Bắt đầu Trắc nghiệm',
                  enabled: selectedCount > 0,
                  onTap: () => context.push('/study-sets/$selectedId/test'),
                ),
                const SizedBox(height: 10),
                _ModeCard(
                  icon: Icons.bolt_rounded,
                  title: 'Match',
                  subtitle: 'Ghép cặp thuật ngữ và định nghĩa để ghi nhớ sâu hơn.',
                  buttonText: 'Bắt đầu Match',
                  enabled: selectedCount > 0,
                  onTap: () => context.push('/study-sets/$selectedId/match'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _createCard(String setId) async {
    final term = _newTermCtrl.text.trim();
    final def = _newDefCtrl.text.trim();
    if (term.isEmpty || def.isEmpty) return;
    final repo = ref.read(academyRepositoryProvider);
    final created = await repo.createStudySetCard(setId: setId, term: term, definition: def);
    if (!mounted) return;
    if (created != null) {
      _newTermCtrl.clear();
      _newDefCtrl.clear();
      ref.invalidate(studySetDetailProvider(setId));
      ref.invalidate(studyCardsProvider(setId));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã thêm thẻ mới!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thêm thẻ thất bại')));
    }
  }

  Future<void> _showCreateSetSheet(BuildContext context) async {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final theme = Theme.of(context);

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) {
        bool busy = false;
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          ),
          child: StatefulBuilder(
            builder: (ctx, setSheet) {
              Future<void> submit() async {
                final title = titleCtrl.text.trim();
                final desc = descCtrl.text.trim();
                if (title.isEmpty) return;
                setSheet(() => busy = true);
                final repo = ref.read(academyRepositoryProvider);
                final created = await repo.createStudySet(title: title, description: desc.isEmpty ? null : desc);
                if (ctx.mounted) {
                  setSheet(() => busy = false);
                  if (created != null) {
                    ref.invalidate(studySetsProvider);
                    setState(() => _selectedSetId = created.id);
                    Navigator.of(ctx).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tạo bộ thẻ thất bại')));
                  }
                }
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(color: AppColors.grey300, borderRadius: BorderRadius.circular(999)),
                    ),
                  ),
                  Text('Tạo bài mới', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text(
                    'Đặt tên và mô tả cho bộ thẻ dùng để học tự chủ.',
                    style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: titleCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Tên bộ thẻ *',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: descCtrl,
                    minLines: 2,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Mô tả',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: OutlinedButton(
                            onPressed: busy ? null : () => Navigator.of(ctx).pop(),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.textSecondary,
                              side: const BorderSide(color: AppColors.grey300),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                            ),
                            child: const Text('Hủy', style: TextStyle(fontWeight: FontWeight.w800)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: ElevatedButton(
                            onPressed: busy ? null : submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.textOnPrimary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                            ),
                            child: Text(busy ? 'Đang tạo...' : 'Tạo mới', style: const TextStyle(fontWeight: FontWeight.w900)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final Widget? trailing;

  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary)),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String buttonText;
  final bool enabled;
  final VoidCallback onTap;

  const _ModeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: AppColors.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900)),
                    const SizedBox(height: 2),
                    Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary, height: 1.35)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 44,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: enabled ? onTap : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textOnPrimary,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: Text(buttonText, style: const TextStyle(fontWeight: FontWeight.w900)),
            ),
          ),
        ],
      ),
    );
  }
}

