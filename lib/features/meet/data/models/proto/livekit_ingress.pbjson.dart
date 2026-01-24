//
//  Generated code. Do not modify.
//  source: livekit_ingress.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'livekit_models.pbjson.dart' as $2;

@$core.Deprecated('Use ingressInputDescriptor instead')
const IngressInput$json = {
  '1': 'IngressInput',
  '2': [
    {'1': 'RTMP_INPUT', '2': 0},
    {'1': 'WHIP_INPUT', '2': 1},
    {'1': 'URL_INPUT', '2': 2},
  ],
};

/// Descriptor for `IngressInput`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List ingressInputDescriptor = $convert.base64Decode(
    'CgxJbmdyZXNzSW5wdXQSDgoKUlRNUF9JTlBVVBAAEg4KCldISVBfSU5QVVQQARINCglVUkxfSU'
    '5QVVQQAg==');

@$core.Deprecated('Use ingressAudioEncodingPresetDescriptor instead')
const IngressAudioEncodingPreset$json = {
  '1': 'IngressAudioEncodingPreset',
  '2': [
    {'1': 'OPUS_STEREO_96KBPS', '2': 0},
    {'1': 'OPUS_MONO_64KBS', '2': 1},
  ],
};

/// Descriptor for `IngressAudioEncodingPreset`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List ingressAudioEncodingPresetDescriptor = $convert.base64Decode(
    'ChpJbmdyZXNzQXVkaW9FbmNvZGluZ1ByZXNldBIWChJPUFVTX1NURVJFT185NktCUFMQABITCg'
    '9PUFVTX01PTk9fNjRLQlMQAQ==');

@$core.Deprecated('Use ingressVideoEncodingPresetDescriptor instead')
const IngressVideoEncodingPreset$json = {
  '1': 'IngressVideoEncodingPreset',
  '2': [
    {'1': 'H264_720P_30FPS_3_LAYERS', '2': 0},
    {'1': 'H264_1080P_30FPS_3_LAYERS', '2': 1},
    {'1': 'H264_540P_25FPS_2_LAYERS', '2': 2},
    {'1': 'H264_720P_30FPS_1_LAYER', '2': 3},
    {'1': 'H264_1080P_30FPS_1_LAYER', '2': 4},
    {'1': 'H264_720P_30FPS_3_LAYERS_HIGH_MOTION', '2': 5},
    {'1': 'H264_1080P_30FPS_3_LAYERS_HIGH_MOTION', '2': 6},
    {'1': 'H264_540P_25FPS_2_LAYERS_HIGH_MOTION', '2': 7},
    {'1': 'H264_720P_30FPS_1_LAYER_HIGH_MOTION', '2': 8},
    {'1': 'H264_1080P_30FPS_1_LAYER_HIGH_MOTION', '2': 9},
  ],
};

/// Descriptor for `IngressVideoEncodingPreset`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List ingressVideoEncodingPresetDescriptor = $convert.base64Decode(
    'ChpJbmdyZXNzVmlkZW9FbmNvZGluZ1ByZXNldBIcChhIMjY0XzcyMFBfMzBGUFNfM19MQVlFUl'
    'MQABIdChlIMjY0XzEwODBQXzMwRlBTXzNfTEFZRVJTEAESHAoYSDI2NF81NDBQXzI1RlBTXzJf'
    'TEFZRVJTEAISGwoXSDI2NF83MjBQXzMwRlBTXzFfTEFZRVIQAxIcChhIMjY0XzEwODBQXzMwRl'
    'BTXzFfTEFZRVIQBBIoCiRIMjY0XzcyMFBfMzBGUFNfM19MQVlFUlNfSElHSF9NT1RJT04QBRIp'
    'CiVIMjY0XzEwODBQXzMwRlBTXzNfTEFZRVJTX0hJR0hfTU9USU9OEAYSKAokSDI2NF81NDBQXz'
    'I1RlBTXzJfTEFZRVJTX0hJR0hfTU9USU9OEAcSJwojSDI2NF83MjBQXzMwRlBTXzFfTEFZRVJf'
    'SElHSF9NT1RJT04QCBIoCiRIMjY0XzEwODBQXzMwRlBTXzFfTEFZRVJfSElHSF9NT1RJT04QCQ'
    '==');

