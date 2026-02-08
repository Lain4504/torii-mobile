// This is a generated file - do not edit.
//
// Generated from wajlc_analytics.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use analyticsEventTypeDescriptor instead')
const AnalyticsEventType$json = {
  '1': 'AnalyticsEventType',
  '2': [
    {'1': 'ANALYTICS_EVENT_TYPE_ROOM', '2': 0},
    {'1': 'ANALYTICS_EVENT_TYPE_USER', '2': 1},
  ],
};

/// Descriptor for `AnalyticsEventType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List analyticsEventTypeDescriptor = $convert.base64Decode(
    'ChJBbmFseXRpY3NFdmVudFR5cGUSHQoZQU5BTFlUSUNTX0VWRU5UX1RZUEVfUk9PTRAAEh0KGU'
    'FOQUxZVElDU19FVkVOVF9UWVBFX1VTRVIQAQ==');

@$core.Deprecated('Use analyticsEventsDescriptor instead')
const AnalyticsEvents$json = {
  '1': 'AnalyticsEvents',
  '2': [
    {'1': 'ANALYTICS_EVENT_UNKNOWN', '2': 0},
    {'1': 'ANALYTICS_EVENT_ROOM_POLL_ADDED', '2': 1},
    {'1': 'ANALYTICS_EVENT_ROOM_POLL_ENDED', '2': 2},
    {'1': 'ANALYTICS_EVENT_USER_JOINED', '2': 3},
    {'1': 'ANALYTICS_EVENT_ROOM_RECORDING_STATUS', '2': 4},
    {'1': 'ANALYTICS_EVENT_ROOM_RTMP_STATUS', '2': 5},
    {'1': 'ANALYTICS_EVENT_ROOM_BREAKOUT_ROOM', '2': 6},
    {'1': 'ANALYTICS_EVENT_ROOM_ETHERPAD_STATUS', '2': 7},
    {'1': 'ANALYTICS_EVENT_ROOM_EXTERNAL_DISPLAY_LINK_STATUS', '2': 8},
    {'1': 'ANALYTICS_EVENT_ROOM_EXTERNAL_MEDIA_PLAYER_STATUS', '2': 9},
    {'1': 'ANALYTICS_EVENT_ROOM_SPEECH_SERVICE_STATUS', '2': 10},
    {'1': 'ANALYTICS_EVENT_ROOM_SPEECH_SERVICE_TOTAL_USAGE', '2': 11},
    {'1': 'ANALYTICS_EVENT_ROOM_INGRESS_CREATED', '2': 12},
    {'1': 'ANALYTICS_EVENT_ROOM_WHITEBOARD_FILES', '2': 13},
    {'1': 'ANALYTICS_EVENT_ROOM_INSIGHTS_TRANSCRIPTION_STATUS', '2': 31},
    {'1': 'ANALYTICS_EVENT_ROOM_INSIGHTS_TRANSCRIPTION_TOTAL_USAGE', '2': 32},
    {
      '1': 'ANALYTICS_EVENT_ROOM_INSIGHTS_SYNTHESIZED_SPEECH_TOTAL_USAGE',
      '2': 33
    },
    {'1': 'ANALYTICS_EVENT_ROOM_INSIGHTS_CHAT_TRANSLATION_STATUS', '2': 34},
    {
      '1': 'ANALYTICS_EVENT_ROOM_INSIGHTS_CHAT_TRANSLATION_TOTAL_USAGE',
      '2': 35
    },
    {'1': 'ANALYTICS_EVENT_ROOM_INSIGHTS_AI_TEXT_CHAT_STATUS', '2': 36},
    {
      '1': 'ANALYTICS_EVENT_ROOM_INSIGHTS_AI_TEXT_CHAT_INTERACTION_TOTAL_USAGE',
      '2': 37
    },
    {
      '1':
          'ANALYTICS_EVENT_ROOM_INSIGHTS_AI_TEXT_CHAT_SUMMARIZATION_TOTAL_USAGE',
      '2': 38
    },
    {
      '1': 'ANALYTICS_EVENT_ROOM_INSIGHTS_AI_MEETING_SUMMARIZATION_STATUS',
      '2': 39
    },
    {'1': 'ANALYTICS_EVENT_USER_LEFT', '2': 14},
    {'1': 'ANALYTICS_EVENT_USER_MIC_STATUS', '2': 15},
    {'1': 'ANALYTICS_EVENT_USER_TALKED', '2': 16},
    {'1': 'ANALYTICS_EVENT_USER_TALKED_DURATION', '2': 17},
    {'1': 'ANALYTICS_EVENT_USER_WEBCAM_STATUS', '2': 18},
    {'1': 'ANALYTICS_EVENT_USER_SCREEN_SHARE_STATUS', '2': 19},
    {'1': 'ANALYTICS_EVENT_USER_VOTED_POLL', '2': 20},
    {'1': 'ANALYTICS_EVENT_USER_PUBLIC_CHAT', '2': 21},
    {'1': 'ANALYTICS_EVENT_USER_PRIVATE_CHAT', '2': 22},
    {'1': 'ANALYTICS_EVENT_USER_CHAT_FILES', '2': 23},
    {'1': 'ANALYTICS_EVENT_USER_WHITEBOARD_ANNOTATED', '2': 24},
    {'1': 'ANALYTICS_EVENT_USER_WHITEBOARD_FILES', '2': 25},
    {'1': 'ANALYTICS_EVENT_USER_SPEECH_SERVICES_USAGE', '2': 26},
    {'1': 'ANALYTICS_EVENT_USER_SPEECH_SERVICES_STATUS', '2': 27},
    {'1': 'ANALYTICS_EVENT_USER_INTERFACE_VISIBILITY', '2': 28},
    {'1': 'ANALYTICS_EVENT_USER_RAISE_HAND', '2': 29},
    {'1': 'ANALYTICS_EVENT_USER_CONNECTION_QUALITY', '2': 30},
  ],
};

