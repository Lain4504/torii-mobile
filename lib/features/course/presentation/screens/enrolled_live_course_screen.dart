import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/live_schedule_model.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/features/academy/presentation/widgets/resource_item.dart';
import 'package:url_launcher/url_launcher.dart';

/// Khóa LIVE đã ghi danh: swiper 3 buổi gần nhất + tabs syllabus (parity web LiveClassDashboard).
class EnrolledLiveCourseScreen extends ConsumerStatefulWidget {
  const EnrolledLiveCourseScreen({
    super.key,
    required this.classId,
    this.productId,
    this.courseTitle,
  });

  final String classId;
  final String? productId;
  final String? courseTitle;

  @override
  ConsumerState<EnrolledLiveCourseScreen> createState() =>
      _EnrolledLiveCourseScreenState();
}

class _EnrolledLiveCourseScreenState
    extends ConsumerState<EnrolledLiveCourseScreen> {
  String? _joiningSessionId;
  late PageController _swiperController;

  @override
  void initState() {
    super.initState();
    _swiperController = PageController(viewportFraction: 0.88);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.invalidate(liveSchedulesProvider);
    });
  }

  @override
  void dispose() {
    _swiperController.dispose();
    super.dispose();
  }

  Future<void> _onJoin(LiveScheduleModel session) async {
    if (_joiningSessionId != null) return;
    setState(() => _joiningSessionId = session.id);
    try {
      final repo = ref.read(academyRepositoryProvider);
      final result = await repo.joinLiveSessionAsStudent(session.id);
      if (!mounted) return;
      if (result == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Không thể vào phòng. Thử lại sau.')),
        );
        return;
      }
      final tokenQ = Uri.encodeQueryComponent(result.token);
      final room = result.roomId;
      final path = room != null && room.isNotEmpty
          ? '/meet?access_token=$tokenQ&roomId=${Uri.encodeQueryComponent(room)}'
          : '/meet?access_token=$tokenQ';
      context.push(path);
    } finally {
      if (mounted) setState(() => _joiningSessionId = null);
    }
  }

  /// Lấy 3 buổi live gần nhất: ưu tiên đang diễn ra > có thể vào > sắp tới > đã kết thúc.
  static List<LiveScheduleModel> _nearestSessions(
    List<LiveScheduleModel> all,
    String classId,
  ) {
    final now = DateTime.now();
    final filtered = all.where((s) => s.classId == classId).toList();
    int _priority(LiveScheduleUiState s) {
      switch (s) {
        case LiveScheduleUiState.live:
          return 0;
        case LiveScheduleUiState.joinable:
          return 1;
        case LiveScheduleUiState.scheduled:
          return 2;
        case LiveScheduleUiState.ended:
          return 3;
      }
    }

    filtered.sort((a, b) {
      final ap = _priority(a.uiStateAt(now));
      final bp = _priority(b.uiStateAt(now));
      if (ap != bp) return ap.compareTo(bp);
      final as = a.startAt;
      final bs = b.startAt;
      if (as == null && bs == null) return 0;
      if (as == null) return 1;
      if (bs == null) return -1;
      return as.compareTo(bs);
    });
    return filtered.take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = widget.courseTitle ?? 'Lớp LIVE';
    final schedulesAsync = ref.watch(liveSchedulesProvider);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
          onPressed: () => context.pop(),
        ),
      ),
      body: schedulesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(
            'Lỗi: $e',
            style: TextStyle(color: theme.colorScheme.error),
          ),
        ),
        data: (all) {
          final nearest = _nearestSessions(all, widget.classId);

          return DefaultTabController(
            length: 5,
            child: RefreshIndicator(
              onRefresh: () async => ref.invalidate(liveSchedulesProvider),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoBanner(),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            'Buổi học gần nhất',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildLiveSwiper(nearest),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            'Nội dung học tập',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _TabBarDelegate(
                      child: Container(
                        color: theme.scaffoldBackgroundColor,
                        child: TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          labelColor: theme.colorScheme.primary,
                          unselectedLabelColor:
                              theme.colorScheme.onSurfaceVariant,
                          indicatorColor: theme.colorScheme.primary,
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 13,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          tabs: const [
                            Tab(text: 'Lộ trình'),
                            Tab(text: 'Tài liệu'),
                            Tab(text: 'Hỏi đáp'),
                            Tab(text: 'Bài tập'),
                            Tab(text: 'Quiz'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    child: TabBarView(
                      children: [
                        _SyllabusTabPane(classId: widget.classId),
                        _ResourcesTabPane(classId: widget.classId),
                        _PlaceholderTabPane(
                          icon: Icons.forum_outlined,
                          title: 'Hỏi đáp',
                          message:
                              'Phần hỏi đáp sẽ được mở trong các phiên bản tiếp theo.',
                        ),
                        _PlaceholderTabPane(
                          icon: Icons.assignment_outlined,
                          title: 'Bài tập',
                          message: 'Bài tập sẽ được giao qua từng buổi học.',
                        ),
                        _PlaceholderTabPane(
                          icon: Icons.quiz_outlined,
                          title: 'Quiz',
                          message:
                              'Bài quiz sẽ được cập nhật theo tiến độ khóa học.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoBanner() {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: theme.colorScheme.primary.withValues(alpha: 0.15),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.videocam_outlined,
              color: theme.colorScheme.primary,
              size: 22,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Trọng tâm là các buổi học trực tiếp. Tài liệu video trong lộ trình chỉ hỗ trợ thêm.',
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 13,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveSwiper(List<LiveScheduleModel> sessions) {
    return SizedBox(
      height: 220,
      child: sessions.isEmpty
          ? _buildEmptySwiperCard()
          : PageView.builder(
              controller: _swiperController,
              padEnds: true,
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: _LiveSessionSwiperCard(
                    session: sessions[index],
                    joining: _joiningSessionId == sessions[index].id,
                    onJoin: () => _onJoin(sessions[index]),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildEmptySwiperCard() {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: theme.colorScheme.outlineVariant),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 40,
                color: theme.colorScheme.onSurfaceVariant.withValues(
                  alpha: 0.6,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Chưa có buổi live trong khung thời gian',
                style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LiveSessionSwiperCard extends StatelessWidget {
  const _LiveSessionSwiperCard({
    required this.session,
    required this.joining,
    required this.onJoin,
  });

  final LiveScheduleModel session;
  final bool joining;
  final VoidCallback onJoin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final df = DateFormat('dd/MM');
    final timeFmt = DateFormat('HH:mm');
    final start = session.startAt;
    final dateStr = start != null ? df.format(start) : '—';
    final timeStr = start != null ? timeFmt.format(start) : '—';
    final state = session.uiStateAt(DateTime.now());
    final isLive = state == LiveScheduleUiState.live;
    final canJoin = session.canAttemptJoin;

    return Material(
      color: theme.colorScheme.surface,
      elevation: 0,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isLive
                ? theme.colorScheme.primary.withValues(alpha: 0.4)
                : theme.colorScheme.outlineVariant,
            width: isLive ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color:
                  (isLive
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface)
                      .withValues(alpha: 0.08),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (session.courseThumbnail != null &&
                      session.courseThumbnail!.isNotEmpty)
                    Image.network(
                      session.courseThumbnail!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          _thumbnailPlaceholder(context),
                    )
                  else
                    _thumbnailPlaceholder(context),
                  if (isLive)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.error,
                          borderRadius: BorderRadius.circular(999),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.error.withValues(
                                alpha: 0.5,
                              ),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Đang diễn ra',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Positioned(
                    left: 12,
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            dateStr,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            timeStr,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: Colors.white.withValues(alpha: 0.95),
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session.title ?? 'Buổi học',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if ((session.instructorName ?? '').isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        'GV: ${session.instructorName}',
                        style: TextStyle(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: (!canJoin || joining) ? null : onJoin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: theme.colorScheme.onPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: joining
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: theme.colorScheme.onPrimary,
                                ),
                              )
                            : Text(
                                canJoin ? 'Vào học ngay' : 'Chưa tới giờ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _thumbnailPlaceholder(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary.withValues(alpha: 0.15),
            theme.colorScheme.primary.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: Center(
        child: Icon(
          Icons.videocam_rounded,
          size: 48,
          color: theme.colorScheme.primary.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  _TabBarDelegate({required this.child});

  final Widget child;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _SyllabusTabPane extends StatelessWidget {
  const _SyllabusTabPane({required this.classId});

  final String classId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasCurriculum = classId.isNotEmpty;

    if (!hasCurriculum) {
      return _PlaceholderTabPane(
        icon: Icons.menu_book_outlined,
        title: 'Lộ trình',
        message: 'Lộ trình chưa được cập nhật cho lớp này.',
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: theme.colorScheme.outlineVariant),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
                  blurRadius: 12,
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
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        Icons.menu_book_rounded,
                        color: theme.colorScheme.primary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lộ trình / Kho VOD',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: theme.colorScheme.onSurface,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Tài liệu video tham khảo theo chương trình học.',
                            style: TextStyle(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontSize: 13,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () =>
                        context.push('/curriculum/$classId?live=1&mode=LIVE'),
                    icon: const Icon(Icons.open_in_new, size: 20),
                    label: const Text(
                      'Mở lộ trình',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ResourcesTabPane extends ConsumerWidget {
  const _ResourcesTabPane({required this.classId});

  final String classId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resourcesAsync = ref.watch(folderResourcesByClassProvider(classId));

    return resourcesAsync.when(
      data: (resources) {
        if (resources.isEmpty) {
          return const _PlaceholderTabPane(
            icon: Icons.folder_outlined,
            title: 'Tài liệu học tập',
            message: 'Tài liệu sẽ được cập nhật theo từng buổi học.',
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: resources.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final resource = resources[index];
            return ResourceItem(
              resource: resource,
              onTap: () => _handleOpenResource(context, resource),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Lỗi: $error'),
      ),
    );
  }

  Future<void> _handleOpenResource(
    BuildContext context,
    AcademyResource resource,
  ) async {
    final url = resource.url;
    if (url == null || url.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Không tìm thấy đường dẫn tài nguyên')),
        );
      }
      return;
    }

    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Không thể mở liên kết này')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi khi mở tài nguyên: $e')),
        );
      }
    }
  }
}

class _PlaceholderTabPane extends StatelessWidget {
  const _PlaceholderTabPane({
    required this.icon,
    required this.title,
    required this.message,
  });

  final IconData icon;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 56,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.colorScheme.onSurfaceVariant,
                fontSize: 14,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
