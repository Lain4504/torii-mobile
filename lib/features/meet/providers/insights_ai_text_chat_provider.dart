// Insights AI Text Chat Provider - Riverpod State Management
// 1:1 clone of apps/meet/src/store/slices/insightsAiTextChatSlice.ts
//
// Manages:
// - Final and interim AI chat messages
// - Awaiting response state for streaming

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Single message in the AI chat (user or model)
class InsightsAITextChatMessage {
  final String id;
  final String role; // 'user' | 'model'
  final String createdAt;
  final List<String> parts;

  const InsightsAITextChatMessage({
    required this.id,
    required this.role,
    required this.createdAt,
    required this.parts,
  });
}

/// Stream chunk payload from NATS (matches InsightsAITextChatStreamResult)
class InsightsAITextChatStreamResult {
  final String id;
  final String text;
  final bool isLastChunk;
  final String createdAt;

  const InsightsAITextChatStreamResult({
    required this.id,
    required this.text,
    required this.isLastChunk,
    required this.createdAt,
  });
}

/// State for the Insights AI text chat feature
class InsightsAiTextChatState {
  final List<InsightsAITextChatMessage> finalMessages;
  final InsightsAITextChatMessage? interimMessage;
  final bool isAwaitingResponse;

  const InsightsAiTextChatState({
    this.finalMessages = const [],
    this.interimMessage,
    this.isAwaitingResponse = false,
  });

  InsightsAiTextChatState copyWith({
    List<InsightsAITextChatMessage>? finalMessages,
    InsightsAITextChatMessage? interimMessage,
    bool? isAwaitingResponse,
  }) {
    return InsightsAiTextChatState(
      finalMessages: finalMessages ?? this.finalMessages,
      interimMessage: interimMessage ?? this.interimMessage,
      isAwaitingResponse: isAwaitingResponse ?? this.isAwaitingResponse,
    );
  }
}

/// Notifier for Insights AI text chat
/// Matches: insightsAiTextChatSlice reducers
class InsightsAiTextChatNotifier extends StateNotifier<InsightsAiTextChatState> {
  InsightsAiTextChatNotifier() : super(const InsightsAiTextChatState());

  /// User sent a message (matches addAiTextChatUserMessage)
  void addAiTextChatUserMessage(String text) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    state = state.copyWith(
      finalMessages: [
        ...state.finalMessages,
        InsightsAITextChatMessage(
          id: id,
          role: 'user',
          createdAt: id,
          parts: [text],
        ),
      ],
      isAwaitingResponse: true,
    );
  }

  /// Stream chunk from AI (matches updateAiTextChat)
  void updateAiTextChat(InsightsAITextChatStreamResult payload) {
    final id = payload.id;
    final text = payload.text;
    final isLastChunk = payload.isLastChunk;
    final createdAt = payload.createdAt;

    InsightsAITextChatMessage? newInterim = state.interimMessage;
    if (text.isNotEmpty) {
      if (newInterim == null || newInterim.id != id) {
        newInterim = InsightsAITextChatMessage(
          id: id,
          role: 'model',
          createdAt: createdAt,
          parts: [text],
        );
      } else {
        newInterim = InsightsAITextChatMessage(
          id: newInterim.id,
          role: newInterim.role,
          createdAt: newInterim.createdAt,
          parts: [...newInterim.parts, text],
        );
      }
    }

    List<InsightsAITextChatMessage> newFinal = state.finalMessages;
    if (isLastChunk && newInterim != null && newInterim.id == id) {
      newFinal = [...state.finalMessages, newInterim];
      newInterim = null;
    }

    state = state.copyWith(
      finalMessages: newFinal,
      interimMessage: newInterim,
      isAwaitingResponse: isLastChunk ? false : state.isAwaitingResponse,
    );
  }

  void clearIsAwaitingResponse() {
    state = state.copyWith(isAwaitingResponse: false);
  }

  void clearMessages() {
    state = const InsightsAiTextChatState();
  }
}

/// Provider for Insights AI text chat state
final insightsAiTextChatProvider =
    StateNotifierProvider<InsightsAiTextChatNotifier, InsightsAiTextChatState>(
        (ref) => InsightsAiTextChatNotifier());
