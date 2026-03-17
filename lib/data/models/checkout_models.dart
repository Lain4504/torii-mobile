class OrderPreviewRequest {
  final String offeringId;
  final String? classId; // required for LIVE
  final String? couponCode;

  const OrderPreviewRequest({
    required this.offeringId,
    this.classId,
    this.couponCode,
  });
}

class OrderPreviewModel {
  final double subTotal;
  final double discountTotal;
  final double grandTotal;

  const OrderPreviewModel({
    required this.subTotal,
    required this.discountTotal,
    required this.grandTotal,
  });

  factory OrderPreviewModel.fromJson(Map<String, dynamic> json) {
    return OrderPreviewModel(
      subTotal: _parseNum(json['subTotal']).toDouble(),
      discountTotal: _parseNum(json['discountTotal']).toDouble(),
      grandTotal: _parseNum(json['grandTotal']).toDouble(),
    );
  }
}

class OrderCheckoutResultModel {
  final String? orderId;
  final String? orderCode;
  final String? paymentUrl;

  const OrderCheckoutResultModel({
    this.orderId,
    this.orderCode,
    this.paymentUrl,
  });

  factory OrderCheckoutResultModel.fromJson(Map<String, dynamic> json) {
    return OrderCheckoutResultModel(
      orderId: json['orderId'] as String? ?? json['id'] as String?,
      orderCode: json['orderCode'] as String? ?? json['code'] as String?,
      paymentUrl: json['paymentUrl'] as String? ?? json['checkoutUrl'] as String?,
    );
  }
}

class OrderFulfillmentItemModel {
  final String offeringId;
  final String offeringCode;
  final String offeringTitle;
  final List<String> expectedClassIds;
  final List<String> enrolledClassIds;
  final List<String> missingClassIds;

  const OrderFulfillmentItemModel({
    required this.offeringId,
    required this.offeringCode,
    required this.offeringTitle,
    required this.expectedClassIds,
    required this.enrolledClassIds,
    required this.missingClassIds,
  });

  factory OrderFulfillmentItemModel.fromJson(Map<String, dynamic> json) {
    return OrderFulfillmentItemModel(
      offeringId: json['offeringId'] as String? ?? '',
      offeringCode: json['offeringCode'] as String? ?? '',
      offeringTitle: json['offeringTitle'] as String? ?? '',
      expectedClassIds: (json['expectedClassIds'] as List<dynamic>? ?? const []).map((e) => e.toString()).toList(),
      enrolledClassIds: (json['enrolledClassIds'] as List<dynamic>? ?? const []).map((e) => e.toString()).toList(),
      missingClassIds: (json['missingClassIds'] as List<dynamic>? ?? const []).map((e) => e.toString()).toList(),
    );
  }
}

class OrderFulfillmentSummaryModel {
  final String id;
  final String code;
  final String status;
  final DateTime? paidAt;
  final double grandTotal;
  final String currency;
  final List<OrderFulfillmentItemModel> items;

  const OrderFulfillmentSummaryModel({
    required this.id,
    required this.code,
    required this.status,
    required this.paidAt,
    required this.grandTotal,
    required this.currency,
    required this.items,
  });

  factory OrderFulfillmentSummaryModel.fromJson(Map<String, dynamic> json) {
    return OrderFulfillmentSummaryModel(
      id: json['id'] as String? ?? '',
      code: json['code'] as String? ?? '',
      status: json['status'] as String? ?? '',
      paidAt: json['paidAt'] != null ? DateTime.tryParse(json['paidAt'].toString()) : null,
      grandTotal: _parseNum(json['grandTotal']).toDouble(),
      currency: json['currency'] as String? ?? 'VND',
      items: (json['items'] as List<dynamic>? ?? const [])
          .whereType<Map>()
          .map((e) => OrderFulfillmentItemModel.fromJson(e.cast<String, dynamic>()))
          .toList(),
    );
  }
}

num _parseNum(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value;
  if (value is String) return num.tryParse(value) ?? 0;
  return 0;
}

