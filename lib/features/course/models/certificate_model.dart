class Certificate {
  final String id;
  final String certificateCode;
  final String fileUrl;
  final DateTime issueDate;
  final String courseId;
  final String userId;
  final Map<String, dynamic>? metadata;

  const Certificate({
    required this.id,
    required this.certificateCode,
    required this.fileUrl,
    required this.issueDate,
    required this.courseId,
    required this.userId,
    this.metadata,
  });

  String get courseTitle => metadata?['courseTitle']?.toString() ?? 'Unknown Course';

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      id: json['id']?.toString() ?? '',
      certificateCode: json['certificateCode']?.toString() ?? '',
      fileUrl: json['fileUrl']?.toString() ?? '',
      issueDate: json['issueDate'] != null ? DateTime.parse(json['issueDate']) : DateTime.now(),
      courseId: json['courseId']?.toString() ?? '',
      userId: json['userId']?.toString() ?? '',
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'certificateCode': certificateCode,
      'fileUrl': fileUrl,
      'issueDate': issueDate.toIso8601String(),
      'courseId': courseId,
      'userId': userId,
      'metadata': metadata,
    };
  }
}
