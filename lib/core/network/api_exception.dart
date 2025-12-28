/// Custom exception classes for API errors
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic originalError;

  ApiException({
    required this.message,
    this.statusCode,
    this.originalError,
  });

  @override
  String toString() => message;
}

class NetworkException extends ApiException {
  NetworkException({
    super.message = 'Network error. Please check your internet connection.',
    super.statusCode,
    super.originalError,
  });
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({
    super.message = 'Unauthorized. Please login again.',
    super.statusCode = 401,
    super.originalError,
  });
}

class NotFoundException extends ApiException {
  NotFoundException({
    super.message = 'Resource not found.',
    super.statusCode = 404,
    super.originalError,
  });
}

class ServerException extends ApiException {
  ServerException({
    super.message = 'Server error. Please try again later.',
    super.statusCode = 500,
    super.originalError,
  });
}

class ValidationException extends ApiException {
  ValidationException({
    super.message = 'Validation error. Please check your input.',
    super.statusCode = 400,
    super.originalError,
  });
}

