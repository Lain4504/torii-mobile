//
//  Generated code. Do not modify.
//  source: livekit_cloud_agent.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'google/protobuf/timestamp.pbjson.dart' as $0;

@$core.Deprecated('Use agentSecretKindDescriptor instead')
const AgentSecretKind$json = {
  '1': 'AgentSecretKind',
  '2': [
    {'1': 'AGENT_SECRET_KIND_UNKNOWN', '2': 0},
    {'1': 'AGENT_SECRET_KIND_ENVIRONMENT', '2': 1},
    {'1': 'AGENT_SECRET_KIND_FILE', '2': 2},
  ],
};

/// Descriptor for `AgentSecretKind`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List agentSecretKindDescriptor = $convert.base64Decode(
    'Cg9BZ2VudFNlY3JldEtpbmQSHQoZQUdFTlRfU0VDUkVUX0tJTkRfVU5LTk9XThAAEiEKHUFHRU'
    '5UX1NFQ1JFVF9LSU5EX0VOVklST05NRU5UEAESGgoWQUdFTlRfU0VDUkVUX0tJTkRfRklMRRAC');

@$core.Deprecated('Use agentSecretDescriptor instead')
const AgentSecret$json = {
  '1': 'AgentSecret',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
    {'1': 'created_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'kind', '3': 5, '4': 1, '5': 14, '6': '.livekit.AgentSecretKind', '10': 'kind'},
  ],
};

/// Descriptor for `AgentSecret`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List agentSecretDescriptor = $convert.base64Decode(
    'CgtBZ2VudFNlY3JldBISCgRuYW1lGAEgASgJUgRuYW1lEhQKBXZhbHVlGAIgASgMUgV2YWx1ZR'
    'I5CgpjcmVhdGVkX2F0GAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRl'
    'ZEF0EjkKCnVwZGF0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cG'
    'RhdGVkQXQSLAoEa2luZBgFIAEoDjIYLmxpdmVraXQuQWdlbnRTZWNyZXRLaW5kUgRraW5k');

@$core.Deprecated('Use createAgentRequestDescriptor instead')
const CreateAgentRequest$json = {
  '1': 'CreateAgentRequest',
  '2': [
    {
      '1': 'agent_name',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'agentName',
    },
    {'1': 'secrets', '3': 2, '4': 3, '5': 11, '6': '.livekit.AgentSecret', '10': 'secrets'},
    {
      '1': 'replicas',
      '3': 3,
      '4': 1,
      '5': 5,
      '8': {'3': true},
      '10': 'replicas',
    },
    {
      '1': 'max_replicas',
      '3': 4,
      '4': 1,
      '5': 5,
      '8': {'3': true},
      '10': 'maxReplicas',
    },
    {
      '1': 'cpu_req',
      '3': 5,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'cpuReq',
    },
    {'1': 'regions', '3': 6, '4': 3, '5': 9, '10': 'regions'},
  ],
};

/// Descriptor for `CreateAgentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAgentRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVBZ2VudFJlcXVlc3QSIQoKYWdlbnRfbmFtZRgBIAEoCUICGAFSCWFnZW50TmFtZR'
    'IuCgdzZWNyZXRzGAIgAygLMhQubGl2ZWtpdC5BZ2VudFNlY3JldFIHc2VjcmV0cxIeCghyZXBs'
    'aWNhcxgDIAEoBUICGAFSCHJlcGxpY2FzEiUKDG1heF9yZXBsaWNhcxgEIAEoBUICGAFSC21heF'
    'JlcGxpY2FzEhsKB2NwdV9yZXEYBSABKAlCAhgBUgZjcHVSZXESGAoHcmVnaW9ucxgGIAMoCVIH'
    'cmVnaW9ucw==');

@$core.Deprecated('Use createAgentResponseDescriptor instead')
const CreateAgentResponse$json = {
  '1': 'CreateAgentResponse',
  '2': [
    {'1': 'agent_id', '3': 1, '4': 1, '5': 9, '10': 'agentId'},
    {'1': 'agent_name', '3': 2, '4': 1, '5': 9, '10': 'agentName'},
    {'1': 'status', '3': 3, '4': 1, '5': 9, '10': 'status'},
    {'1': 'version', '3': 4, '4': 1, '5': 9, '10': 'version'},
    {'1': 'presigned_url', '3': 5, '4': 1, '5': 9, '10': 'presignedUrl'},
    {'1': 'tag', '3': 6, '4': 1, '5': 9, '10': 'tag'},
    {'1': 'server_regions', '3': 7, '4': 3, '5': 9, '10': 'serverRegions'},
    {'1': 'presigned_post_request', '3': 8, '4': 1, '5': 11, '6': '.livekit.PresignedPostRequest', '10': 'presignedPostRequest'},
  ],
};

