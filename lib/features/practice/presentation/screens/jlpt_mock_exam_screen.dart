import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/jlpt_mock_models.dart';

class JlptMockExamScreen extends ConsumerStatefulWidget {
  const JlptMockExamScreen({
    super.key,
    required this.templateId,
    required this.attemptId,
    required this.initialSectionOrder,
    required this.levelCode,
    this.endsAtIso,
  });

  final String templateId;
  final String attemptId;
  final int initialSectionOrder;
  final String levelCode;
  final String? endsAtIso;

  @override
  ConsumerState<JlptMockExamScreen> createState() => _JlptMockExamScreenState();
}

class _JlptMockExamScreenState extends ConsumerState<JlptMockExamScreen> {
  JlptMockTemplateModel? _template;
  int _sectionOrder = 1;
  bool _loading = true;
  bool _submitting = false;
  String? _endsAtIso;
  Timer? _timer;
  Duration _remaining = Duration.zero;
  final Map<String, String> _selectedByQuestionId = <String, String>{};
  final Map<String, String> _imageUrlByQuestionId = <String, String>{};
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _audioUrl;
  bool _audioLoading = false;
  bool _audioPlaying = false;
  String? _activeMondaiCode;

  @override
  void initState() {
    super.initState();
    _sectionOrder = widget.initialSectionOrder;
    _endsAtIso = widget.endsAtIso;
    _load();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final repo = ref.read(academyRepositoryProvider);
    final template = await repo.getJlptMockTemplateById(widget.templateId);
    final answers = await repo.getJlptAttemptAnswers(widget.attemptId);
    if (!mounted) return;
    for (final row in answers) {
      final qid = row['templateQuestionId']?.toString() ?? '';
      final oid = row['selectedOptionId']?.toString() ?? '';
      if (qid.isNotEmpty && oid.isNotEmpty) {
        _selectedByQuestionId[qid] = oid;
      }
    }
    setState(() {
      _template = template;
      _loading = false;
      _activeMondaiCode = null;
    });
    _startTimer();
    _loadSectionMedia();
  }

