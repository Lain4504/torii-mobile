// This is a generated file - do not edit.
//
// Generated from wajlc_polls.proto.

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

@$core.Deprecated('Use activatePollsReqDescriptor instead')
const ActivatePollsReq$json = {
  '1': 'ActivatePollsReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'is_active', '3': 2, '4': 1, '5': 8, '10': 'isActive'},
  ],
};

/// Descriptor for `ActivatePollsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activatePollsReqDescriptor = $convert.base64Decode(
    'ChBBY3RpdmF0ZVBvbGxzUmVxEhcKB3Jvb21faWQYASABKAlSBnJvb21JZBIbCglpc19hY3Rpdm'
    'UYAiABKAhSCGlzQWN0aXZl');

@$core.Deprecated('Use createPollReqDescriptor instead')
const CreatePollReq$json = {
  '1': 'CreatePollReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'poll_id', '3': 3, '4': 1, '5': 9, '10': 'pollId'},
    {'1': 'question', '3': 4, '4': 1, '5': 9, '10': 'question'},
    {
      '1': 'options',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.wajlc.CreatePollOptions',
      '10': 'options'
    },
  ],
};

/// Descriptor for `CreatePollReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPollReqDescriptor = $convert.base64Decode(
    'Cg1DcmVhdGVQb2xsUmVxEhcKB3Jvb21faWQYASABKAlSBnJvb21JZBIXCgd1c2VyX2lkGAIgAS'
    'gJUgZ1c2VySWQSFwoHcG9sbF9pZBgDIAEoCVIGcG9sbElkEhoKCHF1ZXN0aW9uGAQgASgJUghx'
    'dWVzdGlvbhIyCgdvcHRpb25zGAUgAygLMhgud2FqbGMuQ3JlYXRlUG9sbE9wdGlvbnNSB29wdG'
    'lvbnM=');

@$core.Deprecated('Use createPollOptionsDescriptor instead')
const CreatePollOptions$json = {
  '1': 'CreatePollOptions',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `CreatePollOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPollOptionsDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVQb2xsT3B0aW9ucxIOCgJpZBgBIAEoDVICaWQSEgoEdGV4dBgCIAEoCVIEdGV4dA'
    '==');

@$core.Deprecated('Use pollInfoDescriptor instead')
const PollInfo$json = {
  '1': 'PollInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'question', '3': 3, '4': 1, '5': 9, '10': 'question'},
    {
      '1': 'options',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.wajlc.CreatePollOptions',
      '10': 'options'
    },
    {'1': 'is_running', '3': 5, '4': 1, '5': 8, '10': 'isRunning'},
    {'1': 'created', '3': 6, '4': 1, '5': 3, '10': 'created'},
    {'1': 'created_by', '3': 7, '4': 1, '5': 9, '10': 'createdBy'},
    {'1': 'closed_by', '3': 8, '4': 1, '5': 9, '10': 'closedBy'},
  ],
};

/// Descriptor for `PollInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pollInfoDescriptor = $convert.base64Decode(
    'CghQb2xsSW5mbxIOCgJpZBgBIAEoCVICaWQSFwoHcm9vbV9pZBgCIAEoCVIGcm9vbUlkEhoKCH'
    'F1ZXN0aW9uGAMgASgJUghxdWVzdGlvbhIyCgdvcHRpb25zGAQgAygLMhgud2FqbGMuQ3JlYXRl'
    'UG9sbE9wdGlvbnNSB29wdGlvbnMSHQoKaXNfcnVubmluZxgFIAEoCFIJaXNSdW5uaW5nEhgKB2'
    'NyZWF0ZWQYBiABKANSB2NyZWF0ZWQSHQoKY3JlYXRlZF9ieRgHIAEoCVIJY3JlYXRlZEJ5EhsK'
    'CWNsb3NlZF9ieRgIIAEoCVIIY2xvc2VkQnk=');

@$core.Deprecated('Use submitPollResponseReqDescriptor instead')
const SubmitPollResponseReq$json = {
  '1': 'SubmitPollResponseReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'poll_id', '3': 4, '4': 1, '5': 9, '10': 'pollId'},
    {'1': 'selected_option', '3': 5, '4': 1, '5': 4, '10': 'selectedOption'},
  ],
};

