/// Academic product (VOD Package / Cohort) from Gateway API
class AcademyProductModel {
  final String id;
  final String? cohortId;
  final String? liveClassId;
  final String? code;
  final String name;
  final String? description;
  final double? price;
  final double? discountPrice;
  final String? status;
  final String mode; // 'LIVE' | 'VOD'
  final String? thumbnailUrl;
  final String? courseProfileId;
  final String? jlptLevel;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? enrollmentCloseAt;
  final Map<String, dynamic>? instructor;
  final List<dynamic>? modules;
  final List<dynamic>? liveClasses;

  const AcademyProductModel({
    required this.id,
    this.cohortId,
    this.liveClassId,
    this.code,
    required this.name,
    this.description,
    this.price,
    this.discountPrice,
    this.status,
    required this.mode,
    this.thumbnailUrl,
    this.courseProfileId,
    this.jlptLevel,
    this.startDate,
    this.endDate,
    this.enrollmentCloseAt,
    this.instructor,
    this.modules,
    this.liveClasses,
  });

  factory AcademyProductModel.fromJson(Map<String, dynamic> json) {
    double? toDouble(dynamic v) {
      if (v == null) return null;
      if (v is num) return v.toDouble();
      if (v is String) return double.tryParse(v);
      return double.tryParse(v.toString());
    }

    final item = json['item'] as Map<String, dynamic>?;
    final source = item ?? json;

    final cohort = source['cohort'] as Map<String, dynamic>?;
    final cp = (source['courseProfile'] ?? cohort?['courseProfile']) as Map<String, dynamic>?;
    
    final mode = source['mode']?.toString().toUpperCase() ?? 
                (source['enrollmentCloseAt'] != null || cohort != null || source['liveClasses'] != null ? 'LIVE' : 'VOD');
    
    final cohortId = (source['cohortId'] ?? (mode == 'LIVE' ? source['id'] : cohort?['id']))?.toString();
    final liveClassId = (mode == 'LIVE' && source['cohortId'] != null) ? source['id']?.toString() : null;

    return AcademyProductModel(
      id: cohortId ?? source['id'].toString(),
      cohortId: cohortId,
      liveClassId: liveClassId,
      code: (source['code'] ?? cohort?['code'])?.toString(),
      name: (source['name'] ?? cp?['title'] ?? '').toString(),
      description: (source['description'] ?? cp?['description'])?.toString(),
      price: toDouble(source['price']),
      discountPrice: toDouble(source['discountPrice']) ?? toDouble(source['salePrice']),
      status: (source['status'] ?? cohort?['status'])?.toString(),
      mode: mode,
      thumbnailUrl: (source['thumbnailUrl'] ?? cp?['thumbnailUrl'])?.toString(),
      courseProfileId: (source['courseProfileId'] ?? cp?['id'])?.toString(),
      jlptLevel: cp?['level'] as String?,
      startDate: (source['startDate'] ?? cohort?['startDate']) != null 
          ? DateTime.tryParse((source['startDate'] ?? cohort?['startDate']).toString()) 
          : null,
      endDate: (source['endDate'] ?? cohort?['endDate']) != null 
          ? DateTime.tryParse((source['endDate'] ?? cohort?['endDate']).toString()) 
          : null,
      enrollmentCloseAt: (source['enrollmentCloseAt'] ?? cohort?['enrollmentCloseAt']) != null 
          ? DateTime.tryParse((source['enrollmentCloseAt'] ?? cohort?['enrollmentCloseAt']).toString()) 
          : null,
      instructor: (source['instructor'] ?? cohort?['instructor']) as Map<String, dynamic>?,
      modules: (source['modules'] ?? cp?['modules']) as List?,
      liveClasses: source['liveClasses'] as List?,
    );
  }

  double get displayPrice => discountPrice ?? price ?? 0;
  bool get isLive => mode == 'LIVE';
}

/// My enrollment from GET /api/academy/enrollments/me
class EnrollmentModel {
  final String id;
  final String? status;
  final DateTime? enrolledAt;
  final DateTime? expiresAt;
  final String? vodPackageId;
  final String? liveClassId;
  final String? cohortId;
  final String type; // 'live' | 'vod'
  final String courseTitle;
  final String? courseCode;
  final String? thumbnailUrl;
  final Map<String, dynamic>? instructor;
  final double progress; // 0.0 to 1.0
  final int completedLessons;
  final int totalLessons;