@$core.Deprecated('Use createIngressRequestDescriptor instead')
const CreateIngressRequest$json = {
  '1': 'CreateIngressRequest',
  '2': [
    {'1': 'input_type', '3': 1, '4': 1, '5': 14, '6': '.livekit.IngressInput', '10': 'inputType'},
    {'1': 'url', '3': 9, '4': 1, '5': 9, '10': 'url'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'room_name', '3': 3, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'participant_identity', '3': 4, '4': 1, '5': 9, '10': 'participantIdentity'},
    {'1': 'participant_name', '3': 5, '4': 1, '5': 9, '10': 'participantName'},
    {'1': 'participant_metadata', '3': 10, '4': 1, '5': 9, '10': 'participantMetadata'},
    {
      '1': 'bypass_transcoding',
      '3': 8,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'bypassTranscoding',
    },
    {'1': 'enable_transcoding', '3': 11, '4': 1, '5': 8, '9': 0, '10': 'enableTranscoding', '17': true},
    {'1': 'audio', '3': 6, '4': 1, '5': 11, '6': '.livekit.IngressAudioOptions', '10': 'audio'},
    {'1': 'video', '3': 7, '4': 1, '5': 11, '6': '.livekit.IngressVideoOptions', '10': 'video'},
    {'1': 'enabled', '3': 12, '4': 1, '5': 8, '9': 1, '10': 'enabled', '17': true},
  ],
  '8': [
    {'1': '_enable_transcoding'},
    {'1': '_enabled'},
  ],
};

/// Descriptor for `CreateIngressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createIngressRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVJbmdyZXNzUmVxdWVzdBI0CgppbnB1dF90eXBlGAEgASgOMhUubGl2ZWtpdC5Jbm'
    'dyZXNzSW5wdXRSCWlucHV0VHlwZRIQCgN1cmwYCSABKAlSA3VybBISCgRuYW1lGAIgASgJUgRu'
    'YW1lEhsKCXJvb21fbmFtZRgDIAEoCVIIcm9vbU5hbWUSMQoUcGFydGljaXBhbnRfaWRlbnRpdH'
    'kYBCABKAlSE3BhcnRpY2lwYW50SWRlbnRpdHkSKQoQcGFydGljaXBhbnRfbmFtZRgFIAEoCVIP'
    'cGFydGljaXBhbnROYW1lEjEKFHBhcnRpY2lwYW50X21ldGFkYXRhGAogASgJUhNwYXJ0aWNpcG'
    'FudE1ldGFkYXRhEjEKEmJ5cGFzc190cmFuc2NvZGluZxgIIAEoCEICGAFSEWJ5cGFzc1RyYW5z'
    'Y29kaW5nEjIKEmVuYWJsZV90cmFuc2NvZGluZxgLIAEoCEgAUhFlbmFibGVUcmFuc2NvZGluZ4'
    'gBARIyCgVhdWRpbxgGIAEoCzIcLmxpdmVraXQuSW5ncmVzc0F1ZGlvT3B0aW9uc1IFYXVkaW8S'
    'MgoFdmlkZW8YByABKAsyHC5saXZla2l0LkluZ3Jlc3NWaWRlb09wdGlvbnNSBXZpZGVvEh0KB2'
    'VuYWJsZWQYDCABKAhIAVIHZW5hYmxlZIgBAUIVChNfZW5hYmxlX3RyYW5zY29kaW5nQgoKCF9l'
    'bmFibGVk');

