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

import 'livekit_connector.pbjson.dart';
import 'livekit_connector_twilio.pb.dart' as $1;
import 'livekit_connector_whatsapp.pb.dart' as $0;

export 'livekit_connector.pb.dart';

abstract class ConnectorServiceBase extends $pb.GeneratedService {
  $async.Future<$0.DialWhatsAppCallResponse> dialWhatsAppCall(
      $pb.ServerContext ctx, $0.DialWhatsAppCallRequest request);
  $async.Future<$0.DisconnectWhatsAppCallResponse> disconnectWhatsAppCall(
      $pb.ServerContext ctx, $0.DisconnectWhatsAppCallRequest request);
  $async.Future<$0.ConnectWhatsAppCallResponse> connectWhatsAppCall(
      $pb.ServerContext ctx, $0.ConnectWhatsAppCallRequest request);
  $async.Future<$0.AcceptWhatsAppCallResponse> acceptWhatsAppCall(
      $pb.ServerContext ctx, $0.AcceptWhatsAppCallRequest request);
  $async.Future<$1.ConnectTwilioCallResponse> connectTwilioCall(
      $pb.ServerContext ctx, $1.ConnectTwilioCallRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'DialWhatsAppCall':
        return $0.DialWhatsAppCallRequest();
      case 'DisconnectWhatsAppCall':
        return $0.DisconnectWhatsAppCallRequest();
      case 'ConnectWhatsAppCall':
        return $0.ConnectWhatsAppCallRequest();
      case 'AcceptWhatsAppCall':
        return $0.AcceptWhatsAppCallRequest();
      case 'ConnectTwilioCall':
        return $1.ConnectTwilioCallRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'DialWhatsAppCall':
        return dialWhatsAppCall(ctx, request as $0.DialWhatsAppCallRequest);
      case 'DisconnectWhatsAppCall':
        return disconnectWhatsAppCall(
            ctx, request as $0.DisconnectWhatsAppCallRequest);
      case 'ConnectWhatsAppCall':
        return connectWhatsAppCall(
            ctx, request as $0.ConnectWhatsAppCallRequest);
      case 'AcceptWhatsAppCall':
        return acceptWhatsAppCall(ctx, request as $0.AcceptWhatsAppCallRequest);
      case 'ConnectTwilioCall':
        return connectTwilioCall(ctx, request as $1.ConnectTwilioCallRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ConnectorServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => ConnectorServiceBase$messageJson;
}
