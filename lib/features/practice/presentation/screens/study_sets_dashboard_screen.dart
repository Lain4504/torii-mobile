import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/core/widgets/base_sheet_wrapper.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/data/models/study_set_models.dart';

class StudySetsDashboardScreen extends ConsumerStatefulWidget {
  const StudySetsDashboardScreen({super.key, required this.initialSetId});

  final String initialSetId;

  @override
  ConsumerState<StudySetsDashboardScreen> createState() => _StudySetsDashboardScreenState();
}

class _StudySetsDashboardScreenState extends ConsumerState<StudySetsDashboardScreen> {
  String? _busyCardId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Fetch details for the specific set
    final detailAsync = ref.watch(studySetDetailProvider(widget.initialSetId));
    final cardsAsync = ref.watch(studyCardsProvider(widget.initialSetId));

    return Hero(
      tag: 'study_set_${widget.initialSetId}',
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: detailAsync.when(
            data: (data) => Text(
              data?['title'] ?? 'Chi tiết bộ thẻ',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900, fontFamily: AppTypography.fontFamily),
            ),
            loading: () => const Text('Đang tải...'),
            error: (_, __) => const Text('Lỗi'),
          ),
          actions: [
            detailAsync.when(
              data: (data) {
                if (data == null) return const SizedBox.shrink();
                final currentUserId = ref.watch(authStateProvider).valueOrNull?.user?.id;
                final isMine = data['userId'] == currentUserId;
                
                if (!isMine) return const SizedBox.shrink();

                return IconButton(
                  onPressed: () {
                    // Since studySetDetailProvider returns Map<String, dynamic>, we might need to map it or fetch from studySetsProvider
                    final sets = ref.read(studySetsProvider).value ?? [];
                    final currentSet = sets.firstWhere((s) => s.id == widget.initialSetId);
                    _showEditSetSheet(context, currentSet);
                  },
                  icon: const Icon(Icons.settings_outlined),
                );
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
          backgroundColor: theme.colorScheme.surface,
          elevation: 0,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(studySetDetailProvider(widget.initialSetId));
            ref.invalidate(studyCardsProvider(widget.initialSetId));
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              // Mode Selection Section
              SliverToBoxAdapter(
                child: detailAsync.when(
                  data: (data) {
                    if (data == null) return const SizedBox.shrink();
                    final currentUserId = ref.watch(authStateProvider).valueOrNull?.user?.id;
                    final isMine = data['userId'] == currentUserId;
                    final count = data['cardCount'] ?? 0;

                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!isMine) ...[
                            _buildCloneBanner(context, data['id']),
                            const SizedBox(height: 24),
                          ],
                          Text(
                            'Luyện tập',
                            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          _StudyModeSelectionGrid(
                            setId: widget.initialSetId,
                            cardCount: count,
                            enabled: isMine,
                          ),
                        ],
                      ),
                    );
                  },
                  loading: () => const Padding(
                    padding: EdgeInsets.all(40),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (e, _) => Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('Lỗi tải chế độ: $e'),
                  ),
                ),
              ),

