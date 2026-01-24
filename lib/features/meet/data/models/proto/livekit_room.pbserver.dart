// This is a generated file - do not edit.
//
// Generated from livekit_room.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_models.pb.dart' as $2;
import 'livekit_room.pb.dart' as $3;
import 'livekit_room.pbjson.dart';

export 'livekit_room.pb.dart';

abstract class RoomServiceBase extends $pb.GeneratedService {
  $async.Future<$2.Room> createRoom(
      $pb.ServerContext ctx, $3.CreateRoomRequest request);
  $async.Future<$3.ListRoomsResponse> listRooms(
      $pb.ServerContext ctx, $3.ListRoomsRequest request);
  $async.Future<$3.DeleteRoomResponse> deleteRoom(
      $pb.ServerContext ctx, $3.DeleteRoomRequest request);
  $async.Future<$3.ListParticipantsResponse> listParticipants(
      $pb.ServerContext ctx, $3.ListParticipantsRequest request);
  $async.Future<$2.ParticipantInfo> getParticipant(
      $pb.ServerContext ctx, $3.RoomParticipantIdentity request);
  $async.Future<$3.RemoveParticipantResponse> removeParticipant(
      $pb.ServerContext ctx, $3.RoomParticipantIdentity request);
  $async.Future<$3.MuteRoomTrackResponse> mutePublishedTrack(
      $pb.ServerContext ctx, $3.MuteRoomTrackRequest request);
  $async.Future<$2.ParticipantInfo> updateParticipant(
      $pb.ServerContext ctx, $3.UpdateParticipantRequest request);
  $async.Future<$3.UpdateSubscriptionsResponse> updateSubscriptions(
      $pb.ServerContext ctx, $3.UpdateSubscriptionsRequest request);
  $async.Future<$3.SendDataResponse> sendData(
      $pb.ServerContext ctx, $3.SendDataRequest request);
  $async.Future<$2.Room> updateRoomMetadata(
      $pb.ServerContext ctx, $3.UpdateRoomMetadataRequest request);
  $async.Future<$3.ForwardParticipantResponse> forwardParticipant(
      $pb.ServerContext ctx, $3.ForwardParticipantRequest request);
  $async.Future<$3.MoveParticipantResponse> moveParticipant(
      $pb.ServerContext ctx, $3.MoveParticipantRequest request);
  $async.Future<$3.PerformRpcResponse> performRpc(
      $pb.ServerContext ctx, $3.PerformRpcRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateRoom':
        return $3.CreateRoomRequest();
      case 'ListRooms':
        return $3.ListRoomsRequest();
      case 'DeleteRoom':
        return $3.DeleteRoomRequest();
      case 'ListParticipants':
        return $3.ListParticipantsRequest();
      case 'GetParticipant':
        return $3.RoomParticipantIdentity();
      case 'RemoveParticipant':
        return $3.RoomParticipantIdentity();
      case 'MutePublishedTrack':
        return $3.MuteRoomTrackRequest();
      case 'UpdateParticipant':
        return $3.UpdateParticipantRequest();
      case 'UpdateSubscriptions':
        return $3.UpdateSubscriptionsRequest();
      case 'SendData':
        return $3.SendDataRequest();
      case 'UpdateRoomMetadata':
        return $3.UpdateRoomMetadataRequest();
      case 'ForwardParticipant':
        return $3.ForwardParticipantRequest();
      case 'MoveParticipant':
        return $3.MoveParticipantRequest();
      case 'PerformRpc':
        return $3.PerformRpcRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateRoom':
        return createRoom(ctx, request as $3.CreateRoomRequest);
      case 'ListRooms':
        return listRooms(ctx, request as $3.ListRoomsRequest);
      case 'DeleteRoom':
        return deleteRoom(ctx, request as $3.DeleteRoomRequest);
      case 'ListParticipants':
        return listParticipants(ctx, request as $3.ListParticipantsRequest);
      case 'GetParticipant':
        return getParticipant(ctx, request as $3.RoomParticipantIdentity);
      case 'RemoveParticipant':
        return removeParticipant(ctx, request as $3.RoomParticipantIdentity);
      case 'MutePublishedTrack':
        return mutePublishedTrack(ctx, request as $3.MuteRoomTrackRequest);
      case 'UpdateParticipant':
        return updateParticipant(ctx, request as $3.UpdateParticipantRequest);
      case 'UpdateSubscriptions':
        return updateSubscriptions(
            ctx, request as $3.UpdateSubscriptionsRequest);
      case 'SendData':
        return sendData(ctx, request as $3.SendDataRequest);
      case 'UpdateRoomMetadata':
        return updateRoomMetadata(ctx, request as $3.UpdateRoomMetadataRequest);
      case 'ForwardParticipant':
        return forwardParticipant(ctx, request as $3.ForwardParticipantRequest);
      case 'MoveParticipant':
        return moveParticipant(ctx, request as $3.MoveParticipantRequest);
      case 'PerformRpc':
        return performRpc(ctx, request as $3.PerformRpcRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => RoomServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => RoomServiceBase$messageJson;
}
