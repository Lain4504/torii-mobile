import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/app_background.dart';
import '../../../../core/widgets/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppSpacing.xl),
                      _buildSectionHeader('DISCOVER CATEGORIES'),
                      const SizedBox(height: AppSpacing.md),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _CategoryChip('Programming', Icons.code_rounded, Colors.blue),
                          _CategoryChip('Design', Icons.brush_rounded, Colors.purple),
                          _CategoryChip('Business', Icons.business_center_rounded, Colors.orange),
                          _CategoryChip('Language', Icons.language_rounded, Colors.green),
                          _CategoryChip('Marketing', Icons.campaign_rounded, Colors.red),
                          _CategoryChip('Music', Icons.music_note_rounded, Colors.pink),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.xxl),
                      _buildSectionHeader('POPULAR SEARCHES'),
                      const SizedBox(height: AppSpacing.md),
                      _buildTrendItem('Flutter Architecture'),
                      _buildTrendItem('Japanese N3 Vocabulary'),
                      _buildTrendItem('React Native vs Flutter'),
                      _buildTrendItem('Digital Marketing 101'),

                      const SizedBox(height: AppSpacing.xxl),
                      _buildSectionHeader('RECENTLY VIEWED'),
                      const SizedBox(height: AppSpacing.md),
                      _RecentlyViewedItem(
                        title: 'Advanced Flutter Architecture',
                        author: 'Tech Academy',
                        imageColor: Colors.blue.shade100,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      _RecentlyViewedItem(
                        title: 'Japanese Kanji Master Class',
                        author: 'Sensei Tanaka',
                        imageColor: Colors.red.shade100,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
            color: AppColors.textSecondary,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppRadius.full),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search courses, mentors...',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textTertiary,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: const Icon(Icons.search_rounded, color: AppColors.primary),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.tune_rounded, color: AppColors.textSecondary, size: 20),
                    onPressed: () {
                      // Open Filter Modal
                    },
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: AppTypography.black,
        letterSpacing: 2.0,
        color: AppColors.textTertiary,
      ),
    );
  }

  Widget _buildTrendItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(Icons.trending_up_rounded, size: 16, color: AppColors.textTertiary),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _CategoryChip(this.label, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: AppColors.grey300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: AppTypography.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentlyViewedItem extends StatelessWidget {
  final String title;
  final String author;
  final Color imageColor;

  const _RecentlyViewedItem({
    required this.title,
    required this.author,
    required this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: imageColor,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: const Icon(Icons.image_not_supported_rounded, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: AppTypography.bold,
                    fontSize: 13,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  author,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.navigate_next_rounded, size: 20, color: AppColors.textTertiary),
        ],
      ),
    );
  }
}
