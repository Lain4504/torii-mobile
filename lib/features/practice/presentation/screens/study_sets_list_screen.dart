import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/core/widgets/base_sheet_wrapper.dart';
import 'package:torii_app/data/models/study_set_models.dart';

class StudySetsListScreen extends ConsumerStatefulWidget {
  const StudySetsListScreen({super.key});

  @override
  ConsumerState<StudySetsListScreen> createState() => _StudySetsListScreenState();
}

class _StudySetsListScreenState extends ConsumerState<StudySetsListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Thẻ ghi nhớ',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: 0.2,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          unselectedLabelStyle: theme.textTheme.titleSmall,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: const [
            Tab(text: 'Cá nhân'),
            Tab(text: 'Khám phá'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => _showCreateSetSheet(context),
            icon: const Icon(Icons.add_circle_outline),
            tooltip: 'Tạo bộ thẻ mới',
          ),
        ],
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              controller: _searchController,
              onChanged: (val) => setState(() => _searchQuery = val),
              decoration: InputDecoration(
                hintText: 'Tìm kiếm bộ thẻ...',
                prefixIcon: const Icon(Icons.search, size: 20),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 20),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                filled: true,
                fillColor: theme.colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildSetsGrid(ref.watch(studySetsProvider)),
                _buildSetsGrid(ref.watch(publicStudySetsProvider(_searchQuery))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSetsGrid(AsyncValue<List<StudySetModel>> setsAsync) {
    final theme = Theme.of(context);
    return setsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: theme.colorScheme.error))),
      data: (sets) {
        final filteredSets = _searchQuery.isEmpty 
            ? sets 
            : sets.where((s) => s.title.toLowerCase().contains(_searchQuery.toLowerCase())).toList();

        if (filteredSets.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search_off_rounded,
                    size: 48, color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.3)),
                const SizedBox(height: 16),
                Text('Không tìm thấy bộ thẻ nào',
                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(studySetsProvider);
            ref.invalidate(publicStudySetsProvider(_searchQuery));
          },
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => _StudySetCard(set: filteredSets[index]),
            itemCount: filteredSets.length,
          ),
        );
      },
    );
  }

  void _showCreateSetSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _CreateSetSheet(onCreated: () {
        ref.invalidate(studySetsProvider);
      }),
    );
  }
}

class _StudySetCard extends StatelessWidget {
  final StudySetModel set;
  const _StudySetCard({required this.set});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Hero(
      tag: 'study_set_${set.id}',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.push('/study-sets/${set.id}'),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: theme.colorScheme.outlineVariant),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.style_rounded,
                        size: 40,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        set.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.layers_outlined, size: 14, color: theme.colorScheme.onSurfaceVariant),
                          const SizedBox(width: 4),
                          Text(
                            '${set.cardCount} thẻ',
                            style: theme.textTheme.labelSmall
                                ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ],
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

class _EmptySetsView extends StatelessWidget {
  final VoidCallback onCreate;
  const _EmptySetsView({required this.onCreate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.layers_clear_outlined, size: 80, color: theme.colorScheme.primary.withValues(alpha: 0.2)),
            const SizedBox(height: 24),
            Text('Chưa có bộ thẻ nào', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text(
              'Tạo bộ thẻ để bắt đầu học từ vựng theo cách của riêng bạn.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: onCreate,
              icon: const Icon(Icons.add),
              label: const Text('Tạo bộ thẻ mới'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateSetSheet extends StatefulWidget {
  final VoidCallback onCreated;
  const _CreateSetSheet({required this.onCreated});

  @override
  State<_CreateSetSheet> createState() => _CreateSetSheetState();
}

class _CreateSetSheetState extends State<_CreateSetSheet> {
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  bool _busy = false;

  Future<void> _submit(WidgetRef ref) async {
    final title = _titleCtrl.text.trim();
    if (title.isEmpty) return;

    setState(() => _busy = true);
    try {
      final repo = ref.read(academyRepositoryProvider);
      final set = await repo.createStudySet(title: title, description: _descCtrl.text.trim());
      if (set != null) {
        widget.onCreated();
        if (mounted) Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Lỗi: $e'), backgroundColor: AppColors.error));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseSheetWrapper(
      title: 'Tạo bộ thẻ mới',
      busy: _busy,
      child: Column(
        children: [
          TextField(
            controller: _titleCtrl,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'Tên bộ thẻ *', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descCtrl,
            maxLines: 3,
            decoration: const InputDecoration(labelText: 'Mô tả', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: Consumer(builder: (context, ref, _) {
              return ElevatedButton(
                onPressed: _busy ? null : () => _submit(ref as WidgetRef),
                style:
                    ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                child: Text(_busy ? 'Đang tạo...' : 'Tạo bộ thẻ'),
              );
            }),
          ),
        ],
      ),
    );
  }
}

