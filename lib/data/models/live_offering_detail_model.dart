import 'academy_models.dart';

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
  });

  factory LiveClassModel.fromJson(Map<String, dynamic> json) {
    final instructor = json['instructor'];
    final instructorMap = instructor is Map ? instructor.cast<String, dynamic>() : null;
    final displayName = instructorMap?['displayName'] as String?;
    final avatarUrl = instructorMap?['avatarUrl'] as String?;

    return LiveClassModel(
      id: (json['id'] as String?) ?? '',
      code: (json['code'] as String?) ?? '',
      name: (json['name'] as String?) ?? (json['title'] as String?) ?? '',
      mode: (json['mode'] as String?) ?? 'LIVE',
      status: json['status'] as String?,
      openingDate: _tryParseDateTime(json['openingDate']),
      closingDate: _tryParseDateTime(json['closingDate']),
      enrollmentOpenAt: _tryParseDateTime(json['enrollmentOpenAt']),
      enrollmentCloseAt: _tryParseDateTime(json['enrollmentCloseAt']),
      instructorName: displayName,
      instructorAvatarUrl: avatarUrl,
    );
  }

  bool get isLive => mode.toUpperCase() == 'LIVE';

  bool get isEnrollableNow {
    final now = DateTime.now();
    if (enrollmentOpenAt == null || enrollmentCloseAt == null) return false;
    return (now.isAtSameMomentAs(enrollmentOpenAt!) || now.isAfter(enrollmentOpenAt!)) &&
        (now.isAtSameMomentAs(enrollmentCloseAt!) || now.isBefore(enrollmentCloseAt!));
  }
}

class LiveOfferingDetailModel {
  final CourseOfferingModel offering;
  final List<LiveClassModel> classes;

  const LiveOfferingDetailModel({
    required this.offering,
    required this.classes,
  });

  factory LiveOfferingDetailModel.fromJson(Map<String, dynamic> json) {
    final rawClasses = json['classes'];
    final List<dynamic> list = rawClasses is List ? rawClasses : const [];

    final classes = list
        .map((entry) {
          if (entry is Map<String, dynamic>) {
            final klass = entry['class'];
            if (klass is Map<String, dynamic>) return LiveClassModel.fromJson(klass);
            return LiveClassModel.fromJson(entry);
          }
          if (entry is Map) {
            final entryMap = entry.cast<String, dynamic>();
            final klass = entryMap['class'];
            if (klass is Map) return LiveClassModel.fromJson(klass.cast<String, dynamic>());
            return LiveClassModel.fromJson(entryMap);
          }
          return null;
        })
        .whereType<LiveClassModel>()
        .where((c) => c.id.isNotEmpty)
        .toList();

    return LiveOfferingDetailModel(
      offering: CourseOfferingModel.fromJson(json),
      classes: classes,
    );
  }
}

DateTime? _tryParseDateTime(dynamic value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  return DateTime.tryParse(value.toString());
}

