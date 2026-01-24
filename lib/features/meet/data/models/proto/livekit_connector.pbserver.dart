//
//  Generated code. Do not modify.
//  source: livekit_connector.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_connector.pbjson.dart';
import 'livekit_connector_twilio.pb.dart' as $16;
import 'livekit_connector_whatsapp.pb.dart' as $15;

export 'livekit_connector.pb.dart';

abstract class ConnectorServiceBase extends $pb.GeneratedService {
  $async.Future<$15.DialWhatsAppCallResponse> dialWhatsAppCall($pb.ServerContext ctx, $15.DialWhatsAppCallRequest request);
  $async.Future<$15.DisconnectWhatsAppCallResponse> disconnectWhatsAppCall($pb.ServerContext ctx, $15.DisconnectWhatsAppCallRequest request);
  $async.Future<$15.ConnectWhatsAppCallResponse> connectWhatsAppCall($pb.ServerContext ctx, $15.ConnectWhatsAppCallRequest request);
  $async.Future<$15.AcceptWhatsAppCallResponse> acceptWhatsAppCall($pb.ServerContext ctx, $15.AcceptWhatsAppCallRequest request);
  $async.Future<$16.ConnectTwilioCallResponse> connectTwilioCall($pb.ServerContext ctx, $16.ConnectTwilioCallRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'DialWhatsAppCall': return $15.DialWhatsAppCallRequest();
      case 'DisconnectWhatsAppCall': return $15.DisconnectWhatsAppCallRequest();
      case 'ConnectWhatsAppCall': return $15.ConnectWhatsAppCallRequest();
      case 'AcceptWhatsAppCall': return $15.AcceptWhatsAppCallRequest();
      case 'ConnectTwilioCall': return $16.ConnectTwilioCallRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'DialWhatsAppCall': return this.dialWhatsAppCall(ctx, request as $15.DialWhatsAppCallRequest);
      case 'DisconnectWhatsAppCall': return this.disconnectWhatsAppCall(ctx, request as $15.DisconnectWhatsAppCallRequest);
      case 'ConnectWhatsAppCall': return this.connectWhatsAppCall(ctx, request as $15.ConnectWhatsAppCallRequest);
      case 'AcceptWhatsAppCall': return this.acceptWhatsAppCall(ctx, request as $15.AcceptWhatsAppCallRequest);
      case 'ConnectTwilioCall': return this.connectTwilioCall(ctx, request as $16.ConnectTwilioCallRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ConnectorServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => ConnectorServiceBase$messageJson;
}

