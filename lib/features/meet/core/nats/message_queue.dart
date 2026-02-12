// MessageQueue - Outgoing Message Queue
// Clone of apps/meet/src/helpers/nats/MessageQueue.ts
//
// Responsibilities:
// - Queue outgoing messages
// - Handle message retry on failure
// - Handle message ordering
// - Handle message deduplication

import 'dart:collection';
import 'package:flutter/foundation.dart';

class MessageQueue {
  final Queue<_QueuedMessage> _queue = Queue();
  dynamic _js; // JetStreamClient
  bool _isConnected = false;
  
  /// Set JetStream client
  void setJs(dynamic js) {
    _js = js;
  }
  
  /// Set connection status
  void setIsConnected(bool connected) {
    _isConnected = connected;
    
    if (connected) {
      _processQueue();
    }
  }
  
  /// Add message to queue
  void enqueue(String subject, List<int> data, {int maxRetries = 3}) {
    final message = _QueuedMessage(
      subject: subject,
      data: data,
      maxRetries: maxRetries,
    );
    
    _queue.add(message);
    
    if (_isConnected) {
      _processQueue();
    }
  }
  
  /// Process queued messages
  Future<void> _processQueue() async {
    while (_queue.isNotEmpty && _isConnected) {
      final message = _queue.first;
      
      try {
        // Send message via JetStream
        // Note: dart_nats JetStream publish returns a Future<PubAck>
        // We await it to ensure the message was accepted by the stream
        await _js.publish(message.subject, message.data);
        
        _queue.removeFirst();
        
        if (kDebugMode) {
          print('MessageQueue: Sent message to ${message.subject}');
        }
      } catch (e) {
        if (kDebugMode) {
          print('MessageQueue: Failed to send message - $e');
        }
        
        message.retryCount++;
        
        if (message.retryCount >= message.maxRetries) {
          _queue.removeFirst();
          if (kDebugMode) {
            print('MessageQueue: Max retries reached, dropping message');
          }
        } else {
          // Retry after delay
          await Future.delayed(Duration(seconds: message.retryCount));
        }
      }
    }
  }
}

class _QueuedMessage {
  final String subject;
  final List<int> data;
  final int maxRetries;
  int retryCount = 0;
  
  _QueuedMessage({
    required this.subject,
    required this.data,
    required this.maxRetries,
  });
}
