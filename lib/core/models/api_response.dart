/// Standard API Response Model - Consolidated New Rebuild
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

  factory ApiResponse.fromJson(Map<String, dynamic> json, [T Function(dynamic)? fromJsonT]) {
    T? parsedData;
    
    if (json['data'] != null) {
      if (fromJsonT != null) {
        parsedData = fromJsonT(json['data']);
      } else {
        try {
           parsedData = json['data'] as T?;
        } catch (_) {
           parsedData = null;
        }
      }
    }

    return ApiResponse<T>(
      success: json['success'] ?? false,
      data: parsedData,
      message: json['message']?.toString(),
      errors: json['errors'] != null ? List<dynamic>.from(json['errors']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      if (data != null) 'data': data,
      if (message != null) 'message': message,
      if (errors != null) 'errors': errors,
    };
  }
}