/// Descriptor for `AnalyticsEvents`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List analyticsEventsDescriptor = $convert.base64Decode(
    'Cg9BbmFseXRpY3NFdmVudHMSGwoXQU5BTFlUSUNTX0VWRU5UX1VOS05PV04QABIjCh9BTkFMWV'
    'RJQ1NfRVZFTlRfUk9PTV9QT0xMX0FEREVEEAESIwofQU5BTFlUSUNTX0VWRU5UX1JPT01fUE9M'
    'TF9FTkRFRBACEh8KG0FOQUxZVElDU19FVkVOVF9VU0VSX0pPSU5FRBADEikKJUFOQUxZVElDU1'
    '9FVkVOVF9ST09NX1JFQ09SRElOR19TVEFUVVMQBBIkCiBBTkFMWVRJQ1NfRVZFTlRfUk9PTV9S'
    'VE1QX1NUQVRVUxAFEiYKIkFOQUxZVElDU19FVkVOVF9ST09NX0JSRUFLT1VUX1JPT00QBhIoCi'
    'RBTkFMWVRJQ1NfRVZFTlRfUk9PTV9FVEhFUlBBRF9TVEFUVVMQBxI1CjFBTkFMWVRJQ1NfRVZF'
    'TlRfUk9PTV9FWFRFUk5BTF9ESVNQTEFZX0xJTktfU1RBVFVTEAgSNQoxQU5BTFlUSUNTX0VWRU'
    '5UX1JPT01fRVhURVJOQUxfTUVESUFfUExBWUVSX1NUQVRVUxAJEi4KKkFOQUxZVElDU19FVkVO'
    'VF9ST09NX1NQRUVDSF9TRVJWSUNFX1NUQVRVUxAKEjMKL0FOQUxZVElDU19FVkVOVF9ST09NX1'
    'NQRUVDSF9TRVJWSUNFX1RPVEFMX1VTQUdFEAsSKAokQU5BTFlUSUNTX0VWRU5UX1JPT01fSU5H'
    'UkVTU19DUkVBVEVEEAwSKQolQU5BTFlUSUNTX0VWRU5UX1JPT01fV0hJVEVCT0FSRF9GSUxFUx'
    'ANEjYKMkFOQUxZVElDU19FVkVOVF9ST09NX0lOU0lHSFRTX1RSQU5TQ1JJUFRJT05fU1RBVFVT'
    'EB8SOwo3QU5BTFlUSUNTX0VWRU5UX1JPT01fSU5TSUdIVFNfVFJBTlNDUklQVElPTl9UT1RBTF'
    '9VU0FHRRAgEkAKPEFOQUxZVElDU19FVkVOVF9ST09NX0lOU0lHSFRTX1NZTlRIRVNJWkVEX1NQ'
    'RUVDSF9UT1RBTF9VU0FHRRAhEjkKNUFOQUxZVElDU19FVkVOVF9ST09NX0lOU0lHSFRTX0NIQV'
    'RfVFJBTlNMQVRJT05fU1RBVFVTECISPgo6QU5BTFlUSUNTX0VWRU5UX1JPT01fSU5TSUdIVFNf'
    'Q0hBVF9UUkFOU0xBVElPTl9UT1RBTF9VU0FHRRAjEjUKMUFOQUxZVElDU19FVkVOVF9ST09NX0'
    'lOU0lHSFRTX0FJX1RFWFRfQ0hBVF9TVEFUVVMQJBJGCkJBTkFMWVRJQ1NfRVZFTlRfUk9PTV9J'
    'TlNJR0hUU19BSV9URVhUX0NIQVRfSU5URVJBQ1RJT05fVE9UQUxfVVNBR0UQJRJICkRBTkFMWV'
    'RJQ1NfRVZFTlRfUk9PTV9JTlNJR0hUU19BSV9URVhUX0NIQVRfU1VNTUFSSVpBVElPTl9UT1RB'
    'TF9VU0FHRRAmEkEKPUFOQUxZVElDU19FVkVOVF9ST09NX0lOU0lHSFRTX0FJX01FRVRJTkdfU1'
    'VNTUFSSVpBVElPTl9TVEFUVVMQJxIdChlBTkFMWVRJQ1NfRVZFTlRfVVNFUl9MRUZUEA4SIwof'
    'QU5BTFlUSUNTX0VWRU5UX1VTRVJfTUlDX1NUQVRVUxAPEh8KG0FOQUxZVElDU19FVkVOVF9VU0'
    'VSX1RBTEtFRBAQEigKJEFOQUxZVElDU19FVkVOVF9VU0VSX1RBTEtFRF9EVVJBVElPThAREiYK'
    'IkFOQUxZVElDU19FVkVOVF9VU0VSX1dFQkNBTV9TVEFUVVMQEhIsCihBTkFMWVRJQ1NfRVZFTl'
    'RfVVNFUl9TQ1JFRU5fU0hBUkVfU1RBVFVTEBMSIwofQU5BTFlUSUNTX0VWRU5UX1VTRVJfVk9U'
    'RURfUE9MTBAUEiQKIEFOQUxZVElDU19FVkVOVF9VU0VSX1BVQkxJQ19DSEFUEBUSJQohQU5BTF'
    'lUSUNTX0VWRU5UX1VTRVJfUFJJVkFURV9DSEFUEBYSIwofQU5BTFlUSUNTX0VWRU5UX1VTRVJf'
    'Q0hBVF9GSUxFUxAXEi0KKUFOQUxZVElDU19FVkVOVF9VU0VSX1dISVRFQk9BUkRfQU5OT1RBVE'
    'VEEBgSKQolQU5BTFlUSUNTX0VWRU5UX1VTRVJfV0hJVEVCT0FSRF9GSUxFUxAZEi4KKkFOQUxZ'
    'VElDU19FVkVOVF9VU0VSX1NQRUVDSF9TRVJWSUNFU19VU0FHRRAaEi8KK0FOQUxZVElDU19FVk'
    'VOVF9VU0VSX1NQRUVDSF9TRVJWSUNFU19TVEFUVVMQGxItCilBTkFMWVRJQ1NfRVZFTlRfVVNF'
    'Ul9JTlRFUkZBQ0VfVklTSUJJTElUWRAcEiMKH0FOQUxZVElDU19FVkVOVF9VU0VSX1JBSVNFX0'
    'hBTkQQHRIrCidBTkFMWVRJQ1NfRVZFTlRfVVNFUl9DT05ORUNUSU9OX1FVQUxJVFkQHg==');

