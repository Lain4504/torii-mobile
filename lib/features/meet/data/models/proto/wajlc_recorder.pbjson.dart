// This is a generated file - do not edit.
//
// Generated from wajlc_recorder.proto.

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

@$core.Deprecated('Use recordingTasksDescriptor instead')
const RecordingTasks$json = {
  '1': 'RecordingTasks',
  '2': [
    {'1': 'START_RECORDING', '2': 0},
    {'1': 'STOP_RECORDING', '2': 1},
    {'1': 'START_RTMP', '2': 2},
    {'1': 'STOP_RTMP', '2': 3},
    {'1': 'END_RECORDING', '2': 4},
    {'1': 'END_RTMP', '2': 5},
    {'1': 'RECORDING_PROCEEDED', '2': 6},
    {'1': 'STOP', '2': 7},
  ],
};

/// Descriptor for `RecordingTasks`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List recordingTasksDescriptor = $convert.base64Decode(
    'Cg5SZWNvcmRpbmdUYXNrcxITCg9TVEFSVF9SRUNPUkRJTkcQABISCg5TVE9QX1JFQ09SRElORx'
    'ABEg4KClNUQVJUX1JUTVAQAhINCglTVE9QX1JUTVAQAxIRCg1FTkRfUkVDT1JESU5HEAQSDAoI'
    'RU5EX1JUTVAQBRIXChNSRUNPUkRJTkdfUFJPQ0VFREVEEAYSCAoEU1RPUBAH');

@$core.Deprecated('Use recorderInfoKeysDescriptor instead')
const RecorderInfoKeys$json = {
  '1': 'RecorderInfoKeys',
  '2': [
    {'1': 'RECORDER_INFO_MAX_LIMIT', '2': 0},
    {'1': 'RECORDER_INFO_LAST_PING', '2': 1},
    {'1': 'RECORDER_INFO_CURRENT_PROGRESS', '2': 3},
  ],
};

/// Descriptor for `RecorderInfoKeys`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List recorderInfoKeysDescriptor = $convert.base64Decode(
    'ChBSZWNvcmRlckluZm9LZXlzEhsKF1JFQ09SREVSX0lORk9fTUFYX0xJTUlUEAASGwoXUkVDT1'
    'JERVJfSU5GT19MQVNUX1BJTkcQARIiCh5SRUNPUkRFUl9JTkZPX0NVUlJFTlRfUFJPR1JFU1MQ'
    'Aw==');

@$core.Deprecated('Use cloudRecordingVariantsDescriptor instead')
const CloudRecordingVariants$json = {
  '1': 'CloudRecordingVariants',
  '2': [
    {'1': 'FULL_SCREEN_CLOUD_RECORDING', '2': 0},
    {'1': 'MEDIA_ONLY_CLOUD_RECORDING', '2': 1},
  ],
};

/// Descriptor for `CloudRecordingVariants`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cloudRecordingVariantsDescriptor =
    $convert.base64Decode(
        'ChZDbG91ZFJlY29yZGluZ1ZhcmlhbnRzEh8KG0ZVTExfU0NSRUVOX0NMT1VEX1JFQ09SRElORx'
        'AAEh4KGk1FRElBX09OTFlfQ0xPVURfUkVDT1JESU5HEAE=');

@$core.Deprecated('Use wajlcToRecorderDescriptor instead')
const WajlcToRecorder$json = {
  '1': 'WajlcToRecorder',
  '2': [
    {'1': 'from', '3': 1, '4': 1, '5': 9, '10': 'from'},
    {
      '1': 'task',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.wajlc.RecordingTasks',
      '10': 'task'
    },
    {'1': 'room_table_id', '3': 3, '4': 1, '5': 3, '10': 'roomTableId'},
    {'1': 'room_id', '3': 4, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_sid', '3': 5, '4': 1, '5': 9, '10': 'roomSid'},
    {'1': 'recording_id', '3': 6, '4': 1, '5': 9, '10': 'recordingId'},
    {'1': 'recorder_id', '3': 7, '4': 1, '5': 9, '10': 'recorderId'},
    {'1': 'access_token', '3': 8, '4': 1, '5': 9, '10': 'accessToken'},
    {
      '1': 'rtmp_url',
      '3': 9,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'rtmpUrl',
      '17': true
    },
  ],
  '8': [
    {'1': '_rtmp_url'},
  ],
};

/// Descriptor for `WajlcToRecorder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wajlcToRecorderDescriptor = $convert.base64Decode(
    'Cg9XYWpsY1RvUmVjb3JkZXISEgoEZnJvbRgBIAEoCVIEZnJvbRIpCgR0YXNrGAIgASgOMhUud2'
    'FqbGMuUmVjb3JkaW5nVGFza3NSBHRhc2sSIgoNcm9vbV90YWJsZV9pZBgDIAEoA1ILcm9vbVRh'
    'YmxlSWQSFwoHcm9vbV9pZBgEIAEoCVIGcm9vbUlkEhkKCHJvb21fc2lkGAUgASgJUgdyb29tU2'
    'lkEiEKDHJlY29yZGluZ19pZBgGIAEoCVILcmVjb3JkaW5nSWQSHwoLcmVjb3JkZXJfaWQYByAB'
    'KAlSCnJlY29yZGVySWQSIQoMYWNjZXNzX3Rva2VuGAggASgJUgthY2Nlc3NUb2tlbhIeCghydG'
    '1wX3VybBgJIAEoCUgAUgdydG1wVXJsiAEBQgsKCV9ydG1wX3VybA==');

