import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../../core/config/app_config.dart';
import '../../services/auth/token_service.dart';
import '../models/auth_model.dart';

/// API Client với interceptor để tự động thêm token vào header và refresh token
class ApiClient {
  ApiClient({
    Dio? dio,
    TokenService? tokenService,
  })  : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: AppConfig.apiBaseUrl,
              headers: {
                'Content-Type': 'application/json',
              },
              connectTimeout: const Duration(seconds: 30),
              receiveTimeout: const Duration(seconds: 30),
            )),
        _tokenService = tokenService {
    _setupInterceptors();
  }

  final Dio _dio;
  final TokenService? _tokenService;

  Dio get client => _dio;

  /// Setup interceptors để tự động thêm token vào header
  void _setupInterceptors() {
    // ==========================================
    // 1. LOGGING INTERCEPTOR (giống OkHttp LoggingInterceptor)
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
          // NOTE: Filter callback chỉ support skip routes, không support modify data
          // Để security, có thể skip sensitive routes:
          filter: (options, args) {
            // Skip logging cho một số routes nhạy cảm nếu cần
            // return !options.path.contains('/sensitive-route');
            return true; // Log tất cả
          },
        ),
      );
    }

    // ==========================================
    // 2. AUTH INTERCEPTOR (Token injection + Refresh)
    // ==========================================
    _dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          // Get Firebase ID token and add to Authorization header
          // We'll import firebase_auth here for direct token retrieval
          try {
            final firebaseAuth = firebase_auth.FirebaseAuth.instance;
            final user = firebaseAuth.currentUser;
            
            if (user != null) {
              // Get ID token (Firebase auto-refreshes if needed)
              final token = await user.getIdToken();
              if (token != null) {
                options.headers['Authorization'] = 'Bearer $token';
              }
            }
          } catch (e) {
            // If Firebase token retrieval fails, continue without token
            // The server will return 401 if auth is required
          }
          
          handler.next(options);
        },
        onError: (error, handler) async {
          // For 401 errors, just pass through - Firebase will handle re-auth
          // The auth state listener will trigger sign out if needed
          handler.next(error);
        },
      ),
    );
  }

}


