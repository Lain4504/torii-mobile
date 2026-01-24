//
//  Generated code. Do not modify.
//  source: livekit_room.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'livekit_agent_dispatch.pbjson.dart' as $6;
import 'livekit_egress.pbjson.dart' as $7;
import 'livekit_models.pbjson.dart' as $2;

@$core.Deprecated('Use createRoomRequestDescriptor instead')
const CreateRoomRequest$json = {
  '1': 'CreateRoomRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'room_preset', '3': 12, '4': 1, '5': 9, '10': 'roomPreset'},
    {'1': 'empty_timeout', '3': 2, '4': 1, '5': 13, '10': 'emptyTimeout'},
    {'1': 'departure_timeout', '3': 10, '4': 1, '5': 13, '10': 'departureTimeout'},
    {'1': 'max_participants', '3': 3, '4': 1, '5': 13, '10': 'maxParticipants'},
    {'1': 'node_id', '3': 4, '4': 1, '5': 9, '10': 'nodeId'},
    {'1': 'metadata', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'metadata'},
    {'1': 'egress', '3': 6, '4': 1, '5': 11, '6': '.livekit.RoomEgress', '10': 'egress'},
    {'1': 'min_playout_delay', '3': 7, '4': 1, '5': 13, '10': 'minPlayoutDelay'},
    {'1': 'max_playout_delay', '3': 8, '4': 1, '5': 13, '10': 'maxPlayoutDelay'},
    {'1': 'sync_streams', '3': 9, '4': 1, '5': 8, '10': 'syncStreams'},
    {'1': 'replay_enabled', '3': 13, '4': 1, '5': 8, '10': 'replayEnabled'},
    {'1': 'agents', '3': 14, '4': 3, '5': 11, '6': '.livekit.RoomAgentDispatch', '10': 'agents'},
  ],
};

/// Descriptor for `CreateRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVSb29tUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEh8KC3Jvb21fcHJlc2V0GA'
    'wgASgJUgpyb29tUHJlc2V0EiMKDWVtcHR5X3RpbWVvdXQYAiABKA1SDGVtcHR5VGltZW91dBIr'
    'ChFkZXBhcnR1cmVfdGltZW91dBgKIAEoDVIQZGVwYXJ0dXJlVGltZW91dBIpChBtYXhfcGFydG'
    'ljaXBhbnRzGAMgASgNUg9tYXhQYXJ0aWNpcGFudHMSFwoHbm9kZV9pZBgEIAEoCVIGbm9kZUlk'
    'EkIKCG1ldGFkYXRhGAUgASgJQiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZX'
    'MpPlIIbWV0YWRhdGESKwoGZWdyZXNzGAYgASgLMhMubGl2ZWtpdC5Sb29tRWdyZXNzUgZlZ3Jl'
    'c3MSKgoRbWluX3BsYXlvdXRfZGVsYXkYByABKA1SD21pblBsYXlvdXREZWxheRIqChFtYXhfcG'
    'xheW91dF9kZWxheRgIIAEoDVIPbWF4UGxheW91dERlbGF5EiEKDHN5bmNfc3RyZWFtcxgJIAEo'
    'CFILc3luY1N0cmVhbXMSJQoOcmVwbGF5X2VuYWJsZWQYDSABKAhSDXJlcGxheUVuYWJsZWQSMg'
    'oGYWdlbnRzGA4gAygLMhoubGl2ZWtpdC5Sb29tQWdlbnREaXNwYXRjaFIGYWdlbnRz');

@$core.Deprecated('Use roomEgressDescriptor instead')
const RoomEgress$json = {
  '1': 'RoomEgress',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.livekit.RoomCompositeEgressRequest', '10': 'room'},
    {'1': 'participant', '3': 3, '4': 1, '5': 11, '6': '.livekit.AutoParticipantEgress', '10': 'participant'},
    {'1': 'tracks', '3': 2, '4': 1, '5': 11, '6': '.livekit.AutoTrackEgress', '10': 'tracks'},
  ],
};

/// Descriptor for `RoomEgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomEgressDescriptor = $convert.base64Decode(
    'CgpSb29tRWdyZXNzEjcKBHJvb20YASABKAsyIy5saXZla2l0LlJvb21Db21wb3NpdGVFZ3Jlc3'
    'NSZXF1ZXN0UgRyb29tEkAKC3BhcnRpY2lwYW50GAMgASgLMh4ubGl2ZWtpdC5BdXRvUGFydGlj'
    'aXBhbnRFZ3Jlc3NSC3BhcnRpY2lwYW50EjAKBnRyYWNrcxgCIAEoCzIYLmxpdmVraXQuQXV0b1'
    'RyYWNrRWdyZXNzUgZ0cmFja3M=');

