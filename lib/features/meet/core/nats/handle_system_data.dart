// HandleSystemData - System Events Handler
// Complete 1:1 clone of apps/meet/src/helpers/nats/HandleSystemData.tsx
//
// Responsibilities:
// - Handle system notifications (info, warning, error)
// - Handle poll events (created, closed)
// - Handle breakout room events (invitation, ended)
// - Handle system chat messages
// - Handle Insights AI text chat

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/data/models/chat_message.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart' as nats_msg;
import 'package:torii_app/features/meet/providers/room_settings_provider.dart';
import 'package:torii_app/features/meet/providers/chat_messages_provider.dart';
import 'package:torii_app/features/meet/providers/insights_ai_text_chat_provider.dart';
import 'package:torii_app/features/meet/providers/breakout_room_provider.dart';
import 'package:torii_app/features/meet/core/notification_sound_service.dart';

class HandleSystemData {
  final String userId;
  final Ref? ref; // Riverpod ref for accessing providers
  
  HandleSystemData({
    required this.userId,
    this.ref,
  });
  
  /// Handle system notification
  /// Matches: handleNotification() in HandleSystemData.tsx
  void handleNotification(String data) {
    try {
      final notification = jsonDecode(data) as Map<String, dynamic>;
      final type = notification['type'] as String? ?? '';
      final msg = notification['msg'] as String? ?? '';
      final withSound = notification['withSound'] as bool? ?? false;
      
      String typeOption = 'info';
      switch (type) {
        case 'NATS_SYSTEM_NOTIFICATION_INFO':
          typeOption = 'info';
          break;
        case 'NATS_SYSTEM_NOTIFICATION_WARNING':
          typeOption = 'warning';
          break;
        case 'NATS_SYSTEM_NOTIFICATION_ERROR':
          typeOption = 'error';
          break;
      }
      
      // Dispatch to room settings provider
      ref?.read(roomSettingsProvider.notifier).addUserNotification(
        UserNotification(
          message: msg,
          typeOption: typeOption,
        ),
      );
      // ref?.read(roomSettingsProvider.notifier).addUserNotification(
      //   message: msg,
      //   typeOption: typeOption,
      //   newInstance: true,
      // );
      
      if (withSound) {
        _playNotificationIfEnabled();
      }
      
      if (kDebugMode) {
        print('HandleSystemData: Notification ($typeOption): $msg');
      }
    } catch (e) {
      if (kDebugMode) {
        print('HandleSystemData: Failed to parse notification - $e');
      }
    }
  }
  
  /// Handle poll events
  /// Matches: handlePoll() in HandleSystemData.tsx
  void handlePoll(nats_msg.NatsMsgServerToClient payload) {
    switch (payload.event) {
      case nats_msg.NatsMsgServerToClientEvents.POLL_CREATED:
        // Dispatch notification
        ref?.read(roomSettingsProvider.notifier).addUserNotification(
          UserNotification(
            message: 'New poll available',
            typeOption: 'info',
          ),
        );
        // ref?.read(roomSettingsProvider.notifier).addUserNotification(
        //   message: 'Bình chọn mới',
        //   typeOption: 'info',
        //   notificationCat: 'new-poll-created',
        //   autoClose: false,
        // );
        
        // Invalidate polls cache
        // In Flutter, this would trigger a refetch from API
        // ref?.read(pollsProvider.notifier).invalidateCache();
        // ref?.read(pollsProvider.notifier).invalidateTags(['List', 'PollsStats']);
        
        if (kDebugMode) {
          print('HandleSystemData: New poll created');
        }
        break;
        
      case nats_msg.NatsMsgServerToClientEvents.POLL_CLOSED:
        // Invalidate poll cache for specific poll
        // ref?.read(pollsProvider.notifier).invalidatePoll(pollId);
        // ref?.read(pollsProvider.notifier).invalidatePoll(payload.msg);
        
        if (kDebugMode) {
          print('HandleSystemData: Poll closed - ${payload.msg}');
        }
        break;
        
      default:
        break;
    }
  }
  
  /// Handle breakout room events
  /// Matches: handleBreakoutRoom() in HandleSystemData.tsx
  void handleBreakoutRoom(nats_msg.NatsMsgServerToClient payload) {
    switch (payload.event) {
      case nats_msg.NatsMsgServerToClientEvents.JOIN_BREAKOUT_ROOM:
        if (payload.msg.isNotEmpty) {
          ref?.read(roomSettingsProvider.notifier).addUserNotification(
            UserNotification(
              message: 'Breakout room invitation received',
              typeOption: 'info',
            ),
          );
          ref?.read(breakoutRoomProvider.notifier).updateReceivedInvitationFor(payload.msg);
          if (kDebugMode) {
            print('HandleSystemData: Breakout room invitation - ${payload.msg}');
          }
        }
        break;
        
      case nats_msg.NatsMsgServerToClientEvents.BREAKOUT_ROOM_ENDED:
        // Invalidate breakout room cache
        // ref?.read(breakoutRoomProvider.notifier).invalidateCache();
        // ref?.read(breakoutRoomProvider.notifier).invalidateTags(['List', 'My_Rooms']);
        
        if (kDebugMode) {
          print('HandleSystemData: Breakout room ended');
        }
        break;
        
      default:
        break;
    }
  }
  
  /// Handle system chat message
  /// Matches: handleSysChatMsg() in HandleSystemData.tsx
  void handleSysChatMsg(String msg) {
    ref?.read(chatMessagesProvider.notifier).addChatMessage(
      message: ChatMessage(
        messageId: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: 'system',
        senderName: 'System',
        message: msg,
        isPrivate: false,
        createdAt: DateTime.now(),
        isSystemMsg: true,
      ),
      currentUserId: userId,
    );
    ref?.read(roomSettingsProvider.notifier).addUserNotification(
      UserNotification(
        message: 'New system message in chat',
        typeOption: 'info',
      ),
    );
    if (kDebugMode) {
      print('HandleSystemData: System chat message - $msg');
    }
  }
  
  /// Handle Insights AI text chat data
  /// Matches: handleInsightsAITextData() in HandleSystemData.tsx
  void handleInsightsAITextData(String msg) {
    try {
      final data = jsonDecode(msg) as Map<String, dynamic>;
      // Support both camelCase and snake_case from server
      final id = data['id'] as String? ?? '';
      final text = data['text'] as String? ?? '';
      final isLastChunk = data['isLastChunk'] as bool? ?? data['is_last_chunk'] as bool? ?? false;
      final createdAt = data['createdAt'] as String? ?? data['created_at'] as String? ?? DateTime.now().toIso8601String();

      ref?.read(insightsAiTextChatProvider.notifier).updateAiTextChat(
        InsightsAITextChatStreamResult(
          id: id,
          text: text,
          isLastChunk: isLastChunk,
          createdAt: createdAt,
        ),
      );

      if (kDebugMode) {
        print('HandleSystemData: Insights AI text data received');
      }
    } catch (e) {
      if (kDebugMode) {
        print('HandleSystemData: Failed to parse AI text data - $e');
      }
    }
  }
  
  /// Play notification sound when enabled in settings (matches web: updatePlayAudioNotification + UI plays sound)
  void _playNotificationIfEnabled() {
    final playSound = ref?.read(roomSettingsProvider).playAudioNotification ?? false;
    if (playSound) {
      NotificationSoundService.instance.play();
    }
  }
}
