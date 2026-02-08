// This is a generated file - do not edit.
//
// Generated from wajlc_auth_room.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getActiveRoomInfoReqDescriptor instead')
const GetActiveRoomInfoReq$json = {
  '1': 'GetActiveRoomInfoReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'roomId'},
  ],
};

/// Descriptor for `GetActiveRoomInfoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getActiveRoomInfoReqDescriptor = $convert.base64Decode(
    'ChRHZXRBY3RpdmVSb29tSW5mb1JlcRIfCgdyb29tX2lkGAEgASgJQga6SAPIAQFSBnJvb21JZA'
    '==');

@$core.Deprecated('Use activeRoomInfoResDescriptor instead')
const ActiveRoomInfoRes$json = {
  '1': 'ActiveRoomInfoRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'room_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.ActiveRoomInfo',
      '9': 0,
      '10': 'roomInfo',
      '17': true
    },
    {
      '1': 'participants_info',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.livekit.ParticipantInfo',
      '10': 'participantsInfo'
    },
  ],
  '8': [
    {'1': '_room_info'},
  ],
};

/// Descriptor for `ActiveRoomInfoRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activeRoomInfoResDescriptor = $convert.base64Decode(
    'ChFBY3RpdmVSb29tSW5mb1JlcxIWCgZzdGF0dXMYASABKAhSBnN0YXR1cxIQCgNtc2cYAiABKA'
    'lSA21zZxI3Cglyb29tX2luZm8YAyABKAsyFS53YWpsYy5BY3RpdmVSb29tSW5mb0gAUghyb29t'
    'SW5mb4gBARJFChFwYXJ0aWNpcGFudHNfaW5mbxgEIAMoCzIYLmxpdmVraXQuUGFydGljaXBhbn'
    'RJbmZvUhBwYXJ0aWNpcGFudHNJbmZvQgwKCl9yb29tX2luZm8=');

@$core.Deprecated('Use activeRoomInfoDescriptor instead')
const ActiveRoomInfo$json = {
  '1': 'ActiveRoomInfo',
  '2': [
    {'1': 'room_title', '3': 1, '4': 1, '5': 9, '10': 'roomTitle'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'sid', '3': 3, '4': 1, '5': 9, '10': 'sid'},
    {
      '1': 'joined_participants',
      '3': 4,
      '4': 1,
      '5': 3,
      '10': 'joinedParticipants'
    },
    {'1': 'is_running', '3': 5, '4': 1, '5': 5, '10': 'isRunning'},
    {'1': 'is_recording', '3': 6, '4': 1, '5': 5, '10': 'isRecording'},
    {'1': 'is_active_rtmp', '3': 7, '4': 1, '5': 5, '10': 'isActiveRtmp'},
    {'1': 'webhook_url', '3': 8, '4': 1, '5': 9, '10': 'webhookUrl'},
    {'1': 'is_breakout_room', '3': 9, '4': 1, '5': 5, '10': 'isBreakoutRoom'},
    {'1': 'parent_room_id', '3': 10, '4': 1, '5': 9, '10': 'parentRoomId'},
    {'1': 'creation_time', '3': 11, '4': 1, '5': 3, '10': 'creationTime'},
    {'1': 'metadata', '3': 12, '4': 1, '5': 9, '10': 'metadata'},
  ],
};

/// Descriptor for `ActiveRoomInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activeRoomInfoDescriptor = $convert.base64Decode(
    'Cg5BY3RpdmVSb29tSW5mbxIdCgpyb29tX3RpdGxlGAEgASgJUglyb29tVGl0bGUSFwoHcm9vbV'
    '9pZBgCIAEoCVIGcm9vbUlkEhAKA3NpZBgDIAEoCVIDc2lkEi8KE2pvaW5lZF9wYXJ0aWNpcGFu'
    'dHMYBCABKANSEmpvaW5lZFBhcnRpY2lwYW50cxIdCgppc19ydW5uaW5nGAUgASgFUglpc1J1bm'
    '5pbmcSIQoMaXNfcmVjb3JkaW5nGAYgASgFUgtpc1JlY29yZGluZxIkCg5pc19hY3RpdmVfcnRt'
    'cBgHIAEoBVIMaXNBY3RpdmVSdG1wEh8KC3dlYmhvb2tfdXJsGAggASgJUgp3ZWJob29rVXJsEi'
    'gKEGlzX2JyZWFrb3V0X3Jvb20YCSABKAVSDmlzQnJlYWtvdXRSb29tEiQKDnBhcmVudF9yb29t'
    'X2lkGAogASgJUgxwYXJlbnRSb29tSWQSIwoNY3JlYXRpb25fdGltZRgLIAEoA1IMY3JlYXRpb2'
    '5UaW1lEhoKCG1ldGFkYXRhGAwgASgJUghtZXRhZGF0YQ==');