@$core.Deprecated('Use roomAgentDescriptor instead')
const RoomAgent$json = {
  '1': 'RoomAgent',
  '2': [
    {'1': 'dispatches', '3': 1, '4': 3, '5': 11, '6': '.livekit.RoomAgentDispatch', '10': 'dispatches'},
  ],
};

/// Descriptor for `RoomAgent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomAgentDescriptor = $convert.base64Decode(
    'CglSb29tQWdlbnQSOgoKZGlzcGF0Y2hlcxgBIAMoCzIaLmxpdmVraXQuUm9vbUFnZW50RGlzcG'
    'F0Y2hSCmRpc3BhdGNoZXM=');

@$core.Deprecated('Use listRoomsRequestDescriptor instead')
const ListRoomsRequest$json = {
  '1': 'ListRoomsRequest',
  '2': [
    {'1': 'names', '3': 1, '4': 3, '5': 9, '10': 'names'},
  ],
};

/// Descriptor for `ListRoomsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRoomsRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0Um9vbXNSZXF1ZXN0EhQKBW5hbWVzGAEgAygJUgVuYW1lcw==');

@$core.Deprecated('Use listRoomsResponseDescriptor instead')
const ListRoomsResponse$json = {
  '1': 'ListRoomsResponse',
  '2': [
    {'1': 'rooms', '3': 1, '4': 3, '5': 11, '6': '.livekit.Room', '10': 'rooms'},
  ],
};

/// Descriptor for `ListRoomsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRoomsResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0Um9vbXNSZXNwb25zZRIjCgVyb29tcxgBIAMoCzINLmxpdmVraXQuUm9vbVIFcm9vbX'
    'M=');

@$core.Deprecated('Use deleteRoomRequestDescriptor instead')
const DeleteRoomRequest$json = {
  '1': 'DeleteRoomRequest',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 9, '10': 'room'},
  ],
};

/// Descriptor for `DeleteRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRoomRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVSb29tUmVxdWVzdBISCgRyb29tGAEgASgJUgRyb29t');

@$core.Deprecated('Use deleteRoomResponseDescriptor instead')
const DeleteRoomResponse$json = {
  '1': 'DeleteRoomResponse',
};

/// Descriptor for `DeleteRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRoomResponseDescriptor = $convert.base64Decode(
    'ChJEZWxldGVSb29tUmVzcG9uc2U=');

@$core.Deprecated('Use listParticipantsRequestDescriptor instead')
const ListParticipantsRequest$json = {
  '1': 'ListParticipantsRequest',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 9, '10': 'room'},
  ],
};

/// Descriptor for `ListParticipantsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listParticipantsRequestDescriptor = $convert.base64Decode(
    'ChdMaXN0UGFydGljaXBhbnRzUmVxdWVzdBISCgRyb29tGAEgASgJUgRyb29t');

@$core.Deprecated('Use listParticipantsResponseDescriptor instead')
const ListParticipantsResponse$json = {
  '1': 'ListParticipantsResponse',
  '2': [
    {'1': 'participants', '3': 1, '4': 3, '5': 11, '6': '.livekit.ParticipantInfo', '10': 'participants'},
  ],
};

/// Descriptor for `ListParticipantsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listParticipantsResponseDescriptor = $convert.base64Decode(
    'ChhMaXN0UGFydGljaXBhbnRzUmVzcG9uc2USPAoMcGFydGljaXBhbnRzGAEgAygLMhgubGl2ZW'
    'tpdC5QYXJ0aWNpcGFudEluZm9SDHBhcnRpY2lwYW50cw==');

@$core.Deprecated('Use roomParticipantIdentityDescriptor instead')
const RoomParticipantIdentity$json = {
  '1': 'RoomParticipantIdentity',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 9, '10': 'room'},
    {'1': 'identity', '3': 2, '4': 1, '5': 9, '10': 'identity'},
  ],
};

/// Descriptor for `RoomParticipantIdentity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomParticipantIdentityDescriptor = $convert.base64Decode(
    'ChdSb29tUGFydGljaXBhbnRJZGVudGl0eRISCgRyb29tGAEgASgJUgRyb29tEhoKCGlkZW50aX'
    'R5GAIgASgJUghpZGVudGl0eQ==');