/// Descriptor for `CreateAgentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAgentResponseDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVBZ2VudFJlc3BvbnNlEhkKCGFnZW50X2lkGAEgASgJUgdhZ2VudElkEh0KCmFnZW'
    '50X25hbWUYAiABKAlSCWFnZW50TmFtZRIWCgZzdGF0dXMYAyABKAlSBnN0YXR1cxIYCgd2ZXJz'
    'aW9uGAQgASgJUgd2ZXJzaW9uEiMKDXByZXNpZ25lZF91cmwYBSABKAlSDHByZXNpZ25lZFVybB'
    'IQCgN0YWcYBiABKAlSA3RhZxIlCg5zZXJ2ZXJfcmVnaW9ucxgHIAMoCVINc2VydmVyUmVnaW9u'
    'cxJTChZwcmVzaWduZWRfcG9zdF9yZXF1ZXN0GAggASgLMh0ubGl2ZWtpdC5QcmVzaWduZWRQb3'
    'N0UmVxdWVzdFIUcHJlc2lnbmVkUG9zdFJlcXVlc3Q=');

@$core.Deprecated('Use presignedPostRequestDescriptor instead')
const PresignedPostRequest$json = {
  '1': 'PresignedPostRequest',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'values', '3': 2, '4': 3, '5': 11, '6': '.livekit.PresignedPostRequest.ValuesEntry', '10': 'values'},
  ],
  '3': [PresignedPostRequest_ValuesEntry$json],
};

@$core.Deprecated('Use presignedPostRequestDescriptor instead')
const PresignedPostRequest_ValuesEntry$json = {
  '1': 'ValuesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `PresignedPostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List presignedPostRequestDescriptor = $convert.base64Decode(
    'ChRQcmVzaWduZWRQb3N0UmVxdWVzdBIQCgN1cmwYASABKAlSA3VybBJBCgZ2YWx1ZXMYAiADKA'
    'syKS5saXZla2l0LlByZXNpZ25lZFBvc3RSZXF1ZXN0LlZhbHVlc0VudHJ5UgZ2YWx1ZXMaOQoL'
    'VmFsdWVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ'
    '==');

@$core.Deprecated('Use agentDeploymentDescriptor instead')
const AgentDeployment$json = {
  '1': 'AgentDeployment',
  '2': [
    {'1': 'region', '3': 1, '4': 1, '5': 9, '10': 'region'},
    {'1': 'agent_id', '3': 2, '4': 1, '5': 9, '10': 'agentId'},
    {'1': 'status', '3': 3, '4': 1, '5': 9, '10': 'status'},
    {'1': 'replicas', '3': 4, '4': 1, '5': 5, '10': 'replicas'},
    {'1': 'min_replicas', '3': 5, '4': 1, '5': 5, '10': 'minReplicas'},
    {'1': 'max_replicas', '3': 6, '4': 1, '5': 5, '10': 'maxReplicas'},
    {'1': 'cpu_req', '3': 7, '4': 1, '5': 9, '10': 'cpuReq'},
    {'1': 'cur_cpu', '3': 8, '4': 1, '5': 9, '10': 'curCpu'},
    {'1': 'cur_mem', '3': 9, '4': 1, '5': 9, '10': 'curMem'},
    {'1': 'mem_req', '3': 10, '4': 1, '5': 9, '10': 'memReq'},
    {'1': 'mem_limit', '3': 11, '4': 1, '5': 9, '10': 'memLimit'},
    {'1': 'cpu_limit', '3': 12, '4': 1, '5': 9, '10': 'cpuLimit'},
    {'1': 'server_region', '3': 13, '4': 1, '5': 9, '10': 'serverRegion'},
  ],
};

/// Descriptor for `AgentDeployment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List agentDeploymentDescriptor = $convert.base64Decode(
    'Cg9BZ2VudERlcGxveW1lbnQSFgoGcmVnaW9uGAEgASgJUgZyZWdpb24SGQoIYWdlbnRfaWQYAi'
    'ABKAlSB2FnZW50SWQSFgoGc3RhdHVzGAMgASgJUgZzdGF0dXMSGgoIcmVwbGljYXMYBCABKAVS'
    'CHJlcGxpY2FzEiEKDG1pbl9yZXBsaWNhcxgFIAEoBVILbWluUmVwbGljYXMSIQoMbWF4X3JlcG'
    'xpY2FzGAYgASgFUgttYXhSZXBsaWNhcxIXCgdjcHVfcmVxGAcgASgJUgZjcHVSZXESFwoHY3Vy'
    'X2NwdRgIIAEoCVIGY3VyQ3B1EhcKB2N1cl9tZW0YCSABKAlSBmN1ck1lbRIXCgdtZW1fcmVxGA'
    'ogASgJUgZtZW1SZXESGwoJbWVtX2xpbWl0GAsgASgJUghtZW1MaW1pdBIbCgljcHVfbGltaXQY'
    'DCABKAlSCGNwdUxpbWl0EiMKDXNlcnZlcl9yZWdpb24YDSABKAlSDHNlcnZlclJlZ2lvbg==');

