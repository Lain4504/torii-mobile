import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../models/sensei_model.dart';
import '../../providers/sensei_providers.dart';

/// Nền body giống [StudySetMatchScreen].
const _kSenseiGameBg = Color(0xFFF0F4F8);

class SenseiTranslatePage extends ConsumerStatefulWidget {
  const SenseiTranslatePage({super.key});

  @override
  ConsumerState<SenseiTranslatePage> createState() => _SenseiTranslatePageState();
}

class _SenseiTranslatePageState extends ConsumerState<SenseiTranslatePage> {
  final TextEditingController _textController = TextEditingController();
  String _sourceLang = 'ja';
  String _targetLang = 'vi';

  @override
  void initState() {
    super.initState();
    _textController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _handleTranslate() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    ref.read(translatorProvider.notifier).translate(
          text: text,
          sourceLang: _sourceLang,
          targetLang: _targetLang,
        );

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

  static BoxDecoration _cardDecoration({Color? borderColor}) {
    return BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: borderColor ?? AppColors.grey300),
      boxShadow: [
        BoxShadow(
          color: AppColors.textPrimary.withValues(alpha: 0.04),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final translatorState = ref.watch(translatorProvider);
    final grammarState = ref.watch(grammarCheckProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: _kSenseiGameBg,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.textPrimary),
          onPressed: () {
            if (context.canPop()) context.pop();
          },
        ),
        title: Text(
          'AI Dịch thuật',
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
        ),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: _cardDecoration(),
                child: Row(
                  children: [
                    Icon(Icons.translate_rounded, size: 20, color: AppColors.primary.withValues(alpha: 0.9)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Chọn ngôn ngữ nguồn và đích, nhập câu rồi bấm Dịch.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: _cardDecoration(),
                child: Row(
                  children: [
                    Expanded(
                      child: _LanguageDrop(
                        value: _sourceLang,
                        onChanged: (val) => setState(() => _sourceLang = val!),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.swap_horiz_rounded, color: AppColors.primary.withValues(alpha: 0.95)),
                      onPressed: _swapLanguages,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints.tightFor(width: 40, height: 40),
                    ),
                    Expanded(
                      child: _LanguageDrop(
                        value: _targetLang,
                        onChanged: (val) => setState(() => _targetLang = val!),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: _cardDecoration(),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
                      child: TextField(
                        controller: _textController,
                        maxLines: 5,
                        minLines: 3,
                        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600, height: 1.35),
                        decoration: InputDecoration(
                          hintText: 'Nhập văn bản cần dịch…',
                          hintStyle: TextStyle(color: AppColors.textTertiary.withValues(alpha: 0.85)),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    Divider(height: 1, thickness: 1, color: AppColors.grey300.withValues(alpha: 0.9)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 6, 10, 10),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.volume_up_rounded, size: 22, color: AppColors.textSecondary.withValues(alpha: 0.85)),
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints.tightFor(width: 40, height: 40),
                          ),
                          if (_textController.text.isNotEmpty)
                            IconButton(
                              icon: const Icon(Icons.close_rounded, size: 22),
                              color: AppColors.textTertiary,
                              onPressed: () => setState(() => _textController.clear()),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints.tightFor(width: 40, height: 40),
                            ),
                          const Spacer(),
                          SizedBox(
                            height: 44,
                            child: ElevatedButton.icon(
                              onPressed: translatorState.isLoading ? null : _handleTranslate,
                              icon: translatorState.isLoading
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.textOnPrimary),
                                    )
                                  : const Icon(Icons.translate_rounded, size: 18),
                              label: const Text('Dịch', style: TextStyle(fontWeight: FontWeight.w900)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.textOnPrimary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (translatorState.translation != null) ...[
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primary.withValues(alpha: 0.22)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.06),
                        blurRadius: 14,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 4,
                            height: 16,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Bản dịch',
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SelectableText(
                        translatorState.translation!.translatedText,
                        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, height: 1.4),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.copy_rounded, size: 22),
                            color: AppColors.textSecondary,
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: translatorState.translation!.translatedText));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Đã sao chép!')),
                              );
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints.tightFor(width: 40, height: 40),
                          ),
                          IconButton(
                            icon: Icon(Icons.volume_up_rounded, size: 22, color: AppColors.textSecondary.withValues(alpha: 0.85)),
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints.tightFor(width: 40, height: 40),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              if (translatorState.translation != null && grammarState.response == null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.success.withValues(alpha: 0.35)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.success.withValues(alpha: 0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phân tích ngữ pháp',
                                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w900),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Kiểm tra lỗi và gợi ý cách dùng từ tự nhiên hơn.',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: AppColors.textTertiary,
                                  height: 1.35,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 44,
                          child: ElevatedButton(
                            onPressed: grammarState.isLoading ? null : _handleGrammarCheck,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.success,
                              foregroundColor: AppColors.textOnPrimary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                            ),
                            child: grammarState.isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: AppColors.textOnPrimary,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('Phân tích', style: TextStyle(fontWeight: FontWeight.w900)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
      isExpanded: true,
      items: const [
        DropdownMenuItem(value: 'ja', child: Text('Tiếng Nhật')),
        DropdownMenuItem(value: 'vi', child: Text('Tiếng Việt')),
        DropdownMenuItem(value: 'en', child: Text('Tiếng Anh')),
      ],
      onChanged: onChanged,
      underline: const SizedBox.shrink(),
      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: AppColors.textPrimary),
      icon: Icon(Icons.expand_more_rounded, color: AppColors.textTertiary.withValues(alpha: 0.9)),
    );
  }
}

class _GrammarResultView extends StatelessWidget {
  final dynamic response;

  const _GrammarResultView({required this.response});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey300),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: response.isCorrect ? AppColors.success : AppColors.error,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    response.isCorrect ? 'CHÍNH XÁC' : 'CẦN LƯU Ý',
                    style: const TextStyle(
                      color: AppColors.textOnPrimary,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Phân tích ngữ pháp',
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _ResultBox(
            title: 'Câu gốc',
            text: response.originalText?.toString() ?? '',
            color: AppColors.background,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Icon(Icons.expand_more_rounded, size: 22, color: AppColors.textTertiary.withValues(alpha: 0.7)),
          ),
          _ResultBox(
            title: 'Đề xuất',
            text: response.correctedText?.toString() ?? '',
            color: AppColors.primary.withValues(alpha: 0.07),
            textColor: AppColors.primary,
          ),
          if (response.errors.isNotEmpty) ...[
            const SizedBox(height: 14),
            Text(
              'Lỗi & chỉnh sửa',
              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            ...response.errors.map((e) => _ErrorItem(error: e)).toList(),
          ],
          if (response.suggestions.isNotEmpty) ...[
            const SizedBox(height: 14),
            Text(
              'Gợi ý thêm',
              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            ...response.suggestions.map<Widget>((s) {
              final t = s.toString();
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.grey300),
                  ),
                  child: Text(
                    t,
                    style: theme.textTheme.bodySmall?.copyWith(
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              );
            }).toList(),
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
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey300.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.4,
              color: AppColors.grey700.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 6),
          SelectableText(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              height: 1.4,
              color: textColor ?? AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorItem extends StatelessWidget {
  final GrammarError error;

  const _ErrorItem({required this.error});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final issue = error.issue;
    final correction = error.correction;
    final explanation = error.explanation;
    final type = error.type;
    final location = error.location;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.grey300),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              if (type.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary.withValues(alpha: 0.45)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    type.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 9,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              if (type.isNotEmpty && location.isNotEmpty) const SizedBox(width: 8),
              if (location.isNotEmpty)
                Expanded(
                  child: Text(
                    'Vị trí: $location',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.textTertiary,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
          if (type.isNotEmpty || location.isNotEmpty) const SizedBox(height: 10),
          Text(
            'Vấn đề',
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textTertiary,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            issue.isEmpty ? '—' : issue,
            style: theme.textTheme.bodyMedium?.copyWith(
              decoration: issue.isEmpty ? null : TextDecoration.lineThrough,
              decorationColor: AppColors.textTertiary,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.south_rounded, size: 18, color: AppColors.primary.withValues(alpha: 0.75)),
              const SizedBox(width: 6),
              Text(
                'Gợi ý sửa',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            correction.isEmpty ? '—' : correction,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
              height: 1.4,
            ),
          ),
          if (explanation.isNotEmpty) ...[
            const SizedBox(height: 10),
            Divider(height: 1, color: AppColors.grey300.withValues(alpha: 0.8)),
            const SizedBox(height: 10),
            Text(
              explanation,
              style: theme.textTheme.bodySmall?.copyWith(
                fontStyle: FontStyle.italic,
                color: AppColors.textSecondary,
                height: 1.45,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