@$core.Deprecated('Use removeParticipantResponseDescriptor instead')
const RemoveParticipantResponse$json = {
  '1': 'RemoveParticipantResponse',
};

/// Descriptor for `RemoveParticipantResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeParticipantResponseDescriptor = $convert.base64Decode(
    'ChlSZW1vdmVQYXJ0aWNpcGFudFJlc3BvbnNl');

@$core.Deprecated('Use muteRoomTrackRequestDescriptor instead')
const MuteRoomTrackRequest$json = {
  '1': 'MuteRoomTrackRequest',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 9, '10': 'room'},
    {'1': 'identity', '3': 2, '4': 1, '5': 9, '10': 'identity'},
    {'1': 'track_sid', '3': 3, '4': 1, '5': 9, '10': 'trackSid'},
    {'1': 'muted', '3': 4, '4': 1, '5': 8, '10': 'muted'},
  ],
};

/// Descriptor for `MuteRoomTrackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List muteRoomTrackRequestDescriptor = $convert.base64Decode(
    'ChRNdXRlUm9vbVRyYWNrUmVxdWVzdBISCgRyb29tGAEgASgJUgRyb29tEhoKCGlkZW50aXR5GA'
    'IgASgJUghpZGVudGl0eRIbCgl0cmFja19zaWQYAyABKAlSCHRyYWNrU2lkEhQKBW11dGVkGAQg'
    'ASgIUgVtdXRlZA==');

@$core.Deprecated('Use muteRoomTrackResponseDescriptor instead')
const MuteRoomTrackResponse$json = {
  '1': 'MuteRoomTrackResponse',
  '2': [
    {'1': 'track', '3': 1, '4': 1, '5': 11, '6': '.livekit.TrackInfo', '10': 'track'},
  ],
};

/// Descriptor for `MuteRoomTrackResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List muteRoomTrackResponseDescriptor = $convert.base64Decode(
    'ChVNdXRlUm9vbVRyYWNrUmVzcG9uc2USKAoFdHJhY2sYASABKAsyEi5saXZla2l0LlRyYWNrSW'
    '5mb1IFdHJhY2s=');

@$core.Deprecated('Use updateParticipantRequestDescriptor instead')
const UpdateParticipantRequest$json = {
  '1': 'UpdateParticipantRequest',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 9, '10': 'room'},
    {'1': 'identity', '3': 2, '4': 1, '5': 9, '10': 'identity'},
    {'1': 'metadata', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'metadata'},
    {'1': 'permission', '3': 4, '4': 1, '5': 11, '6': '.livekit.ParticipantPermission', '10': 'permission'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'attributes', '3': 6, '4': 3, '5': 11, '6': '.livekit.UpdateParticipantRequest.AttributesEntry', '8': {}, '10': 'attributes'},
  ],
  '3': [UpdateParticipantRequest_AttributesEntry$json],
};

@$core.Deprecated('Use updateParticipantRequestDescriptor instead')
const UpdateParticipantRequest_AttributesEntry$json = {
  '1': 'AttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `UpdateParticipantRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateParticipantRequestDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVQYXJ0aWNpcGFudFJlcXVlc3QSEgoEcm9vbRgBIAEoCVIEcm9vbRIaCghpZGVudG'
    'l0eRgCIAEoCVIIaWRlbnRpdHkSQgoIbWV0YWRhdGEYAyABKAlCJoi1GAGStRgePHJlZGFjdGVk'
    'ICh7eyAuU2l6ZSB9fSBieXRlcyk+UghtZXRhZGF0YRI+CgpwZXJtaXNzaW9uGAQgASgLMh4ubG'
    'l2ZWtpdC5QYXJ0aWNpcGFudFBlcm1pc3Npb25SCnBlcm1pc3Npb24SOgoEbmFtZRgFIAEoCUIm'
    'iLUYAZK1GB48cmVkYWN0ZWQgKHt7IC5TaXplIH19IGJ5dGVzKT5SBG5hbWUSeQoKYXR0cmlidX'
    'RlcxgGIAMoCzIxLmxpdmVraXQuVXBkYXRlUGFydGljaXBhbnRSZXF1ZXN0LkF0dHJpYnV0ZXNF'
    'bnRyeUImiLUYAZK1GB48cmVkYWN0ZWQgKHt7IC5TaXplIH19IGJ5dGVzKT5SCmF0dHJpYnV0ZX'
    'MaPQoPQXR0cmlidXRlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2'
    'YWx1ZToCOAE=');

