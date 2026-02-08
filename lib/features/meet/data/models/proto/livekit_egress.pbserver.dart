// This is a generated file - do not edit.
//
// Generated from livekit_egress.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_egress.pb.dart' as $1;
import 'livekit_egress.pbjson.dart';

export 'livekit_egress.pb.dart';

abstract class EgressServiceBase extends $pb.GeneratedService {
  $async.Future<$1.EgressInfo> startRoomCompositeEgress(
      $pb.ServerContext ctx, $1.RoomCompositeEgressRequest request);
  $async.Future<$1.EgressInfo> startWebEgress(
      $pb.ServerContext ctx, $1.WebEgressRequest request);
  $async.Future<$1.EgressInfo> startParticipantEgress(
      $pb.ServerContext ctx, $1.ParticipantEgressRequest request);
  $async.Future<$1.EgressInfo> startTrackCompositeEgress(
      $pb.ServerContext ctx, $1.TrackCompositeEgressRequest request);
  $async.Future<$1.EgressInfo> startTrackEgress(
      $pb.ServerContext ctx, $1.TrackEgressRequest request);
  $async.Future<$1.EgressInfo> updateLayout(
      $pb.ServerContext ctx, $1.UpdateLayoutRequest request);
  $async.Future<$1.EgressInfo> updateStream(
      $pb.ServerContext ctx, $1.UpdateStreamRequest request);
  $async.Future<$1.ListEgressResponse> listEgress(
      $pb.ServerContext ctx, $1.ListEgressRequest request);
  $async.Future<$1.EgressInfo> stopEgress(
      $pb.ServerContext ctx, $1.StopEgressRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'StartRoomCompositeEgress':
        return $1.RoomCompositeEgressRequest();
      case 'StartWebEgress':
        return $1.WebEgressRequest();
      case 'StartParticipantEgress':
        return $1.ParticipantEgressRequest();
      case 'StartTrackCompositeEgress':
        return $1.TrackCompositeEgressRequest();
      case 'StartTrackEgress':
        return $1.TrackEgressRequest();
      case 'UpdateLayout':
        return $1.UpdateLayoutRequest();
      case 'UpdateStream':
        return $1.UpdateStreamRequest();
      case 'ListEgress':
        return $1.ListEgressRequest();
      case 'StopEgress':
        return $1.StopEgressRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'StartRoomCompositeEgress':
        return startRoomCompositeEgress(
            ctx, request as $1.RoomCompositeEgressRequest);
      case 'StartWebEgress':
        return startWebEgress(ctx, request as $1.WebEgressRequest);
      case 'StartParticipantEgress':
        return startParticipantEgress(
            ctx, request as $1.ParticipantEgressRequest);
      case 'StartTrackCompositeEgress':
        return startTrackCompositeEgress(
            ctx, request as $1.TrackCompositeEgressRequest);
      case 'StartTrackEgress':
        return startTrackEgress(ctx, request as $1.TrackEgressRequest);
      case 'UpdateLayout':
        return updateLayout(ctx, request as $1.UpdateLayoutRequest);
      case 'UpdateStream':
        return updateStream(ctx, request as $1.UpdateStreamRequest);
      case 'ListEgress':
        return listEgress(ctx, request as $1.ListEgressRequest);
      case 'StopEgress':
        return stopEgress(ctx, request as $1.StopEgressRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => EgressServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => EgressServiceBase$messageJson;
}