@$core.Deprecated('Use ingressAudioOptionsDescriptor instead')
const IngressAudioOptions$json = {
  '1': 'IngressAudioOptions',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'source', '3': 2, '4': 1, '5': 14, '6': '.livekit.TrackSource', '10': 'source'},
    {'1': 'preset', '3': 3, '4': 1, '5': 14, '6': '.livekit.IngressAudioEncodingPreset', '9': 0, '10': 'preset'},
    {'1': 'options', '3': 4, '4': 1, '5': 11, '6': '.livekit.IngressAudioEncodingOptions', '9': 0, '10': 'options'},
  ],
  '8': [
    {'1': 'encoding_options'},
  ],
};

/// Descriptor for `IngressAudioOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingressAudioOptionsDescriptor = $convert.base64Decode(
    'ChNJbmdyZXNzQXVkaW9PcHRpb25zEhIKBG5hbWUYASABKAlSBG5hbWUSLAoGc291cmNlGAIgAS'
    'gOMhQubGl2ZWtpdC5UcmFja1NvdXJjZVIGc291cmNlEj0KBnByZXNldBgDIAEoDjIjLmxpdmVr'
    'aXQuSW5ncmVzc0F1ZGlvRW5jb2RpbmdQcmVzZXRIAFIGcHJlc2V0EkAKB29wdGlvbnMYBCABKA'
    'syJC5saXZla2l0LkluZ3Jlc3NBdWRpb0VuY29kaW5nT3B0aW9uc0gAUgdvcHRpb25zQhIKEGVu'
    'Y29kaW5nX29wdGlvbnM=');

@$core.Deprecated('Use ingressVideoOptionsDescriptor instead')
const IngressVideoOptions$json = {
  '1': 'IngressVideoOptions',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'source', '3': 2, '4': 1, '5': 14, '6': '.livekit.TrackSource', '10': 'source'},
    {'1': 'preset', '3': 3, '4': 1, '5': 14, '6': '.livekit.IngressVideoEncodingPreset', '9': 0, '10': 'preset'},
    {'1': 'options', '3': 4, '4': 1, '5': 11, '6': '.livekit.IngressVideoEncodingOptions', '9': 0, '10': 'options'},
  ],
  '8': [
    {'1': 'encoding_options'},
  ],
};

/// Descriptor for `IngressVideoOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingressVideoOptionsDescriptor = $convert.base64Decode(
    'ChNJbmdyZXNzVmlkZW9PcHRpb25zEhIKBG5hbWUYASABKAlSBG5hbWUSLAoGc291cmNlGAIgAS'
    'gOMhQubGl2ZWtpdC5UcmFja1NvdXJjZVIGc291cmNlEj0KBnByZXNldBgDIAEoDjIjLmxpdmVr'
    'aXQuSW5ncmVzc1ZpZGVvRW5jb2RpbmdQcmVzZXRIAFIGcHJlc2V0EkAKB29wdGlvbnMYBCABKA'
    'syJC5saXZla2l0LkluZ3Jlc3NWaWRlb0VuY29kaW5nT3B0aW9uc0gAUgdvcHRpb25zQhIKEGVu'
    'Y29kaW5nX29wdGlvbnM=');

@$core.Deprecated('Use ingressAudioEncodingOptionsDescriptor instead')
const IngressAudioEncodingOptions$json = {
  '1': 'IngressAudioEncodingOptions',
  '2': [
    {'1': 'audio_codec', '3': 1, '4': 1, '5': 14, '6': '.livekit.AudioCodec', '10': 'audioCodec'},
    {'1': 'bitrate', '3': 2, '4': 1, '5': 13, '10': 'bitrate'},
    {'1': 'disable_dtx', '3': 3, '4': 1, '5': 8, '10': 'disableDtx'},
    {'1': 'channels', '3': 4, '4': 1, '5': 13, '10': 'channels'},
  ],
};

/// Descriptor for `IngressAudioEncodingOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingressAudioEncodingOptionsDescriptor = $convert.base64Decode(
    'ChtJbmdyZXNzQXVkaW9FbmNvZGluZ09wdGlvbnMSNAoLYXVkaW9fY29kZWMYASABKA4yEy5saX'
    'Zla2l0LkF1ZGlvQ29kZWNSCmF1ZGlvQ29kZWMSGAoHYml0cmF0ZRgCIAEoDVIHYml0cmF0ZRIf'
    'CgtkaXNhYmxlX2R0eBgDIAEoCFIKZGlzYWJsZUR0eBIaCghjaGFubmVscxgEIAEoDVIIY2hhbm'
    '5lbHM=');

