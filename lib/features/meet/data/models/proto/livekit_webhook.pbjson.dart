// This is a generated file - do not edit.
//
// Generated from livekit_webhook.proto.

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

@$core.Deprecated('Use webhookEventDescriptor instead')
const WebhookEvent$json = {
  '1': 'WebhookEvent',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 9, '10': 'event'},
    {'1': 'room', '3': 2, '4': 1, '5': 11, '6': '.livekit.Room', '10': 'room'},
    {
      '1': 'participant',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.livekit.ParticipantInfo',
      '10': 'participant'
    },
    {
      '1': 'egress_info',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.livekit.EgressInfo',
      '10': 'egressInfo'
    },
    {
      '1': 'ingress_info',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.livekit.IngressInfo',
      '10': 'ingressInfo'
    },
    {
      '1': 'track',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.livekit.TrackInfo',
      '10': 'track'
    },
    {'1': 'id', '3': 6, '4': 1, '5': 9, '10': 'id'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 3, '10': 'createdAt'},
    {
      '1': 'num_dropped',
      '3': 11,
      '4': 1,
      '5': 5,
      '8': {'3': true},
      '10': 'numDropped',
    },
  ],
};

/// Descriptor for `WebhookEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List webhookEventDescriptor = $convert.base64Decode(
    'CgxXZWJob29rRXZlbnQSFAoFZXZlbnQYASABKAlSBWV2ZW50EiEKBHJvb20YAiABKAsyDS5saX'
    'Zla2l0LlJvb21SBHJvb20SOgoLcGFydGljaXBhbnQYAyABKAsyGC5saXZla2l0LlBhcnRpY2lw'
    'YW50SW5mb1ILcGFydGljaXBhbnQSNAoLZWdyZXNzX2luZm8YCSABKAsyEy5saXZla2l0LkVncm'
    'Vzc0luZm9SCmVncmVzc0luZm8SNwoMaW5ncmVzc19pbmZvGAogASgLMhQubGl2ZWtpdC5Jbmdy'
    'ZXNzSW5mb1ILaW5ncmVzc0luZm8SKAoFdHJhY2sYCCABKAsyEi5saXZla2l0LlRyYWNrSW5mb1'
    'IFdHJhY2sSDgoCaWQYBiABKAlSAmlkEh0KCmNyZWF0ZWRfYXQYByABKANSCWNyZWF0ZWRBdBIj'
    'CgtudW1fZHJvcHBlZBgLIAEoBUICGAFSCm51bURyb3BwZWQ=');
