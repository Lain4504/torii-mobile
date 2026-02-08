// This is a generated file - do not edit.
//
// Generated from wajlc_nats_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use natsMsgServerToClientEventsDescriptor instead')
const NatsMsgServerToClientEvents$json = {
  '1': 'NatsMsgServerToClientEvents',
  '2': [
    {'1': 'RES_INITIAL_DATA', '2': 0},
    {'1': 'RES_JOINED_USERS_LIST', '2': 1},
    {'1': 'RES_MEDIA_SERVER_DATA', '2': 2},
    {'1': 'ROOM_METADATA_UPDATE', '2': 3},
    {'1': 'USER_METADATA_UPDATE', '2': 4},
    {'1': 'USER_JOINED', '2': 5},
    {'1': 'USER_DISCONNECTED', '2': 6},
    {'1': 'USER_OFFLINE', '2': 7},
    {'1': 'RESP_RENEW_WAJLC_TOKEN', '2': 8},
    {'1': 'SYSTEM_NOTIFICATION', '2': 9},
    {'1': 'SESSION_ENDED', '2': 10},
    {'1': 'POLL_CLOSED', '2': 11},
    {'1': 'POLL_CREATED', '2': 12},
    {'1': 'JOIN_BREAKOUT_ROOM', '2': 13},
    {'1': 'BREAKOUT_ROOM_ENDED', '2': 14},
    {'1': 'SYSTEM_CHAT_MSG', '2': 15},
    {'1': 'TRANSCRIPTION_OUTPUT_TEXT', '2': 16},
    {'1': 'RESP_INSIGHTS_AI_TEXT_CHAT', '2': 17},
    {'1': 'RESP_ONLINE_USERS_LIST', '2': 18},
    {'1': 'DELIVERY_PRIVATE_DATA', '2': 19},
  ],
};

/// Descriptor for `NatsMsgServerToClientEvents`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List natsMsgServerToClientEventsDescriptor = $convert.base64Decode(
    'ChtOYXRzTXNnU2VydmVyVG9DbGllbnRFdmVudHMSFAoQUkVTX0lOSVRJQUxfREFUQRAAEhkKFV'
    'JFU19KT0lORURfVVNFUlNfTElTVBABEhkKFVJFU19NRURJQV9TRVJWRVJfREFUQRACEhgKFFJP'
    'T01fTUVUQURBVEFfVVBEQVRFEAMSGAoUVVNFUl9NRVRBREFUQV9VUERBVEUQBBIPCgtVU0VSX0'
    'pPSU5FRBAFEhUKEVVTRVJfRElTQ09OTkVDVEVEEAYSEAoMVVNFUl9PRkZMSU5FEAcSGgoWUkVT'
    'UF9SRU5FV19XQUpMQ19UT0tFThAIEhcKE1NZU1RFTV9OT1RJRklDQVRJT04QCRIRCg1TRVNTSU'
    '9OX0VOREVEEAoSDwoLUE9MTF9DTE9TRUQQCxIQCgxQT0xMX0NSRUFURUQQDBIWChJKT0lOX0JS'
    'RUFLT1VUX1JPT00QDRIXChNCUkVBS09VVF9ST09NX0VOREVEEA4SEwoPU1lTVEVNX0NIQVRfTV'
    'NHEA8SHQoZVFJBTlNDUklQVElPTl9PVVRQVVRfVEVYVBAQEh4KGlJFU1BfSU5TSUdIVFNfQUlf'
    'VEVYVF9DSEFUEBESGgoWUkVTUF9PTkxJTkVfVVNFUlNfTElTVBASEhkKFURFTElWRVJZX1BSSV'
    'ZBVEVfREFUQRAT');

@$core.Deprecated('Use natsMsgClientToServerEventsDescriptor instead')
const NatsMsgClientToServerEvents$json = {
  '1': 'NatsMsgClientToServerEvents',
  '2': [
    {'1': 'REQ_INITIAL_DATA', '2': 0},
    {'1': 'REQ_MEDIA_SERVER_DATA', '2': 1},
    {'1': 'REQ_JOINED_USERS_LIST', '2': 2},
    {'1': 'REQ_RENEW_WAJLC_TOKEN', '2': 3},
    {'1': 'PING', '2': 4},
    {'1': 'REQ_RAISE_HAND', '2': 5},
    {'1': 'REQ_LOWER_HAND', '2': 6},
    {'1': 'REQ_LOWER_OTHER_USER_HAND', '2': 7},
    {'1': 'PUSH_ANALYTICS_DATA', '2': 8},
    {'1': 'REQ_ONLINE_USERS_LIST', '2': 9},
    {'1': 'REQ_PRIVATE_DATA_DELIVERY', '2': 10},
  ],
};