@$core.Deprecated('Use ingressVideoEncodingOptionsDescriptor instead')
const IngressVideoEncodingOptions$json = {
  '1': 'IngressVideoEncodingOptions',
  '2': [
    {'1': 'video_codec', '3': 1, '4': 1, '5': 14, '6': '.livekit.VideoCodec', '10': 'videoCodec'},
    {'1': 'frame_rate', '3': 2, '4': 1, '5': 1, '10': 'frameRate'},
    {'1': 'layers', '3': 3, '4': 3, '5': 11, '6': '.livekit.VideoLayer', '10': 'layers'},
  ],
};

/// Descriptor for `IngressVideoEncodingOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingressVideoEncodingOptionsDescriptor = $convert.base64Decode(
    'ChtJbmdyZXNzVmlkZW9FbmNvZGluZ09wdGlvbnMSNAoLdmlkZW9fY29kZWMYASABKA4yEy5saX'
    'Zla2l0LlZpZGVvQ29kZWNSCnZpZGVvQ29kZWMSHQoKZnJhbWVfcmF0ZRgCIAEoAVIJZnJhbWVS'
    'YXRlEisKBmxheWVycxgDIAMoCzITLmxpdmVraXQuVmlkZW9MYXllclIGbGF5ZXJz');

@$core.Deprecated('Use ingressInfoDescriptor instead')
const IngressInfo$json = {
  '1': 'IngressInfo',
  '2': [
    {'1': 'ingress_id', '3': 1, '4': 1, '5': 9, '10': 'ingressId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'stream_key', '3': 3, '4': 1, '5': 9, '10': 'streamKey'},
    {'1': 'url', '3': 4, '4': 1, '5': 9, '10': 'url'},
    {'1': 'input_type', '3': 5, '4': 1, '5': 14, '6': '.livekit.IngressInput', '10': 'inputType'},
    {
      '1': 'bypass_transcoding',
      '3': 13,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'bypassTranscoding',
    },
    {'1': 'enable_transcoding', '3': 15, '4': 1, '5': 8, '9': 0, '10': 'enableTranscoding', '17': true},
    {'1': 'audio', '3': 6, '4': 1, '5': 11, '6': '.livekit.IngressAudioOptions', '10': 'audio'},
    {'1': 'video', '3': 7, '4': 1, '5': 11, '6': '.livekit.IngressVideoOptions', '10': 'video'},
    {'1': 'room_name', '3': 8, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'participant_identity', '3': 9, '4': 1, '5': 9, '10': 'participantIdentity'},
    {'1': 'participant_name', '3': 10, '4': 1, '5': 9, '10': 'participantName'},
    {'1': 'participant_metadata', '3': 14, '4': 1, '5': 9, '10': 'participantMetadata'},
    {'1': 'reusable', '3': 11, '4': 1, '5': 8, '10': 'reusable'},
    {'1': 'state', '3': 12, '4': 1, '5': 11, '6': '.livekit.IngressState', '10': 'state'},
    {'1': 'enabled', '3': 16, '4': 1, '5': 8, '9': 1, '10': 'enabled', '17': true},
  ],
  '8': [
    {'1': '_enable_transcoding'},
    {'1': '_enabled'},
  ],
};

/// Descriptor for `IngressInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingressInfoDescriptor = $convert.base64Decode(
    'CgtJbmdyZXNzSW5mbxIdCgppbmdyZXNzX2lkGAEgASgJUglpbmdyZXNzSWQSEgoEbmFtZRgCIA'
    'EoCVIEbmFtZRIdCgpzdHJlYW1fa2V5GAMgASgJUglzdHJlYW1LZXkSEAoDdXJsGAQgASgJUgN1'
    'cmwSNAoKaW5wdXRfdHlwZRgFIAEoDjIVLmxpdmVraXQuSW5ncmVzc0lucHV0UglpbnB1dFR5cG'
    'USMQoSYnlwYXNzX3RyYW5zY29kaW5nGA0gASgIQgIYAVIRYnlwYXNzVHJhbnNjb2RpbmcSMgoS'
    'ZW5hYmxlX3RyYW5zY29kaW5nGA8gASgISABSEWVuYWJsZVRyYW5zY29kaW5niAEBEjIKBWF1ZG'
    'lvGAYgASgLMhwubGl2ZWtpdC5JbmdyZXNzQXVkaW9PcHRpb25zUgVhdWRpbxIyCgV2aWRlbxgH'
    'IAEoCzIcLmxpdmVraXQuSW5ncmVzc1ZpZGVvT3B0aW9uc1IFdmlkZW8SGwoJcm9vbV9uYW1lGA'
    'ggASgJUghyb29tTmFtZRIxChRwYXJ0aWNpcGFudF9pZGVudGl0eRgJIAEoCVITcGFydGljaXBh'
    'bnRJZGVudGl0eRIpChBwYXJ0aWNpcGFudF9uYW1lGAogASgJUg9wYXJ0aWNpcGFudE5hbWUSMQ'
    'oUcGFydGljaXBhbnRfbWV0YWRhdGEYDiABKAlSE3BhcnRpY2lwYW50TWV0YWRhdGESGgoIcmV1'
    'c2FibGUYCyABKAhSCHJldXNhYmxlEisKBXN0YXRlGAwgASgLMhUubGl2ZWtpdC5JbmdyZXNzU3'
    'RhdGVSBXN0YXRlEh0KB2VuYWJsZWQYECABKAhIAVIHZW5hYmxlZIgBAUIVChNfZW5hYmxlX3Ry'
    'YW5zY29kaW5nQgoKCF9lbmFibGVk');

