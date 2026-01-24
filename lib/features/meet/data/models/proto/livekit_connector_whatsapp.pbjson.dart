// This is a generated file - do not edit.
//
// Generated from livekit_connector_whatsapp.proto.

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

@$core.Deprecated('Use whatsAppCallDirectionDescriptor instead')
const WhatsAppCallDirection$json = {
  '1': 'WhatsAppCallDirection',
  '2': [
    {'1': 'WHATSAPP_CALL_DIRECTION_INBOUND', '2': 0},
    {'1': 'WHATSAPP_CALL_DIRECTION_OUTBOUND', '2': 2},
  ],
};

/// Descriptor for `WhatsAppCallDirection`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List whatsAppCallDirectionDescriptor = $convert.base64Decode(
    'ChVXaGF0c0FwcENhbGxEaXJlY3Rpb24SIwofV0hBVFNBUFBfQ0FMTF9ESVJFQ1RJT05fSU5CT1'
    'VORBAAEiQKIFdIQVRTQVBQX0NBTExfRElSRUNUSU9OX09VVEJPVU5EEAI=');

@$core.Deprecated('Use dialWhatsAppCallRequestDescriptor instead')
const DialWhatsAppCallRequest$json = {
  '1': 'DialWhatsAppCallRequest',
  '2': [
    {
      '1': 'whatsapp_phone_number_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'whatsappPhoneNumberId'
    },
    {
      '1': 'whatsapp_to_phone_number',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'whatsappToPhoneNumber'
    },
    {
      '1': 'whatsapp_api_key',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'whatsappApiKey'
    },
    {
      '1': 'whatsapp_cloud_api_version',
      '3': 12,
      '4': 1,
      '5': 9,
      '10': 'whatsappCloudApiVersion'
    },
    {
      '1': 'whatsapp_biz_opaque_callback_data',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'whatsappBizOpaqueCallbackData'
    },
    {'1': 'room_name', '3': 5, '4': 1, '5': 9, '10': 'roomName'},
    {
      '1': 'agents',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.livekit.RoomAgentDispatch',
      '10': 'agents'
    },
    {
      '1': 'participant_identity',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'participantIdentity'
    },
    {
      '1': 'participant_name',
      '3': 8,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'participantName'
    },
    {
      '1': 'participant_metadata',
      '3': 9,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'participantMetadata'
    },
    {
      '1': 'participant_attributes',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.livekit.DialWhatsAppCallRequest.ParticipantAttributesEntry',
      '8': {},
      '10': 'participantAttributes'
    },
    {
      '1': 'destination_country',
      '3': 11,
      '4': 1,
      '5': 9,
      '10': 'destinationCountry'
    },
  ],
  '3': [DialWhatsAppCallRequest_ParticipantAttributesEntry$json],
};

