/// Paginated API response from gateway (successPaginatedResponse).
/// Body shape: { success: true, data: T[], total, page, limit, totalPages, message? }
class PaginatedResponse<T> {
  final List<T> data;
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  const PaginatedResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    final list = json['data'] as List<dynamic>? ?? [];
    return PaginatedResponse<T>(
      data: list.map((e) => fromJsonT(e)).toList(),
      total: (json['total'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
    );
  }
}
