// ConnectNats - NATS Connection Manager
// This is a 1:1 clone of apps/meet/src/helpers/nats/ConnectNats.ts
// 
// Core responsibilities:
// - Manage NATS WebSocket connection
// - Handle JetStream subscriptions for room events
// - Handle Pub/Sub for real-time messages (chat, whiteboard, data channel)
// - Token renewal and keep-alive pings
// - E2EE encryption/decryption
// - Coordinate with LiveKit media connection
// - Dispatch events to handlers (room data, participants, chat, etc.)

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Protobuf models
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart' as nats_msg;
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_datamessage.pb.dart';

// Handlers
import 'handle_room_data.dart';
import 'handle_participants.dart';
import 'handle_chat.dart';
import 'handle_data_message.dart';
import 'handle_whiteboard.dart';
import 'handle_system_data.dart';
import 'message_queue.dart';

// LiveKit
import '../livekit/connect_livekit.dart';

// Constants matching web
const int kRenewTokenFrequent = 3 * 60 * 1000; // 3 minutes
const int kPingInterval = 10 * 1000; // 10 seconds
const int kStatusCheckerInterval = 500; // 500ms
const int kUsersSyncInterval = 30 * 1000; // 30 seconds

/// NATS connection manager
/// 
/// This class is a 1:1 clone of the web ConnectNats.ts class.
/// It manages the NATS connection, subscriptions, and message routing.
class ConnectNats {
  // NATS connection (will use nats package or WebSocket directly)
  dynamic _nc; // NatsConnection
  dynamic _js; // JetStreamClient
  
  // Connection config
  final List<String> _natsWSUrls;
  String _token;
  final String _roomId;
  final String _userId;
  String _userName = '';
  bool _isAdmin = false;
  bool _isRecorder = false;
  final String _roomStreamName;
  final nats_msg.NatsSubjects _subjects;
  
  // E2EE settings
  bool _enableE2EE = false;
  bool _enableE2EEChat = false;
  bool _enableE2EEWhiteboard = false;
  
  // Intervals
  Timer? _tokenRenewInterval;
  Timer? _pingInterval;
  Timer? _statusCheckerInterval;
  Timer? _reconciliationInterval;
  bool _isRoomReconnecting = false;
  

  // Callbacks (in Flutter, we use callbacks instead of React setState)
  final Function(String title, String message) _setErrorState;
  final Function(String status) _setRoomConnectionStatusState;
  final Function(dynamic liveKitConn) _setCurrentMediaServerConn;

  // LiveKit connection reference
  ConnectLivekit? _mediaServerConn;

  // Riverpod ref for state management
  final Ref ref;

  // Subjects (matching web's subjects structure)
  late final nats_msg.NatsSubjects _subjects;

  // Handlers (matching web's handler structure)
  late final MessageQueue messageQueue;
  late final HandleRoomData handleRoomData;
  late final HandleSystemData handleSystemData;
  late final HandleParticipants handleParticipants;
  late final HandleChat handleChat;
  late final HandleDataMessage handleDataMessage;
  late final HandleWhiteboard handleWhiteboard;

  // Connection state
  bool _isConnected = false;
  bool _isConnecting = false;

  // Callbacks (matching web's callbacks)
  Function(bool)? onConnectionStatusChange;
  Function(String)? onRenewToken;

  // Room info (cached, won't be updated)
  Map<String, dynamic>? _currentRoomInfo;

  ConnectNats({
    required List<String> natsWSUrls,
    required String token,
    required String roomId,
    required String userId,
    required String roomStreamName,
    required nats_msg.NatsSubjects subjects,
    required Function(String, String) setErrorState,
    required Function(String) setRoomConnectionStatusState,
    required Function(dynamic) setCurrentMediaServerConn,
    required this.ref, // Add ref parameter
  })  : _natsWSUrls = natsWSUrls,
        _token = token,
        _roomId = roomId,
        _userId = userId,
        _roomStreamName = roomStreamName,
        _subjects = subjects,
        _setErrorState = setErrorState,
        _setRoomConnectionStatusState = setRoomConnectionStatusState,
        _setCurrentMediaServerConn = setCurrentMediaServerConn {
    // Initialize handlers
  }
  
