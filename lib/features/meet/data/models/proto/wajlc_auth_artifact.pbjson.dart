// This is a generated file - do not edit.
//
// Generated from wajlc_auth_artifact.proto.

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

@$core.Deprecated('Use fetchArtifactsReqDescriptor instead')
const FetchArtifactsReq$json = {
  '1': 'FetchArtifactsReq',
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
    {
      '1': 'type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.wajlc.RoomArtifactType',
      '9': 1,
      '10': 'type',
      '17': true
    },
    {'1': 'from', '3': 4, '4': 1, '5': 4, '10': 'from'},
    {'1': 'limit', '3': 5, '4': 1, '5': 4, '10': 'limit'},
    {'1': 'order_by', '3': 6, '4': 1, '5': 9, '10': 'orderBy'},
  ],
  '8': [
    {'1': '_room_sid'},
    {'1': '_type'},
  ],
};

/// Descriptor for `FetchArtifactsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchArtifactsReqDescriptor = $convert.base64Decode(
    'ChFGZXRjaEFydGlmYWN0c1JlcRIZCghyb29tX2lkcxgBIAMoCVIHcm9vbUlkcxIeCghyb29tX3'
    'NpZBgCIAEoCUgAUgdyb29tU2lkiAEBEjAKBHR5cGUYAyABKA4yFy53YWpsYy5Sb29tQXJ0aWZh'
    'Y3RUeXBlSAFSBHR5cGWIAQESEgoEZnJvbRgEIAEoBFIEZnJvbRIUCgVsaW1pdBgFIAEoBFIFbG'
    'ltaXQSGQoIb3JkZXJfYnkYBiABKAlSB29yZGVyQnlCCwoJX3Jvb21fc2lkQgcKBV90eXBl');

@$core.Deprecated('Use artifactInfoDescriptor instead')
const ArtifactInfo$json = {
  '1': 'ArtifactInfo',
  '2': [
    {'1': 'artifact_id', '3': 1, '4': 1, '5': 9, '10': 'artifactId'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {
      '1': 'type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.wajlc.RoomArtifactType',
      '10': 'type'
    },
    {'1': 'created', '3': 4, '4': 1, '5': 9, '10': 'created'},
    {
      '1': 'metadata',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RoomArtifactMetadata',
      '10': 'metadata'
    },
  ],
};

/// Descriptor for `ArtifactInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List artifactInfoDescriptor = $convert.base64Decode(
    'CgxBcnRpZmFjdEluZm8SHwoLYXJ0aWZhY3RfaWQYASABKAlSCmFydGlmYWN0SWQSFwoHcm9vbV'
    '9pZBgCIAEoCVIGcm9vbUlkEisKBHR5cGUYAyABKA4yFy53YWpsYy5Sb29tQXJ0aWZhY3RUeXBl'
    'UgR0eXBlEhgKB2NyZWF0ZWQYBCABKAlSB2NyZWF0ZWQSNwoIbWV0YWRhdGEYBSABKAsyGy53YW'
    'psYy5Sb29tQXJ0aWZhY3RNZXRhZGF0YVIIbWV0YWRhdGE=');

@$core.Deprecated('Use fetchArtifactsResultDescriptor instead')
const FetchArtifactsResult$json = {
  '1': 'FetchArtifactsResult',
  '2': [
    {'1': 'total_artifacts', '3': 1, '4': 1, '5': 3, '10': 'totalArtifacts'},
    {'1': 'from', '3': 2, '4': 1, '5': 4, '10': 'from'},
    {'1': 'limit', '3': 3, '4': 1, '5': 4, '10': 'limit'},
    {'1': 'order_by', '3': 4, '4': 1, '5': 9, '10': 'orderBy'},
    {
      '1': 'type',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.wajlc.RoomArtifactType',
      '9': 0,
      '10': 'type',
      '17': true
    },
    {
      '1': 'artifacts_list',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.wajlc.ArtifactInfo',
      '10': 'artifactsList'
    },
  ],
  '8': [
    {'1': '_type'},
  ],
};

/// Descriptor for `FetchArtifactsResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchArtifactsResultDescriptor = $convert.base64Decode(
    'ChRGZXRjaEFydGlmYWN0c1Jlc3VsdBInCg90b3RhbF9hcnRpZmFjdHMYASABKANSDnRvdGFsQX'
    'J0aWZhY3RzEhIKBGZyb20YAiABKARSBGZyb20SFAoFbGltaXQYAyABKARSBWxpbWl0EhkKCG9y'
    'ZGVyX2J5GAQgASgJUgdvcmRlckJ5EjAKBHR5cGUYBSABKA4yFy53YWpsYy5Sb29tQXJ0aWZhY3'
    'RUeXBlSABSBHR5cGWIAQESOgoOYXJ0aWZhY3RzX2xpc3QYBiADKAsyEy53YWpsYy5BcnRpZmFj'
    'dEluZm9SDWFydGlmYWN0c0xpc3RCBwoFX3R5cGU=');