  const EnrollmentModel({
    required this.id,
    this.status,
    this.enrolledAt,
    this.expiresAt,
    this.vodPackageId,
    this.liveClassId,
    this.cohortId,
    required this.type,
    required this.courseTitle,
    this.courseCode,
    this.thumbnailUrl,
    this.instructor,
    this.progress = 0.0,
    this.completedLessons = 0,
    this.totalLessons = 0,
  });

  factory EnrollmentModel.fromJson(Map<String, dynamic> json) {
    double toDouble(dynamic v) {
      if (v == null) return 0;
      if (v is num) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? 0;
      return double.tryParse(v.toString()) ?? 0;
    }

    int toInt(dynamic v) {
      if (v == null) return 0;
      if (v is num) return v.toInt();
      if (v is String) return int.tryParse(v) ?? (double.tryParse(v)?.toInt() ?? 0);
      return int.tryParse(v.toString()) ?? (double.tryParse(v.toString())?.toInt() ?? 0);
    }

    final progressVal = toDouble(json['progressPercent'] ?? json['progress']);
    
    return EnrollmentModel(
      id: json['id'].toString(),
      status: json['status'] as String?,
      enrolledAt: json['enrolledAt'] != null ? DateTime.parse(json['enrolledAt'].toString()) : null,
      expiresAt: json['expiresAt'] != null ? DateTime.parse(json['expiresAt'].toString()) : null,
      vodPackageId: json['vodPackageId'] as String? ?? json['vod_package_id'] as String?,
      liveClassId: json['liveClassId'] as String? ?? json['live_class_id'] as String?,
      cohortId: json['cohortId'] as String? ?? json['cohort_id'] as String?,
      type: (json['type'] ?? 'vod').toString().toLowerCase(),
      courseTitle: (json['courseTitle'] ?? json['course_title'] ?? '').toString(),
      courseCode: json['courseCode'] as String? ?? json['course_code'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String? ?? json['thumbnail_url'] as String?,
      instructor: json['instructor'] as Map<String, dynamic>?,
      progress: (progressVal / 100.0).clamp(0.0, 1.0),
      completedLessons: toInt(json['completedLessons']),
      totalLessons: toInt(json['totalLessons']),
    );
  }

  /// UUID lớp LIVE hoặc gói VOD cho route/API học.
  String get deliveryTargetId => liveClassId ?? vodPackageId ?? '';
  bool get isLive => type == 'live' || type == 'LIVE';
  String get mode => type.toUpperCase();
  String get productId => cohortId ?? vodPackageId ?? '';
}

/// Order from GET /api/academy/orders/my and /my/:id
class OrderModel {
  final String id;
  final String? code;
  final String userId;
  final double amount;
  final String currency;
  final String status;
  final String? courseName;
  final String? courseThumbnail;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final Map<String, dynamic>? metadata;

