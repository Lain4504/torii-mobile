// This is a generated file - do not edit.
//
// Generated from wajlc_common.proto.

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

@$core.Deprecated('Use commonNotifyEventDescriptor instead')
const CommonNotifyEvent$json = {
  '1': 'CommonNotifyEvent',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'event', '17': true},
    {
      '1': 'room',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.wajlc.NotifyEventRoom',
      '9': 1,
      '10': 'room',
      '17': true
    },
    {
      '1': 'participant',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.livekit.ParticipantInfo',
      '9': 2,
      '10': 'participant',
      '17': true
    },
    {
      '1': 'recording_info',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RecordingInfoEvent',
      '9': 3,
      '10': 'recordingInfo',
      '17': true
    },
    {
      '1': 'speech_service',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.wajlc.SpeechServiceEvent',
      '9': 4,
      '10': 'speechService',
      '17': true
    },
    {
      '1': 'track',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.livekit.TrackInfo',
      '9': 5,
      '10': 'track',
      '17': true
    },
    {
      '1': 'analytics',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.wajlc.AnalyticsEvent',
      '9': 6,
      '10': 'analytics',
      '17': true
    },
    {
      '1': 'room_artifact',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RoomArtifactWebhookEvent',
      '9': 7,
      '10': 'roomArtifact',
      '17': true
    },
    {'1': 'id', '3': 9, '4': 1, '5': 9, '9': 8, '10': 'id', '17': true},
    {
      '1': 'created_at',
      '3': 10,
      '4': 1,
      '5': 3,
      '9': 9,
      '10': 'createdAt',
      '17': true
    },
  ],
  '8': [
    {'1': '_event'},
    {'1': '_room'},
    {'1': '_participant'},
    {'1': '_recording_info'},
    {'1': '_speech_service'},
    {'1': '_track'},
    {'1': '_analytics'},
    {'1': '_room_artifact'},
    {'1': '_id'},
    {'1': '_created_at'},
  ],
};

/// Descriptor for `CommonNotifyEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commonNotifyEventDescriptor = $convert.base64Decode(
    'ChFDb21tb25Ob3RpZnlFdmVudBIZCgVldmVudBgBIAEoCUgAUgVldmVudIgBARIvCgRyb29tGA'
    'IgASgLMhYud2FqbGMuTm90aWZ5RXZlbnRSb29tSAFSBHJvb22IAQESPwoLcGFydGljaXBhbnQY'
    'AyABKAsyGC5saXZla2l0LlBhcnRpY2lwYW50SW5mb0gCUgtwYXJ0aWNpcGFudIgBARJFCg5yZW'
    'NvcmRpbmdfaW5mbxgEIAEoCzIZLndhamxjLlJlY29yZGluZ0luZm9FdmVudEgDUg1yZWNvcmRp'
    'bmdJbmZviAEBEkUKDnNwZWVjaF9zZXJ2aWNlGAUgASgLMhkud2FqbGMuU3BlZWNoU2VydmljZU'
    'V2ZW50SARSDXNwZWVjaFNlcnZpY2WIAQESLQoFdHJhY2sYBiABKAsyEi5saXZla2l0LlRyYWNr'
    'SW5mb0gFUgV0cmFja4gBARI4CglhbmFseXRpY3MYByABKAsyFS53YWpsYy5BbmFseXRpY3NFdm'
    'VudEgGUglhbmFseXRpY3OIAQESSQoNcm9vbV9hcnRpZmFjdBgIIAEoCzIfLndhamxjLlJvb21B'
    'cnRpZmFjdFdlYmhvb2tFdmVudEgHUgxyb29tQXJ0aWZhY3SIAQESEwoCaWQYCSABKAlICFICaW'
    'SIAQESIgoKY3JlYXRlZF9hdBgKIAEoA0gJUgljcmVhdGVkQXSIAQFCCAoGX2V2ZW50QgcKBV9y'
    'b29tQg4KDF9wYXJ0aWNpcGFudEIRCg9fcmVjb3JkaW5nX2luZm9CEQoPX3NwZWVjaF9zZXJ2aW'
    'NlQggKBl90cmFja0IMCgpfYW5hbHl0aWNzQhAKDl9yb29tX2FydGlmYWN0QgUKA19pZEINCgtf'
    'Y3JlYXRlZF9hdA==');