  void _startTimer() {
    _timer?.cancel();
    if (_endsAtIso == null || _endsAtIso!.isEmpty) return;
    final endAt = DateTime.tryParse(_endsAtIso!);
    if (endAt == null) return;
    void tick() {
      final now = DateTime.now();
      final diff = endAt.difference(now);
      if (!mounted) return;
      setState(() => _remaining = diff.isNegative ? Duration.zero : diff);
      if (diff <= Duration.zero) {
        _timer?.cancel();
        _submitCurrentSection(autoSubmit: true);
      }
    }

    tick();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => tick());
  }

  List<JlptMockTemplateSectionModel> get _sections {
    final sections =
        _template?.sections ?? const <JlptMockTemplateSectionModel>[];
    return [...sections]..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
  }

  JlptMockTemplateSectionModel? get _currentSection {
    for (final s in _sections) {
      if (s.orderIndex == _sectionOrder) return s;
    }
    return null;
  }

  List<JlptMockTemplateQuestionModel> get _sectionQuestions {
    final section = _currentSection;
    if (section == null) return const [];
    final questions =
        (_template?.questions ?? const <JlptMockTemplateQuestionModel>[])
            .where((q) => q.sectionId == section.id)
            .toList()
          ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    return questions;
  }

  Map<String, int> get _questionNoByTemplateQuestionId {
    final map = <String, int>{};
    final sorted = _sectionQuestions;
    for (var i = 0; i < sorted.length; i++) {
      map[sorted[i].id] = i + 1;
    }
    return map;
  }

  List<JlptMockMondaiModel> get _mondaiItems {
    final section = _currentSection;
    if (section == null) return const <JlptMockMondaiModel>[];
    if (section.mondai.isNotEmpty) return section.mondai;

    // Fallback: derive unique mondai codes from questions (API might omit section.mondai)
    final seen = <String>{};
    final items = <JlptMockMondaiModel>[];
    for (final q in _sectionQuestions) {
      final code = (q.mondai?.code ?? '').trim();
      if (code.isEmpty) continue;
      if (seen.add(code)) {
        items.add(
          JlptMockMondaiModel(
            id: q.mondai?.id ?? '',
            code: code,
            titleVi: q.mondai?.titleVi,
            titleJa: q.mondai?.titleJa,
            descriptionVi: q.mondai?.descriptionVi,
            orderIndex: items.length,
            recommendedQuestionCount: q.mondai?.recommendedQuestionCount,
          ),
        );
      }
    }
    return items;
  }

  List<JlptMockTemplateQuestionModel> get _activeMondaiQuestions {
    final items = _mondaiItems;
    if (items.isEmpty) return _sectionQuestions;
    final code = (_activeMondaiCode ?? items.first.code).trim();
    return _sectionQuestions
        .where((q) => (q.mondai?.code ?? '').trim() == code)
        .toList();
  }

  String get _activeMondaiInstruction {
    // Mirror web behavior: use server-provided instruction if present, otherwise fallback by index.
    final fallback = const [
      'のことばの読み方として最もよいものを、1・2・3・4から一つえらびなさい。',
      'のことばを漢字で書くとき、最もよいものを、1・2・3・4から一つえらびなさい。',
      '( )に入れるのに最もよいものを、1・2・3・4から一つえらびなさい。',
      'に意味が最も近いものを、1・2・3・4から一つえらびなさい。',
      'つぎのことばの使い方として最もよいものを、1・2・3・4から一つえらびなさい。',
    ];

    final items = _mondaiItems;
    if (items.isEmpty) return fallback.first;
    final idx = items.indexWhere((m) => m.code == _activeMondaiCode);
    final safeIdx = (idx >= 0 ? idx : 0).clamp(0, fallback.length - 1);
    return fallback[safeIdx];
  }

  String get _countdownText {
    final m = _remaining.inMinutes.remainder(60).toString().padLeft(2, '0');
    final h = _remaining.inHours.toString().padLeft(2, '0');
    final s = _remaining.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$h:$m:$s';
  }

  Future<void> _loadSectionMedia() async {
    if (_template == null) return;
    final repo = ref.read(academyRepositoryProvider);
    final questions = _activeMondaiQuestions;
    if (questions.isEmpty) return;

    setState(() {
      _audioLoading = true;
      _audioUrl = null;
      _imageUrlByQuestionId.clear();
    });

    final firstAudioAssetId = questions
        .map((q) => q.question.audioAssetId)
        .whereType<String>()
        .firstWhere((id) => id.trim().isNotEmpty, orElse: () => '');
    if (firstAudioAssetId.isNotEmpty) {
      final signed = await repo.getStorageSignedUrl(fileId: firstAudioAssetId);
      if (signed != null && signed.isNotEmpty) {
        _audioUrl = signed;
      }
    }

    for (final q in questions) {
      final imageAssetId = q.question.imageAssetId;
      if (imageAssetId == null || imageAssetId.trim().isEmpty) continue;
      final signed = await repo.getStorageSignedUrl(fileId: imageAssetId);
      if (signed == null || signed.isEmpty) continue;
      _imageUrlByQuestionId[q.id] = signed;
    }

    if (!mounted) return;
    setState(() {
      _audioLoading = false;
    });
  }

  Future<void> _togglePlayAudio() async {
    if (_audioUrl == null || _audioUrl!.isEmpty) return;
    if (_audioPlaying) {
      await _audioPlayer.pause();
      if (!mounted) return;
      setState(() => _audioPlaying = false);
      return;
    }
    await _audioPlayer.play(UrlSource(_audioUrl!));
    if (!mounted) return;
    setState(() => _audioPlaying = true);
    _audioPlayer.onPlayerComplete.listen((_) {
      if (!mounted) return;
      setState(() => _audioPlaying = false);
    });
  }

  Future<void> _saveSingle(
    String templateQuestionId,
    String selectedOptionId,
  ) async {
    _selectedByQuestionId[templateQuestionId] = selectedOptionId;
    setState(() {});
    final repo = ref.read(academyRepositoryProvider);
    await repo.saveJlptAnswers(
      attemptId: widget.attemptId,
      answers: <Map<String, dynamic>>[
        <String, dynamic>{
          'templateQuestionId': templateQuestionId,
          'selectedOptionId': selectedOptionId,
        },
      ],
    );
  }

  Future<void> _submitCurrentSection({bool autoSubmit = false}) async {
    if (_submitting) return;
    setState(() => _submitting = true);
    final repo = ref.read(academyRepositoryProvider);
    final questions = _sectionQuestions;
    final answers = questions
        .map(
          (q) => <String, dynamic>{
            'templateQuestionId': q.id,
            'selectedOptionId': _selectedByQuestionId[q.id],
          },
        )
        .toList();
    await repo.saveJlptAnswers(attemptId: widget.attemptId, answers: answers);

    final sectionIndex = _sections.indexWhere(
      (s) => s.orderIndex == _sectionOrder,
    );
    final isLastSection =
        sectionIndex >= 0 && sectionIndex == _sections.length - 1;
    if (isLastSection) {
      final ok = await repo.submitJlptAttempt(attemptId: widget.attemptId);
      if (!mounted) return;
      setState(() => _submitting = false);
      if (!ok) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          const SnackBar(content: Text('Không thể nộp bài')),
        );
        return;
      }
      context.go('/jlpt-mock/history/${widget.attemptId}');
      return;
    }

    final next = await repo.nextJlptSection(
      attemptId: widget.attemptId,
      currentSectionOrder: _sectionOrder,
    );
    if (!mounted) return;
    setState(() {
      _submitting = false;
      _sectionOrder = next?.currentSectionOrder ?? (_sectionOrder + 1);
      _endsAtIso = next?.endsAt;
      _activeMondaiCode = null;
    });
    _startTimer();
    await _audioPlayer.stop();
    if (mounted) {
      setState(() => _audioPlaying = false);
    }
    await _loadSectionMedia();
    if (!mounted) return;
    if (!autoSubmit) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        const SnackBar(content: Text('Đã nộp phần hiện tại')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (_template == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Thi thử JLPT')),
        body: const Center(child: Text('Không tải được dữ liệu đề thi')),
      );
    }

    final currentSection = _currentSection;
    final questions = _activeMondaiQuestions;
    final sectionLabel = currentSection?.title.isNotEmpty == true
        ? currentSection!.title
        : 'Phần thi';
    final sectionNo =
        (_sections.indexWhere((s) => s.orderIndex == _sectionOrder) + 1).clamp(
          1,
          _sections.length,
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JLPT ${widget.levelCode.toUpperCase()} - Phần $sectionNo/${_sections.length}',
        ),
        actions: [
          if (_endsAtIso != null && _endsAtIso!.isNotEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  _countdownText,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Text(
              sectionLabel,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          if (_mondaiItems.isNotEmpty) ...[
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _mondaiItems.map((m) {
                        final selected = (_activeMondaiCode ?? _mondaiItems.first.code) == m.code;
                        final label = (m.titleJa ?? m.titleVi ?? m.code).trim();
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            selected: selected,
                            label: Text(
                              label.isEmpty ? m.code : label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onSelected: (_) async {
                              setState(() => _activeMondaiCode = m.code);
                              await _audioPlayer.stop();
                              if (mounted) setState(() => _audioPlaying = false);
                              await _loadSectionMedia();
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: theme.colorScheme.outlineVariant.withValues(alpha: 0.8),
                      ),
                    ),
                    child: Text(
                      '問題${(_mondaiItems.indexWhere((m) => m.code == (_activeMondaiCode ?? _mondaiItems.first.code)) + 1).clamp(1, _mondaiItems.length)}　＿＿＿$_activeMondaiInstruction',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (_audioLoading)
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else if (_audioUrl != null && _audioUrl!.isNotEmpty)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: Row(
                children: [
                  Icon(
                    _audioPlaying
                        ? Icons.graphic_eq_rounded
                        : Icons.headset_rounded,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Âm thanh nghe hiểu',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: _togglePlayAudio,
                    icon: Icon(
                      _audioPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                    ),
                    label: Text(_audioPlaying ? 'Tạm dừng' : 'Phát'),
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
              itemBuilder: (context, index) {
                final q = questions[index];
                final qNo = _questionNoByTemplateQuestionId[q.id] ?? (index + 1);
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: theme.colorScheme.outlineVariant),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Câu $qNo',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 6),
                      if ((q.question.contextText ?? '').trim().isNotEmpty) ...[
                        Text(
                          q.question.contextText!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                      Text(
                        q.question.stemText,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (_imageUrlByQuestionId.containsKey(q.id)) ...[
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            _imageUrlByQuestionId[q.id]!,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  color:
                                      theme.colorScheme.surfaceContainerHighest,
                                  child: const Text(
                                    'Không tải được hình ảnh câu hỏi',
                                  ),
                                ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 10),
                      ...q.question.options.map((opt) {
                        final selected = _selectedByQuestionId[q.id] == opt.id;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: OutlinedButton(
                            onPressed: () => _saveSingle(q.id, opt.id),
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size.fromHeight(44),
                              alignment: Alignment.centerLeft,
                              backgroundColor: selected
                                  ? theme.colorScheme.primary.withValues(
                                      alpha: 0.12,
                                    )
                                  : null,
                              side: BorderSide(
                                color: selected
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.outlineVariant,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  selected
                                      ? Icons.check_circle_rounded
                                      : Icons.radio_button_unchecked_rounded,
                                  size: 20,
                                  color: selected
                                      ? theme.colorScheme.primary
                                      : theme.colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 10),
                                Expanded(child: Text(opt.contentText)),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: questions.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: SizedBox(
          height: 48,
          child: ElevatedButton.icon(
            onPressed: _submitting ? null : () => _submitCurrentSection(),
            icon: _submitting
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send_rounded),
            label: Text(
              _sections.last.orderIndex == _sectionOrder
                  ? 'Nộp bài'
                  : 'Nộp phần này',
            ),
          ),
        ),
      ),
    );
  }
}
