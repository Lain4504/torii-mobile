import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/class_catalog_model.dart';

/// Chi tiết một lớp LIVE (classId) — không chọn batch; đăng ký đúng lớp đó.
class CourseLiveDetailScreen extends ConsumerWidget {
  const CourseLiveDetailScreen({super.key, required this.classId});
  final String classId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final detailAsync = ref.watch(classCatalogLiveDetailProvider(classId));

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return const Center(child: Text('Không tìm thấy lớp'));
          }
          return _buildContent(context, detail);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(
            'Lỗi: $e',
            style: TextStyle(color: theme.colorScheme.error),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ClassCatalogDetailModel detail) {
    final theme = Theme.of(context);
    final item = detail.item;
    final priceStr =
        '${detail.displayPrice.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}đ';
    final thumb =
        item.thumbnailUrl ?? 'https://picsum.photos/seed/course_live/800/600';
    final live = detail.liveClass;
    final canPay =
        (detail.catalogProductId.isNotEmpty) &&
        (live == null || !live.isLiveCapacityFull);
    final opening = item.openingDate;

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              backgroundColor: theme.colorScheme.surface,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  thumb,
                  fit: BoxFit.cover,
                  errorBuilder: (_, error, stackTrace) => Container(
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: const Icon(Icons.school, size: 64),
                  ),
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
                    icon: Icon(
                      Icons.arrow_back,
                      color: theme.colorScheme.onSurface,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.error.withValues(
                              alpha: 0.08,
                            ),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: theme.colorScheme.error.withValues(
                                alpha: 0.2,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.videocam_outlined,
                                size: 14,
                                color: theme.colorScheme.error,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'LIVE',
                                style: TextStyle(
                                  color: theme.colorScheme.error,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (item.jlptLevel != null) ...[
                          const SizedBox(width: 8),
                          Chip(
                            label: Text(
                              item.jlptLevel!,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                        const Spacer(),
                        Text(
                          priceStr,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      item.name.isNotEmpty
                          ? item.name
                          : (item.profileTitle ?? 'Lớp học'),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Mã lớp: ${item.code}',
                      style: TextStyle(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontSize: 13,
                      ),
                    ),
                    if (opening != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Khai giảng: ${DateFormat('dd/MM/yyyy').format(opening)}',
                        style: TextStyle(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontSize: 14,
                        ),
                      ),
                    ],
                    if (live?.liveCapacitySubtitle != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        live!.liveCapacitySubtitle!,
                        style: TextStyle(
                          color: live.isLiveCapacityFull
                              ? theme.colorScheme.error
                              : theme.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    if (item.instructor != null &&
                        item.instructor!.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      _SectionTitle(title: 'Giảng viên', theme: theme),
                      const SizedBox(height: 8),
                      _LecturerCard(
                        lecturer: item.instructor!,
                        theme: theme,
                        classId: classId,
                      ),
                    ],
                    const SizedBox(height: 12),
                    if ((detail.descriptionHtml ?? '').isNotEmpty) ...[
                      Text(
                        _stripHtml(detail.descriptionHtml!),
                        style: TextStyle(
                          height: 1.55,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    const Divider(height: 40),
                    _SectionTitle(title: 'Lịch live', theme: theme),
                    const SizedBox(height: 10),
                    if (item.liveSchedules.isEmpty)
                      Text(
                        'Khung giờ học sẽ được cập nhật.',
                        style: TextStyle(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      )
                    else
                      ...item.liveSchedules.map((s) {
                        final m = Map<String, dynamic>.from(s as Map);
                        final weekday = (m['weekday'] as num?)?.toInt();
                        final startTime = (m['startTime'] ?? '--:--')
                            .toString();
                        final endTime = (m['endTime'] ?? '--:--').toString();
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: theme.colorScheme.outlineVariant,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: theme.colorScheme.onSurface.withValues(
                                  alpha: 0.03,
                                ),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary.withValues(
                                    alpha: 0.12,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.calendar_month_rounded,
                                  size: 20,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Thu ${weekday ?? '?'}',
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '$startTime - $endTime',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: theme
                                                .colorScheme
                                                .onSurfaceVariant,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    if (detail.modules.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      _SectionTitle(title: 'Syllabus', theme: theme),
                      const SizedBox(height: 8),
                      ...detail.modules.asMap().entries.map((entry) {
                        final idx = entry.key;
                        final mod = entry.value;
                        final lessons = mod['lessons'];
                        final lessonCount = lessons is List
                            ? lessons.length
                            : 0;
                        final lessonItems = (lessons is List)
                            ? lessons
                                  .whereType<Map>()
                                  .map((e) => Map<String, dynamic>.from(e))
                                  .toList()
                            : const <Map<String, dynamic>>[];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: theme.colorScheme.outlineVariant,
                            ),
                          ),
                          child: ExpansionTile(
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 2,
                            ),
                            childrenPadding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              bottom: 10,
                            ),
                            title: Text(
                              mod['title']?.toString().trim().isNotEmpty == true
                                  ? mod['title'].toString()
                                  : 'Chuong ${idx + 1}',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Text('$lessonCount bai hoc'),
                            children: lessonItems.isEmpty
                                ? [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Chua co danh sach bai hoc',
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              color: theme
                                                  .colorScheme
                                                  .onSurfaceVariant,
                                            ),
                                      ),
                                    ),
                                  ]
                                : lessonItems.asMap().entries.map((lEntry) {
                                    final lIndex = lEntry.key;
                                    final lesson = lEntry.value;
                                    final title =
                                        (lesson['title'] ??
                                                lesson['name'] ??
                                                lesson['lessonTitle'] ??
                                                'Bai hoc ${lIndex + 1}')
                                            .toString();
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 20,
                                            child: Text(
                                              '${lIndex + 1}.',
                                              style: theme.textTheme.bodySmall
                                                  ?.copyWith(
                                                    color: theme
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              title,
                                              style: theme.textTheme.bodySmall
                                                  ?.copyWith(height: 1.35),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                          ),
                        );
                      }),
                    ],
                    const SizedBox(height: 110),
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: !canPay
                        ? null
                        : () => context.push('/checkout/$classId?mode=LIVE'),
                    child: const Text(
                      'Tiếp tục thanh toán',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  !canPay
                      ? (detail.catalogProductId.isEmpty
                            ? 'Lớp chưa mở thanh toán.'
                            : 'Lớp đã đầy.')
                      : 'Bạn đăng ký đúng lớp này.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _stripHtml(String h) {
    return h
        .replaceAll(RegExp(r'<[^>]*>'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.theme});

  final String title;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
    );
  }
}

class _LecturerCard extends StatelessWidget {
  const _LecturerCard({
    required this.lecturer,
    required this.theme,
    required this.classId,
  });

  final Map<String, dynamic> lecturer;
  final ThemeData theme;
  final String classId;

  @override
  Widget build(BuildContext context) {
    final name = (lecturer['name'] ?? lecturer['fullName'] ?? 'Giang vien')
        .toString();
    final avatarUrl = lecturer['avatarUrl']?.toString();
    final subtitle = (lecturer['title'] ?? lecturer['email'] ?? '').toString();
    return InkWell(
      onTap: () =>
          context.push('/course-live/$classId/lecturer', extra: lecturer),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: theme.colorScheme.outlineVariant,
              backgroundImage: (avatarUrl != null && avatarUrl.isNotEmpty)
                  ? NetworkImage(avatarUrl)
                  : null,
              child: (avatarUrl == null || avatarUrl.isEmpty)
                  ? Text(
                      name.isNotEmpty
                          ? name.characters.first.toUpperCase()
                          : 'G',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