@$core.Deprecated('Use analyticsStatusDescriptor instead')
const AnalyticsStatus$json = {
  '1': 'AnalyticsStatus',
  '2': [
    {'1': 'ANALYTICS_STATUS_STARTED', '2': 0},
    {'1': 'ANALYTICS_STATUS_ENDED', '2': 1},
    {'1': 'ANALYTICS_STATUS_MUTED', '2': 2},
    {'1': 'ANALYTICS_STATUS_UNMUTED', '2': 3},
  ],
};

/// Descriptor for `AnalyticsStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List analyticsStatusDescriptor = $convert.base64Decode(
    'Cg9BbmFseXRpY3NTdGF0dXMSHAoYQU5BTFlUSUNTX1NUQVRVU19TVEFSVEVEEAASGgoWQU5BTF'
    'lUSUNTX1NUQVRVU19FTkRFRBABEhoKFkFOQUxZVElDU19TVEFUVVNfTVVURUQQAhIcChhBTkFM'
    'WVRJQ1NfU1RBVFVTX1VOTVVURUQQAw==');

@$core.Deprecated('Use analyticsDataMsgDescriptor instead')
const AnalyticsDataMsg$json = {
  '1': 'AnalyticsDataMsg',
  '2': [
    {
      '1': 'event_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.wajlc.AnalyticsEventType',
      '10': 'eventType'
    },
    {
      '1': 'event_name',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.wajlc.AnalyticsEvents',
      '10': 'eventName'
    },
    {'1': 'room_id', '3': 3, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'time', '3': 4, '4': 1, '5': 3, '10': 'time'},
    {
      '1': 'event_value_string',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'eventValueString',
      '17': true
    },
    {
      '1': 'event_value_integer',
      '3': 6,
      '4': 1,
      '5': 3,
      '9': 1,
      '10': 'eventValueInteger',
      '17': true
    },
    {
      '1': 'hset_value',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'hsetValue',
      '17': true
    },
    {
      '1': 'room_sid',
      '3': 8,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'roomSid',
      '17': true
    },
    {
      '1': 'user_id',
      '3': 9,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'userId',
      '17': true
    },
    {
      '1': 'user_name',
      '3': 10,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'userName',
      '17': true
    },
    {
      '1': 'extra_data',
      '3': 11,
      '4': 1,
      '5': 9,
      '9': 6,
      '10': 'extraData',
      '17': true
    },
  ],
  '8': [
    {'1': '_event_value_string'},
    {'1': '_event_value_integer'},
    {'1': '_hset_value'},
    {'1': '_room_sid'},
    {'1': '_user_id'},
    {'1': '_user_name'},
    {'1': '_extra_data'},
  ],
};