  const OrderModel({
    required this.id,
    this.code,
    required this.userId,
    required this.amount,
    this.currency = 'VND',
    required this.status,
    this.courseName,
    this.courseThumbnail,
    required this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    double toDouble(dynamic v) {
      if (v == null) return 0;
      if (v is num) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? 0;
      return double.tryParse(v.toString()) ?? 0;
    }

    return OrderModel(
      id: json['id']?.toString() ?? '',
      code: json['code'] as String?,
      userId: json['userId']?.toString() ?? '',
      amount: toDouble(json['grandTotal'] ?? json['amount']),
      currency: json['currency'] as String? ?? 'VND',
      status: json['status']?.toString() ?? 'PENDING',
      courseName: json['courseName'] ?? json['description'],
      courseThumbnail: json['courseThumbnail'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'].toString()) : DateTime.now(),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'].toString()) : null,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  String get formattedDate {
    return '${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year}';
  }

  String get statusLabel {
    switch (status.toUpperCase()) {
      case 'PAID':
        return 'Đã thanh toán';
      case 'PENDING':
        return 'Chờ thanh toán';
      case 'PROCESSING':
        return 'Đang xử lý';
      case 'CANCELLED':
        return 'Đã hủy';
      case 'REFUNDED':
        return 'Đã hoàn tiền';
      case 'FAILED':
        return 'Thất bại';
      default:
        return status;
    }
  }
}

class AcademyFolder {
  final String id;
  final String name;
  final String? className;
  final String? classCode;
  final int resourceCount;

  const AcademyFolder({
    required this.id,
    required this.name,
    this.className,
    this.classCode,
    required this.resourceCount,
  });

  factory AcademyFolder.fromJson(Map<String, dynamic> json) {
    int toInt(dynamic v) {
      if (v == null) return 0;
      if (v is num) return v.toInt();
      if (v is String) return int.tryParse(v) ?? double.tryParse(v)?.toInt() ?? 0;
      return int.tryParse(v.toString()) ?? double.tryParse(v.toString())?.toInt() ?? 0;
    }

    return AcademyFolder(
      id: (json['folderId'] ?? json['id'] ?? '').toString(),
      name: (json['folderName'] ?? json['name'] ?? '').toString(),
      className: (json['liveClass']?['name'] ?? json['vodPackage']?['title'])?.toString(),
      classCode: (json['liveClass']?['code'] ?? json['vodPackage']?['code'])?.toString(),
      resourceCount: toInt(json['resourceCount']),
    );
  }
}

enum AcademyResourceType { file, link, unknown }

class AcademyResource {
  final String id;
  final String title;
  final AcademyResourceType type;
  final String? url;
  final String? thumbnailUrl;
  final DateTime? createdAt;

  const AcademyResource({
    required this.id,
    required this.title,
    required this.type,
    this.url,
    this.thumbnailUrl,
    this.createdAt,
  });

  factory AcademyResource.fromJson(Map<String, dynamic> json) {
    final typeStr = (json['resourceType'] ?? '').toString().toUpperCase();
    final type = typeStr == 'FILE'
        ? AcademyResourceType.file
        : (typeStr == 'LINK' ? AcademyResourceType.link : AcademyResourceType.unknown);

    return AcademyResource(
      id: json['id'].toString(),
      title: json['title'].toString(),
      type: type,
      url: type == AcademyResourceType.file
          ? json['downloadUrl'] as String?
          : json['externalUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'].toString()) : null,
    );
  }

  bool get isFile => type == AcademyResourceType.file;
  bool get isLink => type == AcademyResourceType.link;
}

/// Assessment milestone status in a course
class AssessmentMilestoneModel {
  final String id;
  final String examId;
  final String title;
  final String type; // 'QUIZ' | 'MIDTERM' | 'FINAL'
  final String kind; // 'LESSON_CHECKPOINT' | 'MODULE_CHECKPOINT' | 'FINAL_EXAM' ...
  final String status; // 'LOCKED' | 'AVAILABLE' | 'IN_PROGRESS' | 'PASSED' | 'FAILED'
  final bool isRequired;
  final String? triggerLessonId;
  final String? moduleId;
  final double? percentage;
  final double? passingScore;
  final int? attemptCount;
  final int? maxAttempts;

  const AssessmentMilestoneModel({
    required this.id,
    required this.examId,
    required this.title,
    required this.type,
    required this.kind,
    required this.status,
    this.isRequired = false,
    this.triggerLessonId,
    this.moduleId,
    this.percentage,
    this.passingScore,
    this.attemptCount,
    this.maxAttempts,
  });

  factory AssessmentMilestoneModel.fromJson(Map<String, dynamic> json) {
    final examId = json['examId'] ?? (json['exam'] is Map ? json['exam']['id'] : null) ?? 'unknown';
    return AssessmentMilestoneModel(
      id: (json['id'] ?? json['assessmentId'] ?? '').toString(),
      examId: examId.toString(),
      title: (json['title'] ?? json['examTitle'] ?? (json['exam'] is Map ? json['exam']['title'] : null) ?? '').toString(),
      type: json['type']?.toString().toUpperCase() ?? 'QUIZ',
      kind: (json['kind'] ?? json['type'] ?? '').toString().toUpperCase(),
      status: (json['status']?.toString().toUpperCase() ?? 'LOCKED'),
      isRequired: json['isRequired'] == true,
      triggerLessonId: json['triggerLessonId']?.toString(),
      moduleId: json['moduleId']?.toString(),
      percentage: (json['percentage'] as num?)?.toDouble(),
      passingScore: (json['passingScore'] as num?)?.toDouble(),
      attemptCount: (json['attemptCount'] as num?)?.toInt(),
      maxAttempts: (json['maxAttempts'] as num?)?.toInt(),
    );
  }

