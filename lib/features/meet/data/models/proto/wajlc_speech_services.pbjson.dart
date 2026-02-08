// This is a generated file - do not edit.
//
// Generated from wajlc_speech_services.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use speechServiceUserStatusTasksDescriptor instead')
const SpeechServiceUserStatusTasks$json = {
  '1': 'SpeechServiceUserStatusTasks',
  '2': [
    {'1': 'SPEECH_TO_TEXT_SESSION_STARTED', '2': 0},
    {'1': 'SPEECH_TO_TEXT_SESSION_ENDED', '2': 1},
    {'1': 'SPEECH_TO_TEXT_TOTAL_USAGE', '2': 2},
  ],
};

/// Descriptor for `SpeechServiceUserStatusTasks`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List speechServiceUserStatusTasksDescriptor =
    $convert.base64Decode(
        'ChxTcGVlY2hTZXJ2aWNlVXNlclN0YXR1c1Rhc2tzEiIKHlNQRUVDSF9UT19URVhUX1NFU1NJT0'
        '5fU1RBUlRFRBAAEiAKHFNQRUVDSF9UT19URVhUX1NFU1NJT05fRU5ERUQQARIeChpTUEVFQ0hf'
        'VE9fVEVYVF9UT1RBTF9VU0FHRRAC');

@$core.Deprecated('Use speechToTextTranslationReqDescriptor instead')
const SpeechToTextTranslationReq$json = {
  '1': 'SpeechToTextTranslationReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'is_enabled', '3': 3, '4': 1, '5': 8, '10': 'isEnabled'},
    {
      '1': 'allowed_speech_langs',
      '3': 4,
      '4': 3,
      '5': 9,
      '10': 'allowedSpeechLangs'
    },
    {
      '1': 'allowed_speech_users',
      '3': 5,
      '4': 3,
      '5': 9,
      '10': 'allowedSpeechUsers'
    },
    {
      '1': 'is_enabled_translation',
      '3': 6,
      '4': 1,
      '5': 8,
      '10': 'isEnabledTranslation'
    },
    {
      '1': 'allowed_trans_langs',
      '3': 7,
      '4': 3,
      '5': 9,
      '10': 'allowedTransLangs'
    },
    {
      '1': 'default_subtitle_lang',
      '3': 8,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'defaultSubtitleLang',
      '17': true
    },
  ],
  '8': [
    {'1': '_default_subtitle_lang'},
  ],
};

/// Descriptor for `SpeechToTextTranslationReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speechToTextTranslationReqDescriptor = $convert.base64Decode(
    'ChpTcGVlY2hUb1RleHRUcmFuc2xhdGlvblJlcRIXCgdyb29tX2lkGAEgASgJUgZyb29tSWQSHQ'
    'oKaXNfZW5hYmxlZBgDIAEoCFIJaXNFbmFibGVkEjAKFGFsbG93ZWRfc3BlZWNoX2xhbmdzGAQg'
    'AygJUhJhbGxvd2VkU3BlZWNoTGFuZ3MSMAoUYWxsb3dlZF9zcGVlY2hfdXNlcnMYBSADKAlSEm'
    'FsbG93ZWRTcGVlY2hVc2VycxI0ChZpc19lbmFibGVkX3RyYW5zbGF0aW9uGAYgASgIUhRpc0Vu'
    'YWJsZWRUcmFuc2xhdGlvbhIuChNhbGxvd2VkX3RyYW5zX2xhbmdzGAcgAygJUhFhbGxvd2VkVH'
    'JhbnNMYW5ncxI3ChVkZWZhdWx0X3N1YnRpdGxlX2xhbmcYCCABKAlIAFITZGVmYXVsdFN1YnRp'
    'dGxlTGFuZ4gBAUIYChZfZGVmYXVsdF9zdWJ0aXRsZV9sYW5n');

@$core.Deprecated('Use generateAzureTokenReqDescriptor instead')
const GenerateAzureTokenReq$json = {
  '1': 'GenerateAzureTokenReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_sid', '3': 2, '4': 1, '5': 9, '10': 'userSid'},
  ],
};

