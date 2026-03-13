import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide-react/lucide-react.dart';
import '../../../../core/constants/app_design_system.dart';
import '../providers/sensei_providers.dart';

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

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('AI Dịch thuật & Ngữ pháp', 
          style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Language Selector
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                   _LanguageDrop(
                    value: _sourceLang,
                    onChanged: (val) => setState(() => _sourceLang = val!),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(LucideIcons.arrow_right_left, size: 20),
                    onPressed: _swapLanguages,
                    color: AppColors.primary,
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: _textController,
                      maxLines: 5,
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                        hintText: 'Nhập văn bản cần dịch...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(LucideIcons.volume_2, size: 20),
                          onPressed: () {},
                        ),
                        if (_textController.text.isNotEmpty)
                          IconButton(
                            icon: const Icon(LucideIcons.x, size: 20),
                            onPressed: () => setState(() => _textController.clear()),
                          ),
                        const Spacer(),
                        ElevatedButton.icon(
                          onPressed: translatorState.isLoading ? null : _handleTranslate,
                          icon: translatorState.isLoading 
                            ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                            : const Icon(LucideIcons.languages, size: 16),
                          label: const Text('Dịch'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
                padding: const EdgeInsets.all(16),
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
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(LucideIcons.copy, size: 20),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: translatorState.translation!.translatedText));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Đã sao chép!')),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(LucideIcons.volume_2, size: 20),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            // Grammar Check Prompt
            if (translatorState.translation != null && grammarState.response == null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.success.withOpacity(0.1)),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phân tích ngữ pháp', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Kiểm tra lỗi và gợi ý cách dùng từ tự nhiên hơn.', 
                              style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: grammarState.isLoading ? null : _handleGrammarCheck,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success,
                          foregroundColor: Colors.white,
                        ),
                        child: grammarState.isLoading 
                          ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                          : const Text('Phân tích'),
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
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
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
                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              const Text('Phân tích ngữ pháp', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          _ResultBox(title: 'Câu gốc', text: response.originalText, color: Colors.grey[100]!),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Icon(LucideIcons.chevron_down, size: 20, color: Colors.grey),
          ),
          _ResultBox(title: 'Đề xuất', text: response.correctedText, color: AppColors.primary.withOpacity(0.05), textColor: AppColors.primary),
          
          if (response.errors.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Text('Lỗi & Chỉnh sửa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 8),
            ...response.errors.map((e) => _ErrorItem(error: e)).toList(),
          ],

          if (response.suggestions.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Text('Cách diễn đạt khác', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: response.suggestions.map<Widget>((s) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(s.toString(), style: const TextStyle(fontSize: 12)),
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
          Text(title.toUpperCase(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey[600])),
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
        color: Colors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(error.issue, style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontWeight: FontWeight.bold)),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: Icon(LucideIcons.arrow_right, size: 14)),
              Text(error.correction, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(border: Border.all(color: AppColors.primary), borderRadius: BorderRadius.circular(4)),
                child: Text(error.type, style: const TextStyle(fontSize: 8, color: AppColors.primary, fontWeight: FontWeight.bold)),
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
