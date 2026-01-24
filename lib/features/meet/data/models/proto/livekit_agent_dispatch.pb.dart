// This is a generated file - do not edit.
//
// Generated from livekit_agent_dispatch.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_agent.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CreateAgentDispatchRequest extends $pb.GeneratedMessage {
  factory CreateAgentDispatchRequest({
    $core.String? agentName,
    $core.String? room,
    $core.String? metadata,
  }) {
    final result = create();
    if (agentName != null) result.agentName = agentName;
    if (room != null) result.room = room;
    if (metadata != null) result.metadata = metadata;
    return result;
  }

  CreateAgentDispatchRequest._();

  factory CreateAgentDispatchRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateAgentDispatchRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateAgentDispatchRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentName')
    ..aOS(2, _omitFieldNames ? '' : 'room')
    ..aOS(3, _omitFieldNames ? '' : 'metadata')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAgentDispatchRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAgentDispatchRequest copyWith(
          void Function(CreateAgentDispatchRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateAgentDispatchRequest))
          as CreateAgentDispatchRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAgentDispatchRequest create() => CreateAgentDispatchRequest._();
  @$core.override
  CreateAgentDispatchRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateAgentDispatchRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateAgentDispatchRequest>(create);
  static CreateAgentDispatchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentName => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get room => $_getSZ(1);
  @$pb.TagNumber(2)
  set room($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get metadata => $_getSZ(2);
  @$pb.TagNumber(3)
  set metadata($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearMetadata() => $_clearField(3);
}

class RoomAgentDispatch extends $pb.GeneratedMessage {
  factory RoomAgentDispatch({
    $core.String? agentName,
    $core.String? metadata,
  }) {
    final result = create();
    if (agentName != null) result.agentName = agentName;
    if (metadata != null) result.metadata = metadata;
    return result;
  }

  RoomAgentDispatch._();

  factory RoomAgentDispatch.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomAgentDispatch.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomAgentDispatch',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'agentName')
    ..aOS(2, _omitFieldNames ? '' : 'metadata')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomAgentDispatch clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomAgentDispatch copyWith(void Function(RoomAgentDispatch) updates) =>
      super.copyWith((message) => updates(message as RoomAgentDispatch))
          as RoomAgentDispatch;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomAgentDispatch create() => RoomAgentDispatch._();
  @$core.override
  RoomAgentDispatch createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomAgentDispatch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomAgentDispatch>(create);
  static RoomAgentDispatch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get agentName => $_getSZ(0);
  @$pb.TagNumber(1)
  set agentName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get metadata => $_getSZ(1);
  @$pb.TagNumber(2)
  set metadata($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMetadata() => $_has(1);
  @$pb.TagNumber(2)
  void clearMetadata() => $_clearField(2);
}

class DeleteAgentDispatchRequest extends $pb.GeneratedMessage {
  factory DeleteAgentDispatchRequest({
    $core.String? dispatchId,
    $core.String? room,
  }) {
    final result = create();
    if (dispatchId != null) result.dispatchId = dispatchId;
    if (room != null) result.room = room;
    return result;
  }

  DeleteAgentDispatchRequest._();

  factory DeleteAgentDispatchRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteAgentDispatchRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteAgentDispatchRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dispatchId')
    ..aOS(2, _omitFieldNames ? '' : 'room')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAgentDispatchRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAgentDispatchRequest copyWith(
          void Function(DeleteAgentDispatchRequest) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteAgentDispatchRequest))
          as DeleteAgentDispatchRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAgentDispatchRequest create() => DeleteAgentDispatchRequest._();
  @$core.override
  DeleteAgentDispatchRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteAgentDispatchRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteAgentDispatchRequest>(create);
  static DeleteAgentDispatchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dispatchId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dispatchId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDispatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDispatchId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get room => $_getSZ(1);
  @$pb.TagNumber(2)
  set room($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => $_clearField(2);
}

class ListAgentDispatchRequest extends $pb.GeneratedMessage {
  factory ListAgentDispatchRequest({
    $core.String? dispatchId,
    $core.String? room,
  }) {
    final result = create();
    if (dispatchId != null) result.dispatchId = dispatchId;
    if (room != null) result.room = room;
    return result;
  }

  ListAgentDispatchRequest._();

  factory ListAgentDispatchRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAgentDispatchRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAgentDispatchRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dispatchId')
    ..aOS(2, _omitFieldNames ? '' : 'room')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentDispatchRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentDispatchRequest copyWith(
          void Function(ListAgentDispatchRequest) updates) =>
      super.copyWith((message) => updates(message as ListAgentDispatchRequest))
          as ListAgentDispatchRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentDispatchRequest create() => ListAgentDispatchRequest._();
  @$core.override
  ListAgentDispatchRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAgentDispatchRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAgentDispatchRequest>(create);
  static ListAgentDispatchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dispatchId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dispatchId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDispatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDispatchId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get room => $_getSZ(1);
  @$pb.TagNumber(2)
  set room($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => $_clearField(2);
}

class ListAgentDispatchResponse extends $pb.GeneratedMessage {
  factory ListAgentDispatchResponse({
    $core.Iterable<AgentDispatch>? agentDispatches,
  }) {
    final result = create();
    if (agentDispatches != null) result.agentDispatches.addAll(agentDispatches);
    return result;
  }

  ListAgentDispatchResponse._();

  factory ListAgentDispatchResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAgentDispatchResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAgentDispatchResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPM<AgentDispatch>(1, _omitFieldNames ? '' : 'agentDispatches',
        subBuilder: AgentDispatch.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentDispatchResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAgentDispatchResponse copyWith(
          void Function(ListAgentDispatchResponse) updates) =>
      super.copyWith((message) => updates(message as ListAgentDispatchResponse))
          as ListAgentDispatchResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAgentDispatchResponse create() => ListAgentDispatchResponse._();
  @$core.override
  ListAgentDispatchResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAgentDispatchResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAgentDispatchResponse>(create);
  static ListAgentDispatchResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AgentDispatch> get agentDispatches => $_getList(0);
}

class AgentDispatch extends $pb.GeneratedMessage {
  factory AgentDispatch({
    $core.String? id,
    $core.String? agentName,
    $core.String? room,
    $core.String? metadata,
    AgentDispatchState? state,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (agentName != null) result.agentName = agentName;
    if (room != null) result.room = room;
    if (metadata != null) result.metadata = metadata;
    if (state != null) result.state = state;
    return result;
  }

  AgentDispatch._();

  factory AgentDispatch.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgentDispatch.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgentDispatch',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'agentName')
    ..aOS(3, _omitFieldNames ? '' : 'room')
    ..aOS(4, _omitFieldNames ? '' : 'metadata')
    ..aOM<AgentDispatchState>(5, _omitFieldNames ? '' : 'state',
        subBuilder: AgentDispatchState.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentDispatch clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentDispatch copyWith(void Function(AgentDispatch) updates) =>
      super.copyWith((message) => updates(message as AgentDispatch))
          as AgentDispatch;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentDispatch create() => AgentDispatch._();
  @$core.override
  AgentDispatch createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgentDispatch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgentDispatch>(create);
  static AgentDispatch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get agentName => $_getSZ(1);
  @$pb.TagNumber(2)
  set agentName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAgentName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgentName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get room => $_getSZ(2);
  @$pb.TagNumber(3)
  set room($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoom() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get metadata => $_getSZ(3);
  @$pb.TagNumber(4)
  set metadata($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMetadata() => $_has(3);
  @$pb.TagNumber(4)
  void clearMetadata() => $_clearField(4);

  @$pb.TagNumber(5)
  AgentDispatchState get state => $_getN(4);
  @$pb.TagNumber(5)
  set state(AgentDispatchState value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => $_clearField(5);
  @$pb.TagNumber(5)
  AgentDispatchState ensureState() => $_ensure(4);
}

class AgentDispatchState extends $pb.GeneratedMessage {
  factory AgentDispatchState({
    $core.Iterable<$0.Job>? jobs,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? deletedAt,
  }) {
    final result = create();
    if (jobs != null) result.jobs.addAll(jobs);
    if (createdAt != null) result.createdAt = createdAt;
    if (deletedAt != null) result.deletedAt = deletedAt;
    return result;
  }

  AgentDispatchState._();

  factory AgentDispatchState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgentDispatchState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgentDispatchState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPM<$0.Job>(1, _omitFieldNames ? '' : 'jobs', subBuilder: $0.Job.create)
    ..aInt64(2, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(3, _omitFieldNames ? '' : 'deletedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentDispatchState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentDispatchState copyWith(void Function(AgentDispatchState) updates) =>
      super.copyWith((message) => updates(message as AgentDispatchState))
          as AgentDispatchState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentDispatchState create() => AgentDispatchState._();
  @$core.override
  AgentDispatchState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgentDispatchState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgentDispatchState>(create);
  static AgentDispatchState? _defaultInstance;

  /// For dispatches of tyoe JT_ROOM, there will be at most 1 job.
  /// For dispatches of type JT_PUBLISHER, there will be 1 per publisher.
  @$pb.TagNumber(1)
  $pb.PbList<$0.Job> get jobs => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get createdAt => $_getI64(1);
  @$pb.TagNumber(2)
  set createdAt($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get deletedAt => $_getI64(2);
  @$pb.TagNumber(3)
  set deletedAt($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDeletedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeletedAt() => $_clearField(3);
}

class AgentDispatchServiceApi {
  final $pb.RpcClient _client;

  AgentDispatchServiceApi(this._client);

  $async.Future<AgentDispatch> createDispatch(
          $pb.ClientContext? ctx, CreateAgentDispatchRequest request) =>
      _client.invoke<AgentDispatch>(ctx, 'AgentDispatchService',
          'CreateDispatch', request, AgentDispatch());
  $async.Future<AgentDispatch> deleteDispatch(
          $pb.ClientContext? ctx, DeleteAgentDispatchRequest request) =>
      _client.invoke<AgentDispatch>(ctx, 'AgentDispatchService',
          'DeleteDispatch', request, AgentDispatch());
  $async.Future<ListAgentDispatchResponse> listDispatch(
          $pb.ClientContext? ctx, ListAgentDispatchRequest request) =>
      _client.invoke<ListAgentDispatchResponse>(ctx, 'AgentDispatchService',
          'ListDispatch', request, ListAgentDispatchResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
