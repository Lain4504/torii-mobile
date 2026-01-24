// This is a generated file - do not edit.
//
// Generated from wajlc_room_artifacts.proto.

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

@$core.Deprecated('Use roomArtifactTypeDescriptor instead')
const RoomArtifactType$json = {
  '1': 'RoomArtifactType',
  '2': [
    {'1': 'UNKNOWN_ARTIFACT', '2': 0},
    {'1': 'MEETING_ANALYTICS', '2': 1},
    {'1': 'MEETING_SUMMARY', '2': 2},
    {'1': 'MEETING_SUMMARY_USAGE', '2': 3},
    {'1': 'SPEECH_TRANSCRIPTION', '2': 4},
    {'1': 'SPEECH_TRANSCRIPTION_USAGE', '2': 5},
    {'1': 'SYNTHESIZED_SPEECH_USAGE', '2': 6},
    {'1': 'CHAT_TRANSLATION_USAGE', '2': 7},
    {'1': 'AI_TEXT_CHAT_INTERACTION_USAGE', '2': 8},
    {'1': 'AI_TEXT_CHAT_SUMMARIZATION_USAGE', '2': 9},
  ],
};

/// Descriptor for `RoomArtifactType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roomArtifactTypeDescriptor = $convert.base64Decode(
    'ChBSb29tQXJ0aWZhY3RUeXBlEhQKEFVOS05PV05fQVJUSUZBQ1QQABIVChFNRUVUSU5HX0FOQU'
    'xZVElDUxABEhMKD01FRVRJTkdfU1VNTUFSWRACEhkKFU1FRVRJTkdfU1VNTUFSWV9VU0FHRRAD'
    'EhgKFFNQRUVDSF9UUkFOU0NSSVBUSU9OEAQSHgoaU1BFRUNIX1RSQU5TQ1JJUFRJT05fVVNBR0'
    'UQBRIcChhTWU5USEVTSVpFRF9TUEVFQ0hfVVNBR0UQBhIaChZDSEFUX1RSQU5TTEFUSU9OX1VT'
    'QUdFEAcSIgoeQUlfVEVYVF9DSEFUX0lOVEVSQUNUSU9OX1VTQUdFEAgSJAogQUlfVEVYVF9DSE'
    'FUX1NVTU1BUklaQVRJT05fVVNBR0UQCQ==');

@$core.Deprecated('Use roomArtifactFileInfoDescriptor instead')
const RoomArtifactFileInfo$json = {
  '1': 'RoomArtifactFileInfo',
  '2': [
    {'1': 'file_path', '3': 1, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'file_size', '3': 2, '4': 1, '5': 3, '10': 'fileSize'},
    {'1': 'mime_type', '3': 3, '4': 1, '5': 9, '10': 'mimeType'},
  ],
};

/// Descriptor for `RoomArtifactFileInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomArtifactFileInfoDescriptor = $convert.base64Decode(
    'ChRSb29tQXJ0aWZhY3RGaWxlSW5mbxIbCglmaWxlX3BhdGgYASABKAlSCGZpbGVQYXRoEhsKCW'
    'ZpbGVfc2l6ZRgCIAEoA1IIZmlsZVNpemUSGwoJbWltZV90eXBlGAMgASgJUghtaW1lVHlwZQ==');

@$core.Deprecated('Use roomArtifactProviderJobInfoDescriptor instead')
const RoomArtifactProviderJobInfo$json = {
  '1': 'RoomArtifactProviderJobInfo',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'file_name', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
  ],
};

/// Descriptor for `RoomArtifactProviderJobInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomArtifactProviderJobInfoDescriptor =
    $convert.base64Decode(
        'ChtSb29tQXJ0aWZhY3RQcm92aWRlckpvYkluZm8SFQoGam9iX2lkGAEgASgJUgVqb2JJZBIbCg'
        'lmaWxlX25hbWUYAiABKAlSCGZpbGVOYW1l');

@$core.Deprecated('Use roomArtifactUserInfoDescriptor instead')
const RoomArtifactUserInfo$json = {
  '1': 'RoomArtifactUserInfo',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
  ],
  '8': [
    {'1': '_name'},
  ],
};

