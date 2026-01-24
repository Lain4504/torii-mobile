// This is a generated file - do not edit.
//
// Generated from wajlc_analytics.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_analytics.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'wajlc_analytics.pbenum.dart';

class AnalyticsDataMsg extends $pb.GeneratedMessage {
  factory AnalyticsDataMsg({
    AnalyticsEventType? eventType,
    AnalyticsEvents? eventName,
    $core.String? roomId,
    $fixnum.Int64? time,
    $core.String? eventValueString,
    $fixnum.Int64? eventValueInteger,
    $core.String? hsetValue,
    $core.String? roomSid,
    $core.String? userId,
    $core.String? userName,
    $core.String? extraData,
  }) {
    final result = create();
    if (eventType != null) result.eventType = eventType;
    if (eventName != null) result.eventName = eventName;
    if (roomId != null) result.roomId = roomId;
    if (time != null) result.time = time;
    if (eventValueString != null) result.eventValueString = eventValueString;
    if (eventValueInteger != null) result.eventValueInteger = eventValueInteger;
    if (hsetValue != null) result.hsetValue = hsetValue;
    if (roomSid != null) result.roomSid = roomSid;
    if (userId != null) result.userId = userId;
    if (userName != null) result.userName = userName;
    if (extraData != null) result.extraData = extraData;
    return result;
  }

  AnalyticsDataMsg._();

  factory AnalyticsDataMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsDataMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsDataMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aE<AnalyticsEventType>(1, _omitFieldNames ? '' : 'eventType',
        enumValues: AnalyticsEventType.values)
    ..aE<AnalyticsEvents>(2, _omitFieldNames ? '' : 'eventName',
        enumValues: AnalyticsEvents.values)
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..aInt64(4, _omitFieldNames ? '' : 'time')
    ..aOS(5, _omitFieldNames ? '' : 'eventValueString')
    ..aInt64(6, _omitFieldNames ? '' : 'eventValueInteger')
    ..aOS(7, _omitFieldNames ? '' : 'hsetValue')
    ..aOS(8, _omitFieldNames ? '' : 'roomSid')
    ..aOS(9, _omitFieldNames ? '' : 'userId')
    ..aOS(10, _omitFieldNames ? '' : 'userName')
    ..aOS(11, _omitFieldNames ? '' : 'extraData')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsDataMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsDataMsg copyWith(void Function(AnalyticsDataMsg) updates) =>
      super.copyWith((message) => updates(message as AnalyticsDataMsg))
          as AnalyticsDataMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsDataMsg create() => AnalyticsDataMsg._();
  @$core.override
  AnalyticsDataMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsDataMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsDataMsg>(create);
  static AnalyticsDataMsg? _defaultInstance;

