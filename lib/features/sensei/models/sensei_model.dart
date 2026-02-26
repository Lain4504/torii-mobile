import 'package:flutter/material.dart';
import '../../../../core/constants/app_design_system.dart';

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

class RoleplayMessage {
  final ChatMessageRole role;
  final String content;
  final String? audioUrl; // For TTS

  const RoleplayMessage({
    required this.role,
    required this.content,
    this.audioUrl,
  });
}

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
    route: '/sensei/roleplay',
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
