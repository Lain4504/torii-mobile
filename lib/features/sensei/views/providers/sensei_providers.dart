import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/sensei_model.dart';

// Simple in-memory chat state to keep screen working.

class SenseiChatNotifier extends StateNotifier<List<ChatMessage>> {
  SenseiChatNotifier() : super(const []);

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    final userMsg = ChatMessage(
      role: ChatMessageRole.user,
      content: text,
    );
    final aiMsg = ChatMessage(
      role: ChatMessageRole.assistant,
      content: 'Tính năng Sensei Chat sẽ được kết nối AI sau.',
    );
    state = [...state, userMsg, aiMsg];
  }
}

final senseiChatProvider =
    StateNotifierProvider<SenseiChatNotifier, List<ChatMessage>>(
        (ref) => SenseiChatNotifier());

// Stubs for translate / grammar providers to keep build green.

class TranslatorState {
  final bool isLoading;
  final TranslationResult? translation;

  const TranslatorState({this.isLoading = false, this.translation});

  TranslatorState copyWith({bool? isLoading, TranslationResult? translation}) {
    return TranslatorState(
      isLoading: isLoading ?? this.isLoading,
      translation: translation ?? this.translation,
    );
  }
}

class TranslationResult {
  final String translatedText;

  TranslationResult(this.translatedText);
}

class TranslatorNotifier extends StateNotifier<TranslatorState> {
  TranslatorNotifier() : super(const TranslatorState());

  Future<void> translate({
    required String text,
    required String sourceLang,
    required String targetLang,
  }) async {
    if (text.trim().isEmpty) return;
    state = state.copyWith(isLoading: true);
    state = TranslatorState(
      isLoading: false,
      translation: TranslationResult(text),
    );
  }
}

final translatorProvider =
    StateNotifierProvider<TranslatorNotifier, TranslatorState>(
        (ref) => TranslatorNotifier());

class GrammarState {
  final bool isLoading;
  final dynamic response;

  const GrammarState({this.isLoading = false, this.response});

  GrammarState copyWith({bool? isLoading, dynamic response}) {
    return GrammarState(
      isLoading: isLoading ?? this.isLoading,
      response: response ?? this.response,
    );
  }
}

class GrammarCheckNotifier extends StateNotifier<GrammarState> {
  GrammarCheckNotifier() : super(const GrammarState());

  void clear() => state = const GrammarState();

  Future<void> checkGrammar(String text) async {
    if (text.trim().isEmpty) return;
    state = state.copyWith(isLoading: true);
    state = GrammarState(
      isLoading: false,
      response: GrammarCheckResponse(
        originalText: text,
        correctedText: text,
        isCorrect: true,
        errors: const [],
        suggestions: const [],
      ),
    );
  }
}

final grammarCheckProvider =
    StateNotifierProvider<GrammarCheckNotifier, GrammarState>(
        (ref) => GrammarCheckNotifier());

