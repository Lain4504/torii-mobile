import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/live_class_model.dart';

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
    // Start from Monday of current week
    final currentWeekday = now.weekday;
    final monday = now.subtract(Duration(days: currentWeekday - 1));
    
    _weekDays = List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  void _loadMockClasses() {
    // Generate some mock classes for the selected week
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
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // AppBar
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 120,
            backgroundColor: theme.scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      'Live Schedule',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: AppTypography.bold,
                      ),
                    ),
                    Text(
                      DateFormat('MMMM yyyy').format(_selectedDate),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Calendar Strip
          SliverToBoxAdapter(
            child: _buildCalendarStrip(theme, isDark),
          ),

          // Schedule List
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.pageHorizontal),
            sliver: _filteredClasses.isEmpty
                ? SliverToBoxAdapter(child: _buildEmptyState(theme))
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.md),
                          child: EntryAnimation(
                            index: index,
                            child: _LiveClassCard(classData: _filteredClasses[index]),
                          ),
                        );
                      },
                      childCount: _filteredClasses.length,
                    ),
                  ),
          ),
          
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }

  Widget _buildCalendarStrip(ThemeData theme, bool isDark) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
        itemCount: _weekDays.length,
        separatorBuilder: (context, index) => const SizedBox(width: AppSpacing.md),
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
              duration: AppDuration.fast,
              width: 60,
              decoration: BoxDecoration(
                color: isSelected 
                    ? AppColors.primary 
                    : isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(AppRadius.full),
                border: isToday && !isSelected
                    ? Border.all(color: AppColors.primary, width: 2)
                    : null,
                boxShadow: isSelected ? AppElevation.softShadow : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('E').format(date).toUpperCase(), // MON, TUE
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isSelected 
                          ? Colors.white 
                          : AppColors.textTertiary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    date.day.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isSelected 
                          ? Colors.white 
                          : theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  if (isSelected || isToday) ...[
                    const SizedBox(height: 4),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : AppColors.primary,
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
      padding: const EdgeInsets.all(AppSpacing.xl),
      alignment: Alignment.center,
      child: Column(
        children: [
          Icon(
            Icons.event_busy_rounded,
            size: 64,
            color: AppColors.textTertiary.withValues(alpha: 0.3),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'No classes scheduled',
            style: theme.textTheme.titleMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Try selecting another date',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textTertiary,
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
    
    return MinimalCard(
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Time Column
            SizedBox(
              width: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('HH:mm').format(classData.startTime),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    DateFormat('a').format(classData.startTime), // AM/PM
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textTertiary,
                    ),
                  ),
                  const Spacer(),
                  // Duration line
                  Container(
                    width: 2,
                    height: 20,
                    color: AppColors.grey200,
                    margin: const EdgeInsets.only(left: 4, bottom: 4),
                  ),
                ],
              ),
            ),

            // Vertical Divider
            VerticalDivider(
              color: isLive ? AppColors.primary : AppColors.grey200,
              width: 24,
              thickness: isLive ? 2 : 1,
            ),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status Badge
                  if (isLive)
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'LIVE NOW',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  Text(
                    classData.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: AppTypography.semiBold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 8,
                        backgroundColor: AppColors.grey200,
                        child: Icon(Icons.person, size: 10, color: AppColors.textTertiary),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        classData.instructorName,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  
                  // Join Button
                  if (classData.status == LiveClassStatus.live || classData.status == LiveClassStatus.upcoming)
                   SizedBox(
                     width: double.infinity,
                     child: OutlinedButton(
                       onPressed: () {
                         // TODO: Join Logic
                       },
                       style: OutlinedButton.styleFrom(
                         foregroundColor: isLive ? AppColors.primary : AppColors.textSecondary,
                         side: BorderSide(
                           color: isLive ? AppColors.primary : AppColors.borderLight,
                         ),
                       ),
                       child: Text(isLive ? 'Join Now' : 'Set Reminder'),
                     ),
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
