// This is a generated file - do not edit.
//
// Generated from livekit_cloud_agent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $0;

import 'livekit_cloud_agent.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'livekit_cloud_agent.pbenum.dart';

class AgentSecret extends $pb.GeneratedMessage {
  factory AgentSecret({
    $core.String? name,
    $core.List<$core.int>? value,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
    AgentSecretKind? kind,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (value != null) result.value = value;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (kind != null) result.kind = kind;
    return result;
  }

  AgentSecret._();

  factory AgentSecret.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgentSecret.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgentSecret',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $0.Timestamp.create)
    ..aE<AgentSecretKind>(5, _omitFieldNames ? '' : 'kind',
        enumValues: AgentSecretKind.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentSecret clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentSecret copyWith(void Function(AgentSecret) updates) =>
      super.copyWith((message) => updates(message as AgentSecret))
          as AgentSecret;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentSecret create() => AgentSecret._();
  @$core.override
  AgentSecret createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgentSecret getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgentSecret>(create);
  static AgentSecret? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureCreatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Timestamp get updatedAt => $_getN(3);
  @$pb.TagNumber(4)
  set updatedAt($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasUpdatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdatedAt() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureUpdatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  AgentSecretKind get kind => $_getN(4);
  @$pb.TagNumber(5)
  set kind(AgentSecretKind value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasKind() => $_has(4);
  @$pb.TagNumber(5)
  void clearKind() => $_clearField(5);
}

class CreateAgentRequest extends $pb.GeneratedMessage {
  factory CreateAgentRequest({
    @$core.Deprecated('This field is deprecated.') $core.String? agentName,
    $core.Iterable<AgentSecret>? secrets,
    @$core.Deprecated('This field is deprecated.') $core.int? replicas,
    @$core.Deprecated('This field is deprecated.') $core.int? maxReplicas,
    @$core.Deprecated('This field is deprecated.') $core.String? cpuReq,
    $core.Iterable<$core.String>? regions,
  }) {
    final result = create();
    if (agentName != null) result.agentName = agentName;
    if (secrets != null) result.secrets.addAll(secrets);
    if (replicas != null) result.replicas = replicas;
    if (maxReplicas != null) result.maxReplicas = maxReplicas;
    if (cpuReq != null) result.cpuReq = cpuReq;
    if (regions != null) result.regions.addAll(regions);
    return result;
  }

  CreateAgentRequest._();

  factory CreateAgentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateAgentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateAgentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentName')
    ..pPM<AgentSecret>(2, _omitFieldNames ? '' : 'secrets',
        subBuilder: AgentSecret.create)
    ..aI(3, _omitFieldNames ? '' : 'replicas')
    ..aI(4, _omitFieldNames ? '' : 'maxReplicas')
    ..aOS(5, _omitFieldNames ? '' : 'cpuReq')
    ..pPS(6, _omitFieldNames ? '' : 'regions')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAgentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAgentRequest copyWith(void Function(CreateAgentRequest) updates) =>
      super.copyWith((message) => updates(message as CreateAgentRequest))
          as CreateAgentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAgentRequest create() => CreateAgentRequest._();
  @$core.override
  CreateAgentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateAgentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateAgentRequest>(create);
  static CreateAgentRequest? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.String get agentName => $_getSZ(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set agentName($core.String value) => $_setString(0, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasAgentName() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearAgentName() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<AgentSecret> get secrets => $_getList(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.int get replicas => $_getIZ(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  set replicas($core.int value) => $_setSignedInt32(2, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.bool hasReplicas() => $_has(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  void clearReplicas() => $_clearField(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.int get maxReplicas => $_getIZ(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set maxReplicas($core.int value) => $_setSignedInt32(3, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasMaxReplicas() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearMaxReplicas() => $_clearField(4);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.String get cpuReq => $_getSZ(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set cpuReq($core.String value) => $_setString(4, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasCpuReq() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearCpuReq() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get regions => $_getList(5);
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
    final result = create();
    if (agentId != null) result.agentId = agentId;
    if (agentName != null) result.agentName = agentName;
    if (status != null) result.status = status;
    if (version != null) result.version = version;
    if (presignedUrl != null) result.presignedUrl = presignedUrl;
    if (tag != null) result.tag = tag;
    if (serverRegions != null) result.serverRegions.addAll(serverRegions);
    if (presignedPostRequest != null)
      result.presignedPostRequest = presignedPostRequest;
    return result;
  }

  CreateAgentResponse._();

  factory CreateAgentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateAgentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateAgentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..aOS(3, _omitFieldNames ? '' : 'status')
    ..aOS(4, _omitFieldNames ? '' : 'version')
    ..aOS(5, _omitFieldNames ? '' : 'presignedUrl')
    ..aOS(6, _omitFieldNames ? '' : 'tag')
    ..pPS(7, _omitFieldNames ? '' : 'serverRegions')
    ..aOM<PresignedPostRequest>(
        8, _omitFieldNames ? '' : 'presignedPostRequest',
        subBuilder: PresignedPostRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAgentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAgentResponse copyWith(void Function(CreateAgentResponse) updates) =>
      super.copyWith((message) => updates(message as CreateAgentResponse))
          as CreateAgentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAgentResponse create() => CreateAgentResponse._();
  @$core.override
  CreateAgentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateAgentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateAgentResponse>(create);
  static CreateAgentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get status => $_getSZ(2);
  @$pb.TagNumber(3)
  set status($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get version => $_getSZ(3);
  @$pb.TagNumber(4)
  set version($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersion() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get presignedUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set presignedUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPresignedUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearPresignedUrl() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get tag => $_getSZ(5);
  @$pb.TagNumber(6)
  set tag($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTag() => $_has(5);
  @$pb.TagNumber(6)
  void clearTag() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get serverRegions => $_getList(6);

  @$pb.TagNumber(8)
  PresignedPostRequest get presignedPostRequest => $_getN(7);
  @$pb.TagNumber(8)
  set presignedPostRequest(PresignedPostRequest value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasPresignedPostRequest() => $_has(7);
  @$pb.TagNumber(8)
  void clearPresignedPostRequest() => $_clearField(8);
  @$pb.TagNumber(8)
  PresignedPostRequest ensurePresignedPostRequest() => $_ensure(7);
}

class PresignedPostRequest extends $pb.GeneratedMessage {
  factory PresignedPostRequest({
    $core.String? url,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? values,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (values != null) result.values.addEntries(values);
    return result;
  }

  PresignedPostRequest._();

  factory PresignedPostRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PresignedPostRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PresignedPostRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'values',
        entryClassName: 'PresignedPostRequest.ValuesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PresignedPostRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PresignedPostRequest copyWith(void Function(PresignedPostRequest) updates) =>
      super.copyWith((message) => updates(message as PresignedPostRequest))
          as PresignedPostRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PresignedPostRequest create() => PresignedPostRequest._();
  @$core.override
  PresignedPostRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PresignedPostRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PresignedPostRequest>(create);
  static PresignedPostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.String> get values => $_getMap(1);
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
    final result = create();
    if (region != null) result.region = region;
    if (agentId != null) result.agentId = agentId;
    if (status != null) result.status = status;
    if (replicas != null) result.replicas = replicas;
    if (minReplicas != null) result.minReplicas = minReplicas;
    if (maxReplicas != null) result.maxReplicas = maxReplicas;
    if (cpuReq != null) result.cpuReq = cpuReq;
    if (curCpu != null) result.curCpu = curCpu;
    if (curMem != null) result.curMem = curMem;
    if (memReq != null) result.memReq = memReq;
    if (memLimit != null) result.memLimit = memLimit;
    if (cpuLimit != null) result.cpuLimit = cpuLimit;
    if (serverRegion != null) result.serverRegion = serverRegion;
    return result;
  }

  AgentDeployment._();

  factory AgentDeployment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgentDeployment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgentDeployment',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'region')
    ..aOS(2, _omitFieldNames ? '' : 'agentId')
    ..aOS(3, _omitFieldNames ? '' : 'status')
    ..aI(4, _omitFieldNames ? '' : 'replicas')
    ..aI(5, _omitFieldNames ? '' : 'minReplicas')
    ..aI(6, _omitFieldNames ? '' : 'maxReplicas')
    ..aOS(7, _omitFieldNames ? '' : 'cpuReq')
    ..aOS(8, _omitFieldNames ? '' : 'curCpu')
    ..aOS(9, _omitFieldNames ? '' : 'curMem')
    ..aOS(10, _omitFieldNames ? '' : 'memReq')
    ..aOS(11, _omitFieldNames ? '' : 'memLimit')
    ..aOS(12, _omitFieldNames ? '' : 'cpuLimit')
    ..aOS(13, _omitFieldNames ? '' : 'serverRegion')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentDeployment clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentDeployment copyWith(void Function(AgentDeployment) updates) =>
      super.copyWith((message) => updates(message as AgentDeployment))
          as AgentDeployment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentDeployment create() => AgentDeployment._();
  @$core.override
  AgentDeployment createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgentDeployment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgentDeployment>(create);
  static AgentDeployment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get region => $_getSZ(0);
  @$pb.TagNumber(1)
  set region($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRegion() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAgentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get status => $_getSZ(2);
  @$pb.TagNumber(3)
  set status($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get replicas => $_getIZ(3);
  @$pb.TagNumber(4)
  set replicas($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReplicas() => $_has(3);
  @$pb.TagNumber(4)
  void clearReplicas() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get minReplicas => $_getIZ(4);
  @$pb.TagNumber(5)
  set minReplicas($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMinReplicas() => $_has(4);
  @$pb.TagNumber(5)
  void clearMinReplicas() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get maxReplicas => $_getIZ(5);
  @$pb.TagNumber(6)
  set maxReplicas($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMaxReplicas() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxReplicas() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get cpuReq => $_getSZ(6);
  @$pb.TagNumber(7)
  set cpuReq($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCpuReq() => $_has(6);
  @$pb.TagNumber(7)
  void clearCpuReq() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get curCpu => $_getSZ(7);
  @$pb.TagNumber(8)
  set curCpu($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCurCpu() => $_has(7);
  @$pb.TagNumber(8)
  void clearCurCpu() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get curMem => $_getSZ(8);
  @$pb.TagNumber(9)
  set curMem($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCurMem() => $_has(8);
  @$pb.TagNumber(9)
  void clearCurMem() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get memReq => $_getSZ(9);
  @$pb.TagNumber(10)
  set memReq($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasMemReq() => $_has(9);
  @$pb.TagNumber(10)
  void clearMemReq() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get memLimit => $_getSZ(10);
  @$pb.TagNumber(11)
  set memLimit($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasMemLimit() => $_has(10);
  @$pb.TagNumber(11)
  void clearMemLimit() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get cpuLimit => $_getSZ(11);
  @$pb.TagNumber(12)
  set cpuLimit($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasCpuLimit() => $_has(11);
  @$pb.TagNumber(12)
  void clearCpuLimit() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get serverRegion => $_getSZ(12);
  @$pb.TagNumber(13)
  set serverRegion($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasServerRegion() => $_has(12);
  @$pb.TagNumber(13)
  void clearServerRegion() => $_clearField(13);
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
    final result = create();
    if (agentId != null) result.agentId = agentId;
    if (agentName != null) result.agentName = agentName;
    if (version != null) result.version = version;
    if (agentDeployments != null)
      result.agentDeployments.addAll(agentDeployments);
    if (secrets != null) result.secrets.addAll(secrets);
    if (deployedAt != null) result.deployedAt = deployedAt;
    return result;
  }

  AgentInfo._();

  factory AgentInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgentInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgentInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..aOS(3, _omitFieldNames ? '' : 'version')
    ..pPM<AgentDeployment>(4, _omitFieldNames ? '' : 'agentDeployments',
        subBuilder: AgentDeployment.create)
    ..pPM<AgentSecret>(5, _omitFieldNames ? '' : 'secrets',
        subBuilder: AgentSecret.create)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'deployedAt',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentInfo copyWith(void Function(AgentInfo) updates) =>
      super.copyWith((message) => updates(message as AgentInfo)) as AgentInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentInfo create() => AgentInfo._();
  @$core.override
  AgentInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgentInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AgentInfo>(create);
  static AgentInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get version => $_getSZ(2);
  @$pb.TagNumber(3)
  set version($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<AgentDeployment> get agentDeployments => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<AgentSecret> get secrets => $_getList(4);

  @$pb.TagNumber(6)
  $0.Timestamp get deployedAt => $_getN(5);
  @$pb.TagNumber(6)
  set deployedAt($0.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasDeployedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeployedAt() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureDeployedAt() => $_ensure(5);
}

class ListAgentsRequest extends $pb.GeneratedMessage {
  factory ListAgentsRequest({
    $core.String? agentName,
    $core.String? agentId,
  }) {
    final result = create();
    if (agentName != null) result.agentName = agentName;
    if (agentId != null) result.agentId = agentId;
    return result;
  }

  ListAgentsRequest._();

  factory ListAgentsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAgentsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAgentsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentName')
    ..aOS(2, _omitFieldNames ? '' : 'agentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentsRequest copyWith(void Function(ListAgentsRequest) updates) =>
      super.copyWith((message) => updates(message as ListAgentsRequest))
          as ListAgentsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentsRequest create() => ListAgentsRequest._();
  @$core.override
  ListAgentsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAgentsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAgentsRequest>(create);
  static ListAgentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentName => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAgentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentId() => $_clearField(2);
}

class ListAgentsResponse extends $pb.GeneratedMessage {
  factory ListAgentsResponse({
    $core.Iterable<AgentInfo>? agents,
  }) {
    final result = create();
    if (agents != null) result.agents.addAll(agents);
    return result;
  }

  ListAgentsResponse._();

  factory ListAgentsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAgentsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAgentsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPM<AgentInfo>(1, _omitFieldNames ? '' : 'agents',
        subBuilder: AgentInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentsResponse copyWith(void Function(ListAgentsResponse) updates) =>
      super.copyWith((message) => updates(message as ListAgentsResponse))
          as ListAgentsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentsResponse create() => ListAgentsResponse._();
  @$core.override
  ListAgentsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAgentsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAgentsResponse>(create);
  static ListAgentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AgentInfo> get agents => $_getList(0);
}

class AgentVersion extends $pb.GeneratedMessage {
  factory AgentVersion({
    $core.String? version,
    $core.bool? current,
    $0.Timestamp? createdAt,
    $0.Timestamp? deployedAt,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? attributes,
    $core.String? status,
    $core.String? owner,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (current != null) result.current = current;
    if (createdAt != null) result.createdAt = createdAt;
    if (deployedAt != null) result.deployedAt = deployedAt;
    if (attributes != null) result.attributes.addEntries(attributes);
    if (status != null) result.status = status;
    if (owner != null) result.owner = owner;
    return result;
  }

  AgentVersion._();

  factory AgentVersion.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgentVersion.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgentVersion',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'version')
    ..aOB(2, _omitFieldNames ? '' : 'current')
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'deployedAt',
        subBuilder: $0.Timestamp.create)
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'attributes',
        entryClassName: 'AgentVersion.AttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOS(6, _omitFieldNames ? '' : 'status')
    ..aOS(7, _omitFieldNames ? '' : 'owner')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentVersion clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentVersion copyWith(void Function(AgentVersion) updates) =>
      super.copyWith((message) => updates(message as AgentVersion))
          as AgentVersion;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentVersion create() => AgentVersion._();
  @$core.override
  AgentVersion createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgentVersion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgentVersion>(create);
  static AgentVersion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get current => $_getBF(1);
  @$pb.TagNumber(2)
  set current($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrent() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrent() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureCreatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Timestamp get deployedAt => $_getN(3);
  @$pb.TagNumber(4)
  set deployedAt($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasDeployedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeployedAt() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureDeployedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $core.String> get attributes => $_getMap(4);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get owner => $_getSZ(6);
  @$pb.TagNumber(7)
  set owner($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasOwner() => $_has(6);
  @$pb.TagNumber(7)
  void clearOwner() => $_clearField(7);
}

class ListAgentVersionsRequest extends $pb.GeneratedMessage {
  factory ListAgentVersionsRequest({
    $core.String? agentId,
    $core.String? agentName,
  }) {
    final result = create();
    if (agentId != null) result.agentId = agentId;
    if (agentName != null) result.agentName = agentName;
    return result;
  }

  ListAgentVersionsRequest._();

  factory ListAgentVersionsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAgentVersionsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAgentVersionsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentVersionsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentVersionsRequest copyWith(
          void Function(ListAgentVersionsRequest) updates) =>
      super.copyWith((message) => updates(message as ListAgentVersionsRequest))
          as ListAgentVersionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentVersionsRequest create() => ListAgentVersionsRequest._();
  @$core.override
  ListAgentVersionsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAgentVersionsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAgentVersionsRequest>(create);
  static ListAgentVersionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => $_clearField(2);
}

class ListAgentVersionsResponse extends $pb.GeneratedMessage {
  factory ListAgentVersionsResponse({
    $core.Iterable<AgentVersion>? versions,
  }) {
    final result = create();
    if (versions != null) result.versions.addAll(versions);
    return result;
  }

  ListAgentVersionsResponse._();

  factory ListAgentVersionsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAgentVersionsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAgentVersionsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPM<AgentVersion>(1, _omitFieldNames ? '' : 'versions',
        subBuilder: AgentVersion.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentVersionsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentVersionsResponse copyWith(
          void Function(ListAgentVersionsResponse) updates) =>
      super.copyWith((message) => updates(message as ListAgentVersionsResponse))
          as ListAgentVersionsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentVersionsResponse create() => ListAgentVersionsResponse._();
  @$core.override
  ListAgentVersionsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAgentVersionsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAgentVersionsResponse>(create);
  static ListAgentVersionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AgentVersion> get versions => $_getList(0);
}

class UpdateAgentRequest extends $pb.GeneratedMessage {
  factory UpdateAgentRequest({
    $core.String? agentId,
    @$core.Deprecated('This field is deprecated.') $core.String? agentName,
    @$core.Deprecated('This field is deprecated.') $core.int? replicas,
    @$core.Deprecated('This field is deprecated.') $core.int? maxReplicas,
    @$core.Deprecated('This field is deprecated.') $core.String? cpuReq,
    $core.Iterable<$core.String>? regions,
    $core.Iterable<AgentSecret>? secrets,
  }) {
    final result = create();
    if (agentId != null) result.agentId = agentId;
    if (agentName != null) result.agentName = agentName;
    if (replicas != null) result.replicas = replicas;
    if (maxReplicas != null) result.maxReplicas = maxReplicas;
    if (cpuReq != null) result.cpuReq = cpuReq;
    if (regions != null) result.regions.addAll(regions);
    if (secrets != null) result.secrets.addAll(secrets);
    return result;
  }

  UpdateAgentRequest._();

  factory UpdateAgentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateAgentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateAgentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..aI(3, _omitFieldNames ? '' : 'replicas')
    ..aI(4, _omitFieldNames ? '' : 'maxReplicas')
    ..aOS(5, _omitFieldNames ? '' : 'cpuReq')
    ..pPS(6, _omitFieldNames ? '' : 'regions')
    ..pPM<AgentSecret>(7, _omitFieldNames ? '' : 'secrets',
        subBuilder: AgentSecret.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAgentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAgentRequest copyWith(void Function(UpdateAgentRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateAgentRequest))
          as UpdateAgentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAgentRequest create() => UpdateAgentRequest._();
  @$core.override
  UpdateAgentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateAgentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateAgentRequest>(create);
  static UpdateAgentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => $_clearField(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set agentName($core.String value) => $_setString(1, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearAgentName() => $_clearField(2);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.int get replicas => $_getIZ(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  set replicas($core.int value) => $_setSignedInt32(2, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.bool hasReplicas() => $_has(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  void clearReplicas() => $_clearField(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.int get maxReplicas => $_getIZ(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set maxReplicas($core.int value) => $_setSignedInt32(3, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasMaxReplicas() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearMaxReplicas() => $_clearField(4);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.String get cpuReq => $_getSZ(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set cpuReq($core.String value) => $_setString(4, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasCpuReq() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearCpuReq() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get regions => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<AgentSecret> get secrets => $_getList(6);
}

class UpdateAgentResponse extends $pb.GeneratedMessage {
  factory UpdateAgentResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  UpdateAgentResponse._();

  factory UpdateAgentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateAgentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateAgentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAgentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAgentResponse copyWith(void Function(UpdateAgentResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateAgentResponse))
          as UpdateAgentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAgentResponse create() => UpdateAgentResponse._();
  @$core.override
  UpdateAgentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateAgentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateAgentResponse>(create);
  static UpdateAgentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class RestartAgentRequest extends $pb.GeneratedMessage {
  factory RestartAgentRequest({
    $core.String? agentId,
  }) {
    final result = create();
    if (agentId != null) result.agentId = agentId;
    return result;
  }

  RestartAgentRequest._();

  factory RestartAgentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RestartAgentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RestartAgentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RestartAgentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RestartAgentRequest copyWith(void Function(RestartAgentRequest) updates) =>
      super.copyWith((message) => updates(message as RestartAgentRequest))
          as RestartAgentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestartAgentRequest create() => RestartAgentRequest._();
  @$core.override
  RestartAgentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RestartAgentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RestartAgentRequest>(create);
  static RestartAgentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => $_clearField(1);
}

class RestartAgentResponse extends $pb.GeneratedMessage {
  factory RestartAgentResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  RestartAgentResponse._();

  factory RestartAgentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RestartAgentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RestartAgentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RestartAgentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RestartAgentResponse copyWith(void Function(RestartAgentResponse) updates) =>
      super.copyWith((message) => updates(message as RestartAgentResponse))
          as RestartAgentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestartAgentResponse create() => RestartAgentResponse._();
  @$core.override
  RestartAgentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RestartAgentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RestartAgentResponse>(create);
  static RestartAgentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class DeployAgentRequest extends $pb.GeneratedMessage {
  factory DeployAgentRequest({
    $core.String? agentId,
    @$core.Deprecated('This field is deprecated.') $core.String? agentName,
    $core.Iterable<AgentSecret>? secrets,
    @$core.Deprecated('This field is deprecated.') $core.int? replicas,
    @$core.Deprecated('This field is deprecated.') $core.int? maxReplicas,
    @$core.Deprecated('This field is deprecated.') $core.String? cpuReq,
  }) {
    final result = create();
    if (agentId != null) result.agentId = agentId;
    if (agentName != null) result.agentName = agentName;
    if (secrets != null) result.secrets.addAll(secrets);
    if (replicas != null) result.replicas = replicas;
    if (maxReplicas != null) result.maxReplicas = maxReplicas;
    if (cpuReq != null) result.cpuReq = cpuReq;
    return result;
  }

  DeployAgentRequest._();

  factory DeployAgentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeployAgentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeployAgentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..pPM<AgentSecret>(3, _omitFieldNames ? '' : 'secrets',
        subBuilder: AgentSecret.create)
    ..aI(4, _omitFieldNames ? '' : 'replicas')
    ..aI(5, _omitFieldNames ? '' : 'maxReplicas')
    ..aOS(6, _omitFieldNames ? '' : 'cpuReq')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeployAgentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeployAgentRequest copyWith(void Function(DeployAgentRequest) updates) =>
      super.copyWith((message) => updates(message as DeployAgentRequest))
          as DeployAgentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeployAgentRequest create() => DeployAgentRequest._();
  @$core.override
  DeployAgentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeployAgentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeployAgentRequest>(create);
  static DeployAgentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => $_clearField(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set agentName($core.String value) => $_setString(1, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearAgentName() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<AgentSecret> get secrets => $_getList(2);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.int get replicas => $_getIZ(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set replicas($core.int value) => $_setSignedInt32(3, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasReplicas() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearReplicas() => $_clearField(4);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.int get maxReplicas => $_getIZ(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set maxReplicas($core.int value) => $_setSignedInt32(4, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasMaxReplicas() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearMaxReplicas() => $_clearField(5);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.String get cpuReq => $_getSZ(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set cpuReq($core.String value) => $_setString(5, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasCpuReq() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearCpuReq() => $_clearField(6);
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
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (agentId != null) result.agentId = agentId;
    if (presignedUrl != null) result.presignedUrl = presignedUrl;
    if (tag != null) result.tag = tag;
    if (presignedPostRequest != null)
      result.presignedPostRequest = presignedPostRequest;
    return result;
  }

  DeployAgentResponse._();

  factory DeployAgentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeployAgentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeployAgentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOS(3, _omitFieldNames ? '' : 'agentId')
    ..aOS(4, _omitFieldNames ? '' : 'presignedUrl')
    ..aOS(5, _omitFieldNames ? '' : 'tag')
    ..aOM<PresignedPostRequest>(
        6, _omitFieldNames ? '' : 'presignedPostRequest',
        subBuilder: PresignedPostRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeployAgentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeployAgentResponse copyWith(void Function(DeployAgentResponse) updates) =>
      super.copyWith((message) => updates(message as DeployAgentResponse))
          as DeployAgentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeployAgentResponse create() => DeployAgentResponse._();
  @$core.override
  DeployAgentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeployAgentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeployAgentResponse>(create);
  static DeployAgentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get agentId => $_getSZ(2);
  @$pb.TagNumber(3)
  set agentId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAgentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAgentId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get presignedUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set presignedUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPresignedUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearPresignedUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get tag => $_getSZ(4);
  @$pb.TagNumber(5)
  set tag($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTag() => $_has(4);
  @$pb.TagNumber(5)
  void clearTag() => $_clearField(5);

  @$pb.TagNumber(6)
  PresignedPostRequest get presignedPostRequest => $_getN(5);
  @$pb.TagNumber(6)
  set presignedPostRequest(PresignedPostRequest value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasPresignedPostRequest() => $_has(5);
  @$pb.TagNumber(6)
  void clearPresignedPostRequest() => $_clearField(6);
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
    final result = create();
    if (agentId != null) result.agentId = agentId;
    if (agentName != null) result.agentName = agentName;
    if (overwrite != null) result.overwrite = overwrite;
    if (secrets != null) result.secrets.addAll(secrets);
    if (remove != null) result.remove.addAll(remove);
    return result;
  }

  UpdateAgentSecretsRequest._();

  factory UpdateAgentSecretsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateAgentSecretsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateAgentSecretsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..aOB(3, _omitFieldNames ? '' : 'overwrite')
    ..pPM<AgentSecret>(4, _omitFieldNames ? '' : 'secrets',
        subBuilder: AgentSecret.create)
    ..pPS(5, _omitFieldNames ? '' : 'remove')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAgentSecretsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAgentSecretsRequest copyWith(
          void Function(UpdateAgentSecretsRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateAgentSecretsRequest))
          as UpdateAgentSecretsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAgentSecretsRequest create() => UpdateAgentSecretsRequest._();
  @$core.override
  UpdateAgentSecretsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateAgentSecretsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateAgentSecretsRequest>(create);
  static UpdateAgentSecretsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get overwrite => $_getBF(2);
  @$pb.TagNumber(3)
  set overwrite($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOverwrite() => $_has(2);
  @$pb.TagNumber(3)
  void clearOverwrite() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<AgentSecret> get secrets => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get remove => $_getList(4);
}

class UpdateAgentSecretsResponse extends $pb.GeneratedMessage {
  factory UpdateAgentSecretsResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  UpdateAgentSecretsResponse._();

  factory UpdateAgentSecretsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateAgentSecretsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateAgentSecretsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAgentSecretsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAgentSecretsResponse copyWith(
          void Function(UpdateAgentSecretsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateAgentSecretsResponse))
          as UpdateAgentSecretsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAgentSecretsResponse create() => UpdateAgentSecretsResponse._();
  @$core.override
  UpdateAgentSecretsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateAgentSecretsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateAgentSecretsResponse>(create);
  static UpdateAgentSecretsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class RollbackAgentRequest extends $pb.GeneratedMessage {
  factory RollbackAgentRequest({
    $core.String? agentId,
    $core.String? agentName,
    $core.String? version,
  }) {
    final result = create();
    if (agentId != null) result.agentId = agentId;
    if (agentName != null) result.agentName = agentName;
    if (version != null) result.version = version;
    return result;
  }

  RollbackAgentRequest._();

  factory RollbackAgentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RollbackAgentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RollbackAgentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..aOS(3, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RollbackAgentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RollbackAgentRequest copyWith(void Function(RollbackAgentRequest) updates) =>
      super.copyWith((message) => updates(message as RollbackAgentRequest))
          as RollbackAgentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RollbackAgentRequest create() => RollbackAgentRequest._();
  @$core.override
  RollbackAgentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RollbackAgentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RollbackAgentRequest>(create);
  static RollbackAgentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get version => $_getSZ(2);
  @$pb.TagNumber(3)
  set version($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => $_clearField(3);
}

class RollbackAgentResponse extends $pb.GeneratedMessage {
  factory RollbackAgentResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  RollbackAgentResponse._();

  factory RollbackAgentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RollbackAgentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RollbackAgentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RollbackAgentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RollbackAgentResponse copyWith(
          void Function(RollbackAgentResponse) updates) =>
      super.copyWith((message) => updates(message as RollbackAgentResponse))
          as RollbackAgentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RollbackAgentResponse create() => RollbackAgentResponse._();
  @$core.override
  RollbackAgentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RollbackAgentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RollbackAgentResponse>(create);
  static RollbackAgentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class DeleteAgentRequest extends $pb.GeneratedMessage {
  factory DeleteAgentRequest({
    $core.String? agentId,
    $core.String? agentName,
  }) {
    final result = create();
    if (agentId != null) result.agentId = agentId;
    if (agentName != null) result.agentName = agentName;
    return result;
  }

  DeleteAgentRequest._();

  factory DeleteAgentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteAgentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteAgentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAgentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAgentRequest copyWith(void Function(DeleteAgentRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteAgentRequest))
          as DeleteAgentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAgentRequest create() => DeleteAgentRequest._();
  @$core.override
  DeleteAgentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteAgentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteAgentRequest>(create);
  static DeleteAgentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => $_clearField(2);
}

class DeleteAgentResponse extends $pb.GeneratedMessage {
  factory DeleteAgentResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  DeleteAgentResponse._();

  factory DeleteAgentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteAgentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteAgentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAgentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAgentResponse copyWith(void Function(DeleteAgentResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteAgentResponse))
          as DeleteAgentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAgentResponse create() => DeleteAgentResponse._();
  @$core.override
  DeleteAgentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteAgentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteAgentResponse>(create);
  static DeleteAgentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class ListAgentSecretsRequest extends $pb.GeneratedMessage {
  factory ListAgentSecretsRequest({
    $core.String? agentId,
    $core.String? agentName,
  }) {
    final result = create();
    if (agentId != null) result.agentId = agentId;
    if (agentName != null) result.agentName = agentName;
    return result;
  }

  ListAgentSecretsRequest._();

  factory ListAgentSecretsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAgentSecretsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAgentSecretsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentId')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentSecretsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentSecretsRequest copyWith(
          void Function(ListAgentSecretsRequest) updates) =>
      super.copyWith((message) => updates(message as ListAgentSecretsRequest))
          as ListAgentSecretsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentSecretsRequest create() => ListAgentSecretsRequest._();
  @$core.override
  ListAgentSecretsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAgentSecretsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAgentSecretsRequest>(create);
  static ListAgentSecretsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => $_clearField(2);
}

class ListAgentSecretsResponse extends $pb.GeneratedMessage {
  factory ListAgentSecretsResponse({
    $core.Iterable<AgentSecret>? secrets,
  }) {
    final result = create();
    if (secrets != null) result.secrets.addAll(secrets);
    return result;
  }

  ListAgentSecretsResponse._();

  factory ListAgentSecretsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAgentSecretsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAgentSecretsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPM<AgentSecret>(1, _omitFieldNames ? '' : 'secrets',
        subBuilder: AgentSecret.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentSecretsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentSecretsResponse copyWith(
          void Function(ListAgentSecretsResponse) updates) =>
      super.copyWith((message) => updates(message as ListAgentSecretsResponse))
          as ListAgentSecretsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentSecretsResponse create() => ListAgentSecretsResponse._();
  @$core.override
  ListAgentSecretsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAgentSecretsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAgentSecretsResponse>(create);
  static ListAgentSecretsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AgentSecret> get secrets => $_getList(0);
}

class SettingsParam extends $pb.GeneratedMessage {
  factory SettingsParam({
    $core.String? name,
    $core.String? value,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (value != null) result.value = value;
    return result;
  }

  SettingsParam._();

  factory SettingsParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SettingsParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SettingsParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SettingsParam clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SettingsParam copyWith(void Function(SettingsParam) updates) =>
      super.copyWith((message) => updates(message as SettingsParam))
          as SettingsParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SettingsParam create() => SettingsParam._();
  @$core.override
  SettingsParam createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SettingsParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SettingsParam>(create);
  static SettingsParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);
}

class ClientSettingsResponse extends $pb.GeneratedMessage {
  factory ClientSettingsResponse({
    $core.Iterable<SettingsParam>? params,
  }) {
    final result = create();
    if (params != null) result.params.addAll(params);
    return result;
  }

  ClientSettingsResponse._();

  factory ClientSettingsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClientSettingsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClientSettingsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPM<SettingsParam>(1, _omitFieldNames ? '' : 'params',
        subBuilder: SettingsParam.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClientSettingsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClientSettingsResponse copyWith(
          void Function(ClientSettingsResponse) updates) =>
      super.copyWith((message) => updates(message as ClientSettingsResponse))
          as ClientSettingsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientSettingsResponse create() => ClientSettingsResponse._();
  @$core.override
  ClientSettingsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClientSettingsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClientSettingsResponse>(create);
  static ClientSettingsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SettingsParam> get params => $_getList(0);
}

class ClientSettingsRequest extends $pb.GeneratedMessage {
  factory ClientSettingsRequest() => create();

  ClientSettingsRequest._();

  factory ClientSettingsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClientSettingsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClientSettingsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClientSettingsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClientSettingsRequest copyWith(
          void Function(ClientSettingsRequest) updates) =>
      super.copyWith((message) => updates(message as ClientSettingsRequest))
          as ClientSettingsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientSettingsRequest create() => ClientSettingsRequest._();
  @$core.override
  ClientSettingsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClientSettingsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClientSettingsRequest>(create);
  static ClientSettingsRequest? _defaultInstance;
}

class CloudAgentApi {
  final $pb.RpcClient _client;

  CloudAgentApi(this._client);

  $async.Future<CreateAgentResponse> createAgent(
          $pb.ClientContext? ctx, CreateAgentRequest request) =>
      _client.invoke<CreateAgentResponse>(
          ctx, 'CloudAgent', 'CreateAgent', request, CreateAgentResponse());
  $async.Future<ListAgentsResponse> listAgents(
          $pb.ClientContext? ctx, ListAgentsRequest request) =>
      _client.invoke<ListAgentsResponse>(
          ctx, 'CloudAgent', 'ListAgents', request, ListAgentsResponse());
  $async.Future<ListAgentVersionsResponse> listAgentVersions(
          $pb.ClientContext? ctx, ListAgentVersionsRequest request) =>
      _client.invoke<ListAgentVersionsResponse>(ctx, 'CloudAgent',
          'ListAgentVersions', request, ListAgentVersionsResponse());
  $async.Future<ListAgentSecretsResponse> listAgentSecrets(
          $pb.ClientContext? ctx, ListAgentSecretsRequest request) =>
      _client.invoke<ListAgentSecretsResponse>(ctx, 'CloudAgent',
          'ListAgentSecrets', request, ListAgentSecretsResponse());
  $async.Future<UpdateAgentResponse> updateAgent(
          $pb.ClientContext? ctx, UpdateAgentRequest request) =>
      _client.invoke<UpdateAgentResponse>(
          ctx, 'CloudAgent', 'UpdateAgent', request, UpdateAgentResponse());
  $async.Future<RestartAgentResponse> restartAgent(
          $pb.ClientContext? ctx, RestartAgentRequest request) =>
      _client.invoke<RestartAgentResponse>(
          ctx, 'CloudAgent', 'RestartAgent', request, RestartAgentResponse());
  $async.Future<DeployAgentResponse> deployAgent(
          $pb.ClientContext? ctx, DeployAgentRequest request) =>
      _client.invoke<DeployAgentResponse>(
          ctx, 'CloudAgent', 'DeployAgent', request, DeployAgentResponse());
  $async.Future<UpdateAgentSecretsResponse> updateAgentSecrets(
          $pb.ClientContext? ctx, UpdateAgentSecretsRequest request) =>
      _client.invoke<UpdateAgentSecretsResponse>(ctx, 'CloudAgent',
          'UpdateAgentSecrets', request, UpdateAgentSecretsResponse());
  $async.Future<RollbackAgentResponse> rollbackAgent(
          $pb.ClientContext? ctx, RollbackAgentRequest request) =>
      _client.invoke<RollbackAgentResponse>(
          ctx, 'CloudAgent', 'RollbackAgent', request, RollbackAgentResponse());
  $async.Future<DeleteAgentResponse> deleteAgent(
          $pb.ClientContext? ctx, DeleteAgentRequest request) =>
      _client.invoke<DeleteAgentResponse>(
          ctx, 'CloudAgent', 'DeleteAgent', request, DeleteAgentResponse());
  $async.Future<ClientSettingsResponse> getClientSettings(
          $pb.ClientContext? ctx, ClientSettingsRequest request) =>
      _client.invoke<ClientSettingsResponse>(ctx, 'CloudAgent',
          'GetClientSettings', request, ClientSettingsResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
