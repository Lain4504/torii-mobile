enum LiveClassStatus {
  upcoming,
  live,
  ended,
  cancelled
}

class LiveClass {
  final String id;
  final String title;
  final String instructorName;
  final DateTime startTime;
  final DateTime endTime;
  final LiveClassStatus status;
  final String? description;
  final String? zoomUrl; // Or similar

  const LiveClass({
    required this.id,
    required this.title,
    required this.instructorName,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.description,
    this.zoomUrl,
  });

  String get durationLabel {
    final diff = endTime.difference(startTime);
    final hours = diff.inHours;
    final minutes = diff.inMinutes % 60;
    if (hours > 0) return '${hours}h ${minutes}m';
    return '${minutes}m';
  }
}
