import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/course_providers.dart';
import '../../models/course_model.dart';
import '../widgets/course_card.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';

/// Course Catalog Page - Premium Zen UI Rebuild
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

    final filteredCourses = state.courses.where((course) {
      final matchesSearch = 
          course.title.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          course.instructorName.toLowerCase().contains(_searchController.text.toLowerCase());
      final matchesLevel = _selectedLevel == null || course.level == _selectedLevel;
      final matchesType = _selectedType == null || course.type == _selectedType;
      
      return matchesSearch && matchesLevel && matchesType;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ZenBackground(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Custom App Bar
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              expandedHeight: 140,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.fromLTRB(AppSpacing.xl, 80, AppSpacing.xl, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NIHONGO CATALOG',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: AppTypography.black,
                          letterSpacing: 4.0,
                          color: AppColors.primary.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Universal Learning',
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamilySerif,
                          fontWeight: AppTypography.extraBold,
                          fontSize: 32,
                          letterSpacing: -1.0,
                          fontStyle: FontStyle.italic,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(AppSpacing.xl, 0, AppSpacing.xl, AppSpacing.lg),
                  child: _buildSearchBar(theme, isDark),
                ),
              ),
            ),

            // Filters
            SliverToBoxAdapter(
              child: EntryAnimation(
                delay: const Duration(milliseconds: 200),
                child: _buildFilters(theme, isDark),
              ),
            ),

            // Results Count
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xl,
                  vertical: AppSpacing.md,
                ),
                child: Row(
                  children: [
                    Text(
                      'NEURAL MATCHES Found'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: AppTypography.black,
                        letterSpacing: 2.0,
                        color: AppColors.textTertiary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primarySurface,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${filteredCourses.length}',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: AppTypography.black,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
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
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final course = filteredCourses[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                        child: EntryAnimation(
                          index: index % 5, // Staggered over visible items
                          verticalOffset: 20,
                          child: CourseCard(course: course),
                        ),
                      );
                    },
                    childCount: filteredCourses.length,
                  ),
                ),
              ),
            
            const SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.xxl),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(ThemeData theme, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(color: AppColors.borderLight.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (_) => setState(() {}),
        style: const TextStyle(
          fontSize: AppTypography.fontSizeMd,
          fontWeight: AppTypography.bold,
          color: AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: 'Search the Matrix...',
          hintStyle: TextStyle(
            color: AppColors.textTertiary.withOpacity(0.4),
            fontWeight: AppTypography.medium,
          ),
          prefixIcon: Icon(Icons.search_rounded, size: 22, color: AppColors.primary.withOpacity(0.7)),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.close_rounded, size: 20),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {});
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildFilters(ThemeData theme, bool isDark) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          // Level Filter
          _FilterChip(
            label: _selectedLevel?.name.toUpperCase() ?? 'LEVEL PROTOCOL',
            isSelected: _selectedLevel != null,
            onTap: () => _showLevelPicker(),
          ),
          const SizedBox(width: AppSpacing.md),
          
          // Type Filter
          _FilterChip(
            label: _selectedType == CourseType.vod 
                ? 'CHRONOLOGICAL VOD' 
                : _selectedType == CourseType.liveClass 
                    ? 'REAL-TIME PROTOCOL' 
                    : 'TRANSMISSION TYPE',
            isSelected: _selectedType != null,
            onTap: () => _showTypePicker(),
          ),
          
          // Clear Button
          if (_selectedLevel != null || _selectedType != null) ...[
            const SizedBox(width: AppSpacing.md),
            TextButton.icon(
              onPressed: _clearFilters,
              icon: const Icon(Icons.history_rounded, size: 16),
              label: const Text('RESET FILTERS'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                textStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: AppTypography.black,
                  letterSpacing: 1.0,
                ),
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
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xxl)),
      ),
      builder: (context) => _PickerSheet(
        title: 'Select Difficulty Protocol',
        items: [
          _PickerItem(label: 'All Matrix Levels', value: null),
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
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xxl)),
      ),
      builder: (context) => _PickerSheet(
        title: 'Select Transmission Mode',
        items: [
          _PickerItem(label: 'Unified Streams', value: null),
          _PickerItem(label: 'VOD Archive', value: CourseType.vod),
          _PickerItem(label: 'Live Synchronous', value: CourseType.liveClass),
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
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off_rounded,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: AppSpacing.lg),
            const Text(
              'CONNECTION SEVERED',
              style: TextStyle(
                fontSize: 16,
                fontWeight: AppTypography.black,
                letterSpacing: 2.0,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              error,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textTertiary,
                fontWeight: AppTypography.medium,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            ZenButton(
              text: 'RE-ESTABLISH LINK',
              onPressed: () => ref.read(courseListProvider.notifier).loadCourses(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 64,
              color: AppColors.primary.withOpacity(0.2),
            ),
            const SizedBox(height: AppSpacing.lg),
            const Text(
              'VOID DETECTED',
              style: TextStyle(
                fontSize: 16,
                fontWeight: AppTypography.black,
                letterSpacing: 2.0,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            const Text(
              'No protocols match your current search parameters.',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textTertiary,
                fontWeight: AppTypography.medium,
              ),
              textAlign: TextAlign.center,
            ),
            if (_selectedLevel != null || _selectedType != null) ...[
              const SizedBox(height: AppSpacing.xl),
              TextButton(
                onPressed: _clearFilters,
                child: const Text('PURGE FILTERS', style: TextStyle(fontWeight: AppTypography.black, letterSpacing: 1.0)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: isSelected 
                ? AppColors.primary
                : Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: isSelected 
                  ? AppColors.primary
                  : AppColors.borderLight.withOpacity(0.5),
            ),
            boxShadow: isSelected ? [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ] : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: AppTypography.black,
                  letterSpacing: 1.0,
                  color: isSelected 
                      ? Colors.white
                      : AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 16,
                color: isSelected 
                    ? Colors.white
                    : AppColors.textTertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: AppTypography.black,
              letterSpacing: 2.0,
              color: AppColors.textTertiary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isSelected = selectedValue == item.value;
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                  title: Text(
                    item.label,
                    style: TextStyle(
                      fontSize: AppTypography.fontSizeMd,
                      fontWeight: isSelected ? AppTypography.bold : AppTypography.medium,
                      color: isSelected ? AppColors.primary : AppColors.textPrimary,
                    ),
                  ),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 20)
                      : null,
                  onTap: () => onSelect(item.value),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
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
