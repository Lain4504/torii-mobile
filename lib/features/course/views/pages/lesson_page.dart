import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';
import 'package:torii_app/features/course/models/lesson_model.dart';
import 'package:torii_app/features/course/models/lesson_material_model.dart';
import 'package:torii_app/features/course/providers/lesson_providers.dart';
import 'package:torii_app/features/course/repositories/course_repository.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/core/providers/shared_prefs_provider.dart';

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
  // final List<Comment> _comments = [];
  bool _isLoadingMaterials = false;
  // bool _isLoadingComments = false;
  String? _materialsError;
  // String? _commentsError;
  
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
    
    // Delay loading materials to ensure lesson is loaded first
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMaterials();
      _loadNotes();
    });
    // Comments will be loaded when needed (requires postId which may not be available)
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

  Future<void> _loadMaterials() async {
    if (!mounted) return;
    
    setState(() {
      _isLoadingMaterials = true;
      _materialsError = null;
    });

    try {
      final repository = CourseRepository(
        dio: ref.read(apiClientProvider).client,
      );
      final materials = await repository.getLessonMaterials(widget.lessonId);
      
      if (mounted) {
        setState(() {
          _materials = materials;
          _isLoadingMaterials = false;
        });
      }
    } catch (e) {
      
      if (mounted) {
        setState(() {
          _materialsError = e.toString();
          _isLoadingMaterials = false;
        });
      }
    }
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
    final hasInitialLesson = widget.lesson != null && 
                             (widget.lesson!.videoUrl != null || widget.lesson!.articleContent != null);
    
    final state = ref.watch(lessonDetailProvider(widget.lessonId));
    final lesson = state.lesson ?? widget.lesson;

    if (state.isLoading && !hasInitialLesson && lesson == null) {
      return const AppLoadingScreen(text: 'Đang chuẩn bị bài học...');
    }

    if (state.error != null && lesson == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: AppBackground(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.error),
                const SizedBox(height: 16),
                Text(
                  state.error!,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                AppButton(
                  text: 'THỬ LẠI',
                  onPressed: () {
                    ref.read(lessonDetailProvider(widget.lessonId).notifier).loadLessonDetail(widget.lessonId);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (lesson == null) {
      return const AppLoadingScreen(text: 'Không tìm thấy bài học...');
    }

    if (lesson.isVideo && lesson.videoUrl != null && lesson.videoUrl!.isNotEmpty) {
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
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: AppColors.background,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: AppColors.textPrimary),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                'Chi tiết bài học',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: AppTypography.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              centerTitle: true,
            ),

            if (lesson.isVideo) _buildVideoPlayer(lesson),
            
            _buildTabsContent(lesson),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(Lesson lesson) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.black,
              child: _isVideoInitialized && _videoController != null
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _showVideoControls = !_showVideoControls;
                        });
                      },
                      child: Stack(
                        children: [
                          VideoPlayer(_videoController!),
                          
                          AnimatedOpacity(
                            opacity: _showVideoControls ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                              color: Colors.black.withValues(alpha: 0.4),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: _togglePlayPause,
                                        borderRadius: BorderRadius.circular(50),
                                        child: Container(
                                          width: 64,
                                          height: 64,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withValues(alpha: 0.2),
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                                          ),
                                          child: Icon(
                                            _isVideoPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [Colors.transparent, Colors.black.withValues(alpha: 0.6)],
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SliderTheme(
                                            data: SliderTheme.of(context).copyWith(
                                              trackHeight: 3,
                                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                                              overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
                                              activeTrackColor: AppColors.primary,
                                              inactiveTrackColor: Colors.white.withValues(alpha: 0.3),
                                              thumbColor: Colors.white,
                                            ),
                                            child: Slider(
                                              value: _videoDuration.inMilliseconds > 0
                                                  ? _videoPosition.inMilliseconds.toDouble()
                                                  : 0.0,
                                              max: _videoDuration.inMilliseconds > 0
                                                  ? _videoDuration.inMilliseconds.toDouble()
                                                  : 1.0,
                                              onChanged: (value) {
                                                _seekTo(Duration(milliseconds: value.toInt()));
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${_formatDuration(_videoPosition)} / ${_formatDuration(_videoDuration)}',
                                                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                                ),
                                                const Spacer(),
                                                const Icon(Icons.fullscreen_rounded, color: Colors.white, size: 20),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator(color: AppColors.primary)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabsContent(Lesson lesson) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatusBadge(label: 'BÀI HỌC ${lesson.order}', type: StatusType.info),
            const SizedBox(height: 12),
            Text(
              lesson.title,
              style: TextStyle(
                fontFamily: AppTypography.fontFamilySerif,
                fontSize: 24,
                fontWeight: AppTypography.bold,
                height: 1.2,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 24),
            
            TabBar(
              controller: _tabController,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.mutedForeground,
              indicatorColor: AppColors.primary,
              indicatorWeight: 3,
              labelStyle: const TextStyle(fontSize: 12, fontWeight: AppTypography.bold, letterSpacing: 0.5),
              tabs: const [
                Tab(text: 'Nội dung'),
                Tab(text: 'Tài liệu'),
                Tab(text: 'Thảo luận'),
                Tab(text: 'Ghi chú'),
              ],
            ),
            const SizedBox(height: 24),
            
            SizedBox(
              height: 500,
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
          if (lesson.isArticle && lesson.articleContent != null && lesson.articleContent!.isNotEmpty)
            Html(
              data: lesson.articleContent!,
              style: {
                "body": Style(
                  margin: Margins.zero,
                  padding: HtmlPaddings.zero,
                  fontSize: FontSize(15),
                  lineHeight: const LineHeight(1.7),
                  color: AppColors.textPrimary,
                ),
                "p": Style(margin: Margins.only(bottom: 16)),
                "h1,h2,h3": Style(
                  fontWeight: FontWeight.bold,
                  margin: Margins.only(top: 20, bottom: 8),
                  color: AppColors.primary,
                ),
                "blockquote": Style(
                  margin: Margins.only(left: 0, top: 16, bottom: 16),
                  padding: HtmlPaddings.only(left: 16),
                  border: const Border(left: BorderSide(color: AppColors.primary, width: 3)),
                  fontStyle: FontStyle.italic,
                  color: AppColors.mutedForeground,
                ),
              },
            )
          else if (lesson.description != null && lesson.description!.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Text(
                lesson.description!,
                style: const TextStyle(fontSize: 15, height: 1.6, color: AppColors.textPrimary),
              ),
            )
          else
            const EmptyState(message: 'Không có thông tin mô tả cho bài học này'),
        ],
      ),
    );
  }

  Widget _buildResourcesTab() {
    if (_isLoadingMaterials) return const Center(child: CircularProgressIndicator());
    if (_materialsError != null) return Center(child: AppButton(text: 'Thử lại', onPressed: _loadMaterials));
    if (_materials.isEmpty) return const EmptyState(message: 'Chưa có tài liệu đính kèm', icon: Icons.description_outlined);

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: _materials.length,
      itemBuilder: (context, index) {
        final material = _materials[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                material.isPdf ? Icons.picture_as_pdf_rounded : Icons.file_present_rounded,
                color: AppColors.primary,
                size: 24,
              ),
            ),
            title: Text(
              material.title ?? 'Tài liệu ${index + 1}',
              style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 14),
            ),
            subtitle: Text(
              material.fileExtension.toUpperCase(),
              style: const TextStyle(fontSize: 11, color: AppColors.mutedForeground),
            ),
            trailing: const Icon(Icons.download_rounded, size: 20, color: AppColors.primary),
            onTap: () async {
              final uri = Uri.parse(material.fileUrl);
              if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
            },
          ),
        );
      },
    );
  }

  Widget _buildCommentsTab() {
    return const Center(child: EmptyState(message: 'Tính năng thảo luận đang được cập nhật', icon: Icons.forum_outlined));
  }

  Widget _buildNotesTab() {
    return Column(
      children: [
        Expanded(
          child: AppTextField(
            label: 'Ghi chú của bạn',
            controller: _notesController,
            hintText: 'Nhập ghi chú tại đây...',
            icon: Icons.edit_note_rounded,
            maxLines: 10,
          ),
        ),
        const SizedBox(height: 16),
        AppButton(
          text: 'LƯU GHI CHÚ',
          onPressed: _saveNotes,
          isFullWidth: true,
          icon: Icons.save_rounded,
        ),
      ],
    );
  }

}