@$core.Deprecated('Use agentInfoDescriptor instead')
const AgentInfo$json = {
  '1': 'AgentInfo',
  '2': [
    {'1': 'agent_id', '3': 1, '4': 1, '5': 9, '10': 'agentId'},
    {'1': 'agent_name', '3': 2, '4': 1, '5': 9, '10': 'agentName'},
    {'1': 'version', '3': 3, '4': 1, '5': 9, '10': 'version'},
    {'1': 'agent_deployments', '3': 4, '4': 3, '5': 11, '6': '.livekit.AgentDeployment', '10': 'agentDeployments'},
    {'1': 'secrets', '3': 5, '4': 3, '5': 11, '6': '.livekit.AgentSecret', '10': 'secrets'},
    {'1': 'deployed_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'deployedAt'},
  ],
};

/// Descriptor for `AgentInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List agentInfoDescriptor = $convert.base64Decode(
    'CglBZ2VudEluZm8SGQoIYWdlbnRfaWQYASABKAlSB2FnZW50SWQSHQoKYWdlbnRfbmFtZRgCIA'
    'EoCVIJYWdlbnROYW1lEhgKB3ZlcnNpb24YAyABKAlSB3ZlcnNpb24SRQoRYWdlbnRfZGVwbG95'
    'bWVudHMYBCADKAsyGC5saXZla2l0LkFnZW50RGVwbG95bWVudFIQYWdlbnREZXBsb3ltZW50cx'
    'IuCgdzZWNyZXRzGAUgAygLMhQubGl2ZWtpdC5BZ2VudFNlY3JldFIHc2VjcmV0cxI7CgtkZXBs'
    'b3llZF9hdBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCmRlcGxveWVkQXQ=');

@$core.Deprecated('Use listAgentsRequestDescriptor instead')
const ListAgentsRequest$json = {
  '1': 'ListAgentsRequest',
  '2': [
    {'1': 'agent_name', '3': 1, '4': 1, '5': 9, '10': 'agentName'},
    {'1': 'agent_id', '3': 2, '4': 1, '5': 9, '10': 'agentId'},
  ],
};

/// Descriptor for `ListAgentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAgentsRequestDescriptor = $convert.base64Decode(
    'ChFMaXN0QWdlbnRzUmVxdWVzdBIdCgphZ2VudF9uYW1lGAEgASgJUglhZ2VudE5hbWUSGQoIYW'
    'dlbnRfaWQYAiABKAlSB2FnZW50SWQ=');

@$core.Deprecated('Use listAgentsResponseDescriptor instead')
const ListAgentsResponse$json = {
  '1': 'ListAgentsResponse',
  '2': [
    {'1': 'agents', '3': 1, '4': 3, '5': 11, '6': '.livekit.AgentInfo', '10': 'agents'},
  ],
};

/// Descriptor for `ListAgentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAgentsResponseDescriptor = $convert.base64Decode(
    'ChJMaXN0QWdlbnRzUmVzcG9uc2USKgoGYWdlbnRzGAEgAygLMhIubGl2ZWtpdC5BZ2VudEluZm'
    '9SBmFnZW50cw==');

@$core.Deprecated('Use agentVersionDescriptor instead')
const AgentVersion$json = {
  '1': 'AgentVersion',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 9, '10': 'version'},
    {'1': 'current', '3': 2, '4': 1, '5': 8, '10': 'current'},
    {'1': 'created_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'deployed_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'deployedAt'},
    {'1': 'attributes', '3': 5, '4': 3, '5': 11, '6': '.livekit.AgentVersion.AttributesEntry', '10': 'attributes'},
    {'1': 'status', '3': 6, '4': 1, '5': 9, '10': 'status'},
    {'1': 'owner', '3': 7, '4': 1, '5': 9, '10': 'owner'},
  ],
  '3': [AgentVersion_AttributesEntry$json],
};

