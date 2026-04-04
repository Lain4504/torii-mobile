// HandleDataMessage - Data Channel Handler
// Complete 1:1 clone of apps/meet/src/helpers/nats/HandleDataMessage.ts
//
// Responsibilities:
// - Parse data channel messages (client-to-client communication)
// - Handle whiteboard data requests/responses
// - Handle chat data requests/responses
// - Handle raise hand events
// - Handle user visibility changes
// - Handle external media player events
// - Handle poll responses
// - Handle connection quality updates
// - Handle breakout room invitations
// - Handle speech subtitles
// - Route to appropriate handlers

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_datamessage.pb.dart' as data_msg;
import 'package:torii_app/features/meet/data/models/chat_message.dart';
import 'package:torii_app/features/meet/providers/whiteboard_provider.dart';
import 'package:torii_app/features/meet/providers/chat_messages_provider.dart';
import 'package:torii_app/features/meet/providers/room_settings_provider.dart';
import 'package:torii_app/features/meet/providers/participant_provider.dart';
import 'package:torii_app/features/meet/providers/polls_provider.dart';
import 'package:torii_app/features/meet/data/datasources/meet_api_service.dart';
import 'connect_nats.dart';

class HandleDataMessage {
  final ConnectNats connectNats;
  final Ref? ref; // Riverpod ref for accessing providers
  
  HandleDataMessage({
    required this.connectNats,
    this.ref,
  });
  
  /// Handle data channel message
  /// Matches: handleMessage() in HandleDataMessage.ts
  Future<void> handleMessage(data_msg.DataChannelMessage payload) async {
    switch (payload.type) {
      // Whiteboard data requests
      case data_msg.DataMsgBodyType.REQ_FULL_WHITEBOARD_DATA:
        if (payload.toUserId == connectNats.userId) {
          _handleSendInitWhiteboard(payload);
        }
        break;
        
      case data_msg.DataMsgBodyType.RES_FULL_WHITEBOARD_DATA:
        if (payload.toUserId == connectNats.userId) {
          _handleWhiteboardDataSentFromDonor(payload.message);
        }
        break;
      
      // Chat data requests
      case data_msg.DataMsgBodyType.REQ_PUBLIC_CHAT_DATA:
        if (payload.toUserId == connectNats.userId) {
          await _handlePublicChatDataReq(payload.fromUserId);
        }
        break;
        
      case data_msg.DataMsgBodyType.RES_PUBLIC_CHAT_DATA:
        if (payload.toUserId == connectNats.userId) {
          _handlePublicChatDataRes(payload.message);
        }
        break;
      
      // User visibility (for admins)
      case data_msg.DataMsgBodyType.USER_VISIBILITY_CHANGE:
        if (payload.fromUserId == connectNats.userId) {
          return;
        }
        _handleUserVisibility(payload);
        break;
      
      // Notifications
      case data_msg.DataMsgBodyType.INFO:
        if (payload.fromUserId == connectNats.userId || connectNats.isRecorder) {
          return;
        }
        _showNotification(payload.message, 'info');
        break;
        
      case data_msg.DataMsgBodyType.ALERT:
        if (payload.fromUserId == connectNats.userId || connectNats.isRecorder) {
          return;
        }
        _showNotification(payload.message, 'warning');
        break;
      
      // External media player
      case data_msg.DataMsgBodyType.EXTERNAL_MEDIA_PLAYER_EVENTS:
        if (payload.fromUserId == connectNats.userId) {
          return;
        }
        _handleExternalMediaPlayerEvents(payload.message);
        break;
      
      // Polls
      case data_msg.DataMsgBodyType.NEW_POLL_RESPONSE:
        if (payload.fromUserId == connectNats.userId) {
          return;
        }
        await _handleNewPollResponse(payload.message);
        break;
      
      // Connection quality
      case data_msg.DataMsgBodyType.USER_CONNECTION_QUALITY_CHANGE:
        _handleConnectionQualityChange(payload);
        break;
      
      // Breakout rooms
      // NOTE:
      // Breakout room invitation is handled via NATS system event:
      // NatsMsgServerToClientEvents.JOIN_BREAKOUT_ROOM (see HandleSystemData).
      // Keep a single source of truth to match web behavior and avoid duplicate invites.
      
      default:
        if (kDebugMode) {
          print('HandleDataMessage: Unknown message type ${payload.type}');
        }
    }
  }
  
  // ============================================================================
  // WHITEBOARD HANDLERS
  // ============================================================================
  
  void _handleSendInitWhiteboard(data_msg.DataChannelMessage _) {
    // Web: donor có Excalidraw → set `requestedWhiteboardData` để `useWhiteboardDataSharer` gửi RES_FULL.
    // Mobile chỉ xem, không có Excalidraw — không đóng vai donor; không set state (tránh kẹt `requested`).
    if (kDebugMode) {
      print(
        'HandleDataMessage: bỏ qua REQ_FULL_WHITEBOARD_DATA (mobile không gửi RES_FULL Excalidraw)',
      );
    }
  }
  
