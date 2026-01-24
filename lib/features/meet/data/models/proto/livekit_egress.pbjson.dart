// This is a generated file - do not edit.
//
// Generated from livekit_egress.proto.

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

import 'livekit_models.pbjson.dart' as $0;

@$core.Deprecated('Use encodedFileTypeDescriptor instead')
const EncodedFileType$json = {
  '1': 'EncodedFileType',
  '2': [
    {'1': 'DEFAULT_FILETYPE', '2': 0},
    {'1': 'MP4', '2': 1},
    {'1': 'OGG', '2': 2},
    {'1': 'MP3', '2': 3},
  ],
};

/// Descriptor for `EncodedFileType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List encodedFileTypeDescriptor = $convert.base64Decode(
    'Cg9FbmNvZGVkRmlsZVR5cGUSFAoQREVGQVVMVF9GSUxFVFlQRRAAEgcKA01QNBABEgcKA09HRx'
    'ACEgcKA01QMxAD');

@$core.Deprecated('Use segmentedFileProtocolDescriptor instead')
const SegmentedFileProtocol$json = {
  '1': 'SegmentedFileProtocol',
  '2': [
    {'1': 'DEFAULT_SEGMENTED_FILE_PROTOCOL', '2': 0},
    {'1': 'HLS_PROTOCOL', '2': 1},
  ],
};

/// Descriptor for `SegmentedFileProtocol`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List segmentedFileProtocolDescriptor = $convert.base64Decode(
    'ChVTZWdtZW50ZWRGaWxlUHJvdG9jb2wSIwofREVGQVVMVF9TRUdNRU5URURfRklMRV9QUk9UT0'
    'NPTBAAEhAKDEhMU19QUk9UT0NPTBAB');

@$core.Deprecated('Use segmentedFileSuffixDescriptor instead')
const SegmentedFileSuffix$json = {
  '1': 'SegmentedFileSuffix',
  '2': [
    {'1': 'INDEX', '2': 0},
    {'1': 'TIMESTAMP', '2': 1},
  ],
};

/// Descriptor for `SegmentedFileSuffix`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List segmentedFileSuffixDescriptor =
    $convert.base64Decode(
        'ChNTZWdtZW50ZWRGaWxlU3VmZml4EgkKBUlOREVYEAASDQoJVElNRVNUQU1QEAE=');

@$core.Deprecated('Use imageFileSuffixDescriptor instead')
const ImageFileSuffix$json = {
  '1': 'ImageFileSuffix',
  '2': [
    {'1': 'IMAGE_SUFFIX_INDEX', '2': 0},
    {'1': 'IMAGE_SUFFIX_TIMESTAMP', '2': 1},
    {'1': 'IMAGE_SUFFIX_NONE_OVERWRITE', '2': 2},
  ],
};

/// Descriptor for `ImageFileSuffix`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List imageFileSuffixDescriptor = $convert.base64Decode(
    'Cg9JbWFnZUZpbGVTdWZmaXgSFgoSSU1BR0VfU1VGRklYX0lOREVYEAASGgoWSU1BR0VfU1VGRk'
    'lYX1RJTUVTVEFNUBABEh8KG0lNQUdFX1NVRkZJWF9OT05FX09WRVJXUklURRAC');

@$core.Deprecated('Use streamProtocolDescriptor instead')
const StreamProtocol$json = {
  '1': 'StreamProtocol',
  '2': [
    {'1': 'DEFAULT_PROTOCOL', '2': 0},
    {'1': 'RTMP', '2': 1},
    {'1': 'SRT', '2': 2},
  ],
};

/// Descriptor for `StreamProtocol`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List streamProtocolDescriptor = $convert.base64Decode(
    'Cg5TdHJlYW1Qcm90b2NvbBIUChBERUZBVUxUX1BST1RPQ09MEAASCAoEUlRNUBABEgcKA1NSVB'
    'AC');

@$core.Deprecated('Use audioMixingDescriptor instead')
const AudioMixing$json = {
  '1': 'AudioMixing',
  '2': [
    {'1': 'DEFAULT_MIXING', '2': 0},
    {'1': 'DUAL_CHANNEL_AGENT', '2': 1},
    {'1': 'DUAL_CHANNEL_ALTERNATE', '2': 2},
  ],
};

/// Descriptor for `AudioMixing`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List audioMixingDescriptor = $convert.base64Decode(
    'CgtBdWRpb01peGluZxISCg5ERUZBVUxUX01JWElORxAAEhYKEkRVQUxfQ0hBTk5FTF9BR0VOVB'
    'ABEhoKFkRVQUxfQ0hBTk5FTF9BTFRFUk5BVEUQAg==');

@$core.Deprecated('Use encodingOptionsPresetDescriptor instead')
const EncodingOptionsPreset$json = {
  '1': 'EncodingOptionsPreset',
  '2': [
    {'1': 'H264_720P_30', '2': 0},
    {'1': 'H264_720P_60', '2': 1},
    {'1': 'H264_1080P_30', '2': 2},
    {'1': 'H264_1080P_60', '2': 3},
    {'1': 'PORTRAIT_H264_720P_30', '2': 4},
    {'1': 'PORTRAIT_H264_720P_60', '2': 5},
    {'1': 'PORTRAIT_H264_1080P_30', '2': 6},
    {'1': 'PORTRAIT_H264_1080P_60', '2': 7},
  ],
};

/// Descriptor for `EncodingOptionsPreset`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List encodingOptionsPresetDescriptor = $convert.base64Decode(
    'ChVFbmNvZGluZ09wdGlvbnNQcmVzZXQSEAoMSDI2NF83MjBQXzMwEAASEAoMSDI2NF83MjBQXz'
    'YwEAESEQoNSDI2NF8xMDgwUF8zMBACEhEKDUgyNjRfMTA4MFBfNjAQAxIZChVQT1JUUkFJVF9I'
    'MjY0XzcyMFBfMzAQBBIZChVQT1JUUkFJVF9IMjY0XzcyMFBfNjAQBRIaChZQT1JUUkFJVF9IMj'
    'Y0XzEwODBQXzMwEAYSGgoWUE9SVFJBSVRfSDI2NF8xMDgwUF82MBAH');

@$core.Deprecated('Use egressStatusDescriptor instead')
const EgressStatus$json = {
  '1': 'EgressStatus',
  '2': [
    {'1': 'EGRESS_STARTING', '2': 0},
    {'1': 'EGRESS_ACTIVE', '2': 1},
    {'1': 'EGRESS_ENDING', '2': 2},
    {'1': 'EGRESS_COMPLETE', '2': 3},
    {'1': 'EGRESS_FAILED', '2': 4},
    {'1': 'EGRESS_ABORTED', '2': 5},
    {'1': 'EGRESS_LIMIT_REACHED', '2': 6},
  ],
};

/// Descriptor for `EgressStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List egressStatusDescriptor = $convert.base64Decode(
    'CgxFZ3Jlc3NTdGF0dXMSEwoPRUdSRVNTX1NUQVJUSU5HEAASEQoNRUdSRVNTX0FDVElWRRABEh'
    'EKDUVHUkVTU19FTkRJTkcQAhITCg9FR1JFU1NfQ09NUExFVEUQAxIRCg1FR1JFU1NfRkFJTEVE'
    'EAQSEgoORUdSRVNTX0FCT1JURUQQBRIYChRFR1JFU1NfTElNSVRfUkVBQ0hFRBAG');

@$core.Deprecated('Use egressSourceTypeDescriptor instead')
const EgressSourceType$json = {
  '1': 'EgressSourceType',
  '2': [
    {'1': 'EGRESS_SOURCE_TYPE_WEB', '2': 0},
    {'1': 'EGRESS_SOURCE_TYPE_SDK', '2': 1},
  ],
};

/// Descriptor for `EgressSourceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List egressSourceTypeDescriptor = $convert.base64Decode(
    'ChBFZ3Jlc3NTb3VyY2VUeXBlEhoKFkVHUkVTU19TT1VSQ0VfVFlQRV9XRUIQABIaChZFR1JFU1'
    'NfU09VUkNFX1RZUEVfU0RLEAE=');

@$core.Deprecated('Use roomCompositeEgressRequestDescriptor instead')
const RoomCompositeEgressRequest$json = {
  '1': 'RoomCompositeEgressRequest',
  '2': [
    {'1': 'room_name', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'layout', '3': 2, '4': 1, '5': 9, '10': 'layout'},
    {'1': 'audio_only', '3': 3, '4': 1, '5': 8, '10': 'audioOnly'},
    {
      '1': 'audio_mixing',
      '3': 15,
      '4': 1,
      '5': 14,
      '6': '.livekit.AudioMixing',
      '10': 'audioMixing'
    },
    {'1': 'video_only', '3': 4, '4': 1, '5': 8, '10': 'videoOnly'},
    {'1': 'custom_base_url', '3': 5, '4': 1, '5': 9, '10': 'customBaseUrl'},
    {
      '1': 'file',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.livekit.EncodedFileOutput',
      '8': {'3': true},
      '9': 0,
      '10': 'file',
    },
    {
      '1': 'stream',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.livekit.StreamOutput',
      '8': {'3': true},
      '9': 0,
      '10': 'stream',
    },
    {
      '1': 'segments',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.livekit.SegmentedFileOutput',
      '8': {'3': true},
      '9': 0,
      '10': 'segments',
    },
    {
      '1': 'preset',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.livekit.EncodingOptionsPreset',
      '9': 1,
      '10': 'preset'
    },
    {
      '1': 'advanced',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.livekit.EncodingOptions',
      '9': 1,
      '10': 'advanced'
    },
    {
      '1': 'file_outputs',
      '3': 11,
      '4': 3,
      '5': 11,
      '6': '.livekit.EncodedFileOutput',
      '10': 'fileOutputs'
    },
    {
      '1': 'stream_outputs',
      '3': 12,
      '4': 3,
      '5': 11,
      '6': '.livekit.StreamOutput',
      '10': 'streamOutputs'
    },
    {
      '1': 'segment_outputs',
      '3': 13,
      '4': 3,
      '5': 11,
      '6': '.livekit.SegmentedFileOutput',
      '10': 'segmentOutputs'
    },
    {
      '1': 'image_outputs',
      '3': 14,
      '4': 3,
      '5': 11,
      '6': '.livekit.ImageOutput',
      '10': 'imageOutputs'
    },
    {
      '1': 'webhooks',
      '3': 16,
      '4': 3,
      '5': 11,
      '6': '.livekit.WebhookConfig',
      '10': 'webhooks'
    },
  ],
  '8': [
    {'1': 'output'},
    {'1': 'options'},
  ],
};