@$core.Deprecated('Use updateSubscriptionsRequestDescriptor instead')
const UpdateSubscriptionsRequest$json = {
  '1': 'UpdateSubscriptionsRequest',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 9, '10': 'room'},
    {'1': 'identity', '3': 2, '4': 1, '5': 9, '10': 'identity'},
    {'1': 'track_sids', '3': 3, '4': 3, '5': 9, '10': 'trackSids'},
    {'1': 'subscribe', '3': 4, '4': 1, '5': 8, '10': 'subscribe'},
    {'1': 'participant_tracks', '3': 5, '4': 3, '5': 11, '6': '.livekit.ParticipantTracks', '10': 'participantTracks'},
  ],
};

/// Descriptor for `UpdateSubscriptionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSubscriptionsRequestDescriptor = $convert.base64Decode(
    'ChpVcGRhdGVTdWJzY3JpcHRpb25zUmVxdWVzdBISCgRyb29tGAEgASgJUgRyb29tEhoKCGlkZW'
    '50aXR5GAIgASgJUghpZGVudGl0eRIdCgp0cmFja19zaWRzGAMgAygJUgl0cmFja1NpZHMSHAoJ'
    'c3Vic2NyaWJlGAQgASgIUglzdWJzY3JpYmUSSQoScGFydGljaXBhbnRfdHJhY2tzGAUgAygLMh'
    'oubGl2ZWtpdC5QYXJ0aWNpcGFudFRyYWNrc1IRcGFydGljaXBhbnRUcmFja3M=');

@$core.Deprecated('Use updateSubscriptionsResponseDescriptor instead')
const UpdateSubscriptionsResponse$json = {
  '1': 'UpdateSubscriptionsResponse',
};

/// Descriptor for `UpdateSubscriptionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSubscriptionsResponseDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVTdWJzY3JpcHRpb25zUmVzcG9uc2U=');

@$core.Deprecated('Use sendDataRequestDescriptor instead')
const SendDataRequest$json = {
  '1': 'SendDataRequest',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 9, '10': 'room'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
    {'1': 'kind', '3': 3, '4': 1, '5': 14, '6': '.livekit.DataPacket.Kind', '10': 'kind'},
    {
      '1': 'destination_sids',
      '3': 4,
      '4': 3,
      '5': 9,
      '8': {'3': true},
      '10': 'destinationSids',
    },
    {'1': 'destination_identities', '3': 6, '4': 3, '5': 9, '10': 'destinationIdentities'},
    {'1': 'topic', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'topic', '17': true},
    {'1': 'nonce', '3': 7, '4': 1, '5': 12, '10': 'nonce'},
  ],
  '8': [
    {'1': '_topic'},
  ],
};

/// Descriptor for `SendDataRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendDataRequestDescriptor = $convert.base64Decode(
    'Cg9TZW5kRGF0YVJlcXVlc3QSEgoEcm9vbRgBIAEoCVIEcm9vbRISCgRkYXRhGAIgASgMUgRkYX'
    'RhEiwKBGtpbmQYAyABKA4yGC5saXZla2l0LkRhdGFQYWNrZXQuS2luZFIEa2luZBItChBkZXN0'
    'aW5hdGlvbl9zaWRzGAQgAygJQgIYAVIPZGVzdGluYXRpb25TaWRzEjUKFmRlc3RpbmF0aW9uX2'
    'lkZW50aXRpZXMYBiADKAlSFWRlc3RpbmF0aW9uSWRlbnRpdGllcxIZCgV0b3BpYxgFIAEoCUgA'
    'UgV0b3BpY4gBARIUCgVub25jZRgHIAEoDFIFbm9uY2VCCAoGX3RvcGlj');

@$core.Deprecated('Use sendDataResponseDescriptor instead')
const SendDataResponse$json = {
  '1': 'SendDataResponse',
};

/// Descriptor for `SendDataResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendDataResponseDescriptor = $convert.base64Decode(
    'ChBTZW5kRGF0YVJlc3BvbnNl');

@$core.Deprecated('Use updateRoomMetadataRequestDescriptor instead')
const UpdateRoomMetadataRequest$json = {
  '1': 'UpdateRoomMetadataRequest',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 9, '10': 'room'},
    {'1': 'metadata', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'metadata'},
  ],
};

/// Descriptor for `UpdateRoomMetadataRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRoomMetadataRequestDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVSb29tTWV0YWRhdGFSZXF1ZXN0EhIKBHJvb20YASABKAlSBHJvb20SQgoIbWV0YW'
    'RhdGEYAiABKAlCJoi1GAGStRgePHJlZGFjdGVkICh7eyAuU2l6ZSB9fSBieXRlcyk+UghtZXRh'
    'ZGF0YQ==');

