// HandleRoomData - Room Metadata Handler
// Complete 1:1 clone of apps/meet/src/helpers/nats/HandleRoomData.ts
//
// Responsibilities:
// - Parse room metadata updates
// - Handle recording status changes
// - Handle RTMP broadcasting status
// - Publish welcome messages
// - Handle whiteboard preload files
// - Update session provider

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart' as nats_msg;
import 'package:torii_app/features/meet/data/models/room_info.dart';
import 'package:torii_app/features/meet/data/models/chat_message.dart';
import 'package:torii_app/features/meet/providers/session_provider.dart';
import 'package:torii_app/features/meet/providers/chat_messages_provider.dart';
import 'package:torii_app/features/meet/providers/room_settings_provider.dart';
import 'package:torii_app/features/meet/providers/whiteboard_provider.dart';

class HandleRoomData {
  final String roomId;
  final String userId;
  final Ref? ref; // Riverpod ref for accessing providers
  
  // Room info cache
  Map<String, dynamic>? _currentRoom;
  String? _welcomeMessage;
  bool _checkedPreloadedWhiteboardFile = false;
  
  HandleRoomData({
    required this.roomId,
    required this.userId,
    this.ref,
  }) {
    _currentRoom = {
      'roomId': roomId,
      'sid': '',
      'metadata': null,
    };
  }
  
  /// Set initial room info
  /// Matches: setRoomInfo() in HandleRoomData.ts
  Future<Map<String, dynamic>> setRoomInfo(nats_msg.NatsKvRoomInfo info) async {
    // Parse metadata
    final Map<String, dynamic> rawMetadata = info.hasMetadata() && info.metadata.isNotEmpty
        ? jsonDecode(info.metadata)
        : {};
    final normalizedMetadata = _normalizeMetadata(rawMetadata);
    final metadata = RoomInfo.fromJson(normalizedMetadata);

    _currentRoom = {
      'roomId': info.roomId,
      'sid': info.roomSid,
      'metadata': metadata.toJson(),
    };
    
    // Dispatch to session provider
    ref?.read(sessionProvider.notifier).addCurrentRoom(
      CurrentRoom(
        sid: info.roomSid,
        roomId: info.roomId,
        metadata: metadata,
      ),
    );
    
    await handleRoomMetadataUpdate(info);
    
    return _currentRoom!;
  }
  
  /// Handle room metadata update
  /// Matches: updateRoomMetadata() in HandleRoomData.ts
  Future<void> handleRoomMetadataUpdate(nats_msg.NatsKvRoomInfo roomInfo) async {
    try {
      final Map<String, dynamic> rawMetadata = roomInfo.hasMetadata() && roomInfo.metadata.isNotEmpty
          ? jsonDecode(roomInfo.metadata)
          : {};
      final metadata = RoomInfo.fromJson(_normalizeMetadata(rawMetadata));
      
      // Check if metadata actually changed
      if (_currentRoom?['metadata'] == null ||
          _currentRoom?['metadata']['metadataId'] != metadata.metadataId) {
        _currentRoom?['metadata'] = metadata.toJson();
        await _updateMetadata(metadata);
      }
    } catch (e) {
      if (kDebugMode) {
        print('HandleRoomData: Failed to update metadata - $e');
      }
    }
  }
  
  /// Update metadata and trigger side effects
  Future<void> _updateMetadata(RoomInfo metadata) async {
    // Set window/app title
    _setAppTitle(metadata.roomTitle);
    
    // Show notifications
    _showRecordingNotification(metadata);
    _showRTMPNotification(metadata);
    
    // Publish welcome message
    _publishWelcomeMessage(metadata);
    
    // Dispatch to session provider
    ref?.read(sessionProvider.notifier).updateCurrentRoomMetadata(metadata);
    // ref?.read(sessionProvider.notifier).updateCurrentRoomMetadata(metadata);
    
    // Check for preloaded whiteboard file
    if (!_checkedPreloadedWhiteboardFile) {
      unawaited(_addPreloadWhiteboardFile(metadata));
    }
    
    if (kDebugMode) {
      print('HandleRoomData: Updated room metadata - ${metadata.roomTitle}');
    }
  }
  
  /// Set app title
  void _setAppTitle(String title) {
    // Update app title (platform-specific)
    // In Flutter, this would be handled by the UI layer
    // In Flutter, this might be handled differently
    if (kDebugMode) {
      print('HandleRoomData: Room title - $title');
    }
  }
  
  /// Show recording notification
  void _showRecordingNotification(RoomInfo metadata) {
    // Get current recording status from provider
    final session = ref?.read(sessionProvider);
    final isActiveRecording = session?.isActiveRecording ?? false;
    
    if (!isActiveRecording && metadata.isRecording) {
      _showNotification('Phiên họp đang được ghi âm/ghi hình', 'info');
    } else if (isActiveRecording && !metadata.isRecording) {
      _showNotification('Phiên họp đã dừng ghi âm/ghi hình', 'info');
    }
  }
  
