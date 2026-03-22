import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/live_schedule_model.dart';

class LiveScheduleScreen extends ConsumerStatefulWidget {
  const LiveScheduleScreen({super.key});

  @override
  ConsumerState<LiveScheduleScreen> createState() => _LiveScheduleScreenState();
}

class _LiveScheduleScreenState extends ConsumerState<LiveScheduleScreen> {
  final ScrollController _horizontalScrollController = ScrollController();
  DateTime _currentWeekStart = _startOfWeekMonday(DateTime.now());
  bool _upcomingPanelAnimated = false;
  String? _joiningSessionId;

  static DateTime _startOfWeekMonday(DateTime d) {
    final date = DateTime(d.year, d.month, d.day);
    return date.subtract(Duration(days: date.weekday - DateTime.monday));
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  void _changeWeek(int delta) {
    setState(() {
      _currentWeekStart = _currentWeekStart.add(Duration(days: delta * 7));
    });
  }

  void _goCurrentWeek() {
    setState(() {
      _currentWeekStart = _startOfWeekMonday(DateTime.now());
    });
  }

  List<LiveScheduleModel> _sessionsInWeek(List<LiveScheduleModel> all) {
    final ws = DateTime(_currentWeekStart.year, _currentWeekStart.month, _currentWeekStart.day);
    final we = ws.add(const Duration(days: 7));
    return all.where((s) {
      final t = s.startAt;
      if (t == null) return false;
      return !t.isBefore(ws) && t.isBefore(we);
    }).toList();
  }

  static String _weekdayVi(DateTime dt) {
    switch (dt.weekday) {
      case DateTime.monday:
        return 'Thứ 2';
      case DateTime.tuesday:
        return 'Thứ 3';
      case DateTime.wednesday:
        return 'Thứ 4';
      case DateTime.thursday:
        return 'Thứ 5';
      case DateTime.friday:
        return 'Thứ 6';
      case DateTime.saturday:
        return 'Thứ 7';
      case DateTime.sunday:
        return 'CN';
    }
    return '';
  }

  LiveScheduleModel? _pickFeaturedUpcoming(List<LiveScheduleModel> all) {
    final now = DateTime.now();
    LiveScheduleModel? best;
    for (final s in all) {
      if (!s.shouldPromptUpcomingPanel(now)) continue;
      if (best == null) {
        best = s;
        continue;
      }
      final sa = s.startAt;
      final ba = best.startAt;
      if (sa != null && ba != null && sa.isBefore(ba)) best = s;
    }
    return best;
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

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final liveSchedulesAsync = ref.watch(liveSchedulesProvider);

    final primaryColor = AppColors.primary;
    final bgColor = isDark ? AppColors.backgroundDark : AppColors.muted;
    final surfaceColor = isDark ? AppColors.surfaceDark : AppColors.surface;
    final gridLineColor = primaryColor.withValues(alpha: 0.1);
    final headerBgColor = isDark ? AppColors.surfaceDark : AppColors.sidebar;

    final weekEnd = _currentWeekStart.add(const Duration(days: 6));
    final dateRangeText =
        '${DateFormat('dd/MM').format(_currentWeekStart)} – ${DateFormat('dd/MM/yyyy').format(weekEnd)}';

    final weekSessions = liveSchedulesAsync.maybeWhen(
      data: _sessionsInWeek,
      orElse: () => <LiveScheduleModel>[],
    );
    final allSessions = liveSchedulesAsync.maybeWhen(
      data: (list) => list,
      orElse: () => <LiveScheduleModel>[],
    );
    final featured = _pickFeaturedUpcoming(allSessions);
    final now = DateTime.now();
    final shouldShowUpcomingPanel = featured?.shouldPromptUpcomingPanel(now) ?? false;
    final panelSession = shouldShowUpcomingPanel ? featured : null;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (shouldShowUpcomingPanel && !_upcomingPanelAnimated) {
        setState(() => _upcomingPanelAnimated = true);
      }
      if (!shouldShowUpcomingPanel && _upcomingPanelAnimated) {
        setState(() => _upcomingPanelAnimated = false);
      }
    });

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Container(
              decoration: BoxDecoration(
                color: surfaceColor,
                boxShadow: isDark
                    ? null
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
              ),
              child: Column(
                children: [
                  _buildHeader(context, isDark, primaryColor),
                  _buildNavigation(context, dateRangeText, primaryColor, isDark),
                  Expanded(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned.fill(
                          child: _buildTimetableGrid(
                            headerBgColor,
                            gridLineColor,
                            isDark,
                            primaryColor,
                            liveSchedulesAsync,
                            weekSessions,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: AnimatedSlide(
                            duration: const Duration(milliseconds: 420),
                            curve: Curves.easeOutCubic,
                            offset: shouldShowUpcomingPanel && _upcomingPanelAnimated
                                ? Offset.zero
                                : const Offset(0, 1),
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 320),
                              opacity: shouldShowUpcomingPanel && _upcomingPanelAnimated ? 1 : 0,
                              child: panelSession != null
                                  ? _buildUpcomingSection(
                                      context,
                                      panelSession,
                                      primaryColor,
                                      isDark,
                                    )
                                  : const SizedBox.shrink(),
                            ),
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
      ),
    );
  }

  /// Đồng bộ phong cách với web-learner `dashboard/schedule`: tiêu đề + mô tả + hành động Meet (test).
  Widget _buildHeader(BuildContext context, bool isDark, Color primaryColor) {
    final theme = Theme.of(context);
    final muted = isDark ? AppColors.textTertiary : AppColors.textSecondary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surface,
        border: Border(
          bottom: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.06)
                : AppColors.grey300,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thời khóa biểu',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.2,
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Theo dõi lịch học trực tuyến các khóa Live bạn đã đăng ký.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: muted,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => context.push('/meet'),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: primaryColor,
                    ),
                    child: const Text(
                      'Vào Meet',
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.push('/meet?roomId=demo-room'),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: muted,
                    ),
                    child: Text(
                      'Test nhanh',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        color: muted,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavigation(BuildContext context, String dateRange, Color primaryColor, bool isDark) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark.withValues(alpha: 0.85) : AppColors.grey200.withValues(alpha: 0.35),
        border: Border(
          bottom: BorderSide(
            color: isDark ? Colors.white.withValues(alpha: 0.06) : AppColors.grey300.withValues(alpha: 0.6),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () => _changeWeek(-1),
            icon: const Icon(Icons.chevron_left_rounded, size: 22),
            color: AppColors.textSecondary,
            style: IconButton.styleFrom(
              backgroundColor: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.white,
              padding: const EdgeInsets.all(6),
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calendar_month_rounded, size: 16, color: primaryColor),
                  const SizedBox(width: 6),
                  Text(
                    dateRange,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: _goCurrentWeek,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              foregroundColor: AppColors.textSecondary,
            ),
            child: const Text(
              'HIỆN TẠI',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.6),
            ),
          ),
          IconButton(
            onPressed: () => _changeWeek(1),
            icon: const Icon(Icons.chevron_right_rounded, size: 22),
            color: AppColors.textSecondary,
            style: IconButton.styleFrom(
              backgroundColor: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.white,
              padding: const EdgeInsets.all(6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimetableGrid(
    Color headerBg,
    Color gridLine,
    bool isDark,
    Color primaryColor,
    AsyncValue<List<LiveScheduleModel>> schedulesAsync,
    List<LiveScheduleModel> weekList,
  ) {
    const double timeColWidth = 55.0;
    const double dayColWidth = 120.0;
    const double rowHeight = 100.0;
    final List<String> days = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
    final List<String> times = ['08:00', '10:00', '12:00', '14:00', '16:00', '18:00', '19:00', '21:00'];

    final bottomInset = MediaQuery.paddingOf(context).bottom + 8;

    return schedulesAsync.when(
      data: (_) => SingleChildScrollView(
        controller: _horizontalScrollController,
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: timeColWidth + (dayColWidth * 7),
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: headerBg,
                  border: Border(bottom: BorderSide(color: gridLine)),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: timeColWidth),
                    ...List.generate(7, (index) {
                      final dayDate = _currentWeekStart.add(Duration(days: index));
                      final isToday = DateFormat('yyyy-MM-dd').format(dayDate) ==
                          DateFormat('yyyy-MM-dd').format(DateTime.now());

                      return Container(
                        width: dayColWidth,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: gridLine),
                            bottom: isToday ? BorderSide(color: primaryColor, width: 2) : BorderSide.none,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              days[index],
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: isToday ? primaryColor : AppColors.textTertiary,
                              ),
                            ),
                            Text(
                              dayDate.day.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: isToday
                                    ? primaryColor
                                    : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: bottomInset + (weekList.isEmpty ? 24 : 120)),
                  itemCount: times.length,
                  itemBuilder: (context, timeIndex) {
                    return SizedBox(
                      height: rowHeight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: timeColWidth,
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.only(top: 12),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: gridLine.withValues(alpha: 0.5))),
                            ),
                            child: Text(
                              times[timeIndex],
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textTertiary,
                              ),
                            ),
                          ),
                          ...List.generate(7, (dayIndex) {
                            final currentDay = _currentWeekStart.add(Duration(days: dayIndex));
                            final hour = int.parse(times[timeIndex].split(':')[0]);
                            final nextHour = timeIndex < times.length - 1
                                ? int.parse(times[timeIndex + 1].split(':')[0])
                                : hour + 2;

                            final events = weekList.where((s) {
                              if (s.startAt == null) return false;
                              return s.startAt!.year == currentDay.year &&
                                  s.startAt!.month == currentDay.month &&
                                  s.startAt!.day == currentDay.day &&
                                  s.startAt!.hour >= hour &&
                                  s.startAt!.hour < nextHour;
                            }).toList();

                            return Container(
                              width: dayColWidth,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: gridLine.withValues(alpha: 0.45)),
                                  bottom: BorderSide(color: gridLine.withValues(alpha: 0.45)),
                                ),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: events.isEmpty
                                  ? null
                                  : Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        for (final e in events) _buildEventCard(e, primaryColor, isDark),
                                      ],
                                    ),
                            );
                          }),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Không tải được lịch: $err',
            textAlign: TextAlign.center,
            style: TextStyle(color: isDark ? AppColors.textTertiary : AppColors.textSecondary),
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(LiveScheduleModel e, Color primaryColor, bool isDark) {
    final ui = e.uiStateAt(DateTime.now());
    final isLive = ui == LiveScheduleUiState.live;
    final isJoinable = ui == LiveScheduleUiState.joinable;
    final cardColor = isLive
        ? AppColors.error
        : isJoinable
            ? primaryColor
            : const Color(0xFFF59E0B);

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: cardColor.withValues(alpha: 0.12),
          border: Border(left: BorderSide(color: cardColor, width: 4)),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLive)
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(color: AppColors.error, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'LIVE',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: AppColors.error.withValues(alpha: 0.95),
                    ),
                  ),
                ],
              )
            else if (isJoinable)
              Text(
                'VÀO LỚP',
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            Text(
              e.title ?? 'Buổi học',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              e.instructorName ?? e.courseTitle ?? '',
              style: const TextStyle(fontSize: 8, color: AppColors.textTertiary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingSection(
    BuildContext context,
    LiveScheduleModel e,
    Color primaryColor,
    bool isDark,
  ) {
    final theme = Theme.of(context);
    final title = (e.title ?? '').trim().isNotEmpty ? e.title! : (e.courseTitle ?? 'Buổi học live');
    final subtitle = e.startAt != null && e.endAt != null
        ? '${_weekdayVi(e.startAt!)} ${DateFormat('dd/MM').format(e.startAt!)} · ${e.timeRange}'
        : (e.timeRange.isNotEmpty ? e.timeRange : 'Sắp diễn ra');

    final thumb = e.courseThumbnail;
    final state = e.uiStateAt(DateTime.now());
    final joinLabel = state == LiveScheduleUiState.live
        ? 'VÀO LỚP NGAY'
        : state == LiveScheduleUiState.joinable
            ? 'VÀO PHÒNG HỌC'
            : 'ĐẾN GIỜ SẼ MỞ PHÒNG';

    return Material(
      elevation: 12,
      color: Colors.transparent,
      shadowColor: Colors.black.withValues(alpha: 0.2),
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 14, 16, 14 + MediaQuery.paddingOf(context).bottom),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [const Color(0xFF1E293B), const Color(0xFF0F172A)]
                : [AppColors.surface, AppColors.grey200.withValues(alpha: 0.45)],
          ),
          border: Border(
            top: BorderSide(
              color: isDark ? Colors.white.withValues(alpha: 0.08) : AppColors.grey300,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BUỔI SẮP DIỄN RA',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: primaryColor,
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        title,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isDark ? AppColors.textTertiary : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: thumb != null && thumb.isNotEmpty
                        ? Image.network(
                            thumb,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => _placeholderThumb(primaryColor),
                          )
                        : _placeholderThumb(primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _joiningSessionId != null
                    ? null
                    : () {
                        if (e.canAttemptJoin) {
                          _onJoin(e);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Chưa tới giờ mở phòng. Bạn sẽ vào được trước buổi học vài chục phút.'),
                            ),
                          );
                        }
                      },
                icon: _joiningSessionId == e.id
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Icon(Icons.play_circle_fill_rounded, color: Colors.white),
                label: Text(
                  _joiningSessionId == e.id ? 'Đang mở…' : joinLabel,
                  style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.8, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholderThumb(Color primaryColor) {
    return ColoredBox(
      color: primaryColor.withValues(alpha: 0.15),
      child: Icon(Icons.school_rounded, color: primaryColor.withValues(alpha: 0.8)),
    );
  }
}