  // Getters
  bool get isAdmin => _isAdmin;
  String get roomId => _roomId;
  String get userId => _userId;
  String get userName => _userName;
  bool get isRecorder => _isRecorder;
  dynamic get mediaServerConn => _mediaServerConn;
  
  /// Open NATS connection
  /// Matches: openConn() in ConnectNats.ts
  Future<void> openConn() async {
    try {
      if (kDebugMode) {
        print('ConnectNats: Connecting to NATS servers: $_natsWSUrls');
      }
      
      // Connect to NATS with WebSocket and JWT token authentication
      _nc = await nats.Client().connect(
        _natsWSUrls.first, // dart_nats takes single URL
        connectionOptions: nats.ConnectionOptions(
          token: _token,
          verbose: kDebugMode,
          pedantic: false,
          reconnect: true,
          maxReconnectAttempts: 10,
          reconnectWait: const Duration(seconds: 2),
        ),
      );
      
      if (kDebugMode) {
        print('ConnectNats: Connected to NATS server');
      }
      
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Connection error: $e');
      }
      _setErrorState('Lỗi NATS', _formatNatsError(e));
      return;
    }
    
    _setRoomConnectionStatusState('receiving-data');
    _isRecorder = _isUserRecorder(userId);
    
    // Initialize JetStream
    _js = _nc.jetStream();
    messageQueue.setJs(_js);
    messageQueue.setIsConnected(true);
    
    // Update state: NATS connected
    // TODO: Dispatch to provider: updateIsNatsServerConnected(true)
    
    // Start monitoring
    unawaited(_monitorConnStatus());
    
    // Subscribe to streams
    unawaited(_subscribeToRoomEvents());
    unawaited(_subscribeToSystemPublicPubSub());
    unawaited(_subscribeToChat()); // Chat pub/sub
    unawaited(_subscribeToWhiteboard()); // Whiteboard pub/sub
    unawaited(_subscribeToDataChannel()); // Data channel pub/sub
    
    // Start intervals
    _startTokenRenewInterval();
    _startPingToServer();
    
