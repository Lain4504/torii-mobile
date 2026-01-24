//
//  Generated code. Do not modify.
//  source: cloud_replay.proto
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

import 'cloud_replay.pb.dart' as $4;
import 'cloud_replay.pbjson.dart';
import 'google/protobuf/empty.pb.dart' as $3;

export 'cloud_replay.pb.dart';

abstract class ReplayServiceBase extends $pb.GeneratedService {
  $async.Future<$4.ListReplaysResponse> listReplays($pb.ServerContext ctx, $4.ListReplaysRequest request);
  $async.Future<$3.Empty> deleteReplay($pb.ServerContext ctx, $4.DeleteReplayRequest request);
  $async.Future<$4.PlaybackResponse> playback($pb.ServerContext ctx, $4.PlaybackRequest request);
  $async.Future<$3.Empty> seek($pb.ServerContext ctx, $4.SeekRequest request);
  $async.Future<$3.Empty> close($pb.ServerContext ctx, $4.ClosePlaybackRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'ListReplays': return $4.ListReplaysRequest();
      case 'DeleteReplay': return $4.DeleteReplayRequest();
      case 'Playback': return $4.PlaybackRequest();
      case 'Seek': return $4.SeekRequest();
      case 'Close': return $4.ClosePlaybackRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'ListReplays': return this.listReplays(ctx, request as $4.ListReplaysRequest);
      case 'DeleteReplay': return this.deleteReplay(ctx, request as $4.DeleteReplayRequest);
      case 'Playback': return this.playback(ctx, request as $4.PlaybackRequest);
      case 'Seek': return this.seek(ctx, request as $4.SeekRequest);
      case 'Close': return this.close(ctx, request as $4.ClosePlaybackRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ReplayServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => ReplayServiceBase$messageJson;
}

