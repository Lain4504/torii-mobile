//
//  Generated code. Do not modify.
//  source: livekit_agent.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use jobTypeDescriptor instead')
const JobType$json = {
  '1': 'JobType',
  '2': [
    {'1': 'JT_ROOM', '2': 0},
    {'1': 'JT_PUBLISHER', '2': 1},
    {'1': 'JT_PARTICIPANT', '2': 2},
  ],
};

/// Descriptor for `JobType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List jobTypeDescriptor = $convert.base64Decode(
    'CgdKb2JUeXBlEgsKB0pUX1JPT00QABIQCgxKVF9QVUJMSVNIRVIQARISCg5KVF9QQVJUSUNJUE'
    'FOVBAC');

@$core.Deprecated('Use workerStatusDescriptor instead')
const WorkerStatus$json = {
  '1': 'WorkerStatus',
  '2': [
    {'1': 'WS_AVAILABLE', '2': 0},
    {'1': 'WS_FULL', '2': 1},
  ],
};

/// Descriptor for `WorkerStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List workerStatusDescriptor = $convert.base64Decode(
    'CgxXb3JrZXJTdGF0dXMSEAoMV1NfQVZBSUxBQkxFEAASCwoHV1NfRlVMTBAB');

@$core.Deprecated('Use jobStatusDescriptor instead')
const JobStatus$json = {
  '1': 'JobStatus',
  '2': [
    {'1': 'JS_PENDING', '2': 0},
    {'1': 'JS_RUNNING', '2': 1},
    {'1': 'JS_SUCCESS', '2': 2},
    {'1': 'JS_FAILED', '2': 3},
  ],
};

/// Descriptor for `JobStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List jobStatusDescriptor = $convert.base64Decode(
    'CglKb2JTdGF0dXMSDgoKSlNfUEVORElORxAAEg4KCkpTX1JVTk5JTkcQARIOCgpKU19TVUNDRV'
    'NTEAISDQoJSlNfRkFJTEVEEAM=');

@$core.Deprecated('Use jobDescriptor instead')
const Job$json = {
  '1': 'Job',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'dispatch_id', '3': 9, '4': 1, '5': 9, '10': 'dispatchId'},
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.livekit.JobType', '10': 'type'},
    {'1': 'room', '3': 3, '4': 1, '5': 11, '6': '.livekit.Room', '10': 'room'},
    {'1': 'participant', '3': 4, '4': 1, '5': 11, '6': '.livekit.ParticipantInfo', '9': 0, '10': 'participant', '17': true},
    {
      '1': 'namespace',
      '3': 5,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'namespace',
    },
    {'1': 'metadata', '3': 6, '4': 1, '5': 9, '10': 'metadata'},
    {'1': 'agent_name', '3': 7, '4': 1, '5': 9, '10': 'agentName'},
    {'1': 'state', '3': 8, '4': 1, '5': 11, '6': '.livekit.JobState', '10': 'state'},
    {'1': 'enable_recording', '3': 10, '4': 1, '5': 8, '10': 'enableRecording'},
  ],
  '8': [
    {'1': '_participant'},
  ],
};

/// Descriptor for `Job`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jobDescriptor = $convert.base64Decode(
    'CgNKb2ISDgoCaWQYASABKAlSAmlkEh8KC2Rpc3BhdGNoX2lkGAkgASgJUgpkaXNwYXRjaElkEi'
    'QKBHR5cGUYAiABKA4yEC5saXZla2l0LkpvYlR5cGVSBHR5cGUSIQoEcm9vbRgDIAEoCzINLmxp'
    'dmVraXQuUm9vbVIEcm9vbRI/CgtwYXJ0aWNpcGFudBgEIAEoCzIYLmxpdmVraXQuUGFydGljaX'
    'BhbnRJbmZvSABSC3BhcnRpY2lwYW50iAEBEiAKCW5hbWVzcGFjZRgFIAEoCUICGAFSCW5hbWVz'
    'cGFjZRIaCghtZXRhZGF0YRgGIAEoCVIIbWV0YWRhdGESHQoKYWdlbnRfbmFtZRgHIAEoCVIJYW'
    'dlbnROYW1lEicKBXN0YXRlGAggASgLMhEubGl2ZWtpdC5Kb2JTdGF0ZVIFc3RhdGUSKQoQZW5h'
    'YmxlX3JlY29yZGluZxgKIAEoCFIPZW5hYmxlUmVjb3JkaW5nQg4KDF9wYXJ0aWNpcGFudA==');

