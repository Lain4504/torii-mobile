import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/data/models/academy_product_detail_model.dart';

class CurriculumScreen extends ConsumerWidget {
  const CurriculumScreen({
    super.key,
    required this.deliveryTargetId,
    this.productId,
    this.enrollmentId,
    this.mode = 'VOD',
    this.progressDisabled = false,
  });

  final String deliveryTargetId;
  final String? productId;
  final String? enrollmentId;
  final String mode;

  /// Khi `true`, không tính tiến độ + không mở khóa theo thứ tự.
  final bool progressDisabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = mode == 'LIVE'
        ? ref.watch(classCatalogLiveDetailProvider(deliveryTargetId))
        : ref.watch(classCatalogVodDetailProvider(deliveryTargetId));
    final useProgress = !progressDisabled && deliveryTargetId.isNotEmpty;
    final completedIds = useProgress
        ? (ref.watch(classCompletedLessonIdsProvider((deliveryTargetId: deliveryTargetId, mode: mode, productId: productId))).value ??
              const [])
        : const <String>[];
    final completed = completedIds.toSet();
    final assessmentsAsync = useProgress
        ? ref.watch(assessmentStatusProvider(
            assessmentStatusCacheKey(deliveryTargetId, enrollmentId),
          ))
        : const AsyncValue.data(<AssessmentMilestoneModel>[]);
    final assessments = assessmentsAsync.value ?? [];
    final assessmentsByExamId = <String, AssessmentMilestoneModel>{};
    for (final a in assessments) {
      assessmentsByExamId[a.examId] = a;
      assessmentsByExamId[a.id] = a;
    }
    
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(
            'Lỗi tải chương trình học: $e',
            style: const TextStyle(color: AppColors.error),
          ),
        ),
        data: (detail) {
          if (detail == null) {
            return const Center(child: Text('Không tìm thấy dữ liệu khóa học'));
          }

          final modules = detail.modules;

          final lessonOrder = <CurriculumLessonModel>[
            for (final module in modules) ...module.lessons,
          ];
          final lessonIndexById = <String, int>{
            for (int i = 0; i < lessonOrder.length; i++) lessonOrder[i].id: i,
          };
          final trackableOrdered = lessonOrder.where(_isTrackableKind).toList();

          final totalLessons = lessonOrder.length;
          final totalModules = modules.length;

          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCourseHeaderCard(
                  theme: theme,
                  title: detail.name.isNotEmpty
                      ? detail.name
                      : '',
                  code: detail.code ?? '',
                  descriptionHtml: detail.description ?? '',
                  totalLessons: totalLessons,
                  totalModules: totalModules,
                ),
                const SizedBox(height: 28),
                if (modules.isEmpty)
                  Text(
                    'Chương trình học đang được cập nhật.',
                    style: TextStyle(color: AppColors.grey700),
                  )
                else
                  ...modules.map(
                    (module) => _buildModuleItem(
                      module.title,
                      module.lessons.map((lesson) {
                        final idx = lessonIndexById[lesson.id] ?? -1;
                        final hasNext =
                            idx >= 0 && idx + 1 < lessonOrder.length;
                        final nextL = hasNext ? lessonOrder[idx + 1] : null;

                        final unlocked = _effectiveLessonUnlocked(
                          lesson: lesson,
                          trackableOrdered: trackableOrdered,
                          completed: completed,
                          assessmentsByExamId: assessmentsByExamId,
                          useProgress: useProgress,
                        );
                        return _buildLessonItem(
                          context,
                          enrollmentId: enrollmentId,
                          title: lesson.title.isNotEmpty
                              ? lesson.title
                              : 'Bài học',
                          duration: _labelByType(lesson.type),
                          icon: unlocked
                              ? _iconByType(lesson.type)
                              : Icons.lock_outline_rounded,
                          status: _lessonStatus(
                            lesson,
                            completed,
                            assessmentsByExamId,
                            unlocked,
                          ),
                          statusColor: _lessonStatusColor(
                            lesson,
                            completed,
                            assessmentsByExamId,
                            unlocked,
                          ),
                          locked: !unlocked,
                          lesson: _lessonPayload(
                            deliveryTargetId: deliveryTargetId,
                            productId: productId,
                            enrollmentId: enrollmentId,
                            mode: mode,
                            progressDisabled: progressDisabled,
                            lesson: lesson,
                            nextLesson: nextL,
                            assessmentId: lesson.type.toLowerCase() == 'quiz' ? assessmentsByExamId[lesson.id]?.id : null,
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

  Widget _buildCourseHeaderCard({
    required ThemeData theme,
    required String title,
    required String code,
    required String? descriptionHtml,
    required int totalLessons,
    required int totalModules,
  }) {
    final desc = _stripHtml(descriptionHtml ?? '');
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
            title.isNotEmpty ? title : 'Lớp học',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: 0.1,
            ),
          ),
          if (code.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              'Mã lớp: $code',
              style: TextStyle(
                color: AppColors.grey700,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          const SizedBox(height: 8),
          Text(
            desc.isNotEmpty ? desc : 'Lộ trình học đang được cập nhật.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.grey700,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.menu_book_outlined,
                size: 16,
                color: AppColors.grey700,
              ),
              const SizedBox(width: 4),
              Text(
                '$totalLessons bài học • $totalModules module',
                style: TextStyle(color: AppColors.grey700, fontSize: 12),
              ),
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
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        initiallyExpanded: true,
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        children: lessons,
      ),
    );
  }

  Widget _buildLessonItem(
    BuildContext context, {
    String? enrollmentId,
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
                  const SnackBar(
                    content: Text('Hãy hoàn thành nội dung trước đó để mở khóa.'),
                  ),
                );
              }
            : () {
                if (lesson['type'] == 'quiz') {
                  final assId = lesson['assessmentId'] ?? '';
                  final eid = (enrollmentId ?? lesson['enrollmentId'] ?? '')
                      .toString();
                  if (eid.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Thiếu mã ghi danh. Mở lộ trình từ "Khóa học của tôi".',
                        ),
                      ),
                    );
                    return;
                  }
                  context.push(
                    '/quiz/${lesson['id']}?deliveryTargetId=${lesson['deliveryTargetId']}&enrollmentId=$eid${assId.toString().isNotEmpty ? '&assessmentId=$assId' : ''}',
                  );
                } else {
                  context.push('/lesson', extra: lesson);
                }
              },
        child: Row(
          children: [
            Icon(icon, color: AppColors.textTertiary, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    duration,
                    style: TextStyle(color: AppColors.grey700, fontSize: 13),
                  ),
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
                style: TextStyle(
                  color: statusColor,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              locked ? Icons.lock_outline : Icons.chevron_right,
              color: AppColors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }
}

bool _isTrackableKind(CurriculumLessonModel l) {
  final t = l.type.toUpperCase();
  return t == 'VIDEO' || t == 'READING' || t == 'ARTICLE' || t == 'QUIZ';
}

bool _effectiveLessonUnlocked({
  required CurriculumLessonModel lesson,
  required List<CurriculumLessonModel> trackableOrdered,
  required Set<String> completed,
  required Map<String, AssessmentMilestoneModel> assessmentsByExamId,
  required bool useProgress,
}) {
  if (!useProgress) return true;
  final idx = trackableOrdered.indexWhere((l) => l.id == lesson.id);
  if (idx <= 0) return true;
  
  final prev = trackableOrdered[idx - 1];
  if (prev.type.toUpperCase() == 'QUIZ') {
    final quizStatus = assessmentsByExamId[prev.id];
    return quizStatus?.isPassed ?? false;
  }
  
  return completed.contains(prev.id);
}

String _lessonStatus(
  CurriculumLessonModel lesson,
  Set<String> completed,
  Map<String, AssessmentMilestoneModel> assessmentsByExamId,
  bool unlocked,
) {
  if (!unlocked) return 'Đã khóa';
  if (lesson.type.toUpperCase() == 'QUIZ') {
    final assessment = assessmentsByExamId[lesson.id];
    if (assessment == null) return 'Bắt đầu';
    switch (assessment.status) {
      case 'PASSED': return 'Hoàn thành';
      case 'FAILED': return 'Thử lại';
      case 'IN_PROGRESS': return 'Đang làm';
      default: return 'Bắt đầu';
    }
  }
  return completed.contains(lesson.id) ? 'Hoàn thành' : 'Chưa học';
}

Color _lessonStatusColor(
  CurriculumLessonModel lesson,
  Set<String> completed,
  Map<String, AssessmentMilestoneModel> assessmentsByExamId,
  bool unlocked,
) {
  if (!unlocked) return AppColors.textTertiary;
  if (lesson.type.toUpperCase() == 'QUIZ') {
    final assessment = assessmentsByExamId[lesson.id];
    if (assessment == null) return AppColors.textTertiary;
    switch (assessment.status) {
      case 'PASSED': return AppColors.success;
      case 'FAILED': return AppColors.error;
      case 'IN_PROGRESS': return AppColors.primary;
      default: return AppColors.textTertiary;
    }
  }
  return completed.contains(lesson.id) ? AppColors.success : AppColors.textTertiary;
}

Map<String, dynamic> _lessonPayload({
  required String deliveryTargetId,
  String? productId,
  String? enrollmentId,
  required String mode,
  required CurriculumLessonModel lesson,
  CurriculumLessonModel? nextLesson,
  bool progressDisabled = false,
  String? assessmentId,
}) {
  final effectiveProductId =
      (productId != null && productId.isNotEmpty) ? productId : deliveryTargetId;
  return <String, dynamic>{
    if (deliveryTargetId.isNotEmpty) 'deliveryTargetId': deliveryTargetId,
    if (enrollmentId != null && enrollmentId.isNotEmpty)
      'enrollmentId': enrollmentId,
    'productId': effectiveProductId,
    if (mode.isNotEmpty) 'mode': mode,
    if (progressDisabled) 'progressDisabled': true,
    if (assessmentId != null) 'assessmentId': assessmentId,
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
        if (deliveryTargetId.isNotEmpty) 'deliveryTargetId': deliveryTargetId,
        if (enrollmentId != null && enrollmentId.isNotEmpty)
          'enrollmentId': enrollmentId,
        'productId': effectiveProductId,
        if (mode.isNotEmpty) 'mode': mode,
        if (progressDisabled) 'progressDisabled': true,
        'id': nextLesson.id,
        'title': nextLesson.title,
        'type': nextLesson.type.toLowerCase(),
        'videoUrl': nextLesson.videoUrl,
        'article': <String, dynamic>{
          'title': nextLesson.title,
          'content':
              nextLesson.content ?? 'Nội dung bài học đang được cập nhật.',
        },
      },
  };
}

String _stripHtml(String h) {
  return h
      .replaceAll(RegExp(r'<[^>]*>'), ' ')
      .replaceAll(RegExp(r'\\s+'), ' ')
      .trim();
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
