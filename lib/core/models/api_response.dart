/// Standard API Response Model
/// 
/// Tất cả API responses từ backend đều follow format này:
/// Success: { success: true, data?: T, message?: string }
/// Error: { success: false, message: string, errors?: any[] }
class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final List<dynamic>? errors;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
    this.errors,
  });

  /// Factory constructor để parse từ JSON
  factory ApiResponse.fromJson(Map<String, dynamic> json, [T Function(dynamic)? fromJsonT]) {
    T? parsedData;
    
    if (json['data'] != null) {
      if (fromJsonT != null) {
        parsedData = fromJsonT(json['data']);
      } else {
        // Default: cast to T nếu T là Map<String, dynamic>
        parsedData = json['data'] as T?;
      }
    }

    return ApiResponse<T>(
      success: json['success'] ?? false,
      data: parsedData,
      message: json['message'],
      errors: json['errors'] != null ? List<dynamic>.from(json['errors']) : null,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      if (data != null) 'data': data,
      if (message != null) 'message': message,
      if (errors != null) 'errors': errors,
    };
  }

  /// Check if response is successful
  bool isSuccess() => success;

  /// Get data or throw exception
  T getDataOrThrow() {
    if (!success) {
      throw Exception(message ?? 'Request failed');
    }
    if (data == null) {
      throw Exception('Data is null');
    }
    return data as T;
  }
}