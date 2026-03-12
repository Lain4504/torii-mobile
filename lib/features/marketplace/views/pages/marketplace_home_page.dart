import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';

class MarketplaceHomePage extends ConsumerStatefulWidget {
  const MarketplaceHomePage({super.key});

  @override
  ConsumerState<MarketplaceHomePage> createState() => _MarketplaceHomePageState();
}

class _MarketplaceHomePageState extends ConsumerState<MarketplaceHomePage> {
  final List<String> _categories = [
    'JLPT N5',
    'JLPT N4',
    'Hán tự',
    'Ngữ pháp',
    'Giao tiếp',
    'Nghe hiểu',
  ];
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        pattern: BackgroundPattern.checkerboard,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // ----------------------------------------------------------------------
              // Top Navigation: Logo, Search Bar, Profile
              // ----------------------------------------------------------------------
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    children: [
                      const ToriiIcon(size: 32),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => context.push('/marketplace/discovery'),
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(AppRadius.sm),
                              border: Border.all(color: AppColors.borderLight),
                              boxShadow: AppElevation.softShadow,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                            child: const Row(
                              children: [
                                Icon(Icons.search, color: AppColors.textSecondary, size: 18),
                                SizedBox(width: AppSpacing.sm),
                                Expanded(
                                  child: Text(
                                    'Tìm khóa học...',
                                    style: TextStyle(color: AppColors.textTertiary, fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      const CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=torii_user'),
                      ),
                    ],
                  ),
                ),
              ),

              // ----------------------------------------------------------------------
              // Section 1: Hero Banner
              // ----------------------------------------------------------------------
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: EntryAnimation(
                    index: 0,
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.secondary, AppColors.primary],
                        ),
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                        boxShadow: AppElevation.mediumShadow,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: -20,
                            bottom: -20,
                            child: Opacity(
                              opacity: 0.1,
                              child: Icon(Icons.language, size: 150, color: AppColors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Chinh phục Tiếng Nhật\nngay hôm nay!',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 22,
                                    fontWeight: AppTypography.bold,
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.md),
                                GestureDetector(
                                  onTap: () => context.push('/marketplace/discovery'),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppSpacing.md,
                                      vertical: AppSpacing.xs,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.accent,
                                      borderRadius: BorderRadius.circular(AppRadius.xs),
                                    ),
                                    child: const Text(
                                      'Khám phá ngay',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: AppTypography.bold,
                                        fontSize: 12,
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
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),

              // ----------------------------------------------------------------------
              // Section 2: Continue Learning
              // ----------------------------------------------------------------------
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader('Tiếp tục học tập'),
                      const SizedBox(height: AppSpacing.md),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildContinueCard(
                              'Ngữ pháp N4 cơ bản',
                              'Học phần 12: Kính ngữ',
                              0.45,
                              '45%',
                            ),
                            const SizedBox(width: AppSpacing.md),
                            _buildContinueCard(
                              'Hán tự N5 cấp tốc',
                              'Bài 5: Các hán tự số',
                              0.8,
                              '80%',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),

              // ----------------------------------------------------------------------
              // Section 3: Recommended Courses
              // ----------------------------------------------------------------------
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSectionHeader('Khóa học đề xuất'),
                          TextButton(
                            onPressed: () => context.push('/marketplace/discovery'),
                            child: const Text('Xem tất cả', style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.sm),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.72,
                    crossAxisSpacing: AppSpacing.md,
                    mainAxisSpacing: AppSpacing.md,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _buildCourseCard(index),
                    childCount: 4,
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),

              // ----------------------------------------------------------------------
              // Section 4: Course Categories
              // ----------------------------------------------------------------------
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader('Danh mục khóa học'),
                      const SizedBox(height: AppSpacing.md),
                      Wrap(
                        spacing: AppSpacing.sm,
                        runSpacing: AppSpacing.xs,
                        children: List.generate(_categories.length, (index) {
                          final isSelected = _selectedCategoryIndex == index;
                          return ChoiceChip(
                            label: Text(_categories[index]),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() => _selectedCategoryIndex = index);
                            },
                            backgroundColor: AppColors.white,
                            selectedColor: AppColors.primary,
                            labelStyle: TextStyle(
                              color: isSelected ? AppColors.white : AppColors.secondary,
                              fontWeight: isSelected ? AppTypography.bold : AppTypography.medium,
                              fontSize: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppRadius.xs),
                              side: BorderSide(
                                color: isSelected ? AppColors.primary : AppColors.borderLight,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),

              // ----------------------------------------------------------------------
              // Section 5: Upcoming Live Seminars
              // ----------------------------------------------------------------------
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader('Live Seminar sắp tới'),
                      const SizedBox(height: AppSpacing.md),
                      _buildSeminarCard(
                        'Chiến thuật thi JLPT N3',
                        'Ngày mai, 19:00',
                        'Sensei Tanaka',
                      ),
                      const SizedBox(height: AppSpacing.md),
                      _buildSeminarCard(
                        'Bí kíp học 2000 Hán tự',
                        'Thứ 7, 14:00',
                        'Sensei Linh',
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxxl)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: AppTypography.bold,
        color: AppColors.secondary,
        letterSpacing: -0.5,
      ),
    );
  }

  Widget _buildContinueCard(String title, String subtitle, double progress, String percent) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: AppColors.grey100,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accent),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                percent,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: AppTypography.bold,
                  color: AppColors.accent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(int index) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.sm)),
            child: Image.network(
              'https://picsum.photos/seed/${index + 100}/300/200',
              height: 90,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  index == 0 ? 'Mastering N5 Kanji' : 'Tiếng Nhật Giao Tiếp $index',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: AppTypography.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Sensei Hiroshi',
                  style: TextStyle(fontSize: 10, color: AppColors.textSecondary),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 12),
                    const SizedBox(width: 2),
                    Text(
                      '4.9',
                      style: TextStyle(fontSize: 11, fontWeight: AppTypography.bold, color: AppColors.grey700),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  '$19.99',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontWeight: AppTypography.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeminarCard(String title, String time, String teacher) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.accentLight,
              borderRadius: BorderRadius.circular(AppRadius.xs),
            ),
            child: const Icon(Icons.video_camera_front, color: AppColors.accent, size: 24),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  teacher,
                  style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.secondarySurface,
              borderRadius: BorderRadius.circular(AppRadius.xs),
              border: Border.all(color: AppColors.secondary.withValues(alpha: 0.1)),
            ),
            child: Text(
              time,
              style: const TextStyle(
                color: AppColors.secondary,
                fontWeight: AppTypography.bold,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxxl)),
            ],
          ),
        ),
      ),
    );
  }
}
