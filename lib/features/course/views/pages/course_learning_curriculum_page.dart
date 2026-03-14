import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';

// ========== Mock data (UI only, no API) ==========
List<_LessonItem> get _mockModule1Lessons => [
  _LessonItem(title: 'Welcome to the Course', duration: '3 min', type: _LessonType.video, status: _LessonStatus.completed),
  _LessonItem(title: 'What is Zen Leadership', duration: '6 min', type: _LessonType.video, status: _LessonStatus.inProgress),
  _LessonItem(title: 'Core Philosophy', duration: '8 min', type: _LessonType.document, status: _LessonStatus.notStarted),
  _LessonItem(title: 'Module 1 Assessment', duration: '10 min', type: _LessonType.quiz, status: _LessonStatus.locked),
];
List<_LessonItem> get _mockModule2Lessons => [
  _LessonItem(title: 'Introduction to Mindfulness', duration: '5 min', type: _LessonType.video, status: _LessonStatus.notStarted),
  _LessonItem(title: 'Daily Practice Guide', duration: '12 min', type: _LessonType.document, status: _LessonStatus.locked),
  _LessonItem(title: 'Mindfulness in Meetings', duration: '8 min', type: _LessonType.video, status: _LessonStatus.locked),
  _LessonItem(title: 'Case Study: Tech Company', duration: '10 min', type: _LessonType.document, status: _LessonStatus.locked),
  _LessonItem(title: 'Module 2 Quiz', duration: '10 min', type: _LessonType.quiz, status: _LessonStatus.locked),
];
List<_LessonItem> get _mockModule3Lessons => [
  _LessonItem(title: 'What is Emotional Intelligence', duration: '7 min', type: _LessonType.video, status: _LessonStatus.locked),
  _LessonItem(title: 'Self-Awareness', duration: '10 min', type: _LessonType.video, status: _LessonStatus.locked),
  _LessonItem(title: 'Reading: EQ Framework', duration: '15 min', type: _LessonType.document, status: _LessonStatus.locked),
  _LessonItem(title: 'Managing Emotions', duration: '12 min', type: _LessonType.video, status: _LessonStatus.locked),
  _LessonItem(title: 'Empathy at Work', duration: '8 min', type: _LessonType.video, status: _LessonStatus.locked),
  _LessonItem(title: 'Module 3 Assessment', duration: '20 min', type: _LessonType.quiz, status: _LessonStatus.locked),
];

/// Zen-style Course Learning Curriculum Page (After Enrollment)
/// Mock data only – no API calls. For UI development.
class CourseLearningCurriculumPage extends StatelessWidget {
  final String courseId;