@$core.Deprecated('Use roomEndReqDescriptor instead')
const RoomEndReq$json = {
  '1': 'RoomEndReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'roomId'},
  ],
};

/// Descriptor for `RoomEndReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomEndReqDescriptor = $convert.base64Decode(
    'CgpSb29tRW5kUmVxEh8KB3Jvb21faWQYASABKAlCBrpIA8gBAVIGcm9vbUlk');

@$core.Deprecated('Use roomEndResDescriptor instead')
const RoomEndRes$json = {
  '1': 'RoomEndRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `RoomEndRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomEndResDescriptor = $convert.base64Decode(
    'CgpSb29tRW5kUmVzEhYKBnN0YXR1cxgBIAEoCFIGc3RhdHVzEhAKA21zZxgCIAEoCVIDbXNn');

@$core.Deprecated('Use isRoomActiveReqDescriptor instead')
const IsRoomActiveReq$json = {
  '1': 'IsRoomActiveReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'roomId'},
  ],
};

/// Descriptor for `IsRoomActiveReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isRoomActiveReqDescriptor = $convert.base64Decode(
    'Cg9Jc1Jvb21BY3RpdmVSZXESHwoHcm9vbV9pZBgBIAEoCUIGukgDyAEBUgZyb29tSWQ=');

@$core.Deprecated('Use isRoomActiveResDescriptor instead')
const IsRoomActiveRes$json = {
  '1': 'IsRoomActiveRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'is_active', '3': 2, '4': 1, '5': 8, '10': 'isActive'},
    {'1': 'msg', '3': 3, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `IsRoomActiveRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isRoomActiveResDescriptor = $convert.base64Decode(
    'Cg9Jc1Jvb21BY3RpdmVSZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSGwoJaXNfYWN0aXZlGA'
    'IgASgIUghpc0FjdGl2ZRIQCgNtc2cYAyABKAlSA21zZw==');

@$core.Deprecated('Use activeRoomWithParticipantDescriptor instead')
const ActiveRoomWithParticipant$json = {
  '1': 'ActiveRoomWithParticipant',
  '2': [
    {
      '1': 'room_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.ActiveRoomInfo',
      '9': 0,
      '10': 'roomInfo',
      '17': true
    },
    {
      '1': 'participants_info',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.livekit.ParticipantInfo',
      '10': 'participantsInfo'
    },
  ],
  '8': [
    {'1': '_room_info'},
  ],
};

/// Descriptor for `ActiveRoomWithParticipant`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activeRoomWithParticipantDescriptor = $convert.base64Decode(
    'ChlBY3RpdmVSb29tV2l0aFBhcnRpY2lwYW50EjcKCXJvb21faW5mbxgDIAEoCzIVLndhamxjLk'
    'FjdGl2ZVJvb21JbmZvSABSCHJvb21JbmZviAEBEkUKEXBhcnRpY2lwYW50c19pbmZvGAQgAygL'
    'MhgubGl2ZWtpdC5QYXJ0aWNpcGFudEluZm9SEHBhcnRpY2lwYW50c0luZm9CDAoKX3Jvb21faW'
    '5mbw==');

@$core.Deprecated('Use getActiveRoomInfoResDescriptor instead')
const GetActiveRoomInfoRes$json = {
  '1': 'GetActiveRoomInfoRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'room',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.ActiveRoomWithParticipant',
      '10': 'room'
    },
  ],
};

/// Descriptor for `GetActiveRoomInfoRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getActiveRoomInfoResDescriptor = $convert.base64Decode(
    'ChRHZXRBY3RpdmVSb29tSW5mb1JlcxIWCgZzdGF0dXMYASABKAhSBnN0YXR1cxIQCgNtc2cYAi'
    'ABKAlSA21zZxI0CgRyb29tGAMgASgLMiAud2FqbGMuQWN0aXZlUm9vbVdpdGhQYXJ0aWNpcGFu'
    'dFIEcm9vbQ==');

@$core.Deprecated('Use getActiveRoomsInfoResDescriptor instead')
const GetActiveRoomsInfoRes$json = {
  '1': 'GetActiveRoomsInfoRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'rooms',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.wajlc.ActiveRoomWithParticipant',
      '10': 'rooms'
    },
  ],
};

