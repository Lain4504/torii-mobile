//
//  Generated code. Do not modify.
//  source: wajlc_nats_msg.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_nats_msg.pbenum.dart';

export 'wajlc_nats_msg.pbenum.dart';

class NatsSubjects extends $pb.GeneratedMessage {
  factory NatsSubjects({
    $core.String? systemApiWorker,
    $core.String? systemJsWorker,
    $core.String? systemPublic,
    $core.String? systemPrivate,
    $core.String? chat,
    $core.String? whiteboard,
    $core.String? dataChannel,
  }) {
    final $result = create();
    if (systemApiWorker != null) {
      $result.systemApiWorker = systemApiWorker;
    }
    if (systemJsWorker != null) {
      $result.systemJsWorker = systemJsWorker;
    }
    if (systemPublic != null) {
      $result.systemPublic = systemPublic;
    }
    if (systemPrivate != null) {
      $result.systemPrivate = systemPrivate;
    }
    if (chat != null) {
      $result.chat = chat;
    }
    if (whiteboard != null) {
      $result.whiteboard = whiteboard;
    }
    if (dataChannel != null) {
      $result.dataChannel = dataChannel;
    }
    return $result;
  }
  NatsSubjects._() : super();
  factory NatsSubjects.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NatsSubjects.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NatsSubjects', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'systemApiWorker')
    ..aOS(2, _omitFieldNames ? '' : 'systemJsWorker')
    ..aOS(3, _omitFieldNames ? '' : 'systemPublic')
    ..aOS(4, _omitFieldNames ? '' : 'systemPrivate')
    ..aOS(5, _omitFieldNames ? '' : 'chat')
    ..aOS(6, _omitFieldNames ? '' : 'whiteboard')
    ..aOS(7, _omitFieldNames ? '' : 'dataChannel')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NatsSubjects clone() => NatsSubjects()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NatsSubjects copyWith(void Function(NatsSubjects) updates) => super.copyWith((message) => updates(message as NatsSubjects)) as NatsSubjects;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NatsSubjects create() => NatsSubjects._();
  NatsSubjects createEmptyInstance() => create();
  static $pb.PbList<NatsSubjects> createRepeated() => $pb.PbList<NatsSubjects>();
  @$core.pragma('dart2js:noInline')
  static NatsSubjects getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NatsSubjects>(create);
  static NatsSubjects? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get systemApiWorker => $_getSZ(0);
  @$pb.TagNumber(1)
  set systemApiWorker($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSystemApiWorker() => $_has(0);
  @$pb.TagNumber(1)
  void clearSystemApiWorker() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get systemJsWorker => $_getSZ(1);
  @$pb.TagNumber(2)
  set systemJsWorker($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSystemJsWorker() => $_has(1);
  @$pb.TagNumber(2)
  void clearSystemJsWorker() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get systemPublic => $_getSZ(2);
  @$pb.TagNumber(3)
  set systemPublic($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSystemPublic() => $_has(2);
  @$pb.TagNumber(3)
  void clearSystemPublic() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get systemPrivate => $_getSZ(3);
  @$pb.TagNumber(4)
  set systemPrivate($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSystemPrivate() => $_has(3);
  @$pb.TagNumber(4)
  void clearSystemPrivate() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get chat => $_getSZ(4);
  @$pb.TagNumber(5)
  set chat($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChat() => $_has(4);
  @$pb.TagNumber(5)
  void clearChat() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get whiteboard => $_getSZ(5);
  @$pb.TagNumber(6)
  set whiteboard($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWhiteboard() => $_has(5);
  @$pb.TagNumber(6)
  void clearWhiteboard() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get dataChannel => $_getSZ(6);
  @$pb.TagNumber(7)
  set dataChannel($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDataChannel() => $_has(6);
  @$pb.TagNumber(7)
  void clearDataChannel() => clearField(7);
}

class NatsMsgServerToClient extends $pb.GeneratedMessage {
  factory NatsMsgServerToClient({
    $core.String? id,
    NatsMsgServerToClientEvents? event,
    $core.String? msg,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (event != null) {
      $result.event = event;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    return $result;
  }
  NatsMsgServerToClient._() : super();
  factory NatsMsgServerToClient.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NatsMsgServerToClient.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NatsMsgServerToClient', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..e<NatsMsgServerToClientEvents>(2, _omitFieldNames ? '' : 'event', $pb.PbFieldType.OE, defaultOrMaker: NatsMsgServerToClientEvents.RES_INITIAL_DATA, valueOf: NatsMsgServerToClientEvents.valueOf, enumValues: NatsMsgServerToClientEvents.values)
    ..aOS(3, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NatsMsgServerToClient clone() => NatsMsgServerToClient()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NatsMsgServerToClient copyWith(void Function(NatsMsgServerToClient) updates) => super.copyWith((message) => updates(message as NatsMsgServerToClient)) as NatsMsgServerToClient;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NatsMsgServerToClient create() => NatsMsgServerToClient._();
  NatsMsgServerToClient createEmptyInstance() => create();
  static $pb.PbList<NatsMsgServerToClient> createRepeated() => $pb.PbList<NatsMsgServerToClient>();
  @$core.pragma('dart2js:noInline')
  static NatsMsgServerToClient getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NatsMsgServerToClient>(create);
  static NatsMsgServerToClient? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  NatsMsgServerToClientEvents get event => $_getN(1);
  @$pb.TagNumber(2)
  set event(NatsMsgServerToClientEvents v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEvent() => $_has(1);
  @$pb.TagNumber(2)
  void clearEvent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);
}

class NatsMsgClientToServer extends $pb.GeneratedMessage {
  factory NatsMsgClientToServer({
    $core.String? id,
    NatsMsgClientToServerEvents? event,
    $core.String? msg,
    $core.List<$core.int>? binMsg,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (event != null) {
      $result.event = event;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (binMsg != null) {
      $result.binMsg = binMsg;
    }
    return $result;
  }
  NatsMsgClientToServer._() : super();
  factory NatsMsgClientToServer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NatsMsgClientToServer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NatsMsgClientToServer', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..e<NatsMsgClientToServerEvents>(2, _omitFieldNames ? '' : 'event', $pb.PbFieldType.OE, defaultOrMaker: NatsMsgClientToServerEvents.REQ_INITIAL_DATA, valueOf: NatsMsgClientToServerEvents.valueOf, enumValues: NatsMsgClientToServerEvents.values)
    ..aOS(3, _omitFieldNames ? '' : 'msg')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'binMsg', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NatsMsgClientToServer clone() => NatsMsgClientToServer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NatsMsgClientToServer copyWith(void Function(NatsMsgClientToServer) updates) => super.copyWith((message) => updates(message as NatsMsgClientToServer)) as NatsMsgClientToServer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NatsMsgClientToServer create() => NatsMsgClientToServer._();
  NatsMsgClientToServer createEmptyInstance() => create();
  static $pb.PbList<NatsMsgClientToServer> createRepeated() => $pb.PbList<NatsMsgClientToServer>();
  @$core.pragma('dart2js:noInline')
  static NatsMsgClientToServer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NatsMsgClientToServer>(create);
  static NatsMsgClientToServer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  NatsMsgClientToServerEvents get event => $_getN(1);
  @$pb.TagNumber(2)
  set event(NatsMsgClientToServerEvents v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEvent() => $_has(1);
  @$pb.TagNumber(2)
  void clearEvent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get binMsg => $_getN(3);
  @$pb.TagNumber(4)
  set binMsg($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBinMsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearBinMsg() => clearField(4);
}

class NatsKvRoomInfo extends $pb.GeneratedMessage {
  factory NatsKvRoomInfo({
    $fixnum.Int64? dbTableId,
    $core.String? roomId,
    $core.String? roomSid,
    $core.String? status,
    $fixnum.Int64? emptyTimeout,
    $fixnum.Int64? maxParticipants,
    $core.String? metadata,
    $fixnum.Int64? createdAt,
  }) {
    final $result = create();
    if (dbTableId != null) {
      $result.dbTableId = dbTableId;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (roomSid != null) {
      $result.roomSid = roomSid;
    }
    if (status != null) {
      $result.status = status;
    }
    if (emptyTimeout != null) {
      $result.emptyTimeout = emptyTimeout;
    }
    if (maxParticipants != null) {
      $result.maxParticipants = maxParticipants;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  NatsKvRoomInfo._() : super();
  factory NatsKvRoomInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NatsKvRoomInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NatsKvRoomInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'dbTableId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'roomSid')
    ..aOS(4, _omitFieldNames ? '' : 'status')
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'emptyTimeout', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'maxParticipants', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(7, _omitFieldNames ? '' : 'metadata')
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'createdAt', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NatsKvRoomInfo clone() => NatsKvRoomInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NatsKvRoomInfo copyWith(void Function(NatsKvRoomInfo) updates) => super.copyWith((message) => updates(message as NatsKvRoomInfo)) as NatsKvRoomInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NatsKvRoomInfo create() => NatsKvRoomInfo._();
  NatsKvRoomInfo createEmptyInstance() => create();
  static $pb.PbList<NatsKvRoomInfo> createRepeated() => $pb.PbList<NatsKvRoomInfo>();
  @$core.pragma('dart2js:noInline')
  static NatsKvRoomInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NatsKvRoomInfo>(create);
  static NatsKvRoomInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get dbTableId => $_getI64(0);
  @$pb.TagNumber(1)
  set dbTableId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDbTableId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDbTableId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomSid => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomSid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomSid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomSid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get emptyTimeout => $_getI64(4);
  @$pb.TagNumber(5)
  set emptyTimeout($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmptyTimeout() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmptyTimeout() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get maxParticipants => $_getI64(5);
  @$pb.TagNumber(6)
  set maxParticipants($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMaxParticipants() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxParticipants() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get metadata => $_getSZ(6);
  @$pb.TagNumber(7)
  set metadata($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMetadata() => $_has(6);
  @$pb.TagNumber(7)
  void clearMetadata() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get createdAt => $_getI64(7);
  @$pb.TagNumber(8)
  set createdAt($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedAt() => clearField(8);
}

class NatsKvUserInfo extends $pb.GeneratedMessage {
  factory NatsKvUserInfo({
    $core.String? userId,
    $core.String? userSid,
    $core.String? name,
    $core.String? roomId,
    $core.bool? isAdmin,
    $core.bool? isPresenter,
    $core.String? metadata,
    $fixnum.Int64? joinedAt,
    $fixnum.Int64? reconnectedAt,
    $fixnum.Int64? disconnectedAt,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (userSid != null) {
      $result.userSid = userSid;
    }
    if (name != null) {
      $result.name = name;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (isAdmin != null) {
      $result.isAdmin = isAdmin;
    }
    if (isPresenter != null) {
      $result.isPresenter = isPresenter;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (joinedAt != null) {
      $result.joinedAt = joinedAt;
    }
    if (reconnectedAt != null) {
      $result.reconnectedAt = reconnectedAt;
    }
    if (disconnectedAt != null) {
      $result.disconnectedAt = disconnectedAt;
    }
    return $result;
  }
  NatsKvUserInfo._() : super();
  factory NatsKvUserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NatsKvUserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NatsKvUserInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'userSid')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'roomId')
    ..aOB(5, _omitFieldNames ? '' : 'isAdmin')
    ..aOB(6, _omitFieldNames ? '' : 'isPresenter')
    ..aOS(7, _omitFieldNames ? '' : 'metadata')
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'joinedAt', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'reconnectedAt', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(10, _omitFieldNames ? '' : 'disconnectedAt', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NatsKvUserInfo clone() => NatsKvUserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NatsKvUserInfo copyWith(void Function(NatsKvUserInfo) updates) => super.copyWith((message) => updates(message as NatsKvUserInfo)) as NatsKvUserInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NatsKvUserInfo create() => NatsKvUserInfo._();
  NatsKvUserInfo createEmptyInstance() => create();
  static $pb.PbList<NatsKvUserInfo> createRepeated() => $pb.PbList<NatsKvUserInfo>();
  @$core.pragma('dart2js:noInline')
  static NatsKvUserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NatsKvUserInfo>(create);
  static NatsKvUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userSid => $_getSZ(1);
  @$pb.TagNumber(2)
  set userSid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserSid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserSid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomId => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isAdmin => $_getBF(4);
  @$pb.TagNumber(5)
  set isAdmin($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsAdmin() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsAdmin() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isPresenter => $_getBF(5);
  @$pb.TagNumber(6)
  set isPresenter($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsPresenter() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsPresenter() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get metadata => $_getSZ(6);
  @$pb.TagNumber(7)
  set metadata($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMetadata() => $_has(6);
  @$pb.TagNumber(7)
  void clearMetadata() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get joinedAt => $_getI64(7);
  @$pb.TagNumber(8)
  set joinedAt($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasJoinedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearJoinedAt() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get reconnectedAt => $_getI64(8);
  @$pb.TagNumber(9)
  set reconnectedAt($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasReconnectedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearReconnectedAt() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get disconnectedAt => $_getI64(9);
  @$pb.TagNumber(10)
  set disconnectedAt($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDisconnectedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearDisconnectedAt() => clearField(10);
}

class MediaServerConnInfo extends $pb.GeneratedMessage {
  factory MediaServerConnInfo({
    $core.String? url,
    $core.String? token,
    $core.bool? enabledE2ee,
  }) {
    final $result = create();
    if (url != null) {
      $result.url = url;
    }
    if (token != null) {
      $result.token = token;
    }
    if (enabledE2ee != null) {
      $result.enabledE2ee = enabledE2ee;
    }
    return $result;
  }
  MediaServerConnInfo._() : super();
  factory MediaServerConnInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MediaServerConnInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MediaServerConnInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..aOB(3, _omitFieldNames ? '' : 'enabledE2ee')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MediaServerConnInfo clone() => MediaServerConnInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MediaServerConnInfo copyWith(void Function(MediaServerConnInfo) updates) => super.copyWith((message) => updates(message as MediaServerConnInfo)) as MediaServerConnInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaServerConnInfo create() => MediaServerConnInfo._();
  MediaServerConnInfo createEmptyInstance() => create();
  static $pb.PbList<MediaServerConnInfo> createRepeated() => $pb.PbList<MediaServerConnInfo>();
  @$core.pragma('dart2js:noInline')
  static MediaServerConnInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MediaServerConnInfo>(create);
  static MediaServerConnInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get enabledE2ee => $_getBF(2);
  @$pb.TagNumber(3)
  set enabledE2ee($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEnabledE2ee() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnabledE2ee() => clearField(3);
}

class NatsInitialData extends $pb.GeneratedMessage {
  factory NatsInitialData({
    NatsKvRoomInfo? room,
    NatsKvUserInfo? localUser,
    MediaServerConnInfo? mediaServerInfo,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (localUser != null) {
      $result.localUser = localUser;
    }
    if (mediaServerInfo != null) {
      $result.mediaServerInfo = mediaServerInfo;
    }
    return $result;
  }
  NatsInitialData._() : super();
  factory NatsInitialData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NatsInitialData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NatsInitialData', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOM<NatsKvRoomInfo>(1, _omitFieldNames ? '' : 'room', subBuilder: NatsKvRoomInfo.create)
    ..aOM<NatsKvUserInfo>(2, _omitFieldNames ? '' : 'localUser', subBuilder: NatsKvUserInfo.create)
    ..aOM<MediaServerConnInfo>(3, _omitFieldNames ? '' : 'mediaServerInfo', subBuilder: MediaServerConnInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NatsInitialData clone() => NatsInitialData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NatsInitialData copyWith(void Function(NatsInitialData) updates) => super.copyWith((message) => updates(message as NatsInitialData)) as NatsInitialData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NatsInitialData create() => NatsInitialData._();
  NatsInitialData createEmptyInstance() => create();
  static $pb.PbList<NatsInitialData> createRepeated() => $pb.PbList<NatsInitialData>();
  @$core.pragma('dart2js:noInline')
  static NatsInitialData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NatsInitialData>(create);
  static NatsInitialData? _defaultInstance;

  @$pb.TagNumber(1)
  NatsKvRoomInfo get room => $_getN(0);
  @$pb.TagNumber(1)
  set room(NatsKvRoomInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
  @$pb.TagNumber(1)
  NatsKvRoomInfo ensureRoom() => $_ensure(0);

  @$pb.TagNumber(2)
  NatsKvUserInfo get localUser => $_getN(1);
  @$pb.TagNumber(2)
  set localUser(NatsKvUserInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocalUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocalUser() => clearField(2);
  @$pb.TagNumber(2)
  NatsKvUserInfo ensureLocalUser() => $_ensure(1);

  @$pb.TagNumber(3)
  MediaServerConnInfo get mediaServerInfo => $_getN(2);
  @$pb.TagNumber(3)
  set mediaServerInfo(MediaServerConnInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMediaServerInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearMediaServerInfo() => clearField(3);
  @$pb.TagNumber(3)
  MediaServerConnInfo ensureMediaServerInfo() => $_ensure(2);
}

class NatsSystemNotification extends $pb.GeneratedMessage {
  factory NatsSystemNotification({
    $core.String? id,
    NatsSystemNotificationTypes? type,
    $core.String? msg,
    $fixnum.Int64? sentAt,
    $core.bool? withSound,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (type != null) {
      $result.type = type;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (sentAt != null) {
      $result.sentAt = sentAt;
    }
    if (withSound != null) {
      $result.withSound = withSound;
    }
    return $result;
  }
  NatsSystemNotification._() : super();
  factory NatsSystemNotification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NatsSystemNotification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NatsSystemNotification', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..e<NatsSystemNotificationTypes>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: NatsSystemNotificationTypes.NATS_SYSTEM_NOTIFICATION_INFO, valueOf: NatsSystemNotificationTypes.valueOf, enumValues: NatsSystemNotificationTypes.values)
    ..aOS(3, _omitFieldNames ? '' : 'msg')
    ..aInt64(4, _omitFieldNames ? '' : 'sentAt')
    ..aOB(5, _omitFieldNames ? '' : 'withSound')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NatsSystemNotification clone() => NatsSystemNotification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NatsSystemNotification copyWith(void Function(NatsSystemNotification) updates) => super.copyWith((message) => updates(message as NatsSystemNotification)) as NatsSystemNotification;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NatsSystemNotification create() => NatsSystemNotification._();
  NatsSystemNotification createEmptyInstance() => create();
  static $pb.PbList<NatsSystemNotification> createRepeated() => $pb.PbList<NatsSystemNotification>();
  @$core.pragma('dart2js:noInline')
  static NatsSystemNotification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NatsSystemNotification>(create);
  static NatsSystemNotification? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  NatsSystemNotificationTypes get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(NatsSystemNotificationTypes v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get sentAt => $_getI64(3);
  @$pb.TagNumber(4)
  set sentAt($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSentAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearSentAt() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get withSound => $_getBF(4);
  @$pb.TagNumber(5)
  set withSound($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWithSound() => $_has(4);
  @$pb.TagNumber(5)
  void clearWithSound() => clearField(5);
}

class NatsUserMetadataUpdate extends $pb.GeneratedMessage {
  factory NatsUserMetadataUpdate({
    $core.String? userId,
    $core.String? metadata,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  NatsUserMetadataUpdate._() : super();
  factory NatsUserMetadataUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NatsUserMetadataUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NatsUserMetadataUpdate', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'metadata')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NatsUserMetadataUpdate clone() => NatsUserMetadataUpdate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NatsUserMetadataUpdate copyWith(void Function(NatsUserMetadataUpdate) updates) => super.copyWith((message) => updates(message as NatsUserMetadataUpdate)) as NatsUserMetadataUpdate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NatsUserMetadataUpdate create() => NatsUserMetadataUpdate._();
  NatsUserMetadataUpdate createEmptyInstance() => create();
  static $pb.PbList<NatsUserMetadataUpdate> createRepeated() => $pb.PbList<NatsUserMetadataUpdate>();
  @$core.pragma('dart2js:noInline')
  static NatsUserMetadataUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NatsUserMetadataUpdate>(create);
  static NatsUserMetadataUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get metadata => $_getSZ(1);
  @$pb.TagNumber(2)
  set metadata($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMetadata() => $_has(1);
  @$pb.TagNumber(2)
  void clearMetadata() => clearField(2);
}

class ChatMessage extends $pb.GeneratedMessage {
  factory ChatMessage({
    $core.String? id,
    $core.String? fromName,
    $core.String? fromUserId,
    $fixnum.Int64? sentAt,
    $core.String? toUserId,
    $core.bool? isPrivate,
    $core.String? message,
    $core.bool? fromAdmin,
    $core.String? sourceLang,
    $core.Map<$core.String, $core.String>? translations,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (fromName != null) {
      $result.fromName = fromName;
    }
    if (fromUserId != null) {
      $result.fromUserId = fromUserId;
    }
    if (sentAt != null) {
      $result.sentAt = sentAt;
    }
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    if (isPrivate != null) {
      $result.isPrivate = isPrivate;
    }
    if (message != null) {
      $result.message = message;
    }
    if (fromAdmin != null) {
      $result.fromAdmin = fromAdmin;
    }
    if (sourceLang != null) {
      $result.sourceLang = sourceLang;
    }
    if (translations != null) {
      $result.translations.addAll(translations);
    }
    return $result;
  }
  ChatMessage._() : super();
  factory ChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'fromName')
    ..aOS(3, _omitFieldNames ? '' : 'fromUserId')
    ..aInt64(4, _omitFieldNames ? '' : 'sentAt')
    ..aOS(5, _omitFieldNames ? '' : 'toUserId')
    ..aOB(6, _omitFieldNames ? '' : 'isPrivate')
    ..aOS(7, _omitFieldNames ? '' : 'message')
    ..aOB(8, _omitFieldNames ? '' : 'fromAdmin')
    ..aOS(9, _omitFieldNames ? '' : 'sourceLang')
    ..m<$core.String, $core.String>(10, _omitFieldNames ? '' : 'translations', entryClassName: 'ChatMessage.TranslationsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('wajlc'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatMessage clone() => ChatMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatMessage copyWith(void Function(ChatMessage) updates) => super.copyWith((message) => updates(message as ChatMessage)) as ChatMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatMessage create() => ChatMessage._();
  ChatMessage createEmptyInstance() => create();
  static $pb.PbList<ChatMessage> createRepeated() => $pb.PbList<ChatMessage>();
  @$core.pragma('dart2js:noInline')
  static ChatMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatMessage>(create);
  static ChatMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fromName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fromName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFromName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fromUserId => $_getSZ(2);
  @$pb.TagNumber(3)
  set fromUserId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFromUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFromUserId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get sentAt => $_getI64(3);
  @$pb.TagNumber(4)
  set sentAt($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSentAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearSentAt() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get toUserId => $_getSZ(4);
  @$pb.TagNumber(5)
  set toUserId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasToUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearToUserId() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isPrivate => $_getBF(5);
  @$pb.TagNumber(6)
  set isPrivate($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsPrivate() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsPrivate() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get message => $_getSZ(6);
  @$pb.TagNumber(7)
  set message($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMessage() => $_has(6);
  @$pb.TagNumber(7)
  void clearMessage() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get fromAdmin => $_getBF(7);
  @$pb.TagNumber(8)
  set fromAdmin($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFromAdmin() => $_has(7);
  @$pb.TagNumber(8)
  void clearFromAdmin() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get sourceLang => $_getSZ(8);
  @$pb.TagNumber(9)
  set sourceLang($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSourceLang() => $_has(8);
  @$pb.TagNumber(9)
  void clearSourceLang() => clearField(9);

  @$pb.TagNumber(10)
  $core.Map<$core.String, $core.String> get translations => $_getMap(9);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
