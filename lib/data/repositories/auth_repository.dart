import 'package:dio/dio.dart';
import '../api/api_client.dart';
import '../models/auth_model.dart';

/// Repository để xử lý các API calls liên quan đến authentication
class AuthRepository {
  AuthRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;

  /// Login API call
  /// POST /auth/login
  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final response = await _apiClient.client.post(
        '/auth/login',
        data: request.toJson(),
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      // Xử lý lỗi từ Dio
      if (e.response != null) {
        return AuthResponse.fromJson(e.response!.data);
      }
      // Network error hoặc lỗi khác
      return AuthResponse(
        success: false,
        message: e.message ?? 'Đã xảy ra lỗi khi đăng nhập',
      );
    } catch (e) {
      return AuthResponse(
        success: false,
        message: 'Đã xảy ra lỗi không xác định',
      );
    }
  }

  /// Register API call
  /// POST /auth/register
  /// Returns tokens directly (auto-login)
  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await _apiClient.client.post(
        '/auth/register',
        data: request.toJson(),
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        return AuthResponse.fromJson(e.response!.data);
      }
      return AuthResponse(
        success: false,
        message: e.message ?? 'Đã xảy ra lỗi khi đăng ký',
      );
    } catch (e) {
      return AuthResponse(
        success: false,
        message: 'Đã xảy ra lỗi không xác định',
      );
    }
  }

  /// Verify Email API call
  /// POST /auth/verify-email
  Future<AuthResponse> verifyEmail(String email, String otp) async {
    try {
      final response = await _apiClient.client.post(
        '/auth/verify-email',
        data: {
          'email': email,
          'otp': otp,
        },
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        return AuthResponse.fromJson(e.response!.data);
      }
      return AuthResponse(
        success: false,
        message: e.message ?? 'Đã xảy ra lỗi khi xác thực email',
      );
    } catch (e) {
      return AuthResponse(
        success: false,
        message: 'Đã xảy ra lỗi không xác định',
      );
    }
  }

  /// Resend Verification API call
  /// POST /auth/resend-verification
  Future<AuthResponse> resendVerification(String email) async {
    try {
      final response = await _apiClient.client.post(
        '/auth/resend-verification',
        data: {'email': email},
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        return AuthResponse.fromJson(e.response!.data);
      }
      return AuthResponse(
        success: false,
        message: e.message ?? 'Đã xảy ra lỗi khi gửi lại mã',
      );
    } catch (e) {
      return AuthResponse(
        success: false,
        message: 'Đã xảy ra lỗi không xác định',
      );
    }
  }

  /// Logout API call (optional - có thể chỉ xử lý client-side)
  /// POST /auth/logout
  Future<AuthResponse> logout() async {
    try {
      final response = await _apiClient.client.post('/auth/logout');

      return AuthResponse.fromJson(response.data);
    } on DioException {
      // Ngay cả khi server trả lỗi, vẫn coi là logout thành công ở client
      return AuthResponse(
        success: true,
        message: 'Đăng xuất thành công',
      );
    } catch (_) {
      // Vẫn coi là logout thành công
      return AuthResponse(
        success: true,
        message: 'Đăng xuất thành công',
      );
    }
  }

  /// Refresh Token API call
  /// POST /auth/refresh
  Future<AuthResponse> refreshToken(RefreshTokenRequest request) async {
    try {
      final response = await _apiClient.client.post(
        '/auth/refresh',
        data: request.toJson(),
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        return AuthResponse.fromJson(e.response!.data);
      }
      return AuthResponse(
        success: false,
        message: e.message ?? 'Đã xảy ra lỗi khi làm mới token',
      );
    } catch (e) {
      return AuthResponse(
        success: false,
        message: 'Đã xảy ra lỗi không xác định',
      );
    }
  }
}
