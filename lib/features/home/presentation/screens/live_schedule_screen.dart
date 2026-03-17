import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  DateTime _currentWeekStart = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));

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

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final liveSchedulesAsync = ref.watch(liveSchedulesProvider);

    // Design system colors (match web OKLCH palette)
    final primaryColor = AppColors.primary;
    final bgColor = isDark ? AppColors.backgroundDark : AppColors.muted;
    final surfaceColor = isDark ? AppColors.surfaceDark : AppColors.surface;
    final gridLineColor = primaryColor.withOpacity(0.1);
    final headerBgColor = isDark ? AppColors.surfaceDark : AppColors.sidebar;

    final weekEnd = _currentWeekStart.add(const Duration(days: 6));
    final dateRangeText = "${DateFormat('MMM d').format(_currentWeekStart)} - ${DateFormat('MMM d').format(weekEnd)}";

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
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
              ),
              child: Column(
                children: [
                  _buildHeader(isDark, primaryColor),
                  _buildNavigation(dateRangeText, primaryColor, isDark),
                  Expanded(
                    child: Stack(
                      children: [
                        _buildTimetableGrid(headerBgColor, gridLineColor, isDark, primaryColor, liveSchedulesAsync),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: _buildUpcomingSection(primaryColor, isDark),
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

  Widget _buildHeader(bool isDark, Color primaryColor) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : Colors.white,
        border: Border(bottom: BorderSide(color: primaryColor.withOpacity(0.1))),
      ),
      child: Text(
        'Live Schedule',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildNavigation(String dateRange, Color primaryColor, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : Colors.white,
        border: Border(bottom: BorderSide(color: isDark ? Colors.white10 : Colors.black12)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () => _changeWeek(-1),
            icon: const Icon(Icons.chevron_left, size: 16),
            label: const Text('PREVIOUS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            style: TextButton.styleFrom(foregroundColor: Colors.grey, padding: EdgeInsets.zero),
          ),
          Text(
            dateRange,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          TextButton.icon(
            onPressed: () => _changeWeek(1),
            icon: const Text('NEXT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            label: const Icon(Icons.chevron_right, size: 16),
            style: TextButton.styleFrom(foregroundColor: Colors.grey, padding: EdgeInsets.zero),
          ),
        ],
      ),
    );
  }

  Widget _buildTimetableGrid(Color headerBg, Color gridLine, bool isDark, Color primaryColor, AsyncValue<List<LiveScheduleModel>> schedules) {
    const double timeColWidth = 55.0;
    const double dayColWidth = 120.0;
    const double rowHeight = 100.0;
    final List<String> days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    final List<String> times = ['08:00', '10:00', '12:00', '14:00', '16:00', '18:00', '19:00', '21:00'];

    return SingleChildScrollView(
      controller: _horizontalScrollController,
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: timeColWidth + (dayColWidth * 7),
        child: Column(
          children: [
            // Day Headers
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: headerBg,
                border: Border(bottom: BorderSide(color: isDark ? Colors.white10 : Colors.black12)),
              ),
              child: Row(
                children: [
                  const SizedBox(width: timeColWidth),
                  ...List.generate(7, (index) {
                    final dayDate = _currentWeekStart.add(Duration(days: index));
                    final isToday = DateFormat('yyyy-MM-dd').format(dayDate) == DateFormat('yyyy-MM-dd').format(DateTime.now());
                    
                    return Container(
                      width: dayColWidth,
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(color: isDark ? Colors.white10 : Colors.black12),
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
                              color: isToday ? primaryColor : Colors.grey,
                            ),
                          ),
                          Text(
                            dayDate.day.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isToday ? primaryColor : (isDark ? Colors.white70 : Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),

            // Grid Content
            Expanded(
              child: schedules.when(
                data: (list) => ListView.builder(
                  padding: const EdgeInsets.only(bottom: 200), // Space for upcoming section
                  itemCount: times.length,
                  itemBuilder: (context, timeIndex) {
                    return SizedBox(
                      height: rowHeight,
                      child: Row(
                        children: [
                          // Time Label
                          Container(
                            width: timeColWidth,
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.only(top: 12),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: isDark ? Colors.white10 : Colors.black12.withOpacity(0.05))),
                            ),
                            child: Text(
                              times[timeIndex],
                              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                          // Day Cells
                          ...List.generate(7, (dayIndex) {
                            final currentDay = _currentWeekStart.add(Duration(days: dayIndex));
                            final hour = int.parse(times[timeIndex].split(':')[0]);
                            
                            // Find events for this cell
                            final events = list.where((s) {
                              if (s.startAt == null) return false;
                              return s.startAt!.year == currentDay.year &&
                                  s.startAt!.month == currentDay.month &&
                                  s.startAt!.day == currentDay.day &&
                                  s.startAt!.hour >= hour &&
                                  s.startAt!.hour < (timeIndex < times.length - 1 ? int.parse(times[timeIndex+1].split(':')[0]) : hour + 2);
                            }).toList();

                            return Container(
                              width: dayColWidth,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: isDark ? Colors.white10 : Colors.black12.withOpacity(0.05)),
                                  bottom: BorderSide(color: isDark ? Colors.white10 : Colors.black12.withOpacity(0.05)),
                                ),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: events.isEmpty ? null : Column(
                                children: events.map((e) => _buildEventCard(e, primaryColor, isDark)).toList(),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  },
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('Error: $err')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(LiveScheduleModel e, Color primaryColor, bool isDark) {
    final isLive = e.status?.toUpperCase() == 'LIVE' || e.status?.toUpperCase() == 'ONGOING';
    final cardColor = isLive ? primaryColor : const Color(0xFFF59E0B); // amber-500
    
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 2),
        width: double.infinity,
        decoration: BoxDecoration(
          color: cardColor.withOpacity(0.1),
          border: Border(left: BorderSide(color: cardColor, width: 4)),
          borderRadius: BorderRadius.circular(4),
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
                    decoration: const BoxDecoration(color: Color(0xFF5E82BB), shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 4),
                  const Text('LIVE', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Color(0xFF5E82BB))),
                ],
              ),
            Text(
              e.title ?? 'Class',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              e.instructorName ?? 'Staff',
              style: const TextStyle(fontSize: 8, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingSection(Color primaryColor, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceDark,
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.1))),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NEXT UPCOMING CLASS',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'JLPT N3 Grammar Workshop',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Today, 14:00 - 15:30 (90 min)',
                      style: TextStyle(fontSize: 10, color: Colors.white.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white24),
                  image: const DecorationImage(
                    image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCtmrjJzY7nYuzGQ7T3a6fb1LTRi1DBI4RJgqI6NwsRiT2TopkO946Aftl5ZN0Srvp-VUwR_bqefW0HrQ9w_zbFpREXQ5j5nIuvqElM6wC3m6sSwtNUzed_2Trb4SgyeBYBr0VTqYxZeWKRSJ2yYIiP4iOE5qay-VTPK2ErzawkucN9UeHAZ-PubKzfCA9NSEibl_YyLnTE8qm8SB_TPCu-MgmzDcwPxxtEmMxnvbbYPH-af9LzN_jdceRk8lf6M_YbObcb8gcPHsY'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => context.push('/meet?roomId=room01'),
              icon: const Icon(Icons.play_circle_fill, color: Colors.white),
              label: const Text(
                'JOIN CLASS',
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