/// Descriptor for `NatsMsgClientToServerEvents`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List natsMsgClientToServerEventsDescriptor = $convert.base64Decode(
    'ChtOYXRzTXNnQ2xpZW50VG9TZXJ2ZXJFdmVudHMSFAoQUkVRX0lOSVRJQUxfREFUQRAAEhkKFV'
    'JFUV9NRURJQV9TRVJWRVJfREFUQRABEhkKFVJFUV9KT0lORURfVVNFUlNfTElTVBACEhkKFVJF'
    'UV9SRU5FV19XQUpMQ19UT0tFThADEggKBFBJTkcQBBISCg5SRVFfUkFJU0VfSEFORBAFEhIKDl'
    'JFUV9MT1dFUl9IQU5EEAYSHQoZUkVRX0xPV0VSX09USEVSX1VTRVJfSEFORBAHEhcKE1BVU0hf'
    'QU5BTFlUSUNTX0RBVEEQCBIZChVSRVFfT05MSU5FX1VTRVJTX0xJU1QQCRIdChlSRVFfUFJJVk'
    'FURV9EQVRBX0RFTElWRVJZEAo=');

@$core.Deprecated('Use natsSystemNotificationTypesDescriptor instead')
const NatsSystemNotificationTypes$json = {
  '1': 'NatsSystemNotificationTypes',
  '2': [
    {'1': 'NATS_SYSTEM_NOTIFICATION_INFO', '2': 0},
    {'1': 'NATS_SYSTEM_NOTIFICATION_WARNING', '2': 1},
    {'1': 'NATS_SYSTEM_NOTIFICATION_ERROR', '2': 2},
  ],
};

/// Descriptor for `NatsSystemNotificationTypes`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List natsSystemNotificationTypesDescriptor =
    $convert.base64Decode(
        'ChtOYXRzU3lzdGVtTm90aWZpY2F0aW9uVHlwZXMSIQodTkFUU19TWVNURU1fTk9USUZJQ0FUSU'
        '9OX0lORk8QABIkCiBOQVRTX1NZU1RFTV9OT1RJRklDQVRJT05fV0FSTklORxABEiIKHk5BVFNf'
        'U1lTVEVNX05PVElGSUNBVElPTl9FUlJPUhAC');

@$core.Deprecated('Use natsSubjectsDescriptor instead')
const NatsSubjects$json = {
  '1': 'NatsSubjects',
  '2': [
    {'1': 'system_api_worker', '3': 1, '4': 1, '5': 9, '10': 'systemApiWorker'},
    {'1': 'system_js_worker', '3': 2, '4': 1, '5': 9, '10': 'systemJsWorker'},
    {'1': 'system_public', '3': 3, '4': 1, '5': 9, '10': 'systemPublic'},
    {'1': 'system_private', '3': 4, '4': 1, '5': 9, '10': 'systemPrivate'},
    {'1': 'chat', '3': 5, '4': 1, '5': 9, '10': 'chat'},
    {'1': 'whiteboard', '3': 6, '4': 1, '5': 9, '10': 'whiteboard'},
    {'1': 'data_channel', '3': 7, '4': 1, '5': 9, '10': 'dataChannel'},
  ],
};

/// Descriptor for `NatsSubjects`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List natsSubjectsDescriptor = $convert.base64Decode(
    'CgxOYXRzU3ViamVjdHMSKgoRc3lzdGVtX2FwaV93b3JrZXIYASABKAlSD3N5c3RlbUFwaVdvcm'
    'tlchIoChBzeXN0ZW1fanNfd29ya2VyGAIgASgJUg5zeXN0ZW1Kc1dvcmtlchIjCg1zeXN0ZW1f'
    'cHVibGljGAMgASgJUgxzeXN0ZW1QdWJsaWMSJQoOc3lzdGVtX3ByaXZhdGUYBCABKAlSDXN5c3'
    'RlbVByaXZhdGUSEgoEY2hhdBgFIAEoCVIEY2hhdBIeCgp3aGl0ZWJvYXJkGAYgASgJUgp3aGl0'
    'ZWJvYXJkEiEKDGRhdGFfY2hhbm5lbBgHIAEoCVILZGF0YUNoYW5uZWw=');

