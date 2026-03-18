/// Course offering from GET /api/academy/course-offerings/public
class CourseOfferingModel {
  final String id;
  final String code;
  final String title;
  final String? description;
  final double price;
  final double? salePrice;
  final String currency;
  final String mode;
  final String? status;
  final String? thumbnailUrl;
  final String? slug;

  const CourseOfferingModel({
    required this.id,
    required this.code,
    required this.title,
    this.description,
    required this.price,
    this.salePrice,
    required this.currency,
    required this.mode,
    this.status,
    this.thumbnailUrl,
    this.slug,
  });

  factory CourseOfferingModel.fromJson(Map<String, dynamic> json) {
    return CourseOfferingModel(
      id: (json['id'] ?? '').toString(),
      code: json['code'] as String? ?? '',
      title: (json['title'] ?? '').toString(),
      description: json['description'] as String?,
      price: _parseNum(json['price']).toDouble(),
      salePrice: _parseNumOrNull(json['salePrice'])?.toDouble(),
      currency: json['currency'] as String? ?? 'VND',
      mode: json['mode'] as String? ?? 'VOD',
      status: json['status'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      slug: json['slug'] as String?,
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
  final String? offeringId;
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

  const EnrollmentModel({
    required this.id,
    required this.classId,
    required this.userId,
    this.expiresAt,
    required this.status,
    this.offeringId,
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
  });

  factory EnrollmentModel.fromJson(Map<String, dynamic> json) {
    final enrolledAtRaw = json['enrolledAt'] ?? json['createdAt'];
    final createdAtRaw = json['createdAt'] ?? enrolledAtRaw;
    final updatedAtRaw = json['updatedAt'] ?? enrolledAtRaw;
    final fallbackDate = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);

    return EnrollmentModel(
      id: (json['id'] ?? '').toString(),
      classId: (json['classId'] ?? '').toString(),
      userId: (json['userId'] ?? '').toString(),
      expiresAt: json['expiresAt'] != null
          ? DateTime.tryParse(json['expiresAt'].toString())
          : null,
      status: json['status'] as String? ?? 'ACTIVE',
      offeringId: json['offeringId'] as String?,
      createdAt: DateTime.tryParse(createdAtRaw?.toString() ?? '') ?? fallbackDate,
      updatedAt: DateTime.tryParse(updatedAtRaw?.toString() ?? '') ?? fallbackDate,
      courseTitle: json['courseTitle'] as String?,
      courseCode: json['courseCode'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      instructorName: json['instructorName'] as String?,
      slug: json['slug'] as String?,
      progress: (json['progress'] as num?)?.toDouble(),
      completedLessons: (json['completedLessons'] as num?)?.toInt(),
      totalLessons: (json['totalLessons'] as num?)?.toInt(),
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
