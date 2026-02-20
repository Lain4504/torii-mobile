class Assignment {
  final String id;
  final String title;
  final String description;
  final String? type;
  final String? courseId;
  final int? maxScore;
  final int? passingScore;
  final DateTime? dueDate;
  final String status;
  final String? userSubmissionStatus; // 'SUBMITTED', 'GRADED', 'RETURNED', etc.

  const Assignment({
    required this.id,
    required this.title,
    required this.description,
    this.type,
    this.courseId,
    this.maxScore,
    this.passingScore,
    this.dueDate,
    required this.status,
    this.userSubmissionStatus,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      type: json['type']?.toString(),
      courseId: json['courseId']?.toString(),
      maxScore: json['maxScore'] as int?,
      passingScore: json['passingScore'] as int?,
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      status: json['status']?.toString() ?? 'DRAFT',
      userSubmissionStatus: json['userSubmissionStatus']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'courseId': courseId,
      'maxScore': maxScore,
      'passingScore': passingScore,
      'dueDate': dueDate?.toIso8601String(),
      'status': status,
      'userSubmissionStatus': userSubmissionStatus,
    };
  }
}
