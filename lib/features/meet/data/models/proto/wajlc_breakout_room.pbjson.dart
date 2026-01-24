// This is a generated file - do not edit.
//
// Generated from wajlc_breakout_room.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createBreakoutRoomsReqDescriptor instead')
const CreateBreakoutRoomsReq$json = {
  '1': 'CreateBreakoutRoomsReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'requested_user_id', '3': 2, '4': 1, '5': 9, '10': 'requestedUserId'},
    {'1': 'duration', '3': 3, '4': 1, '5': 4, '10': 'duration'},
    {
      '1': 'welcome_msg',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'welcomeMsg',
      '17': true
    },
    {
      '1': 'rooms',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.wajlc.BreakoutRoom',
      '10': 'rooms'
    },
  ],
  '8': [
    {'1': '_welcome_msg'},
  ],
};

/// Descriptor for `CreateBreakoutRoomsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBreakoutRoomsReqDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVCcmVha291dFJvb21zUmVxEhcKB3Jvb21faWQYASABKAlSBnJvb21JZBIqChFyZX'
    'F1ZXN0ZWRfdXNlcl9pZBgCIAEoCVIPcmVxdWVzdGVkVXNlcklkEhoKCGR1cmF0aW9uGAMgASgE'
    'UghkdXJhdGlvbhIkCgt3ZWxjb21lX21zZxgEIAEoCUgAUgp3ZWxjb21lTXNniAEBEikKBXJvb2'
    '1zGAUgAygLMhMud2FqbGMuQnJlYWtvdXRSb29tUgVyb29tc0IOCgxfd2VsY29tZV9tc2c=');

@$core.Deprecated('Use breakoutRoomDescriptor instead')
const BreakoutRoom$json = {
  '1': 'BreakoutRoom',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'duration', '3': 3, '4': 1, '5': 4, '10': 'duration'},
    {'1': 'started', '3': 4, '4': 1, '5': 8, '10': 'started'},
    {'1': 'created', '3': 5, '4': 1, '5': 4, '10': 'created'},
    {
      '1': 'users',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.wajlc.BreakoutRoomUser',
      '10': 'users'
    },
  ],
};

/// Descriptor for `BreakoutRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List breakoutRoomDescriptor = $convert.base64Decode(
    'CgxCcmVha291dFJvb20SDgoCaWQYASABKAlSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIaCg'
    'hkdXJhdGlvbhgDIAEoBFIIZHVyYXRpb24SGAoHc3RhcnRlZBgEIAEoCFIHc3RhcnRlZBIYCgdj'
    'cmVhdGVkGAUgASgEUgdjcmVhdGVkEi0KBXVzZXJzGAYgAygLMhcud2FqbGMuQnJlYWtvdXRSb2'
    '9tVXNlclIFdXNlcnM=');

@$core.Deprecated('Use breakoutRoomUserDescriptor instead')
const BreakoutRoomUser$json = {
  '1': 'BreakoutRoomUser',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'joined', '3': 3, '4': 1, '5': 8, '10': 'joined'},
  ],
};

/// Descriptor for `BreakoutRoomUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List breakoutRoomUserDescriptor = $convert.base64Decode(
    'ChBCcmVha291dFJvb21Vc2VyEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEh'
    'YKBmpvaW5lZBgDIAEoCFIGam9pbmVk');