@$core.Deprecated('Use roomConfigurationDescriptor instead')
const RoomConfiguration$json = {
  '1': 'RoomConfiguration',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'empty_timeout', '3': 2, '4': 1, '5': 13, '10': 'emptyTimeout'},
    {'1': 'departure_timeout', '3': 3, '4': 1, '5': 13, '10': 'departureTimeout'},
    {'1': 'max_participants', '3': 4, '4': 1, '5': 13, '10': 'maxParticipants'},
    {'1': 'metadata', '3': 11, '4': 1, '5': 9, '8': {}, '10': 'metadata'},
    {'1': 'egress', '3': 5, '4': 1, '5': 11, '6': '.livekit.RoomEgress', '10': 'egress'},
    {'1': 'min_playout_delay', '3': 7, '4': 1, '5': 13, '10': 'minPlayoutDelay'},
    {'1': 'max_playout_delay', '3': 8, '4': 1, '5': 13, '10': 'maxPlayoutDelay'},
    {'1': 'sync_streams', '3': 9, '4': 1, '5': 8, '10': 'syncStreams'},
    {'1': 'agents', '3': 10, '4': 3, '5': 11, '6': '.livekit.RoomAgentDispatch', '10': 'agents'},
  ],
};

/// Descriptor for `RoomConfiguration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomConfigurationDescriptor = $convert.base64Decode(
    'ChFSb29tQ29uZmlndXJhdGlvbhISCgRuYW1lGAEgASgJUgRuYW1lEiMKDWVtcHR5X3RpbWVvdX'
    'QYAiABKA1SDGVtcHR5VGltZW91dBIrChFkZXBhcnR1cmVfdGltZW91dBgDIAEoDVIQZGVwYXJ0'
    'dXJlVGltZW91dBIpChBtYXhfcGFydGljaXBhbnRzGAQgASgNUg9tYXhQYXJ0aWNpcGFudHMSQg'
    'oIbWV0YWRhdGEYCyABKAlCJoi1GAGStRgePHJlZGFjdGVkICh7eyAuU2l6ZSB9fSBieXRlcyk+'
    'UghtZXRhZGF0YRIrCgZlZ3Jlc3MYBSABKAsyEy5saXZla2l0LlJvb21FZ3Jlc3NSBmVncmVzcx'
    'IqChFtaW5fcGxheW91dF9kZWxheRgHIAEoDVIPbWluUGxheW91dERlbGF5EioKEW1heF9wbGF5'
    'b3V0X2RlbGF5GAggASgNUg9tYXhQbGF5b3V0RGVsYXkSIQoMc3luY19zdHJlYW1zGAkgASgIUg'
    'tzeW5jU3RyZWFtcxIyCgZhZ2VudHMYCiADKAsyGi5saXZla2l0LlJvb21BZ2VudERpc3BhdGNo'
    'UgZhZ2VudHM=');

@$core.Deprecated('Use forwardParticipantRequestDescriptor instead')
const ForwardParticipantRequest$json = {
  '1': 'ForwardParticipantRequest',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 9, '10': 'room'},
    {'1': 'identity', '3': 2, '4': 1, '5': 9, '10': 'identity'},
    {'1': 'destination_room', '3': 3, '4': 1, '5': 9, '10': 'destinationRoom'},
  ],
};

/// Descriptor for `ForwardParticipantRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forwardParticipantRequestDescriptor = $convert.base64Decode(
    'ChlGb3J3YXJkUGFydGljaXBhbnRSZXF1ZXN0EhIKBHJvb20YASABKAlSBHJvb20SGgoIaWRlbn'
    'RpdHkYAiABKAlSCGlkZW50aXR5EikKEGRlc3RpbmF0aW9uX3Jvb20YAyABKAlSD2Rlc3RpbmF0'
    'aW9uUm9vbQ==');

@$core.Deprecated('Use forwardParticipantResponseDescriptor instead')
const ForwardParticipantResponse$json = {
  '1': 'ForwardParticipantResponse',
};

/// Descriptor for `ForwardParticipantResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forwardParticipantResponseDescriptor = $convert.base64Decode(
    'ChpGb3J3YXJkUGFydGljaXBhbnRSZXNwb25zZQ==');

