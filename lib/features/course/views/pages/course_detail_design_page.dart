import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

/// Static Course Detail Design based on Stitch
/// This page strictly follows the design and uses hardcoded data.

class CourseDetailDesignPage extends StatelessWidget {
  const CourseDetailDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Top Navigation
          SliverAppBar(
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.white.withValues(alpha: 0.8),
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF1F3E72), size: 18),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            title: const Text(
              'Course Details',
              style: TextStyle(
                color: Color(0xFF1F3E72),
                fontWeight: FontWeight.w700,
                fontSize: 18,
                fontFamily: 'Lexend',
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share_outlined, color: Color(0xFF1F3E72), size: 22),
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Divider(height: 1, color: const Color(0xFF5E82BB).withValues(alpha: 0.1)),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              decoration: _japaneseGridDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Section (Banner)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        image: const DecorationImage(
                          image: NetworkImage("https://lh3.googleusercontent.com/aida-public/AB6AXuCakAi0uaOlj1M8Avg9OqykxZYM5wzdnp9ailjzFQrRKvuq5d8sw0rrI_FWJ_D1kTBNwwsT-dTfVdK90RnJN2QOKYyX0NFyeOTZDZDcy24enMHDnTJUwWh2RkBm8OEWIWMj3KUDRpQQvbzAGY79cIa_VsL_EAuZWYcqCRT0TlMy8DmjuVgPhGSsTIDg2N_pI6qb1UMrQL-ImcNI0CYMwZq9wzMAstUxU-rbtbtIzObw4FPSUf8g3lX4qBJehcP9ByGlYwjFkhzy-QA"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // Title & Badges
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _buildDesignBadge('JLPT N5', const Color(0xFF5E82BB)),
                            const SizedBox(width: 8),
                            _buildDesignBadge('Best Seller', const Color(0xFF1F3E72)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Mastering JLPT N5 Grammar',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1F3E72),
                            height: 1.2,
                            fontFamily: 'Lexend',
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Comprehensive guide to essential Japanese grammar structures for the JLPT N5 level with practical examples.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF64748B),
                            height: 1.5,
                            fontFamily: 'Lexend',
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Stats Row
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFF5E82BB).withValues(alpha: 0.05)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          _buildStatItem(Icons.star_rounded, '4.9', 'RATING', true, color: Colors.amber),
                          _buildStatItem(Icons.people_rounded, '1.2k', 'STUDENTS', true),
                          _buildStatItem(Icons.schedule_rounded, '15h', 'DURATION', true),
                          _buildStatItem(Icons.description_rounded, 'N5', 'LEVEL', false),
                        ],
                      ),
                    ),
                  ),

                  // Instructor Section
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your Instructor',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1F3E72),
                            fontFamily: 'Lexend',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFF5E82BB).withValues(alpha: 0.05)),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  "https://lh3.googleusercontent.com/aida-public/AB6AXuDFY3O1YkEMG2SvLKMkINiGp-D0iqaMxNzX5SKGEOyqQo2LUueBNR3qbJtkgd6ZLpZRGWw60edavmUrnVyP2Gum-js_HgtC0oNwrmdGps_I_OWwGY6VRmGLf6PzyPka58MX10srHkr5YQIFCWWmvKgS7YeWfUR6oAGgQKy9DVg6F7a5-Q3AHJKSF-u9mpd3wRsCJ3OQ6od5QIBgS_oj9YM6LftRwy2cG4vcKXLJC9wKDSCIBfo21JpboSwCCl5hlB6_SdAA-2BjZyY",
                                  width: 64,
                                  height: 64,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Kenji Tanaka',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF1F3E72),
                                      fontFamily: 'Lexend',
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '10 years experience, JLPT N1',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: const Color(0xFF5E82BB),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Lexend',
                                    ),
                                  ),
                                  const Text(
                                    'Certified Native Speaker',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF64748B),
                                      fontFamily: 'Lexend',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // What you will learn
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'What you will learn',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1F3E72),
                            fontFamily: 'Lexend',
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildLearningItem('Basic sentence structures (SOV) and particles (Wa, Ga, O, Ni)'),
                        _buildLearningItem('Conjugating verbs into polite (~masu) and dictionary forms'),
                        _buildLearningItem('Adjective classes (i-adjectives vs na-adjectives)'),
                        _buildLearningItem('Essential daily expressions and question formation'),
                      ],
                    ),
                  ),

                  // Curriculum
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Curriculum',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1F3E72),
                                fontFamily: 'Lexend',
                              ),
                            ),
                            Text(
                              '24 LESSONS',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF5E82BB),
                                letterSpacing: 1.0,
                                fontFamily: 'Lexend',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        
                        // Module 1
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFF5E82BB).withValues(alpha: 0.05)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Module 1: Getting Started',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Color(0xFF1F3E72),
                                      fontFamily: 'Lexend',
                                    ),
                                  ),
                                  Text(
                                    '4 LESSONS',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[400],
                                      fontFamily: 'Lexend',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              _buildLessonItem(Icons.play_circle_rounded, 'Intro to Japanese Particles', 'Video • 12:45', const Color(0xFF5E82BB)),
                              const SizedBox(height: 16),
                              _buildLessonItem(Icons.quiz_rounded, "Particle 'Wa' vs 'Ga' Quiz", 'Quiz • 5 Questions', const Color(0xFF10B981)),
                              const SizedBox(height: 16),
                              _buildLessonItem(Icons.edit_note_rounded, 'Writing Practice: Simple Sentences', 'Practice • 20:00', const Color(0xFFF59E0B)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Module 2 Collapsed
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey[200]!),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Module 2: Verb Foundations',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                  fontFamily: 'Lexend',
                                ),
                              ),
                              Icon(Icons.expand_more_rounded, color: Colors.grey[400]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Requirements
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Requirements',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1F3E72),
                            fontFamily: 'Lexend',
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildRequirementItem('Ability to read Hiragana and Katakana fluently'),
                        _buildRequirementItem('Approximately 100 basic Japanese vocabulary words'),
                        _buildRequirementItem('No prior grammar knowledge required'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildStickyBottomBar(context),
    );
  }

  Decoration _japaneseGridDecoration() {
    return const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage("https://www.transparenttextures.com/patterns/pinstripe-light.png"), // Simplified grid pattern
        opacity: 0.05,
        repeat: ImageRepeat.repeat,
      ),
    );
  }

  Widget _buildDesignBadge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.0,
          fontFamily: 'Lexend',
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label, bool hasDivider, {Color? color}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: hasDivider ? Border(right: BorderSide(color: Colors.grey[100]!)) : null,
        ),
        child: Column(
          children: [
            Icon(icon, color: color ?? const Color(0xFF5E82BB), size: 24),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1F3E72),
                fontFamily: 'Lexend',
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[400],
                fontWeight: FontWeight.w700,
                fontFamily: 'Lexend',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_rounded, size: 20, color: Color(0xFF5E82BB)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF334155),
                height: 1.4,
                fontFamily: 'Lexend',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonItem(IconData icon, String title, String subtitle, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F3E72),
                fontFamily: 'Lexend',
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[400],
                fontWeight: FontWeight.w500,
                fontFamily: 'Lexend',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRequirementItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              color: Color(0xFF64748B),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF64748B),
                fontFamily: 'Lexend',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStickyBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 20, MediaQuery.of(context).padding.bottom + 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TOTAL PRICE',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[400],
                  letterSpacing: 1.5,
                  fontFamily: 'Lexend',
                ),
              ),
              const Text(
                '\$49.99',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1F3E72),
                  fontFamily: 'Lexend',
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFF5E82BB),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF5E82BB).withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Enroll Course',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: 'Lexend',
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