@$core.Deprecated('Use recorderToWajlcDescriptor instead')
const RecorderToWajlc$json = {
  '1': 'RecorderToWajlc',
  '2': [
    {'1': 'from', '3': 1, '4': 1, '5': 9, '10': 'from'},
    {
      '1': 'task',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.wajlc.RecordingTasks',
      '10': 'task'
    },
    {'1': 'status', '3': 3, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 4, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'recording_id', '3': 5, '4': 1, '5': 9, '10': 'recordingId'},
    {'1': 'room_table_id', '3': 11, '4': 1, '5': 3, '10': 'roomTableId'},
    {'1': 'room_id', '3': 6, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_sid', '3': 7, '4': 1, '5': 9, '10': 'roomSid'},
    {'1': 'recorder_id', '3': 8, '4': 1, '5': 9, '10': 'recorderId'},
    {'1': 'file_path', '3': 9, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'file_size', '3': 10, '4': 1, '5': 2, '10': 'fileSize'},
    {
      '1': 'recording_variant',
      '3': 12,
      '4': 1,
      '5': 14,
      '6': '.wajlc.CloudRecordingVariants',
      '9': 0,
      '10': 'recordingVariant',
      '17': true
    },
  ],
  '8': [
    {'1': '_recording_variant'},
  ],
};

/// Descriptor for `RecorderToWajlc`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recorderToWajlcDescriptor = $convert.base64Decode(
    'Cg9SZWNvcmRlclRvV2FqbGMSEgoEZnJvbRgBIAEoCVIEZnJvbRIpCgR0YXNrGAIgASgOMhUud2'
    'FqbGMuUmVjb3JkaW5nVGFza3NSBHRhc2sSFgoGc3RhdHVzGAMgASgIUgZzdGF0dXMSEAoDbXNn'
    'GAQgASgJUgNtc2cSIQoMcmVjb3JkaW5nX2lkGAUgASgJUgtyZWNvcmRpbmdJZBIiCg1yb29tX3'
    'RhYmxlX2lkGAsgASgDUgtyb29tVGFibGVJZBIXCgdyb29tX2lkGAYgASgJUgZyb29tSWQSGQoI'
    'cm9vbV9zaWQYByABKAlSB3Jvb21TaWQSHwoLcmVjb3JkZXJfaWQYCCABKAlSCnJlY29yZGVySW'
    'QSGwoJZmlsZV9wYXRoGAkgASgJUghmaWxlUGF0aBIbCglmaWxlX3NpemUYCiABKAJSCGZpbGVT'
    'aXplEk8KEXJlY29yZGluZ192YXJpYW50GAwgASgOMh0ud2FqbGMuQ2xvdWRSZWNvcmRpbmdWYX'
    'JpYW50c0gAUhByZWNvcmRpbmdWYXJpYW50iAEBQhQKEl9yZWNvcmRpbmdfdmFyaWFudA==');

@$core.Deprecated('Use transcodingTaskDescriptor instead')
const TranscodingTask$json = {
  '1': 'TranscodingTask',
  '2': [
    {'1': 'recording_id', '3': 1, '4': 1, '5': 9, '10': 'recordingId'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_sid', '3': 3, '4': 1, '5': 9, '10': 'roomSid'},
    {'1': 'file_path', '3': 4, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'file_name', '3': 5, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'room_table_id', '3': 6, '4': 1, '5': 3, '10': 'roomTableId'},
    {'1': 'recorder_id', '3': 7, '4': 1, '5': 9, '10': 'recorderId'},
    {
      '1': 'recording_variant',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.wajlc.CloudRecordingVariants',
      '10': 'recordingVariant'
    },
  ],
};

/// Descriptor for `TranscodingTask`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transcodingTaskDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2NvZGluZ1Rhc2sSIQoMcmVjb3JkaW5nX2lkGAEgASgJUgtyZWNvcmRpbmdJZBIXCg'
    'dyb29tX2lkGAIgASgJUgZyb29tSWQSGQoIcm9vbV9zaWQYAyABKAlSB3Jvb21TaWQSGwoJZmls'
    'ZV9wYXRoGAQgASgJUghmaWxlUGF0aBIbCglmaWxlX25hbWUYBSABKAlSCGZpbGVOYW1lEiIKDX'
    'Jvb21fdGFibGVfaWQYBiABKANSC3Jvb21UYWJsZUlkEh8KC3JlY29yZGVyX2lkGAcgASgJUgpy'
    'ZWNvcmRlcklkEkoKEXJlY29yZGluZ192YXJpYW50GAggASgOMh0ud2FqbGMuQ2xvdWRSZWNvcm'
    'RpbmdWYXJpYW50c1IQcmVjb3JkaW5nVmFyaWFudA==');
