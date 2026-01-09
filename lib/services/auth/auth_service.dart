
import 'package:dio/dio.dart';
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

      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message ?? 'Login failed');
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

      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception(response.data['message'] ?? 'Registration failed');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message ?? 'Registration failed');
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

      if (response.data['success'] == true) {
        return response.data;
      } else {
        throw Exception(response.data['message'] ?? 'Verification failed');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message ?? 'Verification failed');
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

      if (response.data['success'] == true) {
        return response.data;
      } else {
        throw Exception(response.data['message'] ?? 'Resend failed');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message ?? 'Resend failed');
    }
  }

  /// Get user profile from server
  /// Used to sync latest user status (e.g., after email verification)
  Future<Map<String, dynamic>> getProfile() async {
    try {
      final response = await _apiClient.client.get('/api/auth/profile');

      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception(response.data['message'] ?? 'Failed to get profile');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message ?? 'Failed to get profile');
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

      if (response.data['success'] == true) {
        return response.data;
      } else {
        throw Exception(response.data['message'] ?? 'Failed to send reset code');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message ?? 'Failed to send reset code');
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

      if (response.data['success'] == true) {
        return response.data['data'] ?? {};
      } else {
        throw Exception(response.data['message'] ?? 'Invalid or expired verification code');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message ?? 'Verification failed');
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

      if (response.data['success'] == true) {
        return response.data;
      } else {
        throw Exception(response.data['message'] ?? 'Failed to resend code');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message ?? 'Failed to resend code');
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

      if (response.data['success'] == true) {
        return response.data;
      } else {
        throw Exception(response.data['message'] ?? 'Failed to reset password');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message ?? 'Failed to reset password');
    }
  }
}
