//
//  Generated code. Do not modify.
//  source: livekit_sip.proto
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

import 'google/protobuf/empty.pb.dart' as $3;
import 'livekit_sip.pb.dart' as $12;
import 'livekit_sip.pbjson.dart';

export 'livekit_sip.pb.dart';

abstract class SIPServiceBase extends $pb.GeneratedService {
  $async.Future<$12.ListSIPTrunkResponse> listSIPTrunk($pb.ServerContext ctx, $12.ListSIPTrunkRequest request);
  $async.Future<$12.SIPInboundTrunkInfo> createSIPInboundTrunk($pb.ServerContext ctx, $12.CreateSIPInboundTrunkRequest request);
  $async.Future<$12.SIPOutboundTrunkInfo> createSIPOutboundTrunk($pb.ServerContext ctx, $12.CreateSIPOutboundTrunkRequest request);
  $async.Future<$12.SIPInboundTrunkInfo> updateSIPInboundTrunk($pb.ServerContext ctx, $12.UpdateSIPInboundTrunkRequest request);
  $async.Future<$12.SIPOutboundTrunkInfo> updateSIPOutboundTrunk($pb.ServerContext ctx, $12.UpdateSIPOutboundTrunkRequest request);
  $async.Future<$12.GetSIPInboundTrunkResponse> getSIPInboundTrunk($pb.ServerContext ctx, $12.GetSIPInboundTrunkRequest request);
  $async.Future<$12.GetSIPOutboundTrunkResponse> getSIPOutboundTrunk($pb.ServerContext ctx, $12.GetSIPOutboundTrunkRequest request);
  $async.Future<$12.ListSIPInboundTrunkResponse> listSIPInboundTrunk($pb.ServerContext ctx, $12.ListSIPInboundTrunkRequest request);
  $async.Future<$12.ListSIPOutboundTrunkResponse> listSIPOutboundTrunk($pb.ServerContext ctx, $12.ListSIPOutboundTrunkRequest request);
  $async.Future<$12.SIPTrunkInfo> deleteSIPTrunk($pb.ServerContext ctx, $12.DeleteSIPTrunkRequest request);
  $async.Future<$12.SIPDispatchRuleInfo> createSIPDispatchRule($pb.ServerContext ctx, $12.CreateSIPDispatchRuleRequest request);
  $async.Future<$12.SIPDispatchRuleInfo> updateSIPDispatchRule($pb.ServerContext ctx, $12.UpdateSIPDispatchRuleRequest request);
  $async.Future<$12.ListSIPDispatchRuleResponse> listSIPDispatchRule($pb.ServerContext ctx, $12.ListSIPDispatchRuleRequest request);
  $async.Future<$12.SIPDispatchRuleInfo> deleteSIPDispatchRule($pb.ServerContext ctx, $12.DeleteSIPDispatchRuleRequest request);
  $async.Future<$12.SIPParticipantInfo> createSIPParticipant($pb.ServerContext ctx, $12.CreateSIPParticipantRequest request);
  $async.Future<$3.Empty> transferSIPParticipant($pb.ServerContext ctx, $12.TransferSIPParticipantRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'ListSIPTrunk': return $12.ListSIPTrunkRequest();
      case 'CreateSIPInboundTrunk': return $12.CreateSIPInboundTrunkRequest();
      case 'CreateSIPOutboundTrunk': return $12.CreateSIPOutboundTrunkRequest();
      case 'UpdateSIPInboundTrunk': return $12.UpdateSIPInboundTrunkRequest();
      case 'UpdateSIPOutboundTrunk': return $12.UpdateSIPOutboundTrunkRequest();
      case 'GetSIPInboundTrunk': return $12.GetSIPInboundTrunkRequest();
      case 'GetSIPOutboundTrunk': return $12.GetSIPOutboundTrunkRequest();
      case 'ListSIPInboundTrunk': return $12.ListSIPInboundTrunkRequest();
      case 'ListSIPOutboundTrunk': return $12.ListSIPOutboundTrunkRequest();
      case 'DeleteSIPTrunk': return $12.DeleteSIPTrunkRequest();
      case 'CreateSIPDispatchRule': return $12.CreateSIPDispatchRuleRequest();
      case 'UpdateSIPDispatchRule': return $12.UpdateSIPDispatchRuleRequest();
      case 'ListSIPDispatchRule': return $12.ListSIPDispatchRuleRequest();
      case 'DeleteSIPDispatchRule': return $12.DeleteSIPDispatchRuleRequest();
      case 'CreateSIPParticipant': return $12.CreateSIPParticipantRequest();
      case 'TransferSIPParticipant': return $12.TransferSIPParticipantRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'ListSIPTrunk': return this.listSIPTrunk(ctx, request as $12.ListSIPTrunkRequest);
      case 'CreateSIPInboundTrunk': return this.createSIPInboundTrunk(ctx, request as $12.CreateSIPInboundTrunkRequest);
      case 'CreateSIPOutboundTrunk': return this.createSIPOutboundTrunk(ctx, request as $12.CreateSIPOutboundTrunkRequest);
      case 'UpdateSIPInboundTrunk': return this.updateSIPInboundTrunk(ctx, request as $12.UpdateSIPInboundTrunkRequest);
      case 'UpdateSIPOutboundTrunk': return this.updateSIPOutboundTrunk(ctx, request as $12.UpdateSIPOutboundTrunkRequest);
      case 'GetSIPInboundTrunk': return this.getSIPInboundTrunk(ctx, request as $12.GetSIPInboundTrunkRequest);
      case 'GetSIPOutboundTrunk': return this.getSIPOutboundTrunk(ctx, request as $12.GetSIPOutboundTrunkRequest);
      case 'ListSIPInboundTrunk': return this.listSIPInboundTrunk(ctx, request as $12.ListSIPInboundTrunkRequest);
      case 'ListSIPOutboundTrunk': return this.listSIPOutboundTrunk(ctx, request as $12.ListSIPOutboundTrunkRequest);
      case 'DeleteSIPTrunk': return this.deleteSIPTrunk(ctx, request as $12.DeleteSIPTrunkRequest);
      case 'CreateSIPDispatchRule': return this.createSIPDispatchRule(ctx, request as $12.CreateSIPDispatchRuleRequest);
      case 'UpdateSIPDispatchRule': return this.updateSIPDispatchRule(ctx, request as $12.UpdateSIPDispatchRuleRequest);
      case 'ListSIPDispatchRule': return this.listSIPDispatchRule(ctx, request as $12.ListSIPDispatchRuleRequest);
      case 'DeleteSIPDispatchRule': return this.deleteSIPDispatchRule(ctx, request as $12.DeleteSIPDispatchRuleRequest);
      case 'CreateSIPParticipant': return this.createSIPParticipant(ctx, request as $12.CreateSIPParticipantRequest);
      case 'TransferSIPParticipant': return this.transferSIPParticipant(ctx, request as $12.TransferSIPParticipantRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => SIPServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => SIPServiceBase$messageJson;
}

