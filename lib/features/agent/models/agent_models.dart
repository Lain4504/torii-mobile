class RoleplayMessage {
  final String id;
  final String role; // 'user' or 'assistant'
  final String content;
  final String? romaji;
  final String? english;
  final bool isFeedback;

  RoleplayMessage({
    required this.id,
    required this.role,
    required this.content,
    this.romaji,
    this.english,
    this.isFeedback = false,
  });

  factory RoleplayMessage.fromAssistantResponse(RoleplayResponse response) {
    return RoleplayMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      role: 'assistant',
      content: response.response,
      romaji: response.romaji,
      english: response.english,
    );
  }

  factory RoleplayMessage.fromFeedback(String feedback) {
    return RoleplayMessage(
      id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
      role: 'assistant',
      content: feedback,
      isFeedback: true,
    );
  }
}

class RoleplayResponse {
  final String response;
  final String? romaji;
  final String? english;
  final String? feedback;
  final bool isFinished;

  RoleplayResponse({
    required this.response,
    this.romaji,
    this.english,
    this.feedback,
    required this.isFinished,
  });

  factory RoleplayResponse.fromJson(Map<String, dynamic> json) {
    return RoleplayResponse(
      response: json['response'] ?? '',
      romaji: json['romaji'],
      english: json['english'],
      feedback: json['feedback'],
      isFinished: json['isFinished'] ?? false,
    );
  }
}

class TTSResponse {
  final String url;

  TTSResponse({required this.url});

  factory TTSResponse.fromJson(Map<String, dynamic> json) {
    return TTSResponse(
      url: json['url'] ?? '',
    );
  }
}
