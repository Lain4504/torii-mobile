import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/config/app_config.dart';
import '../core/network/api_client.dart';
import '../core/network/api_exception.dart';
import '../models/auth/auth_response.dart';
import '../models/auth/user.dart';

/// Authentication service for API calls and token management
class AuthService {
  final ApiClient _apiClient;
  final FlutterSecureStorage _secureStorage;
  SharedPreferences? _prefs;

  AuthService({
    ApiClient? apiClient,
    FlutterSecureStorage? secureStorage,
  })  : _apiClient = apiClient ?? ApiClient(),
        _secureStorage = secureStorage ?? const FlutterSecureStorage() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Register new user
  Future<AuthResponse> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final response = await _apiClient.post(
        AppConfig.authRegisterEndpoint,
        body: {
          'email': email,
          'password': password,
          'fullName': fullName,
        },
      );

      final authResponse = AuthResponse.fromJson(response);
      
      // Register response: { success: true, data: userId }
      // No token or user in register response, user needs to login after registration

      return authResponse;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
        message: 'Registration failed: ${e.toString()}',
        originalError: e,
      );
    }
  }

  /// Login user
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        AppConfig.authLoginEndpoint,
        body: {
          'email': email,
          'password': password,
        },
      );

      // Login response: { success: true, data: "token_string" }
      final authResponse = AuthResponse.fromJson(response);
      
      // Save token if available
      if (authResponse.accessToken != null) {
        await saveToken(authResponse.accessToken!);
        _apiClient.setToken(authResponse.accessToken);
        
        // Fetch user profile after login
        try {
          final profileResponse = await _apiClient.get(AppConfig.authProfileEndpoint);
          if (profileResponse['success'] == true && profileResponse['data'] != null) {
            final user = User.fromJson(profileResponse['data'] as Map<String, dynamic>);
            await saveUser(user);
            // Update authResponse with user
            return AuthResponse(
              user: user,
              accessToken: authResponse.accessToken,
              refreshToken: authResponse.refreshToken,
              sessionId: authResponse.sessionId,
              data: authResponse.data,
            );
          }
        } catch (e) {
          // If profile fetch fails, still return authResponse with token
          debugPrint('Failed to fetch user profile: $e');
        }
      }

      return authResponse;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
        message: 'Login failed: ${e.toString()}',
        originalError: e,
      );
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      // Call logout endpoint
      await _apiClient.post(AppConfig.authLogoutEndpoint);
    } catch (e) {
      // Continue with local cleanup even if API call fails
      debugPrint('Logout API call failed: $e');
    } finally {
      // Clear local storage
      await clearToken();
      await clearUser();
      _apiClient.clearToken();
    }
  }

  /// Save authentication token to secure storage
  Future<void> saveToken(String token) async {
    try {
      await _secureStorage.write(
        key: AppConfig.tokenKey,
        value: token,
      );
      _apiClient.setToken(token);
    } catch (e) {
      throw ApiException(
        message: 'Failed to save token: ${e.toString()}',
        originalError: e,
      );
    }
  }

  /// Get authentication token from secure storage
  Future<String?> getToken() async {
    try {
      final token = await _secureStorage.read(key: AppConfig.tokenKey);
      if (token != null) {
        _apiClient.setToken(token);
      }
      return token;
    } catch (e) {
      return null;
    }
  }

  /// Clear authentication token
  Future<void> clearToken() async {
    try {
      await _secureStorage.delete(key: AppConfig.tokenKey);
      _apiClient.clearToken();
    } catch (e) {
      // Ignore errors during cleanup
      debugPrint('Error clearing token: $e');
    }
  }

  /// Save user data to local storage
  Future<void> saveUser(User user) async {
    try {
      await _initPrefs();
      if (_prefs != null) {
        await _prefs!.setString(
          AppConfig.userKey,
          jsonEncode(user.toJson()),
        );
      }
    } catch (e) {
      throw ApiException(
        message: 'Failed to save user: ${e.toString()}',
        originalError: e,
      );
    }
  }

  /// Get user data from local storage
  Future<User?> getUser() async {
    try {
      await _initPrefs();
      if (_prefs != null) {
        final userJson = _prefs!.getString(AppConfig.userKey);
        if (userJson != null) {
          final userMap = jsonDecode(userJson) as Map<String, dynamic>;
          return User.fromJson(userMap);
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Clear user data
  Future<void> clearUser() async {
    try {
      await _initPrefs();
      if (_prefs != null) {
        await _prefs!.remove(AppConfig.userKey);
      }
    } catch (e) {
      // Ignore errors during cleanup
      debugPrint('Error clearing user: $e');
    }
  }

  /// Check if user is authenticated
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}

