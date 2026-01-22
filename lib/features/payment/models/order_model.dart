
enum OrderStatus {
  pending,
  processing,
  completed,
  failed,
  refunded,
  cancelled;

  static OrderStatus fromString(String value) {
    return OrderStatus.values.firstWhere(
      (e) => e.name == value.toLowerCase(),
      orElse: () => OrderStatus.pending,
    );
  }
}

enum PaymentMethod {
  creditCard,
  bankTransfer,
  momo,
  zalopay,
  vnpay,
  payos,
  sepay,
  mock;

  static PaymentMethod fromString(String value) {
    return PaymentMethod.values.firstWhere(
      (e) => e.name == value.toLowerCase(),
      orElse: () => PaymentMethod.mock,
    );
  }

  String toApiValue() {
    // Backend expects snake_case for some payment methods
    switch (this) {
      case PaymentMethod.creditCard:
        return 'credit_card';
      case PaymentMethod.bankTransfer:
        return 'bank_transfer';
      case PaymentMethod.momo:
        return 'momo';
      case PaymentMethod.zalopay:
        return 'zalopay';
      case PaymentMethod.vnpay:
        return 'vnpay';
      case PaymentMethod.payos:
        return 'payos';
      case PaymentMethod.sepay:
        return 'sepay';
      case PaymentMethod.mock:
        return 'mock';
    }
  }
}

enum PaymentGateway {
  stripe,
  paypal,
  vnpay,
  momo,
  payos,
  sepay,
  mock;

  static PaymentGateway? fromString(String? value) {
    if (value == null) return null;
    return PaymentGateway.values.firstWhere(
      (e) => e.name == value.toLowerCase(),
      orElse: () => PaymentGateway.mock,
    );
  }
}

enum OrderType {
  coursePurchase,
  subscription,
  topUp,
  gift;

  static OrderType fromString(String value) {
    // Backend uses snake_case: course_purchase, subscription, top_up, gift
    final normalized = value.toLowerCase().replaceAll('_', '');
    return OrderType.values.firstWhere(
      (e) => e.name.toLowerCase().replaceAll('_', '') == normalized,
      orElse: () => OrderType.coursePurchase,
    );
  }

  String toApiValue() {
    // Backend expects snake_case
    switch (this) {
      case OrderType.coursePurchase:
        return 'course_purchase';
      case OrderType.topUp:
        return 'top_up';
      case OrderType.subscription:
        return 'subscription';
      case OrderType.gift:
        return 'gift';
    }
  }
}

class Order {
  final String id;
  final String userId;
  final double amount;
  final String currency;
  final PaymentMethod paymentMethod;
  final PaymentGateway? paymentGateway;
  final String? transactionId;
  final String? gatewayTransactionId;
  final OrderStatus status;
  final OrderType orderType;
  final String? enrollmentId;
  final String? couponId;
  final String? description;
  final Map<String, dynamic> metadata;
  final DateTime? completedAt;
  final DateTime? failedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  // PayOS specific fields
  final String? checkoutUrl;
  final String? qrCode;
  final String? accountNumber;
  final String? accountName;
  final String? bin;

