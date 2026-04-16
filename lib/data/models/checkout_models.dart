class OrderPreviewRequest {
  final String productId;
  final String? liveClassId;
  final String? couponCode;

  const OrderPreviewRequest({
    required this.productId,
    this.liveClassId,
    this.couponCode,
  });
}

class OrderPreviewModel {
  final double subTotal;
  final double discountTotal;
  final double grandTotal;
  final double walletDiscount;

  const OrderPreviewModel({
    required this.subTotal,
    required this.discountTotal,
    required this.grandTotal,
    this.walletDiscount = 0,
  });

  factory OrderPreviewModel.fromJson(Map<String, dynamic> json) {
    double toDouble(dynamic v) {
      if (v == null) return 0;
      if (v is num) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? 0;
      return double.tryParse(v.toString()) ?? 0;
    }

    return OrderPreviewModel(
      subTotal: toDouble(json['subTotal']),
      discountTotal: toDouble(json['discountTotal']),
      grandTotal: toDouble(json['grandTotal']),
      walletDiscount: toDouble(json['walletDiscount']),
    );
  }
}

class OrderCheckoutResultModel {
  final String orderId;
  final String orderCode;
  final String? paymentUrl;

  const OrderCheckoutResultModel({
    required this.orderId,
    required this.orderCode,
    this.paymentUrl,
  });

  factory OrderCheckoutResultModel.fromJson(Map<String, dynamic> json) {
    return OrderCheckoutResultModel(
      orderId: (json['orderId'] ?? '').toString(),
      orderCode: (json['orderCode'] ?? '').toString(),
      paymentUrl: json['paymentUrl'] as String?,
    );
  }
}

class OrderFulfillmentItemModel {
  final String productId;
  final String productCode;
  final String productName;
  final List<String> expectedLiveClassIds;
  final List<String> enrolledLiveClassIds;
  final List<String> missingLiveClassIds;

  const OrderFulfillmentItemModel({
    required this.productId,
    required this.productCode,
    required this.productName,
    required this.expectedLiveClassIds,
    required this.enrolledLiveClassIds,
    required this.missingLiveClassIds,
  });

  factory OrderFulfillmentItemModel.fromJson(Map<String, dynamic> json) {
    return OrderFulfillmentItemModel(
      productId: json['productId'].toString(),
      productCode: json['productCode'].toString(),
      productName: json['productName'].toString(),
      expectedLiveClassIds: List<String>.from(
        json['expectedLiveClassIds'] ?? [],
      ),
      enrolledLiveClassIds: List<String>.from(
        json['enrolledLiveClassIds'] ?? [],
      ),
      missingLiveClassIds: List<String>.from(
        json['missingLiveClassIds'] ?? [],
      ),
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
    double toDouble(dynamic v) {
      if (v == null) return 0;
      if (v is num) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? 0;
      return double.tryParse(v.toString()) ?? 0;
    }

    return OrderFulfillmentSummaryModel(
      id: json['id'].toString(),
      code: json['code'].toString(),
      status: json['status'].toString(),
      paidAt: json['paidAt'] != null ? DateTime.parse(json['paidAt'].toString()) : null,
      grandTotal: toDouble(json['grandTotal']),
      currency: json['currency']?.toString() ?? 'VND',
      items: (json['items'] as List?)
              ?.map((e) => OrderFulfillmentItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
