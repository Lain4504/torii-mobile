//
//  Generated code. Do not modify.
//  source: wajlc_breakout_room.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class CreateBreakoutRoomsReq extends $pb.GeneratedMessage {
  factory CreateBreakoutRoomsReq({
    $core.String? roomId,
    $core.String? requestedUserId,
    $fixnum.Int64? duration,
    $core.String? welcomeMsg,
    $core.Iterable<BreakoutRoom>? rooms,
  }) {
    final $result = create();
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (requestedUserId != null) {
      $result.requestedUserId = requestedUserId;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (welcomeMsg != null) {
      $result.welcomeMsg = welcomeMsg;
    }
    if (rooms != null) {
      $result.rooms.addAll(rooms);
    }
    return $result;
  }
  CreateBreakoutRoomsReq._() : super();
  factory CreateBreakoutRoomsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBreakoutRoomsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBreakoutRoomsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'requestedUserId')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'welcomeMsg')
    ..pc<BreakoutRoom>(5, _omitFieldNames ? '' : 'rooms', $pb.PbFieldType.PM, subBuilder: BreakoutRoom.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBreakoutRoomsReq clone() => CreateBreakoutRoomsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBreakoutRoomsReq copyWith(void Function(CreateBreakoutRoomsReq) updates) => super.copyWith((message) => updates(message as CreateBreakoutRoomsReq)) as CreateBreakoutRoomsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBreakoutRoomsReq create() => CreateBreakoutRoomsReq._();
  CreateBreakoutRoomsReq createEmptyInstance() => create();
  static $pb.PbList<CreateBreakoutRoomsReq> createRepeated() => $pb.PbList<CreateBreakoutRoomsReq>();
  @$core.pragma('dart2js:noInline')
  static CreateBreakoutRoomsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBreakoutRoomsReq>(create);
  static CreateBreakoutRoomsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get requestedUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set requestedUserId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRequestedUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestedUserId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get duration => $_getI64(2);
  @$pb.TagNumber(3)
  set duration($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get welcomeMsg => $_getSZ(3);
  @$pb.TagNumber(4)
  set welcomeMsg($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWelcomeMsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearWelcomeMsg() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<BreakoutRoom> get rooms => $_getList(4);
}

class BreakoutRoom extends $pb.GeneratedMessage {
  factory BreakoutRoom({
    $core.String? id,
    $core.String? title,
    $fixnum.Int64? duration,
    $core.bool? started,
    $fixnum.Int64? created,
    $core.Iterable<BreakoutRoomUser>? users,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (started != null) {
      $result.started = started;
    }
    if (created != null) {
      $result.created = created;
    }
    if (users != null) {
      $result.users.addAll(users);
    }
    return $result;
  }
  BreakoutRoom._() : super();
  factory BreakoutRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BreakoutRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BreakoutRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(4, _omitFieldNames ? '' : 'started')
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'created', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<BreakoutRoomUser>(6, _omitFieldNames ? '' : 'users', $pb.PbFieldType.PM, subBuilder: BreakoutRoomUser.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BreakoutRoom clone() => BreakoutRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BreakoutRoom copyWith(void Function(BreakoutRoom) updates) => super.copyWith((message) => updates(message as BreakoutRoom)) as BreakoutRoom;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BreakoutRoom create() => BreakoutRoom._();
  BreakoutRoom createEmptyInstance() => create();
  static $pb.PbList<BreakoutRoom> createRepeated() => $pb.PbList<BreakoutRoom>();
  @$core.pragma('dart2js:noInline')
  static BreakoutRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BreakoutRoom>(create);
  static BreakoutRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get duration => $_getI64(2);
  @$pb.TagNumber(3)
  set duration($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get started => $_getBF(3);
  @$pb.TagNumber(4)
  set started($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStarted() => $_has(3);
  @$pb.TagNumber(4)
  void clearStarted() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get created => $_getI64(4);
  @$pb.TagNumber(5)
  set created($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreated() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreated() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<BreakoutRoomUser> get users => $_getList(5);
}

class BreakoutRoomUser extends $pb.GeneratedMessage {
  factory BreakoutRoomUser({
    $core.String? id,
    $core.String? name,
    $core.bool? joined,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (joined != null) {
      $result.joined = joined;
    }
    return $result;
  }
  BreakoutRoomUser._() : super();
  factory BreakoutRoomUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BreakoutRoomUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BreakoutRoomUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOB(3, _omitFieldNames ? '' : 'joined')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BreakoutRoomUser clone() => BreakoutRoomUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BreakoutRoomUser copyWith(void Function(BreakoutRoomUser) updates) => super.copyWith((message) => updates(message as BreakoutRoomUser)) as BreakoutRoomUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BreakoutRoomUser create() => BreakoutRoomUser._();
  BreakoutRoomUser createEmptyInstance() => create();
  static $pb.PbList<BreakoutRoomUser> createRepeated() => $pb.PbList<BreakoutRoomUser>();
  @$core.pragma('dart2js:noInline')
  static BreakoutRoomUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BreakoutRoomUser>(create);
  static BreakoutRoomUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get joined => $_getBF(2);
  @$pb.TagNumber(3)
  set joined($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasJoined() => $_has(2);
  @$pb.TagNumber(3)
  void clearJoined() => clearField(3);
}

class IncreaseBreakoutRoomDurationReq extends $pb.GeneratedMessage {
  factory IncreaseBreakoutRoomDurationReq({
    $core.String? breakoutRoomId,
    $fixnum.Int64? duration,
    $core.String? roomId,
  }) {
    final $result = create();
    if (breakoutRoomId != null) {
      $result.breakoutRoomId = breakoutRoomId;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    return $result;
  }
  IncreaseBreakoutRoomDurationReq._() : super();
  factory IncreaseBreakoutRoomDurationReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IncreaseBreakoutRoomDurationReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IncreaseBreakoutRoomDurationReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'breakoutRoomId')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IncreaseBreakoutRoomDurationReq clone() => IncreaseBreakoutRoomDurationReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IncreaseBreakoutRoomDurationReq copyWith(void Function(IncreaseBreakoutRoomDurationReq) updates) => super.copyWith((message) => updates(message as IncreaseBreakoutRoomDurationReq)) as IncreaseBreakoutRoomDurationReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IncreaseBreakoutRoomDurationReq create() => IncreaseBreakoutRoomDurationReq._();
  IncreaseBreakoutRoomDurationReq createEmptyInstance() => create();
  static $pb.PbList<IncreaseBreakoutRoomDurationReq> createRepeated() => $pb.PbList<IncreaseBreakoutRoomDurationReq>();
  @$core.pragma('dart2js:noInline')
  static IncreaseBreakoutRoomDurationReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IncreaseBreakoutRoomDurationReq>(create);
  static IncreaseBreakoutRoomDurationReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get breakoutRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set breakoutRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBreakoutRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBreakoutRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get duration => $_getI64(1);
  @$pb.TagNumber(2)
  set duration($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => clearField(3);
}

class BroadcastBreakoutRoomMsgReq extends $pb.GeneratedMessage {
  factory BroadcastBreakoutRoomMsgReq({
    $core.String? msg,
    $core.String? roomId,
  }) {
    final $result = create();
    if (msg != null) {
      $result.msg = msg;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    return $result;
  }
  BroadcastBreakoutRoomMsgReq._() : super();
  factory BroadcastBreakoutRoomMsgReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BroadcastBreakoutRoomMsgReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BroadcastBreakoutRoomMsgReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BroadcastBreakoutRoomMsgReq clone() => BroadcastBreakoutRoomMsgReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BroadcastBreakoutRoomMsgReq copyWith(void Function(BroadcastBreakoutRoomMsgReq) updates) => super.copyWith((message) => updates(message as BroadcastBreakoutRoomMsgReq)) as BroadcastBreakoutRoomMsgReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastBreakoutRoomMsgReq create() => BroadcastBreakoutRoomMsgReq._();
  BroadcastBreakoutRoomMsgReq createEmptyInstance() => create();
  static $pb.PbList<BroadcastBreakoutRoomMsgReq> createRepeated() => $pb.PbList<BroadcastBreakoutRoomMsgReq>();
  @$core.pragma('dart2js:noInline')
  static BroadcastBreakoutRoomMsgReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BroadcastBreakoutRoomMsgReq>(create);
  static BroadcastBreakoutRoomMsgReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(3)
  set roomId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(3)
  void clearRoomId() => clearField(3);
}

class JoinBreakoutRoomReq extends $pb.GeneratedMessage {
  factory JoinBreakoutRoomReq({
    $core.String? breakoutRoomId,
    $core.String? userId,
    $core.String? roomId,
    $core.bool? isAdmin,
  }) {
    final $result = create();
    if (breakoutRoomId != null) {
      $result.breakoutRoomId = breakoutRoomId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (isAdmin != null) {
      $result.isAdmin = isAdmin;
    }
    return $result;
  }
  JoinBreakoutRoomReq._() : super();
  factory JoinBreakoutRoomReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinBreakoutRoomReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JoinBreakoutRoomReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'breakoutRoomId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..aOB(4, _omitFieldNames ? '' : 'isAdmin')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinBreakoutRoomReq clone() => JoinBreakoutRoomReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinBreakoutRoomReq copyWith(void Function(JoinBreakoutRoomReq) updates) => super.copyWith((message) => updates(message as JoinBreakoutRoomReq)) as JoinBreakoutRoomReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinBreakoutRoomReq create() => JoinBreakoutRoomReq._();
  JoinBreakoutRoomReq createEmptyInstance() => create();
  static $pb.PbList<JoinBreakoutRoomReq> createRepeated() => $pb.PbList<JoinBreakoutRoomReq>();
  @$core.pragma('dart2js:noInline')
  static JoinBreakoutRoomReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinBreakoutRoomReq>(create);
  static JoinBreakoutRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get breakoutRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set breakoutRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBreakoutRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBreakoutRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isAdmin => $_getBF(3);
  @$pb.TagNumber(4)
  set isAdmin($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsAdmin() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsAdmin() => clearField(4);
}

class EndBreakoutRoomReq extends $pb.GeneratedMessage {
  factory EndBreakoutRoomReq({
    $core.String? breakoutRoomId,
    $core.String? roomId,
  }) {
    final $result = create();
    if (breakoutRoomId != null) {
      $result.breakoutRoomId = breakoutRoomId;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    return $result;
  }
  EndBreakoutRoomReq._() : super();
  factory EndBreakoutRoomReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EndBreakoutRoomReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EndBreakoutRoomReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'breakoutRoomId')
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EndBreakoutRoomReq clone() => EndBreakoutRoomReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EndBreakoutRoomReq copyWith(void Function(EndBreakoutRoomReq) updates) => super.copyWith((message) => updates(message as EndBreakoutRoomReq)) as EndBreakoutRoomReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndBreakoutRoomReq create() => EndBreakoutRoomReq._();
  EndBreakoutRoomReq createEmptyInstance() => create();
  static $pb.PbList<EndBreakoutRoomReq> createRepeated() => $pb.PbList<EndBreakoutRoomReq>();
  @$core.pragma('dart2js:noInline')
  static EndBreakoutRoomReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EndBreakoutRoomReq>(create);
  static EndBreakoutRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get breakoutRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set breakoutRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBreakoutRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBreakoutRoomId() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(3)
  set roomId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(3)
  void clearRoomId() => clearField(3);
}

class BreakoutRoomRes extends $pb.GeneratedMessage {
  factory BreakoutRoomRes({
    $core.bool? status,
    $core.String? msg,
    $core.String? token,
    BreakoutRoom? room,
    $core.Iterable<BreakoutRoom>? rooms,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (token != null) {
      $result.token = token;
    }
    if (room != null) {
      $result.room = room;
    }
    if (rooms != null) {
      $result.rooms.addAll(rooms);
    }
    return $result;
  }
  BreakoutRoomRes._() : super();
  factory BreakoutRoomRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BreakoutRoomRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BreakoutRoomRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..aOM<BreakoutRoom>(4, _omitFieldNames ? '' : 'room', subBuilder: BreakoutRoom.create)
    ..pc<BreakoutRoom>(5, _omitFieldNames ? '' : 'rooms', $pb.PbFieldType.PM, subBuilder: BreakoutRoom.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BreakoutRoomRes clone() => BreakoutRoomRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BreakoutRoomRes copyWith(void Function(BreakoutRoomRes) updates) => super.copyWith((message) => updates(message as BreakoutRoomRes)) as BreakoutRoomRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BreakoutRoomRes create() => BreakoutRoomRes._();
  BreakoutRoomRes createEmptyInstance() => create();
  static $pb.PbList<BreakoutRoomRes> createRepeated() => $pb.PbList<BreakoutRoomRes>();
  @$core.pragma('dart2js:noInline')
  static BreakoutRoomRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BreakoutRoomRes>(create);
  static BreakoutRoomRes? _defaultInstance;

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
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => clearField(3);

  @$pb.TagNumber(4)
  BreakoutRoom get room => $_getN(3);
  @$pb.TagNumber(4)
  set room(BreakoutRoom v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoom() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoom() => clearField(4);
  @$pb.TagNumber(4)
  BreakoutRoom ensureRoom() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<BreakoutRoom> get rooms => $_getList(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
