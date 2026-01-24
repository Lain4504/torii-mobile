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
  
  // Event callbacks
  Function(NatsMsgServerToClient)? onSystemEvent;
  Function(bool)? onConnectionStatusChanged;

  Future<void> connect({
    required List<String> urls,
    required String token,
  }) async {
    _client = nats.Client();
    
    // Auth using token
    final opts = nats.ConnectOptions(
      token: token,
      verbose: true,
    );

    try {
      // Connect to first available URL
      // Note: dart_nats connect takes a single URL, we might need to retry others if fails
      final url = urls.first;
      await _client!.connect(Uri.parse(url), options: opts);
      
      onConnectionStatusChanged?.call(true);
      
      if (kDebugMode) {
        print('NATS connected to $url');
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
    required Function(Uint8Array) onData,
  }) async {
    if (_client == null) return;
    
    final sub = _client!.subscribe(subject);
    final subscription = sub.stream.listen((msg) {
      onData(msg.byte as Uint8Array);
    });
    _subscriptions.add(subscription);
  }

  void sendMessage(String subject, Uint8Array data) {
    _client?.pub(subject, data);
  }

  Future<void> disconnect() async {
    for (var sub in _subscriptions) {
      await sub.cancel();
    }
    _subscriptions.clear();
    _client?.close();
    _client = null;
    onConnectionStatusChanged?.call(false);
  }

  // Specialized send methods matching Web
  void sendMessageToSystemWorker({
    required String subject,
    required NatsMsgClientToServer data,
  }) {
    sendMessage(subject, data.writeToBuffer());
  }
}