@$core.Deprecated('Use dialWhatsAppCallRequestDescriptor instead')
const DialWhatsAppCallRequest_ParticipantAttributesEntry$json = {
  '1': 'ParticipantAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `DialWhatsAppCallRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dialWhatsAppCallRequestDescriptor = $convert.base64Decode(
    'ChdEaWFsV2hhdHNBcHBDYWxsUmVxdWVzdBI3Chh3aGF0c2FwcF9waG9uZV9udW1iZXJfaWQYAS'
    'ABKAlSFXdoYXRzYXBwUGhvbmVOdW1iZXJJZBI3Chh3aGF0c2FwcF90b19waG9uZV9udW1iZXIY'
    'AiABKAlSFXdoYXRzYXBwVG9QaG9uZU51bWJlchIuChB3aGF0c2FwcF9hcGlfa2V5GAMgASgJQg'
    'SItRgBUg53aGF0c2FwcEFwaUtleRI7Chp3aGF0c2FwcF9jbG91ZF9hcGlfdmVyc2lvbhgMIAEo'
    'CVIXd2hhdHNhcHBDbG91ZEFwaVZlcnNpb24SSAohd2hhdHNhcHBfYml6X29wYXF1ZV9jYWxsYm'
    'Fja19kYXRhGAQgASgJUh13aGF0c2FwcEJpek9wYXF1ZUNhbGxiYWNrRGF0YRIbCglyb29tX25h'
    'bWUYBSABKAlSCHJvb21OYW1lEjIKBmFnZW50cxgGIAMoCzIaLmxpdmVraXQuUm9vbUFnZW50RG'
    'lzcGF0Y2hSBmFnZW50cxIxChRwYXJ0aWNpcGFudF9pZGVudGl0eRgHIAEoCVITcGFydGljaXBh'
    'bnRJZGVudGl0eRJRChBwYXJ0aWNpcGFudF9uYW1lGAggASgJQiaItRgBkrUYHjxyZWRhY3RlZC'
    'Aoe3sgLlNpemUgfX0gYnl0ZXMpPlIPcGFydGljaXBhbnROYW1lElkKFHBhcnRpY2lwYW50X21l'
    'dGFkYXRhGAkgASgJQiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPlITcG'
    'FydGljaXBhbnRNZXRhZGF0YRKaAQoWcGFydGljaXBhbnRfYXR0cmlidXRlcxgKIAMoCzI7Lmxp'
    'dmVraXQuRGlhbFdoYXRzQXBwQ2FsbFJlcXVlc3QuUGFydGljaXBhbnRBdHRyaWJ1dGVzRW50cn'
    'lCJoi1GAGStRgePHJlZGFjdGVkICh7eyAuU2l6ZSB9fSBieXRlcyk+UhVwYXJ0aWNpcGFudEF0'
    'dHJpYnV0ZXMSLwoTZGVzdGluYXRpb25fY291bnRyeRgLIAEoCVISZGVzdGluYXRpb25Db3VudH'
    'J5GkgKGlBhcnRpY2lwYW50QXR0cmlidXRlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZh'
    'bHVlGAIgASgJUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use dialWhatsAppCallResponseDescriptor instead')
const DialWhatsAppCallResponse$json = {
  '1': 'DialWhatsAppCallResponse',
  '2': [
    {'1': 'whatsapp_call_id', '3': 1, '4': 1, '5': 9, '10': 'whatsappCallId'},
    {'1': 'room_name', '3': 2, '4': 1, '5': 9, '10': 'roomName'},
  ],
};

/// Descriptor for `DialWhatsAppCallResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dialWhatsAppCallResponseDescriptor =
    $convert.base64Decode(
        'ChhEaWFsV2hhdHNBcHBDYWxsUmVzcG9uc2USKAoQd2hhdHNhcHBfY2FsbF9pZBgBIAEoCVIOd2'
        'hhdHNhcHBDYWxsSWQSGwoJcm9vbV9uYW1lGAIgASgJUghyb29tTmFtZQ==');

@$core.Deprecated('Use disconnectWhatsAppCallRequestDescriptor instead')
const DisconnectWhatsAppCallRequest$json = {
  '1': 'DisconnectWhatsAppCallRequest',
  '2': [
    {'1': 'whatsapp_call_id', '3': 1, '4': 1, '5': 9, '10': 'whatsappCallId'},
    {
      '1': 'whatsapp_api_key',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'whatsappApiKey'
    },
  ],
};

/// Descriptor for `DisconnectWhatsAppCallRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disconnectWhatsAppCallRequestDescriptor =
    $convert.base64Decode(
        'Ch1EaXNjb25uZWN0V2hhdHNBcHBDYWxsUmVxdWVzdBIoChB3aGF0c2FwcF9jYWxsX2lkGAEgAS'
        'gJUg53aGF0c2FwcENhbGxJZBIuChB3aGF0c2FwcF9hcGlfa2V5GAIgASgJQgSItRgBUg53aGF0'
        'c2FwcEFwaUtleQ==');

@$core.Deprecated('Use disconnectWhatsAppCallResponseDescriptor instead')
const DisconnectWhatsAppCallResponse$json = {
  '1': 'DisconnectWhatsAppCallResponse',
};

/// Descriptor for `DisconnectWhatsAppCallResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disconnectWhatsAppCallResponseDescriptor =
    $convert.base64Decode('Ch5EaXNjb25uZWN0V2hhdHNBcHBDYWxsUmVzcG9uc2U=');