/// Descriptor for `RoomArtifactUserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomArtifactUserInfoDescriptor = $convert.base64Decode(
    'ChRSb29tQXJ0aWZhY3RVc2VySW5mbxIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSFwoEbmFtZR'
    'gCIAEoCUgAUgRuYW1liAEBQgcKBV9uYW1l');

@$core.Deprecated('Use roomArtifactTokenUsageDescriptor instead')
const RoomArtifactTokenUsage$json = {
  '1': 'RoomArtifactTokenUsage',
  '2': [
    {'1': 'prompt_tokens', '3': 1, '4': 1, '5': 13, '10': 'promptTokens'},
    {
      '1': 'completion_tokens',
      '3': 2,
      '4': 1,
      '5': 13,
      '10': 'completionTokens'
    },
    {'1': 'total_tokens', '3': 3, '4': 1, '5': 13, '10': 'totalTokens'},
    {
      '1': 'breakdown',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.wajlc.RoomArtifactTokenUsage.BreakdownEntry',
      '10': 'breakdown'
    },
    {
      '1': 'prompt_tokens_estimated_cost',
      '3': 5,
      '4': 1,
      '5': 1,
      '9': 0,
      '10': 'promptTokensEstimatedCost',
      '17': true
    },
    {
      '1': 'completion_tokens_estimated_cost',
      '3': 6,
      '4': 1,
      '5': 1,
      '9': 1,
      '10': 'completionTokensEstimatedCost',
      '17': true
    },
    {
      '1': 'total_tokens_estimated_cost',
      '3': 7,
      '4': 1,
      '5': 1,
      '9': 2,
      '10': 'totalTokensEstimatedCost',
      '17': true
    },
  ],
  '3': [RoomArtifactTokenUsage_BreakdownEntry$json],
  '8': [
    {'1': '_prompt_tokens_estimated_cost'},
    {'1': '_completion_tokens_estimated_cost'},
    {'1': '_total_tokens_estimated_cost'},
  ],
};

@$core.Deprecated('Use roomArtifactTokenUsageDescriptor instead')
const RoomArtifactTokenUsage_BreakdownEntry$json = {
  '1': 'BreakdownEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RoomArtifactTokenUsage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomArtifactTokenUsageDescriptor = $convert.base64Decode(
    'ChZSb29tQXJ0aWZhY3RUb2tlblVzYWdlEiMKDXByb21wdF90b2tlbnMYASABKA1SDHByb21wdF'
    'Rva2VucxIrChFjb21wbGV0aW9uX3Rva2VucxgCIAEoDVIQY29tcGxldGlvblRva2VucxIhCgx0'
    'b3RhbF90b2tlbnMYAyABKA1SC3RvdGFsVG9rZW5zEkoKCWJyZWFrZG93bhgEIAMoCzIsLndham'
    'xjLlJvb21BcnRpZmFjdFRva2VuVXNhZ2UuQnJlYWtkb3duRW50cnlSCWJyZWFrZG93bhJEChxw'
    'cm9tcHRfdG9rZW5zX2VzdGltYXRlZF9jb3N0GAUgASgBSABSGXByb21wdFRva2Vuc0VzdGltYX'
    'RlZENvc3SIAQESTAogY29tcGxldGlvbl90b2tlbnNfZXN0aW1hdGVkX2Nvc3QYBiABKAFIAVId'
    'Y29tcGxldGlvblRva2Vuc0VzdGltYXRlZENvc3SIAQESQgobdG90YWxfdG9rZW5zX2VzdGltYX'
    'RlZF9jb3N0GAcgASgBSAJSGHRvdGFsVG9rZW5zRXN0aW1hdGVkQ29zdIgBARo8Cg5CcmVha2Rv'
    'd25FbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoA1IFdmFsdWU6AjgBQh8KHV'
    '9wcm9tcHRfdG9rZW5zX2VzdGltYXRlZF9jb3N0QiMKIV9jb21wbGV0aW9uX3Rva2Vuc19lc3Rp'
    'bWF0ZWRfY29zdEIeChxfdG90YWxfdG9rZW5zX2VzdGltYXRlZF9jb3N0');

