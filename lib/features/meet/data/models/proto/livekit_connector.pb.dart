//
//  Generated code. Do not modify.
//  source: livekit_connector.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_connector_twilio.pb.dart' as $16;
import 'livekit_connector_whatsapp.pb.dart' as $15;

export 'livekit_connector.pbenum.dart';

class ConnectorApi {
  $pb.RpcClient _client;
  ConnectorApi(this._client);

  $async.Future<$15.DialWhatsAppCallResponse> dialWhatsAppCall($pb.ClientContext? ctx, $15.DialWhatsAppCallRequest request) =>
    _client.invoke<$15.DialWhatsAppCallResponse>(ctx, 'Connector', 'DialWhatsAppCall', request, $15.DialWhatsAppCallResponse())
  ;
  $async.Future<$15.DisconnectWhatsAppCallResponse> disconnectWhatsAppCall($pb.ClientContext? ctx, $15.DisconnectWhatsAppCallRequest request) =>
    _client.invoke<$15.DisconnectWhatsAppCallResponse>(ctx, 'Connector', 'DisconnectWhatsAppCall', request, $15.DisconnectWhatsAppCallResponse())
  ;
  $async.Future<$15.ConnectWhatsAppCallResponse> connectWhatsAppCall($pb.ClientContext? ctx, $15.ConnectWhatsAppCallRequest request) =>
    _client.invoke<$15.ConnectWhatsAppCallResponse>(ctx, 'Connector', 'ConnectWhatsAppCall', request, $15.ConnectWhatsAppCallResponse())
  ;
  $async.Future<$15.AcceptWhatsAppCallResponse> acceptWhatsAppCall($pb.ClientContext? ctx, $15.AcceptWhatsAppCallRequest request) =>
    _client.invoke<$15.AcceptWhatsAppCallResponse>(ctx, 'Connector', 'AcceptWhatsAppCall', request, $15.AcceptWhatsAppCallResponse())
  ;
  $async.Future<$16.ConnectTwilioCallResponse> connectTwilioCall($pb.ClientContext? ctx, $16.ConnectTwilioCallRequest request) =>
    _client.invoke<$16.ConnectTwilioCallResponse>(ctx, 'Connector', 'ConnectTwilioCall', request, $16.ConnectTwilioCallResponse())
  ;
}