  const CourseLearningCurriculumPage({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildSliverAppBar(context),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: _buildCourseStats()),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildModuleAccordion(
                  context,
                  title: 'Module 1: Introduction to Zen Leadership',
                  lessonsCount: _mockModule1Lessons.length,
                  duration: '25 min',
                  isExpanded: true,
                  lessons: _mockModule1Lessons,
                ),
                _buildModuleAccordion(
                  context,
                  title: 'Module 2: Mindfulness in Management',
                  lessonsCount: _mockModule2Lessons.length,
                  duration: '45 min',
                  isExpanded: false,
                  lessons: _mockModule2Lessons,
                ),
                _buildModuleAccordion(
                  context,
                  title: 'Module 3: Emotional Intelligence',
                  lessonsCount: _mockModule3Lessons.length,
                  duration: '1h 10m',
                  isExpanded: false,
                  lessons: _mockModule3Lessons,
                ),
              ]),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      pinned: true,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF1F3E72), size: 18),
        onPressed: () => context.pop(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert_rounded, color: Color(0xFF1F3E72), size: 22),
          onPressed: () {},
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Background Pattern
            Positioned.fill(
              child: Opacity(
                opacity: 0.05,
                child: Image.network(
                  "https://www.transparenttextures.com/patterns/japanese-sayagata.png",
                  repeat: ImageRepeat.repeat,
                ),
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 100, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Thumbnail
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuCakAi0uaOlj1M8Avg9OqykxZYM5wzdnp9ailjzFQrRKvuq5d8sw0rrI_FWJ_D1kTBNwwsT-dTfVdK90RnJN2QOKYyX0NFyeOTZDZDcy24enMHDnTJUwWh2RkBm8OEWIWMj3KUDRpQQvbzAGY79cIa_VsL_EAuZWYcqCRT0TlMy8DmjuVgPhGSsTIDg2N_pI6qb1UMrQL-ImcNI0CYMwZq9wzMAstUxU-rbtbtIzObw4FPSUf8g3lX4qBJehcP9ByGlYwjFkhzy-QA",
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Master Zen Leadership',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1F3E72),
                      fontFamily: 'Lexend',
                    ),
                  ),
                  const Text(
                    'By Zen Leader Team',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF5E82BB),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  const Spacer(),
                  
                  // Progress Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'PROGRESS: 35% COMPLETED',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1F3E72),
                          letterSpacing: 1.0,
                          fontFamily: 'Lexend',
                        ),
                      ),
                      _buildDesignButton(
                        context, 
                        'Continue Learning', 
                        () => context.push('/learning/course-1/lesson-2'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const LinearProgressIndicator(
                      value: 0.35,
                      minHeight: 8,
                      backgroundColor: Color(0xFFE2E8F0),
                      valueColor: AlwaysStoppedAnimation(Color(0xFF87C744)),
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

  Widget _buildCourseStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF5E82BB).withValues(alpha: 0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatItem('8', 'Modules'),
            _buildStatDivider(),
            _buildStatItem('42', 'Lessons'),
            _buildStatDivider(),
            _buildStatItem('5h 30m', 'Duration'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1F3E72),
            fontFamily: 'Lexend',
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w600,
            fontFamily: 'Lexend',
          ),
        ),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(
      height: 20,
      width: 1,
      color: const Color(0xFFCBD5E1),
    );
  }

  Widget _buildModuleAccordion(
    BuildContext context, {
    required String title,
    required int lessonsCount,
    required String duration,
    bool isExpanded = false,
    List<_LessonItem>? lessons,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Color(0xFF1F3E72),
                fontFamily: 'Lexend',
              ),
            ),
            subtitle: Text(
              '$lessonsCount lessons • $duration',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                fontFamily: 'Lexend',
              ),
            ),
            trailing: Icon(
              isExpanded ? Icons.expand_less_rounded : Icons.expand_more_rounded,
              color: const Color(0xFF5E82BB),
            ),
          ),
          if (isExpanded && lessons != null) ...[
            const Divider(height: 1, indent: 24, endIndent: 24),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: lessons.map((lesson) => _buildLessonRow(context, lesson)).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLessonRow(BuildContext context, _LessonItem lesson) {
    IconData iconData;
    switch (lesson.type) {
      case _LessonType.video:
        iconData = Icons.play_circle_fill_rounded;
        break;
      case _LessonType.document:
        iconData = Icons.description_rounded;
        break;
      case _LessonType.quiz:
        iconData = Icons.quiz_rounded;
        break;
    }

    Color statusColor = const Color(0xFF64748B);
    Widget statusWidget;

    switch (lesson.status) {
      case _LessonStatus.completed:
        statusWidget = const Icon(Icons.check_circle_rounded, color: Color(0xFF87C744), size: 20);
        break;
      case _LessonStatus.inProgress:
        statusWidget = Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF5E82BB).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'In progress',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: Color(0xFF5E82BB),
              fontFamily: 'Lexend',
            ),
          ),
        );
        break;
      case _LessonStatus.locked:
        statusWidget = const Icon(Icons.lock_rounded, color: Color(0xFFCBD5E1), size: 20);
        break;
      case _LessonStatus.notStarted:
        statusWidget = const Icon(Icons.circle_outlined, color: Color(0xFFCBD5E1), size: 20);
        break;
    }

    return ListTile(
      onTap: lesson.status == _LessonStatus.locked ? null : () {
        context.push('/learning/course-1/lesson-1');
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: lesson.status == _LessonStatus.inProgress 
              ? const Color(0xFF5E82BB).withValues(alpha: 0.1)
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          iconData, 
          color: lesson.status == _LessonStatus.inProgress ? const Color(0xFF5E82BB) : const Color(0xFF64748B), 
          size: 20
        ),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: lesson.status == _LessonStatus.inProgress ? FontWeight.w700 : FontWeight.w600,
          color: lesson.status == _LessonStatus.locked ? const Color(0xFF94A3B8) : const Color(0xFF1F3E72),
          fontFamily: 'Lexend',
        ),
      ),
      subtitle: Text(
        lesson.duration,
        style: const TextStyle(
          fontSize: 11,
          color: Color(0xFF94A3B8),
          fontFamily: 'Lexend',
        ),
      ),
      trailing: statusWidget,
    );
  }

  Widget _buildDesignButton(BuildContext context, String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF5E82BB),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF5E82BB).withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 16),
            const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 12,
                fontFamily: 'Lexend',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _LessonType { video, document, quiz }
enum _LessonStatus { completed, inProgress, notStarted, locked }

class _LessonItem {
  final String title;
  final String duration;
  final _LessonType type;
  final _LessonStatus status;

  _LessonItem({
    required this.title,
    required this.duration,
    required this.type,
    required this.status,
  });
}
