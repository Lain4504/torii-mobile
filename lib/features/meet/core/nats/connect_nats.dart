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
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dart_nats/dart_nats.dart' as nats;
import 'package:fixnum/fixnum.dart';

// Protobuf models
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart' as nats_msg;
import 'package:torii_app/features/meet/data/models/proto/wajlc_datamessage.pb.dart' as data_msg;
import 'package:torii_app/features/meet/data/models/proto/wajlc_analytics.pb.dart' as analytics;
import 'package:torii_app/features/meet/data/models/proto/wajlc_insights.pb.dart' as insights;

// Handlers
import 'handle_room_data.dart';
import 'handle_participants.dart';
import 'handle_chat.dart';
import 'handle_data_message.dart';
import 'handle_whiteboard.dart';
import 'handle_system_data.dart';
import 'message_queue.dart';

// LiveKit
// LiveKit
import '../livekit/connect_livekit.dart';

// Providers
import '../../providers/session_provider.dart';
import '../../providers/participant_provider.dart';
import '../../providers/whiteboard_provider.dart';
import '../../providers/room_settings_provider.dart';
import '../../data/datasources/meet_api_service.dart';

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
  // NATS connection (dart_nats Client - no JetStream API, we use raw request for pull)
  dynamic _nc; // nats.Client
  
  // Connection config
  final List<String> _natsWSUrls;
  /// Mutable: updated when server sends RESP_RENEW_WAJLC_TOKEN (matches web).
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
  Timer? _whiteboardFullSceneRetryTimer;
  bool _isRoomReconnecting = false;
  

  // Callbacks (in Flutter, we use callbacks instead of React setState)
  final Function(String title, String message) _setErrorState;
  final Function(String status) _setRoomConnectionStatusState;
  final Function(dynamic liveKitConn) _setCurrentMediaServerConn;

  // LiveKit connection reference
  ConnectLivekit? _mediaServerConn;

  // Riverpod ref for state management
  final Ref ref;

  /// SESSION_ENDED / NATS đóng: sau [endSession] gọi để pop khỏi `/meet` (web: ErrorPage).
  final void Function()? onRemoteSessionEnded;

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
  DateTime _lastInboundAt = DateTime.now();

  // Callbacks (matching web's callbacks)
  Function(bool)? onConnectionStatusChange;
  Function(String)? onRenewToken;

  // Room info (cached, won't be updated)
  Map<String, dynamic>? _currentRoomInfo;

  /// Web: finalizeAppConn only after landing + not waitForApproval. Mobile defers
  /// REQ_JOINED_USERS_LIST until approval when user is in waiting room.
  bool _pendingFinalizeAfterWaitingRoom = false;
  bool _finalizeAppConnCompleted = false;
  bool _isLocalUserWaitingForApproval = false;

  /// Chat / whiteboard / data channel — web subscribes in onAfterUserReady only.
  bool _realtimeChannelsStarted = false;

  /// JetStream pull và systemPublic pub/sub đều có thể gửi cùng một [RES_MEDIA_SERVER_DATA].
  /// Gọi [initializeConnection] song song trên cùng một [Room] làm WebRTC đóng (CLOSED) + lỗi publish.
  Future<void> _mediaServerInitGate = Future.value();

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
    required this.ref,
    this.onRemoteSessionEnded,
  })  : _natsWSUrls = natsWSUrls,
        _token = token,
        _roomId = roomId,
        _userId = userId,
        _roomStreamName = roomStreamName,
        _subjects = subjects,
        _setErrorState = setErrorState,
        _setRoomConnectionStatusState = setRoomConnectionStatusState,
        _setCurrentMediaServerConn = setCurrentMediaServerConn {
    // Initialize handlers (must be in body - some need 'this')
    messageQueue = MessageQueue();
    handleRoomData = HandleRoomData(roomId: _roomId, userId: _userId, ref: ref);
    handleSystemData = HandleSystemData(userId: _userId, ref: ref);
    handleParticipants = HandleParticipants(connectNats: this, ref: ref);
    handleChat = HandleChat(connectNats: this, ref: ref);
    handleDataMessage = HandleDataMessage(connectNats: this, ref: ref);
    handleWhiteboard = HandleWhiteboard(ref: ref);
  }
  
  // Getters
  bool get isAdmin => _isAdmin;
  bool get isConnected => _isConnected;
  DateTime get lastInboundAt => _lastInboundAt;
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
      _nc = nats.Client();
      await _nc.connect(
        Uri.parse(_natsWSUrls.first),
        connectOption: nats.ConnectOption(authToken: _token),
      );
      
      // Send CONNECT message with token if needed or use it in URI
      // Note: dart_nats might use different way to pass token for WS
      // Usually it's in the URI or as a separate CONNECT message.
      // For now, let's assume URI parsing or default behavior.
      
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
    
    _isConnected = true;
    _lastInboundAt = DateTime.now();
    _setRoomConnectionStatusState('receiving-data');
    _isRecorder = _isUserRecorder(userId);
    
    // dart_nats Client has no jetStream() - use manual JetStream pull via request()
    messageQueue.setJs(null); // MessageQueue not used for JS publish; system worker uses _nc.pub
    messageQueue.setIsConnected(true);
    
    // Update state: NATS connected
    // Update state: NATS connected
    ref.read(sessionProvider.notifier).updateIsNatsServerConnected(true);
    
    // Start monitoring
    unawaited(_monitorConnStatus());
    
    // Subscribe to streams
    unawaited(_subscribeToRoomEvents());
    unawaited(_subscribeToSystemPublicPubSub());
    // Chat / whiteboard / data channel: web starts these in onAfterUserReady only
    // (after RES_JOINED_USERS_LIST + REQ_MEDIA_SERVER_DATA path).
    
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
  ///
  /// [userInitiatedLeave]: người dùng chủ động rời / host đã xử lý xong — không bật snack lỗi
  /// (tránh gọi [setErrorState] khi [JoinMeetingScreen] đã dispose).
  Future<void> endSession(String msg, {bool userInitiatedLeave = false}) async {
    // 1. Update UI immediately
    _isConnected = false;
    if (!userInitiatedLeave) {
      _setErrorState('Phòng bị ngắt kết nối', msg);
    }
    messageQueue.setIsConnected(false);
    _setRoomConnectionStatusState('disconnected');
    
    // 2. Clear all intervals
    _tokenRenewInterval?.cancel();
    _pingInterval?.cancel();
    _reconciliationInterval?.cancel();
    _statusCheckerInterval?.cancel();
    _whiteboardFullSceneRetryTimer?.cancel();
    _whiteboardFullSceneRetryTimer = null;
    handleParticipants.clearParticipantCounterInterval();
    
    // 3. Concurrent cleanup
    final cleanupFutures = <Future<void>>[];
    
    if (_mediaServerConn != null) {
      cleanupFutures.add(_mediaServerConn!.disconnectRoom(true));
    }
    
    if (_nc != null) {
      cleanupFutures.add(_nc.close());
    }
    
    // cleanupFutures.add(_deleteRoomDB());
    
    try {
      await Future.wait(cleanupFutures, eagerError: false);
    } finally {
      if (!userInitiatedLeave && onRemoteSessionEnded != null) {
        onRemoteSessionEnded!();
      }
      ref.read(sessionProvider.notifier).absorbRemoteSessionEnd();
    }

    // Post-session: web dùng logoutUrl / đóng breakout — mobile xử lý trong callback pop.
    Future.delayed(const Duration(seconds: 3), () {
      final meta = _currentRoomInfo?['metadata'];
      if (meta?['isBreakoutRoom'] == true) {
        return;
      }

      final logoutUrl = meta?['logoutUrl'];
      if (logoutUrl != null && _isValidHttpUrl(logoutUrl)) {
        // Có thể mở URL bằng url_launcher khi cần.
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
        if (_nc != null &&
            (_nc.status == nats.Status.closed ||
                _nc.status == nats.Status.disconnected)) {
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
          ref.read(sessionProvider.notifier).updateIsNatsServerConnected(false);
          messageQueue.setIsConnected(false);
          break;
          
        case nats.Status.reconnecting:
          if (!_isRoomReconnecting) {
            ref.read(roomSettingsProvider.notifier).addUserNotification(
              const UserNotification(
                message: 'Mất kết nối - Đang kết nối lại',
                typeOption: 'warning',
              ),
            );
            _isRoomReconnecting = true;
          }
          break;
          
        case nats.Status.connected:
          if (_isRoomReconnecting) {
            ref.read(roomSettingsProvider.notifier).addUserNotification(
              const UserNotification(
                message: 'Đã kết nối lại',
                typeOption: 'info',
              ),
            );
            _isRoomReconnecting = false;
          }
          ref.read(sessionProvider.notifier).updateIsNatsServerConnected(true);
          messageQueue.setIsConnected(true);
          break;
      }
    });
  }
  
  /// Subscribe to room events (JetStream pull)
  /// dart_nats has no jetStream() - use raw $JS.API.CONSUMER.MSG.NEXT request loop
  Future<void> _subscribeToRoomEvents() async {
    if (_nc == null || _roomStreamName.isEmpty) return;

    final consumerName = '${_roomId}_$_userId';
    final subject = r'$JS.API.CONSUMER.MSG.NEXT.' '$_roomStreamName.$consumerName';
    final batchReq = utf8.encode('{"batch":1}');

    while (_isConnected && _nc != null) {
      try {
        final msg = await _nc!.request(
          subject,
          Uint8List.fromList(batchReq),
          timeout: const Duration(seconds: 30),
        );
        _lastInboundAt = DateTime.now();
        try {
          final payload = nats_msg.NatsMsgServerToClient.fromBuffer(msg.data);
          await _handleSystemEvents(payload);
          // Ack: publish empty to reply subject
          if (msg.replyTo != null && msg.replyTo!.isNotEmpty) {
            await _nc!.pub(msg.replyTo!, Uint8List(0));
          }
        } catch (e) {
          if (kDebugMode) {
            debugPrint('ConnectNats: Error processing room event - $e');
          }
          // NAK on error
          if (msg.replyTo != null && msg.replyTo!.isNotEmpty) {
            await _nc!.pub(msg.replyTo!, Uint8List.fromList(utf8.encode('-NAK')));
          }
        }
      } on TimeoutException {
        // No message available, loop again
      } catch (e) {
        if (_isConnected && kDebugMode) {
          debugPrint('ConnectNats: Error in JetStream pull - $e');
        }
        await Future.delayed(const Duration(milliseconds: 500));
      }
    }
  }
  
  /// Subscribe to system public pub/sub
  /// Matches: subscribeToSystemPublicPubSub() in ConnectNats.ts
  Future<void> _subscribeToSystemPublicPubSub() async {
    if (_nc == null) return;
    
    try {
      // Subscribe to system public subject (room-specific, matches web)
      final systemSubject = '${_subjects.systemPublic}.$_roomId';
      final sub = _nc.sub(systemSubject);
      
      await for (final msg in sub.stream) {
        try {
          _lastInboundAt = DateTime.now();
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
      case nats_msg.NatsMsgServerToClientEvents.RES_INITIAL_DATA:
        _handleInitialData(payload);
        break;

      case nats_msg.NatsMsgServerToClientEvents.RES_JOINED_USERS_LIST:
        await _handleJoinedUsersList(payload.msg);
        break;

      case nats_msg.NatsMsgServerToClientEvents.RESP_ONLINE_USERS_LIST:
        await _handleOnlineUsersList(payload.msg);
        break;

      case nats_msg.NatsMsgServerToClientEvents.RES_MEDIA_SERVER_DATA:
        await _handleMediaServerData(payload.msg);
        break;

      case nats_msg.NatsMsgServerToClientEvents.RESP_RENEW_WAJLC_TOKEN:
        if (payload.msg.isNotEmpty) {
          _token = payload.msg;
          ref.read(sessionProvider.notifier).addToken(payload.msg);
          // Keep Meet API protobuf calls in sync (uses manual token after join).
          ref.read(meetApiServiceProvider).setManualToken(payload.msg);
          if (kDebugMode) {
            print('ConnectNats: Token renewed (RESP_RENEW_WAJLC_TOKEN)');
          }
        }
        break;

      case nats_msg.NatsMsgServerToClientEvents.DELIVERY_PRIVATE_DATA:
        await _handlePrivateDataDelivery(payload);
        break;
        
      case nats_msg.NatsMsgServerToClientEvents.ROOM_METADATA_UPDATE:
        if (payload.msg.isNotEmpty) {
          try {
            // Some servers emit `metadata` as nested object instead of JSON string.
            // NatsKvRoomInfo expects metadata string; normalize before protobuf parse.
            final normalizedRoomInfoJson =
                _normalizeNatsKvRoomInfoPayload(payload.msg);
            final roomInfo =
                nats_msg.NatsKvRoomInfo.fromJson(_normalizeJson(normalizedRoomInfoJson));
            handleRoomData.handleRoomMetadataUpdate(roomInfo);
          } catch (e) {
            if (kDebugMode) {
              print('ConnectNats: Error parsing ROOM_METADATA_UPDATE - $e');
            }
          }
        }
        break;
        
      case nats_msg.NatsMsgServerToClientEvents.USER_JOINED:
        if (payload.msg.isNotEmpty) {
          try {
            final userInfo = nats_msg.NatsKvUserInfo.fromJson(_normalizeJson(payload.msg));
            handleParticipants.handleUserJoined(userInfo);
          } catch (e) {
            if (kDebugMode) {
              print('ConnectNats: Error parsing USER_JOINED - $e');
            }
          }
        }
        break;
        
      case nats_msg.NatsMsgServerToClientEvents.USER_DISCONNECTED:
        // userId is in msg field
        handleParticipants.handleUserLeft(payload.msg);
        break;

      case nats_msg.NatsMsgServerToClientEvents.USER_OFFLINE:
        // Full removal - userId from binMsg (NatsKvUserInfo) or msg (JSON/userId)
        final offlineUserId = _extractUserIdFromPayload(payload);
        if (offlineUserId != null && offlineUserId.isNotEmpty) {
          handleParticipants.handleUserLeft(offlineUserId);
        }
        break;
        
      case nats_msg.NatsMsgServerToClientEvents.USER_METADATA_UPDATE:
        if (payload.msg.isNotEmpty) {
          try {
            final userInfo = nats_msg.NatsKvUserInfo.fromJson(_normalizeJson(payload.msg));
            handleParticipants.handleUserMetadataUpdate(userInfo);
          } catch (e) {
            if (kDebugMode) {
              print('ConnectNats: Error parsing USER_METADATA_UPDATE - $e');
            }
          }
        }
        break;
        
      case nats_msg.NatsMsgServerToClientEvents.SESSION_ENDED:
        await endSession(payload.msg);
        break;

      case nats_msg.NatsMsgServerToClientEvents.SYSTEM_NOTIFICATION:
        if (!_isRecorder) {
          handleSystemData.handleNotification(payload.msg);
        }
        break;

      case nats_msg.NatsMsgServerToClientEvents.POLL_CREATED:
      case nats_msg.NatsMsgServerToClientEvents.POLL_CLOSED:
        handleSystemData.handlePoll(payload);
        break;

      case nats_msg.NatsMsgServerToClientEvents.JOIN_BREAKOUT_ROOM:
      case nats_msg.NatsMsgServerToClientEvents.BREAKOUT_ROOM_ENDED:
        handleSystemData.handleBreakoutRoom(payload);
        break;

      case nats_msg.NatsMsgServerToClientEvents.SYSTEM_CHAT_MSG:
        handleSystemData.handleSysChatMsg(payload.msg);
        break;

      case nats_msg.NatsMsgServerToClientEvents.TRANSCRIPTION_OUTPUT_TEXT:
        handleDataMessage.handleSpeechSubtitleText(payload.msg);
        break;

      case nats_msg.NatsMsgServerToClientEvents.RESP_INSIGHTS_AI_TEXT_CHAT:
        handleSystemData.handleInsightsAITextData(payload.msg);
        break;
        
      default:
        if (kDebugMode) {
          print('ConnectNats: Unhandled event ${payload.event}');
        }
    }
  }
  
  /// Handle initial data (1:1 with web handleInitialData).
  /// Updates room info, local user, and connection status.
  void _handleInitialData(nats_msg.NatsMsgServerToClient payload) {
    if (kDebugMode) {
      print('ConnectNats: Received initial data');
      print('ConnectNats: Payload: ${payload.msg}');
    }

    if (payload.msg.isEmpty) return;

    bool waitForApproval = false;
    try {
      // Server might send snake_case keys (e.g., local_user), but Dart Protobuf expects camelCase (localUser)
      // We'll normalize the JSON before parsing
      final initialData = nats_msg.NatsInitialData.fromJson(_normalizeJson(payload.msg));
      
      if (kDebugMode && (!initialData.hasRoom() || !initialData.hasLocalUser())) {
        debugPrint(
          'ConnectNats: Initial data missing critical fields. Room: ${initialData.hasRoom()}, LocalUser: ${initialData.hasLocalUser()}',
        );
        debugPrint('ConnectNats: Normalized JSON: ${_normalizeJson(payload.msg)}');
      }

      if (!initialData.hasRoom() || !initialData.hasLocalUser()) {
        return;
      }

      // 1. Room info -> HandleRoomData.setRoomInfo
      handleRoomData
          .setRoomInfo(initialData.room)
          .then((room) {
        _currentRoomInfo = room;
      }).catchError((e, st) {
        if (kDebugMode) {
          print('ConnectNats: Failed to parse/set room info: $e\n$st');
        }
      });

      // 2. Local user -> HandleParticipants.addLocalParticipantInfo + session/participant providers
      handleParticipants.addLocalParticipantInfo(initialData.localUser);
      _userName = initialData.localUser.name;
      _isAdmin = initialData.localUser.isAdmin;
      waitForApproval = _extractWaitForApproval(initialData.localUser.metadata);
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Error parsing RES_INITIAL_DATA - $e');
      }
      return;
    }

    // 3. E2EE from room metadata if present
    _enableE2EE = false;
    _enableE2EEChat = false;
    _enableE2EEWhiteboard = false;

    // 4. Connection ready (matches web: _setRoomConnectionStatusState('ready'))
    ref.read(sessionProvider.notifier).updateIsNatsServerConnected(true);
    _setRoomConnectionStatusState('ready');

    // 5. Finalize app conn (matches web components/landing: finalizeAppConn)
    // Web skips until !waitForApproval && user ready; mobile user already tapped Join,
    // but must still defer REQ_JOINED_USERS_LIST while in waiting room.
    _isLocalUserWaitingForApproval = waitForApproval;
    if (waitForApproval) {
      _pendingFinalizeAfterWaitingRoom = true;
      if (kDebugMode) {
        print('ConnectNats: Waiting room — defer finalizeAppConn until approval');
      }
    } else {
      _finalizeAppConn();
    }
  }

  /// Called when local user's metadata updates (e.g. admin approved waiting room).
  /// Matches web Landing useEffect: when waitForApproval becomes false, finalizeAppConn.
  void notifyFinalizeAppConnIfPending() {
    if (_finalizeAppConnCompleted) return;
    if (!_pendingFinalizeAfterWaitingRoom) return;
    if (_isLocalUserWaitingForApproval) return;
    _pendingFinalizeAfterWaitingRoom = false;
    _finalizeAppConn();
  }

  /// Keep local waiting-room state without reading sessionProvider from NATS callbacks.
  void updateLocalUserWaitingForApproval(bool waitForApproval) {
    _isLocalUserWaitingForApproval = waitForApproval;
  }

  /// Finalize app connection - request joined users list (matches web finalizeAppConn)
  void _finalizeAppConn() {
    if (_finalizeAppConnCompleted) return;
    _finalizeAppConnCompleted = true;

    _sendMessageToSystemWorker(
      nats_msg.NatsMsgClientToServer(
        event: nats_msg.NatsMsgClientToServerEvents.REQ_JOINED_USERS_LIST,
      ),
    );
    if (kDebugMode) {
      print('ConnectNats: Requested joined users list (finalizeAppConn)');
    }
  }

  /// Handle joined users list - then onAfterUserReady (matches web handleJoinedUsersList)
  Future<void> _handleJoinedUsersList(String msg) async {
    try {
      final onlineUsers = jsonDecode(msg) as List<dynamic>;
      for (final userJson in onlineUsers) {
        final jsonStr = userJson is Map ? jsonEncode(userJson) : userJson.toString();
        final userInfo = nats_msg.NatsKvUserInfo.fromJson(_normalizeJson(jsonStr));
        await handleParticipants.handleUserJoined(userInfo);
      }
      await _onAfterUserReady();
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Error handling joined users list - $e');
      }
    }
  }

  /// Handle online users list reconciliation (matches web RESP_ONLINE_USERS_LIST -> reconcileParticipants()).
  Future<void> _handleOnlineUsersList(String msg) async {
    if (msg.isEmpty) return;
    try {
      final onlineUsers = jsonDecode(msg) as List<dynamic>;

      final serverUsers = <nats_msg.NatsKvUserInfo>[];
      for (final userJson in onlineUsers) {
        final jsonStr = userJson is Map ? jsonEncode(userJson) : userJson.toString();
        serverUsers.add(nats_msg.NatsKvUserInfo.fromJson(_normalizeJson(jsonStr)));
      }

      await handleParticipants.reconcileParticipants(serverUsers);
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Error handling online users list - $e');
      }
    }
  }

  /// After user ready - request media server data, subscribe channels (matches web onAfterUserReady)
  Future<void> _onAfterUserReady() async {
    // Request media server connection data (LiveKit URL + token)
    _sendMessageToSystemWorker(
      nats_msg.NatsMsgClientToServer(
        event: nats_msg.NatsMsgClientToServerEvents.REQ_MEDIA_SERVER_DATA,
      ),
    );
    if (kDebugMode) {
      print('ConnectNats: Requested media server data (onAfterUserReady)');
    }

    // Start periodic participants reconciliation (matches web startUsersSync()).
    _startUsersSync();

    // Real-time channels (web: Promise.all in onAfterUserReady after initial data + user list).
    if (!_realtimeChannelsStarted) {
      _realtimeChannelsStarted = true;
      unawaited(_subscribeToChat());
      unawaited(_subscribeToWhiteboard());
      unawaited(_subscribeToDataChannel());
    }

    // Request initial whiteboard scene from presenter (Excalidraw chỉ mount khi web mở bảng trắng).
    unawaited(_requestWhiteboardFullScene());
    _scheduleWhiteboardFullSceneRetries();
  }

  /// Gửi lại REQ_FULL sau vài lần: donor có thể chưa mount Excalidraw ngay khi mobile vào phòng.
  void _scheduleWhiteboardFullSceneRetries() {
    _whiteboardFullSceneRetryTimer?.cancel();
    var attempts = 0;
    const maxAttempts = 15;
    _whiteboardFullSceneRetryTimer =
        Timer.periodic(const Duration(seconds: 4), (_) async {
      attempts++;
      final elements =
          ref.read(whiteboardProvider).allExcalidrawElements.trim();
      if (elements.isNotEmpty) {
        _whiteboardFullSceneRetryTimer?.cancel();
        _whiteboardFullSceneRetryTimer = null;
        return;
      }
      if (attempts >= maxAttempts) {
        _whiteboardFullSceneRetryTimer?.cancel();
        _whiteboardFullSceneRetryTimer = null;
        return;
      }
      await _requestWhiteboardFullScene();
    });
  }

  /// Periodically request the latest online users list from backend,
  /// so the participant list stays consistent even if we missed realtime events.
  void _startUsersSync() {
    // Avoid multiple timers on reconnect / repeated ready flows.
    _reconciliationInterval?.cancel();

    // Fire once immediately.
    _sendMessageToSystemWorker(
      nats_msg.NatsMsgClientToServer(
        event: nats_msg.NatsMsgClientToServerEvents.REQ_ONLINE_USERS_LIST,
      ),
    );

    _reconciliationInterval = Timer.periodic(
      const Duration(milliseconds: kUsersSyncInterval),
      (_) {
        _sendMessageToSystemWorker(
          nats_msg.NatsMsgClientToServer(
            event: nats_msg.NatsMsgClientToServerEvents.REQ_ONLINE_USERS_LIST,
          ),
        );
      },
    );
  }

  /// Handle media server data - connect to LiveKit (matches web handleMediaServerData)
  Future<void> _handleMediaServerData(String msg) async {
    final prev = _mediaServerInitGate;
    final done = Completer<void>();
    _mediaServerInitGate = done.future;
    await prev;
    try {
      try {
        final serverInfo =
            nats_msg.MediaServerConnInfo.fromJson(_normalizeJson(msg));
        if (_mediaServerConn != null &&
            serverInfo.url.isNotEmpty &&
            serverInfo.token.isNotEmpty) {
          await _mediaServerConn!.initializeConnection(
            serverInfo.url,
            serverInfo.token,
          );
          if (kDebugMode) {
            print('ConnectNats: LiveKit connection initialized');
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print('ConnectNats: Error handling media server data - $e');
        }
        _setErrorState('Lỗi kết nối media', e.toString());
      }
    } finally {
      done.complete();
    }
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
  /// Matches: startTokenRenewInterval() in ConnectNats.ts
  /// Web sends REQ_RENEW_WAJLC_TOKEN event with current token to NATS system worker
  Future<void> _renewToken() async {
    try {
      // Web: sends REQ_RENEW_WAJLC_TOKEN event with current token
      // Backend responds with new token via NATS message
      _sendMessageToSystemWorker(
        nats_msg.NatsMsgClientToServer(
          event: nats_msg.NatsMsgClientToServerEvents.REQ_RENEW_WAJLC_TOKEN,
          msg: _token,
        ),
      );
      
      if (kDebugMode) {
        print('ConnectNats: Token renewal request sent');
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
  /// Server expects subject: sysJsWorker.{roomId}.{userId}
  void _sendMessageToSystemWorker(nats_msg.NatsMsgClientToServer msg) {
    if (_nc == null) return;

    try {
      final subject = '${_subjects.systemJsWorker}.$_roomId.$_userId';
      final data = msg.writeToBuffer();

      _nc.pub(subject, data);

      if (kDebugMode) {
        print('ConnectNats: Sent message to system worker - ${msg.event}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Failed to send message - $e');
      }
    }
  }

  /// Public method to send message to system worker
  void sendMessageToSystemWorker(nats_msg.NatsMsgClientToServer msg) {
    _sendMessageToSystemWorker(msg);
  }

  /// Send raise hand or lower hand to system worker (for footer Raise Hand button).
  void sendRaiseHand({required bool raise, String msg = ''}) {
    final event = raise
        ? nats_msg.NatsMsgClientToServerEvents.REQ_RAISE_HAND
        : nats_msg.NatsMsgClientToServerEvents.REQ_LOWER_HAND;
    _sendMessageToSystemWorker(
      nats_msg.NatsMsgClientToServer(
        event: event,
        msg: msg,
      ),
    );
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
      final sub = _nc.sub(subject);
      
      // Request chat data from donors (users who have chat history)
      final donors = await _getChatDonors();
      for (final donor in donors) {
        await sendDataMessage(
          type: 'REQ_PUBLIC_CHAT_DATA',
          msg: '',
          toUserId: donor['userId'],
        );
      }
      
      // Listen for chat messages (never let one bad payload kill the subscription)
      await for (final msg in sub.stream) {
        try {
          await _processToHandleChatMsg(msg.byte);
        } catch (e, st) {
          if (kDebugMode) {
            print('ConnectNats: Chat message handling error - $e\n$st');
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Error subscribing to chat - $e');
      }
    }
  }
  
  /// Process incoming chat message
  /// Matches: processToHandleChatMsg() in ConnectNats.ts
  Future<void> _processToHandleChatMsg(List<int> data) async {
    Uint8List dataToParse = Uint8List.fromList(data);
    
    // Decrypt if E2EE is enabled for chat
    if (_enableE2EEChat) {
      final decrypted = await _decryptData(dataToParse);
      if (decrypted == null) {
        return; // Decryption failed
      }
      dataToParse = decrypted;
    }
    
    // Parse protobuf message
    final payload = nats_msg.ChatMessage.fromBuffer(dataToParse);
    
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
    final chatMessage = nats_msg.ChatMessage(
      id: _randomString(),
      fromName: _userName,
      fromUserId: _userId,
      sentAt: Int64(DateTime.now().millisecondsSinceEpoch),
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
      final ok = await _nc.pub(subject, payload);
      if (ok != true) {
        if (kDebugMode) {
          print('ConnectNats: pub chat failed');
        }
        return;
      }
    }

    // Core NATS does not deliver a client's own publish back to that client.
    // Echo locally so the sender always sees their message (matches expected UX; dedupe skips NATS echo if any).
    try {
      await handleChat.handleMsg(chatMessage);
    } catch (e, st) {
      if (kDebugMode) {
        print('ConnectNats: Local chat echo failed - $e\n$st');
      }
    }
    
    // Send analytics
    _sendAnalyticsData(
      event: isPrivate ? 'ANALYTICS_EVENT_USER_PRIVATE_CHAT' : 'ANALYTICS_EVENT_USER_PUBLIC_CHAT',
      type: 'USER',
      value: '1',
    );
  }
  
  /// Handle chat translation
  /// Matches: chat translation logic in ConnectNats.ts sendChatMsg()
  /// Web: checks chatTranslationFeatures.isEnabled, gets selectedChatTransLang, calls executeChatTranslation API
  Future<void> _handleChatTranslation(nats_msg.ChatMessage chatMessage) async {
    try {
      // Check if translation is enabled in room features
      // Access from _currentRoomInfo JSON (matches web's state.session.currentRoom.metadata)
      final roomMetadataJson = _currentRoomInfo?['metadata'];
      if (roomMetadataJson == null) {
        return; // No metadata available
      }
      
      // Parse insightsFeatures from JSON (since RoomFeatures model doesn't include it)
      final roomFeaturesJson = roomMetadataJson['roomFeatures'];
      final insightsFeaturesJson = roomFeaturesJson?['insightsFeatures'];
      final chatTranslationFeaturesJson = insightsFeaturesJson?['chatTranslationFeatures'];
      
      if (chatTranslationFeaturesJson == null || 
          (chatTranslationFeaturesJson['isEnabled'] != true)) {
        return; // Translation not enabled
      }
      
      // Get selected translation language from room settings
      final selectedChatTransLang = ref.read(roomSettingsProvider).selectedChatTransLang;
      if (selectedChatTransLang.isEmpty) {
        return; // No language selected
      }
      
      // Get allowed translation languages from JSON
      final allowedTransLangs = (chatTranslationFeaturesJson['allowedTransLangs'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ?? <String>[];
      
      if (allowedTransLangs.isEmpty) {
        return; // No target languages configured
      }
      
      // Call translation API (matches web executeChatTranslation)
      final api = ref.read(meetApiServiceProvider);
      final req = insights.InsightsTranslateTextReq(
        text: chatMessage.message,
        sourceLang: selectedChatTransLang,
        targetLangs: allowedTransLangs,
      );
      
      final res = await api.executeChatTranslation(req);
      
      if (res.status && res.hasResult()) {
        // Update chatMessage with translation results (matches web)
        chatMessage.sourceLang = selectedChatTransLang;
        chatMessage.translations.clear();
        chatMessage.translations.addAll(res.result.translations);
        
        if (kDebugMode) {
          print('ConnectNats: Chat translation completed for ${chatMessage.id}');
        }
      } else {
        if (kDebugMode) {
          print('ConnectNats: Chat translation failed - ${res.msg}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Chat translation error - $e');
      }
      // Don't block message sending if translation fails
    }
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
      final sub = _nc.sub(subject);
      
      // Listen for whiteboard messages
      await for (final msg in sub.stream) {
        try {
          Uint8List dataToParse = msg.byte;
          
          // Decrypt if E2EE is enabled for whiteboard
          if (_enableE2EEWhiteboard) {
            final decrypted = await _decryptData(dataToParse);
            if (decrypted == null) {
              continue; // Skip if decryption fails
            }
            dataToParse = decrypted;
          }
          
          // Parse protobuf message
          final payload = data_msg.DataChannelMessage.fromBuffer(dataToParse);
          
          // Avoid echo - don't process our own messages
          if (payload.fromUserId != _userId) {
            await handleWhiteboard.handleWhiteboardMsg(payload);
          }
        } catch (e, st) {
          if (kDebugMode) {
            print('ConnectNats: Whiteboard message error - $e\n$st');
          }
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
    final data = data_msg.DataChannelMessage(
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
    _nc.pub(subject, payload);

    if (kDebugMode) {
      print('ConnectNats: Sent whiteboard data - $type');
    }
  }
  
  /// Request full whiteboard scene from donor(s).
  /// Web does this via `REQ_FULL_WHITEBOARD_DATA` + donor list.
  Future<void> _requestWhiteboardFullScene() async {
    try {
      final donors = await _getWhiteboardDonors();
      if (donors.isEmpty) return;

      for (final donor in donors) {
        final userId = donor['userId']?.toString() ?? '';
        if (userId.isEmpty) continue;

        await sendDataMessage(
          type: 'REQ_FULL_WHITEBOARD_DATA',
          msg: '',
          toUserId: userId,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Error requesting whiteboard full scene - $e');
      }
    }
  }
  
  /// Get whiteboard donors (users with whiteboard state)
  Future<List<Map<String, dynamic>>> _getWhiteboardDonors() async {
    // For view-only mobile, we treat "presenter" as the donor
    // who can provide the full scene.
    final participantState = ref.read(participantProvider);
    final participants = participantState.participants.values.toList();

    // Prefer requesting from presenters (typically exactly one).
    final presenters = participants
        .where((p) => p.metadata.isPresenter == true)
        .toList();

    final donors = presenters
        .where((p) => p.userId != _userId)
        .map((p) => <String, dynamic>{'userId': p.userId})
        .toList();

    if (donors.isNotEmpty) return donors;

    // Fallback: any other participant.
    return participants
        .where((p) => p.userId != _userId)
        .map((p) => <String, dynamic>{'userId': p.userId})
        .toList();
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
      final sub = _nc.sub(subject);
      
      // Listen for data channel messages
      await for (final msg in sub.stream) {
        try {
          await _processToHandleDataMsg(msg.byte);
        } catch (e, st) {
          if (kDebugMode) {
            print('ConnectNats: Data channel message error - $e\n$st');
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Error subscribing to data channel - $e');
      }
    }
  }
  
  /// Process incoming data channel message
  /// Matches: processToHandleDataMsg() in ConnectNats.ts
  Future<void> _processToHandleDataMsg(List<int> data) async {
    Uint8List dataToParse = Uint8List.fromList(data);
    
    // Decrypt if E2EE is enabled
    if (_enableE2EE) {
      final decrypted = await _decryptData(dataToParse);
      if (decrypted == null) {
        return; // Decryption failed
      }
      dataToParse = decrypted;
    }
    
    // Parse protobuf message
    final payload = data_msg.DataChannelMessage.fromBuffer(dataToParse);
    
    // Don't process our own messages or private messages for others
    if (payload.fromUserId == _userId ||
        (payload.toUserId.isNotEmpty && payload.toUserId != _userId)) {
      return;
    }
    
    // All other messages are for us
    await handleDataMessage.handleMessage(payload);
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
    final data = data_msg.DataChannelMessage(
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
      _nc.pub(subject, payload);
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
  /// Web: creates AnalyticsDataMsg, serializes to JSON, wraps in NatsMsgClientToServer(PUSH_ANALYTICS_DATA)
  void sendAnalyticsData({
    required analytics.AnalyticsEvents eventName,
    analytics.AnalyticsEventType eventType = analytics.AnalyticsEventType.ANALYTICS_EVENT_TYPE_USER,
    String? hsetValue,
    String? eventValueString,
    String? eventValueInteger,
  }) {
    if (_nc == null) {
      if (kDebugMode) {
        print('ConnectNats: Cannot send analytics - NATS not connected');
      }
      return;
    }

    try {
      // Create AnalyticsDataMsg (matches web AnalyticsDataMsgSchema)
      final analyticsMsg = analytics.AnalyticsDataMsg(
        eventType: eventType,
        eventName: eventName,
        roomId: _roomId,
        userId: _userId,
        hsetValue: hsetValue ?? '',
        eventValueString: eventValueString ?? '',
        eventValueInteger: eventValueInteger != null 
            ? Int64.parseInt(eventValueInteger) 
            : null,
        time: Int64(DateTime.now().millisecondsSinceEpoch),
      );

      // Serialize to JSON (web uses toJsonString)
      final jsonStr = analyticsMsg.writeToJson();

      // Wrap in NatsMsgClientToServer with PUSH_ANALYTICS_DATA event
      final data = nats_msg.NatsMsgClientToServer(
        event: nats_msg.NatsMsgClientToServerEvents.PUSH_ANALYTICS_DATA,
        msg: jsonStr,
      );

      // Send to system worker
      _sendMessageToSystemWorker(data);

      if (kDebugMode) {
        print('ConnectNats: Analytics sent - ${eventName.name} (${eventType.name})');
      }
    } catch (e) {
      if (kDebugMode) {
        print('ConnectNats: Failed to send analytics - $e');
      }
    }
  }

  /// Legacy method signature (kept for backward compatibility)
  @Deprecated('Use sendAnalyticsData with AnalyticsEvents enum instead')
  void _sendAnalyticsData({
    required String event,
    required String type,
    required String value,
  }) {
    // Try to map string to enum (fallback)
    analytics.AnalyticsEvents? eventEnum;
    try {
      eventEnum = analytics.AnalyticsEvents.values.firstWhere(
        (e) => e.name.toLowerCase().contains(event.toLowerCase()),
        orElse: () => analytics.AnalyticsEvents.ANALYTICS_EVENT_UNKNOWN,
      );
    } catch (e) {
      eventEnum = analytics.AnalyticsEvents.ANALYTICS_EVENT_UNKNOWN;
    }

    sendAnalyticsData(
      eventName: eventEnum,
      eventType: type.toLowerCase().contains('room')
          ? analytics.AnalyticsEventType.ANALYTICS_EVENT_TYPE_ROOM
          : analytics.AnalyticsEventType.ANALYTICS_EVENT_TYPE_USER,
      eventValueString: value,
    );
  }
  
  // ============================================================================
  // HELPER METHODS
  // ============================================================================
  
  /// Get chat donors (users with chat history)
  Future<List<Map<String, dynamic>>> _getChatDonors() async {
    // TODO: Get from local storage or provider
    return [];
  }
  
  /// Random id for chat messages (web uses crypto random; avoid ms-based collisions).
  String _randomString() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final r = Random.secure();
    return List.generate(20, (_) => chars[r.nextInt(chars.length)]).join();
  }
  
  /// Parse data_msg.DataMsgBodyType from string
  data_msg.DataMsgBodyType _parseDataMsgBodyType(String type) {
    switch (type) {
      case 'SCENE_UPDATE':
        return data_msg.DataMsgBodyType.SCENE_UPDATE;
      case 'POINTER_UPDATE':
        return data_msg.DataMsgBodyType.POINTER_UPDATE;
      case 'PAGE_CHANGE':
        return data_msg.DataMsgBodyType.PAGE_CHANGE;
      case 'FILE_CHANGE':
        return data_msg.DataMsgBodyType.FILE_CHANGE;
      case 'UPDATE_CURRENT_OFFICE_FILE_PAGES':
        return data_msg.DataMsgBodyType.UPDATE_CURRENT_OFFICE_FILE_PAGES;
      case 'WHITEBOARD_APP_STATE_CHANGE':
        return data_msg.DataMsgBodyType.WHITEBOARD_APP_STATE_CHANGE;
      case 'WHITEBOARD_RESET':
        return data_msg.DataMsgBodyType.WHITEBOARD_RESET;
      case 'REQ_FULL_WHITEBOARD_DATA':
        return data_msg.DataMsgBodyType.REQ_FULL_WHITEBOARD_DATA;
      case 'REQ_PUBLIC_CHAT_DATA':
        return data_msg.DataMsgBodyType.REQ_PUBLIC_CHAT_DATA;
      case 'NEW_POLL_RESPONSE':
        return data_msg.DataMsgBodyType.NEW_POLL_RESPONSE;
      case 'RAISE_HAND':
        return data_msg.DataMsgBodyType.INFO; // RAISE_HAND not in protobuf
      case 'OTHER_USER_LOWER_HAND':
        return data_msg.DataMsgBodyType.INFO; // LOWER_HAND not in protobuf
      default:
        return data_msg.DataMsgBodyType.INFO;
    }
  }
  
  // Helper methods
  
  /// Extract userId from payload (for USER_OFFLINE etc.)
  /// Handles binMsg (NatsKvUserInfo), msg as JSON, or plain userId string
  String? _extractUserIdFromPayload(nats_msg.NatsMsgServerToClient payload) {
    if (payload.hasBinMsg()) {
      try {
        final userInfo = nats_msg.NatsKvUserInfo.fromBuffer(payload.binMsg);
        return userInfo.userId;
      } catch (_) {}
    }
    if (payload.msg.isNotEmpty) {
      try {
        final decoded = jsonDecode(payload.msg) as Map<String, dynamic>;
        return decoded['userId']?.toString();
      } catch (_) {
        return payload.msg;
      }
    }
    return null;
  }

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

  bool _extractWaitForApproval(String metadataJson) {
    if (metadataJson.isEmpty) return false;
    try {
      final decoded = jsonDecode(metadataJson);
      if (decoded is! Map<String, dynamic>) return false;
      final normalized = _normalizeMetadataKeys(decoded);
      return normalized['waitForApproval'] == true;
    } catch (_) {
      return false;
    }
  }

  Map<String, dynamic> _normalizeMetadataKeys(Map<String, dynamic> input) {
    final result = <String, dynamic>{};
    input.forEach((key, value) {
      final normalizedKey = key.contains('_')
          ? key.replaceAllMapped(RegExp(r'_([a-z])'), (m) => m.group(1)!.toUpperCase())
          : key;

      if (value is Map<String, dynamic>) {
        result[normalizedKey] = _normalizeMetadataKeys(value);
      } else if (value is List) {
        result[normalizedKey] = value
            .map((e) => e is Map<String, dynamic> ? _normalizeMetadataKeys(e) : e)
            .toList();
      } else {
        result[normalizedKey] = value;
      }
    });
    return result;
  }

  /// Normalize JSON by converting snake_case keys to camelCase
  /// This is needed because the server uses marshalToProtoJson(useProtoFieldName: true)
  /// Normalize JSON from server (snake_case -> camelCase -> tag numbers)
  /// Server sends snake_case, but Dart Protobuf fromJson expects camelCase.
  /// Additionally, if names are omitted in the build, fromJson expects tag numbers.
  String _normalizeJson(String jsonStr) {
    try {
      final decoded = jsonDecode(jsonStr);
      if (decoded is Map<String, dynamic>) {
        return jsonEncode(_convertToTagMap(decoded));
      } else if (decoded is List) {
        return jsonEncode(decoded.map((e) => e is Map<String, dynamic> ? _convertToTagMap(e) : e).toList());
      }
      return jsonStr;
    } catch (e) {
      if (kDebugMode) print('ConnectNats: Error in _normalizeJson - $e');
      return jsonStr;
    }
  }

  /// Ensure ROOM_METADATA_UPDATE payload has `metadata` as JSON string.
  /// Server can send:
  /// - {"metadata":"{\"room_title\":\"...\"}"}  (ok)
  /// - {"metadata":{"room_title":"..."}}        (needs conversion)
  String _normalizeRoomInfoMetadataPayload(String jsonStr) {
    try {
      final decoded = jsonDecode(jsonStr);
      if (decoded is! Map<String, dynamic>) return jsonStr;
      final metadata = decoded['metadata'];
      if (metadata is Map || metadata is List) {
        decoded['metadata'] = jsonEncode(metadata);
      }
      return jsonEncode(decoded);
    } catch (_) {
      return jsonStr;
    }
  }

  /// Full normalization for [NatsKvRoomInfo] JSON before protobuf [mergeFromJson].
  String _normalizeNatsKvRoomInfoPayload(String jsonStr) {
    try {
      var step = _normalizeRoomInfoMetadataPayload(jsonStr);
      var decoded = jsonDecode(step);
      if (decoded is! Map<String, dynamic>) return step;

      // Bare room metadata (room_title/roomTitle, room_features, …) mistaken for KV room row.
      final hasRoomKey =
          decoded.containsKey('room_id') || decoded.containsKey('roomId');
      final looksLikeInnerMetadata = decoded.containsKey('room_title') ||
          decoded.containsKey('roomTitle') ||
          decoded.containsKey('room_features') ||
          decoded.containsKey('roomFeatures');
      if (!hasRoomKey && looksLikeInnerMetadata) {
        decoded = <String, dynamic>{'metadata': jsonEncode(decoded)};
        step = jsonEncode(decoded);
      }

      // Int64 fields sometimes arrive as quoted numbers ("7200") → protobuf JSON parse error.
      const numericKeys = <String>{
        'db_table_id',
        'empty_timeout',
        'max_participants',
        'created_at',
        'dbTableId',
        'emptyTimeout',
        'maxParticipants',
        'createdAt',
      };
      final out = Map<String, dynamic>.from(decoded);
      out.forEach((key, value) {
        if (!numericKeys.contains(key)) return;
        if (value is String) {
          final n = int.tryParse(value.trim());
          if (n != null) {
            out[key] = n;
          }
        }
      });
      // Luôn dùng [out] (đã bọc bare-metadata / ép số) — không fallback [step] để tránh mất bước bọc.
      return jsonEncode(out);
    } catch (_) {
      return jsonStr;
    }
  }

  /// Recursively convert Map keys to tag numbers as strings.
  /// This is the most robust way to support fromJson when names are omitted.
  Map<String, dynamic> _convertToTagMap(Map<String, dynamic> map) {
    final result = <String, dynamic>{};
    map.forEach((key, value) {
      // 1. Get camelCase and tag
      final camelKey = key.contains('_') 
          ? key.replaceAllMapped(RegExp(r'_([a-z])'), (m) => m.group(1)!.toUpperCase())
          : key;
      
      final tag = _fieldNameToTag[camelKey] ?? _fieldNameToTag[key];
      final targetKey = tag?.toString() ?? camelKey;
      
      // 2. Process value
      if (value is Map<String, dynamic>) {
        result[targetKey] = _convertToTagMap(value);
      } else if (value is List) {
        result[targetKey] = value.map((e) => e is Map<String, dynamic> ? _convertToTagMap(e) : e).toList();
      } else {
        result[targetKey] = value;
      }
    });
    return result;
  }

  /// Hardcoded mapping of field names to tag numbers for critical messages.
  /// Matches wajlc_nats_msg.proto definitions.
  static const Map<String, int> _fieldNameToTag = {
    // NatsInitialData
    'room': 1,
    'localUser': 2, 'local_user': 2,
    'mediaServerInfo': 3, 'media_server_info': 3,
    
    // NatsKvRoomInfo
    'dbTableId': 1, 'db_table_id': 1,
    'roomId': 2, 'room_id': 2,
    'roomSid': 3, 'room_sid': 3,
    'status': 4,
    'emptyTimeout': 5, 'empty_timeout': 5,
    'maxParticipants': 6, 'max_participants': 6,
    'metadata': 7,
    'createdAt': 8, 'created_at': 8,
    
    // NatsKvUserInfo
    'userId': 1, 'user_id': 1,
    'userSid': 2, 'user_sid': 2,
    'name': 3,
    // 'roomId': 4,
    'isAdmin': 5, 'is_admin': 5,
    'isPresenter': 6, 'is_presenter': 6,
    // 'metadata': 7,
    'joinedAt': 8, 'joined_at': 8,
    'reconnectedAt': 9, 'reconnected_at': 9,
    'disconnectedAt': 10, 'disconnected_at': 10,

    // MediaServerConnInfo
    'url': 1,
    'token': 2,
    'enabledE2ee': 3, 'enabled_e2ee': 3,

    // ChatMessage
    'id': 1,
    'fromName': 2, 'from_name': 2,
    'fromUserId': 3, 'from_user_id': 3,
    'sentAt': 4, 'sent_at': 4,
    'toUserId': 5, 'to_user_id': 5,
    'isPrivate': 6, 'is_private': 6,
    'message': 7,
    'fromAdmin': 8, 'from_admin': 8,
    'sourceLang': 9, 'source_lang': 9,
    'translations': 10,

    // NatsSystemNotification
    // 'id': 1,
    'type': 2,
    // 'msg': 3,
    // 'sentAt': 4,
    'withSound': 5, 'with_sound': 5,
    
    // NatsUserMetadataUpdate
    // 'userId': 1,
    // 'metadata': 2,
  };
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
