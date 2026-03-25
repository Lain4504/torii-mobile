/// Academic product (VOD Package / Cohort) from GET /api/academy/cohorts/public or vod-packages/public
class AcademyProductModel {
  final String id;
  final String code;
  final String name;
  final String? description;
  final double price;
  final double? salePrice;
  final String currency;
  final String mode;
  final String? status;
  final String? thumbnailUrl;
  final String? slug;
  final String? courseProfileId;
  final String? cohortId;
  final String? vodPackageId;

  /// From `class` (legacy support or single class mode)
  final String? className;
  final String? courseProfileTitle;
  final String? cohortName;
  final String? cohortCode;
  final DateTime? cohortStartDate;

  const AcademyProductModel({
    required this.id,
    required this.code,
    required this.name,
    this.description,
    required this.price,
    this.salePrice,
    required this.currency,
    required this.mode,
    this.status,
    this.thumbnailUrl,
    this.slug,
    this.courseProfileId,
    this.cohortId,
    this.vodPackageId,
    this.className,
    this.courseProfileTitle,
    this.cohortName,
    this.cohortCode,
    this.cohortStartDate,
  });

  factory AcademyProductModel.fromJson(Map<String, dynamic> json) {
    String? className;
    final c = json['class'];
    if (c is Map) {
      final cm = Map<String, dynamic>.from(c);
      final n = cm['name']?.toString();
      if (n != null && n.isNotEmpty) className = n;
    }

    String? courseProfileTitle;
    final p = json['courseProfile'];
    if (p is Map) {
      final pm = Map<String, dynamic>.from(p);
      final t = pm['title']?.toString();
      if (t != null && t.isNotEmpty) courseProfileTitle = t;
    }

    String? cohortName;
    String? cohortCode;
    DateTime? cohortStartDate;
    final cohort = json['cohort'] ?? json['product'];
    if (cohort is Map) {
      final cm = Map<String, dynamic>.from(cohort);
      final n = cm['name']?.toString();
      final co = cm['code']?.toString();
      if (n != null && n.isNotEmpty) cohortName = n;
      if (co != null && co.isNotEmpty) cohortCode = co;
      final sd = cm['startDate'] ?? cm['openingDate'];
      if (sd != null) {
        cohortStartDate = DateTime.tryParse(sd.toString());
      }
    }

    return AcademyProductModel(
      id: (json['id'] ?? '').toString(),
      code: json['code'] as String? ?? '',
      name: (json['name'] ?? json['title'] ?? '').toString(),
      description: json['description'] as String?,
      price: _parseNum(json['price']).toDouble(),
      salePrice: _parseNumOrNull(json['salePrice'])?.toDouble(),
      currency: json['currency'] as String? ?? 'VND',
      mode: json['mode'] as String? ?? 'VOD',
      status: json['status'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      slug: json['slug'] as String?,
      courseProfileId: json['courseProfileId']?.toString(),
      cohortId: json['cohortId']?.toString(),
      vodPackageId: json['vodPackageId']?.toString(),
      className: className,
      courseProfileTitle: courseProfileTitle,
      cohortName: cohortName,
      cohortCode: cohortCode,
      cohortStartDate: cohortStartDate,
    );
  }

  double get displayPrice => salePrice ?? price;
}

num _parseNum(dynamic value) {
  final parsed = _parseNumOrNull(value);
  return parsed ?? 0;
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
  final String classId;
  final String userId;
  final DateTime? expiresAt;
  final String status;
  final String? productId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? courseTitle;
  final String? courseCode;
  final String? thumbnailUrl;
  final String? instructorName;
  final String? slug;
  final double? progress;
  final int? completedLessons;
  final int? totalLessons;

  /// `LIVE` | `VOD` | … từ product/class (dùng lọc lịch live).
  final String? mode;

  const EnrollmentModel({
    required this.id,
    required this.classId,
    required this.userId,
    this.expiresAt,
    required this.status,
    this.productId,
    required this.createdAt,
    required this.updatedAt,
    this.courseTitle,
    this.courseCode,
    this.thumbnailUrl,
    this.instructorName,
    this.slug,
    this.progress,
    this.completedLessons,
    this.totalLessons,
    this.mode,
  });

  factory EnrollmentModel.fromJson(Map<String, dynamic> json) {
    final enrolledAtRaw = json['enrolledAt'] ?? json['createdAt'];
    final createdAtRaw = json['createdAt'] ?? enrolledAtRaw;
    final updatedAtRaw = json['updatedAt'] ?? enrolledAtRaw;
    final fallbackDate = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);

    String? instructorName = json['instructorName'] as String?;
    if (instructorName == null || instructorName.isEmpty) {
      final ins = json['instructor'];
      if (ins is Map) {
        final dn = ins['displayName']?.toString();
        if (dn != null && dn.isNotEmpty) instructorName = dn;
      }
    }

    return EnrollmentModel(
      id: (json['id'] ?? '').toString(),
      classId: (json['classId'] ?? json['productId'] ?? '').toString(),
      userId: (json['userId'] ?? '').toString(),
      expiresAt: json['expiresAt'] != null
          ? DateTime.tryParse(json['expiresAt'].toString())
          : null,
      status: json['status'] as String? ?? 'ACTIVE',
      productId: json['productId']?.toString(),
      createdAt: DateTime.tryParse(createdAtRaw?.toString() ?? '') ?? fallbackDate,
      updatedAt: DateTime.tryParse(updatedAtRaw?.toString() ?? '') ?? fallbackDate,
      courseTitle: json['courseTitle'] as String?,
      courseCode: json['courseCode'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      instructorName: instructorName,
      slug: json['slug'] as String?,
      progress: (json['progress'] as num?)?.toDouble(),
      completedLessons: (json['completedLessons'] as num?)?.toInt(),
      totalLessons: (json['totalLessons'] as num?)?.toInt(),
      mode: json['mode'] as String?,
    );
  }
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
