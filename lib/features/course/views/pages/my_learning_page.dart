import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';

/// My Learning Page - Design aligned with Live Schedule (system design).
class MyLearningPage extends StatelessWidget {
  const MyLearningPage({super.key});

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
          'My Courses',
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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          // Content Sections
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Continue Learning
                  const Text(
                    'CONTINUE LEARNING',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      letterSpacing: 1.2,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildHeroCard(context),
                  const SizedBox(height: 32),
                  // Enrolled Courses Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ALL ENROLLED COURSES',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                          letterSpacing: 1.2,
                          fontFamily: 'Lexend',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Row(
                          children: [
                            Text(
                              'Filter',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textTertiary,
                                fontFamily: 'Lexend',
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.filter_list_rounded, size: 16, color: AppColors.textTertiary),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildCourseList(context),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroCard(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/learning/1'),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
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
            // Aspect Ratio Image
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuB7MTpaylLZWVyyavw69TqX7wHrVwChpRjZcj3ghemHElWxGq0OA3xyC_5Sy2ReXvGb0c1LMclDl6IGHN18MhnZzqg92fzC4Ya4fO4LDzy3Ier2zMEDGFHiwOcuPEHj493M6eMv2jA7ejX_EfSpwhVI1wS2bb2Bl_rY3B9D2QInZtt_nAep3s4yqsK_8K_aayO_sG0Yzr1ZfaRYQauGDEW1PGpMf0KpKUhM8wGR3Z0r57wu_lgyZYOORFH9CrpBf8DPWCqjsRC80hc',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'JLPT N5 Kanji Mastery',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                            fontFamily: 'Lexend',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          '35%',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                            fontFamily: 'Lexend',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Instructor: Kenji Tanaka',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textTertiary,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.35,
                      minHeight: 6,
                      backgroundColor: AppColors.grey100,
                      valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: () => context.push('/learning/1'),
                      icon: const Icon(Icons.play_circle_rounded, size: 20),
                      label: const Text(
                        'Continue Lesson',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textOnPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
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

  Widget _buildCourseList(BuildContext context) {
    final courses = [
      {
        'title': 'Basic Grammar & Particles',
        'instructor': 'Yumi Sato',
        'progress': 0.8,
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuA6cHwTqdXQv-V8pQlK4hJmQntVrVPmttQD0LPRytZjOqOcPMrnurUNPRRwnAis-sqY_61krXOf3vUIWhGgWeIgZhx9Z34YUqm39i6jvfSD-t1f-1Rd4QmxNLyHbud_lw8w9nDAH0zbVBg5H77znSCAtkxSDQTyqimP5S4umknagpvWcHkiY9GXlfd8ijWAOpNouZ5sHDKhC3FD39u6wFIOLfnou97jd8dcfEEtEEskjCuA_xtd0Fa4yYk1gE5u4rBDjHa5r-nKEfw',
      },
      {
        'title': 'Conversational Business Japanese',
        'instructor': 'Hiroshi Yamamoto',
        'progress': 0.12,
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBrzmyUeABahUqMcwc81iTg9hUIql_JIY8MNbHdEupJYhZoWl22aGcPCKRjPYvCD3tH7zXkDQ8VlinPjvoHX8kF9NQjKEXU-dh-qq2t3dizcDgdzPWCKwUi_wAlCjnMD7QurzRaVns29-KC9CPAxfrcGJ2wUmX2nhTMNXjf5whLjdc8L90M5G_88yRLrFsWRS6AHS_h3kulisGBULB-FpcXBhQxlFpX5h48xvwU3L5oAjxFbvt_dwcsHHKBM6ir99HlD3oJTlb6OY8',
      },
      {
        'title': 'Mastering Katakana & Hiragana',
        'instructor': 'Emi Suzuki',
        'progress': 1.0,
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCGHwtU7GFzfGgVZuz-UL1N2XHounwQPr20hdLnRXwk8Uv9e8yEkukQfvS8Co_HIUDX6A0fvH_53HR9Vhl3uM96DBhsvdOZKGFlsCyNYSRaacQ4CKVQwSVcwmKX6UUFBPJ6T3QX4SfjhqJywAhwrxKM1jsHc8ifoVDBplH9KHDcZmBzpUPaYabKg2BHsFf_Z60ztDGOe4yZ6crwvUwMhuuOz67YrZhlvENHcCl4F0w42kViYXR7MlFyp8Rxv5sJlxts5rjoRsXUy3c',
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: courses.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final course = courses[index];
        return _buildCourseCard(context, course);
      },
    );
  }

  Widget _buildCourseCard(BuildContext context, Map<String, dynamic> course) {
    final double progress = course['progress'] as double;
    final bool isCompleted = progress >= 1.0;

    return GestureDetector(
      onTap: () => context.push('/learning/1'),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  course['image'] as String,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course['title'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                        fontFamily: 'Lexend',
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      course['instructor'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textTertiary,
                        fontFamily: 'Lexend',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${(progress * 100).toInt()}% Complete',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: isCompleted ? AppColors.success : AppColors.textTertiary,
                            fontFamily: 'Lexend',
                          ),
                        ),
                        if (isCompleted)
                          const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 14),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 5,
                        backgroundColor: AppColors.grey100,
                        valueColor: AlwaysStoppedAnimation(
                          isCompleted ? AppColors.success : AppColors.primary,
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
    );
  }
}
