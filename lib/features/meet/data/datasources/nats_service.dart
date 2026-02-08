// NATS signaling for Meet.
// Backend publishes system events (RES_INITIAL_DATA, etc.) via JetStream only (js.publish()). Web
// uses a JetStream consumer; dart_nats supports NATS 2.0+ and JetStream transport but has limited
// JetStream API—core subscribe does not receive js.publish() messages. To receive stream events:
// use dart_nats to interact with $JS subjects (e.g. pull via $JS.API.CONSUMER.MSG.NEXT or push
// consumer delivering to an inbox we subscribe to). Server must be run with -js (JetStream enabled).
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

  static const Duration _connectTimeout = Duration(seconds: 15);

  Future<void> connect({
    required List<String> urls,
    required String token,
  }) async {
    if (urls.isEmpty) {
      throw Exception('NATS URLs list is empty');
    }

    _client = nats.Client();
    _token = token;

    // Server auth callout reads token from connect_opts.token (see nats-auth-callout.service).
    // Web uses tokenAuthenticator(); dart_nats must pass token via ConnectOption(authToken:).
    var uri = Uri.parse(urls.first);
    if (uri.port == 0 || uri.port > 65535) {
      final port = uri.scheme == 'wss' || uri.scheme == 'https' ? 443 : 80;
      uri = uri.replace(port: port);
    }
    if (kDebugMode) {
      print('NATS connecting to ${uri.scheme}://${uri.host}:${uri.port}${uri.path} (token in connect options)');
    }

    try {
      await _client!
          .connect(
            uri,
            connectOption: nats.ConnectOption(authToken: token),
            retry: true,
            retryCount: -1,
          )
          .timeout(_connectTimeout, onTimeout: () {
        _client?.close();
        _client = null;
        throw TimeoutException('NATS connection timed out after ${_connectTimeout.inSeconds}s');
      });
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
        print('NATS connected');
      }
    } catch (e) {
      if (kDebugMode) {
        print('NATS connection failed: $e');
      }
      _client?.close();
      _client = null;
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
    _stopJetStreamPull();
    for (var sub in _subscriptions) {
      await sub.cancel();
    }
    _subscriptions.clear();
    _stopKeepAlive();
    _client?.close();
    _client = null;
    onConnectionStatusChanged?.call(false);
  }

  // ---------------------------------------------------------------------------
  // JetStream pull consumer (same stream/consumer as web: roomId_userId)
  // ---------------------------------------------------------------------------
  static const String _jsPrefix = r'$JS.API.CONSUMER.MSG.NEXT';
  Timer? _jetStreamPullTimer;
  static const Duration _pullInterval = Duration(milliseconds: 400);
  static const Duration _pullRequestTimeout = Duration(seconds: 2);

  /// Starts a pull loop for the given stream/consumer. Server creates consumer
  /// with durable_name = roomId_userId; we pull from $JS.API.CONSUMER.MSG.NEXT.<stream>.<consumer>.
  void startJetStreamPull({
    required String streamName,
    required String consumerName,
    required Function(NatsMsgServerToClient) onMessage,
  }) {
    _stopJetStreamPull();
    if (_client == null || streamName.isEmpty || consumerName.isEmpty) return;
    final subject = '$_jsPrefix.$streamName.$consumerName';
    final body = utf8.encode('{"batch":1}');
    if (kDebugMode) {
      print('NATS JetStream pull started: $subject');
    }
    _jetStreamPullTimer = Timer.periodic(_pullInterval, (_) async {
      if (_client == null || !isConnected) return;
      try {
        final reply = await _client!
            .request(subject, Uint8List.fromList(body))
            .timeout(_pullRequestTimeout);
        final raw = reply.byte ?? reply.string?.codeUnits;
        if (raw == null || raw.isEmpty) return;
        // JetStream may return "no messages" JSON; only parse as protobuf if it looks like our message
        try {
          final msg = NatsMsgServerToClient.fromBuffer(Uint8List.fromList(raw));
          onMessage(msg);
        } catch (_) {
          // Ignore parse errors (e.g. no-messages response or non-proto payload)
        }
        // Ack: dart_nats may not expose reply subject for ack; server may redeliver after ack_wait
      } on TimeoutException {
        // No message available within timeout; skip
      } catch (e) {
        if (kDebugMode) print('JetStream pull error: $e');
      }
    });
  }

  void _stopJetStreamPull() {
    _jetStreamPullTimer?.cancel();
    _jetStreamPullTimer = null;
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
