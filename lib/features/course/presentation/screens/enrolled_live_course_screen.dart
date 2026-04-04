import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/live_schedule_model.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/data/models/academy_product_detail_model.dart';
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
  late DateTime _currentWeekStart;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _swiperController = PageController(viewportFraction: 0.88);
    final now = DateTime.now();
    _currentWeekStart = _getStartOfWeek(now);
    _selectedDate = now;
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.invalidate(liveSchedulesProvider);
    });
  }

  DateTime _getStartOfWeek(DateTime date) {
    // weekday is 1 (Mon) to 7 (Sun). 
    // We want Monday as start.
    return date.subtract(Duration(days: date.weekday - 1));
  }

  void _nextWeek() {
    setState(() {
      _currentWeekStart = _currentWeekStart.add(const Duration(days: 7));
      _selectedDate = _selectedDate.add(const Duration(days: 7));
    });
  }

  void _previousWeek() {
    setState(() {
      _currentWeekStart = _currentWeekStart.subtract(const Duration(days: 7));
      _selectedDate = _selectedDate.subtract(const Duration(days: 7));
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
                        const SizedBox(height: 16),
                        _buildSectionHeader('Nội dung học tập'),
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
                        _SyllabusTabPane(classId: widget.classId, productId: widget.productId),
                        _ResourcesTabPane(classId: widget.classId),
                        _PlaceholderTabPane(
                          icon: Icons.forum_outlined,
                          title: 'Hỏi đáp',
                          message:
                              'Phần hỏi đáp sẽ được mở trong các phiên bản tiếp theo.',
                        ),
                        _AssignmentsTabPane(classId: widget.classId),
                        _QuizzesTabPane(classId: widget.classId),
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

  Widget _buildSectionHeader(String title) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w900,
          color: theme.colorScheme.onSurface,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _buildWeeklyScheduleStrip(List<LiveScheduleModel> allSessions) {
    final theme = Theme.of(context);
    final weekDays = List.generate(7, (i) => _currentWeekStart.add(Duration(days: i)));
    final endOfWeek = weekDays.last;
    
    final rangeStr = "${DateFormat('dd/MM').format(_currentWeekStart)} — ${DateFormat('dd/MM').format(endOfWeek)}";
    final now = DateTime.now();
    final todayStr = DateFormat('yyyy-MM-dd').format(now);
    final selStr = DateFormat('yyyy-MM-dd').format(_selectedDate);

    // Get days in this week that have sessions for dot indicators
    final daysInWeekWithSessions = <String>{};
    for (final day in weekDays) {
      final dStr = DateFormat('yyyy-MM-dd').format(day);
      final hasSession = allSessions.any((s) => 
        s.classId == widget.classId && 
        s.startAt != null && 
        DateFormat('yyyy-MM-dd').format(s.startAt!.toLocal()) == dStr
      );
      if (hasSession) daysInWeekWithSessions.add(dStr);
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month_outlined,
                            color: theme.colorScheme.primary, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Lịch biểu trong tuần',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: theme.colorScheme.onSurface,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'DỮ LIỆU ĐƯỢC CẬP NHẬT TRỰC TIẾP',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                        letterSpacing: 0.3,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildNavButton(Icons.chevron_left, _previousWeek),
                  const SizedBox(width: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest
                          .withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      rangeStr,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 11),
                    ),
                  ),
                  const SizedBox(width: 4),
                  _buildNavButton(Icons.chevron_right, _nextWeek),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(7, (index) {
              final day = weekDays[index];
              final dStr = DateFormat('yyyy-MM-dd').format(day);
              final isSelected = dStr == selStr;
              final isToday = dStr == todayStr;
              final weekday = _getViWeekday(day.weekday);
              final dayNum = DateFormat('dd').format(day);
              final hasSession = daysInWeekWithSessions.contains(dStr);

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = day;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        weekday,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: isSelected ? FontWeight.w900 : FontWeight.w700,
                          color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isSelected ? theme.colorScheme.primary : (isToday ? theme.colorScheme.primary.withValues(alpha: 0.1) : Colors.transparent),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          dayNum,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (hasSession)
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                        )
                      else
                        const SizedBox(height: 4),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedDaySessions(List<LiveScheduleModel> allSessions) {
    final theme = Theme.of(context);
    final selStr = DateFormat('yyyy-MM-dd').format(_selectedDate);
    final sessions = allSessions.where((s) {
      if (s.classId != widget.classId || s.startAt == null) return false;
      return DateFormat('yyyy-MM-dd').format(s.startAt!.toLocal()) == selStr;
    }).toList();

    // Sort by start time
    sessions.sort((a, b) => (a.startAt ?? DateTime.now()).compareTo(b.startAt ?? DateTime.now()));

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Lịch học: ${_getViWeekday(_selectedDate.weekday)}, ${DateFormat('dd/MM').format(_selectedDate)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                  letterSpacing: 0.2,
                ),
              ),
              if (sessions.isNotEmpty) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${sessions.length} buổi',
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 12),
          if (sessions.isEmpty)
             Container(
               width: double.infinity,
               padding: const EdgeInsets.symmetric(vertical: 32),
               decoration: BoxDecoration(
                 color: theme.colorScheme.surface.withValues(alpha: 0.5),
                 borderRadius: BorderRadius.circular(20),
                 border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5)),
               ),
               child: Column(
                 children: [
                   Icon(
                     Icons.auto_awesome_outlined,
                     size: 32,
                     color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.15),
                   ),
                   const SizedBox(height: 8),
                   Text(
                     'Không có lịch học cho ngày này',
                     style: TextStyle(
                       color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                       fontSize: 12,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                 ],
               ),
             )
          else
            Column(
              children: sessions.map((s) => _LiveSessionRowCard(
                session: s,
                joining: _joiningSessionId == s.id,
                onJoin: () => _onJoin(s),
              )).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildNavButton(IconData icon, VoidCallback onTap) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.outlineVariant),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 20, color: theme.colorScheme.onSurface),
      ),
    );
  }

  String _getViWeekday(int weekday) {
    switch (weekday) {
      case 1: return 'THỨ 2';
      case 2: return 'THỨ 3';
      case 3: return 'THỨ 4';
      case 4: return 'THỨ 5';
      case 5: return 'THỨ 6';
      case 6: return 'THỨ 7';
      case 7: return 'CN';
      default: return '';
    }
  }
}

