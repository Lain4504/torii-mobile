import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../providers/participant_provider.dart';
import '../../../providers/session_provider.dart';
import '../../../providers/room_settings_provider.dart';
import '../../../data/datasources/meet_api_service.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_common_api.pb.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_nats_msg.pb.dart' as nats_msg;

/// Participant Item Widget with menu and waiting-approval state
class ParticipantItem extends ConsumerWidget {
  final ParticipantInfo participant;
  final bool isMe;

  const ParticipantItem({
    super.key,
    required this.participant,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaStatus = _resolveMediaStatus(ref);
    final hasAudio = mediaStatus.hasAudio;
    final hasVideo = mediaStatus.hasVideo;
    final isRaisedHand = participant.metadata.isHandRaised;
    final waitForApproval = participant.metadata.waitForApproval;
    final isPresenter = participant.metadata.isPresenter;
    final isAdmin = ref.watch(
      sessionProvider.select(
        (s) => s.currentUser?.metadata?.isAdmin ?? false,
      ),
    );
    final currentUser = ref.watch(sessionProvider.select((s) => s.currentUser));
    final roomFeatures = ref.watch(
      sessionProvider.select((s) => s.currentRoom.metadata?.roomFeatures),
    );
    // Note: defaultLockSettings may not be available in RoomInfo
    // Using null for now - web checks this from session.currentRoom.metadata?.defaultLockSettings
    final defaultLockSettings = null;
    final lockSettings = participant.metadata.lockSettings;

    return Row(
      children: [
        // Avatar
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            _getInitials(participant.name),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        const SizedBox(width: 12),
        
        // Name & Role
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isMe
                    ? '${_safeDisplayName(participant.name)} (You)'
                    : _safeDisplayName(participant.name),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (participant.metadata.isAdmin)
                Text(
                  'Host',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              if (waitForApproval)
                Text(
                  'Waiting for approval',
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.secondary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
            ],
          ),
        ),
        
        // Status Icons
        Row(
          children: [
            if (isRaisedHand)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.back_hand,
                  size: 16,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: hasVideo 
                    ? Colors.transparent 
                    : Theme.of(context).disabledColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                hasVideo ? Icons.videocam : Icons.videocam_off,
                size: 16,
                color: hasVideo 
                    ? Theme.of(context).colorScheme.onSurface 
                    : Theme.of(context).disabledColor,
              ),
            ),
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: hasAudio 
                    ? Colors.transparent 
                    : Theme.of(context).disabledColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                hasAudio ? Icons.mic : Icons.mic_off,
                size: 16,
                color: hasAudio 
                    ? Theme.of(context).colorScheme.onSurface 
                    : Theme.of(context).disabledColor,
              ),
            ),
            
            // Menu button for actions (admin or for others: private chat)
            if (!isMe)
              _buildParticipantMenu(
                context,
                ref,
                isAdmin,
                hasAudio,
                hasVideo,
                isRaisedHand,
                isPresenter,
                roomFeatures,
                defaultLockSettings,
                lockSettings,
                currentUser,
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildParticipantMenu(
    BuildContext context,
    WidgetRef ref,
    bool isAdmin,
    bool hasAudio,
    bool hasVideo,
    bool isRaisedHand,
    bool isPresenter,
    dynamic roomFeatures,
    dynamic defaultLockSettings,
    dynamic lockSettings,
    dynamic currentUser,
  ) {
    final menuItems = <PopupMenuEntry<String>>[];

    // Admin menu items
    if (isAdmin) {
      // Mute mic
      menuItems.add(
        PopupMenuItem(
          value: 'mute',
          child: ListTile(
            leading: const Icon(Icons.mic_off),
            title: Text(hasAudio ? 'Mute microphone' : 'Ask to share microphone'),
            contentPadding: EdgeInsets.zero,
          ),
        ),
      );

      // Webcam
      if (_safeGet(roomFeatures, 'allowWebcams', true) &&
          _safeGet(roomFeatures, 'adminOnlyWebcams', false) != true) {
        menuItems.add(
          PopupMenuItem(
            value: 'webcam',
            child: ListTile(
              leading: const Icon(Icons.videocam),
              title: Text(hasVideo ? 'Ask to stop webcam' : 'Ask to share webcam'),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        );
      }

      // Private chat
      menuItems.add(
        PopupMenuItem(
          value: 'private_chat',
          child: ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Private chat'),
            contentPadding: EdgeInsets.zero,
          ),
        ),
      );

      // Switch presenter
      menuItems.add(
        PopupMenuItem(
          value: 'presenter',
          child: ListTile(
            leading: const Icon(Icons.person_pin),
            title: Text(isPresenter ? 'Demote presenter' : 'Make presenter'),
            contentPadding: EdgeInsets.zero,
          ),
        ),
      );

      // Lower hand
      if (isRaisedHand) {
        menuItems.add(
          PopupMenuItem(
            value: 'lower_hand',
            child: ListTile(
              leading: const Icon(Icons.back_hand_outlined),
              title: const Text('Lower hand'),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        );
      }

      // Lock settings submenu
      final lockableFeatures = <Map<String, dynamic>>[];
      if (_safeGet(roomFeatures, 'allowWebcams', true) &&
          _safeGet(roomFeatures, 'adminOnlyWebcams', false) != true) {
        lockableFeatures.add({
          'key': 'webcam',
          'isLocked': _getLockSettingValue(lockSettings, 'lockWebcam'),
          'lockText': 'Lock webcam',
          'unlockText': 'Unlock webcam',
        });
      }
      if (_safeGet(roomFeatures, 'allowScreenShare', true)) {
        lockableFeatures.add({
          'key': 'screenShare',
          'isLocked': _getLockSettingValue(lockSettings, 'lockScreenSharing'),
          'lockText': 'Lock screen sharing',
          'unlockText': 'Unlock screen sharing',
        });
      }
      if (_safeGet(roomFeatures?.whiteboardFeatures, 'isAllow', false)) {
        lockableFeatures.add({
          'key': 'whiteboard',
          'isLocked': lockSettings?.lockWhiteboard ?? false,
          'lockText': 'Lock whiteboard',
          'unlockText': 'Unlock whiteboard',
        });
      }
      if (_safeGet(roomFeatures?.chatFeatures, 'isAllow', false)) {
        lockableFeatures.add({
          'key': 'chat',
          'isLocked': lockSettings?.lockChat ?? false,
          'lockText': 'Lock chat',
          'unlockText': 'Unlock chat',
        });
        lockableFeatures.add({
          'key': 'sendChatMsg',
          'isLocked': _getLockSettingValue(lockSettings, 'lockChatSendMessage'),
          'lockText': 'Lock send chat message',
          'unlockText': 'Unlock send chat message',
        });
        if (_safeGet(roomFeatures?.chatFeatures, 'isAllowFileUpload', false)) {
          lockableFeatures.add({
            'key': 'chatFile',
            'isLocked': _getLockSettingValue(lockSettings, 'lockChatFileShare'),
            'lockText': 'Lock send file',
            'unlockText': 'Unlock send file',
          });
        }
      }

      for (final feature in lockableFeatures) {
        menuItems.add(
          PopupMenuItem(
            value: 'lock_${feature['key']}',
            child: ListTile(
              leading: Icon(
                feature['isLocked'] == true ? Icons.lock : Icons.lock_open,
              ),
              title: Text(
                feature['isLocked'] == true
                    ? feature['unlockText'] as String
                    : feature['lockText'] as String,
              ),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        );
      }

      // Remove
      menuItems.add(
        PopupMenuItem(
          value: 'remove',
          child: ListTile(
            leading: Icon(Icons.person_remove, color: Theme.of(context).colorScheme.error),
            title: Text('Remove', style: TextStyle(color: Theme.of(context).colorScheme.error)),
            contentPadding: EdgeInsets.zero,
          ),
        ),
      );
    } else {
      // Non-admin: check if can send private message
      final canSendPrivateMessage =
          !_safeGet(currentUser?.metadata?.lockSettings, 'lockPrivateChat', false) &&
          !(defaultLockSettings?.lockChat ?? false) &&
          !_safeGet(defaultLockSettings, 'lockPrivateChat', false);

      final canSendPrivateMessageToAdmin =
          !(defaultLockSettings?.lockChat ?? false) &&
          _safeGet(defaultLockSettings, 'lockPrivateChat', false) &&
          participant.metadata.isAdmin;

      if (canSendPrivateMessage || canSendPrivateMessageToAdmin) {
        menuItems.add(
          PopupMenuItem(
            value: 'private_chat',
            child: ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('Private chat'),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        );
      }
    }

    if (menuItems.isEmpty) {
      return const SizedBox.shrink();
    }

    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, size: 20),
      onSelected: (value) => _onMenuSelected(context, ref, value),
      itemBuilder: (context) => menuItems,
    );
  }

  Future<void> _onMenuSelected(
    BuildContext context,
    WidgetRef ref,
    String value,
  ) async {
    final session = ref.read(sessionProvider);
    final api = ref.read(meetApiServiceProvider);
    final roomId = session.currentRoom.roomId;
    final sid = session.currentRoom.sid;
    final currentUser = session.currentUser;

    try {
      if (value == 'mute') {
        // Check if participant has audio tracks
        if (participant.hasAudioTrack) {
          await api.muteUnmuteTrack(
            MuteUnMuteTrackReq(
              sid: sid,
              roomId: roomId,
              userId: participant.userId,
              muted: participant.hasAudioTrack,
            ),
          );
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Muted ${participant.name}')),
            );
          }
        } else {
          // Ask to share microphone via data message
          final natsConn = ref.read(sessionProvider.notifier).natsConn;
          if (natsConn != null) {
            await natsConn.sendDataMessage(
              type: 'INFO',
              msg: '${currentUser?.name ?? 'Someone'} asked you to share microphone',
              toUserId: participant.userId,
            );
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Asked ${participant.name} to share microphone')),
              );
            }
          }
        }
      } else if (value == 'webcam') {
        // Ask to share/stop webcam via data message
        final natsConn = ref.read(sessionProvider.notifier).natsConn;
        if (natsConn != null) {
          final task = participant.hasVideoTrack
              ? 'stop webcam'
              : 'share webcam';
          await natsConn.sendDataMessage(
            type: 'INFO',
            msg: '${currentUser?.name ?? 'Someone'} asked you to $task',
            toUserId: participant.userId,
          );
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Asked ${participant.name} to $task')),
            );
          }
        }
      } else if (value == 'presenter') {
        await api.switchPresenter(
          SwitchPresenterReq(
            task: participant.metadata.isPresenter
                ? SwitchPresenterTask.DEMOTE
                : SwitchPresenterTask.PROMOTE,
            roomId: roomId,
            userId: participant.userId,
          ),
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                participant.metadata.isPresenter
                    ? '${participant.name} is no longer presenter'
                    : '${participant.name} is now presenter',
              ),
            ),
          );
        }
      } else if (value == 'lower_hand') {
        // Send lower hand request to system worker
        final natsConn = ref.read(sessionProvider.notifier).natsConn;
        if (natsConn != null) {
          natsConn.sendMessageToSystemWorker(
            nats_msg.NatsMsgClientToServer(
              event: nats_msg.NatsMsgClientToServerEvents.REQ_LOWER_OTHER_USER_HAND,
              msg: participant.userId,
            ),
          );
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Lowered ${participant.name}\'s hand')),
            );
          }
        }
      } else if (value.startsWith('lock_')) {
        final service = value.substring(5); // Remove 'lock_' prefix
        final settingKey = _getLockSettingKey(service);
        final isLocked = _getLockSettingValue(participant.metadata.lockSettings, settingKey);
        final direction = isLocked ? 'unlock' : 'lock';

        await api.updateUserLockSettings(
          UpdateUserLockSettingsReq(
            roomSid: sid,
            roomId: roomId,
            userId: participant.userId,
            service: service,
            direction: direction,
          ),
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${direction == 'lock' ? 'Locked' : 'Unlocked'} $service for ${participant.name}')),
          );
        }
      } else if (value == 'remove') {
        await api.removeParticipant(
          RemoveParticipantReq(
            sid: sid,
            roomId: roomId,
            userId: participant.userId,
            msg: 'You have been removed from the meeting.',
            blockUser: false,
          ),
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Removed ${participant.name}')),
          );
        }
      } else if (value == 'private_chat') {
        // Initiate private chat
        ref.read(roomSettingsProvider.notifier).updateInitiatePrivateChat(
          InitiatePrivateChat(
            name: participant.name,
            userId: participant.userId,
          ),
        );
        ref.read(roomSettingsProvider.notifier).updateSelectedChatOption(participant.userId);
        // TODO: Open chat bottom sheet/panel
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Opening private chat with ${participant.name}'),
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  String _getLockSettingKey(String service) {
    switch (service) {
      case 'mic':
        return 'lockMicrophone';
      case 'webcam':
        return 'lockWebcam';
      case 'screenShare':
        return 'lockScreenSharing';
      case 'whiteboard':
        return 'lockWhiteboard';
      case 'chat':
        return 'lockChat';
      case 'sendChatMsg':
        return 'lockChatSendMessage';
      case 'chatFile':
        return 'lockChatFileShare';
      default:
        return '';
    }
  }

  bool _getLockSettingValue(dynamic lockSettings, String key) {
    if (lockSettings == null) return false;
    // Access lockSettings properties based on key
    switch (key) {
      case 'lockMicrophone':
        return lockSettings.lockMic ?? false;
      case 'lockWebcam':
        return lockSettings.lockCamera ?? false;
      case 'lockScreenSharing':
        return lockSettings.lockScreenShare ?? false;
      case 'lockWhiteboard':
        return lockSettings.lockWhiteboard ?? false;
      case 'lockChat':
        return lockSettings.lockChat ?? false;
      case 'lockChatSendMessage':
        // Note: LockSettings may not have this field - using lockChat as fallback
        return lockSettings.lockChat ?? false;
      case 'lockChatFileShare':
        // Note: LockSettings may not have this field - using lockChat as fallback
        return lockSettings.lockChat ?? false;
      default:
        return false;
    }
  }

  String _getInitials(String name) {
    final normalized = name.trim();
    if (normalized.isEmpty) return '?';
    final parts = normalized
        .split(RegExp(r'\s+'))
        .where((e) => e.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) {
      final first = parts[0];
      return first.isNotEmpty ? first[0].toUpperCase() : '?';
    }
    final first = parts.first;
    final last = parts.last;
    if (first.isEmpty || last.isEmpty) return '?';
    return '${first[0]}${last[0]}'.toUpperCase();
  }

  String _safeDisplayName(String name) {
    final n = name.trim();
    return n.isEmpty ? 'Unknown user' : n;
  }

  _ParticipantMediaStatus _resolveMediaStatus(WidgetRef ref) {
    final fallback = _ParticipantMediaStatus(
      hasAudio: participant.hasAudioTrack,
      hasVideo: participant.hasVideoTrack,
    );

    final conn = ref.read(sessionProvider.notifier).livekitConn;
    final room = conn?.room;
    if (room == null) return fallback;

    Participant? lkParticipant;
    if (room.localParticipant?.identity == participant.userId) {
      lkParticipant = room.localParticipant;
    } else {
      lkParticipant = room.remoteParticipants[participant.userId];
    }
    if (lkParticipant == null) return fallback;

    bool micOn = false;
    for (final pub in lkParticipant.audioTrackPublications) {
      if (pub.source == TrackSource.microphone &&
          pub.track != null &&
          !pub.muted) {
        micOn = true;
        break;
      }
    }

    bool camOn = false;
    for (final pub in lkParticipant.videoTrackPublications) {
      if (pub.source == TrackSource.camera &&
          pub.track != null &&
          !pub.muted) {
        camOn = true;
        break;
      }
    }

    return _ParticipantMediaStatus(
      hasAudio: micOn,
      hasVideo: camOn,
    );
  }

  /// Safely get a property from an object that might not have it defined or might be null.
  /// Useful when generated code is out of sync with models.
  dynamic _safeGet(dynamic obj, String key, dynamic defaultValue) {
    if (obj == null) return defaultValue;
    try {
      // Try to call the getter dynamically
      return (obj as dynamic).toJson()[key] ?? defaultValue;
    } catch (_) {
      try {
        // Fallback: use mirrors-like access if it was added manually to the class
        // but re-generation didn't happen yet.
        if (key == 'allowWebcams') return (obj as dynamic).allowWebcams ?? defaultValue;
        if (key == 'adminOnlyWebcams') return (obj as dynamic).adminOnlyWebcams ?? defaultValue;
        if (key == 'allowScreenShare') return (obj as dynamic).allowScreenShare ?? defaultValue;
      } catch (_) {}
      return defaultValue;
    }
  }
}

class _ParticipantMediaStatus {
  final bool hasAudio;
  final bool hasVideo;

  const _ParticipantMediaStatus({
    required this.hasAudio,
    required this.hasVideo,
  });
}