@$core.Deprecated('Use fetchArtifactsResDescriptor instead')
const FetchArtifactsRes$json = {
  '1': 'FetchArtifactsRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'result',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.FetchArtifactsResult',
      '10': 'result'
    },
  ],
};

/// Descriptor for `FetchArtifactsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchArtifactsResDescriptor = $convert.base64Decode(
    'ChFGZXRjaEFydGlmYWN0c1JlcxIWCgZzdGF0dXMYASABKAhSBnN0YXR1cxIQCgNtc2cYAiABKA'
    'lSA21zZxIzCgZyZXN1bHQYAyABKAsyGy53YWpsYy5GZXRjaEFydGlmYWN0c1Jlc3VsdFIGcmVz'
    'dWx0');

@$core.Deprecated('Use getArtifactDownloadTokenReqDescriptor instead')
const GetArtifactDownloadTokenReq$json = {
  '1': 'GetArtifactDownloadTokenReq',
  '2': [
    {'1': 'artifact_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'artifactId'},
  ],
};

/// Descriptor for `GetArtifactDownloadTokenReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getArtifactDownloadTokenReqDescriptor =
    $convert.base64Decode(
        'ChtHZXRBcnRpZmFjdERvd25sb2FkVG9rZW5SZXESJwoLYXJ0aWZhY3RfaWQYASABKAlCBrpIA8'
        'gBAVIKYXJ0aWZhY3RJZA==');

@$core.Deprecated('Use getArtifactDownloadTokenResDescriptor instead')
const GetArtifactDownloadTokenRes$json = {
  '1': 'GetArtifactDownloadTokenRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'token', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'token', '17': true},
  ],
  '8': [
    {'1': '_token'},
  ],
};

/// Descriptor for `GetArtifactDownloadTokenRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getArtifactDownloadTokenResDescriptor =
    $convert.base64Decode(
        'ChtHZXRBcnRpZmFjdERvd25sb2FkVG9rZW5SZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSEA'
        'oDbXNnGAIgASgJUgNtc2cSGQoFdG9rZW4YAyABKAlIAFIFdG9rZW6IAQFCCAoGX3Rva2Vu');

@$core.Deprecated('Use deleteArtifactReqDescriptor instead')
const DeleteArtifactReq$json = {
  '1': 'DeleteArtifactReq',
  '2': [
    {'1': 'artifact_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'artifactId'},
  ],
};

/// Descriptor for `DeleteArtifactReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteArtifactReqDescriptor = $convert.base64Decode(
    'ChFEZWxldGVBcnRpZmFjdFJlcRInCgthcnRpZmFjdF9pZBgBIAEoCUIGukgDyAEBUgphcnRpZm'
    'FjdElk');

@$core.Deprecated('Use deleteArtifactResDescriptor instead')
const DeleteArtifactRes$json = {
  '1': 'DeleteArtifactRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `DeleteArtifactRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteArtifactResDescriptor = $convert.base64Decode(
    'ChFEZWxldGVBcnRpZmFjdFJlcxIWCgZzdGF0dXMYASABKAhSBnN0YXR1cxIQCgNtc2cYAiABKA'
    'lSA21zZw==');

@$core.Deprecated('Use artifactInfoReqDescriptor instead')
const ArtifactInfoReq$json = {
  '1': 'ArtifactInfoReq',
  '2': [
    {'1': 'artifact_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'artifactId'},
  ],
};

/// Descriptor for `ArtifactInfoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List artifactInfoReqDescriptor = $convert.base64Decode(
    'Cg9BcnRpZmFjdEluZm9SZXESJwoLYXJ0aWZhY3RfaWQYASABKAlCBrpIA8gBAVIKYXJ0aWZhY3'
    'RJZA==');

@$core.Deprecated('Use artifactInfoResDescriptor instead')
const ArtifactInfoRes$json = {
  '1': 'ArtifactInfoRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'artifact_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.ArtifactInfo',
      '9': 0,
      '10': 'artifactInfo',
      '17': true
    },
    {
      '1': 'room_info',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.wajlc.PastRoomInfo',
      '9': 1,
      '10': 'roomInfo',
      '17': true
    },
  ],
  '8': [
    {'1': '_artifact_info'},
    {'1': '_room_info'},
  ],
};

/// Descriptor for `ArtifactInfoRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List artifactInfoResDescriptor = $convert.base64Decode(
    'Cg9BcnRpZmFjdEluZm9SZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSEAoDbXNnGAIgASgJUg'
    'Ntc2cSPQoNYXJ0aWZhY3RfaW5mbxgDIAEoCzITLndhamxjLkFydGlmYWN0SW5mb0gAUgxhcnRp'
    'ZmFjdEluZm+IAQESNQoJcm9vbV9pbmZvGAQgASgLMhMud2FqbGMuUGFzdFJvb21JbmZvSAFSCH'
    'Jvb21JbmZviAEBQhAKDl9hcnRpZmFjdF9pbmZvQgwKCl9yb29tX2luZm8=');