@$core.Deprecated('Use agentVersionDescriptor instead')
const AgentVersion_AttributesEntry$json = {
  '1': 'AttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `AgentVersion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List agentVersionDescriptor = $convert.base64Decode(
    'CgxBZ2VudFZlcnNpb24SGAoHdmVyc2lvbhgBIAEoCVIHdmVyc2lvbhIYCgdjdXJyZW50GAIgAS'
    'gIUgdjdXJyZW50EjkKCmNyZWF0ZWRfYXQYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0'
    'YW1wUgljcmVhdGVkQXQSOwoLZGVwbG95ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVG'
    'ltZXN0YW1wUgpkZXBsb3llZEF0EkUKCmF0dHJpYnV0ZXMYBSADKAsyJS5saXZla2l0LkFnZW50'
    'VmVyc2lvbi5BdHRyaWJ1dGVzRW50cnlSCmF0dHJpYnV0ZXMSFgoGc3RhdHVzGAYgASgJUgZzdG'
    'F0dXMSFAoFb3duZXIYByABKAlSBW93bmVyGj0KD0F0dHJpYnV0ZXNFbnRyeRIQCgNrZXkYASAB'
    'KAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use listAgentVersionsRequestDescriptor instead')
const ListAgentVersionsRequest$json = {
  '1': 'ListAgentVersionsRequest',
  '2': [
    {'1': 'agent_id', '3': 1, '4': 1, '5': 9, '10': 'agentId'},
    {'1': 'agent_name', '3': 2, '4': 1, '5': 9, '10': 'agentName'},
  ],
};

/// Descriptor for `ListAgentVersionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAgentVersionsRequestDescriptor = $convert.base64Decode(
    'ChhMaXN0QWdlbnRWZXJzaW9uc1JlcXVlc3QSGQoIYWdlbnRfaWQYASABKAlSB2FnZW50SWQSHQ'
    'oKYWdlbnRfbmFtZRgCIAEoCVIJYWdlbnROYW1l');

@$core.Deprecated('Use listAgentVersionsResponseDescriptor instead')
const ListAgentVersionsResponse$json = {
  '1': 'ListAgentVersionsResponse',
  '2': [
    {'1': 'versions', '3': 1, '4': 3, '5': 11, '6': '.livekit.AgentVersion', '10': 'versions'},
  ],
};

/// Descriptor for `ListAgentVersionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAgentVersionsResponseDescriptor = $convert.base64Decode(
    'ChlMaXN0QWdlbnRWZXJzaW9uc1Jlc3BvbnNlEjEKCHZlcnNpb25zGAEgAygLMhUubGl2ZWtpdC'
    '5BZ2VudFZlcnNpb25SCHZlcnNpb25z');

@$core.Deprecated('Use updateAgentRequestDescriptor instead')
const UpdateAgentRequest$json = {
  '1': 'UpdateAgentRequest',
  '2': [
    {'1': 'agent_id', '3': 1, '4': 1, '5': 9, '10': 'agentId'},
    {
      '1': 'agent_name',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'agentName',
    },
    {
      '1': 'replicas',
      '3': 3,
      '4': 1,
      '5': 5,
      '8': {'3': true},
      '10': 'replicas',
    },
    {
      '1': 'max_replicas',
      '3': 4,
      '4': 1,
      '5': 5,
      '8': {'3': true},
      '10': 'maxReplicas',
    },
    {
      '1': 'cpu_req',
      '3': 5,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'cpuReq',
    },
    {'1': 'regions', '3': 6, '4': 3, '5': 9, '10': 'regions'},
    {'1': 'secrets', '3': 7, '4': 3, '5': 11, '6': '.livekit.AgentSecret', '10': 'secrets'},
  ],
};

/// Descriptor for `UpdateAgentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAgentRequestDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVBZ2VudFJlcXVlc3QSGQoIYWdlbnRfaWQYASABKAlSB2FnZW50SWQSIQoKYWdlbn'
    'RfbmFtZRgCIAEoCUICGAFSCWFnZW50TmFtZRIeCghyZXBsaWNhcxgDIAEoBUICGAFSCHJlcGxp'
    'Y2FzEiUKDG1heF9yZXBsaWNhcxgEIAEoBUICGAFSC21heFJlcGxpY2FzEhsKB2NwdV9yZXEYBS'
    'ABKAlCAhgBUgZjcHVSZXESGAoHcmVnaW9ucxgGIAMoCVIHcmVnaW9ucxIuCgdzZWNyZXRzGAcg'
    'AygLMhQubGl2ZWtpdC5BZ2VudFNlY3JldFIHc2VjcmV0cw==');

@$core.Deprecated('Use updateAgentResponseDescriptor instead')
const UpdateAgentResponse$json = {
  '1': 'UpdateAgentResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UpdateAgentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAgentResponseDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVBZ2VudFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2'
    'FnZRgCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use restartAgentRequestDescriptor instead')
const RestartAgentRequest$json = {
  '1': 'RestartAgentRequest',
  '2': [
    {'1': 'agent_id', '3': 1, '4': 1, '5': 9, '10': 'agentId'},
  ],
};