/// Descriptor for `RoomCompositeEgressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomCompositeEgressRequestDescriptor = $convert.base64Decode(
    'ChpSb29tQ29tcG9zaXRlRWdyZXNzUmVxdWVzdBIbCglyb29tX25hbWUYASABKAlSCHJvb21OYW'
    '1lEhYKBmxheW91dBgCIAEoCVIGbGF5b3V0Eh0KCmF1ZGlvX29ubHkYAyABKAhSCWF1ZGlvT25s'
    'eRI3CgxhdWRpb19taXhpbmcYDyABKA4yFC5saXZla2l0LkF1ZGlvTWl4aW5nUgthdWRpb01peG'
    'luZxIdCgp2aWRlb19vbmx5GAQgASgIUgl2aWRlb09ubHkSJgoPY3VzdG9tX2Jhc2VfdXJsGAUg'
    'ASgJUg1jdXN0b21CYXNlVXJsEjQKBGZpbGUYBiABKAsyGi5saXZla2l0LkVuY29kZWRGaWxlT3'
    'V0cHV0QgIYAUgAUgRmaWxlEjMKBnN0cmVhbRgHIAEoCzIVLmxpdmVraXQuU3RyZWFtT3V0cHV0'
    'QgIYAUgAUgZzdHJlYW0SPgoIc2VnbWVudHMYCiABKAsyHC5saXZla2l0LlNlZ21lbnRlZEZpbG'
    'VPdXRwdXRCAhgBSABSCHNlZ21lbnRzEjgKBnByZXNldBgIIAEoDjIeLmxpdmVraXQuRW5jb2Rp'
    'bmdPcHRpb25zUHJlc2V0SAFSBnByZXNldBI2CghhZHZhbmNlZBgJIAEoCzIYLmxpdmVraXQuRW'
    '5jb2RpbmdPcHRpb25zSAFSCGFkdmFuY2VkEj0KDGZpbGVfb3V0cHV0cxgLIAMoCzIaLmxpdmVr'
    'aXQuRW5jb2RlZEZpbGVPdXRwdXRSC2ZpbGVPdXRwdXRzEjwKDnN0cmVhbV9vdXRwdXRzGAwgAy'
    'gLMhUubGl2ZWtpdC5TdHJlYW1PdXRwdXRSDXN0cmVhbU91dHB1dHMSRQoPc2VnbWVudF9vdXRw'
    'dXRzGA0gAygLMhwubGl2ZWtpdC5TZWdtZW50ZWRGaWxlT3V0cHV0Ug5zZWdtZW50T3V0cHV0cx'
    'I5Cg1pbWFnZV9vdXRwdXRzGA4gAygLMhQubGl2ZWtpdC5JbWFnZU91dHB1dFIMaW1hZ2VPdXRw'
    'dXRzEjIKCHdlYmhvb2tzGBAgAygLMhYubGl2ZWtpdC5XZWJob29rQ29uZmlnUgh3ZWJob29rc0'
    'IICgZvdXRwdXRCCQoHb3B0aW9ucw==');

@$core.Deprecated('Use webEgressRequestDescriptor instead')
const WebEgressRequest$json = {
  '1': 'WebEgressRequest',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'audio_only', '3': 2, '4': 1, '5': 8, '10': 'audioOnly'},
    {'1': 'video_only', '3': 3, '4': 1, '5': 8, '10': 'videoOnly'},
    {
      '1': 'await_start_signal',
      '3': 12,
      '4': 1,
      '5': 8,
      '10': 'awaitStartSignal'
    },
    {
      '1': 'file',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.livekit.EncodedFileOutput',
      '8': {'3': true},
      '9': 0,
      '10': 'file',
    },
    {
      '1': 'stream',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.livekit.StreamOutput',
      '8': {'3': true},
      '9': 0,
      '10': 'stream',
    },
    {
      '1': 'segments',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.livekit.SegmentedFileOutput',
      '8': {'3': true},
      '9': 0,
      '10': 'segments',
    },
    {
      '1': 'preset',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.livekit.EncodingOptionsPreset',
      '9': 1,
      '10': 'preset'
    },
    {
      '1': 'advanced',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.livekit.EncodingOptions',
      '9': 1,
      '10': 'advanced'
    },
    {
      '1': 'file_outputs',
      '3': 9,
      '4': 3,
      '5': 11,
      '6': '.livekit.EncodedFileOutput',
      '10': 'fileOutputs'
    },
    {
      '1': 'stream_outputs',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.livekit.StreamOutput',
      '10': 'streamOutputs'
    },
    {
      '1': 'segment_outputs',
      '3': 11,
      '4': 3,
      '5': 11,
      '6': '.livekit.SegmentedFileOutput',
      '10': 'segmentOutputs'
    },
    {
      '1': 'image_outputs',
      '3': 13,
      '4': 3,
      '5': 11,
      '6': '.livekit.ImageOutput',
      '10': 'imageOutputs'
    },
    {
      '1': 'webhooks',
      '3': 14,
      '4': 3,
      '5': 11,
      '6': '.livekit.WebhookConfig',
      '10': 'webhooks'
    },
  ],
  '8': [
    {'1': 'output'},
    {'1': 'options'},
  ],
};

/// Descriptor for `WebEgressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List webEgressRequestDescriptor = $convert.base64Decode(
    'ChBXZWJFZ3Jlc3NSZXF1ZXN0EhAKA3VybBgBIAEoCVIDdXJsEh0KCmF1ZGlvX29ubHkYAiABKA'
    'hSCWF1ZGlvT25seRIdCgp2aWRlb19vbmx5GAMgASgIUgl2aWRlb09ubHkSLAoSYXdhaXRfc3Rh'
    'cnRfc2lnbmFsGAwgASgIUhBhd2FpdFN0YXJ0U2lnbmFsEjQKBGZpbGUYBCABKAsyGi5saXZla2'
    'l0LkVuY29kZWRGaWxlT3V0cHV0QgIYAUgAUgRmaWxlEjMKBnN0cmVhbRgFIAEoCzIVLmxpdmVr'
    'aXQuU3RyZWFtT3V0cHV0QgIYAUgAUgZzdHJlYW0SPgoIc2VnbWVudHMYBiABKAsyHC5saXZla2'
    'l0LlNlZ21lbnRlZEZpbGVPdXRwdXRCAhgBSABSCHNlZ21lbnRzEjgKBnByZXNldBgHIAEoDjIe'
    'LmxpdmVraXQuRW5jb2RpbmdPcHRpb25zUHJlc2V0SAFSBnByZXNldBI2CghhZHZhbmNlZBgIIA'
    'EoCzIYLmxpdmVraXQuRW5jb2RpbmdPcHRpb25zSAFSCGFkdmFuY2VkEj0KDGZpbGVfb3V0cHV0'
    'cxgJIAMoCzIaLmxpdmVraXQuRW5jb2RlZEZpbGVPdXRwdXRSC2ZpbGVPdXRwdXRzEjwKDnN0cm'
    'VhbV9vdXRwdXRzGAogAygLMhUubGl2ZWtpdC5TdHJlYW1PdXRwdXRSDXN0cmVhbU91dHB1dHMS'
    'RQoPc2VnbWVudF9vdXRwdXRzGAsgAygLMhwubGl2ZWtpdC5TZWdtZW50ZWRGaWxlT3V0cHV0Ug'
    '5zZWdtZW50T3V0cHV0cxI5Cg1pbWFnZV9vdXRwdXRzGA0gAygLMhQubGl2ZWtpdC5JbWFnZU91'
    'dHB1dFIMaW1hZ2VPdXRwdXRzEjIKCHdlYmhvb2tzGA4gAygLMhYubGl2ZWtpdC5XZWJob29rQ2'
    '9uZmlnUgh3ZWJob29rc0IICgZvdXRwdXRCCQoHb3B0aW9ucw==');

@$core.Deprecated('Use participantEgressRequestDescriptor instead')
const ParticipantEgressRequest$json = {
  '1': 'ParticipantEgressRequest',
  '2': [
    {'1': 'room_name', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'identity', '3': 2, '4': 1, '5': 9, '10': 'identity'},
    {'1': 'screen_share', '3': 3, '4': 1, '5': 8, '10': 'screenShare'},
    {
      '1': 'preset',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.livekit.EncodingOptionsPreset',
      '9': 0,
      '10': 'preset'
    },
    {
      '1': 'advanced',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.livekit.EncodingOptions',
      '9': 0,
      '10': 'advanced'
    },
    {
      '1': 'file_outputs',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.livekit.EncodedFileOutput',
      '10': 'fileOutputs'
    },
    {
      '1': 'stream_outputs',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.livekit.StreamOutput',
      '10': 'streamOutputs'
    },
    {
      '1': 'segment_outputs',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.livekit.SegmentedFileOutput',
      '10': 'segmentOutputs'
    },
    {
      '1': 'image_outputs',
      '3': 9,
      '4': 3,
      '5': 11,
      '6': '.livekit.ImageOutput',
      '10': 'imageOutputs'
    },
    {
      '1': 'webhooks',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.livekit.WebhookConfig',
      '10': 'webhooks'
    },
  ],
  '8': [
    {'1': 'options'},
  ],
};

