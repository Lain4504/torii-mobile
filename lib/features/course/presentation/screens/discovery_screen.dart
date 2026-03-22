import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/data/utils/learner_offering_display.dart';

class CourseDiscoveryScreen extends ConsumerWidget {
  const CourseDiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(publicCourseOfferingsProvider);
    final selectedLevel = GoRouterState.of(context).uri.queryParameters['level'];
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(
          'Khám phá khóa học',
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.search, color: AppColors.textPrimary), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Row(
              children: [
                _buildFilterChip(selectedLevel != null ? 'Cấp độ: $selectedLevel' : 'Cấp độ', Icons.keyboard_arrow_down),
                const SizedBox(width: 12),
                _buildFilterChip('Loại bài học', Icons.keyboard_arrow_down),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: coursesAsync.when(
              data: (list) {
                final filtered = _filterByLevel(list, selectedLevel);
                return filtered.isEmpty
                  ? const Center(child: Text('Chưa có khóa học nào'))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) => _buildCourseCard(context, filtered[index]),
                    );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: AppColors.error))),
            ),
          ),
        ],
      ),
    );
  }

  List<CourseOfferingModel> _filterByLevel(List<CourseOfferingModel> list, String? level) {
    if (level == null || level.isEmpty) return list;
    final n = level.toUpperCase().trim();
    final re = RegExp(r'(^|[^A-Z0-9])' + RegExp.escape(n) + r'([^A-Z0-9]|$)', caseSensitive: false);

    bool match(String? s) => s != null && re.hasMatch(s.toUpperCase());

    return list.where((c) {
      final disp = c.learnerOfferingDisplay();
      return match(c.code) ||
          match(c.title) ||
          match(c.slug) ||
          match(c.description) ||
          match(disp.learnerDisplayTitle) ||
          match(c.className) ||
          match(c.courseProfileTitle);
    }).toList();
  }

  Widget _buildFilterChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.grey200,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(width: 4),
          Icon(icon, size: 18, color: AppColors.grey700),
        ],
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, CourseOfferingModel course) {
    final disp = course.learnerOfferingDisplay();
    final priceStr = '${course.displayPrice.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}đ';
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: AppColors.textPrimary.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: Image.network(
                  course.thumbnailUrl ?? 'https://picsum.photos/seed/course${course.id}/600/300',
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(height: 160, color: AppColors.grey200, child: const Icon(Icons.school, size: 48)),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
                  child: Text(course.mode, style: const TextStyle(color: AppColors.textOnPrimary, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  disp.learnerDisplayTitle,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (disp.liveContextLine != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    disp.liveContextLine!,
                    style: TextStyle(fontSize: 12, color: AppColors.grey700, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if (disp.learnerMarketingSubtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Gói: ${disp.learnerMarketingSubtitle}',
                    style: TextStyle(fontSize: 12, color: AppColors.grey700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.play_circle_outline, size: 16, color: AppColors.grey700),
                    const SizedBox(width: 4),
                    Text('Khóa học ${course.mode}', style: TextStyle(color: AppColors.grey700, fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(priceStr, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary)),
                    ElevatedButton(
                      onPressed: () {
                        final mode = course.mode.toUpperCase();
                        if (mode == 'LIVE') {
                          context.push('/course-live/${course.id}');
                        } else {
                          context.push('/course-detail/${course.id}');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textOnPrimary,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: const Text('Xem chi tiết', style: TextStyle(fontWeight: FontWeight.bold)),
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
}
