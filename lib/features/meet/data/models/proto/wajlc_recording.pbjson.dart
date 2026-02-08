// This is a generated file - do not edit.
//
// Generated from wajlc_recording.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use recordingReqDescriptor instead')
const RecordingReq$json = {
  '1': 'RecordingReq',
  '2': [
    {
      '1': 'task',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.wajlc.RecordingTasks',
      '10': 'task'
    },
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_table_id', '3': 3, '4': 1, '5': 3, '10': 'roomTableId'},
    {'1': 'sid', '3': 4, '4': 1, '5': 9, '10': 'sid'},
    {
      '1': 'rtmp_url',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'rtmpUrl',
      '17': true
    },
    {
      '1': 'custom_design',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'customDesign',
      '17': true
    },
    {
      '1': 'recording_variant',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.wajlc.CloudRecordingVariants',
      '9': 2,
      '10': 'recordingVariant',
      '17': true
    },
  ],
  '8': [
    {'1': '_rtmp_url'},
    {'1': '_custom_design'},
    {'1': '_recording_variant'},
  ],
};

/// Descriptor for `RecordingReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordingReqDescriptor = $convert.base64Decode(
    'CgxSZWNvcmRpbmdSZXESKQoEdGFzaxgBIAEoDjIVLndhamxjLlJlY29yZGluZ1Rhc2tzUgR0YX'
    'NrEhcKB3Jvb21faWQYAiABKAlSBnJvb21JZBIiCg1yb29tX3RhYmxlX2lkGAMgASgDUgtyb29t'
    'VGFibGVJZBIQCgNzaWQYBCABKAlSA3NpZBIeCghydG1wX3VybBgFIAEoCUgAUgdydG1wVXJsiA'
    'EBEigKDWN1c3RvbV9kZXNpZ24YBiABKAlIAVIMY3VzdG9tRGVzaWduiAEBEk8KEXJlY29yZGlu'
    'Z192YXJpYW50GAcgASgOMh0ud2FqbGMuQ2xvdWRSZWNvcmRpbmdWYXJpYW50c0gCUhByZWNvcm'
    'RpbmdWYXJpYW50iAEBQgsKCV9ydG1wX3VybEIQCg5fY3VzdG9tX2Rlc2lnbkIUChJfcmVjb3Jk'
    'aW5nX3ZhcmlhbnQ=');

@$core.Deprecated('Use recordingInfoFileDescriptor instead')
const RecordingInfoFile$json = {
  '1': 'RecordingInfoFile',
  '2': [
    {'1': 'room_table_id', '3': 1, '4': 1, '5': 3, '10': 'roomTableId'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_title', '3': 3, '4': 1, '5': 9, '10': 'roomTitle'},
    {'1': 'room_sid', '3': 4, '4': 1, '5': 9, '10': 'roomSid'},
    {
      '1': 'room_creation_time',
      '3': 5,
      '4': 1,
      '5': 3,
      '10': 'roomCreationTime'
    },
    {'1': 'room_ended', '3': 6, '4': 1, '5': 3, '10': 'roomEnded'},
    {'1': 'recording_id', '3': 7, '4': 1, '5': 9, '10': 'recordingId'},
    {'1': 'recorder_id', '3': 8, '4': 1, '5': 9, '10': 'recorderId'},
    {'1': 'file_path', '3': 9, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'file_size', '3': 10, '4': 1, '5': 2, '10': 'fileSize'},
    {'1': 'creation_time', '3': 11, '4': 1, '5': 3, '10': 'creationTime'},
  ],
};

/// Descriptor for `RecordingInfoFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordingInfoFileDescriptor = $convert.base64Decode(
    'ChFSZWNvcmRpbmdJbmZvRmlsZRIiCg1yb29tX3RhYmxlX2lkGAEgASgDUgtyb29tVGFibGVJZB'
    'IXCgdyb29tX2lkGAIgASgJUgZyb29tSWQSHQoKcm9vbV90aXRsZRgDIAEoCVIJcm9vbVRpdGxl'
    'EhkKCHJvb21fc2lkGAQgASgJUgdyb29tU2lkEiwKEnJvb21fY3JlYXRpb25fdGltZRgFIAEoA1'
    'IQcm9vbUNyZWF0aW9uVGltZRIdCgpyb29tX2VuZGVkGAYgASgDUglyb29tRW5kZWQSIQoMcmVj'
    'b3JkaW5nX2lkGAcgASgJUgtyZWNvcmRpbmdJZBIfCgtyZWNvcmRlcl9pZBgIIAEoCVIKcmVjb3'
    'JkZXJJZBIbCglmaWxlX3BhdGgYCSABKAlSCGZpbGVQYXRoEhsKCWZpbGVfc2l6ZRgKIAEoAlII'
    'ZmlsZVNpemUSIwoNY3JlYXRpb25fdGltZRgLIAEoA1IMY3JlYXRpb25UaW1l');

