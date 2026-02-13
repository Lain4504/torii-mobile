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
    final metadata = info.hasMetadata() && info.metadata.isNotEmpty
        ? UserMetadata.fromJson(jsonDecode(info.metadata))
        : const UserMetadata();
    final isRecorder = _isUserRecorder(info.userId);
    final currentUser = CurrentUser(
      sid: info.userSid,
      userId: info.userId,
      name: info.name,
      isRecorder: isRecorder,
      metadata: metadata,
    );
    ref?.read(sessionProvider.notifier).addCurrentUser(currentUser);
    ref?.read(participantProvider.notifier).addParticipant(
      ParticipantInfo(
        userId: info.userId,
        sid: info.userSid,
        name: info.name,
        metadata: metadata,
      ),
    );
    ref?.read(bottomIconsProvider.notifier).updateIsActiveRaisehand(
      metadata.isHandRaised || metadata.raisedHand,
    );
    if (kDebugMode) {
      print('HandleParticipants: Local user set - ${info.name}');
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
    final metadata = userInfo.hasMetadata() && userInfo.metadata.isNotEmpty
        ? UserMetadata.fromJson(jsonDecode(userInfo.metadata))
        : const UserMetadata();
    
    // Add participant to provider
    ref?.read(participantProvider.notifier).addParticipant(
      ParticipantInfo(
        userId: userInfo.userId,
        sid: userInfo.userSid,
        name: userInfo.name,
        metadata: metadata,
      ),
    );
    
    // Show notification
    _showUserJoinedNotification(userInfo.name);
    
    if (kDebugMode) {
      print('HandleParticipants: User joined - ${userInfo.name}');
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
    
    // Note: Active speakers provider not implemented yet
    // Will be added in future sprint
    
    if (kDebugMode) {
      print('HandleParticipants: User left - $userId');
    }
  }
  
  /// Handle user metadata update
  /// Matches: handleParticipantMetadataUpdate() in HandleParticipants.ts
  void handleUserMetadataUpdate(nats_msg.NatsKvUserInfo userInfo) {
    // Parse metadata
    final metadata = userInfo.hasMetadata() && userInfo.metadata.isNotEmpty
        ? UserMetadata.fromJson(jsonDecode(userInfo.metadata))
        : const UserMetadata();

    // Skip if it's the local user
    if (userInfo.userId == connectNats.userId) {
      // Update local user metadata
      ref?.read(sessionProvider.notifier).updateCurrentUserMetadata(metadata);
      // Sync raise hand state to footer UI
      ref?.read(bottomIconsProvider.notifier).updateIsActiveRaisehand(
        metadata.isHandRaised || metadata.raisedHand,
      );

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
        'name': userInfo.name,
        'metadata': metadata,
      },
    );
    
    // Handle raise hand updates
    if (metadata.raisedHand) {
      _handleRaiseHand(userInfo.name);
    }
    
    if (kDebugMode) {
      print('HandleParticipants: User metadata updated - ${userInfo.name}');
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
}
