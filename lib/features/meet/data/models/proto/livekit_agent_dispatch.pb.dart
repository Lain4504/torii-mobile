//
//  Generated code. Do not modify.
//  source: livekit_agent_dispatch.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_agent.pb.dart' as $5;

class CreateAgentDispatchRequest extends $pb.GeneratedMessage {
  factory CreateAgentDispatchRequest({
    $core.String? agentName,
    $core.String? room,
    $core.String? metadata,
  }) {
    final $result = create();
    if (agentName != null) {
      $result.agentName = agentName;
    }
    if (room != null) {
      $result.room = room;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  CreateAgentDispatchRequest._() : super();
  factory CreateAgentDispatchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAgentDispatchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAgentDispatchRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentName')
    ..aOS(2, _omitFieldNames ? '' : 'room')
    ..aOS(3, _omitFieldNames ? '' : 'metadata')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAgentDispatchRequest clone() => CreateAgentDispatchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAgentDispatchRequest copyWith(void Function(CreateAgentDispatchRequest) updates) => super.copyWith((message) => updates(message as CreateAgentDispatchRequest)) as CreateAgentDispatchRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAgentDispatchRequest create() => CreateAgentDispatchRequest._();
  CreateAgentDispatchRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAgentDispatchRequest> createRepeated() => $pb.PbList<CreateAgentDispatchRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAgentDispatchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAgentDispatchRequest>(create);
  static CreateAgentDispatchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentName => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgentName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get room => $_getSZ(1);
  @$pb.TagNumber(2)
  set room($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get metadata => $_getSZ(2);
  @$pb.TagNumber(3)
  set metadata($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearMetadata() => clearField(3);
}

class RoomAgentDispatch extends $pb.GeneratedMessage {
  factory RoomAgentDispatch({
    $core.String? agentName,
    $core.String? metadata,
  }) {
    final $result = create();
    if (agentName != null) {
      $result.agentName = agentName;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  RoomAgentDispatch._() : super();
  factory RoomAgentDispatch.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomAgentDispatch.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomAgentDispatch', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentName')
    ..aOS(2, _omitFieldNames ? '' : 'metadata')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomAgentDispatch clone() => RoomAgentDispatch()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomAgentDispatch copyWith(void Function(RoomAgentDispatch) updates) => super.copyWith((message) => updates(message as RoomAgentDispatch)) as RoomAgentDispatch;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomAgentDispatch create() => RoomAgentDispatch._();
  RoomAgentDispatch createEmptyInstance() => create();
  static $pb.PbList<RoomAgentDispatch> createRepeated() => $pb.PbList<RoomAgentDispatch>();
  @$core.pragma('dart2js:noInline')
  static RoomAgentDispatch getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomAgentDispatch>(create);
  static RoomAgentDispatch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentName => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgentName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get metadata => $_getSZ(1);
  @$pb.TagNumber(2)
  set metadata($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMetadata() => $_has(1);
  @$pb.TagNumber(2)
  void clearMetadata() => clearField(2);
}

class DeleteAgentDispatchRequest extends $pb.GeneratedMessage {
  factory DeleteAgentDispatchRequest({
    $core.String? dispatchId,
    $core.String? room,
  }) {
    final $result = create();
    if (dispatchId != null) {
      $result.dispatchId = dispatchId;
    }
    if (room != null) {
      $result.room = room;
    }
    return $result;
  }
  DeleteAgentDispatchRequest._() : super();
  factory DeleteAgentDispatchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAgentDispatchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAgentDispatchRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dispatchId')
    ..aOS(2, _omitFieldNames ? '' : 'room')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAgentDispatchRequest clone() => DeleteAgentDispatchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAgentDispatchRequest copyWith(void Function(DeleteAgentDispatchRequest) updates) => super.copyWith((message) => updates(message as DeleteAgentDispatchRequest)) as DeleteAgentDispatchRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAgentDispatchRequest create() => DeleteAgentDispatchRequest._();
  DeleteAgentDispatchRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteAgentDispatchRequest> createRepeated() => $pb.PbList<DeleteAgentDispatchRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteAgentDispatchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAgentDispatchRequest>(create);
  static DeleteAgentDispatchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dispatchId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dispatchId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDispatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDispatchId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get room => $_getSZ(1);
  @$pb.TagNumber(2)
  set room($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => clearField(2);
}

class ListAgentDispatchRequest extends $pb.GeneratedMessage {
  factory ListAgentDispatchRequest({
    $core.String? dispatchId,
    $core.String? room,
  }) {
    final $result = create();
    if (dispatchId != null) {
      $result.dispatchId = dispatchId;
    }
    if (room != null) {
      $result.room = room;
    }
    return $result;
  }
  ListAgentDispatchRequest._() : super();
  factory ListAgentDispatchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAgentDispatchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAgentDispatchRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dispatchId')
    ..aOS(2, _omitFieldNames ? '' : 'room')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAgentDispatchRequest clone() => ListAgentDispatchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAgentDispatchRequest copyWith(void Function(ListAgentDispatchRequest) updates) => super.copyWith((message) => updates(message as ListAgentDispatchRequest)) as ListAgentDispatchRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentDispatchRequest create() => ListAgentDispatchRequest._();
  ListAgentDispatchRequest createEmptyInstance() => create();
  static $pb.PbList<ListAgentDispatchRequest> createRepeated() => $pb.PbList<ListAgentDispatchRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAgentDispatchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAgentDispatchRequest>(create);
  static ListAgentDispatchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dispatchId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dispatchId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDispatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDispatchId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get room => $_getSZ(1);
  @$pb.TagNumber(2)
  set room($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => clearField(2);
}

class ListAgentDispatchResponse extends $pb.GeneratedMessage {
  factory ListAgentDispatchResponse({
    $core.Iterable<AgentDispatch>? agentDispatches,
  }) {
    final $result = create();
    if (agentDispatches != null) {
      $result.agentDispatches.addAll(agentDispatches);
    }
    return $result;
  }
  ListAgentDispatchResponse._() : super();
  factory ListAgentDispatchResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAgentDispatchResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAgentDispatchResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<AgentDispatch>(1, _omitFieldNames ? '' : 'agentDispatches', $pb.PbFieldType.PM, subBuilder: AgentDispatch.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAgentDispatchResponse clone() => ListAgentDispatchResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAgentDispatchResponse copyWith(void Function(ListAgentDispatchResponse) updates) => super.copyWith((message) => updates(message as ListAgentDispatchResponse)) as ListAgentDispatchResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentDispatchResponse create() => ListAgentDispatchResponse._();
  ListAgentDispatchResponse createEmptyInstance() => create();
  static $pb.PbList<ListAgentDispatchResponse> createRepeated() => $pb.PbList<ListAgentDispatchResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAgentDispatchResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAgentDispatchResponse>(create);
  static ListAgentDispatchResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AgentDispatch> get agentDispatches => $_getList(0);
}

class AgentDispatch extends $pb.GeneratedMessage {
  factory AgentDispatch({
    $core.String? id,
    $core.String? agentName,
    $core.String? room,
    $core.String? metadata,
    AgentDispatchState? state,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (agentName != null) {
      $result.agentName = agentName;
    }
    if (room != null) {
      $result.room = room;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (state != null) {
      $result.state = state;
    }
    return $result;
  }
  AgentDispatch._() : super();
  factory AgentDispatch.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AgentDispatch.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AgentDispatch', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..aOS(3, _omitFieldNames ? '' : 'room')
    ..aOS(4, _omitFieldNames ? '' : 'metadata')
    ..aOM<AgentDispatchState>(5, _omitFieldNames ? '' : 'state', subBuilder: AgentDispatchState.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AgentDispatch clone() => AgentDispatch()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AgentDispatch copyWith(void Function(AgentDispatch) updates) => super.copyWith((message) => updates(message as AgentDispatch)) as AgentDispatch;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentDispatch create() => AgentDispatch._();
  AgentDispatch createEmptyInstance() => create();
  static $pb.PbList<AgentDispatch> createRepeated() => $pb.PbList<AgentDispatch>();
  @$core.pragma('dart2js:noInline')
  static AgentDispatch getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AgentDispatch>(create);
  static AgentDispatch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get room => $_getSZ(2);
  @$pb.TagNumber(3)
  set room($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoom() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get metadata => $_getSZ(3);
  @$pb.TagNumber(4)
  set metadata($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMetadata() => $_has(3);
  @$pb.TagNumber(4)
  void clearMetadata() => clearField(4);

  @$pb.TagNumber(5)
  AgentDispatchState get state => $_getN(4);
  @$pb.TagNumber(5)
  set state(AgentDispatchState v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => clearField(5);
  @$pb.TagNumber(5)
  AgentDispatchState ensureState() => $_ensure(4);
}

class AgentDispatchState extends $pb.GeneratedMessage {
  factory AgentDispatchState({
    $core.Iterable<$5.Job>? jobs,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? deletedAt,
  }) {
    final $result = create();
    if (jobs != null) {
      $result.jobs.addAll(jobs);
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (deletedAt != null) {
      $result.deletedAt = deletedAt;
    }
    return $result;
  }
  AgentDispatchState._() : super();
  factory AgentDispatchState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AgentDispatchState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AgentDispatchState', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<$5.Job>(1, _omitFieldNames ? '' : 'jobs', $pb.PbFieldType.PM, subBuilder: $5.Job.create)
    ..aInt64(2, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(3, _omitFieldNames ? '' : 'deletedAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AgentDispatchState clone() => AgentDispatchState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AgentDispatchState copyWith(void Function(AgentDispatchState) updates) => super.copyWith((message) => updates(message as AgentDispatchState)) as AgentDispatchState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentDispatchState create() => AgentDispatchState._();
  AgentDispatchState createEmptyInstance() => create();
  static $pb.PbList<AgentDispatchState> createRepeated() => $pb.PbList<AgentDispatchState>();
  @$core.pragma('dart2js:noInline')
  static AgentDispatchState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AgentDispatchState>(create);
  static AgentDispatchState? _defaultInstance;

  /// For dispatches of tyoe JT_ROOM, there will be at most 1 job.
  /// For dispatches of type JT_PUBLISHER, there will be 1 per publisher.
  @$pb.TagNumber(1)
  $core.List<$5.Job> get jobs => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get createdAt => $_getI64(1);
  @$pb.TagNumber(2)
  set createdAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get deletedAt => $_getI64(2);
  @$pb.TagNumber(3)
  set deletedAt($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeletedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeletedAt() => clearField(3);
}

class AgentDispatchServiceApi {
  $pb.RpcClient _client;
  AgentDispatchServiceApi(this._client);

  $async.Future<AgentDispatch> createDispatch($pb.ClientContext? ctx, CreateAgentDispatchRequest request) =>
    _client.invoke<AgentDispatch>(ctx, 'AgentDispatchService', 'CreateDispatch', request, AgentDispatch())
  ;
  $async.Future<AgentDispatch> deleteDispatch($pb.ClientContext? ctx, DeleteAgentDispatchRequest request) =>
    _client.invoke<AgentDispatch>(ctx, 'AgentDispatchService', 'DeleteDispatch', request, AgentDispatch())
  ;
  $async.Future<ListAgentDispatchResponse> listDispatch($pb.ClientContext? ctx, ListAgentDispatchRequest request) =>
    _client.invoke<ListAgentDispatchResponse>(ctx, 'AgentDispatchService', 'ListDispatch', request, ListAgentDispatchResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
