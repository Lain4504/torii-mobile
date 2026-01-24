import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dart_nats/dart_nats.dart' as nats;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart';

final natsServiceProvider = Provider<NatsService>((ref) {
  return NatsService();
});

class NatsService {
  nats.Client? _client;
  final List<StreamSubscription> _subscriptions = [];
  
  Timer? _tokenRenewTimer;
  Timer? _pingTimer;
  String? _token;
  String? _roomId;
  String? _userId;

  static const _pingInterval = Duration(minutes: 1);
  static const _renewInterval = Duration(minutes: 3);

  // Event callbacks
  Function(NatsMsgServerToClient)? onSystemEvent;
  Function(bool)? onConnectionStatusChanged;

  Future<void> connect({
    required List<String> urls,
    required String token,
  }) async {
    _client = nats.Client();
    
    _token = token;
    
    // Auth using token in URL
    String finalUrl = urls.first;
    if (!finalUrl.contains('@') && token.isNotEmpty) {
      final uri = Uri.parse(finalUrl);
      finalUrl = '${uri.scheme}://$token@${uri.host}:${uri.port}${uri.path}';
    }

    try {
      final url = Uri.parse(finalUrl);
      await _client?.connect(url, retry: true, retryCount: -1);
      _startKeepAlive();
      
      // Monitor status
      _client!.statusStream.listen((status) {
        final connected = status == nats.Status.connected;
        onConnectionStatusChanged?.call(connected);
        if (kDebugMode) {
          print('NATS Status: $status');
        }
      });
      
      onConnectionStatusChanged?.call(true);
      
      if (kDebugMode) {
        print('NATS connected to $finalUrl');
      }
    } catch (e) {
      if (kDebugMode) {
        print('NATS connection failed: $e');
      }
      onConnectionStatusChanged?.call(false);
      rethrow;
    }
  }

  Future<void> subscribe({
    required String subject,
    required Function(Uint8List) onData,
  }) async {
    if (_client == null) return;
    
    final sub = _client!.sub(subject);
    final subscription = sub.stream.listen((msg) {
      if (msg.byte != null) {
        onData(Uint8List.fromList(msg.byte!));
      }
    });
    _subscriptions.add(subscription);
  }

  void sendMessage(String subject, List<int> data) {
    _client?.pub(subject, Uint8List.fromList(data));
  }

  Future<void> disconnect() async {
    for (var sub in _subscriptions) {
      await sub.cancel();
    }
    _subscriptions.clear();
    _stopKeepAlive();
    _client?.close();
    _client = null;
    onConnectionStatusChanged?.call(false);
  }

  void _startKeepAlive() {
    _stopKeepAlive();
    // Send immediate ping to satisfy handshake
    _sendPing();
    _pingTimer = Timer.periodic(_pingInterval, (_) => _sendPing());
    _tokenRenewTimer = Timer.periodic(_renewInterval, (_) => _renewToken());
  }

  void _stopKeepAlive() {
    _pingTimer?.cancel();
    _tokenRenewTimer?.cancel();
  }

  bool get isConnected => _client?.status == nats.Status.connected;

  String? _jsWorkerSubject;

  void _sendPing() {
    if (!isConnected || _jsWorkerSubject == null) return;
    sendMessageToSystemWorker(
      baseSubject: _jsWorkerSubject!,
      payload: NatsMsgClientToServer(event: NatsMsgClientToServerEvents.PING).writeToBuffer(),
    );
  }

  void _renewToken() {
    if (!isConnected || _token == null || _jsWorkerSubject == null) return;
    sendMessageToSystemWorker(
      baseSubject: _jsWorkerSubject!,
      payload: NatsMsgClientToServer(
        event: NatsMsgClientToServerEvents.REQ_RENEW_WAJLC_TOKEN,
        msg: _token!,
      ).writeToBuffer(),
    );
  }

  void setIdentity(String roomId, String userId, String jsWorkerSubject) {
    _roomId = roomId;
    _userId = userId;
    _jsWorkerSubject = jsWorkerSubject;
  }

  // Specialized send methods matching Web
  void sendMessageToSystemWorker({
    required String baseSubject,
    required List<int> payload,
  }) {
    if (_roomId == null || _userId == null) return;
    final targetSubject = '$baseSubject.$_roomId.$_userId';
    sendMessage(targetSubject, payload);
  }
}
