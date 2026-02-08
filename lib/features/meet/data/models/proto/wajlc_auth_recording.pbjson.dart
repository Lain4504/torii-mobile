// This is a generated file - do not edit.
//
// Generated from wajlc_auth_recording.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use fetchRecordingsReqDescriptor instead')
const FetchRecordingsReq$json = {
  '1': 'FetchRecordingsReq',
  '2': [
    {'1': 'room_ids', '3': 1, '4': 3, '5': 9, '10': 'roomIds'},
    {
      '1': 'room_sid',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'roomSid',
      '17': true
    },
    {'1': 'from', '3': 3, '4': 1, '5': 13, '10': 'from'},
    {'1': 'limit', '3': 4, '4': 1, '5': 13, '10': 'limit'},
    {'1': 'order_by', '3': 5, '4': 1, '5': 9, '10': 'orderBy'},
  ],
  '8': [
    {'1': '_room_sid'},
  ],
};

/// Descriptor for `FetchRecordingsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchRecordingsReqDescriptor = $convert.base64Decode(
    'ChJGZXRjaFJlY29yZGluZ3NSZXESGQoIcm9vbV9pZHMYASADKAlSB3Jvb21JZHMSHgoIcm9vbV'
    '9zaWQYAiABKAlIAFIHcm9vbVNpZIgBARISCgRmcm9tGAMgASgNUgRmcm9tEhQKBWxpbWl0GAQg'
    'ASgNUgVsaW1pdBIZCghvcmRlcl9ieRgFIAEoCVIHb3JkZXJCeUILCglfcm9vbV9zaWQ=');

@$core.Deprecated('Use recordingInfoDescriptor instead')
const RecordingInfo$json = {
  '1': 'RecordingInfo',
  '2': [
    {'1': 'record_id', '3': 1, '4': 1, '5': 9, '10': 'recordId'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_sid', '3': 3, '4': 1, '5': 9, '10': 'roomSid'},
    {'1': 'file_path', '3': 4, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'file_size', '3': 5, '4': 1, '5': 2, '10': 'fileSize'},
    {'1': 'creation_time', '3': 6, '4': 1, '5': 3, '10': 'creationTime'},
    {
      '1': 'room_creation_time',
      '3': 7,
      '4': 1,
      '5': 3,
      '10': 'roomCreationTime'
    },
    {
      '1': 'metadata',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RecordingMetadata',
      '9': 0,
      '10': 'metadata',
      '17': true
    },
  ],
  '8': [
    {'1': '_metadata'},
  ],
};

/// Descriptor for `RecordingInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordingInfoDescriptor = $convert.base64Decode(
    'Cg1SZWNvcmRpbmdJbmZvEhsKCXJlY29yZF9pZBgBIAEoCVIIcmVjb3JkSWQSFwoHcm9vbV9pZB'
    'gCIAEoCVIGcm9vbUlkEhkKCHJvb21fc2lkGAMgASgJUgdyb29tU2lkEhsKCWZpbGVfcGF0aBgE'
    'IAEoCVIIZmlsZVBhdGgSGwoJZmlsZV9zaXplGAUgASgCUghmaWxlU2l6ZRIjCg1jcmVhdGlvbl'
    '90aW1lGAYgASgDUgxjcmVhdGlvblRpbWUSLAoScm9vbV9jcmVhdGlvbl90aW1lGAcgASgDUhBy'
    'b29tQ3JlYXRpb25UaW1lEjkKCG1ldGFkYXRhGAggASgLMhgud2FqbGMuUmVjb3JkaW5nTWV0YW'
    'RhdGFIAFIIbWV0YWRhdGGIAQFCCwoJX21ldGFkYXRh');

@$core.Deprecated('Use fetchRecordingsResultDescriptor instead')
const FetchRecordingsResult$json = {
  '1': 'FetchRecordingsResult',
  '2': [
    {'1': 'total_recordings', '3': 1, '4': 1, '5': 3, '10': 'totalRecordings'},
    {'1': 'from', '3': 2, '4': 1, '5': 13, '10': 'from'},
    {'1': 'limit', '3': 3, '4': 1, '5': 13, '10': 'limit'},
    {'1': 'order_by', '3': 4, '4': 1, '5': 9, '10': 'orderBy'},
    {
      '1': 'recordings_list',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.wajlc.RecordingInfo',
      '10': 'recordingsList'
    },
  ],
};

/// Descriptor for `FetchRecordingsResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchRecordingsResultDescriptor = $convert.base64Decode(
    'ChVGZXRjaFJlY29yZGluZ3NSZXN1bHQSKQoQdG90YWxfcmVjb3JkaW5ncxgBIAEoA1IPdG90YW'
    'xSZWNvcmRpbmdzEhIKBGZyb20YAiABKA1SBGZyb20SFAoFbGltaXQYAyABKA1SBWxpbWl0EhkK'
    'CG9yZGVyX2J5GAQgASgJUgdvcmRlckJ5Ej0KD3JlY29yZGluZ3NfbGlzdBgFIAMoCzIULndham'
    'xjLlJlY29yZGluZ0luZm9SDnJlY29yZGluZ3NMaXN0');

@$core.Deprecated('Use fetchRecordingsResDescriptor instead')
const FetchRecordingsRes$json = {
  '1': 'FetchRecordingsRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'result',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.FetchRecordingsResult',
      '10': 'result'
    },
  ],
};

