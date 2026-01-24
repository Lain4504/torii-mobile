// This is a generated file - do not edit.
//
// Generated from wajlc_breakout_room.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CreateBreakoutRoomsReq extends $pb.GeneratedMessage {
  factory CreateBreakoutRoomsReq({
    $core.String? roomId,
    $core.String? requestedUserId,
    $fixnum.Int64? duration,
    $core.String? welcomeMsg,
    $core.Iterable<BreakoutRoom>? rooms,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (requestedUserId != null) result.requestedUserId = requestedUserId;
    if (duration != null) result.duration = duration;
    if (welcomeMsg != null) result.welcomeMsg = welcomeMsg;
    if (rooms != null) result.rooms.addAll(rooms);
    return result;
  }

  CreateBreakoutRoomsReq._();

  factory CreateBreakoutRoomsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateBreakoutRoomsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateBreakoutRoomsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'requestedUserId')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'welcomeMsg')
    ..pPM<BreakoutRoom>(5, _omitFieldNames ? '' : 'rooms',
        subBuilder: BreakoutRoom.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBreakoutRoomsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBreakoutRoomsReq copyWith(
          void Function(CreateBreakoutRoomsReq) updates) =>
      super.copyWith((message) => updates(message as CreateBreakoutRoomsReq))
          as CreateBreakoutRoomsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBreakoutRoomsReq create() => CreateBreakoutRoomsReq._();
  @$core.override
  CreateBreakoutRoomsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateBreakoutRoomsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateBreakoutRoomsReq>(create);
  static CreateBreakoutRoomsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get requestedUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set requestedUserId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRequestedUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestedUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get duration => $_getI64(2);
  @$pb.TagNumber(3)
  set duration($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get welcomeMsg => $_getSZ(3);
  @$pb.TagNumber(4)
  set welcomeMsg($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWelcomeMsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearWelcomeMsg() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<BreakoutRoom> get rooms => $_getList(4);
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
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (duration != null) result.duration = duration;
    if (started != null) result.started = started;
    if (created != null) result.created = created;
    if (users != null) result.users.addAll(users);
    return result;
  }

  BreakoutRoom._();

  factory BreakoutRoom.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BreakoutRoom.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BreakoutRoom',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(4, _omitFieldNames ? '' : 'started')
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'created', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<BreakoutRoomUser>(6, _omitFieldNames ? '' : 'users',
        subBuilder: BreakoutRoomUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BreakoutRoom clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BreakoutRoom copyWith(void Function(BreakoutRoom) updates) =>
      super.copyWith((message) => updates(message as BreakoutRoom))
          as BreakoutRoom;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BreakoutRoom create() => BreakoutRoom._();
  @$core.override
  BreakoutRoom createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BreakoutRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BreakoutRoom>(create);
  static BreakoutRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get duration => $_getI64(2);
  @$pb.TagNumber(3)
  set duration($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get started => $_getBF(3);
  @$pb.TagNumber(4)
  set started($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStarted() => $_has(3);
  @$pb.TagNumber(4)
  void clearStarted() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get created => $_getI64(4);
  @$pb.TagNumber(5)
  set created($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreated() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreated() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<BreakoutRoomUser> get users => $_getList(5);
}

class BreakoutRoomUser extends $pb.GeneratedMessage {
  factory BreakoutRoomUser({
    $core.String? id,
    $core.String? name,
    $core.bool? joined,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (joined != null) result.joined = joined;
    return result;
  }

  BreakoutRoomUser._();

  factory BreakoutRoomUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BreakoutRoomUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BreakoutRoomUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOB(3, _omitFieldNames ? '' : 'joined')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BreakoutRoomUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BreakoutRoomUser copyWith(void Function(BreakoutRoomUser) updates) =>
      super.copyWith((message) => updates(message as BreakoutRoomUser))
          as BreakoutRoomUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BreakoutRoomUser create() => BreakoutRoomUser._();
  @$core.override
  BreakoutRoomUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BreakoutRoomUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BreakoutRoomUser>(create);
  static BreakoutRoomUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get joined => $_getBF(2);
  @$pb.TagNumber(3)
  set joined($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasJoined() => $_has(2);
  @$pb.TagNumber(3)
  void clearJoined() => $_clearField(3);
}

class IncreaseBreakoutRoomDurationReq extends $pb.GeneratedMessage {
  factory IncreaseBreakoutRoomDurationReq({
    $core.String? breakoutRoomId,
    $fixnum.Int64? duration,
    $core.String? roomId,
  }) {
    final result = create();
    if (breakoutRoomId != null) result.breakoutRoomId = breakoutRoomId;
    if (duration != null) result.duration = duration;
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  IncreaseBreakoutRoomDurationReq._();

  factory IncreaseBreakoutRoomDurationReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IncreaseBreakoutRoomDurationReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IncreaseBreakoutRoomDurationReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'breakoutRoomId')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IncreaseBreakoutRoomDurationReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IncreaseBreakoutRoomDurationReq copyWith(
          void Function(IncreaseBreakoutRoomDurationReq) updates) =>
      super.copyWith(
              (message) => updates(message as IncreaseBreakoutRoomDurationReq))
          as IncreaseBreakoutRoomDurationReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IncreaseBreakoutRoomDurationReq create() =>
      IncreaseBreakoutRoomDurationReq._();
  @$core.override
  IncreaseBreakoutRoomDurationReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IncreaseBreakoutRoomDurationReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IncreaseBreakoutRoomDurationReq>(
          create);
  static IncreaseBreakoutRoomDurationReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get breakoutRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set breakoutRoomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBreakoutRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBreakoutRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get duration => $_getI64(1);
  @$pb.TagNumber(2)
  set duration($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => $_clearField(3);
}

class BroadcastBreakoutRoomMsgReq extends $pb.GeneratedMessage {
  factory BroadcastBreakoutRoomMsgReq({
    $core.String? msg,
    $core.String? roomId,
  }) {
    final result = create();
    if (msg != null) result.msg = msg;
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  BroadcastBreakoutRoomMsgReq._();

  factory BroadcastBreakoutRoomMsgReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BroadcastBreakoutRoomMsgReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BroadcastBreakoutRoomMsgReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastBreakoutRoomMsgReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastBreakoutRoomMsgReq copyWith(
          void Function(BroadcastBreakoutRoomMsgReq) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcastBreakoutRoomMsgReq))
          as BroadcastBreakoutRoomMsgReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastBreakoutRoomMsgReq create() =>
      BroadcastBreakoutRoomMsgReq._();
  @$core.override
  BroadcastBreakoutRoomMsgReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BroadcastBreakoutRoomMsgReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastBreakoutRoomMsgReq>(create);
  static BroadcastBreakoutRoomMsgReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(3)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(3)
  void clearRoomId() => $_clearField(3);
}

class JoinBreakoutRoomReq extends $pb.GeneratedMessage {
  factory JoinBreakoutRoomReq({
    $core.String? breakoutRoomId,
    $core.String? userId,
    $core.String? roomId,
    $core.bool? isAdmin,
  }) {
    final result = create();
    if (breakoutRoomId != null) result.breakoutRoomId = breakoutRoomId;
    if (userId != null) result.userId = userId;
    if (roomId != null) result.roomId = roomId;
    if (isAdmin != null) result.isAdmin = isAdmin;
    return result;
  }

  JoinBreakoutRoomReq._();

  factory JoinBreakoutRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JoinBreakoutRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JoinBreakoutRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'breakoutRoomId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..aOB(4, _omitFieldNames ? '' : 'isAdmin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinBreakoutRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinBreakoutRoomReq copyWith(void Function(JoinBreakoutRoomReq) updates) =>
      super.copyWith((message) => updates(message as JoinBreakoutRoomReq))
          as JoinBreakoutRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinBreakoutRoomReq create() => JoinBreakoutRoomReq._();
  @$core.override
  JoinBreakoutRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JoinBreakoutRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinBreakoutRoomReq>(create);
  static JoinBreakoutRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get breakoutRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set breakoutRoomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBreakoutRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBreakoutRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isAdmin => $_getBF(3);
  @$pb.TagNumber(4)
  set isAdmin($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsAdmin() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsAdmin() => $_clearField(4);
}

class EndBreakoutRoomReq extends $pb.GeneratedMessage {
  factory EndBreakoutRoomReq({
    $core.String? breakoutRoomId,
    $core.String? roomId,
  }) {
    final result = create();
    if (breakoutRoomId != null) result.breakoutRoomId = breakoutRoomId;
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  EndBreakoutRoomReq._();

  factory EndBreakoutRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EndBreakoutRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EndBreakoutRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'breakoutRoomId')
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndBreakoutRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndBreakoutRoomReq copyWith(void Function(EndBreakoutRoomReq) updates) =>
      super.copyWith((message) => updates(message as EndBreakoutRoomReq))
          as EndBreakoutRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndBreakoutRoomReq create() => EndBreakoutRoomReq._();
  @$core.override
  EndBreakoutRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EndBreakoutRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EndBreakoutRoomReq>(create);
  static EndBreakoutRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get breakoutRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set breakoutRoomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBreakoutRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBreakoutRoomId() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(3)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(3)
  void clearRoomId() => $_clearField(3);
}

class BreakoutRoomRes extends $pb.GeneratedMessage {
  factory BreakoutRoomRes({
    $core.bool? status,
    $core.String? msg,
    $core.String? token,
    BreakoutRoom? room,
    $core.Iterable<BreakoutRoom>? rooms,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (token != null) result.token = token;
    if (room != null) result.room = room;
    if (rooms != null) result.rooms.addAll(rooms);
    return result;
  }

  BreakoutRoomRes._();

  factory BreakoutRoomRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BreakoutRoomRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BreakoutRoomRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..aOM<BreakoutRoom>(4, _omitFieldNames ? '' : 'room',
        subBuilder: BreakoutRoom.create)
    ..pPM<BreakoutRoom>(5, _omitFieldNames ? '' : 'rooms',
        subBuilder: BreakoutRoom.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BreakoutRoomRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BreakoutRoomRes copyWith(void Function(BreakoutRoomRes) updates) =>
      super.copyWith((message) => updates(message as BreakoutRoomRes))
          as BreakoutRoomRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BreakoutRoomRes create() => BreakoutRoomRes._();
  @$core.override
  BreakoutRoomRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BreakoutRoomRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BreakoutRoomRes>(create);
  static BreakoutRoomRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => $_clearField(3);

  @$pb.TagNumber(4)
  BreakoutRoom get room => $_getN(3);
  @$pb.TagNumber(4)
  set room(BreakoutRoom value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRoom() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoom() => $_clearField(4);
  @$pb.TagNumber(4)
  BreakoutRoom ensureRoom() => $_ensure(3);

  @$pb.TagNumber(5)
  $pb.PbList<BreakoutRoom> get rooms => $_getList(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
