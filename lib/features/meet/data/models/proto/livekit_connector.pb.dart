// This is a generated file - do not edit.
//
// Generated from livekit_connector.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_connector_twilio.pb.dart' as $1;
import 'livekit_connector_whatsapp.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'livekit_connector.pbenum.dart';

class ConnectorApi {
  final $pb.RpcClient _client;

  ConnectorApi(this._client);

  $async.Future<$0.DialWhatsAppCallResponse> dialWhatsAppCall(
          $pb.ClientContext? ctx, $0.DialWhatsAppCallRequest request) =>
      _client.invoke<$0.DialWhatsAppCallResponse>(ctx, 'Connector',
          'DialWhatsAppCall', request, $0.DialWhatsAppCallResponse());
  $async.Future<$0.DisconnectWhatsAppCallResponse> disconnectWhatsAppCall(
          $pb.ClientContext? ctx, $0.DisconnectWhatsAppCallRequest request) =>
      _client.invoke<$0.DisconnectWhatsAppCallResponse>(
          ctx,
          'Connector',
          'DisconnectWhatsAppCall',
          request,
          $0.DisconnectWhatsAppCallResponse());
  $async.Future<$0.ConnectWhatsAppCallResponse> connectWhatsAppCall(
          $pb.ClientContext? ctx, $0.ConnectWhatsAppCallRequest request) =>
      _client.invoke<$0.ConnectWhatsAppCallResponse>(ctx, 'Connector',
          'ConnectWhatsAppCall', request, $0.ConnectWhatsAppCallResponse());
  $async.Future<$0.AcceptWhatsAppCallResponse> acceptWhatsAppCall(
          $pb.ClientContext? ctx, $0.AcceptWhatsAppCallRequest request) =>
      _client.invoke<$0.AcceptWhatsAppCallResponse>(ctx, 'Connector',
          'AcceptWhatsAppCall', request, $0.AcceptWhatsAppCallResponse());
  $async.Future<$1.ConnectTwilioCallResponse> connectTwilioCall(
          $pb.ClientContext? ctx, $1.ConnectTwilioCallRequest request) =>
      _client.invoke<$1.ConnectTwilioCallResponse>(ctx, 'Connector',
          'ConnectTwilioCall', request, $1.ConnectTwilioCallResponse());
}