@$core.Deprecated('Use connectWhatsAppCallRequestDescriptor instead')
const ConnectWhatsAppCallRequest$json = {
  '1': 'ConnectWhatsAppCallRequest',
  '2': [
    {'1': 'whatsapp_call_id', '3': 1, '4': 1, '5': 9, '10': 'whatsappCallId'},
    {
      '1': 'sdp',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.livekit.SessionDescription',
      '10': 'sdp'
    },
  ],
};

/// Descriptor for `ConnectWhatsAppCallRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectWhatsAppCallRequestDescriptor =
    $convert.base64Decode(
        'ChpDb25uZWN0V2hhdHNBcHBDYWxsUmVxdWVzdBIoChB3aGF0c2FwcF9jYWxsX2lkGAEgASgJUg'
        '53aGF0c2FwcENhbGxJZBItCgNzZHAYAiABKAsyGy5saXZla2l0LlNlc3Npb25EZXNjcmlwdGlv'
        'blIDc2Rw');

@$core.Deprecated('Use connectWhatsAppCallResponseDescriptor instead')
const ConnectWhatsAppCallResponse$json = {
  '1': 'ConnectWhatsAppCallResponse',
};

/// Descriptor for `ConnectWhatsAppCallResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectWhatsAppCallResponseDescriptor =
    $convert.base64Decode('ChtDb25uZWN0V2hhdHNBcHBDYWxsUmVzcG9uc2U=');

@$core.Deprecated('Use acceptWhatsAppCallRequestDescriptor instead')
const AcceptWhatsAppCallRequest$json = {
  '1': 'AcceptWhatsAppCallRequest',
  '2': [
    {
      '1': 'whatsapp_phone_number_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'whatsappPhoneNumberId'
    },
    {
      '1': 'whatsapp_api_key',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'whatsappApiKey'
    },
    {
      '1': 'whatsapp_cloud_api_version',
      '3': 13,
      '4': 1,
      '5': 9,
      '10': 'whatsappCloudApiVersion'
    },
    {'1': 'whatsapp_call_id', '3': 3, '4': 1, '5': 9, '10': 'whatsappCallId'},
    {
      '1': 'whatsapp_biz_opaque_callback_data',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'whatsappBizOpaqueCallbackData'
    },
    {
      '1': 'sdp',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.livekit.SessionDescription',
      '10': 'sdp'
    },
    {'1': 'room_name', '3': 6, '4': 1, '5': 9, '10': 'roomName'},
    {
      '1': 'agents',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.livekit.RoomAgentDispatch',
      '10': 'agents'
    },
    {
      '1': 'participant_identity',
      '3': 8,
      '4': 1,
      '5': 9,
      '10': 'participantIdentity'
    },
    {
      '1': 'participant_name',
      '3': 9,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'participantName'
    },
    {
      '1': 'participant_metadata',
      '3': 10,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'participantMetadata'
    },
    {
      '1': 'participant_attributes',
      '3': 11,
      '4': 3,
      '5': 11,
      '6': '.livekit.AcceptWhatsAppCallRequest.ParticipantAttributesEntry',
      '8': {},
      '10': 'participantAttributes'
    },
    {
      '1': 'destination_country',
      '3': 12,
      '4': 1,
      '5': 9,
      '10': 'destinationCountry'
    },
  ],
  '3': [AcceptWhatsAppCallRequest_ParticipantAttributesEntry$json],
};

