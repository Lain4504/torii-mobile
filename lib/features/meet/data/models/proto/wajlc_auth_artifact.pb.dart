//
//  Generated code. Do not modify.
//  source: wajlc_auth_artifact.proto
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
import 'wajlc_room_artifacts.pb.dart' as $18;
import 'wajlc_room_artifacts.pbenum.dart' as $18;

/// Request to fetch a list of artifacts
class FetchArtifactsReq extends $pb.GeneratedMessage {
  factory FetchArtifactsReq({
    $core.Iterable<$core.String>? roomIds,
    $core.String? roomSid,
    $18.RoomArtifactType? type,
    $fixnum.Int64? from,
    $fixnum.Int64? limit,
    $core.String? orderBy,
  }) {
    final $result = create();
    if (roomIds != null) {
      $result.roomIds.addAll(roomIds);
    }
    if (roomSid != null) {
      $result.roomSid = roomSid;
    }
    if (type != null) {
      $result.type = type;
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
  FetchArtifactsReq._() : super();
  factory FetchArtifactsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchArtifactsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchArtifactsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'roomIds')
    ..aOS(2, _omitFieldNames ? '' : 'roomSid')
    ..e<$18.RoomArtifactType>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $18.RoomArtifactType.UNKNOWN_ARTIFACT, valueOf: $18.RoomArtifactType.valueOf, enumValues: $18.RoomArtifactType.values)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'orderBy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchArtifactsReq clone() => FetchArtifactsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchArtifactsReq copyWith(void Function(FetchArtifactsReq) updates) => super.copyWith((message) => updates(message as FetchArtifactsReq)) as FetchArtifactsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchArtifactsReq create() => FetchArtifactsReq._();
  FetchArtifactsReq createEmptyInstance() => create();
  static $pb.PbList<FetchArtifactsReq> createRepeated() => $pb.PbList<FetchArtifactsReq>();
  @$core.pragma('dart2js:noInline')
  static FetchArtifactsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchArtifactsReq>(create);
  static FetchArtifactsReq? _defaultInstance;

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
  $18.RoomArtifactType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type($18.RoomArtifactType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get from => $_getI64(3);
  @$pb.TagNumber(4)
  set from($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrom() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get limit => $_getI64(4);
  @$pb.TagNumber(5)
  set limit($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearLimit() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get orderBy => $_getSZ(5);
  @$pb.TagNumber(6)
  set orderBy($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrderBy() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderBy() => clearField(6);
}

/// A single artifact entry in the list response
class ArtifactInfo extends $pb.GeneratedMessage {
  factory ArtifactInfo({
    $core.String? artifactId,
    $core.String? roomId,
    $18.RoomArtifactType? type,
    $core.String? created,
    $18.RoomArtifactMetadata? metadata,
  }) {
    final $result = create();
    if (artifactId != null) {
      $result.artifactId = artifactId;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (type != null) {
      $result.type = type;
    }
    if (created != null) {
      $result.created = created;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  ArtifactInfo._() : super();
  factory ArtifactInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArtifactInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ArtifactInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'artifactId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..e<$18.RoomArtifactType>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $18.RoomArtifactType.UNKNOWN_ARTIFACT, valueOf: $18.RoomArtifactType.valueOf, enumValues: $18.RoomArtifactType.values)
    ..aOS(4, _omitFieldNames ? '' : 'created')
    ..aOM<$18.RoomArtifactMetadata>(5, _omitFieldNames ? '' : 'metadata', subBuilder: $18.RoomArtifactMetadata.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArtifactInfo clone() => ArtifactInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArtifactInfo copyWith(void Function(ArtifactInfo) updates) => super.copyWith((message) => updates(message as ArtifactInfo)) as ArtifactInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArtifactInfo create() => ArtifactInfo._();
  ArtifactInfo createEmptyInstance() => create();
  static $pb.PbList<ArtifactInfo> createRepeated() => $pb.PbList<ArtifactInfo>();
  @$core.pragma('dart2js:noInline')
  static ArtifactInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArtifactInfo>(create);
  static ArtifactInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get artifactId => $_getSZ(0);
  @$pb.TagNumber(1)
  set artifactId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasArtifactId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtifactId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => clearField(2);

  @$pb.TagNumber(3)
  $18.RoomArtifactType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type($18.RoomArtifactType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get created => $_getSZ(3);
  @$pb.TagNumber(4)
  set created($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreated() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreated() => clearField(4);

  @$pb.TagNumber(5)
  $18.RoomArtifactMetadata get metadata => $_getN(4);
  @$pb.TagNumber(5)
  set metadata($18.RoomArtifactMetadata v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMetadata() => $_has(4);
  @$pb.TagNumber(5)
  void clearMetadata() => clearField(5);
  @$pb.TagNumber(5)
  $18.RoomArtifactMetadata ensureMetadata() => $_ensure(4);
}

/// Result for fetching artifacts
class FetchArtifactsResult extends $pb.GeneratedMessage {
  factory FetchArtifactsResult({
    $fixnum.Int64? totalArtifacts,
    $fixnum.Int64? from,
    $fixnum.Int64? limit,
    $core.String? orderBy,
    $18.RoomArtifactType? type,
    $core.Iterable<ArtifactInfo>? artifactsList,
  }) {
    final $result = create();
    if (totalArtifacts != null) {
      $result.totalArtifacts = totalArtifacts;
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
    if (type != null) {
      $result.type = type;
    }
    if (artifactsList != null) {
      $result.artifactsList.addAll(artifactsList);
    }
    return $result;
  }
  FetchArtifactsResult._() : super();
  factory FetchArtifactsResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchArtifactsResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchArtifactsResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalArtifacts')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'orderBy')
    ..e<$18.RoomArtifactType>(5, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $18.RoomArtifactType.UNKNOWN_ARTIFACT, valueOf: $18.RoomArtifactType.valueOf, enumValues: $18.RoomArtifactType.values)
    ..pc<ArtifactInfo>(6, _omitFieldNames ? '' : 'artifactsList', $pb.PbFieldType.PM, subBuilder: ArtifactInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchArtifactsResult clone() => FetchArtifactsResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchArtifactsResult copyWith(void Function(FetchArtifactsResult) updates) => super.copyWith((message) => updates(message as FetchArtifactsResult)) as FetchArtifactsResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchArtifactsResult create() => FetchArtifactsResult._();
  FetchArtifactsResult createEmptyInstance() => create();
  static $pb.PbList<FetchArtifactsResult> createRepeated() => $pb.PbList<FetchArtifactsResult>();
  @$core.pragma('dart2js:noInline')
  static FetchArtifactsResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchArtifactsResult>(create);
  static FetchArtifactsResult? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalArtifacts => $_getI64(0);
  @$pb.TagNumber(1)
  set totalArtifacts($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotalArtifacts() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalArtifacts() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get from => $_getI64(1);
  @$pb.TagNumber(2)
  set from($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get limit => $_getI64(2);
  @$pb.TagNumber(3)
  set limit($fixnum.Int64 v) { $_setInt64(2, v); }
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
  $18.RoomArtifactType get type => $_getN(4);
  @$pb.TagNumber(5)
  set type($18.RoomArtifactType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<ArtifactInfo> get artifactsList => $_getList(5);
}

/// Response for fetching artifacts
class FetchArtifactsRes extends $pb.GeneratedMessage {
  factory FetchArtifactsRes({
    $core.bool? status,
    $core.String? msg,
    FetchArtifactsResult? result,
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
  FetchArtifactsRes._() : super();
  factory FetchArtifactsRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchArtifactsRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchArtifactsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<FetchArtifactsResult>(3, _omitFieldNames ? '' : 'result', subBuilder: FetchArtifactsResult.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchArtifactsRes clone() => FetchArtifactsRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchArtifactsRes copyWith(void Function(FetchArtifactsRes) updates) => super.copyWith((message) => updates(message as FetchArtifactsRes)) as FetchArtifactsRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchArtifactsRes create() => FetchArtifactsRes._();
  FetchArtifactsRes createEmptyInstance() => create();
  static $pb.PbList<FetchArtifactsRes> createRepeated() => $pb.PbList<FetchArtifactsRes>();
  @$core.pragma('dart2js:noInline')
  static FetchArtifactsRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchArtifactsRes>(create);
  static FetchArtifactsRes? _defaultInstance;

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
  FetchArtifactsResult get result => $_getN(2);
  @$pb.TagNumber(3)
  set result(FetchArtifactsResult v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearResult() => clearField(3);
  @$pb.TagNumber(3)
  FetchArtifactsResult ensureResult() => $_ensure(2);
}

/// Request to get a download token for an artifact
class GetArtifactDownloadTokenReq extends $pb.GeneratedMessage {
  factory GetArtifactDownloadTokenReq({
    $core.String? artifactId,
  }) {
    final $result = create();
    if (artifactId != null) {
      $result.artifactId = artifactId;
    }
    return $result;
  }
  GetArtifactDownloadTokenReq._() : super();
  factory GetArtifactDownloadTokenReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetArtifactDownloadTokenReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetArtifactDownloadTokenReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'artifactId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetArtifactDownloadTokenReq clone() => GetArtifactDownloadTokenReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetArtifactDownloadTokenReq copyWith(void Function(GetArtifactDownloadTokenReq) updates) => super.copyWith((message) => updates(message as GetArtifactDownloadTokenReq)) as GetArtifactDownloadTokenReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetArtifactDownloadTokenReq create() => GetArtifactDownloadTokenReq._();
  GetArtifactDownloadTokenReq createEmptyInstance() => create();
  static $pb.PbList<GetArtifactDownloadTokenReq> createRepeated() => $pb.PbList<GetArtifactDownloadTokenReq>();
  @$core.pragma('dart2js:noInline')
  static GetArtifactDownloadTokenReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetArtifactDownloadTokenReq>(create);
  static GetArtifactDownloadTokenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get artifactId => $_getSZ(0);
  @$pb.TagNumber(1)
  set artifactId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasArtifactId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtifactId() => clearField(1);
}

/// Response for a download token
class GetArtifactDownloadTokenRes extends $pb.GeneratedMessage {
  factory GetArtifactDownloadTokenRes({
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
  GetArtifactDownloadTokenRes._() : super();
  factory GetArtifactDownloadTokenRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetArtifactDownloadTokenRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetArtifactDownloadTokenRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetArtifactDownloadTokenRes clone() => GetArtifactDownloadTokenRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetArtifactDownloadTokenRes copyWith(void Function(GetArtifactDownloadTokenRes) updates) => super.copyWith((message) => updates(message as GetArtifactDownloadTokenRes)) as GetArtifactDownloadTokenRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetArtifactDownloadTokenRes create() => GetArtifactDownloadTokenRes._();
  GetArtifactDownloadTokenRes createEmptyInstance() => create();
  static $pb.PbList<GetArtifactDownloadTokenRes> createRepeated() => $pb.PbList<GetArtifactDownloadTokenRes>();
  @$core.pragma('dart2js:noInline')
  static GetArtifactDownloadTokenRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetArtifactDownloadTokenRes>(create);
  static GetArtifactDownloadTokenRes? _defaultInstance;

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

/// Request to delete an artifact
class DeleteArtifactReq extends $pb.GeneratedMessage {
  factory DeleteArtifactReq({
    $core.String? artifactId,
  }) {
    final $result = create();
    if (artifactId != null) {
      $result.artifactId = artifactId;
    }
    return $result;
  }
  DeleteArtifactReq._() : super();
  factory DeleteArtifactReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteArtifactReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteArtifactReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'artifactId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteArtifactReq clone() => DeleteArtifactReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteArtifactReq copyWith(void Function(DeleteArtifactReq) updates) => super.copyWith((message) => updates(message as DeleteArtifactReq)) as DeleteArtifactReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteArtifactReq create() => DeleteArtifactReq._();
  DeleteArtifactReq createEmptyInstance() => create();
  static $pb.PbList<DeleteArtifactReq> createRepeated() => $pb.PbList<DeleteArtifactReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteArtifactReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteArtifactReq>(create);
  static DeleteArtifactReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get artifactId => $_getSZ(0);
  @$pb.TagNumber(1)
  set artifactId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasArtifactId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtifactId() => clearField(1);
}

/// Response for deleting an artifact
class DeleteArtifactRes extends $pb.GeneratedMessage {
  factory DeleteArtifactRes({
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
  DeleteArtifactRes._() : super();
  factory DeleteArtifactRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteArtifactRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteArtifactRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteArtifactRes clone() => DeleteArtifactRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteArtifactRes copyWith(void Function(DeleteArtifactRes) updates) => super.copyWith((message) => updates(message as DeleteArtifactRes)) as DeleteArtifactRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteArtifactRes create() => DeleteArtifactRes._();
  DeleteArtifactRes createEmptyInstance() => create();
  static $pb.PbList<DeleteArtifactRes> createRepeated() => $pb.PbList<DeleteArtifactRes>();
  @$core.pragma('dart2js:noInline')
  static DeleteArtifactRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteArtifactRes>(create);
  static DeleteArtifactRes? _defaultInstance;

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

class ArtifactInfoReq extends $pb.GeneratedMessage {
  factory ArtifactInfoReq({
    $core.String? artifactId,
  }) {
    final $result = create();
    if (artifactId != null) {
      $result.artifactId = artifactId;
    }
    return $result;
  }
  ArtifactInfoReq._() : super();
  factory ArtifactInfoReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArtifactInfoReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ArtifactInfoReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'artifactId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArtifactInfoReq clone() => ArtifactInfoReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArtifactInfoReq copyWith(void Function(ArtifactInfoReq) updates) => super.copyWith((message) => updates(message as ArtifactInfoReq)) as ArtifactInfoReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArtifactInfoReq create() => ArtifactInfoReq._();
  ArtifactInfoReq createEmptyInstance() => create();
  static $pb.PbList<ArtifactInfoReq> createRepeated() => $pb.PbList<ArtifactInfoReq>();
  @$core.pragma('dart2js:noInline')
  static ArtifactInfoReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArtifactInfoReq>(create);
  static ArtifactInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get artifactId => $_getSZ(0);
  @$pb.TagNumber(1)
  set artifactId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasArtifactId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtifactId() => clearField(1);
}

class ArtifactInfoRes extends $pb.GeneratedMessage {
  factory ArtifactInfoRes({
    $core.bool? status,
    $core.String? msg,
    ArtifactInfo? artifactInfo,
    $19.PastRoomInfo? roomInfo,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (artifactInfo != null) {
      $result.artifactInfo = artifactInfo;
    }
    if (roomInfo != null) {
      $result.roomInfo = roomInfo;
    }
    return $result;
  }
  ArtifactInfoRes._() : super();
  factory ArtifactInfoRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArtifactInfoRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ArtifactInfoRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<ArtifactInfo>(3, _omitFieldNames ? '' : 'artifactInfo', subBuilder: ArtifactInfo.create)
    ..aOM<$19.PastRoomInfo>(4, _omitFieldNames ? '' : 'roomInfo', subBuilder: $19.PastRoomInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArtifactInfoRes clone() => ArtifactInfoRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArtifactInfoRes copyWith(void Function(ArtifactInfoRes) updates) => super.copyWith((message) => updates(message as ArtifactInfoRes)) as ArtifactInfoRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArtifactInfoRes create() => ArtifactInfoRes._();
  ArtifactInfoRes createEmptyInstance() => create();
  static $pb.PbList<ArtifactInfoRes> createRepeated() => $pb.PbList<ArtifactInfoRes>();
  @$core.pragma('dart2js:noInline')
  static ArtifactInfoRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArtifactInfoRes>(create);
  static ArtifactInfoRes? _defaultInstance;

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
  ArtifactInfo get artifactInfo => $_getN(2);
  @$pb.TagNumber(3)
  set artifactInfo(ArtifactInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasArtifactInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearArtifactInfo() => clearField(3);
  @$pb.TagNumber(3)
  ArtifactInfo ensureArtifactInfo() => $_ensure(2);

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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
