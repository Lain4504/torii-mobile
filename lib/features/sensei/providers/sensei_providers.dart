import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_providers.dart';
import '../models/sensei_model.dart';
import '../repositories/sensei_repository.dart';

final senseiRepositoryProvider = Provider<SenseiRepository>((ref) {
  final dio = ref.watch(apiClientProvider).client;
  return SenseiRepository(dio: dio);
});

class SenseiChatNotifier extends StateNotifier<List<ChatMessage>> {
  final SenseiRepository _repository;

  SenseiChatNotifier(this._repository) : super([]);

  Future<void> sendMessage(String message) async {
    final history = state.where((m) => !m.isError && !m.isLoading).map((m) {
      return {'role': m.role.name, 'content': m.content};
    }).toList();

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

final senseiChatProvider =
    StateNotifierProvider<SenseiChatNotifier, List<ChatMessage>>((ref) {
      final repository = ref.watch(senseiRepositoryProvider);
      return SenseiChatNotifier(repository);
    });

// --- ROLEPLAY STATE ---

class RoleplayState {
  final List<RoleplayMessage> messages;
  final List<Map<String, dynamic>> history;
  final bool isLoading;
  final bool isFinished;
  final String? error;

  RoleplayState({
    this.messages = const [],
    this.history = const [],
    this.isLoading = false,
    this.isFinished = false,
    this.error,
  });

  RoleplayState copyWith({
    List<RoleplayMessage>? messages,
    List<Map<String, dynamic>>? history,
    bool? isLoading,
    bool? isFinished,
    String? error,
  }) {
    return RoleplayState(
      messages: messages ?? this.messages,
      history: history ?? this.history,
      isLoading: isLoading ?? this.isLoading,
      isFinished: isFinished ?? this.isFinished,
      error: error,
    );
  }
}

class SenseiRoleplayNotifier extends StateNotifier<RoleplayState> {
  final SenseiRepository _repository;
  final String topic;

  SenseiRoleplayNotifier(this._repository, this.topic) : super(RoleplayState());

  Future<void> start() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _repository.sendRoleplayMessage(
        topic: topic,
        message: "",
        history: [],
      );

      final aiMsg = RoleplayMessage.fromAssistantResponse(response);

      state = state.copyWith(
        messages: [aiMsg],
        history: [
          {'role': 'model', 'content': response.response},
        ],
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty || state.isLoading || state.isFinished) return;

    final userMsg = RoleplayMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      role: ChatMessageRole.user,
      content: text,
    );

    final updatedMessages = [...state.messages, userMsg];
    final updatedHistory = [
      ...state.history,
      {'role': 'user', 'content': text},
    ];

    state = state.copyWith(
      messages: updatedMessages,
      history: updatedHistory,
      isLoading: true,
      error: null,
    );

    try {
      final response = await _repository.sendRoleplayMessage(
        topic: topic,
        message: text,
        history: updatedHistory,
      );

      final aiMsg = RoleplayMessage.fromAssistantResponse(response);
      final newHistory = [
        ...updatedHistory,
        {'role': 'model', 'content': response.response},
      ];

      final nextMessages = [...updatedMessages, aiMsg];

      if (response.isFinished && response.feedback != null) {
        nextMessages.add(RoleplayMessage.fromFeedback(response.feedback!));
      }

      state = state.copyWith(
        messages: nextMessages,
        history: newHistory,
        isLoading: false,
        isFinished: response.isFinished,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> finish() async {
    if (state.isLoading || state.isFinished) return;

    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _repository.sendRoleplayMessage(
        topic: topic,
        message: "",
        history: state.history,
        isFinal: true,
      );

      final nextMessages = [...state.messages];

      if (response.response.isNotEmpty) {
        nextMessages.add(RoleplayMessage.fromAssistantResponse(response));
      }

      if (response.feedback != null) {
        nextMessages.add(RoleplayMessage.fromFeedback(response.feedback!));
      }

      state = state.copyWith(
        messages: nextMessages,
        isLoading: false,
        isFinished: true,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void reset() {
    state = RoleplayState();
  }
}

final senseiRoleplayProvider =
    StateNotifierProvider.family<SenseiRoleplayNotifier, RoleplayState, String>(
      (ref, topic) {
        final repository = ref.watch(senseiRepositoryProvider);
        return SenseiRoleplayNotifier(repository, topic);
      },
    );
