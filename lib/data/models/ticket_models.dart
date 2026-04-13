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
    final parsedTitle = (json['title']?.toString().trim().isNotEmpty == true)
        ? json['title'].toString().trim()
        : (json['subject']?.toString().trim() ?? 'Không có tiêu đề');
    final parsedContent =
        (json['content']?.toString().trim().isNotEmpty == true)
            ? json['content'].toString().trim()
            : (json['description']?.toString().trim().isNotEmpty == true)
                ? json['description'].toString().trim()
                : (json['message']?.toString().trim() ?? '');

    return TicketModel(
      id: json['id']?.toString() ?? '',
      title: parsedTitle,
      content: parsedContent,
      priority: json['priority']?.toString() ?? 'NORMAL',
      category: (json['category']?.toString().isNotEmpty == true)
          ? json['category'].toString()
          : (json['type']?.toString() ?? 'DEFAULT'),
      status: json['status']?.toString() ?? 'OPEN',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'].toString()) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'].toString()) : null,
    );
  }
}
