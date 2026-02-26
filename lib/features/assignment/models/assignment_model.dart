enum AssignmentType { text, file, both }

enum AssignmentStatus { draft, published, closed }

enum SubmissionStatus { draft, submitted, graded, returned }

class Assignment {
  final String id;
  final String title;
  final String description;
  final AssignmentType type;
  
  final String? courseId;
  final String? moduleId;
  final String? lessonId;
  
  final double maxScore;
  final double? passingScore;
  
  final DateTime? dueDate;
  final bool allowLateSubmission;
  final double? latePenaltyPercent;
  
  final List<String> allowedFileTypes;
  final double? maxFileSize;
  final int? maxFiles;
  
  final String? instructions;
  final List<String> attachmentUrls;
  final String createdBy;
  final AssignmentStatus status;
  final DateTime? publishedAt;
  
  final DateTime createdAt;
  final DateTime updatedAt;

  // Additional UI fields
  final String? courseTitle; // To show instead of courseId
  final String? moduleTitle; // To show instead of moduleId
  final String? lessonTitle; // To show instead of lessonId
  final Submission? currentSubmission; // Student's submission

  const Assignment({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    this.courseId,
    this.moduleId,
    this.lessonId,
    required this.maxScore,
    this.passingScore,
    this.dueDate,
    required this.allowLateSubmission,
    this.latePenaltyPercent,
    this.allowedFileTypes = const [],
    this.maxFileSize,
    this.maxFiles,
    this.instructions,
    this.attachmentUrls = const [],
    required this.createdBy,
    required this.status,
    this.publishedAt,
    required this.createdAt,
    required this.updatedAt,
    this.courseTitle,
    this.moduleTitle,
    this.lessonTitle,
    this.currentSubmission,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: _parseAssignmentType(json['type']),
      courseId: json['courseId'] as String?,
      moduleId: json['moduleId'] as String?,
      lessonId: json['lessonId'] as String?,
      maxScore: (json['maxScore'] as num).toDouble(),
      passingScore: (json['passingScore'] as num?)?.toDouble(),
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      allowLateSubmission: json['allowLateSubmission'] ?? false,
      latePenaltyPercent: (json['latePenaltyPercent'] as num?)?.toDouble(),
      allowedFileTypes: List<String>.from(json['allowedFileTypes'] ?? []),
      maxFileSize: (json['maxFileSize'] as num?)?.toDouble(),
      maxFiles: json['maxFiles'] as int?,
      instructions: json['instructions'] as String?,
      attachmentUrls: List<String>.from(json['attachmentUrls'] ?? []),
      createdBy: json['createdBy'] as String,
      status: _parseAssignmentStatus(json['status']),
      publishedAt: json['publishedAt'] != null ? DateTime.parse(json['publishedAt']) : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      courseTitle: json['course']?['title'] as String?,
      moduleTitle: json['module']?['title'] as String?,
      lessonTitle: json['lesson']?['title'] as String?,
      currentSubmission: json['currentSubmission'] != null 
          ? Submission.fromJson(json['currentSubmission']) 
          : null,
    );
  }

  static AssignmentType _parseAssignmentType(String? type) {
    switch (type) {
      case 'FILE':
        return AssignmentType.file;
      case 'BOTH':
        return AssignmentType.both;
      case 'TEXT':
      default:
        return AssignmentType.text;
    }
  }

  static AssignmentStatus _parseAssignmentStatus(String? status) {
    switch (status) {
      case 'PUBLISHED':
        return AssignmentStatus.published;
      case 'CLOSED':
        return AssignmentStatus.closed;
      case 'DRAFT':
      default:
        return AssignmentStatus.draft;
    }
  }

  bool get isOverdue {
    if (dueDate == null) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  bool get isClosed => status == AssignmentStatus.closed;
  
  bool get canSubmit {
    if (isClosed) return false;
    if (isOverdue && !allowLateSubmission) return false;
    return true;
  }
}

class GradeHistory {
  final String id;
  final String submissionId;
  final double? oldScore;
  final double newScore;
  final String? oldFeedback;
  final String? newFeedback;
  final String changedBy;
  final String? reason;
  final DateTime createdAt;