/// Descriptor for `GetActiveRoomsInfoRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getActiveRoomsInfoResDescriptor = $convert.base64Decode(
    'ChVHZXRBY3RpdmVSb29tc0luZm9SZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSEAoDbXNnGA'
    'IgASgJUgNtc2cSNgoFcm9vbXMYAyADKAsyIC53YWpsYy5BY3RpdmVSb29tV2l0aFBhcnRpY2lw'
    'YW50UgVyb29tcw==');

@$core.Deprecated('Use pastRoomInfoDescriptor instead')
const PastRoomInfo$json = {
  '1': 'PastRoomInfo',
  '2': [
    {'1': 'room_title', '3': 1, '4': 1, '5': 9, '10': 'roomTitle'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_sid', '3': 3, '4': 1, '5': 9, '10': 'roomSid'},
    {
      '1': 'joined_participants',
      '3': 4,
      '4': 1,
      '5': 3,
      '10': 'joinedParticipants'
    },
    {'1': 'webhook_url', '3': 5, '4': 1, '5': 9, '10': 'webhookUrl'},
    {'1': 'created', '3': 6, '4': 1, '5': 9, '10': 'created'},
    {'1': 'ended', '3': 7, '4': 1, '5': 9, '10': 'ended'},
    {
      '1': 'analytics_file_id',
      '3': 8,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'analyticsFileId',
      '17': true
    },
  ],
  '8': [
    {'1': '_analytics_file_id'},
  ],
};

/// Descriptor for `PastRoomInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pastRoomInfoDescriptor = $convert.base64Decode(
    'CgxQYXN0Um9vbUluZm8SHQoKcm9vbV90aXRsZRgBIAEoCVIJcm9vbVRpdGxlEhcKB3Jvb21faW'
    'QYAiABKAlSBnJvb21JZBIZCghyb29tX3NpZBgDIAEoCVIHcm9vbVNpZBIvChNqb2luZWRfcGFy'
    'dGljaXBhbnRzGAQgASgDUhJqb2luZWRQYXJ0aWNpcGFudHMSHwoLd2ViaG9va191cmwYBSABKA'
    'lSCndlYmhvb2tVcmwSGAoHY3JlYXRlZBgGIAEoCVIHY3JlYXRlZBIUCgVlbmRlZBgHIAEoCVIF'
    'ZW5kZWQSLwoRYW5hbHl0aWNzX2ZpbGVfaWQYCCABKAlIAFIPYW5hbHl0aWNzRmlsZUlkiAEBQh'
    'QKEl9hbmFseXRpY3NfZmlsZV9pZA==');

@$core.Deprecated('Use fetchPastRoomsReqDescriptor instead')
const FetchPastRoomsReq$json = {
  '1': 'FetchPastRoomsReq',
  '2': [
    {'1': 'room_ids', '3': 1, '4': 3, '5': 9, '10': 'roomIds'},
    {'1': 'from', '3': 2, '4': 1, '5': 13, '10': 'from'},
    {'1': 'limit', '3': 3, '4': 1, '5': 13, '10': 'limit'},
    {'1': 'order_by', '3': 4, '4': 1, '5': 9, '10': 'orderBy'},
  ],
};