  bool get isLocked => status == 'LOCKED';
  bool get isPassed => status == 'PASSED';
  bool get canAttempt => status == 'AVAILABLE' || status == 'IN_PROGRESS' || status == 'FAILED';
}

/// Assignment for Live Class
class AssignmentModel {
  final String id;
  final String title;
  final String? description;
  final DateTime? deadline;
  final String? status; // 'PENDING' | 'SUBMITTED' | 'GRADED'
  final double? grade;
  final String? feedback;
  final List<String>? attachmentUrls;
  final String? classAssessmentId;
  final String? assignmentTemplateId;
  final DateTime? submittedAt;
  final DateTime? gradedAt;
  final String? submittedText;
  final String? submittedUrl;
  final List<String>? submittedFileUrls;

  const AssignmentModel({
    required this.id,
    required this.title,
    this.description,
    this.deadline,
    this.status,
    this.grade,
    this.feedback,
    this.attachmentUrls,
    this.classAssessmentId,
    this.assignmentTemplateId,
    this.submittedAt,
    this.gradedAt,
    this.submittedText,
    this.submittedUrl,
    this.submittedFileUrls,
  });

  AssignmentModel copyWith({
    String? status,
    double? grade,
    String? feedback,
    DateTime? submittedAt,
    DateTime? gradedAt,
    String? submittedText,
    String? submittedUrl,
    List<String>? submittedFileUrls,
  }) {
    return AssignmentModel(
      id: id,
      title: title,
      description: description,
      deadline: deadline,
      status: status ?? this.status,
      grade: grade ?? this.grade,
      feedback: feedback ?? this.feedback,
      attachmentUrls: attachmentUrls,
      classAssessmentId: classAssessmentId,
      assignmentTemplateId: assignmentTemplateId,
      submittedAt: submittedAt ?? this.submittedAt,
      gradedAt: gradedAt ?? this.gradedAt,
      submittedText: submittedText ?? this.submittedText,
      submittedUrl: submittedUrl ?? this.submittedUrl,
      submittedFileUrls: submittedFileUrls ?? this.submittedFileUrls,
    );
  }

  factory AssignmentModel.fromJson(Map<String, dynamic> json) {
    final assignmentData = json['assignment'] as Map<String, dynamic>?;
    final count = json['_count'] as Map<String, dynamic>?;
    final submissionCount = (count?['submissions'] as num?)?.toInt() ?? 0;
    
    // Fallback status if not provided directly
    String? status = json['status']?.toString().toUpperCase();
    if (status == null && submissionCount > 0) {
      status = 'SUBMITTED';
    }

    DateTime? parseDt(dynamic v) {
      if (v == null) return null;
      if (v is DateTime) return v;
      return DateTime.tryParse(v.toString());
    }

    // Optional: backend may embed my submission under different keys.
    final submissionRaw =
        json['mySubmission'] ?? json['submission'] ?? json['latestSubmission'];
    Map<String, dynamic>? submission;
    if (submissionRaw is Map<String, dynamic>) {
      submission = submissionRaw;
    } else if (submissionRaw is Map) {
      submission = submissionRaw.cast<String, dynamic>();
    }

    String? submittedText;
    String? submittedUrl;
    List<String>? submittedFileUrls;
    DateTime? submittedAt;
    DateTime? gradedAt;
    double? grade;
    String? feedback;

    if (submission != null) {
      status = (submission['status'] ?? status)?.toString().toUpperCase();
      submittedAt = parseDt(submission['submittedAt'] ?? submission['createdAt']);
      gradedAt = parseDt(submission['gradedAt']);
      final rawGrade = submission['grade'] ?? submission['score'];
      if (rawGrade is num) grade = rawGrade.toDouble();
      if (rawGrade is String) grade = double.tryParse(rawGrade);
      feedback = submission['feedback']?.toString();
      final fileUrls = submission['fileUrls'];
      if (fileUrls is List) {
        submittedFileUrls = fileUrls.map((e) => e.toString()).toList();
      }
      final content = submission['content'];
      if (content is Map) {
        final m = content.cast<String, dynamic>();
        final url = m['url']?.toString();
        final text = m['text']?.toString();
        if (url != null && url.trim().isNotEmpty) submittedUrl = url.trim();
        if (text != null && text.trim().isNotEmpty) submittedText = text.trim();
      } else if (content is String) {
        final v = content.trim();
        if (v.startsWith('http://') || v.startsWith('https://')) {
          submittedUrl = v;
        } else {
          submittedText = v;
        }
      }
    }

    // Allow fields at assignment-level if API already denormalized them there.
    submittedAt ??= parseDt(json['submittedAt']);
    gradedAt ??= parseDt(json['gradedAt']);
    feedback ??= json['feedback']?.toString();
    final rawGradeTop = json['grade'];
    if (grade == null) {
      if (rawGradeTop is num) grade = rawGradeTop.toDouble();
      if (rawGradeTop is String) grade = double.tryParse(rawGradeTop);
    }

    return AssignmentModel(
      id: json['id'].toString(),
      title: (json['title'] ?? assignmentData?['title'] ?? '').toString(),
      description: (json['description'] ?? assignmentData?['instructions'])?.toString(),
      deadline: json['deadline'] != null ? DateTime.parse(json['deadline'].toString()) : null,
      status: status,
      grade: grade,
      feedback: feedback,
      attachmentUrls: (json['attachmentUrls'] as List?)?.map((e) => e.toString()).toList(),
      classAssessmentId: (json['classAssessmentId'] ?? json['id'])?.toString(),
      assignmentTemplateId: (json['assignmentTemplateId'] ?? json['assignmentId'] ?? assignmentData?['id'])?.toString(),
      submittedAt: submittedAt,
      gradedAt: gradedAt,
      submittedText: submittedText,
      submittedUrl: submittedUrl,
      submittedFileUrls: submittedFileUrls,
    );
  }