@$core.Deprecated('Use privateDataDeliveryDescriptor instead')
const PrivateDataDelivery$json = {
  '1': 'PrivateDataDelivery',
  '2': [
    {'1': 'to_user_id', '3': 1, '4': 1, '5': 9, '10': 'toUserId'},
    {'1': 'echo_to_sender', '3': 2, '4': 1, '5': 8, '10': 'echoToSender'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
  ],
};

/// Descriptor for `PrivateDataDelivery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List privateDataDeliveryDescriptor = $convert.base64Decode(
    'ChNQcml2YXRlRGF0YURlbGl2ZXJ5EhwKCnRvX3VzZXJfaWQYASABKAlSCHRvVXNlcklkEiQKDm'
    'VjaG9fdG9fc2VuZGVyGAIgASgIUgxlY2hvVG9TZW5kZXISEgoEdHlwZRgDIAEoCVIEdHlwZQ==');

@$core.Deprecated('Use natsMsgServerToClientDescriptor instead')
const NatsMsgServerToClient$json = {
  '1': 'NatsMsgServerToClient',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {
      '1': 'event',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.wajlc.NatsMsgServerToClientEvents',
      '10': 'event'
    },
    {'1': 'msg', '3': 3, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'bin_msg', '3': 4, '4': 1, '5': 12, '10': 'binMsg'},
  ],
};

/// Descriptor for `NatsMsgServerToClient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List natsMsgServerToClientDescriptor = $convert.base64Decode(
    'ChVOYXRzTXNnU2VydmVyVG9DbGllbnQSDgoCaWQYASABKAlSAmlkEjgKBWV2ZW50GAIgASgOMi'
    'Iud2FqbGMuTmF0c01zZ1NlcnZlclRvQ2xpZW50RXZlbnRzUgVldmVudBIQCgNtc2cYAyABKAlS'
    'A21zZxIXCgdiaW5fbXNnGAQgASgMUgZiaW5Nc2c=');

@$core.Deprecated('Use natsMsgClientToServerDescriptor instead')
const NatsMsgClientToServer$json = {
  '1': 'NatsMsgClientToServer',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {
      '1': 'event',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.wajlc.NatsMsgClientToServerEvents',
      '10': 'event'
    },
    {'1': 'msg', '3': 3, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'bin_msg', '3': 4, '4': 1, '5': 12, '10': 'binMsg'},
  ],
};

/// Descriptor for `NatsMsgClientToServer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List natsMsgClientToServerDescriptor = $convert.base64Decode(
    'ChVOYXRzTXNnQ2xpZW50VG9TZXJ2ZXISDgoCaWQYASABKAlSAmlkEjgKBWV2ZW50GAIgASgOMi'
    'Iud2FqbGMuTmF0c01zZ0NsaWVudFRvU2VydmVyRXZlbnRzUgVldmVudBIQCgNtc2cYAyABKAlS'
    'A21zZxIXCgdiaW5fbXNnGAQgASgMUgZiaW5Nc2c=');

@$core.Deprecated('Use natsKvRoomInfoDescriptor instead')
const NatsKvRoomInfo$json = {
  '1': 'NatsKvRoomInfo',
  '2': [
    {'1': 'db_table_id', '3': 1, '4': 1, '5': 4, '10': 'dbTableId'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_sid', '3': 3, '4': 1, '5': 9, '10': 'roomSid'},
    {'1': 'status', '3': 4, '4': 1, '5': 9, '10': 'status'},
    {'1': 'empty_timeout', '3': 5, '4': 1, '5': 4, '10': 'emptyTimeout'},
    {'1': 'max_participants', '3': 6, '4': 1, '5': 4, '10': 'maxParticipants'},
    {'1': 'metadata', '3': 7, '4': 1, '5': 9, '10': 'metadata'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 4, '10': 'createdAt'},
  ],
};

/// Descriptor for `NatsKvRoomInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List natsKvRoomInfoDescriptor = $convert.base64Decode(
    'Cg5OYXRzS3ZSb29tSW5mbxIeCgtkYl90YWJsZV9pZBgBIAEoBFIJZGJUYWJsZUlkEhcKB3Jvb2'
    '1faWQYAiABKAlSBnJvb21JZBIZCghyb29tX3NpZBgDIAEoCVIHcm9vbVNpZBIWCgZzdGF0dXMY'
    'BCABKAlSBnN0YXR1cxIjCg1lbXB0eV90aW1lb3V0GAUgASgEUgxlbXB0eVRpbWVvdXQSKQoQbW'
    'F4X3BhcnRpY2lwYW50cxgGIAEoBFIPbWF4UGFydGljaXBhbnRzEhoKCG1ldGFkYXRhGAcgASgJ'
    'UghtZXRhZGF0YRIdCgpjcmVhdGVkX2F0GAggASgEUgljcmVhdGVkQXQ=');

