// This is a generated file - do not edit.
//
// Generated from wajlc_auth_artifact.proto.

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
import 'wajlc_room_artifacts.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Request to fetch a list of artifacts
class FetchArtifactsReq extends $pb.GeneratedMessage {
  factory FetchArtifactsReq({
    $core.Iterable<$core.String>? roomIds,
    $core.String? roomSid,
    $0.RoomArtifactType? type,
    $fixnum.Int64? from,
    $fixnum.Int64? limit,
    $core.String? orderBy,
  }) {
    final result = create();
    if (roomIds != null) result.roomIds.addAll(roomIds);
    if (roomSid != null) result.roomSid = roomSid;
    if (type != null) result.type = type;
    if (from != null) result.from = from;
    if (limit != null) result.limit = limit;
    if (orderBy != null) result.orderBy = orderBy;
    return result;
  }

  FetchArtifactsReq._();

  factory FetchArtifactsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchArtifactsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchArtifactsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'roomIds')
    ..aOS(2, _omitFieldNames ? '' : 'roomSid')
    ..e<$0.RoomArtifactType>(
        3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: $0.RoomArtifactType.UNKNOWN_ARTIFACT,
        valueOf: $0.RoomArtifactType.valueOf,
        enumValues: $0.RoomArtifactType.values)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'orderBy')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchArtifactsReq clone() => FetchArtifactsReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchArtifactsReq copyWith(void Function(FetchArtifactsReq) updates) =>
      super.copyWith((message) => updates(message as FetchArtifactsReq))
          as FetchArtifactsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchArtifactsReq create() => FetchArtifactsReq._();
  @$core.override
  FetchArtifactsReq createEmptyInstance() => create();
  static $pb.PbList<FetchArtifactsReq> createRepeated() =>
      $pb.PbList<FetchArtifactsReq>();
  @$core.pragma('dart2js:noInline')
  static FetchArtifactsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchArtifactsReq>(create);
  static FetchArtifactsReq? _defaultInstance;

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
  $0.RoomArtifactType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type($0.RoomArtifactType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get from => $_getI64(3);
  @$pb.TagNumber(4)
  set from($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrom() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get limit => $_getI64(4);
  @$pb.TagNumber(5)
  set limit($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearLimit() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get orderBy => $_getSZ(5);
  @$pb.TagNumber(6)
  set orderBy($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOrderBy() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderBy() => $_clearField(6);
}

/// A single artifact entry in the list response
class ArtifactInfo extends $pb.GeneratedMessage {
  factory ArtifactInfo({
    $core.String? artifactId,
    $core.String? roomId,
    $0.RoomArtifactType? type,
    $core.String? created,
    $0.RoomArtifactMetadata? metadata,
  }) {
    final result = create();
    if (artifactId != null) result.artifactId = artifactId;
    if (roomId != null) result.roomId = roomId;
    if (type != null) result.type = type;
    if (created != null) result.created = created;
    if (metadata != null) result.metadata = metadata;
    return result;
  }

  ArtifactInfo._();

  factory ArtifactInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArtifactInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArtifactInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'artifactId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..e<$0.RoomArtifactType>(
        3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: $0.RoomArtifactType.UNKNOWN_ARTIFACT,
        valueOf: $0.RoomArtifactType.valueOf,
        enumValues: $0.RoomArtifactType.values)
    ..aOS(4, _omitFieldNames ? '' : 'created')
    ..aOM<$0.RoomArtifactMetadata>(5, _omitFieldNames ? '' : 'metadata',
        subBuilder: $0.RoomArtifactMetadata.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtifactInfo clone() => ArtifactInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtifactInfo copyWith(void Function(ArtifactInfo) updates) =>
      super.copyWith((message) => updates(message as ArtifactInfo))
          as ArtifactInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArtifactInfo create() => ArtifactInfo._();
  @$core.override
  ArtifactInfo createEmptyInstance() => create();
  static $pb.PbList<ArtifactInfo> createRepeated() =>
      $pb.PbList<ArtifactInfo>();
  @$core.pragma('dart2js:noInline')
  static ArtifactInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArtifactInfo>(create);
  static ArtifactInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get artifactId => $_getSZ(0);
  @$pb.TagNumber(1)
  set artifactId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasArtifactId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtifactId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.RoomArtifactType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type($0.RoomArtifactType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get created => $_getSZ(3);
  @$pb.TagNumber(4)
  set created($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreated() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreated() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.RoomArtifactMetadata get metadata => $_getN(4);
  @$pb.TagNumber(5)
  set metadata($0.RoomArtifactMetadata value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasMetadata() => $_has(4);
  @$pb.TagNumber(5)
  void clearMetadata() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.RoomArtifactMetadata ensureMetadata() => $_ensure(4);
}

/// Result for fetching artifacts
class FetchArtifactsResult extends $pb.GeneratedMessage {
  factory FetchArtifactsResult({
    $fixnum.Int64? totalArtifacts,
    $fixnum.Int64? from,
    $fixnum.Int64? limit,
    $core.String? orderBy,
    $0.RoomArtifactType? type,
    $core.Iterable<ArtifactInfo>? artifactsList,
  }) {
    final result = create();
    if (totalArtifacts != null) result.totalArtifacts = totalArtifacts;
    if (from != null) result.from = from;
    if (limit != null) result.limit = limit;
    if (orderBy != null) result.orderBy = orderBy;
    if (type != null) result.type = type;
    if (artifactsList != null) result.artifactsList.addAll(artifactsList);
    return result;
  }

  FetchArtifactsResult._();

  factory FetchArtifactsResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchArtifactsResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchArtifactsResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalArtifacts')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'orderBy')
    ..e<$0.RoomArtifactType>(
        5, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: $0.RoomArtifactType.UNKNOWN_ARTIFACT,
        valueOf: $0.RoomArtifactType.valueOf,
        enumValues: $0.RoomArtifactType.values)
    ..pc<ArtifactInfo>(
        6, _omitFieldNames ? '' : 'artifactsList', $pb.PbFieldType.PM,
        subBuilder: ArtifactInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchArtifactsResult clone() =>
      FetchArtifactsResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchArtifactsResult copyWith(void Function(FetchArtifactsResult) updates) =>
      super.copyWith((message) => updates(message as FetchArtifactsResult))
          as FetchArtifactsResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchArtifactsResult create() => FetchArtifactsResult._();
  @$core.override
  FetchArtifactsResult createEmptyInstance() => create();
  static $pb.PbList<FetchArtifactsResult> createRepeated() =>
      $pb.PbList<FetchArtifactsResult>();
  @$core.pragma('dart2js:noInline')
  static FetchArtifactsResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchArtifactsResult>(create);
  static FetchArtifactsResult? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalArtifacts => $_getI64(0);
  @$pb.TagNumber(1)
  set totalArtifacts($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalArtifacts() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalArtifacts() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get from => $_getI64(1);
  @$pb.TagNumber(2)
  set from($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get limit => $_getI64(2);
  @$pb.TagNumber(3)
  set limit($fixnum.Int64 value) => $_setInt64(2, value);
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
  $0.RoomArtifactType get type => $_getN(4);
  @$pb.TagNumber(5)
  set type($0.RoomArtifactType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<ArtifactInfo> get artifactsList => $_getList(5);
}

/// Response for fetching artifacts
class FetchArtifactsRes extends $pb.GeneratedMessage {
  factory FetchArtifactsRes({
    $core.bool? status,
    $core.String? msg,
    FetchArtifactsResult? result,
  }) {
    final result$ = create();
    if (status != null) result$.status = status;
    if (msg != null) result$.msg = msg;
    if (result != null) result$.result = result;
    return result$;
  }

  FetchArtifactsRes._();

  factory FetchArtifactsRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchArtifactsRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchArtifactsRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<FetchArtifactsResult>(3, _omitFieldNames ? '' : 'result',
        subBuilder: FetchArtifactsResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchArtifactsRes clone() => FetchArtifactsRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchArtifactsRes copyWith(void Function(FetchArtifactsRes) updates) =>
      super.copyWith((message) => updates(message as FetchArtifactsRes))
          as FetchArtifactsRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchArtifactsRes create() => FetchArtifactsRes._();
  @$core.override
  FetchArtifactsRes createEmptyInstance() => create();
  static $pb.PbList<FetchArtifactsRes> createRepeated() =>
      $pb.PbList<FetchArtifactsRes>();
  @$core.pragma('dart2js:noInline')
  static FetchArtifactsRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchArtifactsRes>(create);
  static FetchArtifactsRes? _defaultInstance;

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
  FetchArtifactsResult get result => $_getN(2);
  @$pb.TagNumber(3)
  set result(FetchArtifactsResult value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearResult() => $_clearField(3);
  @$pb.TagNumber(3)
  FetchArtifactsResult ensureResult() => $_ensure(2);
}

/// Request to get a download token for an artifact
class GetArtifactDownloadTokenReq extends $pb.GeneratedMessage {
  factory GetArtifactDownloadTokenReq({
    $core.String? artifactId,
  }) {
    final result = create();
    if (artifactId != null) result.artifactId = artifactId;
    return result;
  }

  GetArtifactDownloadTokenReq._();

  factory GetArtifactDownloadTokenReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetArtifactDownloadTokenReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetArtifactDownloadTokenReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'artifactId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetArtifactDownloadTokenReq clone() =>
      GetArtifactDownloadTokenReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetArtifactDownloadTokenReq copyWith(
          void Function(GetArtifactDownloadTokenReq) updates) =>
      super.copyWith(
              (message) => updates(message as GetArtifactDownloadTokenReq))
          as GetArtifactDownloadTokenReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetArtifactDownloadTokenReq create() =>
      GetArtifactDownloadTokenReq._();
  @$core.override
  GetArtifactDownloadTokenReq createEmptyInstance() => create();
  static $pb.PbList<GetArtifactDownloadTokenReq> createRepeated() =>
      $pb.PbList<GetArtifactDownloadTokenReq>();
  @$core.pragma('dart2js:noInline')
  static GetArtifactDownloadTokenReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetArtifactDownloadTokenReq>(create);
  static GetArtifactDownloadTokenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get artifactId => $_getSZ(0);
  @$pb.TagNumber(1)
  set artifactId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasArtifactId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtifactId() => $_clearField(1);
}

/// Response for a download token
class GetArtifactDownloadTokenRes extends $pb.GeneratedMessage {
  factory GetArtifactDownloadTokenRes({
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

  GetArtifactDownloadTokenRes._();

  factory GetArtifactDownloadTokenRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetArtifactDownloadTokenRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetArtifactDownloadTokenRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetArtifactDownloadTokenRes clone() =>
      GetArtifactDownloadTokenRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetArtifactDownloadTokenRes copyWith(
          void Function(GetArtifactDownloadTokenRes) updates) =>
      super.copyWith(
              (message) => updates(message as GetArtifactDownloadTokenRes))
          as GetArtifactDownloadTokenRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetArtifactDownloadTokenRes create() =>
      GetArtifactDownloadTokenRes._();
  @$core.override
  GetArtifactDownloadTokenRes createEmptyInstance() => create();
  static $pb.PbList<GetArtifactDownloadTokenRes> createRepeated() =>
      $pb.PbList<GetArtifactDownloadTokenRes>();
  @$core.pragma('dart2js:noInline')
  static GetArtifactDownloadTokenRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetArtifactDownloadTokenRes>(create);
  static GetArtifactDownloadTokenRes? _defaultInstance;

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

/// Request to delete an artifact
class DeleteArtifactReq extends $pb.GeneratedMessage {
  factory DeleteArtifactReq({
    $core.String? artifactId,
  }) {
    final result = create();
    if (artifactId != null) result.artifactId = artifactId;
    return result;
  }

  DeleteArtifactReq._();

  factory DeleteArtifactReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteArtifactReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteArtifactReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'artifactId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteArtifactReq clone() => DeleteArtifactReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteArtifactReq copyWith(void Function(DeleteArtifactReq) updates) =>
      super.copyWith((message) => updates(message as DeleteArtifactReq))
          as DeleteArtifactReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteArtifactReq create() => DeleteArtifactReq._();
  @$core.override
  DeleteArtifactReq createEmptyInstance() => create();
  static $pb.PbList<DeleteArtifactReq> createRepeated() =>
      $pb.PbList<DeleteArtifactReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteArtifactReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteArtifactReq>(create);
  static DeleteArtifactReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get artifactId => $_getSZ(0);
  @$pb.TagNumber(1)
  set artifactId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasArtifactId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtifactId() => $_clearField(1);
}

/// Response for deleting an artifact
class DeleteArtifactRes extends $pb.GeneratedMessage {
  factory DeleteArtifactRes({
    $core.bool? status,
    $core.String? msg,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    return result;
  }

  DeleteArtifactRes._();

  factory DeleteArtifactRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteArtifactRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteArtifactRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteArtifactRes clone() => DeleteArtifactRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteArtifactRes copyWith(void Function(DeleteArtifactRes) updates) =>
      super.copyWith((message) => updates(message as DeleteArtifactRes))
          as DeleteArtifactRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteArtifactRes create() => DeleteArtifactRes._();
  @$core.override
  DeleteArtifactRes createEmptyInstance() => create();
  static $pb.PbList<DeleteArtifactRes> createRepeated() =>
      $pb.PbList<DeleteArtifactRes>();
  @$core.pragma('dart2js:noInline')
  static DeleteArtifactRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteArtifactRes>(create);
  static DeleteArtifactRes? _defaultInstance;

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

class ArtifactInfoReq extends $pb.GeneratedMessage {
  factory ArtifactInfoReq({
    $core.String? artifactId,
  }) {
    final result = create();
    if (artifactId != null) result.artifactId = artifactId;
    return result;
  }

  ArtifactInfoReq._();

  factory ArtifactInfoReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArtifactInfoReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArtifactInfoReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'artifactId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtifactInfoReq clone() => ArtifactInfoReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtifactInfoReq copyWith(void Function(ArtifactInfoReq) updates) =>
      super.copyWith((message) => updates(message as ArtifactInfoReq))
          as ArtifactInfoReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArtifactInfoReq create() => ArtifactInfoReq._();
  @$core.override
  ArtifactInfoReq createEmptyInstance() => create();
  static $pb.PbList<ArtifactInfoReq> createRepeated() =>
      $pb.PbList<ArtifactInfoReq>();
  @$core.pragma('dart2js:noInline')
  static ArtifactInfoReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArtifactInfoReq>(create);
  static ArtifactInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get artifactId => $_getSZ(0);
  @$pb.TagNumber(1)
  set artifactId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasArtifactId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtifactId() => $_clearField(1);
}

class ArtifactInfoRes extends $pb.GeneratedMessage {
  factory ArtifactInfoRes({
    $core.bool? status,
    $core.String? msg,
    ArtifactInfo? artifactInfo,
    $1.PastRoomInfo? roomInfo,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (artifactInfo != null) result.artifactInfo = artifactInfo;
    if (roomInfo != null) result.roomInfo = roomInfo;
    return result;
  }

  ArtifactInfoRes._();

  factory ArtifactInfoRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArtifactInfoRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArtifactInfoRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<ArtifactInfo>(3, _omitFieldNames ? '' : 'artifactInfo',
        subBuilder: ArtifactInfo.create)
    ..aOM<$1.PastRoomInfo>(4, _omitFieldNames ? '' : 'roomInfo',
        subBuilder: $1.PastRoomInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtifactInfoRes clone() => ArtifactInfoRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtifactInfoRes copyWith(void Function(ArtifactInfoRes) updates) =>
      super.copyWith((message) => updates(message as ArtifactInfoRes))
          as ArtifactInfoRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArtifactInfoRes create() => ArtifactInfoRes._();
  @$core.override
  ArtifactInfoRes createEmptyInstance() => create();
  static $pb.PbList<ArtifactInfoRes> createRepeated() =>
      $pb.PbList<ArtifactInfoRes>();
  @$core.pragma('dart2js:noInline')
  static ArtifactInfoRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArtifactInfoRes>(create);
  static ArtifactInfoRes? _defaultInstance;

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
  ArtifactInfo get artifactInfo => $_getN(2);
  @$pb.TagNumber(3)
  set artifactInfo(ArtifactInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasArtifactInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearArtifactInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  ArtifactInfo ensureArtifactInfo() => $_ensure(2);

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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
