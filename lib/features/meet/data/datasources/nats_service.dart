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
    
    // Auth using token in URL if ConnectOptions not avail
    // or try passing token in connect if supported.
    // Based on dart_nats 0.4.x, we may need to put token in URI
    String finalUrl = urls.first;
    if (!finalUrl.contains('@') && token.isNotEmpty) {
      final uri = Uri.parse(finalUrl);
      finalUrl = '${uri.scheme}://$token@${uri.host}:${uri.port}${uri.path}';
    }

    try {
      final url = Uri.parse(finalUrl);
      await _client!.connect(url);
      
      // Monitor status
      _client!.statusStream.listen((status) {
        final isConnected = status == nats.Status.connected;
        onConnectionStatusChanged?.call(isConnected);
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

  void sendMessage(String subject, Uint8List data) {
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
