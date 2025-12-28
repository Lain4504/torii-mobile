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
    // Handle different response formats from Supabase/backend
    User? user;
    String? accessToken;
    String? refreshToken;
    String? sessionId;

    // Check if response has nested 'data' or 'user' structure
    if (json['data'] != null) {
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