@$core.Deprecated('Use jobStateDescriptor instead')
const JobState$json = {
  '1': 'JobState',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.livekit.JobStatus', '10': 'status'},
    {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    {'1': 'started_at', '3': 3, '4': 1, '5': 3, '10': 'startedAt'},
    {'1': 'ended_at', '3': 4, '4': 1, '5': 3, '10': 'endedAt'},
    {'1': 'updated_at', '3': 5, '4': 1, '5': 3, '10': 'updatedAt'},
    {'1': 'participant_identity', '3': 6, '4': 1, '5': 9, '10': 'participantIdentity'},
    {'1': 'worker_id', '3': 7, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'agent_id', '3': 8, '4': 1, '5': 9, '10': 'agentId'},
  ],
};

/// Descriptor for `JobState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jobStateDescriptor = $convert.base64Decode(
    'CghKb2JTdGF0ZRIqCgZzdGF0dXMYASABKA4yEi5saXZla2l0LkpvYlN0YXR1c1IGc3RhdHVzEh'
    'QKBWVycm9yGAIgASgJUgVlcnJvchIdCgpzdGFydGVkX2F0GAMgASgDUglzdGFydGVkQXQSGQoI'
    'ZW5kZWRfYXQYBCABKANSB2VuZGVkQXQSHQoKdXBkYXRlZF9hdBgFIAEoA1IJdXBkYXRlZEF0Ej'
    'EKFHBhcnRpY2lwYW50X2lkZW50aXR5GAYgASgJUhNwYXJ0aWNpcGFudElkZW50aXR5EhsKCXdv'
    'cmtlcl9pZBgHIAEoCVIId29ya2VySWQSGQoIYWdlbnRfaWQYCCABKAlSB2FnZW50SWQ=');

@$core.Deprecated('Use workerMessageDescriptor instead')
const WorkerMessage$json = {
  '1': 'WorkerMessage',
  '2': [
    {'1': 'register', '3': 1, '4': 1, '5': 11, '6': '.livekit.RegisterWorkerRequest', '9': 0, '10': 'register'},
    {'1': 'availability', '3': 2, '4': 1, '5': 11, '6': '.livekit.AvailabilityResponse', '9': 0, '10': 'availability'},
    {'1': 'update_worker', '3': 3, '4': 1, '5': 11, '6': '.livekit.UpdateWorkerStatus', '9': 0, '10': 'updateWorker'},
    {'1': 'update_job', '3': 4, '4': 1, '5': 11, '6': '.livekit.UpdateJobStatus', '9': 0, '10': 'updateJob'},
    {'1': 'ping', '3': 5, '4': 1, '5': 11, '6': '.livekit.WorkerPing', '9': 0, '10': 'ping'},
    {'1': 'simulate_job', '3': 6, '4': 1, '5': 11, '6': '.livekit.SimulateJobRequest', '9': 0, '10': 'simulateJob'},
    {'1': 'migrate_job', '3': 7, '4': 1, '5': 11, '6': '.livekit.MigrateJobRequest', '9': 0, '10': 'migrateJob'},
  ],
  '8': [
    {'1': 'message'},
  ],
};

