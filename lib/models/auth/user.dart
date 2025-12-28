/// User model
class User {
  final String id;
  final String email;
  final String? role;
  final String? status;
  final Map<String, dynamic>? metadata;

  User({
    required this.id,
    required this.email,
    this.role,
    this.status,
    this.metadata,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String? ?? json['user']?['id'] as String? ?? '',
      email: json['email'] as String? ?? json['user']?['email'] as String? ?? '',
      role: json['role'] as String?,
      status: json['status'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? json['user_metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      if (role != null) 'role': role,
      if (status != null) 'status': status,
      if (metadata != null) 'metadata': metadata,
    };
  }

  User copyWith({
    String? id,
    String? email,
    String? role,
    String? status,
    Map<String, dynamic>? metadata,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      role: role ?? this.role,
      status: status ?? this.status,
      metadata: metadata ?? this.metadata,
    );
  }
}

