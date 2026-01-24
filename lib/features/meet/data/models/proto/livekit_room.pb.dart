//
//  Generated code. Do not modify.
//  source: livekit_room.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_agent_dispatch.pb.dart' as $6;
import 'livekit_egress.pb.dart' as $7;
import 'livekit_models.pb.dart' as $2;
import 'livekit_models.pbenum.dart' as $2;

class CreateRoomRequest extends $pb.GeneratedMessage {
  factory CreateRoomRequest({
    $core.String? name,
    $core.int? emptyTimeout,
    $core.int? maxParticipants,
    $core.String? nodeId,
    $core.String? metadata,
    RoomEgress? egress,
    $core.int? minPlayoutDelay,
    $core.int? maxPlayoutDelay,
    $core.bool? syncStreams,
    $core.int? departureTimeout,
    $core.String? roomPreset,
    $core.bool? replayEnabled,
    $core.Iterable<$6.RoomAgentDispatch>? agents,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (emptyTimeout != null) {
      $result.emptyTimeout = emptyTimeout;
    }
    if (maxParticipants != null) {
      $result.maxParticipants = maxParticipants;
    }
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (egress != null) {
      $result.egress = egress;
    }
    if (minPlayoutDelay != null) {
      $result.minPlayoutDelay = minPlayoutDelay;
    }
    if (maxPlayoutDelay != null) {
      $result.maxPlayoutDelay = maxPlayoutDelay;
    }
    if (syncStreams != null) {
      $result.syncStreams = syncStreams;
    }
    if (departureTimeout != null) {
      $result.departureTimeout = departureTimeout;
    }
    if (roomPreset != null) {
      $result.roomPreset = roomPreset;
    }
    if (replayEnabled != null) {
      $result.replayEnabled = replayEnabled;
    }
    if (agents != null) {
      $result.agents.addAll(agents);
    }
    return $result;
  }
  CreateRoomRequest._() : super();
  factory CreateRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'emptyTimeout', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'maxParticipants', $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'nodeId')
    ..aOS(5, _omitFieldNames ? '' : 'metadata')
    ..aOM<RoomEgress>(6, _omitFieldNames ? '' : 'egress', subBuilder: RoomEgress.create)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'minPlayoutDelay', $pb.PbFieldType.OU3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'maxPlayoutDelay', $pb.PbFieldType.OU3)
    ..aOB(9, _omitFieldNames ? '' : 'syncStreams')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'departureTimeout', $pb.PbFieldType.OU3)
    ..aOS(12, _omitFieldNames ? '' : 'roomPreset')
    ..aOB(13, _omitFieldNames ? '' : 'replayEnabled')
    ..pc<$6.RoomAgentDispatch>(14, _omitFieldNames ? '' : 'agents', $pb.PbFieldType.PM, subBuilder: $6.RoomAgentDispatch.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRoomRequest clone() => CreateRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRoomRequest copyWith(void Function(CreateRoomRequest) updates) => super.copyWith((message) => updates(message as CreateRoomRequest)) as CreateRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRoomRequest create() => CreateRoomRequest._();
  CreateRoomRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRoomRequest> createRepeated() => $pb.PbList<CreateRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRoomRequest>(create);
  static CreateRoomRequest? _defaultInstance;

  /// name of the room
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// number of seconds to keep the room open if no one joins
  @$pb.TagNumber(2)
  $core.int get emptyTimeout => $_getIZ(1);
  @$pb.TagNumber(2)
  set emptyTimeout($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmptyTimeout() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmptyTimeout() => clearField(2);

  /// limit number of participants that can be in a room
  @$pb.TagNumber(3)
  $core.int get maxParticipants => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxParticipants($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaxParticipants() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxParticipants() => clearField(3);

  /// override the node room is allocated to, for debugging
  @$pb.TagNumber(4)
  $core.String get nodeId => $_getSZ(3);
  @$pb.TagNumber(4)
  set nodeId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNodeId() => $_has(3);
  @$pb.TagNumber(4)
  void clearNodeId() => clearField(4);

  /// metadata of room
  @$pb.TagNumber(5)
  $core.String get metadata => $_getSZ(4);
  @$pb.TagNumber(5)
  set metadata($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMetadata() => $_has(4);
  @$pb.TagNumber(5)
  void clearMetadata() => clearField(5);

  /// auto-egress configurations
  @$pb.TagNumber(6)
  RoomEgress get egress => $_getN(5);
  @$pb.TagNumber(6)
  set egress(RoomEgress v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasEgress() => $_has(5);
  @$pb.TagNumber(6)
  void clearEgress() => clearField(6);
  @$pb.TagNumber(6)
  RoomEgress ensureEgress() => $_ensure(5);

  /// playout delay of subscriber
  @$pb.TagNumber(7)
  $core.int get minPlayoutDelay => $_getIZ(6);
  @$pb.TagNumber(7)
  set minPlayoutDelay($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMinPlayoutDelay() => $_has(6);
  @$pb.TagNumber(7)
  void clearMinPlayoutDelay() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get maxPlayoutDelay => $_getIZ(7);
  @$pb.TagNumber(8)
  set maxPlayoutDelay($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMaxPlayoutDelay() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxPlayoutDelay() => clearField(8);

  /// improves A/V sync when playout_delay set to a value larger than 200ms. It will disables transceiver re-use
  /// so not recommended for rooms with frequent subscription changes
  @$pb.TagNumber(9)
  $core.bool get syncStreams => $_getBF(8);
  @$pb.TagNumber(9)
  set syncStreams($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSyncStreams() => $_has(8);
  @$pb.TagNumber(9)
  void clearSyncStreams() => clearField(9);

  /// number of seconds to keep the room open after everyone leaves
  @$pb.TagNumber(10)
  $core.int get departureTimeout => $_getIZ(9);
  @$pb.TagNumber(10)
  set departureTimeout($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDepartureTimeout() => $_has(9);
  @$pb.TagNumber(10)
  void clearDepartureTimeout() => clearField(10);

  /// configuration to use for this room parameters. Setting parameters below override the config defaults.
  @$pb.TagNumber(12)
  $core.String get roomPreset => $_getSZ(10);
  @$pb.TagNumber(12)
  set roomPreset($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasRoomPreset() => $_has(10);
  @$pb.TagNumber(12)
  void clearRoomPreset() => clearField(12);

  /// replay
  @$pb.TagNumber(13)
  $core.bool get replayEnabled => $_getBF(11);
  @$pb.TagNumber(13)
  set replayEnabled($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasReplayEnabled() => $_has(11);
  @$pb.TagNumber(13)
  void clearReplayEnabled() => clearField(13);

  /// Define agents that should be dispatched to this room
  @$pb.TagNumber(14)
  $core.List<$6.RoomAgentDispatch> get agents => $_getList(12);
}

class RoomEgress extends $pb.GeneratedMessage {
  factory RoomEgress({
    $7.RoomCompositeEgressRequest? room,
    $7.AutoTrackEgress? tracks,
    $7.AutoParticipantEgress? participant,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (tracks != null) {
      $result.tracks = tracks;
    }
    if (participant != null) {
      $result.participant = participant;
    }
    return $result;
  }
  RoomEgress._() : super();
  factory RoomEgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomEgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomEgress', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<$7.RoomCompositeEgressRequest>(1, _omitFieldNames ? '' : 'room', subBuilder: $7.RoomCompositeEgressRequest.create)
    ..aOM<$7.AutoTrackEgress>(2, _omitFieldNames ? '' : 'tracks', subBuilder: $7.AutoTrackEgress.create)
    ..aOM<$7.AutoParticipantEgress>(3, _omitFieldNames ? '' : 'participant', subBuilder: $7.AutoParticipantEgress.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomEgress clone() => RoomEgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomEgress copyWith(void Function(RoomEgress) updates) => super.copyWith((message) => updates(message as RoomEgress)) as RoomEgress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomEgress create() => RoomEgress._();
  RoomEgress createEmptyInstance() => create();
  static $pb.PbList<RoomEgress> createRepeated() => $pb.PbList<RoomEgress>();
  @$core.pragma('dart2js:noInline')
  static RoomEgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomEgress>(create);
  static RoomEgress? _defaultInstance;

  @$pb.TagNumber(1)
  $7.RoomCompositeEgressRequest get room => $_getN(0);
  @$pb.TagNumber(1)
  set room($7.RoomCompositeEgressRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
  @$pb.TagNumber(1)
  $7.RoomCompositeEgressRequest ensureRoom() => $_ensure(0);

  @$pb.TagNumber(2)
  $7.AutoTrackEgress get tracks => $_getN(1);
  @$pb.TagNumber(2)
  set tracks($7.AutoTrackEgress v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTracks() => $_has(1);
  @$pb.TagNumber(2)
  void clearTracks() => clearField(2);
  @$pb.TagNumber(2)
  $7.AutoTrackEgress ensureTracks() => $_ensure(1);

  @$pb.TagNumber(3)
  $7.AutoParticipantEgress get participant => $_getN(2);
  @$pb.TagNumber(3)
  set participant($7.AutoParticipantEgress v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasParticipant() => $_has(2);
  @$pb.TagNumber(3)
  void clearParticipant() => clearField(3);
  @$pb.TagNumber(3)
  $7.AutoParticipantEgress ensureParticipant() => $_ensure(2);
}

class RoomAgent extends $pb.GeneratedMessage {
  factory RoomAgent({
    $core.Iterable<$6.RoomAgentDispatch>? dispatches,
  }) {
    final $result = create();
    if (dispatches != null) {
      $result.dispatches.addAll(dispatches);
    }
    return $result;
  }
  RoomAgent._() : super();
  factory RoomAgent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomAgent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomAgent', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<$6.RoomAgentDispatch>(1, _omitFieldNames ? '' : 'dispatches', $pb.PbFieldType.PM, subBuilder: $6.RoomAgentDispatch.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomAgent clone() => RoomAgent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomAgent copyWith(void Function(RoomAgent) updates) => super.copyWith((message) => updates(message as RoomAgent)) as RoomAgent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomAgent create() => RoomAgent._();
  RoomAgent createEmptyInstance() => create();
  static $pb.PbList<RoomAgent> createRepeated() => $pb.PbList<RoomAgent>();
  @$core.pragma('dart2js:noInline')
  static RoomAgent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomAgent>(create);
  static RoomAgent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$6.RoomAgentDispatch> get dispatches => $_getList(0);
}

class ListRoomsRequest extends $pb.GeneratedMessage {
  factory ListRoomsRequest({
    $core.Iterable<$core.String>? names,
  }) {
    final $result = create();
    if (names != null) {
      $result.names.addAll(names);
    }
    return $result;
  }
  ListRoomsRequest._() : super();
  factory ListRoomsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRoomsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRoomsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'names')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListRoomsRequest clone() => ListRoomsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListRoomsRequest copyWith(void Function(ListRoomsRequest) updates) => super.copyWith((message) => updates(message as ListRoomsRequest)) as ListRoomsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRoomsRequest create() => ListRoomsRequest._();
  ListRoomsRequest createEmptyInstance() => create();
  static $pb.PbList<ListRoomsRequest> createRepeated() => $pb.PbList<ListRoomsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListRoomsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRoomsRequest>(create);
  static ListRoomsRequest? _defaultInstance;

  /// when set, will only return rooms with name match
  @$pb.TagNumber(1)
  $core.List<$core.String> get names => $_getList(0);
}

class ListRoomsResponse extends $pb.GeneratedMessage {
  factory ListRoomsResponse({
    $core.Iterable<$2.Room>? rooms,
  }) {
    final $result = create();
    if (rooms != null) {
      $result.rooms.addAll(rooms);
    }
    return $result;
  }
  ListRoomsResponse._() : super();
  factory ListRoomsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRoomsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRoomsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<$2.Room>(1, _omitFieldNames ? '' : 'rooms', $pb.PbFieldType.PM, subBuilder: $2.Room.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListRoomsResponse clone() => ListRoomsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListRoomsResponse copyWith(void Function(ListRoomsResponse) updates) => super.copyWith((message) => updates(message as ListRoomsResponse)) as ListRoomsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRoomsResponse create() => ListRoomsResponse._();
  ListRoomsResponse createEmptyInstance() => create();
  static $pb.PbList<ListRoomsResponse> createRepeated() => $pb.PbList<ListRoomsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListRoomsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRoomsResponse>(create);
  static ListRoomsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.Room> get rooms => $_getList(0);
}

class DeleteRoomRequest extends $pb.GeneratedMessage {
  factory DeleteRoomRequest({
    $core.String? room,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    return $result;
  }
  DeleteRoomRequest._() : super();
  factory DeleteRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'room')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRoomRequest clone() => DeleteRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRoomRequest copyWith(void Function(DeleteRoomRequest) updates) => super.copyWith((message) => updates(message as DeleteRoomRequest)) as DeleteRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteRoomRequest create() => DeleteRoomRequest._();
  DeleteRoomRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteRoomRequest> createRepeated() => $pb.PbList<DeleteRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRoomRequest>(create);
  static DeleteRoomRequest? _defaultInstance;

  /// name of the room
  @$pb.TagNumber(1)
  $core.String get room => $_getSZ(0);
  @$pb.TagNumber(1)
  set room($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
}

class DeleteRoomResponse extends $pb.GeneratedMessage {
  factory DeleteRoomResponse() => create();
  DeleteRoomResponse._() : super();
  factory DeleteRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRoomResponse clone() => DeleteRoomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRoomResponse copyWith(void Function(DeleteRoomResponse) updates) => super.copyWith((message) => updates(message as DeleteRoomResponse)) as DeleteRoomResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteRoomResponse create() => DeleteRoomResponse._();
  DeleteRoomResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteRoomResponse> createRepeated() => $pb.PbList<DeleteRoomResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteRoomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRoomResponse>(create);
  static DeleteRoomResponse? _defaultInstance;
}

class ListParticipantsRequest extends $pb.GeneratedMessage {
  factory ListParticipantsRequest({
    $core.String? room,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    return $result;
  }
  ListParticipantsRequest._() : super();
  factory ListParticipantsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListParticipantsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListParticipantsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'room')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListParticipantsRequest clone() => ListParticipantsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListParticipantsRequest copyWith(void Function(ListParticipantsRequest) updates) => super.copyWith((message) => updates(message as ListParticipantsRequest)) as ListParticipantsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListParticipantsRequest create() => ListParticipantsRequest._();
  ListParticipantsRequest createEmptyInstance() => create();
  static $pb.PbList<ListParticipantsRequest> createRepeated() => $pb.PbList<ListParticipantsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListParticipantsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListParticipantsRequest>(create);
  static ListParticipantsRequest? _defaultInstance;

  /// name of the room
  @$pb.TagNumber(1)
  $core.String get room => $_getSZ(0);
  @$pb.TagNumber(1)
  set room($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
}

class ListParticipantsResponse extends $pb.GeneratedMessage {
  factory ListParticipantsResponse({
    $core.Iterable<$2.ParticipantInfo>? participants,
  }) {
    final $result = create();
    if (participants != null) {
      $result.participants.addAll(participants);
    }
    return $result;
  }
  ListParticipantsResponse._() : super();
  factory ListParticipantsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListParticipantsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListParticipantsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<$2.ParticipantInfo>(1, _omitFieldNames ? '' : 'participants', $pb.PbFieldType.PM, subBuilder: $2.ParticipantInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListParticipantsResponse clone() => ListParticipantsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListParticipantsResponse copyWith(void Function(ListParticipantsResponse) updates) => super.copyWith((message) => updates(message as ListParticipantsResponse)) as ListParticipantsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListParticipantsResponse create() => ListParticipantsResponse._();
  ListParticipantsResponse createEmptyInstance() => create();
  static $pb.PbList<ListParticipantsResponse> createRepeated() => $pb.PbList<ListParticipantsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListParticipantsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListParticipantsResponse>(create);
  static ListParticipantsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.ParticipantInfo> get participants => $_getList(0);
}

class RoomParticipantIdentity extends $pb.GeneratedMessage {
  factory RoomParticipantIdentity({
    $core.String? room,
    $core.String? identity,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (identity != null) {
      $result.identity = identity;
    }
    return $result;
  }
  RoomParticipantIdentity._() : super();
  factory RoomParticipantIdentity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomParticipantIdentity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomParticipantIdentity', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'room')
    ..aOS(2, _omitFieldNames ? '' : 'identity')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomParticipantIdentity clone() => RoomParticipantIdentity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomParticipantIdentity copyWith(void Function(RoomParticipantIdentity) updates) => super.copyWith((message) => updates(message as RoomParticipantIdentity)) as RoomParticipantIdentity;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomParticipantIdentity create() => RoomParticipantIdentity._();
  RoomParticipantIdentity createEmptyInstance() => create();
  static $pb.PbList<RoomParticipantIdentity> createRepeated() => $pb.PbList<RoomParticipantIdentity>();
  @$core.pragma('dart2js:noInline')
  static RoomParticipantIdentity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomParticipantIdentity>(create);
  static RoomParticipantIdentity? _defaultInstance;

  /// name of the room
  @$pb.TagNumber(1)
  $core.String get room => $_getSZ(0);
  @$pb.TagNumber(1)
  set room($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);

  /// identity of the participant
  @$pb.TagNumber(2)
  $core.String get identity => $_getSZ(1);
  @$pb.TagNumber(2)
  set identity($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentity() => clearField(2);
}

class RemoveParticipantResponse extends $pb.GeneratedMessage {
  factory RemoveParticipantResponse() => create();
  RemoveParticipantResponse._() : super();
  factory RemoveParticipantResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveParticipantResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveParticipantResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveParticipantResponse clone() => RemoveParticipantResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveParticipantResponse copyWith(void Function(RemoveParticipantResponse) updates) => super.copyWith((message) => updates(message as RemoveParticipantResponse)) as RemoveParticipantResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveParticipantResponse create() => RemoveParticipantResponse._();
  RemoveParticipantResponse createEmptyInstance() => create();
  static $pb.PbList<RemoveParticipantResponse> createRepeated() => $pb.PbList<RemoveParticipantResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoveParticipantResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveParticipantResponse>(create);
  static RemoveParticipantResponse? _defaultInstance;
}

class MuteRoomTrackRequest extends $pb.GeneratedMessage {
  factory MuteRoomTrackRequest({
    $core.String? room,
    $core.String? identity,
    $core.String? trackSid,
    $core.bool? muted,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (identity != null) {
      $result.identity = identity;
    }
    if (trackSid != null) {
      $result.trackSid = trackSid;
    }
    if (muted != null) {
      $result.muted = muted;
    }
    return $result;
  }
  MuteRoomTrackRequest._() : super();
  factory MuteRoomTrackRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MuteRoomTrackRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MuteRoomTrackRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'room')
    ..aOS(2, _omitFieldNames ? '' : 'identity')
    ..aOS(3, _omitFieldNames ? '' : 'trackSid')
    ..aOB(4, _omitFieldNames ? '' : 'muted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MuteRoomTrackRequest clone() => MuteRoomTrackRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MuteRoomTrackRequest copyWith(void Function(MuteRoomTrackRequest) updates) => super.copyWith((message) => updates(message as MuteRoomTrackRequest)) as MuteRoomTrackRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MuteRoomTrackRequest create() => MuteRoomTrackRequest._();
  MuteRoomTrackRequest createEmptyInstance() => create();
  static $pb.PbList<MuteRoomTrackRequest> createRepeated() => $pb.PbList<MuteRoomTrackRequest>();
  @$core.pragma('dart2js:noInline')
  static MuteRoomTrackRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MuteRoomTrackRequest>(create);
  static MuteRoomTrackRequest? _defaultInstance;

  /// name of the room
  @$pb.TagNumber(1)
  $core.String get room => $_getSZ(0);
  @$pb.TagNumber(1)
  set room($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get identity => $_getSZ(1);
  @$pb.TagNumber(2)
  set identity($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentity() => clearField(2);

  /// sid of the track to mute
  @$pb.TagNumber(3)
  $core.String get trackSid => $_getSZ(2);
  @$pb.TagNumber(3)
  set trackSid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTrackSid() => $_has(2);
  @$pb.TagNumber(3)
  void clearTrackSid() => clearField(3);

  /// set to true to mute, false to unmute
  @$pb.TagNumber(4)
  $core.bool get muted => $_getBF(3);
  @$pb.TagNumber(4)
  set muted($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMuted() => $_has(3);
  @$pb.TagNumber(4)
  void clearMuted() => clearField(4);
}

class MuteRoomTrackResponse extends $pb.GeneratedMessage {
  factory MuteRoomTrackResponse({
    $2.TrackInfo? track,
  }) {
    final $result = create();
    if (track != null) {
      $result.track = track;
    }
    return $result;
  }
  MuteRoomTrackResponse._() : super();
  factory MuteRoomTrackResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MuteRoomTrackResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MuteRoomTrackResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<$2.TrackInfo>(1, _omitFieldNames ? '' : 'track', subBuilder: $2.TrackInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MuteRoomTrackResponse clone() => MuteRoomTrackResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MuteRoomTrackResponse copyWith(void Function(MuteRoomTrackResponse) updates) => super.copyWith((message) => updates(message as MuteRoomTrackResponse)) as MuteRoomTrackResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MuteRoomTrackResponse create() => MuteRoomTrackResponse._();
  MuteRoomTrackResponse createEmptyInstance() => create();
  static $pb.PbList<MuteRoomTrackResponse> createRepeated() => $pb.PbList<MuteRoomTrackResponse>();
  @$core.pragma('dart2js:noInline')
  static MuteRoomTrackResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MuteRoomTrackResponse>(create);
  static MuteRoomTrackResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $2.TrackInfo get track => $_getN(0);
  @$pb.TagNumber(1)
  set track($2.TrackInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrack() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrack() => clearField(1);
  @$pb.TagNumber(1)
  $2.TrackInfo ensureTrack() => $_ensure(0);
}

class UpdateParticipantRequest extends $pb.GeneratedMessage {
  factory UpdateParticipantRequest({
    $core.String? room,
    $core.String? identity,
    $core.String? metadata,
    $2.ParticipantPermission? permission,
    $core.String? name,
    $core.Map<$core.String, $core.String>? attributes,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (identity != null) {
      $result.identity = identity;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (permission != null) {
      $result.permission = permission;
    }
    if (name != null) {
      $result.name = name;
    }
    if (attributes != null) {
      $result.attributes.addAll(attributes);
    }
    return $result;
  }
  UpdateParticipantRequest._() : super();
  factory UpdateParticipantRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateParticipantRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateParticipantRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'room')
    ..aOS(2, _omitFieldNames ? '' : 'identity')
    ..aOS(3, _omitFieldNames ? '' : 'metadata')
    ..aOM<$2.ParticipantPermission>(4, _omitFieldNames ? '' : 'permission', subBuilder: $2.ParticipantPermission.create)
    ..aOS(5, _omitFieldNames ? '' : 'name')
    ..m<$core.String, $core.String>(6, _omitFieldNames ? '' : 'attributes', entryClassName: 'UpdateParticipantRequest.AttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateParticipantRequest clone() => UpdateParticipantRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateParticipantRequest copyWith(void Function(UpdateParticipantRequest) updates) => super.copyWith((message) => updates(message as UpdateParticipantRequest)) as UpdateParticipantRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateParticipantRequest create() => UpdateParticipantRequest._();
  UpdateParticipantRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateParticipantRequest> createRepeated() => $pb.PbList<UpdateParticipantRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateParticipantRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateParticipantRequest>(create);
  static UpdateParticipantRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get room => $_getSZ(0);
  @$pb.TagNumber(1)
  set room($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get identity => $_getSZ(1);
  @$pb.TagNumber(2)
  set identity($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentity() => clearField(2);

  /// metadata to update. skipping updates if left empty
  @$pb.TagNumber(3)
  $core.String get metadata => $_getSZ(2);
  @$pb.TagNumber(3)
  set metadata($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearMetadata() => clearField(3);

  /// set to update the participant's permissions
  @$pb.TagNumber(4)
  $2.ParticipantPermission get permission => $_getN(3);
  @$pb.TagNumber(4)
  set permission($2.ParticipantPermission v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPermission() => $_has(3);
  @$pb.TagNumber(4)
  void clearPermission() => clearField(4);
  @$pb.TagNumber(4)
  $2.ParticipantPermission ensurePermission() => $_ensure(3);

  /// display name to update
  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  /// attributes to update. it only updates attributes that have been set
  /// to delete attributes, set the value to an empty string
  @$pb.TagNumber(6)
  $core.Map<$core.String, $core.String> get attributes => $_getMap(5);
}

class UpdateSubscriptionsRequest extends $pb.GeneratedMessage {
  factory UpdateSubscriptionsRequest({
    $core.String? room,
    $core.String? identity,
    $core.Iterable<$core.String>? trackSids,
    $core.bool? subscribe,
    $core.Iterable<$2.ParticipantTracks>? participantTracks,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (identity != null) {
      $result.identity = identity;
    }
    if (trackSids != null) {
      $result.trackSids.addAll(trackSids);
    }
    if (subscribe != null) {
      $result.subscribe = subscribe;
    }
    if (participantTracks != null) {
      $result.participantTracks.addAll(participantTracks);
    }
    return $result;
  }
  UpdateSubscriptionsRequest._() : super();
  factory UpdateSubscriptionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSubscriptionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSubscriptionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'room')
    ..aOS(2, _omitFieldNames ? '' : 'identity')
    ..pPS(3, _omitFieldNames ? '' : 'trackSids')
    ..aOB(4, _omitFieldNames ? '' : 'subscribe')
    ..pc<$2.ParticipantTracks>(5, _omitFieldNames ? '' : 'participantTracks', $pb.PbFieldType.PM, subBuilder: $2.ParticipantTracks.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSubscriptionsRequest clone() => UpdateSubscriptionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSubscriptionsRequest copyWith(void Function(UpdateSubscriptionsRequest) updates) => super.copyWith((message) => updates(message as UpdateSubscriptionsRequest)) as UpdateSubscriptionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSubscriptionsRequest create() => UpdateSubscriptionsRequest._();
  UpdateSubscriptionsRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSubscriptionsRequest> createRepeated() => $pb.PbList<UpdateSubscriptionsRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSubscriptionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSubscriptionsRequest>(create);
  static UpdateSubscriptionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get room => $_getSZ(0);
  @$pb.TagNumber(1)
  set room($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get identity => $_getSZ(1);
  @$pb.TagNumber(2)
  set identity($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentity() => clearField(2);

  /// list of sids of tracks
  @$pb.TagNumber(3)
  $core.List<$core.String> get trackSids => $_getList(2);

  /// set to true to subscribe, false to unsubscribe from tracks
  @$pb.TagNumber(4)
  $core.bool get subscribe => $_getBF(3);
  @$pb.TagNumber(4)
  set subscribe($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSubscribe() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubscribe() => clearField(4);

  /// list of participants and their tracks
  @$pb.TagNumber(5)
  $core.List<$2.ParticipantTracks> get participantTracks => $_getList(4);
}

class UpdateSubscriptionsResponse extends $pb.GeneratedMessage {
  factory UpdateSubscriptionsResponse() => create();
  UpdateSubscriptionsResponse._() : super();
  factory UpdateSubscriptionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSubscriptionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSubscriptionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSubscriptionsResponse clone() => UpdateSubscriptionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSubscriptionsResponse copyWith(void Function(UpdateSubscriptionsResponse) updates) => super.copyWith((message) => updates(message as UpdateSubscriptionsResponse)) as UpdateSubscriptionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSubscriptionsResponse create() => UpdateSubscriptionsResponse._();
  UpdateSubscriptionsResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSubscriptionsResponse> createRepeated() => $pb.PbList<UpdateSubscriptionsResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSubscriptionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSubscriptionsResponse>(create);
  static UpdateSubscriptionsResponse? _defaultInstance;
}

class SendDataRequest extends $pb.GeneratedMessage {
  factory SendDataRequest({
    $core.String? room,
    $core.List<$core.int>? data,
    $2.DataPacket_Kind? kind,
  @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.String>? destinationSids,
    $core.String? topic,
    $core.Iterable<$core.String>? destinationIdentities,
    $core.List<$core.int>? nonce,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (data != null) {
      $result.data = data;
    }
    if (kind != null) {
      $result.kind = kind;
    }
    if (destinationSids != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.destinationSids.addAll(destinationSids);
    }
    if (topic != null) {
      $result.topic = topic;
    }
    if (destinationIdentities != null) {
      $result.destinationIdentities.addAll(destinationIdentities);
    }
    if (nonce != null) {
      $result.nonce = nonce;
    }
    return $result;
  }
  SendDataRequest._() : super();
  factory SendDataRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendDataRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendDataRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'room')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..e<$2.DataPacket_Kind>(3, _omitFieldNames ? '' : 'kind', $pb.PbFieldType.OE, defaultOrMaker: $2.DataPacket_Kind.RELIABLE, valueOf: $2.DataPacket_Kind.valueOf, enumValues: $2.DataPacket_Kind.values)
    ..pPS(4, _omitFieldNames ? '' : 'destinationSids')
    ..aOS(5, _omitFieldNames ? '' : 'topic')
    ..pPS(6, _omitFieldNames ? '' : 'destinationIdentities')
    ..a<$core.List<$core.int>>(7, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendDataRequest clone() => SendDataRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendDataRequest copyWith(void Function(SendDataRequest) updates) => super.copyWith((message) => updates(message as SendDataRequest)) as SendDataRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendDataRequest create() => SendDataRequest._();
  SendDataRequest createEmptyInstance() => create();
  static $pb.PbList<SendDataRequest> createRepeated() => $pb.PbList<SendDataRequest>();
  @$core.pragma('dart2js:noInline')
  static SendDataRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendDataRequest>(create);
  static SendDataRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get room => $_getSZ(0);
  @$pb.TagNumber(1)
  set room($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);

  @$pb.TagNumber(3)
  $2.DataPacket_Kind get kind => $_getN(2);
  @$pb.TagNumber(3)
  set kind($2.DataPacket_Kind v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasKind() => $_has(2);
  @$pb.TagNumber(3)
  void clearKind() => clearField(3);

  /// mark deprecated
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.List<$core.String> get destinationSids => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get topic => $_getSZ(4);
  @$pb.TagNumber(5)
  set topic($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTopic() => $_has(4);
  @$pb.TagNumber(5)
  void clearTopic() => clearField(5);

  /// when set, only forward to these identities
  @$pb.TagNumber(6)
  $core.List<$core.String> get destinationIdentities => $_getList(5);

  /// added by SDK to enable de-duping of messages, for INTERNAL USE ONLY
  @$pb.TagNumber(7)
  $core.List<$core.int> get nonce => $_getN(6);
  @$pb.TagNumber(7)
  set nonce($core.List<$core.int> v) { $_setBytes(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNonce() => $_has(6);
  @$pb.TagNumber(7)
  void clearNonce() => clearField(7);
}

class SendDataResponse extends $pb.GeneratedMessage {
  factory SendDataResponse() => create();
  SendDataResponse._() : super();
  factory SendDataResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendDataResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendDataResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendDataResponse clone() => SendDataResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendDataResponse copyWith(void Function(SendDataResponse) updates) => super.copyWith((message) => updates(message as SendDataResponse)) as SendDataResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendDataResponse create() => SendDataResponse._();
  SendDataResponse createEmptyInstance() => create();
  static $pb.PbList<SendDataResponse> createRepeated() => $pb.PbList<SendDataResponse>();
  @$core.pragma('dart2js:noInline')
  static SendDataResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendDataResponse>(create);
  static SendDataResponse? _defaultInstance;
}

class UpdateRoomMetadataRequest extends $pb.GeneratedMessage {
  factory UpdateRoomMetadataRequest({
    $core.String? room,
    $core.String? metadata,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  UpdateRoomMetadataRequest._() : super();
  factory UpdateRoomMetadataRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateRoomMetadataRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateRoomMetadataRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'room')
    ..aOS(2, _omitFieldNames ? '' : 'metadata')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateRoomMetadataRequest clone() => UpdateRoomMetadataRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateRoomMetadataRequest copyWith(void Function(UpdateRoomMetadataRequest) updates) => super.copyWith((message) => updates(message as UpdateRoomMetadataRequest)) as UpdateRoomMetadataRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateRoomMetadataRequest create() => UpdateRoomMetadataRequest._();
  UpdateRoomMetadataRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateRoomMetadataRequest> createRepeated() => $pb.PbList<UpdateRoomMetadataRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateRoomMetadataRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateRoomMetadataRequest>(create);
  static UpdateRoomMetadataRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get room => $_getSZ(0);
  @$pb.TagNumber(1)
  set room($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);

  /// metadata to update. skipping updates if left empty
  @$pb.TagNumber(2)
  $core.String get metadata => $_getSZ(1);
  @$pb.TagNumber(2)
  set metadata($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMetadata() => $_has(1);
  @$pb.TagNumber(2)
  void clearMetadata() => clearField(2);
}

class RoomConfiguration extends $pb.GeneratedMessage {
  factory RoomConfiguration({
    $core.String? name,
    $core.int? emptyTimeout,
    $core.int? departureTimeout,
    $core.int? maxParticipants,
    RoomEgress? egress,
    $core.int? minPlayoutDelay,
    $core.int? maxPlayoutDelay,
    $core.bool? syncStreams,
    $core.Iterable<$6.RoomAgentDispatch>? agents,
    $core.String? metadata,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (emptyTimeout != null) {
      $result.emptyTimeout = emptyTimeout;
    }
    if (departureTimeout != null) {
      $result.departureTimeout = departureTimeout;
    }
    if (maxParticipants != null) {
      $result.maxParticipants = maxParticipants;
    }
    if (egress != null) {
      $result.egress = egress;
    }
    if (minPlayoutDelay != null) {
      $result.minPlayoutDelay = minPlayoutDelay;
    }
    if (maxPlayoutDelay != null) {
      $result.maxPlayoutDelay = maxPlayoutDelay;
    }
    if (syncStreams != null) {
      $result.syncStreams = syncStreams;
    }
    if (agents != null) {
      $result.agents.addAll(agents);
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  RoomConfiguration._() : super();
  factory RoomConfiguration.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomConfiguration.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomConfiguration', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'emptyTimeout', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'departureTimeout', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'maxParticipants', $pb.PbFieldType.OU3)
    ..aOM<RoomEgress>(5, _omitFieldNames ? '' : 'egress', subBuilder: RoomEgress.create)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'minPlayoutDelay', $pb.PbFieldType.OU3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'maxPlayoutDelay', $pb.PbFieldType.OU3)
    ..aOB(9, _omitFieldNames ? '' : 'syncStreams')
    ..pc<$6.RoomAgentDispatch>(10, _omitFieldNames ? '' : 'agents', $pb.PbFieldType.PM, subBuilder: $6.RoomAgentDispatch.create)
    ..aOS(11, _omitFieldNames ? '' : 'metadata')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomConfiguration clone() => RoomConfiguration()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomConfiguration copyWith(void Function(RoomConfiguration) updates) => super.copyWith((message) => updates(message as RoomConfiguration)) as RoomConfiguration;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomConfiguration create() => RoomConfiguration._();
  RoomConfiguration createEmptyInstance() => create();
  static $pb.PbList<RoomConfiguration> createRepeated() => $pb.PbList<RoomConfiguration>();
  @$core.pragma('dart2js:noInline')
  static RoomConfiguration getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomConfiguration>(create);
  static RoomConfiguration? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// number of seconds to keep the room open if no one joins
  @$pb.TagNumber(2)
  $core.int get emptyTimeout => $_getIZ(1);
  @$pb.TagNumber(2)
  set emptyTimeout($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmptyTimeout() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmptyTimeout() => clearField(2);

  /// number of seconds to keep the room open after everyone leaves
  @$pb.TagNumber(3)
  $core.int get departureTimeout => $_getIZ(2);
  @$pb.TagNumber(3)
  set departureTimeout($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDepartureTimeout() => $_has(2);
  @$pb.TagNumber(3)
  void clearDepartureTimeout() => clearField(3);

  /// limit number of participants that can be in a room, excluding Egress and Ingress participants
  @$pb.TagNumber(4)
  $core.int get maxParticipants => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxParticipants($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMaxParticipants() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxParticipants() => clearField(4);

  /// egress
  @$pb.TagNumber(5)
  RoomEgress get egress => $_getN(4);
  @$pb.TagNumber(5)
  set egress(RoomEgress v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEgress() => $_has(4);
  @$pb.TagNumber(5)
  void clearEgress() => clearField(5);
  @$pb.TagNumber(5)
  RoomEgress ensureEgress() => $_ensure(4);

  /// playout delay of subscriber
  @$pb.TagNumber(7)
  $core.int get minPlayoutDelay => $_getIZ(5);
  @$pb.TagNumber(7)
  set minPlayoutDelay($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasMinPlayoutDelay() => $_has(5);
  @$pb.TagNumber(7)
  void clearMinPlayoutDelay() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get maxPlayoutDelay => $_getIZ(6);
  @$pb.TagNumber(8)
  set maxPlayoutDelay($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasMaxPlayoutDelay() => $_has(6);
  @$pb.TagNumber(8)
  void clearMaxPlayoutDelay() => clearField(8);

  /// improves A/V sync when playout_delay set to a value larger than 200ms. It will disables transceiver re-use
  /// so not recommended for rooms with frequent subscription changes
  @$pb.TagNumber(9)
  $core.bool get syncStreams => $_getBF(7);
  @$pb.TagNumber(9)
  set syncStreams($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasSyncStreams() => $_has(7);
  @$pb.TagNumber(9)
  void clearSyncStreams() => clearField(9);

  /// Define agents that should be dispatched to this room
  @$pb.TagNumber(10)
  $core.List<$6.RoomAgentDispatch> get agents => $_getList(8);

  /// metadata of room
  @$pb.TagNumber(11)
  $core.String get metadata => $_getSZ(9);
  @$pb.TagNumber(11)
  set metadata($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasMetadata() => $_has(9);
  @$pb.TagNumber(11)
  void clearMetadata() => clearField(11);
}

class ForwardParticipantRequest extends $pb.GeneratedMessage {
  factory ForwardParticipantRequest({
    $core.String? room,
    $core.String? identity,
    $core.String? destinationRoom,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (identity != null) {
      $result.identity = identity;
    }
    if (destinationRoom != null) {
      $result.destinationRoom = destinationRoom;
    }
    return $result;
  }
  ForwardParticipantRequest._() : super();
  factory ForwardParticipantRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForwardParticipantRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ForwardParticipantRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'room')
    ..aOS(2, _omitFieldNames ? '' : 'identity')
    ..aOS(3, _omitFieldNames ? '' : 'destinationRoom')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForwardParticipantRequest clone() => ForwardParticipantRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForwardParticipantRequest copyWith(void Function(ForwardParticipantRequest) updates) => super.copyWith((message) => updates(message as ForwardParticipantRequest)) as ForwardParticipantRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForwardParticipantRequest create() => ForwardParticipantRequest._();
  ForwardParticipantRequest createEmptyInstance() => create();
  static $pb.PbList<ForwardParticipantRequest> createRepeated() => $pb.PbList<ForwardParticipantRequest>();
  @$core.pragma('dart2js:noInline')
  static ForwardParticipantRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForwardParticipantRequest>(create);
  static ForwardParticipantRequest? _defaultInstance;

  /// room to forward participant from
  @$pb.TagNumber(1)
  $core.String get room => $_getSZ(0);
  @$pb.TagNumber(1)
  set room($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);

  /// identity of the participant to forward
  @$pb.TagNumber(2)
  $core.String get identity => $_getSZ(1);
  @$pb.TagNumber(2)
  set identity($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentity() => clearField(2);

  /// room to forward participant to
  @$pb.TagNumber(3)
  $core.String get destinationRoom => $_getSZ(2);
  @$pb.TagNumber(3)
  set destinationRoom($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDestinationRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestinationRoom() => clearField(3);
}

class ForwardParticipantResponse extends $pb.GeneratedMessage {
  factory ForwardParticipantResponse() => create();
  ForwardParticipantResponse._() : super();
  factory ForwardParticipantResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForwardParticipantResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ForwardParticipantResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForwardParticipantResponse clone() => ForwardParticipantResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForwardParticipantResponse copyWith(void Function(ForwardParticipantResponse) updates) => super.copyWith((message) => updates(message as ForwardParticipantResponse)) as ForwardParticipantResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForwardParticipantResponse create() => ForwardParticipantResponse._();
  ForwardParticipantResponse createEmptyInstance() => create();
  static $pb.PbList<ForwardParticipantResponse> createRepeated() => $pb.PbList<ForwardParticipantResponse>();
  @$core.pragma('dart2js:noInline')
  static ForwardParticipantResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForwardParticipantResponse>(create);
  static ForwardParticipantResponse? _defaultInstance;
}

class MoveParticipantRequest extends $pb.GeneratedMessage {
  factory MoveParticipantRequest({
    $core.String? room,
    $core.String? identity,
    $core.String? destinationRoom,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (identity != null) {
      $result.identity = identity;
    }
    if (destinationRoom != null) {
      $result.destinationRoom = destinationRoom;
    }
    return $result;
  }
  MoveParticipantRequest._() : super();
  factory MoveParticipantRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveParticipantRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MoveParticipantRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'room')
    ..aOS(2, _omitFieldNames ? '' : 'identity')
    ..aOS(3, _omitFieldNames ? '' : 'destinationRoom')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoveParticipantRequest clone() => MoveParticipantRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoveParticipantRequest copyWith(void Function(MoveParticipantRequest) updates) => super.copyWith((message) => updates(message as MoveParticipantRequest)) as MoveParticipantRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoveParticipantRequest create() => MoveParticipantRequest._();
  MoveParticipantRequest createEmptyInstance() => create();
  static $pb.PbList<MoveParticipantRequest> createRepeated() => $pb.PbList<MoveParticipantRequest>();
  @$core.pragma('dart2js:noInline')
  static MoveParticipantRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveParticipantRequest>(create);
  static MoveParticipantRequest? _defaultInstance;

  /// room to move participant from
  @$pb.TagNumber(1)
  $core.String get room => $_getSZ(0);
  @$pb.TagNumber(1)
  set room($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);

  /// identity of the participant to move to
  @$pb.TagNumber(2)
  $core.String get identity => $_getSZ(1);
  @$pb.TagNumber(2)
  set identity($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentity() => clearField(2);

  /// room to move participant to
  @$pb.TagNumber(3)
  $core.String get destinationRoom => $_getSZ(2);
  @$pb.TagNumber(3)
  set destinationRoom($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDestinationRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestinationRoom() => clearField(3);
}

class MoveParticipantResponse extends $pb.GeneratedMessage {
  factory MoveParticipantResponse() => create();
  MoveParticipantResponse._() : super();
  factory MoveParticipantResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveParticipantResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MoveParticipantResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoveParticipantResponse clone() => MoveParticipantResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoveParticipantResponse copyWith(void Function(MoveParticipantResponse) updates) => super.copyWith((message) => updates(message as MoveParticipantResponse)) as MoveParticipantResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoveParticipantResponse create() => MoveParticipantResponse._();
  MoveParticipantResponse createEmptyInstance() => create();
  static $pb.PbList<MoveParticipantResponse> createRepeated() => $pb.PbList<MoveParticipantResponse>();
  @$core.pragma('dart2js:noInline')
  static MoveParticipantResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveParticipantResponse>(create);
  static MoveParticipantResponse? _defaultInstance;
}

class PerformRpcRequest extends $pb.GeneratedMessage {
  factory PerformRpcRequest({
    $core.String? room,
    $core.String? destinationIdentity,
    $core.String? method,
    $core.String? payload,
    $core.int? responseTimeoutMs,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (destinationIdentity != null) {
      $result.destinationIdentity = destinationIdentity;
    }
    if (method != null) {
      $result.method = method;
    }
    if (payload != null) {
      $result.payload = payload;
    }
    if (responseTimeoutMs != null) {
      $result.responseTimeoutMs = responseTimeoutMs;
    }
    return $result;
  }
  PerformRpcRequest._() : super();
  factory PerformRpcRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PerformRpcRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PerformRpcRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'room')
    ..aOS(2, _omitFieldNames ? '' : 'destinationIdentity')
    ..aOS(3, _omitFieldNames ? '' : 'method')
    ..aOS(4, _omitFieldNames ? '' : 'payload')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'responseTimeoutMs', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PerformRpcRequest clone() => PerformRpcRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PerformRpcRequest copyWith(void Function(PerformRpcRequest) updates) => super.copyWith((message) => updates(message as PerformRpcRequest)) as PerformRpcRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PerformRpcRequest create() => PerformRpcRequest._();
  PerformRpcRequest createEmptyInstance() => create();
  static $pb.PbList<PerformRpcRequest> createRepeated() => $pb.PbList<PerformRpcRequest>();
  @$core.pragma('dart2js:noInline')
  static PerformRpcRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PerformRpcRequest>(create);
  static PerformRpcRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get room => $_getSZ(0);
  @$pb.TagNumber(1)
  set room($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get destinationIdentity => $_getSZ(1);
  @$pb.TagNumber(2)
  set destinationIdentity($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDestinationIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearDestinationIdentity() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get method => $_getSZ(2);
  @$pb.TagNumber(3)
  set method($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMethod() => $_has(2);
  @$pb.TagNumber(3)
  void clearMethod() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get payload => $_getSZ(3);
  @$pb.TagNumber(4)
  set payload($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPayload() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayload() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get responseTimeoutMs => $_getIZ(4);
  @$pb.TagNumber(5)
  set responseTimeoutMs($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasResponseTimeoutMs() => $_has(4);
  @$pb.TagNumber(5)
  void clearResponseTimeoutMs() => clearField(5);
}

class PerformRpcResponse extends $pb.GeneratedMessage {
  factory PerformRpcResponse({
    $core.String? payload,
  }) {
    final $result = create();
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  PerformRpcResponse._() : super();
  factory PerformRpcResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PerformRpcResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PerformRpcResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'payload')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PerformRpcResponse clone() => PerformRpcResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PerformRpcResponse copyWith(void Function(PerformRpcResponse) updates) => super.copyWith((message) => updates(message as PerformRpcResponse)) as PerformRpcResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PerformRpcResponse create() => PerformRpcResponse._();
  PerformRpcResponse createEmptyInstance() => create();
  static $pb.PbList<PerformRpcResponse> createRepeated() => $pb.PbList<PerformRpcResponse>();
  @$core.pragma('dart2js:noInline')
  static PerformRpcResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PerformRpcResponse>(create);
  static PerformRpcResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get payload => $_getSZ(0);
  @$pb.TagNumber(1)
  set payload($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayload() => clearField(1);
}

class RoomServiceApi {
  $pb.RpcClient _client;
  RoomServiceApi(this._client);

  $async.Future<$2.Room> createRoom($pb.ClientContext? ctx, CreateRoomRequest request) =>
    _client.invoke<$2.Room>(ctx, 'RoomService', 'CreateRoom', request, $2.Room())
  ;
  $async.Future<ListRoomsResponse> listRooms($pb.ClientContext? ctx, ListRoomsRequest request) =>
    _client.invoke<ListRoomsResponse>(ctx, 'RoomService', 'ListRooms', request, ListRoomsResponse())
  ;
  $async.Future<DeleteRoomResponse> deleteRoom($pb.ClientContext? ctx, DeleteRoomRequest request) =>
    _client.invoke<DeleteRoomResponse>(ctx, 'RoomService', 'DeleteRoom', request, DeleteRoomResponse())
  ;
  $async.Future<ListParticipantsResponse> listParticipants($pb.ClientContext? ctx, ListParticipantsRequest request) =>
    _client.invoke<ListParticipantsResponse>(ctx, 'RoomService', 'ListParticipants', request, ListParticipantsResponse())
  ;
  $async.Future<$2.ParticipantInfo> getParticipant($pb.ClientContext? ctx, RoomParticipantIdentity request) =>
    _client.invoke<$2.ParticipantInfo>(ctx, 'RoomService', 'GetParticipant', request, $2.ParticipantInfo())
  ;
  $async.Future<RemoveParticipantResponse> removeParticipant($pb.ClientContext? ctx, RoomParticipantIdentity request) =>
    _client.invoke<RemoveParticipantResponse>(ctx, 'RoomService', 'RemoveParticipant', request, RemoveParticipantResponse())
  ;
  $async.Future<MuteRoomTrackResponse> mutePublishedTrack($pb.ClientContext? ctx, MuteRoomTrackRequest request) =>
    _client.invoke<MuteRoomTrackResponse>(ctx, 'RoomService', 'MutePublishedTrack', request, MuteRoomTrackResponse())
  ;
  $async.Future<$2.ParticipantInfo> updateParticipant($pb.ClientContext? ctx, UpdateParticipantRequest request) =>
    _client.invoke<$2.ParticipantInfo>(ctx, 'RoomService', 'UpdateParticipant', request, $2.ParticipantInfo())
  ;
  $async.Future<UpdateSubscriptionsResponse> updateSubscriptions($pb.ClientContext? ctx, UpdateSubscriptionsRequest request) =>
    _client.invoke<UpdateSubscriptionsResponse>(ctx, 'RoomService', 'UpdateSubscriptions', request, UpdateSubscriptionsResponse())
  ;
  $async.Future<SendDataResponse> sendData($pb.ClientContext? ctx, SendDataRequest request) =>
    _client.invoke<SendDataResponse>(ctx, 'RoomService', 'SendData', request, SendDataResponse())
  ;
  $async.Future<$2.Room> updateRoomMetadata($pb.ClientContext? ctx, UpdateRoomMetadataRequest request) =>
    _client.invoke<$2.Room>(ctx, 'RoomService', 'UpdateRoomMetadata', request, $2.Room())
  ;
  $async.Future<ForwardParticipantResponse> forwardParticipant($pb.ClientContext? ctx, ForwardParticipantRequest request) =>
    _client.invoke<ForwardParticipantResponse>(ctx, 'RoomService', 'ForwardParticipant', request, ForwardParticipantResponse())
  ;
  $async.Future<MoveParticipantResponse> moveParticipant($pb.ClientContext? ctx, MoveParticipantRequest request) =>
    _client.invoke<MoveParticipantResponse>(ctx, 'RoomService', 'MoveParticipant', request, MoveParticipantResponse())
  ;
  $async.Future<PerformRpcResponse> performRpc($pb.ClientContext? ctx, PerformRpcRequest request) =>
    _client.invoke<PerformRpcResponse>(ctx, 'RoomService', 'PerformRpc', request, PerformRpcResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