/// Descriptor for `ParticipantEgressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List participantEgressRequestDescriptor = $convert.base64Decode(
    'ChhQYXJ0aWNpcGFudEVncmVzc1JlcXVlc3QSGwoJcm9vbV9uYW1lGAEgASgJUghyb29tTmFtZR'
    'IaCghpZGVudGl0eRgCIAEoCVIIaWRlbnRpdHkSIQoMc2NyZWVuX3NoYXJlGAMgASgIUgtzY3Jl'
    'ZW5TaGFyZRI4CgZwcmVzZXQYBCABKA4yHi5saXZla2l0LkVuY29kaW5nT3B0aW9uc1ByZXNldE'
    'gAUgZwcmVzZXQSNgoIYWR2YW5jZWQYBSABKAsyGC5saXZla2l0LkVuY29kaW5nT3B0aW9uc0gA'
    'UghhZHZhbmNlZBI9CgxmaWxlX291dHB1dHMYBiADKAsyGi5saXZla2l0LkVuY29kZWRGaWxlT3'
    'V0cHV0UgtmaWxlT3V0cHV0cxI8Cg5zdHJlYW1fb3V0cHV0cxgHIAMoCzIVLmxpdmVraXQuU3Ry'
    'ZWFtT3V0cHV0Ug1zdHJlYW1PdXRwdXRzEkUKD3NlZ21lbnRfb3V0cHV0cxgIIAMoCzIcLmxpdm'
    'VraXQuU2VnbWVudGVkRmlsZU91dHB1dFIOc2VnbWVudE91dHB1dHMSOQoNaW1hZ2Vfb3V0cHV0'
    'cxgJIAMoCzIULmxpdmVraXQuSW1hZ2VPdXRwdXRSDGltYWdlT3V0cHV0cxIyCgh3ZWJob29rcx'
    'gKIAMoCzIWLmxpdmVraXQuV2ViaG9va0NvbmZpZ1IId2ViaG9va3NCCQoHb3B0aW9ucw==');

@$core.Deprecated('Use trackCompositeEgressRequestDescriptor instead')
const TrackCompositeEgressRequest$json = {
  '1': 'TrackCompositeEgressRequest',
  '2': [
    {'1': 'room_name', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'audio_track_id', '3': 2, '4': 1, '5': 9, '10': 'audioTrackId'},
    {'1': 'video_track_id', '3': 3, '4': 1, '5': 9, '10': 'videoTrackId'},
    {
      '1': 'file',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.livekit.EncodedFileOutput',
      '8': {'3': true},
      '9': 0,
      '10': 'file',
    },
    {
      '1': 'stream',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.livekit.StreamOutput',
      '8': {'3': true},
      '9': 0,
      '10': 'stream',
    },
    {
      '1': 'segments',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.livekit.SegmentedFileOutput',
      '8': {'3': true},
      '9': 0,
      '10': 'segments',
    },
    {
      '1': 'preset',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.livekit.EncodingOptionsPreset',
      '9': 1,
      '10': 'preset'
    },
    {
      '1': 'advanced',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.livekit.EncodingOptions',
      '9': 1,
      '10': 'advanced'
    },
    {
      '1': 'file_outputs',
      '3': 11,
      '4': 3,
      '5': 11,
      '6': '.livekit.EncodedFileOutput',
      '10': 'fileOutputs'
    },
    {
      '1': 'stream_outputs',
      '3': 12,
      '4': 3,
      '5': 11,
      '6': '.livekit.StreamOutput',
      '10': 'streamOutputs'
    },
    {
      '1': 'segment_outputs',
      '3': 13,
      '4': 3,
      '5': 11,
      '6': '.livekit.SegmentedFileOutput',
      '10': 'segmentOutputs'
    },
    {
      '1': 'image_outputs',
      '3': 14,
      '4': 3,
      '5': 11,
      '6': '.livekit.ImageOutput',
      '10': 'imageOutputs'
    },
    {
      '1': 'webhooks',
      '3': 15,
      '4': 3,
      '5': 11,
      '6': '.livekit.WebhookConfig',
      '10': 'webhooks'
    },
  ],
  '8': [
    {'1': 'output'},
    {'1': 'options'},
  ],
};

/// Descriptor for `TrackCompositeEgressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackCompositeEgressRequestDescriptor = $convert.base64Decode(
    'ChtUcmFja0NvbXBvc2l0ZUVncmVzc1JlcXVlc3QSGwoJcm9vbV9uYW1lGAEgASgJUghyb29tTm'
    'FtZRIkCg5hdWRpb190cmFja19pZBgCIAEoCVIMYXVkaW9UcmFja0lkEiQKDnZpZGVvX3RyYWNr'
    'X2lkGAMgASgJUgx2aWRlb1RyYWNrSWQSNAoEZmlsZRgEIAEoCzIaLmxpdmVraXQuRW5jb2RlZE'
    'ZpbGVPdXRwdXRCAhgBSABSBGZpbGUSMwoGc3RyZWFtGAUgASgLMhUubGl2ZWtpdC5TdHJlYW1P'
    'dXRwdXRCAhgBSABSBnN0cmVhbRI+CghzZWdtZW50cxgIIAEoCzIcLmxpdmVraXQuU2VnbWVudG'
    'VkRmlsZU91dHB1dEICGAFIAFIIc2VnbWVudHMSOAoGcHJlc2V0GAYgASgOMh4ubGl2ZWtpdC5F'
    'bmNvZGluZ09wdGlvbnNQcmVzZXRIAVIGcHJlc2V0EjYKCGFkdmFuY2VkGAcgASgLMhgubGl2ZW'
    'tpdC5FbmNvZGluZ09wdGlvbnNIAVIIYWR2YW5jZWQSPQoMZmlsZV9vdXRwdXRzGAsgAygLMhou'
    'bGl2ZWtpdC5FbmNvZGVkRmlsZU91dHB1dFILZmlsZU91dHB1dHMSPAoOc3RyZWFtX291dHB1dH'
    'MYDCADKAsyFS5saXZla2l0LlN0cmVhbU91dHB1dFINc3RyZWFtT3V0cHV0cxJFCg9zZWdtZW50'
    'X291dHB1dHMYDSADKAsyHC5saXZla2l0LlNlZ21lbnRlZEZpbGVPdXRwdXRSDnNlZ21lbnRPdX'
    'RwdXRzEjkKDWltYWdlX291dHB1dHMYDiADKAsyFC5saXZla2l0LkltYWdlT3V0cHV0UgxpbWFn'
    'ZU91dHB1dHMSMgoId2ViaG9va3MYDyADKAsyFi5saXZla2l0LldlYmhvb2tDb25maWdSCHdlYm'
    'hvb2tzQggKBm91dHB1dEIJCgdvcHRpb25z');

@$core.Deprecated('Use trackEgressRequestDescriptor instead')
const TrackEgressRequest$json = {
  '1': 'TrackEgressRequest',
  '2': [
    {'1': 'room_name', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'track_id', '3': 2, '4': 1, '5': 9, '10': 'trackId'},
    {
      '1': 'file',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.livekit.DirectFileOutput',
      '9': 0,
      '10': 'file'
    },
    {
      '1': 'websocket_url',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'websocketUrl'
    },
    {
      '1': 'webhooks',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.livekit.WebhookConfig',
      '10': 'webhooks'
    },
  ],
  '8': [
    {'1': 'output'},
  ],
};

/// Descriptor for `TrackEgressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackEgressRequestDescriptor = $convert.base64Decode(
    'ChJUcmFja0VncmVzc1JlcXVlc3QSGwoJcm9vbV9uYW1lGAEgASgJUghyb29tTmFtZRIZCgh0cm'
    'Fja19pZBgCIAEoCVIHdHJhY2tJZBIvCgRmaWxlGAMgASgLMhkubGl2ZWtpdC5EaXJlY3RGaWxl'
    'T3V0cHV0SABSBGZpbGUSJQoNd2Vic29ja2V0X3VybBgEIAEoCUgAUgx3ZWJzb2NrZXRVcmwSMg'
    'oId2ViaG9va3MYBSADKAsyFi5saXZla2l0LldlYmhvb2tDb25maWdSCHdlYmhvb2tzQggKBm91'
    'dHB1dA==');

@$core.Deprecated('Use encodedFileOutputDescriptor instead')
const EncodedFileOutput$json = {
  '1': 'EncodedFileOutput',
  '2': [
    {
      '1': 'file_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.livekit.EncodedFileType',
      '10': 'fileType'
    },
    {'1': 'filepath', '3': 2, '4': 1, '5': 9, '10': 'filepath'},
    {'1': 'disable_manifest', '3': 6, '4': 1, '5': 8, '10': 'disableManifest'},
    {
      '1': 's3',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.livekit.S3Upload',
      '9': 0,
      '10': 's3'
    },
    {
      '1': 'gcp',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.livekit.GCPUpload',
      '9': 0,
      '10': 'gcp'
    },
    {
      '1': 'azure',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.livekit.AzureBlobUpload',
      '9': 0,
      '10': 'azure'
    },
    {
      '1': 'aliOSS',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.livekit.AliOSSUpload',
      '9': 0,
      '10': 'aliOSS'
    },
  ],
  '8': [
    {'1': 'output'},
  ],
};