@$core.Deprecated('Use acceptWhatsAppCallRequestDescriptor instead')
const AcceptWhatsAppCallRequest_ParticipantAttributesEntry$json = {
  '1': 'ParticipantAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `AcceptWhatsAppCallRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acceptWhatsAppCallRequestDescriptor = $convert.base64Decode(
    'ChlBY2NlcHRXaGF0c0FwcENhbGxSZXF1ZXN0EjcKGHdoYXRzYXBwX3Bob25lX251bWJlcl9pZB'
    'gBIAEoCVIVd2hhdHNhcHBQaG9uZU51bWJlcklkEi4KEHdoYXRzYXBwX2FwaV9rZXkYAiABKAlC'
    'BIi1GAFSDndoYXRzYXBwQXBpS2V5EjsKGndoYXRzYXBwX2Nsb3VkX2FwaV92ZXJzaW9uGA0gAS'
    'gJUhd3aGF0c2FwcENsb3VkQXBpVmVyc2lvbhIoChB3aGF0c2FwcF9jYWxsX2lkGAMgASgJUg53'
    'aGF0c2FwcENhbGxJZBJICiF3aGF0c2FwcF9iaXpfb3BhcXVlX2NhbGxiYWNrX2RhdGEYBCABKA'
    'lSHXdoYXRzYXBwQml6T3BhcXVlQ2FsbGJhY2tEYXRhEi0KA3NkcBgFIAEoCzIbLmxpdmVraXQu'
    'U2Vzc2lvbkRlc2NyaXB0aW9uUgNzZHASGwoJcm9vbV9uYW1lGAYgASgJUghyb29tTmFtZRIyCg'
    'ZhZ2VudHMYByADKAsyGi5saXZla2l0LlJvb21BZ2VudERpc3BhdGNoUgZhZ2VudHMSMQoUcGFy'
    'dGljaXBhbnRfaWRlbnRpdHkYCCABKAlSE3BhcnRpY2lwYW50SWRlbnRpdHkSUQoQcGFydGljaX'
    'BhbnRfbmFtZRgJIAEoCUImiLUYAZK1GB48cmVkYWN0ZWQgKHt7IC5TaXplIH19IGJ5dGVzKT5S'
    'D3BhcnRpY2lwYW50TmFtZRJZChRwYXJ0aWNpcGFudF9tZXRhZGF0YRgKIAEoCUImiLUYAZK1GB'
    '48cmVkYWN0ZWQgKHt7IC5TaXplIH19IGJ5dGVzKT5SE3BhcnRpY2lwYW50TWV0YWRhdGESnAEK'
    'FnBhcnRpY2lwYW50X2F0dHJpYnV0ZXMYCyADKAsyPS5saXZla2l0LkFjY2VwdFdoYXRzQXBwQ2'
    'FsbFJlcXVlc3QuUGFydGljaXBhbnRBdHRyaWJ1dGVzRW50cnlCJoi1GAGStRgePHJlZGFjdGVk'
    'ICh7eyAuU2l6ZSB9fSBieXRlcyk+UhVwYXJ0aWNpcGFudEF0dHJpYnV0ZXMSLwoTZGVzdGluYX'
    'Rpb25fY291bnRyeRgMIAEoCVISZGVzdGluYXRpb25Db3VudHJ5GkgKGlBhcnRpY2lwYW50QXR0'
    'cmlidXRlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOA'
    'E=');

@$core.Deprecated('Use acceptWhatsAppCallResponseDescriptor instead')
const AcceptWhatsAppCallResponse$json = {
  '1': 'AcceptWhatsAppCallResponse',
  '2': [
    {'1': 'room_name', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
  ],
};

/// Descriptor for `AcceptWhatsAppCallResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acceptWhatsAppCallResponseDescriptor =
    $convert.base64Decode(
        'ChpBY2NlcHRXaGF0c0FwcENhbGxSZXNwb25zZRIbCglyb29tX25hbWUYASABKAlSCHJvb21OYW'
        '1l');

@$core.Deprecated('Use whatsAppCallDescriptor instead')
const WhatsAppCall$json = {
  '1': 'WhatsAppCall',
  '2': [
    {'1': 'whatsapp_call_id', '3': 1, '4': 1, '5': 9, '10': 'whatsappCallId'},
    {
      '1': 'direction',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.livekit.WhatsAppCallDirection',
      '10': 'direction'
    },
  ],
};

/// Descriptor for `WhatsAppCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List whatsAppCallDescriptor = $convert.base64Decode(
    'CgxXaGF0c0FwcENhbGwSKAoQd2hhdHNhcHBfY2FsbF9pZBgBIAEoCVIOd2hhdHNhcHBDYWxsSW'
    'QSPAoJZGlyZWN0aW9uGAIgASgOMh4ubGl2ZWtpdC5XaGF0c0FwcENhbGxEaXJlY3Rpb25SCWRp'
    'cmVjdGlvbg==');