/// Descriptor for `AnalyticsDataMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsDataMsgDescriptor = $convert.base64Decode(
    'ChBBbmFseXRpY3NEYXRhTXNnEjgKCmV2ZW50X3R5cGUYASABKA4yGS53YWpsYy5BbmFseXRpY3'
    'NFdmVudFR5cGVSCWV2ZW50VHlwZRI1CgpldmVudF9uYW1lGAIgASgOMhYud2FqbGMuQW5hbHl0'
    'aWNzRXZlbnRzUglldmVudE5hbWUSFwoHcm9vbV9pZBgDIAEoCVIGcm9vbUlkEhIKBHRpbWUYBC'
    'ABKANSBHRpbWUSMQoSZXZlbnRfdmFsdWVfc3RyaW5nGAUgASgJSABSEGV2ZW50VmFsdWVTdHJp'
    'bmeIAQESMwoTZXZlbnRfdmFsdWVfaW50ZWdlchgGIAEoA0gBUhFldmVudFZhbHVlSW50ZWdlco'
    'gBARIiCgpoc2V0X3ZhbHVlGAcgASgJSAJSCWhzZXRWYWx1ZYgBARIeCghyb29tX3NpZBgIIAEo'
    'CUgDUgdyb29tU2lkiAEBEhwKB3VzZXJfaWQYCSABKAlIBFIGdXNlcklkiAEBEiAKCXVzZXJfbm'
    'FtZRgKIAEoCUgFUgh1c2VyTmFtZYgBARIiCgpleHRyYV9kYXRhGAsgASgJSAZSCWV4dHJhRGF0'
    'YYgBAUIVChNfZXZlbnRfdmFsdWVfc3RyaW5nQhYKFF9ldmVudF92YWx1ZV9pbnRlZ2VyQg0KC1'
    '9oc2V0X3ZhbHVlQgsKCV9yb29tX3NpZEIKCghfdXNlcl9pZEIMCgpfdXNlcl9uYW1lQg0KC19l'
    'eHRyYV9kYXRh');

