import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/jlpt_mock_models.dart';

class JlptMockTemplatesScreen extends ConsumerStatefulWidget {
  const JlptMockTemplatesScreen({super.key, required this.levelCode});

  final String levelCode;

  @override
  ConsumerState<JlptMockTemplatesScreen> createState() =>
      _JlptMockTemplatesScreenState();
}

class _JlptMockTemplatesScreenState
    extends ConsumerState<JlptMockTemplatesScreen> {
  late Future<List<JlptMockTemplateItemModel>> _future;
  bool _starting = false;
  JlptMockTemplateItemModel? _pendingStartItem;

  @override
  void initState() {
    super.initState();
    _future = ref
        .read(academyRepositoryProvider)
        .getJlptMockTemplates(levelCode: widget.levelCode);
  }

  Future<void> _startAttempt(JlptMockTemplateItemModel item) async {
    if (_starting) return;
    setState(() => _starting = true);
    final repo = ref.read(academyRepositoryProvider);
    final started = await repo.startJlptAttempt(templateId: item.id);
    setState(() => _starting = false);
    if (!mounted) return;
    if (started == null || started.attemptId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        const SnackBar(content: Text('Không thể bắt đầu đề thi')),
      );
      return;
    }
    final endsAt = started.endsAt == null
        ? ''
        : '&endsAt=${Uri.encodeQueryComponent(started.endsAt!)}';
    context.push(
      '/jlpt-mock/exam?templateId=${item.id}&attemptId=${started.attemptId}&sectionOrder=1&level=${widget.levelCode}$endsAt',
    );
  }

  Future<void> _confirmStartDialog(JlptMockTemplateItemModel item) async {
    setState(() => _pendingStartItem = item);
    await showDialog<void>(
      context: context,
      builder: (context) {
        final pending = _pendingStartItem;
        return AlertDialog(
          title: const Text('Vào phòng thi thử?'),
          content: Text(
            pending == null
                ? 'Thời gian làm bài sẽ bắt đầu ngay sau khi xác nhận.'
                : 'Bạn sắp bắt đầu đề "${pending.title}". Thời gian làm bài sẽ bắt đầu ngay sau khi xác nhận.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Quay lại'),
            ),
            FilledButton(
              onPressed: _starting
                  ? null
                  : () async {
                      if (pending == null) return;
                      Navigator.pop(context);
                      await _startAttempt(pending);
                    },
              child: const Text('Vào phòng thi'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Đề thi ${widget.levelCode.toUpperCase()}'),
      ),
      body: FutureBuilder<List<JlptMockTemplateItemModel>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Lỗi tải danh sách đề: ${snapshot.error}'),
            );
          }
          final items = snapshot.data ?? const [];
          if (items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Chưa có đề thi mô phỏng cho cấp độ này',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            itemBuilder: (context, index) {
              final item = items[index];
              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: _starting ? null : () => _confirmStartDialog(item),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: theme.colorScheme.outlineVariant),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.12,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.assignment_rounded),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '${item.code} - ${(item.totalDurationMinutes ?? 0)} phút',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_starting)
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      else
                        const Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemCount: items.length,
          );
        },
      ),
    );
  }
}