/// Descriptor for `EncodedFileOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List encodedFileOutputDescriptor = $convert.base64Decode(
    'ChFFbmNvZGVkRmlsZU91dHB1dBI1CglmaWxlX3R5cGUYASABKA4yGC5saXZla2l0LkVuY29kZW'
    'RGaWxlVHlwZVIIZmlsZVR5cGUSGgoIZmlsZXBhdGgYAiABKAlSCGZpbGVwYXRoEikKEGRpc2Fi'
    'bGVfbWFuaWZlc3QYBiABKAhSD2Rpc2FibGVNYW5pZmVzdBIjCgJzMxgDIAEoCzIRLmxpdmVraX'
    'QuUzNVcGxvYWRIAFICczMSJgoDZ2NwGAQgASgLMhIubGl2ZWtpdC5HQ1BVcGxvYWRIAFIDZ2Nw'
    'EjAKBWF6dXJlGAUgASgLMhgubGl2ZWtpdC5BenVyZUJsb2JVcGxvYWRIAFIFYXp1cmUSLwoGYW'
    'xpT1NTGAcgASgLMhUubGl2ZWtpdC5BbGlPU1NVcGxvYWRIAFIGYWxpT1NTQggKBm91dHB1dA==');

@$core.Deprecated('Use segmentedFileOutputDescriptor instead')
const SegmentedFileOutput$json = {
  '1': 'SegmentedFileOutput',
  '2': [
    {
      '1': 'protocol',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.livekit.SegmentedFileProtocol',
      '10': 'protocol'
    },
    {'1': 'filename_prefix', '3': 2, '4': 1, '5': 9, '10': 'filenamePrefix'},
    {'1': 'playlist_name', '3': 3, '4': 1, '5': 9, '10': 'playlistName'},
    {
      '1': 'live_playlist_name',
      '3': 11,
      '4': 1,
      '5': 9,
      '10': 'livePlaylistName'
    },
    {'1': 'segment_duration', '3': 4, '4': 1, '5': 13, '10': 'segmentDuration'},
    {
      '1': 'filename_suffix',
      '3': 10,
      '4': 1,
      '5': 14,
      '6': '.livekit.SegmentedFileSuffix',
      '10': 'filenameSuffix'
    },
    {'1': 'disable_manifest', '3': 8, '4': 1, '5': 8, '10': 'disableManifest'},
    {
      '1': 's3',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.livekit.S3Upload',
      '9': 0,
      '10': 's3'
    },
    {
      '1': 'gcp',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.livekit.GCPUpload',
      '9': 0,
      '10': 'gcp'
    },
    {
      '1': 'azure',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.livekit.AzureBlobUpload',
      '9': 0,
      '10': 'azure'
    },
    {
      '1': 'aliOSS',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.livekit.AliOSSUpload',
      '9': 0,
      '10': 'aliOSS'
    },
  ],
  '8': [
    {'1': 'output'},
  ],
};

/// Descriptor for `SegmentedFileOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List segmentedFileOutputDescriptor = $convert.base64Decode(
    'ChNTZWdtZW50ZWRGaWxlT3V0cHV0EjoKCHByb3RvY29sGAEgASgOMh4ubGl2ZWtpdC5TZWdtZW'
    '50ZWRGaWxlUHJvdG9jb2xSCHByb3RvY29sEicKD2ZpbGVuYW1lX3ByZWZpeBgCIAEoCVIOZmls'
    'ZW5hbWVQcmVmaXgSIwoNcGxheWxpc3RfbmFtZRgDIAEoCVIMcGxheWxpc3ROYW1lEiwKEmxpdm'
    'VfcGxheWxpc3RfbmFtZRgLIAEoCVIQbGl2ZVBsYXlsaXN0TmFtZRIpChBzZWdtZW50X2R1cmF0'
    'aW9uGAQgASgNUg9zZWdtZW50RHVyYXRpb24SRQoPZmlsZW5hbWVfc3VmZml4GAogASgOMhwubG'
    'l2ZWtpdC5TZWdtZW50ZWRGaWxlU3VmZml4Ug5maWxlbmFtZVN1ZmZpeBIpChBkaXNhYmxlX21h'
    'bmlmZXN0GAggASgIUg9kaXNhYmxlTWFuaWZlc3QSIwoCczMYBSABKAsyES5saXZla2l0LlMzVX'
    'Bsb2FkSABSAnMzEiYKA2djcBgGIAEoCzISLmxpdmVraXQuR0NQVXBsb2FkSABSA2djcBIwCgVh'
    'enVyZRgHIAEoCzIYLmxpdmVraXQuQXp1cmVCbG9iVXBsb2FkSABSBWF6dXJlEi8KBmFsaU9TUx'
    'gJIAEoCzIVLmxpdmVraXQuQWxpT1NTVXBsb2FkSABSBmFsaU9TU0IICgZvdXRwdXQ=');

@$core.Deprecated('Use directFileOutputDescriptor instead')
const DirectFileOutput$json = {
  '1': 'DirectFileOutput',
  '2': [
    {'1': 'filepath', '3': 1, '4': 1, '5': 9, '10': 'filepath'},
    {'1': 'disable_manifest', '3': 5, '4': 1, '5': 8, '10': 'disableManifest'},
    {
      '1': 's3',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.livekit.S3Upload',
      '9': 0,
      '10': 's3'
    },
    {
      '1': 'gcp',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.livekit.GCPUpload',
      '9': 0,
      '10': 'gcp'
    },
    {
      '1': 'azure',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.livekit.AzureBlobUpload',
      '9': 0,
      '10': 'azure'
    },
    {
      '1': 'aliOSS',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.livekit.AliOSSUpload',
      '9': 0,
      '10': 'aliOSS'
    },
  ],
  '8': [
    {'1': 'output'},
  ],
};

/// Descriptor for `DirectFileOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List directFileOutputDescriptor = $convert.base64Decode(
    'ChBEaXJlY3RGaWxlT3V0cHV0EhoKCGZpbGVwYXRoGAEgASgJUghmaWxlcGF0aBIpChBkaXNhYm'
    'xlX21hbmlmZXN0GAUgASgIUg9kaXNhYmxlTWFuaWZlc3QSIwoCczMYAiABKAsyES5saXZla2l0'
    'LlMzVXBsb2FkSABSAnMzEiYKA2djcBgDIAEoCzISLmxpdmVraXQuR0NQVXBsb2FkSABSA2djcB'
    'IwCgVhenVyZRgEIAEoCzIYLmxpdmVraXQuQXp1cmVCbG9iVXBsb2FkSABSBWF6dXJlEi8KBmFs'
    'aU9TUxgGIAEoCzIVLmxpdmVraXQuQWxpT1NTVXBsb2FkSABSBmFsaU9TU0IICgZvdXRwdXQ=');

@$core.Deprecated('Use imageOutputDescriptor instead')
const ImageOutput$json = {
  '1': 'ImageOutput',
  '2': [
    {'1': 'capture_interval', '3': 1, '4': 1, '5': 13, '10': 'captureInterval'},
    {'1': 'width', '3': 2, '4': 1, '5': 5, '10': 'width'},
    {'1': 'height', '3': 3, '4': 1, '5': 5, '10': 'height'},
    {'1': 'filename_prefix', '3': 4, '4': 1, '5': 9, '10': 'filenamePrefix'},
    {
      '1': 'filename_suffix',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.livekit.ImageFileSuffix',
      '10': 'filenameSuffix'
    },
    {
      '1': 'image_codec',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.livekit.ImageCodec',
      '10': 'imageCodec'
    },
    {'1': 'disable_manifest', '3': 7, '4': 1, '5': 8, '10': 'disableManifest'},
    {
      '1': 's3',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.livekit.S3Upload',
      '9': 0,
      '10': 's3'
    },
    {
      '1': 'gcp',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.livekit.GCPUpload',
      '9': 0,
      '10': 'gcp'
    },
    {
      '1': 'azure',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.livekit.AzureBlobUpload',
      '9': 0,
      '10': 'azure'
    },
    {
      '1': 'aliOSS',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.livekit.AliOSSUpload',
      '9': 0,
      '10': 'aliOSS'
    },
  ],
  '8': [
    {'1': 'output'},
  ],
};

/// Descriptor for `ImageOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageOutputDescriptor = $convert.base64Decode(
    'CgtJbWFnZU91dHB1dBIpChBjYXB0dXJlX2ludGVydmFsGAEgASgNUg9jYXB0dXJlSW50ZXJ2YW'
    'wSFAoFd2lkdGgYAiABKAVSBXdpZHRoEhYKBmhlaWdodBgDIAEoBVIGaGVpZ2h0EicKD2ZpbGVu'
    'YW1lX3ByZWZpeBgEIAEoCVIOZmlsZW5hbWVQcmVmaXgSQQoPZmlsZW5hbWVfc3VmZml4GAUgAS'
    'gOMhgubGl2ZWtpdC5JbWFnZUZpbGVTdWZmaXhSDmZpbGVuYW1lU3VmZml4EjQKC2ltYWdlX2Nv'
    'ZGVjGAYgASgOMhMubGl2ZWtpdC5JbWFnZUNvZGVjUgppbWFnZUNvZGVjEikKEGRpc2FibGVfbW'
    'FuaWZlc3QYByABKAhSD2Rpc2FibGVNYW5pZmVzdBIjCgJzMxgIIAEoCzIRLmxpdmVraXQuUzNV'
    'cGxvYWRIAFICczMSJgoDZ2NwGAkgASgLMhIubGl2ZWtpdC5HQ1BVcGxvYWRIAFIDZ2NwEjAKBW'
    'F6dXJlGAogASgLMhgubGl2ZWtpdC5BenVyZUJsb2JVcGxvYWRIAFIFYXp1cmUSLwoGYWxpT1NT'
    'GAsgASgLMhUubGl2ZWtpdC5BbGlPU1NVcGxvYWRIAFIGYWxpT1NTQggKBm91dHB1dA==');

