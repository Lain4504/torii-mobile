
import 'package:dio/dio.dart';
import '../../core/models/api_response.dart';
import '../../data/api/api_client.dart';

class AuthService {
  final ApiClient _apiClient;

  AuthService(this._apiClient);

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/login',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'x-platform': 'mobile',
          },
        ),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);
      if (apiResponse.success) {
        return apiResponse.data!;
      } else {
        throw Exception(apiResponse.message ?? 'Login failed');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        try {
          final errorResponse = ApiResponse.fromJson(e.response!.data);
          throw Exception(errorResponse.message ?? 'Login failed');
        } catch (_) {
          throw Exception(e.message ?? 'Login failed');
        }
      }
      throw Exception(e.message ?? 'Login failed');
    }
  }

  Future<Map<String, dynamic>> register(String email, String password, String displayName) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/register',
        data: {
          'email': email,
          'password': password,
          'displayName': displayName,
        },
        options: Options(
          headers: {
            'x-platform': 'mobile',
          },
        ),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);
      if (apiResponse.success) {
        return apiResponse.data!;
      } else {
        throw Exception(apiResponse.message ?? 'Registration failed');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        try {
          final errorResponse = ApiResponse.fromJson(e.response!.data);
          throw Exception(errorResponse.message ?? 'Registration failed');
        } catch (_) {
          throw Exception(e.message ?? 'Registration failed');
        }
      }
      throw Exception(e.message ?? 'Registration failed');
    }
  }

  Future<Map<String, dynamic>> verifyEmail(String email, String otp) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/verify-email',
        data: {
          'email': email,
          'otp': otp,
        },
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);
      if (apiResponse.success) {
        return apiResponse.data ?? {};
      } else {
        throw Exception(apiResponse.message ?? 'Verification failed');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        try {
          final errorResponse = ApiResponse.fromJson(e.response!.data);
          throw Exception(errorResponse.message ?? 'Verification failed');
        } catch (_) {
          throw Exception(e.message ?? 'Verification failed');
        }
      }
      throw Exception(e.message ?? 'Verification failed');
    }
  }

  Future<Map<String, dynamic>> resendVerification(String email) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/resend-verification',
        data: {
          'email': email,
        },
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);
      if (apiResponse.success) {
        return apiResponse.data ?? {};
      } else {
        throw Exception(apiResponse.message ?? 'Resend failed');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        try {
          final errorResponse = ApiResponse.fromJson(e.response!.data);
          throw Exception(errorResponse.message ?? 'Resend failed');
        } catch (_) {
          throw Exception(e.message ?? 'Resend failed');
        }
      }
      throw Exception(e.message ?? 'Resend failed');
    }
  }

  /// Get user profile from server
  /// Used to sync latest user status (e.g., after email verification)
  Future<Map<String, dynamic>> getProfile() async {
    try {
      final response = await _apiClient.client.get('/api/auth/profile');

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);
      if (apiResponse.success) {
        return apiResponse.data!;
      } else {
        throw Exception(apiResponse.message ?? 'Failed to get profile');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        try {
          final errorResponse = ApiResponse.fromJson(e.response!.data);
          throw Exception(errorResponse.message ?? 'Failed to get profile');
        } catch (_) {
          throw Exception(e.message ?? 'Failed to get profile');
        }
      }
      throw Exception(e.message ?? 'Failed to get profile');
    }
  }

  Future<void> logout() async {
    try {
      await _apiClient.client.post('/api/auth/logout');
    } on DioException {
      // Safe to ignore
    }
  }

  /// Request password reset - sends OTP to email
  Future<Map<String, dynamic>> forgotPassword(String email) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/forgot-password',
        data: {
          'email': email,
          'platform': 'mobile',
        },
        options: Options(
          headers: {
            'x-platform': 'mobile',
          },
        ),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);
      if (apiResponse.success) {
        return apiResponse.data ?? {};
      } else {
        throw Exception(apiResponse.message ?? 'Failed to send reset code');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        try {
          final errorResponse = ApiResponse.fromJson(e.response!.data);
          throw Exception(errorResponse.message ?? 'Failed to send reset code');
        } catch (_) {
          throw Exception(e.message ?? 'Failed to send reset code');
        }
      }
      throw Exception(e.message ?? 'Failed to send reset code');
    }
  }

  /// Verify OTP code for password reset
  /// Returns email and tempToken if successful
  Future<Map<String, dynamic>> verifyOTP(String email, String otp, {String type = 'reset-password'}) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/verify-otp',
        data: {
          'email': email,
          'otp': otp,
          'type': type,
        },
        options: Options(
          headers: {
            'x-platform': 'mobile',
          },
        ),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);
      if (apiResponse.success) {
        return apiResponse.data ?? {};
      } else {
        throw Exception(apiResponse.message ?? 'Invalid or expired verification code');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        try {
          final errorResponse = ApiResponse.fromJson(e.response!.data);
          throw Exception(errorResponse.message ?? 'Verification failed');
        } catch (_) {
          throw Exception(e.message ?? 'Verification failed');
        }
      }
      throw Exception(e.message ?? 'Verification failed');
    }
  }

  /// Resend OTP code
  Future<Map<String, dynamic>> resendOTP(String email, {String type = 'reset-password'}) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/resend-otp',
        data: {
          'email': email,
          'type': type,
        },
        options: Options(
          headers: {
            'x-platform': 'mobile',
          },
        ),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);
      if (apiResponse.success) {
        return apiResponse.data ?? {};
      } else {
        throw Exception(apiResponse.message ?? 'Failed to resend code');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        try {
          final errorResponse = ApiResponse.fromJson(e.response!.data);
          throw Exception(errorResponse.message ?? 'Failed to resend code');
        } catch (_) {
          throw Exception(e.message ?? 'Failed to resend code');
        }
      }
      throw Exception(e.message ?? 'Failed to resend code');
    }
  }

  /// Reset password using token from OTP verification
  Future<Map<String, dynamic>> resetPassword(String token, String newPassword) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/reset-password',
        data: {
          'token': token,
          'password': newPassword,
        },
        options: Options(
          headers: {
            'x-platform': 'mobile',
          },
        ),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);
      if (apiResponse.success) {
        return apiResponse.data ?? {};
      } else {
        throw Exception(apiResponse.message ?? 'Failed to reset password');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        try {
          final errorResponse = ApiResponse.fromJson(e.response!.data);
          throw Exception(errorResponse.message ?? 'Failed to reset password');
        } catch (_) {
          throw Exception(e.message ?? 'Failed to reset password');
        }
      }
      throw Exception(e.message ?? 'Failed to reset password');
    }
  }
}