class _LiveSessionRowCard extends StatelessWidget {
  const _LiveSessionRowCard({
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
    final timeFmt = DateFormat('HH:mm');
    final start = session.startAt;
    final timeStr = start != null ? timeFmt.format(start.toLocal()) : '—';
    final state = session.uiStateAt(DateTime.now());
    final isLive = state == LiveScheduleUiState.live;
    final canJoin = session.canAttemptJoin;

    String statusText;
    Color statusColor;
    if (state == LiveScheduleUiState.live) {
      statusText = 'ĐANG DIỄN RA';
      statusColor = Colors.red;
    } else if (state == LiveScheduleUiState.joinable) {
      statusText = 'CÓ THỂ VÀO HỌC';
      statusColor = Colors.green;
    } else if (state == LiveScheduleUiState.scheduled) {
      statusText = 'SẮP DIỄN RA';
      statusColor = theme.colorScheme.primary;
    } else {
      statusText = 'ĐÃ KẾT THÚC';
      statusColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isLive ? theme.colorScheme.primary.withValues(alpha: 0.08) : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isLive ? theme.colorScheme.primary : theme.colorScheme.outlineVariant,
          width: isLive ? 1.5 : 1,
        ),
        boxShadow: isLive ? [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ] : null,
      ),
      child: InkWell(
        onTap: (!canJoin || joining) ? null : onJoin,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
               Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isLive ? theme.colorScheme.primary : theme.colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.videocam_rounded,
                  color: isLive ? theme.colorScheme.onPrimary : theme.colorScheme.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session.title ?? 'Buổi học trực tuyến',
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.access_time_filled, size: 12, color: theme.colorScheme.onSurfaceVariant),
                        const SizedBox(width: 4),
                        Text(
                          timeStr,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            statusText,
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                              color: statusColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (joining)
                const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                )
              else if (canJoin)
                Icon(
                  Icons.play_circle_fill_rounded,
                  size: 32,
                  color: theme.colorScheme.primary,
                ),
            ],
          ),
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

class _SyllabusTabPane extends ConsumerWidget {
  const _SyllabusTabPane({required this.classId, this.productId});

  final String classId;
  final String? productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final effectiveProductId = (productId != null && productId!.trim().isNotEmpty)
        ? productId!.trim()
        : classId;
    final detailAsync = ref.watch(classCatalogLiveDetailProvider(effectiveProductId));
    final completedIds = ref.watch(classCompletedLessonIdsProvider((classId: classId, mode: 'LIVE', productId: productId))).value ?? const [];
    final completed = completedIds.toSet();

