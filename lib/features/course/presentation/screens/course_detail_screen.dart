import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/data/models/course_offering_detail_model.dart';
import 'package:torii_app/data/utils/learner_offering_display.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  const CourseDetailScreen({super.key, required this.courseId});
  final String courseId;

  @override
  ConsumerState<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends ConsumerState<CourseDetailScreen> {
  String? _selectedClassId;

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(courseOfferingDetailRichProvider(widget.courseId));
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return const Center(child: Text('Không tìm thấy khóa học'));
          }
          return _buildContent(context, detail);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: theme.colorScheme.error))),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    CourseOfferingDetailModel detail, [
    WidgetRef? ref,
  ]) {
    final theme = Theme.of(context);
    final course = detail.offering;
    final disp = course.learnerOfferingDisplay(liveClasses: detail.siblingClasses);
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
              backgroundColor: theme.colorScheme.primary,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  course.thumbnailUrl ?? 'https://picsum.photos/seed/course_detail/800/600',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.3), child: const Icon(Icons.school, size: 64)),
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: theme.colorScheme.surface,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 18,
                    icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
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
                        disp.learnerDisplayTitle,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: AppTypography.extraBold,
                          letterSpacing: 0.1,
                        ),
                      ),
                    if (disp.liveContextLine != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        disp.liveContextLine!,
                        style: TextStyle(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    if (disp.learnerMarketingSubtitle != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        'Tên gói bán: ${disp.learnerMarketingSubtitle}',
                        style: TextStyle(color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7), fontSize: 13, height: 1.35),
                      ),
                    ],
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
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    if (detail.instructorName != null && detail.instructorName!.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.person_outline, size: 16, color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7)),
                          const SizedBox(width: 6),
                          Text(
                            'Giảng viên: ${detail.instructorName}',
                            style: TextStyle(color: theme.colorScheme.onSurfaceVariant, fontSize: 13, fontWeight: FontWeight.w600),
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
                      'Chương trình học',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: AppTypography.bold,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (detail.modules.isEmpty)
                      Text(
                        'Chương trình học đang được cập nhật.',
                        style: TextStyle(color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7), height: 1.5),
                      )
                    else
                      Column(
                        children: detail.modules
                            .map((m) => _buildModuleTile(m))
                            .toList(),
                      ),
                    if (detail.offering.mode.toUpperCase() == 'LIVE' && detail.siblingClasses.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      Text(
                        'Chọn lớp học (Batch) của giảng viên bạn yêu thích',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: AppTypography.bold,
                          letterSpacing: 0.1,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        children: detail.siblingClasses.map((c) {
                          final isSelected = _selectedClassId == c.id;
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? theme.colorScheme.primary.withValues(alpha: 0.05) : theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outlineVariant,
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () => setState(() => _selectedClassId = c.id),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(c.instructorAvatarUrl ?? 'https://ui-avatars.com/api/?name=${c.instructorName ?? "GV"}'),
                                      radius: 20,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            c.name,
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                          ),
                                          Text(
                                            'Giảng viên: ${c.instructorName ?? "Đang cập nhật"} • Mã lớp: ${c.code}',
                                            style: TextStyle(color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7), fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (isSelected)
                                      Icon(Icons.check_circle, color: theme.colorScheme.primary, size: 24),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                    SizedBox(height: bottomSafePadding + 100),
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
              color: theme.colorScheme.surface,
              boxShadow: [BoxShadow(color: theme.colorScheme.onSurface.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -5))],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (course.mode.toUpperCase() == 'LIVE' && _selectedClassId == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Vui lòng chọn 1 lớp học (Batch) để mua khóa học LIVE.')),
                          );
                          return;
                        }
                        final extra = _selectedClassId != null ? '?classId=$_selectedClassId' : '';
                        context.push('/checkout/${course.id}$extra');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
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
                      color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
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
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.7)),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 12,
            fontWeight: AppTypography.semiBold,
          ),
        ),
      ],
    );
  }

  Widget _buildModuleTile(CurriculumModuleModel module) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
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
          style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.7), fontSize: 12),
        ),
        children: module.lessons.isEmpty
            ? [
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    'Chưa có bài học trong module này.',
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.7), fontSize: 13),
                  ),
                )
              ]
            : module.lessons
                .map(
                  (l) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.play_circle_outline, size: 18, color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.7)),
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