@$core.Deprecated('Use s3UploadDescriptor instead')
const S3Upload$json = {
  '1': 'S3Upload',
  '2': [
    {'1': 'access_key', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'accessKey'},
    {'1': 'secret', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'secret'},
    {
      '1': 'session_token',
      '3': 11,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'sessionToken'
    },
    {
      '1': 'assume_role_arn',
      '3': 12,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'assumeRoleArn'
    },
    {
      '1': 'assume_role_external_id',
      '3': 13,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'assumeRoleExternalId'
    },
    {'1': 'region', '3': 3, '4': 1, '5': 9, '10': 'region'},
    {'1': 'endpoint', '3': 4, '4': 1, '5': 9, '10': 'endpoint'},
    {'1': 'bucket', '3': 5, '4': 1, '5': 9, '10': 'bucket'},
    {'1': 'force_path_style', '3': 6, '4': 1, '5': 8, '10': 'forcePathStyle'},
    {
      '1': 'metadata',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.livekit.S3Upload.MetadataEntry',
      '10': 'metadata'
    },
    {'1': 'tagging', '3': 8, '4': 1, '5': 9, '10': 'tagging'},
    {
      '1': 'content_disposition',
      '3': 9,
      '4': 1,
      '5': 9,
      '10': 'contentDisposition'
    },
    {
      '1': 'proxy',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.livekit.ProxyConfig',
      '10': 'proxy'
    },
  ],
  '3': [S3Upload_MetadataEntry$json],
};

@$core.Deprecated('Use s3UploadDescriptor instead')
const S3Upload_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `S3Upload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s3UploadDescriptor = $convert.base64Decode(
    'CghTM1VwbG9hZBIjCgphY2Nlc3Nfa2V5GAEgASgJQgSItRgBUglhY2Nlc3NLZXkSHAoGc2Vjcm'
    'V0GAIgASgJQgSItRgBUgZzZWNyZXQSKQoNc2Vzc2lvbl90b2tlbhgLIAEoCUIEiLUYAVIMc2Vz'
    'c2lvblRva2VuEiwKD2Fzc3VtZV9yb2xlX2FybhgMIAEoCUIEiLUYAVINYXNzdW1lUm9sZUFybh'
    'I7Chdhc3N1bWVfcm9sZV9leHRlcm5hbF9pZBgNIAEoCUIEiLUYAVIUYXNzdW1lUm9sZUV4dGVy'
    'bmFsSWQSFgoGcmVnaW9uGAMgASgJUgZyZWdpb24SGgoIZW5kcG9pbnQYBCABKAlSCGVuZHBvaW'
    '50EhYKBmJ1Y2tldBgFIAEoCVIGYnVja2V0EigKEGZvcmNlX3BhdGhfc3R5bGUYBiABKAhSDmZv'
    'cmNlUGF0aFN0eWxlEjsKCG1ldGFkYXRhGAcgAygLMh8ubGl2ZWtpdC5TM1VwbG9hZC5NZXRhZG'
    'F0YUVudHJ5UghtZXRhZGF0YRIYCgd0YWdnaW5nGAggASgJUgd0YWdnaW5nEi8KE2NvbnRlbnRf'
    'ZGlzcG9zaXRpb24YCSABKAlSEmNvbnRlbnREaXNwb3NpdGlvbhIqCgVwcm94eRgKIAEoCzIULm'
    'xpdmVraXQuUHJveHlDb25maWdSBXByb3h5GjsKDU1ldGFkYXRhRW50cnkSEAoDa2V5GAEgASgJ'
    'UgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use gCPUploadDescriptor instead')
const GCPUpload$json = {
  '1': 'GCPUpload',
  '2': [
    {'1': 'credentials', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'credentials'},
    {'1': 'bucket', '3': 2, '4': 1, '5': 9, '10': 'bucket'},
    {
      '1': 'proxy',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.livekit.ProxyConfig',
      '10': 'proxy'
    },
  ],
};

/// Descriptor for `GCPUpload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gCPUploadDescriptor = $convert.base64Decode(
    'CglHQ1BVcGxvYWQSJgoLY3JlZGVudGlhbHMYASABKAlCBIi1GAFSC2NyZWRlbnRpYWxzEhYKBm'
    'J1Y2tldBgCIAEoCVIGYnVja2V0EioKBXByb3h5GAMgASgLMhQubGl2ZWtpdC5Qcm94eUNvbmZp'
    'Z1IFcHJveHk=');

@$core.Deprecated('Use azureBlobUploadDescriptor instead')
const AzureBlobUpload$json = {
  '1': 'AzureBlobUpload',
  '2': [
    {'1': 'account_name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'accountName'},
    {'1': 'account_key', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'accountKey'},
    {'1': 'container_name', '3': 3, '4': 1, '5': 9, '10': 'containerName'},
  ],
};

/// Descriptor for `AzureBlobUpload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List azureBlobUploadDescriptor = $convert.base64Decode(
    'Cg9BenVyZUJsb2JVcGxvYWQSJwoMYWNjb3VudF9uYW1lGAEgASgJQgSItRgBUgthY2NvdW50Tm'
    'FtZRIlCgthY2NvdW50X2tleRgCIAEoCUIEiLUYAVIKYWNjb3VudEtleRIlCg5jb250YWluZXJf'
    'bmFtZRgDIAEoCVINY29udGFpbmVyTmFtZQ==');

@$core.Deprecated('Use aliOSSUploadDescriptor instead')
const AliOSSUpload$json = {
  '1': 'AliOSSUpload',
  '2': [
    {'1': 'access_key', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'accessKey'},
    {'1': 'secret', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'secret'},
    {'1': 'region', '3': 3, '4': 1, '5': 9, '10': 'region'},
    {'1': 'endpoint', '3': 4, '4': 1, '5': 9, '10': 'endpoint'},
    {'1': 'bucket', '3': 5, '4': 1, '5': 9, '10': 'bucket'},
  ],
};

/// Descriptor for `AliOSSUpload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aliOSSUploadDescriptor = $convert.base64Decode(
    'CgxBbGlPU1NVcGxvYWQSIwoKYWNjZXNzX2tleRgBIAEoCUIEiLUYAVIJYWNjZXNzS2V5EhwKBn'
    'NlY3JldBgCIAEoCUIEiLUYAVIGc2VjcmV0EhYKBnJlZ2lvbhgDIAEoCVIGcmVnaW9uEhoKCGVu'
    'ZHBvaW50GAQgASgJUghlbmRwb2ludBIWCgZidWNrZXQYBSABKAlSBmJ1Y2tldA==');

@$core.Deprecated('Use proxyConfigDescriptor instead')
const ProxyConfig$json = {
  '1': 'ProxyConfig',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `ProxyConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proxyConfigDescriptor = $convert.base64Decode(
    'CgtQcm94eUNvbmZpZxIQCgN1cmwYASABKAlSA3VybBIaCgh1c2VybmFtZRgCIAEoCVIIdXNlcm'
    '5hbWUSGgoIcGFzc3dvcmQYAyABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use streamOutputDescriptor instead')
const StreamOutput$json = {
  '1': 'StreamOutput',
  '2': [
    {
      '1': 'protocol',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.livekit.StreamProtocol',
      '10': 'protocol'
    },
    {'1': 'urls', '3': 2, '4': 3, '5': 9, '10': 'urls'},
  ],
};

/// Descriptor for `StreamOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamOutputDescriptor = $convert.base64Decode(
    'CgxTdHJlYW1PdXRwdXQSMwoIcHJvdG9jb2wYASABKA4yFy5saXZla2l0LlN0cmVhbVByb3RvY2'
    '9sUghwcm90b2NvbBISCgR1cmxzGAIgAygJUgR1cmxz');

@$core.Deprecated('Use encodingOptionsDescriptor instead')
const EncodingOptions$json = {
  '1': 'EncodingOptions',
  '2': [
    {'1': 'width', '3': 1, '4': 1, '5': 5, '10': 'width'},
    {'1': 'height', '3': 2, '4': 1, '5': 5, '10': 'height'},
    {'1': 'depth', '3': 3, '4': 1, '5': 5, '10': 'depth'},
    {'1': 'framerate', '3': 4, '4': 1, '5': 5, '10': 'framerate'},
    {
      '1': 'audio_codec',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.livekit.AudioCodec',
      '10': 'audioCodec'
    },
    {'1': 'audio_bitrate', '3': 6, '4': 1, '5': 5, '10': 'audioBitrate'},
    {'1': 'audio_quality', '3': 11, '4': 1, '5': 5, '10': 'audioQuality'},
    {'1': 'audio_frequency', '3': 7, '4': 1, '5': 5, '10': 'audioFrequency'},
    {
      '1': 'video_codec',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.livekit.VideoCodec',
      '10': 'videoCodec'
    },
    {'1': 'video_bitrate', '3': 9, '4': 1, '5': 5, '10': 'videoBitrate'},
    {'1': 'video_quality', '3': 12, '4': 1, '5': 5, '10': 'videoQuality'},
    {
      '1': 'key_frame_interval',
      '3': 10,
      '4': 1,
      '5': 1,
      '10': 'keyFrameInterval'
    },
  ],
};

/// Descriptor for `EncodingOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List encodingOptionsDescriptor = $convert.base64Decode(
    'Cg9FbmNvZGluZ09wdGlvbnMSFAoFd2lkdGgYASABKAVSBXdpZHRoEhYKBmhlaWdodBgCIAEoBV'
    'IGaGVpZ2h0EhQKBWRlcHRoGAMgASgFUgVkZXB0aBIcCglmcmFtZXJhdGUYBCABKAVSCWZyYW1l'
    'cmF0ZRI0CgthdWRpb19jb2RlYxgFIAEoDjITLmxpdmVraXQuQXVkaW9Db2RlY1IKYXVkaW9Db2'
    'RlYxIjCg1hdWRpb19iaXRyYXRlGAYgASgFUgxhdWRpb0JpdHJhdGUSIwoNYXVkaW9fcXVhbGl0'
    'eRgLIAEoBVIMYXVkaW9RdWFsaXR5EicKD2F1ZGlvX2ZyZXF1ZW5jeRgHIAEoBVIOYXVkaW9Gcm'
    'VxdWVuY3kSNAoLdmlkZW9fY29kZWMYCCABKA4yEy5saXZla2l0LlZpZGVvQ29kZWNSCnZpZGVv'
    'Q29kZWMSIwoNdmlkZW9fYml0cmF0ZRgJIAEoBVIMdmlkZW9CaXRyYXRlEiMKDXZpZGVvX3F1YW'
    'xpdHkYDCABKAVSDHZpZGVvUXVhbGl0eRIsChJrZXlfZnJhbWVfaW50ZXJ2YWwYCiABKAFSEGtl'
    'eUZyYW1lSW50ZXJ2YWw=');

