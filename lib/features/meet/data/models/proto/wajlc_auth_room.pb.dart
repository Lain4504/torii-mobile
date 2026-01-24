//
//  Generated code. Do not modify.
//  source: wajlc_auth_room.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_models.pb.dart' as $2;

class GetActiveRoomInfoReq extends $pb.GeneratedMessage {
  factory GetActiveRoomInfoReq({
    $core.String? roomId,
  }) {
    final $result = create();
    if (roomId != null) {
      $result.roomId = roomId;
    }
    return $result;
  }
  GetActiveRoomInfoReq._() : super();
  factory GetActiveRoomInfoReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetActiveRoomInfoReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetActiveRoomInfoReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetActiveRoomInfoReq clone() => GetActiveRoomInfoReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetActiveRoomInfoReq copyWith(void Function(GetActiveRoomInfoReq) updates) => super.copyWith((message) => updates(message as GetActiveRoomInfoReq)) as GetActiveRoomInfoReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetActiveRoomInfoReq create() => GetActiveRoomInfoReq._();
  GetActiveRoomInfoReq createEmptyInstance() => create();
  static $pb.PbList<GetActiveRoomInfoReq> createRepeated() => $pb.PbList<GetActiveRoomInfoReq>();
  @$core.pragma('dart2js:noInline')
  static GetActiveRoomInfoReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetActiveRoomInfoReq>(create);
  static GetActiveRoomInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);
}

