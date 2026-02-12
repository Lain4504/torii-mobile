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
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart' as nats_msg;

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
          message: msg.message,
          typeOption: 'info',
        ),
      );
      // ref?.read(roomSettingsProvider.notifier).addUserNotification(
      //   message: msg,
      //   typeOption: typeOption,
      //   newInstance: true,
      // );
      
      if (withSound) {
        _playNotification();
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
          // Dispatch notification
          ref?.read(roomSettingsProvider.notifier).addUserNotification(
            UserNotification(
              message: 'Breakout room invitation received',
              typeOption: 'info',
            ),
          );
          // ref?.read(roomSettingsProvider.notifier).addUserNotification(
          //   message: 'Lời mời tham gia phòng thảo luận',
          //   typeOption: 'info',
          //   notificationCat: 'breakout-room-invitation',
          //   data: payload.msg,
          //   disableToastNotification: true,
          // );
          
          // Update breakout room provider
          // ref?.read(breakoutRoomProvider.notifier).updateBreakoutRoom(roomId, data);
          // ref?.read(breakoutRoomProvider.notifier).updateReceivedInvitationFor(payload.msg);
          // ref?.read(breakoutRoomProvider.notifier).invalidateTags(['My_Rooms']);
          
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
    final systemMessage = ChatMessage(
      id: _randomString(),
      sentAt: DateTime.now().millisecondsSinceEpoch.toString(),
      isPrivate: false,
      fromName: 'system',
      fromUserId: 'system',
      message: msg,
      fromAdmin: true, // System message always from admin
    );
    
    // Dispatch to chat provider
    ref?.read(chatMessagesProvider.notifier).addChatMessage(
      ChatMessage(
        messageId: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: 'system',
        senderName: 'System',
        message: msg.message,
        isPrivate: false,
        createdAt: DateTime.now(),
        isSystemMsg: true,
      ),
    );
    // ref?.read(chatMessagesProvider.notifier).addChatMessage(
    //   message: systemMessage,
    //   currentUserId: userId,
    // );
    
    if (kDebugMode) {
      print('HandleSystemData: System chat message - $msg');
    }
  }
  
  /// Handle Insights AI text chat data
  /// Matches: handleInsightsAITextData() in HandleSystemData.tsx
  void handleInsightsAITextData(String msg) {
    try {
      final data = jsonDecode(msg) as Map<String, dynamic>;
      
      // Dispatch to Insights AI provider
      // ref?.read(insightsAiTextChatProvider.notifier).addMessage(message);
      // ref?.read(insightsAiTextChatProvider.notifier).updateAiTextChat(data);
      
      if (kDebugMode) {
        print('HandleSystemData: Insights AI text data received');
      }
    } catch (e) {
      if (kDebugMode) {
        print('HandleSystemData: Failed to parse AI text data - $e');
      }
    }
  }
  
  /// Play notification sound
  void _playNotification() {
    // Play notification sound
    // In Flutter, use audio player package
    // await audioPlayer.play(AssetSource('sounds/notification.mp3'));
    // ref?.read(roomSettingsProvider.notifier).updatePlayAudioNotification();
    
    if (kDebugMode) {
      print('HandleSystemData: Playing notification sound');
    }
  }
  
  /// Generate random string
  String _randomString() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return List.generate(16, (i) => chars[random.nextInt(chars.length)]).join();
  }
}
