// This is a generated file - do not edit.
//
// Generated from wajlc_auth_analytics.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class FetchAnalyticsReq extends $pb.GeneratedMessage {
  factory FetchAnalyticsReq({
    $core.Iterable<$core.String>? roomIds,
    $core.int? from,
    $core.int? limit,
    $core.String? orderBy,
  }) {
    final result = create();
    if (roomIds != null) result.roomIds.addAll(roomIds);
    if (from != null) result.from = from;
    if (limit != null) result.limit = limit;
    if (orderBy != null) result.orderBy = orderBy;
    return result;
  }

  FetchAnalyticsReq._();

  factory FetchAnalyticsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchAnalyticsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchAnalyticsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'roomIds')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'orderBy')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchAnalyticsReq clone() => FetchAnalyticsReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchAnalyticsReq copyWith(void Function(FetchAnalyticsReq) updates) =>
      super.copyWith((message) => updates(message as FetchAnalyticsReq))
          as FetchAnalyticsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchAnalyticsReq create() => FetchAnalyticsReq._();
  @$core.override
  FetchAnalyticsReq createEmptyInstance() => create();
  static $pb.PbList<FetchAnalyticsReq> createRepeated() =>
      $pb.PbList<FetchAnalyticsReq>();
  @$core.pragma('dart2js:noInline')
  static FetchAnalyticsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchAnalyticsReq>(create);
  static FetchAnalyticsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get roomIds => $_getList(0);

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
}