  const GradeHistory({
    required this.id,
    required this.submissionId,
    this.oldScore,
    required this.newScore,
    this.oldFeedback,
    this.newFeedback,
    required this.changedBy,
    this.reason,
    required this.createdAt,
  });

  factory GradeHistory.fromJson(Map<String, dynamic> json) {
    return GradeHistory(
      id: json['id'] as String,
      submissionId: json['submissionId'] as String,
      oldScore: (json['oldScore'] as num?)?.toDouble(),
      newScore: (json['newScore'] as num).toDouble(),
      oldFeedback: json['oldFeedback'] as String?,
      newFeedback: json['newFeedback'] as String?,
      changedBy: json['changedBy'] as String,
      reason: json['reason'] as String?,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class Submission {
  final String id;
  final String assignmentId;
  final String userId;
  
  final String? textAnswer;
  final List<String> fileUrls;
  
  final SubmissionStatus status;
  final DateTime? submittedAt;
  final bool isLate;
  final int? daysLate;
  
  final double? score;
  final String? feedback;
  final String? gradedBy;
  final DateTime? gradedAt;
  
  final int attemptNumber;
  final String? previousSubmissionId;
  final List<GradeHistory>? gradeHistories;
  
  final DateTime createdAt;
  final DateTime updatedAt;

  // Additional UI fields
  final Assignment? assignment;

  const Submission({
    required this.id,
    required this.assignmentId,
    required this.userId,
    this.textAnswer,
    this.fileUrls = const [],
    required this.status,
    this.submittedAt,
    required this.isLate,
    this.daysLate,
    this.score,
    this.feedback,
    this.gradedBy,
    this.gradedAt,
    required this.attemptNumber,
    this.previousSubmissionId,
    this.gradeHistories,
    required this.createdAt,
    required this.updatedAt,
    this.assignment,
  });

  factory Submission.fromJson(Map<String, dynamic> json) {
    return Submission(
      id: json['id'] as String,
      assignmentId: json['assignmentId'] as String,
      userId: json['userId'] as String,
      textAnswer: json['textAnswer'] as String?,
      fileUrls: List<String>.from(json['fileUrls'] ?? []),
      status: _parseSubmissionStatus(json['status']),
      submittedAt: json['submittedAt'] != null ? DateTime.parse(json['submittedAt']) : null,
      isLate: json['isLate'] ?? false,
      daysLate: json['daysLate'] as int?,
      score: (json['score'] as num?)?.toDouble(),
      feedback: json['feedback'] as String?,
      gradedBy: json['gradedBy'] as String?,
      gradedAt: json['gradedAt'] != null ? DateTime.parse(json['gradedAt']) : null,
      attemptNumber: json['attemptNumber'] as int? ?? 1,
      previousSubmissionId: json['previousSubmissionId'] as String?,
      gradeHistories: json['gradeHistories'] != null 
          ? (json['gradeHistories'] as List).map((i) => GradeHistory.fromJson(i)).toList()
          : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      assignment: json['assignment'] != null ? Assignment.fromJson(json['assignment']) : null,
    );
  }

  static SubmissionStatus _parseSubmissionStatus(String? status) {
    switch (status) {
      case 'SUBMITTED':
        return SubmissionStatus.submitted;
      case 'GRADED':
        return SubmissionStatus.graded;
      case 'RETURNED':
        return SubmissionStatus.returned;
      case 'DRAFT':
      default:
        return SubmissionStatus.draft;
    }
  }

  bool get isDraft => status == SubmissionStatus.draft;
  bool get isSubmitted => status == SubmissionStatus.submitted;
  bool get isGraded => status == SubmissionStatus.graded;
  bool get isReturned => status == SubmissionStatus.returned;
}