@$core.Deprecated('Use increaseBreakoutRoomDurationReqDescriptor instead')
const IncreaseBreakoutRoomDurationReq$json = {
  '1': 'IncreaseBreakoutRoomDurationReq',
  '2': [
    {'1': 'breakout_room_id', '3': 1, '4': 1, '5': 9, '10': 'breakoutRoomId'},
    {'1': 'duration', '3': 2, '4': 1, '5': 4, '10': 'duration'},
    {'1': 'room_id', '3': 3, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `IncreaseBreakoutRoomDurationReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List increaseBreakoutRoomDurationReqDescriptor =
    $convert.base64Decode(
        'Ch9JbmNyZWFzZUJyZWFrb3V0Um9vbUR1cmF0aW9uUmVxEigKEGJyZWFrb3V0X3Jvb21faWQYAS'
        'ABKAlSDmJyZWFrb3V0Um9vbUlkEhoKCGR1cmF0aW9uGAIgASgEUghkdXJhdGlvbhIXCgdyb29t'
        'X2lkGAMgASgJUgZyb29tSWQ=');

@$core.Deprecated('Use broadcastBreakoutRoomMsgReqDescriptor instead')
const BroadcastBreakoutRoomMsgReq$json = {
  '1': 'BroadcastBreakoutRoomMsgReq',
  '2': [
    {'1': 'msg', '3': 1, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'room_id', '3': 3, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `BroadcastBreakoutRoomMsgReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastBreakoutRoomMsgReqDescriptor =
    $convert.base64Decode(
        'ChtCcm9hZGNhc3RCcmVha291dFJvb21Nc2dSZXESEAoDbXNnGAEgASgJUgNtc2cSFwoHcm9vbV'
        '9pZBgDIAEoCVIGcm9vbUlk');

@$core.Deprecated('Use joinBreakoutRoomReqDescriptor instead')
const JoinBreakoutRoomReq$json = {
  '1': 'JoinBreakoutRoomReq',
  '2': [
    {'1': 'breakout_room_id', '3': 1, '4': 1, '5': 9, '10': 'breakoutRoomId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'room_id', '3': 3, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'is_admin', '3': 4, '4': 1, '5': 8, '10': 'isAdmin'},
  ],
};

/// Descriptor for `JoinBreakoutRoomReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinBreakoutRoomReqDescriptor = $convert.base64Decode(
    'ChNKb2luQnJlYWtvdXRSb29tUmVxEigKEGJyZWFrb3V0X3Jvb21faWQYASABKAlSDmJyZWFrb3'
    'V0Um9vbUlkEhcKB3VzZXJfaWQYAiABKAlSBnVzZXJJZBIXCgdyb29tX2lkGAMgASgJUgZyb29t'
    'SWQSGQoIaXNfYWRtaW4YBCABKAhSB2lzQWRtaW4=');

@$core.Deprecated('Use endBreakoutRoomReqDescriptor instead')
const EndBreakoutRoomReq$json = {
  '1': 'EndBreakoutRoomReq',
  '2': [
    {'1': 'breakout_room_id', '3': 1, '4': 1, '5': 9, '10': 'breakoutRoomId'},
    {'1': 'room_id', '3': 3, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `EndBreakoutRoomReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endBreakoutRoomReqDescriptor = $convert.base64Decode(
    'ChJFbmRCcmVha291dFJvb21SZXESKAoQYnJlYWtvdXRfcm9vbV9pZBgBIAEoCVIOYnJlYWtvdX'
    'RSb29tSWQSFwoHcm9vbV9pZBgDIAEoCVIGcm9vbUlk');

@$core.Deprecated('Use breakoutRoomResDescriptor instead')
const BreakoutRoomRes$json = {
  '1': 'BreakoutRoomRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'token', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'token', '17': true},
    {
      '1': 'room',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.wajlc.BreakoutRoom',
      '9': 1,
      '10': 'room',
      '17': true
    },
    {
      '1': 'rooms',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.wajlc.BreakoutRoom',
      '10': 'rooms'
    },
  ],
  '8': [
    {'1': '_token'},
    {'1': '_room'},
  ],
};

/// Descriptor for `BreakoutRoomRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List breakoutRoomResDescriptor = $convert.base64Decode(
    'Cg9CcmVha291dFJvb21SZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSEAoDbXNnGAIgASgJUg'
    'Ntc2cSGQoFdG9rZW4YAyABKAlIAFIFdG9rZW6IAQESLAoEcm9vbRgEIAEoCzITLndhamxjLkJy'
    'ZWFrb3V0Um9vbUgBUgRyb29tiAEBEikKBXJvb21zGAUgAygLMhMud2FqbGMuQnJlYWtvdXRSb2'
    '9tUgVyb29tc0IICgZfdG9rZW5CBwoFX3Jvb20=');
