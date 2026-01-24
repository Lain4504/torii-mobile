//
//  Generated code. Do not modify.
//  source: livekit_token_source.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use tokenSourceRequestDescriptor instead')
const TokenSourceRequest$json = {
  '1': 'TokenSourceRequest',
  '2': [
    {'1': 'room_name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'roomName', '17': true},
    {'1': 'participant_name', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'participantName', '17': true},
    {'1': 'participant_identity', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'participantIdentity', '17': true},
    {'1': 'participant_metadata', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'participantMetadata', '17': true},
    {'1': 'participant_attributes', '3': 5, '4': 3, '5': 11, '6': '.livekit.TokenSourceRequest.ParticipantAttributesEntry', '10': 'participantAttributes'},
    {'1': 'room_config', '3': 6, '4': 1, '5': 11, '6': '.livekit.RoomConfiguration', '9': 4, '10': 'roomConfig', '17': true},
  ],
  '3': [TokenSourceRequest_ParticipantAttributesEntry$json],
  '8': [
    {'1': '_room_name'},
    {'1': '_participant_name'},
    {'1': '_participant_identity'},
    {'1': '_participant_metadata'},
    {'1': '_room_config'},
  ],
};

@$core.Deprecated('Use tokenSourceRequestDescriptor instead')
const TokenSourceRequest_ParticipantAttributesEntry$json = {
  '1': 'ParticipantAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `TokenSourceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenSourceRequestDescriptor = $convert.base64Decode(
    'ChJUb2tlblNvdXJjZVJlcXVlc3QSIAoJcm9vbV9uYW1lGAEgASgJSABSCHJvb21OYW1liAEBEi'
    '4KEHBhcnRpY2lwYW50X25hbWUYAiABKAlIAVIPcGFydGljaXBhbnROYW1liAEBEjYKFHBhcnRp'
    'Y2lwYW50X2lkZW50aXR5GAMgASgJSAJSE3BhcnRpY2lwYW50SWRlbnRpdHmIAQESNgoUcGFydG'
    'ljaXBhbnRfbWV0YWRhdGEYBCABKAlIA1ITcGFydGljaXBhbnRNZXRhZGF0YYgBARJtChZwYXJ0'
    'aWNpcGFudF9hdHRyaWJ1dGVzGAUgAygLMjYubGl2ZWtpdC5Ub2tlblNvdXJjZVJlcXVlc3QuUG'
    'FydGljaXBhbnRBdHRyaWJ1dGVzRW50cnlSFXBhcnRpY2lwYW50QXR0cmlidXRlcxJACgtyb29t'
    'X2NvbmZpZxgGIAEoCzIaLmxpdmVraXQuUm9vbUNvbmZpZ3VyYXRpb25IBFIKcm9vbUNvbmZpZ4'
    'gBARpIChpQYXJ0aWNpcGFudEF0dHJpYnV0ZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2'
    'YWx1ZRgCIAEoCVIFdmFsdWU6AjgBQgwKCl9yb29tX25hbWVCEwoRX3BhcnRpY2lwYW50X25hbW'
    'VCFwoVX3BhcnRpY2lwYW50X2lkZW50aXR5QhcKFV9wYXJ0aWNpcGFudF9tZXRhZGF0YUIOCgxf'
    'cm9vbV9jb25maWc=');

@$core.Deprecated('Use tokenSourceResponseDescriptor instead')
const TokenSourceResponse$json = {
  '1': 'TokenSourceResponse',
  '2': [
    {'1': 'server_url', '3': 1, '4': 1, '5': 9, '10': 'serverUrl'},
    {'1': 'participant_token', '3': 2, '4': 1, '5': 9, '10': 'participantToken'},
  ],
};

/// Descriptor for `TokenSourceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenSourceResponseDescriptor = $convert.base64Decode(
    'ChNUb2tlblNvdXJjZVJlc3BvbnNlEh0KCnNlcnZlcl91cmwYASABKAlSCXNlcnZlclVybBIrCh'
    'FwYXJ0aWNpcGFudF90b2tlbhgCIAEoCVIQcGFydGljaXBhbnRUb2tlbg==');