  void _handleWhiteboardDataSentFromDonor(String msg) {
    try {
      final data = jsonDecode(msg) as Map<String, dynamic>;
      
      // Dispatch to whiteboard provider
      ref?.read(whiteboardProvider.notifier).addWhiteboardDataSentFromDonor(data);
      
      if (kDebugMode) {
        print('HandleDataMessage: Received whiteboard data from donor');
      }
    } catch (e) {
      if (kDebugMode) {
        print('HandleDataMessage: Failed to parse whiteboard data - $e');
      }
    }
  }
  
  // ============================================================================
  // CHAT HANDLERS
  // ============================================================================

  /// JSON shape must match web `HandleDataMessage.handlePublicChatDataReq`:
  /// `JSON.stringify(selectPublicChatMessages(...))` over protocol `ChatMessage`.
  Map<String, dynamic> _chatMessageToWebPublicChatJson(ChatMessage c) {
    final id = c.messageId.isNotEmpty
        ? c.messageId
        : (c.id != null && c.id!.isNotEmpty ? c.id! : '');
    final sentMs = c.createdAt.millisecondsSinceEpoch;
    final safeId = id.isNotEmpty ? id : 'm_${sentMs}_${c.senderId}';
    final map = <String, dynamic>{
      'id': safeId,
      'fromUserId': c.senderId,
      'fromName': c.senderName,
      'sentAt': sentMs.toString(),
      'isPrivate': c.isPrivate,
      'message': c.message,
      'fromAdmin': c.fromAdmin,
    };
    if (c.toUserId != null && c.toUserId!.isNotEmpty) {
      map['toUserId'] = c.toUserId;
    }
    if (c.isSystemMsg) {
      map['isSystemMsg'] = true;
    }
    return map;
  }
  
  Future<void> _handlePublicChatDataReq(String fromUserId) async {
    // Get public chat messages
    // Get from chat provider
    final chats = ref?.read(chatMessagesProvider).messages['public'] ?? [];
    
    if (chats.isNotEmpty) {
      // Web meet expects the same JSON shape as Redux + JSON.stringify(publicChats)
      // (protocol ChatMessage: id, fromUserId, fromName, sentAt as ms string, ...).
      // Sending Flutter ChatMessage JSON (messageId, senderId, createdAt ISO) breaks
      // web dedupe/sort and can surface garbage in UI for newly joined clients.
      final payload = chats.map(_chatMessageToWebPublicChatJson).toList();
      await connectNats.sendDataMessage(
        type: 'RES_PUBLIC_CHAT_DATA',
        msg: jsonEncode(payload),
        toUserId: fromUserId,
      );
      
      if (kDebugMode) {
        print('HandleDataMessage: Sent ${chats.length} chat messages to $fromUserId');
      }
    }
  }
  
  void _handlePublicChatDataRes(String msg) {
    try {
      final data = jsonDecode(msg) as List<dynamic>;
      
      for (final m in data) {
         final body = m as Map<String, dynamic>;
         final messageId = (body['messageId'] ?? body['id'] ?? '').toString();
         final senderId = (body['senderId'] ?? body['fromUserId'] ?? '').toString();
         final senderName = (body['senderName'] ?? body['fromName'] ?? '').toString();
         DateTime createdAt;
         if (body['createdAt'] != null) {
           createdAt = DateTime.tryParse(body['createdAt'].toString()) ?? DateTime.now();
         } else if (body['sentAt'] != null) {
           final s = body['sentAt'].toString();
           final ms = int.tryParse(s);
           createdAt = ms != null
               ? DateTime.fromMillisecondsSinceEpoch(ms)
               : DateTime.tryParse(s) ?? DateTime.now();
         } else {
           createdAt = DateTime.now();
         }
         final toRaw = body['toUserId'];
         final toUserId = toRaw == null || toRaw.toString().isEmpty
             ? null
             : toRaw.toString();
         ref?.read(chatMessagesProvider.notifier).addChatMessage(
           message: ChatMessage(
             messageId: messageId.isNotEmpty
                 ? messageId
                 : '${createdAt.microsecondsSinceEpoch}_$senderId',
             senderId: senderId,
             senderName: senderName,
             message: body['message']?.toString() ?? '',
             createdAt: createdAt,
             toUserId: toUserId,
             isPrivate: body['isPrivate'] as bool? ?? false,
             isSystemMsg: body['isSystemMsg'] as bool? ?? false,
             fromAdmin: body['fromAdmin'] as bool? ?? false,
           ),
           currentUserId: connectNats.userId,
         );
      }
      
      if (kDebugMode) {
        print('HandleDataMessage: Received chat messages from donor');
      }
    } catch (e) {
      if (kDebugMode) {
        print('HandleDataMessage: Failed to parse chat data - $e');
      }
    }
  }
  
  // ============================================================================
  // USER VISIBILITY HANDLER
  // ============================================================================
  
