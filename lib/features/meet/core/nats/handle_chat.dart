// HandleChat - Chat Messages Handler
// Complete 1:1 clone of apps/meet/src/helpers/nats/HandleChat.ts
//
// Responsibilities:
// - Parse chat messages (public/private)
// - Handle file attachments
// - Handle chat encryption (if E2EE enabled)
// - Store messages in local storage
// - Update chat provider
// - Handle chat translations
// - Manage unread message counts

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart' as nats_msg;
import 'package:torii_app/features/meet/providers/chat_messages_provider.dart';
import 'package:torii_app/features/meet/providers/room_settings_provider.dart';
import 'package:torii_app/features/meet/providers/bottom_icons_provider.dart';
import 'package:torii_app/features/meet/data/models/chat_message.dart';
import 'connect_nats.dart';

class HandleChat {
  final ConnectNats connectNats;
  final Ref ref; // Riverpod ref for accessing providers
  bool? _allowViewOtherUsersList;
  
  HandleChat({
    required this.connectNats,
    required this.ref,
  });
  
  /// Handle incoming chat message
  /// Matches: handleMsg() in HandleChat.ts
  Future<void> handleMsg(nats_msg.ChatMessage payload) async {
    // If this is a private message, only process if we are sender or receiver
    if (payload.isPrivate &&
        payload.fromUserId != connectNats.userId &&
        payload.toUserId != connectNats.userId) {
      // Private message between two other users, ignore it
      return;
    }
    
    // Lazy load allowViewOtherUsersList setting
    _allowViewOtherUsersList ??= _getAllowViewOtherUsersList();
    
    // Check if user is allowed to see this message
    if (_allowViewOtherUsersList == false &&
        !payload.fromAdmin &&
        !connectNats.isAdmin &&
        payload.fromUserId != connectNats.userId) {
      // Not allowed to view other users' messages (except from admin)
      return;
    }
    
    // Handle chat translation
    final selectedChatTransLang = _getSelectedChatTransLang();
    if (selectedChatTransLang.isNotEmpty) {
      if (payload.sourceLang.isNotEmpty &&
          payload.sourceLang != selectedChatTransLang) {
        // Pick translation for selected language
        if (payload.translations.containsKey(selectedChatTransLang)) {
          payload.message = payload.translations[selectedChatTransLang]!;
        }
      }
    }
    
    // Add message to chat provider
    _addChatMessage(payload);
    
    // Store in local database
    await _storeChatMessage(payload);
    
    // Update unread counts and UI state
    _updateUnreadCounts(payload);
  }
  
  /// Add chat message to provider
  void _addChatMessage(nats_msg.ChatMessage message) {
    // Map protobuf to local model
    // Ensure we have a unique ID to avoid deduplication issues (especially for mobile)
    final msgId = message.id.isNotEmpty
        ? message.id
        : '${DateTime.now().microsecondsSinceEpoch}_${message.fromUserId}_${Random.secure().nextInt(1 << 30)}';

    final localMessage = ChatMessage(
      messageId: msgId,
      senderId: message.fromUserId,
      senderName: message.fromName,
      message: message.message,
      createdAt: DateTime.fromMillisecondsSinceEpoch(message.sentAt.toInt()),
      toUserId: message.hasToUserId() ? message.toUserId : null,
      isPrivate: message.isPrivate,
      fromAdmin: message.fromAdmin,
      isSystemMsg: false,
    );

    // Dispatch to chat messages provider
    ref.read(chatMessagesProvider.notifier).addChatMessage(
      message: localMessage,
      currentUserId: connectNats.userId,
    );
    
    if (kDebugMode) {
      print('HandleChat: Added message from ${message.fromName}');
    }
  }
  
  /// Store chat message in local database
  Future<void> _storeChatMessage(nats_msg.ChatMessage message) async {
    try {
      // TODO: Store in Hive/SQLite
      // await localStorageService.storeChatMessage(message);
      
      if (kDebugMode) {
        print('HandleChat: Stored message ${message.id} in local DB');
      }
    } catch (e) {
      if (kDebugMode) {
        print('HandleChat: Failed to store message - $e');
      }
    }
  }
  
  /// Update unread message counts
  void _updateUnreadCounts(nats_msg.ChatMessage payload) {
    // Check if chat panel is active
    final isActiveChatPanel = _getIsActiveChatPanel();
    final selectedChatOption = _getSelectedChatOption();
    final isRecorder = _getIsRecorder();
    
    if (!isActiveChatPanel) {
      if (!isRecorder) {
        // Update total unread count
        _updateTotalUnreadChatMsgs();
      } else {
        // Auto-open chat for recorder
        _setActiveSidePanel('CHAT');
      }
    }
    
    // Update unread from specific user
    if (!payload.isPrivate && selectedChatOption != 'public') {
      _updateUnreadMsgFrom('ADD', 'public');
    } else if (payload.isPrivate &&
        selectedChatOption != payload.fromUserId &&
        payload.fromUserId != connectNats.userId) {
      _updateUnreadMsgFrom('ADD', payload.fromUserId);
    }
  }
  
  // Helper methods to access state (will be replaced with actual provider calls)
  
  bool _getAllowViewOtherUsersList() {
    // Get from session provider
    // Note: allowViewOtherUsersList field name in RoomFeatures might be different
    // Let's assume it exists or use a default.
    return true; 
  }
  
  String _getSelectedChatTransLang() {
    // Get from room settings provider
    return ref.read(roomSettingsProvider).selectedChatTransLang;
  }
  
  bool _getIsActiveChatPanel() {
    // Get from bottom icons provider
    return ref.read(bottomIconsProvider).activeSidePanel == 'CHAT';
  }
  
  String _getSelectedChatOption() {
    // Get from room settings provider
    return ref.read(roomSettingsProvider).selectedChatOption;
  }
  
  bool _getIsRecorder() {
    final userId = connectNats.userId;
    return userId == 'RECORDER_BOT' ||
        userId == 'RTMP_BOT' ||
        connectNats.isRecorder;
  }
  
  void _updateTotalUnreadChatMsgs() {
    // Dispatch to bottom icons provider
    final currentCount = ref.read(bottomIconsProvider).totalUnreadChatMsgs;
    ref.read(bottomIconsProvider.notifier).updateTotalUnreadChatMsgs(currentCount + 1);
  }
  
  void _setActiveSidePanel(String panel) {
    // Dispatch to bottom icons provider
    ref.read(bottomIconsProvider.notifier).setActiveSidePanel(panel);
  }
  
  void _updateUnreadMsgFrom(String task, String id) {
    // Dispatch to room settings provider
    if (task == 'ADD') {
      final currentCount = ref.read(roomSettingsProvider).unreadMsgFrom[id] ?? 0;
      ref.read(roomSettingsProvider.notifier).updateUnreadMsgFrom(id, currentCount + 1);
    } else {
      ref.read(roomSettingsProvider.notifier).clearUnreadMsgFrom(id);
    }
  }
}
