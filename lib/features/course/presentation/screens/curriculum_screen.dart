import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/course_offering_detail_model.dart';
import 'package:torii_app/data/utils/learner_offering_display.dart';

class CurriculumScreen extends ConsumerWidget {
  const CurriculumScreen({
    super.key,
    required this.offeringId,
    this.classId,
    this.progressDisabled = false,
  });

  final String offeringId;
  /// Từ enrollment — cần để tiến độ & khóa bài học tuần tự.
  final String? classId;
  /// Khóa LIVE: xem lộ trình tham khảo, không khóa/không tính tiến độ (parity web).
  final bool progressDisabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(courseOfferingDetailRichProvider(offeringId));
    final useProgress =
        !progressDisabled && classId != null && classId!.isNotEmpty;
    final completedIds = useProgress
        ? (ref.watch(classCompletedLessonIdsProvider(classId!)).value ?? const [])
        : const <String>[];
    final completed = completedIds.toSet();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Lộ trình khóa học',
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary), onPressed: () => Navigator.pop(context)),
      ),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi tải chương trình học: $e', style: const TextStyle(color: AppColors.error))),
        data: (detail) {
          if (detail == null) {
            return const Center(child: Text('Không tìm thấy dữ liệu khóa học'));
          }

          final lessonOrder = <CurriculumLessonModel>[
            for (final module in detail.modules) ...module.lessons,
          ];
          final lessonIndexById = <String, int>{
            for (int i = 0; i < lessonOrder.length; i++) lessonOrder[i].id: i,
          };
          final trackableOrdered = lessonOrder.where(_isTrackableKind).toList();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCourseHeaderCard(theme, detail),
                const SizedBox(height: 28),
                if (detail.modules.isEmpty)
                  Text(
                    'Chương trình học đang được cập nhật.',
                    style: TextStyle(color: AppColors.grey700),
                  )
                else
                  ...detail.modules.map(
                    (module) => _buildModuleItem(
                      module.title,
                      module.lessons.map((lesson) {
                        final idx = lessonIndexById[lesson.id] ?? -1;
                        final hasNext = idx >= 0 && idx + 1 < lessonOrder.length;
                        final nextL = hasNext ? lessonOrder[idx + 1] : null;
                        final unlocked = _effectiveLessonUnlocked(
                          lesson: lesson,
                          trackableOrdered: trackableOrdered,
                          completed: completed,
                          useProgress: useProgress,
                        );
                        final done =
                            useProgress && _isTrackableKind(lesson) && completed.contains(lesson.id);
                        final status = !unlocked
                            ? 'Đã khóa'
                            : (done ? 'Hoàn thành' : 'Chưa học');
                        final statusColor =
                            !unlocked ? AppColors.textTertiary : (done ? AppColors.success : AppColors.textTertiary);
                        return _buildLessonItem(
                          context,
                          title: lesson.title.isNotEmpty ? lesson.title : 'Bài học',
                          duration: _labelByType(lesson.type),
                          icon: unlocked ? _iconByType(lesson.type) : Icons.lock_outline_rounded,
                          status: status,
                          statusColor: statusColor,
                          locked: !unlocked,
                          lesson: _lessonPayload(
                            offeringId: offeringId,
                            classId: classId,
                            progressDisabled: progressDisabled,
                            lesson: lesson,
                            nextLesson: nextL,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCourseHeaderCard(ThemeData theme, CourseOfferingDetailModel detail) {
    final totalLessons = detail.modules.fold<int>(0, (sum, m) => sum + m.lessons.length);
    final totalModules = detail.modules.length;
    final disp = detail.offering.learnerOfferingDisplay(liveClasses: detail.siblingClasses);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            disp.learnerDisplayTitle,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: 0.1,
            ),
          ),
          if (disp.liveContextLine != null) ...[
            const SizedBox(height: 6),
            Text(
              disp.liveContextLine!,
              style: TextStyle(
                color: AppColors.grey700,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          if (disp.learnerMarketingSubtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              'Tên gói bán: ${disp.learnerMarketingSubtitle}',
              style: TextStyle(color: AppColors.grey700, fontSize: 12, height: 1.35),
            ),
          ],
          const SizedBox(height: 8),
          Text(
            detail.offering.description?.trim().isNotEmpty == true
                ? detail.offering.description!
                : 'Lộ trình học đang được cập nhật.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.grey700,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.menu_book_outlined, size: 16, color: AppColors.grey700),
              const SizedBox(width: 4),
              Text('$totalLessons bài học • $totalModules module', style: TextStyle(color: AppColors.grey700, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildModuleItem(String title, List<Widget> lessons) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        initiallyExpanded: true,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: lessons,
      ),
    );
  }

  Widget _buildLessonItem(
    BuildContext context, {
    required String title,
    required String duration,
    required IconData icon,
    required String status,
    required Color statusColor,
    required Map<String, dynamic> lesson,
    required bool locked,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: locked
            ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Hoàn thành bài trước để mở khóa bài này.')),
                );
              }
            : () => context.push('/lesson', extra: lesson),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textTertiary, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(duration, style: TextStyle(color: AppColors.grey700, fontSize: 13)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 6),
            Icon(locked ? Icons.lock_outline : Icons.chevron_right, color: AppColors.textTertiary),
          ],
        ),
      ),
    );
  }
}

bool _isTrackableKind(CurriculumLessonModel l) {
  final t = l.type.toUpperCase();
  return t == 'VIDEO' || t == 'READING' || t == 'ARTICLE';
}

bool _effectiveLessonUnlocked({
  required CurriculumLessonModel lesson,
  required List<CurriculumLessonModel> trackableOrdered,
  required Set<String> completed,
  required bool useProgress,
}) {
  if (!_isTrackableKind(lesson)) return true;
  if (!useProgress) return true;
  final idx = trackableOrdered.indexWhere((l) => l.id == lesson.id);
  if (idx <= 0) return true;
  return completed.contains(trackableOrdered[idx - 1].id);
}

Map<String, dynamic> _lessonPayload({
  required String offeringId,
  required CurriculumLessonModel lesson,
  CurriculumLessonModel? nextLesson,
  String? classId,
  bool progressDisabled = false,
}) {
  return <String, dynamic>{
    'offeringId': offeringId,
    if (classId != null && classId.isNotEmpty) 'classId': classId,
    if (progressDisabled) 'progressDisabled': true,
    'id': lesson.id,
    'title': lesson.title,
    'type': lesson.type.toLowerCase(),
    'videoUrl': lesson.videoUrl,
    'article': <String, dynamic>{
      'title': lesson.title,
      'content': lesson.content ?? 'Nội dung bài học đang được cập nhật.',
    },
    if (nextLesson != null)
      'nextLesson': <String, dynamic>{
        'offeringId': offeringId,
        if (classId != null && classId.isNotEmpty) 'classId': classId,
        if (progressDisabled) 'progressDisabled': true,
        'id': nextLesson.id,
        'title': nextLesson.title,
        'type': nextLesson.type.toLowerCase(),
        'videoUrl': nextLesson.videoUrl,
        'article': <String, dynamic>{
          'title': nextLesson.title,
          'content': nextLesson.content ?? 'Nội dung bài học đang được cập nhật.',
        },
      },
  };
}

IconData _iconByType(String type) {
  switch (type.toUpperCase()) {
    case 'READING':
    case 'ARTICLE':
      return Icons.article_outlined;
    case 'QUIZ':
      return Icons.quiz_rounded;
    case 'VIDEO':
    default:
      return Icons.play_circle_fill;
  }
}

String _labelByType(String type) {
  switch (type.toUpperCase()) {
    case 'READING':
    case 'ARTICLE':
      return 'Bài đọc';
    case 'QUIZ':
      return 'Quiz';
    case 'VIDEO':
    default:
      return 'Video';
  }
}
