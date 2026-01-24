// This is a generated file - do not edit.
//
// Generated from wajlc_ingress.proto.

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

@$core.Deprecated('Use ingressInputDescriptor instead')
const IngressInput$json = {
  '1': 'IngressInput',
  '2': [
    {'1': 'RTMP_INPUT', '2': 0},
    {'1': 'WHIP_INPUT', '2': 1},
  ],
};

/// Descriptor for `IngressInput`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List ingressInputDescriptor = $convert.base64Decode(
    'CgxJbmdyZXNzSW5wdXQSDgoKUlRNUF9JTlBVVBAAEg4KCldISVBfSU5QVVQQAQ==');

@$core.Deprecated('Use createIngressReqDescriptor instead')
const CreateIngressReq$json = {
  '1': 'CreateIngressReq',
  '2': [
    {
      '1': 'input_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.wajlc.IngressInput',
      '10': 'inputType'
    },
    {'1': 'participant_name', '3': 2, '4': 1, '5': 9, '10': 'participantName'},
    {'1': 'room_id', '3': 3, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `CreateIngressReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createIngressReqDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVJbmdyZXNzUmVxEjIKCmlucHV0X3R5cGUYASABKA4yEy53YWpsYy5JbmdyZXNzSW'
    '5wdXRSCWlucHV0VHlwZRIpChBwYXJ0aWNpcGFudF9uYW1lGAIgASgJUg9wYXJ0aWNpcGFudE5h'
    'bWUSFwoHcm9vbV9pZBgDIAEoCVIGcm9vbUlk');

@$core.Deprecated('Use createIngressResDescriptor instead')
const CreateIngressRes$json = {
  '1': 'CreateIngressRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'input_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.wajlc.IngressInput',
      '10': 'inputType'
    },
    {'1': 'url', '3': 4, '4': 1, '5': 9, '10': 'url'},
    {'1': 'stream_key', '3': 5, '4': 1, '5': 9, '10': 'streamKey'},
  ],
};

/// Descriptor for `CreateIngressRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createIngressResDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVJbmdyZXNzUmVzEhYKBnN0YXR1cxgBIAEoCFIGc3RhdHVzEhAKA21zZxgCIAEoCV'
    'IDbXNnEjIKCmlucHV0X3R5cGUYAyABKA4yEy53YWpsYy5JbmdyZXNzSW5wdXRSCWlucHV0VHlw'
    'ZRIQCgN1cmwYBCABKAlSA3VybBIdCgpzdHJlYW1fa2V5GAUgASgJUglzdHJlYW1LZXk=');