/// Descriptor for `WorkerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List workerMessageDescriptor = $convert.base64Decode(
    'Cg1Xb3JrZXJNZXNzYWdlEjwKCHJlZ2lzdGVyGAEgASgLMh4ubGl2ZWtpdC5SZWdpc3Rlcldvcm'
    'tlclJlcXVlc3RIAFIIcmVnaXN0ZXISQwoMYXZhaWxhYmlsaXR5GAIgASgLMh0ubGl2ZWtpdC5B'
    'dmFpbGFiaWxpdHlSZXNwb25zZUgAUgxhdmFpbGFiaWxpdHkSQgoNdXBkYXRlX3dvcmtlchgDIA'
    'EoCzIbLmxpdmVraXQuVXBkYXRlV29ya2VyU3RhdHVzSABSDHVwZGF0ZVdvcmtlchI5Cgp1cGRh'
    'dGVfam9iGAQgASgLMhgubGl2ZWtpdC5VcGRhdGVKb2JTdGF0dXNIAFIJdXBkYXRlSm9iEikKBH'
    'BpbmcYBSABKAsyEy5saXZla2l0LldvcmtlclBpbmdIAFIEcGluZxJACgxzaW11bGF0ZV9qb2IY'
    'BiABKAsyGy5saXZla2l0LlNpbXVsYXRlSm9iUmVxdWVzdEgAUgtzaW11bGF0ZUpvYhI9CgttaW'
    'dyYXRlX2pvYhgHIAEoCzIaLmxpdmVraXQuTWlncmF0ZUpvYlJlcXVlc3RIAFIKbWlncmF0ZUpv'
    'YkIJCgdtZXNzYWdl');

@$core.Deprecated('Use serverMessageDescriptor instead')
const ServerMessage$json = {
  '1': 'ServerMessage',
  '2': [
    {'1': 'register', '3': 1, '4': 1, '5': 11, '6': '.livekit.RegisterWorkerResponse', '9': 0, '10': 'register'},
    {'1': 'availability', '3': 2, '4': 1, '5': 11, '6': '.livekit.AvailabilityRequest', '9': 0, '10': 'availability'},
    {'1': 'assignment', '3': 3, '4': 1, '5': 11, '6': '.livekit.JobAssignment', '9': 0, '10': 'assignment'},
    {'1': 'termination', '3': 5, '4': 1, '5': 11, '6': '.livekit.JobTermination', '9': 0, '10': 'termination'},
    {'1': 'pong', '3': 4, '4': 1, '5': 11, '6': '.livekit.WorkerPong', '9': 0, '10': 'pong'},
  ],
  '8': [
    {'1': 'message'},
  ],
};

/// Descriptor for `ServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverMessageDescriptor = $convert.base64Decode(
    'Cg1TZXJ2ZXJNZXNzYWdlEj0KCHJlZ2lzdGVyGAEgASgLMh8ubGl2ZWtpdC5SZWdpc3Rlcldvcm'
    'tlclJlc3BvbnNlSABSCHJlZ2lzdGVyEkIKDGF2YWlsYWJpbGl0eRgCIAEoCzIcLmxpdmVraXQu'
    'QXZhaWxhYmlsaXR5UmVxdWVzdEgAUgxhdmFpbGFiaWxpdHkSOAoKYXNzaWdubWVudBgDIAEoCz'
    'IWLmxpdmVraXQuSm9iQXNzaWdubWVudEgAUgphc3NpZ25tZW50EjsKC3Rlcm1pbmF0aW9uGAUg'
    'ASgLMhcubGl2ZWtpdC5Kb2JUZXJtaW5hdGlvbkgAUgt0ZXJtaW5hdGlvbhIpCgRwb25nGAQgAS'
    'gLMhMubGl2ZWtpdC5Xb3JrZXJQb25nSABSBHBvbmdCCQoHbWVzc2FnZQ==');

