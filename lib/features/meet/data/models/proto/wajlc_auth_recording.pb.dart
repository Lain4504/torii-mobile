//
//  Generated code. Do not modify.
//  source: wajlc_auth_recording.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_auth_room.pb.dart' as $19;
import 'wajlc_recording.pb.dart' as $21;

class FetchRecordingsReq extends $pb.GeneratedMessage {
  factory FetchRecordingsReq({
    $core.Iterable<$core.String>? roomIds,
    $core.String? roomSid,
    $core.int? from,
    $core.int? limit,
    $core.String? orderBy,
  }) {
    final $result = create();
    if (roomIds != null) {
      $result.roomIds.addAll(roomIds);
    }
    if (roomSid != null) {
      $result.roomSid = roomSid;
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
  FetchRecordingsReq._() : super();
  factory FetchRecordingsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchRecordingsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchRecordingsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'roomIds')
    ..aOS(2, _omitFieldNames ? '' : 'roomSid')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'orderBy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchRecordingsReq clone() => FetchRecordingsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchRecordingsReq copyWith(void Function(FetchRecordingsReq) updates) => super.copyWith((message) => updates(message as FetchRecordingsReq)) as FetchRecordingsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchRecordingsReq create() => FetchRecordingsReq._();
  FetchRecordingsReq createEmptyInstance() => create();
  static $pb.PbList<FetchRecordingsReq> createRepeated() => $pb.PbList<FetchRecordingsReq>();
  @$core.pragma('dart2js:noInline')
  static FetchRecordingsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchRecordingsReq>(create);
  static FetchRecordingsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get roomIds => $_getList(0);

  /// To get information about a particular session
  @$pb.TagNumber(2)
  $core.String get roomSid => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomSid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomSid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomSid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get from => $_getIZ(2);
  @$pb.TagNumber(3)
  set from($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrom() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get limit => $_getIZ(3);
  @$pb.TagNumber(4)
  set limit($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get orderBy => $_getSZ(4);
  @$pb.TagNumber(5)
  set orderBy($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrderBy() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrderBy() => clearField(5);
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
    $21.RecordingMetadata? metadata,
  }) {
    final $result = create();
    if (recordId != null) {
      $result.recordId = recordId;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (roomSid != null) {
      $result.roomSid = roomSid;
    }
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (fileSize != null) {
      $result.fileSize = fileSize;
    }
    if (creationTime != null) {
      $result.creationTime = creationTime;
    }
    if (roomCreationTime != null) {
      $result.roomCreationTime = roomCreationTime;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  RecordingInfo._() : super();
  factory RecordingInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecordingInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecordingInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recordId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'roomSid')
    ..aOS(4, _omitFieldNames ? '' : 'filePath')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'fileSize', $pb.PbFieldType.OF)
    ..aInt64(6, _omitFieldNames ? '' : 'creationTime')
    ..aInt64(7, _omitFieldNames ? '' : 'roomCreationTime')
    ..aOM<$21.RecordingMetadata>(8, _omitFieldNames ? '' : 'metadata', subBuilder: $21.RecordingMetadata.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecordingInfo clone() => RecordingInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecordingInfo copyWith(void Function(RecordingInfo) updates) => super.copyWith((message) => updates(message as RecordingInfo)) as RecordingInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordingInfo create() => RecordingInfo._();
  RecordingInfo createEmptyInstance() => create();
  static $pb.PbList<RecordingInfo> createRepeated() => $pb.PbList<RecordingInfo>();
  @$core.pragma('dart2js:noInline')
  static RecordingInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecordingInfo>(create);
  static RecordingInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recordId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recordId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordId() => clearField(1);

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
  $core.String get filePath => $_getSZ(3);
  @$pb.TagNumber(4)
  set filePath($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFilePath() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilePath() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get fileSize => $_getN(4);
  @$pb.TagNumber(5)
  set fileSize($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFileSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileSize() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get creationTime => $_getI64(5);
  @$pb.TagNumber(6)
  set creationTime($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreationTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreationTime() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get roomCreationTime => $_getI64(6);
  @$pb.TagNumber(7)
  set roomCreationTime($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRoomCreationTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoomCreationTime() => clearField(7);

  @$pb.TagNumber(8)
  $21.RecordingMetadata get metadata => $_getN(7);
  @$pb.TagNumber(8)
  set metadata($21.RecordingMetadata v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasMetadata() => $_has(7);
  @$pb.TagNumber(8)
  void clearMetadata() => clearField(8);
  @$pb.TagNumber(8)
  $21.RecordingMetadata ensureMetadata() => $_ensure(7);
}

class FetchRecordingsResult extends $pb.GeneratedMessage {
  factory FetchRecordingsResult({
    $fixnum.Int64? totalRecordings,
    $core.int? from,
    $core.int? limit,
    $core.String? orderBy,
    $core.Iterable<RecordingInfo>? recordingsList,
  }) {
    final $result = create();
    if (totalRecordings != null) {
      $result.totalRecordings = totalRecordings;
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
    if (recordingsList != null) {
      $result.recordingsList.addAll(recordingsList);
    }
    return $result;
  }
  FetchRecordingsResult._() : super();
  factory FetchRecordingsResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchRecordingsResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchRecordingsResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalRecordings')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'orderBy')
    ..pc<RecordingInfo>(5, _omitFieldNames ? '' : 'recordingsList', $pb.PbFieldType.PM, subBuilder: RecordingInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchRecordingsResult clone() => FetchRecordingsResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchRecordingsResult copyWith(void Function(FetchRecordingsResult) updates) => super.copyWith((message) => updates(message as FetchRecordingsResult)) as FetchRecordingsResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchRecordingsResult create() => FetchRecordingsResult._();
  FetchRecordingsResult createEmptyInstance() => create();
  static $pb.PbList<FetchRecordingsResult> createRepeated() => $pb.PbList<FetchRecordingsResult>();
  @$core.pragma('dart2js:noInline')
  static FetchRecordingsResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchRecordingsResult>(create);
  static FetchRecordingsResult? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalRecordings => $_getI64(0);
  @$pb.TagNumber(1)
  set totalRecordings($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotalRecordings() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalRecordings() => clearField(1);

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
  $core.List<RecordingInfo> get recordingsList => $_getList(4);
}

class FetchRecordingsRes extends $pb.GeneratedMessage {
  factory FetchRecordingsRes({
    $core.bool? status,
    $core.String? msg,
    FetchRecordingsResult? result,
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
  FetchRecordingsRes._() : super();
  factory FetchRecordingsRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchRecordingsRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchRecordingsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<FetchRecordingsResult>(3, _omitFieldNames ? '' : 'result', subBuilder: FetchRecordingsResult.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchRecordingsRes clone() => FetchRecordingsRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchRecordingsRes copyWith(void Function(FetchRecordingsRes) updates) => super.copyWith((message) => updates(message as FetchRecordingsRes)) as FetchRecordingsRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchRecordingsRes create() => FetchRecordingsRes._();
  FetchRecordingsRes createEmptyInstance() => create();
  static $pb.PbList<FetchRecordingsRes> createRepeated() => $pb.PbList<FetchRecordingsRes>();
  @$core.pragma('dart2js:noInline')
  static FetchRecordingsRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchRecordingsRes>(create);
  static FetchRecordingsRes? _defaultInstance;

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
  FetchRecordingsResult get result => $_getN(2);
  @$pb.TagNumber(3)
  set result(FetchRecordingsResult v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearResult() => clearField(3);
  @$pb.TagNumber(3)
  FetchRecordingsResult ensureResult() => $_ensure(2);
}

class RecordingInfoReq extends $pb.GeneratedMessage {
  factory RecordingInfoReq({
    $core.String? recordId,
  }) {
    final $result = create();
    if (recordId != null) {
      $result.recordId = recordId;
    }
    return $result;
  }
  RecordingInfoReq._() : super();
  factory RecordingInfoReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecordingInfoReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecordingInfoReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recordId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecordingInfoReq clone() => RecordingInfoReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecordingInfoReq copyWith(void Function(RecordingInfoReq) updates) => super.copyWith((message) => updates(message as RecordingInfoReq)) as RecordingInfoReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordingInfoReq create() => RecordingInfoReq._();
  RecordingInfoReq createEmptyInstance() => create();
  static $pb.PbList<RecordingInfoReq> createRepeated() => $pb.PbList<RecordingInfoReq>();
  @$core.pragma('dart2js:noInline')
  static RecordingInfoReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecordingInfoReq>(create);
  static RecordingInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recordId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recordId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordId() => clearField(1);
}

class RecordingInfoRes extends $pb.GeneratedMessage {
  factory RecordingInfoRes({
    $core.bool? status,
    $core.String? msg,
    RecordingInfo? recordingInfo,
    $19.PastRoomInfo? roomInfo,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (recordingInfo != null) {
      $result.recordingInfo = recordingInfo;
    }
    if (roomInfo != null) {
      $result.roomInfo = roomInfo;
    }
    return $result;
  }
  RecordingInfoRes._() : super();
  factory RecordingInfoRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecordingInfoRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecordingInfoRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<RecordingInfo>(3, _omitFieldNames ? '' : 'recordingInfo', subBuilder: RecordingInfo.create)
    ..aOM<$19.PastRoomInfo>(4, _omitFieldNames ? '' : 'roomInfo', subBuilder: $19.PastRoomInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecordingInfoRes clone() => RecordingInfoRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecordingInfoRes copyWith(void Function(RecordingInfoRes) updates) => super.copyWith((message) => updates(message as RecordingInfoRes)) as RecordingInfoRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordingInfoRes create() => RecordingInfoRes._();
  RecordingInfoRes createEmptyInstance() => create();
  static $pb.PbList<RecordingInfoRes> createRepeated() => $pb.PbList<RecordingInfoRes>();
  @$core.pragma('dart2js:noInline')
  static RecordingInfoRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecordingInfoRes>(create);
  static RecordingInfoRes? _defaultInstance;

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
  RecordingInfo get recordingInfo => $_getN(2);
  @$pb.TagNumber(3)
  set recordingInfo(RecordingInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRecordingInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecordingInfo() => clearField(3);
  @$pb.TagNumber(3)
  RecordingInfo ensureRecordingInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  $19.PastRoomInfo get roomInfo => $_getN(3);
  @$pb.TagNumber(4)
  set roomInfo($19.PastRoomInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomInfo() => clearField(4);
  @$pb.TagNumber(4)
  $19.PastRoomInfo ensureRoomInfo() => $_ensure(3);
}

class DeleteRecordingReq extends $pb.GeneratedMessage {
  factory DeleteRecordingReq({
    $core.String? recordId,
  }) {
    final $result = create();
    if (recordId != null) {
      $result.recordId = recordId;
    }
    return $result;
  }
  DeleteRecordingReq._() : super();
  factory DeleteRecordingReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRecordingReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteRecordingReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recordId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRecordingReq clone() => DeleteRecordingReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRecordingReq copyWith(void Function(DeleteRecordingReq) updates) => super.copyWith((message) => updates(message as DeleteRecordingReq)) as DeleteRecordingReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteRecordingReq create() => DeleteRecordingReq._();
  DeleteRecordingReq createEmptyInstance() => create();
  static $pb.PbList<DeleteRecordingReq> createRepeated() => $pb.PbList<DeleteRecordingReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteRecordingReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRecordingReq>(create);
  static DeleteRecordingReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recordId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recordId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordId() => clearField(1);
}

class DeleteRecordingRes extends $pb.GeneratedMessage {
  factory DeleteRecordingRes({
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
  DeleteRecordingRes._() : super();
  factory DeleteRecordingRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRecordingRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteRecordingRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRecordingRes clone() => DeleteRecordingRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRecordingRes copyWith(void Function(DeleteRecordingRes) updates) => super.copyWith((message) => updates(message as DeleteRecordingRes)) as DeleteRecordingRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteRecordingRes create() => DeleteRecordingRes._();
  DeleteRecordingRes createEmptyInstance() => create();
  static $pb.PbList<DeleteRecordingRes> createRepeated() => $pb.PbList<DeleteRecordingRes>();
  @$core.pragma('dart2js:noInline')
  static DeleteRecordingRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRecordingRes>(create);
  static DeleteRecordingRes? _defaultInstance;

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

class GetDownloadTokenReq extends $pb.GeneratedMessage {
  factory GetDownloadTokenReq({
    $core.String? recordId,
  }) {
    final $result = create();
    if (recordId != null) {
      $result.recordId = recordId;
    }
    return $result;
  }
  GetDownloadTokenReq._() : super();
  factory GetDownloadTokenReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDownloadTokenReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetDownloadTokenReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recordId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDownloadTokenReq clone() => GetDownloadTokenReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDownloadTokenReq copyWith(void Function(GetDownloadTokenReq) updates) => super.copyWith((message) => updates(message as GetDownloadTokenReq)) as GetDownloadTokenReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDownloadTokenReq create() => GetDownloadTokenReq._();
  GetDownloadTokenReq createEmptyInstance() => create();
  static $pb.PbList<GetDownloadTokenReq> createRepeated() => $pb.PbList<GetDownloadTokenReq>();
  @$core.pragma('dart2js:noInline')
  static GetDownloadTokenReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDownloadTokenReq>(create);
  static GetDownloadTokenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recordId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recordId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordId() => clearField(1);
}

class GetDownloadTokenRes extends $pb.GeneratedMessage {
  factory GetDownloadTokenRes({
    $core.bool? status,
    $core.String? msg,
    $core.String? token,
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
    return $result;
  }
  GetDownloadTokenRes._() : super();
  factory GetDownloadTokenRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDownloadTokenRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetDownloadTokenRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDownloadTokenRes clone() => GetDownloadTokenRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDownloadTokenRes copyWith(void Function(GetDownloadTokenRes) updates) => super.copyWith((message) => updates(message as GetDownloadTokenRes)) as GetDownloadTokenRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDownloadTokenRes create() => GetDownloadTokenRes._();
  GetDownloadTokenRes createEmptyInstance() => create();
  static $pb.PbList<GetDownloadTokenRes> createRepeated() => $pb.PbList<GetDownloadTokenRes>();
  @$core.pragma('dart2js:noInline')
  static GetDownloadTokenRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDownloadTokenRes>(create);
  static GetDownloadTokenRes? _defaultInstance;

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
}

class UpdateRecordingMetadataReq extends $pb.GeneratedMessage {
  factory UpdateRecordingMetadataReq({
    $core.String? recordId,
    $21.RecordingMetadata? metadata,
  }) {
    final $result = create();
    if (recordId != null) {
      $result.recordId = recordId;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  UpdateRecordingMetadataReq._() : super();
  factory UpdateRecordingMetadataReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateRecordingMetadataReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateRecordingMetadataReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recordId')
    ..aOM<$21.RecordingMetadata>(2, _omitFieldNames ? '' : 'metadata', subBuilder: $21.RecordingMetadata.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateRecordingMetadataReq clone() => UpdateRecordingMetadataReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateRecordingMetadataReq copyWith(void Function(UpdateRecordingMetadataReq) updates) => super.copyWith((message) => updates(message as UpdateRecordingMetadataReq)) as UpdateRecordingMetadataReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateRecordingMetadataReq create() => UpdateRecordingMetadataReq._();
  UpdateRecordingMetadataReq createEmptyInstance() => create();
  static $pb.PbList<UpdateRecordingMetadataReq> createRepeated() => $pb.PbList<UpdateRecordingMetadataReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateRecordingMetadataReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateRecordingMetadataReq>(create);
  static UpdateRecordingMetadataReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recordId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recordId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordId() => clearField(1);

  @$pb.TagNumber(2)
  $21.RecordingMetadata get metadata => $_getN(1);
  @$pb.TagNumber(2)
  set metadata($21.RecordingMetadata v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMetadata() => $_has(1);
  @$pb.TagNumber(2)
  void clearMetadata() => clearField(2);
  @$pb.TagNumber(2)
  $21.RecordingMetadata ensureMetadata() => $_ensure(1);
}

class UpdateRecordingMetadataRes extends $pb.GeneratedMessage {
  factory UpdateRecordingMetadataRes({
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
  UpdateRecordingMetadataRes._() : super();
  factory UpdateRecordingMetadataRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateRecordingMetadataRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateRecordingMetadataRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateRecordingMetadataRes clone() => UpdateRecordingMetadataRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateRecordingMetadataRes copyWith(void Function(UpdateRecordingMetadataRes) updates) => super.copyWith((message) => updates(message as UpdateRecordingMetadataRes)) as UpdateRecordingMetadataRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateRecordingMetadataRes create() => UpdateRecordingMetadataRes._();
  UpdateRecordingMetadataRes createEmptyInstance() => create();
  static $pb.PbList<UpdateRecordingMetadataRes> createRepeated() => $pb.PbList<UpdateRecordingMetadataRes>();
  @$core.pragma('dart2js:noInline')
  static UpdateRecordingMetadataRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateRecordingMetadataRes>(create);
  static UpdateRecordingMetadataRes? _defaultInstance;

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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