@$core.Deprecated('Use moveParticipantRequestDescriptor instead')
const MoveParticipantRequest$json = {
  '1': 'MoveParticipantRequest',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 9, '10': 'room'},
    {'1': 'identity', '3': 2, '4': 1, '5': 9, '10': 'identity'},
    {'1': 'destination_room', '3': 3, '4': 1, '5': 9, '10': 'destinationRoom'},
  ],
};

/// Descriptor for `MoveParticipantRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveParticipantRequestDescriptor = $convert.base64Decode(
    'ChZNb3ZlUGFydGljaXBhbnRSZXF1ZXN0EhIKBHJvb20YASABKAlSBHJvb20SGgoIaWRlbnRpdH'
    'kYAiABKAlSCGlkZW50aXR5EikKEGRlc3RpbmF0aW9uX3Jvb20YAyABKAlSD2Rlc3RpbmF0aW9u'
    'Um9vbQ==');

@$core.Deprecated('Use moveParticipantResponseDescriptor instead')
const MoveParticipantResponse$json = {
  '1': 'MoveParticipantResponse',
};

/// Descriptor for `MoveParticipantResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveParticipantResponseDescriptor = $convert.base64Decode(
    'ChdNb3ZlUGFydGljaXBhbnRSZXNwb25zZQ==');

@$core.Deprecated('Use performRpcRequestDescriptor instead')
const PerformRpcRequest$json = {
  '1': 'PerformRpcRequest',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 9, '10': 'room'},
    {'1': 'destination_identity', '3': 2, '4': 1, '5': 9, '10': 'destinationIdentity'},
    {'1': 'method', '3': 3, '4': 1, '5': 9, '10': 'method'},
    {'1': 'payload', '3': 4, '4': 1, '5': 9, '10': 'payload'},
    {'1': 'response_timeout_ms', '3': 5, '4': 1, '5': 13, '10': 'responseTimeoutMs'},
  ],
};

/// Descriptor for `PerformRpcRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List performRpcRequestDescriptor = $convert.base64Decode(
    'ChFQZXJmb3JtUnBjUmVxdWVzdBISCgRyb29tGAEgASgJUgRyb29tEjEKFGRlc3RpbmF0aW9uX2'
    'lkZW50aXR5GAIgASgJUhNkZXN0aW5hdGlvbklkZW50aXR5EhYKBm1ldGhvZBgDIAEoCVIGbWV0'
    'aG9kEhgKB3BheWxvYWQYBCABKAlSB3BheWxvYWQSLgoTcmVzcG9uc2VfdGltZW91dF9tcxgFIA'
    'EoDVIRcmVzcG9uc2VUaW1lb3V0TXM=');

@$core.Deprecated('Use performRpcResponseDescriptor instead')
const PerformRpcResponse$json = {
  '1': 'PerformRpcResponse',
  '2': [
    {'1': 'payload', '3': 1, '4': 1, '5': 9, '10': 'payload'},
  ],
};

/// Descriptor for `PerformRpcResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List performRpcResponseDescriptor = $convert.base64Decode(
    'ChJQZXJmb3JtUnBjUmVzcG9uc2USGAoHcGF5bG9hZBgBIAEoCVIHcGF5bG9hZA==');

const $core.Map<$core.String, $core.dynamic> RoomServiceBase$json = {
  '1': 'RoomService',
  '2': [
    {'1': 'CreateRoom', '2': '.livekit.CreateRoomRequest', '3': '.livekit.Room'},
    {'1': 'ListRooms', '2': '.livekit.ListRoomsRequest', '3': '.livekit.ListRoomsResponse'},
    {'1': 'DeleteRoom', '2': '.livekit.DeleteRoomRequest', '3': '.livekit.DeleteRoomResponse'},
    {'1': 'ListParticipants', '2': '.livekit.ListParticipantsRequest', '3': '.livekit.ListParticipantsResponse'},
    {'1': 'GetParticipant', '2': '.livekit.RoomParticipantIdentity', '3': '.livekit.ParticipantInfo'},
    {'1': 'RemoveParticipant', '2': '.livekit.RoomParticipantIdentity', '3': '.livekit.RemoveParticipantResponse'},
    {'1': 'MutePublishedTrack', '2': '.livekit.MuteRoomTrackRequest', '3': '.livekit.MuteRoomTrackResponse'},
    {'1': 'UpdateParticipant', '2': '.livekit.UpdateParticipantRequest', '3': '.livekit.ParticipantInfo'},
    {'1': 'UpdateSubscriptions', '2': '.livekit.UpdateSubscriptionsRequest', '3': '.livekit.UpdateSubscriptionsResponse'},
    {'1': 'SendData', '2': '.livekit.SendDataRequest', '3': '.livekit.SendDataResponse'},
    {'1': 'UpdateRoomMetadata', '2': '.livekit.UpdateRoomMetadataRequest', '3': '.livekit.Room'},
    {'1': 'ForwardParticipant', '2': '.livekit.ForwardParticipantRequest', '3': '.livekit.ForwardParticipantResponse'},
    {'1': 'MoveParticipant', '2': '.livekit.MoveParticipantRequest', '3': '.livekit.MoveParticipantResponse'},
    {'1': 'PerformRpc', '2': '.livekit.PerformRpcRequest', '3': '.livekit.PerformRpcResponse'},
  ],
};

