import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/live_class_model.dart';

/// Live Class Schedule Page - Premium Zen UI Rebuild
class LiveClassSchedulePage extends StatefulWidget {
  const LiveClassSchedulePage({super.key});

  @override
  State<LiveClassSchedulePage> createState() => _LiveClassSchedulePageState();
}

class _LiveClassSchedulePageState extends State<LiveClassSchedulePage> {
  late DateTime _selectedDate;
  late List<DateTime> _weekDays;
  late List<LiveClass> _classes;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _generateWeekDays();
    _loadMockClasses();
  }

  void _generateWeekDays() {
    final now = DateTime.now();
    final currentWeekday = now.weekday;
    final monday = now.subtract(Duration(days: currentWeekday - 1));
    _weekDays = List.generate(14, (index) => monday.add(Duration(days: index))); // Show 2 weeks
  }

  void _loadMockClasses() {
    final now = DateTime.now();
    _classes = [
      LiveClass(
        id: '1',
        title: 'N5 Grammar: Particles Wa/Ga',
        instructorName: 'Yuki Sensei',
        startTime: DateTime(now.year, now.month, now.day, 10, 0),
        endTime: DateTime(now.year, now.month, now.day, 11, 0),
        status: LiveClassStatus.live,
        description: 'Deep dive into the differences between Wa and Ga particles.',
      ),
      LiveClass(
        id: '2',
        title: 'Kanji Writing Workshop',
        instructorName: 'Kenji Sensei',
        startTime: DateTime(now.year, now.month, now.day, 14, 0),
        endTime: DateTime(now.year, now.month, now.day, 15, 30),
        status: LiveClassStatus.upcoming,
        description: 'Interactive writing session for basic Kanji.',
      ),
      LiveClass(
        id: '3',
        title: 'Conversation Club: Greetings',
        instructorName: 'Sara Sensei',
        startTime: DateTime(now.year, now.month, now.day + 1, 19, 0),
        endTime: DateTime(now.year, now.month, now.day + 1, 20, 0),
        status: LiveClassStatus.upcoming,
        description: 'Practice daily greetings in a casual setting.',
      ),
    ];
  }

  List<LiveClass> get _filteredClasses {
    return _classes.where((c) => 
      c.startTime.year == _selectedDate.year &&
      c.startTime.month == _selectedDate.month &&
      c.startTime.day == _selectedDate.day
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 140,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        'CLASS SCHEDULE',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: AppTypography.black,
                          letterSpacing: 5.0,
                          color: AppColors.primary.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('MMMM yyyy').format(_selectedDate),
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamilySerif,
                          fontWeight: AppTypography.bold,
                          fontSize: 32,
                          letterSpacing: -1.0,
                          fontStyle: FontStyle.italic,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: EntryAnimation(
                delay: const Duration(milliseconds: 200),
                child: _buildCalendarStrip(theme, isDark),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
              sliver: _filteredClasses.isEmpty
                  ? SliverToBoxAdapter(child: _buildEmptyState(theme))
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                            child: EntryAnimation(
                              index: index % 5,
                              verticalOffset: 20,
                              child: _LiveClassCard(classData: _filteredClasses[index]),
                            ),
                          );
                        },
                        childCount: _filteredClasses.length,
                      ),
                    ),
            ),
            
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarStrip(ThemeData theme, bool isDark) {
    return Container(
      height: 110,
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
        itemCount: _weekDays.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final date = _weekDays[index];
          final isSelected = date.year == _selectedDate.year &&
              date.month == _selectedDate.month &&
              date.day == _selectedDate.day;
          
          final isToday = date.day == DateTime.now().day && 
              date.month == DateTime.now().month && 
              date.year == DateTime.now().year;

          return GestureDetector(
            onTap: () => setState(() => _selectedDate = date),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutQuart,
              width: 60,
              decoration: BoxDecoration(
                color: isSelected 
                    ? AppColors.primary 
                    : Colors.white.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(AppRadius.xxl),
                border: Border.all(
                  color: isSelected 
                      ? AppColors.primary 
                      : (isToday ? AppColors.primary.withValues(alpha: 0.2) : AppColors.grey300.withValues(alpha: 0.3)),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isSelected ? AppColors.primary.withValues(alpha: 0.2) : AppColors.primary.withValues(alpha: 0.02),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('E').format(date).toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: AppTypography.black,
                      letterSpacing: 1.0,
                      color: isSelected 
                          ? Colors.white.withValues(alpha: 0.7) 
                          : AppColors.textTertiary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    date.day.toString(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: AppTypography.black,
                      letterSpacing: -1.0,
                      color: isSelected ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                  if (isToday && !isSelected) ...[
                    const SizedBox(height: 6),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
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

  Widget _buildEmptyState(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      alignment: Alignment.center,
      child: Column(
        children: [
          Icon(
            Icons.event_busy_rounded,
            size: 64,
            color: AppColors.primary.withValues(alpha: 0.1),
          ),
          const SizedBox(height: AppSpacing.lg),
          const Text(
            'STILLNESS PREVAILS',
            style: TextStyle(
              fontSize: 14,
              fontWeight: AppTypography.black,
              letterSpacing: 2.0,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'No transmissions detected for this cycle.',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textTertiary,
              fontWeight: AppTypography.medium,
            ),
          ),
        ],
      ),
    );
  }
}

class _LiveClassCard extends StatelessWidget {
  final LiveClass classData;

  const _LiveClassCard({required this.classData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLive = classData.status == LiveClassStatus.live;
    
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(color: AppColors.grey300.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.03),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Time Column
            SizedBox(
              width: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('HH:mm').format(classData.startTime),
                    style: const TextStyle(
                      fontWeight: AppTypography.black,
                      fontSize: 18,
                      letterSpacing: -0.5,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    DateFormat('a').format(classData.startTime),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: AppTypography.black,
                      letterSpacing: 1.0,
                      color: AppColors.textTertiary,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 2,
                    height: 20,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primary.withValues(alpha: 0.2), Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 20),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isLive) ...[
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.error.withValues(alpha: 0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Text(
                        'REAL-TIME_TRANS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: AppTypography.black,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ],

                  Text(
                    classData.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: AppTypography.extraBold,
                      fontSize: 17,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
                        ),
                        child: const CircleAvatar(
                          radius: 8,
                          backgroundColor: AppColors.primarySurface,
                          child: Icon(Icons.person_rounded, size: 10, color: AppColors.primary),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        classData.instructorName,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          fontWeight: AppTypography.semiBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  ZenButton(
                    text: isLive ? 'ESTABLISH LINK' : 'SET REMINDER',
                    onPressed: () {},
                    isFullWidth: true,
                    // style override if needed
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
