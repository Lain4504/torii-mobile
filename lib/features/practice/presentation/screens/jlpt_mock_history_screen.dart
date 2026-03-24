import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/jlpt_mock_models.dart';

class JlptMockHistoryScreen extends ConsumerStatefulWidget {
  const JlptMockHistoryScreen({super.key});

  @override
  ConsumerState<JlptMockHistoryScreen> createState() =>
      _JlptMockHistoryScreenState();
}

class _JlptMockHistoryScreenState extends ConsumerState<JlptMockHistoryScreen> {
  late Future<List<JlptMockAttemptHistoryItemModel>> _future;

  @override
  void initState() {
    super.initState();
    _future = ref.read(academyRepositoryProvider).getJlptAttemptHistory();
  }

  String _fmt(String? iso) {
    if (iso == null || iso.isEmpty) return '--';
    final dt = DateTime.tryParse(iso);
    if (dt == null) return '--';
    return DateFormat('dd/MM/yyyy HH:mm').format(dt.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lich su JLPT')),
      body: FutureBuilder<List<JlptMockAttemptHistoryItemModel>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Loi tai lich su: ${snapshot.error}'));
          }
          final items = snapshot.data ?? const [];
          if (items.isEmpty)
            return const Center(child: Text('Chua co lich su lam bai'));
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                tileColor: Theme.of(context).colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
                title: Text(item.templateTitle),
                subtitle: Text(
                  '${item.level} - ${item.status}\n${_fmt(item.submittedAt ?? item.startedAt)}',
                ),
                isThreeLine: true,
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.push('/jlpt-mock/history/${item.id}'),
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
