import 'package:dio/dio.dart';
import '../../data/api/api_client.dart';
import '../../data/models/auth_model.dart';
import '../../core/models/api_response.dart';

class AuthService {
  final ApiClient _apiClient;

  AuthService(this._apiClient);

  /// 1.1 Register
  Future<ApiResponse<AuthData>> register({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/register',
        data: {
          'email': email,
          'password': password,
          'displayName': displayName,
        },
        options: Options(headers: {'x-platform': 'mobile'}),
      );
      return ApiResponse.fromJson(response.data, (json) => AuthData.fromJson(json));
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 1.2 Login with email/password
  Future<ApiResponse<AuthData>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/login',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(headers: {'x-platform': 'mobile'}),
      );
      return ApiResponse.fromJson(response.data, (json) => AuthData.fromJson(json));
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 1.2.1 Google Login
  Future<ApiResponse<AuthData>> googleLogin(String idToken) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/google',
        data: {'idToken': idToken},
        options: Options(headers: {'x-platform': 'mobile'}),
      );
      return ApiResponse.fromJson(response.data, (json) => AuthData.fromJson(json));
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 1.3 Verify 2FA
  Future<ApiResponse<AuthData>> verify2FA({
    required String tempToken,
    required String code,
    bool backupCode = false,
  }) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/login/verify-2fa',
        data: {
          'tempToken': tempToken,
          'code': code,
          'backupCode': backupCode,
        },
        options: Options(headers: {'x-platform': 'mobile'}),
      );
      return ApiResponse.fromJson(response.data, (json) => AuthData.fromJson(json));
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 1.4 Forgot Password
  Future<ApiResponse<void>> forgotPassword(String email) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/forgot-password',
        data: {'email': email, 'platform': 'mobile'},
      );
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> verifyOTP(String email, String code) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/verify-otp',
        data: {'email': email, 'code': code},
      );
      return ApiResponse.fromJson(response.data, (json) => json as Map<String, dynamic>);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse<void>> resendOTP(String email, {String reason = 'forgot_password'}) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/resend-otp',
        data: {'email': email, 'reason': reason},
      );
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 1.5 Refresh Token
  Future<ApiResponse<Map<String, dynamic>>> refreshToken(String refreshToken) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/refresh',
        data: {'refreshToken': refreshToken},
        options: Options(headers: {'x-platform': 'mobile'}),
      );
      return ApiResponse.fromJson(response.data, (json) => json as Map<String, dynamic>);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 1.6 Reset Password
  Future<ApiResponse<void>> resetPassword(String token, String password) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/reset-password',
        data: {'token': token, 'password': password},
      );
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 2. 2FA Setup
  Future<ApiResponse<Map<String, dynamic>>> get2FAStatus() async {
    try {
      final response = await _apiClient.client.get('/api/auth/2fa/status');
      return ApiResponse.fromJson(response.data, (json) => json as Map<String, dynamic>);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> generateTOTPSecret() async {
    try {
      final response = await _apiClient.client.post('/api/auth/2fa/totp/generate');
      return ApiResponse.fromJson(response.data, (json) => json as Map<String, dynamic>);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse<List<String>>> enableTOTP(String secret, String code) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/2fa/totp/enable',
        data: {'secret': secret, 'code': code},
      );
      return ApiResponse.fromJson(response.data, (json) => List<String>.from(json['backupCodes'] ?? []));
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse<List<String>>> regenerateBackupCodes() async {
    try {
      final response = await _apiClient.client.post('/api/auth/2fa/backup-codes/regenerate');
      return ApiResponse.fromJson(response.data, (json) => List<String>.from(json['backupCodes'] ?? []));
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse<void>> disable2FA(String password) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/2fa/totp/disable',
        data: {'password': password},
      );
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 3. User Profile
  Future<ApiResponse<User>> getMe() async {
    try {
      final response = await _apiClient.client.get('/api/auth/me');
      return ApiResponse.fromJson(response.data, (json) => User.fromJson(json));
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse<User>> updateProfile(String displayName) async {
    try {
      final response = await _apiClient.client.patch(
        '/api/auth/me',
        data: {'displayName': displayName},
      );
      return ApiResponse.fromJson(response.data, (json) => User.fromJson(json));
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse<void>> logout(String refreshToken) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/logout',
        data: {'refreshToken': refreshToken},
      );
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  ApiResponse<T> _handleError<T>(DioException e) {
    if (e.response?.data != null && e.response?.data is Map) {
      return ApiResponse.fromJson(e.response!.data, (_) => null as T);
    }
    return ApiResponse(
      success: false,
      message: e.message ?? 'Unknown error occurred',
    );
  }
}