/// Descriptor for `RestartAgentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restartAgentRequestDescriptor = $convert.base64Decode(
    'ChNSZXN0YXJ0QWdlbnRSZXF1ZXN0EhkKCGFnZW50X2lkGAEgASgJUgdhZ2VudElk');

@$core.Deprecated('Use restartAgentResponseDescriptor instead')
const RestartAgentResponse$json = {
  '1': 'RestartAgentResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `RestartAgentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restartAgentResponseDescriptor = $convert.base64Decode(
    'ChRSZXN0YXJ0QWdlbnRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3'
    'NhZ2UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use deployAgentRequestDescriptor instead')
const DeployAgentRequest$json = {
  '1': 'DeployAgentRequest',
  '2': [
    {'1': 'agent_id', '3': 1, '4': 1, '5': 9, '10': 'agentId'},
    {
      '1': 'agent_name',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'agentName',
    },
    {'1': 'secrets', '3': 3, '4': 3, '5': 11, '6': '.livekit.AgentSecret', '10': 'secrets'},
    {
      '1': 'replicas',
      '3': 4,
      '4': 1,
      '5': 5,
      '8': {'3': true},
      '10': 'replicas',
    },
    {
      '1': 'max_replicas',
      '3': 5,
      '4': 1,
      '5': 5,
      '8': {'3': true},
      '10': 'maxReplicas',
    },
    {
      '1': 'cpu_req',
      '3': 6,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'cpuReq',
    },
  ],
};

/// Descriptor for `DeployAgentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deployAgentRequestDescriptor = $convert.base64Decode(
    'ChJEZXBsb3lBZ2VudFJlcXVlc3QSGQoIYWdlbnRfaWQYASABKAlSB2FnZW50SWQSIQoKYWdlbn'
    'RfbmFtZRgCIAEoCUICGAFSCWFnZW50TmFtZRIuCgdzZWNyZXRzGAMgAygLMhQubGl2ZWtpdC5B'
    'Z2VudFNlY3JldFIHc2VjcmV0cxIeCghyZXBsaWNhcxgEIAEoBUICGAFSCHJlcGxpY2FzEiUKDG'
    '1heF9yZXBsaWNhcxgFIAEoBUICGAFSC21heFJlcGxpY2FzEhsKB2NwdV9yZXEYBiABKAlCAhgB'
    'UgZjcHVSZXE=');

@$core.Deprecated('Use deployAgentResponseDescriptor instead')
const DeployAgentResponse$json = {
  '1': 'DeployAgentResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'agent_id', '3': 3, '4': 1, '5': 9, '10': 'agentId'},
    {'1': 'presigned_url', '3': 4, '4': 1, '5': 9, '10': 'presignedUrl'},
    {'1': 'tag', '3': 5, '4': 1, '5': 9, '10': 'tag'},
    {'1': 'presigned_post_request', '3': 6, '4': 1, '5': 11, '6': '.livekit.PresignedPostRequest', '10': 'presignedPostRequest'},
  ],
};

/// Descriptor for `DeployAgentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deployAgentResponseDescriptor = $convert.base64Decode(
    'ChNEZXBsb3lBZ2VudFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2'
    'FnZRgCIAEoCVIHbWVzc2FnZRIZCghhZ2VudF9pZBgDIAEoCVIHYWdlbnRJZBIjCg1wcmVzaWdu'
    'ZWRfdXJsGAQgASgJUgxwcmVzaWduZWRVcmwSEAoDdGFnGAUgASgJUgN0YWcSUwoWcHJlc2lnbm'
    'VkX3Bvc3RfcmVxdWVzdBgGIAEoCzIdLmxpdmVraXQuUHJlc2lnbmVkUG9zdFJlcXVlc3RSFHBy'
    'ZXNpZ25lZFBvc3RSZXF1ZXN0');

@$core.Deprecated('Use updateAgentSecretsRequestDescriptor instead')
const UpdateAgentSecretsRequest$json = {
  '1': 'UpdateAgentSecretsRequest',
  '2': [
    {'1': 'agent_id', '3': 1, '4': 1, '5': 9, '10': 'agentId'},
    {'1': 'agent_name', '3': 2, '4': 1, '5': 9, '10': 'agentName'},
    {'1': 'overwrite', '3': 3, '4': 1, '5': 8, '10': 'overwrite'},
    {'1': 'secrets', '3': 4, '4': 3, '5': 11, '6': '.livekit.AgentSecret', '10': 'secrets'},
    {'1': 'remove', '3': 5, '4': 3, '5': 9, '10': 'remove'},
  ],
};