@$core.Deprecated('Use simulateJobRequestDescriptor instead')
const SimulateJobRequest$json = {
  '1': 'SimulateJobRequest',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.livekit.JobType', '10': 'type'},
    {'1': 'room', '3': 2, '4': 1, '5': 11, '6': '.livekit.Room', '10': 'room'},
    {'1': 'participant', '3': 3, '4': 1, '5': 11, '6': '.livekit.ParticipantInfo', '10': 'participant'},
  ],
};

/// Descriptor for `SimulateJobRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List simulateJobRequestDescriptor = $convert.base64Decode(
    'ChJTaW11bGF0ZUpvYlJlcXVlc3QSJAoEdHlwZRgBIAEoDjIQLmxpdmVraXQuSm9iVHlwZVIEdH'
    'lwZRIhCgRyb29tGAIgASgLMg0ubGl2ZWtpdC5Sb29tUgRyb29tEjoKC3BhcnRpY2lwYW50GAMg'
    'ASgLMhgubGl2ZWtpdC5QYXJ0aWNpcGFudEluZm9SC3BhcnRpY2lwYW50');

@$core.Deprecated('Use workerPingDescriptor instead')
const WorkerPing$json = {
  '1': 'WorkerPing',
  '2': [
    {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `WorkerPing`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List workerPingDescriptor = $convert.base64Decode(
    'CgpXb3JrZXJQaW5nEhwKCXRpbWVzdGFtcBgBIAEoA1IJdGltZXN0YW1w');

@$core.Deprecated('Use workerPongDescriptor instead')
const WorkerPong$json = {
  '1': 'WorkerPong',
  '2': [
    {'1': 'last_timestamp', '3': 1, '4': 1, '5': 3, '10': 'lastTimestamp'},
    {'1': 'timestamp', '3': 2, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `WorkerPong`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List workerPongDescriptor = $convert.base64Decode(
    'CgpXb3JrZXJQb25nEiUKDmxhc3RfdGltZXN0YW1wGAEgASgDUg1sYXN0VGltZXN0YW1wEhwKCX'
    'RpbWVzdGFtcBgCIAEoA1IJdGltZXN0YW1w');

@$core.Deprecated('Use registerWorkerRequestDescriptor instead')
const RegisterWorkerRequest$json = {
  '1': 'RegisterWorkerRequest',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.livekit.JobType', '10': 'type'},
    {'1': 'agent_name', '3': 8, '4': 1, '5': 9, '10': 'agentName'},
    {'1': 'version', '3': 3, '4': 1, '5': 9, '10': 'version'},
    {'1': 'ping_interval', '3': 5, '4': 1, '5': 13, '10': 'pingInterval'},
    {'1': 'namespace', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'namespace', '17': true},
    {'1': 'allowed_permissions', '3': 7, '4': 1, '5': 11, '6': '.livekit.ParticipantPermission', '10': 'allowedPermissions'},
  ],
  '8': [
    {'1': '_namespace'},
  ],
};

/// Descriptor for `RegisterWorkerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerWorkerRequestDescriptor = $convert.base64Decode(
    'ChVSZWdpc3RlcldvcmtlclJlcXVlc3QSJAoEdHlwZRgBIAEoDjIQLmxpdmVraXQuSm9iVHlwZV'
    'IEdHlwZRIdCgphZ2VudF9uYW1lGAggASgJUglhZ2VudE5hbWUSGAoHdmVyc2lvbhgDIAEoCVIH'
    'dmVyc2lvbhIjCg1waW5nX2ludGVydmFsGAUgASgNUgxwaW5nSW50ZXJ2YWwSIQoJbmFtZXNwYW'
    'NlGAYgASgJSABSCW5hbWVzcGFjZYgBARJPChNhbGxvd2VkX3Blcm1pc3Npb25zGAcgASgLMh4u'
    'bGl2ZWtpdC5QYXJ0aWNpcGFudFBlcm1pc3Npb25SEmFsbG93ZWRQZXJtaXNzaW9uc0IMCgpfbm'
    'FtZXNwYWNl');

@$core.Deprecated('Use registerWorkerResponseDescriptor instead')
const RegisterWorkerResponse$json = {
  '1': 'RegisterWorkerResponse',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'server_info', '3': 3, '4': 1, '5': 11, '6': '.livekit.ServerInfo', '10': 'serverInfo'},
  ],
};

/// Descriptor for `RegisterWorkerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerWorkerResponseDescriptor = $convert.base64Decode(
    'ChZSZWdpc3RlcldvcmtlclJlc3BvbnNlEhsKCXdvcmtlcl9pZBgBIAEoCVIId29ya2VySWQSNA'
    'oLc2VydmVyX2luZm8YAyABKAsyEy5saXZla2l0LlNlcnZlckluZm9SCnNlcnZlckluZm8=');

@$core.Deprecated('Use migrateJobRequestDescriptor instead')
const MigrateJobRequest$json = {
  '1': 'MigrateJobRequest',
  '2': [
    {'1': 'job_ids', '3': 2, '4': 3, '5': 9, '10': 'jobIds'},
  ],
};

/// Descriptor for `MigrateJobRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List migrateJobRequestDescriptor = $convert.base64Decode(
    'ChFNaWdyYXRlSm9iUmVxdWVzdBIXCgdqb2JfaWRzGAIgAygJUgZqb2JJZHM=');

