import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';
import 'package:torii_app/features/course/models/lesson_model.dart';
import 'package:torii_app/features/course/models/lesson_material_model.dart';
import 'package:torii_app/core/providers/shared_prefs_provider.dart';

// ========== Mock data (UI only, no API) ==========
Lesson _mockLesson(String lessonId) => Lesson(
  id: lessonId,
  moduleId: null,
  type: LessonType.video,
  title: 'Bài học mẫu – Giới thiệu Zen Leadership',
  orderIndex: 0,
  videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
);

List<LessonMaterial> get _mockMaterials => [
  LessonMaterial(
    id: 'mat-1',
    lessonId: 'lesson-1',
    fileAssetId: 'file-1',
    type: 'reading',
    title: 'Tài liệu PDF bài học',
    orderIndex: 0,
    createdBy: 'system',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    fileUrl: 'https://example.com/sample.pdf',
    mimeType: 'application/pdf',
    fileSize: 1024000,
    status: 'active',
  ),
  LessonMaterial(
    id: 'mat-2',
    lessonId: 'lesson-1',
    fileAssetId: 'file-2',
    type: 'slides',
    title: 'Slide bài giảng',
    orderIndex: 1,
    createdBy: 'system',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    fileUrl: 'https://example.com/slides.pptx',
    mimeType: 'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    fileSize: 2048000,
    status: 'active',
  ),
];

class LessonPage extends ConsumerStatefulWidget {
  final String courseId;
  final String lessonId;
  final Lesson? lesson;

  const LessonPage({
    super.key,
    required this.courseId,
    required this.lessonId,
    this.lesson,
  });

