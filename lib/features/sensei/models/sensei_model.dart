import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';

// --- CHATBOT MODELS ---

enum ChatMessageRole { user, assistant }

class ChatMessage {
  final ChatMessageRole role;
  final String content;
  final bool isLoading;
  final bool isError;

  const ChatMessage({
    required this.role,
    required this.content,
    this.isLoading = false,
    this.isError = false,
  });
}

class GrammarCorrection {
    final String originalText;
    final String correctedText;
    final String explanation;

    const GrammarCorrection({
        required this.originalText,
        required this.correctedText,
        required this.explanation,
    });

    factory GrammarCorrection.fromJson(Map<String, dynamic> json) {
        final data = json['data'] ?? json;
        return GrammarCorrection(
            originalText: data['original'],
            correctedText: data['corrected'],
            explanation: data['explanation'],
        );
    }
}

// --- ROLEPLAY MODELS (Merged from Agent) ---

class RoleplayMessage {
  final String id;
  final ChatMessageRole role; 
  final String content;
  final String? romaji;
  final String? english;
  final bool isFeedback;
  final String? audioUrl; // Added to support TTS

  const RoleplayMessage({
    required this.id,
    required this.role,
    required this.content,
    this.romaji,
    this.english,
    this.isFeedback = false,
    this.audioUrl,
  });

  factory RoleplayMessage.fromAssistantResponse(RoleplayResponse response) {
    return RoleplayMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      role: ChatMessageRole.assistant,
      content: response.response,
      romaji: response.romaji,
      english: response.english,
    );
  }

  factory RoleplayMessage.fromFeedback(String feedback) {
    return RoleplayMessage(
      id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
      role: ChatMessageRole.assistant,
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
    final data = json['data'] ?? json;
    return TTSResponse(
      url: data['url'] ?? '',
    );
  }
}

class RoleplayTopic {
  final String id;
  final String title;
  final String description;
  final String level; // N5-N1
  final String scenario; // e.g. 'restaurant', 'shopping'
  final String icon; // Emoji or asset path

  const RoleplayTopic({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.scenario,
    required this.icon,
  });
}

// --- MENU ---

class SenseiMenuItem {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String route;

  const SenseiMenuItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.route,
  });
}

final senseiMenuItems = [
  const SenseiMenuItem(
    title: 'AI Chatbot',
    description: 'Hỏi đáp & giải thích mọi thắc mắc',
    icon: Icons.chat_bubble_outline_rounded,
    color: AppColors.primary,
    route: '/sensei/chat',
  ),
  const SenseiMenuItem(
    title: 'AI Roleplay',
    description: 'Luyện hội thoại theo tình huống',
    icon: Icons.people_alt_outlined,
    color: Colors.orange,
    route: '/sensei/roleplay-topics', // Changed to topics list
  ),
  const SenseiMenuItem(
    title: 'AI Drill',
    description: 'Tạo bài tập ngữ pháp, từ vựng',
    icon: Icons.fitness_center_rounded,
    color: Colors.blue,
    route: '/sensei/drill',
  ),
  const SenseiMenuItem(
    title: 'AI Dịch thuật',
    description: 'Dịch và giải thích ngữ cảnh',
    icon: Icons.translate_rounded,
    color: Colors.green,
    route: '/sensei/translate',
  ),
];