@$core.Deprecated('Use roomServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> RoomServiceBase$messageJson = {
  '.livekit.CreateRoomRequest': CreateRoomRequest$json,
  '.livekit.RoomEgress': RoomEgress$json,
  '.livekit.RoomCompositeEgressRequest': $7.RoomCompositeEgressRequest$json,
  '.livekit.EncodedFileOutput': $7.EncodedFileOutput$json,
  '.livekit.S3Upload': $7.S3Upload$json,
  '.livekit.S3Upload.MetadataEntry': $7.S3Upload_MetadataEntry$json,
  '.livekit.ProxyConfig': $7.ProxyConfig$json,
  '.livekit.GCPUpload': $7.GCPUpload$json,
  '.livekit.AzureBlobUpload': $7.AzureBlobUpload$json,
  '.livekit.AliOSSUpload': $7.AliOSSUpload$json,
  '.livekit.StreamOutput': $7.StreamOutput$json,
  '.livekit.EncodingOptions': $7.EncodingOptions$json,
  '.livekit.SegmentedFileOutput': $7.SegmentedFileOutput$json,
  '.livekit.ImageOutput': $7.ImageOutput$json,
  '.livekit.WebhookConfig': $2.WebhookConfig$json,
  '.livekit.FilterParams': $2.FilterParams$json,
  '.livekit.AutoTrackEgress': $7.AutoTrackEgress$json,
  '.livekit.AutoParticipantEgress': $7.AutoParticipantEgress$json,
  '.livekit.RoomAgentDispatch': $6.RoomAgentDispatch$json,
  '.livekit.Room': $2.Room$json,
  '.livekit.Codec': $2.Codec$json,
  '.livekit.TimedVersion': $2.TimedVersion$json,
  '.livekit.ListRoomsRequest': ListRoomsRequest$json,
  '.livekit.ListRoomsResponse': ListRoomsResponse$json,
  '.livekit.DeleteRoomRequest': DeleteRoomRequest$json,
  '.livekit.DeleteRoomResponse': DeleteRoomResponse$json,
  '.livekit.ListParticipantsRequest': ListParticipantsRequest$json,
  '.livekit.ListParticipantsResponse': ListParticipantsResponse$json,
  '.livekit.ParticipantInfo': $2.ParticipantInfo$json,
  '.livekit.TrackInfo': $2.TrackInfo$json,
  '.livekit.VideoLayer': $2.VideoLayer$json,
  '.livekit.SimulcastCodecInfo': $2.SimulcastCodecInfo$json,
  '.livekit.ParticipantPermission': $2.ParticipantPermission$json,
  '.livekit.ParticipantInfo.AttributesEntry': $2.ParticipantInfo_AttributesEntry$json,
  '.livekit.DataTrackInfo': $2.DataTrackInfo$json,
  '.livekit.RoomParticipantIdentity': RoomParticipantIdentity$json,
  '.livekit.RemoveParticipantResponse': RemoveParticipantResponse$json,
  '.livekit.MuteRoomTrackRequest': MuteRoomTrackRequest$json,
  '.livekit.MuteRoomTrackResponse': MuteRoomTrackResponse$json,
  '.livekit.UpdateParticipantRequest': UpdateParticipantRequest$json,
  '.livekit.UpdateParticipantRequest.AttributesEntry': UpdateParticipantRequest_AttributesEntry$json,
  '.livekit.UpdateSubscriptionsRequest': UpdateSubscriptionsRequest$json,
  '.livekit.ParticipantTracks': $2.ParticipantTracks$json,
  '.livekit.UpdateSubscriptionsResponse': UpdateSubscriptionsResponse$json,
  '.livekit.SendDataRequest': SendDataRequest$json,
  '.livekit.SendDataResponse': SendDataResponse$json,
  '.livekit.UpdateRoomMetadataRequest': UpdateRoomMetadataRequest$json,
  '.livekit.ForwardParticipantRequest': ForwardParticipantRequest$json,
  '.livekit.ForwardParticipantResponse': ForwardParticipantResponse$json,
  '.livekit.MoveParticipantRequest': MoveParticipantRequest$json,
  '.livekit.MoveParticipantResponse': MoveParticipantResponse$json,
  '.livekit.PerformRpcRequest': PerformRpcRequest$json,
  '.livekit.PerformRpcResponse': PerformRpcResponse$json,
};