@$core.Deprecated('Use recordingSubtitleDescriptor instead')
const RecordingSubtitle$json = {
  '1': 'RecordingSubtitle',
  '2': [
    {'1': 'label', '3': 1, '4': 1, '5': 9, '10': 'label'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `RecordingSubtitle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordingSubtitleDescriptor = $convert.base64Decode(
    'ChFSZWNvcmRpbmdTdWJ0aXRsZRIUCgVsYWJlbBgBIAEoCVIFbGFiZWwSEAoDdXJsGAIgASgJUg'
    'N1cmw=');

@$core.Deprecated('Use recordingMetadataDescriptor instead')
const RecordingMetadata$json = {
  '1': 'RecordingMetadata',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    {
      '1': 'description',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'description',
      '17': true
    },
    {
      '1': 'subtitles',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.wajlc.RecordingMetadata.SubtitlesEntry',
      '10': 'subtitles'
    },
    {
      '1': 'extra_data',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.wajlc.RecordingMetadata.ExtraDataEntry',
      '10': 'extraData'
    },
  ],
  '3': [
    RecordingMetadata_SubtitlesEntry$json,
    RecordingMetadata_ExtraDataEntry$json
  ],
  '8': [
    {'1': '_title'},
    {'1': '_description'},
  ],
};

@$core.Deprecated('Use recordingMetadataDescriptor instead')
const RecordingMetadata_SubtitlesEntry$json = {
  '1': 'SubtitlesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RecordingSubtitle',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use recordingMetadataDescriptor instead')
const RecordingMetadata_ExtraDataEntry$json = {
  '1': 'ExtraDataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RecordingMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordingMetadataDescriptor = $convert.base64Decode(
    'ChFSZWNvcmRpbmdNZXRhZGF0YRIZCgV0aXRsZRgBIAEoCUgAUgV0aXRsZYgBARIlCgtkZXNjcm'
    'lwdGlvbhgCIAEoCUgBUgtkZXNjcmlwdGlvbogBARJFCglzdWJ0aXRsZXMYAyADKAsyJy53YWps'
    'Yy5SZWNvcmRpbmdNZXRhZGF0YS5TdWJ0aXRsZXNFbnRyeVIJc3VidGl0bGVzEkYKCmV4dHJhX2'
    'RhdGEYBCADKAsyJy53YWpsYy5SZWNvcmRpbmdNZXRhZGF0YS5FeHRyYURhdGFFbnRyeVIJZXh0'
    'cmFEYXRhGlYKDlN1YnRpdGxlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5Ei4KBXZhbHVlGAIgAS'
    'gLMhgud2FqbGMuUmVjb3JkaW5nU3VidGl0bGVSBXZhbHVlOgI4ARo8Cg5FeHRyYURhdGFFbnRy'
    'eRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBQggKBl90aXRsZU'
    'IOCgxfZGVzY3JpcHRpb24=');
