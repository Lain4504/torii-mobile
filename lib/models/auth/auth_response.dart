import 'user.dart';

/// Authentication response model
class AuthResponse {
  final User? user;
  final String? accessToken;
  final String? refreshToken;
  final String? sessionId;
  final Map<String, dynamic>? data;

  AuthResponse({
    this.user,
    this.accessToken,
    this.refreshToken,
    this.sessionId,
    this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    // New backend format: { success: true, data: ... }
    User? user;
    String? accessToken;
    String? refreshToken;
    String? sessionId;

    // Handle new backend response format
    if (json['success'] == true && json['data'] != null) {
      final data = json['data'];
      
      // Login response: { success: true, data: "token_string" }
      if (data is String) {
        accessToken = data;
      }
      // Register response: { success: true, data: "user_id_string" }
      // (No token or user in register response)
      else if (data is Map<String, dynamic>) {
        // If data is an object, try to parse as user
        if (data['id'] != null || data['email'] != null) {
          user = User.fromJson(data);
        }
        // Or check for token
        accessToken = data['access_token'] as String? ?? 
                     data['token'] as String?;
        refreshToken = data['refresh_token'] as String?;
        sessionId = data['session_id'] as String?;
      }
    }
    // Legacy format support (for backward compatibility)
    else if (json['data'] != null) {
      final data = json['data'] as Map<String, dynamic>;
      
      if (data['user'] != null) {
        user = User.fromJson(data['user'] as Map<String, dynamic>);
      } else if (data['id'] != null || data['email'] != null) {
        user = User.fromJson(data);
      }
      
      accessToken = data['access_token'] as String? ?? 
                   data['session']?['access_token'] as String?;
      refreshToken = data['refresh_token'] as String? ?? 
                    data['session']?['refresh_token'] as String?;
      sessionId = data['session']?['id'] as String?;
    } else if (json['user'] != null) {
      user = User.fromJson(json['user'] as Map<String, dynamic>);
      accessToken = json['access_token'] as String? ?? 
                   json['session']?['access_token'] as String?;
      refreshToken = json['refresh_token'] as String? ?? 
                    json['session']?['refresh_token'] as String?;
      sessionId = json['session']?['id'] as String?;
    } else if (json['id'] != null || json['email'] != null) {
      user = User.fromJson(json);
      accessToken = json['access_token'] as String?;
      refreshToken = json['refresh_token'] as String?;
    }

    return AuthResponse(
      user: user,
      accessToken: accessToken,
      refreshToken: refreshToken,
      sessionId: sessionId,
      data: json,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (user != null) 'user': user!.toJson(),
      if (accessToken != null) 'access_token': accessToken,
      if (refreshToken != null) 'refresh_token': refreshToken,
      if (sessionId != null) 'session_id': sessionId,
      if (data != null) 'data': data,
    };
  }
}