  Order({
    required this.id,
    required this.userId,
    required this.amount,
    this.currency = 'VND',
    required this.paymentMethod,
    this.paymentGateway,
    this.transactionId,
    this.gatewayTransactionId,
    required this.status,
    required this.orderType,
    this.enrollmentId,
    this.couponId,
    this.description,
    this.metadata = const {},
    this.completedAt,
    this.failedAt,
    required this.createdAt,
    required this.updatedAt,
    this.checkoutUrl,
    this.qrCode,
    this.accountNumber,
    this.accountName,
    this.bin,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    // Handle null-safe parsing
    final id = json['id']?.toString() ?? '';
    final userId = json['userId']?.toString() ?? '';
    final amount = (json['amount'] as num?)?.toDouble() ?? 0.0;
    final currency = json['currency']?.toString() ?? 'VND';
    final paymentMethodStr = json['paymentMethod']?.toString() ?? 'mock';
    final paymentGatewayStr = json['paymentGateway']?.toString();
    final transactionId = json['transactionId']?.toString();
    final gatewayTransactionId = json['gatewayTransactionId']?.toString();
    final statusStr = json['status']?.toString() ?? 'pending';
    final orderTypeStr = json['orderType']?.toString() ?? 'course_purchase';
    final enrollmentId = json['enrollmentId']?.toString();
    final couponId = json['couponId']?.toString();
    final description = json['description']?.toString();
    final metadata = json['metadata'] as Map<String, dynamic>? ?? {};
    
    // Parse dates safely
    DateTime? completedAt;
    if (json['completedAt'] != null) {
      try {
        completedAt = DateTime.parse(json['completedAt'].toString());
      } catch (_) {
        completedAt = null;
      }
    }
    
    DateTime? failedAt;
    if (json['failedAt'] != null) {
      try {
        failedAt = DateTime.parse(json['failedAt'].toString());
      } catch (_) {
        failedAt = null;
      }
    }
    
    final createdAtStr = json['createdAt']?.toString();
    final updatedAtStr = json['updatedAt']?.toString();
    
    if (createdAtStr == null || updatedAtStr == null) {
      throw Exception('Missing required fields: createdAt or updatedAt');
    }
    
    // PayOS fields from metadata or direct fields
    final checkoutUrl = json['checkoutUrl']?.toString() ?? metadata['checkoutUrl']?.toString();
    final qrCode = json['qrCode']?.toString() ?? metadata['qrCode']?.toString();
    final accountNumber = json['accountNumber']?.toString() ?? metadata['accountNumber']?.toString();
    final accountName = json['accountName']?.toString() ?? metadata['accountName']?.toString();
    final bin = json['bin']?.toString() ?? metadata['bin']?.toString();
    
    return Order(
      id: id,
      userId: userId,
      amount: amount,
      currency: currency,
      paymentMethod: PaymentMethod.fromString(paymentMethodStr),
      paymentGateway: PaymentGateway.fromString(paymentGatewayStr),
      transactionId: transactionId,
      gatewayTransactionId: gatewayTransactionId,
      status: OrderStatus.fromString(statusStr),
      orderType: OrderType.fromString(orderTypeStr),
      enrollmentId: enrollmentId,
      couponId: couponId,
      description: description,
      metadata: metadata,
      completedAt: completedAt,
      failedAt: failedAt,
      createdAt: DateTime.parse(createdAtStr),
      updatedAt: DateTime.parse(updatedAtStr),
      checkoutUrl: checkoutUrl,
      qrCode: qrCode,
      accountNumber: accountNumber,
      accountName: accountName,
      bin: bin,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'currency': currency,
      'paymentMethod': paymentMethod.toApiValue(),
      'paymentGateway': paymentGateway?.name,
      'transactionId': transactionId,
      'gatewayTransactionId': gatewayTransactionId,
      'status': status.name,
      'orderType': orderType.toApiValue(),
      'enrollmentId': enrollmentId,
      'couponId': couponId,
      'description': description,
      'metadata': metadata,
      'completedAt': completedAt?.toIso8601String(),
      'failedAt': failedAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  bool get isCompleted => status == OrderStatus.completed;
  bool get isPending => status == OrderStatus.pending;
  bool get isFailed => status == OrderStatus.failed || status == OrderStatus.cancelled;
}

class OrderCreateRequest {
  final String? courseId;
  final PaymentMethod paymentMethod;
  final PaymentGateway? paymentGateway;
  final OrderType orderType;
  final String? description;
  final String? returnUrl;
  final String? cancelUrl;
  final Map<String, dynamic>? metadata;

  OrderCreateRequest({
    this.courseId,
    required this.paymentMethod,
    this.paymentGateway,
    this.orderType = OrderType.coursePurchase,
    this.description,
    this.returnUrl,
    this.cancelUrl,
    this.metadata,
  });

  Map<String, dynamic> toJson() {
    return {
      if (courseId != null) 'courseId': courseId,
      'paymentMethod': paymentMethod.toApiValue(),
      if (paymentGateway != null) 'paymentGateway': paymentGateway!.name,
      'orderType': orderType.toApiValue(),
      if (description != null) 'description': description,
      if (returnUrl != null) 'returnUrl': returnUrl,
      if (cancelUrl != null) 'cancelUrl': cancelUrl,
      if (metadata != null) 'metadata': metadata,
    };
  }
}
