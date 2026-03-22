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
    required String fullName,
  }) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/register',
        data: {
          'email': email,
          'password': password,
          'fullName': fullName,
          'platform': 'mobile',
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
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        return ApiResponse<AuthData>(
          success: false,
          message: 'Phản hồi máy chủ không hợp lệ (${response.statusCode})',
        );
      }
      return ApiResponse.fromJson(raw, (json) => AuthData.fromJson(json));
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      return ApiResponse<AuthData>(
        success: false,
        message: e.toString(),
      );
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

  /// 1.2.2 Facebook Login
  Future<ApiResponse<AuthData>> facebookLogin(String accessToken) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/facebook',
        data: {'accessToken': accessToken},
        options: Options(headers: {'x-platform': 'mobile'}),
      );
      return ApiResponse.fromJson(
          response.data, (json) => AuthData.fromJson(json));
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

  Future<ApiResponse<Map<String, dynamic>>> verifyOTP(
    String email,
    String code, {
    required String type,
  }) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/verify-otp',
        data: {
          'email': email,
          'otp': code,
          'type': type,
        },
      );
      return ApiResponse.fromJson(response.data, (json) => json as Map<String, dynamic>);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse<void>> resendOTP(
    String email, {
    required String type,
  }) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/resend-otp',
        data: {
          'email': email,
          'type': type,
        },
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
        data: {'refresh_token': refreshToken},
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

  Future<ApiResponse<void>> disableTOTP(String code) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/2fa/totp/disable',
        data: {'code': code},
      );
      return ApiResponse.fromJson(response.data, (_) {});
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
  /// [authorizationBearer] — dùng token vừa nhận sau login để tránh race Keychain trên iOS
  /// (interceptor đọc [TokenService] có thể chưa kịp sync).
  Future<ApiResponse<User>> getMe({String? authorizationBearer}) async {
    try {
      final response = await _apiClient.client.get(
        '/api/auth/me',
        options: Options(
          headers: <String, dynamic>{
            'x-platform': 'mobile',
            if (authorizationBearer != null)
              'Authorization': 'Bearer $authorizationBearer',
          },
        ),
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        return ApiResponse<User>(
          success: false,
          message: 'Phản hồi /me không hợp lệ (${response.statusCode})',
        );
      }
      return ApiResponse.fromJson(
        raw,
        (json) {
          final u = json['user'];
          if (u is! Map<String, dynamic>) {
            throw FormatException('Missing user in /me response');
          }
          return User.fromJson(u);
        },
      );
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      return ApiResponse<User>(
        success: false,
        message: e.toString(),
      );
    }
  }

  Future<ApiResponse<User>> updateProfile({
    String? displayName,
    Map<String, dynamic>? userMetadata,
  }) async {
    try {
      final response = await _apiClient.client.patch(
        '/api/auth/me',
        data: {
          if (displayName != null) 'displayName': displayName,
          if (userMetadata != null) 'userMetadata': userMetadata,
        },
      );
      return ApiResponse.fromJson(response.data, (json) => User.fromJson(json['user']));
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// 4. Linked providers
  Future<ApiResponse<List<String>>> getLinkedProviders() async {
    try {
      final response = await _apiClient.client.get('/api/auth/linked-providers');
      return ApiResponse.fromJson(
        response.data,
        (json) {
          // Backend shape (gateway):
          // { data: { providers: { providers: string[], hasPassword: boolean } } }
          // Older/other possible shape:
          // { data: { providers: string[] } }
          final raw = (json is Map) ? json['providers'] : null;
          if (raw is List) return List<String>.from(raw);
          if (raw is Map) {
            final inner = raw['providers'];
            if (inner is List) return List<String>.from(inner);
          }
          return <String>[];
        },
      );
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse<void>> linkGoogle(String idToken) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/link/google',
        data: {'idToken': idToken},
      );
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse<void>> unlinkProvider(String provider) async {
    try {
      final response = await _apiClient.client.delete('/api/auth/link/$provider');
      return ApiResponse.fromJson(response.data, (_) {});
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse<void>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final response = await _apiClient.client.post(
        '/api/auth/change-password',
        data: {
          'oldPassword': oldPassword,
          'newPassword': newPassword,
        },
      );
      return ApiResponse.fromJson(response.data, (_) {});
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
    final code = e.response?.statusCode;
    if (code == 502 || code == 503 || code == 504) {
      return ApiResponse<T>(
        success: false,
        message:
            'Cổng API tạm thời lỗi (HTTP $code). Đăng nhập có thể đã thành công phía server — thử lại sau vài giây.',
      );
    }
    if (e.response?.data != null && e.response?.data is Map) {
      return ApiResponse.fromJson(e.response!.data as Map<String, dynamic>, (_) => null as T);
    }
    return ApiResponse(
      success: false,
      message: e.message ?? 'Unknown error occurred',
    );
  }
}