@$core.Deprecated('Use analyticsEventValueDescriptor instead')
const AnalyticsEventValue$json = {
  '1': 'AnalyticsEventValue',
  '2': [
    {'1': 'time', '3': 1, '4': 1, '5': 3, '10': 'time'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `AnalyticsEventValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsEventValueDescriptor = $convert.base64Decode(
    'ChNBbmFseXRpY3NFdmVudFZhbHVlEhIKBHRpbWUYASABKANSBHRpbWUSFAoFdmFsdWUYAiABKA'
    'lSBXZhbHVl');

@$core.Deprecated('Use analyticsEventDataDescriptor instead')
const AnalyticsEventData$json = {
  '1': 'AnalyticsEventData',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'total', '3': 2, '4': 1, '5': 13, '10': 'total'},
    {
      '1': 'values',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.wajlc.AnalyticsEventValue',
      '10': 'values'
    },
  ],
};

/// Descriptor for `AnalyticsEventData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsEventDataDescriptor = $convert.base64Decode(
    'ChJBbmFseXRpY3NFdmVudERhdGESEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgV0b3RhbBgCIAEoDV'
    'IFdG90YWwSMgoGdmFsdWVzGAMgAygLMhoud2FqbGMuQW5hbHl0aWNzRXZlbnRWYWx1ZVIGdmFs'
    'dWVz');

@$core.Deprecated('Use analyticsRoomInfoDescriptor instead')
const AnalyticsRoomInfo$json = {
  '1': 'AnalyticsRoomInfo',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_title', '3': 2, '4': 1, '5': 9, '10': 'roomTitle'},
    {'1': 'room_total_users', '3': 3, '4': 1, '5': 3, '10': 'roomTotalUsers'},
    {'1': 'room_creation', '3': 4, '4': 1, '5': 3, '10': 'roomCreation'},
    {'1': 'room_ended', '3': 5, '4': 1, '5': 3, '10': 'roomEnded'},
    {'1': 'room_duration', '3': 6, '4': 1, '5': 3, '10': 'roomDuration'},
    {'1': 'enabled_e2ee', '3': 7, '4': 1, '5': 8, '10': 'enabledE2ee'},
    {
      '1': 'events',
      '3': 9,
      '4': 3,
      '5': 11,
      '6': '.wajlc.AnalyticsEventData',
      '10': 'events'
    },
  ],
};

/// Descriptor for `AnalyticsRoomInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsRoomInfoDescriptor = $convert.base64Decode(
    'ChFBbmFseXRpY3NSb29tSW5mbxIXCgdyb29tX2lkGAEgASgJUgZyb29tSWQSHQoKcm9vbV90aX'
    'RsZRgCIAEoCVIJcm9vbVRpdGxlEigKEHJvb21fdG90YWxfdXNlcnMYAyABKANSDnJvb21Ub3Rh'
    'bFVzZXJzEiMKDXJvb21fY3JlYXRpb24YBCABKANSDHJvb21DcmVhdGlvbhIdCgpyb29tX2VuZG'
    'VkGAUgASgDUglyb29tRW5kZWQSIwoNcm9vbV9kdXJhdGlvbhgGIAEoA1IMcm9vbUR1cmF0aW9u'
    'EiEKDGVuYWJsZWRfZTJlZRgHIAEoCFILZW5hYmxlZEUyZWUSMQoGZXZlbnRzGAkgAygLMhkud2'
    'FqbGMuQW5hbHl0aWNzRXZlbnREYXRhUgZldmVudHM=');

@$core.Deprecated('Use analyticsUserInfoDescriptor instead')
const AnalyticsUserInfo$json = {
  '1': 'AnalyticsUserInfo',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'is_admin', '3': 3, '4': 1, '5': 8, '10': 'isAdmin'},
    {
      '1': 'extra_data',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'extraData',
      '17': true
    },
    {
      '1': 'ex_user_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'exUserId',
      '17': true
    },
    {
      '1': 'events',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.wajlc.AnalyticsEventData',
      '10': 'events'
    },
  ],
  '8': [
    {'1': '_extra_data'},
    {'1': '_ex_user_id'},
  ],
};

