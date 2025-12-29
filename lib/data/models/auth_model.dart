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
  final String fullName;
  final String password;

  RegisterRequest({
    required this.email,
    required this.fullName,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullName': fullName,
      'password': password,
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

/// Model cho Token Response
class TokenResponse {
  final String token;

  TokenResponse({required this.token});

  factory TokenResponse.fromJson(dynamic data) {
    if (data is String) {
      return TokenResponse(token: data);
    } else if (data is Map<String, dynamic>) {
      return TokenResponse(token: data['token'] ?? '');
    }
    return TokenResponse(token: '');
  }
}

