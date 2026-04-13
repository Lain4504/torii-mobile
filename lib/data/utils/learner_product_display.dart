import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/data/models/live_product_detail_model.dart';

/// Đồng bộ quy tắc hiển thị giá/ngày với web-learner (`learner-product-display`).
/// Synchronization of rules with web-learner (`compute-learner-product-display.ts`).
class LearnerProductDisplay {
  const LearnerProductDisplay({
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

LearnerProductDisplay computeLearnerProductDisplay({
  required String productName,
  required String mode,
  String? className,
  String? courseProfileTitle,
  String? cohortName,
  String? cohortCode,
  DateTime? cohortOpeningDate,
  List<LiveClassModel> classesForProduct = const [],
}) {
  final isLive = mode.toUpperCase() == 'LIVE';
  final pn = productName.trim();
  final cn = (className ?? '').trim();
  final pt = (courseProfileTitle ?? '').trim();

  if (isLive) {
    String? liveContextLine;
    final chn = (cohortName ?? '').trim();
    final chc = (cohortCode ?? '').trim();
    if (chn.isNotEmpty || chc.isNotEmpty) {
      liveContextLine = 'Đợt khai giảng: ${chn.isNotEmpty ? chn : chc}';
    } else {
      var od = cohortOpeningDate;
      if (od == null && classesForProduct.isNotEmpty) {
        od = classesForProduct.first.openingDate;
      }
      if (od != null) {
        liveContextLine = 'Khai giảng: ${_formatOpeningVi(od)}';
      }
    }

    final title = pn.isNotEmpty
        ? pn
        : (pt.isNotEmpty ? pt : (cn.isNotEmpty ? cn : 'Khóa học'));

    return LearnerProductDisplay(
      learnerDisplayTitle: title,
      learnerMarketingSubtitle: null,
      liveContextLine: liveContextLine,
    );
  }

  final display = cn.isNotEmpty
      ? cn
      : (pt.isNotEmpty ? pt : (pn.isNotEmpty ? pn : 'Khóa học'));
  final subtitle = cn.isNotEmpty && pn.isNotEmpty && cn != pn ? pn : null;

  return LearnerProductDisplay(
    learnerDisplayTitle: display,
    learnerMarketingSubtitle: subtitle,
    liveContextLine: null,
  );
}

extension AcademyProductModelLearnerDisplay on AcademyProductModel {
  LearnerProductDisplay learnerProductDisplay({
    List<LiveClassModel> liveClasses = const [],
  }) {
    return computeLearnerProductDisplay(
      productName: name,
      mode: mode,
      className: null,
      courseProfileTitle: null,
      cohortName: null,
      cohortCode: code,
      cohortOpeningDate: startDate,
      classesForProduct: liveClasses,
    );
  }
}
