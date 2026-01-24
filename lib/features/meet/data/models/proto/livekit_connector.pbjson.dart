//
//  Generated code. Do not modify.
//  source: livekit_connector.proto
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
import 'livekit_connector_twilio.pbjson.dart' as $16;
import 'livekit_connector_whatsapp.pbjson.dart' as $15;
import 'livekit_rtc.pbjson.dart' as $14;

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
    {'1': 'DialWhatsAppCall', '2': '.livekit.DialWhatsAppCallRequest', '3': '.livekit.DialWhatsAppCallResponse'},
    {'1': 'DisconnectWhatsAppCall', '2': '.livekit.DisconnectWhatsAppCallRequest', '3': '.livekit.DisconnectWhatsAppCallResponse'},
    {'1': 'ConnectWhatsAppCall', '2': '.livekit.ConnectWhatsAppCallRequest', '3': '.livekit.ConnectWhatsAppCallResponse'},
    {'1': 'AcceptWhatsAppCall', '2': '.livekit.AcceptWhatsAppCallRequest', '3': '.livekit.AcceptWhatsAppCallResponse'},
    {'1': 'ConnectTwilioCall', '2': '.livekit.ConnectTwilioCallRequest', '3': '.livekit.ConnectTwilioCallResponse'},
  ],
};

@$core.Deprecated('Use connectorServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> ConnectorServiceBase$messageJson = {
  '.livekit.DialWhatsAppCallRequest': $15.DialWhatsAppCallRequest$json,
  '.livekit.RoomAgentDispatch': $6.RoomAgentDispatch$json,
  '.livekit.DialWhatsAppCallRequest.ParticipantAttributesEntry': $15.DialWhatsAppCallRequest_ParticipantAttributesEntry$json,
  '.livekit.DialWhatsAppCallResponse': $15.DialWhatsAppCallResponse$json,
  '.livekit.DisconnectWhatsAppCallRequest': $15.DisconnectWhatsAppCallRequest$json,
  '.livekit.DisconnectWhatsAppCallResponse': $15.DisconnectWhatsAppCallResponse$json,
  '.livekit.ConnectWhatsAppCallRequest': $15.ConnectWhatsAppCallRequest$json,
  '.livekit.SessionDescription': $14.SessionDescription$json,
  '.livekit.SessionDescription.MidToTrackIdEntry': $14.SessionDescription_MidToTrackIdEntry$json,
  '.livekit.ConnectWhatsAppCallResponse': $15.ConnectWhatsAppCallResponse$json,
  '.livekit.AcceptWhatsAppCallRequest': $15.AcceptWhatsAppCallRequest$json,
  '.livekit.AcceptWhatsAppCallRequest.ParticipantAttributesEntry': $15.AcceptWhatsAppCallRequest_ParticipantAttributesEntry$json,
  '.livekit.AcceptWhatsAppCallResponse': $15.AcceptWhatsAppCallResponse$json,
  '.livekit.ConnectTwilioCallRequest': $16.ConnectTwilioCallRequest$json,
  '.livekit.ConnectTwilioCallRequest.ParticipantAttributesEntry': $16.ConnectTwilioCallRequest_ParticipantAttributesEntry$json,
  '.livekit.ConnectTwilioCallResponse': $16.ConnectTwilioCallResponse$json,
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

