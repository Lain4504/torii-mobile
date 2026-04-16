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
          final moduleOrderMap = <String, int>{
            for (int i = 0; i < modules.length; i++) modules[i].id: i,
          };
          final lessonOrderMeta = <String, ({int moduleOrder, int lessonOrder, String moduleId})>{
            for (int mi = 0; mi < modules.length; mi++)
              for (int li = 0; li < modules[mi].lessons.length; li++)
                modules[mi].lessons[li].id: (
                  moduleOrder: mi,
                  lessonOrder: li,
                  moduleId: modules[mi].id,
                ),
          };
          final lessonIndexById = <String, int>{
            for (int i = 0; i < lessonOrder.length; i++) lessonOrder[i].id: i,
          };
          final trackableOrdered = lessonOrder.where(_isTrackableKind).toList();
          final completedTrackable = trackableOrdered
              .where(
                (l) => _isTrackableDone(
                  l,
                  completed,
                  assessmentsByExamId,
                ),
              )
              .length;

          final lessonMilestonesByLessonId = <String, List<AssessmentMilestoneModel>>{};
          final moduleMilestonesByModuleId = <String, List<AssessmentMilestoneModel>>{};
          final finalMilestones = <AssessmentMilestoneModel>[];
          for (final m in assessments) {
            final kind = _normalizeItemKind(m.kind);
            if (kind == 'FINAL_EXAM') {
              finalMilestones.add(m);
              continue;
            }
            if ((kind == 'MODULE_CHECKPOINT' ||
                    kind == 'MODULE_TEST' ||
                    kind == 'MODULE_EXAM') &&
                (m.moduleId ?? '').isNotEmpty) {
              moduleMilestonesByModuleId
                  .putIfAbsent(m.moduleId!, () => <AssessmentMilestoneModel>[])
                  .add(m);
              continue;
            }
            if ((kind == 'LESSON_CHECKPOINT' || kind == 'LESSON_TEST') &&
                (m.triggerLessonId ?? '').isNotEmpty) {
              lessonMilestonesByLessonId
                  .putIfAbsent(m.triggerLessonId!, () => <AssessmentMilestoneModel>[])
                  .add(m);
            }
          }

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
                          milestones: assessments,
                          lessonOrderMeta: lessonOrderMeta,
                          moduleOrderMap: moduleOrderMap,
                          useProgress: useProgress,
                          mode: mode,
                        );
                        final lessonDone = _isTrackableDone(
                          lesson,
                          completed,
                          assessmentsByExamId,
                        );
                        final lessonMilestones =
                            lessonMilestonesByLessonId[lesson.id] ?? const [];
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
                          children: lessonMilestones
                              .map(
                                (m) => _buildMilestoneItem(
                                  context,
                                  milestone: m,
                                  forceLocked: mode.toUpperCase() == 'LIVE' ? false : !lessonDone,
                                ),
                              )
                              .toList(),
                        );
                      }).toList()
                        ..addAll(
                          (moduleMilestonesByModuleId[module.id] ?? const [])
                              .map((m) {
                            final moduleTrackable = module.lessons
                                .where(_isTrackableKind)
                                .toList();
                            final canOpen = moduleTrackable.isNotEmpty &&
                                moduleTrackable.every(
                                  (l) => _isTrackableDone(
                                    l,
                                    completed,
                                    assessmentsByExamId,
                                  ),
                                );
                            return _buildMilestoneItem(
                              context,
                              milestone: m,
                              forceLocked: mode.toUpperCase() == 'LIVE' ? false : !canOpen,
                            );
                          }),
                        ),
                    ),
                  ),
                if (finalMilestones.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  _buildFinalExamBlock(
                    context,
                    finalMilestones: finalMilestones,
                    forceLocked: mode.toUpperCase() == 'LIVE' ? false : completedTrackable < trackableOrdered.length,
                  ),
                ],
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
    List<Widget> children = const [],
  }) {
    return Column(
      children: [
        Padding(
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
    ),
        ...children,
      ],
    );
  }

  Widget _buildMilestoneItem(
    BuildContext context, {
    required AssessmentMilestoneModel milestone,
    required bool forceLocked,
  }) {
    final theme = Theme.of(context);
    final isLocked = forceLocked || milestone.isLocked;
    final isPassed = milestone.isPassed;
    final statusText = isPassed
        ? (milestone.percentage != null
            ? '${milestone.percentage!.round()}% đạt'
            : 'Đã đạt')
        : (milestone.status == 'FAILED'
            ? 'Cần làm lại'
            : (isLocked ? 'Đã khóa' : 'Sẵn sàng'));

    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 4, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isPassed
                ? Colors.green.withValues(alpha: 0.35)
                : theme.colorScheme.outlineVariant,
          ),
        ),
        child: ListTile(
          dense: true,
          enabled: !isLocked,
          onTap: isLocked ? null : () => _openMilestoneQuiz(context, milestone),
          leading: Icon(
            isPassed ? Icons.emoji_events_outlined : Icons.quiz_outlined,
            color: isPassed ? Colors.green : theme.colorScheme.primary,
            size: 18,
          ),
          title: Text(
            milestone.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            _normalizeItemKind(milestone.kind) == 'FINAL_EXAM'
                ? 'Thử thách cuối khóa'
                : 'Bài kiểm tra',
            style: TextStyle(
              fontSize: 10,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          trailing: Text(
            statusText,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: isPassed
                  ? Colors.green
                  : (isLocked ? theme.colorScheme.outline : theme.colorScheme.primary),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFinalExamBlock(
    BuildContext context, {
    required List<AssessmentMilestoneModel> finalMilestones,
    required bool forceLocked,
  }) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thử thách cuối khóa',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          ...finalMilestones.map(
            (m) => _buildMilestoneItem(
              context,
              milestone: m,
              forceLocked: forceLocked,
            ),
          ),
        ],
      ),
    );
  }

  void _openMilestoneQuiz(BuildContext context, AssessmentMilestoneModel milestone) {
    final examPath = milestone.examId.isNotEmpty && milestone.examId != 'null'
        ? milestone.examId
        : 'unknown';
    if (enrollmentId == null || enrollmentId!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thiếu mã ghi danh. Mở lộ trình từ "Khóa học của tôi".'),
        ),
      );
      return;
    }
    context.push(
      '/quiz/$examPath?deliveryTargetId=$deliveryTargetId&enrollmentId=$enrollmentId&assessmentId=${milestone.id}',
    );
  }
}