              // Cards List Header
              SliverToBoxAdapter(
                child: detailAsync.when(
                  data: (data) {
                    if (data == null) return const SizedBox.shrink();
                    final currentUserId = ref.watch(authStateProvider).valueOrNull?.user?.id;
                    final isMine = data['userId'] == currentUserId;
                    
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Danh sách ghi chú',
                            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          if (isMine)
                            TextButton.icon(
                              onPressed: () => _showAddCardSheet(context, widget.initialSetId),
                              icon: const Icon(Icons.add, size: 18),
                              label: const Text('Thêm thẻ'),
                            ),
                        ],
                      ),
                    );
                  },
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ),

              // Cards List
              cardsAsync.when(
                loading: () => const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (e, _) => SliverFillRemaining(
                  child: Center(child: Text('Lỗi tải thẻ: $e')),
                ),
                data: (cards) {
                  if (cards.isEmpty) {
                    final currentUserId = ref.watch(authStateProvider).valueOrNull?.user?.id;
                    final isMine = detailAsync.valueOrNull?['userId'] == currentUserId;
                    
                    return SliverToBoxAdapter(
                      child: _EmptyCardsState(
                        onAdd: isMine ? () => _showAddCardSheet(context, widget.initialSetId) : null,
                      ),
                    );
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final card = cards[index];
                          final currentUserId = ref.read(authStateProvider).valueOrNull?.user?.id;
                          final isMine = detailAsync.valueOrNull?['userId'] == currentUserId;

                          return _CardListItem(
                            card: card,
                            isBusy: _busyCardId == card.id,
                            onEdit: isMine ? () => _showEditCardSheet(context, card) : null,
                            onDelete: isMine ? () => _handleDeleteCard(card.id) : null,
                          );
                        },
                        childCount: cards.length,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloneBanner(BuildContext context, String setId) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome_rounded, color: theme.colorScheme.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Bạn chưa có bộ thẻ này trong danh sách!',
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Hãy lưu bộ thẻ này về tài khoản của bạn để có thể bắt đầu luyện tập, theo dõi tiến độ và chỉnh sửa theo ý muốn.',
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () => _handleClone(setId),
              icon: const Icon(Icons.copy_rounded, size: 18),
              label: const Text('Lưu về bộ thẻ của tôi'),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleClone(String setId) async {
    setState(() => _busyCardId = 'cloning'); // Reuse busy indicator logic vaguely or just show loader
    try {
      final newSet = await ref.read(academyRepositoryProvider).cloneStudySet(setId);
      if (newSet != null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đã clone bộ thẻ thành công!')),
          );
          // Navigate to the new set dashboard
          context.pushReplacement('/study-sets/${newSet.id}');
          ref.invalidate(studySetsProvider);
        }
      } else {
        throw Exception('Clone thất bại');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi clone: $e'), backgroundColor: AppColors.error),
        );
      }
    } finally {
      if (mounted) setState(() => _busyCardId = null);
    }
  }

  // ---------- API Actions ----------

  Future<void> _handleDeleteCard(String cardId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa thẻ?'),
        content: const Text('Bạn có chắc chắn muốn xóa thẻ này không?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Hủy')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _busyCardId = cardId);
    try {
      final success = await ref.read(academyRepositoryProvider).deleteStudySetCard(cardId: cardId);
      if (success) {
        ref.invalidate(studyCardsProvider(widget.initialSetId));
        ref.invalidate(studySetsProvider);
        ref.invalidate(studySetDetailProvider(widget.initialSetId));
      }
    } catch (e) {
      if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e'), backgroundColor: AppColors.error));
      }
    } finally {
      if (mounted) setState(() => _busyCardId = null);
    }
  }

  // ---------- Sheets ----------

  void _showEditSetSheet(BuildContext context, StudySetModel set) {
     showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _EditSetSheet(
        set: set,
        onUpdated: () {
          ref.invalidate(studySetsProvider);
          ref.invalidate(studySetDetailProvider(widget.initialSetId));
        },
        onDeleted: () {
           ref.invalidate(studySetsProvider);
           context.pop(); // Go back to list
        },
      ),
    );
  }

  void _showAddCardSheet(BuildContext context, String setId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _AddCardSheet(setId: setId, onAdded: () {
         ref.invalidate(studyCardsProvider(setId));
         ref.invalidate(studySetsProvider);
         ref.invalidate(studySetDetailProvider(setId));
      }),
    );
  }

  void _showEditCardSheet(BuildContext context, SetCardModel card) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _EditCardSheet(card: card, onUpdated: () {
         ref.invalidate(studyCardsProvider(card.studySetId));
      }),
    );
  }
}

// ============= SUB-WIDGETS =============

class _StudyModeSelectionGrid extends StatelessWidget {
  final String setId;
  final int cardCount;
  final bool enabled;

  const _StudyModeSelectionGrid({
    required this.setId,
    required this.cardCount,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final canStudy = cardCount > 0;
    
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _ModeCard(
                title: 'Flashcard',
                subtitle: 'Ghi nhớ lặp lại',
                icon: Icons.layers_outlined,
                color: const Color(0xFF2563EB),
                onTap: () => context.push('/study-sets/$setId/review'),
                enabled: enabled && canStudy,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _ModeCard(
                title: 'Trắc nghiệm',
                subtitle: 'Kiểm tra trình độ',
                icon: Icons.quiz_outlined,
                color: const Color(0xFFF97316),
                onTap: () => context.push('/study-sets/$setId/test'),
                enabled: enabled && cardCount >= 4,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _ModeCard(
          title: 'Ghép cặp (Match)',
          subtitle: 'Thử thách tốc độ ghép nối từ vựng',
          icon: Icons.extension_outlined,
          color: const Color(0xFF059669),
          onTap: () => context.push('/study-sets/$setId/match'),
          enabled: enabled && canStudy,
          isWide: true,
        ),
      ],
    );
  }
}

class _ModeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool enabled;
  final bool isWide;