/// Descriptor for `SubmitPollResponseReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitPollResponseReqDescriptor = $convert.base64Decode(
    'ChVTdWJtaXRQb2xsUmVzcG9uc2VSZXESFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEhcKB3VzZX'
    'JfaWQYAiABKAlSBnVzZXJJZBISCgRuYW1lGAMgASgJUgRuYW1lEhcKB3BvbGxfaWQYBCABKAlS'
    'BnBvbGxJZBInCg9zZWxlY3RlZF9vcHRpb24YBSABKARSDnNlbGVjdGVkT3B0aW9u');

@$core.Deprecated('Use closePollReqDescriptor instead')
const ClosePollReq$json = {
  '1': 'ClosePollReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'poll_id', '3': 3, '4': 1, '5': 9, '10': 'pollId'},
  ],
};

/// Descriptor for `ClosePollReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List closePollReqDescriptor = $convert.base64Decode(
    'CgxDbG9zZVBvbGxSZXESFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEhcKB3VzZXJfaWQYAiABKA'
    'lSBnVzZXJJZBIXCgdwb2xsX2lkGAMgASgJUgZwb2xsSWQ=');

@$core.Deprecated('Use pollResponsesResultOptionsDescriptor instead')
const PollResponsesResultOptions$json = {
  '1': 'PollResponsesResultOptions',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    {'1': 'vote_count', '3': 3, '4': 1, '5': 4, '10': 'voteCount'},
  ],
};

/// Descriptor for `PollResponsesResultOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pollResponsesResultOptionsDescriptor =
    $convert.base64Decode(
        'ChpQb2xsUmVzcG9uc2VzUmVzdWx0T3B0aW9ucxIOCgJpZBgBIAEoBFICaWQSEgoEdGV4dBgCIA'
        'EoCVIEdGV4dBIdCgp2b3RlX2NvdW50GAMgASgEUgl2b3RlQ291bnQ=');

@$core.Deprecated('Use pollResponsesResultDescriptor instead')
const PollResponsesResult$json = {
  '1': 'PollResponsesResult',
  '2': [
    {'1': 'question', '3': 1, '4': 1, '5': 9, '10': 'question'},
    {'1': 'total_responses', '3': 2, '4': 1, '5': 4, '10': 'totalResponses'},
    {
      '1': 'options',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.wajlc.PollResponsesResultOptions',
      '10': 'options'
    },
  ],
};

/// Descriptor for `PollResponsesResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pollResponsesResultDescriptor = $convert.base64Decode(
    'ChNQb2xsUmVzcG9uc2VzUmVzdWx0EhoKCHF1ZXN0aW9uGAEgASgJUghxdWVzdGlvbhInCg90b3'
    'RhbF9yZXNwb25zZXMYAiABKARSDnRvdGFsUmVzcG9uc2VzEjsKB29wdGlvbnMYAyADKAsyIS53'
    'YWpsYy5Qb2xsUmVzcG9uc2VzUmVzdWx0T3B0aW9uc1IHb3B0aW9ucw==');

@$core.Deprecated('Use pollsStatsDescriptor instead')
const PollsStats$json = {
  '1': 'PollsStats',
  '2': [
    {'1': 'total_polls', '3': 1, '4': 1, '5': 4, '10': 'totalPolls'},
    {'1': 'total_running', '3': 2, '4': 1, '5': 4, '10': 'totalRunning'},
  ],
};

/// Descriptor for `PollsStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pollsStatsDescriptor = $convert.base64Decode(
    'CgpQb2xsc1N0YXRzEh8KC3RvdGFsX3BvbGxzGAEgASgEUgp0b3RhbFBvbGxzEiMKDXRvdGFsX3'
    'J1bm5pbmcYAiABKARSDHRvdGFsUnVubmluZw==');

