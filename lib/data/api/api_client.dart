import 'package:dio/dio.dart';
import '../../core/config/app_config.dart';
import '../../services/storage/secure_storage_service.dart';

/// API Client với interceptor để tự động thêm token vào header
class ApiClient {
  ApiClient({
    Dio? dio,
    SecureStorageService? secureStorage,
  })  : _dio = dio ?? Dio(BaseOptions(
          baseUrl: AppConfig.apiBaseUrl,
          headers: {
            'Content-Type': 'application/json',
          },
        )),
        _secureStorage = secureStorage ?? SecureStorageService() {
    _setupInterceptors();
  }

  final Dio _dio;
  final SecureStorageService _secureStorage;

  Dio get client => _dio;

  /// Setup interceptors để tự động thêm token vào header
  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Lấy token từ secure storage và thêm vào header
          final token = await _secureStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) {
          // Xử lý lỗi 401 (Unauthorized) - có thể logout user
          if (error.response?.statusCode == 401) {
            // Token không hợp lệ, có thể xóa token và redirect về login
          }
          handler.next(error);
        },
      ),
    );
  }
}