/// Descriptor for `UpdateAgentSecretsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAgentSecretsRequestDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVBZ2VudFNlY3JldHNSZXF1ZXN0EhkKCGFnZW50X2lkGAEgASgJUgdhZ2VudElkEh'
    '0KCmFnZW50X25hbWUYAiABKAlSCWFnZW50TmFtZRIcCglvdmVyd3JpdGUYAyABKAhSCW92ZXJ3'
    'cml0ZRIuCgdzZWNyZXRzGAQgAygLMhQubGl2ZWtpdC5BZ2VudFNlY3JldFIHc2VjcmV0cxIWCg'
    'ZyZW1vdmUYBSADKAlSBnJlbW92ZQ==');

@$core.Deprecated('Use updateAgentSecretsResponseDescriptor instead')
const UpdateAgentSecretsResponse$json = {
  '1': 'UpdateAgentSecretsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UpdateAgentSecretsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAgentSecretsResponseDescriptor = $convert.base64Decode(
    'ChpVcGRhdGVBZ2VudFNlY3JldHNSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEh'
    'gKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use rollbackAgentRequestDescriptor instead')
const RollbackAgentRequest$json = {
  '1': 'RollbackAgentRequest',
  '2': [
    {'1': 'agent_id', '3': 1, '4': 1, '5': 9, '10': 'agentId'},
    {'1': 'agent_name', '3': 2, '4': 1, '5': 9, '10': 'agentName'},
    {'1': 'version', '3': 3, '4': 1, '5': 9, '10': 'version'},
  ],
};

/// Descriptor for `RollbackAgentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rollbackAgentRequestDescriptor = $convert.base64Decode(
    'ChRSb2xsYmFja0FnZW50UmVxdWVzdBIZCghhZ2VudF9pZBgBIAEoCVIHYWdlbnRJZBIdCgphZ2'
    'VudF9uYW1lGAIgASgJUglhZ2VudE5hbWUSGAoHdmVyc2lvbhgDIAEoCVIHdmVyc2lvbg==');

@$core.Deprecated('Use rollbackAgentResponseDescriptor instead')
const RollbackAgentResponse$json = {
  '1': 'RollbackAgentResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `RollbackAgentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rollbackAgentResponseDescriptor = $convert.base64Decode(
    'ChVSb2xsYmFja0FnZW50UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZX'
    'NzYWdlGAIgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use deleteAgentRequestDescriptor instead')
const DeleteAgentRequest$json = {
  '1': 'DeleteAgentRequest',
  '2': [
    {'1': 'agent_id', '3': 1, '4': 1, '5': 9, '10': 'agentId'},
    {'1': 'agent_name', '3': 2, '4': 1, '5': 9, '10': 'agentName'},
  ],
};

/// Descriptor for `DeleteAgentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAgentRequestDescriptor = $convert.base64Decode(
    'ChJEZWxldGVBZ2VudFJlcXVlc3QSGQoIYWdlbnRfaWQYASABKAlSB2FnZW50SWQSHQoKYWdlbn'
    'RfbmFtZRgCIAEoCVIJYWdlbnROYW1l');

@$core.Deprecated('Use deleteAgentResponseDescriptor instead')
const DeleteAgentResponse$json = {
  '1': 'DeleteAgentResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `DeleteAgentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAgentResponseDescriptor = $convert.base64Decode(
    'ChNEZWxldGVBZ2VudFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2'
    'FnZRgCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use listAgentSecretsRequestDescriptor instead')
const ListAgentSecretsRequest$json = {
  '1': 'ListAgentSecretsRequest',
  '2': [
    {'1': 'agent_id', '3': 1, '4': 1, '5': 9, '10': 'agentId'},
    {'1': 'agent_name', '3': 2, '4': 1, '5': 9, '10': 'agentName'},
  ],
};

/// Descriptor for `ListAgentSecretsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAgentSecretsRequestDescriptor = $convert.base64Decode(
    'ChdMaXN0QWdlbnRTZWNyZXRzUmVxdWVzdBIZCghhZ2VudF9pZBgBIAEoCVIHYWdlbnRJZBIdCg'
    'phZ2VudF9uYW1lGAIgASgJUglhZ2VudE5hbWU=');

@$core.Deprecated('Use listAgentSecretsResponseDescriptor instead')
const ListAgentSecretsResponse$json = {
  '1': 'ListAgentSecretsResponse',
  '2': [
    {'1': 'secrets', '3': 1, '4': 3, '5': 11, '6': '.livekit.AgentSecret', '10': 'secrets'},
  ],
};

