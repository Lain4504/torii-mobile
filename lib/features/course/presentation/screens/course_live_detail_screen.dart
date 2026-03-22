import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/live_offering_detail_model.dart';
import 'package:torii_app/data/utils/learner_offering_display.dart';

class CourseLiveDetailScreen extends ConsumerStatefulWidget {
  const CourseLiveDetailScreen({super.key, required this.courseId});
  final String courseId;

  @override
  ConsumerState<CourseLiveDetailScreen> createState() => _CourseLiveDetailScreenState();
}

class _CourseLiveDetailScreenState extends ConsumerState<CourseLiveDetailScreen> {
  String? _selectedClassId;

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(liveOfferingDetailProvider(widget.courseId));

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) return const Center(child: Text('Không tìm thấy khóa học'));
          return _buildContent(context, detail);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e', style: TextStyle(color: AppColors.error))),
      ),
    );
  }

  Widget _buildContent(BuildContext context, LiveOfferingDetailModel detail) {
    final offering = detail.offering;
    final disp = offering.learnerOfferingDisplay(liveClasses: detail.classes);
    final classes = detail.classes.where((c) => c.isLive).toList();
    final priceStr =
        '${offering.displayPrice.toInt().toString().replaceAllMapped(RegExp(r'(\\d{1,3})(?=(\\d{3})+(?!\\d))'), (m) => '${m[1]}.')}đ';

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
                  offering.thumbnailUrl ?? 'https://picsum.photos/seed/course_live/800/600',
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
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.error.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: AppColors.error.withOpacity(0.2)),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.videocam_outlined, size: 14, color: AppColors.error),
                              SizedBox(width: 6),
                              Text('LIVE', style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w800, fontSize: 12)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(priceStr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary)),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      disp.learnerDisplayTitle,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    if (disp.liveContextLine != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        disp.liveContextLine!,
                        style: TextStyle(fontSize: 14, color: AppColors.grey700, fontWeight: FontWeight.w600),
                      ),
                    ],
                    const SizedBox(height: 12),
                    if ((offering.description ?? '').isNotEmpty) ...[
                      Text(offering.description!, style: const TextStyle(height: 1.55, color: AppColors.textPrimary)),
                      const SizedBox(height: 16),
                    ],
                    const Divider(height: 40),
                    const Text('Chọn lớp học', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    if (classes.isEmpty)
                      Text('Chưa có lớp LIVE khả dụng.', style: TextStyle(color: AppColors.grey700, height: 1.5))
                    else
                      Column(
                        children: classes
                            .map(
                              (c) => _LiveClassTile(
                                klass: c,
                                selected: _selectedClassId == c.id,
                                onTap: () => setState(() => _selectedClassId = c.id),
                              ),
                            )
                            .toList(),
                      ),
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
                  color: AppColors.textPrimary.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _selectedClassId == null
                        ? null
                        : () {
                            final classId = _selectedClassId!;
                            context.push('/checkout/${offering.id}?classId=$classId');
                          },
                    child: const Text('Tiếp tục', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _selectedClassId == null ? 'Vui lòng chọn một lớp để tiếp tục.' : 'Bạn có thể đổi lớp trước khi thanh toán.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11, color: AppColors.grey700, height: 1.4),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LiveClassTile extends StatelessWidget {
  const _LiveClassTile({
    required this.klass,
    required this.selected,
    required this.onTap,
  });

  final LiveClassModel klass;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderColor = selected ? AppColors.primary : AppColors.grey200;
    final bgColor = selected ? AppColors.primary.withOpacity(0.04) : AppColors.surface;

    String? dateLine;
    if (klass.openingDate != null || klass.closingDate != null) {
      final df = DateFormat('dd/MM/yyyy');
      final open = klass.openingDate != null ? df.format(klass.openingDate!) : '?';
      final close = klass.closingDate != null ? df.format(klass.closingDate!) : '?';
      dateLine = 'Khai giảng: $open • Bế giảng: $close';
    }

    String? enrollLine;
    if (klass.enrollmentOpenAt != null || klass.enrollmentCloseAt != null) {
      final df = DateFormat('dd/MM/yyyy');
      final open = klass.enrollmentOpenAt != null ? df.format(klass.enrollmentOpenAt!) : '?';
      final close = klass.enrollmentCloseAt != null ? df.format(klass.enrollmentCloseAt!) : '?';
      enrollLine = 'Đăng ký: $open – $close';
    }

    final codeOrName = klass.name.isNotEmpty ? klass.name : (klass.code.isNotEmpty ? klass.code : 'Lớp học');
    final subtitleLines = <String>[
      if ((klass.instructorName ?? '').isNotEmpty) 'GV: ${klass.instructorName}',
      if (dateLine != null) dateLine,
      if (enrollLine != null) enrollLine,
    ];

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 22,
              height: 22,
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: selected ? AppColors.primary : AppColors.grey700, width: 2),
              ),
              child: selected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          codeOrName,
                          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (klass.isEnrollableNow)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: const Text(
                            'Đang mở đăng ký',
                            style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w800, fontSize: 10),
                          ),
                        ),
                    ],
                  ),
                  if (klass.code.isNotEmpty && klass.name.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text('Mã lớp: ${klass.code}', style: TextStyle(color: AppColors.grey700, fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                  if (subtitleLines.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    ...subtitleLines.map(
                      (t) => Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(t, style: TextStyle(color: AppColors.grey700, fontSize: 12, height: 1.35)),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

