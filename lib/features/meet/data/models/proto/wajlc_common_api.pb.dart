// This is a generated file - do not edit.
//
// Generated from wajlc_common_api.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_common_api.pbenum.dart';
import 'wajlc_datamessage.pbenum.dart' as $1;
import 'wajlc_nats_msg.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'wajlc_common_api.pbenum.dart';

class CommonResponse extends $pb.GeneratedMessage {
  factory CommonResponse({
    $core.bool? status,
    $core.String? msg,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    return result;
  }

  CommonResponse._();

  factory CommonResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommonResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommonResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonResponse clone() => CommonResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonResponse copyWith(void Function(CommonResponse) updates) =>
      super.copyWith((message) => updates(message as CommonResponse))
          as CommonResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommonResponse create() => CommonResponse._();
  @$core.override
  CommonResponse createEmptyInstance() => create();
  static $pb.PbList<CommonResponse> createRepeated() =>
      $pb.PbList<CommonResponse>();
  @$core.pragma('dart2js:noInline')
  static CommonResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonResponse>(create);
  static CommonResponse? _defaultInstance;

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
}

class VerifyTokenReq extends $pb.GeneratedMessage {
  factory VerifyTokenReq({
    $core.bool? isProduction,
  }) {
    final result = create();
    if (isProduction != null) result.isProduction = isProduction;
    return result;
  }

  VerifyTokenReq._();

