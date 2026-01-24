//
//  Generated code. Do not modify.
//  source: livekit_connector_twilio.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use connectTwilioCallRequestDescriptor instead')
const ConnectTwilioCallRequest$json = {
  '1': 'ConnectTwilioCallRequest',
  '2': [
    {'1': 'twilio_call_direction', '3': 1, '4': 1, '5': 14, '6': '.livekit.ConnectTwilioCallRequest.TwilioCallDirection', '10': 'twilioCallDirection'},
    {'1': 'room_name', '3': 2, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'agents', '3': 3, '4': 3, '5': 11, '6': '.livekit.RoomAgentDispatch', '10': 'agents'},
    {'1': 'participant_identity', '3': 4, '4': 1, '5': 9, '10': 'participantIdentity'},
    {'1': 'participant_name', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'participantName'},
    {'1': 'participant_metadata', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'participantMetadata'},
    {'1': 'participant_attributes', '3': 7, '4': 3, '5': 11, '6': '.livekit.ConnectTwilioCallRequest.ParticipantAttributesEntry', '8': {}, '10': 'participantAttributes'},
    {'1': 'destination_country', '3': 8, '4': 1, '5': 9, '10': 'destinationCountry'},
  ],
  '3': [ConnectTwilioCallRequest_ParticipantAttributesEntry$json],
  '4': [ConnectTwilioCallRequest_TwilioCallDirection$json],
};

@$core.Deprecated('Use connectTwilioCallRequestDescriptor instead')
const ConnectTwilioCallRequest_ParticipantAttributesEntry$json = {
  '1': 'ParticipantAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use connectTwilioCallRequestDescriptor instead')
const ConnectTwilioCallRequest_TwilioCallDirection$json = {
  '1': 'TwilioCallDirection',
  '2': [
    {'1': 'TWILIO_CALL_DIRECTION_INBOUND', '2': 0},
    {'1': 'TWILIO_CALL_DIRECTION_OUTBOUND', '2': 1},
  ],
};

/// Descriptor for `ConnectTwilioCallRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectTwilioCallRequestDescriptor = $convert.base64Decode(
    'ChhDb25uZWN0VHdpbGlvQ2FsbFJlcXVlc3QSaQoVdHdpbGlvX2NhbGxfZGlyZWN0aW9uGAEgAS'
    'gOMjUubGl2ZWtpdC5Db25uZWN0VHdpbGlvQ2FsbFJlcXVlc3QuVHdpbGlvQ2FsbERpcmVjdGlv'
    'blITdHdpbGlvQ2FsbERpcmVjdGlvbhIbCglyb29tX25hbWUYAiABKAlSCHJvb21OYW1lEjIKBm'
    'FnZW50cxgDIAMoCzIaLmxpdmVraXQuUm9vbUFnZW50RGlzcGF0Y2hSBmFnZW50cxIxChRwYXJ0'
    'aWNpcGFudF9pZGVudGl0eRgEIAEoCVITcGFydGljaXBhbnRJZGVudGl0eRJRChBwYXJ0aWNpcG'
    'FudF9uYW1lGAUgASgJQiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPlIP'
    'cGFydGljaXBhbnROYW1lElkKFHBhcnRpY2lwYW50X21ldGFkYXRhGAYgASgJQiaItRgBkrUYHj'
    'xyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPlITcGFydGljaXBhbnRNZXRhZGF0YRKbAQoW'
    'cGFydGljaXBhbnRfYXR0cmlidXRlcxgHIAMoCzI8LmxpdmVraXQuQ29ubmVjdFR3aWxpb0NhbG'
    'xSZXF1ZXN0LlBhcnRpY2lwYW50QXR0cmlidXRlc0VudHJ5QiaItRgBkrUYHjxyZWRhY3RlZCAo'
    'e3sgLlNpemUgfX0gYnl0ZXMpPlIVcGFydGljaXBhbnRBdHRyaWJ1dGVzEi8KE2Rlc3RpbmF0aW'
    '9uX2NvdW50cnkYCCABKAlSEmRlc3RpbmF0aW9uQ291bnRyeRpIChpQYXJ0aWNpcGFudEF0dHJp'
    'YnV0ZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBIl'
    'wKE1R3aWxpb0NhbGxEaXJlY3Rpb24SIQodVFdJTElPX0NBTExfRElSRUNUSU9OX0lOQk9VTkQQ'
    'ABIiCh5UV0lMSU9fQ0FMTF9ESVJFQ1RJT05fT1VUQk9VTkQQAQ==');

@$core.Deprecated('Use connectTwilioCallResponseDescriptor instead')
const ConnectTwilioCallResponse$json = {
  '1': 'ConnectTwilioCallResponse',
  '2': [
    {'1': 'connect_url', '3': 1, '4': 1, '5': 9, '10': 'connectUrl'},
  ],
};

/// Descriptor for `ConnectTwilioCallResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectTwilioCallResponseDescriptor = $convert.base64Decode(
    'ChlDb25uZWN0VHdpbGlvQ2FsbFJlc3BvbnNlEh8KC2Nvbm5lY3RfdXJsGAEgASgJUgpjb25uZW'
    'N0VXJs');

