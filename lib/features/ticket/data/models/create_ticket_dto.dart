import 'ticket_model.dart';

class CreateTicketDTO {
  final TicketType type;
  final String subject;
  final String description;
  final Map<String, dynamic>? metadata;

  CreateTicketDTO({
    required this.type,
    required this.subject,
    required this.description,
    this.metadata,
  });

  factory CreateTicketDTO.fromJson(Map<String, dynamic> json) {
    return CreateTicketDTO(
      type: TicketType.fromString(json['type'] as String),
      subject: json['subject'] as String,
      description: json['description'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'subject': subject,
      'description': description,
      if (metadata != null) 'metadata': metadata,
    };
  }
}
