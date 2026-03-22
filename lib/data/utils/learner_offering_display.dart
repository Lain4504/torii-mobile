import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/data/models/live_offering_detail_model.dart';

/// Đồng bộ quy tắc với web-learner (`learner-offering-display.ts`).
class LearnerOfferingDisplay {
  const LearnerOfferingDisplay({
    required this.learnerDisplayTitle,
    this.learnerMarketingSubtitle,
    this.liveContextLine,
  });

  final String learnerDisplayTitle;
  final String? learnerMarketingSubtitle;
  final String? liveContextLine;
}

String _formatOpeningVi(DateTime d) {
  return '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
}

LearnerOfferingDisplay computeLearnerOfferingDisplay({
  required String offeringTitle,
  required String mode,
  String? className,
  String? courseProfileTitle,
  String? termName,
  String? termCode,
  DateTime? termOpeningDate,
  List<LiveClassModel> classesForTerm = const [],
}) {
  final isLive = mode.toUpperCase() == 'LIVE';
  final ot = offeringTitle.trim();
  final cn = (className ?? '').trim();
  final pt = (courseProfileTitle ?? '').trim();

  if (isLive) {
    String? liveContextLine;
    final tn = (termName ?? '').trim();
    final tc = (termCode ?? '').trim();
    if (tn.isNotEmpty || tc.isNotEmpty) {
      liveContextLine = 'Kỳ: ${tn.isNotEmpty ? tn : tc}';
    } else {
      var od = termOpeningDate;
      if (od == null && classesForTerm.isNotEmpty) {
        od = classesForTerm.first.openingDate;
      }
      if (od != null) {
        liveContextLine = 'Khai giảng: ${_formatOpeningVi(od)}';
      }
    }

    final title = ot.isNotEmpty
        ? ot
        : (pt.isNotEmpty ? pt : (cn.isNotEmpty ? cn : 'Khóa học'));

    return LearnerOfferingDisplay(
      learnerDisplayTitle: title,
      learnerMarketingSubtitle: null,
      liveContextLine: liveContextLine,
    );
  }

  final display = cn.isNotEmpty
      ? cn
      : (pt.isNotEmpty ? pt : (ot.isNotEmpty ? ot : 'Khóa học'));
  final subtitle = cn.isNotEmpty && ot.isNotEmpty && cn != ot ? ot : null;

  return LearnerOfferingDisplay(
    learnerDisplayTitle: display,
    learnerMarketingSubtitle: subtitle,
    liveContextLine: null,
  );
}

extension CourseOfferingModelLearnerDisplay on CourseOfferingModel {
  LearnerOfferingDisplay learnerOfferingDisplay({
    List<LiveClassModel> liveClasses = const [],
  }) {
    return computeLearnerOfferingDisplay(
      offeringTitle: title,
      mode: mode,
      className: className,
      courseProfileTitle: courseProfileTitle,
      termName: termName,
      termCode: termCode,
      termOpeningDate: termOpeningDate,
      classesForTerm: liveClasses,
    );
  }
}
