// This is a generated file - do not edit.
//
// Generated from livekit_sip.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $4;

import 'livekit_sip.pb.dart' as $7;
import 'livekit_sip.pbjson.dart';

export 'livekit_sip.pb.dart';

abstract class SIPServiceBase extends $pb.GeneratedService {
  $async.Future<$7.ListSIPTrunkResponse> listSIPTrunk(
      $pb.ServerContext ctx, $7.ListSIPTrunkRequest request);
  $async.Future<$7.SIPInboundTrunkInfo> createSIPInboundTrunk(
      $pb.ServerContext ctx, $7.CreateSIPInboundTrunkRequest request);
  $async.Future<$7.SIPOutboundTrunkInfo> createSIPOutboundTrunk(
      $pb.ServerContext ctx, $7.CreateSIPOutboundTrunkRequest request);
  $async.Future<$7.SIPInboundTrunkInfo> updateSIPInboundTrunk(
      $pb.ServerContext ctx, $7.UpdateSIPInboundTrunkRequest request);
  $async.Future<$7.SIPOutboundTrunkInfo> updateSIPOutboundTrunk(
      $pb.ServerContext ctx, $7.UpdateSIPOutboundTrunkRequest request);
  $async.Future<$7.GetSIPInboundTrunkResponse> getSIPInboundTrunk(
      $pb.ServerContext ctx, $7.GetSIPInboundTrunkRequest request);
  $async.Future<$7.GetSIPOutboundTrunkResponse> getSIPOutboundTrunk(
      $pb.ServerContext ctx, $7.GetSIPOutboundTrunkRequest request);
  $async.Future<$7.ListSIPInboundTrunkResponse> listSIPInboundTrunk(
      $pb.ServerContext ctx, $7.ListSIPInboundTrunkRequest request);
  $async.Future<$7.ListSIPOutboundTrunkResponse> listSIPOutboundTrunk(
      $pb.ServerContext ctx, $7.ListSIPOutboundTrunkRequest request);
  $async.Future<$7.SIPTrunkInfo> deleteSIPTrunk(
      $pb.ServerContext ctx, $7.DeleteSIPTrunkRequest request);
  $async.Future<$7.SIPDispatchRuleInfo> createSIPDispatchRule(
      $pb.ServerContext ctx, $7.CreateSIPDispatchRuleRequest request);
  $async.Future<$7.SIPDispatchRuleInfo> updateSIPDispatchRule(
      $pb.ServerContext ctx, $7.UpdateSIPDispatchRuleRequest request);
  $async.Future<$7.ListSIPDispatchRuleResponse> listSIPDispatchRule(
      $pb.ServerContext ctx, $7.ListSIPDispatchRuleRequest request);
  $async.Future<$7.SIPDispatchRuleInfo> deleteSIPDispatchRule(
      $pb.ServerContext ctx, $7.DeleteSIPDispatchRuleRequest request);
  $async.Future<$7.SIPParticipantInfo> createSIPParticipant(
      $pb.ServerContext ctx, $7.CreateSIPParticipantRequest request);
  $async.Future<$4.Empty> transferSIPParticipant(
      $pb.ServerContext ctx, $7.TransferSIPParticipantRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'ListSIPTrunk':
        return $7.ListSIPTrunkRequest();
      case 'CreateSIPInboundTrunk':
        return $7.CreateSIPInboundTrunkRequest();
      case 'CreateSIPOutboundTrunk':
        return $7.CreateSIPOutboundTrunkRequest();
      case 'UpdateSIPInboundTrunk':
        return $7.UpdateSIPInboundTrunkRequest();
      case 'UpdateSIPOutboundTrunk':
        return $7.UpdateSIPOutboundTrunkRequest();
      case 'GetSIPInboundTrunk':
        return $7.GetSIPInboundTrunkRequest();
      case 'GetSIPOutboundTrunk':
        return $7.GetSIPOutboundTrunkRequest();
      case 'ListSIPInboundTrunk':
        return $7.ListSIPInboundTrunkRequest();
      case 'ListSIPOutboundTrunk':
        return $7.ListSIPOutboundTrunkRequest();
      case 'DeleteSIPTrunk':
        return $7.DeleteSIPTrunkRequest();
      case 'CreateSIPDispatchRule':
        return $7.CreateSIPDispatchRuleRequest();
      case 'UpdateSIPDispatchRule':
        return $7.UpdateSIPDispatchRuleRequest();
      case 'ListSIPDispatchRule':
        return $7.ListSIPDispatchRuleRequest();
      case 'DeleteSIPDispatchRule':
        return $7.DeleteSIPDispatchRuleRequest();
      case 'CreateSIPParticipant':
        return $7.CreateSIPParticipantRequest();
      case 'TransferSIPParticipant':
        return $7.TransferSIPParticipantRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'ListSIPTrunk':
        return listSIPTrunk(ctx, request as $7.ListSIPTrunkRequest);
      case 'CreateSIPInboundTrunk':
        return createSIPInboundTrunk(
            ctx, request as $7.CreateSIPInboundTrunkRequest);
      case 'CreateSIPOutboundTrunk':
        return createSIPOutboundTrunk(
            ctx, request as $7.CreateSIPOutboundTrunkRequest);
      case 'UpdateSIPInboundTrunk':
        return updateSIPInboundTrunk(
            ctx, request as $7.UpdateSIPInboundTrunkRequest);
      case 'UpdateSIPOutboundTrunk':
        return updateSIPOutboundTrunk(
            ctx, request as $7.UpdateSIPOutboundTrunkRequest);
      case 'GetSIPInboundTrunk':
        return getSIPInboundTrunk(ctx, request as $7.GetSIPInboundTrunkRequest);
      case 'GetSIPOutboundTrunk':
        return getSIPOutboundTrunk(
            ctx, request as $7.GetSIPOutboundTrunkRequest);
      case 'ListSIPInboundTrunk':
        return listSIPInboundTrunk(
            ctx, request as $7.ListSIPInboundTrunkRequest);
      case 'ListSIPOutboundTrunk':
        return listSIPOutboundTrunk(
            ctx, request as $7.ListSIPOutboundTrunkRequest);
      case 'DeleteSIPTrunk':
        return deleteSIPTrunk(ctx, request as $7.DeleteSIPTrunkRequest);
      case 'CreateSIPDispatchRule':
        return createSIPDispatchRule(
            ctx, request as $7.CreateSIPDispatchRuleRequest);
      case 'UpdateSIPDispatchRule':
        return updateSIPDispatchRule(
            ctx, request as $7.UpdateSIPDispatchRuleRequest);
      case 'ListSIPDispatchRule':
        return listSIPDispatchRule(
            ctx, request as $7.ListSIPDispatchRuleRequest);
      case 'DeleteSIPDispatchRule':
        return deleteSIPDispatchRule(
            ctx, request as $7.DeleteSIPDispatchRuleRequest);
      case 'CreateSIPParticipant':
        return createSIPParticipant(
            ctx, request as $7.CreateSIPParticipantRequest);
      case 'TransferSIPParticipant':
        return transferSIPParticipant(
            ctx, request as $7.TransferSIPParticipantRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => SIPServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => SIPServiceBase$messageJson;
}