/// Descriptor for `FetchPastRoomsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPastRoomsReqDescriptor = $convert.base64Decode(
    'ChFGZXRjaFBhc3RSb29tc1JlcRIZCghyb29tX2lkcxgBIAMoCVIHcm9vbUlkcxISCgRmcm9tGA'
    'IgASgNUgRmcm9tEhQKBWxpbWl0GAMgASgNUgVsaW1pdBIZCghvcmRlcl9ieRgEIAEoCVIHb3Jk'
    'ZXJCeQ==');

@$core.Deprecated('Use fetchPastRoomsResultDescriptor instead')
const FetchPastRoomsResult$json = {
  '1': 'FetchPastRoomsResult',
  '2': [
    {'1': 'total_rooms', '3': 1, '4': 1, '5': 3, '10': 'totalRooms'},
    {'1': 'from', '3': 2, '4': 1, '5': 13, '10': 'from'},
    {'1': 'limit', '3': 3, '4': 1, '5': 13, '10': 'limit'},
    {'1': 'order_by', '3': 4, '4': 1, '5': 9, '10': 'orderBy'},
    {
      '1': 'rooms_list',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.wajlc.PastRoomInfo',
      '10': 'roomsList'
    },
  ],
};

/// Descriptor for `FetchPastRoomsResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPastRoomsResultDescriptor = $convert.base64Decode(
    'ChRGZXRjaFBhc3RSb29tc1Jlc3VsdBIfCgt0b3RhbF9yb29tcxgBIAEoA1IKdG90YWxSb29tcx'
    'ISCgRmcm9tGAIgASgNUgRmcm9tEhQKBWxpbWl0GAMgASgNUgVsaW1pdBIZCghvcmRlcl9ieRgE'
    'IAEoCVIHb3JkZXJCeRIyCgpyb29tc19saXN0GAUgAygLMhMud2FqbGMuUGFzdFJvb21JbmZvUg'
    'lyb29tc0xpc3Q=');

@$core.Deprecated('Use fetchPastRoomsResDescriptor instead')
const FetchPastRoomsRes$json = {
  '1': 'FetchPastRoomsRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'result',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.FetchPastRoomsResult',
      '10': 'result'
    },
  ],
};

/// Descriptor for `FetchPastRoomsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPastRoomsResDescriptor = $convert.base64Decode(
    'ChFGZXRjaFBhc3RSb29tc1JlcxIWCgZzdGF0dXMYASABKAhSBnN0YXR1cxIQCgNtc2cYAiABKA'
    'lSA21zZxIzCgZyZXN1bHQYAyABKAsyGy53YWpsYy5GZXRjaFBhc3RSb29tc1Jlc3VsdFIGcmVz'
    'dWx0');

@$core.Deprecated('Use getClientFilesResDescriptor instead')
const GetClientFilesRes$json = {
  '1': 'GetClientFilesRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'css',
      '3': 3,
      '4': 3,
      '5': 9,
      '8': {'3': true},
      '10': 'css',
    },
    {
      '1': 'js',
      '3': 4,
      '4': 3,
      '5': 9,
      '8': {'3': true},
      '10': 'js',
    },
    {'1': 'css_files', '3': 5, '4': 3, '5': 9, '10': 'cssFiles'},
    {'1': 'js_files', '3': 6, '4': 3, '5': 9, '10': 'jsFiles'},
    {
      '1': 'static_assets_path',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'staticAssetsPath',
      '17': true
    },
  ],
  '8': [
    {'1': '_static_assets_path'},
  ],
};

/// Descriptor for `GetClientFilesRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getClientFilesResDescriptor = $convert.base64Decode(
    'ChFHZXRDbGllbnRGaWxlc1JlcxIWCgZzdGF0dXMYASABKAhSBnN0YXR1cxIQCgNtc2cYAiABKA'
    'lSA21zZxIUCgNjc3MYAyADKAlCAhgBUgNjc3MSEgoCanMYBCADKAlCAhgBUgJqcxIbCgljc3Nf'
    'ZmlsZXMYBSADKAlSCGNzc0ZpbGVzEhkKCGpzX2ZpbGVzGAYgAygJUgdqc0ZpbGVzEjEKEnN0YX'
    'RpY19hc3NldHNfcGF0aBgHIAEoCUgAUhBzdGF0aWNBc3NldHNQYXRoiAEBQhUKE19zdGF0aWNf'
    'YXNzZXRzX3BhdGg=');
