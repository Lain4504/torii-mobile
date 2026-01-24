//
//  Generated code. Do not modify.
//  source: livekit_egress.proto
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

import 'livekit_egress.pb.dart' as $7;
import 'livekit_egress.pbjson.dart';

export 'livekit_egress.pb.dart';

abstract class EgressServiceBase extends $pb.GeneratedService {
  $async.Future<$7.EgressInfo> startRoomCompositeEgress($pb.ServerContext ctx, $7.RoomCompositeEgressRequest request);
  $async.Future<$7.EgressInfo> startWebEgress($pb.ServerContext ctx, $7.WebEgressRequest request);
  $async.Future<$7.EgressInfo> startParticipantEgress($pb.ServerContext ctx, $7.ParticipantEgressRequest request);
  $async.Future<$7.EgressInfo> startTrackCompositeEgress($pb.ServerContext ctx, $7.TrackCompositeEgressRequest request);
  $async.Future<$7.EgressInfo> startTrackEgress($pb.ServerContext ctx, $7.TrackEgressRequest request);
  $async.Future<$7.EgressInfo> updateLayout($pb.ServerContext ctx, $7.UpdateLayoutRequest request);
  $async.Future<$7.EgressInfo> updateStream($pb.ServerContext ctx, $7.UpdateStreamRequest request);
  $async.Future<$7.ListEgressResponse> listEgress($pb.ServerContext ctx, $7.ListEgressRequest request);
  $async.Future<$7.EgressInfo> stopEgress($pb.ServerContext ctx, $7.StopEgressRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'StartRoomCompositeEgress': return $7.RoomCompositeEgressRequest();
      case 'StartWebEgress': return $7.WebEgressRequest();
      case 'StartParticipantEgress': return $7.ParticipantEgressRequest();
      case 'StartTrackCompositeEgress': return $7.TrackCompositeEgressRequest();
      case 'StartTrackEgress': return $7.TrackEgressRequest();
      case 'UpdateLayout': return $7.UpdateLayoutRequest();
      case 'UpdateStream': return $7.UpdateStreamRequest();
      case 'ListEgress': return $7.ListEgressRequest();
      case 'StopEgress': return $7.StopEgressRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'StartRoomCompositeEgress': return this.startRoomCompositeEgress(ctx, request as $7.RoomCompositeEgressRequest);
      case 'StartWebEgress': return this.startWebEgress(ctx, request as $7.WebEgressRequest);
      case 'StartParticipantEgress': return this.startParticipantEgress(ctx, request as $7.ParticipantEgressRequest);
      case 'StartTrackCompositeEgress': return this.startTrackCompositeEgress(ctx, request as $7.TrackCompositeEgressRequest);
      case 'StartTrackEgress': return this.startTrackEgress(ctx, request as $7.TrackEgressRequest);
      case 'UpdateLayout': return this.updateLayout(ctx, request as $7.UpdateLayoutRequest);
      case 'UpdateStream': return this.updateStream(ctx, request as $7.UpdateStreamRequest);
      case 'ListEgress': return this.listEgress(ctx, request as $7.ListEgressRequest);
      case 'StopEgress': return this.stopEgress(ctx, request as $7.StopEgressRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => EgressServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => EgressServiceBase$messageJson;
}