  const _ModeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
    this.enabled = true,
    this.isWide = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(20),
      child: Opacity(
        opacity: enabled ? 1.0 : 0.5,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withValues(alpha: 0.15)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(icon, color: Colors.white, size: 24),
                  ),
                  if (isWide) ...[
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900, color: color)),
                          Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant, fontSize: 11)),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: color),
                  ]
                ],
              ),
              if (!isWide) ...[
                const SizedBox(height: 16),
                Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900, color: color)),
                const SizedBox(height: 4),
                Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant, fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyCardsState extends StatelessWidget {
  final VoidCallback? onAdd;
  const _EmptyCardsState({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: theme.colorScheme.outlineVariant, style: BorderStyle.none),
        ),
        child: Column(
          children: [
            Icon(Icons.style_outlined, size: 64, color: theme.colorScheme.primary.withValues(alpha: 0.2)),
            const SizedBox(height: 16),
            Text('Chưa có thẻ nào', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              'Hãy thêm những thuật ngữ đầu tiên để bắt đầu luyện tập.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            if (onAdd != null)
              OutlinedButton.icon(
                onPressed: onAdd,
                icon: const Icon(Icons.add),
                label: const Text('Thêm thẻ mới'),
                style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              ),
          ],
        ),
      ),
    );
  }
}

class _CardListItem extends StatelessWidget {
  final SetCardModel card;
  final bool isBusy;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const _CardListItem({
    required this.card,
    required this.isBusy,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Slidable(
        endActionPane: onEdit == null && onDelete == null
            ? null
            : ActionPane(
                motion: const ScrollMotion(),
                children: [
                  if (onEdit != null)
                    SlidableAction(
                      onPressed: (_) => onEdit!(),
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Sửa',
                      borderRadius:
                          const BorderRadius.horizontal(left: Radius.circular(16)),
                    ),
                  if (onDelete != null)
                    SlidableAction(
                      onPressed: (_) => onDelete!(),
                      backgroundColor: AppColors.error,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Xóa',
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(16)),
                    ),
                ],
              ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(card.term, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w900)),
                    const SizedBox(height: 6),
                    Text(card.definition, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                  ],
                ),
              ),
              if (isBusy)
                const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))
              else
                 Icon(Icons.chevron_right, color: theme.colorScheme.outlineVariant),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- Bottom Sheets Implementation ----------

class _EditSetSheet extends ConsumerStatefulWidget {
  final StudySetModel set;
  final VoidCallback onUpdated;
  final VoidCallback onDeleted;
  const _EditSetSheet({required this.set, required this.onUpdated, required this.onDeleted});

  @override
  ConsumerState<_EditSetSheet> createState() => _EditSetSheetState();
}

