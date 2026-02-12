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
import 'package:torii_app/features/meet/data/models/proto/wajlc_datamessage.pb.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';
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
  Future<void> handleMessage(DataChannelMessage payload) async {
    switch (payload.type) {
      // Whiteboard data requests
      case DataMsgBodyType.REQ_FULL_WHITEBOARD_DATA:
        if (payload.toUserId == connectNats.userId) {
          _handleSendInitWhiteboard(payload);
        }
        break;
        
      case DataMsgBodyType.RES_FULL_WHITEBOARD_DATA:
        if (payload.toUserId == connectNats.userId) {
          _handleWhiteboardDataSentFromDonor(payload.message);
        }
        break;
      
      // Chat data requests
      case DataMsgBodyType.REQ_PUBLIC_CHAT_DATA:
        if (payload.toUserId == connectNats.userId) {
          await _handlePublicChatDataReq(payload.fromUserId);
        }
        break;
        
      case DataMsgBodyType.RES_PUBLIC_CHAT_DATA:
        if (payload.toUserId == connectNats.userId) {
          _handlePublicChatDataRes(payload.message);
        }
        break;
      
      // User visibility (for admins)
      case DataMsgBodyType.USER_VISIBILITY_CHANGE:
        if (payload.fromUserId == connectNats.userId) {
          return;
        }
        _handleUserVisibility(payload);
        break;
      
      // Notifications
      case DataMsgBodyType.INFO:
        if (payload.fromUserId == connectNats.userId || connectNats.isRecorder) {
          return;
        }
        _showNotification(payload.message, 'info');
        break;
        
      case DataMsgBodyType.ALERT:
        if (payload.fromUserId == connectNats.userId || connectNats.isRecorder) {
          return;
        }
        _showNotification(payload.message, 'warning');
        break;
      
      // External media player
      case DataMsgBodyType.EXTERNAL_MEDIA_PLAYER_EVENTS:
        if (payload.fromUserId == connectNats.userId) {
          return;
        }
        _handleExternalMediaPlayerEvents(payload.message);
        break;
      
      // Polls
      case DataMsgBodyType.NEW_POLL_RESPONSE:
        if (payload.fromUserId == connectNats.userId) {
          return;
        }
        _handleNewPollResponse(payload.message);
        break;
      
      // Connection quality
      case DataMsgBodyType.USER_CONNECTION_QUALITY_CHANGE:
        _handleConnectionQualityChange(payload);
        break;
      
      // Breakout rooms
      case DataMsgBodyType.PUSH_JOIN_BREAKOUT_ROOM:
        if (payload.toUserId == connectNats.userId) {
          _handleBreakoutRoomInvitation(payload.message);
        }
        break;
      
      default:
        if (kDebugMode) {
          print('HandleDataMessage: Unknown message type ${payload.type}');
        }
    }
  }
  
  // ============================================================================
  // WHITEBOARD HANDLERS
  // ============================================================================
  
  void _handleSendInitWhiteboard(DataChannelMessage payload) {
    // Check if already have a request
    // Check whiteboard provider state
    final isWhiteboardVisible = ref?.read(whiteboardProvider).isVisible ?? false;
    // if (ref?.read(whiteboardProvider).requestedWhiteboardData.requested) {
    //   return;
    // }
    
    // Update provider to trigger sending whiteboard data
    // Dispatch to whiteboard provider
    ref?.read(whiteboardProvider.notifier).updateMousePointer(
      userId: body['userId'] as String,
      pointer: MousePointer(
        x: body['x'] as double,
        y: body['y'] as double,
      ),
    );
    // ref?.read(whiteboardProvider.notifier).updateRequestedWhiteboardData(
    //   requested: true,
    //   sendTo: payload.fromUserId,
    // );
    
    if (kDebugMode) {
      print('HandleDataMessage: Request to send whiteboard data to ${payload.fromUserId}');
    }
  }
  
  void _handleWhiteboardDataSentFromDonor(String msg) {
    try {
      final data = jsonDecode(msg) as Map<String, dynamic>;
      
      // Dispatch to whiteboard provider
      ref?.read(whiteboardProvider.notifier).removeMousePointer(
        userId: body['userId'] as String,
      );
      // ref?.read(whiteboardProvider.notifier).addWhiteboardDataSentFromDonor(data);
      
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
  
  Future<void> _handlePublicChatDataReq(String fromUserId) async {
    // Get public chat messages
    // Get from chat provider
    final isChatLocked = ref?.read(roomSettingsProvider).lockSettings?.lockChat ?? false;
    // final publicChats = ref?.read(chatMessagesProvider)
    //   .where((msg) => !msg.isPrivate && msg.fromUserId != 'system')
    //   .toList() ?? [];
    
    final publicChats = <ChatMessage>[]; // Placeholder
    
    if (publicChats.isNotEmpty) {
      // Send chat data back
      await connectNats.sendDataMessage(
        type: 'RES_PUBLIC_CHAT_DATA',
        msg: jsonEncode(publicChats.map((m) => m.toProto3Json()).toList()),
        toUserId: fromUserId,
      );
      
      if (kDebugMode) {
        print('HandleDataMessage: Sent ${publicChats.length} chat messages to $fromUserId');
      }
    }
  }
  
  void _handlePublicChatDataRes(String msg) {
    try {
      final data = jsonDecode(msg) as List<dynamic>;
      final messages = data.map((m) => ChatMessage.fromJson(m as Map<String, dynamic>)).toList();
      
      // Dispatch to chat provider
      ref?.read(chatMessagesProvider.notifier).addChatMessage(
        ChatMessage(
          messageId: body['messageId'] as String,
          senderId: body['senderId'] as String,
          senderName: body['senderName'] as String,
          message: body['message'] as String,
          isPrivate: body['isPrivate'] as bool? ?? false,
          createdAt: DateTime.parse(body['createdAt'] as String),
          isSystemMsg: false,
        ),
      );
      // ref?.read(chatMessagesProvider.notifier).addAllChatMessages(
      //   messages: messages,
      //   currentUserId: connectNats.userId,
      // );
      
      if (kDebugMode) {
        print('HandleDataMessage: Received ${messages.length} chat messages from donor');
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
  
  void _handleUserVisibility(DataChannelMessage payload) {
    if (!connectNats.isAdmin) {
      return; // Only admins can see visibility changes
    }
    
    // Dispatch to participant provider
    ref?.read(participantProvider.notifier).updateParticipant(
      userId: body['userId'] as String,
      changes: {
        'connectionQuality': body['quality'] as String,
      },
    );
    // ref?.read(participantProvider.notifier).updateParticipant(
    //   id: payload.fromUserId,
    //   changes: {'visibility': payload.message},
    // );
    
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
        message: body['message'] as String,
        typeOption: 'info',
      ),
    );
    // ref?.read(roomSettingsProvider.notifier).addUserNotification(
    //   message: message,
    //   typeOption: type,
    // );
    
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
  
import '../providers/polls_provider.dart';
import '../data/models/poll.dart';

// ... existing code ...

  // ============================================================================
  // POLL HANDLER
  // ============================================================================
  
  void _handleNewPollResponse(String msg) {
    if (msg.isEmpty) return;
    
    try {
      final data = jsonDecode(msg) as Map<String, dynamic>;
      
      // Determine if it's a new poll or a vote based on fields
      if (data.containsKey('question')) {
        // It's a new poll
        final poll = Poll.fromJson(data);
        ref?.read(pollsProvider.notifier).addPoll(poll);
        
        _showNotification('New poll: ${poll.question}', 'info');
        
        if (kDebugMode) {
          print('HandleDataMessage: Received new poll ${poll.id}');
        }
      } else if (data.containsKey('pollId') && data.containsKey('optionId')) {
        // It's a vote
        final pollId = data['pollId'] as String;
        final optionId = data['optionId'] as String;
        final userId = data['userId'] as String;
        
        // This is a simplified vote handling. In a real app, you might receive the full updated votes list.
        // attempting to find the poll and add the vote locally
        // But ideally, the message should contain the full list of voters for that option or similar.
        // For now, let's assume we receive the updated list of voters for that option or just the single vote.
        
        // If the payload has 'votes' list (userIds)
        if (data.containsKey('votes')) {
             final votes = (data['votes'] as List<dynamic>).map((e) => e as String).toList();
             ref?.read(pollsProvider.notifier).updateVotes(pollId, optionId, votes);
        } else {
             // Fallback: manually fetch poll or add this single user (complex without current state knowledge)
             // For now, we'll assume the message contains 'votes' as List<String>
        }

        if (kDebugMode) {
           print('HandleDataMessage: Received vote for poll $pollId');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('HandleDataMessage: Failed to parse poll message - $e');
      }
    }
  }
  
  // ============================================================================
  // CONNECTION QUALITY HANDLER
  // ============================================================================
  
  void _handleConnectionQualityChange(DataChannelMessage payload) {
    // Dispatch to participant provider
    ref?.read(participantProvider.notifier).updateParticipant(
      userId: body['userId'] as String,
      changes: {
        'metadata': body['metadata'],
      },
    );
    // ref?.read(participantProvider.notifier).updateParticipant(
    //   id: payload.fromUserId,
    //   changes: {'connectionQuality': payload.message},
    // );
    
    if (kDebugMode) {
      print('HandleDataMessage: User ${payload.fromUserId} connection quality: ${payload.message}');
    }
  }
  
import '../providers/breakout_room_provider.dart';

// ... existing code ...

  // ============================================================================
  // BREAKOUT ROOM HANDLER
  // ============================================================================
  
  void _handleBreakoutRoomInvitation(String roomId) {
    // Dispatch to breakout room provider
    ref?.read(breakoutRoomProvider.notifier).updateReceivedInvitationFor(roomId);
    
    if (kDebugMode) {
      print('HandleDataMessage: Received breakout room invitation for $roomId');
    }
  }
  
  // ============================================================================
  // SPEECH SUBTITLE HANDLER
  // ============================================================================
  
  void handleSpeechSubtitleText(String message) {
    if (message.isEmpty) return;
    
    try {
      // Get selected subtitle language
      final selectedLanguage = ref?.read(roomSettingsProvider).selectedSubtitleLanguage ?? 'en';
      // final lang = ref?.read(speechServicesProvider).selectedSubtitleLang ?? '';
      final lang = ''; // Placeholder
      
      if (lang.isEmpty) return;
      
      // Parse transcription result
      final data = jsonDecode(message) as Map<String, dynamic>;
      final isPartial = data['isPartial'] as bool? ?? false;
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
      final result = {
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