@$core.Deprecated('Use roomArtifactDurationUsageDescriptor instead')
const RoomArtifactDurationUsage$json = {
  '1': 'RoomArtifactDurationUsage',
  '2': [
    {'1': 'duration_sec', '3': 1, '4': 1, '5': 13, '10': 'durationSec'},
    {
      '1': 'breakdown',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.wajlc.RoomArtifactDurationUsage.BreakdownEntry',
      '10': 'breakdown'
    },
    {
      '1': 'duration_sec_estimated_cost',
      '3': 3,
      '4': 1,
      '5': 1,
      '9': 0,
      '10': 'durationSecEstimatedCost',
      '17': true
    },
  ],
  '3': [RoomArtifactDurationUsage_BreakdownEntry$json],
  '8': [
    {'1': '_duration_sec_estimated_cost'},
  ],
};

@$core.Deprecated('Use roomArtifactDurationUsageDescriptor instead')
const RoomArtifactDurationUsage_BreakdownEntry$json = {
  '1': 'BreakdownEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RoomArtifactDurationUsage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomArtifactDurationUsageDescriptor = $convert.base64Decode(
    'ChlSb29tQXJ0aWZhY3REdXJhdGlvblVzYWdlEiEKDGR1cmF0aW9uX3NlYxgBIAEoDVILZHVyYX'
    'Rpb25TZWMSTQoJYnJlYWtkb3duGAIgAygLMi8ud2FqbGMuUm9vbUFydGlmYWN0RHVyYXRpb25V'
    'c2FnZS5CcmVha2Rvd25FbnRyeVIJYnJlYWtkb3duEkIKG2R1cmF0aW9uX3NlY19lc3RpbWF0ZW'
    'RfY29zdBgDIAEoAUgAUhhkdXJhdGlvblNlY0VzdGltYXRlZENvc3SIAQEaPAoOQnJlYWtkb3du'
    'RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKANSBXZhbHVlOgI4AUIeChxfZH'
    'VyYXRpb25fc2VjX2VzdGltYXRlZF9jb3N0');

@$core.Deprecated('Use roomArtifactCharacterCountUsageDescriptor instead')
const RoomArtifactCharacterCountUsage$json = {
  '1': 'RoomArtifactCharacterCountUsage',
  '2': [
    {'1': 'total_characters', '3': 1, '4': 1, '5': 13, '10': 'totalCharacters'},
    {
      '1': 'breakdown',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.wajlc.RoomArtifactCharacterCountUsage.BreakdownEntry',
      '10': 'breakdown'
    },
    {
      '1': 'total_characters_estimated_cost',
      '3': 3,
      '4': 1,
      '5': 1,
      '9': 0,
      '10': 'totalCharactersEstimatedCost',
      '17': true
    },
  ],
  '3': [RoomArtifactCharacterCountUsage_BreakdownEntry$json],
  '8': [
    {'1': '_total_characters_estimated_cost'},
  ],
};

@$core.Deprecated('Use roomArtifactCharacterCountUsageDescriptor instead')
const RoomArtifactCharacterCountUsage_BreakdownEntry$json = {
  '1': 'BreakdownEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RoomArtifactCharacterCountUsage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomArtifactCharacterCountUsageDescriptor = $convert.base64Decode(
    'Ch9Sb29tQXJ0aWZhY3RDaGFyYWN0ZXJDb3VudFVzYWdlEikKEHRvdGFsX2NoYXJhY3RlcnMYAS'
    'ABKA1SD3RvdGFsQ2hhcmFjdGVycxJTCglicmVha2Rvd24YAiADKAsyNS53YWpsYy5Sb29tQXJ0'
    'aWZhY3RDaGFyYWN0ZXJDb3VudFVzYWdlLkJyZWFrZG93bkVudHJ5UglicmVha2Rvd24SSgofdG'
    '90YWxfY2hhcmFjdGVyc19lc3RpbWF0ZWRfY29zdBgDIAEoAUgAUhx0b3RhbENoYXJhY3RlcnNF'
    'c3RpbWF0ZWRDb3N0iAEBGjwKDkJyZWFrZG93bkVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBX'
    'ZhbHVlGAIgASgDUgV2YWx1ZToCOAFCIgogX3RvdGFsX2NoYXJhY3RlcnNfZXN0aW1hdGVkX2Nv'
    'c3Q=');

