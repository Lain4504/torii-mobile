import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/live_schedule_model.dart';

/// Lịch live: cùng pattern các màn khác — `ref.watch(liveSchedulesProvider)` (xem `api_providers.dart`).
/// Provider gọi [AcademyRepository.getLiveSchedules]: `GET /api/academy/live-sessions/me` (đồng bộ web-learner).
/// Chỉ cần đã đăng nhập (không bắt buộc onboard) mới gọi API lịch.
class LiveScheduleScreen extends ConsumerStatefulWidget {
  const LiveScheduleScreen({super.key});

  @override
  ConsumerState<LiveScheduleScreen> createState() => _LiveScheduleScreenState();
}

class _LiveScheduleScreenState extends ConsumerState<LiveScheduleScreen> {
  final ScrollController _weekListScrollController = ScrollController();
  DateTime _currentWeekStart = _startOfWeekMonday(DateTime.now());
  bool _upcomingPanelAnimated = false;
  String? _joiningSessionId;
  final List<GlobalKey> _dayRowKeys = List<GlobalKey>.generate(7, (_) => GlobalKey());

  @override
  void initState() {
    super.initState();
    // Vào tab này: làm mới lịch để luôn có request (provider có cache từ Home).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.invalidate(liveSchedulesProvider);
    });
  }

  static DateTime _startOfWeekMonday(DateTime d) {
    final date = DateTime(d.year, d.month, d.day);
    return date.subtract(Duration(days: date.weekday - DateTime.monday));
  }

  @override
  void dispose() {
    _weekListScrollController.dispose();
    super.dispose();
  }

  void _scrollToDay(int dayIndex) {
    final ctx = _dayRowKeys[dayIndex].currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
      alignment: 0.05,
    );
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

  String _attendanceBadgeLabel(String? status) {
    switch (status) {
      case 'PRESENT':
        return 'Đã điểm danh: có mặt';
      case 'ABSENT':
        return 'Đã điểm danh: vắng';
      case 'LATE':
        return 'Đã điểm danh: muộn';
      case 'EXCUSED':
        return 'Đã điểm danh: có phép';
      default:
        return 'Chưa có điểm danh';
    }
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

  /// Bottom sheet xác nhận — cùng pattern [StudySetsDashboardScreen] (handle + padding + nút 44px, radius 14).
  Future<void> _showJoinConfirmSheet(LiveScheduleModel session) async {
    final theme = Theme.of(context);

    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final joinAllowed = session.canAttemptJoin;
        final title = (session.title ?? '').trim().isNotEmpty ? session.title! : (session.courseTitle ?? 'Buổi học');
        final timeLine = session.startAt != null && session.endAt != null
            ? '${DateFormat('dd/MM/yyyy').format(session.startAt!)} · ${DateFormat('HH:mm').format(session.startAt!)} – ${DateFormat('HH:mm').format(session.endAt!)}'
            : session.timeRange;

        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: MediaQuery.viewInsetsOf(ctx).bottom + MediaQuery.paddingOf(ctx).bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              Text(
                'Tham gia buổi live?',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              if (timeLine.isNotEmpty) ...[
                const SizedBox(height: 6),
                  Text(
                    timeLine,
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7)),
                  ),
              ],
              if ((session.courseTitle ?? '').trim().isNotEmpty &&
                  (session.title ?? '').trim().isNotEmpty &&
                  session.courseTitle != session.title) ...[
                const SizedBox(height: 4),
                Text(
                  'Khóa: ${session.courseTitle}',
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              if (!joinAllowed) ...[
                const SizedBox(height: 10),
                  Text(
                    'Chưa tới giờ mở phòng. Bạn sẽ vào được trước buổi học vài chục phút.',
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7), height: 1.35),
                  ),
              ],
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(ctx, rootNavigator: true).pop(),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: theme.colorScheme.onSurfaceVariant,
                          side: BorderSide(color: theme.colorScheme.outlineVariant),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: const Text('Hủy', style: TextStyle(fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: joinAllowed && _joiningSessionId == null
                            ? () {
                                Navigator.of(ctx, rootNavigator: true).pop();
                                _onJoin(session);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: theme.colorScheme.onPrimary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: Text(
                          _joiningSessionId == session.id ? 'Đang mở…' : 'Tham gia',
                          style: const TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    // Gọi API gián tiếp: FutureProvider tự chạy khi watch; khi invalidate ở initState sẽ refetch.
    final liveSchedulesAsync = ref.watch(liveSchedulesProvider);

    final primaryColor = theme.colorScheme.primary;
    final bgColor = theme.scaffoldBackgroundColor;
    final surfaceColor = theme.colorScheme.surface;
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
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildHeader(context, isDark, primaryColor, () {
                    ref.invalidate(liveSchedulesProvider);
                  }),
                  _buildNavigation(context, dateRangeText, primaryColor, isDark),
                  Expanded(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned.fill(
                          child: _buildWeekScheduleBody(
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


  /// Header đồng bộ phong cách web-learner `dashboard/schedule`: tiêu đề + Meet + làm mới lịch.
  Widget _buildHeader(
    BuildContext context,
    bool isDark,
    Color primaryColor,
    VoidCallback onRefreshSchedule,
  ) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outlineVariant,
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
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Tuần · chấm xanh = có buổi · chạm ngày để cuộn tới.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: muted,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    tooltip: 'Tải lại lịch',
                    onPressed: onRefreshSchedule,
                    icon: Icon(Icons.refresh_rounded, color: primaryColor, size: 22),
                    style: IconButton.styleFrom(
                      padding: const EdgeInsets.all(6),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
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
        color: theme.colorScheme.surface.withValues(alpha: 0.85),
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outlineVariant,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () => _changeWeek(-1),
            icon: const Icon(Icons.chevron_left_rounded, size: 22),
            color: theme.colorScheme.onSurfaceVariant,
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
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
              foregroundColor: theme.colorScheme.onSurfaceVariant,
            ),
            child: const Text(
              'HIỆN TẠI',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.6),
            ),
          ),
          IconButton(
            onPressed: () => _changeWeek(1),
            icon: const Icon(Icons.chevron_right_rounded, size: 22),
            color: theme.colorScheme.onSurfaceVariant,
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
              padding: const EdgeInsets.all(6),
            ),
          ),
        ],
      ),
    );
  }

  List<LiveScheduleModel> _sessionsForDay(List<LiveScheduleModel> weekList, DateTime day) {
    final d = DateTime(day.year, day.month, day.day);
    final list = weekList.where((s) {
      final t = s.startAt;
      if (t == null) return false;
      final sd = DateTime(t.year, t.month, t.day);
      return sd == d;
    }).toList()
      ..sort((a, b) => (a.startAt ?? DateTime(0)).compareTo(b.startAt ?? DateTime(0)));
    return list;
  }

  Widget _buildWeekScheduleBody(
    bool isDark,
    Color primaryColor,
    AsyncValue<List<LiveScheduleModel>> schedulesAsync,
    List<LiveScheduleModel> weekList,
  ) {
    final theme = Theme.of(context);
    const dayLabels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
    final bottomInset = MediaQuery.paddingOf(context).bottom + 8;
    final dividerColor = theme.colorScheme.outlineVariant;
    final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return schedulesAsync.when(
      data: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildWeekDayStrip(
            primaryColor,
            isDark,
            weekList,
            todayStr,
          ),
          Expanded(
            child: ListView.separated(
              controller: _weekListScrollController,
              padding: EdgeInsets.only(bottom: bottomInset + (weekList.isEmpty ? 24 : 120)),
              itemCount: 7,
              separatorBuilder: (context, _) => Divider(height: 1, thickness: 1, color: dividerColor),
              itemBuilder: (context, dayIndex) {
                final day = _currentWeekStart.add(Duration(days: dayIndex));
                final daySessions = _sessionsForDay(weekList, day);
                final dayStr = DateFormat('yyyy-MM-dd').format(day);
                final isToday = dayStr == todayStr;

                return Material(
                  key: _dayRowKeys[dayIndex],
                  color: isToday ? primaryColor.withValues(alpha: 0.06) : Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 52,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('dd/MM').format(day),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: theme.colorScheme.onSurface,
                                  ),
                              ),
                              Text(
                                dayLabels[dayIndex],
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                                  ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: daySessions.isEmpty
                              ? Container(
                                  constraints: const BoxConstraints(minHeight: 48),
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Không có buổi học',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                                    ),
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    for (var i = 0; i < daySessions.length; i++)
                                      Padding(
                                        padding: EdgeInsets.only(bottom: i < daySessions.length - 1 ? 8 : 0),
                                        child: _buildCompactSessionCard(
                                          daySessions[i],
                                          primaryColor: primaryColor,
                                          isDark: isDark,
                                        ),
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
          ),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Không tải được lịch: $err',
            textAlign: TextAlign.center,
            style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
          ),
        ),
      ),
    );
  }

  Widget _buildWeekDayStrip(
    Color primaryColor,
    bool isDark,
    List<LiveScheduleModel> weekList,
    String todayStr,
  ) {
    final theme = Theme.of(context);
    const dayLabels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(alpha: 0.9),
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outlineVariant,
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(7, (i) {
            final day = _currentWeekStart.add(Duration(days: i));
            final dayStr = DateFormat('yyyy-MM-dd').format(day);
            final isToday = dayStr == todayStr;
            final has = _sessionsForDay(weekList, day).isNotEmpty;
            return Padding(
              padding: const EdgeInsets.only(right: 6),
              child: InkWell(
                onTap: () => _scrollToDay(i),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 48,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  decoration: BoxDecoration(
                    color: isToday ? primaryColor : theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isToday ? primaryColor : theme.colorScheme.outlineVariant,
                    ),
                    boxShadow: isToday
                        ? [BoxShadow(color: primaryColor.withValues(alpha: 0.25), blurRadius: 6, offset: const Offset(0, 2))]
                        : null,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        dayLabels[i],
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                          color: isToday ? Colors.white.withValues(alpha: 0.95) : theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                        ),
                      ),
                      const SizedBox(height: 2),
                        Text(
                          '${day.day}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: isToday ? Colors.white : theme.colorScheme.onSurface,
                          ),
                        ),
                      if (has)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: isToday ? Colors.white : const Color(0xFF3B82F6),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildCompactSessionCard(
    LiveScheduleModel e, {
    required Color primaryColor,
    required bool isDark,
  }) {
    final theme = Theme.of(context);
    final now = DateTime.now();
    final ui = e.uiStateAt(now);
    final isLive = ui == LiveScheduleUiState.live;
    final isEnded = ui == LiveScheduleUiState.ended;
    final start = e.startAt;
    final end = e.endAt;
    final timeTop = start != null ? DateFormat('HH:mm').format(start) : '—';
    final timeBot = end != null ? DateFormat('HH:mm').format(end) : '—';
    final accentGreen = theme.colorScheme.primary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _showJoinConfirmSheet(e),
        borderRadius: BorderRadius.circular(12),
        child: Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isLive
              ? theme.colorScheme.error.withValues(alpha: 0.45)
              : isEnded
                  ? theme.colorScheme.outlineVariant
                  : theme.colorScheme.outlineVariant.withValues(alpha: 0.85),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                Text(timeTop, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900)),
                const SizedBox(height: 4),
                Container(
                  width: 2,
                  height: 14,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.outlineVariant.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                const SizedBox(height: 4),
                Text(timeBot, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (isLive)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.error.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'LIVE',
                          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: theme.colorScheme.error),
                        ),
                      )
                    else if (!isEnded && start != null && start.isAfter(now))
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Sắp tới',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      )
                    else if (isEnded)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Đã xong',
                          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: theme.colorScheme.onSurfaceVariant),
                        ),
                      ),
                    if (isEnded)
                      Container(
                        constraints: const BoxConstraints(maxWidth: 160),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.muted.withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _attendanceBadgeLabel(e.attendanceStatus),
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w800,
                            color: isDark ? AppColors.textTertiary : AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    if (e.canAttemptJoin)
                      TextButton(
                        onPressed: _joiningSessionId != null
                            ? null
                            : () => _showJoinConfirmSheet(e),
                        style: TextButton.styleFrom(
                          foregroundColor: primaryColor,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          backgroundColor: primaryColor.withValues(alpha: 0.12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: _joiningSessionId == e.id
                            ? const SizedBox(
                                width: 14,
                                height: 14,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : Text(
                                isLive ? 'Vào lớp' : 'Vào phòng',
                                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
                              ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  (e.title ?? '').trim().isNotEmpty ? e.title! : (e.courseTitle ?? 'Buổi học'),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    height: 1.25,
                    color: isLive ? theme.colorScheme.error : accentGreen,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if ((e.courseTitle ?? '').trim().isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Khóa: ${e.courseTitle}',
                    style: TextStyle(
                      fontSize: 11,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if ((e.instructorName ?? '').trim().isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    e.instructorName!,
                    style: TextStyle(fontSize: 10, color: theme.colorScheme.onSurfaceVariant),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
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
        // Tránh cộng thêm bottom padding lần 2 (màn đã được bọc SafeArea).
        // Nếu giữ padding bottom quá lớn, panel sẽ bị đẩy lên xa `AppShellBottom`.
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [theme.colorScheme.surface, theme.colorScheme.surface.withValues(alpha: 0.8)]
                : [theme.colorScheme.surface, theme.colorScheme.outlineVariant.withValues(alpha: 0.45)],
          ),
          border: Border(
            top: BorderSide(
              color: theme.colorScheme.outlineVariant,
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
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
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
                    : () => _showJoinConfirmSheet(e),
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
