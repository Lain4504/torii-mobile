sealed class AppException implements Exception {
  final String message;
  final Object? cause;

  const AppException(this.message, {this.cause});

  @override
  String toString() => '$runtimeType: $message';
}

class NetworkException extends AppException {
  const NetworkException(super.message, {super.cause});
}

class ServerException extends AppException {
  const ServerException(super.message, {super.cause});
}

class CacheException extends AppException {
  const CacheException(super.message, {super.cause});
}