@$core.Deprecated('Use roomArtifactMetadataDescriptor instead')
const RoomArtifactMetadata$json = {
  '1': 'RoomArtifactMetadata',
  '2': [
    {
      '1': 'user_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RoomArtifactUserInfo',
      '10': 'userInfo'
    },
    {
      '1': 'provider_job_info',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RoomArtifactProviderJobInfo',
      '10': 'providerJobInfo'
    },
    {
      '1': 'file_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RoomArtifactFileInfo',
      '10': 'fileInfo'
    },
    {
      '1': 'token_usage',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RoomArtifactTokenUsage',
      '9': 0,
      '10': 'tokenUsage'
    },
    {
      '1': 'duration_usage',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RoomArtifactDurationUsage',
      '9': 0,
      '10': 'durationUsage'
    },
    {
      '1': 'character_count_usage',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RoomArtifactCharacterCountUsage',
      '9': 0,
      '10': 'characterCountUsage'
    },
    {
      '1': 'reference_artifact_id',
      '3': 10,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'referenceArtifactId',
      '17': true
    },
  ],
  '8': [
    {'1': 'usage_details'},
    {'1': '_reference_artifact_id'},
  ],
};

/// Descriptor for `RoomArtifactMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomArtifactMetadataDescriptor = $convert.base64Decode(
    'ChRSb29tQXJ0aWZhY3RNZXRhZGF0YRI4Cgl1c2VyX2luZm8YASABKAsyGy53YWpsYy5Sb29tQX'
    'J0aWZhY3RVc2VySW5mb1IIdXNlckluZm8STgoRcHJvdmlkZXJfam9iX2luZm8YAiABKAsyIi53'
    'YWpsYy5Sb29tQXJ0aWZhY3RQcm92aWRlckpvYkluZm9SD3Byb3ZpZGVySm9iSW5mbxI4CglmaW'
    'xlX2luZm8YAyABKAsyGy53YWpsYy5Sb29tQXJ0aWZhY3RGaWxlSW5mb1IIZmlsZUluZm8SQAoL'
    'dG9rZW5fdXNhZ2UYBCABKAsyHS53YWpsYy5Sb29tQXJ0aWZhY3RUb2tlblVzYWdlSABSCnRva2'
    'VuVXNhZ2USSQoOZHVyYXRpb25fdXNhZ2UYBSABKAsyIC53YWpsYy5Sb29tQXJ0aWZhY3REdXJh'
    'dGlvblVzYWdlSABSDWR1cmF0aW9uVXNhZ2USXAoVY2hhcmFjdGVyX2NvdW50X3VzYWdlGAYgAS'
    'gLMiYud2FqbGMuUm9vbUFydGlmYWN0Q2hhcmFjdGVyQ291bnRVc2FnZUgAUhNjaGFyYWN0ZXJD'
    'b3VudFVzYWdlEjcKFXJlZmVyZW5jZV9hcnRpZmFjdF9pZBgKIAEoCUgBUhNyZWZlcmVuY2VBcn'
    'RpZmFjdElkiAEBQg8KDXVzYWdlX2RldGFpbHNCGAoWX3JlZmVyZW5jZV9hcnRpZmFjdF9pZA==');

@$core.Deprecated('Use roomArtifactWebhookEventDescriptor instead')
const RoomArtifactWebhookEvent$json = {
  '1': 'RoomArtifactWebhookEvent',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.wajlc.RoomArtifactType',
      '10': 'type'
    },
    {'1': 'artifact_id', '3': 2, '4': 1, '5': 9, '10': 'artifactId'},
    {
      '1': 'metadata',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RoomArtifactMetadata',
      '10': 'metadata'
    },
  ],
};

/// Descriptor for `RoomArtifactWebhookEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomArtifactWebhookEventDescriptor = $convert.base64Decode(
    'ChhSb29tQXJ0aWZhY3RXZWJob29rRXZlbnQSKwoEdHlwZRgBIAEoDjIXLndhamxjLlJvb21Bcn'
    'RpZmFjdFR5cGVSBHR5cGUSHwoLYXJ0aWZhY3RfaWQYAiABKAlSCmFydGlmYWN0SWQSNwoIbWV0'
    'YWRhdGEYAyABKAsyGy53YWpsYy5Sb29tQXJ0aWZhY3RNZXRhZGF0YVIIbWV0YWRhdGE=');
