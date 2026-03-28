import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../models/sensei_model.dart';
import '../../providers/sensei_providers.dart';
import '../widgets/sensei_quota_header.dart';

/// Nền body giống [StudySetMatchScreen]. Removed fixed color for theme support.

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

  static BoxDecoration _cardDecoration(ThemeData theme, {Color? borderColor}) {
    return BoxDecoration(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: borderColor ?? theme.colorScheme.outlineVariant),
      boxShadow: [
        BoxShadow(
          color: theme.colorScheme.onSurface.withOpacity(0.04),
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
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: theme.colorScheme.onSurface),
          onPressed: () {
            if (context.canPop()) context.pop();
          },
        ),
        title: Text(
          'AI Dịch thuật',
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
        ),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
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
                decoration: _cardDecoration(theme),
                child: Row(
                  children: [
                    Icon(Icons.translate_rounded, size: 20, color: theme.colorScheme.primary.withOpacity(0.9)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Chọn ngôn ngữ nguồn và đích, nhập câu rồi bấm Dịch.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
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
                decoration: _cardDecoration(theme),
                child: Row(
                  children: [
                    Expanded(
                      child: _LanguageDrop(
                        value: _sourceLang,
                        onChanged: (val) => setState(() => _sourceLang = val!),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.swap_horiz_rounded, color: theme.colorScheme.primary.withOpacity(0.95)),
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
                decoration: _cardDecoration(theme),
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
                          hintStyle: TextStyle(color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7)),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    Divider(height: 1, thickness: 1, color: theme.colorScheme.outlineVariant),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 6, 10, 10),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.volume_up_rounded, size: 22, color: theme.colorScheme.onSurfaceVariant.withOpacity(0.85)),
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints.tightFor(width: 40, height: 40),
                          ),
                          if (_textController.text.isNotEmpty)
                            IconButton(
                              icon: const Icon(Icons.close_rounded, size: 22),
                              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7),
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
                                  ? SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(strokeWidth: 2, color: theme.colorScheme.onPrimary),
                                    )
                                  : const Icon(Icons.translate_rounded, size: 18),
                              label: const Text('Dịch', style: TextStyle(fontWeight: FontWeight.w900)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.colorScheme.primary,
                                foregroundColor: theme.colorScheme.onPrimary,
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
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: theme.colorScheme.primary.withOpacity(0.22)),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withOpacity(0.06),
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
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Bản dịch',
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: theme.colorScheme.primary,
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
                            color: theme.colorScheme.onSurfaceVariant,
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
                            icon: Icon(Icons.volume_up_rounded, size: 22, color: theme.colorScheme.onSurfaceVariant.withOpacity(0.85)),
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
              if (translatorState.error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: theme.colorScheme.error.withOpacity(0.35)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.error_outline_rounded, size: 20, color: theme.colorScheme.error),
                            const SizedBox(width: 8),
                            Text(
                              'Lỗi',
                              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          translatorState.error!,
                          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        if (translatorState.errorCode == 'quota_exceeded') ...[
                          const SizedBox(height: 12),
                          ElevatedButton.icon(
                            onPressed: () => context.push('/sensei/subscription'),
                            icon: const Icon(Icons.upgrade_rounded),
                            label: const Text('Nâng cấp gói AI'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: theme.colorScheme.onPrimary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              if (grammarState.error != null) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: theme.colorScheme.error.withOpacity(0.35)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.error_outline_rounded, size: 20, color: theme.colorScheme.error),
                            const SizedBox(width: 8),
                            Text(
                              'Lỗi phân tích ngữ pháp',
                              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          grammarState.error!,
                          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              if (translatorState.translation != null && grammarState.response == null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: theme.colorScheme.primary.withOpacity(0.35)),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withOpacity(0.05),
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
                                  color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7),
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
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: theme.colorScheme.onPrimary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                            ),
                            child: grammarState.isLoading
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: theme.colorScheme.onPrimary,
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
    final theme = Theme.of(context);
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
      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: theme.colorScheme.onSurface),
      icon: Icon(Icons.expand_more_rounded, color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7)),
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
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withOpacity(0.04),
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
                    color: response.isCorrect ? theme.colorScheme.primary : theme.colorScheme.error,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    response.isCorrect ? 'CHÍNH XÁC' : 'CẦN LƯU Ý',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
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
            color: theme.scaffoldBackgroundColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Icon(Icons.expand_more_rounded, size: 22, color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7)),
          ),
          _ResultBox(
            title: 'Đề xuất',
            text: response.correctedText?.toString() ?? '',
            color: theme.colorScheme.primary.withOpacity(0.07),
            textColor: theme.colorScheme.primary,
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
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: theme.colorScheme.outlineVariant),
                  ),
                  child: Text(
                    t,
                    style: theme.textTheme.bodySmall?.copyWith(
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurfaceVariant,
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
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.5)),
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
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 6),
          SelectableText(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              height: 1.4,
              color: textColor ?? theme.colorScheme.onSurface,
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
        color: theme.scaffoldBackgroundColor,
        border: Border.all(color: theme.colorScheme.outlineVariant),
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
                    border: Border.all(color: theme.colorScheme.primary.withOpacity(0.45)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    type.toUpperCase(),
                    style: TextStyle(
                      fontSize: 9,
                      color: theme.colorScheme.primary,
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
                      color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7),
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
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7),
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            issue.isEmpty ? '—' : issue,
            style: theme.textTheme.bodyMedium?.copyWith(
              decoration: issue.isEmpty ? null : TextDecoration.lineThrough,
              decorationColor: theme.colorScheme.onSurfaceVariant.withOpacity(0.7),
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.south_rounded, size: 18, color: theme.colorScheme.primary.withOpacity(0.75)),
              const SizedBox(width: 6),
              Text(
                'Gợi ý sửa',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            correction.isEmpty ? '—' : correction,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w800,
              height: 1.4,
            ),
          ),
          if (explanation.isNotEmpty) ...[
            const SizedBox(height: 10),
            Divider(height: 1, color: theme.colorScheme.outlineVariant),
            const SizedBox(height: 10),
            Text(
              explanation,
              style: theme.textTheme.bodySmall?.copyWith(
                fontStyle: FontStyle.italic,
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.45,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