  @override
  ConsumerState<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends ConsumerState<LessonPage> with SingleTickerProviderStateMixin {
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  String? _currentVideoUrl;
  late TabController _tabController;
  late TextEditingController _notesController;
  
  List<LessonMaterial> _materials = [];
  // Video controls state
  bool _showVideoControls = true;
  bool _isVideoPlaying = false;
  Duration _videoPosition = Duration.zero;
  Duration _videoDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _notesController = TextEditingController();
    
    // Mock: use mock materials (no API)
    _materials = _mockMaterials;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadNotes();
    });
  }

  Future<void> _loadNotes() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final notes = prefs.getString('notes_${widget.lessonId}') ?? '';
    setState(() {
      _notesController.text = notes;
    });
  }

  Future<void> _saveNotes() async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setString('notes_${widget.lessonId}', _notesController.text);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã lưu ghi chú'), duration: Duration(seconds: 1)),
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _notesController.dispose();
    _videoController?.removeListener(_videoListener);
    _videoController?.dispose();
    super.dispose();
  }

  void _initializeVideo(String videoUrl) {
    if (_videoController != null) {
      _videoController!.removeListener(_videoListener);
      _videoController!.dispose();
    }
    
    _currentVideoUrl = videoUrl;
    _videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    _videoController!.addListener(_videoListener);
    _videoController!.initialize().then((_) {
      if (mounted) {
        setState(() {
          _isVideoInitialized = true;
          _videoDuration = _videoController!.value.duration;
        });
      }
    }).catchError((error) {
      if (mounted) {
        setState(() {
          _isVideoInitialized = false;
          _currentVideoUrl = null;
        });
      }
    });
  }

  void _videoListener() {
    if (_videoController != null && mounted) {
      setState(() {
        _isVideoPlaying = _videoController!.value.isPlaying;
        _videoPosition = _videoController!.value.position;
        _videoDuration = _videoController!.value.duration;
      });
    }
  }

  void _togglePlayPause() {
    if (_videoController != null) {
      setState(() {
        _showVideoControls = true;
      });
      
      if (_videoController!.value.isPlaying) {
        _videoController!.pause();
      } else {
        _videoController!.play();
      }
      
      // Auto-hide controls after 3 seconds
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted && _videoController != null && _videoController!.value.isPlaying) {
          setState(() {
            _showVideoControls = false;
          });
        }
      });
    }
  }

  void _seekTo(Duration position) {
    if (_videoController != null) {
      _videoController!.seekTo(position);
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    
    if (hours > 0) {
      return '${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}';
    }
    return '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }

  @override
  Widget build(BuildContext context) {
    // Mock: use widget.lesson if provided, else mock lesson (no API)
    final lesson = widget.lesson ?? _mockLesson(widget.lessonId);

    // Initialize video if lesson is video type and has videoUrl
    if (lesson.isVideo && lesson.videoUrl != null && lesson.videoUrl!.isNotEmpty) {
      // Check if we need to initialize or reinitialize video
      final needsInit = _videoController == null || 
                       !_isVideoInitialized ||
                       (_currentVideoUrl != lesson.videoUrl);
      
      if (needsInit) {
        _initializeVideo(lesson.videoUrl!);
      }
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        pattern: BackgroundPattern.checkerboard,
        child: Column(
          children: [
            // App Bar
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppRadius.xs),
                        boxShadow: AppElevation.softShadow,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary, size: 20),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppRadius.xs),
                        boxShadow: AppElevation.softShadow,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.more_vert_rounded, color: AppColors.textPrimary, size: 20),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // Video Player (only for video lessons)
                  if (lesson.isVideo) _buildVideoPlayer(lesson),
                  
                  // Progress and Tabs
                  _buildLessonInfo(lesson),
                  
                  _buildTabsContent(lesson),
                ],
              ),
            ),
            
            _buildBottomNagivation(lesson),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(Lesson lesson) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: lesson.videoUrl != null && lesson.videoUrl!.isNotEmpty
            ? Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  boxShadow: AppElevation.cardShadow,
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: _isVideoInitialized && _videoController != null
                      ? VideoPlayer(_videoController!)
                      : const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                ),
              )
            : AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      'Video không khả dụng',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildLessonInfo(Lesson lesson) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(AppSpacing.xl, AppSpacing.lg, AppSpacing.xl, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    lesson.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: AppTypography.extraBold,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNagivation(Lesson lesson) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        MediaQuery.of(context).padding.bottom + AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.borderLight, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              text: 'BÀI TRƯỚC',
              type: AppButtonType.outline,
              onPressed: () {},
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: AppButton(
              text: 'BÀI TIẾP THEO',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabsContent(Lesson lesson) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.md),
            
            // Tabs
            TabBar(
              controller: _tabController,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textTertiary,
              indicatorColor: AppColors.primary,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: AppTypography.bold,
                letterSpacing: 0.5,
              ),
              tabs: const [
                Tab(text: 'TỔNG QUAN'),
                Tab(text: 'TÀI LIỆU'),
                Tab(text: 'THẢO LUẬN'),
                Tab(text: 'GHI CHÚ'),
              ],
            ),
            const SizedBox(height: 24),
            
            // Tab Content
            SizedBox(
              height: 400,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildContentTab(lesson),
                  _buildResourcesTab(),
                  _buildCommentsTab(),
                  _buildNotesTab(),
                ],
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _buildContentTab(Lesson lesson) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.md),
          if (lesson.description != null && lesson.description!.isNotEmpty) ...[
            Text(
              'MÔ TẢ BÀI HỌC',
              style: TextStyle(
                fontSize: 10,
                fontWeight: AppTypography.black,
                color: AppColors.textTertiary,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              lesson.description!,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
          
          Text(
            'TỪ VỰNG TRONG BÀI',
            style: TextStyle(
              fontSize: 10,
              fontWeight: AppTypography.black,
              color: AppColors.textTertiary,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildVocabularyList(),
          const SizedBox(height: AppSpacing.lg),
          
          if (lesson.isArticle && lesson.articleContent != null && lesson.articleContent!.isNotEmpty) ...[
            Text(
              'CHI TIẾT BÀI HỌC',
              style: TextStyle(
                fontSize: 10,
                fontWeight: AppTypography.black,
                color: AppColors.textTertiary,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Html(data: lesson.articleContent!),
          ],
        ],
      ),
    );
  }

  Widget _buildVocabularyList() {
    final vocab = [
      {'jp': '尊敬語', 'ro': 'Sonkeigo', 'vi': 'Kính ngữ'},
      {'jp': '謙譲語', 'ro': 'Kenjougo', 'vi': 'Khiêm nhường ngữ'},
      {'jp': '丁寧語', 'ro': 'Teineigo', 'vi': 'Từ lịch sự'},
    ];

    return Column(
      children: vocab.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.xs),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['jp']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: AppTypography.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    item['ro']!,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                item['vi']!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: AppTypography.medium,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildResourcesTab() {
    if (_materials.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.description_outlined,
              size: 48,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: 16),
            Text(
              'Chưa có tài liệu',
              style: TextStyle(
                color: AppColors.textTertiary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _materials.length,
      itemBuilder: (context, index) {
        final material = _materials[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                final uri = Uri.parse(material.fileUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.grey300.withValues(alpha: 0.2),
                  ),
                  color: AppColors.grey100.withValues(alpha: 0.3),
                ),
                child: Row(
                  children: [
                    // Icon
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.grey300.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Icon(
                        material.isPdf
                            ? Icons.picture_as_pdf
                            : material.isVideo
                                ? Icons.video_library
                                : Icons.description,
                        color: AppColors.primary,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Tài liệu đi kèm',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: AppTypography.black,
                              letterSpacing: 3.0,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            material.title ?? 'Tài liệu ${index + 1}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: AppTypography.extraBold,
                              letterSpacing: -0.5,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                material.fileExtension.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: AppTypography.black,
                                  letterSpacing: 2.0,
                                  color: AppColors.textTertiary,
                                ),
                              ),
                              Container(
                                width: 4,
                                height: 4,
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(alpha: 0.4),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                material.formattedFileSize,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: AppTypography.black,
                                  letterSpacing: 2.0,
                                  color: AppColors.textTertiary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Download Button
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.download,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Tải',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: AppTypography.black,
                              letterSpacing: 2.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCommentsTab() {
    // Comments require postId, which may not be available for lessons
    // For now, show a placeholder similar to web-learner
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: AppColors.primarySurface.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              Icons.comment_outlined,
              size: 48,
              color: AppColors.primary.withValues(alpha: 0.3),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Diễn đàn thảo luận',
            style: TextStyle(
              fontSize: 10,
              fontWeight: AppTypography.black,
              letterSpacing: 2.0,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Tham gia Trao đổi kiến thức',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: AppTypography.extraBold,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Tương tác với các học viên khác và đội ngũ giảng viên chuyên môn để giải đáp thắc mắc.',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textTertiary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement comment functionality when postId is available
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tính năng đang phát triển')),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Bắt đầu thảo luận'),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesTab() {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.card),
              border: Border.all(color: AppColors.grey200.withValues(alpha: 0.5)),
            ),
            child: TextField(
              controller: _notesController,
              maxLines: null,
              expands: true,
              style: const TextStyle(fontSize: 14, height: 1.6),
              decoration: const InputDecoration(
                hintText: 'Nhập ghi chú của bạn cho bài học này...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: AppColors.textTertiary),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppButton(
              text: 'LƯU GHI CHÚ',
              onPressed: _saveNotes,
              // size: AppButtonSize.medium,
            ),
          ],
        ),
      ],
    );
  }

}
