// Chat Messages Provider - Riverpod State Management
// 1:1 clone of apps/meet/src/store/slices/chatMessagesSlice.ts
//
// Manages:
// - Chat messages (public and private)
// - Message grouping by key (public or userId)
// - Message deduplication
// - Chronological sorting

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:torii_app/features/meet/data/models/chat_message.dart';

// ============================================================================
// STATE CLASSES
// ============================================================================

/// Main chat messages state
class ChatMessagesState {
  final Map<String, List<ChatMessage>> messages; // key: 'public' or userId
  final Map<String, String> messageIds; // messageId: key
  
  const ChatMessagesState({
    this.messages = const {'public': []},
    this.messageIds = const {},
  });
  
  ChatMessagesState copyWith({
    Map<String, List<ChatMessage>>? messages,
    Map<String, String>? messageIds,
  }) {
    return ChatMessagesState(
      messages: messages ?? this.messages,
      messageIds: messageIds ?? this.messageIds,
    );
  }
  
  /// Get chat keys (for tabs)
  List<String> get chatKeys => messages.keys.toList();
  
  /// Get public messages
  List<ChatMessage> get publicMessages => messages['public'] ?? [];
  
  /// Get messages by key
  List<ChatMessage> messagesByKey(String key) => messages[key] ?? [];
}

// ============================================================================
// HELPER FUNCTIONS
// ============================================================================

/// Get chat key for a message
/// Matches: getChatKey() in chatMessagesSlice.ts
String _getChatKey(ChatMessage message, String currentUserId) {
  if (!message.isPrivate) {
    return 'public';
  }
  
    if (message.fromUserId == currentUserId) {
    return message.toUserId ?? 'unknown';
  } else {
    return message.fromUserId ?? 'unknown';
  }
}

/// Sort messages chronologically
/// Matches: sortMessages() in chatMessagesSlice.ts
int _sortMessages(ChatMessage a, ChatMessage b) {
  return a.createdAt.compareTo(b.createdAt);
}

// ============================================================================
// NOTIFIER
// ============================================================================

/// Chat messages state notifier
/// Matches: chatMessagesSlice reducers in chatMessagesSlice.ts
class ChatMessagesNotifier extends StateNotifier<ChatMessagesState> {
  ChatMessagesNotifier() : super(const ChatMessagesState());
  
  /// Add single chat message
  /// Matches: addChatMessage
  void addChatMessage({
    required ChatMessage message,
    required String currentUserId,
  }) {
    // Skip if message already exists
    if (state.messageIds.containsKey(message.messageId)) {
      return;
    }
    
    final key = _getChatKey(message, currentUserId);
    
    // Copy state
    final newMessages = Map<String, List<ChatMessage>>.from(state.messages);
    final newMessageIds = Map<String, String>.from(state.messageIds);
    
    // Initialize key if needed
    if (!newMessages.containsKey(key)) {
      newMessages[key] = [];
    }
    
    // Add message
    newMessages[key] = List<ChatMessage>.from(newMessages[key]!)..add(message);
    newMessageIds[message.messageId] = key;
    
    // Sort messages
    newMessages[key]!.sort(_sortMessages);
    
    state = state.copyWith(
      messages: newMessages,
      messageIds: newMessageIds,
    );
  }
  
  /// Add multiple chat messages (bulk)
  /// Matches: addAllChatMessages
  void addAllChatMessages({
    required List<ChatMessage> messages,
    required String currentUserId,
  }) {
    final newMessages = Map<String, List<ChatMessage>>.from(state.messages);
    final newMessageIds = Map<String, String>.from(state.messageIds);
    final newMessagesByKey = <String, List<ChatMessage>>{};
    
    // Group new messages by key, filtering duplicates
    for (final message in messages) {
      if (state.messageIds.containsKey(message.messageId)) {
        continue; // Skip duplicates
      }
      
      final key = _getChatKey(message, currentUserId);
      if (!newMessagesByKey.containsKey(key)) {
        newMessagesByKey[key] = [];
      }
      newMessagesByKey[key]!.add(message);
    }
    
    // Merge, update IDs, and sort for each key
    for (final entry in newMessagesByKey.entries) {
      final key = entry.key;
      final messagesToAdd = entry.value;
      
      if (!newMessages.containsKey(key)) {
        newMessages[key] = [];
      }
      
      newMessages[key] = List<ChatMessage>.from(newMessages[key]!)..addAll(messagesToAdd);
      
      for (final msg in messagesToAdd) {
        newMessageIds[msg.messageId] = key;
      }
      
      newMessages[key]!.sort(_sortMessages);
    }
    
    state = state.copyWith(
      messages: newMessages,
      messageIds: newMessageIds,
    );
  }
  
  /// Clear all messages
  void clearMessages() {
    state = const ChatMessagesState();
  }
  
  /// Clear messages for specific key
  void clearMessagesForKey(String key) {
    final newMessages = Map<String, List<ChatMessage>>.from(state.messages);
    final newMessageIds = Map<String, String>.from(state.messageIds);
    
    // Remove message IDs
    final messagesToRemove = newMessages[key] ?? [];
    for (final msg in messagesToRemove) {
      newMessageIds.remove(msg.messageId);
    }
    
    // Remove key
    newMessages.remove(key);
    
    state = state.copyWith(
      messages: newMessages,
      messageIds: newMessageIds,
    );
  }
}

// ============================================================================
// PROVIDER
// ============================================================================

/// Chat messages provider
/// Matches: chatMessagesSlice in Redux store
final chatMessagesProvider = StateNotifierProvider<ChatMessagesNotifier, ChatMessagesState>((ref) {
  return ChatMessagesNotifier();
});

// ============================================================================
// SELECTORS (for convenience)
// ============================================================================

/// Get all chat keys
/// Matches: selectChatKeys
final chatKeysProvider = Provider<List<String>>((ref) {
  return ref.watch(chatMessagesProvider).chatKeys;
});

/// Get public chat messages
/// Matches: selectPublicChatMessages
final publicChatMessagesProvider = Provider<List<ChatMessage>>((ref) {
  return ref.watch(chatMessagesProvider).publicMessages;
});

/// Get messages by key (factory provider)
/// Matches: selectMessagesByKeyValue
Provider<List<ChatMessage>> messagesByKeyProvider(String key) {
  return Provider<List<ChatMessage>>((ref) {
    return ref.watch(chatMessagesProvider).messagesByKey(key);
  });
}
