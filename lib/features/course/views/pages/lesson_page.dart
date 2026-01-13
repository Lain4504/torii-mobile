import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/lesson_model.dart';

class LessonPage extends ConsumerStatefulWidget {
  final String courseId;
  final String lessonId;
  final Lesson? lesson;

  const LessonPage({
    super.key,
    required this.courseId,
    required this.lessonId,
    this.lesson,
  });

  @override
  ConsumerState<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends ConsumerState<LessonPage> with SingleTickerProviderStateMixin {
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
    final lesson = widget.lesson;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: Column(
          children: [
            // Premium Video Header
            _buildVideoPlayer(lesson),
            
            // Lesson Info & Tabs
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(AppRadius.chip),
                          ),
                          child: Text(
                            'MODULE 3 • LESSON ${lesson?.order ?? 1}',
                            style: TextStyle(fontSize: 8, fontWeight: AppTypography.black, color: AppColors.primary, letterSpacing: 1.0),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          lesson?.title ?? 'Untitled Lesson',
                          style: const TextStyle(fontSize: 22, fontWeight: AppTypography.extraBold, letterSpacing: -0.5),
                        ),
                      ],
                    ),
                  ),
                  
                  // Zen Tabs
                  TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.primary,
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: AppColors.textPrimary,
                    unselectedLabelColor: AppColors.textTertiary,
                    dividerColor: Colors.transparent,
                    labelStyle: const TextStyle(fontWeight: AppTypography.black, fontSize: 10, letterSpacing: 2.0),
                    tabs: const [
                      Tab(text: 'OVERVIEW'),
                      Tab(text: 'CURRICULUM'),
                      Tab(text: 'RESOURCES'),
                    ],
                  ),
                  
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildOverviewTab(lesson),
                        _buildCurriculumTab(),
                        _buildResourcesTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Bottom Action Bar
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(Lesson? lesson) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1528610320207-68096fee5603?auto=format&fit=crop&q=80&w=800'),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                  ],
                ),
              ),
            ),
            
            // Play Button
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withOpacity(0.5), width: 1.5),
              ),
              child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 48),
            ),
            
            // Back Button
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            
            // Expander Button
            Positioned(
              bottom: 10,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.fullscreen_rounded, color: Colors.white),
                onPressed: () {},
              ),
            ),
            
            // Progress line
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 3,
                width: double.infinity,
                color: Colors.white.withOpacity(0.3),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.35,
                  child: Container(color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab(Lesson? lesson) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TRANSCRIPTION',
            style: TextStyle(fontSize: 10, fontWeight: AppTypography.black, letterSpacing: 2.0, color: AppColors.textTertiary),
          ),
          const SizedBox(height: 16),
          Text(
            'In this lesson, we will explore the nuances of the particles "&" and "に". These are fundamental to Japanese sentence structure and are often confused by beginners. Pay close attention to the directional application of に and the object focus of を.',
            style: TextStyle(fontSize: 15, height: 1.7, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 24),
          const SectionDivider(title: 'ZEN_LEARNING_METADATA'),
          const SizedBox(height: 16),
          _buildMetaRow(Icons.timer_outlined, 'Duration', '12:45'),
          _buildMetaRow(Icons.trending_up_rounded, 'Difficulty', 'Medium'),
          _buildMetaRow(Icons.auto_awesome_rounded, 'XP Yield', '150 XP'),
        ],
      ),
    );
  }

  Widget _buildMetaRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.primary.withOpacity(0.6)),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(fontSize: 12, color: AppColors.textTertiary)),
          const Spacer(),
          Text(value, style: const TextStyle(fontSize: 12, fontWeight: AppTypography.bold)),
        ],
      ),
    );
  }

  Widget _buildCurriculumTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.xl),
      itemCount: 5,
      itemBuilder: (context, index) {
        return _CurriculumItem(
          index: index + 1,
          title: 'Section ${index + 1}: Particle Advanced Logic',
          isCompleted: index == 0,
          isActive: index == 1,
        );
      },
    );
  }

  Widget _buildResourcesTab() {
    return const Center(child: Text('No resources available for this protocol.'));
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.only(
        left: AppSpacing.xl,
        right: AppSpacing.xl,
        top: 20,
        bottom: MediaQuery.of(context).padding.bottom + 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.xxl)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.04),
            blurRadius: 40,
            offset: const Offset(0, -10),
          ),
        ],
        border: Border(top: BorderSide(color: AppColors.borderLight.withOpacity(0.3))),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.skip_previous_rounded, color: AppColors.textTertiary),
          ),
          const Spacer(),
          ZenButton(
            text: 'COMPLETE & NEXT',
            onPressed: () {},
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.skip_next_rounded, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}

class _CurriculumItem extends StatelessWidget {
  final int index;
  final String title;
  final bool isCompleted;
  final bool isActive;

  const _CurriculumItem({
    required this.index,
    required this.title,
    this.isCompleted = false,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary.withOpacity(0.02) : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(
          color: isActive ? AppColors.primary.withOpacity(0.2) : AppColors.borderLight.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isCompleted ? AppColors.accent : (isActive ? AppColors.primary : AppColors.grey200),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: isCompleted 
                ? const Icon(Icons.check, color: Colors.white, size: 14)
                : Text('$index', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: AppTypography.black)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: isActive ? AppTypography.extraBold : AppTypography.medium,
                color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
          ),
          if (isActive)
             const Icon(Icons.graphic_eq_rounded, size: 16, color: AppColors.primary),
        ],
      ),
    );
  }
}
