import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/class_catalog_model.dart';

/// Chi tiết khóa VOD theo **classId** (lớp VOD).
class CourseDetailScreen extends ConsumerWidget {
  const CourseDetailScreen({super.key, required this.courseId});
  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(classCatalogDetailProvider(courseId));
    final theme = Theme.of(context);
    const bottomNavBarHeight = 64.0;
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final bottomSafePadding = bottomNavBarHeight + bottomInset + 12;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return const Center(child: Text('Không tìm thấy khóa học'));
          }
          if (detail.isLive) {
            return const Center(child: Text('Đây là lớp LIVE — dùng màn hình chi tiết LIVE.'));
          }
          return _buildVod(context, theme, detail, bottomSafePadding);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e', style: const TextStyle(color: AppColors.error))),
      ),
    );
  }

  Widget _buildVod(
    BuildContext context,
    ThemeData theme,
    ClassCatalogDetailModel detail,
    double bottomSafePadding,
  ) {
    final item = detail.item;
    final priceStr =
        '${detail.displayPrice.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}đ';
    final thumb = item.thumbnailUrl ?? 'https://picsum.photos/seed/course_detail/800/600';
    final title = item.name.isNotEmpty ? item.name : (item.profileTitle ?? 'Khóa học');
    final desc = _stripHtml(detail.descriptionHtml ?? '');

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
                  thumb,
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
                        title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: AppTypography.extraBold,
                          letterSpacing: 0.1,
                        ),
                      ),
                      if (item.jlptLevel != null) ...[
                        const SizedBox(height: 8),
                        Chip(label: Text('JLPT ${item.jlptLevel}')),
                      ],
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoItem(Icons.video_library_outlined, 'VOD'),
                          Text(
                            priceStr,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: AppTypography.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      if (item.instructor?['displayName'] != null) ...[
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.person_outline, size: 16, color: AppColors.textTertiary),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                'Giảng viên: ${item.instructor!['displayName']}',
                                style: const TextStyle(color: AppColors.grey700, fontSize: 13, fontWeight: FontWeight.w600),
                              ),
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
                        desc.isEmpty ? 'Không có mô tả.' : desc,
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
                          style: TextStyle(color: AppColors.grey700, height: 1.5),
                        )
                      else
                        ...detail.modules.map((m) => _buildModuleExpansion(m)),
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
                      onPressed: () => context.push('/checkout/$courseId'),
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
          style: const TextStyle(
            color: AppColors.grey700,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildModuleExpansion(Map<String, dynamic> mod) {
    final title = mod['title']?.toString() ?? 'Chương';
    final lessons = mod['lessons'];
    final list = lessons is List ? lessons : const [];
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
        subtitle: Text('${list.length} bài học', style: TextStyle(color: AppColors.grey700, fontSize: 12)),
        children: list.isEmpty
            ? [
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text('Chưa có bài học.', style: TextStyle(color: AppColors.grey700, fontSize: 13)),
                )
              ]
            : list.map<Widget>((l) {
                final lm = Map<String, dynamic>.from(l as Map);
                final lt = lm['title']?.toString() ?? 'Bài học';
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.play_circle_outline, size: 18, color: AppColors.textTertiary),
                      const SizedBox(width: 10),
                      Expanded(child: Text(lt, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                    ],
                  ),
                );
              }).toList(),
      ),
    );
  }

  String _stripHtml(String h) {
    return h.replaceAll(RegExp(r'<[^>]*>'), ' ').replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}