  bool get isOverdue => deadline != null && deadline!.isBefore(DateTime.now()) && status != 'SUBMITTED' && status != 'GRADED';
}

/// Assessment Attempt Question
class AssessmentQuestionModel {
  final String id;
  final String? examQuestionId;  // ID của câu hỏi trong exam, dùng khi submit
  final String stemText;
  final String? stemHtml;
  final String? categoryType;
  final String? mediaUrl;
  final String? readingPassage;
  final List<AssessmentOptionModel> options;

  const AssessmentQuestionModel({
    required this.id,
    this.examQuestionId,
    required this.stemText,
    this.stemHtml,
    this.categoryType,
    this.mediaUrl,
    this.readingPassage,
    required this.options,
  });

  /// ID dùng để submit answer - ưu tiên examQuestionId nếu có
  String get submitId => examQuestionId ?? id;

  factory AssessmentQuestionModel.fromJson(Map<String, dynamic> json) {
    final dynamic optionsData = json['options'];
    List<AssessmentOptionModel> options = [];
    
    if (optionsData is List) {
      options = optionsData.map((e) => AssessmentOptionModel.fromJson(e as Map<String, dynamic>)).toList();
    } else if (optionsData is Map) {
      // Handle Map format: { "A": "content", "B": "content", ... }
      options = optionsData.entries.map((entry) {
        return AssessmentOptionModel(
          id: entry.key, // Fallback ID as key
          contentText: entry.value.toString(),
          optionKey: entry.key,
        );
      }).toList();
      // Sort by key (A, B, C...)
      options.sort((a, b) => a.optionKey.compareTo(b.optionKey));
    }

    return AssessmentQuestionModel(
      id: json['id'].toString(),
      examQuestionId: json['examQuestionId']?.toString(),
      stemText: (json['stemText'] ?? json['stem'] ?? '').toString(),
      stemHtml: json['stemHtml']?.toString(),
      categoryType: (json['categoryType'] ?? json['category'])?.toString(),
      mediaUrl: json['mediaUrl']?.toString(),
      readingPassage: json['readingPassage']?.toString(),
      options: options,
    );
  }
}

class AssessmentOptionModel {
    final String id;
    final String contentText;
    final String optionKey;

    const AssessmentOptionModel({
      required this.id,
      required this.contentText,
      required this.optionKey,
    });

  factory AssessmentOptionModel.fromJson(Map<String, dynamic> json) {
    return AssessmentOptionModel(
      id: json['id'].toString(),
      contentText: (json['contentText'] ?? json['content'] ?? '').toString(),
      optionKey: (json['optionKey'] ?? '').toString(),
    );
  }
}

/// Gift Recipient Check Result
class GiftRecipientCheckResult {
  final bool isEnrolled;
  final bool isRegistered;
  final String? message;
  final bool hasError;

  GiftRecipientCheckResult({
    required this.isEnrolled,
    required this.isRegistered,
    this.message,
    this.hasError = false,
  });

  factory GiftRecipientCheckResult.fromJson(Map<String, dynamic> json) {
    return GiftRecipientCheckResult(
      isEnrolled: json['isEnrolled'] as bool? ?? false,
      isRegistered: json['isRegistered'] as bool? ?? false,
      message: json['message']?.toString(),
      hasError: json['hasError'] as bool? ?? false,
    );
  }
}

