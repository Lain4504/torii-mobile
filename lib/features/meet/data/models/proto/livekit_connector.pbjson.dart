// This is a generated file - do not edit.
//
// Generated from livekit_connector.proto.

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

import 'livekit_agent_dispatch.pbjson.dart' as $2;
import 'livekit_connector_twilio.pbjson.dart' as $1;
import 'livekit_connector_whatsapp.pbjson.dart' as $0;
import 'livekit_rtc.pbjson.dart' as $3;

@$core.Deprecated('Use connectorTypeDescriptor instead')
const ConnectorType$json = {
  '1': 'ConnectorType',
  '2': [
    {'1': 'Unspecified', '2': 0},
    {'1': 'WhatsApp', '2': 1},
    {'1': 'Twilio', '2': 2},
  ],
};

/// Descriptor for `ConnectorType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List connectorTypeDescriptor = $convert.base64Decode(
    'Cg1Db25uZWN0b3JUeXBlEg8KC1Vuc3BlY2lmaWVkEAASDAoIV2hhdHNBcHAQARIKCgZUd2lsaW'
    '8QAg==');

const $core.Map<$core.String, $core.dynamic> ConnectorServiceBase$json = {
  '1': 'Connector',
  '2': [
    {
      '1': 'DialWhatsAppCall',
      '2': '.livekit.DialWhatsAppCallRequest',
      '3': '.livekit.DialWhatsAppCallResponse'
    },
    {
      '1': 'DisconnectWhatsAppCall',
      '2': '.livekit.DisconnectWhatsAppCallRequest',
      '3': '.livekit.DisconnectWhatsAppCallResponse'
    },
    {
      '1': 'ConnectWhatsAppCall',
      '2': '.livekit.ConnectWhatsAppCallRequest',
      '3': '.livekit.ConnectWhatsAppCallResponse'
    },
    {
      '1': 'AcceptWhatsAppCall',
      '2': '.livekit.AcceptWhatsAppCallRequest',
      '3': '.livekit.AcceptWhatsAppCallResponse'
    },
    {
      '1': 'ConnectTwilioCall',
      '2': '.livekit.ConnectTwilioCallRequest',
      '3': '.livekit.ConnectTwilioCallResponse'
    },
  ],
};

@$core.Deprecated('Use connectorServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    ConnectorServiceBase$messageJson = {
  '.livekit.DialWhatsAppCallRequest': $0.DialWhatsAppCallRequest$json,
  '.livekit.RoomAgentDispatch': $2.RoomAgentDispatch$json,
  '.livekit.DialWhatsAppCallRequest.ParticipantAttributesEntry':
      $0.DialWhatsAppCallRequest_ParticipantAttributesEntry$json,
  '.livekit.DialWhatsAppCallResponse': $0.DialWhatsAppCallResponse$json,
  '.livekit.DisconnectWhatsAppCallRequest':
      $0.DisconnectWhatsAppCallRequest$json,
  '.livekit.DisconnectWhatsAppCallResponse':
      $0.DisconnectWhatsAppCallResponse$json,
  '.livekit.ConnectWhatsAppCallRequest': $0.ConnectWhatsAppCallRequest$json,
  '.livekit.SessionDescription': $3.SessionDescription$json,
  '.livekit.SessionDescription.MidToTrackIdEntry':
      $3.SessionDescription_MidToTrackIdEntry$json,
  '.livekit.ConnectWhatsAppCallResponse': $0.ConnectWhatsAppCallResponse$json,
  '.livekit.AcceptWhatsAppCallRequest': $0.AcceptWhatsAppCallRequest$json,
  '.livekit.AcceptWhatsAppCallRequest.ParticipantAttributesEntry':
      $0.AcceptWhatsAppCallRequest_ParticipantAttributesEntry$json,
  '.livekit.AcceptWhatsAppCallResponse': $0.AcceptWhatsAppCallResponse$json,
  '.livekit.ConnectTwilioCallRequest': $1.ConnectTwilioCallRequest$json,
  '.livekit.ConnectTwilioCallRequest.ParticipantAttributesEntry':
      $1.ConnectTwilioCallRequest_ParticipantAttributesEntry$json,
  '.livekit.ConnectTwilioCallResponse': $1.ConnectTwilioCallResponse$json,
};

/// Descriptor for `Connector`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List connectorServiceDescriptor = $convert.base64Decode(
    'CglDb25uZWN0b3ISVwoQRGlhbFdoYXRzQXBwQ2FsbBIgLmxpdmVraXQuRGlhbFdoYXRzQXBwQ2'
    'FsbFJlcXVlc3QaIS5saXZla2l0LkRpYWxXaGF0c0FwcENhbGxSZXNwb25zZRJpChZEaXNjb25u'
    'ZWN0V2hhdHNBcHBDYWxsEiYubGl2ZWtpdC5EaXNjb25uZWN0V2hhdHNBcHBDYWxsUmVxdWVzdB'
    'onLmxpdmVraXQuRGlzY29ubmVjdFdoYXRzQXBwQ2FsbFJlc3BvbnNlEmAKE0Nvbm5lY3RXaGF0'
    'c0FwcENhbGwSIy5saXZla2l0LkNvbm5lY3RXaGF0c0FwcENhbGxSZXF1ZXN0GiQubGl2ZWtpdC'
    '5Db25uZWN0V2hhdHNBcHBDYWxsUmVzcG9uc2USXQoSQWNjZXB0V2hhdHNBcHBDYWxsEiIubGl2'
    'ZWtpdC5BY2NlcHRXaGF0c0FwcENhbGxSZXF1ZXN0GiMubGl2ZWtpdC5BY2NlcHRXaGF0c0FwcE'
    'NhbGxSZXNwb25zZRJaChFDb25uZWN0VHdpbGlvQ2FsbBIhLmxpdmVraXQuQ29ubmVjdFR3aWxp'
    'b0NhbGxSZXF1ZXN0GiIubGl2ZWtpdC5Db25uZWN0VHdpbGlvQ2FsbFJlc3BvbnNl');
