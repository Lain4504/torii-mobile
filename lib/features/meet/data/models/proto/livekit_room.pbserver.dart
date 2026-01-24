//
//  Generated code. Do not modify.
//  source: livekit_room.proto
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

import 'livekit_models.pb.dart' as $2;
import 'livekit_room.pb.dart' as $9;
import 'livekit_room.pbjson.dart';

export 'livekit_room.pb.dart';

abstract class RoomServiceBase extends $pb.GeneratedService {
  $async.Future<$2.Room> createRoom($pb.ServerContext ctx, $9.CreateRoomRequest request);
  $async.Future<$9.ListRoomsResponse> listRooms($pb.ServerContext ctx, $9.ListRoomsRequest request);
  $async.Future<$9.DeleteRoomResponse> deleteRoom($pb.ServerContext ctx, $9.DeleteRoomRequest request);
  $async.Future<$9.ListParticipantsResponse> listParticipants($pb.ServerContext ctx, $9.ListParticipantsRequest request);
  $async.Future<$2.ParticipantInfo> getParticipant($pb.ServerContext ctx, $9.RoomParticipantIdentity request);
  $async.Future<$9.RemoveParticipantResponse> removeParticipant($pb.ServerContext ctx, $9.RoomParticipantIdentity request);
  $async.Future<$9.MuteRoomTrackResponse> mutePublishedTrack($pb.ServerContext ctx, $9.MuteRoomTrackRequest request);
  $async.Future<$2.ParticipantInfo> updateParticipant($pb.ServerContext ctx, $9.UpdateParticipantRequest request);
  $async.Future<$9.UpdateSubscriptionsResponse> updateSubscriptions($pb.ServerContext ctx, $9.UpdateSubscriptionsRequest request);
  $async.Future<$9.SendDataResponse> sendData($pb.ServerContext ctx, $9.SendDataRequest request);
  $async.Future<$2.Room> updateRoomMetadata($pb.ServerContext ctx, $9.UpdateRoomMetadataRequest request);
  $async.Future<$9.ForwardParticipantResponse> forwardParticipant($pb.ServerContext ctx, $9.ForwardParticipantRequest request);
  $async.Future<$9.MoveParticipantResponse> moveParticipant($pb.ServerContext ctx, $9.MoveParticipantRequest request);
  $async.Future<$9.PerformRpcResponse> performRpc($pb.ServerContext ctx, $9.PerformRpcRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateRoom': return $9.CreateRoomRequest();
      case 'ListRooms': return $9.ListRoomsRequest();
      case 'DeleteRoom': return $9.DeleteRoomRequest();
      case 'ListParticipants': return $9.ListParticipantsRequest();
      case 'GetParticipant': return $9.RoomParticipantIdentity();
      case 'RemoveParticipant': return $9.RoomParticipantIdentity();
      case 'MutePublishedTrack': return $9.MuteRoomTrackRequest();
      case 'UpdateParticipant': return $9.UpdateParticipantRequest();
      case 'UpdateSubscriptions': return $9.UpdateSubscriptionsRequest();
      case 'SendData': return $9.SendDataRequest();
      case 'UpdateRoomMetadata': return $9.UpdateRoomMetadataRequest();
      case 'ForwardParticipant': return $9.ForwardParticipantRequest();
      case 'MoveParticipant': return $9.MoveParticipantRequest();
      case 'PerformRpc': return $9.PerformRpcRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateRoom': return this.createRoom(ctx, request as $9.CreateRoomRequest);
      case 'ListRooms': return this.listRooms(ctx, request as $9.ListRoomsRequest);
      case 'DeleteRoom': return this.deleteRoom(ctx, request as $9.DeleteRoomRequest);
      case 'ListParticipants': return this.listParticipants(ctx, request as $9.ListParticipantsRequest);
      case 'GetParticipant': return this.getParticipant(ctx, request as $9.RoomParticipantIdentity);
      case 'RemoveParticipant': return this.removeParticipant(ctx, request as $9.RoomParticipantIdentity);
      case 'MutePublishedTrack': return this.mutePublishedTrack(ctx, request as $9.MuteRoomTrackRequest);
      case 'UpdateParticipant': return this.updateParticipant(ctx, request as $9.UpdateParticipantRequest);
      case 'UpdateSubscriptions': return this.updateSubscriptions(ctx, request as $9.UpdateSubscriptionsRequest);
      case 'SendData': return this.sendData(ctx, request as $9.SendDataRequest);
      case 'UpdateRoomMetadata': return this.updateRoomMetadata(ctx, request as $9.UpdateRoomMetadataRequest);
      case 'ForwardParticipant': return this.forwardParticipant(ctx, request as $9.ForwardParticipantRequest);
      case 'MoveParticipant': return this.moveParticipant(ctx, request as $9.MoveParticipantRequest);
      case 'PerformRpc': return this.performRpc(ctx, request as $9.PerformRpcRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => RoomServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => RoomServiceBase$messageJson;
}