/// Descriptor for `FetchRecordingsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchRecordingsResDescriptor = $convert.base64Decode(
    'ChJGZXRjaFJlY29yZGluZ3NSZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSEAoDbXNnGAIgAS'
    'gJUgNtc2cSNAoGcmVzdWx0GAMgASgLMhwud2FqbGMuRmV0Y2hSZWNvcmRpbmdzUmVzdWx0UgZy'
    'ZXN1bHQ=');

@$core.Deprecated('Use recordingInfoReqDescriptor instead')
const RecordingInfoReq$json = {
  '1': 'RecordingInfoReq',
  '2': [
    {'1': 'record_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'recordId'},
  ],
};

/// Descriptor for `RecordingInfoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordingInfoReqDescriptor = $convert.base64Decode(
    'ChBSZWNvcmRpbmdJbmZvUmVxEiMKCXJlY29yZF9pZBgBIAEoCUIGukgDyAEBUghyZWNvcmRJZA'
    '==');

@$core.Deprecated('Use recordingInfoResDescriptor instead')
const RecordingInfoRes$json = {
  '1': 'RecordingInfoRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'recording_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RecordingInfo',
      '10': 'recordingInfo'
    },
    {
      '1': 'room_info',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.wajlc.PastRoomInfo',
      '10': 'roomInfo'
    },
  ],
};

/// Descriptor for `RecordingInfoRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordingInfoResDescriptor = $convert.base64Decode(
    'ChBSZWNvcmRpbmdJbmZvUmVzEhYKBnN0YXR1cxgBIAEoCFIGc3RhdHVzEhAKA21zZxgCIAEoCV'
    'IDbXNnEjsKDnJlY29yZGluZ19pbmZvGAMgASgLMhQud2FqbGMuUmVjb3JkaW5nSW5mb1INcmVj'
    'b3JkaW5nSW5mbxIwCglyb29tX2luZm8YBCABKAsyEy53YWpsYy5QYXN0Um9vbUluZm9SCHJvb2'
    '1JbmZv');

@$core.Deprecated('Use deleteRecordingReqDescriptor instead')
const DeleteRecordingReq$json = {
  '1': 'DeleteRecordingReq',
  '2': [
    {'1': 'record_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'recordId'},
  ],
};

/// Descriptor for `DeleteRecordingReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRecordingReqDescriptor = $convert.base64Decode(
    'ChJEZWxldGVSZWNvcmRpbmdSZXESIwoJcmVjb3JkX2lkGAEgASgJQga6SAPIAQFSCHJlY29yZE'
    'lk');

@$core.Deprecated('Use deleteRecordingResDescriptor instead')
const DeleteRecordingRes$json = {
  '1': 'DeleteRecordingRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `DeleteRecordingRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRecordingResDescriptor = $convert.base64Decode(
    'ChJEZWxldGVSZWNvcmRpbmdSZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSEAoDbXNnGAIgAS'
    'gJUgNtc2c=');

@$core.Deprecated('Use getDownloadTokenReqDescriptor instead')
const GetDownloadTokenReq$json = {
  '1': 'GetDownloadTokenReq',
  '2': [
    {'1': 'record_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'recordId'},
  ],
};

/// Descriptor for `GetDownloadTokenReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDownloadTokenReqDescriptor = $convert.base64Decode(
    'ChNHZXREb3dubG9hZFRva2VuUmVxEiMKCXJlY29yZF9pZBgBIAEoCUIGukgDyAEBUghyZWNvcm'
    'RJZA==');

@$core.Deprecated('Use getDownloadTokenResDescriptor instead')
const GetDownloadTokenRes$json = {
  '1': 'GetDownloadTokenRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'token', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'token', '17': true},
  ],
  '8': [
    {'1': '_token'},
  ],
};

/// Descriptor for `GetDownloadTokenRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDownloadTokenResDescriptor = $convert.base64Decode(
    'ChNHZXREb3dubG9hZFRva2VuUmVzEhYKBnN0YXR1cxgBIAEoCFIGc3RhdHVzEhAKA21zZxgCIA'
    'EoCVIDbXNnEhkKBXRva2VuGAMgASgJSABSBXRva2VuiAEBQggKBl90b2tlbg==');

@$core.Deprecated('Use updateRecordingMetadataReqDescriptor instead')
const UpdateRecordingMetadataReq$json = {
  '1': 'UpdateRecordingMetadataReq',
  '2': [
    {'1': 'record_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'recordId'},
    {
      '1': 'metadata',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RecordingMetadata',
      '10': 'metadata'
    },
  ],
};

/// Descriptor for `UpdateRecordingMetadataReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRecordingMetadataReqDescriptor =
    $convert.base64Decode(
        'ChpVcGRhdGVSZWNvcmRpbmdNZXRhZGF0YVJlcRIjCglyZWNvcmRfaWQYASABKAlCBrpIA8gBAV'
        'IIcmVjb3JkSWQSNAoIbWV0YWRhdGEYAiABKAsyGC53YWpsYy5SZWNvcmRpbmdNZXRhZGF0YVII'
        'bWV0YWRhdGE=');

@$core.Deprecated('Use updateRecordingMetadataResDescriptor instead')
const UpdateRecordingMetadataRes$json = {
  '1': 'UpdateRecordingMetadataRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `UpdateRecordingMetadataRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRecordingMetadataResDescriptor =
    $convert.base64Decode(
        'ChpVcGRhdGVSZWNvcmRpbmdNZXRhZGF0YVJlcxIWCgZzdGF0dXMYASABKAhSBnN0YXR1cxIQCg'
        'Ntc2cYAiABKAlSA21zZw==');