    // Request initial data
    _sendMessageToSystemWorker(
      nats_msg.NatsMsgClientToServer(
        event: nats_msg.NatsMsgClientToServerEvents.REQ_INITIAL_DATA,
      ),
    );
  }
  
  /// End session and cleanup
  /// Matches: endSession() in ConnectNats.ts
  Future<void> endSession(String msg) async {
    // 1. Update UI immediately
    _setErrorState('Phòng bị ngắt kết nối', msg);
    messageQueue.setIsConnected(false);
    _setRoomConnectionStatusState('disconnected');
    
    // 2. Clear all intervals
    _tokenRenewInterval?.cancel();
    _pingInterval?.cancel();
    _reconciliationInterval?.cancel();
    _statusCheckerInterval?.cancel();
    handleParticipants.clearParticipantCounterInterval();
    
    // 3. Concurrent cleanup
    final cleanupFutures = <Future<void>>[];
    
    if (_mediaServerConn != null) {
      // cleanupFutures.add(_mediaServerConn.disconnectRoom(true));
    }
    
    if (_nc != null) {
      cleanupFutures.add(_nc.close());
    }
    
    // cleanupFutures.add(_deleteRoomDB());
    
    await Future.wait(cleanupFutures, eagerError: false);
    
    // 4. Final cleanup
    // destroyAudioManager();
    
    // 5. Post-session navigation (after delay)
    Future.delayed(const Duration(seconds: 3), () {
      final meta = _currentRoomInfo?['metadata'];
      if (meta?['isBreakoutRoom'] == true) {
        // In Flutter, we can't close window, so navigate back
        return;
      }
      
      final logoutUrl = meta?['logoutUrl'];
      if (logoutUrl != null && _isValidHttpUrl(logoutUrl)) {
        // Navigate to logout URL
      }
    });
  }
  
  /// Set error status
  /// Matches: setErrorStatus() in ConnectNats.ts
  void setErrorStatus(String title, String reason) {
    _setRoomConnectionStatusState('error');
    _setErrorState(title, reason);
  }
  
  /// Set media server connection (LiveKit)
  /// Matches: setMediaServerConn() in ConnectNats.ts
  void setMediaServerConn(ConnectLivekit conn) {
    _mediaServerConn = conn;
    _setCurrentMediaServerConn(conn);
    
    if (kDebugMode) {
      print('ConnectNats: LiveKit connection set');
    }
  }
  
  /// Get media server connection
  ConnectLivekit? getMediaServerConn() {
    return _mediaServerConn;
  }
  
  /// Monitor connection status
  /// Matches: monitorConnStatus() in ConnectNats.ts
  Future<void> _monitorConnStatus() async {
    if (_nc == null) return;
    
    // Start status checker interval
    _statusCheckerInterval = Timer.periodic(
      const Duration(milliseconds: kStatusCheckerInterval),
      (_) {
        if (_nc?.isClosed() == true) {
          messageQueue.setIsConnected(false);
          unawaited(endSession('Lỗi mạng - Phòng bị ngắt kết nối'));
          
          _statusCheckerInterval?.cancel();
          _statusCheckerInterval = null;
          _isRoomReconnecting = false;
        }
      },
    );
    
    // Listen to connection status changes
    _nc.statusStream?.listen((status) {
      if (kDebugMode) {
        print('ConnectNats: Status changed - $status');
      }
      
      switch (status) {
        case nats.Status.disconnected:
        case nats.Status.closed:
          // TODO: Dispatch updateIsNatsServerConnected(false)
          messageQueue.setIsConnected(false);
          break;
          
        case nats.Status.reconnecting:
          if (!_isRoomReconnecting) {
            // TODO: Show toast "Mất kết nối - Đang kết nối lại"
            _isRoomReconnecting = true;
          }
          break;
          
        case nats.Status.connected:
          if (_isRoomReconnecting) {
            // TODO: Dismiss toast
            _isRoomReconnecting = false;
          }
          // TODO: Dispatch updateIsNatsServerConnected(true)
          messageQueue.setIsConnected(true);
          break;
      }
    });
  }
  
  /// Subscribe to room events (JetStream)
  /// Matches: subscribeToRoomEvents() in ConnectNats.ts
  Future<void> _subscribeToRoomEvents() async {
    if (_js == null) return;
    
    try {
      final consumerName = '${_roomId}_$_userId';
      
      // Get or create consumer
      final consumer = await _js.consumer(
        stream: _roomStreamName,
        consumer: consumerName,
      );
      
      // Subscribe to messages
      await for (final msg in consumer.messages()) {
        try {
          // Parse protobuf message
          final payload = nats_msg.NatsMsgServerToClient.fromBuffer(msg.data);
          
          // Handle session ended early
          if (payload.event == nats_msg.NatsMsgServerToClientEvents.SESSION_ENDED) {
            msg.ack();
          }
          
          // Route to handler
          await _handleSystemEvents(payload);
          
          // Acknowledge message
          msg.ack();
        } catch (e) {
          if (kDebugMode) {
            print('ConnectNats: Error processing room event - $e');
          }
          msg.nak();
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Error subscribing to room events - $e');
      }
    }
  }
  
  /// Subscribe to system public pub/sub
  /// Matches: subscribeToSystemPublicPubSub() in ConnectNats.ts
  Future<void> _subscribeToSystemPublicPubSub() async {
    if (_nc == null) return;
    
    try {
      // Subscribe to system public subject
      final systemSubject = _subjects.systemPublic;
      final sub = _nc.subscribe(systemSubject);
      
      await for (final msg in sub.stream) {
        try {
          // Parse protobuf message
          final payload = nats_msg.NatsMsgServerToClient.fromBuffer(msg.data);
          
          // Route to handler
          await _handleSystemEvents(payload);
        } catch (e) {
          if (kDebugMode) {
            print('ConnectNats: Error processing system event - $e');
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Error subscribing to system pub/sub - $e');
      }
    }
  }
  
  /// Handle system events
  /// Routes events to appropriate handlers
  Future<void> _handleSystemEvents(nats_msg.NatsMsgServerToClient payload) async {
    switch (payload.event) {
      case nats_msg.NatsMsgServerToClientEvents.INITIAL_DATA:
        _handleInitialData(payload);
        break;
        
      case nats_msg.NatsMsgServerToClientEvents.ROOM_METADATA_UPDATED:
        handleRoomData.handleRoomMetadataUpdate(payload.roomInfo!);
        break;
        
      case nats_msg.NatsMsgServerToClientEvents.USER_JOINED:
        handleParticipants.handleUserJoined(payload.userInfo!);
        break;
        
      case nats_msg.NatsMsgServerToClientEvents.USER_LEFT:
        handleParticipants.handleUserLeft(payload.userId);
        break;
        
      case nats_msg.NatsMsgServerToClientEvents.USER_METADATA_UPDATED:
        handleParticipants.handleUserMetadataUpdate(payload.userInfo!);
        break;
        
      case nats_msg.NatsMsgServerToClientEvents.SESSION_ENDED:
        await endSession(payload.msg);
        break;
        
      default:
        if (kDebugMode) {
          print('ConnectNats: Unhandled event ${payload.event}');
        }
    }
  }
  
  /// Handle initial data
  void _handleInitialData(nats_msg.NatsMsgServerToClient payload) {
    if (kDebugMode) {
      print('ConnectNats: Received initial data');
    }
    
    // Parse initial data
    final initialData = payload.initialData;
    if (initialData == null) return;
    
    // Set current user info
    _userName = initialData.currentUser?.name ?? '';
    _isAdmin = initialData.currentUser?.metadata?.isAdmin ?? false;
    
    // Store room info
    _currentRoomInfo = {
      'roomId': _roomId,
      'metadata': initialData.roomInfo?.toProto3Json(),
    };
    
    // Enable E2EE if configured
    final e2eeFeatures = initialData.roomInfo?.roomFeatures?.endToEndEncryptionFeatures;
    if (e2eeFeatures != null) {
      _enableE2EE = e2eeFeatures.isEnabled;
      _enableE2EEChat = e2eeFeatures.includedChatMessages;
      _enableE2EEWhiteboard = e2eeFeatures.includedWhiteboard;
    }
    
    // TODO: Update providers with initial data
    // - Session provider: room info, user info
    // - Participant provider: initial participants
    // - Chat provider: load chat history
  }
  
  /// Start token renewal interval
  /// Matches: startTokenRenewInterval() in ConnectNats.ts
  void _startTokenRenewInterval() {
    _tokenRenewInterval = Timer.periodic(
      const Duration(milliseconds: kRenewTokenFrequent),
      (_) => _renewToken(),
    );
  }
  
  /// Renew JWT token
  Future<void> _renewToken() async {
    try {
      // TODO: Call API to get new token
      // final newToken = await _apiService.renewToken();
      // _token = newToken;
      
      if (kDebugMode) {
        print('ConnectNats: Token renewal triggered');
      }
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Token renewal failed - $e');
      }
    }
  }
  
  /// Start ping to server
  /// Matches: startPingToServer() in ConnectNats.ts
  void _startPingToServer() {
    _pingInterval = Timer.periodic(
      const Duration(milliseconds: kPingInterval),
      (_) => _ping(),
    );
  }
  
  /// Send ping to server
  void _ping() {
    try {
      _sendMessageToSystemWorker(
        nats_msg.NatsMsgClientToServer(
          event: nats_msg.NatsMsgClientToServerEvents.PING,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Ping failed - $e');
      }
    }
  }
  
  /// Send message to system worker
  /// Matches: sendMessageToSystemWorker() in ConnectNats.ts
  void _sendMessageToSystemWorker(nats_msg.NatsMsgClientToServer msg) {
    if (_nc == null) return;
    
    try {
      final subject = _subjects.systemWorker;
      final data = msg.writeToBuffer();
      
      _nc.publish(subject, data);
      
      if (kDebugMode) {
        print('ConnectNats: Sent message to system worker - ${msg.event}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Failed to send message - $e');
      }
    }
  }
  
  // ============================================================================
  // CHAT SYSTEM
  // ============================================================================
  
  /// Subscribe to chat pub/sub channel
  /// Matches: subscribeToChat() in ConnectNats.ts
  Future<void> _subscribeToChat() async {
    if (_nc == null) return;
    
    try {
      final subject = '${_subjects.chat}.$_roomId';
      final sub = _nc.subscribe(subject);
      
      // Request chat data from donors (users who have chat history)
      final donors = await _getChatDonors();
      for (final donor in donors) {
        await sendDataMessage(
          type: 'REQ_PUBLIC_CHAT_DATA',
          msg: '',
          toUserId: donor['userId'],
        );
      }
      
      // Listen for chat messages
      await for (final msg in sub.stream) {
        await _processToHandleChatMsg(msg.data);
      }
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Error subscribing to chat - $e');
      }
    }
  }
  
  /// Process incoming chat message
  /// Matches: processToHandleChatMsg() in ConnectNats.ts
  Future<void> _processToHandleChatMsg(Uint8List data) async {
    Uint8List dataToParse = data;
    
    // Decrypt if E2EE is enabled for chat
    if (_enableE2EEChat) {
      final decrypted = await _decryptData(dataToParse);
      if (decrypted == null) {
        return; // Decryption failed
      }
      dataToParse = decrypted;
    }
    
    // Parse protobuf message
    final payload = ChatMessage.fromBuffer(dataToParse);
    
    // Pass to handler
    await handleChat.handleMsg(payload);
  }
  
  /// Send chat message (public or private)
  /// Matches: sendChatMsg() in ConnectNats.ts
  Future<void> sendChatMsg({
    required String to,
    required String message,
  }) async {
    if (_nc == null) return;
    
    final isPrivate = to != 'public';
    
    // Create chat message
    final chatMessage = ChatMessage(
      id: _randomString(),
      fromName: _userName,
      fromUserId: _userId,
      sentAt: DateTime.now().millisecondsSinceEpoch.toString(),
      toUserId: isPrivate ? to : '',
      isPrivate: isPrivate,
      message: message,
      fromAdmin: _isAdmin,
    );
    
    // Handle chat translation if enabled
    await _handleChatTranslation(chatMessage);
    
    // Serialize to protobuf
    Uint8List payload = chatMessage.writeToBuffer();
    
    // Encrypt if E2EE is enabled for chat
    if (_enableE2EEChat) {
      final encrypted = await _encryptData(payload);
      if (encrypted == null) {
        return; // Encryption failed
      }
      payload = encrypted;
    }
    
    // Send message
    if (isPrivate) {
      _sendPrivateData(
        payload: payload,
        type: 'CHAT',
        toUserId: to,
        echoToSender: true,
      );
    } else {
      final subject = '${_subjects.chat}.$_roomId';
      _nc.publish(subject, payload);
    }
    
    // Send analytics
    _sendAnalyticsData(
      event: isPrivate ? 'ANALYTICS_EVENT_USER_PRIVATE_CHAT' : 'ANALYTICS_EVENT_USER_PUBLIC_CHAT',
      type: 'USER',
      value: '1',
    );
  }
  
  /// Handle chat translation
  Future<void> _handleChatTranslation(ChatMessage chatMessage) async {
    // TODO: Implement chat translation
    // Check if translation is enabled in room features
    // Get selected translation language
    // Call translation API
    // Update chatMessage.sourceLang and chatMessage.translations
  }
  
  /// Send private data (chat or data message)
  /// Matches: sendPrivateData() in ConnectNats.ts
  void _sendPrivateData({
    required Uint8List payload,
    required String type,
    required String toUserId,
    required bool echoToSender,
  }) {
    // Create private data delivery header
    final header = {
      'toUserId': toUserId,
      'echoToSender': echoToSender,
      'type': type,
    };
    
    _sendMessageToSystemWorker(
      nats_msg.NatsMsgClientToServer(
        event: nats_msg.NatsMsgClientToServerEvents.REQ_PRIVATE_DATA_DELIVERY,
        msg: jsonEncode(header),
        binMsg: payload,
      ),
    );
  }
  
  /// Handle private data delivery
  /// Matches: handlePrivateDataDelivery() in ConnectNats.ts
  Future<void> _handlePrivateDataDelivery(nats_msg.NatsMsgServerToClient p) async {
    final header = jsonDecode(p.msg) as Map<String, dynamic>;
    final type = header['type'] as String;
    
    if (type == 'CHAT') {
      await _processToHandleChatMsg(p.binMsg);
    } else if (type == 'DATA_MSG') {
      await _processToHandleDataMsg(p.binMsg);
    }
  }
  
  // ============================================================================
  // E2EE ENCRYPTION/DECRYPTION
  // ============================================================================
  
  /// Encrypt data using AES-GCM
  /// Matches: encryptData() in ConnectNats.ts
  Future<Uint8List?> _encryptData(Uint8List payload) async {
    try {
      // TODO: Implement AES-GCM encryption
      // Use crypto package or pointycastle
      // Get encryption key from key manager
      // Encrypt payload
      // Return encrypted data
      
      if (kDebugMode) {
        print('ConnectNats: Encrypting data (${payload.length} bytes)');
      }
      
      // For now, return unencrypted (will implement crypto later)
      return payload;
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Encryption error - $e');
      }
      // TODO: Show user notification
      return null;
    }
  }
  
  /// Decrypt data using AES-GCM
  /// Matches: decryptData() in ConnectNats.ts
  Future<Uint8List?> _decryptData(Uint8List payload) async {
    try {
      // TODO: Implement AES-GCM decryption
      // Use crypto package or pointycastle
      // Get decryption key from key manager
      // Decrypt payload
      // Return decrypted data
      
      if (kDebugMode) {
        print('ConnectNats: Decrypting data (${payload.length} bytes)');
      }
      
      // For now, return unencrypted (will implement crypto later)
      return payload;
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Decryption error - $e');
      }
      // TODO: Show user notification
      return null;
    }
  }
  
  // ============================================================================
  // WHITEBOARD SYSTEM
  // ============================================================================
  
  /// Subscribe to whiteboard pub/sub channel
  /// Matches: subscribeToWhiteboard() in ConnectNats.ts
  Future<void> _subscribeToWhiteboard() async {
    if (_nc == null) return;
    
    try {
      final subject = '${_subjects.whiteboard}.$_roomId';
      final sub = _nc.subscribe(subject);
      
      // Request whiteboard data from donors (users who have whiteboard state)
      final donors = await _getWhiteboardDonors();
      for (final donor in donors) {
        await sendDataMessage(
          type: 'REQ_FULL_WHITEBOARD_DATA',
          msg: '',
          toUserId: donor['userId'],
        );
      }
      
      // Listen for whiteboard messages
      await for (final msg in sub.stream) {
        Uint8List dataToParse = msg.data;
        
        // Decrypt if E2EE is enabled for whiteboard
        if (_enableE2EEWhiteboard) {
          final decrypted = await _decryptData(dataToParse);
          if (decrypted == null) {
            continue; // Skip if decryption fails
          }
          dataToParse = decrypted;
        }
        
        // Parse protobuf message
        final payload = DataChannelMessage.fromBuffer(dataToParse);
        
        // Avoid echo - don't process our own messages
        if (payload.fromUserId != _userId) {
          await handleWhiteboard.handleWhiteboardMsg(payload);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Error subscribing to whiteboard - $e');
      }
    }
  }
  
  /// Send whiteboard data
  /// Matches: sendWhiteboardData() in ConnectNats.ts
  Future<void> sendWhiteboardData({
    required String type,
    required String message,
    String? toUserId,
  }) async {
    if (_nc == null) {
      if (kDebugMode) {
        print('ConnectNats: NATS connection not available to send whiteboard data');
      }
      return;
    }
    
    // Create data channel message
    final data = DataChannelMessage(
      type: _parseDataMsgBodyType(type),
      fromUserId: _userId,
      toUserId: toUserId ?? '',
      message: message,
    );
    
    // Serialize to protobuf
    Uint8List payload = data.writeToBuffer();
    
    // Encrypt if E2EE is enabled for whiteboard
    if (_enableE2EEWhiteboard) {
      final encrypted = await _encryptData(payload);
      if (encrypted == null) {
        return; // Don't send if encryption fails
      }
      payload = encrypted;
    }
    
    // Publish to whiteboard channel
    final subject = '${_subjects.whiteboard}.$_roomId';
    _nc.publish(subject, payload);
    
    if (kDebugMode) {
      print('ConnectNats: Sent whiteboard data - $type');
    }
  }
  
  /// Get whiteboard donors (users with whiteboard state)
  Future<List<Map<String, dynamic>>> _getWhiteboardDonors() async {
    // TODO: Get from local storage or provider
    return [];
  }
  
  // ============================================================================
  // DATA CHANNEL (for raise hand, polls, etc.)
  // ============================================================================
  
  /// Subscribe to data channel pub/sub
  /// Matches: subscribeToDataChannel() in ConnectNats.ts
  Future<void> _subscribeToDataChannel() async {
    if (_nc == null) return;
    
    try {
      final subject = '${_subjects.dataChannel}.$_roomId';
      final sub = _nc.subscribe(subject);
      
      // Listen for data channel messages
      await for (final msg in sub.stream) {
        await _processToHandleDataMsg(msg.data);
      }
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Error subscribing to data channel - $e');
      }
    }
  }
  
  /// Process incoming data channel message
  /// Matches: processToHandleDataMsg() in ConnectNats.ts
  Future<void> _processToHandleDataMsg(Uint8List data) async {
    Uint8List dataToParse = data;
    
    // Decrypt if E2EE is enabled
    if (_enableE2EE) {
      final decrypted = await _decryptData(dataToParse);
      if (decrypted == null) {
        return; // Decryption failed
      }
      dataToParse = decrypted;
    }
    
    // Parse protobuf message
    final payload = DataChannelMessage.fromBuffer(dataToParse);
    
    // Don't process our own messages or private messages for others
    if (payload.fromUserId == _userId ||
        (payload.toUserId.isNotEmpty && payload.toUserId != _userId)) {
      return;
    }
    
    // All other messages are for us
    await handleDataMsg.handleMessage(payload);
  }
  
  /// Send data message (mostly client-to-client communication)
  /// Matches: sendDataMessage() in ConnectNats.ts
  Future<void> sendDataMessage({
    required String type,
    required String msg,
    String? toUserId,
  }) async {
    if (_nc == null) {
      if (kDebugMode) {
        print('ConnectNats: NATS connection not available to send data message');
      }
      return;
    }
    
    // Create data channel message
    final data = DataChannelMessage(
      type: _parseDataMsgBodyType(type),
      fromUserId: _userId,
      toUserId: toUserId ?? '',
      message: msg,
    );
    
    // Serialize to protobuf
    Uint8List payload = data.writeToBuffer();
    
    // Encrypt if E2EE is enabled
    if (_enableE2EE) {
      final encrypted = await _encryptData(payload);
      if (encrypted == null) {
        return; // Don't send if encryption fails
      }
      payload = encrypted;
    }
    
    // Send message
    if (toUserId != null && toUserId.isNotEmpty) {
      // Private message
      _sendPrivateData(
        payload: payload,
        type: 'DATA_MSG',
        toUserId: toUserId,
        echoToSender: false,
      );
    } else {
      // Public message
      final subject = '${_subjects.dataChannel}.$_roomId';
      _nc.publish(subject, payload);
    }
    
    if (kDebugMode) {
      print('ConnectNats: Sent data message - $type');
    }
  }
  
  // ============================================================================
  // ANALYTICS
  // ============================================================================
  
  /// Send analytics data
  /// Matches: sendAnalyticsData() in ConnectNats.ts
  void _sendAnalyticsData({
    required String event,
    required String type,
    required String value,
  }) {
    // TODO: Implement analytics tracking
    if (kDebugMode) {
      print('ConnectNats: Analytics - $event ($type): $value');
    }
  }
  
  // ============================================================================
  // HELPER METHODS
  // ============================================================================
  
  /// Get chat donors (users with chat history)
  Future<List<Map<String, dynamic>>> _getChatDonors() async {
    // TODO: Get from local storage or provider
    return [];
  }
  
  /// Generate random string for message IDs
  String _randomString() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = DateTime.now().millisecondsSinceEpoch;
    return List.generate(16, (i) => chars[(random + i) % chars.length]).join();
  }
  
  /// Parse DataMsgBodyType from string
  DataMsgBodyType _parseDataMsgBodyType(String type) {
    switch (type) {
      case 'SCENE_UPDATE':
        return DataMsgBodyType.SCENE_UPDATE;
      case 'POINTER_UPDATE':
        return DataMsgBodyType.POINTER_UPDATE;
      case 'PAGE_CHANGE':
        return DataMsgBodyType.PAGE_CHANGE;
      case 'FILE_CHANGE':
        return DataMsgBodyType.FILE_CHANGE;
      case 'UPDATE_CURRENT_OFFICE_FILE_PAGES':
        return DataMsgBodyType.UPDATE_CURRENT_OFFICE_FILE_PAGES;
      case 'WHITEBOARD_APP_STATE_CHANGE':
        return DataMsgBodyType.WHITEBOARD_APP_STATE_CHANGE;
      case 'WHITEBOARD_RESET':
        return DataMsgBodyType.WHITEBOARD_RESET;
      case 'REQ_FULL_WHITEBOARD_DATA':
        return DataMsgBodyType.REQ_FULL_WHITEBOARD_DATA;
      case 'REQ_PUBLIC_CHAT_DATA':
        return DataMsgBodyType.REQ_PUBLIC_CHAT_DATA;
      case 'RAISE_HAND':
        return DataMsgBodyType.RAISE_HAND;
      case 'OTHER_USER_LOWER_HAND':
        return DataMsgBodyType.OTHER_USER_LOWER_HAND;
      default:
        return DataMsgBodyType.SCENE_UPDATE;
    }
  }
  
  // Helper methods
  
  String _formatNatsError(dynamic error) {
    // TODO: Format NATS error for display
    return error.toString();
  }
  
  bool _isUserRecorder(String userId) {
    // Check if user is a recorder bot
    return userId.startsWith('RECORDER_BOT');
  }
  
  bool _isValidHttpUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.scheme == 'http' || uri.scheme == 'https';
    } catch (e) {
      return false;
    }
  }
}

/// Helper to fire and forget futures
void unawaited(Future<void> future) {
  // Ignore future, but log errors
  future.catchError((error) {
    if (kDebugMode) {
      print('Unawaited future error: $error');
    }
  });
}
