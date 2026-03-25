import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_providers.dart';
import '../models/sensei_model.dart';
import '../repositories/sensei_repository.dart';
import 'sensei_subscription_providers.dart';

final senseiRepositoryProvider = Provider<SenseiRepository>((ref) {
  final dio = ref.watch(apiClientProvider).client;
  return SenseiRepository(dio: dio);
});

class SenseiChatNotifier extends StateNotifier<List<ChatMessage>> {
  final SenseiRepository _repository;
  final Ref _ref;

  SenseiChatNotifier(this._repository, this._ref) : super([]);

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
      _ref.invalidate(senseiQuotaStatusProvider);
    } catch (e) {
      final isQuota = e is SenseiQuotaExceededException;
      state = [
        ...state.sublist(0, state.length - 1), // Remove the loading message
        ChatMessage(
          role: ChatMessageRole.assistant,
          content: isQuota
              ? (e as SenseiQuotaExceededException).message
              : 'Đã có lỗi xảy ra. Vui lòng thử lại. ($e)',
          isError: true,
          errorCode: isQuota ? 'quota_exceeded' : null,
        ),
      ];
    }
  }
}

final senseiChatProvider =
    StateNotifierProvider<SenseiChatNotifier, List<ChatMessage>>((ref) {
      final repository = ref.watch(senseiRepositoryProvider);
      return SenseiChatNotifier(repository, ref);
    });

// --- ROLEPLAY STATE ---

class RoleplayState {
  final List<RoleplayMessage> messages;
  final List<Map<String, dynamic>> history;
  final bool isLoading;
  final bool isFinished;
  final String? error;
  final String? errorCode;

  RoleplayState({
    this.messages = const [],
    this.history = const [],
    this.isLoading = false,
    this.isFinished = false,
    this.error,
    this.errorCode,
  });

  RoleplayState copyWith({
    List<RoleplayMessage>? messages,
    List<Map<String, dynamic>>? history,
    bool? isLoading,
    bool? isFinished,
    String? error,
    String? errorCode,
  }) {
    return RoleplayState(
      messages: messages ?? this.messages,
      history: history ?? this.history,
      isLoading: isLoading ?? this.isLoading,
      isFinished: isFinished ?? this.isFinished,
      error: error,
      errorCode: errorCode,
    );
  }
}

class SenseiRoleplayNotifier extends StateNotifier<RoleplayState> {
  final SenseiRepository _repository;
  final Ref _ref;
  final String topic;

  SenseiRoleplayNotifier(this._repository, this._ref, this.topic) : super(RoleplayState());

  Future<void> start() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, error: null, errorCode: null);
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
      _ref.invalidate(senseiQuotaStatusProvider);
    } catch (e) {
      final isQuota = e is SenseiQuotaExceededException;
      state = state.copyWith(
        isLoading: false,
        error: isQuota ? (e as SenseiQuotaExceededException).message : e.toString(),
        errorCode: isQuota ? 'quota_exceeded' : null,
      );
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
      errorCode: null,
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
      _ref.invalidate(senseiQuotaStatusProvider);
    } catch (e) {
      final isQuota = e is SenseiQuotaExceededException;
      state = state.copyWith(
        isLoading: false,
        error: isQuota ? (e as SenseiQuotaExceededException).message : e.toString(),
        errorCode: isQuota ? 'quota_exceeded' : null,
      );
    }
  }

  Future<void> finish() async {
    if (state.isLoading || state.isFinished) return;

    state = state.copyWith(isLoading: true, error: null, errorCode: null);
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
      _ref.invalidate(senseiQuotaStatusProvider);
    } catch (e) {
      final isQuota = e is SenseiQuotaExceededException;
      state = state.copyWith(
        isLoading: false,
        error: isQuota ? (e as SenseiQuotaExceededException).message : e.toString(),
        errorCode: isQuota ? 'quota_exceeded' : null,
      );
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
        return SenseiRoleplayNotifier(repository, ref, topic);
      },
    );

// --- TRANSLATOR STATE ---

class TranslatorState {
  final TranslateResponse? translation;
  final bool isLoading;
  final String? error;
  final String? errorCode;

  TranslatorState({
    this.translation,
    this.isLoading = false,
    this.error,
    this.errorCode,
  });

  TranslatorState copyWith({
    TranslateResponse? translation,
    bool? isLoading,
    String? error,
    String? errorCode,
  }) {
    return TranslatorState(
      translation: translation ?? this.translation,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      errorCode: errorCode,
    );
  }
}

class TranslatorNotifier extends StateNotifier<TranslatorState> {
  final SenseiRepository _repository;
  final Ref _ref;

  TranslatorNotifier(this._repository, this._ref) : super(TranslatorState());

  Future<void> translate({
    required String text,
    required String sourceLang,
    required String targetLang,
  }) async {
    state = state.copyWith(isLoading: true, error: null, errorCode: null);
    try {
      final res = await _repository.translate(
        text: text,
        sourceLanguage: sourceLang,
        targetLanguage: targetLang,
      );
      state = state.copyWith(translation: res, isLoading: false);
      _ref.invalidate(senseiQuotaStatusProvider);
    } catch (e) {
      final isQuota = e is SenseiQuotaExceededException;
      state = state.copyWith(
        isLoading: false,
        error: isQuota ? (e as SenseiQuotaExceededException).message : e.toString(),
        errorCode: isQuota ? 'quota_exceeded' : null,
      );
    }
  }

  void clear() {
    state = TranslatorState();
  }
}

final translatorProvider = StateNotifierProvider<TranslatorNotifier, TranslatorState>((ref) {
  final repository = ref.watch(senseiRepositoryProvider);
  return TranslatorNotifier(repository, ref);
});

// --- GRAMMAR CHECK STATE ---

class GrammarCheckState {
  final GrammarCheckResponse? response;
  final bool isLoading;
  final String? error;
  final String? errorCode;

  GrammarCheckState({
    this.response,
    this.isLoading = false,
    this.error,
    this.errorCode,
  });

  GrammarCheckState copyWith({
    GrammarCheckResponse? response,
    bool? isLoading,
    String? error,
    String? errorCode,
  }) {
    return GrammarCheckState(
      response: response ?? this.response,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      errorCode: errorCode,
    );
  }
}

class GrammarCheckNotifier extends StateNotifier<GrammarCheckState> {
  final SenseiRepository _repository;
  final Ref _ref;

  GrammarCheckNotifier(this._repository, this._ref) : super(GrammarCheckState());

  Future<void> checkGrammar(String text) async {
    state = state.copyWith(isLoading: true, error: null, errorCode: null);
    try {
      final res = await _repository.checkGrammar(text: text);
      state = state.copyWith(response: res, isLoading: false);
      _ref.invalidate(senseiQuotaStatusProvider);
    } catch (e) {
      final isQuota = e is SenseiQuotaExceededException;
      state = state.copyWith(
        isLoading: false,
        error: isQuota ? (e as SenseiQuotaExceededException).message : e.toString(),
        errorCode: isQuota ? 'quota_exceeded' : null,
      );
    }
  }

  void clear() {
    state = GrammarCheckState();
  }
}

final grammarCheckProvider = StateNotifierProvider<GrammarCheckNotifier, GrammarCheckState>((ref) {
  final repository = ref.watch(senseiRepositoryProvider);
  return GrammarCheckNotifier(repository, ref);
});


