import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class LiveSchedulePage extends ConsumerStatefulWidget {
  const LiveSchedulePage({super.key});

  @override
  ConsumerState<LiveSchedulePage> createState() => _LiveSchedulePageState();
}

class _LiveSchedulePageState extends ConsumerState<LiveSchedulePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey50,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Live Classes',
          style: TextStyle(
            color: AppColors.secondary,
            fontWeight: AppTypography.black,
            fontSize: 24,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                bottom: BorderSide(color: AppColors.borderLight, width: 1),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: false,
              indicatorColor: AppColors.primary,
              indicatorWeight: 3,
              labelPadding: EdgeInsets.zero,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textTertiary,
              labelStyle: const TextStyle(fontWeight: AppTypography.bold, fontSize: 14),
              tabs: const [
                Tab(text: 'Today'),
                Tab(text: 'This Week'),
                Tab(text: 'Upcoming'),
              ],
            ),
          ),
        ),
      ),
      body: AppBackground(
        pattern: BackgroundPattern.checkerboard,
        child: TabBarView(
          controller: _tabController,
          children: [
             _buildClassList([
              LiveClass(
                title: 'JLPT N3 Grammar Workshop',
                teacherName: 'Tanaka Sensei',
                teacherAvatar: 'https://i.pravatar.cc/150?u=tanaka',
                startTime: DateTime.now().add(const Duration(minutes: 15)),
                duration: '60 min',
                isLive: true,
              ),
              LiveClass(
                title: 'Business Japanese: Emails & Meetings',
                teacherName: 'Sato Sensei',
                teacherAvatar: 'https://i.pravatar.cc/150?u=sato',
                startTime: DateTime.now().add(const Duration(hours: 3)),
                duration: '45 min',
                isLive: false,
              ),
            ]),
            _buildClassList([
              LiveClass(
                title: 'Kanji Mastery for Beginners',
                teacherName: 'Suzuki Sensei',
                teacherAvatar: 'https://i.pravatar.cc/150?u=suzuki',
                startTime: DateTime.now().add(const Duration(days: 2)),
                duration: '90 min',
                isLive: false,
              ),
            ]),
            _buildClassList([
              LiveClass(
                title: 'Advanced Conversation Course',
                teacherName: 'Ito Sensei',
                teacherAvatar: 'https://i.pravatar.cc/150?u=ito',
                startTime: DateTime.now().add(const Duration(days: 10)),
                duration: '60 min',
                isLive: false,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildClassList(List<LiveClass> classes) {
    if (classes.isEmpty) {
      return const Center(child: Text('No live classes scheduled for this period.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: classes.length,
      itemBuilder: (context, index) {
        final item = classes[index];
        return EntryAnimation(
          index: index,
          child: _LiveClassCard(item: item),
        );
      },
    );
  }
}

class LiveClass {
  final String title;
  final String teacherName;
  final String teacherAvatar;
  final DateTime startTime;
  final String duration;
  final bool isLive;

  LiveClass({
    required this.title,
    required this.teacherName,
    required this.teacherAvatar,
    required this.startTime,
    required this.duration,
    required this.isLive,
  });
}

class _LiveClassCard extends StatelessWidget {
  final LiveClass item;

  const _LiveClassCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: AppElevation.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
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
                          if (item.isLive)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              margin: const EdgeInsets.only(bottom: AppSpacing.xs),
                              decoration: BoxDecoration(
                                color: AppColors.error,
                                borderRadius: BorderRadius.circular(AppRadius.xs),
                              ),
                              child: const Text(
                                'LIVE',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: AppTypography.bold,
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(item.teacherAvatar),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    const Icon(Icons.person_outline, size: 16, color: AppColors.textTertiary),
                    const SizedBox(width: 4),
                    Text(
                      item.teacherName,
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                    ),
                    const SizedBox(width: AppSpacing.lg),
                    const Icon(Icons.access_time, size: 16, color: AppColors.textTertiary),
                    const SizedBox(width: 4),
                    Text(
                      item.duration,
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 16, color: AppColors.textTertiary),
                    const SizedBox(width: 4),
                    Text(
                      _formatDate(item.startTime),
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, fontWeight: AppTypography.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.borderLight),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: item.isLive ? 'JOIN CLASS' : 'VIEW DETAILS',
                    onPressed: () {
                      if (item.isLive) {
                        context.push('/meet/login?roomId=room01');
                      } else {
                        // View details logic
                      }
                    },
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    type: item.isLive
                        ? AppButtonType.primary
                        : AppButtonType.outline,
                    isFullWidth: true,
                  ),
                ),
                if (!item.isLive) ...[
                  const SizedBox(width: AppSpacing.md),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.event_available_outlined),
                    color: AppColors.primary,
                    tooltip: 'Add to Calendar',
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    // Simple format for demo
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${date.day} ${months[date.month - 1]}, ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}
