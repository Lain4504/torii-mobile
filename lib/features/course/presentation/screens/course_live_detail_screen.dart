import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/class_catalog_model.dart';

/// Chi tiết một lớp LIVE (classId) — không chọn batch; đăng ký đúng lớp đó.
class CourseLiveDetailScreen extends ConsumerWidget {
  const CourseLiveDetailScreen({super.key, required this.classId});
  final String classId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(classCatalogLiveDetailProvider(classId));

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return const Center(child: Text('Không tìm thấy lớp'));
          }
          return _buildContent(context, detail);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text('Lỗi: $e', style: TextStyle(color: AppColors.error)),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ClassCatalogDetailModel detail) {
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
              backgroundColor: AppColors.primary,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  thumb,
                  fit: BoxFit.cover,
                  errorBuilder: (_, error, stackTrace) => Container(
                    color: AppColors.grey200,
                    child: const Icon(Icons.school, size: 64),
                  ),
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
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.textPrimary,
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
                            color: AppColors.error.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: AppColors.error.withValues(alpha: 0.2),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.videocam_outlined,
                                size: 14,
                                color: AppColors.error,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'LIVE',
                                style: TextStyle(
                                  color: AppColors.error,
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
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
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
                      style: TextStyle(color: AppColors.grey700, fontSize: 13),
                    ),
                    if (opening != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Khai giảng: ${DateFormat('dd/MM/yyyy').format(opening)}',
                        style: TextStyle(
                          color: AppColors.grey700,
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
                              ? AppColors.error
                              : AppColors.grey700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    if ((detail.descriptionHtml ?? '').isNotEmpty) ...[
                      Text(
                        _stripHtml(detail.descriptionHtml!),
                        style: const TextStyle(
                          height: 1.55,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    const Divider(height: 40),
                    const Text(
                      'Lịch & nội dung',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (item.liveSchedules.isEmpty)
                      Text(
                        'Khung giờ học sẽ được cập nhật.',
                        style: TextStyle(color: AppColors.grey700),
                      )
                    else
                      ...item.liveSchedules.map((s) {
                        final m = Map<String, dynamic>.from(s as Map);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            'Thứ ${(m['weekday'] as num?)?.toInt() ?? '?'} • ${m['startTime']}-${m['endTime']}',
                            style: TextStyle(
                              color: AppColors.grey700,
                              fontSize: 13,
                            ),
                          ),
                        );
                      }),
                    if (detail.modules.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      const Text(
                        'Chương trình (tham khảo)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...detail.modules.map(
                        (mod) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            '• ${mod['title'] ?? 'Chương'}',
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
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
              color: AppColors.surface,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textPrimary.withValues(alpha: 0.05),
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
                    color: AppColors.grey700,
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
