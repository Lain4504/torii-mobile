import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../providers/sensei_providers.dart';
import '../../models/sensei_model.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SenseiDrillPage extends ConsumerStatefulWidget {
  const SenseiDrillPage({super.key});

  @override
  ConsumerState<SenseiDrillPage> createState() => _SenseiDrillPageState();
}

class _SenseiDrillPageState extends ConsumerState<SenseiDrillPage> {
  String _selectedLevel = 'N4';
  String _selectedType = 'grammar';
  final TextEditingController _topicController = TextEditingController(text: 'Trợ từ');

  final List<String> _levels = ['N5', 'N4', 'N3', 'N2', 'N1'];
  final Map<String, String> _types = {
    'grammar': 'Ngữ pháp',
    'vocabulary': 'Từ vựng',
    'kanji': 'Hán tự',
    'listening': 'Nghe hiểu',
    'reading': 'Đọc hiểu',
  };

  void _generateDrill() {
    FocusScope.of(context).unfocus();
    final topic = _topicController.text.trim();
    if (topic.isEmpty) return;

    ref.read(senseiDrillProvider.notifier).generateDrill(
          type: _selectedType,
          topic: topic,
          level: _selectedLevel,
          count: 5,
        );
  }

  @override
  void dispose() {
    _topicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final drillState = ref.watch(senseiDrillProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'AI Drill',
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildConfigurationPanel(theme),
            Expanded(
              child: drillState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : drillState.error != null
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Lỗi: ${drillState.error}',
                              style: const TextStyle(color: AppColors.error),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : drillState.response != null
                          ? _DrillListView(response: drillState.response!)
                          : const Center(
                              child: Text(
                                'Cấu hình và bấm "Tạo bài tập" để bắt đầu.',
                                style: TextStyle(color: AppColors.textTertiary),
                              ),
                            ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigurationPanel(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.grey300)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedLevel,
                  decoration: const InputDecoration(
                    labelText: 'Trình độ',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  items: _levels.map((level) {
                    return DropdownMenuItem(value: level, child: Text(level));
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedLevel = val);
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedType,
                  decoration: const InputDecoration(
                    labelText: 'Loại bài',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  items: _types.entries.map((entry) {
                    return DropdownMenuItem(value: entry.key, child: Text(entry.value));
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedType = val);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _topicController,
                  decoration: const InputDecoration(
                    labelText: 'Chủ đề',
                    hintText: 'VD: Trợ từ, Mua sắm...',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: _generateDrill,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textOnPrimary,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                child: const Text('Tạo', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DrillListView extends StatefulWidget {
  final DrillResponse response;
  const _DrillListView({required this.response});

  @override
  State<_DrillListView> createState() => _DrillListViewState();
}

class _DrillListViewState extends State<_DrillListView> {
  final Map<int, String> _selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    if (widget.response.drills.isEmpty) {
      return const Center(child: Text('Không có câu hỏi nào được tạo.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.response.drills.length,
      itemBuilder: (context, index) {
        final drill = widget.response.drills[index];
        final selectedAnswer = _selectedAnswers[index];
        final isAnswered = selectedAnswer != null;
        final isCorrect = selectedAnswer == drill.correctAnswer;

        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: AppColors.grey300),
          ),
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Câu ${index + 1}: ${drill.question}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ...drill.options.map((option) {
                  Color? bgColor;
                  Color? textColor;
                  
                  if (isAnswered) {
                    if (option == drill.correctAnswer) {
                      bgColor = AppColors.success.withOpacity(0.2);
                      textColor = AppColors.success;
                    } else if (option == selectedAnswer) {
                      bgColor = AppColors.error.withOpacity(0.2);
                      textColor = AppColors.error;
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: InkWell(
                      onTap: isAnswered
                          ? null
                          : () {
                              setState(() {
                                _selectedAnswers[index] = option;
                              });
                            },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: bgColor ?? AppColors.background,
                          border: Border.all(
                            color: textColor ?? AppColors.grey300,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(
                            color: textColor ?? AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                if (isAnswered) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isCorrect ? AppColors.success.withOpacity(0.1) : AppColors.error.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              isCorrect ? Icons.check_circle : Icons.cancel,
                              color: isCorrect ? AppColors.success : AppColors.error,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              isCorrect ? 'Chính xác!' : 'Chưa chính xác!',
                              style: TextStyle(
                                color: isCorrect ? AppColors.success : AppColors.error,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Giải thích:',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        MarkdownBody(
                          data: drill.explanation,
                          styleSheet: MarkdownStyleSheet(
                            p: const TextStyle(fontSize: 14, height: 1.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