@$core.Deprecated('Use ingressStateDescriptor instead')
const IngressState$json = {
  '1': 'IngressState',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.livekit.IngressState.Status', '10': 'status'},
    {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    {'1': 'video', '3': 3, '4': 1, '5': 11, '6': '.livekit.InputVideoState', '10': 'video'},
    {'1': 'audio', '3': 4, '4': 1, '5': 11, '6': '.livekit.InputAudioState', '10': 'audio'},
    {'1': 'room_id', '3': 5, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'started_at', '3': 7, '4': 1, '5': 3, '10': 'startedAt'},
    {'1': 'ended_at', '3': 8, '4': 1, '5': 3, '10': 'endedAt'},
    {'1': 'updated_at', '3': 10, '4': 1, '5': 3, '10': 'updatedAt'},
    {'1': 'resource_id', '3': 9, '4': 1, '5': 9, '10': 'resourceId'},
    {'1': 'tracks', '3': 6, '4': 3, '5': 11, '6': '.livekit.TrackInfo', '10': 'tracks'},
  ],
  '4': [IngressState_Status$json],
};

@$core.Deprecated('Use ingressStateDescriptor instead')
const IngressState_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'ENDPOINT_INACTIVE', '2': 0},
    {'1': 'ENDPOINT_BUFFERING', '2': 1},
    {'1': 'ENDPOINT_PUBLISHING', '2': 2},
    {'1': 'ENDPOINT_ERROR', '2': 3},
    {'1': 'ENDPOINT_COMPLETE', '2': 4},
  ],
};

