// This is a generated file - do not edit.
//
// Generated from livekit_agent_dispatch.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'livekit_agent.pbjson.dart' as $0;
import 'livekit_models.pbjson.dart' as $1;

@$core.Deprecated('Use createAgentDispatchRequestDescriptor instead')
const CreateAgentDispatchRequest$json = {
  '1': 'CreateAgentDispatchRequest',
  '2': [
    {'1': 'agent_name', '3': 1, '4': 1, '5': 9, '10': 'agentName'},
    {'1': 'room', '3': 2, '4': 1, '5': 9, '10': 'room'},
    {'1': 'metadata', '3': 3, '4': 1, '5': 9, '10': 'metadata'},
  ],
};

/// Descriptor for `CreateAgentDispatchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAgentDispatchRequestDescriptor =
    $convert.base64Decode(
        'ChpDcmVhdGVBZ2VudERpc3BhdGNoUmVxdWVzdBIdCgphZ2VudF9uYW1lGAEgASgJUglhZ2VudE'
        '5hbWUSEgoEcm9vbRgCIAEoCVIEcm9vbRIaCghtZXRhZGF0YRgDIAEoCVIIbWV0YWRhdGE=');

@$core.Deprecated('Use roomAgentDispatchDescriptor instead')
const RoomAgentDispatch$json = {
  '1': 'RoomAgentDispatch',
  '2': [
    {'1': 'agent_name', '3': 1, '4': 1, '5': 9, '10': 'agentName'},
    {'1': 'metadata', '3': 2, '4': 1, '5': 9, '10': 'metadata'},
  ],
};

/// Descriptor for `RoomAgentDispatch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomAgentDispatchDescriptor = $convert.base64Decode(
    'ChFSb29tQWdlbnREaXNwYXRjaBIdCgphZ2VudF9uYW1lGAEgASgJUglhZ2VudE5hbWUSGgoIbW'
    'V0YWRhdGEYAiABKAlSCG1ldGFkYXRh');

@$core.Deprecated('Use deleteAgentDispatchRequestDescriptor instead')
const DeleteAgentDispatchRequest$json = {
  '1': 'DeleteAgentDispatchRequest',
  '2': [
    {'1': 'dispatch_id', '3': 1, '4': 1, '5': 9, '10': 'dispatchId'},
    {'1': 'room', '3': 2, '4': 1, '5': 9, '10': 'room'},
  ],
};

/// Descriptor for `DeleteAgentDispatchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAgentDispatchRequestDescriptor =
    $convert.base64Decode(
        'ChpEZWxldGVBZ2VudERpc3BhdGNoUmVxdWVzdBIfCgtkaXNwYXRjaF9pZBgBIAEoCVIKZGlzcG'
        'F0Y2hJZBISCgRyb29tGAIgASgJUgRyb29t');

@$core.Deprecated('Use listAgentDispatchRequestDescriptor instead')
const ListAgentDispatchRequest$json = {
  '1': 'ListAgentDispatchRequest',
  '2': [
    {'1': 'dispatch_id', '3': 1, '4': 1, '5': 9, '10': 'dispatchId'},
    {'1': 'room', '3': 2, '4': 1, '5': 9, '10': 'room'},
  ],
};

/// Descriptor for `ListAgentDispatchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAgentDispatchRequestDescriptor =
    $convert.base64Decode(
        'ChhMaXN0QWdlbnREaXNwYXRjaFJlcXVlc3QSHwoLZGlzcGF0Y2hfaWQYASABKAlSCmRpc3BhdG'
        'NoSWQSEgoEcm9vbRgCIAEoCVIEcm9vbQ==');

@$core.Deprecated('Use listAgentDispatchResponseDescriptor instead')
const ListAgentDispatchResponse$json = {
  '1': 'ListAgentDispatchResponse',
  '2': [
    {
      '1': 'agent_dispatches',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.livekit.AgentDispatch',
      '10': 'agentDispatches'
    },
  ],
};

/// Descriptor for `ListAgentDispatchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAgentDispatchResponseDescriptor =
    $convert.base64Decode(
        'ChlMaXN0QWdlbnREaXNwYXRjaFJlc3BvbnNlEkEKEGFnZW50X2Rpc3BhdGNoZXMYASADKAsyFi'
        '5saXZla2l0LkFnZW50RGlzcGF0Y2hSD2FnZW50RGlzcGF0Y2hlcw==');

@$core.Deprecated('Use agentDispatchDescriptor instead')
const AgentDispatch$json = {
  '1': 'AgentDispatch',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'agent_name', '3': 2, '4': 1, '5': 9, '10': 'agentName'},
    {'1': 'room', '3': 3, '4': 1, '5': 9, '10': 'room'},
    {'1': 'metadata', '3': 4, '4': 1, '5': 9, '10': 'metadata'},
    {
      '1': 'state',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.livekit.AgentDispatchState',
      '10': 'state'
    },
  ],
};