class AnalyticsInfo extends $pb.GeneratedMessage {
  factory AnalyticsInfo({
    $core.String? roomId,
    $core.String? fileId,
    $core.String? fileName,
    $core.double? fileSize,
    $fixnum.Int64? creationTime,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (fileId != null) result.fileId = fileId;
    if (fileName != null) result.fileName = fileName;
    if (fileSize != null) result.fileSize = fileSize;
    if (creationTime != null) result.creationTime = creationTime;
    return result;
  }

  AnalyticsInfo._();

  factory AnalyticsInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'fileId')
    ..aOS(3, _omitFieldNames ? '' : 'fileName')
    ..a<$core.double>(4, _omitFieldNames ? '' : 'fileSize', $pb.PbFieldType.OD)
    ..aInt64(5, _omitFieldNames ? '' : 'creationTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsInfo clone() => AnalyticsInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsInfo copyWith(void Function(AnalyticsInfo) updates) =>
      super.copyWith((message) => updates(message as AnalyticsInfo))
          as AnalyticsInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsInfo create() => AnalyticsInfo._();
  @$core.override
  AnalyticsInfo createEmptyInstance() => create();
  static $pb.PbList<AnalyticsInfo> createRepeated() =>
      $pb.PbList<AnalyticsInfo>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsInfo>(create);
  static AnalyticsInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileId => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFileId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fileName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFileName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get fileSize => $_getN(3);
  @$pb.TagNumber(4)
  set fileSize($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFileSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearFileSize() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get creationTime => $_getI64(4);
  @$pb.TagNumber(5)
  set creationTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreationTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreationTime() => $_clearField(5);
}

class FetchAnalyticsResult extends $pb.GeneratedMessage {
  factory FetchAnalyticsResult({
    $fixnum.Int64? totalAnalytics,
    $core.int? from,
    $core.int? limit,
    $core.String? orderBy,
    $core.Iterable<AnalyticsInfo>? analyticsList,
  }) {
    final result = create();
    if (totalAnalytics != null) result.totalAnalytics = totalAnalytics;
    if (from != null) result.from = from;
    if (limit != null) result.limit = limit;
    if (orderBy != null) result.orderBy = orderBy;
    if (analyticsList != null) result.analyticsList.addAll(analyticsList);
    return result;
  }

  FetchAnalyticsResult._();

  factory FetchAnalyticsResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchAnalyticsResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchAnalyticsResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalAnalytics')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'orderBy')
    ..pc<AnalyticsInfo>(
        5, _omitFieldNames ? '' : 'analyticsList', $pb.PbFieldType.PM,
        subBuilder: AnalyticsInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchAnalyticsResult clone() =>
      FetchAnalyticsResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchAnalyticsResult copyWith(void Function(FetchAnalyticsResult) updates) =>
      super.copyWith((message) => updates(message as FetchAnalyticsResult))
          as FetchAnalyticsResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchAnalyticsResult create() => FetchAnalyticsResult._();
  @$core.override
  FetchAnalyticsResult createEmptyInstance() => create();
  static $pb.PbList<FetchAnalyticsResult> createRepeated() =>
      $pb.PbList<FetchAnalyticsResult>();
  @$core.pragma('dart2js:noInline')
  static FetchAnalyticsResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchAnalyticsResult>(create);
  static FetchAnalyticsResult? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalAnalytics => $_getI64(0);
  @$pb.TagNumber(1)
  set totalAnalytics($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalAnalytics() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalAnalytics() => $_clearField(1);

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
  $pb.PbList<AnalyticsInfo> get analyticsList => $_getList(4);
}

class FetchAnalyticsRes extends $pb.GeneratedMessage {
  factory FetchAnalyticsRes({
    $core.bool? status,
    $core.String? msg,
    FetchAnalyticsResult? result,
  }) {
    final result$ = create();
    if (status != null) result$.status = status;
    if (msg != null) result$.msg = msg;
    if (result != null) result$.result = result;
    return result$;
  }

  FetchAnalyticsRes._();

  factory FetchAnalyticsRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchAnalyticsRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchAnalyticsRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<FetchAnalyticsResult>(3, _omitFieldNames ? '' : 'result',
        subBuilder: FetchAnalyticsResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchAnalyticsRes clone() => FetchAnalyticsRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchAnalyticsRes copyWith(void Function(FetchAnalyticsRes) updates) =>
      super.copyWith((message) => updates(message as FetchAnalyticsRes))
          as FetchAnalyticsRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchAnalyticsRes create() => FetchAnalyticsRes._();
  @$core.override
  FetchAnalyticsRes createEmptyInstance() => create();
  static $pb.PbList<FetchAnalyticsRes> createRepeated() =>
      $pb.PbList<FetchAnalyticsRes>();
  @$core.pragma('dart2js:noInline')
  static FetchAnalyticsRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchAnalyticsRes>(create);
  static FetchAnalyticsRes? _defaultInstance;

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
  FetchAnalyticsResult get result => $_getN(2);
  @$pb.TagNumber(3)
  set result(FetchAnalyticsResult value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearResult() => $_clearField(3);
  @$pb.TagNumber(3)
  FetchAnalyticsResult ensureResult() => $_ensure(2);
}

class DeleteAnalyticsReq extends $pb.GeneratedMessage {
  factory DeleteAnalyticsReq({
    $core.String? fileId,
  }) {
    final result = create();
    if (fileId != null) result.fileId = fileId;
    return result;
  }

  DeleteAnalyticsReq._();

  factory DeleteAnalyticsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteAnalyticsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteAnalyticsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAnalyticsReq clone() => DeleteAnalyticsReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAnalyticsReq copyWith(void Function(DeleteAnalyticsReq) updates) =>
      super.copyWith((message) => updates(message as DeleteAnalyticsReq))
          as DeleteAnalyticsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAnalyticsReq create() => DeleteAnalyticsReq._();
  @$core.override
  DeleteAnalyticsReq createEmptyInstance() => create();
  static $pb.PbList<DeleteAnalyticsReq> createRepeated() =>
      $pb.PbList<DeleteAnalyticsReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteAnalyticsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteAnalyticsReq>(create);
  static DeleteAnalyticsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => $_clearField(1);
}

class DeleteAnalyticsRes extends $pb.GeneratedMessage {
  factory DeleteAnalyticsRes({
    $core.bool? status,
    $core.String? msg,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    return result;
  }

  DeleteAnalyticsRes._();

  factory DeleteAnalyticsRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteAnalyticsRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteAnalyticsRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAnalyticsRes clone() => DeleteAnalyticsRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAnalyticsRes copyWith(void Function(DeleteAnalyticsRes) updates) =>
      super.copyWith((message) => updates(message as DeleteAnalyticsRes))
          as DeleteAnalyticsRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAnalyticsRes create() => DeleteAnalyticsRes._();
  @$core.override
  DeleteAnalyticsRes createEmptyInstance() => create();
  static $pb.PbList<DeleteAnalyticsRes> createRepeated() =>
      $pb.PbList<DeleteAnalyticsRes>();
  @$core.pragma('dart2js:noInline')
  static DeleteAnalyticsRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteAnalyticsRes>(create);
  static DeleteAnalyticsRes? _defaultInstance;

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

class GetAnalyticsDownloadTokenReq extends $pb.GeneratedMessage {
  factory GetAnalyticsDownloadTokenReq({
    $core.String? fileId,
  }) {
    final result = create();
    if (fileId != null) result.fileId = fileId;
    return result;
  }

  GetAnalyticsDownloadTokenReq._();

  factory GetAnalyticsDownloadTokenReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAnalyticsDownloadTokenReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAnalyticsDownloadTokenReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAnalyticsDownloadTokenReq clone() =>
      GetAnalyticsDownloadTokenReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAnalyticsDownloadTokenReq copyWith(
          void Function(GetAnalyticsDownloadTokenReq) updates) =>
      super.copyWith(
              (message) => updates(message as GetAnalyticsDownloadTokenReq))
          as GetAnalyticsDownloadTokenReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAnalyticsDownloadTokenReq create() =>
      GetAnalyticsDownloadTokenReq._();
  @$core.override
  GetAnalyticsDownloadTokenReq createEmptyInstance() => create();
  static $pb.PbList<GetAnalyticsDownloadTokenReq> createRepeated() =>
      $pb.PbList<GetAnalyticsDownloadTokenReq>();
  @$core.pragma('dart2js:noInline')
  static GetAnalyticsDownloadTokenReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAnalyticsDownloadTokenReq>(create);
  static GetAnalyticsDownloadTokenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => $_clearField(1);
}

class GetAnalyticsDownloadTokenRes extends $pb.GeneratedMessage {
  factory GetAnalyticsDownloadTokenRes({
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

  GetAnalyticsDownloadTokenRes._();

  factory GetAnalyticsDownloadTokenRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAnalyticsDownloadTokenRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAnalyticsDownloadTokenRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAnalyticsDownloadTokenRes clone() =>
      GetAnalyticsDownloadTokenRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAnalyticsDownloadTokenRes copyWith(
          void Function(GetAnalyticsDownloadTokenRes) updates) =>
      super.copyWith(
              (message) => updates(message as GetAnalyticsDownloadTokenRes))
          as GetAnalyticsDownloadTokenRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAnalyticsDownloadTokenRes create() =>
      GetAnalyticsDownloadTokenRes._();
  @$core.override
  GetAnalyticsDownloadTokenRes createEmptyInstance() => create();
  static $pb.PbList<GetAnalyticsDownloadTokenRes> createRepeated() =>
      $pb.PbList<GetAnalyticsDownloadTokenRes>();
  @$core.pragma('dart2js:noInline')
  static GetAnalyticsDownloadTokenRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAnalyticsDownloadTokenRes>(create);
  static GetAnalyticsDownloadTokenRes? _defaultInstance;

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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
