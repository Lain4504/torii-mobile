/// Academic product (VOD Package / Cohort) from Gateway API
class AcademyProductModel {
  final String id;
  final String? code;
  final String name;
  final String? description;
  final double price;
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
    this.code,
    required this.name,
    this.description,
    required this.price,
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

    final cp = json['courseProfile'] as Map<String, dynamic>?;
    final mode = json['mode']?.toString().toUpperCase() ?? 
                (json['enrollmentCloseAt'] != null ? 'LIVE' : 'VOD');
    
    return AcademyProductModel(
      id: json['id'].toString(),
      code: json['code'] as String?,
      name: (json['name'] ?? cp?['title'] ?? '').toString(),
      description: (json['description'] ?? cp?['description'])?.toString(),
      price: toDouble(json['price']) ?? 0,
      discountPrice: toDouble(json['discountPrice']) ?? toDouble(json['salePrice']),
      status: json['status'] as String?,
      mode: mode,
      thumbnailUrl: (json['thumbnailUrl'] ?? cp?['thumbnailUrl'])?.toString(),
      courseProfileId: (json['courseProfileId'] ?? cp?['id'])?.toString(),
      jlptLevel: cp?['level'] as String?,
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate'].toString()) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate'].toString()) : null,
      enrollmentCloseAt: json['enrollmentCloseAt'] != null ? DateTime.parse(json['enrollmentCloseAt'].toString()) : null,
      instructor: json['instructor'] as Map<String, dynamic>?,
      modules: json['modules'] as List?,
      liveClasses: json['liveClasses'] as List?,
    );
  }

  double get displayPrice => discountPrice ?? price;
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
      vodPackageId: json['vodPackageId'] as String?,
      liveClassId: json['liveClassId'] as String?,
      cohortId: json['cohortId'] as String?,
      type: (json['type'] ?? 'vod').toString().toLowerCase(),
      courseTitle: json['courseTitle'].toString(),
      courseCode: json['courseCode'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      instructor: json['instructor'] as Map<String, dynamic>?,
      progress: (progressVal / 100.0).clamp(0.0, 1.0),
      completedLessons: toInt(json['completedLessons']),
      totalLessons: toInt(json['totalLessons']),
    );
  }

  String get classId => liveClassId ?? vodPackageId ?? '';
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
  final DateTime updatedAt;
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
    required this.updatedAt,
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
      id: json['id'].toString(),
      code: json['code'] as String?,
      userId: json['userId'].toString(),
      amount: toDouble(json['grandTotal'] ?? json['amount']),
      currency: json['currency'] as String? ?? 'VND',
      status: json['status']?.toString() ?? 'PENDING',
      courseName: json['courseName'] as String?,
      courseThumbnail: json['courseThumbnail'] as String?,
      createdAt: DateTime.parse(json['createdAt'].toString()),
      updatedAt: DateTime.parse(json['updatedAt'].toString()),
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
  final String status; // 'LOCKED' | 'AVAILABLE' | 'IN_PROGRESS' | 'PASSED' | 'FAILED'
  final double? passingScore;
  final int? attemptCount;
  final int? maxAttempts;

  const AssessmentMilestoneModel({
    required this.id,
    required this.examId,
    required this.title,
    required this.type,
    required this.status,
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
      status: (json['status']?.toString().toUpperCase() ?? 'LOCKED'),
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

  const AssignmentModel({
    required this.id,
    required this.title,
    this.description,
    this.deadline,
    this.status,
    this.grade,
    this.feedback,
    this.attachmentUrls,
  });

  factory AssignmentModel.fromJson(Map<String, dynamic> json) {
    return AssignmentModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
      description: json['description']?.toString(),
      deadline: json['deadline'] != null ? DateTime.parse(json['deadline'].toString()) : null,
      status: json['status']?.toString().toUpperCase(),
      grade: (json['grade'] as num?)?.toDouble(),
      feedback: json['feedback']?.toString(),
      attachmentUrls: (json['attachmentUrls'] as List?)?.map((e) => e.toString()).toList(),
    );
  }

  bool get isOverdue => deadline != null && deadline!.isBefore(DateTime.now()) && status != 'SUBMITTED' && status != 'GRADED';
}

/// Assessment Attempt Question
class AssessmentQuestionModel {
  final String id;
  final String stemText;
  final String? stemHtml;
  final List<AssessmentOptionModel> options;

  const AssessmentQuestionModel({
    required this.id,
    required this.stemText,
    this.stemHtml,
    required this.options,
  });

  factory AssessmentQuestionModel.fromJson(Map<String, dynamic> json) {
    final rawOptions = json['options'] as List? ?? [];
    return AssessmentQuestionModel(
      id: json['id'].toString(),
        stemText: (json['stemText'] ?? json['stem'] ?? '').toString(),
        stemHtml: json['stemHtml']?.toString(),
        options: rawOptions.map((e) => AssessmentOptionModel.fromJson(e as Map<String, dynamic>)).toList(),
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
