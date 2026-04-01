import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/jlpt_mock_models.dart';

class JlptMockHistoryDetailScreen extends ConsumerStatefulWidget {
  const JlptMockHistoryDetailScreen({super.key, required this.attemptId});

  final String attemptId;

  @override
  ConsumerState<JlptMockHistoryDetailScreen> createState() =>
      _JlptMockHistoryDetailScreenState();
}

class _JlptMockHistoryDetailScreenState
    extends ConsumerState<JlptMockHistoryDetailScreen> {
  late Future<JlptMockAttemptResultModel?> _future;

  @override
  void initState() {
    super.initState();
    _future = ref
        .read(academyRepositoryProvider)
        .getJlptAttemptResult(widget.attemptId);
  }

  String _fmt(String? iso) {
    if (iso == null || iso.isEmpty) return '--';
    final dt = DateTime.tryParse(iso);
    if (dt == null) return '--';
    return DateFormat('dd/MM/yyyy HH:mm').format(dt.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Kết quả bài thi')),
      body: FutureBuilder<JlptMockAttemptResultModel?>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Lỗi tải kết quả: ${snapshot.error}'),
            );
          }
          final data = snapshot.data;
          if (data == null)
            return const Center(child: Text('Không có dữ liệu kết quả'));
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: theme.colorScheme.outlineVariant),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trạng thái: ${data.status}',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('Cấp độ: ${data.level}'),
                    Text('Bắt đầu: ${_fmt(data.startedAt)}'),
                    Text('Nộp bài: ${_fmt(data.submittedAt)}'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _scoreTile(context, 'Ngôn ngữ', data.languageScaled),
              const SizedBox(height: 10),
              _scoreTile(context, 'Đọc hiểu', data.readingScaled),
              const SizedBox(height: 10),
              _scoreTile(context, 'Nghe hiểu', data.listeningScaled),
              const SizedBox(height: 10),
              _scoreTile(
                context,
                'Tổng điểm',
                data.totalScaled,
                highlight: true,
              ),
              const SizedBox(height: 12),
              if (data.passMock != null)
                Text(
                  data.passMock! ? 'Kết quả: Đạt' : 'Kết quả: Chưa đạt',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: data.passMock!
                        ? theme.colorScheme.primary
                        : theme.colorScheme.error,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _scoreTile(
    BuildContext context,
    String label,
    int? score, {
    bool highlight = false,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: highlight
              ? theme.colorScheme.primary
              : theme.colorScheme.outlineVariant,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            '${score ?? '--'}',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
