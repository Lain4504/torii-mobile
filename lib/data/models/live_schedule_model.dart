/// Live schedule from GET /api/academy/live-schedules
class LiveScheduleModel {
  final String id;
  final String? classId;
  final String? title;
  final DateTime? startAt;
  final DateTime? endAt;
  final String? instructorName;
  final String? courseTitle;
  final String? status;
  final String? meetingUrl;

  const LiveScheduleModel({
    required this.id,
    this.classId,
    this.title,
    this.startAt,
    this.endAt,
    this.instructorName,
    this.courseTitle,
    this.status,
    this.meetingUrl,
  });

  factory LiveScheduleModel.fromJson(Map<String, dynamic> json) {
    return LiveScheduleModel(
      id: json['id'] as String,
      classId: json['classId'] as String?,
      title: json['title'] as String? ?? json['name'] as String?,
      startAt: json['startAt'] != null
          ? DateTime.tryParse(json['startAt'].toString())
          : null,
      endAt: json['endAt'] != null
          ? DateTime.tryParse(json['endAt'].toString())
          : null,
      instructorName: json['instructorName'] as String?,
      courseTitle: json['courseTitle'] as String? ?? json['className'] as String?,
      status: json['status'] as String?,
      meetingUrl: json['meetingUrl'] as String?,
    );
  }

  String get timeRange {
    if (startAt == null || endAt == null) return '';
    final s = startAt!;
    final e = endAt!;
    return '${s.hour.toString().padLeft(2, '0')}:${s.minute.toString().padLeft(2, '0')} – ${e.hour.toString().padLeft(2, '0')}:${e.minute.toString().padLeft(2, '0')}';
  }

  String get senseiLabel => instructorName != null ? 'Sensei: $instructorName' : '';
}