@$core.Deprecated('Use natsKvUserInfoDescriptor instead')
const NatsKvUserInfo$json = {
  '1': 'NatsKvUserInfo',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'user_sid', '3': 2, '4': 1, '5': 9, '10': 'userSid'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'room_id', '3': 4, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'is_admin', '3': 5, '4': 1, '5': 8, '10': 'isAdmin'},
    {'1': 'is_presenter', '3': 6, '4': 1, '5': 8, '10': 'isPresenter'},
    {'1': 'metadata', '3': 7, '4': 1, '5': 9, '10': 'metadata'},
    {'1': 'joined_at', '3': 8, '4': 1, '5': 4, '10': 'joinedAt'},
    {'1': 'reconnected_at', '3': 9, '4': 1, '5': 4, '10': 'reconnectedAt'},
    {'1': 'disconnected_at', '3': 10, '4': 1, '5': 4, '10': 'disconnectedAt'},
  ],
};

/// Descriptor for `NatsKvUserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List natsKvUserInfoDescriptor = $convert.base64Decode(
    'Cg5OYXRzS3ZVc2VySW5mbxIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSGQoIdXNlcl9zaWQYAi'
    'ABKAlSB3VzZXJTaWQSEgoEbmFtZRgDIAEoCVIEbmFtZRIXCgdyb29tX2lkGAQgASgJUgZyb29t'
    'SWQSGQoIaXNfYWRtaW4YBSABKAhSB2lzQWRtaW4SIQoMaXNfcHJlc2VudGVyGAYgASgIUgtpc1'
    'ByZXNlbnRlchIaCghtZXRhZGF0YRgHIAEoCVIIbWV0YWRhdGESGwoJam9pbmVkX2F0GAggASgE'
    'Ughqb2luZWRBdBIlCg5yZWNvbm5lY3RlZF9hdBgJIAEoBFINcmVjb25uZWN0ZWRBdBInCg9kaX'
    'Njb25uZWN0ZWRfYXQYCiABKARSDmRpc2Nvbm5lY3RlZEF0');

@$core.Deprecated('Use mediaServerConnInfoDescriptor instead')
const MediaServerConnInfo$json = {
  '1': 'MediaServerConnInfo',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
    {'1': 'enabled_e2ee', '3': 3, '4': 1, '5': 8, '10': 'enabledE2ee'},
  ],
};

/// Descriptor for `MediaServerConnInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaServerConnInfoDescriptor = $convert.base64Decode(
    'ChNNZWRpYVNlcnZlckNvbm5JbmZvEhAKA3VybBgBIAEoCVIDdXJsEhQKBXRva2VuGAIgASgJUg'
    'V0b2tlbhIhCgxlbmFibGVkX2UyZWUYAyABKAhSC2VuYWJsZWRFMmVl');

@$core.Deprecated('Use natsInitialDataDescriptor instead')
const NatsInitialData$json = {
  '1': 'NatsInitialData',
  '2': [
    {
      '1': 'room',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.wajlc.NatsKvRoomInfo',
      '10': 'room'
    },
    {
      '1': 'local_user',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.wajlc.NatsKvUserInfo',
      '10': 'localUser'
    },
    {
      '1': 'media_server_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.MediaServerConnInfo',
      '10': 'mediaServerInfo'
    },
  ],
};

/// Descriptor for `NatsInitialData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List natsInitialDataDescriptor = $convert.base64Decode(
    'Cg9OYXRzSW5pdGlhbERhdGESKQoEcm9vbRgBIAEoCzIVLndhamxjLk5hdHNLdlJvb21JbmZvUg'
    'Ryb29tEjQKCmxvY2FsX3VzZXIYAiABKAsyFS53YWpsYy5OYXRzS3ZVc2VySW5mb1IJbG9jYWxV'
    'c2VyEkYKEW1lZGlhX3NlcnZlcl9pbmZvGAMgASgLMhoud2FqbGMuTWVkaWFTZXJ2ZXJDb25uSW'
    '5mb1IPbWVkaWFTZXJ2ZXJJbmZv');