/// Descriptor for `RoomService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List roomServiceDescriptor = $convert.base64Decode(
    'CgtSb29tU2VydmljZRI3CgpDcmVhdGVSb29tEhoubGl2ZWtpdC5DcmVhdGVSb29tUmVxdWVzdB'
    'oNLmxpdmVraXQuUm9vbRJCCglMaXN0Um9vbXMSGS5saXZla2l0Lkxpc3RSb29tc1JlcXVlc3Qa'
    'Gi5saXZla2l0Lkxpc3RSb29tc1Jlc3BvbnNlEkUKCkRlbGV0ZVJvb20SGi5saXZla2l0LkRlbG'
    'V0ZVJvb21SZXF1ZXN0GhsubGl2ZWtpdC5EZWxldGVSb29tUmVzcG9uc2USVwoQTGlzdFBhcnRp'
    'Y2lwYW50cxIgLmxpdmVraXQuTGlzdFBhcnRpY2lwYW50c1JlcXVlc3QaIS5saXZla2l0Lkxpc3'
    'RQYXJ0aWNpcGFudHNSZXNwb25zZRJMCg5HZXRQYXJ0aWNpcGFudBIgLmxpdmVraXQuUm9vbVBh'
    'cnRpY2lwYW50SWRlbnRpdHkaGC5saXZla2l0LlBhcnRpY2lwYW50SW5mbxJZChFSZW1vdmVQYX'
    'J0aWNpcGFudBIgLmxpdmVraXQuUm9vbVBhcnRpY2lwYW50SWRlbnRpdHkaIi5saXZla2l0LlJl'
    'bW92ZVBhcnRpY2lwYW50UmVzcG9uc2USUwoSTXV0ZVB1Ymxpc2hlZFRyYWNrEh0ubGl2ZWtpdC'
    '5NdXRlUm9vbVRyYWNrUmVxdWVzdBoeLmxpdmVraXQuTXV0ZVJvb21UcmFja1Jlc3BvbnNlElAK'
    'EVVwZGF0ZVBhcnRpY2lwYW50EiEubGl2ZWtpdC5VcGRhdGVQYXJ0aWNpcGFudFJlcXVlc3QaGC'
    '5saXZla2l0LlBhcnRpY2lwYW50SW5mbxJgChNVcGRhdGVTdWJzY3JpcHRpb25zEiMubGl2ZWtp'
    'dC5VcGRhdGVTdWJzY3JpcHRpb25zUmVxdWVzdBokLmxpdmVraXQuVXBkYXRlU3Vic2NyaXB0aW'
    '9uc1Jlc3BvbnNlEj8KCFNlbmREYXRhEhgubGl2ZWtpdC5TZW5kRGF0YVJlcXVlc3QaGS5saXZl'
    'a2l0LlNlbmREYXRhUmVzcG9uc2USRwoSVXBkYXRlUm9vbU1ldGFkYXRhEiIubGl2ZWtpdC5VcG'
    'RhdGVSb29tTWV0YWRhdGFSZXF1ZXN0Gg0ubGl2ZWtpdC5Sb29tEl0KEkZvcndhcmRQYXJ0aWNp'
    'cGFudBIiLmxpdmVraXQuRm9yd2FyZFBhcnRpY2lwYW50UmVxdWVzdBojLmxpdmVraXQuRm9yd2'
    'FyZFBhcnRpY2lwYW50UmVzcG9uc2USVAoPTW92ZVBhcnRpY2lwYW50Eh8ubGl2ZWtpdC5Nb3Zl'
    'UGFydGljaXBhbnRSZXF1ZXN0GiAubGl2ZWtpdC5Nb3ZlUGFydGljaXBhbnRSZXNwb25zZRJFCg'
    'pQZXJmb3JtUnBjEhoubGl2ZWtpdC5QZXJmb3JtUnBjUmVxdWVzdBobLmxpdmVraXQuUGVyZm9y'
    'bVJwY1Jlc3BvbnNl');

