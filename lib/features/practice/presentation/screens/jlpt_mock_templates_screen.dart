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
      ).showSnackBar(const SnackBar(content: Text('Khong the bat dau de thi')));
      return;
    }
    final endsAt = started.endsAt == null
        ? ''
        : '&endsAt=${Uri.encodeQueryComponent(started.endsAt!)}';
    context.push(
      '/jlpt-mock/exam?templateId=${item.id}&attemptId=${started.attemptId}&sectionOrder=1&level=${widget.levelCode}$endsAt',
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('De thi ${widget.levelCode.toUpperCase()}')),
      body: FutureBuilder<List<JlptMockTemplateItemModel>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Loi tai danh sach de: ${snapshot.error}'),
            );
          }
          final items = snapshot.data ?? const [];
          if (items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Chua co de thi mo phong cho cap do nay',
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
                onTap: _starting ? null : () => _startAttempt(item),
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
                              '${item.code} - ${(item.totalDurationMinutes ?? 0)} phut',
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
