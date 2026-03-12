import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';

/// Torii Nihongo Home Dashboard
/// 
/// A pixel-perfect implementation of the Stitch design.
/// Features:
/// - Exact layout and styling from the Stitch screenshot/HTML.
/// - Mock data for rapid UI prototyping.
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Background Pattern (Sakura pattern from CSS)
          Positioned.fill(
            child: CustomPaint(
              painter: _SakuraPatternPainter(),
            ),
          ),
          
          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Header (Top Header in HTML)
                _buildHeader(),

                // Search Bar
                _buildSearchBar(),

                // Continue Learning Section
                _buildContinueLearning(),

                // Course Categories
                _buildCategories(),

                // Recommended Courses
                _buildRecommendedCourses(),

                // Live Seminars
                _buildLiveSeminars(),

                // Bottom padding for nav bar
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // User Avatar with Level Badge
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2), width: 2),
                      ),
                      child: const CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAKv1LfmgXOMQFbTVWgVv-hNZOCH94G_t3HAqnX7iOfICewsz1ib9zvoSUvnJOX64V9zKUEjLoY_T8ee1fcKM1zMjXRtBi5mKQN1r_-VjTbvqYyrENMP8dCSAs6RvkJiLBXKdYWPj2_haL1FtqrQTJNgZpwA9o5U0fi1meAswtadmWla4CLDWgDt2CHnsKWP3U--Lw4qPr8RE6qc0fffdhjJsh6Y21V2otWsJyqmQozstn1UMIEuwHnujfS73SkWvaj3BmnXWZBVxs'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                      child: const Text(
                        'LV 12',
                        style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ohayou, Alex!',
                      style: TextStyle(color: Color(0xFF64748B), fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.bolt_rounded, color: AppColors.primary, size: 16),
                        const SizedBox(width: 2),
                        Text(
                          '1,240 XP',
                          style: TextStyle(color: AppColors.deepBlue, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // Notification Button
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2)),
                ],
                border: Border.all(color: const Color(0xFFF1F5F9)),
              ),
              child: const Icon(Icons.notifications_none_rounded, color: Color(0xFF475569), size: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2)),
            ],
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search courses, kanji, or grammar...',
              hintStyle: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
              prefixIcon: Icon(Icons.search_rounded, color: Color(0xFF94A3B8)),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContinueLearning() {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Continue Learning',
                  style: TextStyle(color: AppColors.deepBlue, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'View Plan',
                  style: TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(color: AppColors.primary.withValues(alpha: 0.05), blurRadius: 20, offset: const Offset(0, 10)),
                ],
                border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
              ),
              child: Stack(
                children: [
                  // Decorative Icon (temple_buddhist in HTML)
                  Positioned(
                    right: -20,
                    bottom: -20,
                    child: Opacity(
                      opacity: 0.05,
                      child: Icon(Icons.temple_buddhist_rounded, size: 80, color: AppColors.primary),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(Icons.translate_rounded, color: AppColors.primary, size: 36),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'N5 FOUNDATIONS',
                                  style: TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Japanese Basics II',
                                  style: TextStyle(color: AppColors.deepBlue, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Lesson 4: Hiragana Mastery',
                                  style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: ProgressBar(
                                        progress: 0.75,
                                        height: 8,
                                        progressColor: Color(0xFF87C744),
                                        backgroundColor: Color(0xFFF1F5F9),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      '75%',
                                      style: TextStyle(color: Color(0xFF87C744), fontSize: 12, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF87C744),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          minimumSize: const Size(double.infinity, 50),
                          elevation: 0,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.play_circle_rounded),
                            SizedBox(width: 8),
                            Text('Resume Lesson', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
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
    );
  }

  Widget _buildCategories() {
    final categories = [
      {'name': 'Kanji', 'icon': Icons.edit_note_rounded},
      {'name': 'Grammar', 'icon': Icons.menu_book_rounded},
      {'name': 'JLPT Prep', 'icon': Icons.school_rounded},
      {'name': 'Conv.', 'icon': Icons.record_voice_over_rounded},
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: categories.map((cat) => _buildCategoryItem(cat)).toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(Map<String, dynamic> cat) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFE6F6F4), // accent-teal bg from HTML
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(cat['icon'] as IconData, color: const Color(0xFF02A190), size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          cat['name'] as String,
          style: const TextStyle(color: Color(0xFF475569), fontSize: 11, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildRecommendedCourses() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended Courses',
                  style: TextStyle(color: AppColors.deepBlue, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.chevron_right_rounded, color: Color(0xFF94A3B8)),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const BouncingScrollPhysics(),
              children: [
                _buildCourseCard(
                  image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBu0e-1gSL8-7q6lxIgQdS2AxIc38cU-X2icnup3DtpG_Z8ETOtWJytTwF_2pkNquMX0QLRZjK_CQybdoqKrcaAQ18JK3TX3pOGqcXwNw8UIT9EdhXsu7nE8CNLehikevVfaojZHudibzcY3fAGBIFQlO360RK4ZYO9RhaBg6q6krk8ad2v3Uit9aflhSf-R0kyo8EBJJchxfNUv_eOGe6_B7qn5nAVAGNyB34Mz4lg7B943N-pwkTt6FJH9coMjVfQ-DgWoTgLuoc',
                  badge: 'N5 BEGINNER',
                  badgeColor: AppColors.deepBlue,
                  title: 'Traveler\'s Survival Kit',
                  rating: '4.9 (2.4k)',
                  price: '\$24.99',
                ),
                _buildCourseCard(
                  image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDKSST6W0_FJmh9iYRJrxxkFm4fYxgHCRmz1XYtZblZgqqUA0T8qMMYj6GtYcxCOeDwKNs4TQ0VMbC36HuJtEcJOSp5EuyNQOXPp2hTrUczU5xfw2uz8V_bamcPb70U4tqrioTCsp3qnmwcCM_AocLC8ethU0oPlKLuUL0M4Ufc4ZY5pbVPXCzmgNWDmNeMTVLVxAyoDR0O5DIEnEzGbqGZB_NECHZfswwncB5MIi77KnN3EyI3T3qmzzPcyUvWkDrJBjlaI2BEAwg',
                  badge: 'N4 INTERMEDIATE',
                  badgeColor: AppColors.primary,
                  title: 'Business Etiquette 101',
                  rating: '4.7 (1.8k)',
                  price: '\$32.00',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard({
    required String image,
    required String badge,
    required Color badgeColor,
    required String title,
    required String rating,
    required String price,
  }) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Stack(
              children: [
                Image.network(image, height: 130, width: double.infinity, fit: BoxFit.cover),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: badgeColor.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: AppColors.deepBlue, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(color: Color(0xFF64748B), fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.add_shopping_cart_rounded, color: AppColors.primary, size: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveSeminars() {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Live Seminars',
                  style: TextStyle(color: AppColors.deepBlue, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Calendar',
                  style: TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildSeminarItem(
              month: 'OCT',
              day: '24',
              title: 'Common Kanji Mistakes',
              time: '18:00 JST • 45 mins',
            ),
            const SizedBox(height: 12),
            _buildSeminarItem(
              month: 'OCT',
              day: '27',
              title: 'JLPT N4 Speed Reading',
              time: '10:00 JST • 60 mins',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeminarItem({
    required String month,
    required String day,
    required String title,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  month,
                  style: const TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold),
                ),
                Text(
                  day,
                  style: TextStyle(color: AppColors.deepBlue, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: AppColors.deepBlue, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  time,
                  style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
            ),
            child: const Icon(Icons.event_available_rounded, color: AppColors.primary, size: 18),
          ),
        ],
      ),
    );
  }
}

class _SakuraPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.05)
      ..style = PaintingStyle.fill;

    const spacing = 24.0;
    for (double i = 0; i < size.width; i += spacing) {
      for (double j = 0; j < size.height; j += spacing) {
        // Drawing small dots to mimic the radial gradient pattern
        canvas.drawCircle(Offset(i, j), 1.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
