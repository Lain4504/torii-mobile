import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../models/notebook_model.dart';
import '../providers/notebook_providers.dart';

class NotebookListPage extends ConsumerStatefulWidget {
  const NotebookListPage({super.key});

  @override
  ConsumerState<NotebookListPage> createState() => _NotebookListPageState();
}

class _NotebookListPageState extends ConsumerState<NotebookListPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notebookListProvider.notifier).loadNotebooks();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showCreateNotebookModal() {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    bool isPublic = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.card)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: AppSpacing.xl,
            right: AppSpacing.xl,
            top: AppSpacing.xl,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tạo sổ tay mới', style: TextStyle(fontSize: 20, fontWeight: AppTypography.black)),
              const SizedBox(height: AppSpacing.lg),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Tên sổ tay',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              TextField(
                controller: descController,
                decoration: InputDecoration(
                  labelText: 'Mô tả (tùy chọn)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  const Text('Công khai:', style: TextStyle(fontWeight: AppTypography.medium)),
                  const Spacer(),
                  Switch(
                    value: isPublic,
                    activeColor: AppColors.primary,
                    onChanged: (val) => setState(() => isPublic = val),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                text: 'TẠO',
                isFullWidth: true,
                onPressed: () async {
                  if (nameController.text.trim().isEmpty) return;
                  final success = await ref.read(notebookListProvider.notifier).createNotebook(
                    nameController.text.trim(),
                    descController.text.trim().isEmpty ? null : descController.text.trim(),
                    isPublic,
                  );
                  if (success) {
                    if (context.mounted) Navigator.pop(context);
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Không thể tạo sổ tay')),
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notebookListProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              TabBar(
                controller: _tabController,
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.textSecondary,
                indicatorColor: AppColors.primary,
                tabs: const [
                  Tab(text: 'Của tôi'),
                  Tab(text: 'Khám phá'),
                ],
              ),
              Expanded(
                child: state.isLoading && state.myNotebooks.isEmpty && state.publicNotebooks.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : TabBarView(
                        controller: _tabController,
                        children: [
                          _buildNotebookList(state.myNotebooks, isOwner: true),
                          _buildNotebookList(state.publicNotebooks, isOwner: false),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateNotebookModal,
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
            onPressed: () => context.pop(),
          ),
          const SizedBox(width: AppSpacing.sm),
          const Text(
            'SỔ TAY TỪ VỰNG',
            style: TextStyle(
              fontFamily: AppTypography.fontFamilySerif,
              fontWeight: AppTypography.black,
              fontSize: 18,
              letterSpacing: 2.0,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotebookList(List<Notebook> notebooks, {required bool isOwner}) {
    if (notebooks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.book_rounded, size: 64, color: AppColors.grey300),
            const SizedBox(height: AppSpacing.lg),
            Text(
              isOwner ? 'Chưa có sổ tay nào' : 'Chưa có sổ tay công khai nào',
              style: const TextStyle(fontSize: 16, color: AppColors.textSecondary),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(notebookListProvider.notifier).loadNotebooks(),
      child: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.md),
        itemCount: notebooks.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
        itemBuilder: (context, index) {
          final nb = notebooks[index];
          return GestureDetector(
            onTap: () => context.push('/notebooks/${nb.id}'),
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(AppRadius.xl),
                border: Border.all(color: AppColors.grey300.withValues(alpha: 0.5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.menu_book_rounded, color: AppColors.primary),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          nb.name,
                          style: const TextStyle(fontSize: 16, fontWeight: AppTypography.bold),
                        ),
                      ),
                      if (nb.isPublic)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text('Công khai', style: TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: AppTypography.bold)),
                        ),
                    ],
                  ),
                  if (nb.description != null && nb.description!.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      nb.description!,
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: AppSpacing.md),
                  Text('${nb.entryCount} từ', style: const TextStyle(fontSize: 12, color: AppColors.textTertiary, fontWeight: AppTypography.bold)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