@$core.Deprecated('Use availabilityRequestDescriptor instead')
const AvailabilityRequest$json = {
  '1': 'AvailabilityRequest',
  '2': [
    {'1': 'job', '3': 1, '4': 1, '5': 11, '6': '.livekit.Job', '10': 'job'},
    {'1': 'resuming', '3': 2, '4': 1, '5': 8, '10': 'resuming'},
  ],
};

/// Descriptor for `AvailabilityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List availabilityRequestDescriptor = $convert.base64Decode(
    'ChNBdmFpbGFiaWxpdHlSZXF1ZXN0Eh4KA2pvYhgBIAEoCzIMLmxpdmVraXQuSm9iUgNqb2ISGg'
    'oIcmVzdW1pbmcYAiABKAhSCHJlc3VtaW5n');

@$core.Deprecated('Use availabilityResponseDescriptor instead')
const AvailabilityResponse$json = {
  '1': 'AvailabilityResponse',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'available', '3': 2, '4': 1, '5': 8, '10': 'available'},
    {'1': 'supports_resume', '3': 3, '4': 1, '5': 8, '10': 'supportsResume'},
    {'1': 'terminate', '3': 8, '4': 1, '5': 8, '10': 'terminate'},
    {'1': 'participant_name', '3': 4, '4': 1, '5': 9, '10': 'participantName'},
    {'1': 'participant_identity', '3': 5, '4': 1, '5': 9, '10': 'participantIdentity'},
    {'1': 'participant_metadata', '3': 6, '4': 1, '5': 9, '10': 'participantMetadata'},
    {'1': 'participant_attributes', '3': 7, '4': 3, '5': 11, '6': '.livekit.AvailabilityResponse.ParticipantAttributesEntry', '10': 'participantAttributes'},
  ],
  '3': [AvailabilityResponse_ParticipantAttributesEntry$json],
};

