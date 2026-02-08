// This is a generated file - do not edit.
//
// Generated from wajlc_datamessage.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

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
    {'1': 'PUSH_JOIN_BREAKOUT_ROOM', '2': 7},
    {'1': 'REQ_FULL_WHITEBOARD_DATA', '2': 8},
    {'1': 'RES_FULL_WHITEBOARD_DATA', '2': 9},
    {'1': 'SCENE_UPDATE', '2': 10},
    {'1': 'POINTER_UPDATE', '2': 11},
    {'1': 'WHITEBOARD_APP_STATE_CHANGE', '2': 12},
    {'1': 'PAGE_CHANGE', '2': 13},
    {'1': 'FILE_CHANGE', '2': 14},
    {'1': 'UPDATE_CURRENT_OFFICE_FILE_PAGES', '2': 15},
    {'1': 'WHITEBOARD_RESET', '2': 16},
    {'1': 'USER_CONNECTION_QUALITY_CHANGE', '2': 17},
    {'1': 'REQ_PUBLIC_CHAT_DATA', '2': 18},
    {'1': 'RES_PUBLIC_CHAT_DATA', '2': 19},
  ],
};

/// Descriptor for `DataMsgBodyType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dataMsgBodyTypeDescriptor = $convert.base64Decode(
    'Cg9EYXRhTXNnQm9keVR5cGUSCwoHVU5LTk9XThAAEg8KC0ZJTEVfVVBMT0FEEAESCAoESU5GTx'
    'ACEgkKBUFMRVJUEAMSGgoWVVNFUl9WSVNJQklMSVRZX0NIQU5HRRAEEiAKHEVYVEVSTkFMX01F'
    'RElBX1BMQVlFUl9FVkVOVFMQBRIVChFORVdfUE9MTF9SRVNQT05TRRAGEhsKF1BVU0hfSk9JTl'
    '9CUkVBS09VVF9ST09NEAcSHAoYUkVRX0ZVTExfV0hJVEVCT0FSRF9EQVRBEAgSHAoYUkVTX0ZV'
    'TExfV0hJVEVCT0FSRF9EQVRBEAkSEAoMU0NFTkVfVVBEQVRFEAoSEgoOUE9JTlRFUl9VUERBVE'
    'UQCxIfChtXSElURUJPQVJEX0FQUF9TVEFURV9DSEFOR0UQDBIPCgtQQUdFX0NIQU5HRRANEg8K'
    'C0ZJTEVfQ0hBTkdFEA4SJAogVVBEQVRFX0NVUlJFTlRfT0ZGSUNFX0ZJTEVfUEFHRVMQDxIUCh'
    'BXSElURUJPQVJEX1JFU0VUEBASIgoeVVNFUl9DT05ORUNUSU9OX1FVQUxJVFlfQ0hBTkdFEBES'
    'GAoUUkVRX1BVQkxJQ19DSEFUX0RBVEEQEhIYChRSRVNfUFVCTElDX0NIQVRfREFUQRAT');

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