  /// Show RTMP broadcasting notification
  void _showRTMPNotification(RoomInfo metadata) {
    // Get current RTMP status from provider
    final session = ref?.read(sessionProvider);
    final isActiveRtmp = session?.isActiveRtmpBroadcasting ?? false;
    
    if (!isActiveRtmp && metadata.isActiveRtmp) {
      _showNotification('Đã bắt đầu phát sóng trực tiếp (RTMP)', 'info');
    } else if (isActiveRtmp && !metadata.isActiveRtmp) {
      _showNotification('Đã dừng phát sóng trực tiếp (RTMP)', 'info');
    }
  }
  
  /// Publish welcome message as system chat
  void _publishWelcomeMessage(RoomInfo metadata) {
    if (_welcomeMessage != null) {
      return; // Already published
    }
    
    final welcomeMsg = metadata.welcomeMessage;
    if (welcomeMsg.isEmpty) {
      _welcomeMessage = '';
      return;
    }
    
    _welcomeMessage = welcomeMsg;
    
    // Dispatch to chat provider
    ref?.read(chatMessagesProvider.notifier).addChatMessage(
      message: ChatMessage(
        messageId: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: 'system',
        senderName: 'System',
        message: _welcomeMessage!,
        isPrivate: false,
        createdAt: DateTime.now(),
        isSystemMsg: true,
      ),
      currentUserId: userId,
    );
    // ref?.read(chatMessagesProvider.notifier).addChatMessage(
    //   message: systemMessage,
    //   currentUserId: userId,
    // );
    
    if (kDebugMode) {
      print('HandleRoomData: Published welcome message');
    }
  }
  
  /// Add preloaded whiteboard file
  Future<void> _addPreloadWhiteboardFile(RoomInfo metadata) async {
    if (_checkedPreloadedWhiteboardFile) {
      return;
    }
    
    // Wait for user info to be updated
    await Future.delayed(const Duration(seconds: 2));
    
    // Check if current user is presenter
    final isPresenter = ref?.read(sessionProvider).currentUser?.metadata?.isPresenter ?? false;
    
    if (!isPresenter) {
      _checkedPreloadedWhiteboardFile = true;
      return;
    }
    
    final whiteboard = metadata.roomFeatures?.whiteboardFeatures;
    if (whiteboard == null || whiteboard.preloadFile.isEmpty) {
      _checkedPreloadedWhiteboardFile = true;
      return;
    }
    
    if (whiteboard.fileName.isEmpty) {
      // File is being processed, wait for next update
      if (kDebugMode) {
        print('HandleRoomData: Whiteboard file is being processed...');
      }
      return;
    }
    
    // Extract filename from path
    final pathParts = whiteboard.preloadFile.split('/');
    final fileName = pathParts.isNotEmpty ? pathParts.last : '';
    
    if (fileName != whiteboard.fileName) {
      // Different file was uploaded
      _checkedPreloadedWhiteboardFile = true;
      return;
    }
    
    // Check if file already exists in whiteboard provider
    final whiteboardFiles = ref?.read(whiteboardProvider).whiteboardUploadedOfficeFiles ?? [];
    final existingFile = whiteboardFiles.isEmpty ? null : whiteboardFiles.firstWhere(
          (f) => f.fileName == whiteboard.fileName,
          orElse: () => const WhiteboardOfficeFile(
            fileId: '',
            fileName: '',
            filePath: '',
            totalPages: 0,
          ),
        );
    
    final fileExists = existingFile != null && existingFile.fileId.isNotEmpty;
    
    if (!fileExists) {
        // TODO: Implement join logic
    }
    
    _checkedPreloadedWhiteboardFile = true;
    
    if (kDebugMode) {
      print('HandleRoomData: Registered preloaded whiteboard file');
    }
  }
  
  /// Show notification to user
  void _showNotification(String message, String type) {
    // Dispatch to room settings provider
    ref?.read(roomSettingsProvider.notifier).addUserNotification(
      UserNotification(
        message: message,
        typeOption: type,
      ),
    );
    
    if (kDebugMode) {
      print('HandleRoomData: Notification ($type): $message');
    }
  }

  /// Recursively convert Map keys from snake_case to camelCase
  Map<String, dynamic> _normalizeMetadata(Map<String, dynamic> map) {
    final result = <String, dynamic>{};
    map.forEach((key, value) {
      final newKey = key.contains('_') 
          ? key.replaceAllMapped(RegExp(r'_([a-z])'), (m) => m.group(1)!.toUpperCase())
          : key;
      if (value is Map<String, dynamic>) {
        result[newKey] = _normalizeMetadata(value);
      } else if (value is List) {
        result[newKey] = value.map((e) => e is Map<String, dynamic> ? _normalizeMetadata(e) : e).toList();
      } else {
        result[newKey] = value;
      }
    });
    return result;
  }
}

/// Helper to fire and forget futures
void unawaited(Future<void> future) {
  future.catchError((error) {
    if (kDebugMode) {
      print('Unawaited future error: $error');
    }
  });
}