/// Descriptor for `AgentDispatch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List agentDispatchDescriptor = $convert.base64Decode(
    'Cg1BZ2VudERpc3BhdGNoEg4KAmlkGAEgASgJUgJpZBIdCgphZ2VudF9uYW1lGAIgASgJUglhZ2'
    'VudE5hbWUSEgoEcm9vbRgDIAEoCVIEcm9vbRIaCghtZXRhZGF0YRgEIAEoCVIIbWV0YWRhdGES'
    'MQoFc3RhdGUYBSABKAsyGy5saXZla2l0LkFnZW50RGlzcGF0Y2hTdGF0ZVIFc3RhdGU=');

@$core.Deprecated('Use agentDispatchStateDescriptor instead')
const AgentDispatchState$json = {
  '1': 'AgentDispatchState',
  '2': [
    {'1': 'jobs', '3': 1, '4': 3, '5': 11, '6': '.livekit.Job', '10': 'jobs'},
    {'1': 'created_at', '3': 2, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'deleted_at', '3': 3, '4': 1, '5': 3, '10': 'deletedAt'},
  ],
};

/// Descriptor for `AgentDispatchState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List agentDispatchStateDescriptor = $convert.base64Decode(
    'ChJBZ2VudERpc3BhdGNoU3RhdGUSIAoEam9icxgBIAMoCzIMLmxpdmVraXQuSm9iUgRqb2JzEh'
    '0KCmNyZWF0ZWRfYXQYAiABKANSCWNyZWF0ZWRBdBIdCgpkZWxldGVkX2F0GAMgASgDUglkZWxl'
    'dGVkQXQ=');

const $core.Map<$core.String, $core.dynamic> AgentDispatchServiceBase$json = {
  '1': 'AgentDispatchService',
  '2': [
    {
      '1': 'CreateDispatch',
      '2': '.livekit.CreateAgentDispatchRequest',
      '3': '.livekit.AgentDispatch'
    },
    {
      '1': 'DeleteDispatch',
      '2': '.livekit.DeleteAgentDispatchRequest',
      '3': '.livekit.AgentDispatch'
    },
    {
      '1': 'ListDispatch',
      '2': '.livekit.ListAgentDispatchRequest',
      '3': '.livekit.ListAgentDispatchResponse'
    },
  ],
};

@$core.Deprecated('Use agentDispatchServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    AgentDispatchServiceBase$messageJson = {
  '.livekit.CreateAgentDispatchRequest': CreateAgentDispatchRequest$json,
  '.livekit.AgentDispatch': AgentDispatch$json,
  '.livekit.AgentDispatchState': AgentDispatchState$json,
  '.livekit.Job': $0.Job$json,
  '.livekit.Room': $1.Room$json,
  '.livekit.Codec': $1.Codec$json,
  '.livekit.TimedVersion': $1.TimedVersion$json,
  '.livekit.ParticipantInfo': $1.ParticipantInfo$json,
  '.livekit.TrackInfo': $1.TrackInfo$json,
  '.livekit.VideoLayer': $1.VideoLayer$json,
  '.livekit.SimulcastCodecInfo': $1.SimulcastCodecInfo$json,
  '.livekit.ParticipantPermission': $1.ParticipantPermission$json,
  '.livekit.ParticipantInfo.AttributesEntry':
      $1.ParticipantInfo_AttributesEntry$json,
  '.livekit.DataTrackInfo': $1.DataTrackInfo$json,
  '.livekit.JobState': $0.JobState$json,
  '.livekit.DeleteAgentDispatchRequest': DeleteAgentDispatchRequest$json,
  '.livekit.ListAgentDispatchRequest': ListAgentDispatchRequest$json,
  '.livekit.ListAgentDispatchResponse': ListAgentDispatchResponse$json,
};

/// Descriptor for `AgentDispatchService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List agentDispatchServiceDescriptor = $convert.base64Decode(
    'ChRBZ2VudERpc3BhdGNoU2VydmljZRJNCg5DcmVhdGVEaXNwYXRjaBIjLmxpdmVraXQuQ3JlYX'
    'RlQWdlbnREaXNwYXRjaFJlcXVlc3QaFi5saXZla2l0LkFnZW50RGlzcGF0Y2gSTQoORGVsZXRl'
    'RGlzcGF0Y2gSIy5saXZla2l0LkRlbGV0ZUFnZW50RGlzcGF0Y2hSZXF1ZXN0GhYubGl2ZWtpdC'
    '5BZ2VudERpc3BhdGNoElUKDExpc3REaXNwYXRjaBIhLmxpdmVraXQuTGlzdEFnZW50RGlzcGF0'
    'Y2hSZXF1ZXN0GiIubGl2ZWtpdC5MaXN0QWdlbnREaXNwYXRjaFJlc3BvbnNl');