@$core.Deprecated('Use natsSystemNotificationDescriptor instead')
const NatsSystemNotification$json = {
  '1': 'NatsSystemNotification',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.wajlc.NatsSystemNotificationTypes',
      '10': 'type'
    },
    {'1': 'msg', '3': 3, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'sent_at', '3': 4, '4': 1, '5': 3, '10': 'sentAt'},
    {'1': 'with_sound', '3': 5, '4': 1, '5': 8, '10': 'withSound'},
  ],
};

/// Descriptor for `NatsSystemNotification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List natsSystemNotificationDescriptor = $convert.base64Decode(
    'ChZOYXRzU3lzdGVtTm90aWZpY2F0aW9uEg4KAmlkGAEgASgJUgJpZBI2CgR0eXBlGAIgASgOMi'
    'Iud2FqbGMuTmF0c1N5c3RlbU5vdGlmaWNhdGlvblR5cGVzUgR0eXBlEhAKA21zZxgDIAEoCVID'
    'bXNnEhcKB3NlbnRfYXQYBCABKANSBnNlbnRBdBIdCgp3aXRoX3NvdW5kGAUgASgIUgl3aXRoU2'
    '91bmQ=');

@$core.Deprecated('Use natsUserMetadataUpdateDescriptor instead')
const NatsUserMetadataUpdate$json = {
  '1': 'NatsUserMetadataUpdate',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'metadata', '3': 2, '4': 1, '5': 9, '10': 'metadata'},
  ],
};

/// Descriptor for `NatsUserMetadataUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List natsUserMetadataUpdateDescriptor =
    $convert.base64Decode(
        'ChZOYXRzVXNlck1ldGFkYXRhVXBkYXRlEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIaCghtZX'
        'RhZGF0YRgCIAEoCVIIbWV0YWRhdGE=');

@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = {
  '1': 'ChatMessage',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'from_name', '3': 2, '4': 1, '5': 9, '10': 'fromName'},
    {'1': 'from_user_id', '3': 3, '4': 1, '5': 9, '10': 'fromUserId'},
    {'1': 'sent_at', '3': 4, '4': 1, '5': 3, '10': 'sentAt'},
    {
      '1': 'to_user_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'toUserId',
      '17': true
    },
    {'1': 'is_private', '3': 6, '4': 1, '5': 8, '10': 'isPrivate'},
    {'1': 'message', '3': 7, '4': 1, '5': 9, '10': 'message'},
    {'1': 'from_admin', '3': 8, '4': 1, '5': 8, '10': 'fromAdmin'},
    {
      '1': 'source_lang',
      '3': 9,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'sourceLang',
      '17': true
    },
    {
      '1': 'translations',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.wajlc.ChatMessage.TranslationsEntry',
      '10': 'translations'
    },
  ],
  '3': [ChatMessage_TranslationsEntry$json],
  '8': [
    {'1': '_to_user_id'},
    {'1': '_source_lang'},
  ],
};

@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage_TranslationsEntry$json = {
  '1': 'TranslationsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode(
    'CgtDaGF0TWVzc2FnZRIOCgJpZBgBIAEoCVICaWQSGwoJZnJvbV9uYW1lGAIgASgJUghmcm9tTm'
    'FtZRIgCgxmcm9tX3VzZXJfaWQYAyABKAlSCmZyb21Vc2VySWQSFwoHc2VudF9hdBgEIAEoA1IG'
    'c2VudEF0EiEKCnRvX3VzZXJfaWQYBSABKAlIAFIIdG9Vc2VySWSIAQESHQoKaXNfcHJpdmF0ZR'
    'gGIAEoCFIJaXNQcml2YXRlEhgKB21lc3NhZ2UYByABKAlSB21lc3NhZ2USHQoKZnJvbV9hZG1p'
    'bhgIIAEoCFIJZnJvbUFkbWluEiQKC3NvdXJjZV9sYW5nGAkgASgJSAFSCnNvdXJjZUxhbmeIAQ'
    'ESSAoMdHJhbnNsYXRpb25zGAogAygLMiQud2FqbGMuQ2hhdE1lc3NhZ2UuVHJhbnNsYXRpb25z'
    'RW50cnlSDHRyYW5zbGF0aW9ucxo/ChFUcmFuc2xhdGlvbnNFbnRyeRIQCgNrZXkYASABKAlSA2'
    'tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBQg0KC190b191c2VyX2lkQg4KDF9zb3VyY2Vf'
    'bGFuZw==');
