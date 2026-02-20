import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_providers.dart';
import '../models/agent_models.dart';
import '../repositories/agent_repository.dart';

final agentRepositoryProvider = Provider<AgentRepository>((ref) {
  final dio = ref.watch(apiClientProvider);
  return AgentRepository(dio: dio);
});

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

class RoleplayNotifier extends StateNotifier<RoleplayState> {
  final AgentRepository _repository;
  final String topic;

  RoleplayNotifier({
    required AgentRepository repository,
    required this.topic,
  }) : _repository = repository, super(RoleplayState());

  Future<void> start() async {
    if (state.isLoading) return;
    
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _repository.roleplay(
        topic: topic,
        message: "",
        history: [],
      );

      final aiMsg = RoleplayMessage.fromAssistantResponse(response);
      
      state = state.copyWith(
        messages: [aiMsg],
        history: [{'role': 'model', 'content': response.response}], // Backend expect string or object depending on NATS, but typically history is passed as is
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
      role: 'user',
      content: text,
    );

    final updatedMessages = [...state.messages, userMsg];
    final updatedHistory = [...state.history, {'role': 'user', 'content': text}];

    state = state.copyWith(
      messages: updatedMessages,
      history: updatedHistory,
      isLoading: true,
      error: null,
    );

    try {
      final response = await _repository.roleplay(
        topic: topic,
        message: text,
        history: updatedHistory,
      );

      final aiMsg = RoleplayMessage.fromAssistantResponse(response);
      final newHistory = [...updatedHistory, {'role': 'model', 'content': response.response}];

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
      final response = await _repository.roleplay(
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

final roleplayNotifierProvider = StateNotifierProvider.family<RoleplayNotifier, RoleplayState, String>((ref, topic) {
  final repository = ref.watch(agentRepositoryProvider);
  return RoleplayNotifier(repository: repository, topic: topic);
});
