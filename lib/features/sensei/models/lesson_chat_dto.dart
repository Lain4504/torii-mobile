class LessonChatDataDTO {
  final String message; // Nội dung Markdown từ AI
  final List<String> suggestions; // Danh sách câu hỏi gợi ý

  LessonChatDataDTO({required this.message, required this.suggestions});

  factory LessonChatDataDTO.fromJson(Map<String, dynamic> json) {
    return LessonChatDataDTO(
      message: json['message'] ?? '',
      suggestions: List<String>.from(json['suggestions'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'suggestions': suggestions,
    };
  }
}