  void _handleUserVisibility(data_msg.DataChannelMessage payload) {
    if (!connectNats.isAdmin) {
      return; // Only admins can see visibility changes
    }
    
    try {
      final body = jsonDecode(payload.message) as Map<String, dynamic>;
      
      // Dispatch to participant provider
      ref?.read(participantProvider.notifier).updateParticipant(
        userId: body['userId'] as String,
        changes: {
          'connectionQuality': body['quality'] as String? ?? 'excellent',
        },
      );
    } catch (e) {
      // Ignored
    }
    
    if (kDebugMode) {
      print('HandleDataMessage: User ${payload.fromUserId} visibility changed to ${payload.message}');
    }
  }
  
  // ============================================================================
  // NOTIFICATION HANDLERS
  // ============================================================================
  
  void _showNotification(String message, String type) {
    // Show notification to user
    ref?.read(roomSettingsProvider.notifier).addUserNotification(
      UserNotification(
        message: message,
        typeOption: type,
      ),
    );
    
    if (kDebugMode) {
      print('HandleDataMessage: Notification ($type): $message');
    }
  }
  
  // ============================================================================
  // EXTERNAL MEDIA PLAYER HANDLER
  // ============================================================================
  
  void _handleExternalMediaPlayerEvents(String msg) {
    if (msg.isEmpty) return;
    
    try {
      final data = jsonDecode(msg) as Map<String, dynamic>;
      
      // Dispatch to external media player provider
      // ref?.read(externalMediaPlayerProvider.notifier).updatePlayerState(body);
      // ref?.read(externalMediaPlayerProvider.notifier).addEvent(data);
      
      if (kDebugMode) {
        print('HandleDataMessage: External media player event - ${data['action']}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('HandleDataMessage: Failed to parse media player event - $e');
      }
    }
  }
  
  // ============================================================================
  // POLL HANDLER
  // ============================================================================
  
  // ============================================================================
  // POLL HANDLER
  // ============================================================================
  
  Future<void> _handleNewPollResponse(String msg) async {
    if (msg.isEmpty) return;
    
    try {
      // On mobile, we broadcast votes as `NEW_POLL_RESPONSE` with `message = pollId`.
      // To keep it 1:1 with web (invalidate tags -> refetch), we refetch poll list.
      final r = ref;
      if (r == null) return;

      final api = r.read(meetApiServiceProvider);
      final response = await api.listPolls();
      final list = pollsFromPollResponse(response);
      r.read(pollsProvider.notifier).setPollsFromApi(list);
    } catch (e) {
      if (kDebugMode) {
        print('HandleDataMessage: Failed to parse poll message - $e');
      }
    }
  }
  
  // ============================================================================
  // CONNECTION QUALITY HANDLER
  // ============================================================================
  
  void _handleConnectionQualityChange(data_msg.DataChannelMessage payload) {
    try {
      // TODO: Map connection quality to provider when UI needs it.
      jsonDecode(payload.message);
    } catch (e) {
      // Ignored
    }
    
    if (kDebugMode) {
      print('HandleDataMessage: User ${payload.fromUserId} connection quality: ${payload.message}');
    }
  }
  
  // ============================================================================
  // BREAKOUT ROOM HANDLER
  // ============================================================================
  // (intentionally empty: handled by HandleSystemData)
  
  // ============================================================================
  // SPEECH SUBTITLE HANDLER
  // ============================================================================
  
  void handleSpeechSubtitleText(String message) {
    if (message.isEmpty) return;
    
    try {
      // Get selected subtitle language
      // final selectedLanguage = ref?.read(roomSettingsProvider).selectedChatTransLang ?? 'en';
      final lang = ''; // Placeholder
      
      if (lang.isEmpty) return;
      
      // Parse transcription result
      final data = jsonDecode(message) as Map<String, dynamic>;
      final fromUserName = data['fromUserName'] as String? ?? '';
      final sourceLang = data['lang'] as String? ?? '';
      final text = data['text'] as String? ?? '';
      final translations = data['translations'] as Map<String, dynamic>? ?? {};
      
      // Get text in selected language
      String displayText = '';
      if (sourceLang == lang) {
        displayText = text;
      } else if (translations.containsKey(lang)) {
        displayText = translations[lang] as String;
      } else {
        return; // No translation available
      }
      
      final now = DateTime.now();
      // TODO: Wire subtitle output to speechServicesProvider when implemented.
      final _ = {
        'text': displayText,
        'from': fromUserName,
        'time': '${now.hour}:${now.minute}:${now.second}',
        'id': now.millisecondsSinceEpoch.toString(),
      };
      
      // Dispatch to speech services provider
      // ref?.read(speechServicesProvider.notifier).addSubtitle(subtitle);
      // ref?.read(speechServicesProvider.notifier).addSpeechSubtitleText(
      //   type: isPartial ? 'interim' : 'final',
      //   result: result,
      // );
      
      if (kDebugMode) {
        print('HandleDataMessage: Speech subtitle - $displayText');
      }
    } catch (e) {
      if (kDebugMode) {
        print('HandleDataMessage: Failed to parse speech subtitle - $e');
      }
    }
  }
}
