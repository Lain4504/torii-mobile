/// Model cho User
class User {
  final String id;
  final String email;
  final String displayName;
  final String? avatar;
  final String role;

  User({
    required this.id,
    required this.email,
    required this.displayName,
    this.avatar,
    this.role = 'learner',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      displayName: json['displayName'] ?? json['display_name'] ?? '',
      avatar: json['avatar'],
      role: json['role'] ?? 'learner',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'avatar': avatar,
      'role': role,
    };
  }
}

/// Model cho Login Request
class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

/// Model cho Register Request
class RegisterRequest {
  final String email;
  final String displayName;
  final String password;

  RegisterRequest({
    required this.email,
    required this.displayName,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'displayName': displayName,
      'password': password,
    };
  }
}

/// Model cho Refresh Token Request
class RefreshTokenRequest {
  final String refreshToken;

  RefreshTokenRequest({required this.refreshToken});

  Map<String, dynamic> toJson() {
    return {
      'refreshToken': refreshToken,
    };
  }
}

/// Model cho Auth Response từ API
class AuthResponse {
  final bool success;
  final dynamic data;
  final String? message;

  AuthResponse({
    required this.success,
    this.data,
    this.message,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      success: json['success'] ?? false,
      data: json['data'],
      message: json['message'],
    );
  }
}

/// Model cho Token Response (Login/Refresh response data)
class TokenResponse {
  final String accessToken;
  final String refreshToken;
  final User? user; // User data (chỉ có trong login response)

  TokenResponse({
    required this.accessToken,
    required this.refreshToken,
    this.user,
  });

  factory TokenResponse.fromJson(dynamic data) {
    if (data is Map<String, dynamic>) {
      return TokenResponse(
        accessToken: data['accessToken'] ?? data['access_token'] ?? '',
        refreshToken: data['refreshToken'] ?? data['refresh_token'] ?? '',
        user: data['user'] != null ? User.fromJson(data['user']) : null,
      );
    }
    // Fallback cho format cũ (chỉ có token string)
    return TokenResponse(
      accessToken: data.toString(),
      refreshToken: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      if (user != null) 'user': user!.toJson(),
    };
  }
}