@$core.Deprecated('Use availabilityResponseDescriptor instead')
const AvailabilityResponse_ParticipantAttributesEntry$json = {
  '1': 'ParticipantAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `AvailabilityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List availabilityResponseDescriptor = $convert.base64Decode(
    'ChRBdmFpbGFiaWxpdHlSZXNwb25zZRIVCgZqb2JfaWQYASABKAlSBWpvYklkEhwKCWF2YWlsYW'
    'JsZRgCIAEoCFIJYXZhaWxhYmxlEicKD3N1cHBvcnRzX3Jlc3VtZRgDIAEoCFIOc3VwcG9ydHNS'
    'ZXN1bWUSHAoJdGVybWluYXRlGAggASgIUgl0ZXJtaW5hdGUSKQoQcGFydGljaXBhbnRfbmFtZR'
    'gEIAEoCVIPcGFydGljaXBhbnROYW1lEjEKFHBhcnRpY2lwYW50X2lkZW50aXR5GAUgASgJUhNw'
    'YXJ0aWNpcGFudElkZW50aXR5EjEKFHBhcnRpY2lwYW50X21ldGFkYXRhGAYgASgJUhNwYXJ0aW'
    'NpcGFudE1ldGFkYXRhEm8KFnBhcnRpY2lwYW50X2F0dHJpYnV0ZXMYByADKAsyOC5saXZla2l0'
    'LkF2YWlsYWJpbGl0eVJlc3BvbnNlLlBhcnRpY2lwYW50QXR0cmlidXRlc0VudHJ5UhVwYXJ0aW'
    'NpcGFudEF0dHJpYnV0ZXMaSAoaUGFydGljaXBhbnRBdHRyaWJ1dGVzRW50cnkSEAoDa2V5GAEg'
    'ASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use updateJobStatusDescriptor instead')
const UpdateJobStatus$json = {
  '1': 'UpdateJobStatus',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.livekit.JobStatus', '10': 'status'},
    {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `UpdateJobStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateJobStatusDescriptor = $convert.base64Decode(
    'Cg9VcGRhdGVKb2JTdGF0dXMSFQoGam9iX2lkGAEgASgJUgVqb2JJZBIqCgZzdGF0dXMYAiABKA'
    '4yEi5saXZla2l0LkpvYlN0YXR1c1IGc3RhdHVzEhQKBWVycm9yGAMgASgJUgVlcnJvcg==');

@$core.Deprecated('Use updateWorkerStatusDescriptor instead')
const UpdateWorkerStatus$json = {
  '1': 'UpdateWorkerStatus',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.livekit.WorkerStatus', '9': 0, '10': 'status', '17': true},
    {'1': 'load', '3': 3, '4': 1, '5': 2, '10': 'load'},
    {'1': 'job_count', '3': 4, '4': 1, '5': 13, '10': 'jobCount'},
  ],
  '8': [
    {'1': '_status'},
  ],
};

/// Descriptor for `UpdateWorkerStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateWorkerStatusDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVXb3JrZXJTdGF0dXMSMgoGc3RhdHVzGAEgASgOMhUubGl2ZWtpdC5Xb3JrZXJTdG'
    'F0dXNIAFIGc3RhdHVziAEBEhIKBGxvYWQYAyABKAJSBGxvYWQSGwoJam9iX2NvdW50GAQgASgN'
    'Ughqb2JDb3VudEIJCgdfc3RhdHVz');

@$core.Deprecated('Use jobAssignmentDescriptor instead')
const JobAssignment$json = {
  '1': 'JobAssignment',
  '2': [
    {'1': 'job', '3': 1, '4': 1, '5': 11, '6': '.livekit.Job', '10': 'job'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
  ],
  '8': [
    {'1': '_url'},
  ],
};

/// Descriptor for `JobAssignment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jobAssignmentDescriptor = $convert.base64Decode(
    'Cg1Kb2JBc3NpZ25tZW50Eh4KA2pvYhgBIAEoCzIMLmxpdmVraXQuSm9iUgNqb2ISFQoDdXJsGA'
    'IgASgJSABSA3VybIgBARIUCgV0b2tlbhgDIAEoCVIFdG9rZW5CBgoEX3VybA==');

@$core.Deprecated('Use jobTerminationDescriptor instead')
const JobTermination$json = {
  '1': 'JobTermination',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
  ],
};

/// Descriptor for `JobTermination`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jobTerminationDescriptor = $convert.base64Decode(
    'Cg5Kb2JUZXJtaW5hdGlvbhIVCgZqb2JfaWQYASABKAlSBWpvYklk');