/// Descriptor for `AnalyticsUserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsUserInfoDescriptor = $convert.base64Decode(
    'ChFBbmFseXRpY3NVc2VySW5mbxIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSEgoEbmFtZRgCIA'
    'EoCVIEbmFtZRIZCghpc19hZG1pbhgDIAEoCFIHaXNBZG1pbhIiCgpleHRyYV9kYXRhGAQgASgJ'
    'SABSCWV4dHJhRGF0YYgBARIhCgpleF91c2VyX2lkGAUgASgJSAFSCGV4VXNlcklkiAEBEjEKBm'
    'V2ZW50cxgGIAMoCzIZLndhamxjLkFuYWx5dGljc0V2ZW50RGF0YVIGZXZlbnRzQg0KC19leHRy'
    'YV9kYXRhQg0KC19leF91c2VyX2lk');

@$core.Deprecated('Use analyticsResultDescriptor instead')
const AnalyticsResult$json = {
  '1': 'AnalyticsResult',
  '2': [
    {
      '1': 'room',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.wajlc.AnalyticsRoomInfo',
      '10': 'room'
    },
    {
      '1': 'users',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.wajlc.AnalyticsUserInfo',
      '10': 'users'
    },
  ],
};

/// Descriptor for `AnalyticsResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsResultDescriptor = $convert.base64Decode(
    'Cg9BbmFseXRpY3NSZXN1bHQSLAoEcm9vbRgBIAEoCzIYLndhamxjLkFuYWx5dGljc1Jvb21Jbm'
    'ZvUgRyb29tEi4KBXVzZXJzGAIgAygLMhgud2FqbGMuQW5hbHl0aWNzVXNlckluZm9SBXVzZXJz');

@$core.Deprecated('Use analyticsRedisUserInfoDescriptor instead')
const AnalyticsRedisUserInfo$json = {
  '1': 'AnalyticsRedisUserInfo',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    {'1': 'is_admin', '3': 2, '4': 1, '5': 8, '10': 'isAdmin'},
    {
      '1': 'extra_data',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'extraData',
      '17': true
    },
    {
      '1': 'ex_user_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'exUserId',
      '17': true
    },
  ],
  '8': [
    {'1': '_name'},
    {'1': '_extra_data'},
    {'1': '_ex_user_id'},
  ],
};

/// Descriptor for `AnalyticsRedisUserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsRedisUserInfoDescriptor = $convert.base64Decode(
    'ChZBbmFseXRpY3NSZWRpc1VzZXJJbmZvEhcKBG5hbWUYASABKAlIAFIEbmFtZYgBARIZCghpc1'
    '9hZG1pbhgCIAEoCFIHaXNBZG1pbhIiCgpleHRyYV9kYXRhGAMgASgJSAFSCWV4dHJhRGF0YYgB'
    'ARIhCgpleF91c2VyX2lkGAQgASgJSAJSCGV4VXNlcklkiAEBQgcKBV9uYW1lQg0KC19leHRyYV'
    '9kYXRhQg0KC19leF91c2VyX2lk');