class ActiveRoomInfoRes extends $pb.GeneratedMessage {
  factory ActiveRoomInfoRes({
    $core.bool? status,
    $core.String? msg,
    ActiveRoomInfo? roomInfo,
    $core.Iterable<$2.ParticipantInfo>? participantsInfo,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (roomInfo != null) {
      $result.roomInfo = roomInfo;
    }
    if (participantsInfo != null) {
      $result.participantsInfo.addAll(participantsInfo);
    }
    return $result;
  }
  ActiveRoomInfoRes._() : super();
  factory ActiveRoomInfoRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActiveRoomInfoRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActiveRoomInfoRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<ActiveRoomInfo>(3, _omitFieldNames ? '' : 'roomInfo', subBuilder: ActiveRoomInfo.create)
    ..pc<$2.ParticipantInfo>(4, _omitFieldNames ? '' : 'participantsInfo', $pb.PbFieldType.PM, subBuilder: $2.ParticipantInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActiveRoomInfoRes clone() => ActiveRoomInfoRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActiveRoomInfoRes copyWith(void Function(ActiveRoomInfoRes) updates) => super.copyWith((message) => updates(message as ActiveRoomInfoRes)) as ActiveRoomInfoRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActiveRoomInfoRes create() => ActiveRoomInfoRes._();
  ActiveRoomInfoRes createEmptyInstance() => create();
  static $pb.PbList<ActiveRoomInfoRes> createRepeated() => $pb.PbList<ActiveRoomInfoRes>();
  @$core.pragma('dart2js:noInline')
  static ActiveRoomInfoRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActiveRoomInfoRes>(create);
  static ActiveRoomInfoRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  ActiveRoomInfo get roomInfo => $_getN(2);
  @$pb.TagNumber(3)
  set roomInfo(ActiveRoomInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomInfo() => clearField(3);
  @$pb.TagNumber(3)
  ActiveRoomInfo ensureRoomInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$2.ParticipantInfo> get participantsInfo => $_getList(3);
}

class ActiveRoomInfo extends $pb.GeneratedMessage {
  factory ActiveRoomInfo({
    $core.String? roomTitle,
    $core.String? roomId,
    $core.String? sid,
    $fixnum.Int64? joinedParticipants,
    $core.int? isRunning,
    $core.int? isRecording,
    $core.int? isActiveRtmp,
    $core.String? webhookUrl,
    $core.int? isBreakoutRoom,
    $core.String? parentRoomId,
    $fixnum.Int64? creationTime,
    $core.String? metadata,
  }) {
    final $result = create();
    if (roomTitle != null) {
      $result.roomTitle = roomTitle;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (sid != null) {
      $result.sid = sid;
    }
    if (joinedParticipants != null) {
      $result.joinedParticipants = joinedParticipants;
    }
    if (isRunning != null) {
      $result.isRunning = isRunning;
    }
    if (isRecording != null) {
      $result.isRecording = isRecording;
    }
    if (isActiveRtmp != null) {
      $result.isActiveRtmp = isActiveRtmp;
    }
    if (webhookUrl != null) {
      $result.webhookUrl = webhookUrl;
    }
    if (isBreakoutRoom != null) {
      $result.isBreakoutRoom = isBreakoutRoom;
    }
    if (parentRoomId != null) {
      $result.parentRoomId = parentRoomId;
    }
    if (creationTime != null) {
      $result.creationTime = creationTime;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  ActiveRoomInfo._() : super();
  factory ActiveRoomInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActiveRoomInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActiveRoomInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomTitle')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'sid')
    ..aInt64(4, _omitFieldNames ? '' : 'joinedParticipants')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'isRunning', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'isRecording', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'isActiveRtmp', $pb.PbFieldType.O3)
    ..aOS(8, _omitFieldNames ? '' : 'webhookUrl')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'isBreakoutRoom', $pb.PbFieldType.O3)
    ..aOS(10, _omitFieldNames ? '' : 'parentRoomId')
    ..aInt64(11, _omitFieldNames ? '' : 'creationTime')
    ..aOS(12, _omitFieldNames ? '' : 'metadata')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActiveRoomInfo clone() => ActiveRoomInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActiveRoomInfo copyWith(void Function(ActiveRoomInfo) updates) => super.copyWith((message) => updates(message as ActiveRoomInfo)) as ActiveRoomInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActiveRoomInfo create() => ActiveRoomInfo._();
  ActiveRoomInfo createEmptyInstance() => create();
  static $pb.PbList<ActiveRoomInfo> createRepeated() => $pb.PbList<ActiveRoomInfo>();
  @$core.pragma('dart2js:noInline')
  static ActiveRoomInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActiveRoomInfo>(create);
  static ActiveRoomInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomTitle => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomTitle($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sid => $_getSZ(2);
  @$pb.TagNumber(3)
  set sid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSid() => $_has(2);
  @$pb.TagNumber(3)
  void clearSid() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get joinedParticipants => $_getI64(3);
  @$pb.TagNumber(4)
  set joinedParticipants($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasJoinedParticipants() => $_has(3);
  @$pb.TagNumber(4)
  void clearJoinedParticipants() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get isRunning => $_getIZ(4);
  @$pb.TagNumber(5)
  set isRunning($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRunning() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsRunning() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get isRecording => $_getIZ(5);
  @$pb.TagNumber(6)
  set isRecording($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsRecording() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsRecording() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get isActiveRtmp => $_getIZ(6);
  @$pb.TagNumber(7)
  set isActiveRtmp($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsActiveRtmp() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsActiveRtmp() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get webhookUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set webhookUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasWebhookUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearWebhookUrl() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get isBreakoutRoom => $_getIZ(8);
  @$pb.TagNumber(9)
  set isBreakoutRoom($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsBreakoutRoom() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsBreakoutRoom() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get parentRoomId => $_getSZ(9);
  @$pb.TagNumber(10)
  set parentRoomId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasParentRoomId() => $_has(9);
  @$pb.TagNumber(10)
  void clearParentRoomId() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get creationTime => $_getI64(10);
  @$pb.TagNumber(11)
  set creationTime($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreationTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreationTime() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get metadata => $_getSZ(11);
  @$pb.TagNumber(12)
  set metadata($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasMetadata() => $_has(11);
  @$pb.TagNumber(12)
  void clearMetadata() => clearField(12);
}

class RoomEndReq extends $pb.GeneratedMessage {
  factory RoomEndReq({
    $core.String? roomId,
  }) {
    final $result = create();
    if (roomId != null) {
      $result.roomId = roomId;
    }
    return $result;
  }
  RoomEndReq._() : super();
  factory RoomEndReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomEndReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomEndReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomEndReq clone() => RoomEndReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomEndReq copyWith(void Function(RoomEndReq) updates) => super.copyWith((message) => updates(message as RoomEndReq)) as RoomEndReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomEndReq create() => RoomEndReq._();
  RoomEndReq createEmptyInstance() => create();
  static $pb.PbList<RoomEndReq> createRepeated() => $pb.PbList<RoomEndReq>();
  @$core.pragma('dart2js:noInline')
  static RoomEndReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomEndReq>(create);
  static RoomEndReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);
}

class RoomEndRes extends $pb.GeneratedMessage {
  factory RoomEndRes({
    $core.bool? status,
    $core.String? msg,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    return $result;
  }
  RoomEndRes._() : super();
  factory RoomEndRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomEndRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomEndRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomEndRes clone() => RoomEndRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomEndRes copyWith(void Function(RoomEndRes) updates) => super.copyWith((message) => updates(message as RoomEndRes)) as RoomEndRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomEndRes create() => RoomEndRes._();
  RoomEndRes createEmptyInstance() => create();
  static $pb.PbList<RoomEndRes> createRepeated() => $pb.PbList<RoomEndRes>();
  @$core.pragma('dart2js:noInline')
  static RoomEndRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomEndRes>(create);
  static RoomEndRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);
}

class IsRoomActiveReq extends $pb.GeneratedMessage {
  factory IsRoomActiveReq({
    $core.String? roomId,
  }) {
    final $result = create();
    if (roomId != null) {
      $result.roomId = roomId;
    }
    return $result;
  }
  IsRoomActiveReq._() : super();
  factory IsRoomActiveReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IsRoomActiveReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IsRoomActiveReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IsRoomActiveReq clone() => IsRoomActiveReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IsRoomActiveReq copyWith(void Function(IsRoomActiveReq) updates) => super.copyWith((message) => updates(message as IsRoomActiveReq)) as IsRoomActiveReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IsRoomActiveReq create() => IsRoomActiveReq._();
  IsRoomActiveReq createEmptyInstance() => create();
  static $pb.PbList<IsRoomActiveReq> createRepeated() => $pb.PbList<IsRoomActiveReq>();
  @$core.pragma('dart2js:noInline')
  static IsRoomActiveReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IsRoomActiveReq>(create);
  static IsRoomActiveReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);
}

class IsRoomActiveRes extends $pb.GeneratedMessage {
  factory IsRoomActiveRes({
    $core.bool? status,
    $core.bool? isActive,
    $core.String? msg,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (isActive != null) {
      $result.isActive = isActive;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    return $result;
  }
  IsRoomActiveRes._() : super();
  factory IsRoomActiveRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IsRoomActiveRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IsRoomActiveRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..aOS(3, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IsRoomActiveRes clone() => IsRoomActiveRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IsRoomActiveRes copyWith(void Function(IsRoomActiveRes) updates) => super.copyWith((message) => updates(message as IsRoomActiveRes)) as IsRoomActiveRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IsRoomActiveRes create() => IsRoomActiveRes._();
  IsRoomActiveRes createEmptyInstance() => create();
  static $pb.PbList<IsRoomActiveRes> createRepeated() => $pb.PbList<IsRoomActiveRes>();
  @$core.pragma('dart2js:noInline')
  static IsRoomActiveRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IsRoomActiveRes>(create);
  static IsRoomActiveRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);
}

class ActiveRoomWithParticipant extends $pb.GeneratedMessage {
  factory ActiveRoomWithParticipant({
    ActiveRoomInfo? roomInfo,
    $core.Iterable<$2.ParticipantInfo>? participantsInfo,
  }) {
    final $result = create();
    if (roomInfo != null) {
      $result.roomInfo = roomInfo;
    }
    if (participantsInfo != null) {
      $result.participantsInfo.addAll(participantsInfo);
    }
    return $result;
  }
  ActiveRoomWithParticipant._() : super();
  factory ActiveRoomWithParticipant.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActiveRoomWithParticipant.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActiveRoomWithParticipant', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOM<ActiveRoomInfo>(3, _omitFieldNames ? '' : 'roomInfo', subBuilder: ActiveRoomInfo.create)
    ..pc<$2.ParticipantInfo>(4, _omitFieldNames ? '' : 'participantsInfo', $pb.PbFieldType.PM, subBuilder: $2.ParticipantInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActiveRoomWithParticipant clone() => ActiveRoomWithParticipant()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActiveRoomWithParticipant copyWith(void Function(ActiveRoomWithParticipant) updates) => super.copyWith((message) => updates(message as ActiveRoomWithParticipant)) as ActiveRoomWithParticipant;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActiveRoomWithParticipant create() => ActiveRoomWithParticipant._();
  ActiveRoomWithParticipant createEmptyInstance() => create();
  static $pb.PbList<ActiveRoomWithParticipant> createRepeated() => $pb.PbList<ActiveRoomWithParticipant>();
  @$core.pragma('dart2js:noInline')
  static ActiveRoomWithParticipant getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActiveRoomWithParticipant>(create);
  static ActiveRoomWithParticipant? _defaultInstance;

  @$pb.TagNumber(3)
  ActiveRoomInfo get roomInfo => $_getN(0);
  @$pb.TagNumber(3)
  set roomInfo(ActiveRoomInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomInfo() => $_has(0);
  @$pb.TagNumber(3)
  void clearRoomInfo() => clearField(3);
  @$pb.TagNumber(3)
  ActiveRoomInfo ensureRoomInfo() => $_ensure(0);

  @$pb.TagNumber(4)
  $core.List<$2.ParticipantInfo> get participantsInfo => $_getList(1);
}

class GetActiveRoomInfoRes extends $pb.GeneratedMessage {
  factory GetActiveRoomInfoRes({
    $core.bool? status,
    $core.String? msg,
    ActiveRoomWithParticipant? room,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (room != null) {
      $result.room = room;
    }
    return $result;
  }
  GetActiveRoomInfoRes._() : super();
  factory GetActiveRoomInfoRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetActiveRoomInfoRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetActiveRoomInfoRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<ActiveRoomWithParticipant>(3, _omitFieldNames ? '' : 'room', subBuilder: ActiveRoomWithParticipant.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetActiveRoomInfoRes clone() => GetActiveRoomInfoRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetActiveRoomInfoRes copyWith(void Function(GetActiveRoomInfoRes) updates) => super.copyWith((message) => updates(message as GetActiveRoomInfoRes)) as GetActiveRoomInfoRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetActiveRoomInfoRes create() => GetActiveRoomInfoRes._();
  GetActiveRoomInfoRes createEmptyInstance() => create();
  static $pb.PbList<GetActiveRoomInfoRes> createRepeated() => $pb.PbList<GetActiveRoomInfoRes>();
  @$core.pragma('dart2js:noInline')
  static GetActiveRoomInfoRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetActiveRoomInfoRes>(create);
  static GetActiveRoomInfoRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  ActiveRoomWithParticipant get room => $_getN(2);
  @$pb.TagNumber(3)
  set room(ActiveRoomWithParticipant v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoom() => clearField(3);
  @$pb.TagNumber(3)
  ActiveRoomWithParticipant ensureRoom() => $_ensure(2);
}

class GetActiveRoomsInfoRes extends $pb.GeneratedMessage {
  factory GetActiveRoomsInfoRes({
    $core.bool? status,
    $core.String? msg,
    $core.Iterable<ActiveRoomWithParticipant>? rooms,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (rooms != null) {
      $result.rooms.addAll(rooms);
    }
    return $result;
  }
  GetActiveRoomsInfoRes._() : super();
  factory GetActiveRoomsInfoRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetActiveRoomsInfoRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetActiveRoomsInfoRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..pc<ActiveRoomWithParticipant>(3, _omitFieldNames ? '' : 'rooms', $pb.PbFieldType.PM, subBuilder: ActiveRoomWithParticipant.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetActiveRoomsInfoRes clone() => GetActiveRoomsInfoRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetActiveRoomsInfoRes copyWith(void Function(GetActiveRoomsInfoRes) updates) => super.copyWith((message) => updates(message as GetActiveRoomsInfoRes)) as GetActiveRoomsInfoRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetActiveRoomsInfoRes create() => GetActiveRoomsInfoRes._();
  GetActiveRoomsInfoRes createEmptyInstance() => create();
  static $pb.PbList<GetActiveRoomsInfoRes> createRepeated() => $pb.PbList<GetActiveRoomsInfoRes>();
  @$core.pragma('dart2js:noInline')
  static GetActiveRoomsInfoRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetActiveRoomsInfoRes>(create);
  static GetActiveRoomsInfoRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ActiveRoomWithParticipant> get rooms => $_getList(2);
}

class PastRoomInfo extends $pb.GeneratedMessage {
  factory PastRoomInfo({
    $core.String? roomTitle,
    $core.String? roomId,
    $core.String? roomSid,
    $fixnum.Int64? joinedParticipants,
    $core.String? webhookUrl,
    $core.String? created,
    $core.String? ended,
    $core.String? analyticsFileId,
  }) {
    final $result = create();
    if (roomTitle != null) {
      $result.roomTitle = roomTitle;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (roomSid != null) {
      $result.roomSid = roomSid;
    }
    if (joinedParticipants != null) {
      $result.joinedParticipants = joinedParticipants;
    }
    if (webhookUrl != null) {
      $result.webhookUrl = webhookUrl;
    }
    if (created != null) {
      $result.created = created;
    }
    if (ended != null) {
      $result.ended = ended;
    }
    if (analyticsFileId != null) {
      $result.analyticsFileId = analyticsFileId;
    }
    return $result;
  }
  PastRoomInfo._() : super();
  factory PastRoomInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PastRoomInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PastRoomInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomTitle')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'roomSid')
    ..aInt64(4, _omitFieldNames ? '' : 'joinedParticipants')
    ..aOS(5, _omitFieldNames ? '' : 'webhookUrl')
    ..aOS(6, _omitFieldNames ? '' : 'created')
    ..aOS(7, _omitFieldNames ? '' : 'ended')
    ..aOS(8, _omitFieldNames ? '' : 'analyticsFileId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PastRoomInfo clone() => PastRoomInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PastRoomInfo copyWith(void Function(PastRoomInfo) updates) => super.copyWith((message) => updates(message as PastRoomInfo)) as PastRoomInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PastRoomInfo create() => PastRoomInfo._();
  PastRoomInfo createEmptyInstance() => create();
  static $pb.PbList<PastRoomInfo> createRepeated() => $pb.PbList<PastRoomInfo>();
  @$core.pragma('dart2js:noInline')
  static PastRoomInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PastRoomInfo>(create);
  static PastRoomInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomTitle => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomTitle($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomTitle() => clearField(1);

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
  $fixnum.Int64 get joinedParticipants => $_getI64(3);
  @$pb.TagNumber(4)
  set joinedParticipants($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasJoinedParticipants() => $_has(3);
  @$pb.TagNumber(4)
  void clearJoinedParticipants() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get webhookUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set webhookUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWebhookUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearWebhookUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get created => $_getSZ(5);
  @$pb.TagNumber(6)
  set created($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreated() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreated() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get ended => $_getSZ(6);
  @$pb.TagNumber(7)
  set ended($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasEnded() => $_has(6);
  @$pb.TagNumber(7)
  void clearEnded() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get analyticsFileId => $_getSZ(7);
  @$pb.TagNumber(8)
  set analyticsFileId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAnalyticsFileId() => $_has(7);
  @$pb.TagNumber(8)
  void clearAnalyticsFileId() => clearField(8);
}

class FetchPastRoomsReq extends $pb.GeneratedMessage {
  factory FetchPastRoomsReq({
    $core.Iterable<$core.String>? roomIds,
    $core.int? from,
    $core.int? limit,
    $core.String? orderBy,
  }) {
    final $result = create();
    if (roomIds != null) {
      $result.roomIds.addAll(roomIds);
    }
    if (from != null) {
      $result.from = from;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (orderBy != null) {
      $result.orderBy = orderBy;
    }
    return $result;
  }
  FetchPastRoomsReq._() : super();
  factory FetchPastRoomsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPastRoomsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchPastRoomsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'roomIds')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'orderBy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPastRoomsReq clone() => FetchPastRoomsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPastRoomsReq copyWith(void Function(FetchPastRoomsReq) updates) => super.copyWith((message) => updates(message as FetchPastRoomsReq)) as FetchPastRoomsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchPastRoomsReq create() => FetchPastRoomsReq._();
  FetchPastRoomsReq createEmptyInstance() => create();
  static $pb.PbList<FetchPastRoomsReq> createRepeated() => $pb.PbList<FetchPastRoomsReq>();
  @$core.pragma('dart2js:noInline')
  static FetchPastRoomsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPastRoomsReq>(create);
  static FetchPastRoomsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get roomIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get from => $_getIZ(1);
  @$pb.TagNumber(2)
  set from($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get limit => $_getIZ(2);
  @$pb.TagNumber(3)
  set limit($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get orderBy => $_getSZ(3);
  @$pb.TagNumber(4)
  set orderBy($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOrderBy() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrderBy() => clearField(4);
}

class FetchPastRoomsResult extends $pb.GeneratedMessage {
  factory FetchPastRoomsResult({
    $fixnum.Int64? totalRooms,
    $core.int? from,
    $core.int? limit,
    $core.String? orderBy,
    $core.Iterable<PastRoomInfo>? roomsList,
  }) {
    final $result = create();
    if (totalRooms != null) {
      $result.totalRooms = totalRooms;
    }
    if (from != null) {
      $result.from = from;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (orderBy != null) {
      $result.orderBy = orderBy;
    }
    if (roomsList != null) {
      $result.roomsList.addAll(roomsList);
    }
    return $result;
  }
  FetchPastRoomsResult._() : super();
  factory FetchPastRoomsResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPastRoomsResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchPastRoomsResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalRooms')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'orderBy')
    ..pc<PastRoomInfo>(5, _omitFieldNames ? '' : 'roomsList', $pb.PbFieldType.PM, subBuilder: PastRoomInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPastRoomsResult clone() => FetchPastRoomsResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPastRoomsResult copyWith(void Function(FetchPastRoomsResult) updates) => super.copyWith((message) => updates(message as FetchPastRoomsResult)) as FetchPastRoomsResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchPastRoomsResult create() => FetchPastRoomsResult._();
  FetchPastRoomsResult createEmptyInstance() => create();
  static $pb.PbList<FetchPastRoomsResult> createRepeated() => $pb.PbList<FetchPastRoomsResult>();
  @$core.pragma('dart2js:noInline')
  static FetchPastRoomsResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPastRoomsResult>(create);
  static FetchPastRoomsResult? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalRooms => $_getI64(0);
  @$pb.TagNumber(1)
  set totalRooms($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotalRooms() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalRooms() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get from => $_getIZ(1);
  @$pb.TagNumber(2)
  set from($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get limit => $_getIZ(2);
  @$pb.TagNumber(3)
  set limit($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get orderBy => $_getSZ(3);
  @$pb.TagNumber(4)
  set orderBy($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOrderBy() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrderBy() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<PastRoomInfo> get roomsList => $_getList(4);
}

class FetchPastRoomsRes extends $pb.GeneratedMessage {
  factory FetchPastRoomsRes({
    $core.bool? status,
    $core.String? msg,
    FetchPastRoomsResult? result,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (result != null) {
      $result.result = result;
    }
    return $result;
  }
  FetchPastRoomsRes._() : super();
  factory FetchPastRoomsRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPastRoomsRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchPastRoomsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<FetchPastRoomsResult>(3, _omitFieldNames ? '' : 'result', subBuilder: FetchPastRoomsResult.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPastRoomsRes clone() => FetchPastRoomsRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPastRoomsRes copyWith(void Function(FetchPastRoomsRes) updates) => super.copyWith((message) => updates(message as FetchPastRoomsRes)) as FetchPastRoomsRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchPastRoomsRes create() => FetchPastRoomsRes._();
  FetchPastRoomsRes createEmptyInstance() => create();
  static $pb.PbList<FetchPastRoomsRes> createRepeated() => $pb.PbList<FetchPastRoomsRes>();
  @$core.pragma('dart2js:noInline')
  static FetchPastRoomsRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPastRoomsRes>(create);
  static FetchPastRoomsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  FetchPastRoomsResult get result => $_getN(2);
  @$pb.TagNumber(3)
  set result(FetchPastRoomsResult v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearResult() => clearField(3);
  @$pb.TagNumber(3)
  FetchPastRoomsResult ensureResult() => $_ensure(2);
}

class GetClientFilesRes extends $pb.GeneratedMessage {
  factory GetClientFilesRes({
    $core.bool? status,
    $core.String? msg,
  @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.String>? css,
  @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.String>? js,
    $core.Iterable<$core.String>? cssFiles,
    $core.Iterable<$core.String>? jsFiles,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (css != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.css.addAll(css);
    }
    if (js != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.js.addAll(js);
    }
    if (cssFiles != null) {
      $result.cssFiles.addAll(cssFiles);
    }
    if (jsFiles != null) {
      $result.jsFiles.addAll(jsFiles);
    }
    return $result;
  }
  GetClientFilesRes._() : super();
  factory GetClientFilesRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetClientFilesRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetClientFilesRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..pPS(3, _omitFieldNames ? '' : 'css')
    ..pPS(4, _omitFieldNames ? '' : 'js')
    ..pPS(5, _omitFieldNames ? '' : 'cssFiles')
    ..pPS(6, _omitFieldNames ? '' : 'jsFiles')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetClientFilesRes clone() => GetClientFilesRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetClientFilesRes copyWith(void Function(GetClientFilesRes) updates) => super.copyWith((message) => updates(message as GetClientFilesRes)) as GetClientFilesRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetClientFilesRes create() => GetClientFilesRes._();
  GetClientFilesRes createEmptyInstance() => create();
  static $pb.PbList<GetClientFilesRes> createRepeated() => $pb.PbList<GetClientFilesRes>();
  @$core.pragma('dart2js:noInline')
  static GetClientFilesRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetClientFilesRes>(create);
  static GetClientFilesRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.List<$core.String> get css => $_getList(2);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.List<$core.String> get js => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.String> get cssFiles => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get jsFiles => $_getList(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