@$core.Deprecated('Use notifyEventRoomDescriptor instead')
const NotifyEventRoom$json = {
  '1': 'NotifyEventRoom',
  '2': [
    {'1': 'sid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'sid', '17': true},
    {
      '1': 'room_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'roomId',
      '17': true
    },
    {
      '1': 'empty_timeout',
      '3': 3,
      '4': 1,
      '5': 13,
      '9': 2,
      '10': 'emptyTimeout',
      '17': true
    },
    {
      '1': 'max_participants',
      '3': 4,
      '4': 1,
      '5': 13,
      '9': 3,
      '10': 'maxParticipants',
      '17': true
    },
    {
      '1': 'creation_time',
      '3': 5,
      '4': 1,
      '5': 4,
      '9': 4,
      '10': 'creationTime',
      '17': true
    },
    {
      '1': 'enabled_codecs',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.livekit.Codec',
      '10': 'enabledCodecs'
    },
    {
      '1': 'metadata',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'metadata',
      '17': true
    },
    {
      '1': 'num_participants',
      '3': 8,
      '4': 1,
      '5': 13,
      '9': 6,
      '10': 'numParticipants',
      '17': true
    },
  ],
  '8': [
    {'1': '_sid'},
    {'1': '_room_id'},
    {'1': '_empty_timeout'},
    {'1': '_max_participants'},
    {'1': '_creation_time'},
    {'1': '_metadata'},
    {'1': '_num_participants'},
  ],
};

/// Descriptor for `NotifyEventRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notifyEventRoomDescriptor = $convert.base64Decode(
    'Cg9Ob3RpZnlFdmVudFJvb20SFQoDc2lkGAEgASgJSABSA3NpZIgBARIcCgdyb29tX2lkGAIgAS'
    'gJSAFSBnJvb21JZIgBARIoCg1lbXB0eV90aW1lb3V0GAMgASgNSAJSDGVtcHR5VGltZW91dIgB'
    'ARIuChBtYXhfcGFydGljaXBhbnRzGAQgASgNSANSD21heFBhcnRpY2lwYW50c4gBARIoCg1jcm'
    'VhdGlvbl90aW1lGAUgASgESARSDGNyZWF0aW9uVGltZYgBARI1Cg5lbmFibGVkX2NvZGVjcxgG'
    'IAMoCzIOLmxpdmVraXQuQ29kZWNSDWVuYWJsZWRDb2RlY3MSHwoIbWV0YWRhdGEYByABKAlIBV'
    'IIbWV0YWRhdGGIAQESLgoQbnVtX3BhcnRpY2lwYW50cxgIIAEoDUgGUg9udW1QYXJ0aWNpcGFu'
    'dHOIAQFCBgoEX3NpZEIKCghfcm9vbV9pZEIQCg5fZW1wdHlfdGltZW91dEITChFfbWF4X3Bhcn'
    'RpY2lwYW50c0IQCg5fY3JlYXRpb25fdGltZUILCglfbWV0YWRhdGFCEwoRX251bV9wYXJ0aWNp'
    'cGFudHM=');

@$core.Deprecated('Use recordingInfoEventDescriptor instead')
const RecordingInfoEvent$json = {
  '1': 'RecordingInfoEvent',
  '2': [
    {'1': 'record_id', '3': 1, '4': 1, '5': 9, '10': 'recordId'},
    {'1': 'recorder_id', '3': 2, '4': 1, '5': 9, '10': 'recorderId'},
    {'1': 'recorder_msg', '3': 3, '4': 1, '5': 9, '10': 'recorderMsg'},
    {
      '1': 'file_path',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'filePath',
      '17': true
    },
    {
      '1': 'file_size',
      '3': 5,
      '4': 1,
      '5': 2,
      '9': 1,
      '10': 'fileSize',
      '17': true
    },
  ],
  '8': [
    {'1': '_file_path'},
    {'1': '_file_size'},
  ],
};

/// Descriptor for `RecordingInfoEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordingInfoEventDescriptor = $convert.base64Decode(
    'ChJSZWNvcmRpbmdJbmZvRXZlbnQSGwoJcmVjb3JkX2lkGAEgASgJUghyZWNvcmRJZBIfCgtyZW'
    'NvcmRlcl9pZBgCIAEoCVIKcmVjb3JkZXJJZBIhCgxyZWNvcmRlcl9tc2cYAyABKAlSC3JlY29y'
    'ZGVyTXNnEiAKCWZpbGVfcGF0aBgEIAEoCUgAUghmaWxlUGF0aIgBARIgCglmaWxlX3NpemUYBS'
    'ABKAJIAVIIZmlsZVNpemWIAQFCDAoKX2ZpbGVfcGF0aEIMCgpfZmlsZV9zaXpl');

@$core.Deprecated('Use speechServiceEventDescriptor instead')
const SpeechServiceEvent$json = {
  '1': 'SpeechServiceEvent',
  '2': [
    {
      '1': 'user_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'userId',
      '17': true
    },
    {'1': 'total_usage', '3': 4, '4': 1, '5': 3, '10': 'totalUsage'},
  ],
  '8': [
    {'1': '_user_id'},
  ],
};

/// Descriptor for `SpeechServiceEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speechServiceEventDescriptor = $convert.base64Decode(
    'ChJTcGVlY2hTZXJ2aWNlRXZlbnQSHAoHdXNlcl9pZBgDIAEoCUgAUgZ1c2VySWSIAQESHwoLdG'
    '90YWxfdXNhZ2UYBCABKANSCnRvdGFsVXNhZ2VCCgoIX3VzZXJfaWQ=');

@$core.Deprecated('Use analyticsEventDescriptor instead')
const AnalyticsEvent$json = {
  '1': 'AnalyticsEvent',
  '2': [
    {
      '1': 'file_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'fileId',
      '17': true
    },
  ],
  '8': [
    {'1': '_file_id'},
  ],
};

/// Descriptor for `AnalyticsEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsEventDescriptor = $convert.base64Decode(
    'Cg5BbmFseXRpY3NFdmVudBIcCgdmaWxlX2lkGAEgASgJSABSBmZpbGVJZIgBAUIKCghfZmlsZV'
    '9pZA==');