/// Descriptor for `IngressState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingressStateDescriptor = $convert.base64Decode(
    'CgxJbmdyZXNzU3RhdGUSNAoGc3RhdHVzGAEgASgOMhwubGl2ZWtpdC5JbmdyZXNzU3RhdGUuU3'
    'RhdHVzUgZzdGF0dXMSFAoFZXJyb3IYAiABKAlSBWVycm9yEi4KBXZpZGVvGAMgASgLMhgubGl2'
    'ZWtpdC5JbnB1dFZpZGVvU3RhdGVSBXZpZGVvEi4KBWF1ZGlvGAQgASgLMhgubGl2ZWtpdC5Jbn'
    'B1dEF1ZGlvU3RhdGVSBWF1ZGlvEhcKB3Jvb21faWQYBSABKAlSBnJvb21JZBIdCgpzdGFydGVk'
    'X2F0GAcgASgDUglzdGFydGVkQXQSGQoIZW5kZWRfYXQYCCABKANSB2VuZGVkQXQSHQoKdXBkYX'
    'RlZF9hdBgKIAEoA1IJdXBkYXRlZEF0Eh8KC3Jlc291cmNlX2lkGAkgASgJUgpyZXNvdXJjZUlk'
    'EioKBnRyYWNrcxgGIAMoCzISLmxpdmVraXQuVHJhY2tJbmZvUgZ0cmFja3MiewoGU3RhdHVzEh'
    'UKEUVORFBPSU5UX0lOQUNUSVZFEAASFgoSRU5EUE9JTlRfQlVGRkVSSU5HEAESFwoTRU5EUE9J'
    'TlRfUFVCTElTSElORxACEhIKDkVORFBPSU5UX0VSUk9SEAMSFQoRRU5EUE9JTlRfQ09NUExFVE'
    'UQBA==');

@$core.Deprecated('Use inputVideoStateDescriptor instead')
const InputVideoState$json = {
  '1': 'InputVideoState',
  '2': [
    {'1': 'mime_type', '3': 1, '4': 1, '5': 9, '10': 'mimeType'},
    {'1': 'average_bitrate', '3': 2, '4': 1, '5': 13, '10': 'averageBitrate'},
    {'1': 'width', '3': 3, '4': 1, '5': 13, '10': 'width'},
    {'1': 'height', '3': 4, '4': 1, '5': 13, '10': 'height'},
    {'1': 'framerate', '3': 5, '4': 1, '5': 1, '10': 'framerate'},
  ],
};

/// Descriptor for `InputVideoState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputVideoStateDescriptor = $convert.base64Decode(
    'Cg9JbnB1dFZpZGVvU3RhdGUSGwoJbWltZV90eXBlGAEgASgJUghtaW1lVHlwZRInCg9hdmVyYW'
    'dlX2JpdHJhdGUYAiABKA1SDmF2ZXJhZ2VCaXRyYXRlEhQKBXdpZHRoGAMgASgNUgV3aWR0aBIW'
    'CgZoZWlnaHQYBCABKA1SBmhlaWdodBIcCglmcmFtZXJhdGUYBSABKAFSCWZyYW1lcmF0ZQ==');

@$core.Deprecated('Use inputAudioStateDescriptor instead')
const InputAudioState$json = {
  '1': 'InputAudioState',
  '2': [
    {'1': 'mime_type', '3': 1, '4': 1, '5': 9, '10': 'mimeType'},
    {'1': 'average_bitrate', '3': 2, '4': 1, '5': 13, '10': 'averageBitrate'},
    {'1': 'channels', '3': 3, '4': 1, '5': 13, '10': 'channels'},
    {'1': 'sample_rate', '3': 4, '4': 1, '5': 13, '10': 'sampleRate'},
  ],
};

/// Descriptor for `InputAudioState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputAudioStateDescriptor = $convert.base64Decode(
    'Cg9JbnB1dEF1ZGlvU3RhdGUSGwoJbWltZV90eXBlGAEgASgJUghtaW1lVHlwZRInCg9hdmVyYW'
    'dlX2JpdHJhdGUYAiABKA1SDmF2ZXJhZ2VCaXRyYXRlEhoKCGNoYW5uZWxzGAMgASgNUghjaGFu'
    'bmVscxIfCgtzYW1wbGVfcmF0ZRgEIAEoDVIKc2FtcGxlUmF0ZQ==');