    return detailAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
              const SizedBox(height: 16),
              Text(
                'Không thể tải lộ trình: $e',
                textAlign: TextAlign.center,
                style: TextStyle(color: theme.colorScheme.error),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(classCatalogLiveDetailProvider(effectiveProductId)),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
      ),
      data: (detail) {
        if (detail == null || detail.modules.isEmpty) {
          return _PlaceholderTabPane(
            icon: Icons.menu_book_outlined,
            title: 'Lộ trình',
            message: 'Lộ trình chưa được cập nhật cho lớp này.',
          );
        }

        final modules = detail.modules;

        final lessonOrder = <CurriculumLessonModel>[
          for (final module in modules) ...module.lessons,
        ];
        final lessonIndexById = <String, int>{
          for (int i = 0; i < lessonOrder.length; i++) lessonOrder[i].id: i,
        };
        final trackableOrdered = lessonOrder.where(_isTrackableKind).toList();

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCurriculumHeader(context, detail),
              const SizedBox(height: 20),
              ...modules.map(
                (module) => _buildModuleItem(
                  context,
                  module.title,
                  module.lessons.map((lesson) {
                    final idx = lessonIndexById[lesson.id] ?? -1;
                    final hasNext = idx >= 0 && idx + 1 < lessonOrder.length;
                    final nextL = hasNext ? lessonOrder[idx + 1] : null;

                    final unlocked = _effectiveLessonUnlocked(
                      lesson: lesson,
                      trackableOrdered: trackableOrdered,
                      completed: completed,
                    );
                    final done = _isTrackableKind(lesson) && completed.contains(lesson.id);

                    final status = !unlocked
                        ? 'Đã khóa'
                        : (done ? 'Hoàn thành' : 'Chưa học');
                    final statusColor = !unlocked
                        ? theme.colorScheme.onSurfaceVariant
                        : (done
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurfaceVariant);

                    return _buildLessonItem(
                      context,
                      title: lesson.title.isNotEmpty ? lesson.title : 'Bài học',
                      duration: _labelByType(lesson.type),
                      icon: unlocked ? _iconByType(lesson.type) : Icons.lock_outline_rounded,
                      status: status,
                      statusColor: statusColor,
                      locked: !unlocked,
                      lesson: _lessonPayload(
                        classId: classId,
                        mode: 'LIVE',
                        lesson: lesson,
                        nextLesson: nextL,
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCurriculumHeader(BuildContext context, AcademyProductDetailModel detail) {
    final theme = Theme.of(context);
    return Container(
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
      child: Row(
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
                  'Lộ trình học tập',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  (detail.description ?? '').isNotEmpty 
                    ? _stripHtml(detail.description!)
                    : 'Tài liệu video tham khảo thêm bên cạnh các buổi học trực tiếp.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _stripHtml(String h) {
    return h
        .replaceAll(RegExp(r'<[^>]*>'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  Widget _buildModuleItem(BuildContext context, String title, List<Widget> lessons) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.colorScheme.outlineVariant),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Theme(
          data: theme.copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: theme.colorScheme.onSurface,
              ),
            ),
            initiallyExpanded: true,
            childrenPadding: EdgeInsets.zero,
            tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            children: [
              const Divider(height: 1),
              ...lessons,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLessonItem(
    BuildContext context, {
    required String title,
    required String duration,
    required IconData icon,
    required String status,
    required Color statusColor,
    required Map<String, dynamic> lesson,
    required bool locked,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: locked
            ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Hoàn thành bài trước để mở khóa bài này.'),
                  ),
                );
              }
            : () => context.push('/lesson', extra: lesson),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Icon
              Container(
                width: 32,
                alignment: Alignment.centerLeft,
                child: Icon(
                  icon,
                  color: locked 
                    ? theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5)
                    : theme.colorScheme.onSurfaceVariant,
                  size: 20,
                ),
              ),
              const SizedBox(width: 4),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: locked 
                          ? theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7)
                          : theme.colorScheme.onSurface,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      duration,
                      style: TextStyle(
                        color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Status Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              // Right side: only show chevron if not locked
              if (!locked) ...[
                const SizedBox(width: 8),
                Icon(
                  Icons.chevron_right_rounded,
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                  size: 20,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  bool _isTrackableKind(CurriculumLessonModel l) {
    final t = l.type.toUpperCase();
    return t == 'VIDEO' || t == 'READING' || t == 'ARTICLE';
  }

  bool _effectiveLessonUnlocked({
    required CurriculumLessonModel lesson,
    required List<CurriculumLessonModel> trackableOrdered,
    required Set<String> completed,
  }) {
    if (!_isTrackableKind(lesson)) return true;
    final idx = trackableOrdered.indexWhere((l) => l.id == lesson.id);
    if (idx <= 0) return true;
    return completed.contains(trackableOrdered[idx - 1].id);
  }

  Map<String, dynamic> _lessonPayload({
    required String classId,
    required String mode,
    required CurriculumLessonModel lesson,
    CurriculumLessonModel? nextLesson,
  }) {
    return <String, dynamic>{
      if (classId.isNotEmpty) 'classId': classId,
      if (productId != null && productId!.isNotEmpty) 'productId': productId,
      if (mode.isNotEmpty) 'mode': mode,
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
          if (classId.isNotEmpty) 'classId': classId,
          if (mode.isNotEmpty) 'mode': mode,
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

  IconData _iconByType(String type) {
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

  String _labelByType(String type) {
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

class _AssignmentsTabPane extends ConsumerWidget {
  const _AssignmentsTabPane({required this.classId});

  final String classId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignmentsAsync = ref.watch(assignmentsProvider(classId));

    return assignmentsAsync.when(
      data: (list) {
        if (list.isEmpty) {
          return const _PlaceholderTabPane(
            icon: Icons.assignment_outlined,
            title: 'Bài tập',
            message: 'Bài tập sẽ được giao qua từng buổi học.',
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: list.length,
          itemBuilder: (context, index) {
            final assignment = list[index];
            return _buildAssignmentCard(context, ref, assignment);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
    );
  }

  Widget _buildAssignmentCard(BuildContext context, WidgetRef ref, AssignmentModel assignment) {
    final theme = Theme.of(context);
    final isSubmitted = assignment.status == 'SUBMITTED' || assignment.status == 'GRADED';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: ListTile(
        onTap: () => _showSubmitDialog(context, ref, assignment),
        title: Text(assignment.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: assignment.deadline != null 
          ? Text('Hạn nộp: ${DateFormat('dd/MM/yyyy').format(assignment.deadline!)}')
          : null,
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isSubmitted ? Colors.green.withValues(alpha: 0.1) : theme.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            isSubmitted ? (assignment.status == 'GRADED' ? 'Đã chấm' : 'Đã nộp') : 'Chưa nộp',
            style: TextStyle(
              color: isSubmitted ? Colors.green : theme.colorScheme.primary,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _showSubmitDialog(BuildContext context, WidgetRef ref, AssignmentModel assignment) {
    if (assignment.status == 'GRADED') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(assignment.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Điểm: ${assignment.grade}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green)),
              if (assignment.feedback != null) ...[
                const SizedBox(height: 12),
                const Text('Nhận xét:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(assignment.feedback!),
              ],
            ],
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Đóng'))],
        ),
      );
      return;
    }

    final contentController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)))),
            const SizedBox(height: 20),
            Text('Nộp bài tập', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(assignment.title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            Expanded(
              child: TextField(
                controller: contentController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: 'Nhập nội dung bài làm của bạn...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  alignLabelWithHint: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (contentController.text.trim().isEmpty) return;
                  final repo = ref.read(academyRepositoryProvider);
                  final success = await repo.submitAssignment(
                    classId: classId,
                    assignmentId: assignment.id,
                    content: contentController.text,
                  );
                  if (success) {
                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nộp bài thành công!')));
                      ref.invalidate(assignmentsProvider(classId));
                    }
                  }
                },
                child: const Text('Gửi bài làm', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuizzesTabPane extends ConsumerWidget {
  const _QuizzesTabPane({required this.classId});

  final String classId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusAsync = ref.watch(assessmentStatusProvider(classId));

    return statusAsync.when(
      data: (list) {
        if (list.isEmpty) {
          return const _PlaceholderTabPane(
            icon: Icons.quiz_outlined,
            title: 'Quiz',
            message: 'Bài quiz sẽ được cập nhật theo tiến độ khóa học.',
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: list.length,
          itemBuilder: (context, index) {
            final milestone = list[index];
            return _buildMilestoneCard(context, milestone);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
    );
  }

  Widget _buildMilestoneCard(BuildContext context, AssessmentMilestoneModel milestone) {
    final theme = Theme.of(context);
    final isLocked = milestone.isLocked;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: ListTile(
        onTap: isLocked ? null : () {
          final examPath = milestone.examId.isNotEmpty && milestone.examId != 'null' ? milestone.examId : 'unknown';
          context.push('/quiz/$examPath?classId=$classId&assessmentId=${milestone.id}');
        },
        leading: Icon(
          isLocked ? Icons.lock_outline : Icons.quiz_outlined,
          color: isLocked ? theme.colorScheme.outline : theme.colorScheme.primary,
        ),
        title: Text(milestone.title, style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isLocked ? theme.colorScheme.outline : theme.colorScheme.onSurface,
        )),
        trailing: _buildStatusBadge(milestone),
      ),
    );
  }

  Widget _buildStatusBadge(AssessmentMilestoneModel milestone) {
    Color color;
    String text;
    
    switch (milestone.status) {
      case 'PASSED':
        color = Colors.green;
        text = 'Hoàn thành';
        break;
      case 'FAILED':
        color = Colors.red;
        text = 'Thử lại';
        break;
      case 'IN_PROGRESS':
        color = Colors.blue;
        text = 'Đang làm';
        break;
      case 'LOCKED':
        color = Colors.grey;
        text = 'Đã khóa';
        break;
      default:
        color = Colors.orange;
        text = 'Bắt đầu';
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
    );
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
