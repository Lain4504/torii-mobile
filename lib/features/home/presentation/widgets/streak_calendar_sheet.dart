import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';

class StreakCalendarSheet extends ConsumerStatefulWidget {
  const StreakCalendarSheet({super.key});

  @override
  ConsumerState<StreakCalendarSheet> createState() => _StreakCalendarSheetState();
}

class _StreakCalendarSheetState extends ConsumerState<StreakCalendarSheet> {
  DateTime _cursorMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);

  void _prevMonth() {
    setState(() {
      _cursorMonth = DateTime(_cursorMonth.year, _cursorMonth.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _cursorMonth = DateTime(_cursorMonth.year, _cursorMonth.month + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final streakAsync = ref.watch(streakProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: streakAsync.when(
          loading: () => const SizedBox(
            height: 420,
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (_, __) => SizedBox(
            height: 420,
            child: Center(
              child: Text(
                'Không tải được streak',
                style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textTertiary),
              ),
            ),
          ),
          data: (streak) {
            final currentStreak = streak?.currentStreak ?? 0;
            final activeDates = <String>{
              ...(streak?.recentActiveDates ?? const []),
              if ((streak?.lastActiveDate ?? '').isNotEmpty) streak!.lastActiveDate!,
            };

            final monthLabel = 'tháng ${_cursorMonth.month} - ${_cursorMonth.year}';
            final today = DateTime.now();
            final todayStr = _yyyyMmDd(today);

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header row
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Streak',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded),
                      tooltip: 'Đóng',
                    ),
                  ],
                ),

                // Streak summary card (simple, like screenshot)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primary.withValues(alpha: 0.35), width: 2),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '$currentStreak',
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'ngày streak!',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const Icon(Icons.local_fire_department_rounded, color: AppColors.primary),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lịch sử học',
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(height: 10),

                // Calendar container
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.grey200),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: _prevMonth,
                            icon: const Icon(Icons.chevron_left_rounded),
                          ),
                          Expanded(
                            child: Text(
                              monthLabel,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
                            ),
                          ),
                          IconButton(
                            onPressed: _nextMonth,
                            icon: const Icon(Icons.chevron_right_rounded),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      _WeekHeader(theme: theme),
                      const SizedBox(height: 6),
                      _MonthGrid(
                        month: _cursorMonth,
                        activeDates: activeDates,
                        todayStr: todayStr,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                // Legend
                Row(
                  children: [
                    _LegendDot(color: AppColors.primary.withValues(alpha: 0.18)),
                    const SizedBox(width: 6),
                    const Text('Đã học', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                    const SizedBox(width: 14),
                    _LegendDot(color: AppColors.grey200),
                    const SizedBox(width: 6),
                    const Text('Chưa học', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                    const SizedBox(width: 14),
                    _LegendDot(color: AppColors.detail.withValues(alpha: 0.18)),
                    const SizedBox(width: 6),
                    const Text('Đóng băng', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 4),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: AppColors.grey300.withValues(alpha: 0.5)),
      ),
    );
  }
}

class _WeekHeader extends StatelessWidget {
  const _WeekHeader({required this.theme});
  final ThemeData theme;

  static const _labels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _labels
          .map((t) => Expanded(
                child: Text(
                  t,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.textTertiary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class _MonthGrid extends StatelessWidget {
  const _MonthGrid({
    required this.month,
    required this.activeDates,
    required this.todayStr,
  });

  final DateTime month;
  final Set<String> activeDates;
  final String todayStr;

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(month.year, month.month, 1);
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;

    // Convert to Monday-start index: Mon=0..Sun=6
    final firstWeekday = (firstDay.weekday - 1) % 7;
    final totalCells = ((firstWeekday + daysInMonth) <= 35) ? 35 : 42;

    final cells = List<Widget>.generate(totalCells, (i) {
      final dayNum = i - firstWeekday + 1;
      if (dayNum < 1 || dayNum > daysInMonth) {
        return const _DayCell.empty();
      }

      final date = DateTime(month.year, month.month, dayNum);
      final dateStr = _yyyyMmDd(date);
      final isToday = dateStr == todayStr;
      final isActive = activeDates.contains(dateStr);

      return _DayCell(
        day: dayNum,
        isToday: isToday,
        isActive: isActive,
      );
    });

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      childAspectRatio: 1.0,
      children: cells,
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.day,
    required this.isToday,
    required this.isActive,
  });

  const _DayCell.empty()
      : day = 0,
        isToday = false,
        isActive = false;

  final int day;
  final bool isToday;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    if (day == 0) return const SizedBox.shrink();

    final bg = isActive ? AppColors.primary.withValues(alpha: 0.16) : Colors.transparent;
    final border = isToday
        ? Border.all(color: AppColors.primary, width: 1.6)
        : Border.all(color: AppColors.grey200, width: 1);

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
        border: border,
      ),
      child: Text(
        '$day',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: isActive ? AppColors.primary : AppColors.textSecondary,
        ),
      ),
    );
  }
}

String _yyyyMmDd(DateTime d) {
  final y = d.year.toString().padLeft(4, '0');
  final m = d.month.toString().padLeft(2, '0');
  final day = d.day.toString().padLeft(2, '0');
  return '$y-$m-$day';
}

