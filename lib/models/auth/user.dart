/// User model
class User {
  final String id;
  final String email;
  final String fullName;
  final String? role;
  final String? status;
  final String? phone;
  final String? avatarUrl;
  final String? bio;
  final String? dateOfBirth;
  final String? gender;
  final String? jlptLevel;
  final Map<String, dynamic>? metadata;

  User({
    required this.id,
    required this.email,
    required this.fullName,
    this.role,
    this.status,
    this.phone,
    this.avatarUrl,
    this.bio,
    this.dateOfBirth,
    this.gender,
    this.jlptLevel,
    this.metadata,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      fullName: json['fullName'] as String? ?? json['full_name'] as String? ?? '',
      role: json['role'] as String?,
      status: json['status'] as String?,
      phone: json['phone'] as String?,
      avatarUrl: json['avatarUrl'] as String? ?? json['avatar_url'] as String?,
      bio: json['bio'] as String?,
      dateOfBirth: json['dateOfBirth'] as String? ?? json['date_of_birth'] as String?,
      gender: json['gender'] as String?,
      jlptLevel: json['jlptLevel'] as String? ?? json['jlpt_level'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      if (role != null) 'role': role,
      if (status != null) 'status': status,
      if (phone != null) 'phone': phone,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      if (bio != null) 'bio': bio,
      if (dateOfBirth != null) 'dateOfBirth': dateOfBirth,
      if (gender != null) 'gender': gender,
      if (jlptLevel != null) 'jlptLevel': jlptLevel,
      if (metadata != null) 'metadata': metadata,
    };
  }

  User copyWith({
    String? id,
    String? email,
    String? fullName,
    String? role,
    String? status,
    String? phone,
    String? avatarUrl,
    String? bio,
    String? dateOfBirth,
    String? gender,
    String? jlptLevel,
    Map<String, dynamic>? metadata,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      role: role ?? this.role,
      status: status ?? this.status,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      bio: bio ?? this.bio,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      jlptLevel: jlptLevel ?? this.jlptLevel,
      metadata: metadata ?? this.metadata,
    );
  }
}