  @$pb.TagNumber(1)
  AnalyticsEventType get eventType => $_getN(0);
  @$pb.TagNumber(1)
  set eventType(AnalyticsEventType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasEventType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventType() => $_clearField(1);

  @$pb.TagNumber(2)
  AnalyticsEvents get eventName => $_getN(1);
  @$pb.TagNumber(2)
  set eventName(AnalyticsEvents value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEventName() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => $_clearField(3);

  /// should be unix milliseconds
  @$pb.TagNumber(4)
  $fixnum.Int64 get time => $_getI64(3);
  @$pb.TagNumber(4)
  set time($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearTime() => $_clearField(4);

  /// if we pass value here then it will use redis SET to set the value for the key
  @$pb.TagNumber(5)
  $core.String get eventValueString => $_getSZ(4);
  @$pb.TagNumber(5)
  set eventValueString($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEventValueString() => $_has(4);
  @$pb.TagNumber(5)
  void clearEventValueString() => $_clearField(5);

  /// if we pass value here then it will use redis INCRBY to increment value for the key
  @$pb.TagNumber(6)
  $fixnum.Int64 get eventValueInteger => $_getI64(5);
  @$pb.TagNumber(6)
  set eventValueInteger($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEventValueInteger() => $_has(5);
  @$pb.TagNumber(6)
  void clearEventValueInteger() => $_clearField(6);

  /// if we pass value here then it will use redis HSET to set hash field value for the key
  /// hash field will be unix milliseconds, so it will remain unique as always
  @$pb.TagNumber(7)
  $core.String get hsetValue => $_getSZ(6);
  @$pb.TagNumber(7)
  set hsetValue($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasHsetValue() => $_has(6);
  @$pb.TagNumber(7)
  void clearHsetValue() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get roomSid => $_getSZ(7);
  @$pb.TagNumber(8)
  set roomSid($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRoomSid() => $_has(7);
  @$pb.TagNumber(8)
  void clearRoomSid() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get userId => $_getSZ(8);
  @$pb.TagNumber(9)
  set userId($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasUserId() => $_has(8);
  @$pb.TagNumber(9)
  void clearUserId() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get userName => $_getSZ(9);
  @$pb.TagNumber(10)
  set userName($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasUserName() => $_has(9);
  @$pb.TagNumber(10)
  void clearUserName() => $_clearField(10);

  /// this extra_data can be use for various purposes like, room or user metadata
  @$pb.TagNumber(11)
  $core.String get extraData => $_getSZ(10);
  @$pb.TagNumber(11)
  set extraData($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasExtraData() => $_has(10);
  @$pb.TagNumber(11)
  void clearExtraData() => $_clearField(11);
}

class AnalyticsEventValue extends $pb.GeneratedMessage {
  factory AnalyticsEventValue({
    $fixnum.Int64? time,
    $core.String? value,
  }) {
    final result = create();
    if (time != null) result.time = time;
    if (value != null) result.value = value;
    return result;
  }

  AnalyticsEventValue._();

  factory AnalyticsEventValue.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsEventValue.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsEventValue',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'time')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsEventValue clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsEventValue copyWith(void Function(AnalyticsEventValue) updates) =>
      super.copyWith((message) => updates(message as AnalyticsEventValue))
          as AnalyticsEventValue;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsEventValue create() => AnalyticsEventValue._();
  @$core.override
  AnalyticsEventValue createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsEventValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsEventValue>(create);
  static AnalyticsEventValue? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get time => $_getI64(0);
  @$pb.TagNumber(1)
  set time($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearTime() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);
}

class AnalyticsEventData extends $pb.GeneratedMessage {
  factory AnalyticsEventData({
    $core.String? name,
    $core.int? total,
    $core.Iterable<AnalyticsEventValue>? values,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (total != null) result.total = total;
    if (values != null) result.values.addAll(values);
    return result;
  }

  AnalyticsEventData._();

  factory AnalyticsEventData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsEventData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsEventData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aI(2, _omitFieldNames ? '' : 'total', fieldType: $pb.PbFieldType.OU3)
    ..pPM<AnalyticsEventValue>(3, _omitFieldNames ? '' : 'values',
        subBuilder: AnalyticsEventValue.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsEventData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsEventData copyWith(void Function(AnalyticsEventData) updates) =>
      super.copyWith((message) => updates(message as AnalyticsEventData))
          as AnalyticsEventData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsEventData create() => AnalyticsEventData._();
  @$core.override
  AnalyticsEventData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsEventData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsEventData>(create);
  static AnalyticsEventData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<AnalyticsEventValue> get values => $_getList(2);
}

class AnalyticsRoomInfo extends $pb.GeneratedMessage {
  factory AnalyticsRoomInfo({
    $core.String? roomId,
    $core.String? roomTitle,
    $fixnum.Int64? roomTotalUsers,
    $fixnum.Int64? roomCreation,
    $fixnum.Int64? roomEnded,
    $fixnum.Int64? roomDuration,
    $core.bool? enabledE2ee,
    $core.Iterable<AnalyticsEventData>? events,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (roomTitle != null) result.roomTitle = roomTitle;
    if (roomTotalUsers != null) result.roomTotalUsers = roomTotalUsers;
    if (roomCreation != null) result.roomCreation = roomCreation;
    if (roomEnded != null) result.roomEnded = roomEnded;
    if (roomDuration != null) result.roomDuration = roomDuration;
    if (enabledE2ee != null) result.enabledE2ee = enabledE2ee;
    if (events != null) result.events.addAll(events);
    return result;
  }

  AnalyticsRoomInfo._();

  factory AnalyticsRoomInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsRoomInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsRoomInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'roomTitle')
    ..aInt64(3, _omitFieldNames ? '' : 'roomTotalUsers')
    ..aInt64(4, _omitFieldNames ? '' : 'roomCreation')
    ..aInt64(5, _omitFieldNames ? '' : 'roomEnded')
    ..aInt64(6, _omitFieldNames ? '' : 'roomDuration')
    ..aOB(7, _omitFieldNames ? '' : 'enabledE2ee')
    ..pPM<AnalyticsEventData>(9, _omitFieldNames ? '' : 'events',
        subBuilder: AnalyticsEventData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsRoomInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsRoomInfo copyWith(void Function(AnalyticsRoomInfo) updates) =>
      super.copyWith((message) => updates(message as AnalyticsRoomInfo))
          as AnalyticsRoomInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsRoomInfo create() => AnalyticsRoomInfo._();
  @$core.override
  AnalyticsRoomInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsRoomInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsRoomInfo>(create);
  static AnalyticsRoomInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomTitle($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get roomTotalUsers => $_getI64(2);
  @$pb.TagNumber(3)
  set roomTotalUsers($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomTotalUsers() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomTotalUsers() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get roomCreation => $_getI64(3);
  @$pb.TagNumber(4)
  set roomCreation($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomCreation() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomCreation() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get roomEnded => $_getI64(4);
  @$pb.TagNumber(5)
  set roomEnded($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRoomEnded() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomEnded() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get roomDuration => $_getI64(5);
  @$pb.TagNumber(6)
  set roomDuration($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRoomDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomDuration() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get enabledE2ee => $_getBF(6);
  @$pb.TagNumber(7)
  set enabledE2ee($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasEnabledE2ee() => $_has(6);
  @$pb.TagNumber(7)
  void clearEnabledE2ee() => $_clearField(7);

  @$pb.TagNumber(9)
  $pb.PbList<AnalyticsEventData> get events => $_getList(7);
}

class AnalyticsUserInfo extends $pb.GeneratedMessage {
  factory AnalyticsUserInfo({
    $core.String? userId,
    $core.String? name,
    $core.bool? isAdmin,
    $core.String? extraData,
    $core.String? exUserId,
    $core.Iterable<AnalyticsEventData>? events,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (name != null) result.name = name;
    if (isAdmin != null) result.isAdmin = isAdmin;
    if (extraData != null) result.extraData = extraData;
    if (exUserId != null) result.exUserId = exUserId;
    if (events != null) result.events.addAll(events);
    return result;
  }

  AnalyticsUserInfo._();

  factory AnalyticsUserInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsUserInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsUserInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOB(3, _omitFieldNames ? '' : 'isAdmin')
    ..aOS(4, _omitFieldNames ? '' : 'extraData')
    ..aOS(5, _omitFieldNames ? '' : 'exUserId')
    ..pPM<AnalyticsEventData>(6, _omitFieldNames ? '' : 'events',
        subBuilder: AnalyticsEventData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsUserInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsUserInfo copyWith(void Function(AnalyticsUserInfo) updates) =>
      super.copyWith((message) => updates(message as AnalyticsUserInfo))
          as AnalyticsUserInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsUserInfo create() => AnalyticsUserInfo._();
  @$core.override
  AnalyticsUserInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsUserInfo>(create);
  static AnalyticsUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAdmin => $_getBF(2);
  @$pb.TagNumber(3)
  set isAdmin($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsAdmin() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAdmin() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get extraData => $_getSZ(3);
  @$pb.TagNumber(4)
  set extraData($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExtraData() => $_has(3);
  @$pb.TagNumber(4)
  void clearExtraData() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get exUserId => $_getSZ(4);
  @$pb.TagNumber(5)
  set exUserId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearExUserId() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<AnalyticsEventData> get events => $_getList(5);
}

class AnalyticsResult extends $pb.GeneratedMessage {
  factory AnalyticsResult({
    AnalyticsRoomInfo? room,
    $core.Iterable<AnalyticsUserInfo>? users,
  }) {
    final result = create();
    if (room != null) result.room = room;
    if (users != null) result.users.addAll(users);
    return result;
  }

  AnalyticsResult._();

  factory AnalyticsResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOM<AnalyticsRoomInfo>(1, _omitFieldNames ? '' : 'room',
        subBuilder: AnalyticsRoomInfo.create)
    ..pPM<AnalyticsUserInfo>(2, _omitFieldNames ? '' : 'users',
        subBuilder: AnalyticsUserInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsResult copyWith(void Function(AnalyticsResult) updates) =>
      super.copyWith((message) => updates(message as AnalyticsResult))
          as AnalyticsResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsResult create() => AnalyticsResult._();
  @$core.override
  AnalyticsResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsResult>(create);
  static AnalyticsResult? _defaultInstance;

  @$pb.TagNumber(1)
  AnalyticsRoomInfo get room => $_getN(0);
  @$pb.TagNumber(1)
  set room(AnalyticsRoomInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => $_clearField(1);
  @$pb.TagNumber(1)
  AnalyticsRoomInfo ensureRoom() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<AnalyticsUserInfo> get users => $_getList(1);
}

class AnalyticsRedisUserInfo extends $pb.GeneratedMessage {
  factory AnalyticsRedisUserInfo({
    $core.String? name,
    $core.bool? isAdmin,
    $core.String? extraData,
    $core.String? exUserId,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (isAdmin != null) result.isAdmin = isAdmin;
    if (extraData != null) result.extraData = extraData;
    if (exUserId != null) result.exUserId = exUserId;
    return result;
  }

  AnalyticsRedisUserInfo._();

  factory AnalyticsRedisUserInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsRedisUserInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsRedisUserInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOB(2, _omitFieldNames ? '' : 'isAdmin')
    ..aOS(3, _omitFieldNames ? '' : 'extraData')
    ..aOS(4, _omitFieldNames ? '' : 'exUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsRedisUserInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsRedisUserInfo copyWith(
          void Function(AnalyticsRedisUserInfo) updates) =>
      super.copyWith((message) => updates(message as AnalyticsRedisUserInfo))
          as AnalyticsRedisUserInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsRedisUserInfo create() => AnalyticsRedisUserInfo._();
  @$core.override
  AnalyticsRedisUserInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsRedisUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsRedisUserInfo>(create);
  static AnalyticsRedisUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAdmin => $_getBF(1);
  @$pb.TagNumber(2)
  set isAdmin($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsAdmin() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAdmin() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get extraData => $_getSZ(2);
  @$pb.TagNumber(3)
  set extraData($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExtraData() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtraData() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get exUserId => $_getSZ(3);
  @$pb.TagNumber(4)
  set exUserId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearExUserId() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
