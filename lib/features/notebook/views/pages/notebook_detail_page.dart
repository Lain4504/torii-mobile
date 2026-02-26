import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../models/notebook_model.dart';
import '../providers/notebook_providers.dart';

class NotebookDetailPage extends ConsumerStatefulWidget {
  final String notebookId;

  const NotebookDetailPage({super.key, required this.notebookId});

  @override
  ConsumerState<NotebookDetailPage> createState() => _NotebookDetailPageState();
}

class _NotebookDetailPageState extends ConsumerState<NotebookDetailPage> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showAddWordModal(BuildContext context, {NoteEntry? existingEntry}) {
    final wordController = TextEditingController(text: existingEntry?.word ?? '');
    final phoneticController = TextEditingController(text: existingEntry?.phonetic ?? '');
    final meaningController = TextEditingController(text: existingEntry?.meaning ?? '');
    final noteController = TextEditingController(text: existingEntry?.note ?? '');
    String partOfSpeech = existingEntry?.partOfSpeech ?? 'noun';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.card))),
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: AppSpacing.xl,
            right: AppSpacing.xl,
            top: AppSpacing.xl,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(existingEntry == null ? 'Thêm từ mới' : 'Sửa từ', style: const TextStyle(fontSize: 20, fontWeight: AppTypography.black)),
                const SizedBox(height: AppSpacing.lg),
                TextField(
                  controller: wordController,
                  decoration: InputDecoration(
                    labelText: 'Từ vựng *',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                TextField(
                  controller: phoneticController,
                  decoration: InputDecoration(
                    labelText: 'Phiên âm (tùy chọn)',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                TextField(
                  controller: meaningController,
                  decoration: InputDecoration(
                    labelText: 'Nghĩa *',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                DropdownButtonFormField<String>(
                  value: partOfSpeech,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: 'Từ loại',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'noun', child: Text('Danh từ')),
                    DropdownMenuItem(value: 'verb', child: Text('Động từ')),
                    DropdownMenuItem(value: 'adjective', child: Text('Tính từ')),
                    DropdownMenuItem(value: 'adverb', child: Text('Trạng từ')),
                    DropdownMenuItem(value: 'particle', child: Text('Trợ từ')),
                    DropdownMenuItem(value: 'other', child: Text('Khác')),
                  ],
                  onChanged: (val) => setState(() => partOfSpeech = val ?? 'noun'),
                ),
                const SizedBox(height: AppSpacing.md),
                TextField(
                  controller: noteController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Ghi chú (tùy chọn)',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                AppButton(
                  text: 'LƯU',
                  isFullWidth: true,
                  onPressed: () async {
                    if (wordController.text.trim().isEmpty || meaningController.text.trim().isEmpty) return;
                    
                    try {
                      final repo = ref.read(notebookRepositoryProvider);
                      if (existingEntry == null) {
                        await repo.addEntry(
                          widget.notebookId,
                          word: wordController.text.trim(),
                          phonetic: phoneticController.text.trim().isEmpty ? null : phoneticController.text.trim(),
                          meaning: meaningController.text.trim(),
                          note: noteController.text.trim().isEmpty ? null : noteController.text.trim(),
                          partOfSpeech: partOfSpeech,
                        );
                      } else {
                        await repo.updateEntry(
                          widget.notebookId,
                          existingEntry.id,
                          word: wordController.text.trim(),
                          phonetic: phoneticController.text.trim().isEmpty ? null : phoneticController.text.trim(),
                          meaning: meaningController.text.trim(),
                          note: noteController.text.trim().isEmpty ? null : noteController.text.trim(),
                          partOfSpeech: partOfSpeech,
                        );
                      }
                      ref.invalidate(notebookDetailProvider(widget.notebookId));
                      if (context.mounted) Navigator.pop(context);
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e')));
                      }
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _deleteEntry(String entryId) async {
    try {
      await ref.read(notebookRepositoryProvider).deleteEntry(widget.notebookId, entryId);
      ref.invalidate(notebookDetailProvider(widget.notebookId));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Không thể xóa: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncNotebook = ref.watch(notebookDetailProvider(widget.notebookId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: asyncNotebook.when(
          data: (notebook) => Text(
            notebook.name.toUpperCase(),
            style: const TextStyle(
              fontFamily: AppTypography.fontFamilySerif,
              fontWeight: AppTypography.black,
              fontSize: 16,
              letterSpacing: 1.0,
              color: AppColors.textPrimary,
            ),
          ),
          loading: () => const Text(''),
          error: (_, __) => const Text(''),
        ),
        actions: [
          asyncNotebook.maybeWhen(
            data: (notebook) => IconButton(
              icon: const Icon(Icons.add_circle_outline_rounded, color: AppColors.primary),
              onPressed: () => _showAddWordModal(context),
            ),
            orElse: () => const SizedBox(),
          )
        ],
      ),
      body: asyncNotebook.when(
        data: (notebook) {
          final entries = notebook.entries.where((e) {
            if (_searchQuery.isEmpty) return true;
            final query = _searchQuery.toLowerCase();
            return e.word.toLowerCase().contains(query) || e.meaning.toLowerCase().contains(query);
          }).toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                child: TextField(
                  controller: _searchController,
                  onChanged: (val) => setState(() => _searchQuery = val),
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm từ vựng...',
                    prefixIcon: const Icon(Icons.search_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColors.surface,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: entries.isEmpty
                    ? Center(
                        child: Text(
                          _searchQuery.isEmpty ? 'Chưa có từ vựng nào' : 'Không tìm thấy kết quả',
                          style: const TextStyle(color: AppColors.textSecondary),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        itemCount: entries.length,
                        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
                        itemBuilder: (context, index) {
                          final entry = entries[index];
                          return Container(
                            padding: const EdgeInsets.all(AppSpacing.md),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(AppRadius.lg),
                              border: Border.all(color: AppColors.grey200),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(entry.word, style: const TextStyle(fontSize: 18, fontWeight: AppTypography.black)),
                                          if (entry.phonetic != null) ...[
                                            const SizedBox(width: 8),
                                            Text('[${entry.phonetic}]', style: const TextStyle(fontSize: 14, color: AppColors.textTertiary)),
                                          ],
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(entry.meaning, style: const TextStyle(fontSize: 15, fontWeight: AppTypography.medium)),
                                      if (entry.note != null) ...[
                                        const SizedBox(height: 4),
                                        Text(entry.note!, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, fontStyle: FontStyle.italic)),
                                      ],
                                    ],
                                  ),
                                ),
                                PopupMenuButton<String>(
                                  icon: const Icon(Icons.more_vert_rounded, color: AppColors.textTertiary),
                                  onSelected: (val) {
                                    if (val == 'edit') {
                                      _showAddWordModal(context, existingEntry: entry);
                                    } else if (val == 'delete') {
                                      _deleteEntry(entry.id);
                                    }
                                  },
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(value: 'edit', child: Text('Sửa')),
                                    const PopupMenuItem(value: 'delete', child: Text('Xóa', style: TextStyle(color: AppColors.error))),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}
