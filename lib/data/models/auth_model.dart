/// Model cho User matching Backend Entity
class User {
  final String id;
  final String email;
  final String displayName;
  final String role;
  final DateTime? verifiedAt;
  final String? avatarUrl;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Map<String, dynamic>? appMetadata;
  final Map<String, dynamic>? userMetadata;
  final DateTime? bannedUntil;
  final DateTime? lastSignInAt;
  final DateTime? deletedAt;
  final bool isOnboarded;
  final int? walletBalance;
  final String? jlptTarget;
  final String? currentLevel;

  User({
    required this.id,
    required this.email,
    required this.displayName,
    this.role = 'LEARNER',
    this.verifiedAt,
    this.avatarUrl,
    this.status = 'active',
    this.createdAt,
    this.updatedAt,
    this.appMetadata,
    this.userMetadata,
    this.bannedUntil,
    this.lastSignInAt,
    this.deletedAt,
    this.isOnboarded = false,
    this.walletBalance,
    this.jlptTarget,
    this.currentLevel,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      displayName: json['displayName'] ?? '',
      role: json['role'] ?? 'LEARNER',
      avatarUrl: json['avatarUrl'],
      verifiedAt: json['verifiedAt'] != null ? DateTime.parse(json['verifiedAt'] as String) : null,
      status: json['status'] ?? 'active',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
      appMetadata: json['appMetadata'] != null ? Map<String, dynamic>.from(json['appMetadata']) : null,
      userMetadata: json['userMetadata'] != null ? Map<String, dynamic>.from(json['userMetadata']) : null,
      bannedUntil: json['bannedUntil'] != null ? DateTime.parse(json['bannedUntil'] as String) : null,
      lastSignInAt: json['lastSignInAt'] != null ? DateTime.parse(json['lastSignInAt'] as String) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt'] as String) : null,
      isOnboarded: json['isOnboarded'] ?? json['is_onboarded'] ?? false,
      walletBalance: (json['walletBalance'] as num?)?.toInt(),
      jlptTarget: json['jlptTarget'],
      currentLevel: json['currentLevel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'role': role,
      'avatarUrl': avatarUrl,
      'verifiedAt': verifiedAt?.toIso8601String(),
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'appMetadata': appMetadata,
      'userMetadata': userMetadata,
      'bannedUntil': bannedUntil?.toIso8601String(),
      'lastSignInAt': lastSignInAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'isOnboarded': isOnboarded,
      'walletBalance': walletBalance,
      'jlptTarget': jlptTarget,
      'currentLevel': currentLevel,
    };
  }
}

/// Model cho Login/2FA Success Data
class AuthData {
  final String? accessToken;
  final String? refreshToken;
  final User user;
  final bool requiresTwoFactor;
  final String? twoFactorMethod;
  final String? tempToken;

  AuthData({
    this.accessToken,
    this.refreshToken,
    required this.user,
    this.requiresTwoFactor = false,
    this.twoFactorMethod,
    this.tempToken,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      accessToken: json['accessToken'] ?? json['access_token'],
      refreshToken: json['refreshToken'] ?? json['refresh_token'],
      user: User.fromJson(json['user'] ?? {}),
      requiresTwoFactor: json['requiresTwoFactor'] ?? false,
      twoFactorMethod: json['twoFactorMethod'],
      tempToken: json['tempToken'],
    );
  }
}
