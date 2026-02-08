// This is a generated file - do not edit.
//
// Generated from wajlc_auth_analytics.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use fetchAnalyticsReqDescriptor instead')
const FetchAnalyticsReq$json = {
  '1': 'FetchAnalyticsReq',
  '2': [
    {'1': 'room_ids', '3': 1, '4': 3, '5': 9, '10': 'roomIds'},
    {'1': 'from', '3': 2, '4': 1, '5': 13, '10': 'from'},
    {'1': 'limit', '3': 3, '4': 1, '5': 13, '10': 'limit'},
    {'1': 'order_by', '3': 4, '4': 1, '5': 9, '10': 'orderBy'},
  ],
};

/// Descriptor for `FetchAnalyticsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchAnalyticsReqDescriptor = $convert.base64Decode(
    'ChFGZXRjaEFuYWx5dGljc1JlcRIZCghyb29tX2lkcxgBIAMoCVIHcm9vbUlkcxISCgRmcm9tGA'
    'IgASgNUgRmcm9tEhQKBWxpbWl0GAMgASgNUgVsaW1pdBIZCghvcmRlcl9ieRgEIAEoCVIHb3Jk'
    'ZXJCeQ==');

@$core.Deprecated('Use analyticsInfoDescriptor instead')
const AnalyticsInfo$json = {
  '1': 'AnalyticsInfo',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'file_id', '3': 2, '4': 1, '5': 9, '10': 'fileId'},
    {'1': 'file_name', '3': 3, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'file_size', '3': 4, '4': 1, '5': 1, '10': 'fileSize'},
    {'1': 'creation_time', '3': 5, '4': 1, '5': 3, '10': 'creationTime'},
  ],
};

/// Descriptor for `AnalyticsInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsInfoDescriptor = $convert.base64Decode(
    'Cg1BbmFseXRpY3NJbmZvEhcKB3Jvb21faWQYASABKAlSBnJvb21JZBIXCgdmaWxlX2lkGAIgAS'
    'gJUgZmaWxlSWQSGwoJZmlsZV9uYW1lGAMgASgJUghmaWxlTmFtZRIbCglmaWxlX3NpemUYBCAB'
    'KAFSCGZpbGVTaXplEiMKDWNyZWF0aW9uX3RpbWUYBSABKANSDGNyZWF0aW9uVGltZQ==');

@$core.Deprecated('Use fetchAnalyticsResultDescriptor instead')
const FetchAnalyticsResult$json = {
  '1': 'FetchAnalyticsResult',
  '2': [
    {'1': 'total_analytics', '3': 1, '4': 1, '5': 3, '10': 'totalAnalytics'},
    {'1': 'from', '3': 2, '4': 1, '5': 13, '10': 'from'},
    {'1': 'limit', '3': 3, '4': 1, '5': 13, '10': 'limit'},
    {'1': 'order_by', '3': 4, '4': 1, '5': 9, '10': 'orderBy'},
    {
      '1': 'analytics_list',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.wajlc.AnalyticsInfo',
      '10': 'analyticsList'
    },
  ],
};

/// Descriptor for `FetchAnalyticsResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchAnalyticsResultDescriptor = $convert.base64Decode(
    'ChRGZXRjaEFuYWx5dGljc1Jlc3VsdBInCg90b3RhbF9hbmFseXRpY3MYASABKANSDnRvdGFsQW'
    '5hbHl0aWNzEhIKBGZyb20YAiABKA1SBGZyb20SFAoFbGltaXQYAyABKA1SBWxpbWl0EhkKCG9y'
    'ZGVyX2J5GAQgASgJUgdvcmRlckJ5EjsKDmFuYWx5dGljc19saXN0GAUgAygLMhQud2FqbGMuQW'
    '5hbHl0aWNzSW5mb1INYW5hbHl0aWNzTGlzdA==');

@$core.Deprecated('Use fetchAnalyticsResDescriptor instead')
const FetchAnalyticsRes$json = {
  '1': 'FetchAnalyticsRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'result',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.FetchAnalyticsResult',
      '10': 'result'
    },
  ],
};

/// Descriptor for `FetchAnalyticsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchAnalyticsResDescriptor = $convert.base64Decode(
    'ChFGZXRjaEFuYWx5dGljc1JlcxIWCgZzdGF0dXMYASABKAhSBnN0YXR1cxIQCgNtc2cYAiABKA'
    'lSA21zZxIzCgZyZXN1bHQYAyABKAsyGy53YWpsYy5GZXRjaEFuYWx5dGljc1Jlc3VsdFIGcmVz'
    'dWx0');

@$core.Deprecated('Use deleteAnalyticsReqDescriptor instead')
const DeleteAnalyticsReq$json = {
  '1': 'DeleteAnalyticsReq',
  '2': [
    {'1': 'file_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'fileId'},
  ],
};

/// Descriptor for `DeleteAnalyticsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAnalyticsReqDescriptor = $convert.base64Decode(
    'ChJEZWxldGVBbmFseXRpY3NSZXESHwoHZmlsZV9pZBgBIAEoCUIGukgDyAEBUgZmaWxlSWQ=');

@$core.Deprecated('Use deleteAnalyticsResDescriptor instead')
const DeleteAnalyticsRes$json = {
  '1': 'DeleteAnalyticsRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `DeleteAnalyticsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAnalyticsResDescriptor = $convert.base64Decode(
    'ChJEZWxldGVBbmFseXRpY3NSZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSEAoDbXNnGAIgAS'
    'gJUgNtc2c=');

@$core.Deprecated('Use getAnalyticsDownloadTokenReqDescriptor instead')
const GetAnalyticsDownloadTokenReq$json = {
  '1': 'GetAnalyticsDownloadTokenReq',
  '2': [
    {'1': 'file_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'fileId'},
  ],
};

/// Descriptor for `GetAnalyticsDownloadTokenReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAnalyticsDownloadTokenReqDescriptor =
    $convert.base64Decode(
        'ChxHZXRBbmFseXRpY3NEb3dubG9hZFRva2VuUmVxEh8KB2ZpbGVfaWQYASABKAlCBrpIA8gBAV'
        'IGZmlsZUlk');

@$core.Deprecated('Use getAnalyticsDownloadTokenResDescriptor instead')
const GetAnalyticsDownloadTokenRes$json = {
  '1': 'GetAnalyticsDownloadTokenRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'token', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'token', '17': true},
  ],
  '8': [
    {'1': '_token'},
  ],
};

/// Descriptor for `GetAnalyticsDownloadTokenRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAnalyticsDownloadTokenResDescriptor =
    $convert.base64Decode(
        'ChxHZXRBbmFseXRpY3NEb3dubG9hZFRva2VuUmVzEhYKBnN0YXR1cxgBIAEoCFIGc3RhdHVzEh'
        'AKA21zZxgCIAEoCVIDbXNnEhkKBXRva2VuGAMgASgJSABSBXRva2VuiAEBQggKBl90b2tlbg==');
