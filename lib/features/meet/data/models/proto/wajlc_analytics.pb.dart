//
//  Generated code. Do not modify.
//  source: wajlc_analytics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_analytics.pbenum.dart';

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
    final $result = create();
    if (eventType != null) {
      $result.eventType = eventType;
    }
    if (eventName != null) {
      $result.eventName = eventName;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (time != null) {
      $result.time = time;
    }
    if (eventValueString != null) {
      $result.eventValueString = eventValueString;
    }
    if (eventValueInteger != null) {
      $result.eventValueInteger = eventValueInteger;
    }
    if (hsetValue != null) {
      $result.hsetValue = hsetValue;
    }
    if (roomSid != null) {
      $result.roomSid = roomSid;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (userName != null) {
      $result.userName = userName;
    }
    if (extraData != null) {
      $result.extraData = extraData;
    }
    return $result;
  }
  AnalyticsDataMsg._() : super();
  factory AnalyticsDataMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsDataMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsDataMsg', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..e<AnalyticsEventType>(1, _omitFieldNames ? '' : 'eventType', $pb.PbFieldType.OE, defaultOrMaker: AnalyticsEventType.ANALYTICS_EVENT_TYPE_ROOM, valueOf: AnalyticsEventType.valueOf, enumValues: AnalyticsEventType.values)
    ..e<AnalyticsEvents>(2, _omitFieldNames ? '' : 'eventName', $pb.PbFieldType.OE, defaultOrMaker: AnalyticsEvents.ANALYTICS_EVENT_UNKNOWN, valueOf: AnalyticsEvents.valueOf, enumValues: AnalyticsEvents.values)
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..aInt64(4, _omitFieldNames ? '' : 'time')
    ..aOS(5, _omitFieldNames ? '' : 'eventValueString')
    ..aInt64(6, _omitFieldNames ? '' : 'eventValueInteger')
    ..aOS(7, _omitFieldNames ? '' : 'hsetValue')
    ..aOS(8, _omitFieldNames ? '' : 'roomSid')
    ..aOS(9, _omitFieldNames ? '' : 'userId')
    ..aOS(10, _omitFieldNames ? '' : 'userName')
    ..aOS(11, _omitFieldNames ? '' : 'extraData')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsDataMsg clone() => AnalyticsDataMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsDataMsg copyWith(void Function(AnalyticsDataMsg) updates) => super.copyWith((message) => updates(message as AnalyticsDataMsg)) as AnalyticsDataMsg;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsDataMsg create() => AnalyticsDataMsg._();
  AnalyticsDataMsg createEmptyInstance() => create();
  static $pb.PbList<AnalyticsDataMsg> createRepeated() => $pb.PbList<AnalyticsDataMsg>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsDataMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsDataMsg>(create);
  static AnalyticsDataMsg? _defaultInstance;

  @$pb.TagNumber(1)
  AnalyticsEventType get eventType => $_getN(0);
  @$pb.TagNumber(1)
  set eventType(AnalyticsEventType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventType() => clearField(1);

  @$pb.TagNumber(2)
  AnalyticsEvents get eventName => $_getN(1);
  @$pb.TagNumber(2)
  set eventName(AnalyticsEvents v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEventName() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => clearField(3);

  /// should be unix milliseconds
  @$pb.TagNumber(4)
  $fixnum.Int64 get time => $_getI64(3);
  @$pb.TagNumber(4)
  set time($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearTime() => clearField(4);

  /// if we pass value here then it will use redis SET to set the value for the key
  @$pb.TagNumber(5)
  $core.String get eventValueString => $_getSZ(4);
  @$pb.TagNumber(5)
  set eventValueString($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEventValueString() => $_has(4);
  @$pb.TagNumber(5)
  void clearEventValueString() => clearField(5);

  /// if we pass value here then it will use redis INCRBY to increment value for the key
  @$pb.TagNumber(6)
  $fixnum.Int64 get eventValueInteger => $_getI64(5);
  @$pb.TagNumber(6)
  set eventValueInteger($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEventValueInteger() => $_has(5);
  @$pb.TagNumber(6)
  void clearEventValueInteger() => clearField(6);

  /// if we pass value here then it will use redis HSET to set hash field value for the key
  /// hash field will be unix milliseconds, so it will remain unique as always
  @$pb.TagNumber(7)
  $core.String get hsetValue => $_getSZ(6);
  @$pb.TagNumber(7)
  set hsetValue($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasHsetValue() => $_has(6);
  @$pb.TagNumber(7)
  void clearHsetValue() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get roomSid => $_getSZ(7);
  @$pb.TagNumber(8)
  set roomSid($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRoomSid() => $_has(7);
  @$pb.TagNumber(8)
  void clearRoomSid() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get userId => $_getSZ(8);
  @$pb.TagNumber(9)
  set userId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasUserId() => $_has(8);
  @$pb.TagNumber(9)
  void clearUserId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get userName => $_getSZ(9);
  @$pb.TagNumber(10)
  set userName($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUserName() => $_has(9);
  @$pb.TagNumber(10)
  void clearUserName() => clearField(10);

  /// this extra_data can be use for various purposes like, room or user metadata
  @$pb.TagNumber(11)
  $core.String get extraData => $_getSZ(10);
  @$pb.TagNumber(11)
  set extraData($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasExtraData() => $_has(10);
  @$pb.TagNumber(11)
  void clearExtraData() => clearField(11);
}

class AnalyticsEventValue extends $pb.GeneratedMessage {
  factory AnalyticsEventValue({
    $fixnum.Int64? time,
    $core.String? value,
  }) {
    final $result = create();
    if (time != null) {
      $result.time = time;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  AnalyticsEventValue._() : super();
  factory AnalyticsEventValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsEventValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsEventValue', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'time')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsEventValue clone() => AnalyticsEventValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsEventValue copyWith(void Function(AnalyticsEventValue) updates) => super.copyWith((message) => updates(message as AnalyticsEventValue)) as AnalyticsEventValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsEventValue create() => AnalyticsEventValue._();
  AnalyticsEventValue createEmptyInstance() => create();
  static $pb.PbList<AnalyticsEventValue> createRepeated() => $pb.PbList<AnalyticsEventValue>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsEventValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsEventValue>(create);
  static AnalyticsEventValue? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get time => $_getI64(0);
  @$pb.TagNumber(1)
  set time($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class AnalyticsEventData extends $pb.GeneratedMessage {
  factory AnalyticsEventData({
    $core.String? name,
    $core.int? total,
    $core.Iterable<AnalyticsEventValue>? values,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (total != null) {
      $result.total = total;
    }
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  AnalyticsEventData._() : super();
  factory AnalyticsEventData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsEventData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsEventData', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.OU3)
    ..pc<AnalyticsEventValue>(3, _omitFieldNames ? '' : 'values', $pb.PbFieldType.PM, subBuilder: AnalyticsEventValue.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsEventData clone() => AnalyticsEventData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsEventData copyWith(void Function(AnalyticsEventData) updates) => super.copyWith((message) => updates(message as AnalyticsEventData)) as AnalyticsEventData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsEventData create() => AnalyticsEventData._();
  AnalyticsEventData createEmptyInstance() => create();
  static $pb.PbList<AnalyticsEventData> createRepeated() => $pb.PbList<AnalyticsEventData>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsEventData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsEventData>(create);
  static AnalyticsEventData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<AnalyticsEventValue> get values => $_getList(2);
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
    final $result = create();
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (roomTitle != null) {
      $result.roomTitle = roomTitle;
    }
    if (roomTotalUsers != null) {
      $result.roomTotalUsers = roomTotalUsers;
    }
    if (roomCreation != null) {
      $result.roomCreation = roomCreation;
    }
    if (roomEnded != null) {
      $result.roomEnded = roomEnded;
    }
    if (roomDuration != null) {
      $result.roomDuration = roomDuration;
    }
    if (enabledE2ee != null) {
      $result.enabledE2ee = enabledE2ee;
    }
    if (events != null) {
      $result.events.addAll(events);
    }
    return $result;
  }
  AnalyticsRoomInfo._() : super();
  factory AnalyticsRoomInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsRoomInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsRoomInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'roomTitle')
    ..aInt64(3, _omitFieldNames ? '' : 'roomTotalUsers')
    ..aInt64(4, _omitFieldNames ? '' : 'roomCreation')
    ..aInt64(5, _omitFieldNames ? '' : 'roomEnded')
    ..aInt64(6, _omitFieldNames ? '' : 'roomDuration')
    ..aOB(7, _omitFieldNames ? '' : 'enabledE2ee')
    ..pc<AnalyticsEventData>(9, _omitFieldNames ? '' : 'events', $pb.PbFieldType.PM, subBuilder: AnalyticsEventData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsRoomInfo clone() => AnalyticsRoomInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsRoomInfo copyWith(void Function(AnalyticsRoomInfo) updates) => super.copyWith((message) => updates(message as AnalyticsRoomInfo)) as AnalyticsRoomInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsRoomInfo create() => AnalyticsRoomInfo._();
  AnalyticsRoomInfo createEmptyInstance() => create();
  static $pb.PbList<AnalyticsRoomInfo> createRepeated() => $pb.PbList<AnalyticsRoomInfo>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsRoomInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsRoomInfo>(create);
  static AnalyticsRoomInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomTitle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomTitle() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get roomTotalUsers => $_getI64(2);
  @$pb.TagNumber(3)
  set roomTotalUsers($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomTotalUsers() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomTotalUsers() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get roomCreation => $_getI64(3);
  @$pb.TagNumber(4)
  set roomCreation($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomCreation() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomCreation() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get roomEnded => $_getI64(4);
  @$pb.TagNumber(5)
  set roomEnded($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRoomEnded() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomEnded() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get roomDuration => $_getI64(5);
  @$pb.TagNumber(6)
  set roomDuration($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRoomDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomDuration() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get enabledE2ee => $_getBF(6);
  @$pb.TagNumber(7)
  set enabledE2ee($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasEnabledE2ee() => $_has(6);
  @$pb.TagNumber(7)
  void clearEnabledE2ee() => clearField(7);

  @$pb.TagNumber(9)
  $core.List<AnalyticsEventData> get events => $_getList(7);
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
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (isAdmin != null) {
      $result.isAdmin = isAdmin;
    }
    if (extraData != null) {
      $result.extraData = extraData;
    }
    if (exUserId != null) {
      $result.exUserId = exUserId;
    }
    if (events != null) {
      $result.events.addAll(events);
    }
    return $result;
  }
  AnalyticsUserInfo._() : super();
  factory AnalyticsUserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsUserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsUserInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOB(3, _omitFieldNames ? '' : 'isAdmin')
    ..aOS(4, _omitFieldNames ? '' : 'extraData')
    ..aOS(5, _omitFieldNames ? '' : 'exUserId')
    ..pc<AnalyticsEventData>(6, _omitFieldNames ? '' : 'events', $pb.PbFieldType.PM, subBuilder: AnalyticsEventData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsUserInfo clone() => AnalyticsUserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsUserInfo copyWith(void Function(AnalyticsUserInfo) updates) => super.copyWith((message) => updates(message as AnalyticsUserInfo)) as AnalyticsUserInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsUserInfo create() => AnalyticsUserInfo._();
  AnalyticsUserInfo createEmptyInstance() => create();
  static $pb.PbList<AnalyticsUserInfo> createRepeated() => $pb.PbList<AnalyticsUserInfo>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsUserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsUserInfo>(create);
  static AnalyticsUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAdmin => $_getBF(2);
  @$pb.TagNumber(3)
  set isAdmin($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAdmin() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAdmin() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get extraData => $_getSZ(3);
  @$pb.TagNumber(4)
  set extraData($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExtraData() => $_has(3);
  @$pb.TagNumber(4)
  void clearExtraData() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get exUserId => $_getSZ(4);
  @$pb.TagNumber(5)
  set exUserId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasExUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearExUserId() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<AnalyticsEventData> get events => $_getList(5);
}

class AnalyticsResult extends $pb.GeneratedMessage {
  factory AnalyticsResult({
    AnalyticsRoomInfo? room,
    $core.Iterable<AnalyticsUserInfo>? users,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (users != null) {
      $result.users.addAll(users);
    }
    return $result;
  }
  AnalyticsResult._() : super();
  factory AnalyticsResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOM<AnalyticsRoomInfo>(1, _omitFieldNames ? '' : 'room', subBuilder: AnalyticsRoomInfo.create)
    ..pc<AnalyticsUserInfo>(2, _omitFieldNames ? '' : 'users', $pb.PbFieldType.PM, subBuilder: AnalyticsUserInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsResult clone() => AnalyticsResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsResult copyWith(void Function(AnalyticsResult) updates) => super.copyWith((message) => updates(message as AnalyticsResult)) as AnalyticsResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsResult create() => AnalyticsResult._();
  AnalyticsResult createEmptyInstance() => create();
  static $pb.PbList<AnalyticsResult> createRepeated() => $pb.PbList<AnalyticsResult>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsResult>(create);
  static AnalyticsResult? _defaultInstance;

  @$pb.TagNumber(1)
  AnalyticsRoomInfo get room => $_getN(0);
  @$pb.TagNumber(1)
  set room(AnalyticsRoomInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
  @$pb.TagNumber(1)
  AnalyticsRoomInfo ensureRoom() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<AnalyticsUserInfo> get users => $_getList(1);
}

class AnalyticsRedisUserInfo extends $pb.GeneratedMessage {
  factory AnalyticsRedisUserInfo({
    $core.String? name,
    $core.bool? isAdmin,
    $core.String? extraData,
    $core.String? exUserId,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (isAdmin != null) {
      $result.isAdmin = isAdmin;
    }
    if (extraData != null) {
      $result.extraData = extraData;
    }
    if (exUserId != null) {
      $result.exUserId = exUserId;
    }
    return $result;
  }
  AnalyticsRedisUserInfo._() : super();
  factory AnalyticsRedisUserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsRedisUserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsRedisUserInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOB(2, _omitFieldNames ? '' : 'isAdmin')
    ..aOS(3, _omitFieldNames ? '' : 'extraData')
    ..aOS(4, _omitFieldNames ? '' : 'exUserId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsRedisUserInfo clone() => AnalyticsRedisUserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsRedisUserInfo copyWith(void Function(AnalyticsRedisUserInfo) updates) => super.copyWith((message) => updates(message as AnalyticsRedisUserInfo)) as AnalyticsRedisUserInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsRedisUserInfo create() => AnalyticsRedisUserInfo._();
  AnalyticsRedisUserInfo createEmptyInstance() => create();
  static $pb.PbList<AnalyticsRedisUserInfo> createRepeated() => $pb.PbList<AnalyticsRedisUserInfo>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsRedisUserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsRedisUserInfo>(create);
  static AnalyticsRedisUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAdmin => $_getBF(1);
  @$pb.TagNumber(2)
  set isAdmin($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsAdmin() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAdmin() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get extraData => $_getSZ(2);
  @$pb.TagNumber(3)
  set extraData($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExtraData() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtraData() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get exUserId => $_getSZ(3);
  @$pb.TagNumber(4)
  set exUserId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearExUserId() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
