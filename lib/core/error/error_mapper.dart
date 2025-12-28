import 'app_exception.dart';

class ErrorMapper {
  ErrorMapper._();

  static String toMessage(AppException exception) {
    switch (exception) {
      case NetworkException(:final message):
        return message;
      case ServerException(:final message):
        return message;
      case CacheException(:final message):
        return message;
    }
  }
}

