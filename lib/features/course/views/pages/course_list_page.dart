import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/course_providers.dart';
import '../../models/course_model.dart';
import '../widgets/course_card.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

/// Course Catalog Page - Minimalist Course Browser
/// 
/// A clean, focused course browsing experience with filtering.
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Filter courses
    final filteredCourses = state.courses.where((course) {
      final matchesSearch = 
          course.title.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          course.instructorName.toLowerCase().contains(_searchController.text.toLowerCase());
      final matchesLevel = _selectedLevel == null || course.level == _selectedLevel;
      final matchesType = _selectedType == null || course.type == _selectedType;
      
      return matchesSearch && matchesLevel && matchesType;
    }).toList();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: theme.scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.pageHorizontal,
                  80,
                  AppSpacing.pageHorizontal,
                  0,
                ),
                child: Text(
                  'Courses',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: AppTypography.bold,
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(64),
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.pageHorizontal,
                  0,
                  AppSpacing.pageHorizontal,
                  AppSpacing.md,
                ),
                child: _buildSearchBar(theme, isDark),
              ),
            ),
          ),

          // Filters
          SliverToBoxAdapter(
            child: _buildFilters(theme, isDark),
          ),

          // Results Count
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.pageHorizontal,
                vertical: AppSpacing.sm,
              ),
              child: Text(
                '${filteredCourses.length} courses found',
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),

          // Course List
          if (state.isLoading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (state.error != null)
            SliverFillRemaining(
              child: _buildErrorState(state.error!),
            )
          else if (filteredCourses.isEmpty)
            SliverFillRemaining(
              child: _buildEmptyState(),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.pageHorizontal),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final course = filteredCourses[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: EntryAnimation(
                        index: index,
                        child: CourseCard(course: course),
                      ),
                    );
                  },
                  childCount: filteredCourses.length,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(ThemeData theme, bool isDark) {
    return TextField(
      controller: _searchController,
      onChanged: (_) => setState(() {}),
      style: theme.textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: 'Search courses...',
        prefixIcon: const Icon(Icons.search, size: AppIconSize.sm),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.close, size: AppIconSize.sm),
                onPressed: () {
                  _searchController.clear();
                  setState(() {});
                },
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
      ),
    );
  }

  Widget _buildFilters(ThemeData theme, bool isDark) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.pageHorizontal,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          // Level Filter
          _FilterChip(
            label: _selectedLevel?.name.toUpperCase() ?? 'Level',
            isSelected: _selectedLevel != null,
            onTap: () => _showLevelPicker(),
          ),
          const SizedBox(width: AppSpacing.sm),
          
          // Type Filter
          _FilterChip(
            label: _selectedType == CourseType.vod 
                ? 'Video' 
                : _selectedType == CourseType.liveClass 
                    ? 'Live' 
                    : 'Type',
            isSelected: _selectedType != null,
            onTap: () => _showTypePicker(),
          ),
          
          // Clear Button
          if (_selectedLevel != null || _selectedType != null) ...[
            const SizedBox(width: AppSpacing.sm),
            TextButton.icon(
              onPressed: _clearFilters,
              icon: const Icon(Icons.close, size: 16),
              label: const Text('Clear'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.textSecondary,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showLevelPicker() {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) => _PickerSheet(
        title: 'Select Level',
        items: [
          _PickerItem(label: 'All Levels', value: null),
          ...JLPTLevel.values.map((l) => _PickerItem(
            label: l.name.toUpperCase(),
            value: l,
          )),
        ],
        selectedValue: _selectedLevel,
        onSelect: (value) {
          setState(() => _selectedLevel = value as JLPTLevel?);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showTypePicker() {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) => _PickerSheet(
        title: 'Select Type',
        items: [
          _PickerItem(label: 'All Types', value: null),
          _PickerItem(label: 'Video Course', value: CourseType.vod),
          _PickerItem(label: 'Live Class', value: CourseType.liveClass),
        ],
        selectedValue: _selectedType,
        onSelect: (value) {
          setState(() => _selectedType = value as CourseType?);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _clearFilters() {
    setState(() {
      _selectedLevel = null;
      _selectedType = null;
      _searchController.clear();
    });
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              error,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            OutlinedButton(
              onPressed: () => ref.read(courseListProvider.notifier).loadCourses(),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off_outlined,
              size: 48,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'No courses found',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Try adjusting your filters',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            if (_selectedLevel != null || _selectedType != null) ...[
              const SizedBox(height: AppSpacing.lg),
              TextButton(
                onPressed: _clearFilters,
                child: const Text('Clear Filters'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Filter Chip - Minimal filter button
class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.chip),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: isSelected 
                ? AppColors.primarySurface
                : isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(AppRadius.chip),
            border: Border.all(
              color: isSelected 
                  ? AppColors.primary
                  : isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: AppTypography.fontSizeSm,
                  fontWeight: isSelected ? AppTypography.semiBold : AppTypography.medium,
                  color: isSelected 
                      ? AppColors.primary
                      : theme.textTheme.bodyMedium?.color,
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: isSelected 
                    ? AppColors.primary
                    : AppColors.textTertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Picker Sheet - Bottom sheet for selection
class _PickerSheet extends StatelessWidget {
  final String title;
  final List<_PickerItem> items;
  final dynamic selectedValue;
  final Function(dynamic) onSelect;

  const _PickerSheet({
    required this.title,
    required this.items,
    required this.selectedValue,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.grey300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            child: Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: AppTypography.semiBold,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          
          // Items
          ...items.map((item) => ListTile(
            title: Text(item.label),
            trailing: selectedValue == item.value
                ? const Icon(Icons.check, color: AppColors.primary)
                : null,
            onTap: () => onSelect(item.value),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
          )),
          
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }
}

class _PickerItem {
  final String label;
  final dynamic value;

  _PickerItem({required this.label, required this.value});
}
