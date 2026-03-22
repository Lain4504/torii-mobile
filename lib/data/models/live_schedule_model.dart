/// Buổi live trên lịch — map từ `/api/academy/live-sessions` + metadata enrollment (parity web-learner).
class LiveScheduleModel {
  final String id;
  final String? classId;
  final String? title;
  final DateTime? startAt;
  final DateTime? endAt;
  final String? instructorName;
  final String? courseTitle;
  final String? courseThumbnail;
  /// Trạng thái hiển thị: `LIVE` | `SCHEDULED` | `JOINABLE` | `ENDED` (tính theo giờ local).
  final String? status;
  final String? meetingUrl;
  final String? roomId;
  final int? durationMinutes;

  const LiveScheduleModel({
    required this.id,
    this.classId,
    this.title,
    this.startAt,
    this.endAt,
    this.instructorName,
    this.courseTitle,
    this.courseThumbnail,
    this.status,
    this.meetingUrl,
    this.roomId,
    this.durationMinutes,
  });

  factory LiveScheduleModel.fromJson(Map<String, dynamic> json) {
    return LiveScheduleModel(
      id: (json['id'] ?? '').toString(),
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
      courseThumbnail: json['courseThumbnail'] as String?,
      status: json['status'] as String?,
      meetingUrl: json['meetingUrl'] as String?,
      roomId: json['roomId'] as String?,
      durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
    );
  }

  LiveScheduleModel copyWith({
    String? id,
    String? classId,
    String? title,
    DateTime? startAt,
    DateTime? endAt,
    String? instructorName,
    String? courseTitle,
    String? courseThumbnail,
    String? status,
    String? meetingUrl,
    String? roomId,
    int? durationMinutes,
  }) {
    return LiveScheduleModel(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      title: title ?? this.title,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      instructorName: instructorName ?? this.instructorName,
      courseTitle: courseTitle ?? this.courseTitle,
      courseThumbnail: courseThumbnail ?? this.courseThumbnail,
      status: status ?? this.status,
      meetingUrl: meetingUrl ?? this.meetingUrl,
      roomId: roomId ?? this.roomId,
      durationMinutes: durationMinutes ?? this.durationMinutes,
    );
  }

  String get timeRange {
    if (startAt == null || endAt == null) return '';
    final s = startAt!;
    final e = endAt!;
    return '${s.hour.toString().padLeft(2, '0')}:${s.minute.toString().padLeft(2, '0')} – ${e.hour.toString().padLeft(2, '0')}:${e.minute.toString().padLeft(2, '0')}';
  }

  String get senseiLabel => instructorName != null ? 'Sensei: $instructorName' : '';

  /// Cùng quy tắc với web-learner `academy-live-session-api.ts`
  static const int joinOpenBeforeMinutes = 30;
  static const int joinCloseAfterEndHours = 4;

  /// Sớm nhất trong tương lai (chưa kết thúc join window) để banner “sắp diễn ra”.
  LiveScheduleUiState uiStateAt(DateTime now) {
    if (startAt == null || endAt == null) return LiveScheduleUiState.scheduled;
    final scheduledAt = startAt!;
    final end = endAt!;
    final joinOpenAt = scheduledAt.subtract(const Duration(minutes: joinOpenBeforeMinutes));
    final joinCloseAt = end.add(Duration(hours: joinCloseAfterEndHours));
    if (now.isBefore(joinOpenAt)) return LiveScheduleUiState.scheduled;
    if (!now.isBefore(scheduledAt) && !now.isAfter(end)) return LiveScheduleUiState.live;
    if (now.isAfter(joinCloseAt)) return LiveScheduleUiState.ended;
    return LiveScheduleUiState.joinable;
  }

  /// Hiện banner dưới cùng: đang live / có thể vào phòng / sắp bắt đầu trong [within].
  bool shouldPromptUpcomingPanel(DateTime now, {Duration within = const Duration(hours: 6)}) {
    final state = uiStateAt(now);
    if (state == LiveScheduleUiState.live || state == LiveScheduleUiState.joinable) return true;
    if (state != LiveScheduleUiState.scheduled || startAt == null) return false;
    if (!startAt!.isAfter(now)) return false;
    return startAt!.difference(now) <= within;
  }

  bool get canAttemptJoin {
    final s = uiStateAt(DateTime.now());
    return s == LiveScheduleUiState.live || s == LiveScheduleUiState.joinable;
  }
}

enum LiveScheduleUiState { scheduled, joinable, live, ended }
