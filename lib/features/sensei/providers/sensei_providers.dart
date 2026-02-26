import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/dio_provider.dart';
import '../../models/sensei_model.dart';
import '../../repositories/sensei_repository.dart';

part 'sensei_providers.g.dart';

@riverpod
SenseiRepository senseiRepository(SenseiRepositoryRef ref) {
  return SenseiRepository(dio: ref.watch(dioProvider));
}

@riverpod
class SenseiChat extends _$SenseiChat {
  @override
  List<ChatMessage> build() {
    return [];
  }

  Future<void> sendMessage(String message) async {
    final history = state.where((m) => !m.isError && !m.isLoading).map((m) {
      return {'role': m.role.name, 'content': m.content};
    }).toList();

    state = [
      ...state,
      ChatMessage(role: ChatMessageRole.user, content: message),
      const ChatMessage(
          role: ChatMessageRole.assistant, content: '', isLoading: true),
    ];

    try {
      final response = await ref
          .read(senseiRepositoryProvider)
          .chat(message: message, history: history);
      state = [
        ...state.sublist(0, state.length - 1), // Remove the loading message
        response,
      ];
    } catch (e) {
      state = [
        ...state.sublist(0, state.length - 1), // Remove the loading message
        ChatMessage(
          role: ChatMessageRole.assistant,
          content: 'Đã có lỗi xảy ra. Vui lòng thử lại. ($e)',
          isError: true,
        ),
      ];
    }
  }
}
