// This is a generated file - do not edit.
//
// Generated from cloud_replay.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $1;

import 'cloud_replay.pb.dart' as $2;
import 'cloud_replay.pbjson.dart';

export 'cloud_replay.pb.dart';

abstract class ReplayServiceBase extends $pb.GeneratedService {
  $async.Future<$2.ListReplaysResponse> listReplays(
      $pb.ServerContext ctx, $2.ListReplaysRequest request);
  $async.Future<$1.Empty> deleteReplay(
      $pb.ServerContext ctx, $2.DeleteReplayRequest request);
  $async.Future<$2.PlaybackResponse> playback(
      $pb.ServerContext ctx, $2.PlaybackRequest request);
  $async.Future<$1.Empty> seek($pb.ServerContext ctx, $2.SeekRequest request);
  $async.Future<$1.Empty> close(
      $pb.ServerContext ctx, $2.ClosePlaybackRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'ListReplays':
        return $2.ListReplaysRequest();
      case 'DeleteReplay':
        return $2.DeleteReplayRequest();
      case 'Playback':
        return $2.PlaybackRequest();
      case 'Seek':
        return $2.SeekRequest();
      case 'Close':
        return $2.ClosePlaybackRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'ListReplays':
        return listReplays(ctx, request as $2.ListReplaysRequest);
      case 'DeleteReplay':
        return deleteReplay(ctx, request as $2.DeleteReplayRequest);
      case 'Playback':
        return playback(ctx, request as $2.PlaybackRequest);
      case 'Seek':
        return seek(ctx, request as $2.SeekRequest);
      case 'Close':
        return close(ctx, request as $2.ClosePlaybackRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ReplayServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => ReplayServiceBase$messageJson;
}
