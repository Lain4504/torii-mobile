import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/comment_model.dart';
import 'package:torii_app/data/models/academy_product_detail_model.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/features/sensei/providers/sensei_providers.dart';
import 'package:torii_app/features/sensei/views/widgets/lesson_sensei_chat_sheet.dart';
import 'package:video_player/video_player.dart';

class LessonScreen extends ConsumerStatefulWidget {
  const LessonScreen({super.key, this.lesson});
  final Map<String, dynamic>? lesson;

  @override
  ConsumerState<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends ConsumerState<LessonScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _activeTabIndex = 0;
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  bool _autoMarkedComplete = false;
  String? _resolvedVideoUrl;
  String? _videoInitError;
  String? _resolvedArticleContent;

  bool _discussionLoading = false;
  String? _discussionError;
  bool _discussionReadOnly = false;
  String? _discussionReadOnlyReason;
  List<CommentModel> _topics = [];
  String? _expandedTopicId;
  final Map<String, String> _replyDrafts = {};
  bool _isCreateTopicSheetOpen = false;
  Future<AcademyProductDetailModel?>? _syllabusDetailFuture;
  String _syllabusCacheKey = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
    _prepareSyllabusDetail();
    _initVideo();
    _resolveReadingContent();
    // Load discussions after first render to make sure `widget.lesson` and providers are ready.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshDiscussionIfPossible();
    });
  }

  @override
  void didUpdateWidget(LessonScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.lesson?['id'] != widget.lesson?['id']) {
      _autoMarkedComplete = false;
    }

    final oldDeliveryTargetId =
        (oldWidget.lesson?['deliveryTargetId'] ?? '').toString();
    final newDeliveryTargetId =
        (widget.lesson?['deliveryTargetId'] ?? '').toString();
    if (oldDeliveryTargetId.isNotEmpty &&
        oldDeliveryTargetId != newDeliveryTargetId) {
      _refreshDiscussionIfPossible();
    }
    final oldMode = (oldWidget.lesson?['mode'] ?? 'VOD').toString().toUpperCase();
    final newMode = (widget.lesson?['mode'] ?? 'VOD').toString().toUpperCase();
    if (oldDeliveryTargetId != newDeliveryTargetId || oldMode != newMode) {
      _prepareSyllabusDetail();
    }
    if (oldWidget.lesson?['videoUrl'] != widget.lesson?['videoUrl'] ||
        oldWidget.lesson?['videoFileId'] != widget.lesson?['videoFileId'] ||
        oldWidget.lesson?['type'] != widget.lesson?['type']) {
      _disposeVideo();
      _initVideo();
    }
    if (oldWidget.lesson?['id'] != widget.lesson?['id'] ||
        oldWidget.lesson?['type'] != widget.lesson?['type'] ||
        oldWidget.lesson?['article'] != widget.lesson?['article']) {
      _resolvedArticleContent = null;
      _resolveReadingContent();
    }
  }

  void _prepareSyllabusDetail() {
    final lesson = widget.lesson ?? const <String, dynamic>{};
    final deliveryTargetId = (lesson['deliveryTargetId'] ?? '').toString();
    final productId = (lesson['productId'] ?? '').toString();
    // Với LIVE, API detail public cần product-level id (cohortId),
    // không phải deliveryTargetId (thường là liveClassId).
    final detailId = productId.isNotEmpty ? productId : deliveryTargetId;
    final mode = (lesson['mode'] ?? 'VOD').toString().toUpperCase();
    final cacheKey = '$mode::$detailId';
    if (detailId.isEmpty || cacheKey == _syllabusCacheKey) return;
    _syllabusCacheKey = cacheKey;

    final repo = ref.read(academyRepositoryProvider);
    _syllabusDetailFuture = repo.getLearnerProductDetailById(
      detailId,
      mode: mode,
    );
  }

  void _onVideoProgress() {
    final c = _videoController;
    if (c == null || !c.value.isInitialized || !mounted) return;
    if (_autoMarkedComplete) return;
    final lesson = widget.lesson ?? const <String, dynamic>{};
    if (lesson['progressDisabled'] == true) return;
    final deliveryTargetId = (lesson['deliveryTargetId'] ?? '').toString();
    if (deliveryTargetId.isEmpty) return;
    final type = (lesson['type'] ?? '').toString();
    if (!_isTrackableType(type)) return;
    final dur = c.value.duration;
    if (dur == Duration.zero) return;
    final pos = c.value.position;
    if (pos < dur - const Duration(milliseconds: 500)) return;
    _autoMarkedComplete = true;
    _markComplete(silent: true);
  }

  Future<void> _initVideo() async {
    final lesson = widget.lesson ?? const <String, dynamic>{};
    final type = (lesson['type'] ?? 'video').toString().toLowerCase();
    _resolvedVideoUrl = null;
    _videoInitError = null;
    if (type == 'article' || type == 'reading' || type == 'quiz') return;

    final url = await _resolveVideoPlaybackUrl(lesson);
    if (url == null || url.isEmpty) {
      debugPrint(
        '[LessonScreen] Missing video source for lessonId=${lesson['id']} type=${lesson['type']} keys=${lesson.keys.toList()}',
      );
      if (mounted) {
        setState(() {
          _videoInitError =
              'Video chưa có đường dẫn hoặc fileId hợp lệ. Vui lòng kiểm tra cấu hình bài học.';
        });
      }
      return;
    }

    final uri = Uri.tryParse(url);
    if (uri == null ||
        !(uri.scheme.toLowerCase() == 'http' ||
            uri.scheme.toLowerCase() == 'https')) {
      if (mounted) {
        setState(() {
          _videoInitError = 'Đường dẫn video không hợp lệ.';
        });
      }
      return;
    }

    _resolvedVideoUrl = url;

    final vc = VideoPlayerController.networkUrl(uri);
    _videoController = vc;
    try {
      await vc.initialize();
      if (!mounted) {
        await vc.dispose();
        _videoController = null;
        return;
      }
      vc.addListener(_onVideoProgress);
      _chewieController = ChewieController(
        videoPlayerController: vc,
        autoPlay: false,
        looping: false,
        allowFullScreen: true,
        allowMuting: true,
        showControls: true,
        showControlsOnInitialize: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.primary,
          handleColor: AppColors.primary,
          backgroundColor: Colors.white24,
          bufferedColor: Colors.white38,
        ),
      );
      _videoInitError = null;
      setState(() {});
    } catch (_) {
      await vc.dispose();
      if (mounted) {
        _videoController = null;
        _resolvedVideoUrl = null;
        _videoInitError =
            'Không thể phát video này. Hãy thử lại hoặc kiểm tra định dạng nguồn phát.';
        setState(() {});
      }
    }
  }

  Future<String?> _resolveVideoPlaybackUrl(Map<String, dynamic> lesson) async {
    final directUrl = _extractImmediateVideoUrl(lesson);
    if (directUrl != null) return directUrl;

    final fileId = _extractVideoFileId(lesson);
    if (fileId != null) {
      try {
        final signed = await ref
            .read(academyRepositoryProvider)
            .getStorageSignedUrl(fileId: fileId);
        if (signed != null && signed.isNotEmpty) return signed;
      } catch (_) {
        // Continue with syllabus fallback.
      }
    }

    final lessonId = _asNonEmptyString(lesson['id']);
    if (lessonId == null) return null;
    final syllabusLesson = await _loadLessonFromSyllabus(lessonId);
    if (syllabusLesson == null) return null;

    final syllabusUrl = _asNonEmptyString(syllabusLesson.videoUrl);
    if (syllabusUrl != null) return syllabusUrl;

    final syllabusFileId = _asNonEmptyString(syllabusLesson.videoFileId);
    if (syllabusFileId == null) return null;

    try {
      return await ref
          .read(academyRepositoryProvider)
          .getStorageSignedUrl(fileId: syllabusFileId);
    } catch (_) {
      return null;
    }
  }

  Future<CurriculumLessonModel?> _loadLessonFromSyllabus(String lessonId) async {
    _prepareSyllabusDetail();
    final future = _syllabusDetailFuture;
    if (future == null) return null;

    try {
      final detail = await future;
      if (detail == null) return null;
      for (final module in detail.modules) {
        for (final lesson in module.lessons) {
          if (lesson.id == lessonId) return lesson;
        }
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  bool _isReadingType(String type) {
    final t = type.toUpperCase();
    return t == 'READING' || t == 'ARTICLE';
  }

  bool _isMissingArticleContent(String? text) {
    final value = (text ?? '').trim();
    if (value.isEmpty) return true;
    return value == 'Nội dung bài học đang được cập nhật.' ||
        value == 'Nội dung bài đọc đang được cập nhật.';
  }

  Future<void> _resolveReadingContent() async {
    final lesson = widget.lesson ?? const <String, dynamic>{};
    final type = (lesson['type'] ?? '').toString();
    if (!_isReadingType(type)) return;

    final article = lesson['article'];
    final currentContent = article is Map
        ? _asNonEmptyString(article['content'])
        : null;
    if (!_isMissingArticleContent(currentContent)) {
      _resolvedArticleContent = currentContent;
      return;
    }

    final lessonId = _asNonEmptyString(lesson['id']);
    if (lessonId == null) return;
    final syllabusLesson = await _loadLessonFromSyllabus(lessonId);
    final contentFromSyllabus = _asNonEmptyString(syllabusLesson?.content);
    if (_isMissingArticleContent(contentFromSyllabus)) return;
    if (!mounted) return;
    setState(() {
      _resolvedArticleContent = contentFromSyllabus;
    });
  }

  String? _extractImmediateVideoUrl(Map<String, dynamic> lesson) {
    final direct = _asNonEmptyString(lesson['videoUrl']) ??
        _asNonEmptyString(lesson['videoURL']) ??
        _asNonEmptyString(lesson['video_url']) ??
        _asNonEmptyString(lesson['playbackUrl']) ??
        _asNonEmptyString(lesson['streamUrl']) ??
        _asNonEmptyString(lesson['hlsUrl']) ??
        _asNonEmptyString(lesson['signedUrl']) ??
        _asNonEmptyString(lesson['url']);
    if (direct != null) return direct;

    final video = lesson['video'];
    if (video is String) {
      final fromString = _asNonEmptyString(video);
      if (fromString != null) return fromString;
    }
    if (video is Map) {
      final m = Map<String, dynamic>.from(video);
      final nested = _asNonEmptyString(m['videoUrl']) ??
          _asNonEmptyString(m['playbackUrl']) ??
          _asNonEmptyString(m['streamUrl']) ??
          _asNonEmptyString(m['hlsUrl']) ??
          _asNonEmptyString(m['signedUrl']) ??
          _asNonEmptyString(m['url']);
      if (nested != null) return nested;

      final file = m['file'];
      if (file is Map) {
        return _asNonEmptyString(file['signedUrl']) ??
            _asNonEmptyString(file['url']);
      }
    }

    return null;
  }

  String? _extractVideoFileId(Map<String, dynamic> lesson) {
    final direct = _asNonEmptyString(lesson['videoFileId']) ??
        _asNonEmptyString(lesson['fileId']) ??
        _asNonEmptyString(lesson['storageFileId']);
    if (direct != null) return direct;

    final video = lesson['video'];
    if (video is Map) {
      final m = Map<String, dynamic>.from(video);
      final nested = _asNonEmptyString(m['videoFileId']) ??
          _asNonEmptyString(m['fileId']) ??
          _asNonEmptyString(m['storageFileId']);
      if (nested != null) return nested;

      final file = m['file'];
      if (file is Map) {
        return _asNonEmptyString(file['id']) ??
            _asNonEmptyString(file['fileId']);
      }
    }

    return null;
  }

  String? _asNonEmptyString(dynamic value) {
    if (value == null) return null;
    final text = value.toString().trim();
    return text.isEmpty ? null : text;
  }

  void _disposeVideo() {
    _videoController?.removeListener(_onVideoProgress);
    _chewieController?.dispose();
    _videoController?.dispose();
    _chewieController = null;
    _videoController = null;
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes;
    final seconds = d.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void _openSenseiChat({String? initialMessage}) {
    final lesson = widget.lesson ?? const <String, dynamic>{};
    final lessonId = (lesson['id'] ?? '').toString();
    final courseId = (lesson['courseId'] ?? lesson['productId'] ?? '').toString();
    
    String? timestamp;
    if (_videoController != null && _videoController!.value.isInitialized) {
      timestamp = _formatDuration(_videoController!.value.position);
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => LessonSenseiChatSheet(
        lessonId: lessonId,
        courseId: courseId.isNotEmpty ? courseId : null,
        initialMessage: initialMessage,
        currentTimestamp: timestamp,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    _disposeVideo();
    super.dispose();
  }

  void _onTabChanged() {
    if (!mounted) return;
    if (_activeTabIndex != _tabController.index) {
      setState(() {
        _activeTabIndex = _tabController.index;
      });
    }
  }

  bool _isTrackableType(String type) {
    final t = type.toUpperCase();
    return t == 'VIDEO' || t == 'READING' || t == 'ARTICLE';
  }

  Future<void> _markComplete({bool silent = false}) async {
    final lesson = widget.lesson ?? const <String, dynamic>{};
    final deliveryTargetId = (lesson['deliveryTargetId'] ?? '').toString();
    final lessonId = (lesson['id'] ?? '').toString();
    if (deliveryTargetId.isEmpty || lessonId.isEmpty) {
      if (!silent && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Thiếu deliveryTargetId / lesson để lưu tiến độ.'),
          ),
        );
      }
      return;
    }
    final type = (lesson['type'] ?? '').toString();
    if (!_isTrackableType(type)) {
      if (!silent && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Loại này không tính vào tiến độ.')),
        );
      }
      return;
    }
    final repo = ref.read(academyRepositoryProvider);
    final mode = (lesson['mode'] ?? 'VOD').toString().toUpperCase();
    final productIdRaw = (lesson['productId'] ?? '').toString();
    final productId = productIdRaw.isNotEmpty ? productIdRaw : null;
    final ok = await repo.completeClassLesson(
      deliveryTargetId: deliveryTargetId,
      productId: productId,
      lessonId: lessonId,
      mode: mode,
    );
    if (!mounted) return;
    if (ok) {
      ref.invalidate(classCompletedLessonIdsProvider((
        deliveryTargetId: deliveryTargetId,
        mode: mode,
        productId: productId,
      )));
      final enrollmentIdRaw = lesson['enrollmentId'];
      final enrollmentId = enrollmentIdRaw is String ? enrollmentIdRaw : null;
      ref.invalidate(assessmentStatusProvider(
        assessmentStatusCacheKey(deliveryTargetId, enrollmentId),
      ));
      if (!silent) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã đánh dấu hoàn thành.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đã xem hết video — tiến độ đã được lưu.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else if (!silent) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể cập nhật tiến độ. Thử lại sau.'),
        ),
      );
    }
  }

  void _openSyllabusSheet() {
    final lesson = widget.lesson ?? const <String, dynamic>{};
    final deliveryTargetId = (lesson['deliveryTargetId'] ?? '').toString();
    if (deliveryTargetId.isEmpty) return;
    final progressDisabled = lesson['progressDisabled'] == true;
    final currentLessonId = (lesson['id'] ?? '').toString();

    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.88,
          minChildSize: 0.38,
          maxChildSize: 0.96,
          expand: false,
          builder: (ctx, scrollController) {
            return Material(
              color: AppColors.surface,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.grey300,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 8, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Chương trình học',
                            style: Theme.of(ctx).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close_rounded),
                          onPressed: () =>
                              Navigator.of(ctx, rootNavigator: true).pop(),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: FutureBuilder<AcademyProductDetailModel?>(
                      future: _syllabusDetailFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Lỗi: ${snapshot.error}',
                              style: const TextStyle(color: AppColors.error),
                            ),
                          );
                        }
                        final detail = snapshot.data;
                        if (detail == null) {
                          return const Center(
                            child: Text('Không có dữ liệu lộ trình'),
                          );
                        }

                        final useProgress =
                            !progressDisabled && deliveryTargetId.isNotEmpty;
                        final modules = detail.modules;
                        final completedIds = useProgress
                            ? (ref
                                      .watch(
                                        classCompletedLessonIdsProvider((
                                          deliveryTargetId: deliveryTargetId,
                                          mode: (lesson['mode'] ?? 'VOD')
                                              .toString()
                                              .toUpperCase(),
                                          productId: (lesson['productId']
                                                          ?.toString() ??
                                                      '')
                                                  .isNotEmpty
                                              ? lesson['productId'].toString()
                                              : null,
                                        )),
                                      )
                                      .value ??
                                  const [])
                            : const <String>[];
                        final completed = completedIds.toSet();
                        final lessonOrder = <CurriculumLessonModel>[
                          for (final m in modules) ...m.lessons,
                        ];
                        final lessonIndexById = <String, int>{
                          for (int i = 0; i < lessonOrder.length; i++)
                            lessonOrder[i].id: i,
                        };
                        final trackableOrdered = lessonOrder
                            .where(_syllabusIsTrackable)
                            .toList();

                        return ListView(
                          controller: scrollController,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                          children: [
                            for (final module in modules)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Theme(
                                  data: Theme.of(ctx).copyWith(
                                    dividerColor: Colors.transparent,
                                  ),
                                  child: ExpansionTile(
                                    tilePadding: EdgeInsets.zero,
                                    initiallyExpanded: true,
                                    title: Text(
                                      module.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15,
                                      ),
                                    ),
                                    children: module.lessons.map((cl) {
                                      final idx = lessonIndexById[cl.id] ?? -1;
                                      final hasNext = idx >= 0 &&
                                          idx + 1 < lessonOrder.length;
                                      final nextL =
                                          hasNext ? lessonOrder[idx + 1] : null;
                                      final unlocked = _syllabusEffectiveUnlocked(
                                        lesson: cl,
                                        trackableOrdered: trackableOrdered,
                                        completed: completed,
                                        useProgress: useProgress,
                                      );
                                      final done = useProgress &&
                                          _syllabusIsTrackable(cl) &&
                                          completed.contains(cl.id);
                                      final isCurrent = cl.id == currentLessonId;
                                      return ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 4,
                                          vertical: 0,
                                        ),
                                        leading: Icon(
                                          unlocked
                                              ? _syllabusIconForType(cl.type)
                                              : Icons.lock_outline_rounded,
                                          color: isCurrent
                                              ? AppColors.primary
                                              : AppColors.textTertiary,
                                          size: 22,
                                        ),
                                        title: Text(
                                          cl.title.isNotEmpty
                                              ? cl.title
                                              : 'Bài học',
                                          style: TextStyle(
                                            fontWeight: isCurrent
                                                ? FontWeight.w900
                                                : FontWeight.w600,
                                            color: isCurrent
                                                ? AppColors.primary
                                                : AppColors.textPrimary,
                                          ),
                                        ),
                                        subtitle: Text(
                                          unlocked
                                              ? (done
                                                  ? 'Đã hoàn thành'
                                                  : (isCurrent
                                                      ? 'Đang xem'
                                                      : _syllabusLabelForType(
                                                          cl.type,
                                                        )))
                                              : 'Đã khóa',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: done
                                                ? AppColors.success
                                                : AppColors.textTertiary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        onTap: () {
                                          if (!unlocked) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Hoàn thành bài trước để mở khóa.',
                                                ),
                                              ),
                                            );
                                            return;
                                          }
                                          final payload = _syllabusLessonPayload(
                                            deliveryTargetId:
                                                deliveryTargetId.isNotEmpty
                                                ? deliveryTargetId
                                                : null,
                                            productId: (lesson['productId'] ??
                                                        '')
                                                    .toString()
                                                    .isNotEmpty
                                                ? lesson['productId'].toString()
                                                : null,
                                            mode:
                                                (lesson['mode'] ?? 'VOD')
                                                    .toString(),
                                            progressDisabled: progressDisabled,
                                            lesson: cl,
                                            nextLesson: nextL,
                                          );
                                          Navigator.of(
                                            ctx,
                                            rootNavigator: true,
                                          ).pop();
                                          context.pushReplacement(
                                            '/lesson',
                                            extra: payload,
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lesson = widget.lesson ?? const <String, dynamic>{};
    final deliveryTargetId = (lesson['deliveryTargetId'] ?? '').toString();
    final mode = (lesson['mode'] ?? 'VOD').toString().toUpperCase();
    final productIdRaw = (lesson['productId'] ?? '').toString();
    final productId = productIdRaw.isNotEmpty ? productIdRaw : null;

    // Watch for completions to make UI reactive.
    final completedIds = ref.watch(classCompletedLessonIdsProvider((
      deliveryTargetId: deliveryTargetId,
      mode: mode,
      productId: productId,
    ))).value ?? const [];
    final currentDone = completedIds.contains((lesson['id'] ?? '').toString());

    final title = (lesson['title'] ?? 'Bài học').toString();
    final subtitle = (lesson['subtitle'] ?? '').toString();
    final duration = (lesson['duration'] ?? '').toString();
    final typeRaw = (lesson['type'] ?? 'video').toString();
    final typeUpper = typeRaw.toUpperCase();
    final article = lesson['article'] as Map<String, dynamic>?;
    final nextLesson = lesson['nextLesson'] as Map<String, dynamic>?;
    final progressDisabled = lesson['progressDisabled'] == true;
    final videoUrl = _resolvedVideoUrl ?? _extractImmediateVideoUrl(lesson);
    final isVideo = typeUpper == 'VIDEO';
    final isReading = typeUpper == 'READING' || typeUpper == 'ARTICLE';

    // Watch the provider here to keep it alive even when the chat sheet is closed.
    // It will only be disposed when this LessonScreen is unmounted (e.g. switching lessons).
    ref.watch(lessonSenseiChatProvider((
      lessonId: (lesson['id'] ?? '').toString(),
      courseId: (lesson['courseId'] ?? lesson['productId'] ?? '').toString(),
    )));

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            tooltip: 'Mục lục — chương trình học',
            icon: const Icon(
              Icons.list_alt_outlined,
              color: AppColors.textPrimary,
            ),
            onPressed: deliveryTargetId.isEmpty ? null : _openSyllabusSheet,
          ),
        ],
      ),
      body: Column(
        children: [
          if (isVideo)
            _buildVideoArea()
          else if (isReading)
            _buildReadingHeader(
              title: title,
              subtitle: subtitle,
              duration: duration,
              thumbnailUrl: lesson['thumbnailUrl'] as String?,
            )
          else
            _buildHero(
              type: typeRaw,
              thumbnailUrl: lesson['thumbnailUrl'] as String?,
              title: title,
              subtitle: subtitle,
              duration: duration,
              videoUrl: videoUrl,
            ),

          TabBar(
            controller: _tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textTertiary,
            indicatorColor: AppColors.primary,
            tabs: const [
              Tab(text: 'Nội dung'),
              Tab(text: 'Tài liệu'),
              Tab(text: 'Thảo luận'),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildContentTab(
                  type: typeRaw,
                  article: article,
                  videoUrl: videoUrl,
                  resolvedArticleContent: _resolvedArticleContent,
                ),
                _buildPlaceholderTab('Tài liệu sẽ được cập nhật'),
                _buildDiscussionTab(),
              ],
            ),
          ),

          FutureBuilder<AcademyProductDetailModel?>(
            future: _syllabusDetailFuture,
            builder: (context, snapshot) {
              final detail = snapshot.data;
              final dynamicNext = detail != null ? _resolveDynamicNextLesson(detail) : null;
              final effectiveNext = dynamicNext ?? nextLesson;

              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  border: Border(top: BorderSide(color: AppColors.grey200)),
                ),
                child: progressDisabled
                    ? SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (effectiveNext == null || (!progressDisabled && !currentDone))
                              ? null
                              : () => context.pushReplacement(
                                  '/lesson',
                                  extra: effectiveNext,
                                ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.textOnPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Bài tiếp theo',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          if (_activeTabIndex == 0) ...[
                            Expanded(
                              child: OutlinedButton(
                                onPressed:
                                    deliveryTargetId.isEmpty ||
                                            !_isTrackableType(typeRaw) ||
                                            currentDone
                                        ? null
                                        : () => _markComplete(),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  side: BorderSide(
                                    color: currentDone ? AppColors.success : AppColors.grey300,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (currentDone) ...[
                                      const Icon(Icons.check_circle, color: AppColors.success, size: 18),
                                      const SizedBox(width: 8),
                                    ],
                                    Text(
                                      currentDone ? 'Đã hoàn thành' : 'Đánh dấu hoàn thành',
                                      style: TextStyle(
                                        color: currentDone ? AppColors.success : AppColors.textPrimary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                          Expanded(
                            child: ElevatedButton(
                              onPressed: (effectiveNext == null || (!progressDisabled && !currentDone))
                                  ? null
                                  : () => context.pushReplacement(
                                      '/lesson',
                                      extra: effectiveNext,
                                    ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.textOnPrimary,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Bài tiếp theo',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openSenseiChat(),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.auto_awesome),
      ),
    );
  }

  /// Phần đầu dành cho bài READING/ARTICLE — không dùng layout kiểu video poster.
  Widget _buildReadingHeader({
    required String title,
    required String subtitle,
    required String duration,
    required String? thumbnailUrl,
  }) {
    return Material(
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (thumbnailUrl != null && thumbnailUrl.isNotEmpty)
            AspectRatio(
              aspectRatio: 2.4,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    thumbnailUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        ColoredBox(color: AppColors.grey200),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.1),
                          Colors.black.withValues(alpha: 0.55),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.95),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.menu_book_rounded,
                            size: 16,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Bài đọc',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.14),
                    AppColors.surface,
                  ],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.menu_book_rounded,
                      color: AppColors.primary,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Bài đọc',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 11,
                              color: AppColors.primary,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Đọc nội dung bên dưới và bấm hoàn thành khi đã nắm bài.',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.35,
                            color: AppColors.textTertiary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    height: 1.25,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                if (duration.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule_rounded,
                        size: 16,
                        color: AppColors.textTertiary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        duration,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textTertiary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoArea() {
    final chewie = _chewieController;
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: AspectRatio(
        aspectRatio:
            (_videoController != null && _videoController!.value.isInitialized)
            ? _videoController!.value.aspectRatio
            : 16 / 9,
        child: chewie != null
            ? Chewie(controller: chewie)
            : _videoInitError != null
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _videoInitError!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          _disposeVideo();
                          _initVideo();
                        },
                        child: const Text('Thử lại'),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
      ),
    );
  }

  Widget _buildHero({
    required String type,
    required String? thumbnailUrl,
    required String title,
    required String subtitle,
    required String duration,
    required String? videoUrl,
  }) {
    final heroTitle = subtitle.isNotEmpty
        ? subtitle
        : (type == 'article' ? 'Bài đọc' : 'Video bài học');
    final meta = [
      if (duration.isNotEmpty) duration,
      if (type.isNotEmpty) type.toUpperCase(),
    ].join(' • ');

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: AppColors.textPrimary,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (thumbnailUrl != null && thumbnailUrl.isNotEmpty)
                  Image.network(
                    thumbnailUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Container(color: AppColors.grey200),
                  )
                else
                  Container(color: AppColors.grey200),
                Container(color: Colors.black.withOpacity(0.35)),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.16),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.18),
                          ),
                        ),
                        child: Text(
                          heroTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      if (meta.isNotEmpty)
                        Text(
                          meta,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  right: 14,
                  bottom: 14,
                  child: _PrimaryPillButton(
                    icon: type == 'article'
                        ? Icons.menu_book_rounded
                        : Icons.play_arrow_rounded,
                    label: type == 'article' ? 'Đọc ngay' : 'Xem ngay',
                    enabled:
                        type == 'article' ||
                        (videoUrl != null && videoUrl.isNotEmpty),
                    onPressed: () {
                      if (!mounted) return;
                      _tabController.animateTo(0);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContentTab({
    required String type,
    required Map<String, dynamic>? article,
    required String? videoUrl,
    required String? resolvedArticleContent,
  }) {
    final typeUpper = type.toUpperCase();
    if (typeUpper == 'ARTICLE' || typeUpper == 'READING') {
      final articleTitle = (article?['title'] ?? 'Bài đọc').toString();
      final content =
          (resolvedArticleContent ?? article?['content'] ?? '').toString();

      return ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.grey200),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textPrimary.withValues(alpha: 0.04),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articleTitle,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 14),
                if (content.trim().isNotEmpty)
                  SelectionArea(
                    contextMenuBuilder: (context, selectableRegionState) {
                      return AdaptiveTextSelectionToolbar.buttonItems(
                        anchors: selectableRegionState.contextMenuAnchors,
                        buttonItems: [
                          ...selectableRegionState.contextMenuButtonItems,
                          ContextMenuButtonItem(
                            label: 'Hỏi Sensei',
                            onPressed: () async {
                              selectableRegionState.copySelection(SelectionChangedCause.toolbar);
                              final data = await Clipboard.getData(Clipboard.kTextPlain);
                              final text = data?.text;
                              if (text != null && text.trim().isNotEmpty) {
                                _openSenseiChat(initialMessage: text);
                              }
                            },
                          ),
                        ],
                      );
                    },
                    child: MarkdownBody(
                      data: content,
                      selectable: false,
                      extensionSet: md.ExtensionSet.gitHubWeb,
                    ),
                  )
                else
                  Text(
                    'Nội dung bài đọc đang được cập nhật.',
                    style: TextStyle(
                      height: 1.75,
                      color: AppColors.textPrimary,
                      fontSize: 15,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.15),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.touch_app_rounded,
                  size: 20,
                  color: AppColors.primary.withValues(alpha: 0.9),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Cuộn để đọc hết nội dung. Khi đã xong, dùng nút «Đánh dấu hoàn thành» bên dưới để lưu tiến độ.',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.45,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    if (typeUpper == 'QUIZ') {
      return _buildPlaceholderTab(
        'Bài quiz chưa được tích hợp trong bản demo này.',
      );
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Mô tả & hướng dẫn',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        Text(
          videoUrl != null && videoUrl.isNotEmpty
              ? 'Dùng thanh điều khiển video để tua, phóng to toàn màn hình. Xem hết video sẽ tự lưu tiến độ (nếu đã ghi danh lớp).'
              : 'Video chưa có đường dẫn. Kiểm tra cấu hình bài học trên hệ thống.',
          style: TextStyle(height: 1.7, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 20),
        _buildSectionCard(
          title: 'Gợi ý học nhanh',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bullet('Xem hết video một lượt để nắm ý chính'),
              _bullet('Tua lại đoạn khó trong trình phát'),
              _bullet('Có thể bấm «Đánh dấu hoàn thành» nếu cần'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 6, color: AppColors.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(height: 1.6, color: AppColors.textPrimary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderTab(String text) {
    return Center(
      child: Text(text, style: TextStyle(color: AppColors.textTertiary)),
    );
  }

  Future<void> _refreshDiscussionIfPossible() async {
    final lessonId = (widget.lesson?['id'] ?? '').toString();
    if (lessonId.isEmpty) return;

    final authState = ref.read(authStateProvider).valueOrNull;
    if (authState == null ||
        !authState.isAuthenticated ||
        authState.user == null) {
      // Not logged in: keep discussions hidden.
      return;
    }

    setState(() {
      _discussionLoading = true;
      _discussionError = null;
    });

    try {
      final repo = ref.read(commentRepositoryProvider);
      final topics = await repo.getDiscussionTopics(
        discussionEntityId: lessonId,
        page: 1,
        limit: 100,
      );
      setState(() {
        _topics = topics;
        _discussionLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _discussionError = e.toString();
        _discussionLoading = false;
      });
    }
  }

  Future<void> _createTopic({
    required String title,
    required String content,
  }) async {
    final lessonId = (widget.lesson?['id'] ?? '').toString();
    if (lessonId.isEmpty) return;

    final authState = ref.read(authStateProvider).valueOrNull;
    final userId = authState?.user?.id;
    if (userId == null) return;

    if (_isCurrentUserDiscussionReadOnly()) {
      throw Exception(
        _discussionReadOnlyReason ??
            'Tài khoản này chỉ có quyền xem thảo luận, không thể đặt câu hỏi.',
      );
    }

    try {
      await ref
          .read(commentRepositoryProvider)
          .createTopic(
            discussionEntityId: lessonId,
            userId: userId,
            title: title,
            content: content,
          );
    } catch (e) {
      final message = _normalizeErrorMessage(e);
      if (_isDiscussionWriteForbiddenMessage(message) && mounted) {
        setState(() {
          _discussionReadOnly = true;
          _discussionReadOnlyReason = message;
        });
      }
      throw Exception(message);
    }

    await _refreshDiscussionIfPossible();
  }

  Future<void> _replyToTopic({
    required String topicId,
    required String content,
  }) async {
    final lessonId = (widget.lesson?['id'] ?? '').toString();
    if (lessonId.isEmpty) return;

    final authState = ref.read(authStateProvider).valueOrNull;
    final userId = authState?.user?.id;
    if (userId == null) return;

    if (_isCurrentUserDiscussionReadOnly()) {
      if (mounted) {
        _showDiscussionSnackBar(
          _discussionReadOnlyReason ??
              'Tài khoản này chỉ có quyền xem thảo luận, không thể trả lời.',
        );
      }
      return;
    }

    try {
      await ref
          .read(commentRepositoryProvider)
          .replyToTopic(
            discussionEntityId: lessonId,
            userId: userId,
            parentId: topicId,
            content: content,
          );
    } catch (e) {
      final message = _normalizeErrorMessage(e);
      if (_isDiscussionWriteForbiddenMessage(message) && mounted) {
        setState(() {
          _discussionReadOnly = true;
          _discussionReadOnlyReason = message;
        });
      }
      if (mounted) _showDiscussionSnackBar(message);
      return;
    }

    setState(() {
      _replyDrafts[topicId] = '';
    });
    await _refreshDiscussionIfPossible();
  }

  Future<void> _openCreateTopicSheet() async {
    if (_isCreateTopicSheetOpen) return;
    if (_isCurrentUserDiscussionReadOnly()) {
      if (mounted) {
        _showDiscussionSnackBar(
          _discussionReadOnlyReason ??
              'Tài khoản này chỉ có quyền xem thảo luận.',
        );
      }
      return;
    }
    _isCreateTopicSheetOpen = true;
    try {
      await showModalBottomSheet<void>(
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (sheetCtx) => _CreateTopicSheet(
          onSubmit: _createTopic,
        ),
      );
    } finally {
      _isCreateTopicSheetOpen = false;
    }
  }

  Widget _buildDiscussionTab() {
    final lessonId = (widget.lesson?['id'] ?? '').toString();
    final authState = ref.watch(authStateProvider).valueOrNull;
    final isAuthed =
        authState != null &&
        authState.isAuthenticated &&
        authState.user != null;
    final roleReadOnly = _isDiscussionReadOnlyRole(authState?.user?.role);
    final discussionReadOnly = _discussionReadOnly || roleReadOnly;
    final readOnlyReason = _discussionReadOnlyReason ??
      (roleReadOnly
        ? 'Tài khoản này chỉ có quyền xem thảo luận, không thể đặt câu hỏi hoặc trả lời.'
        : null);

    if (lessonId.isEmpty) {
      return Center(
        child: Text(
          'Thiếu lessonId để tải thảo luận.',
          style: TextStyle(color: AppColors.textTertiary),
        ),
      );
    }

    if (!isAuthed) {
      return Center(
        child: Text(
          'Đăng nhập để xem và trả lời thảo luận.',
          style: TextStyle(color: AppColors.textTertiary),
        ),
      );
    }

    if (_discussionLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_discussionError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Không thể tải thảo luận: $_discussionError',
            style: TextStyle(color: AppColors.error),
          ),
        ),
      );
    }

    if (_topics.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.message_outlined,
                size: 52,
                color: AppColors.textTertiary,
              ),
              const SizedBox(height: 12),
              const Text(
                'Chưa có thảo luận nào',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              const Text(
                'Hãy đặt câu hỏi để nhận phản hồi từ lecture/staff.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: discussionReadOnly ? null : _openCreateTopicSheet,
                child: Text(
                  discussionReadOnly ? 'Chỉ xem thảo luận' : 'Đặt câu hỏi',
                ),
              ),
              if (discussionReadOnly && readOnlyReason != null) ...[
                const SizedBox(height: 10),
                Text(
                  readOnlyReason,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textTertiary),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _refreshDiscussionIfPossible,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _topics.length,
        itemBuilder: (ctx, i) {
          final topic = _topics[i];
          final expanded = _expandedTopicId == topic.id;
          final topicTitle = topicTitleFrom(topic.content);

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _expandedTopicId = expanded ? null : topic.id;
                      });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            topicTitle,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        if (topic.status == 'ANSWERED')
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.success.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: const Text(
                              'Đã trả lời',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: AppColors.success,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    topic.content,
                    style: TextStyle(
                      color: AppColors.textPrimary.withOpacity(0.85),
                    ),
                  ),

                  if (expanded) ...[
                    const SizedBox(height: 12),
                    if ((topic.replies.isEmpty))
                      Text(
                        'Chưa có phản hồi nào.',
                        style: TextStyle(color: AppColors.textTertiary),
                      ),
                    if (topic.replies.isNotEmpty) ...[
                      const Text(
                        'Phản hồi',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: topic.replies
                            .map((r) => _renderComment(r, depth: 1))
                            .toList(),
                      ),
                    ],

                    const SizedBox(height: 12),
                    if (discussionReadOnly)
                      Text(
                        readOnlyReason ??
                            'Tài khoản này chỉ có quyền xem thảo luận.',
                        style: TextStyle(color: AppColors.textTertiary),
                      )
                    else ...[
                      const Text(
                        'Trả lời',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: TextEditingController(
                          text: _replyDrafts[topic.id] ?? '',
                        ),
                        onChanged: (v) {
                          _replyDrafts[topic.id] = v;
                        },
                        minLines: 3,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Viết câu trả lời...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final text = (_replyDrafts[topic.id] ?? '').trim();
                              if (text.isEmpty) return;
                              await _replyToTopic(
                                topicId: topic.id,
                                content: text,
                              );
                            },
                            child: const Text('Gửi trả lời'),
                          ),
                        ],
                      ),
                    ],
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _renderComment(CommentModel comment, {required int depth}) {
    final indent = depth * 12.0;
    final children = comment.replies;
    return Padding(
      padding: EdgeInsets.only(left: indent, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.grey200.withOpacity(0.18),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.grey200),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.author?.displayName ?? 'Unknown',
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 6),
                Text(
                  comment.content,
                  style: TextStyle(
                    color: AppColors.textPrimary.withOpacity(0.85),
                  ),
                ),
              ],
            ),
          ),
          if (children.isNotEmpty && depth < 2)
            ...children
                .map((c) => _renderComment(c, depth: depth + 1))
                .toList(),
        ],
      ),
    );
  }

  String topicTitleFrom(String content) {
    return content
        .split('\n')
        .firstWhere(
          (e) => e.trim().isNotEmpty,
          orElse: () => 'Không có tiêu đề',
        )
        .trim();
  }

  bool _isDiscussionReadOnlyRole(String? role) {
    final r = (role ?? '').trim().toUpperCase();
    if (r.isEmpty) return false;
    return r == 'ADMIN' ||
        r == 'ACADEMIC_STAFF' ||
        r == 'ACADEMY_STAFF' ||
        r == 'STAFF' ||
        r == 'EMPLOYEE';
  }

  bool _isCurrentUserDiscussionReadOnly() {
    final authState = ref.read(authStateProvider).valueOrNull;
    return _discussionReadOnly ||
        _isDiscussionReadOnlyRole(authState?.user?.role);
  }

  bool _isDiscussionWriteForbiddenMessage(String message) {
    final m = message.toLowerCase();
    return (m.contains('chỉ có quyền xem') && m.contains('thảo luận')) ||
        m.contains('không được phép đặt câu hỏi') ||
        m.contains('không được phép trả lời');
  }

  String _normalizeErrorMessage(Object error) {
    final raw = error.toString().trim();
    if (raw.startsWith('Exception:')) {
      return raw.substring('Exception:'.length).trim();
    }
    return raw;
  }

  void _showDiscussionSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Map<String, dynamic>? _resolveDynamicNextLesson(AcademyProductDetailModel detail) {
    final lesson = widget.lesson ?? const <String, dynamic>{};
    final currentId = (lesson['id'] ?? '').toString();
    final deliveryTargetId = (lesson['deliveryTargetId'] ?? '').toString();
    final productId = (lesson['productId'] ?? '').toString();
    final mode = (lesson['mode'] ?? 'VOD').toString().toUpperCase();
    final progressDisabled = lesson['progressDisabled'] == true;

    final lessons = <CurriculumLessonModel>[
      for (final m in detail.modules) ...m.lessons,
    ];
    final idx = lessons.indexWhere((l) => l.id == currentId);
    if (idx >= 0 && idx < lessons.length - 1) {
      final nextL = lessons[idx + 1];
      final nextNextL = (idx + 1 < lessons.length - 1) ? lessons[idx + 2] : null;

      return _syllabusLessonPayload(
        lesson: nextL,
        nextLesson: nextNextL,
        deliveryTargetId: deliveryTargetId.isNotEmpty ? deliveryTargetId : null,
        productId: productId.isNotEmpty ? productId : null,
        mode: mode,
        progressDisabled: progressDisabled,
      );
    }
    return null;
  }
}

bool _syllabusIsTrackable(CurriculumLessonModel l) {
  final t = l.type.toUpperCase();
  return t == 'VIDEO' || t == 'READING' || t == 'ARTICLE';
}

bool _syllabusEffectiveUnlocked({
  required CurriculumLessonModel lesson,
  required List<CurriculumLessonModel> trackableOrdered,
  required Set<String> completed,
  required bool useProgress,
}) {
  if (!_syllabusIsTrackable(lesson)) return true;
  if (!useProgress) return true;
  final idx = trackableOrdered.indexWhere((l) => l.id == lesson.id);
  if (idx <= 0) return true;
  return completed.contains(trackableOrdered[idx - 1].id);
}

Map<String, dynamic> _syllabusLessonPayload({
  required CurriculumLessonModel lesson,
  CurriculumLessonModel? nextLesson,
  String? deliveryTargetId,
  String? productId,
  String? mode,
  bool progressDisabled = false,
}) {
  final effectiveProductId = (productId != null && productId.isNotEmpty)
      ? productId
      : null;
  return <String, dynamic>{
    if (deliveryTargetId != null && deliveryTargetId.isNotEmpty) 'deliveryTargetId': deliveryTargetId,
    if (effectiveProductId != null && effectiveProductId.isNotEmpty) 'productId': effectiveProductId,
    if (mode != null && mode.isNotEmpty) 'mode': mode,
    if (progressDisabled) 'progressDisabled': true,
    'id': lesson.id,
    'title': lesson.title,
    'type': lesson.type.toLowerCase(),
    'videoUrl': lesson.videoUrl,
    if (lesson.videoFileId != null && lesson.videoFileId!.isNotEmpty)
      'videoFileId': lesson.videoFileId,
    'article': <String, dynamic>{
      'title': lesson.title,
      'content': lesson.content ?? 'Nội dung bài học đang được cập nhật.',
    },
    if (nextLesson != null)
      'nextLesson': <String, dynamic>{
        if (deliveryTargetId != null && deliveryTargetId.isNotEmpty) 'deliveryTargetId': deliveryTargetId,
        if (effectiveProductId != null && effectiveProductId.isNotEmpty) 'productId': effectiveProductId,
        if (mode != null && mode.isNotEmpty) 'mode': mode,
        if (progressDisabled) 'progressDisabled': true,
        'id': nextLesson.id,
        'title': nextLesson.title,
        'type': nextLesson.type.toLowerCase(),
        'videoUrl': nextLesson.videoUrl,
        if (nextLesson.videoFileId != null && nextLesson.videoFileId!.isNotEmpty)
          'videoFileId': nextLesson.videoFileId,
        'article': <String, dynamic>{
          'title': nextLesson.title,
          'content':
              nextLesson.content ?? 'Nội dung bài học đang được cập nhật.',
        },
      },
  };
}

IconData _syllabusIconForType(String type) {
  switch (type.toUpperCase()) {
    case 'READING':
    case 'ARTICLE':
      return Icons.article_outlined;
    case 'QUIZ':
      return Icons.quiz_rounded;
    case 'VIDEO':
    default:
      return Icons.play_circle_fill;
  }
}

String _syllabusLabelForType(String type) {
  switch (type.toUpperCase()) {
    case 'READING':
    case 'ARTICLE':
      return 'Bài đọc';
    case 'QUIZ':
      return 'Quiz';
    case 'VIDEO':
    default:
      return 'Video';
  }
}

class _PrimaryPillButton extends StatelessWidget {
  const _PrimaryPillButton({
    required this.icon,
    required this.label,
    required this.enabled,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.6,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(999),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.textOnPrimary, size: 18),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.textOnPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreateTopicSheet extends StatefulWidget {
  const _CreateTopicSheet({
    required this.onSubmit,
  });

  final Future<void> Function({
    required String title,
    required String content,
  }) onSubmit;

  @override
  State<_CreateTopicSheet> createState() => _CreateTopicSheetState();
}

class _CreateTopicSheetState extends State<_CreateTopicSheet> {
  late final TextEditingController _titleCtrl;
  late final TextEditingController _contentCtrl;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController()..addListener(_onChanged);
    _contentCtrl = TextEditingController()..addListener(_onChanged);
  }

  @override
  void dispose() {
    _titleCtrl.removeListener(_onChanged);
    _contentCtrl.removeListener(_onChanged);
    _titleCtrl.dispose();
    _contentCtrl.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _handleSubmit() async {
    final title = _titleCtrl.text.trim();
    final content = _contentCtrl.text.trim();
    if (title.isEmpty || content.isEmpty || _isSubmitting) return;

    setState(() => _isSubmitting = true);
    try {
      await widget.onSubmit(title: title, content: content);
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      final raw = e.toString();
      final message = raw.startsWith('Exception:')
          ? raw.substring('Exception:'.length).trim()
          : raw;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final canSubmit =
        _titleCtrl.text.trim().isNotEmpty &&
        _contentCtrl.text.trim().isNotEmpty &&
        !_isSubmitting;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(bottom: bottomInset),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.9,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.grey300,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Đặt câu hỏi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _titleCtrl,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Tiêu đề',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _contentCtrl,
                    minLines: 4,
                    maxLines: 7,
                    decoration: const InputDecoration(
                      labelText: 'Nội dung',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _isSubmitting
                              ? null
                              : () => Navigator.of(context).pop(),
                          child: const Text('Hủy'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: canSubmit ? _handleSubmit : null,
                          child: _isSubmitting
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text('Gửi'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
