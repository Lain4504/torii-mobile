//
//  Generated code. Do not modify.
//  source: livekit_cloud_agent.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;
import 'livekit_cloud_agent.pbenum.dart';

export 'livekit_cloud_agent.pbenum.dart';

class AgentSecret extends $pb.GeneratedMessage {
  factory AgentSecret({
    $core.String? name,
    $core.List<$core.int>? value,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
    AgentSecretKind? kind,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (value != null) {
      $result.value = value;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (kind != null) {
      $result.kind = kind;
    }
    return $result;
  }
  AgentSecret._() : super();
  factory AgentSecret.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AgentSecret.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AgentSecret', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..e<AgentSecretKind>(5, _omitFieldNames ? '' : 'kind', $pb.PbFieldType.OE, defaultOrMaker: AgentSecretKind.AGENT_SECRET_KIND_UNKNOWN, valueOf: AgentSecretKind.valueOf, enumValues: AgentSecretKind.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AgentSecret clone() => AgentSecret()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AgentSecret copyWith(void Function(AgentSecret) updates) => super.copyWith((message) => updates(message as AgentSecret)) as AgentSecret;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentSecret create() => AgentSecret._();
  AgentSecret createEmptyInstance() => create();
  static $pb.PbList<AgentSecret> createRepeated() => $pb.PbList<AgentSecret>();
  @$core.pragma('dart2js:noInline')
  static AgentSecret getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AgentSecret>(create);
  static AgentSecret? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($0.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureCreatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Timestamp get updatedAt => $_getN(3);
  @$pb.TagNumber(4)
  set updatedAt($0.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUpdatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureUpdatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  AgentSecretKind get kind => $_getN(4);
  @$pb.TagNumber(5)
  set kind(AgentSecretKind v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasKind() => $_has(4);
  @$pb.TagNumber(5)
  void clearKind() => clearField(5);
}

class CreateAgentRequest extends $pb.GeneratedMessage {
  factory CreateAgentRequest({
  @$core.Deprecated('This field is deprecated.')
    $core.String? agentName,
    $core.Iterable<AgentSecret>? secrets,
  @$core.Deprecated('This field is deprecated.')
    $core.int? replicas,
  @$core.Deprecated('This field is deprecated.')
    $core.int? maxReplicas,
  @$core.Deprecated('This field is deprecated.')
    $core.String? cpuReq,
    $core.Iterable<$core.String>? regions,
  }) {
    final $result = create();
    if (agentName != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.agentName = agentName;
    }
    if (secrets != null) {
      $result.secrets.addAll(secrets);
    }
    if (replicas != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.replicas = replicas;
    }
    if (maxReplicas != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.maxReplicas = maxReplicas;
    }
    if (cpuReq != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.cpuReq = cpuReq;
    }
    if (regions != null) {
      $result.regions.addAll(regions);
    }
    return $result;
  }
  CreateAgentRequest._() : super();
  factory CreateAgentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAgentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAgentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentName')
    ..pc<AgentSecret>(2, _omitFieldNames ? '' : 'secrets', $pb.PbFieldType.PM, subBuilder: AgentSecret.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'replicas', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'maxReplicas', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'cpuReq')
    ..pPS(6, _omitFieldNames ? '' : 'regions')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAgentRequest clone() => CreateAgentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAgentRequest copyWith(void Function(CreateAgentRequest) updates) => super.copyWith((message) => updates(message as CreateAgentRequest)) as CreateAgentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAgentRequest create() => CreateAgentRequest._();
  CreateAgentRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAgentRequest> createRepeated() => $pb.PbList<CreateAgentRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAgentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAgentRequest>(create);
  static CreateAgentRequest? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.String get agentName => $_getSZ(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set agentName($core.String v) { $_setString(0, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasAgentName() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearAgentName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<AgentSecret> get secrets => $_getList(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.int get replicas => $_getIZ(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  set replicas($core.int v) { $_setSignedInt32(2, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.bool hasReplicas() => $_has(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  void clearReplicas() => clearField(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.int get maxReplicas => $_getIZ(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set maxReplicas($core.int v) { $_setSignedInt32(3, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasMaxReplicas() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearMaxReplicas() => clearField(4);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.String get cpuReq => $_getSZ(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set cpuReq($core.String v) { $_setString(4, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasCpuReq() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearCpuReq() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get regions => $_getList(5);
}

class CreateAgentResponse extends $pb.GeneratedMessage {
  factory CreateAgentResponse({
    $core.String? agentId,
    $core.String? agentName,
    $core.String? status,
    $core.String? version,
    $core.String? presignedUrl,
    $core.String? tag,
    $core.Iterable<$core.String>? serverRegions,
    PresignedPostRequest? presignedPostRequest,
  }) {
    final $result = create();
    if (agentId != null) {
      $result.agentId = agentId;
    }
    if (agentName != null) {
      $result.agentName = agentName;
    }
    if (status != null) {
      $result.status = status;
    }
    if (version != null) {
      $result.version = version;
    }
    if (presignedUrl != null) {
      $result.presignedUrl = presignedUrl;
    }
    if (tag != null) {
      $result.tag = tag;
    }
    if (serverRegions != null) {
      $result.serverRegions.addAll(serverRegions);
    }
    if (presignedPostRequest != null) {
      $result.presignedPostRequest = presignedPostRequest;
    }
    return $result;
  }
  CreateAgentResponse._() : super();
  factory CreateAgentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAgentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAgentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..aOS(3, _omitFieldNames ? '' : 'status')
    ..aOS(4, _omitFieldNames ? '' : 'version')
    ..aOS(5, _omitFieldNames ? '' : 'presignedUrl')
    ..aOS(6, _omitFieldNames ? '' : 'tag')
    ..pPS(7, _omitFieldNames ? '' : 'serverRegions')
    ..aOM<PresignedPostRequest>(8, _omitFieldNames ? '' : 'presignedPostRequest', subBuilder: PresignedPostRequest.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAgentResponse clone() => CreateAgentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAgentResponse copyWith(void Function(CreateAgentResponse) updates) => super.copyWith((message) => updates(message as CreateAgentResponse)) as CreateAgentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAgentResponse create() => CreateAgentResponse._();
  CreateAgentResponse createEmptyInstance() => create();
  static $pb.PbList<CreateAgentResponse> createRepeated() => $pb.PbList<CreateAgentResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateAgentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAgentResponse>(create);
  static CreateAgentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get status => $_getSZ(2);
  @$pb.TagNumber(3)
  set status($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get version => $_getSZ(3);
  @$pb.TagNumber(4)
  set version($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersion() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get presignedUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set presignedUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPresignedUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearPresignedUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get tag => $_getSZ(5);
  @$pb.TagNumber(6)
  set tag($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTag() => $_has(5);
  @$pb.TagNumber(6)
  void clearTag() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.String> get serverRegions => $_getList(6);

  @$pb.TagNumber(8)
  PresignedPostRequest get presignedPostRequest => $_getN(7);
  @$pb.TagNumber(8)
  set presignedPostRequest(PresignedPostRequest v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasPresignedPostRequest() => $_has(7);
  @$pb.TagNumber(8)
  void clearPresignedPostRequest() => clearField(8);
  @$pb.TagNumber(8)
  PresignedPostRequest ensurePresignedPostRequest() => $_ensure(7);
}

class PresignedPostRequest extends $pb.GeneratedMessage {
  factory PresignedPostRequest({
    $core.String? url,
    $core.Map<$core.String, $core.String>? values,
  }) {
    final $result = create();
    if (url != null) {
      $result.url = url;
    }
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  PresignedPostRequest._() : super();
  factory PresignedPostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PresignedPostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PresignedPostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'values', entryClassName: 'PresignedPostRequest.ValuesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PresignedPostRequest clone() => PresignedPostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PresignedPostRequest copyWith(void Function(PresignedPostRequest) updates) => super.copyWith((message) => updates(message as PresignedPostRequest)) as PresignedPostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PresignedPostRequest create() => PresignedPostRequest._();
  PresignedPostRequest createEmptyInstance() => create();
  static $pb.PbList<PresignedPostRequest> createRepeated() => $pb.PbList<PresignedPostRequest>();
  @$core.pragma('dart2js:noInline')
  static PresignedPostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PresignedPostRequest>(create);
  static PresignedPostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.String, $core.String> get values => $_getMap(1);
}

class AgentDeployment extends $pb.GeneratedMessage {
  factory AgentDeployment({
    $core.String? region,
    $core.String? agentId,
    $core.String? status,
    $core.int? replicas,
    $core.int? minReplicas,
    $core.int? maxReplicas,
    $core.String? cpuReq,
    $core.String? curCpu,
    $core.String? curMem,
    $core.String? memReq,
    $core.String? memLimit,
    $core.String? cpuLimit,
    $core.String? serverRegion,
  }) {
    final $result = create();
    if (region != null) {
      $result.region = region;
    }
    if (agentId != null) {
      $result.agentId = agentId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (replicas != null) {
      $result.replicas = replicas;
    }
    if (minReplicas != null) {
      $result.minReplicas = minReplicas;
    }
    if (maxReplicas != null) {
      $result.maxReplicas = maxReplicas;
    }
    if (cpuReq != null) {
      $result.cpuReq = cpuReq;
    }
    if (curCpu != null) {
      $result.curCpu = curCpu;
    }
    if (curMem != null) {
      $result.curMem = curMem;
    }
    if (memReq != null) {
      $result.memReq = memReq;
    }
    if (memLimit != null) {
      $result.memLimit = memLimit;
    }
    if (cpuLimit != null) {
      $result.cpuLimit = cpuLimit;
    }
    if (serverRegion != null) {
      $result.serverRegion = serverRegion;
    }
    return $result;
  }
  AgentDeployment._() : super();
  factory AgentDeployment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AgentDeployment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AgentDeployment', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'region')
    ..aOS(2, _omitFieldNames ? '' : 'agentId')
    ..aOS(3, _omitFieldNames ? '' : 'status')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'replicas', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'minReplicas', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'maxReplicas', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'cpuReq')
    ..aOS(8, _omitFieldNames ? '' : 'curCpu')
    ..aOS(9, _omitFieldNames ? '' : 'curMem')
    ..aOS(10, _omitFieldNames ? '' : 'memReq')
    ..aOS(11, _omitFieldNames ? '' : 'memLimit')
    ..aOS(12, _omitFieldNames ? '' : 'cpuLimit')
    ..aOS(13, _omitFieldNames ? '' : 'serverRegion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AgentDeployment clone() => AgentDeployment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AgentDeployment copyWith(void Function(AgentDeployment) updates) => super.copyWith((message) => updates(message as AgentDeployment)) as AgentDeployment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentDeployment create() => AgentDeployment._();
  AgentDeployment createEmptyInstance() => create();
  static $pb.PbList<AgentDeployment> createRepeated() => $pb.PbList<AgentDeployment>();
  @$core.pragma('dart2js:noInline')
  static AgentDeployment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AgentDeployment>(create);
  static AgentDeployment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get region => $_getSZ(0);
  @$pb.TagNumber(1)
  set region($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRegion() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegion() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAgentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get status => $_getSZ(2);
  @$pb.TagNumber(3)
  set status($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get replicas => $_getIZ(3);
  @$pb.TagNumber(4)
  set replicas($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReplicas() => $_has(3);
  @$pb.TagNumber(4)
  void clearReplicas() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get minReplicas => $_getIZ(4);
  @$pb.TagNumber(5)
  set minReplicas($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMinReplicas() => $_has(4);
  @$pb.TagNumber(5)
  void clearMinReplicas() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get maxReplicas => $_getIZ(5);
  @$pb.TagNumber(6)
  set maxReplicas($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMaxReplicas() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxReplicas() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get cpuReq => $_getSZ(6);
  @$pb.TagNumber(7)
  set cpuReq($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCpuReq() => $_has(6);
  @$pb.TagNumber(7)
  void clearCpuReq() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get curCpu => $_getSZ(7);
  @$pb.TagNumber(8)
  set curCpu($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCurCpu() => $_has(7);
  @$pb.TagNumber(8)
  void clearCurCpu() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get curMem => $_getSZ(8);
  @$pb.TagNumber(9)
  set curMem($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCurMem() => $_has(8);
  @$pb.TagNumber(9)
  void clearCurMem() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get memReq => $_getSZ(9);
  @$pb.TagNumber(10)
  set memReq($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasMemReq() => $_has(9);
  @$pb.TagNumber(10)
  void clearMemReq() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get memLimit => $_getSZ(10);
  @$pb.TagNumber(11)
  set memLimit($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasMemLimit() => $_has(10);
  @$pb.TagNumber(11)
  void clearMemLimit() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get cpuLimit => $_getSZ(11);
  @$pb.TagNumber(12)
  set cpuLimit($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasCpuLimit() => $_has(11);
  @$pb.TagNumber(12)
  void clearCpuLimit() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get serverRegion => $_getSZ(12);
  @$pb.TagNumber(13)
  set serverRegion($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasServerRegion() => $_has(12);
  @$pb.TagNumber(13)
  void clearServerRegion() => clearField(13);
}

class AgentInfo extends $pb.GeneratedMessage {
  factory AgentInfo({
    $core.String? agentId,
    $core.String? agentName,
    $core.String? version,
    $core.Iterable<AgentDeployment>? agentDeployments,
    $core.Iterable<AgentSecret>? secrets,
    $0.Timestamp? deployedAt,
  }) {
    final $result = create();
    if (agentId != null) {
      $result.agentId = agentId;
    }
    if (agentName != null) {
      $result.agentName = agentName;
    }
    if (version != null) {
      $result.version = version;
    }
    if (agentDeployments != null) {
      $result.agentDeployments.addAll(agentDeployments);
    }
    if (secrets != null) {
      $result.secrets.addAll(secrets);
    }
    if (deployedAt != null) {
      $result.deployedAt = deployedAt;
    }
    return $result;
  }
  AgentInfo._() : super();
  factory AgentInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AgentInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AgentInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..aOS(3, _omitFieldNames ? '' : 'version')
    ..pc<AgentDeployment>(4, _omitFieldNames ? '' : 'agentDeployments', $pb.PbFieldType.PM, subBuilder: AgentDeployment.create)
    ..pc<AgentSecret>(5, _omitFieldNames ? '' : 'secrets', $pb.PbFieldType.PM, subBuilder: AgentSecret.create)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'deployedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AgentInfo clone() => AgentInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AgentInfo copyWith(void Function(AgentInfo) updates) => super.copyWith((message) => updates(message as AgentInfo)) as AgentInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentInfo create() => AgentInfo._();
  AgentInfo createEmptyInstance() => create();
  static $pb.PbList<AgentInfo> createRepeated() => $pb.PbList<AgentInfo>();
  @$core.pragma('dart2js:noInline')
  static AgentInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AgentInfo>(create);
  static AgentInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get version => $_getSZ(2);
  @$pb.TagNumber(3)
  set version($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<AgentDeployment> get agentDeployments => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<AgentSecret> get secrets => $_getList(4);

  @$pb.TagNumber(6)
  $0.Timestamp get deployedAt => $_getN(5);
  @$pb.TagNumber(6)
  set deployedAt($0.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDeployedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeployedAt() => clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureDeployedAt() => $_ensure(5);
}

class ListAgentsRequest extends $pb.GeneratedMessage {
  factory ListAgentsRequest({
    $core.String? agentName,
    $core.String? agentId,
  }) {
    final $result = create();
    if (agentName != null) {
      $result.agentName = agentName;
    }
    if (agentId != null) {
      $result.agentId = agentId;
    }
    return $result;
  }
  ListAgentsRequest._() : super();
  factory ListAgentsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAgentsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAgentsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentName')
    ..aOS(2, _omitFieldNames ? '' : 'agentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAgentsRequest clone() => ListAgentsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAgentsRequest copyWith(void Function(ListAgentsRequest) updates) => super.copyWith((message) => updates(message as ListAgentsRequest)) as ListAgentsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentsRequest create() => ListAgentsRequest._();
  ListAgentsRequest createEmptyInstance() => create();
  static $pb.PbList<ListAgentsRequest> createRepeated() => $pb.PbList<ListAgentsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAgentsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAgentsRequest>(create);
  static ListAgentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentName => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgentName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAgentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentId() => clearField(2);
}

class ListAgentsResponse extends $pb.GeneratedMessage {
  factory ListAgentsResponse({
    $core.Iterable<AgentInfo>? agents,
  }) {
    final $result = create();
    if (agents != null) {
      $result.agents.addAll(agents);
    }
    return $result;
  }
  ListAgentsResponse._() : super();
  factory ListAgentsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAgentsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAgentsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<AgentInfo>(1, _omitFieldNames ? '' : 'agents', $pb.PbFieldType.PM, subBuilder: AgentInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAgentsResponse clone() => ListAgentsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAgentsResponse copyWith(void Function(ListAgentsResponse) updates) => super.copyWith((message) => updates(message as ListAgentsResponse)) as ListAgentsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentsResponse create() => ListAgentsResponse._();
  ListAgentsResponse createEmptyInstance() => create();
  static $pb.PbList<ListAgentsResponse> createRepeated() => $pb.PbList<ListAgentsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAgentsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAgentsResponse>(create);
  static ListAgentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AgentInfo> get agents => $_getList(0);
}

class AgentVersion extends $pb.GeneratedMessage {
  factory AgentVersion({
    $core.String? version,
    $core.bool? current,
    $0.Timestamp? createdAt,
    $0.Timestamp? deployedAt,
    $core.Map<$core.String, $core.String>? attributes,
    $core.String? status,
    $core.String? owner,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (current != null) {
      $result.current = current;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (deployedAt != null) {
      $result.deployedAt = deployedAt;
    }
    if (attributes != null) {
      $result.attributes.addAll(attributes);
    }
    if (status != null) {
      $result.status = status;
    }
    if (owner != null) {
      $result.owner = owner;
    }
    return $result;
  }
  AgentVersion._() : super();
  factory AgentVersion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AgentVersion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AgentVersion', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'version')
    ..aOB(2, _omitFieldNames ? '' : 'current')
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'deployedAt', subBuilder: $0.Timestamp.create)
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'attributes', entryClassName: 'AgentVersion.AttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..aOS(6, _omitFieldNames ? '' : 'status')
    ..aOS(7, _omitFieldNames ? '' : 'owner')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AgentVersion clone() => AgentVersion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AgentVersion copyWith(void Function(AgentVersion) updates) => super.copyWith((message) => updates(message as AgentVersion)) as AgentVersion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentVersion create() => AgentVersion._();
  AgentVersion createEmptyInstance() => create();
  static $pb.PbList<AgentVersion> createRepeated() => $pb.PbList<AgentVersion>();
  @$core.pragma('dart2js:noInline')
  static AgentVersion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AgentVersion>(create);
  static AgentVersion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get current => $_getBF(1);
  @$pb.TagNumber(2)
  set current($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrent() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrent() => clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($0.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureCreatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Timestamp get deployedAt => $_getN(3);
  @$pb.TagNumber(4)
  set deployedAt($0.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeployedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeployedAt() => clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureDeployedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get attributes => $_getMap(4);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get owner => $_getSZ(6);
  @$pb.TagNumber(7)
  set owner($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOwner() => $_has(6);
  @$pb.TagNumber(7)
  void clearOwner() => clearField(7);
}

class ListAgentVersionsRequest extends $pb.GeneratedMessage {
  factory ListAgentVersionsRequest({
    $core.String? agentId,
    $core.String? agentName,
  }) {
    final $result = create();
    if (agentId != null) {
      $result.agentId = agentId;
    }
    if (agentName != null) {
      $result.agentName = agentName;
    }
    return $result;
  }
  ListAgentVersionsRequest._() : super();
  factory ListAgentVersionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAgentVersionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAgentVersionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAgentVersionsRequest clone() => ListAgentVersionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAgentVersionsRequest copyWith(void Function(ListAgentVersionsRequest) updates) => super.copyWith((message) => updates(message as ListAgentVersionsRequest)) as ListAgentVersionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentVersionsRequest create() => ListAgentVersionsRequest._();
  ListAgentVersionsRequest createEmptyInstance() => create();
  static $pb.PbList<ListAgentVersionsRequest> createRepeated() => $pb.PbList<ListAgentVersionsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAgentVersionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAgentVersionsRequest>(create);
  static ListAgentVersionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => clearField(2);
}

class ListAgentVersionsResponse extends $pb.GeneratedMessage {
  factory ListAgentVersionsResponse({
    $core.Iterable<AgentVersion>? versions,
  }) {
    final $result = create();
    if (versions != null) {
      $result.versions.addAll(versions);
    }
    return $result;
  }
  ListAgentVersionsResponse._() : super();
  factory ListAgentVersionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAgentVersionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAgentVersionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<AgentVersion>(1, _omitFieldNames ? '' : 'versions', $pb.PbFieldType.PM, subBuilder: AgentVersion.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAgentVersionsResponse clone() => ListAgentVersionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAgentVersionsResponse copyWith(void Function(ListAgentVersionsResponse) updates) => super.copyWith((message) => updates(message as ListAgentVersionsResponse)) as ListAgentVersionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentVersionsResponse create() => ListAgentVersionsResponse._();
  ListAgentVersionsResponse createEmptyInstance() => create();
  static $pb.PbList<ListAgentVersionsResponse> createRepeated() => $pb.PbList<ListAgentVersionsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAgentVersionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAgentVersionsResponse>(create);
  static ListAgentVersionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AgentVersion> get versions => $_getList(0);
}

class UpdateAgentRequest extends $pb.GeneratedMessage {
  factory UpdateAgentRequest({
    $core.String? agentId,
  @$core.Deprecated('This field is deprecated.')
    $core.String? agentName,
  @$core.Deprecated('This field is deprecated.')
    $core.int? replicas,
  @$core.Deprecated('This field is deprecated.')
    $core.int? maxReplicas,
  @$core.Deprecated('This field is deprecated.')
    $core.String? cpuReq,
    $core.Iterable<$core.String>? regions,
    $core.Iterable<AgentSecret>? secrets,
  }) {
    final $result = create();
    if (agentId != null) {
      $result.agentId = agentId;
    }
    if (agentName != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.agentName = agentName;
    }
    if (replicas != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.replicas = replicas;
    }
    if (maxReplicas != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.maxReplicas = maxReplicas;
    }
    if (cpuReq != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.cpuReq = cpuReq;
    }
    if (regions != null) {
      $result.regions.addAll(regions);
    }
    if (secrets != null) {
      $result.secrets.addAll(secrets);
    }
    return $result;
  }
  UpdateAgentRequest._() : super();
  factory UpdateAgentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAgentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAgentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'replicas', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'maxReplicas', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'cpuReq')
    ..pPS(6, _omitFieldNames ? '' : 'regions')
    ..pc<AgentSecret>(7, _omitFieldNames ? '' : 'secrets', $pb.PbFieldType.PM, subBuilder: AgentSecret.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAgentRequest clone() => UpdateAgentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAgentRequest copyWith(void Function(UpdateAgentRequest) updates) => super.copyWith((message) => updates(message as UpdateAgentRequest)) as UpdateAgentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAgentRequest create() => UpdateAgentRequest._();
  UpdateAgentRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateAgentRequest> createRepeated() => $pb.PbList<UpdateAgentRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateAgentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAgentRequest>(create);
  static UpdateAgentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => clearField(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set agentName($core.String v) { $_setString(1, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearAgentName() => clearField(2);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.int get replicas => $_getIZ(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  set replicas($core.int v) { $_setSignedInt32(2, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.bool hasReplicas() => $_has(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  void clearReplicas() => clearField(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.int get maxReplicas => $_getIZ(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set maxReplicas($core.int v) { $_setSignedInt32(3, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasMaxReplicas() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearMaxReplicas() => clearField(4);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.String get cpuReq => $_getSZ(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set cpuReq($core.String v) { $_setString(4, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasCpuReq() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearCpuReq() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get regions => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<AgentSecret> get secrets => $_getList(6);
}

class UpdateAgentResponse extends $pb.GeneratedMessage {
  factory UpdateAgentResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  UpdateAgentResponse._() : super();
  factory UpdateAgentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAgentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAgentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAgentResponse clone() => UpdateAgentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAgentResponse copyWith(void Function(UpdateAgentResponse) updates) => super.copyWith((message) => updates(message as UpdateAgentResponse)) as UpdateAgentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAgentResponse create() => UpdateAgentResponse._();
  UpdateAgentResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateAgentResponse> createRepeated() => $pb.PbList<UpdateAgentResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateAgentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAgentResponse>(create);
  static UpdateAgentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class RestartAgentRequest extends $pb.GeneratedMessage {
  factory RestartAgentRequest({
    $core.String? agentId,
  }) {
    final $result = create();
    if (agentId != null) {
      $result.agentId = agentId;
    }
    return $result;
  }
  RestartAgentRequest._() : super();
  factory RestartAgentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestartAgentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RestartAgentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RestartAgentRequest clone() => RestartAgentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RestartAgentRequest copyWith(void Function(RestartAgentRequest) updates) => super.copyWith((message) => updates(message as RestartAgentRequest)) as RestartAgentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestartAgentRequest create() => RestartAgentRequest._();
  RestartAgentRequest createEmptyInstance() => create();
  static $pb.PbList<RestartAgentRequest> createRepeated() => $pb.PbList<RestartAgentRequest>();
  @$core.pragma('dart2js:noInline')
  static RestartAgentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestartAgentRequest>(create);
  static RestartAgentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => clearField(1);
}

class RestartAgentResponse extends $pb.GeneratedMessage {
  factory RestartAgentResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  RestartAgentResponse._() : super();
  factory RestartAgentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestartAgentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RestartAgentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RestartAgentResponse clone() => RestartAgentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RestartAgentResponse copyWith(void Function(RestartAgentResponse) updates) => super.copyWith((message) => updates(message as RestartAgentResponse)) as RestartAgentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestartAgentResponse create() => RestartAgentResponse._();
  RestartAgentResponse createEmptyInstance() => create();
  static $pb.PbList<RestartAgentResponse> createRepeated() => $pb.PbList<RestartAgentResponse>();
  @$core.pragma('dart2js:noInline')
  static RestartAgentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestartAgentResponse>(create);
  static RestartAgentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class DeployAgentRequest extends $pb.GeneratedMessage {
  factory DeployAgentRequest({
    $core.String? agentId,
  @$core.Deprecated('This field is deprecated.')
    $core.String? agentName,
    $core.Iterable<AgentSecret>? secrets,
  @$core.Deprecated('This field is deprecated.')
    $core.int? replicas,
  @$core.Deprecated('This field is deprecated.')
    $core.int? maxReplicas,
  @$core.Deprecated('This field is deprecated.')
    $core.String? cpuReq,
  }) {
    final $result = create();
    if (agentId != null) {
      $result.agentId = agentId;
    }
    if (agentName != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.agentName = agentName;
    }
    if (secrets != null) {
      $result.secrets.addAll(secrets);
    }
    if (replicas != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.replicas = replicas;
    }
    if (maxReplicas != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.maxReplicas = maxReplicas;
    }
    if (cpuReq != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.cpuReq = cpuReq;
    }
    return $result;
  }
  DeployAgentRequest._() : super();
  factory DeployAgentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeployAgentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeployAgentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..pc<AgentSecret>(3, _omitFieldNames ? '' : 'secrets', $pb.PbFieldType.PM, subBuilder: AgentSecret.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'replicas', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'maxReplicas', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'cpuReq')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeployAgentRequest clone() => DeployAgentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeployAgentRequest copyWith(void Function(DeployAgentRequest) updates) => super.copyWith((message) => updates(message as DeployAgentRequest)) as DeployAgentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeployAgentRequest create() => DeployAgentRequest._();
  DeployAgentRequest createEmptyInstance() => create();
  static $pb.PbList<DeployAgentRequest> createRepeated() => $pb.PbList<DeployAgentRequest>();
  @$core.pragma('dart2js:noInline')
  static DeployAgentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeployAgentRequest>(create);
  static DeployAgentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => clearField(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set agentName($core.String v) { $_setString(1, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearAgentName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<AgentSecret> get secrets => $_getList(2);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.int get replicas => $_getIZ(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set replicas($core.int v) { $_setSignedInt32(3, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasReplicas() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearReplicas() => clearField(4);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.int get maxReplicas => $_getIZ(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set maxReplicas($core.int v) { $_setSignedInt32(4, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasMaxReplicas() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearMaxReplicas() => clearField(5);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.String get cpuReq => $_getSZ(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set cpuReq($core.String v) { $_setString(5, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasCpuReq() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearCpuReq() => clearField(6);
}

class DeployAgentResponse extends $pb.GeneratedMessage {
  factory DeployAgentResponse({
    $core.bool? success,
    $core.String? message,
    $core.String? agentId,
    $core.String? presignedUrl,
    $core.String? tag,
    PresignedPostRequest? presignedPostRequest,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (message != null) {
      $result.message = message;
    }
    if (agentId != null) {
      $result.agentId = agentId;
    }
    if (presignedUrl != null) {
      $result.presignedUrl = presignedUrl;
    }
    if (tag != null) {
      $result.tag = tag;
    }
    if (presignedPostRequest != null) {
      $result.presignedPostRequest = presignedPostRequest;
    }
    return $result;
  }
  DeployAgentResponse._() : super();
  factory DeployAgentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeployAgentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeployAgentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOS(3, _omitFieldNames ? '' : 'agentId')
    ..aOS(4, _omitFieldNames ? '' : 'presignedUrl')
    ..aOS(5, _omitFieldNames ? '' : 'tag')
    ..aOM<PresignedPostRequest>(6, _omitFieldNames ? '' : 'presignedPostRequest', subBuilder: PresignedPostRequest.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeployAgentResponse clone() => DeployAgentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeployAgentResponse copyWith(void Function(DeployAgentResponse) updates) => super.copyWith((message) => updates(message as DeployAgentResponse)) as DeployAgentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeployAgentResponse create() => DeployAgentResponse._();
  DeployAgentResponse createEmptyInstance() => create();
  static $pb.PbList<DeployAgentResponse> createRepeated() => $pb.PbList<DeployAgentResponse>();
  @$core.pragma('dart2js:noInline')
  static DeployAgentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeployAgentResponse>(create);
  static DeployAgentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get agentId => $_getSZ(2);
  @$pb.TagNumber(3)
  set agentId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAgentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAgentId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get presignedUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set presignedUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPresignedUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearPresignedUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get tag => $_getSZ(4);
  @$pb.TagNumber(5)
  set tag($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTag() => $_has(4);
  @$pb.TagNumber(5)
  void clearTag() => clearField(5);

  @$pb.TagNumber(6)
  PresignedPostRequest get presignedPostRequest => $_getN(5);
  @$pb.TagNumber(6)
  set presignedPostRequest(PresignedPostRequest v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasPresignedPostRequest() => $_has(5);
  @$pb.TagNumber(6)
  void clearPresignedPostRequest() => clearField(6);
  @$pb.TagNumber(6)
  PresignedPostRequest ensurePresignedPostRequest() => $_ensure(5);
}

class UpdateAgentSecretsRequest extends $pb.GeneratedMessage {
  factory UpdateAgentSecretsRequest({
    $core.String? agentId,
    $core.String? agentName,
    $core.bool? overwrite,
    $core.Iterable<AgentSecret>? secrets,
    $core.Iterable<$core.String>? remove,
  }) {
    final $result = create();
    if (agentId != null) {
      $result.agentId = agentId;
    }
    if (agentName != null) {
      $result.agentName = agentName;
    }
    if (overwrite != null) {
      $result.overwrite = overwrite;
    }
    if (secrets != null) {
      $result.secrets.addAll(secrets);
    }
    if (remove != null) {
      $result.remove.addAll(remove);
    }
    return $result;
  }
  UpdateAgentSecretsRequest._() : super();
  factory UpdateAgentSecretsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAgentSecretsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAgentSecretsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..aOB(3, _omitFieldNames ? '' : 'overwrite')
    ..pc<AgentSecret>(4, _omitFieldNames ? '' : 'secrets', $pb.PbFieldType.PM, subBuilder: AgentSecret.create)
    ..pPS(5, _omitFieldNames ? '' : 'remove')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAgentSecretsRequest clone() => UpdateAgentSecretsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAgentSecretsRequest copyWith(void Function(UpdateAgentSecretsRequest) updates) => super.copyWith((message) => updates(message as UpdateAgentSecretsRequest)) as UpdateAgentSecretsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAgentSecretsRequest create() => UpdateAgentSecretsRequest._();
  UpdateAgentSecretsRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateAgentSecretsRequest> createRepeated() => $pb.PbList<UpdateAgentSecretsRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateAgentSecretsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAgentSecretsRequest>(create);
  static UpdateAgentSecretsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get overwrite => $_getBF(2);
  @$pb.TagNumber(3)
  set overwrite($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOverwrite() => $_has(2);
  @$pb.TagNumber(3)
  void clearOverwrite() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<AgentSecret> get secrets => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.String> get remove => $_getList(4);
}

class UpdateAgentSecretsResponse extends $pb.GeneratedMessage {
  factory UpdateAgentSecretsResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  UpdateAgentSecretsResponse._() : super();
  factory UpdateAgentSecretsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAgentSecretsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAgentSecretsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAgentSecretsResponse clone() => UpdateAgentSecretsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAgentSecretsResponse copyWith(void Function(UpdateAgentSecretsResponse) updates) => super.copyWith((message) => updates(message as UpdateAgentSecretsResponse)) as UpdateAgentSecretsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAgentSecretsResponse create() => UpdateAgentSecretsResponse._();
  UpdateAgentSecretsResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateAgentSecretsResponse> createRepeated() => $pb.PbList<UpdateAgentSecretsResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateAgentSecretsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAgentSecretsResponse>(create);
  static UpdateAgentSecretsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class RollbackAgentRequest extends $pb.GeneratedMessage {
  factory RollbackAgentRequest({
    $core.String? agentId,
    $core.String? agentName,
    $core.String? version,
  }) {
    final $result = create();
    if (agentId != null) {
      $result.agentId = agentId;
    }
    if (agentName != null) {
      $result.agentName = agentName;
    }
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  RollbackAgentRequest._() : super();
  factory RollbackAgentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RollbackAgentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RollbackAgentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..aOS(3, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RollbackAgentRequest clone() => RollbackAgentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RollbackAgentRequest copyWith(void Function(RollbackAgentRequest) updates) => super.copyWith((message) => updates(message as RollbackAgentRequest)) as RollbackAgentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RollbackAgentRequest create() => RollbackAgentRequest._();
  RollbackAgentRequest createEmptyInstance() => create();
  static $pb.PbList<RollbackAgentRequest> createRepeated() => $pb.PbList<RollbackAgentRequest>();
  @$core.pragma('dart2js:noInline')
  static RollbackAgentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RollbackAgentRequest>(create);
  static RollbackAgentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get version => $_getSZ(2);
  @$pb.TagNumber(3)
  set version($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);
}

class RollbackAgentResponse extends $pb.GeneratedMessage {
  factory RollbackAgentResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  RollbackAgentResponse._() : super();
  factory RollbackAgentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RollbackAgentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RollbackAgentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RollbackAgentResponse clone() => RollbackAgentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RollbackAgentResponse copyWith(void Function(RollbackAgentResponse) updates) => super.copyWith((message) => updates(message as RollbackAgentResponse)) as RollbackAgentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RollbackAgentResponse create() => RollbackAgentResponse._();
  RollbackAgentResponse createEmptyInstance() => create();
  static $pb.PbList<RollbackAgentResponse> createRepeated() => $pb.PbList<RollbackAgentResponse>();
  @$core.pragma('dart2js:noInline')
  static RollbackAgentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RollbackAgentResponse>(create);
  static RollbackAgentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class DeleteAgentRequest extends $pb.GeneratedMessage {
  factory DeleteAgentRequest({
    $core.String? agentId,
    $core.String? agentName,
  }) {
    final $result = create();
    if (agentId != null) {
      $result.agentId = agentId;
    }
    if (agentName != null) {
      $result.agentName = agentName;
    }
    return $result;
  }
  DeleteAgentRequest._() : super();
  factory DeleteAgentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAgentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAgentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAgentRequest clone() => DeleteAgentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAgentRequest copyWith(void Function(DeleteAgentRequest) updates) => super.copyWith((message) => updates(message as DeleteAgentRequest)) as DeleteAgentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAgentRequest create() => DeleteAgentRequest._();
  DeleteAgentRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteAgentRequest> createRepeated() => $pb.PbList<DeleteAgentRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteAgentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAgentRequest>(create);
  static DeleteAgentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => clearField(2);
}

class DeleteAgentResponse extends $pb.GeneratedMessage {
  factory DeleteAgentResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  DeleteAgentResponse._() : super();
  factory DeleteAgentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAgentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAgentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAgentResponse clone() => DeleteAgentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAgentResponse copyWith(void Function(DeleteAgentResponse) updates) => super.copyWith((message) => updates(message as DeleteAgentResponse)) as DeleteAgentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAgentResponse create() => DeleteAgentResponse._();
  DeleteAgentResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteAgentResponse> createRepeated() => $pb.PbList<DeleteAgentResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteAgentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAgentResponse>(create);
  static DeleteAgentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class ListAgentSecretsRequest extends $pb.GeneratedMessage {
  factory ListAgentSecretsRequest({
    $core.String? agentId,
    $core.String? agentName,
  }) {
    final $result = create();
    if (agentId != null) {
      $result.agentId = agentId;
    }
    if (agentName != null) {
      $result.agentName = agentName;
    }
    return $result;
  }
  ListAgentSecretsRequest._() : super();
  factory ListAgentSecretsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAgentSecretsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAgentSecretsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAgentSecretsRequest clone() => ListAgentSecretsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAgentSecretsRequest copyWith(void Function(ListAgentSecretsRequest) updates) => super.copyWith((message) => updates(message as ListAgentSecretsRequest)) as ListAgentSecretsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentSecretsRequest create() => ListAgentSecretsRequest._();
  ListAgentSecretsRequest createEmptyInstance() => create();
  static $pb.PbList<ListAgentSecretsRequest> createRepeated() => $pb.PbList<ListAgentSecretsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAgentSecretsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAgentSecretsRequest>(create);
  static ListAgentSecretsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => clearField(2);
}

class ListAgentSecretsResponse extends $pb.GeneratedMessage {
  factory ListAgentSecretsResponse({
    $core.Iterable<AgentSecret>? secrets,
  }) {
    final $result = create();
    if (secrets != null) {
      $result.secrets.addAll(secrets);
    }
    return $result;
  }
  ListAgentSecretsResponse._() : super();
  factory ListAgentSecretsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAgentSecretsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAgentSecretsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<AgentSecret>(1, _omitFieldNames ? '' : 'secrets', $pb.PbFieldType.PM, subBuilder: AgentSecret.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAgentSecretsResponse clone() => ListAgentSecretsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAgentSecretsResponse copyWith(void Function(ListAgentSecretsResponse) updates) => super.copyWith((message) => updates(message as ListAgentSecretsResponse)) as ListAgentSecretsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentSecretsResponse create() => ListAgentSecretsResponse._();
  ListAgentSecretsResponse createEmptyInstance() => create();
  static $pb.PbList<ListAgentSecretsResponse> createRepeated() => $pb.PbList<ListAgentSecretsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAgentSecretsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAgentSecretsResponse>(create);
  static ListAgentSecretsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AgentSecret> get secrets => $_getList(0);
}

class SettingsParam extends $pb.GeneratedMessage {
  factory SettingsParam({
    $core.String? name,
    $core.String? value,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  SettingsParam._() : super();
  factory SettingsParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SettingsParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SettingsParam', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SettingsParam clone() => SettingsParam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SettingsParam copyWith(void Function(SettingsParam) updates) => super.copyWith((message) => updates(message as SettingsParam)) as SettingsParam;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SettingsParam create() => SettingsParam._();
  SettingsParam createEmptyInstance() => create();
  static $pb.PbList<SettingsParam> createRepeated() => $pb.PbList<SettingsParam>();
  @$core.pragma('dart2js:noInline')
  static SettingsParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SettingsParam>(create);
  static SettingsParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class ClientSettingsResponse extends $pb.GeneratedMessage {
  factory ClientSettingsResponse({
    $core.Iterable<SettingsParam>? params,
  }) {
    final $result = create();
    if (params != null) {
      $result.params.addAll(params);
    }
    return $result;
  }
  ClientSettingsResponse._() : super();
  factory ClientSettingsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientSettingsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ClientSettingsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<SettingsParam>(1, _omitFieldNames ? '' : 'params', $pb.PbFieldType.PM, subBuilder: SettingsParam.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClientSettingsResponse clone() => ClientSettingsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClientSettingsResponse copyWith(void Function(ClientSettingsResponse) updates) => super.copyWith((message) => updates(message as ClientSettingsResponse)) as ClientSettingsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientSettingsResponse create() => ClientSettingsResponse._();
  ClientSettingsResponse createEmptyInstance() => create();
  static $pb.PbList<ClientSettingsResponse> createRepeated() => $pb.PbList<ClientSettingsResponse>();
  @$core.pragma('dart2js:noInline')
  static ClientSettingsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientSettingsResponse>(create);
  static ClientSettingsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SettingsParam> get params => $_getList(0);
}

class ClientSettingsRequest extends $pb.GeneratedMessage {
  factory ClientSettingsRequest() => create();
  ClientSettingsRequest._() : super();
  factory ClientSettingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientSettingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ClientSettingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClientSettingsRequest clone() => ClientSettingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClientSettingsRequest copyWith(void Function(ClientSettingsRequest) updates) => super.copyWith((message) => updates(message as ClientSettingsRequest)) as ClientSettingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientSettingsRequest create() => ClientSettingsRequest._();
  ClientSettingsRequest createEmptyInstance() => create();
  static $pb.PbList<ClientSettingsRequest> createRepeated() => $pb.PbList<ClientSettingsRequest>();
  @$core.pragma('dart2js:noInline')
  static ClientSettingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientSettingsRequest>(create);
  static ClientSettingsRequest? _defaultInstance;
}

class CloudAgentApi {
  $pb.RpcClient _client;
  CloudAgentApi(this._client);

  $async.Future<CreateAgentResponse> createAgent($pb.ClientContext? ctx, CreateAgentRequest request) =>
    _client.invoke<CreateAgentResponse>(ctx, 'CloudAgent', 'CreateAgent', request, CreateAgentResponse())
  ;
  $async.Future<ListAgentsResponse> listAgents($pb.ClientContext? ctx, ListAgentsRequest request) =>
    _client.invoke<ListAgentsResponse>(ctx, 'CloudAgent', 'ListAgents', request, ListAgentsResponse())
  ;
  $async.Future<ListAgentVersionsResponse> listAgentVersions($pb.ClientContext? ctx, ListAgentVersionsRequest request) =>
    _client.invoke<ListAgentVersionsResponse>(ctx, 'CloudAgent', 'ListAgentVersions', request, ListAgentVersionsResponse())
  ;
  $async.Future<ListAgentSecretsResponse> listAgentSecrets($pb.ClientContext? ctx, ListAgentSecretsRequest request) =>
    _client.invoke<ListAgentSecretsResponse>(ctx, 'CloudAgent', 'ListAgentSecrets', request, ListAgentSecretsResponse())
  ;
  $async.Future<UpdateAgentResponse> updateAgent($pb.ClientContext? ctx, UpdateAgentRequest request) =>
    _client.invoke<UpdateAgentResponse>(ctx, 'CloudAgent', 'UpdateAgent', request, UpdateAgentResponse())
  ;
  $async.Future<RestartAgentResponse> restartAgent($pb.ClientContext? ctx, RestartAgentRequest request) =>
    _client.invoke<RestartAgentResponse>(ctx, 'CloudAgent', 'RestartAgent', request, RestartAgentResponse())
  ;
  $async.Future<DeployAgentResponse> deployAgent($pb.ClientContext? ctx, DeployAgentRequest request) =>
    _client.invoke<DeployAgentResponse>(ctx, 'CloudAgent', 'DeployAgent', request, DeployAgentResponse())
  ;
  $async.Future<UpdateAgentSecretsResponse> updateAgentSecrets($pb.ClientContext? ctx, UpdateAgentSecretsRequest request) =>
    _client.invoke<UpdateAgentSecretsResponse>(ctx, 'CloudAgent', 'UpdateAgentSecrets', request, UpdateAgentSecretsResponse())
  ;
  $async.Future<RollbackAgentResponse> rollbackAgent($pb.ClientContext? ctx, RollbackAgentRequest request) =>
    _client.invoke<RollbackAgentResponse>(ctx, 'CloudAgent', 'RollbackAgent', request, RollbackAgentResponse())
  ;
  $async.Future<DeleteAgentResponse> deleteAgent($pb.ClientContext? ctx, DeleteAgentRequest request) =>
    _client.invoke<DeleteAgentResponse>(ctx, 'CloudAgent', 'DeleteAgent', request, DeleteAgentResponse())
  ;
  $async.Future<ClientSettingsResponse> getClientSettings($pb.ClientContext? ctx, ClientSettingsRequest request) =>
    _client.invoke<ClientSettingsResponse>(ctx, 'CloudAgent', 'GetClientSettings', request, ClientSettingsResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
