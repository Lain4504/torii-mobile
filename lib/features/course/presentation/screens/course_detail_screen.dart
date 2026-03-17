import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/data/models/course_offering_detail_model.dart';

class CourseDetailScreen extends ConsumerWidget {
  const CourseDetailScreen({super.key, required this.courseId});
  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(courseOfferingDetailRichProvider(courseId));
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return const Center(child: Text('Không tìm thấy khóa học'));
          }
          return _buildContent(context, theme, detail);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: AppColors.error))),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ThemeData theme,
    CourseOfferingDetailModel detail, [
    WidgetRef? ref,
  ]) {
    final course = detail.offering;
    final priceStr = '${course.displayPrice.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}đ';
    const bottomNavBarHeight = 64.0; // matches AppShell bottom bar
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final bottomSafePadding = bottomNavBarHeight + bottomInset + 12;

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              backgroundColor: AppColors.primary,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  course.thumbnailUrl ?? 'https://picsum.photos/seed/course_detail/800/600',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(color: AppColors.grey200, child: const Icon(Icons.school, size: 64)),
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.surface,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 18,
                    icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: AppTypography.extraBold,
                          letterSpacing: 0.1,
                        ),
                      ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoItem(Icons.signal_cellular_alt, course.mode),
                        _buildInfoItem(Icons.list_alt, 'Khóa học'),
                        Text(
                          priceStr,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: AppTypography.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    if (detail.instructorName != null && detail.instructorName!.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.person_outline, size: 16, color: AppColors.textTertiary),
                          const SizedBox(width: 6),
                          Text(
                            'Giảng viên: ${detail.instructorName}',
                            style: TextStyle(color: AppColors.grey700, fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                    const Divider(height: 32),
                    Text(
                      'Mô tả khóa học',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: AppTypography.bold,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      course.description ?? 'Không có mô tả.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        height: 1.6,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Syllabus',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: AppTypography.bold,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (detail.modules.isEmpty)
                      Text(
                        'Chưa có syllabus cho khóa học này.',
                        style: TextStyle(color: AppColors.grey700, height: 1.5),
                      )
                    else
                      Column(
                        children: detail.modules
                            .map((m) => _buildModuleTile(m))
                            .toList(),
                      ),
                    SizedBox(height: bottomSafePadding + 88),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.fromLTRB(24, 16, 24, bottomSafePadding),
            decoration: BoxDecoration(
              color: AppColors.surface,
              boxShadow: [BoxShadow(color: AppColors.textPrimary.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => context.push('/checkout/${course.id}'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textOnPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'Mua khóa học',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Text(
                    'Bạn đã mua khóa học này? Đăng nhập để học ngay trong mục "Khóa học của tôi".',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.grey700,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.grey700),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: AppColors.grey700,
            fontSize: 12,
            fontWeight: AppTypography.semiBold,
          ),
        ),
      ],
    );
  }

  Widget _buildModuleTile(SyllabusModuleModel module) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: ExpansionTile(
        initiallyExpanded: module.orderIndex == 1 || module.orderIndex == 0,
        tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        title: Text(
          module.title.isNotEmpty ? module.title : 'Module ${module.orderIndex}',
          style: const TextStyle(
            fontWeight: AppTypography.extraBold,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          '${module.lessons.length} bài học',
          style: TextStyle(color: AppColors.grey700, fontSize: 12),
        ),
        children: module.lessons.isEmpty
            ? [
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    'Chưa có bài học trong module này.',
                    style: TextStyle(color: AppColors.grey700, fontSize: 13),
                  ),
                )
              ]
            : module.lessons
                .map(
                  (l) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.play_circle_outline, size: 18, color: AppColors.textTertiary),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            l.title.isNotEmpty ? l.title : 'Bài học',
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