bool _isTrackableKind(CurriculumLessonModel l) {
  final t = l.type.toUpperCase();
  return t == 'VIDEO' || t == 'READING' || t == 'ARTICLE' || t == 'QUIZ';
}

bool _isTrackableDone(
  CurriculumLessonModel lesson,
  Set<String> completed,
  Map<String, AssessmentMilestoneModel> assessmentsByExamId,
) {
  if (lesson.type.toUpperCase() == 'QUIZ') {
    final quizStatus = assessmentsByExamId[lesson.id];
    return quizStatus?.isPassed ?? false;
  }
  return completed.contains(lesson.id);
}

bool _effectiveLessonUnlocked({
  required CurriculumLessonModel lesson,
  required List<CurriculumLessonModel> trackableOrdered,
  required Set<String> completed,
  required Map<String, AssessmentMilestoneModel> assessmentsByExamId,
  required List<AssessmentMilestoneModel> milestones,
  required Map<String, ({int moduleOrder, int lessonOrder, String moduleId})>
      lessonOrderMeta,
  required Map<String, int> moduleOrderMap,
  required bool useProgress,
  required String mode,
}) {
  if (!useProgress || mode.toUpperCase() == 'LIVE') return true;
  final idx = trackableOrdered.indexWhere((l) => l.id == lesson.id);
  if (idx <= 0) return true;
  
  final prev = trackableOrdered[idx - 1];
  if (prev.type.toUpperCase() == 'QUIZ') {
    final quizStatus = assessmentsByExamId[prev.id];
    if (quizStatus == null) return false;
    
    // Check if it's a required milestone with a score requirement
    if (quizStatus.isRequired && (quizStatus.percentage ?? 0) < 50) {
      return false;
    }
    return quizStatus.isPassed;
  }

  if (!completed.contains(prev.id)) return false;
  return !_hasBlockingRequiredMilestoneBeforeLesson(
    lesson: lesson,
    milestones: milestones,
    lessonOrderMeta: lessonOrderMeta,
    moduleOrderMap: moduleOrderMap,
  );
}

bool _hasBlockingRequiredMilestoneBeforeLesson({
  required CurriculumLessonModel lesson,
  required List<AssessmentMilestoneModel> milestones,
  required Map<String, ({int moduleOrder, int lessonOrder, String moduleId})>
      lessonOrderMeta,
  required Map<String, int> moduleOrderMap,
}) {
  final lessonMeta = lessonOrderMeta[lesson.id];
  if (lessonMeta == null) return false;
  for (final m in milestones) {
    if (!m.isRequired || m.isPassed) continue;
    final kind = _normalizeItemKind(m.kind);
    if (kind == 'LESSON_CHECKPOINT' && (m.triggerLessonId ?? '').isNotEmpty) {
      final triggerMeta = lessonOrderMeta[m.triggerLessonId!];
      if (triggerMeta == null) continue;
      if (triggerMeta.moduleOrder < lessonMeta.moduleOrder) return true;
      if (triggerMeta.moduleId == lessonMeta.moduleId &&
          triggerMeta.lessonOrder < lessonMeta.lessonOrder) {
        return true;
      }
    }
    if (kind == 'MODULE_CHECKPOINT' && (m.moduleId ?? '').isNotEmpty) {
      final milestoneModuleOrder = moduleOrderMap[m.moduleId!];
      if (milestoneModuleOrder == null) continue;
      if (milestoneModuleOrder < lessonMeta.moduleOrder) return true;
    }
  }
  return false;
}

String _normalizeItemKind(String? kind) => (kind ?? '').toUpperCase();

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
    if (lesson.videoFileId != null && lesson.videoFileId!.isNotEmpty)
      'videoFileId': lesson.videoFileId,
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
        if (nextLesson.videoFileId != null && nextLesson.videoFileId!.isNotEmpty)
          'videoFileId': nextLesson.videoFileId,
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
