class TicketModel {
  final String id;
  final String title;
  final String content;
  final String type;
  final String priority;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TicketModel({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.priority,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    final parsedTitle = (json['subject']?.toString().trim().isNotEmpty == true)
        ? json['subject'].toString().trim()
        : (json['title']?.toString().trim() ?? 'Không có tiêu đề');
        
    final parsedContent = (json['description']?.toString().trim().isNotEmpty == true)
        ? json['description'].toString().trim()
        : (json['content']?.toString().trim().isNotEmpty == true)
            ? json['content'].toString().trim()
            : (json['message']?.toString().trim() ?? '');

    return TicketModel(
      id: json['id']?.toString() ?? '',
      title: parsedTitle,
      content: parsedContent,
      type: json['type']?.toString() ?? json['category']?.toString() ?? 'SUPPORT',
      priority: json['priority']?.toString() ?? 'NORMAL',
      status: json['status']?.toString() ?? 'PENDING',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'].toString()) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'].toString()) : null,
    );
  }
}