@$core.Deprecated('Use updateLayoutRequestDescriptor instead')
const UpdateLayoutRequest$json = {
  '1': 'UpdateLayoutRequest',
  '2': [
    {'1': 'egress_id', '3': 1, '4': 1, '5': 9, '10': 'egressId'},
    {'1': 'layout', '3': 2, '4': 1, '5': 9, '10': 'layout'},
  ],
};

/// Descriptor for `UpdateLayoutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLayoutRequestDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVMYXlvdXRSZXF1ZXN0EhsKCWVncmVzc19pZBgBIAEoCVIIZWdyZXNzSWQSFgoGbG'
    'F5b3V0GAIgASgJUgZsYXlvdXQ=');

@$core.Deprecated('Use updateStreamRequestDescriptor instead')
const UpdateStreamRequest$json = {
  '1': 'UpdateStreamRequest',
  '2': [
    {'1': 'egress_id', '3': 1, '4': 1, '5': 9, '10': 'egressId'},
    {'1': 'add_output_urls', '3': 2, '4': 3, '5': 9, '10': 'addOutputUrls'},
    {
      '1': 'remove_output_urls',
      '3': 3,
      '4': 3,
      '5': 9,
      '10': 'removeOutputUrls'
    },
  ],
};

/// Descriptor for `UpdateStreamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStreamRequestDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVTdHJlYW1SZXF1ZXN0EhsKCWVncmVzc19pZBgBIAEoCVIIZWdyZXNzSWQSJgoPYW'
    'RkX291dHB1dF91cmxzGAIgAygJUg1hZGRPdXRwdXRVcmxzEiwKEnJlbW92ZV9vdXRwdXRfdXJs'
    'cxgDIAMoCVIQcmVtb3ZlT3V0cHV0VXJscw==');

@$core.Deprecated('Use listEgressRequestDescriptor instead')
const ListEgressRequest$json = {
  '1': 'ListEgressRequest',
  '2': [
    {'1': 'room_name', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'egress_id', '3': 2, '4': 1, '5': 9, '10': 'egressId'},
    {'1': 'active', '3': 3, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `ListEgressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEgressRequestDescriptor = $convert.base64Decode(
    'ChFMaXN0RWdyZXNzUmVxdWVzdBIbCglyb29tX25hbWUYASABKAlSCHJvb21OYW1lEhsKCWVncm'
    'Vzc19pZBgCIAEoCVIIZWdyZXNzSWQSFgoGYWN0aXZlGAMgASgIUgZhY3RpdmU=');

@$core.Deprecated('Use listEgressResponseDescriptor instead')
const ListEgressResponse$json = {
  '1': 'ListEgressResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.livekit.EgressInfo',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListEgressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEgressResponseDescriptor = $convert.base64Decode(
    'ChJMaXN0RWdyZXNzUmVzcG9uc2USKQoFaXRlbXMYASADKAsyEy5saXZla2l0LkVncmVzc0luZm'
    '9SBWl0ZW1z');

@$core.Deprecated('Use stopEgressRequestDescriptor instead')
const StopEgressRequest$json = {
  '1': 'StopEgressRequest',
  '2': [
    {'1': 'egress_id', '3': 1, '4': 1, '5': 9, '10': 'egressId'},
  ],
};

/// Descriptor for `StopEgressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stopEgressRequestDescriptor = $convert.base64Decode(
    'ChFTdG9wRWdyZXNzUmVxdWVzdBIbCgllZ3Jlc3NfaWQYASABKAlSCGVncmVzc0lk');

@$core.Deprecated('Use egressInfoDescriptor instead')
const EgressInfo$json = {
  '1': 'EgressInfo',
  '2': [
    {'1': 'egress_id', '3': 1, '4': 1, '5': 9, '10': 'egressId'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_name', '3': 13, '4': 1, '5': 9, '10': 'roomName'},
    {
      '1': 'source_type',
      '3': 26,
      '4': 1,
      '5': 14,
      '6': '.livekit.EgressSourceType',
      '10': 'sourceType'
    },
    {
      '1': 'status',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.livekit.EgressStatus',
      '10': 'status'
    },
    {'1': 'started_at', '3': 10, '4': 1, '5': 3, '10': 'startedAt'},
    {'1': 'ended_at', '3': 11, '4': 1, '5': 3, '10': 'endedAt'},
    {'1': 'updated_at', '3': 18, '4': 1, '5': 3, '10': 'updatedAt'},
    {'1': 'details', '3': 21, '4': 1, '5': 9, '10': 'details'},
    {'1': 'error', '3': 9, '4': 1, '5': 9, '10': 'error'},
    {'1': 'error_code', '3': 22, '4': 1, '5': 5, '10': 'errorCode'},
    {
      '1': 'room_composite',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.livekit.RoomCompositeEgressRequest',
      '9': 0,
      '10': 'roomComposite'
    },
    {
      '1': 'web',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.livekit.WebEgressRequest',
      '9': 0,
      '10': 'web'
    },
    {
      '1': 'participant',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.livekit.ParticipantEgressRequest',
      '9': 0,
      '10': 'participant'
    },
    {
      '1': 'track_composite',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.livekit.TrackCompositeEgressRequest',
      '9': 0,
      '10': 'trackComposite'
    },
    {
      '1': 'track',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.livekit.TrackEgressRequest',
      '9': 0,
      '10': 'track'
    },
    {
      '1': 'stream',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.livekit.StreamInfoList',
      '8': {'3': true},
      '9': 1,
      '10': 'stream',
    },
    {
      '1': 'file',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.livekit.FileInfo',
      '8': {'3': true},
      '9': 1,
      '10': 'file',
    },
    {
      '1': 'segments',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.livekit.SegmentsInfo',
      '8': {'3': true},
      '9': 1,
      '10': 'segments',
    },
    {
      '1': 'stream_results',
      '3': 15,
      '4': 3,
      '5': 11,
      '6': '.livekit.StreamInfo',
      '10': 'streamResults'
    },
    {
      '1': 'file_results',
      '3': 16,
      '4': 3,
      '5': 11,
      '6': '.livekit.FileInfo',
      '10': 'fileResults'
    },
    {
      '1': 'segment_results',
      '3': 17,
      '4': 3,
      '5': 11,
      '6': '.livekit.SegmentsInfo',
      '10': 'segmentResults'
    },
    {
      '1': 'image_results',
      '3': 20,
      '4': 3,
      '5': 11,
      '6': '.livekit.ImagesInfo',
      '10': 'imageResults'
    },
    {
      '1': 'manifest_location',
      '3': 23,
      '4': 1,
      '5': 9,
      '10': 'manifestLocation'
    },
    {
      '1': 'backup_storage_used',
      '3': 25,
      '4': 1,
      '5': 8,
      '10': 'backupStorageUsed'
    },
  ],
  '8': [
    {'1': 'request'},
    {'1': 'result'},
  ],
};

/// Descriptor for `EgressInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List egressInfoDescriptor = $convert.base64Decode(
    'CgpFZ3Jlc3NJbmZvEhsKCWVncmVzc19pZBgBIAEoCVIIZWdyZXNzSWQSFwoHcm9vbV9pZBgCIA'
    'EoCVIGcm9vbUlkEhsKCXJvb21fbmFtZRgNIAEoCVIIcm9vbU5hbWUSOgoLc291cmNlX3R5cGUY'
    'GiABKA4yGS5saXZla2l0LkVncmVzc1NvdXJjZVR5cGVSCnNvdXJjZVR5cGUSLQoGc3RhdHVzGA'
    'MgASgOMhUubGl2ZWtpdC5FZ3Jlc3NTdGF0dXNSBnN0YXR1cxIdCgpzdGFydGVkX2F0GAogASgD'
    'UglzdGFydGVkQXQSGQoIZW5kZWRfYXQYCyABKANSB2VuZGVkQXQSHQoKdXBkYXRlZF9hdBgSIA'
    'EoA1IJdXBkYXRlZEF0EhgKB2RldGFpbHMYFSABKAlSB2RldGFpbHMSFAoFZXJyb3IYCSABKAlS'
    'BWVycm9yEh0KCmVycm9yX2NvZGUYFiABKAVSCWVycm9yQ29kZRJMCg5yb29tX2NvbXBvc2l0ZR'
    'gEIAEoCzIjLmxpdmVraXQuUm9vbUNvbXBvc2l0ZUVncmVzc1JlcXVlc3RIAFINcm9vbUNvbXBv'
    'c2l0ZRItCgN3ZWIYDiABKAsyGS5saXZla2l0LldlYkVncmVzc1JlcXVlc3RIAFIDd2ViEkUKC3'
    'BhcnRpY2lwYW50GBMgASgLMiEubGl2ZWtpdC5QYXJ0aWNpcGFudEVncmVzc1JlcXVlc3RIAFIL'
    'cGFydGljaXBhbnQSTwoPdHJhY2tfY29tcG9zaXRlGAUgASgLMiQubGl2ZWtpdC5UcmFja0NvbX'
    'Bvc2l0ZUVncmVzc1JlcXVlc3RIAFIOdHJhY2tDb21wb3NpdGUSMwoFdHJhY2sYBiABKAsyGy5s'
    'aXZla2l0LlRyYWNrRWdyZXNzUmVxdWVzdEgAUgV0cmFjaxI1CgZzdHJlYW0YByABKAsyFy5saX'
    'Zla2l0LlN0cmVhbUluZm9MaXN0QgIYAUgBUgZzdHJlYW0SKwoEZmlsZRgIIAEoCzIRLmxpdmVr'
    'aXQuRmlsZUluZm9CAhgBSAFSBGZpbGUSNwoIc2VnbWVudHMYDCABKAsyFS5saXZla2l0LlNlZ2'
    '1lbnRzSW5mb0ICGAFIAVIIc2VnbWVudHMSOgoOc3RyZWFtX3Jlc3VsdHMYDyADKAsyEy5saXZl'
    'a2l0LlN0cmVhbUluZm9SDXN0cmVhbVJlc3VsdHMSNAoMZmlsZV9yZXN1bHRzGBAgAygLMhEubG'
    'l2ZWtpdC5GaWxlSW5mb1ILZmlsZVJlc3VsdHMSPgoPc2VnbWVudF9yZXN1bHRzGBEgAygLMhUu'
    'bGl2ZWtpdC5TZWdtZW50c0luZm9SDnNlZ21lbnRSZXN1bHRzEjgKDWltYWdlX3Jlc3VsdHMYFC'
    'ADKAsyEy5saXZla2l0LkltYWdlc0luZm9SDGltYWdlUmVzdWx0cxIrChFtYW5pZmVzdF9sb2Nh'
    'dGlvbhgXIAEoCVIQbWFuaWZlc3RMb2NhdGlvbhIuChNiYWNrdXBfc3RvcmFnZV91c2VkGBkgAS'
    'gIUhFiYWNrdXBTdG9yYWdlVXNlZEIJCgdyZXF1ZXN0QggKBnJlc3VsdA==');

@$core.Deprecated('Use streamInfoListDescriptor instead')
const StreamInfoList$json = {
  '1': 'StreamInfoList',
  '2': [
    {
      '1': 'info',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.livekit.StreamInfo',
      '10': 'info'
    },
  ],
  '7': {'3': true},
};

/// Descriptor for `StreamInfoList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamInfoListDescriptor = $convert.base64Decode(
    'Cg5TdHJlYW1JbmZvTGlzdBInCgRpbmZvGAEgAygLMhMubGl2ZWtpdC5TdHJlYW1JbmZvUgRpbm'
    'ZvOgIYAQ==');

@$core.Deprecated('Use streamInfoDescriptor instead')
const StreamInfo$json = {
  '1': 'StreamInfo',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'started_at', '3': 2, '4': 1, '5': 3, '10': 'startedAt'},
    {'1': 'ended_at', '3': 3, '4': 1, '5': 3, '10': 'endedAt'},
    {'1': 'duration', '3': 4, '4': 1, '5': 3, '10': 'duration'},
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.livekit.StreamInfo.Status',
      '10': 'status'
    },
    {'1': 'error', '3': 6, '4': 1, '5': 9, '10': 'error'},
    {'1': 'last_retry_at', '3': 7, '4': 1, '5': 3, '10': 'lastRetryAt'},
    {'1': 'retries', '3': 8, '4': 1, '5': 13, '10': 'retries'},
  ],
  '4': [StreamInfo_Status$json],
};

