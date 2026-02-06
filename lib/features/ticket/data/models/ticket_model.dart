enum TicketType {
  SUPPORT,
  REFUND,
  ERROR_REPORT;

  static TicketType fromString(String value) {
    return TicketType.values.firstWhere(
      (e) => e.name == value.toUpperCase(),
      orElse: () => TicketType.SUPPORT,
    );
  }

  String toJson() => name;
}

enum TicketStatus {
  PENDING,
  PROCESSING,
  APPROVED,
  REJECTED;

  static TicketStatus fromString(String value) {
    return TicketStatus.values.firstWhere(
      (e) => e.name == value.toUpperCase(),
      orElse: () => TicketStatus.PENDING,
    );
  }

  String toJson() => name;
}

class Ticket {
  final String id;
  final String userId;
  final String? handlerId;
  final TicketType type;
  final TicketStatus status;
  final String subject;
  final String description;
  final Map<String, dynamic>? metadata;
  final String? response;
  final DateTime createdAt;
  final DateTime updatedAt;
  final TicketUser? user;
  final TicketUser? handler;

  Ticket({
    required this.id,
    required this.userId,
    this.handlerId,
    required this.type,
    required this.status,
    required this.subject,
    required this.description,
    this.metadata,
    this.response,
    required this.createdAt,
    required this.updatedAt,
    this.user,
    this.handler,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'] as String,
      userId: json['userId'] as String,
      handlerId: json['handlerId'] as String?,
      type: TicketType.fromString(json['type'] as String),
      status: TicketStatus.fromString(json['status'] as String),
      subject: json['subject'] as String,
      description: json['description'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      response: json['response'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      user: json['user'] != null 
          ? TicketUser.fromJson(json['user'] as Map<String, dynamic>) 
          : null,
      handler: json['handler'] != null 
          ? TicketUser.fromJson(json['handler'] as Map<String, dynamic>) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'handlerId': handlerId,
      'type': type.toJson(),
      'status': status.toJson(),
      'subject': subject,
      'description': description,
      'metadata': metadata,
      'response': response,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'user': user?.toJson(),
      'handler': handler?.toJson(),
    };
  }
}

class TicketUser {
  final String id;
  final String? displayName;
  final String? email;
  final String? avatarUrl;

  TicketUser({
    required this.id,
    this.displayName,
    this.email,
    this.avatarUrl,
  });

  factory TicketUser.fromJson(Map<String, dynamic> json) {
    return TicketUser(
      id: json['id'] as String,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      'email': email,
      'avatarUrl': avatarUrl,
    };
  }
}
