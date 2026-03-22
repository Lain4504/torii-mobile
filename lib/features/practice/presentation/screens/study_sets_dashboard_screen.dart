import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
  String? _busyCardId;

  @override
  void dispose() {
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

          // AppShell dùng extendBody: true → body vẽ xuyên qua bottom bar; padding đáy cho nav + safe area.
          final mq = MediaQuery.of(context);
          final shellBottomInset = mq.padding.bottom + 64 + 12;

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(studySetsProvider);
              ref.invalidate(studySetDetailProvider(selectedId));
              ref.invalidate(studyCardsProvider(selectedId));
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(16, 12, 16, shellBottomInset),
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
                    height: 112,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: sets.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final s = sets[index];
                        final isActive = s.id == selectedId;
                        return InkWell(
                          onTap: () => setState(() => _selectedSetId = s.id),
                          onLongPress: () => _showEditSetSheet(context, s.id, initialTitle: s.title, initialDescription: s.description),
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
                                const SizedBox(height: 6),
                                Expanded(
                                  child: Text(
                                    s.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: isActive ? AppColors.primary : AppColors.textPrimary,
                                      height: 1.15,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
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

                // Cards list (mobile)
                _SectionCard(
                  title: 'Danh sách thẻ ($selectedCount)',
                  subtitle: 'Nhấn «Thêm thẻ» hoặc vuốt thẻ để sửa / xóa.',
                  trailing: SizedBox(
                    height: 32,
                    child: OutlinedButton.icon(
                      onPressed: () => _showCreateCardSheet(context, selectedId),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text('Thêm thẻ', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12.5)),
                    ),
                  ),
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
                      if (selectedCards.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Bộ thẻ này chưa có thẻ nào.',
                            style: TextStyle(color: AppColors.textTertiary),
                          ),
                        );
                      }

                      return Column(
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: selectedCards.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 10),
                            itemBuilder: (context, i) {
                              final c = selectedCards[i] as Map;
                              final cardId = (c['id'] ?? '').toString();
                              final term = (c['term'] ?? '').toString().trim();
                              final def = (c['definition'] ?? '').toString().trim();

                              final row = SizedBox(
                                height: 64,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColors.background,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: AppColors.grey300),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: AppColors.primary.withOpacity(0.10),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: const Icon(Icons.style_rounded, color: AppColors.primary, size: 18),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                term.isEmpty ? '(Trống)' : term,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                def.isEmpty ? '(Trống)' : def,
                                                maxLines: 1,
                                                textAlign: TextAlign.right,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme.textTheme.bodySmall?.copyWith(
                                                  color: AppColors.textSecondary,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (_busyCardId == cardId) ...[
                                        const SizedBox(width: 10),
                                        const SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(strokeWidth: 2),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              );

                              return Slidable(
                                key: ValueKey('card-$cardId'),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  extentRatio: 0.46,
                                  children: [
                                    SlidableAction(
                                      onPressed: (_) => _showEditCardSheet(
                                        context,
                                        setId: selectedId,
                                        cardId: cardId,
                                        initialTerm: term,
                                        initialDefinition: def,
                                      ),
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: Colors.white,
                                      icon: Icons.edit_rounded,
                                      label: 'Sửa',
                                    ),
                                    SlidableAction(
                                      onPressed: (_) async {
                                        final ok = await showDialog<bool>(
                                          context: context,
                                          useRootNavigator: true,
                                          builder: (dCtx) => AlertDialog(
                                            title: const Text('Xóa thẻ?'),
                                            content: const Text('Bạn có chắc chắn muốn xóa thẻ này không?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.of(dCtx).pop(false),
                                                child: const Text('Hủy'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.of(dCtx).pop(true),
                                                child: const Text('Xóa', style: TextStyle(color: AppColors.error)),
                                              ),
                                            ],
                                          ),
                                        );
                                        if (ok == true) {
                                          await _deleteCard(setId: selectedId, cardId: cardId);
                                        }
                                      },
                                      backgroundColor: AppColors.error,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete_rounded,
                                      label: 'Xóa',
                                    ),
                                  ],
                                ),
                                child: row,
                              );
                            },
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

  Future<void> _createCard({
    required String setId,
    required String term,
    required String definition,
    String? hint,
  }) async {
    final t = term.trim();
    final d = definition.trim();
    final h = hint?.trim();
    if (t.isEmpty || d.isEmpty) return;
    final repo = ref.read(academyRepositoryProvider);
    final created = await repo.createStudySetCard(setId: setId, term: t, definition: d, hint: h);
    if (!mounted) return;
    if (created != null) {
      ref.invalidate(studySetDetailProvider(setId));
      ref.invalidate(studyCardsProvider(setId));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã thêm thẻ mới!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thêm thẻ thất bại')));
    }
  }

  Future<void> _updateCard({
    required String setId,
    required String cardId,
    required String term,
    required String definition,
  }) async {
    final t = term.trim();
    final d = definition.trim();
    if (t.isEmpty || d.isEmpty) return;
    final repo = ref.read(academyRepositoryProvider);
    final updated = await repo.updateStudySetCard(cardId: cardId, term: t, definition: d);
    if (!mounted) return;
    if (updated != null) {
      ref.invalidate(studySetDetailProvider(setId));
      ref.invalidate(studyCardsProvider(setId));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã cập nhật thẻ!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cập nhật thẻ thất bại')));
    }
  }

  Future<void> _deleteCard({required String setId, required String cardId}) async {
    if (mounted) setState(() => _busyCardId = cardId);
    try {
      final repo = ref.read(academyRepositoryProvider);
      final ok = await repo.deleteStudySetCard(cardId: cardId);
      if (!mounted) return;
      if (ok) {
        ref.invalidate(studySetDetailProvider(setId));
        ref.invalidate(studyCardsProvider(setId));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã xóa thẻ')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Xóa thẻ thất bại')));
      }
    } finally {
      if (mounted) setState(() => _busyCardId = null);
    }
  }

  Future<void> _showCreateCardSheet(BuildContext context, String setId) async {
    final termCtrl = TextEditingController();
    final defCtrl = TextEditingController();
    final hintCtrl = TextEditingController();
    final theme = Theme.of(context);

    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
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
                final term = termCtrl.text.trim();
                final def = defCtrl.text.trim();
                final hint = hintCtrl.text.trim();
                if (term.isEmpty || def.isEmpty) return;
                setSheet(() => busy = true);
                await _createCard(setId: setId, term: term, definition: def, hint: hint.isEmpty ? null : hint);
                if (!ctx.mounted) return;
                setSheet(() => busy = false);
                Navigator.of(ctx, rootNavigator: true).pop();
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
                  Text('Tạo thẻ mới', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text(
                    'Nhập thuật ngữ và định nghĩa cho thẻ.',
                    style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: termCtrl,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Mặt trước (term) *',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: defCtrl,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Mặt sau (definition) *',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: hintCtrl,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => busy ? null : submit(),
                    decoration: const InputDecoration(
                      labelText: 'Gợi ý (tuỳ chọn)',
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
                            onPressed: busy ? null : () => Navigator.of(ctx, rootNavigator: true).pop(),
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
                            child: Text(busy ? 'Đang tạo...' : 'Tạo thẻ', style: const TextStyle(fontWeight: FontWeight.w900)),
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

    termCtrl.dispose();
    defCtrl.dispose();
    hintCtrl.dispose();
  }

  Future<void> _showEditCardSheet(
    BuildContext context, {
    required String setId,
    required String cardId,
    required String initialTerm,
    required String initialDefinition,
  }) async {
    final termCtrl = TextEditingController(text: initialTerm);
    final defCtrl = TextEditingController(text: initialDefinition);
    final theme = Theme.of(context);

    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
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
                final term = termCtrl.text.trim();
                final def = defCtrl.text.trim();
                if (term.isEmpty || def.isEmpty) return;
                setSheet(() => busy = true);
                await _updateCard(setId: setId, cardId: cardId, term: term, definition: def);
                if (!ctx.mounted) return;
                setSheet(() => busy = false);
                Navigator.of(ctx, rootNavigator: true).pop();
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
                  Text('Chỉnh sửa thẻ', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 12),
                  TextField(
                    controller: termCtrl,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Mặt trước *',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: defCtrl,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => busy ? null : submit(),
                    decoration: const InputDecoration(
                      labelText: 'Mặt sau *',
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
                            onPressed: busy ? null : () => Navigator.of(ctx, rootNavigator: true).pop(),
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
                            child: Text(busy ? 'Đang lưu...' : 'Lưu', style: const TextStyle(fontWeight: FontWeight.w900)),
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

    termCtrl.dispose();
    defCtrl.dispose();
  }

  Future<void> _showEditSetSheet(
    BuildContext context,
    String setId, {
    required String initialTitle,
    String? initialDescription,
  }) async {
    final titleCtrl = TextEditingController(text: initialTitle);
    final descCtrl = TextEditingController(text: initialDescription ?? '');
    final theme = Theme.of(context);

    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
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
                final ok = await repo.updateStudySet(setId: setId, title: title, description: desc.isEmpty ? null : desc);
                if (!ctx.mounted) return;
                setSheet(() => busy = false);
                if (ok) {
                  ref.invalidate(studySetsProvider);
                  ref.invalidate(studySetDetailProvider(setId));
                  Navigator.of(ctx, rootNavigator: true).pop();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã cập nhật bài')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cập nhật thất bại')));
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
                  Text('Chỉnh sửa bài', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text(
                    'Nhấn giữ một bài để mở bảng chỉnh sửa.',
                    style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: titleCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Tên bài *',
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
                            onPressed: busy ? null : () => Navigator.of(ctx, rootNavigator: true).pop(),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.textSecondary,
                              side: const BorderSide(color: AppColors.grey300),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                            ),
                            child: const Text('Đóng', style: TextStyle(fontWeight: FontWeight.w800)),
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
                            child: Text(busy ? 'Đang lưu...' : 'Lưu', style: const TextStyle(fontWeight: FontWeight.w900)),
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

    titleCtrl.dispose();
    descCtrl.dispose();
  }

  Future<void> _showCreateSetSheet(BuildContext context) async {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final theme = Theme.of(context);

    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
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
                    Navigator.of(ctx, rootNavigator: true).pop();
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
                            onPressed: busy ? null : () => Navigator.of(ctx, rootNavigator: true).pop(),
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
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary, height: 1.35),
                    ),
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

