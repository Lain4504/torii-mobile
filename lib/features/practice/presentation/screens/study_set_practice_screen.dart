import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/study_set_models.dart';

class StudySetPracticeScreen extends ConsumerStatefulWidget {
  final String setId;
  const StudySetPracticeScreen({super.key, required this.setId});

  @override
  ConsumerState<StudySetPracticeScreen> createState() => _StudySetPracticeScreenState();
}

class _StudySetPracticeScreenState extends ConsumerState<StudySetPracticeScreen> {
  int _index = 0;
  bool _reveal = false;
  bool _autoSpeak = true;
  bool _busy = false;
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    await _tts.setLanguage('ja-JP');
    await _tts.setSpeechRate(0.45);
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _speak(String text) async {
    if (!_autoSpeak) return;
    if (text.trim().isEmpty) return;
    await _tts.stop();
    await _tts.speak(text);
  }

  Future<void> _review(SetCardModel card, int quality) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      // quality: 0=sai, 1=đúng (schema backend)
      await ref.read(academyRepositoryProvider).reviewStudyCard(card.id, quality: quality);
    } catch (_) {
      // ignore: practice should keep flowing; backend may fail transiently
    } finally {
      HapticFeedback.lightImpact();
      setState(() {
        _busy = false;
        _reveal = false;
        _index = _index + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardsAsync = ref.watch(studyCardsProvider(widget.setId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Luyện tập',
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => setState(() => _autoSpeak = !_autoSpeak),
            icon: Icon(_autoSpeak ? Icons.volume_up : Icons.volume_off),
            tooltip: 'Âm thanh',
          ),
        ],
      ),
      body: cardsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e', style: const TextStyle(color: AppColors.error))),
        data: (cards) {
          if (cards.isEmpty) {
            return const Center(
              child: Text(
                'Không có thẻ để luyện tập.',
                style: TextStyle(color: AppColors.textTertiary),
              ),
            );
          }
          if (_index >= cards.length) {
            return _DoneView(
              onRestart: () => setState(() {
                _index = 0;
                _reveal = false;
              }),
            );
          }

          final card = cards[_index];
          // Auto speak term at first reveal state
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!_reveal) _speak(card.term);
          });

          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              children: [
                _ProgressBar(current: _index + 1, total: cards.length),
                const SizedBox(height: 12),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      setState(() => _reveal = !_reveal);
                      if (_reveal) {
                        await _speak(card.definition);
                      } else {
                        await _speak(card.term);
                      }
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.grey300),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.textPrimary.withOpacity(0.04),
                            blurRadius: 14,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _reveal ? 'Đáp án' : 'Thuật ngữ',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.textTertiary,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.4,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _reveal ? card.definition : card.term,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w900,
                              height: 1.15,
                            ),
                          ),
                          if (!_reveal && (card.hint ?? '').trim().isNotEmpty) ...[
                            const SizedBox(height: 12),
                            Text(
                              'Gợi ý: ${card.hint}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.textSecondary,
                                height: 1.35,
                              ),
                            ),
                          ],
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(Icons.touch_app_rounded, color: AppColors.textTertiary, size: 18),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Chạm để lật thẻ • Vuốt qua để tiếp tục',
                                  style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary),
                                ),
                              ),
                              IconButton(
                                onPressed: () => _speak(_reveal ? card.definition : card.term),
                                icon: const Icon(Icons.volume_up),
                                color: AppColors.textSecondary,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton(
                          onPressed: _busy ? null : () => _review(card, 0),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.error,
                            side: BorderSide(color: AppColors.error.withOpacity(0.55)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          child: const Text('Chưa nhớ', style: TextStyle(fontWeight: FontWeight.w900)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _busy ? null : () => _review(card, 1),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.success,
                            foregroundColor: AppColors.textOnPrimary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          child: const Text('Đã nhớ', style: TextStyle(fontWeight: FontWeight.w900)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final int current;
  final int total;
  const _ProgressBar({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    final ratio = total == 0 ? 0.0 : current / total;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$current/$total', style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.textSecondary)),
            Text('${(ratio * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.textSecondary)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: ratio.clamp(0.0, 1.0),
            minHeight: 10,
            backgroundColor: AppColors.grey200,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      ],
    );
  }
}

class _DoneView extends StatelessWidget {
  final VoidCallback onRestart;
  const _DoneView({required this.onRestart});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 40),
            ),
            const SizedBox(height: 14),
            Text(
              'Hoàn thành!',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 6),
            Text(
              'Tốt lắm. Tiếp tục duy trì streak mỗi ngày nhé.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary, height: 1.35),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textOnPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: const Text('Luyện lại', style: TextStyle(fontWeight: FontWeight.w900)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

