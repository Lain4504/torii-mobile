/// Models for AI Sensei subscription & quota.
class SenseiSubscriptionPlan {
  final String id;
  final String code;
  final String name;
  final int price;
  final int aiTurns;
  final List<String> features;

  const SenseiSubscriptionPlan({
    required this.id,
    required this.code,
    required this.name,
    required this.price,
    required this.aiTurns,
    required this.features,
  });

  factory SenseiSubscriptionPlan.fromJson(Map<String, dynamic> json) {
    final quotas = json['quotas'];
    int aiTurns = 0;
    if (quotas is Map) {
      aiTurns = (quotas['ai_turns'] as num?)?.toInt() ?? 0;
    }

    return SenseiSubscriptionPlan(
      id: (json['id'] ?? '').toString(),
      code: (json['code'] ?? '').toString(),
      name: (json['name'] ?? '').toString(),
      price: (json['price'] ?? 0) is num ? (json['price'] as num).toInt() : int.tryParse(json['price']?.toString() ?? '0') ?? 0,
      aiTurns: aiTurns,
      features: (json['features'] as List<dynamic>? ?? const [])
          .map((e) => e.toString())
          .toList(),
    );
  }
}

class SenseiQuotaStatus {
  final String tier;
  final int limit;
  final int used;
  final int remaining;
  final DateTime? resetAt;

  const SenseiQuotaStatus({
    required this.tier,
    required this.limit,
    required this.used,
    required this.remaining,
    this.resetAt,
  });

  factory SenseiQuotaStatus.fromJson(Map<String, dynamic> json) {
    return SenseiQuotaStatus(
      tier: (json['tier'] ?? '').toString(),
      limit: (json['limit'] as num?)?.toInt() ?? 0,
      used: (json['used'] as num?)?.toInt() ?? 0,
      remaining: (json['remaining'] as num?)?.toInt() ?? 0,
      resetAt: json['resetAt'] != null
          ? DateTime.tryParse(json['resetAt'].toString())
          : null,
    );
  }
}

class SenseiSubscriptionCheckoutResult {
  final String? id;
  final String? code;
  final String? paymentUrl;
  final String? status;

  const SenseiSubscriptionCheckoutResult({
    this.id,
    this.code,
    this.paymentUrl,
    this.status,
  });

  factory SenseiSubscriptionCheckoutResult.fromJson(Map<String, dynamic> json) {
    return SenseiSubscriptionCheckoutResult(
      id: (json['id'] ?? json['orderId'])?.toString(),
      code: (json['code'] ?? json['orderCode'])?.toString(),
      paymentUrl: (json['paymentUrl'] ?? json['checkoutUrl'])?.toString(),
      status: json['status']?.toString(),
    );
  }
}