@$core.Deprecated('Use pollResponseDescriptor instead')
const PollResponse$json = {
  '1': 'PollResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'poll_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'pollId',
      '17': true
    },
    {
      '1': 'total_responses',
      '3': 4,
      '4': 1,
      '5': 4,
      '9': 1,
      '10': 'totalResponses',
      '17': true
    },
    {'1': 'voted', '3': 5, '4': 1, '5': 4, '9': 2, '10': 'voted', '17': true},
    {
      '1': 'responses',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.wajlc.PollResponse.ResponsesEntry',
      '10': 'responses'
    },
    {
      '1': 'polls',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.wajlc.PollInfo',
      '10': 'polls'
    },
    {
      '1': 'stats',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.wajlc.PollsStats',
      '9': 3,
      '10': 'stats',
      '17': true
    },
    {
      '1': 'total_polls',
      '3': 9,
      '4': 1,
      '5': 4,
      '9': 4,
      '10': 'totalPolls',
      '17': true
    },
    {
      '1': 'total_running',
      '3': 10,
      '4': 1,
      '5': 4,
      '9': 5,
      '10': 'totalRunning',
      '17': true
    },
    {
      '1': 'poll_responses_result',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.wajlc.PollResponsesResult',
      '9': 6,
      '10': 'pollResponsesResult',
      '17': true
    },
  ],
  '3': [PollResponse_ResponsesEntry$json],
  '8': [
    {'1': '_poll_id'},
    {'1': '_total_responses'},
    {'1': '_voted'},
    {'1': '_stats'},
    {'1': '_total_polls'},
    {'1': '_total_running'},
    {'1': '_poll_responses_result'},
  ],
};

@$core.Deprecated('Use pollResponseDescriptor instead')
const PollResponse_ResponsesEntry$json = {
  '1': 'ResponsesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `PollResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pollResponseDescriptor = $convert.base64Decode(
    'CgxQb2xsUmVzcG9uc2USFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSEAoDbXNnGAIgASgJUgNtc2'
    'cSHAoHcG9sbF9pZBgDIAEoCUgAUgZwb2xsSWSIAQESLAoPdG90YWxfcmVzcG9uc2VzGAQgASgE'
    'SAFSDnRvdGFsUmVzcG9uc2VziAEBEhkKBXZvdGVkGAUgASgESAJSBXZvdGVkiAEBEkAKCXJlc3'
    'BvbnNlcxgGIAMoCzIiLndhamxjLlBvbGxSZXNwb25zZS5SZXNwb25zZXNFbnRyeVIJcmVzcG9u'
    'c2VzEiUKBXBvbGxzGAcgAygLMg8ud2FqbGMuUG9sbEluZm9SBXBvbGxzEiwKBXN0YXRzGAggAS'
    'gLMhEud2FqbGMuUG9sbHNTdGF0c0gDUgVzdGF0c4gBARIkCgt0b3RhbF9wb2xscxgJIAEoBEgE'
    'Ugp0b3RhbFBvbGxziAEBEigKDXRvdGFsX3J1bm5pbmcYCiABKARIBVIMdG90YWxSdW5uaW5niA'
    'EBElMKFXBvbGxfcmVzcG9uc2VzX3Jlc3VsdBgLIAEoCzIaLndhamxjLlBvbGxSZXNwb25zZXNS'
    'ZXN1bHRIBlITcG9sbFJlc3BvbnNlc1Jlc3VsdIgBARo8Cg5SZXNwb25zZXNFbnRyeRIQCgNrZX'
    'kYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBQgoKCF9wb2xsX2lkQhIKEF90'
    'b3RhbF9yZXNwb25zZXNCCAoGX3ZvdGVkQggKBl9zdGF0c0IOCgxfdG90YWxfcG9sbHNCEAoOX3'
    'RvdGFsX3J1bm5pbmdCGAoWX3BvbGxfcmVzcG9uc2VzX3Jlc3VsdA==');
