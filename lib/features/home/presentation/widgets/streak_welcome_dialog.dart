import 'package:flutter/material.dart';

class StreakWelcomeDialog extends StatelessWidget {
  const StreakWelcomeDialog({
    super.key,
    required this.currentStreak,
    required this.activeDates,
    required this.isActiveToday,
    required this.onViewDetail,
  });

  final int currentStreak;
  final Set<String> activeDates;
  final bool isActiveToday;
  final VoidCallback onViewDetail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final days = _buildWeekly();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$currentStreak ngày streak',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              isActiveToday
                  ? 'Bạn đã học hôm nay.'
                  : 'Hoàn thành 1 hoạt động học để giữ streak.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: days.map((d) => _DayDot(d)).toList(),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: theme.colorScheme.onSurfaceVariant,
                      side: BorderSide(color: theme.colorScheme.outlineVariant),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    child: const Text('Đóng'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onViewDetail,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    child: const Text('Xem chi tiết'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<_Day> _buildWeekly() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    const names = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
    final result = <_Day>[];

    for (int i = 6; i >= 0; i--) {
      final dt = today.subtract(Duration(days: i));
      final ds = _yyyyMmDd(dt);
      final isToday = i == 0;
      final done = (isToday && isActiveToday) || activeDates.contains(ds);
      final weekday = dt.weekday; // 1=Mon..7=Sun
      final label = names[(weekday == 7 ? 6 : weekday - 1)];
      result.add(_Day(label: label, done: done));
    }
    return result;
  }
}

class _Day {
  const _Day({required this.label, required this.done});
  final String label;
  final bool done;
}

class _DayDot extends StatelessWidget {
  const _DayDot(this.day);
  final _Day day;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          day.label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: day.done ? theme.colorScheme.primary : theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: day.done
                  ? theme.colorScheme.primary.withValues(alpha: 0.35)
                  : theme.colorScheme.outlineVariant.withValues(alpha: 0.7),
              width: 1,
            ),
          ),
          child: day.done ? const Icon(Icons.check_rounded, color: Colors.white, size: 18) : null,
        ),
      ],
    );
  }
}

String _yyyyMmDd(DateTime dt) {
  final y = dt.year.toString().padLeft(4, '0');
  final m = dt.month.toString().padLeft(2, '0');
  final d = dt.day.toString().padLeft(2, '0');
  return '$y-$m-$d';
}