@$core.Deprecated('Use updateIngressRequestDescriptor instead')
const UpdateIngressRequest$json = {
  '1': 'UpdateIngressRequest',
  '2': [
    {'1': 'ingress_id', '3': 1, '4': 1, '5': 9, '10': 'ingressId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'room_name', '3': 3, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'participant_identity', '3': 4, '4': 1, '5': 9, '10': 'participantIdentity'},
    {'1': 'participant_name', '3': 5, '4': 1, '5': 9, '10': 'participantName'},
    {'1': 'participant_metadata', '3': 9, '4': 1, '5': 9, '10': 'participantMetadata'},
    {
      '1': 'bypass_transcoding',
      '3': 8,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '9': 0,
      '10': 'bypassTranscoding',
      '17': true,
    },
    {'1': 'enable_transcoding', '3': 10, '4': 1, '5': 8, '9': 1, '10': 'enableTranscoding', '17': true},
    {'1': 'audio', '3': 6, '4': 1, '5': 11, '6': '.livekit.IngressAudioOptions', '10': 'audio'},
    {'1': 'video', '3': 7, '4': 1, '5': 11, '6': '.livekit.IngressVideoOptions', '10': 'video'},
    {'1': 'enabled', '3': 11, '4': 1, '5': 8, '9': 2, '10': 'enabled', '17': true},
  ],
  '8': [
    {'1': '_bypass_transcoding'},
    {'1': '_enable_transcoding'},
    {'1': '_enabled'},
  ],
};

/// Descriptor for `UpdateIngressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateIngressRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVJbmdyZXNzUmVxdWVzdBIdCgppbmdyZXNzX2lkGAEgASgJUglpbmdyZXNzSWQSEg'
    'oEbmFtZRgCIAEoCVIEbmFtZRIbCglyb29tX25hbWUYAyABKAlSCHJvb21OYW1lEjEKFHBhcnRp'
    'Y2lwYW50X2lkZW50aXR5GAQgASgJUhNwYXJ0aWNpcGFudElkZW50aXR5EikKEHBhcnRpY2lwYW'
    '50X25hbWUYBSABKAlSD3BhcnRpY2lwYW50TmFtZRIxChRwYXJ0aWNpcGFudF9tZXRhZGF0YRgJ'
    'IAEoCVITcGFydGljaXBhbnRNZXRhZGF0YRI2ChJieXBhc3NfdHJhbnNjb2RpbmcYCCABKAhCAh'
    'gBSABSEWJ5cGFzc1RyYW5zY29kaW5niAEBEjIKEmVuYWJsZV90cmFuc2NvZGluZxgKIAEoCEgB'
    'UhFlbmFibGVUcmFuc2NvZGluZ4gBARIyCgVhdWRpbxgGIAEoCzIcLmxpdmVraXQuSW5ncmVzc0'
    'F1ZGlvT3B0aW9uc1IFYXVkaW8SMgoFdmlkZW8YByABKAsyHC5saXZla2l0LkluZ3Jlc3NWaWRl'
    'b09wdGlvbnNSBXZpZGVvEh0KB2VuYWJsZWQYCyABKAhIAlIHZW5hYmxlZIgBAUIVChNfYnlwYX'
    'NzX3RyYW5zY29kaW5nQhUKE19lbmFibGVfdHJhbnNjb2RpbmdCCgoIX2VuYWJsZWQ=');

@$core.Deprecated('Use listIngressRequestDescriptor instead')
const ListIngressRequest$json = {
  '1': 'ListIngressRequest',
  '2': [
    {'1': 'room_name', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'ingress_id', '3': 2, '4': 1, '5': 9, '10': 'ingressId'},
  ],
};

/// Descriptor for `ListIngressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listIngressRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0SW5ncmVzc1JlcXVlc3QSGwoJcm9vbV9uYW1lGAEgASgJUghyb29tTmFtZRIdCgppbm'
    'dyZXNzX2lkGAIgASgJUglpbmdyZXNzSWQ=');

@$core.Deprecated('Use listIngressResponseDescriptor instead')
const ListIngressResponse$json = {
  '1': 'ListIngressResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.livekit.IngressInfo', '10': 'items'},
  ],
};

