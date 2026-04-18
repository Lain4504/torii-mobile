import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/jlpt_mock_models.dart';

class JlptMockReviewScreen extends ConsumerStatefulWidget {
  const JlptMockReviewScreen({
    super.key,
    required this.attemptId,
    required this.templateId,
  });

  final String attemptId;
  final String templateId;

  @override
  ConsumerState<JlptMockReviewScreen> createState() => _JlptMockReviewScreenState();
}

class _JlptMockReviewScreenState extends ConsumerState<JlptMockReviewScreen> {
  bool _loading = true;
  JlptMockAttemptResultModel? _result;
  final Map<String, String> _signedUrlMap = <String, String>{};
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final repo = ref.read(academyRepositoryProvider);
    
    try {
      _result = await repo.getJlptAttemptResult(widget.attemptId);

      if (_result != null) {
        for (final ans in _result!.answers) {
          final q = ans.review;
          if (q == null) continue;

          // Fetch images
          if (q.imageAssetId != null && q.imageAssetId!.isNotEmpty) {
            final signed = await repo.getStorageSignedUrl(fileId: q.imageAssetId!);
            if (signed != null) _signedUrlMap[q.imageAssetId!] = signed;
          }
          // Fetch audio
          if (q.audioAssetId != null && q.audioAssetId!.isNotEmpty) {
            final signed = await repo.getStorageSignedUrl(fileId: q.audioAssetId!);
            if (signed != null) _signedUrlMap[q.audioAssetId!] = signed;
          }
        }
      }
    } catch (_) {}

    if (mounted) {
      setState(() => _loading = false);
    }
  }

  List<_MondaiGroup> _getGroups() {
    if (_result == null) return [];
    
    final groups = <_MondaiGroup>[];
    String? currentMondaiTitle;
    List<JlptMockAttemptAnswerModel> currentAnswers = [];

    for (var i = 0; i < _result!.answers.length; i++) {
        final ans = _result!.answers[i];
        final title = ans.mondaiTitleVi ?? 'Khác';
        
        if (title != currentMondaiTitle) {
            if (currentAnswers.isNotEmpty) {
                groups.add(_MondaiGroup(currentMondaiTitle, currentAnswers));
            }
            currentMondaiTitle = title;
            currentAnswers = [ans];
        } else {
            currentAnswers.add(ans);
        }
    }
    
    if (currentAnswers.isNotEmpty) {
        groups.add(_MondaiGroup(currentMondaiTitle, currentAnswers));
    }
    
    return groups;
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_result == null || _result!.answers.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Xem chi tiết')),
        body: const Center(child: Text('Không tải được dữ liệu bài làm')),
      );
    }

    final groups = _getGroups();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Review JLPT ${_result!.level}'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: groups.length,
        itemBuilder: (context, gIndex) {
          final group = groups[gIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Text(
                  group.title ?? 'Câu hỏi',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              ...group.answers.map((ans) {
                  final qNo = _result!.answers.indexOf(ans) + 1;
                  return _buildQuestionCard(context, ans, qNo);
              }),
            ],
          );
        },
      ),
    );
  }

  Widget _buildQuestionCard(BuildContext context, JlptMockAttemptAnswerModel ans, int qNo) {
    final theme = Theme.of(context);
    final q = ans.review;
    if (q == null) return const SizedBox.shrink();

    final isAnswered = ans.selectedOptionId != null;
    final isCorrect = ans.isCorrect ?? (ans.selectedOptionId == ans.correctOptionId && isAnswered);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: isAnswered 
              ? (isCorrect ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3))
              : theme.colorScheme.outlineVariant.withOpacity(0.5),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Câu $qNo',
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                const Spacer(),
                if (isAnswered)
                  Icon(
                    isCorrect ? Icons.check_circle : Icons.cancel,
                    color: isCorrect ? Colors.green : Colors.red,
                    size: 24,
                  )
                else
                  const Text('Bỏ qua', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (q.contextText?.isNotEmpty == true) ...[
                  Text(
                    q.contextText!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                Text(
                  q.stemText,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
                if (q.imageAssetId != null && _signedUrlMap.containsKey(q.imageAssetId)) ...[
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(_signedUrlMap[q.imageAssetId!]!),
                  ),
                ],
                if (q.audioAssetId != null && _signedUrlMap.containsKey(q.audioAssetId)) ...[
                  const SizedBox(height: 12),
                  _AudioPlayerWidget(url: _signedUrlMap[q.audioAssetId!]!, player: _audioPlayer),
                ],
              ],
            ),
          ),

          // Options
          const SizedBox(height: 16),
          ...q.options.map((opt) {
            final isSelected = ans.selectedOptionId == opt.id;
            final isCorrectOption = ans.correctOptionId == opt.id;

            Color bgColor = Colors.transparent;
            Color borderColor = theme.colorScheme.outlineVariant.withOpacity(0.5);
            Widget? icon;

            if (isSelected) {
              if (isCorrect) {
                bgColor = Colors.green.withOpacity(0.08);
                borderColor = Colors.green;
                icon = const Icon(Icons.check_circle, color: Colors.green, size: 20);
              } else {
                bgColor = Colors.red.withOpacity(0.08);
                borderColor = Colors.red;
                icon = const Icon(Icons.cancel, color: Colors.red, size: 20);
              }
            } else if (isCorrectOption) {
              bgColor = Colors.green.withOpacity(0.03);
              borderColor = Colors.green.withOpacity(0.5);
              icon = const Icon(Icons.check_circle_outline, color: Colors.green, size: 20);
            }

            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: borderColor, width: 1.2),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        opt.contentText,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    if (icon != null) icon,
                  ],
                ),
              ),
            );
          }),

          // Explanation
          if (q.explanation != null && q.explanation!.trim().isNotEmpty) ...[
            const Divider(height: 32),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb_outline, size: 18, color: Colors.orange[700]),
                      const SizedBox(width: 6),
                      Text(
                        'Giải thích',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: Colors.orange[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    q.explanation!,
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                  ),
                ],
              ),
            ),
          ] else const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _MondaiGroup {
  final String? title;
  final List<JlptMockAttemptAnswerModel> answers;
  _MondaiGroup(this.title, this.answers);
}

class _AudioPlayerWidget extends StatefulWidget {
  final String url;
  final AudioPlayer player;
  const _AudioPlayerWidget({required this.url, required this.player});

  @override
  State<_AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<_AudioPlayerWidget> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () async {
              if (_isPlaying) {
                await widget.player.pause();
                setState(() => _isPlaying = false);
              } else {
                await widget.player.play(UrlSource(widget.url));
                setState(() => _isPlaying = true);
              }
            },
            icon: Icon(_isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled),
            color: Theme.of(context).colorScheme.primary,
          ),
          const Expanded(child: Text('Nghe đoạn âm thanh')),
        ],
      ),
    );
  }
}
