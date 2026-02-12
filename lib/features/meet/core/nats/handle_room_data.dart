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
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';

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
  Future<Map<String, dynamic>> setRoomInfo(RoomInfo info) async {
    _currentRoom = {
      'roomId': info.roomId,
      'sid': info.roomSid,
      'metadata': null,
    };
    
    // Dispatch to session provider
    ref?.read(sessionProvider.notifier).addCurrentRoom(
      CurrentRoom(
        sid: info.roomSid,
        roomId: info.roomId,
        metadata: info,
      ),
    );
    
    await handleRoomMetadataUpdate(info);
    
    return _currentRoom!;
  }
  
  /// Handle room metadata update
  /// Matches: updateRoomMetadata() in HandleRoomData.ts
  Future<void> handleRoomMetadataUpdate(RoomInfo roomInfo) async {
    try {
      final metadata = roomInfo;
      
      // Check if metadata actually changed
      if (_currentRoom?['metadata'] == null ||
          _currentRoom?['metadata']['metadataId'] != metadata.metadataId) {
        _currentRoom?['metadata'] = metadata.toProto3Json();
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
    final isActiveRecording = ref?.read(sessionProvider).isActiveRecording ?? false;
    // final isActiveRecording = ref?.read(sessionProvider).isActiveRecording ?? false;
    final isActiveRecording = false; // Placeholder
    
    // Avoid notification if user is recorder
    // Check if current user is recorder
    final isRecorder = ref?.read(sessionProvider).currentUser?.isRecorder ?? false;
    // if (ref?.read(sessionProvider).currentUser?.isRecorder ?? false) {
    //   return;
    // }
    
    if (!isActiveRecording && metadata.isRecording) {
      _showNotification('Phiên họp đang được ghi âm/ghi hình', 'info');
    } else if (isActiveRecording && !metadata.isRecording) {
      _showNotification('Phiên họp đã dừng ghi âm/ghi hình', 'info');
    }
  }
  
  /// Show RTMP broadcasting notification
  void _showRTMPNotification(RoomInfo metadata) {
    // Get current RTMP status from provider
    final isActiveRtmp = ref?.read(sessionProvider).isActiveRtmpBroadcasting;
    // final isActiveRtmp = ref?.read(sessionProvider).isActiveRtmpBroadcasting ?? false;
    final isActiveRtmp = false; // Placeholder
    
    // Avoid notification if user is recorder
    // Check if current user is recorder
    final isRecorder = ref?.read(sessionProvider).currentUser?.isRecorder ?? false;
    // if (ref?.read(sessionProvider).currentUser?.isRecorder ?? false) {
    //   return;
    // }
    
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
    
    // Create system chat message
    final systemMessage = ChatMessage(
      id: '1',
      sentAt: '1', // To make sure it's always on top
      isPrivate: false,
      fromName: 'system',
      fromUserId: 'system',
      message: _welcomeMessage!,
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
    // final isPresenter = ref?.read(sessionProvider).currentUser?.metadata?.isPresenter ?? false;
    final isPresenter = false; // Placeholder
    
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
    final existingFile = ref?.read(whiteboardProvider).whiteboardOfficeFiles
        .firstWhere(
          (f) => f.fileId == file.fileId,
          orElse: () => WhiteboardOfficeFile(
            fileId: '',
            fileName: '',
            filePath: '',
            currentPage: 0,
            totalPages: 0,
            isActive: false,
          ),
        );
    final fileExists = existingFile?.fileId.isNotEmpty ?? false;
    // final whiteboardFiles = ref?.read(whiteboardProvider).whiteboardUploadedOfficeFiles ?? [];
    // final exists = whiteboardFiles.any((f) => f.fileId == whiteboard.whiteboardFileId);
    
    // if (!exists) {
    //   final file = {
    //     'status': true,
    //     'msg': '',
    //     'fileId': whiteboard.whiteboardFileId,
    //     'fileName': whiteboard.fileName,
    //     'filePath': whiteboard.filePath,
    //     'totalPages': whiteboard.totalPages,
    //   };
    //   // Create and register office file
    //   ref?.read(whiteboardProvider.notifier).createAndRegisterOfficeFile(file);
    // }
    
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
        message: msg.message,
        typeOption: msg.type.name.toLowerCase(),
      ),
    );
    // ref?.read(roomSettingsProvider.notifier).addUserNotification(
    //   message: message,
    //   typeOption: type,
    // );
    
    if (kDebugMode) {
      print('HandleRoomData: Notification ($type): $message');
    }
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