@$core.Deprecated('Use streamInfoDescriptor instead')
const StreamInfo_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'ACTIVE', '2': 0},
    {'1': 'FINISHED', '2': 1},
    {'1': 'FAILED', '2': 2},
  ],
};

/// Descriptor for `StreamInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamInfoDescriptor = $convert.base64Decode(
    'CgpTdHJlYW1JbmZvEhAKA3VybBgBIAEoCVIDdXJsEh0KCnN0YXJ0ZWRfYXQYAiABKANSCXN0YX'
    'J0ZWRBdBIZCghlbmRlZF9hdBgDIAEoA1IHZW5kZWRBdBIaCghkdXJhdGlvbhgEIAEoA1IIZHVy'
    'YXRpb24SMgoGc3RhdHVzGAUgASgOMhoubGl2ZWtpdC5TdHJlYW1JbmZvLlN0YXR1c1IGc3RhdH'
    'VzEhQKBWVycm9yGAYgASgJUgVlcnJvchIiCg1sYXN0X3JldHJ5X2F0GAcgASgDUgtsYXN0UmV0'
    'cnlBdBIYCgdyZXRyaWVzGAggASgNUgdyZXRyaWVzIi4KBlN0YXR1cxIKCgZBQ1RJVkUQABIMCg'
    'hGSU5JU0hFRBABEgoKBkZBSUxFRBAC');

@$core.Deprecated('Use fileInfoDescriptor instead')
const FileInfo$json = {
  '1': 'FileInfo',
  '2': [
    {'1': 'filename', '3': 1, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'started_at', '3': 2, '4': 1, '5': 3, '10': 'startedAt'},
    {'1': 'ended_at', '3': 3, '4': 1, '5': 3, '10': 'endedAt'},
    {'1': 'duration', '3': 6, '4': 1, '5': 3, '10': 'duration'},
    {'1': 'size', '3': 4, '4': 1, '5': 3, '10': 'size'},
    {'1': 'location', '3': 5, '4': 1, '5': 9, '10': 'location'},
  ],
};

/// Descriptor for `FileInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileInfoDescriptor = $convert.base64Decode(
    'CghGaWxlSW5mbxIaCghmaWxlbmFtZRgBIAEoCVIIZmlsZW5hbWUSHQoKc3RhcnRlZF9hdBgCIA'
    'EoA1IJc3RhcnRlZEF0EhkKCGVuZGVkX2F0GAMgASgDUgdlbmRlZEF0EhoKCGR1cmF0aW9uGAYg'
    'ASgDUghkdXJhdGlvbhISCgRzaXplGAQgASgDUgRzaXplEhoKCGxvY2F0aW9uGAUgASgJUghsb2'
    'NhdGlvbg==');

@$core.Deprecated('Use segmentsInfoDescriptor instead')
const SegmentsInfo$json = {
  '1': 'SegmentsInfo',
  '2': [
    {'1': 'playlist_name', '3': 1, '4': 1, '5': 9, '10': 'playlistName'},
    {
      '1': 'live_playlist_name',
      '3': 8,
      '4': 1,
      '5': 9,
      '10': 'livePlaylistName'
    },
    {'1': 'duration', '3': 2, '4': 1, '5': 3, '10': 'duration'},
    {'1': 'size', '3': 3, '4': 1, '5': 3, '10': 'size'},
    {
      '1': 'playlist_location',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'playlistLocation'
    },
    {
      '1': 'live_playlist_location',
      '3': 9,
      '4': 1,
      '5': 9,
      '10': 'livePlaylistLocation'
    },
    {'1': 'segment_count', '3': 5, '4': 1, '5': 3, '10': 'segmentCount'},
    {'1': 'started_at', '3': 6, '4': 1, '5': 3, '10': 'startedAt'},
    {'1': 'ended_at', '3': 7, '4': 1, '5': 3, '10': 'endedAt'},
  ],
};

/// Descriptor for `SegmentsInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List segmentsInfoDescriptor = $convert.base64Decode(
    'CgxTZWdtZW50c0luZm8SIwoNcGxheWxpc3RfbmFtZRgBIAEoCVIMcGxheWxpc3ROYW1lEiwKEm'
    'xpdmVfcGxheWxpc3RfbmFtZRgIIAEoCVIQbGl2ZVBsYXlsaXN0TmFtZRIaCghkdXJhdGlvbhgC'
    'IAEoA1IIZHVyYXRpb24SEgoEc2l6ZRgDIAEoA1IEc2l6ZRIrChFwbGF5bGlzdF9sb2NhdGlvbh'
    'gEIAEoCVIQcGxheWxpc3RMb2NhdGlvbhI0ChZsaXZlX3BsYXlsaXN0X2xvY2F0aW9uGAkgASgJ'
    'UhRsaXZlUGxheWxpc3RMb2NhdGlvbhIjCg1zZWdtZW50X2NvdW50GAUgASgDUgxzZWdtZW50Q2'
    '91bnQSHQoKc3RhcnRlZF9hdBgGIAEoA1IJc3RhcnRlZEF0EhkKCGVuZGVkX2F0GAcgASgDUgdl'
    'bmRlZEF0');

@$core.Deprecated('Use imagesInfoDescriptor instead')
const ImagesInfo$json = {
  '1': 'ImagesInfo',
  '2': [
    {'1': 'filename_prefix', '3': 4, '4': 1, '5': 9, '10': 'filenamePrefix'},
    {'1': 'image_count', '3': 1, '4': 1, '5': 3, '10': 'imageCount'},
    {'1': 'started_at', '3': 2, '4': 1, '5': 3, '10': 'startedAt'},
    {'1': 'ended_at', '3': 3, '4': 1, '5': 3, '10': 'endedAt'},
  ],
};

/// Descriptor for `ImagesInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imagesInfoDescriptor = $convert.base64Decode(
    'CgpJbWFnZXNJbmZvEicKD2ZpbGVuYW1lX3ByZWZpeBgEIAEoCVIOZmlsZW5hbWVQcmVmaXgSHw'
    'oLaW1hZ2VfY291bnQYASABKANSCmltYWdlQ291bnQSHQoKc3RhcnRlZF9hdBgCIAEoA1IJc3Rh'
    'cnRlZEF0EhkKCGVuZGVkX2F0GAMgASgDUgdlbmRlZEF0');