class _EditSetSheetState extends ConsumerState<_EditSetSheet> {
  late final TextEditingController _titleCtrl;
  late final TextEditingController _descCtrl;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController(text: widget.set.title);
    _descCtrl = TextEditingController(text: widget.set.description);
  }

  Future<void> _update() async {
     final title = _titleCtrl.text.trim();
    if (title.isEmpty) return;

    setState(() => _busy = true);
    try {
      final repo = ref.read(academyRepositoryProvider);
      final success = await repo.updateStudySet(
        setId: widget.set.id,
        title: title,
        description: _descCtrl.text.trim(),
      );
      if (success) {
        widget.onUpdated();
        if (mounted) Navigator.pop(context);
      }
    } catch (e) {
        if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e'), backgroundColor: AppColors.error));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseSheetWrapper(
      title: 'Cài đặt bộ thẻ',
      busy: _busy,
      child: Column(
        children: [
          TextField(
            controller: _titleCtrl,
            decoration: const InputDecoration(labelText: 'Tên bộ thẻ', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descCtrl,
            maxLines: 3,
            decoration: const InputDecoration(labelText: 'Mô tả', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _busy ? null : () async {
                     final confirmed = await showDialog<bool>(
                       context: context,
                       builder: (ctx) => AlertDialog(
                         title: const Text('Xóa bộ thẻ?'),
                         content: const Text('Tất cả thẻ bên trong sẽ bị xóa vĩnh viễn.'),
                         actions: [
                            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Hủy')),
                            TextButton(
                              onPressed: () => Navigator.pop(ctx, true),
                              style: TextButton.styleFrom(foregroundColor: AppColors.error),
                              child: const Text('Xóa'),
                            ),
                         ],
                       ),
                     );
                     
                     if (confirmed == true && mounted) {
                        setState(() => _busy = true);
                        try {
                           final success = await ref.read(academyRepositoryProvider).deleteStudySet(setId: widget.set.id);
                           if (success && mounted) {
                             Navigator.pop(context);
                             widget.onDeleted();
                           }
                        } finally {
                           if (mounted) setState(() => _busy = false);
                        }
                     }
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.error,
                    side: const BorderSide(color: AppColors.error),
                  ),
                  child: const Text('Xóa bộ thẻ'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: _busy ? null : _update,
                  child: const Text('Cập nhật'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AddCardSheet extends ConsumerStatefulWidget {
  final String setId;
  final VoidCallback onAdded;
  const _AddCardSheet({required this.setId, required this.onAdded});

  @override
  ConsumerState<_AddCardSheet> createState() => _AddCardSheetState();
}

class _AddCardSheetState extends ConsumerState<_AddCardSheet> {
  final _termCtrl = TextEditingController();
  final _defCtrl = TextEditingController();
  final _hintCtrl = TextEditingController();
  bool _busy = false;

  Future<void> _submit() async {
    final term = _termCtrl.text.trim();
    final def = _defCtrl.text.trim();
    if (term.isEmpty || def.isEmpty) return;

    setState(() => _busy = true);
    try {
      final repo = ref.read(academyRepositoryProvider);
      final card = await repo.createStudySetCard(
        setId: widget.setId,
        term: term,
        definition: def,
        hint: _hintCtrl.text.trim(),
      );
      if (card != null) {
        widget.onAdded();
        _termCtrl.clear();
        _defCtrl.clear();
        _hintCtrl.clear();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã thêm thẻ mới!'), duration: Duration(seconds: 1)));
        }
      }
    } catch (e) {
       if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e'), backgroundColor: AppColors.error));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseSheetWrapper(
      title: 'Thêm thẻ mới',
      busy: _busy,
      child: Column(
        children: [
          TextField(controller: _termCtrl, autofocus: true, decoration: const InputDecoration(labelText: 'Thuật ngữ (Ví dụ: Từ vựng)', border: OutlineInputBorder())),
          const SizedBox(height: 16),
          TextField(controller: _defCtrl, decoration: const InputDecoration(labelText: 'Định nghĩa (Ví dụ: Nghĩa tiếng Việt)', border: OutlineInputBorder())),
          const SizedBox(height: 16),
          TextField(controller: _hintCtrl, decoration: const InputDecoration(labelText: 'Gợi ý (không bắt buộc)', border: OutlineInputBorder())),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: _busy ? null : _submit,
              child: const Text('Thêm thẻ'),
            ),
          ),
          const SizedBox(height: 12),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Đã xong')),
        ],
      ),
    );
  }
}

class _EditCardSheet extends ConsumerStatefulWidget {
  final SetCardModel card;
  final VoidCallback onUpdated;
  const _EditCardSheet({required this.card, required this.onUpdated});

  @override
  ConsumerState<_EditCardSheet> createState() => _EditCardSheetState();
}

class _EditCardSheetState extends ConsumerState<_EditCardSheet> {
  late final TextEditingController _termCtrl;
  late final TextEditingController _defCtrl;
  late final TextEditingController _hintCtrl;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _termCtrl = TextEditingController(text: widget.card.term);
    _defCtrl = TextEditingController(text: widget.card.definition);
    _hintCtrl = TextEditingController(text: widget.card.hint);
  }

  Future<void> _submit() async {
    final term = _termCtrl.text.trim();
    final def = _defCtrl.text.trim();
    if (term.isEmpty || def.isEmpty) return;

    setState(() => _busy = true);
    try {
      final repo = ref.read(academyRepositoryProvider);
      final updated = await repo.updateStudySetCard(
        cardId: widget.card.id,
        term: term,
        definition: def,
        hint: _hintCtrl.text.trim(),
      );
      if (updated != null) {
        widget.onUpdated();
        if (mounted) Navigator.pop(context);
      }
    } catch (e) {
        if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e'), backgroundColor: AppColors.error));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseSheetWrapper(
      title: 'Chỉnh sửa thẻ',
      busy: _busy,
      child: Column(
        children: [
          TextField(controller: _termCtrl, decoration: const InputDecoration(labelText: 'Thuật ngữ', border: OutlineInputBorder())),
          const SizedBox(height: 16),
          TextField(controller: _defCtrl, decoration: const InputDecoration(labelText: 'Định nghĩa', border: OutlineInputBorder())),
          const SizedBox(height: 16),
          TextField(controller: _hintCtrl, decoration: const InputDecoration(labelText: 'Gợi ý', border: OutlineInputBorder())),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: _busy ? null : _submit,
              child: const Text('Cập nhật'),
            ),
          ),
        ],
      ),
    );
  }
}
