// This is a generated file - do not edit.
//
// Generated from wajlc_auth_recording.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_auth_room.pb.dart' as $1;
import 'wajlc_recording.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class FetchRecordingsReq extends $pb.GeneratedMessage {
  factory FetchRecordingsReq({
    $core.Iterable<$core.String>? roomIds,
    $core.String? roomSid,
    $core.int? from,
    $core.int? limit,
    $core.String? orderBy,
  }) {
    final result = create();
    if (roomIds != null) result.roomIds.addAll(roomIds);
    if (roomSid != null) result.roomSid = roomSid;
    if (from != null) result.from = from;
    if (limit != null) result.limit = limit;
    if (orderBy != null) result.orderBy = orderBy;
    return result;
  }

  FetchRecordingsReq._();

  factory FetchRecordingsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchRecordingsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchRecordingsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'roomIds')
    ..aOS(2, _omitFieldNames ? '' : 'roomSid')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'orderBy')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchRecordingsReq clone() => FetchRecordingsReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchRecordingsReq copyWith(void Function(FetchRecordingsReq) updates) =>
      super.copyWith((message) => updates(message as FetchRecordingsReq))
          as FetchRecordingsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchRecordingsReq create() => FetchRecordingsReq._();
  @$core.override
  FetchRecordingsReq createEmptyInstance() => create();
  static $pb.PbList<FetchRecordingsReq> createRepeated() =>
      $pb.PbList<FetchRecordingsReq>();
  @$core.pragma('dart2js:noInline')
  static FetchRecordingsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchRecordingsReq>(create);
  static FetchRecordingsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get roomIds => $_getList(0);

  /// To get information about a particular session
  @$pb.TagNumber(2)
  $core.String get roomSid => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomSid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomSid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomSid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get from => $_getIZ(2);
  @$pb.TagNumber(3)
  set from($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrom() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get limit => $_getIZ(3);
  @$pb.TagNumber(4)
  set limit($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get orderBy => $_getSZ(4);
  @$pb.TagNumber(5)
  set orderBy($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOrderBy() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrderBy() => $_clearField(5);
}

class RecordingInfo extends $pb.GeneratedMessage {
  factory RecordingInfo({
    $core.String? recordId,
    $core.String? roomId,
    $core.String? roomSid,
    $core.String? filePath,
    $core.double? fileSize,
    $fixnum.Int64? creationTime,
    $fixnum.Int64? roomCreationTime,
    $0.RecordingMetadata? metadata,
  }) {
    final result = create();
    if (recordId != null) result.recordId = recordId;
    if (roomId != null) result.roomId = roomId;
    if (roomSid != null) result.roomSid = roomSid;
    if (filePath != null) result.filePath = filePath;
    if (fileSize != null) result.fileSize = fileSize;
    if (creationTime != null) result.creationTime = creationTime;
    if (roomCreationTime != null) result.roomCreationTime = roomCreationTime;
    if (metadata != null) result.metadata = metadata;
    return result;
  }

  RecordingInfo._();

  factory RecordingInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecordingInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordingInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recordId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'roomSid')
    ..aOS(4, _omitFieldNames ? '' : 'filePath')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'fileSize', $pb.PbFieldType.OF)
    ..aInt64(6, _omitFieldNames ? '' : 'creationTime')
    ..aInt64(7, _omitFieldNames ? '' : 'roomCreationTime')
    ..aOM<$0.RecordingMetadata>(8, _omitFieldNames ? '' : 'metadata',
        subBuilder: $0.RecordingMetadata.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingInfo clone() => RecordingInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingInfo copyWith(void Function(RecordingInfo) updates) =>
      super.copyWith((message) => updates(message as RecordingInfo))
          as RecordingInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordingInfo create() => RecordingInfo._();
  @$core.override
  RecordingInfo createEmptyInstance() => create();
  static $pb.PbList<RecordingInfo> createRepeated() =>
      $pb.PbList<RecordingInfo>();
  @$core.pragma('dart2js:noInline')
  static RecordingInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordingInfo>(create);
  static RecordingInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recordId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recordId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomSid => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomSid($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomSid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomSid() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get filePath => $_getSZ(3);
  @$pb.TagNumber(4)
  set filePath($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFilePath() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilePath() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get fileSize => $_getN(4);
  @$pb.TagNumber(5)
  set fileSize($core.double value) => $_setFloat(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFileSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileSize() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get creationTime => $_getI64(5);
  @$pb.TagNumber(6)
  set creationTime($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreationTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreationTime() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get roomCreationTime => $_getI64(6);
  @$pb.TagNumber(7)
  set roomCreationTime($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRoomCreationTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoomCreationTime() => $_clearField(7);

  @$pb.TagNumber(8)
  $0.RecordingMetadata get metadata => $_getN(7);
  @$pb.TagNumber(8)
  set metadata($0.RecordingMetadata value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasMetadata() => $_has(7);
  @$pb.TagNumber(8)
  void clearMetadata() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.RecordingMetadata ensureMetadata() => $_ensure(7);
}

class FetchRecordingsResult extends $pb.GeneratedMessage {
  factory FetchRecordingsResult({
    $fixnum.Int64? totalRecordings,
    $core.int? from,
    $core.int? limit,
    $core.String? orderBy,
    $core.Iterable<RecordingInfo>? recordingsList,
  }) {
    final result = create();
    if (totalRecordings != null) result.totalRecordings = totalRecordings;
    if (from != null) result.from = from;
    if (limit != null) result.limit = limit;
    if (orderBy != null) result.orderBy = orderBy;
    if (recordingsList != null) result.recordingsList.addAll(recordingsList);
    return result;
  }

  FetchRecordingsResult._();

  factory FetchRecordingsResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchRecordingsResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchRecordingsResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalRecordings')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'orderBy')
    ..pc<RecordingInfo>(
        5, _omitFieldNames ? '' : 'recordingsList', $pb.PbFieldType.PM,
        subBuilder: RecordingInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchRecordingsResult clone() =>
      FetchRecordingsResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchRecordingsResult copyWith(
          void Function(FetchRecordingsResult) updates) =>
      super.copyWith((message) => updates(message as FetchRecordingsResult))
          as FetchRecordingsResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchRecordingsResult create() => FetchRecordingsResult._();
  @$core.override
  FetchRecordingsResult createEmptyInstance() => create();
  static $pb.PbList<FetchRecordingsResult> createRepeated() =>
      $pb.PbList<FetchRecordingsResult>();
  @$core.pragma('dart2js:noInline')
  static FetchRecordingsResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchRecordingsResult>(create);
  static FetchRecordingsResult? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalRecordings => $_getI64(0);
  @$pb.TagNumber(1)
  set totalRecordings($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalRecordings() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalRecordings() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get from => $_getIZ(1);
  @$pb.TagNumber(2)
  set from($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get limit => $_getIZ(2);
  @$pb.TagNumber(3)
  set limit($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get orderBy => $_getSZ(3);
  @$pb.TagNumber(4)
  set orderBy($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOrderBy() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrderBy() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<RecordingInfo> get recordingsList => $_getList(4);
}

class FetchRecordingsRes extends $pb.GeneratedMessage {
  factory FetchRecordingsRes({
    $core.bool? status,
    $core.String? msg,
    FetchRecordingsResult? result,
  }) {
    final result$ = create();
    if (status != null) result$.status = status;
    if (msg != null) result$.msg = msg;
    if (result != null) result$.result = result;
    return result$;
  }

  FetchRecordingsRes._();

  factory FetchRecordingsRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchRecordingsRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchRecordingsRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<FetchRecordingsResult>(3, _omitFieldNames ? '' : 'result',
        subBuilder: FetchRecordingsResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchRecordingsRes clone() => FetchRecordingsRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchRecordingsRes copyWith(void Function(FetchRecordingsRes) updates) =>
      super.copyWith((message) => updates(message as FetchRecordingsRes))
          as FetchRecordingsRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchRecordingsRes create() => FetchRecordingsRes._();
  @$core.override
  FetchRecordingsRes createEmptyInstance() => create();
  static $pb.PbList<FetchRecordingsRes> createRepeated() =>
      $pb.PbList<FetchRecordingsRes>();
  @$core.pragma('dart2js:noInline')
  static FetchRecordingsRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchRecordingsRes>(create);
  static FetchRecordingsRes? _defaultInstance;

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
  FetchRecordingsResult get result => $_getN(2);
  @$pb.TagNumber(3)
  set result(FetchRecordingsResult value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearResult() => $_clearField(3);
  @$pb.TagNumber(3)
  FetchRecordingsResult ensureResult() => $_ensure(2);
}

class RecordingInfoReq extends $pb.GeneratedMessage {
  factory RecordingInfoReq({
    $core.String? recordId,
  }) {
    final result = create();
    if (recordId != null) result.recordId = recordId;
    return result;
  }

  RecordingInfoReq._();

  factory RecordingInfoReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecordingInfoReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordingInfoReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recordId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingInfoReq clone() => RecordingInfoReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingInfoReq copyWith(void Function(RecordingInfoReq) updates) =>
      super.copyWith((message) => updates(message as RecordingInfoReq))
          as RecordingInfoReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordingInfoReq create() => RecordingInfoReq._();
  @$core.override
  RecordingInfoReq createEmptyInstance() => create();
  static $pb.PbList<RecordingInfoReq> createRepeated() =>
      $pb.PbList<RecordingInfoReq>();
  @$core.pragma('dart2js:noInline')
  static RecordingInfoReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordingInfoReq>(create);
  static RecordingInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recordId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recordId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordId() => $_clearField(1);
}

class RecordingInfoRes extends $pb.GeneratedMessage {
  factory RecordingInfoRes({
    $core.bool? status,
    $core.String? msg,
    RecordingInfo? recordingInfo,
    $1.PastRoomInfo? roomInfo,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (recordingInfo != null) result.recordingInfo = recordingInfo;
    if (roomInfo != null) result.roomInfo = roomInfo;
    return result;
  }

  RecordingInfoRes._();

  factory RecordingInfoRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecordingInfoRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordingInfoRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<RecordingInfo>(3, _omitFieldNames ? '' : 'recordingInfo',
        subBuilder: RecordingInfo.create)
    ..aOM<$1.PastRoomInfo>(4, _omitFieldNames ? '' : 'roomInfo',
        subBuilder: $1.PastRoomInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingInfoRes clone() => RecordingInfoRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingInfoRes copyWith(void Function(RecordingInfoRes) updates) =>
      super.copyWith((message) => updates(message as RecordingInfoRes))
          as RecordingInfoRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordingInfoRes create() => RecordingInfoRes._();
  @$core.override
  RecordingInfoRes createEmptyInstance() => create();
  static $pb.PbList<RecordingInfoRes> createRepeated() =>
      $pb.PbList<RecordingInfoRes>();
  @$core.pragma('dart2js:noInline')
  static RecordingInfoRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordingInfoRes>(create);
  static RecordingInfoRes? _defaultInstance;

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
  RecordingInfo get recordingInfo => $_getN(2);
  @$pb.TagNumber(3)
  set recordingInfo(RecordingInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRecordingInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecordingInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  RecordingInfo ensureRecordingInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.PastRoomInfo get roomInfo => $_getN(3);
  @$pb.TagNumber(4)
  set roomInfo($1.PastRoomInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomInfo() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.PastRoomInfo ensureRoomInfo() => $_ensure(3);
}

class DeleteRecordingReq extends $pb.GeneratedMessage {
  factory DeleteRecordingReq({
    $core.String? recordId,
  }) {
    final result = create();
    if (recordId != null) result.recordId = recordId;
    return result;
  }

  DeleteRecordingReq._();

  factory DeleteRecordingReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteRecordingReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteRecordingReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recordId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteRecordingReq clone() => DeleteRecordingReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteRecordingReq copyWith(void Function(DeleteRecordingReq) updates) =>
      super.copyWith((message) => updates(message as DeleteRecordingReq))
          as DeleteRecordingReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteRecordingReq create() => DeleteRecordingReq._();
  @$core.override
  DeleteRecordingReq createEmptyInstance() => create();
  static $pb.PbList<DeleteRecordingReq> createRepeated() =>
      $pb.PbList<DeleteRecordingReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteRecordingReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteRecordingReq>(create);
  static DeleteRecordingReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recordId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recordId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordId() => $_clearField(1);
}

class DeleteRecordingRes extends $pb.GeneratedMessage {
  factory DeleteRecordingRes({
    $core.bool? status,
    $core.String? msg,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    return result;
  }

  DeleteRecordingRes._();

  factory DeleteRecordingRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteRecordingRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteRecordingRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteRecordingRes clone() => DeleteRecordingRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteRecordingRes copyWith(void Function(DeleteRecordingRes) updates) =>
      super.copyWith((message) => updates(message as DeleteRecordingRes))
          as DeleteRecordingRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteRecordingRes create() => DeleteRecordingRes._();
  @$core.override
  DeleteRecordingRes createEmptyInstance() => create();
  static $pb.PbList<DeleteRecordingRes> createRepeated() =>
      $pb.PbList<DeleteRecordingRes>();
  @$core.pragma('dart2js:noInline')
  static DeleteRecordingRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteRecordingRes>(create);
  static DeleteRecordingRes? _defaultInstance;

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

class GetDownloadTokenReq extends $pb.GeneratedMessage {
  factory GetDownloadTokenReq({
    $core.String? recordId,
  }) {
    final result = create();
    if (recordId != null) result.recordId = recordId;
    return result;
  }

  GetDownloadTokenReq._();

  factory GetDownloadTokenReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDownloadTokenReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDownloadTokenReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recordId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDownloadTokenReq clone() => GetDownloadTokenReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDownloadTokenReq copyWith(void Function(GetDownloadTokenReq) updates) =>
      super.copyWith((message) => updates(message as GetDownloadTokenReq))
          as GetDownloadTokenReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDownloadTokenReq create() => GetDownloadTokenReq._();
  @$core.override
  GetDownloadTokenReq createEmptyInstance() => create();
  static $pb.PbList<GetDownloadTokenReq> createRepeated() =>
      $pb.PbList<GetDownloadTokenReq>();
  @$core.pragma('dart2js:noInline')
  static GetDownloadTokenReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDownloadTokenReq>(create);
  static GetDownloadTokenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recordId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recordId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordId() => $_clearField(1);
}

class GetDownloadTokenRes extends $pb.GeneratedMessage {
  factory GetDownloadTokenRes({
    $core.bool? status,
    $core.String? msg,
    $core.String? token,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (token != null) result.token = token;
    return result;
  }

  GetDownloadTokenRes._();

  factory GetDownloadTokenRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDownloadTokenRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDownloadTokenRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDownloadTokenRes clone() => GetDownloadTokenRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDownloadTokenRes copyWith(void Function(GetDownloadTokenRes) updates) =>
      super.copyWith((message) => updates(message as GetDownloadTokenRes))
          as GetDownloadTokenRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDownloadTokenRes create() => GetDownloadTokenRes._();
  @$core.override
  GetDownloadTokenRes createEmptyInstance() => create();
  static $pb.PbList<GetDownloadTokenRes> createRepeated() =>
      $pb.PbList<GetDownloadTokenRes>();
  @$core.pragma('dart2js:noInline')
  static GetDownloadTokenRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDownloadTokenRes>(create);
  static GetDownloadTokenRes? _defaultInstance;

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
}

class UpdateRecordingMetadataReq extends $pb.GeneratedMessage {
  factory UpdateRecordingMetadataReq({
    $core.String? recordId,
    $0.RecordingMetadata? metadata,
  }) {
    final result = create();
    if (recordId != null) result.recordId = recordId;
    if (metadata != null) result.metadata = metadata;
    return result;
  }

  UpdateRecordingMetadataReq._();

  factory UpdateRecordingMetadataReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateRecordingMetadataReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateRecordingMetadataReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recordId')
    ..aOM<$0.RecordingMetadata>(2, _omitFieldNames ? '' : 'metadata',
        subBuilder: $0.RecordingMetadata.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateRecordingMetadataReq clone() =>
      UpdateRecordingMetadataReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateRecordingMetadataReq copyWith(
          void Function(UpdateRecordingMetadataReq) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateRecordingMetadataReq))
          as UpdateRecordingMetadataReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateRecordingMetadataReq create() => UpdateRecordingMetadataReq._();
  @$core.override
  UpdateRecordingMetadataReq createEmptyInstance() => create();
  static $pb.PbList<UpdateRecordingMetadataReq> createRepeated() =>
      $pb.PbList<UpdateRecordingMetadataReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateRecordingMetadataReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateRecordingMetadataReq>(create);
  static UpdateRecordingMetadataReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recordId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recordId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.RecordingMetadata get metadata => $_getN(1);
  @$pb.TagNumber(2)
  set metadata($0.RecordingMetadata value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMetadata() => $_has(1);
  @$pb.TagNumber(2)
  void clearMetadata() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.RecordingMetadata ensureMetadata() => $_ensure(1);
}

class UpdateRecordingMetadataRes extends $pb.GeneratedMessage {
  factory UpdateRecordingMetadataRes({
    $core.bool? status,
    $core.String? msg,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    return result;
  }

  UpdateRecordingMetadataRes._();

  factory UpdateRecordingMetadataRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateRecordingMetadataRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateRecordingMetadataRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateRecordingMetadataRes clone() =>
      UpdateRecordingMetadataRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateRecordingMetadataRes copyWith(
          void Function(UpdateRecordingMetadataRes) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateRecordingMetadataRes))
          as UpdateRecordingMetadataRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateRecordingMetadataRes create() => UpdateRecordingMetadataRes._();
  @$core.override
  UpdateRecordingMetadataRes createEmptyInstance() => create();
  static $pb.PbList<UpdateRecordingMetadataRes> createRepeated() =>
      $pb.PbList<UpdateRecordingMetadataRes>();
  @$core.pragma('dart2js:noInline')
  static UpdateRecordingMetadataRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateRecordingMetadataRes>(create);
  static UpdateRecordingMetadataRes? _defaultInstance;

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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
