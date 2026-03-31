/// Academic product (VOD Package / Cohort) from Gateway API
class AcademyProductModel {
  final String id;
  final String? code;
  final String name;
  final String? description;
  final double price;
  final double? discountPrice;
  final String? status;
  final String? mode; // 'LIVE' | 'VOD'
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
    this.mode,
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
    // Determine mode if not explicitly provided
    final mode = json['mode']?.toString().toUpperCase() ?? 
                (json['courseProfileId'] != null ? (json.containsKey('enrollmentCloseAt') ? 'LIVE' : 'VOD') : 'VOD');
    
    final cp = json['courseProfile'] as Map<String, dynamic>?;
    
    return AcademyProductModel(
      id: json['id']?.toString() ?? '',
      code: json['code']?.toString(),
      name: (json['name'] ?? json['title'] ?? cp?['title'] ?? '').toString(),
      description: (json['description'] ?? cp?['description'])?.toString(),
      price: _parseNum(json['price']).toDouble(),
      discountPrice: _parseNumOrNull(json['discountPrice'] ?? json['salePrice'])?.toDouble(),
      status: json['status']?.toString(),
      mode: mode,
      thumbnailUrl: (json['thumbnailUrl'] ?? cp?['thumbnailUrl'])?.toString(),
      courseProfileId: (json['courseProfileId'] ?? cp?['id'])?.toString(),
      jlptLevel: cp?['level']?.toString(),
      startDate: _parseDate(json['startDate'] ?? json['openingDate']),
      endDate: _parseDate(json['endDate']),
      enrollmentCloseAt: _parseDate(json['enrollmentCloseAt']),
      instructor: json['instructor'] is Map ? Map<String, dynamic>.from(json['instructor']) : null,
      modules: json['courseProfile']?['modules'] is List ? List.from(json['courseProfile']['modules']) : null,
      liveClasses: json['liveClasses'] is List ? List.from(json['liveClasses']) : null,
    );
  }

  double get displayPrice => discountPrice ?? price;
  bool get isLive => mode == 'LIVE';
}

DateTime? _parseDate(dynamic v) {
  if (v == null) return null;
  return DateTime.tryParse(v.toString());
}

num _parseNum(dynamic value) {
  return _parseNumOrNull(value) ?? 0;
}

num? _parseNumOrNull(dynamic value) {
  if (value == null) return null;
  if (value is num) return value;
  if (value is String) return num.tryParse(value);
  return null;
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
    final progressVal = _parseNum(json['progressPercent'] ?? json['progress']).toDouble();
    
    return EnrollmentModel(
      id: json['id']?.toString() ?? '',
      status: json['status']?.toString(),
      enrolledAt: _parseDate(json['enrolledAt']),
      expiresAt: _parseDate(json['expiresAt']),
      vodPackageId: json['vodPackageId']?.toString(),
      liveClassId: json['liveClassId']?.toString(),
      cohortId: json['cohortId']?.toString(),
      type: json['type']?.toString().toLowerCase() ?? 'vod',
      courseTitle: (json['courseTitle'] ?? '').toString(),
      courseCode: json['courseCode']?.toString(),
      thumbnailUrl: json['thumbnailUrl']?.toString(),
      instructor: json['instructor'] is Map ? Map<String, dynamic>.from(json['instructor']) : null,
      progress: (progressVal / 100.0).clamp(0.0, 1.0),
      completedLessons: _parseNum(json['completedLessons']).toInt(),
      totalLessons: _parseNum(json['totalLessons']).toInt(),
    );
  }

  String get classId => liveClassId ?? vodPackageId ?? '';
  bool get isLive => type == 'live';
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
    final createdAtRaw = json['createdAt'] ?? json['created_at'];
    final updatedAtRaw = json['updatedAt'] ?? json['updated_at'];
    final fallbackDate = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);

    return OrderModel(
      id: (json['id'] ?? '').toString(),
      code: json['code'] as String?,
      userId: (json['userId'] ?? '').toString(),
      amount: _parseNum(json['amount'] ?? json['grandTotal']).toDouble(),
      currency: json['currency'] as String? ?? 'VND',
      status: json['status'] as String? ?? 'PENDING',
      courseName: json['courseName'] as String?,
      courseThumbnail: json['courseThumbnail'] as String?,
      createdAt: DateTime.tryParse(createdAtRaw?.toString() ?? '') ?? fallbackDate,
      updatedAt: DateTime.tryParse(updatedAtRaw?.toString() ?? '') ?? fallbackDate,
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
    return AcademyFolder(
      id: (json['folderId'] ?? json['id'] ?? '').toString(),
      name: (json['folderName'] ?? json['name'] ?? '').toString(),
      className: json['liveClass']?['name'] as String?,
      classCode: json['liveClass']?['code'] as String?,
      resourceCount: (json['resourceCount'] as num?)?.toInt() ?? 0,
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
  final DateTime createdAt;

  const AcademyResource({
    required this.id,
    required this.title,
    required this.type,
    this.url,
    this.thumbnailUrl,
    required this.createdAt,
  });

  factory AcademyResource.fromJson(Map<String, dynamic> json) {
    final typeStr = (json['resourceType'] ?? '').toString().toUpperCase();
    final type = typeStr == 'FILE'
        ? AcademyResourceType.file
        : (typeStr == 'LINK' ? AcademyResourceType.link : AcademyResourceType.unknown);

    return AcademyResource(
      id: (json['id'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      type: type,
      url: type == AcademyResourceType.file
          ? json['downloadUrl'] as String?
          : json['externalUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  bool get isFile => type == AcademyResourceType.file;
  bool get isLink => type == AcademyResourceType.link;
}