/// Descriptor for `ListAgentSecretsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAgentSecretsResponseDescriptor = $convert.base64Decode(
    'ChhMaXN0QWdlbnRTZWNyZXRzUmVzcG9uc2USLgoHc2VjcmV0cxgBIAMoCzIULmxpdmVraXQuQW'
    'dlbnRTZWNyZXRSB3NlY3JldHM=');

@$core.Deprecated('Use settingsParamDescriptor instead')
const SettingsParam$json = {
  '1': 'SettingsParam',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `SettingsParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List settingsParamDescriptor = $convert.base64Decode(
    'Cg1TZXR0aW5nc1BhcmFtEhIKBG5hbWUYASABKAlSBG5hbWUSFAoFdmFsdWUYAiABKAlSBXZhbH'
    'Vl');

@$core.Deprecated('Use clientSettingsResponseDescriptor instead')
const ClientSettingsResponse$json = {
  '1': 'ClientSettingsResponse',
  '2': [
    {'1': 'params', '3': 1, '4': 3, '5': 11, '6': '.livekit.SettingsParam', '10': 'params'},
  ],
};

/// Descriptor for `ClientSettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientSettingsResponseDescriptor = $convert.base64Decode(
    'ChZDbGllbnRTZXR0aW5nc1Jlc3BvbnNlEi4KBnBhcmFtcxgBIAMoCzIWLmxpdmVraXQuU2V0dG'
    'luZ3NQYXJhbVIGcGFyYW1z');

@$core.Deprecated('Use clientSettingsRequestDescriptor instead')
const ClientSettingsRequest$json = {
  '1': 'ClientSettingsRequest',
};

/// Descriptor for `ClientSettingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientSettingsRequestDescriptor = $convert.base64Decode(
    'ChVDbGllbnRTZXR0aW5nc1JlcXVlc3Q=');

const $core.Map<$core.String, $core.dynamic> CloudAgentServiceBase$json = {
  '1': 'CloudAgent',
  '2': [
    {'1': 'CreateAgent', '2': '.livekit.CreateAgentRequest', '3': '.livekit.CreateAgentResponse', '4': {}},
    {'1': 'ListAgents', '2': '.livekit.ListAgentsRequest', '3': '.livekit.ListAgentsResponse', '4': {}},
    {'1': 'ListAgentVersions', '2': '.livekit.ListAgentVersionsRequest', '3': '.livekit.ListAgentVersionsResponse', '4': {}},
    {'1': 'ListAgentSecrets', '2': '.livekit.ListAgentSecretsRequest', '3': '.livekit.ListAgentSecretsResponse', '4': {}},
    {'1': 'UpdateAgent', '2': '.livekit.UpdateAgentRequest', '3': '.livekit.UpdateAgentResponse', '4': {}},
    {'1': 'RestartAgent', '2': '.livekit.RestartAgentRequest', '3': '.livekit.RestartAgentResponse', '4': {}},
    {'1': 'DeployAgent', '2': '.livekit.DeployAgentRequest', '3': '.livekit.DeployAgentResponse', '4': {}},
    {'1': 'UpdateAgentSecrets', '2': '.livekit.UpdateAgentSecretsRequest', '3': '.livekit.UpdateAgentSecretsResponse', '4': {}},
    {'1': 'RollbackAgent', '2': '.livekit.RollbackAgentRequest', '3': '.livekit.RollbackAgentResponse', '4': {}},
    {'1': 'DeleteAgent', '2': '.livekit.DeleteAgentRequest', '3': '.livekit.DeleteAgentResponse', '4': {}},
    {'1': 'GetClientSettings', '2': '.livekit.ClientSettingsRequest', '3': '.livekit.ClientSettingsResponse', '4': {}},
  ],
};

