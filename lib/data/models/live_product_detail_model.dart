import 'academy_models.dart';

class LiveEnrollmentSummary {
  final int activeEnrollmentCount;
  final int? maxStudents;
  final int? spotsLeft;
  final bool isFull;

  const LiveEnrollmentSummary({
    required this.activeEnrollmentCount,
    this.maxStudents,
    this.spotsLeft,
    required this.isFull,
  });

  static LiveEnrollmentSummary? tryParse(Object? raw) {
    if (raw is! Map) return null;
    final m = raw.cast<String, dynamic>();
    return LiveEnrollmentSummary(
      activeEnrollmentCount: (m['activeEnrollmentCount'] as num?)?.toInt() ?? 0,
      maxStudents: (m['maxStudents'] as num?)?.toInt(),
      spotsLeft: (m['spotsLeft'] as num?)?.toInt(),
      isFull: m['isFull'] as bool? ?? false,
    );
  }
}

class LiveClassModel {
  final String id;
  final String code;
  final String name;
  final String mode;
  final String? status;
  final DateTime? openingDate;
  final DateTime? closingDate;
  final DateTime? enrollmentOpenAt;
  final DateTime? enrollmentCloseAt;
  final String? instructorName;
  final String? instructorAvatarUrl;
  final double? price;
  final double? discountPrice;
  final LiveEnrollmentSummary? liveEnrollment;

  const LiveClassModel({
    required this.id,
    required this.code,
    required this.name,
    required this.mode,
    this.status,
    this.openingDate,
    this.closingDate,
    this.enrollmentOpenAt,
    this.enrollmentCloseAt,
    this.instructorName,
    this.instructorAvatarUrl,
    this.price,
    this.discountPrice,
    this.liveEnrollment,
  });

  factory LiveClassModel.fromJson(Map<String, dynamic> json) {
    final instructor = json['instructor'];
    final instructorMap = instructor is Map
        ? instructor.cast<String, dynamic>()
        : null;
    final displayName = instructorMap?['displayName'] as String?;
    final avatarUrl = instructorMap?['avatarUrl'] as String?;
    final cohort = json['cohort'];
    final cohortMap = cohort is Map ? cohort.cast<String, dynamic>() : null;

    final openingDate = _tryParseDateTime(cohortMap?['startDate']);
    final closingDate = _tryParseDateTime(cohortMap?['endDate']);
    final enrollmentOpenAt = _tryParseDateTime(cohortMap?['enrollmentOpenAt']);
    final enrollmentCloseAt = _tryParseDateTime(
      cohortMap?['enrollmentCloseAt'],
    );
    final maxStudents = (json['maxStudents'] as num?)?.toInt();
    final activeEnrollmentCount =
        ((json['_count'] as Map?)?['enrollments'] as num?)?.toInt() ?? 0;
    final isFull = maxStudents != null
        ? activeEnrollmentCount >= maxStudents
        : false;
    final spotsLeft = maxStudents != null
        ? (maxStudents - activeEnrollmentCount).clamp(0, maxStudents)
        : null;

    double? toDouble(dynamic v) {
      if (v == null) return null;
      if (v is num) return v.toDouble();
      if (v is String) return double.tryParse(v);
      return double.tryParse(v.toString());
    }

    return LiveClassModel(
      id: (json['id'] as String?) ?? '',
      code: (json['code'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      mode: 'LIVE',
      status: json['status'] as String?,
      openingDate: openingDate,
      closingDate: closingDate,
      enrollmentOpenAt: enrollmentOpenAt,
      enrollmentCloseAt: enrollmentCloseAt,
      instructorName: displayName,
      instructorAvatarUrl: avatarUrl,
      price: toDouble(json['price']),
      discountPrice: toDouble(json['discountPrice']),
      liveEnrollment: LiveEnrollmentSummary(
        activeEnrollmentCount: activeEnrollmentCount,
        maxStudents: maxStudents,
        spotsLeft: spotsLeft,
        isFull: isFull,
      ),
    );
  }

  double get displayPrice => discountPrice ?? price ?? 0;

  bool get isLive => mode.toUpperCase() == 'LIVE';

  bool get isLiveCapacityFull => liveEnrollment?.isFull ?? false;

  String? get liveCapacitySubtitle {
    final le = liveEnrollment;
    if (le == null) return null;
    final max = le.maxStudents;
    final cur = le.activeEnrollmentCount;
    if (max == null) return '$cur học viên (không giới hạn)';
    final tail = le.isFull
        ? ' — Đã đầy'
        : (le.spotsLeft != null ? ' — Còn ${le.spotsLeft} chỗ' : '');
    return '$cur/$max học viên$tail';
  }

  bool get isEnrollableNow {
    final now = DateTime.now();
    if (enrollmentOpenAt == null || enrollmentCloseAt == null) return false;
    return (now.isAtSameMomentAs(enrollmentOpenAt!) ||
            now.isAfter(enrollmentOpenAt!)) &&
        (now.isAtSameMomentAs(enrollmentCloseAt!) ||
            now.isBefore(enrollmentCloseAt!));
  }
}

class LiveProductDetailModel {
  final AcademyProductModel product;
  final List<LiveClassModel> classes;

  const LiveProductDetailModel({required this.product, required this.classes});

  factory LiveProductDetailModel.fromJson(Map<String, dynamic> json) {
    final rawClasses = json['siblingClasses'] ?? json['classes'];
    final List<dynamic> list = rawClasses is List ? rawClasses : const [];

    final classes = list
        .map((entry) {
          if (entry is Map<String, dynamic>) {
            final klass = entry['class'];
            if (klass is Map<String, dynamic>)
              return LiveClassModel.fromJson(klass);
            return LiveClassModel.fromJson(entry);
          }
          if (entry is Map) {
            final entryMap = entry.cast<String, dynamic>();
            final klass = entryMap['class'];
            if (klass is Map)
              return LiveClassModel.fromJson(klass.cast<String, dynamic>());
            return LiveClassModel.fromJson(entryMap);
          }
          return null;
        })
        .whereType<LiveClassModel>()
        .where((c) => c.id.isNotEmpty)
        .toList();

    return LiveProductDetailModel(
      product: AcademyProductModel.fromJson(json),
      classes: classes,
    );
  }
}

DateTime? _tryParseDateTime(dynamic value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  return DateTime.tryParse(value.toString());
}
