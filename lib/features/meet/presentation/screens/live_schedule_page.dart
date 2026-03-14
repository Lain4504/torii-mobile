import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

class LiveSchedulePage extends StatelessWidget {
  const LiveSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text(
          'Lịch học',
          style: TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.w800,
            fontSize: 22,
            fontFamily: 'Lexend',
          ),
        ),
        shape: Border(
          bottom: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.05),
            width: 1,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildDateNavigation(),
          Expanded(
            child: _buildTimetableGrid(context),
          ),
          _buildNextUpcomingSection(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.05),
        border: Border(
          bottom: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: ModernPatternPainter(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu_rounded),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const Text(
                      'TORII NIHONGO',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        color: AppColors.primary,
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuD0biTERKVWfrB2kDunpVWS2kwgtJ07g-BUTTXCbbNsyzD3iSBFszeWjO3_eJG9r2b8Yun8AEOOrwcwdyvPuM920xki-ujQV4-AM-e7tRrsQZdkwuDcvWgO_rnk4c8jbReu3owLZCHwU0-qsmZNABlxnxkZtd6va-e_bumiFuAHKzVYBzvolSrYM9L3u_CDw1AaAczV0Xb6JM4GAnVl7bxYA1QsyGje3wsjeMoemZDw2SPQsqD2z9DD-bZVOSOi7mendc1LuGWWUZg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Live Schedule',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavButton(Icons.chevron_left_rounded, 'PREVIOUS'),
          const Text(
            'Oct 23 - Oct 29',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          _buildNavButton(Icons.chevron_right_rounded, 'NEXT', isAfter: true),
        ],
      ),
    );
  }

  Widget _buildNavButton(IconData icon, String label, {bool isAfter = false}) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isAfter) Icon(icon, size: 18, color: const Color(0xFF94A3B8)),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFF94A3B8),
              letterSpacing: -0.5,
            ),
          ),
          if (isAfter) Icon(icon, size: 18, color: const Color(0xFF94A3B8)),
        ],
      ),
    );
  }

  Widget _buildTimetableGrid(BuildContext context) {
    final List<Map<String, dynamic>> days = [
      {'label': 'MON', 'day': '23'},
      {'label': 'TUE', 'day': '24'},
      {'label': 'WED', 'day': '25', 'isToday': true},
      {'label': 'THU', 'day': '26'},
      {'label': 'FRI', 'day': '27'},
      {'label': 'SAT', 'day': '28'},
      {'label': 'SUN', 'day': '29'},
    ];

    final List<String> times = ['08:00', '10:00', '14:00', '19:00'];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 50 + (120 * 7),
        child: Column(
          children: [
            // Days Header
            Container(
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFFF8FAFC),
                border: Border(
                  bottom: BorderSide(color: AppColors.border, width: 1),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 50),
                  ...days.map((day) => Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left: const BorderSide(color: AppColors.border, width: 1),
                              bottom: day['isToday'] == true
                                  ? const BorderSide(color: AppColors.primary, width: 2)
                                  : BorderSide.none,
                            ),
                            color: day['isToday'] == true ? Colors.white : Colors.transparent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                day['label']!,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: day['isToday'] == true ? AppColors.primary : const Color(0xFF94A3B8),
                                ),
                              ),
                              Text(
                                day['day']!,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: day['isToday'] == true ? AppColors.primary : const Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            // Time Grid
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: times.map((time) {
                    return SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.only(top: 8),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1),
                              ),
                            ),
                            child: Text(
                              time,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF94A3B8),
                              ),
                            ),
                          ),
                          ...List.generate(7, (index) {
                            return Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: Color(0xFFF1F5F9), width: 1),
                                    bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1),
                                  ),
                                ),
                                child: _buildGridItem(context, time, index),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? _buildGridItem(BuildContext context, String time, int dayIndex) {
    // dayIndex 0: Mon, 1: Tue, 2: Wed, 3: Thu, 4: Fri, 5: Sat, 6: Sun
    if (time == '08:00') {
      if (dayIndex == 0) {
        return _buildClassBlock(
          context,
          'Beginner Kanji',
          'Tanaka S.',
          AppColors.primary,
          isLive: true,
        );
      }
      if (dayIndex == 2) {
        return _buildClassBlock(
          context,
          'JLPT N4 Prep',
          'Sato S.',
          const Color(0xFFF59E0B),
        );
      }
    } else if (time == '10:00') {
      if (dayIndex == 1) {
        return _buildClassBlock(
          context,
          'Daily Phrases',
          'Suzuki S.',
          const Color(0xFF10B981),
        );
      }
      if (dayIndex == 4) {
        return _buildClassBlock(
          context,
          'Business Keigo',
          'Itou S.',
          const Color(0xFFF43F5E),
        );
      }
    } else if (time == '14:00') {
      if (dayIndex == 2) {
        return _buildClassBlock(
          context,
          'N3 Listening',
          'Yamada S.',
          const Color(0xFFA855F7),
        );
      }
    } else if (time == '19:00') {
      if (dayIndex == 3) {
        return _buildClassBlock(
          context,
          'JLPT N1 Grammar',
          'Kato S.',
          const Color(0xFF6366F1),
        );
      }
    }
    return null;
  }

  Widget _buildClassBlock(BuildContext context, String title, String teacher, Color accentColor, {bool isLive = false}) {
    return InkWell(
      onTap: () {
        final roomId = title.toLowerCase().replaceAll(' ', '-');
        context.push('/meet/login?roomId=$roomId');
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: accentColor.withValues(alpha: 0.1),
          border: Border(
            left: BorderSide(color: accentColor, width: 4),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isLive)
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: accentColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'LIVE',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                height: 1.2,
                color: AppColors.textPrimary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(
              teacher,
              style: const TextStyle(
                fontSize: 8,
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextUpcomingSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF0F172A),
        border: Border(
          top: BorderSide(color: Color(0xFF1E293B), width: 1),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'NEXT UPCOMING CLASS',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5E82BB),
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'JLPT N3 Grammar Workshop',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Today, 14:00 - 15:30 (90 min)',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF334155)),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCtmrjJzY7nYuzGQ7T3a6fb1LTRi1DBI4RJgqI6NwsRiT2TopkO946Aftl5ZN0Srvp-VUwR_bqefW0HrQ9w_zbFpREXQ5j5nIuvqElM6wC3m6sSwtNUzed_2Trb4SgyeBYBr0VTqYxZeWKRSJ2yYIiP4iOE5qay-VTPK2ErzawkucN9UeHAZ-PubKzfCA9NSEibl_YyLnTE8qm8SB_TPCu-MgmzDcwPxxtEmMxnvbbYPH-af9LzN_jdceRk8lf6M_YbObcb8gcPHsY'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () => context.push('/meet/login?roomId=biz-jp'),
              icon: const Icon(Icons.play_circle_outline_rounded, size: 18),
              label: const Text(
                'JOIN CLASS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5E82BB),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMockBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildMockNavItem(Icons.home_outlined, 'Home'),
          _buildMockNavItem(Icons.calendar_month_rounded, 'Schedule', isActive: true),
          _buildMockNavItem(Icons.import_contacts_outlined, 'Lessons'),
          _buildMockNavItem(Icons.person_outline_rounded, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildMockNavItem(IconData icon, String label, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 24,
          color: isActive ? AppColors.primary : AppColors.textTertiary,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: isActive ? AppColors.primary : AppColors.textTertiary,
          ),
        ),
      ],
    );
  }
}