@$core.Deprecated('Use cloudAgentServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> CloudAgentServiceBase$messageJson = {
  '.livekit.CreateAgentRequest': CreateAgentRequest$json,
  '.livekit.AgentSecret': AgentSecret$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.livekit.CreateAgentResponse': CreateAgentResponse$json,
  '.livekit.PresignedPostRequest': PresignedPostRequest$json,
  '.livekit.PresignedPostRequest.ValuesEntry': PresignedPostRequest_ValuesEntry$json,
  '.livekit.ListAgentsRequest': ListAgentsRequest$json,
  '.livekit.ListAgentsResponse': ListAgentsResponse$json,
  '.livekit.AgentInfo': AgentInfo$json,
  '.livekit.AgentDeployment': AgentDeployment$json,
  '.livekit.ListAgentVersionsRequest': ListAgentVersionsRequest$json,
  '.livekit.ListAgentVersionsResponse': ListAgentVersionsResponse$json,
  '.livekit.AgentVersion': AgentVersion$json,
  '.livekit.AgentVersion.AttributesEntry': AgentVersion_AttributesEntry$json,
  '.livekit.ListAgentSecretsRequest': ListAgentSecretsRequest$json,
  '.livekit.ListAgentSecretsResponse': ListAgentSecretsResponse$json,
  '.livekit.UpdateAgentRequest': UpdateAgentRequest$json,
  '.livekit.UpdateAgentResponse': UpdateAgentResponse$json,
  '.livekit.RestartAgentRequest': RestartAgentRequest$json,
  '.livekit.RestartAgentResponse': RestartAgentResponse$json,
  '.livekit.DeployAgentRequest': DeployAgentRequest$json,
  '.livekit.DeployAgentResponse': DeployAgentResponse$json,
  '.livekit.UpdateAgentSecretsRequest': UpdateAgentSecretsRequest$json,
  '.livekit.UpdateAgentSecretsResponse': UpdateAgentSecretsResponse$json,
  '.livekit.RollbackAgentRequest': RollbackAgentRequest$json,
  '.livekit.RollbackAgentResponse': RollbackAgentResponse$json,
  '.livekit.DeleteAgentRequest': DeleteAgentRequest$json,
  '.livekit.DeleteAgentResponse': DeleteAgentResponse$json,
  '.livekit.ClientSettingsRequest': ClientSettingsRequest$json,
  '.livekit.ClientSettingsResponse': ClientSettingsResponse$json,
  '.livekit.SettingsParam': SettingsParam$json,
};

/// Descriptor for `CloudAgent`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List cloudAgentServiceDescriptor = $convert.base64Decode(
    'CgpDbG91ZEFnZW50EkoKC0NyZWF0ZUFnZW50EhsubGl2ZWtpdC5DcmVhdGVBZ2VudFJlcXVlc3'
    'QaHC5saXZla2l0LkNyZWF0ZUFnZW50UmVzcG9uc2UiABJHCgpMaXN0QWdlbnRzEhoubGl2ZWtp'
    'dC5MaXN0QWdlbnRzUmVxdWVzdBobLmxpdmVraXQuTGlzdEFnZW50c1Jlc3BvbnNlIgASXAoRTG'
    'lzdEFnZW50VmVyc2lvbnMSIS5saXZla2l0Lkxpc3RBZ2VudFZlcnNpb25zUmVxdWVzdBoiLmxp'
    'dmVraXQuTGlzdEFnZW50VmVyc2lvbnNSZXNwb25zZSIAElkKEExpc3RBZ2VudFNlY3JldHMSIC'
    '5saXZla2l0Lkxpc3RBZ2VudFNlY3JldHNSZXF1ZXN0GiEubGl2ZWtpdC5MaXN0QWdlbnRTZWNy'
    'ZXRzUmVzcG9uc2UiABJKCgtVcGRhdGVBZ2VudBIbLmxpdmVraXQuVXBkYXRlQWdlbnRSZXF1ZX'
    'N0GhwubGl2ZWtpdC5VcGRhdGVBZ2VudFJlc3BvbnNlIgASTQoMUmVzdGFydEFnZW50EhwubGl2'
    'ZWtpdC5SZXN0YXJ0QWdlbnRSZXF1ZXN0Gh0ubGl2ZWtpdC5SZXN0YXJ0QWdlbnRSZXNwb25zZS'
    'IAEkoKC0RlcGxveUFnZW50EhsubGl2ZWtpdC5EZXBsb3lBZ2VudFJlcXVlc3QaHC5saXZla2l0'
    'LkRlcGxveUFnZW50UmVzcG9uc2UiABJfChJVcGRhdGVBZ2VudFNlY3JldHMSIi5saXZla2l0Ll'
    'VwZGF0ZUFnZW50U2VjcmV0c1JlcXVlc3QaIy5saXZla2l0LlVwZGF0ZUFnZW50U2VjcmV0c1Jl'
    'c3BvbnNlIgASUAoNUm9sbGJhY2tBZ2VudBIdLmxpdmVraXQuUm9sbGJhY2tBZ2VudFJlcXVlc3'
    'QaHi5saXZla2l0LlJvbGxiYWNrQWdlbnRSZXNwb25zZSIAEkoKC0RlbGV0ZUFnZW50EhsubGl2'
    'ZWtpdC5EZWxldGVBZ2VudFJlcXVlc3QaHC5saXZla2l0LkRlbGV0ZUFnZW50UmVzcG9uc2UiAB'
    'JWChFHZXRDbGllbnRTZXR0aW5ncxIeLmxpdmVraXQuQ2xpZW50U2V0dGluZ3NSZXF1ZXN0Gh8u'
    'bGl2ZWtpdC5DbGllbnRTZXR0aW5nc1Jlc3BvbnNlIgA=');