/// Descriptor for `ListIngressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listIngressResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0SW5ncmVzc1Jlc3BvbnNlEioKBWl0ZW1zGAEgAygLMhQubGl2ZWtpdC5JbmdyZXNzSW'
    '5mb1IFaXRlbXM=');

@$core.Deprecated('Use deleteIngressRequestDescriptor instead')
const DeleteIngressRequest$json = {
  '1': 'DeleteIngressRequest',
  '2': [
    {'1': 'ingress_id', '3': 1, '4': 1, '5': 9, '10': 'ingressId'},
  ],
};

/// Descriptor for `DeleteIngressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteIngressRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVJbmdyZXNzUmVxdWVzdBIdCgppbmdyZXNzX2lkGAEgASgJUglpbmdyZXNzSWQ=');

const $core.Map<$core.String, $core.dynamic> IngressServiceBase$json = {
  '1': 'Ingress',
  '2': [
    {'1': 'CreateIngress', '2': '.livekit.CreateIngressRequest', '3': '.livekit.IngressInfo'},
    {'1': 'UpdateIngress', '2': '.livekit.UpdateIngressRequest', '3': '.livekit.IngressInfo'},
    {'1': 'ListIngress', '2': '.livekit.ListIngressRequest', '3': '.livekit.ListIngressResponse'},
    {'1': 'DeleteIngress', '2': '.livekit.DeleteIngressRequest', '3': '.livekit.IngressInfo'},
  ],
};

@$core.Deprecated('Use ingressServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> IngressServiceBase$messageJson = {
  '.livekit.CreateIngressRequest': CreateIngressRequest$json,
  '.livekit.IngressAudioOptions': IngressAudioOptions$json,
  '.livekit.IngressAudioEncodingOptions': IngressAudioEncodingOptions$json,
  '.livekit.IngressVideoOptions': IngressVideoOptions$json,
  '.livekit.IngressVideoEncodingOptions': IngressVideoEncodingOptions$json,
  '.livekit.VideoLayer': $2.VideoLayer$json,
  '.livekit.IngressInfo': IngressInfo$json,
  '.livekit.IngressState': IngressState$json,
  '.livekit.InputVideoState': InputVideoState$json,
  '.livekit.InputAudioState': InputAudioState$json,
  '.livekit.TrackInfo': $2.TrackInfo$json,
  '.livekit.SimulcastCodecInfo': $2.SimulcastCodecInfo$json,
  '.livekit.TimedVersion': $2.TimedVersion$json,
  '.livekit.UpdateIngressRequest': UpdateIngressRequest$json,
  '.livekit.ListIngressRequest': ListIngressRequest$json,
  '.livekit.ListIngressResponse': ListIngressResponse$json,
  '.livekit.DeleteIngressRequest': DeleteIngressRequest$json,
};

/// Descriptor for `Ingress`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List ingressServiceDescriptor = $convert.base64Decode(
    'CgdJbmdyZXNzEkQKDUNyZWF0ZUluZ3Jlc3MSHS5saXZla2l0LkNyZWF0ZUluZ3Jlc3NSZXF1ZX'
    'N0GhQubGl2ZWtpdC5JbmdyZXNzSW5mbxJECg1VcGRhdGVJbmdyZXNzEh0ubGl2ZWtpdC5VcGRh'
    'dGVJbmdyZXNzUmVxdWVzdBoULmxpdmVraXQuSW5ncmVzc0luZm8SSAoLTGlzdEluZ3Jlc3MSGy'
    '5saXZla2l0Lkxpc3RJbmdyZXNzUmVxdWVzdBocLmxpdmVraXQuTGlzdEluZ3Jlc3NSZXNwb25z'
    'ZRJECg1EZWxldGVJbmdyZXNzEh0ubGl2ZWtpdC5EZWxldGVJbmdyZXNzUmVxdWVzdBoULmxpdm'
    'VraXQuSW5ncmVzc0luZm8=');

