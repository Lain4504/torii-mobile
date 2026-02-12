// This is a generated file - do not edit.
//
// Generated from google/protobuf/go_features.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use goFeaturesDescriptor instead')
const GoFeatures$json = {
  '1': 'GoFeatures',
  '2': [
    {
      '1': 'legacy_unmarshal_json_enum',
      '3': 1,
      '4': 1,
      '5': 8,
      '8': {
        '17': 1,
        '19': [6, 1],
        '20': [
          {'2': 'true', '3': 900},
          {'2': 'false', '3': 999},
        ],
        '22': {
          '1': 1000,
          '2': 1000,
          '3':
              'The legacy UnmarshalJSON API is deprecated and will be removed in a future edition.'
        },
      },
      '10': 'legacyUnmarshalJsonEnum',
    },
    {
      '1': 'api_level',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.pb.GoFeatures.APILevel',
      '8': {
        '17': 1,
        '19': [3, 1],
        '20': [
          {'2': 'API_LEVEL_UNSPECIFIED', '3': 900},
          {'2': 'API_OPAQUE', '3': 1001},
        ],
        '22': {'1': 1000},
      },
      '10': 'apiLevel',
    },
    {
      '1': 'strip_enum_prefix',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.pb.GoFeatures.StripEnumPrefix',
      '8': {
        '17': 1,
        '19': [6, 7, 1],
        '20': [
          {'2': 'STRIP_ENUM_PREFIX_KEEP', '3': 900},
        ],
        '22': {'1': 1001},
      },
      '10': 'stripEnumPrefix',
    },
  ],
  '4': [GoFeatures_APILevel$json, GoFeatures_StripEnumPrefix$json],
};

@$core.Deprecated('Use goFeaturesDescriptor instead')
const GoFeatures_APILevel$json = {
  '1': 'APILevel',
  '2': [
    {'1': 'API_LEVEL_UNSPECIFIED', '2': 0},
    {'1': 'API_OPEN', '2': 1},
    {'1': 'API_HYBRID', '2': 2},
    {'1': 'API_OPAQUE', '2': 3},
  ],
};

@$core.Deprecated('Use goFeaturesDescriptor instead')
const GoFeatures_StripEnumPrefix$json = {
  '1': 'StripEnumPrefix',
  '2': [
    {'1': 'STRIP_ENUM_PREFIX_UNSPECIFIED', '2': 0},
    {'1': 'STRIP_ENUM_PREFIX_KEEP', '2': 1},
    {'1': 'STRIP_ENUM_PREFIX_GENERATE_BOTH', '2': 2},
    {'1': 'STRIP_ENUM_PREFIX_STRIP', '2': 3},
  ],
};

/// Descriptor for `GoFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List goFeaturesDescriptor = $convert.base64Decode(
    'CgpHb0ZlYXR1cmVzEr4BChpsZWdhY3lfdW5tYXJzaGFsX2pzb25fZW51bRgBIAEoCEKAAYgBAZ'
    'gBBpgBAaIBCRIEdHJ1ZRiEB6IBChIFZmFsc2UY5weyAVsI6AcQ6AcaU1RoZSBsZWdhY3kgVW5t'
    'YXJzaGFsSlNPTiBBUEkgaXMgZGVwcmVjYXRlZCBhbmQgd2lsbCBiZSByZW1vdmVkIGluIGEgZn'
    'V0dXJlIGVkaXRpb24uUhdsZWdhY3lVbm1hcnNoYWxKc29uRW51bRJ0CglhcGlfbGV2ZWwYAiAB'
    'KA4yFy5wYi5Hb0ZlYXR1cmVzLkFQSUxldmVsQj6IAQGYAQOYAQGiARoSFUFQSV9MRVZFTF9VTl'
    'NQRUNJRklFRBiEB6IBDxIKQVBJX09QQVFVRRjpB7IBAwjoB1IIYXBpTGV2ZWwSfAoRc3RyaXBf'
    'ZW51bV9wcmVmaXgYAyABKA4yHi5wYi5Hb0ZlYXR1cmVzLlN0cmlwRW51bVByZWZpeEIwiAEBmA'
    'EGmAEHmAEBogEbEhZTVFJJUF9FTlVNX1BSRUZJWF9LRUVQGIQHsgEDCOkHUg9zdHJpcEVudW1Q'
    'cmVmaXgiUwoIQVBJTGV2ZWwSGQoVQVBJX0xFVkVMX1VOU1BFQ0lGSUVEEAASDAoIQVBJX09QRU'
    '4QARIOCgpBUElfSFlCUklEEAISDgoKQVBJX09QQVFVRRADIpIBCg9TdHJpcEVudW1QcmVmaXgS'
    'IQodU1RSSVBfRU5VTV9QUkVGSVhfVU5TUEVDSUZJRUQQABIaChZTVFJJUF9FTlVNX1BSRUZJWF'
    '9LRUVQEAESIwofU1RSSVBfRU5VTV9QUkVGSVhfR0VORVJBVEVfQk9USBACEhsKF1NUUklQX0VO'
    'VU1fUFJFRklYX1NUUklQEAM=');
