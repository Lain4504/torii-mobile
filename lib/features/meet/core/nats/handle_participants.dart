// HandleParticipants - Participant Events Handler
// Simplified version of apps/meet/src/helpers/nats/HandleParticipants.ts
//
// Responsibilities:
// - Handle user joined events
// - Handle user left events
// - Handle user metadata updates
// - Update participant provider
// - Handle waiting room users
// - Handle raise hand events

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart' as nats_msg;
import 'package:torii_app/features/meet/data/models/user_metadata.dart';
import 'package:torii_app/features/meet/providers/bottom_icons_provider.dart';
import 'package:torii_app/features/meet/providers/participant_provider.dart';
import 'package:torii_app/features/meet/providers/room_settings_provider.dart';
import 'package:torii_app/features/meet/providers/session_provider.dart';
import 'connect_nats.dart';

class HandleParticipants {
  final ConnectNats connectNats;
  final Ref? ref; // Riverpod ref for accessing providers
  
  // Interval for checking empty room
  dynamic _participantCounterInterval;
  
  HandleParticipants({
    required this.connectNats,
    this.ref,
  });

  /// Add local user from initial data (matches addLocalParticipantInfo in HandleParticipants.ts).
  /// Updates session currentUser and participant list.
  void addLocalParticipantInfo(nats_msg.NatsKvUserInfo info) {
    final Map<String, dynamic> rawMetadata = info.hasMetadata() && info.metadata.isNotEmpty
        ? jsonDecode(info.metadata)
        : {};
    final displayName = _resolveDisplayName(info.name, rawMetadata, info.userId);
    final metadata = UserMetadata.fromJson(_normalizeMetadata(rawMetadata));
    
    final isRecorder = _isUserRecorder(info.userId);
    final currentUser = CurrentUser(
      sid: info.userSid,
      userId: info.userId,
      name: displayName,
      isRecorder: isRecorder,
      metadata: metadata,
    );
    ref?.read(sessionProvider.notifier).addCurrentUser(currentUser);
    ref?.read(participantProvider.notifier).addParticipant(
      ParticipantInfo(
        userId: info.userId,
        sid: info.userSid,
        name: displayName,
        metadata: metadata,
      ),
    );
    ref?.read(bottomIconsProvider.notifier).updateIsActiveRaisehand(
      metadata.isHandRaised || metadata.raisedHand,
    );
    if (kDebugMode) {
      print('HandleParticipants: Local user set - $displayName');
    }
  }
  
  /// Handle user joined event
  /// Matches: addRemoteParticipant() in HandleParticipants.ts
  Future<void> handleUserJoined(nats_msg.NatsKvUserInfo userInfo) async {
    // Skip if it's the local user
    if (userInfo.userId == connectNats.userId) {
      return;
    }
    
    // Skip recorder bots
    if (_isUserRecorder(userInfo.userId)) {
      return;
    }
    
    // Parse metadata
    final Map<String, dynamic> rawMetadata = userInfo.hasMetadata() && userInfo.metadata.isNotEmpty
        ? jsonDecode(userInfo.metadata)
        : {};
    final displayName = _resolveDisplayName(userInfo.name, rawMetadata, userInfo.userId);
    final metadata = UserMetadata.fromJson(_normalizeMetadata(rawMetadata));
    
    // Add participant to provider
    ref?.read(participantProvider.notifier).addParticipant(
      ParticipantInfo(
        userId: userInfo.userId,
        sid: userInfo.userSid,
        name: displayName,
        metadata: metadata,
      ),
    );
    
    // Show notification
    _showUserJoinedNotification(displayName);
    
    if (kDebugMode) {
      print('HandleParticipants: User joined - $displayName');
    }
  }
  
  /// Handle user left event
  /// Matches: handleParticipantDisconnected() in HandleParticipants.ts
  void handleUserLeft(String userId) {
    // Skip if it's the local user
    if (userId == connectNats.userId) {
      return;
    }
    
    // Remove participant from provider
    final participant = ref?.read(participantProvider).participants[userId];
    if (participant != null) {
      ref?.read(participantProvider.notifier).removeParticipant(userId);
      _showUserLeftNotification(participant.name);
    }
    
    if (kDebugMode) {
      print('HandleParticipants: User left - $userId');
    }
  }
  