  factory VerifyTokenReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VerifyTokenReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VerifyTokenReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isProduction')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyTokenReq clone() => VerifyTokenReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyTokenReq copyWith(void Function(VerifyTokenReq) updates) =>
      super.copyWith((message) => updates(message as VerifyTokenReq))
          as VerifyTokenReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyTokenReq create() => VerifyTokenReq._();
  @$core.override
  VerifyTokenReq createEmptyInstance() => create();
  static $pb.PbList<VerifyTokenReq> createRepeated() =>
      $pb.PbList<VerifyTokenReq>();
  @$core.pragma('dart2js:noInline')
  static VerifyTokenReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VerifyTokenReq>(create);
  static VerifyTokenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isProduction => $_getBF(0);
  @$pb.TagNumber(1)
  set isProduction($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsProduction() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsProduction() => $_clearField(1);
}

class VerifyTokenRes extends $pb.GeneratedMessage {
  factory VerifyTokenRes({
    $core.bool? status,
    $core.String? msg,
    $core.Iterable<$core.String>? natsWsUrls,
    $core.String? serverVersion,
    $core.String? roomId,
    $core.String? userId,
    $core.String? roomStreamName,
    $0.NatsSubjects? natsSubjects,
    $core.bool? enabledSelfInsertEncryptionKey,
    $core.bool? isCloud,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (natsWsUrls != null) result.natsWsUrls.addAll(natsWsUrls);
    if (serverVersion != null) result.serverVersion = serverVersion;
    if (roomId != null) result.roomId = roomId;
    if (userId != null) result.userId = userId;
    if (roomStreamName != null) result.roomStreamName = roomStreamName;
    if (natsSubjects != null) result.natsSubjects = natsSubjects;
    if (enabledSelfInsertEncryptionKey != null)
      result.enabledSelfInsertEncryptionKey = enabledSelfInsertEncryptionKey;
    if (isCloud != null) result.isCloud = isCloud;
    return result;
  }

  VerifyTokenRes._();

  factory VerifyTokenRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VerifyTokenRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VerifyTokenRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..pPS(3, _omitFieldNames ? '' : 'natsWsUrls')
    ..aOS(4, _omitFieldNames ? '' : 'serverVersion')
    ..aOS(5, _omitFieldNames ? '' : 'roomId')
    ..aOS(6, _omitFieldNames ? '' : 'userId')
    ..aOS(7, _omitFieldNames ? '' : 'roomStreamName')
    ..aOM<$0.NatsSubjects>(8, _omitFieldNames ? '' : 'natsSubjects',
        subBuilder: $0.NatsSubjects.create)
    ..aOB(9, _omitFieldNames ? '' : 'enabledSelfInsertEncryptionKey')
    ..aOB(10, _omitFieldNames ? '' : 'isCloud')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyTokenRes clone() => VerifyTokenRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyTokenRes copyWith(void Function(VerifyTokenRes) updates) =>
      super.copyWith((message) => updates(message as VerifyTokenRes))
          as VerifyTokenRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyTokenRes create() => VerifyTokenRes._();
  @$core.override
  VerifyTokenRes createEmptyInstance() => create();
  static $pb.PbList<VerifyTokenRes> createRepeated() =>
      $pb.PbList<VerifyTokenRes>();
  @$core.pragma('dart2js:noInline')
  static VerifyTokenRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VerifyTokenRes>(create);
  static VerifyTokenRes? _defaultInstance;

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
  $pb.PbList<$core.String> get natsWsUrls => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get serverVersion => $_getSZ(3);
  @$pb.TagNumber(4)
  set serverVersion($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasServerVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearServerVersion() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get roomId => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRoomId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get userId => $_getSZ(5);
  @$pb.TagNumber(6)
  set userId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasUserId() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get roomStreamName => $_getSZ(6);
  @$pb.TagNumber(7)
  set roomStreamName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRoomStreamName() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoomStreamName() => $_clearField(7);

  @$pb.TagNumber(8)
  $0.NatsSubjects get natsSubjects => $_getN(7);
  @$pb.TagNumber(8)
  set natsSubjects($0.NatsSubjects value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasNatsSubjects() => $_has(7);
  @$pb.TagNumber(8)
  void clearNatsSubjects() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.NatsSubjects ensureNatsSubjects() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.bool get enabledSelfInsertEncryptionKey => $_getBF(8);
  @$pb.TagNumber(9)
  set enabledSelfInsertEncryptionKey($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasEnabledSelfInsertEncryptionKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearEnabledSelfInsertEncryptionKey() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isCloud => $_getBF(9);
  @$pb.TagNumber(10)
  set isCloud($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasIsCloud() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsCloud() => $_clearField(10);
}

class MuteUnMuteTrackReq extends $pb.GeneratedMessage {
  factory MuteUnMuteTrackReq({
    $core.String? sid,
    $core.String? roomId,
    $core.String? userId,
    $core.String? trackSid,
    $core.bool? muted,
    $core.String? requestedUserId,
  }) {
    final result = create();
    if (sid != null) result.sid = sid;
    if (roomId != null) result.roomId = roomId;
    if (userId != null) result.userId = userId;
    if (trackSid != null) result.trackSid = trackSid;
    if (muted != null) result.muted = muted;
    if (requestedUserId != null) result.requestedUserId = requestedUserId;
    return result;
  }

  MuteUnMuteTrackReq._();

  factory MuteUnMuteTrackReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MuteUnMuteTrackReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MuteUnMuteTrackReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sid')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'trackSid')
    ..aOB(5, _omitFieldNames ? '' : 'muted')
    ..aOS(6, _omitFieldNames ? '' : 'requestedUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MuteUnMuteTrackReq clone() => MuteUnMuteTrackReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MuteUnMuteTrackReq copyWith(void Function(MuteUnMuteTrackReq) updates) =>
      super.copyWith((message) => updates(message as MuteUnMuteTrackReq))
          as MuteUnMuteTrackReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MuteUnMuteTrackReq create() => MuteUnMuteTrackReq._();
  @$core.override
  MuteUnMuteTrackReq createEmptyInstance() => create();
  static $pb.PbList<MuteUnMuteTrackReq> createRepeated() =>
      $pb.PbList<MuteUnMuteTrackReq>();
  @$core.pragma('dart2js:noInline')
  static MuteUnMuteTrackReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MuteUnMuteTrackReq>(create);
  static MuteUnMuteTrackReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sid => $_getSZ(0);
  @$pb.TagNumber(1)
  set sid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get trackSid => $_getSZ(3);
  @$pb.TagNumber(4)
  set trackSid($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTrackSid() => $_has(3);
  @$pb.TagNumber(4)
  void clearTrackSid() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get muted => $_getBF(4);
  @$pb.TagNumber(5)
  set muted($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMuted() => $_has(4);
  @$pb.TagNumber(5)
  void clearMuted() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get requestedUserId => $_getSZ(5);
  @$pb.TagNumber(6)
  set requestedUserId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRequestedUserId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRequestedUserId() => $_clearField(6);
}

class RemoveParticipantReq extends $pb.GeneratedMessage {
  factory RemoveParticipantReq({
    $core.String? sid,
    $core.String? roomId,
    $core.String? userId,
    $core.String? msg,
    $core.bool? blockUser,
  }) {
    final result = create();
    if (sid != null) result.sid = sid;
    if (roomId != null) result.roomId = roomId;
    if (userId != null) result.userId = userId;
    if (msg != null) result.msg = msg;
    if (blockUser != null) result.blockUser = blockUser;
    return result;
  }

  RemoveParticipantReq._();

  factory RemoveParticipantReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveParticipantReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveParticipantReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sid')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'msg')
    ..aOB(5, _omitFieldNames ? '' : 'blockUser')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveParticipantReq clone() =>
      RemoveParticipantReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveParticipantReq copyWith(void Function(RemoveParticipantReq) updates) =>
      super.copyWith((message) => updates(message as RemoveParticipantReq))
          as RemoveParticipantReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveParticipantReq create() => RemoveParticipantReq._();
  @$core.override
  RemoveParticipantReq createEmptyInstance() => create();
  static $pb.PbList<RemoveParticipantReq> createRepeated() =>
      $pb.PbList<RemoveParticipantReq>();
  @$core.pragma('dart2js:noInline')
  static RemoveParticipantReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveParticipantReq>(create);
  static RemoveParticipantReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sid => $_getSZ(0);
  @$pb.TagNumber(1)
  set sid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get msg => $_getSZ(3);
  @$pb.TagNumber(4)
  set msg($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearMsg() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get blockUser => $_getBF(4);
  @$pb.TagNumber(5)
  set blockUser($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBlockUser() => $_has(4);
  @$pb.TagNumber(5)
  void clearBlockUser() => $_clearField(5);
}

class DataMessageReq extends $pb.GeneratedMessage {
  factory DataMessageReq({
    $core.String? roomId,
    $core.String? roomSid,
    $core.String? userId,
    $core.String? userSid,
    $1.DataMsgBodyType? msgBodyType,
    $core.String? msg,
    $core.String? requestedUserId,
    $core.Iterable<$core.String>? sendTo,
    $core.bool? isAdmin,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (roomSid != null) result.roomSid = roomSid;
    if (userId != null) result.userId = userId;
    if (userSid != null) result.userSid = userSid;
    if (msgBodyType != null) result.msgBodyType = msgBodyType;
    if (msg != null) result.msg = msg;
    if (requestedUserId != null) result.requestedUserId = requestedUserId;
    if (sendTo != null) result.sendTo.addAll(sendTo);
    if (isAdmin != null) result.isAdmin = isAdmin;
    return result;
  }

  DataMessageReq._();

  factory DataMessageReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DataMessageReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DataMessageReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'roomSid')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'userSid')
    ..e<$1.DataMsgBodyType>(
        5, _omitFieldNames ? '' : 'msgBodyType', $pb.PbFieldType.OE,
        defaultOrMaker: $1.DataMsgBodyType.UNKNOWN,
        valueOf: $1.DataMsgBodyType.valueOf,
        enumValues: $1.DataMsgBodyType.values)
    ..aOS(6, _omitFieldNames ? '' : 'msg')
    ..aOS(7, _omitFieldNames ? '' : 'requestedUserId')
    ..pPS(8, _omitFieldNames ? '' : 'sendTo')
    ..aOB(9, _omitFieldNames ? '' : 'isAdmin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DataMessageReq clone() => DataMessageReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DataMessageReq copyWith(void Function(DataMessageReq) updates) =>
      super.copyWith((message) => updates(message as DataMessageReq))
          as DataMessageReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DataMessageReq create() => DataMessageReq._();
  @$core.override
  DataMessageReq createEmptyInstance() => create();
  static $pb.PbList<DataMessageReq> createRepeated() =>
      $pb.PbList<DataMessageReq>();
  @$core.pragma('dart2js:noInline')
  static DataMessageReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DataMessageReq>(create);
  static DataMessageReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomSid => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomSid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomSid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomSid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get userSid => $_getSZ(3);
  @$pb.TagNumber(4)
  set userSid($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserSid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserSid() => $_clearField(4);

  @$pb.TagNumber(5)
  $1.DataMsgBodyType get msgBodyType => $_getN(4);
  @$pb.TagNumber(5)
  set msgBodyType($1.DataMsgBodyType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasMsgBodyType() => $_has(4);
  @$pb.TagNumber(5)
  void clearMsgBodyType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get msg => $_getSZ(5);
  @$pb.TagNumber(6)
  set msg($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMsg() => $_has(5);
  @$pb.TagNumber(6)
  void clearMsg() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get requestedUserId => $_getSZ(6);
  @$pb.TagNumber(7)
  set requestedUserId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRequestedUserId() => $_has(6);
  @$pb.TagNumber(7)
  void clearRequestedUserId() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get sendTo => $_getList(7);

  @$pb.TagNumber(9)
  $core.bool get isAdmin => $_getBF(8);
  @$pb.TagNumber(9)
  set isAdmin($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIsAdmin() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsAdmin() => $_clearField(9);
}

class RoomEndAPIReq extends $pb.GeneratedMessage {
  factory RoomEndAPIReq({
    $core.String? roomId,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  RoomEndAPIReq._();

  factory RoomEndAPIReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomEndAPIReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomEndAPIReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEndAPIReq clone() => RoomEndAPIReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEndAPIReq copyWith(void Function(RoomEndAPIReq) updates) =>
      super.copyWith((message) => updates(message as RoomEndAPIReq))
          as RoomEndAPIReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomEndAPIReq create() => RoomEndAPIReq._();
  @$core.override
  RoomEndAPIReq createEmptyInstance() => create();
  static $pb.PbList<RoomEndAPIReq> createRepeated() =>
      $pb.PbList<RoomEndAPIReq>();
  @$core.pragma('dart2js:noInline')
  static RoomEndAPIReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomEndAPIReq>(create);
  static RoomEndAPIReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);
}

class ChangeVisibilityRes extends $pb.GeneratedMessage {
  factory ChangeVisibilityRes({
    $core.String? roomId,
    $core.bool? visibleNotepad,
    $core.bool? visibleWhiteBoard,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (visibleNotepad != null) result.visibleNotepad = visibleNotepad;
    if (visibleWhiteBoard != null) result.visibleWhiteBoard = visibleWhiteBoard;
    return result;
  }

  ChangeVisibilityRes._();

  factory ChangeVisibilityRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChangeVisibilityRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChangeVisibilityRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOB(2, _omitFieldNames ? '' : 'visibleNotepad')
    ..aOB(3, _omitFieldNames ? '' : 'visibleWhiteBoard')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangeVisibilityRes clone() => ChangeVisibilityRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangeVisibilityRes copyWith(void Function(ChangeVisibilityRes) updates) =>
      super.copyWith((message) => updates(message as ChangeVisibilityRes))
          as ChangeVisibilityRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeVisibilityRes create() => ChangeVisibilityRes._();
  @$core.override
  ChangeVisibilityRes createEmptyInstance() => create();
  static $pb.PbList<ChangeVisibilityRes> createRepeated() =>
      $pb.PbList<ChangeVisibilityRes>();
  @$core.pragma('dart2js:noInline')
  static ChangeVisibilityRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChangeVisibilityRes>(create);
  static ChangeVisibilityRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get visibleNotepad => $_getBF(1);
  @$pb.TagNumber(2)
  set visibleNotepad($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVisibleNotepad() => $_has(1);
  @$pb.TagNumber(2)
  void clearVisibleNotepad() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get visibleWhiteBoard => $_getBF(2);
  @$pb.TagNumber(3)
  set visibleWhiteBoard($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVisibleWhiteBoard() => $_has(2);
  @$pb.TagNumber(3)
  void clearVisibleWhiteBoard() => $_clearField(3);
}

class SwitchPresenterReq extends $pb.GeneratedMessage {
  factory SwitchPresenterReq({
    SwitchPresenterTask? task,
    $core.String? userId,
    $core.String? roomId,
    $core.String? requestedUserId,
  }) {
    final result = create();
    if (task != null) result.task = task;
    if (userId != null) result.userId = userId;
    if (roomId != null) result.roomId = roomId;
    if (requestedUserId != null) result.requestedUserId = requestedUserId;
    return result;
  }

  SwitchPresenterReq._();

  factory SwitchPresenterReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SwitchPresenterReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SwitchPresenterReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..e<SwitchPresenterTask>(
        1, _omitFieldNames ? '' : 'task', $pb.PbFieldType.OE,
        defaultOrMaker: SwitchPresenterTask.PROMOTE,
        valueOf: SwitchPresenterTask.valueOf,
        enumValues: SwitchPresenterTask.values)
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..aOS(4, _omitFieldNames ? '' : 'requestedUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SwitchPresenterReq clone() => SwitchPresenterReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SwitchPresenterReq copyWith(void Function(SwitchPresenterReq) updates) =>
      super.copyWith((message) => updates(message as SwitchPresenterReq))
          as SwitchPresenterReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SwitchPresenterReq create() => SwitchPresenterReq._();
  @$core.override
  SwitchPresenterReq createEmptyInstance() => create();
  static $pb.PbList<SwitchPresenterReq> createRepeated() =>
      $pb.PbList<SwitchPresenterReq>();
  @$core.pragma('dart2js:noInline')
  static SwitchPresenterReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SwitchPresenterReq>(create);
  static SwitchPresenterReq? _defaultInstance;

  @$pb.TagNumber(1)
  SwitchPresenterTask get task => $_getN(0);
  @$pb.TagNumber(1)
  set task(SwitchPresenterTask value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => $_clearField(1);

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
  $core.String get requestedUserId => $_getSZ(3);
  @$pb.TagNumber(4)
  set requestedUserId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRequestedUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequestedUserId() => $_clearField(4);
}

class ExternalMediaPlayerReq extends $pb.GeneratedMessage {
  factory ExternalMediaPlayerReq({
    ExternalMediaPlayerTask? task,
    $core.String? url,
    $core.double? seekTo,
    $core.String? roomId,
    $core.String? userId,
  }) {
    final result = create();
    if (task != null) result.task = task;
    if (url != null) result.url = url;
    if (seekTo != null) result.seekTo = seekTo;
    if (roomId != null) result.roomId = roomId;
    if (userId != null) result.userId = userId;
    return result;
  }

  ExternalMediaPlayerReq._();

  factory ExternalMediaPlayerReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExternalMediaPlayerReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExternalMediaPlayerReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..e<ExternalMediaPlayerTask>(
        1, _omitFieldNames ? '' : 'task', $pb.PbFieldType.OE,
        defaultOrMaker: ExternalMediaPlayerTask.START_PLAYBACK,
        valueOf: ExternalMediaPlayerTask.valueOf,
        enumValues: ExternalMediaPlayerTask.values)
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'seekTo', $pb.PbFieldType.OD)
    ..aOS(4, _omitFieldNames ? '' : 'roomId')
    ..aOS(5, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExternalMediaPlayerReq clone() =>
      ExternalMediaPlayerReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExternalMediaPlayerReq copyWith(
          void Function(ExternalMediaPlayerReq) updates) =>
      super.copyWith((message) => updates(message as ExternalMediaPlayerReq))
          as ExternalMediaPlayerReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExternalMediaPlayerReq create() => ExternalMediaPlayerReq._();
  @$core.override
  ExternalMediaPlayerReq createEmptyInstance() => create();
  static $pb.PbList<ExternalMediaPlayerReq> createRepeated() =>
      $pb.PbList<ExternalMediaPlayerReq>();
  @$core.pragma('dart2js:noInline')
  static ExternalMediaPlayerReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExternalMediaPlayerReq>(create);
  static ExternalMediaPlayerReq? _defaultInstance;

  @$pb.TagNumber(1)
  ExternalMediaPlayerTask get task => $_getN(0);
  @$pb.TagNumber(1)
  set task(ExternalMediaPlayerTask value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get seekTo => $_getN(2);
  @$pb.TagNumber(3)
  set seekTo($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSeekTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeekTo() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomId => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get userId => $_getSZ(4);
  @$pb.TagNumber(5)
  set userId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserId() => $_clearField(5);
}

class ExternalDisplayLinkReq extends $pb.GeneratedMessage {
  factory ExternalDisplayLinkReq({
    ExternalDisplayLinkTask? task,
    $core.String? url,
    $core.String? roomId,
    $core.String? userId,
  }) {
    final result = create();
    if (task != null) result.task = task;
    if (url != null) result.url = url;
    if (roomId != null) result.roomId = roomId;
    if (userId != null) result.userId = userId;
    return result;
  }

  ExternalDisplayLinkReq._();

  factory ExternalDisplayLinkReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExternalDisplayLinkReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExternalDisplayLinkReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..e<ExternalDisplayLinkTask>(
        1, _omitFieldNames ? '' : 'task', $pb.PbFieldType.OE,
        defaultOrMaker: ExternalDisplayLinkTask.START_EXTERNAL_LINK,
        valueOf: ExternalDisplayLinkTask.valueOf,
        enumValues: ExternalDisplayLinkTask.values)
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..aOS(4, _omitFieldNames ? '' : 'roomId')
    ..aOS(5, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExternalDisplayLinkReq clone() =>
      ExternalDisplayLinkReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExternalDisplayLinkReq copyWith(
          void Function(ExternalDisplayLinkReq) updates) =>
      super.copyWith((message) => updates(message as ExternalDisplayLinkReq))
          as ExternalDisplayLinkReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExternalDisplayLinkReq create() => ExternalDisplayLinkReq._();
  @$core.override
  ExternalDisplayLinkReq createEmptyInstance() => create();
  static $pb.PbList<ExternalDisplayLinkReq> createRepeated() =>
      $pb.PbList<ExternalDisplayLinkReq>();
  @$core.pragma('dart2js:noInline')
  static ExternalDisplayLinkReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExternalDisplayLinkReq>(create);
  static ExternalDisplayLinkReq? _defaultInstance;

  @$pb.TagNumber(1)
  ExternalDisplayLinkTask get task => $_getN(0);
  @$pb.TagNumber(1)
  set task(ExternalDisplayLinkTask value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);

  @$pb.TagNumber(4)
  $core.String get roomId => $_getSZ(2);
  @$pb.TagNumber(4)
  set roomId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(4)
  void clearRoomId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get userId => $_getSZ(3);
  @$pb.TagNumber(5)
  set userId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(5)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(5)
  void clearUserId() => $_clearField(5);
}

class CreateEtherpadSessionRes extends $pb.GeneratedMessage {
  factory CreateEtherpadSessionRes({
    $core.bool? status,
    $core.String? msg,
    $core.String? padId,
    $core.String? readonlyPadId,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (padId != null) result.padId = padId;
    if (readonlyPadId != null) result.readonlyPadId = readonlyPadId;
    return result;
  }

  CreateEtherpadSessionRes._();

  factory CreateEtherpadSessionRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateEtherpadSessionRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateEtherpadSessionRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'padId')
    ..aOS(4, _omitFieldNames ? '' : 'readonlyPadId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateEtherpadSessionRes clone() =>
      CreateEtherpadSessionRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateEtherpadSessionRes copyWith(
          void Function(CreateEtherpadSessionRes) updates) =>
      super.copyWith((message) => updates(message as CreateEtherpadSessionRes))
          as CreateEtherpadSessionRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateEtherpadSessionRes create() => CreateEtherpadSessionRes._();
  @$core.override
  CreateEtherpadSessionRes createEmptyInstance() => create();
  static $pb.PbList<CreateEtherpadSessionRes> createRepeated() =>
      $pb.PbList<CreateEtherpadSessionRes>();
  @$core.pragma('dart2js:noInline')
  static CreateEtherpadSessionRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateEtherpadSessionRes>(create);
  static CreateEtherpadSessionRes? _defaultInstance;

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
  $core.String get padId => $_getSZ(2);
  @$pb.TagNumber(3)
  set padId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPadId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPadId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get readonlyPadId => $_getSZ(3);
  @$pb.TagNumber(4)
  set readonlyPadId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReadonlyPadId() => $_has(3);
  @$pb.TagNumber(4)
  void clearReadonlyPadId() => $_clearField(4);
}

class CleanEtherpadReq extends $pb.GeneratedMessage {
  factory CleanEtherpadReq({
    $core.String? roomId,
    $core.String? nodeId,
    $core.String? padId,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (nodeId != null) result.nodeId = nodeId;
    if (padId != null) result.padId = padId;
    return result;
  }

  CleanEtherpadReq._();

  factory CleanEtherpadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CleanEtherpadReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CleanEtherpadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'nodeId')
    ..aOS(3, _omitFieldNames ? '' : 'padId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CleanEtherpadReq clone() => CleanEtherpadReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CleanEtherpadReq copyWith(void Function(CleanEtherpadReq) updates) =>
      super.copyWith((message) => updates(message as CleanEtherpadReq))
          as CleanEtherpadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CleanEtherpadReq create() => CleanEtherpadReq._();
  @$core.override
  CleanEtherpadReq createEmptyInstance() => create();
  static $pb.PbList<CleanEtherpadReq> createRepeated() =>
      $pb.PbList<CleanEtherpadReq>();
  @$core.pragma('dart2js:noInline')
  static CleanEtherpadReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CleanEtherpadReq>(create);
  static CleanEtherpadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nodeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set nodeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNodeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNodeId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get padId => $_getSZ(2);
  @$pb.TagNumber(3)
  set padId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPadId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPadId() => $_clearField(3);
}

class ChangeEtherpadStatusReq extends $pb.GeneratedMessage {
  factory ChangeEtherpadStatusReq({
    $core.String? roomId,
    $core.bool? isActive,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (isActive != null) result.isActive = isActive;
    return result;
  }

  ChangeEtherpadStatusReq._();

  factory ChangeEtherpadStatusReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChangeEtherpadStatusReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChangeEtherpadStatusReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangeEtherpadStatusReq clone() =>
      ChangeEtherpadStatusReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangeEtherpadStatusReq copyWith(
          void Function(ChangeEtherpadStatusReq) updates) =>
      super.copyWith((message) => updates(message as ChangeEtherpadStatusReq))
          as ChangeEtherpadStatusReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeEtherpadStatusReq create() => ChangeEtherpadStatusReq._();
  @$core.override
  ChangeEtherpadStatusReq createEmptyInstance() => create();
  static $pb.PbList<ChangeEtherpadStatusReq> createRepeated() =>
      $pb.PbList<ChangeEtherpadStatusReq>();
  @$core.pragma('dart2js:noInline')
  static ChangeEtherpadStatusReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChangeEtherpadStatusReq>(create);
  static ChangeEtherpadStatusReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => $_clearField(2);
}

class ApproveWaitingUsersReq extends $pb.GeneratedMessage {
  factory ApproveWaitingUsersReq({
    $core.String? roomId,
    $core.String? userId,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (userId != null) result.userId = userId;
    return result;
  }

  ApproveWaitingUsersReq._();

  factory ApproveWaitingUsersReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ApproveWaitingUsersReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApproveWaitingUsersReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApproveWaitingUsersReq clone() =>
      ApproveWaitingUsersReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApproveWaitingUsersReq copyWith(
          void Function(ApproveWaitingUsersReq) updates) =>
      super.copyWith((message) => updates(message as ApproveWaitingUsersReq))
          as ApproveWaitingUsersReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApproveWaitingUsersReq create() => ApproveWaitingUsersReq._();
  @$core.override
  ApproveWaitingUsersReq createEmptyInstance() => create();
  static $pb.PbList<ApproveWaitingUsersReq> createRepeated() =>
      $pb.PbList<ApproveWaitingUsersReq>();
  @$core.pragma('dart2js:noInline')
  static ApproveWaitingUsersReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApproveWaitingUsersReq>(create);
  static ApproveWaitingUsersReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);
}

class UpdateWaitingRoomMessageReq extends $pb.GeneratedMessage {
  factory UpdateWaitingRoomMessageReq({
    $core.String? roomId,
    $core.String? msg,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (msg != null) result.msg = msg;
    return result;
  }

  UpdateWaitingRoomMessageReq._();

  factory UpdateWaitingRoomMessageReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateWaitingRoomMessageReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateWaitingRoomMessageReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateWaitingRoomMessageReq clone() =>
      UpdateWaitingRoomMessageReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateWaitingRoomMessageReq copyWith(
          void Function(UpdateWaitingRoomMessageReq) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateWaitingRoomMessageReq))
          as UpdateWaitingRoomMessageReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateWaitingRoomMessageReq create() =>
      UpdateWaitingRoomMessageReq._();
  @$core.override
  UpdateWaitingRoomMessageReq createEmptyInstance() => create();
  static $pb.PbList<UpdateWaitingRoomMessageReq> createRepeated() =>
      $pb.PbList<UpdateWaitingRoomMessageReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateWaitingRoomMessageReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateWaitingRoomMessageReq>(create);
  static UpdateWaitingRoomMessageReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => $_clearField(2);
}

class UpdateUserLockSettingsReq extends $pb.GeneratedMessage {
  factory UpdateUserLockSettingsReq({
    $core.String? roomSid,
    $core.String? roomId,
    $core.String? userId,
    $core.String? service,
    $core.String? direction,
    $core.String? requestedUserId,
  }) {
    final result = create();
    if (roomSid != null) result.roomSid = roomSid;
    if (roomId != null) result.roomId = roomId;
    if (userId != null) result.userId = userId;
    if (service != null) result.service = service;
    if (direction != null) result.direction = direction;
    if (requestedUserId != null) result.requestedUserId = requestedUserId;
    return result;
  }

  UpdateUserLockSettingsReq._();

  factory UpdateUserLockSettingsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateUserLockSettingsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateUserLockSettingsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomSid')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'service')
    ..aOS(5, _omitFieldNames ? '' : 'direction')
    ..aOS(6, _omitFieldNames ? '' : 'requestedUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateUserLockSettingsReq clone() =>
      UpdateUserLockSettingsReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateUserLockSettingsReq copyWith(
          void Function(UpdateUserLockSettingsReq) updates) =>
      super.copyWith((message) => updates(message as UpdateUserLockSettingsReq))
          as UpdateUserLockSettingsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserLockSettingsReq create() => UpdateUserLockSettingsReq._();
  @$core.override
  UpdateUserLockSettingsReq createEmptyInstance() => create();
  static $pb.PbList<UpdateUserLockSettingsReq> createRepeated() =>
      $pb.PbList<UpdateUserLockSettingsReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserLockSettingsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateUserLockSettingsReq>(create);
  static UpdateUserLockSettingsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomSid => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomSid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomSid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomSid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get service => $_getSZ(3);
  @$pb.TagNumber(4)
  set service($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasService() => $_has(3);
  @$pb.TagNumber(4)
  void clearService() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get direction => $_getSZ(4);
  @$pb.TagNumber(5)
  set direction($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDirection() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirection() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get requestedUserId => $_getSZ(5);
  @$pb.TagNumber(6)
  set requestedUserId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRequestedUserId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRequestedUserId() => $_clearField(6);
}

class UploadBase64EncodedDataReq extends $pb.GeneratedMessage {
  factory UploadBase64EncodedDataReq({
    $core.String? roomId,
    $core.String? data,
    $core.String? fileName,
    RoomUploadedFileType? fileType,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (data != null) result.data = data;
    if (fileName != null) result.fileName = fileName;
    if (fileType != null) result.fileType = fileType;
    return result;
  }

  UploadBase64EncodedDataReq._();

  factory UploadBase64EncodedDataReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadBase64EncodedDataReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadBase64EncodedDataReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'data')
    ..aOS(4, _omitFieldNames ? '' : 'fileName')
    ..e<RoomUploadedFileType>(
        5, _omitFieldNames ? '' : 'fileType', $pb.PbFieldType.OE,
        defaultOrMaker: RoomUploadedFileType.CHAT_FILE,
        valueOf: RoomUploadedFileType.valueOf,
        enumValues: RoomUploadedFileType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadBase64EncodedDataReq clone() =>
      UploadBase64EncodedDataReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadBase64EncodedDataReq copyWith(
          void Function(UploadBase64EncodedDataReq) updates) =>
      super.copyWith(
              (message) => updates(message as UploadBase64EncodedDataReq))
          as UploadBase64EncodedDataReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadBase64EncodedDataReq create() => UploadBase64EncodedDataReq._();
  @$core.override
  UploadBase64EncodedDataReq createEmptyInstance() => create();
  static $pb.PbList<UploadBase64EncodedDataReq> createRepeated() =>
      $pb.PbList<UploadBase64EncodedDataReq>();
  @$core.pragma('dart2js:noInline')
  static UploadBase64EncodedDataReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadBase64EncodedDataReq>(create);
  static UploadBase64EncodedDataReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.String get data => $_getSZ(1);
  @$pb.TagNumber(3)
  set data($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get fileName => $_getSZ(2);
  @$pb.TagNumber(4)
  set fileName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(4)
  $core.bool hasFileName() => $_has(2);
  @$pb.TagNumber(4)
  void clearFileName() => $_clearField(4);

  @$pb.TagNumber(5)
  RoomUploadedFileType get fileType => $_getN(3);
  @$pb.TagNumber(5)
  set fileType(RoomUploadedFileType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasFileType() => $_has(3);
  @$pb.TagNumber(5)
  void clearFileType() => $_clearField(5);
}

class UploadBase64EncodedDataRes extends $pb.GeneratedMessage {
  factory UploadBase64EncodedDataRes({
    $core.bool? status,
    $core.String? msg,
    $core.String? filePath,
    $core.String? fileName,
    $core.String? fileExtension,
    $core.String? fileMimeType,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (filePath != null) result.filePath = filePath;
    if (fileName != null) result.fileName = fileName;
    if (fileExtension != null) result.fileExtension = fileExtension;
    if (fileMimeType != null) result.fileMimeType = fileMimeType;
    return result;
  }

  UploadBase64EncodedDataRes._();

  factory UploadBase64EncodedDataRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadBase64EncodedDataRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadBase64EncodedDataRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'filePath')
    ..aOS(4, _omitFieldNames ? '' : 'fileName')
    ..aOS(5, _omitFieldNames ? '' : 'fileExtension')
    ..aOS(6, _omitFieldNames ? '' : 'fileMimeType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadBase64EncodedDataRes clone() =>
      UploadBase64EncodedDataRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadBase64EncodedDataRes copyWith(
          void Function(UploadBase64EncodedDataRes) updates) =>
      super.copyWith(
              (message) => updates(message as UploadBase64EncodedDataRes))
          as UploadBase64EncodedDataRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadBase64EncodedDataRes create() => UploadBase64EncodedDataRes._();
  @$core.override
  UploadBase64EncodedDataRes createEmptyInstance() => create();
  static $pb.PbList<UploadBase64EncodedDataRes> createRepeated() =>
      $pb.PbList<UploadBase64EncodedDataRes>();
  @$core.pragma('dart2js:noInline')
  static UploadBase64EncodedDataRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadBase64EncodedDataRes>(create);
  static UploadBase64EncodedDataRes? _defaultInstance;

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
  $core.String get filePath => $_getSZ(2);
  @$pb.TagNumber(3)
  set filePath($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFilePath() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilePath() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get fileName => $_getSZ(3);
  @$pb.TagNumber(4)
  set fileName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFileName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFileName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get fileExtension => $_getSZ(4);
  @$pb.TagNumber(5)
  set fileExtension($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFileExtension() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileExtension() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get fileMimeType => $_getSZ(5);
  @$pb.TagNumber(6)
  set fileMimeType($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFileMimeType() => $_has(5);
  @$pb.TagNumber(6)
  void clearFileMimeType() => $_clearField(6);
}

class UploadedFileMergeReq extends $pb.GeneratedMessage {
  factory UploadedFileMergeReq({
    $core.String? roomSid,
    $core.String? roomId,
    RoomUploadedFileType? fileType,
    $core.String? resumableIdentifier,
    $core.String? resumableFilename,
    $core.int? resumableTotalChunks,
  }) {
    final result = create();
    if (roomSid != null) result.roomSid = roomSid;
    if (roomId != null) result.roomId = roomId;
    if (fileType != null) result.fileType = fileType;
    if (resumableIdentifier != null)
      result.resumableIdentifier = resumableIdentifier;
    if (resumableFilename != null) result.resumableFilename = resumableFilename;
    if (resumableTotalChunks != null)
      result.resumableTotalChunks = resumableTotalChunks;
    return result;
  }

  UploadedFileMergeReq._();

  factory UploadedFileMergeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadedFileMergeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadedFileMergeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomSid')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..e<RoomUploadedFileType>(
        3, _omitFieldNames ? '' : 'fileType', $pb.PbFieldType.OE,
        defaultOrMaker: RoomUploadedFileType.CHAT_FILE,
        valueOf: RoomUploadedFileType.valueOf,
        enumValues: RoomUploadedFileType.values)
    ..aOS(4, _omitFieldNames ? '' : 'resumableIdentifier')
    ..aOS(5, _omitFieldNames ? '' : 'resumableFilename')
    ..a<$core.int>(
        6, _omitFieldNames ? '' : 'resumableTotalChunks', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadedFileMergeReq clone() =>
      UploadedFileMergeReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadedFileMergeReq copyWith(void Function(UploadedFileMergeReq) updates) =>
      super.copyWith((message) => updates(message as UploadedFileMergeReq))
          as UploadedFileMergeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadedFileMergeReq create() => UploadedFileMergeReq._();
  @$core.override
  UploadedFileMergeReq createEmptyInstance() => create();
  static $pb.PbList<UploadedFileMergeReq> createRepeated() =>
      $pb.PbList<UploadedFileMergeReq>();
  @$core.pragma('dart2js:noInline')
  static UploadedFileMergeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadedFileMergeReq>(create);
  static UploadedFileMergeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomSid => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomSid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomSid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomSid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  RoomUploadedFileType get fileType => $_getN(2);
  @$pb.TagNumber(3)
  set fileType(RoomUploadedFileType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFileType() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get resumableIdentifier => $_getSZ(3);
  @$pb.TagNumber(4)
  set resumableIdentifier($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasResumableIdentifier() => $_has(3);
  @$pb.TagNumber(4)
  void clearResumableIdentifier() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get resumableFilename => $_getSZ(4);
  @$pb.TagNumber(5)
  set resumableFilename($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasResumableFilename() => $_has(4);
  @$pb.TagNumber(5)
  void clearResumableFilename() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get resumableTotalChunks => $_getIZ(5);
  @$pb.TagNumber(6)
  set resumableTotalChunks($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasResumableTotalChunks() => $_has(5);
  @$pb.TagNumber(6)
  void clearResumableTotalChunks() => $_clearField(6);
}

class UploadedFileRes extends $pb.GeneratedMessage {
  factory UploadedFileRes({
    $core.bool? status,
    $core.String? msg,
    $core.String? fileId,
    $core.String? filePath,
    $core.String? fileName,
    $core.String? fileExtension,
    $core.String? fileMimeType,
    RoomUploadedFileType? fileType,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (fileId != null) result.fileId = fileId;
    if (filePath != null) result.filePath = filePath;
    if (fileName != null) result.fileName = fileName;
    if (fileExtension != null) result.fileExtension = fileExtension;
    if (fileMimeType != null) result.fileMimeType = fileMimeType;
    if (fileType != null) result.fileType = fileType;
    return result;
  }

  UploadedFileRes._();

  factory UploadedFileRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadedFileRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadedFileRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'fileId')
    ..aOS(4, _omitFieldNames ? '' : 'filePath')
    ..aOS(5, _omitFieldNames ? '' : 'fileName')
    ..aOS(6, _omitFieldNames ? '' : 'fileExtension')
    ..aOS(7, _omitFieldNames ? '' : 'fileMimeType')
    ..e<RoomUploadedFileType>(
        8, _omitFieldNames ? '' : 'fileType', $pb.PbFieldType.OE,
        defaultOrMaker: RoomUploadedFileType.CHAT_FILE,
        valueOf: RoomUploadedFileType.valueOf,
        enumValues: RoomUploadedFileType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadedFileRes clone() => UploadedFileRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadedFileRes copyWith(void Function(UploadedFileRes) updates) =>
      super.copyWith((message) => updates(message as UploadedFileRes))
          as UploadedFileRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadedFileRes create() => UploadedFileRes._();
  @$core.override
  UploadedFileRes createEmptyInstance() => create();
  static $pb.PbList<UploadedFileRes> createRepeated() =>
      $pb.PbList<UploadedFileRes>();
  @$core.pragma('dart2js:noInline')
  static UploadedFileRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadedFileRes>(create);
  static UploadedFileRes? _defaultInstance;

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
  $core.String get fileId => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFileId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get filePath => $_getSZ(3);
  @$pb.TagNumber(4)
  set filePath($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFilePath() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilePath() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get fileName => $_getSZ(4);
  @$pb.TagNumber(5)
  set fileName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFileName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get fileExtension => $_getSZ(5);
  @$pb.TagNumber(6)
  set fileExtension($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFileExtension() => $_has(5);
  @$pb.TagNumber(6)
  void clearFileExtension() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get fileMimeType => $_getSZ(6);
  @$pb.TagNumber(7)
  set fileMimeType($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasFileMimeType() => $_has(6);
  @$pb.TagNumber(7)
  void clearFileMimeType() => $_clearField(7);

  @$pb.TagNumber(8)
  RoomUploadedFileType get fileType => $_getN(7);
  @$pb.TagNumber(8)
  set fileType(RoomUploadedFileType value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasFileType() => $_has(7);
  @$pb.TagNumber(8)
  void clearFileType() => $_clearField(8);
}

class RoomUploadedFileMetadata extends $pb.GeneratedMessage {
  factory RoomUploadedFileMetadata({
    $core.String? fileId,
    $core.String? fileName,
    $core.String? filePath,
    $core.String? mimeType,
    $core.String? uploadedByUserId,
    $core.String? uploadedByName,
    RoomUploadedFileType? fileType,
    $core.int? totalPages,
  }) {
    final result = create();
    if (fileId != null) result.fileId = fileId;
    if (fileName != null) result.fileName = fileName;
    if (filePath != null) result.filePath = filePath;
    if (mimeType != null) result.mimeType = mimeType;
    if (uploadedByUserId != null) result.uploadedByUserId = uploadedByUserId;
    if (uploadedByName != null) result.uploadedByName = uploadedByName;
    if (fileType != null) result.fileType = fileType;
    if (totalPages != null) result.totalPages = totalPages;
    return result;
  }

  RoomUploadedFileMetadata._();

  factory RoomUploadedFileMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomUploadedFileMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomUploadedFileMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileId')
    ..aOS(2, _omitFieldNames ? '' : 'fileName')
    ..aOS(3, _omitFieldNames ? '' : 'filePath')
    ..aOS(4, _omitFieldNames ? '' : 'mimeType')
    ..aOS(5, _omitFieldNames ? '' : 'uploadedByUserId')
    ..aOS(6, _omitFieldNames ? '' : 'uploadedByName')
    ..e<RoomUploadedFileType>(
        7, _omitFieldNames ? '' : 'fileType', $pb.PbFieldType.OE,
        defaultOrMaker: RoomUploadedFileType.CHAT_FILE,
        valueOf: RoomUploadedFileType.valueOf,
        enumValues: RoomUploadedFileType.values)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'totalPages', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomUploadedFileMetadata clone() =>
      RoomUploadedFileMetadata()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomUploadedFileMetadata copyWith(
          void Function(RoomUploadedFileMetadata) updates) =>
      super.copyWith((message) => updates(message as RoomUploadedFileMetadata))
          as RoomUploadedFileMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomUploadedFileMetadata create() => RoomUploadedFileMetadata._();
  @$core.override
  RoomUploadedFileMetadata createEmptyInstance() => create();
  static $pb.PbList<RoomUploadedFileMetadata> createRepeated() =>
      $pb.PbList<RoomUploadedFileMetadata>();
  @$core.pragma('dart2js:noInline')
  static RoomUploadedFileMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomUploadedFileMetadata>(create);
  static RoomUploadedFileMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get filePath => $_getSZ(2);
  @$pb.TagNumber(3)
  set filePath($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFilePath() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilePath() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get mimeType => $_getSZ(3);
  @$pb.TagNumber(4)
  set mimeType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMimeType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMimeType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get uploadedByUserId => $_getSZ(4);
  @$pb.TagNumber(5)
  set uploadedByUserId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUploadedByUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearUploadedByUserId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get uploadedByName => $_getSZ(5);
  @$pb.TagNumber(6)
  set uploadedByName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasUploadedByName() => $_has(5);
  @$pb.TagNumber(6)
  void clearUploadedByName() => $_clearField(6);

  @$pb.TagNumber(7)
  RoomUploadedFileType get fileType => $_getN(6);
  @$pb.TagNumber(7)
  set fileType(RoomUploadedFileType value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasFileType() => $_has(6);
  @$pb.TagNumber(7)
  void clearFileType() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get totalPages => $_getIZ(7);
  @$pb.TagNumber(8)
  set totalPages($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTotalPages() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalPages() => $_clearField(8);
}

class GetRoomUploadedFilesReq extends $pb.GeneratedMessage {
  factory GetRoomUploadedFilesReq({
    $core.String? roomId,
    RoomUploadedFileType? fileType,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (fileType != null) result.fileType = fileType;
    return result;
  }

  GetRoomUploadedFilesReq._();

  factory GetRoomUploadedFilesReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRoomUploadedFilesReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRoomUploadedFilesReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..e<RoomUploadedFileType>(
        2, _omitFieldNames ? '' : 'fileType', $pb.PbFieldType.OE,
        defaultOrMaker: RoomUploadedFileType.CHAT_FILE,
        valueOf: RoomUploadedFileType.valueOf,
        enumValues: RoomUploadedFileType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRoomUploadedFilesReq clone() =>
      GetRoomUploadedFilesReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRoomUploadedFilesReq copyWith(
          void Function(GetRoomUploadedFilesReq) updates) =>
      super.copyWith((message) => updates(message as GetRoomUploadedFilesReq))
          as GetRoomUploadedFilesReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoomUploadedFilesReq create() => GetRoomUploadedFilesReq._();
  @$core.override
  GetRoomUploadedFilesReq createEmptyInstance() => create();
  static $pb.PbList<GetRoomUploadedFilesReq> createRepeated() =>
      $pb.PbList<GetRoomUploadedFilesReq>();
  @$core.pragma('dart2js:noInline')
  static GetRoomUploadedFilesReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRoomUploadedFilesReq>(create);
  static GetRoomUploadedFilesReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  RoomUploadedFileType get fileType => $_getN(1);
  @$pb.TagNumber(2)
  set fileType(RoomUploadedFileType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFileType() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileType() => $_clearField(2);
}

class GetRoomUploadedFilesRes extends $pb.GeneratedMessage {
  factory GetRoomUploadedFilesRes({
    $core.bool? status,
    $core.String? msg,
    $core.Iterable<RoomUploadedFileMetadata>? files,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (files != null) result.files.addAll(files);
    return result;
  }

  GetRoomUploadedFilesRes._();

  factory GetRoomUploadedFilesRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRoomUploadedFilesRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRoomUploadedFilesRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..pc<RoomUploadedFileMetadata>(
        3, _omitFieldNames ? '' : 'files', $pb.PbFieldType.PM,
        subBuilder: RoomUploadedFileMetadata.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRoomUploadedFilesRes clone() =>
      GetRoomUploadedFilesRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRoomUploadedFilesRes copyWith(
          void Function(GetRoomUploadedFilesRes) updates) =>
      super.copyWith((message) => updates(message as GetRoomUploadedFilesRes))
          as GetRoomUploadedFilesRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoomUploadedFilesRes create() => GetRoomUploadedFilesRes._();
  @$core.override
  GetRoomUploadedFilesRes createEmptyInstance() => create();
  static $pb.PbList<GetRoomUploadedFilesRes> createRepeated() =>
      $pb.PbList<GetRoomUploadedFilesRes>();
  @$core.pragma('dart2js:noInline')
  static GetRoomUploadedFilesRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRoomUploadedFilesRes>(create);
  static GetRoomUploadedFilesRes? _defaultInstance;

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
  $pb.PbList<RoomUploadedFileMetadata> get files => $_getList(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
