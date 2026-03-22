import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../providers/sensei_providers.dart';

class SenseiTranslatePage extends ConsumerStatefulWidget {
  const SenseiTranslatePage({super.key});

  @override
  ConsumerState<SenseiTranslatePage> createState() => _SenseiTranslatePageState();
}

class _SenseiTranslatePageState extends ConsumerState<SenseiTranslatePage> {
  final TextEditingController _textController = TextEditingController();
  String _sourceLang = 'ja';
  String _targetLang = 'vi';

  void _handleTranslate() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    ref.read(translatorProvider.notifier).translate(
          text: text,
          sourceLang: _sourceLang,
          targetLang: _targetLang,
        );
    
    // Clear grammar check when translating new text
    ref.read(grammarCheckProvider.notifier).clear();
  }

  void _handleGrammarCheck() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    ref.read(grammarCheckProvider.notifier).checkGrammar(text);
  }

  void _swapLanguages() {
    setState(() {
      final temp = _sourceLang;
      _sourceLang = _targetLang;
      _targetLang = temp;
    });
    _handleTranslate();
  }

  @override
  Widget build(BuildContext context) {
    final translatorState = ref.watch(translatorProvider);
    final grammarState = ref.watch(grammarCheckProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'AI Dịch thuật',
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
          child: Column(
            children: [
            // Language Selector
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Row(
                children: [
                   _LanguageDrop(
                    value: _sourceLang,
                    onChanged: (val) => setState(() => _sourceLang = val!),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.swap_horiz, size: 20),
                    onPressed: _swapLanguages,
                    color: AppColors.primary,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints.tightFor(width: 36, height: 36),
                  ),
                  const Spacer(),
                  _LanguageDrop(
                    value: _targetLang,
                    onChanged: (val) => setState(() => _targetLang = val!),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Input Card
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      controller: _textController,
                      maxLines: 4,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        hintText: 'Nhập văn bản cần dịch...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.volume_up, size: 20),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints.tightFor(width: 36, height: 36),
                        ),
                        if (_textController.text.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.close, size: 20),
                            onPressed: () => setState(() => _textController.clear()),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints.tightFor(width: 36, height: 36),
                          ),
                        const Spacer(),
                        ElevatedButton.icon(
                          onPressed: translatorState.isLoading ? null : _handleTranslate,
                          icon: translatorState.isLoading 
                            ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                            : const Icon(Icons.translate, size: 16),
                          label: const Text('Dịch'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.textOnPrimary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Result Card
            if (translatorState.translation != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary.withOpacity(0.1)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translatorState.translation!.translatedText,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.copy, size: 20),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: translatorState.translation!.translatedText));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Đã sao chép!')),
                            );
                          },
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints.tightFor(width: 36, height: 36),
                        ),
                        IconButton(
                          icon: const Icon(Icons.volume_up, size: 20),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints.tightFor(width: 36, height: 36),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            // Grammar Check Prompt
            if (translatorState.translation != null && grammarState.response == null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.success.withOpacity(0.1)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phân tích ngữ pháp',
                              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Kiểm tra lỗi và gợi ý cách dùng từ tự nhiên hơn.',
                              style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: grammarState.isLoading ? null : _handleGrammarCheck,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success,
                          foregroundColor: AppColors.textOnPrimary,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: grammarState.isLoading 
                          ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: AppColors.textOnPrimary, strokeWidth: 2))
                          : const Text('Phân tích', style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                ),
              ),

            // Grammar Result
            if (grammarState.response != null)
              _GrammarResultView(response: grammarState.response!),
          ],
        ),
      ),
      ),
    );
  }
}

class _LanguageDrop extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;

  const _LanguageDrop({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items: const [
        DropdownMenuItem(value: 'ja', child: Text('Tiếng Nhật')),
        DropdownMenuItem(value: 'vi', child: Text('Tiếng Việt')),
        DropdownMenuItem(value: 'en', child: Text('Tiếng Anh')),
      ],
      onChanged: onChanged,
      underline: const SizedBox(),
      style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary),
    );
  }
}

class _GrammarResultView extends StatelessWidget {
  final dynamic response; // GrammarCheckResponse

  const _GrammarResultView({required this.response});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(12),
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: response.isCorrect ? AppColors.success : AppColors.error,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  response.isCorrect ? 'CHÍNH XÁC' : 'CẦN LƯU Ý',
                  style: const TextStyle(color: AppColors.textOnPrimary, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Text('Phân tích ngữ pháp', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 12),
          _ResultBox(title: 'Câu gốc', text: response.originalText, color: AppColors.grey200),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Icon(Icons.expand_more, size: 20, color: AppColors.textTertiary),
          ),
          _ResultBox(title: 'Đề xuất', text: response.correctedText, color: AppColors.primary.withOpacity(0.05), textColor: AppColors.primary),
          
          if (response.errors.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text('Lỗi & Chỉnh sửa', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            ...response.errors.map((e) => _ErrorItem(error: e)).toList(),
          ],

          if (response.suggestions.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text('Cách diễn đạt khác', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: response.suggestions.map<Widget>((s) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey300),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(s.toString(),
                        style: theme.textTheme.bodySmall?.copyWith(fontSize: 11.5)),
                  )).toList(),
            ),
          ],
        ],
      ),
    );
  }
}

class _ResultBox extends StatelessWidget {
  final String title;
  final String text;
  final Color color;
  final Color? textColor;

  const _ResultBox({required this.title, required this.text, required this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.grey700)),
          const SizedBox(height: 4),
          Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
        ],
      ),
    );
  }
}

class _ErrorItem extends StatelessWidget {
  final dynamic error;

  const _ErrorItem({required this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.borderLight),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(error.issue,
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.textTertiary,
                      fontWeight: FontWeight.bold)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Icon(Icons.arrow_right, size: 14),
              ),
              Text(error.correction,
                  style: const TextStyle(
                      color: AppColors.primary, fontWeight: FontWeight.bold)),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(error.type,
                    style: const TextStyle(
                        fontSize: 8,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(error.explanation, style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
