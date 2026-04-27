import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../meet/providers/session_provider.dart';
import '../models/sensei_model.dart';
import '../repositories/sensei_repository.dart';
import '../../../core/config/app_config.dart';

/// Provider for a Dio instance specifically using the Room Access Token
final senseiMeetDioProvider = Provider<Dio>((ref) {
  final roomToken = ref.watch(sessionProvider.select((s) => s.token));
  final dio = Dio(BaseOptions(
    baseUrl: AppConfig.apiBaseUrl,
    headers: {
      'Authorization': 'Bearer $roomToken',
      'Content-Type': 'application/json',
    },
    connectTimeout: const Duration(seconds: 120),
    receiveTimeout: const Duration(seconds: 120),
  ));
  
  if (kDebugMode) {
    print('senseiMeetDioProvider initialized with 120s timeout');
  }
  
  return dio;
});

final senseiMeetRepositoryProvider = Provider<SenseiRepository>((ref) {
  final dio = ref.watch(senseiMeetDioProvider);
  return SenseiRepository(dio: dio);
});

class SenseiMeetChatNotifier extends StateNotifier<List<ChatMessage>> {
  final SenseiRepository _repository;
  
  SenseiMeetChatNotifier(this._repository) : super([]) {
    // Initial welcome message
    state = [
      const ChatMessage(
        role: ChatMessageRole.assistant,
        content: 'Konnichiwa! Mình là AI Sensei. Mình có thể giúp gì cho bạn trong buổi học này?',
      ),
    ];
  }

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    final history = state
        .where((m) => !m.isError && !m.isLoading)
        .map((m) => {'role': m.role.name, 'content': m.content})
        .toList();

    state = [
      ...state,
      ChatMessage(role: ChatMessageRole.user, content: message),
      const ChatMessage(
        role: ChatMessageRole.assistant,
        content: '',
        isLoading: true,
      ),
    ];

    try {
      final response = await _repository.chat(
        message: message,
        history: history,
      );
      
      state = [
        ...state.sublist(0, state.length - 1), // Remove the loading message
        response,
      ];
    } catch (e, st) {
      if (kDebugMode) {
        print('SenseiMeetChat Error: $e\n$st');
      }
      state = [
        ...state.sublist(0, state.length - 1), // Remove the loading message
        ChatMessage(
          role: ChatMessageRole.assistant,
          content: 'Đã có lỗi xảy ra khi kết nối với AI Sensei. Vui lòng thử lại. (Error: $e)',
          isError: true,
        ),
      ];
    }
  }

  void reset() {
    state = [
      const ChatMessage(
        role: ChatMessageRole.assistant,
        content: 'Konnichiwa! Mình là AI Sensei. Mình có thể giúp gì cho bạn trong buổi học này?',
      ),
    ];
  }
}

final senseiMeetChatProvider =
    StateNotifierProvider<SenseiMeetChatNotifier, List<ChatMessage>>((ref) {
  final repository = ref.watch(senseiMeetRepositoryProvider);
  return SenseiMeetChatNotifier(repository);
});
