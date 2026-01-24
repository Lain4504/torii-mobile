// This is a generated file - do not edit.
//
// Generated from wajlc_datamessage.proto.

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

@$core.Deprecated('Use dataMsgBodyTypeDescriptor instead')
const DataMsgBodyType$json = {
  '1': 'DataMsgBodyType',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'FILE_UPLOAD', '2': 1},
    {'1': 'INFO', '2': 2},
    {'1': 'ALERT', '2': 3},
    {'1': 'USER_VISIBILITY_CHANGE', '2': 4},
    {'1': 'EXTERNAL_MEDIA_PLAYER_EVENTS', '2': 5},
    {'1': 'NEW_POLL_RESPONSE', '2': 6},
    {'1': 'PUSH_JOIN_BREAKOUT_ROOM', '2': 19},
    {'1': 'SPEECH_SUBTITLE_TEXT', '2': 7},
    {'1': 'REQ_FULL_WHITEBOARD_DATA', '2': 8},
    {'1': 'RES_FULL_WHITEBOARD_DATA', '2': 9},
    {'1': 'SCENE_UPDATE', '2': 10},
    {'1': 'POINTER_UPDATE', '2': 11},
    {'1': 'WHITEBOARD_APP_STATE_CHANGE', '2': 12},
    {'1': 'PAGE_CHANGE', '2': 15},
    {'1': 'FILE_CHANGE', '2': 17},
    {'1': 'UPDATE_CURRENT_OFFICE_FILE_PAGES', '2': 18},
    {'1': 'WHITEBOARD_RESET', '2': 20},
    {
      '1': 'ADD_WHITEBOARD_FILE',
      '2': 13,
      '3': {'1': true},
    },
    {
      '1': 'ADD_WHITEBOARD_OFFICE_FILE',
      '2': 14,
      '3': {'1': true},
    },
    {'1': 'USER_CONNECTION_QUALITY_CHANGE', '2': 16},
  ],
};

/// Descriptor for `DataMsgBodyType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dataMsgBodyTypeDescriptor = $convert.base64Decode(
    'Cg9EYXRhTXNnQm9keVR5cGUSCwoHVU5LTk9XThAAEg8KC0ZJTEVfVVBMT0FEEAESCAoESU5GTx'
    'ACEgkKBUFMRVJUEAMSGgoWVVNFUl9WSVNJQklMSVRZX0NIQU5HRRAEEiAKHEVYVEVSTkFMX01F'
    'RElBX1BMQVlFUl9FVkVOVFMQBRIVChFORVdfUE9MTF9SRVNQT05TRRAGEhsKF1BVU0hfSk9JTl'
    '9CUkVBS09VVF9ST09NEBMSGAoUU1BFRUNIX1NVQlRJVExFX1RFWFQQBxIcChhSRVFfRlVMTF9X'
    'SElURUJPQVJEX0RBVEEQCBIcChhSRVNfRlVMTF9XSElURUJPQVJEX0RBVEEQCRIQCgxTQ0VORV'
    '9VUERBVEUQChISCg5QT0lOVEVSX1VQREFURRALEh8KG1dISVRFQk9BUkRfQVBQX1NUQVRFX0NI'
    'QU5HRRAMEg8KC1BBR0VfQ0hBTkdFEA8SDwoLRklMRV9DSEFOR0UQERIkCiBVUERBVEVfQ1VSUk'
    'VOVF9PRkZJQ0VfRklMRV9QQUdFUxASEhQKEFdISVRFQk9BUkRfUkVTRVQQFBIbChNBRERfV0hJ'
    'VEVCT0FSRF9GSUxFEA0aAggBEiIKGkFERF9XSElURUJPQVJEX09GRklDRV9GSUxFEA4aAggBEi'
    'IKHlVTRVJfQ09OTkVDVElPTl9RVUFMSVRZX0NIQU5HRRAQ');

@$core.Deprecated('Use dataChannelMessageDescriptor instead')
const DataChannelMessage$json = {
  '1': 'DataChannelMessage',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.wajlc.DataMsgBodyType',
      '10': 'type'
    },
    {'1': 'from_user_id', '3': 3, '4': 1, '5': 9, '10': 'fromUserId'},
    {
      '1': 'to_user_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'toUserId',
      '17': true
    },
    {'1': 'message', '3': 5, '4': 1, '5': 9, '10': 'message'},
  ],
  '8': [
    {'1': '_to_user_id'},
  ],
};

/// Descriptor for `DataChannelMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dataChannelMessageDescriptor = $convert.base64Decode(
    'ChJEYXRhQ2hhbm5lbE1lc3NhZ2USDgoCaWQYASABKAlSAmlkEioKBHR5cGUYAiABKA4yFi53YW'
    'psYy5EYXRhTXNnQm9keVR5cGVSBHR5cGUSIAoMZnJvbV91c2VyX2lkGAMgASgJUgpmcm9tVXNl'
    'cklkEiEKCnRvX3VzZXJfaWQYBCABKAlIAFIIdG9Vc2VySWSIAQESGAoHbWVzc2FnZRgFIAEoCV'
    'IHbWVzc2FnZUINCgtfdG9fdXNlcl9pZA==');
