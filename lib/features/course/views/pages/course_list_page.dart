import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/course_providers.dart';
import '../../models/course_model.dart';
import '../widgets/course_card.dart';
import '../../../../core/constants/app_design_system.dart';

class CourseCatalogPage extends ConsumerStatefulWidget {
  const CourseCatalogPage({super.key});

  @override
  ConsumerState<CourseCatalogPage> createState() => _CourseCatalogPageState();
}

class _CourseCatalogPageState extends ConsumerState<CourseCatalogPage> {
  final TextEditingController _searchController = TextEditingController();
  JLPTLevel? _selectedLevel;
  CourseType? _selectedType;
  
  @override
  void initState() {
    super.initState();
    // Load courses if not already loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(courseListProvider.notifier).loadCourses();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(courseListProvider);

    // Local Filtering Logic (Mocking Server-Side)
    final filteredCourses = state.courses.where((course) {
      final matchesSearch = course.title.toLowerCase().contains(_searchController.text.toLowerCase()) ||
                            course.instructorName.toLowerCase().contains(_searchController.text.toLowerCase());
      final matchesLevel = _selectedLevel == null || course.level == _selectedLevel;
      final matchesType = _selectedType == null || course.type == _selectedType;
      
      return matchesSearch && matchesLevel && matchesType;
    }).toList();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // 1. App Bar with Search
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            backgroundColor: theme.scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.black.withValues(alpha: 0.05),
            title: Text(
              'Course Catalog',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: TextField(
                  controller: _searchController,
                  onChanged: (_) => setState(() {}),
                  style: theme.textTheme.bodyLarge,
                  decoration: InputDecoration(
                    hintText: 'Search courses, instructors...',
                    hintStyle: TextStyle(color: theme.hintColor),
                    prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
                    filled: true,
                    fillColor: theme.inputDecorationTheme.fillColor,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 2. Filter Bar
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // JLPT Filter
                  _buildFilterDropdown<JLPTLevel>(
                    label: 'Level',
                    value: _selectedLevel,
                    items: JLPTLevel.values,
                    itemLabel: (l) => l.name.toUpperCase(),
                    onChanged: (val) => setState(() => _selectedLevel = val),
                  ),
                  const SizedBox(width: 8),
                  
                  // Type Filter
                  _buildFilterDropdown<CourseType>(
                    label: 'Type',
                    value: _selectedType,
                    items: CourseType.values,
                    itemLabel: (t) => t == CourseType.vod ? 'Video' : 'Live',
                    onChanged: (val) => setState(() => _selectedType = val),
                  ),
                  const SizedBox(width: 8),

                  // Clear Filter Button
                  if (_selectedLevel != null || _selectedType != null)
                    TextButton.icon(
                      onPressed: () => setState(() {
                        _selectedLevel = null;
                        _selectedType = null;
                        _searchController.clear();
                      }),
                      icon: const Icon(Icons.close, size: 16),
                      label: const Text('Clear'),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.error,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // 3. Course Grid
          if (state.isLoading)
             const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator(color: AppColors.primary)),
            )
          else if (state.error != null)
            SliverFillRemaining(
              child: Center(child: Text('Error: ${state.error}')),
            )
          else if (filteredCourses.isEmpty)
             SliverFillRemaining(
              child: Center(
                child: Text(
                  'No courses found matching your criteria',
                  style: TextStyle(color: theme.textTheme.bodyMedium?.color),
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Start with 1 column for mobile list view
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.95, // Adjusted for card height
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final course = filteredCourses[index];
                    return CourseCard(course: course);
                  },
                  childCount: filteredCourses.length,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown<T>({
    required String label,
    required T? value,
    required List<T> items,
    required String Function(T) itemLabel,
    required Function(T?) onChanged,
  }) {
    final theme = Theme.of(context);
    final isSelected = value != null;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : theme.cardColor,
        border: Border.all(
          color: isSelected ? AppColors.primary : theme.dividerColor,
        ),
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          hint: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.primary : theme.textTheme.bodyMedium?.color,
              fontSize: AppTypography.fontSizeSm,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: isSelected ? AppColors.primary : theme.iconTheme.color,
          ),
          style: TextStyle(
            color: theme.textTheme.bodyLarge?.color,
            fontSize: AppTypography.fontSizeSm,
          ),
          dropdownColor: theme.cardColor,
          items: [
            DropdownMenuItem<T>(
              value: null,
              child: Text(
                'All $label',
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
              ),
            ),
            ...items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(
                  itemLabel(item),
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                ),
              );
            }).toList(),
          ],
          onChanged: onChanged,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    );
  }
}


