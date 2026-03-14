import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/widgets/widgets.dart';
import 'package:torii_app/features/course/models/course_model.dart';
import 'package:torii_app/features/course/providers/course_providers.dart';

class CourseDiscoveryPage extends ConsumerStatefulWidget {
  const CourseDiscoveryPage({super.key});

  @override
  ConsumerState<CourseDiscoveryPage> createState() => _CourseDiscoveryPageState();
}

class _CourseDiscoveryPageState extends ConsumerState<CourseDiscoveryPage> {
  final List<String> _levels = ['N5', 'N4', 'N3', 'N2', 'N1'];
  final List<String> _selectedLevels = [];
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(courseListProvider.notifier).loadCourses(refresh: true);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  JLPTLevel? _currentLevelFilter() {
    if (_selectedLevels.isEmpty) return null;
    switch (_selectedLevels.first) {
      case 'N1':
        return JLPTLevel.n1;
      case 'N2':
        return JLPTLevel.n2;
      case 'N3':
        return JLPTLevel.n3;
      case 'N4':
        return JLPTLevel.n4;
      case 'N5':
      default:
        return JLPTLevel.n5;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(courseListProvider);
    final courses = courseState.courses;

    return Scaffold(
      body: AppBackground(
        pattern: BackgroundPattern.none,
        child: SafeArea(
          child: Column(
            children: [
              // ----------------------------------------------------------------------
              // Header: Search Bar, Filter, Sort
              // ----------------------------------------------------------------------
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios, size: 20),
                        ),
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(AppRadius.sm),
                              border: Border.all(color: AppColors.borderLight),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                            child: Row(
                              children: [
                                const Icon(Icons.search,
                                    color: AppColors.textSecondary),
                                const SizedBox(width: AppSpacing.sm),
                                Expanded(
                                  child: TextField(
                                    controller: _searchController,
                                    decoration: InputDecoration(
                                      hintText: 'Tìm kiếm khóa học...',
                                      border: InputBorder.none,
                                      hintStyle: const TextStyle(
                                          color: AppColors.textTertiary,
                                          fontSize: 14),
                                    ),
                                    textInputAction: TextInputAction.search,
                                    onSubmitted: (value) {
                                      setState(() {
                                        _searchQuery = value;
                                      });
                                      ref
                                          .read(
                                              courseListProvider.notifier)
                                          .loadCourses(
                                            refresh: true,
                                            level: _currentLevelFilter(),
                                            search: _searchQuery,
                                          );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      children: [
                        _buildHeaderButton(
                          icon: Icons.filter_list,
                          label: 'Bộ lọc',
                          onTap: () => _showFilterDrawer(context),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        _buildHeaderButton(
                          icon: Icons.sort,
                          label: 'Sắp xếp',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ----------------------------------------------------------------------
              // Level Filter (Horizontal Chips)
              // ----------------------------------------------------------------------
              SizedBox(
                height: 48,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  itemCount: _levels.length,
                  itemBuilder: (context, index) {
                    final level = _levels[index];
                    final isSelected = _selectedLevels.contains(level);
                    return Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.sm),
                      child: FilterChip(
                        label: Text(level),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _selectedLevels.clear();
                            if (selected) _selectedLevels.add(level);
                          });
                          ref
                              .read(courseListProvider.notifier)
                              .loadCourses(
                                refresh: true,
                                level: _currentLevelFilter(),
                                search: _searchQuery,
                              );
                        },
                        selectedColor: AppColors.primary,
                        checkmarkColor: AppColors.white,
                        labelStyle: TextStyle(
                          color: isSelected ? AppColors.white : AppColors.secondary,
                          fontWeight: isSelected ? AppTypography.bold : AppTypography.medium,
                          fontSize: 12,
                        ),
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.xs),
                          side: BorderSide(
                            color: isSelected ? AppColors.primary : AppColors.borderLight,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: AppSpacing.sm),

              // ----------------------------------------------------------------------
              // Main Area: Grid of Course Cards
              // ----------------------------------------------------------------------
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (courseState.isLoading && courses.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (courses.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(AppSpacing.lg),
                          child: Text(
                            'Không tìm thấy khóa học phù hợp.',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      );
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.68,
                        crossAxisSpacing: AppSpacing.md,
                        mainAxisSpacing: AppSpacing.md,
                      ),
                      itemCount: courses.length,
                      itemBuilder: (context, index) =>
                          _buildDiscoveryCard(context, courses[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderButton(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.xs),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: AppColors.secondary),
              const SizedBox(width: AppSpacing.xs),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.secondary,
                  fontWeight: AppTypography.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDiscoveryCard(BuildContext context, Course course) {
    return GestureDetector(
      onTap: () => context.push('/courses/${course.id}'),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.xs),
          border: Border.all(color: AppColors.borderLight),
          boxShadow: AppElevation.softShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Thumbnail
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppRadius.xs)),
              child: AspectRatio(
                aspectRatio: 16 / 10,
                child: course.thumbnailUrl != null &&
                        course.thumbnailUrl!.isNotEmpty
                    ? Image.network(
                        course.thumbnailUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.grey100,
                            child: const Icon(Icons.menu_book_rounded,
                                color: AppColors.primary),
                          );
                        },
                      )
                    : Container(
                        color: AppColors.grey100,
                        child: const Icon(Icons.menu_book_rounded,
                            color: AppColors.primary),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course Title
                  Text(
                    course.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: AppTypography.bold,
                      fontSize: 13,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Instructor
                  Text(
                    course.instructorName,
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 6),
                  // Rating & Students
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 12),
                      const SizedBox(width: 2),
                      Text(
                        course.rating.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: AppTypography.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${course.reviewCount})',
                        style: const TextStyle(
                            fontSize: 10, color: AppColors.textTertiary),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        course.priceLabel,
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontWeight: AppTypography.bold,
                          fontSize: 15,
                        ),
                      ),
                      const Icon(Icons.add_shopping_cart,
                          size: 16, color: AppColors.primary),
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

  void _showFilterDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.md)),
        ),
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Bộ lọc',
                  style: TextStyle(fontSize: 20, fontWeight: AppTypography.bold),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: AppSpacing.md),
            _buildFilterSection('Trình độ', ['N5', 'N4', 'N3', 'N2', 'N1']),
            const SizedBox(height: AppSpacing.lg),
            _buildFilterSection('Giá', ['Miễn phí', 'Có phí', 'Khuyến mãi']),
            const SizedBox(height: AppSpacing.lg),
            _buildFilterSection('Thời lượng', ['< 2 giờ', '2-5 giờ', '5-10 giờ', '> 10 giờ']),
            const SizedBox(height: AppSpacing.lg),
            _buildFilterSection('Đánh giá', ['4.5+', '4.0+', '3.5+', 'Tất cả']),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Xóa tất cả'),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                    ),
                    child: const Text('Áp dụng'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: AppTypography.bold, fontSize: 13),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          children: options.map((opt) => Chip(
            label: Text(opt, style: const TextStyle(fontSize: 12)),
            backgroundColor: AppColors.grey50,
            side: const BorderSide(color: AppColors.borderLight),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xs)),
          )).toList(),
        ),
      ],
    );
  }
}
