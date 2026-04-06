class TicketModel {
  final String id;
  final String title;
  final String content;
  final String priority;
  final String category;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TicketModel({
    required this.id,
    required this.title,
    required this.content,
    required this.priority,
    required this.category,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id']?.toString() ?? '',
      title: (json['title']?.toString().isNotEmpty == true) ? json['title'].toString() : (json['subject']?.toString() ?? 'BE KEYS: ${json.keys.join(', ')}'),
      content: (json['content']?.toString().isNotEmpty == true) ? json['content'].toString() : (json['description']?.toString() ?? json['message']?.toString() ?? ''),
      priority: json['priority']?.toString() ?? 'NORMAL',
      category: json['category']?.toString() ?? 'DEFAULT',
      status: json['status']?.toString() ?? 'OPEN',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'].toString()) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'].toString()) : null,
    );
  }
}
