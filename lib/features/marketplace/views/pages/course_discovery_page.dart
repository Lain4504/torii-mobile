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
  static const List<String> _levels = ['N5', 'N4', 'N3', 'N2', 'N1'];
  final List<String> _selectedLevels = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(courseListProvider.notifier).loadCourses(refresh: true);
    });
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
              // Header: back + title
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.md),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios, size: 20),
                    ),
                    const Expanded(
                      child: Text(
                        'Khóa học',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: AppTypography.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              // Level badges: N5, N4, N3, N2, N1
              SizedBox(
                height: 44,
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
                          ref.read(courseListProvider.notifier).loadCourses(
                                refresh: true,
                                level: _currentLevelFilter(),
                              );
                        },
                        selectedColor: AppColors.primary,
                        checkmarkColor: AppColors.white,
                        labelStyle: TextStyle(
                          color: isSelected
                              ? AppColors.white
                              : AppColors.secondary,
                          fontWeight: isSelected
                              ? AppTypography.bold
                              : AppTypography.medium,
                          fontSize: 12,
                        ),
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppRadius.xs),
                          side: BorderSide(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.borderLight,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: AppSpacing.sm),

              // Content: loading / error / grid
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (courseState.isLoading && courses.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (courseState.error != null &&
                        courseState.error!.isNotEmpty &&
                        courses.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                courseState.error!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.md),
                              TextButton(
                                onPressed: () => ref
                                    .read(courseListProvider.notifier)
                                    .loadCourses(refresh: true),
                                child: const Text('Thử lại'),
                              ),
                            ],
                          ),
                        ),
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Text(
                    course.instructorName,
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 6),
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
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          course.priceLabel,
                          style: const TextStyle(
                            color: AppColors.secondary,
                            fontWeight: AppTypography.bold,
                            fontSize: 15,
                          ),
                          overflow: TextOverflow.ellipsis,
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
}
