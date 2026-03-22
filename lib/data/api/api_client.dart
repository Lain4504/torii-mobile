import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import '../../core/config/app_config.dart';
import '../../core/models/api_response.dart';
import '../../services/auth/token_service.dart';

/// API Client với interceptor để tự động thêm token vào header và refresh token
class ApiClient {
  ApiClient({
    Dio? dio,
    TokenService? tokenService,
    Future<void> Function()? onUnauthorizedLogout,
  })  : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: AppConfig.apiBaseUrl,
              headers: {
                'Content-Type': 'application/json',
              },
              connectTimeout: const Duration(seconds: 30),
              receiveTimeout: const Duration(seconds: 30),
            )),
        _tokenService = tokenService,
        _onUnauthorizedLogout = onUnauthorizedLogout {
    _setupInterceptors();
  }

  final Dio _dio;
  final TokenService? _tokenService;
  final Future<void> Function()? _onUnauthorizedLogout;

  Dio get client => _dio;

  bool _isRefreshing = false;
  final List<Map<String, dynamic>> _failedRequestQueue = [];
  final CookieJar _cookieJar = CookieJar(); // Single instance

  /// Setup interceptors để tự động thêm token vào header và xử lý refresh token
  void _setupInterceptors() {
    // ==========================================
    // 0. COOKIE MANAGER (Priority High)
    // ==========================================
    _dio.interceptors.add(CookieManager(_cookieJar));

    // ==========================================
    // 1. LOGGING INTERCEPTOR
    // ==========================================
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
          filter: (options, args) => true,
        ),
      );
    }

    // ==========================================
    // 2. AUTH INTERCEPTOR (Token injection + Refresh)
    // ==========================================
    _dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          // Luôn gửi — gateway cần header này để trả token trong body (mobile),
          // không phụ thuộc getAccessToken (Keychain iOS có thể ném lỗi trước khi gán header).
          options.headers['x-platform'] = 'mobile';

          final tokenService = _tokenService;
          if (tokenService != null) {
            if (!options.headers.containsKey('Authorization')) {
              try {
                final token = await tokenService.getAccessToken();
                if (token != null) {
                  options.headers['Authorization'] = 'Bearer $token';
                }
              } catch (e) {
                debugPrint('ApiClient: getAccessToken failed: $e');
              }
            }
          }

          handler.next(options);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          // Handle 401 Unauthorized
          final tokenService = _tokenService;
          if (error.response?.statusCode == 401 && tokenService != null) {
             // Avoid infinite loop if refresh endpoint itself fails
            if (error.requestOptions.path.contains('/auth/refresh')) {
              await tokenService.clearTokens();
              handler.next(error);
              return;
            }

            // If already refreshing, queue this request
            if (_isRefreshing) {
              _failedRequestQueue.add({
                'handler': handler,
                'error': error,
              });
              return;
            }

            _isRefreshing = true;

            try {
              final refreshToken = await tokenService.getRefreshToken();
              
              if (refreshToken == null) {
                // No refresh token, logout
                await _performLogout(handler, error);
                return;
              }

              // Call refresh endpoint
              // Create a separate Dio instance to avoid interceptor loops
              final tokenDio = Dio(BaseOptions(
                baseUrl: _dio.options.baseUrl,
                headers: {
                  'Content-Type': 'application/json',
                  'x-platform': 'mobile',
                },
              ));

              final response = await tokenDio.post('/api/auth/refresh', data: {
                'refresh_token': refreshToken,
              });

              if (response.statusCode == 200) {
                final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);
                if (apiResponse.success && apiResponse.data != null) {
                  final data = apiResponse.data!;
                  final newAccessToken = data['accessToken'] ?? data['access_token'];
                  final newRefreshToken = data['refreshToken'] ?? data['refresh_token'];

                  await tokenService.saveTokens(
                    accessToken: newAccessToken!,
                    refreshToken: newRefreshToken ?? refreshToken,
                  );

                  // Retry original request
                  await _retryRequest(error.requestOptions, handler, newAccessToken);

                  // Process queued requests
                  for (var request in _failedRequestQueue) {
                    final queuedError = request['error'] as DioException;
                    final queuedHandler = request['handler'] as ErrorInterceptorHandler;
                    await _retryRequest(queuedError.requestOptions, queuedHandler, newAccessToken);
                  }
                  _failedRequestQueue.clear();
                } else {
                  await _performLogout(handler, error);
                }
              } else {
                await _performLogout(handler, error);
              }
            } catch (e) {
              await _performLogout(handler, error);
            } finally {
              _isRefreshing = false;
            }
          } else {
            handler.next(error);
          }
        },
      ),
    );
  }

  Future<void> _performLogout(ErrorInterceptorHandler handler, DioException error) async {
    await _tokenService?.clearTokens();
    try {
      await _onUnauthorizedLogout?.call();
    } catch (_) {
      // ignore
    }
    
    // Reject all queued requests
    for (var request in _failedRequestQueue) {
      final queuedHandler = request['handler'] as ErrorInterceptorHandler;
      final queuedError = request['error'] as DioException;
      queuedHandler.next(queuedError);
    }
    _failedRequestQueue.clear();
    
    handler.next(error);
  }

  Future<void> _retryRequest(RequestOptions requestOptions, ErrorInterceptorHandler handler, String newToken) async {
    final opts = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $newToken',
      },
    );

    try {
      final response = await _dio.request(
        requestOptions.path,
        options: opts,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
      );
      handler.resolve(response);
    } catch (e) {
      if (e is DioException) {
        handler.next(e);
      } else {
        handler.next(DioException(requestOptions: requestOptions, error: e));
      }
    }
  }

}