@$core.Deprecated('Use autoParticipantEgressDescriptor instead')
const AutoParticipantEgress$json = {
  '1': 'AutoParticipantEgress',
  '2': [
    {
      '1': 'preset',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.livekit.EncodingOptionsPreset',
      '9': 0,
      '10': 'preset'
    },
    {
      '1': 'advanced',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.livekit.EncodingOptions',
      '9': 0,
      '10': 'advanced'
    },
    {
      '1': 'file_outputs',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.livekit.EncodedFileOutput',
      '10': 'fileOutputs'
    },
    {
      '1': 'segment_outputs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.livekit.SegmentedFileOutput',
      '10': 'segmentOutputs'
    },
  ],
  '8': [
    {'1': 'options'},
  ],
};

/// Descriptor for `AutoParticipantEgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoParticipantEgressDescriptor = $convert.base64Decode(
    'ChVBdXRvUGFydGljaXBhbnRFZ3Jlc3MSOAoGcHJlc2V0GAEgASgOMh4ubGl2ZWtpdC5FbmNvZG'
    'luZ09wdGlvbnNQcmVzZXRIAFIGcHJlc2V0EjYKCGFkdmFuY2VkGAIgASgLMhgubGl2ZWtpdC5F'
    'bmNvZGluZ09wdGlvbnNIAFIIYWR2YW5jZWQSPQoMZmlsZV9vdXRwdXRzGAMgAygLMhoubGl2ZW'
    'tpdC5FbmNvZGVkRmlsZU91dHB1dFILZmlsZU91dHB1dHMSRQoPc2VnbWVudF9vdXRwdXRzGAQg'
    'AygLMhwubGl2ZWtpdC5TZWdtZW50ZWRGaWxlT3V0cHV0Ug5zZWdtZW50T3V0cHV0c0IJCgdvcH'
    'Rpb25z');

@$core.Deprecated('Use autoTrackEgressDescriptor instead')
const AutoTrackEgress$json = {
  '1': 'AutoTrackEgress',
  '2': [
    {'1': 'filepath', '3': 1, '4': 1, '5': 9, '10': 'filepath'},
    {'1': 'disable_manifest', '3': 5, '4': 1, '5': 8, '10': 'disableManifest'},
    {
      '1': 's3',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.livekit.S3Upload',
      '9': 0,
      '10': 's3'
    },
    {
      '1': 'gcp',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.livekit.GCPUpload',
      '9': 0,
      '10': 'gcp'
    },
    {
      '1': 'azure',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.livekit.AzureBlobUpload',
      '9': 0,
      '10': 'azure'
    },
    {
      '1': 'aliOSS',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.livekit.AliOSSUpload',
      '9': 0,
      '10': 'aliOSS'
    },
  ],
  '8': [
    {'1': 'output'},
  ],
};

/// Descriptor for `AutoTrackEgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoTrackEgressDescriptor = $convert.base64Decode(
    'Cg9BdXRvVHJhY2tFZ3Jlc3MSGgoIZmlsZXBhdGgYASABKAlSCGZpbGVwYXRoEikKEGRpc2FibG'
    'VfbWFuaWZlc3QYBSABKAhSD2Rpc2FibGVNYW5pZmVzdBIjCgJzMxgCIAEoCzIRLmxpdmVraXQu'
    'UzNVcGxvYWRIAFICczMSJgoDZ2NwGAMgASgLMhIubGl2ZWtpdC5HQ1BVcGxvYWRIAFIDZ2NwEj'
    'AKBWF6dXJlGAQgASgLMhgubGl2ZWtpdC5BenVyZUJsb2JVcGxvYWRIAFIFYXp1cmUSLwoGYWxp'
    'T1NTGAYgASgLMhUubGl2ZWtpdC5BbGlPU1NVcGxvYWRIAFIGYWxpT1NTQggKBm91dHB1dA==');

const $core.Map<$core.String, $core.dynamic> EgressServiceBase$json = {
  '1': 'Egress',
  '2': [
    {
      '1': 'StartRoomCompositeEgress',
      '2': '.livekit.RoomCompositeEgressRequest',
      '3': '.livekit.EgressInfo'
    },
    {
      '1': 'StartWebEgress',
      '2': '.livekit.WebEgressRequest',
      '3': '.livekit.EgressInfo'
    },
    {
      '1': 'StartParticipantEgress',
      '2': '.livekit.ParticipantEgressRequest',
      '3': '.livekit.EgressInfo'
    },
    {
      '1': 'StartTrackCompositeEgress',
      '2': '.livekit.TrackCompositeEgressRequest',
      '3': '.livekit.EgressInfo'
    },
    {
      '1': 'StartTrackEgress',
      '2': '.livekit.TrackEgressRequest',
      '3': '.livekit.EgressInfo'
    },
    {
      '1': 'UpdateLayout',
      '2': '.livekit.UpdateLayoutRequest',
      '3': '.livekit.EgressInfo'
    },
    {
      '1': 'UpdateStream',
      '2': '.livekit.UpdateStreamRequest',
      '3': '.livekit.EgressInfo'
    },
    {
      '1': 'ListEgress',
      '2': '.livekit.ListEgressRequest',
      '3': '.livekit.ListEgressResponse'
    },
    {
      '1': 'StopEgress',
      '2': '.livekit.StopEgressRequest',
      '3': '.livekit.EgressInfo'
    },
  ],
};

@$core.Deprecated('Use egressServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    EgressServiceBase$messageJson = {
  '.livekit.RoomCompositeEgressRequest': RoomCompositeEgressRequest$json,
  '.livekit.EncodedFileOutput': EncodedFileOutput$json,
  '.livekit.S3Upload': S3Upload$json,
  '.livekit.S3Upload.MetadataEntry': S3Upload_MetadataEntry$json,
  '.livekit.ProxyConfig': ProxyConfig$json,
  '.livekit.GCPUpload': GCPUpload$json,
  '.livekit.AzureBlobUpload': AzureBlobUpload$json,
  '.livekit.AliOSSUpload': AliOSSUpload$json,
  '.livekit.StreamOutput': StreamOutput$json,
  '.livekit.EncodingOptions': EncodingOptions$json,
  '.livekit.SegmentedFileOutput': SegmentedFileOutput$json,
  '.livekit.ImageOutput': ImageOutput$json,
  '.livekit.WebhookConfig': $0.WebhookConfig$json,
  '.livekit.FilterParams': $0.FilterParams$json,
  '.livekit.EgressInfo': EgressInfo$json,
  '.livekit.TrackCompositeEgressRequest': TrackCompositeEgressRequest$json,
  '.livekit.TrackEgressRequest': TrackEgressRequest$json,
  '.livekit.DirectFileOutput': DirectFileOutput$json,
  '.livekit.StreamInfoList': StreamInfoList$json,
  '.livekit.StreamInfo': StreamInfo$json,
  '.livekit.FileInfo': FileInfo$json,
  '.livekit.SegmentsInfo': SegmentsInfo$json,
  '.livekit.WebEgressRequest': WebEgressRequest$json,
  '.livekit.ParticipantEgressRequest': ParticipantEgressRequest$json,
  '.livekit.ImagesInfo': ImagesInfo$json,
  '.livekit.UpdateLayoutRequest': UpdateLayoutRequest$json,
  '.livekit.UpdateStreamRequest': UpdateStreamRequest$json,
  '.livekit.ListEgressRequest': ListEgressRequest$json,
  '.livekit.ListEgressResponse': ListEgressResponse$json,
  '.livekit.StopEgressRequest': StopEgressRequest$json,
};

/// Descriptor for `Egress`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List egressServiceDescriptor = $convert.base64Decode(
    'CgZFZ3Jlc3MSVAoYU3RhcnRSb29tQ29tcG9zaXRlRWdyZXNzEiMubGl2ZWtpdC5Sb29tQ29tcG'
    '9zaXRlRWdyZXNzUmVxdWVzdBoTLmxpdmVraXQuRWdyZXNzSW5mbxJACg5TdGFydFdlYkVncmVz'
    'cxIZLmxpdmVraXQuV2ViRWdyZXNzUmVxdWVzdBoTLmxpdmVraXQuRWdyZXNzSW5mbxJQChZTdG'
    'FydFBhcnRpY2lwYW50RWdyZXNzEiEubGl2ZWtpdC5QYXJ0aWNpcGFudEVncmVzc1JlcXVlc3Qa'
    'Ey5saXZla2l0LkVncmVzc0luZm8SVgoZU3RhcnRUcmFja0NvbXBvc2l0ZUVncmVzcxIkLmxpdm'
    'VraXQuVHJhY2tDb21wb3NpdGVFZ3Jlc3NSZXF1ZXN0GhMubGl2ZWtpdC5FZ3Jlc3NJbmZvEkQK'
    'EFN0YXJ0VHJhY2tFZ3Jlc3MSGy5saXZla2l0LlRyYWNrRWdyZXNzUmVxdWVzdBoTLmxpdmVraX'
    'QuRWdyZXNzSW5mbxJBCgxVcGRhdGVMYXlvdXQSHC5saXZla2l0LlVwZGF0ZUxheW91dFJlcXVl'
    'c3QaEy5saXZla2l0LkVncmVzc0luZm8SQQoMVXBkYXRlU3RyZWFtEhwubGl2ZWtpdC5VcGRhdG'
    'VTdHJlYW1SZXF1ZXN0GhMubGl2ZWtpdC5FZ3Jlc3NJbmZvEkUKCkxpc3RFZ3Jlc3MSGi5saXZl'
    'a2l0Lkxpc3RFZ3Jlc3NSZXF1ZXN0GhsubGl2ZWtpdC5MaXN0RWdyZXNzUmVzcG9uc2USPQoKU3'
    'RvcEVncmVzcxIaLmxpdmVraXQuU3RvcEVncmVzc1JlcXVlc3QaEy5saXZla2l0LkVncmVzc0lu'
    'Zm8=');
