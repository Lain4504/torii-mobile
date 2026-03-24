import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/comment_model.dart';
import 'package:torii_app/data/models/academy_product_detail_model.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:video_player/video_player.dart';

class LessonScreen extends ConsumerStatefulWidget {
  const LessonScreen({super.key, this.lesson});
  final Map<String, dynamic>? lesson;

  @override
  ConsumerState<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends ConsumerState<LessonScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  bool _autoMarkedComplete = false;

  bool _discussionLoading = false;
  String? _discussionError;
  List<CommentModel> _topics = [];
  String? _expandedTopicId;
  final Map<String, String> _replyDrafts = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _initVideo();
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

    final oldClassId = (oldWidget.lesson?['classId'] ?? '').toString();
    final newClassId = (widget.lesson?['classId'] ?? '').toString();
    if (oldClassId.isNotEmpty && oldClassId != newClassId) {
      _refreshDiscussionIfPossible();
    }
    if (oldWidget.lesson?['videoUrl'] != widget.lesson?['videoUrl'] ||
        oldWidget.lesson?['type'] != widget.lesson?['type']) {
      _disposeVideo();
      _initVideo();
    }
  }

  void _onVideoProgress() {
    final c = _videoController;
    if (c == null || !c.value.isInitialized || !mounted) return;
    if (_autoMarkedComplete) return;
    final lesson = widget.lesson ?? const <String, dynamic>{};
    if (lesson['progressDisabled'] == true) return;
    final classId = (lesson['classId'] ?? '').toString();
    if (classId.isEmpty) return;
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
    final url = lesson['videoUrl'] as String?;
    if (url == null || url.isEmpty) return;
    if (type == 'article' || type == 'reading' || type == 'quiz') return;

    final vc = VideoPlayerController.networkUrl(Uri.parse(url));
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
      setState(() {});
    } catch (_) {
      await vc.dispose();
      if (mounted) {
        _videoController = null;
        setState(() {});
      }
    }
  }

  void _disposeVideo() {
    _videoController?.removeListener(_onVideoProgress);
    _chewieController?.dispose();
    _videoController?.dispose();
    _chewieController = null;
    _videoController = null;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _disposeVideo();
    super.dispose();
  }

  bool _isTrackableType(String type) {
    final t = type.toUpperCase();
    return t == 'VIDEO' || t == 'READING' || t == 'ARTICLE';
  }

  Future<void> _markComplete({bool silent = false}) async {
    final lesson = widget.lesson ?? const <String, dynamic>{};
    final classId = (lesson['classId'] ?? '').toString();
    final lessonId = (lesson['id'] ?? '').toString();
    if (classId.isEmpty || lessonId.isEmpty) {
      if (!silent && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Thiếu thông tin lớp học để lưu tiến độ.')),
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
    final ok = await repo.completeClassLesson(classId: classId, lessonId: lessonId);
    if (!mounted) return;
    if (ok) {
      ref.invalidate(classCompletedLessonIdsProvider(classId));
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
        const SnackBar(content: Text('Không thể cập nhật tiến độ. Thử lại sau.')),
      );
    }
  }

  void _openSyllabusSheet() {
    final lesson = widget.lesson ?? const <String, dynamic>{};
    final classId = (lesson['classId'] ?? '').toString();
    if (classId.isEmpty) return;
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
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(color: AppColors.grey300, borderRadius: BorderRadius.circular(999)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 8, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Chương trình học',
                            style: Theme.of(ctx).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close_rounded),
                          onPressed: () => Navigator.of(ctx, rootNavigator: true).pop(),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: ref.watch(classCatalogDetailProvider(classId)).when(
                          loading: () => const Center(child: CircularProgressIndicator()),
                          error: (e, _) => Center(child: Text('Lỗi: $e', style: const TextStyle(color: AppColors.error))),
                          data: (detail) {
                            if (detail == null) {
                              return const Center(child: Text('Không có dữ liệu lộ trình'));
                            }
                            final useProgress = !progressDisabled && classId.isNotEmpty;
                            final modules = detail.modules
                                .map((m) => CurriculumModuleModel.fromJson(m))
                                .toList();
                            final completedIds = useProgress
                                ? (ref.watch(classCompletedLessonIdsProvider(classId)).value ?? const [])
                                : const <String>[];
                            final completed = completedIds.toSet();
                            final lessonOrder = <CurriculumLessonModel>[
                              for (final m in modules) ...m.lessons,
                            ];
                            final lessonIndexById = <String, int>{
                              for (int i = 0; i < lessonOrder.length; i++) lessonOrder[i].id: i,
                            };
                            final trackableOrdered = lessonOrder.where(_syllabusIsTrackable).toList();

                            return ListView(
                              controller: scrollController,
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                              children: [
                                for (final module in modules)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Theme(
                                      data: Theme.of(ctx).copyWith(dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.zero,
                                        initiallyExpanded: true,
                                        title: Text(module.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
                                        children: module.lessons.map((cl) {
                                          final idx = lessonIndexById[cl.id] ?? -1;
                                          final hasNext = idx >= 0 && idx + 1 < lessonOrder.length;
                                          final nextL = hasNext ? lessonOrder[idx + 1] : null;
                                          final unlocked = _syllabusEffectiveUnlocked(
                                            lesson: cl,
                                            trackableOrdered: trackableOrdered,
                                            completed: completed,
                                            useProgress: useProgress,
                                          );
                                          final done = useProgress && _syllabusIsTrackable(cl) && completed.contains(cl.id);
                                          final isCurrent = cl.id == currentLessonId;
                                          return ListTile(
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                                            leading: Icon(
                                              unlocked ? _syllabusIconForType(cl.type) : Icons.lock_outline_rounded,
                                              color: isCurrent ? AppColors.primary : AppColors.textTertiary,
                                              size: 22,
                                            ),
                                            title: Text(
                                              cl.title.isNotEmpty ? cl.title : 'Bài học',
                                              style: TextStyle(
                                                fontWeight: isCurrent ? FontWeight.w900 : FontWeight.w600,
                                                color: isCurrent ? AppColors.primary : AppColors.textPrimary,
                                              ),
                                            ),
                                            subtitle: Text(
                                              unlocked
                                                  ? (done ? 'Đã hoàn thành' : (isCurrent ? 'Đang xem' : _syllabusLabelForType(cl.type)))
                                                  : 'Đã khóa',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: done ? AppColors.success : AppColors.textTertiary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            onTap: () {
                                              if (!unlocked) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(content: Text('Hoàn thành bài trước để mở khóa.')),
                                                );
                                                return;
                                              }
                                              final payload = _syllabusLessonPayload(
                                                classId: classId.isNotEmpty ? classId : null,
                                                progressDisabled: progressDisabled,
                                                lesson: cl,
                                                nextLesson: nextL,
                                              );
                                              Navigator.of(ctx, rootNavigator: true).pop();
                                              context.pushReplacement('/lesson', extra: payload);
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
    final title = (lesson['title'] ?? 'Bài học').toString();
    final subtitle = (lesson['subtitle'] ?? '').toString();
    final duration = (lesson['duration'] ?? '').toString();
    final typeRaw = (lesson['type'] ?? 'video').toString();
    final typeUpper = typeRaw.toUpperCase();
    final article = lesson['article'] as Map<String, dynamic>?;
    final nextLesson = lesson['nextLesson'] as Map<String, dynamic>?;
    final classId = (lesson['classId'] ?? '').toString();
    final progressDisabled = lesson['progressDisabled'] == true;
    final videoUrl = lesson['videoUrl'] as String?;
    final isVideo = typeUpper == 'VIDEO';
    final isReading = typeUpper == 'READING' || typeUpper == 'ARTICLE';

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
            icon: const Icon(Icons.list_alt_outlined, color: AppColors.textPrimary),
            onPressed: classId.isEmpty ? null : _openSyllabusSheet,
          ),
        ],
      ),
      body: Column(
        children: [
          if (isVideo && videoUrl != null && videoUrl.isNotEmpty)
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
                _buildContentTab(type: typeRaw, article: article, videoUrl: videoUrl),
                _buildPlaceholderTab('Tài liệu sẽ được cập nhật'),
                _buildDiscussionTab(),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColors.surface, border: Border(top: BorderSide(color: AppColors.grey200))),
            child: progressDisabled
                ? SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: nextLesson == null
                          ? null
                          : () => context.pushReplacement('/lesson', extra: nextLesson),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textOnPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: const Text('Bài tiếp theo', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  )
                : Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: classId.isEmpty || !_isTrackableType(typeRaw) ? null : () => _markComplete(),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text('Đánh dấu hoàn thành', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: nextLesson == null
                              ? null
                              : () => context.pushReplacement('/lesson', extra: nextLesson),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.textOnPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            elevation: 0,
                          ),
                          child: const Text('Bài tiếp theo', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
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
                    errorBuilder: (_, __, ___) => ColoredBox(color: AppColors.grey200),
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
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.95),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.menu_book_rounded, size: 16, color: AppColors.primary),
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
                    child: const Icon(Icons.menu_book_rounded, color: AppColors.primary, size: 28),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                      Icon(Icons.schedule_rounded, size: 16, color: AppColors.textTertiary),
                      const SizedBox(width: 6),
                      Text(
                        duration,
                        style: const TextStyle(fontSize: 12, color: AppColors.textTertiary, fontWeight: FontWeight.w600),
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
        aspectRatio: (_videoController != null && _videoController!.value.isInitialized)
            ? _videoController!.value.aspectRatio
            : 16 / 9,
        child: chewie != null
            ? Chewie(controller: chewie)
            : const Center(child: CircularProgressIndicator(color: Colors.white)),
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
    final heroTitle = subtitle.isNotEmpty ? subtitle : (type == 'article' ? 'Bài đọc' : 'Video bài học');
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
                    errorBuilder: (_, __, ___) => Container(color: AppColors.grey200),
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
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.16),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(color: Colors.white.withOpacity(0.18)),
                        ),
                        child: Text(
                          heroTitle,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16, height: 1.2),
                      ),
                      const SizedBox(height: 6),
                      if (meta.isNotEmpty)
                        Text(
                          meta,
                          style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  right: 14,
                  bottom: 14,
                  child: _PrimaryPillButton(
                    icon: type == 'article' ? Icons.menu_book_rounded : Icons.play_arrow_rounded,
                    label: type == 'article' ? 'Đọc ngay' : 'Xem ngay',
                    enabled: type == 'article' || (videoUrl != null && videoUrl.isNotEmpty),
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
  }) {
    final typeUpper = type.toUpperCase();
    if (typeUpper == 'ARTICLE' || typeUpper == 'READING') {
      final articleTitle = (article?['title'] ?? 'Bài đọc').toString();
      final content = (article?['content'] ?? '').toString();

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
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900, height: 1.3),
                ),
                const SizedBox(height: 14),
                if (content.trim().isNotEmpty)
                  Html(data: content)
                else
                  Text(
                    'Nội dung bài đọc đang được cập nhật.',
                    style: TextStyle(height: 1.75, color: AppColors.textPrimary, fontSize: 15),
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
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.15)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.touch_app_rounded, size: 20, color: AppColors.primary.withValues(alpha: 0.9)),
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
      return _buildPlaceholderTab('Bài quiz chưa được tích hợp trong bản demo này.');
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text('Mô tả & hướng dẫn', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
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
          BoxShadow(color: AppColors.textPrimary.withOpacity(0.04), blurRadius: 14, offset: const Offset(0, 6)),
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
          Expanded(child: Text(text, style: TextStyle(height: 1.6, color: AppColors.textPrimary))),
        ],
      ),
    );
  }

  Widget _buildPlaceholderTab(String text) {
    return Center(child: Text(text, style: TextStyle(color: AppColors.textTertiary)));
  }

  Future<void> _refreshDiscussionIfPossible() async {
    final lessonId = (widget.lesson?['id'] ?? '').toString();
    if (lessonId.isEmpty) return;

    final authState = ref.read(authStateProvider).valueOrNull;
    if (authState == null || !authState.isAuthenticated || authState.user == null) {
      // Not logged in: keep discussions hidden.
      return;
    }

    setState(() {
      _discussionLoading = true;
      _discussionError = null;
    });

    try {
      final repo = ref.read(commentRepositoryProvider);
      final topics = await repo.getDiscussionTopics(classId: lessonId, page: 1, limit: 100);
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

    await ref.read(commentRepositoryProvider).createTopic(
      classId: lessonId,
      userId: userId,
      title: title,
      content: content,
    );

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

    await ref.read(commentRepositoryProvider).replyToTopic(
      classId: lessonId,
      userId: userId,
      parentId: topicId,
      content: content,
    );

    setState(() {
      _replyDrafts[topicId] = '';
    });
    await _refreshDiscussionIfPossible();
  }

  Widget _buildDiscussionTab() {
    final lessonId = (widget.lesson?['id'] ?? '').toString();
    final authState = ref.watch(authStateProvider).valueOrNull;
    final isAuthed = authState != null && authState.isAuthenticated && authState.user != null;

    if (lessonId.isEmpty) {
      return Center(
        child: Text('Thiếu lessonId để tải thảo luận.', style: TextStyle(color: AppColors.textTertiary)),
      );
    }

    if (!isAuthed) {
      return Center(
        child: Text('Đăng nhập để xem và trả lời thảo luận.', style: TextStyle(color: AppColors.textTertiary)),
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
                  const Icon(Icons.message_outlined, size: 52, color: AppColors.textTertiary),
              const SizedBox(height: 12),
              const Text('Chưa có thảo luận nào', style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              const Text('Hãy đặt câu hỏi để nhận phản hồi từ lecture/staff.', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  String title = '';
                  String content = '';
                  await showDialog(
                    context: context,
                    builder: (ctx) {
                      final titleCtrl = TextEditingController();
                      final contentCtrl = TextEditingController();
                      return AlertDialog(
                        title: const Text('Đặt câu hỏi'),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextField(
                                controller: titleCtrl,
                                decoration: const InputDecoration(labelText: 'Tiêu đề'),
                              ),
                              TextField(
                                controller: contentCtrl,
                                decoration: const InputDecoration(labelText: 'Nội dung'),
                                minLines: 3,
                                maxLines: 6,
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Hủy')),
                          TextButton(
                            onPressed: () {
                              title = titleCtrl.text;
                              content = contentCtrl.text;
                              Navigator.of(ctx).pop();
                            },
                            child: const Text('Gửi'),
                          ),
                        ],
                      );
                    },
                  );

                  if (title.trim().isEmpty || content.trim().isEmpty) return;
                  await _createTopic(title: title.trim(), content: content.trim());
                },
                child: const Text('Đặt câu hỏi'),
              ),
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
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                        ),
                        if (topic.status == 'ANSWERED')
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.success.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: const Text(
                              'Đã trả lời',
                              style: TextStyle(fontWeight: FontWeight.w800, color: AppColors.success),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(topic.content, style: TextStyle(color: AppColors.textPrimary.withOpacity(0.85))),

                  if (expanded) ...[
                    const SizedBox(height: 12),
                    if ((topic.replies.isEmpty))
                      Text('Chưa có phản hồi nào.', style: TextStyle(color: AppColors.textTertiary)),
                    if (topic.replies.isNotEmpty) ...[
                      const Text('Phản hồi', style: TextStyle(fontWeight: FontWeight.w800)),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: topic.replies
                            .map((r) => _renderComment(r, depth: 1))
                            .toList(),
                      ),
                    ],

                    const SizedBox(height: 12),
                    const Text('Trả lời', style: TextStyle(fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: TextEditingController(text: _replyDrafts[topic.id] ?? ''),
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
                            await _replyToTopic(topicId: topic.id, content: text);
                          },
                          child: const Text('Gửi trả lời'),
                        ),
                      ],
                    ),
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
                Text(comment.content, style: TextStyle(color: AppColors.textPrimary.withOpacity(0.85))),
              ],
            ),
          ),
          if (children.isNotEmpty && depth < 2)
            ...children.map((c) => _renderComment(c, depth: depth + 1)).toList(),
        ],
      ),
    );
  }

  String topicTitleFrom(String content) {
    return content.split('\n').firstWhere((e) => e.trim().isNotEmpty, orElse: () => 'Không có tiêu đề').trim();
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
  String? classId,
  bool progressDisabled = false,
}) {
  return <String, dynamic>{
    if (classId != null && classId.isNotEmpty) 'classId': classId,
    if (progressDisabled) 'progressDisabled': true,
    'id': lesson.id,
    'title': lesson.title,
    'type': lesson.type.toLowerCase(),
    'videoUrl': lesson.videoUrl,
    'article': <String, dynamic>{
      'title': lesson.title,
      'content': lesson.content ?? 'Nội dung bài học đang được cập nhật.',
    },
    if (nextLesson != null)
      'nextLesson': <String, dynamic>{
        if (classId != null && classId.isNotEmpty) 'classId': classId,
        if (progressDisabled) 'progressDisabled': true,
        'id': nextLesson.id,
        'title': nextLesson.title,
        'type': nextLesson.type.toLowerCase(),
        'videoUrl': nextLesson.videoUrl,
        'article': <String, dynamic>{
          'title': nextLesson.title,
          'content': nextLesson.content ?? 'Nội dung bài học đang được cập nhật.',
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
              BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 10, offset: const Offset(0, 6)),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.textOnPrimary, size: 18),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(color: AppColors.textOnPrimary, fontWeight: FontWeight.w800)),
            ],
          ),
        ),
      ),
    );
  }
}
