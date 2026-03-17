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
      id: json['id'] as String,
      code: json['code'] as String? ?? '',
      title: json['title'] as String,
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
    return EnrollmentModel(
      id: json['id'] as String,
      classId: json['classId'] as String,
      userId: json['userId'] as String,
      expiresAt: json['expiresAt'] != null
          ? DateTime.tryParse(json['expiresAt'].toString())
          : null,
      status: json['status'] as String? ?? 'ACTIVE',
      offeringId: json['offeringId'] as String?,
      createdAt: DateTime.parse(json['createdAt'].toString()),
      updatedAt: DateTime.parse(json['updatedAt'].toString()),
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
    return OrderModel(
      id: json['id'] as String,
      code: json['code'] as String?,
      userId: json['userId'] as String,
      amount: (json['amount'] as num?)?.toDouble() ?? (json['grandTotal'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] as String? ?? 'VND',
      status: json['status'] as String? ?? 'PENDING',
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
