enum CouponStatus { active, inactive, expired }

enum CouponDiscountType { percentage, fixedAmount }

class Coupon {
  final String id;
  final String code;
  final String name;
  final String? description;
  final CouponDiscountType discountType;
  final double discountValue;
  final double? maxDiscountAmount;
  final double? minOrderAmount;
  final List<String> applicableCourseIds;
  final List<String> excludedCourseIds;
  final DateTime validFrom;
  final DateTime validUntil;
  final int? usageLimit;
  final int usageCount;
  final int userUsageLimit;
  final CouponStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Coupon({
    required this.id,
    required this.code,
    required this.name,
    this.description,
    required this.discountType,
    required this.discountValue,
    this.maxDiscountAmount,
    this.minOrderAmount,
    this.applicableCourseIds = const [],
    this.excludedCourseIds = const [],
    required this.validFrom,
    required this.validUntil,
    this.usageLimit,
    this.usageCount = 0,
    this.userUsageLimit = 1,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    CouponStatus parseStatus(String status) {
      switch (status.toLowerCase()) {
        case 'active': return CouponStatus.active;
        case 'inactive': return CouponStatus.inactive;
        case 'expired': return CouponStatus.expired;
        default: return CouponStatus.active;
      }
    }

    CouponDiscountType parseDiscountType(String type) {
      switch (type.toLowerCase()) {
        case 'percentage': return CouponDiscountType.percentage;
        case 'fixed_amount': return CouponDiscountType.fixedAmount;
        default: return CouponDiscountType.percentage;
      }
    }

    return Coupon(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      discountType: parseDiscountType(json['discountType'] as String),
      discountValue: (json['discountValue'] as num).toDouble(),
      maxDiscountAmount: (json['maxDiscountAmount'] as num?)?.toDouble(),
      minOrderAmount: (json['minOrderAmount'] as num?)?.toDouble(),
      applicableCourseIds: (json['applicableCourseIds'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      excludedCourseIds: (json['excludedCourseIds'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      validFrom: DateTime.parse(json['validFrom'] as String),
      validUntil: DateTime.parse(json['validUntil'] as String),
      usageLimit: json['usageLimit'] as int?,
      usageCount: json['usageCount'] as int? ?? 0,
      userUsageLimit: json['userUsageLimit'] as int? ?? 1,
      status: parseStatus(json['status'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  String get discountLabel {
    if (discountType == CouponDiscountType.percentage) {
      return '${discountValue.toInt()}%';
    } else {
      return _formatVND(discountValue);
    }
  }

  String _formatVND(double amount) {
    final intValue = amount.toInt();
    return intValue.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    ) + ' VNĐ';
  }

  bool get isExpired => DateTime.now().isAfter(validUntil);
  bool get isActive => status == CouponStatus.active && !isExpired;
}