/// Descriptor for `GenerateAzureTokenReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateAzureTokenReqDescriptor = $convert.base64Decode(
    'ChVHZW5lcmF0ZUF6dXJlVG9rZW5SZXESFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEhkKCHVzZX'
    'Jfc2lkGAIgASgJUgd1c2VyU2lk');

@$core.Deprecated('Use generateAzureTokenResDescriptor instead')
const GenerateAzureTokenRes$json = {
  '1': 'GenerateAzureTokenRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'token', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'token', '17': true},
    {
      '1': 'service_region',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'serviceRegion',
      '17': true
    },
    {'1': 'key_id', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'keyId', '17': true},
    {'1': 'renew', '3': 6, '4': 1, '5': 8, '10': 'renew'},
  ],
  '8': [
    {'1': '_token'},
    {'1': '_service_region'},
    {'1': '_key_id'},
  ],
};

/// Descriptor for `GenerateAzureTokenRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateAzureTokenResDescriptor = $convert.base64Decode(
    'ChVHZW5lcmF0ZUF6dXJlVG9rZW5SZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSEAoDbXNnGA'
    'IgASgJUgNtc2cSGQoFdG9rZW4YAyABKAlIAFIFdG9rZW6IAQESKgoOc2VydmljZV9yZWdpb24Y'
    'BCABKAlIAVINc2VydmljZVJlZ2lvbogBARIaCgZrZXlfaWQYBSABKAlIAlIFa2V5SWSIAQESFA'
    'oFcmVuZXcYBiABKAhSBXJlbmV3QggKBl90b2tlbkIRCg9fc2VydmljZV9yZWdpb25CCQoHX2tl'
    'eV9pZA==');

@$core.Deprecated('Use azureTokenRenewReqDescriptor instead')
const AzureTokenRenewReq$json = {
  '1': 'AzureTokenRenewReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_sid', '3': 2, '4': 1, '5': 9, '10': 'userSid'},
    {'1': 'service_region', '3': 3, '4': 1, '5': 9, '10': 'serviceRegion'},
    {'1': 'key_id', '3': 4, '4': 1, '5': 9, '10': 'keyId'},
  ],
};

/// Descriptor for `AzureTokenRenewReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List azureTokenRenewReqDescriptor = $convert.base64Decode(
    'ChJBenVyZVRva2VuUmVuZXdSZXESFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEhkKCHVzZXJfc2'
    'lkGAIgASgJUgd1c2VyU2lkEiUKDnNlcnZpY2VfcmVnaW9uGAMgASgJUg1zZXJ2aWNlUmVnaW9u'
    'EhUKBmtleV9pZBgEIAEoCVIFa2V5SWQ=');

@$core.Deprecated('Use speechServiceUserStatusReqDescriptor instead')
const SpeechServiceUserStatusReq$json = {
  '1': 'SpeechServiceUserStatusReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_sid', '3': 2, '4': 1, '5': 9, '10': 'roomSid'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'key_id', '3': 4, '4': 1, '5': 9, '10': 'keyId'},
    {
      '1': 'task',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.wajlc.SpeechServiceUserStatusTasks',
      '10': 'task'
    },
  ],
};

/// Descriptor for `SpeechServiceUserStatusReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speechServiceUserStatusReqDescriptor = $convert.base64Decode(
    'ChpTcGVlY2hTZXJ2aWNlVXNlclN0YXR1c1JlcRIXCgdyb29tX2lkGAEgASgJUgZyb29tSWQSGQ'
    'oIcm9vbV9zaWQYAiABKAlSB3Jvb21TaWQSFwoHdXNlcl9pZBgDIAEoCVIGdXNlcklkEhUKBmtl'
    'eV9pZBgEIAEoCVIFa2V5SWQSNwoEdGFzaxgFIAEoDjIjLndhamxjLlNwZWVjaFNlcnZpY2VVc2'
    'VyU3RhdHVzVGFza3NSBHRhc2s=');