  /// Handle user metadata update
  /// Matches: handleParticipantMetadataUpdate() in HandleParticipants.ts
  void handleUserMetadataUpdate(nats_msg.NatsKvUserInfo userInfo) {
    // Parse metadata
    final Map<String, dynamic> rawMetadata = userInfo.hasMetadata() && userInfo.metadata.isNotEmpty
        ? jsonDecode(userInfo.metadata)
        : {};
    final displayName = _resolveDisplayName(userInfo.name, rawMetadata, userInfo.userId);
    final metadata = UserMetadata.fromJson(_normalizeMetadata(rawMetadata));

    // Skip if it's the local user
    if (userInfo.userId == connectNats.userId) {
      // Update local user metadata
      ref?.read(sessionProvider.notifier).updateCurrentUserMetadata(metadata);
      connectNats.updateLocalUserWaitingForApproval(metadata.waitForApproval);
      // Sync raise hand state to footer UI
      ref?.read(bottomIconsProvider.notifier).updateIsActiveRaisehand(
        metadata.isHandRaised || metadata.raisedHand,
      );

      // Web Landing: finalizeAppConn when waitForApproval becomes false.
      if (!metadata.waitForApproval) {
        connectNats.notifyFinalizeAppConnIfPending();
      }

      if (kDebugMode) {
        print('HandleParticipants: Local user metadata updated');
      }
      return;
    }
    
    // Update remote participant
    // Dispatch to participant provider
    ref?.read(participantProvider.notifier).updateParticipant(
      userId: userInfo.userId,
      changes: {
        if (displayName.trim().isNotEmpty) 'name': displayName,
        'metadata': metadata,
      },
    );
    
    // Handle raise hand updates
    if (metadata.raisedHand) {
      _handleRaiseHand(displayName);
    }
    
    if (kDebugMode) {
      print('HandleParticipants: User metadata updated - $displayName');
    }
  }
  
  /// Handle raise hand event
  void _handleRaiseHand(String name) {
    // Only show notification if user is admin
    if (!connectNats.isAdmin) {
      return;
    }
    
    // Show notification
    ref?.read(roomSettingsProvider.notifier).addUserNotification(
      UserNotification(
        message: '$name đã giơ tay',
        typeOption: 'info',
      ),
    );
    
    // Update raise hand state
    ref?.read(bottomIconsProvider.notifier).updateIsActiveRaisehand(true);
    
    if (kDebugMode) {
      print('HandleParticipants: $name raised hand');
    }
  }
  
  /// Show user joined notification
  void _showUserJoinedNotification(String userName) {
    // Dispatch to room settings provider
    ref?.read(roomSettingsProvider.notifier).addUserNotification(
      UserNotification(
        message: '$userName đã tham gia',
        typeOption: 'info',
      ),
    );
    
    if (kDebugMode) {
      print('HandleParticipants: Notification - $userName joined');
    }
  }
  
  /// Show user left notification
  void _showUserLeftNotification(String userName) {
    // Dispatch to room settings provider
    ref?.read(roomSettingsProvider.notifier).addUserNotification(
      UserNotification(
        message: '$userName đã rời đi',
        typeOption: 'info',
      ),
    );
    
    if (kDebugMode) {
      print('HandleParticipants: Notification - $userName left');
    }
  }
  
  /// Check if user is a recorder bot
  bool _isUserRecorder(String userId) {
    return userId.startsWith('RECORDER_BOT') || userId.startsWith('RTMP_BOT');
  }
  
  /// Clear participant counter interval
  void clearParticipantCounterInterval() {
    _participantCounterInterval?.cancel();
    _participantCounterInterval = null;
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

  String _resolveDisplayName(
    String rawName,
    Map<String, dynamic> metadata,
    String userId,
  ) {
    final trimmed = rawName.trim();
    if (trimmed.isNotEmpty) return trimmed;

    final candidates = <dynamic>[
      metadata['name'],
      metadata['userName'],
      metadata['displayName'],
      metadata['nickname'],
    ];
    for (final c in candidates) {
      if (c is String && c.trim().isNotEmpty) return c.trim();
    }
    return userId;
  }

  /// Reconcile participants list against server snapshot (similar to web reconcileParticipants).
  ///
  /// Important: This method is intentionally "silent" (no join/leave notifications)
  /// because it is expected to run periodically.
  Future<void> reconcileParticipants(List<nats_msg.NatsKvUserInfo> serverUsers) async {
    if (ref == null) return;

    final localState = ref!.read(participantProvider);
    final localIds = localState.participants.keys.toSet();

    final serverIds = serverUsers.map((u) => u.userId).toSet();

    // 1) Add missing participants
    for (final userInfo in serverUsers) {
      if (_isUserRecorder(userInfo.userId)) continue; // skip recorder bots
      final rawMetadata = userInfo.hasMetadata() && userInfo.metadata.isNotEmpty
          ? jsonDecode(userInfo.metadata) as Map<String, dynamic>
          : <String, dynamic>{};
      final metadata = UserMetadata.fromJson(_normalizeMetadata(rawMetadata));
      final displayName =
          _resolveDisplayName(userInfo.name, rawMetadata, userInfo.userId);

      if (localIds.contains(userInfo.userId)) {
        // Refresh existing participant data from authoritative server snapshot.
        ref!.read(participantProvider.notifier).updateParticipant(
          userId: userInfo.userId,
          changes: {
            if (displayName.trim().isNotEmpty) 'name': displayName,
            'sid': userInfo.userSid,
            'metadata': metadata,
          },
        );
        continue;
      }

      ref!.read(participantProvider.notifier).addParticipant(
            ParticipantInfo(
              userId: userInfo.userId,
              sid: userInfo.userSid,
              name: displayName,
              metadata: metadata,
            ),
          );
    }

    // 2) Remove stale participants
    for (final localUserId in localIds) {
      if (localUserId == connectNats.userId) continue; // never remove local
      if (serverIds.contains(localUserId)) continue;

      ref!.read(participantProvider.notifier).removeParticipant(localUserId);
    }
  }
}
