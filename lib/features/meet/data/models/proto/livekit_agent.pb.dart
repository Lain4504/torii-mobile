// This is a generated file - do not edit.
//
// Generated from livekit_agent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_agent.pbenum.dart';
import 'livekit_models.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'livekit_agent.pbenum.dart';

class Job extends $pb.GeneratedMessage {
  factory Job({
    $core.String? id,
    JobType? type,
    $0.Room? room,
    $0.ParticipantInfo? participant,
    @$core.Deprecated('This field is deprecated.') $core.String? namespace,
    $core.String? metadata,
    $core.String? agentName,
    JobState? state,
    $core.String? dispatchId,
    $core.bool? enableRecording,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (room != null) result.room = room;
    if (participant != null) result.participant = participant;
    if (namespace != null) result.namespace = namespace;
    if (metadata != null) result.metadata = metadata;
    if (agentName != null) result.agentName = agentName;
    if (state != null) result.state = state;
    if (dispatchId != null) result.dispatchId = dispatchId;
    if (enableRecording != null) result.enableRecording = enableRecording;
    return result;
  }

  Job._();

  factory Job.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Job.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Job',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..e<JobType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: JobType.JT_ROOM,
        valueOf: JobType.valueOf,
        enumValues: JobType.values)
    ..aOM<$0.Room>(3, _omitFieldNames ? '' : 'room', subBuilder: $0.Room.create)
    ..aOM<$0.ParticipantInfo>(4, _omitFieldNames ? '' : 'participant',
        subBuilder: $0.ParticipantInfo.create)
    ..aOS(5, _omitFieldNames ? '' : 'namespace')
    ..aOS(6, _omitFieldNames ? '' : 'metadata')
    ..aOS(7, _omitFieldNames ? '' : 'agentName')
    ..aOM<JobState>(8, _omitFieldNames ? '' : 'state',
        subBuilder: JobState.create)
    ..aOS(9, _omitFieldNames ? '' : 'dispatchId')
    ..aOB(10, _omitFieldNames ? '' : 'enableRecording')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Job clone() => Job()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Job copyWith(void Function(Job) updates) =>
      super.copyWith((message) => updates(message as Job)) as Job;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Job create() => Job._();
  @$core.override
  Job createEmptyInstance() => create();
  static $pb.PbList<Job> createRepeated() => $pb.PbList<Job>();
  @$core.pragma('dart2js:noInline')
  static Job getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Job>(create);
  static Job? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  JobType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(JobType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Room get room => $_getN(2);
  @$pb.TagNumber(3)
  set room($0.Room value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoom() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Room ensureRoom() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.ParticipantInfo get participant => $_getN(3);
  @$pb.TagNumber(4)
  set participant($0.ParticipantInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasParticipant() => $_has(3);
  @$pb.TagNumber(4)
  void clearParticipant() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.ParticipantInfo ensureParticipant() => $_ensure(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.String get namespace => $_getSZ(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set namespace($core.String value) => $_setString(4, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasNamespace() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearNamespace() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get metadata => $_getSZ(5);
  @$pb.TagNumber(6)
  set metadata($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMetadata() => $_has(5);
  @$pb.TagNumber(6)
  void clearMetadata() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get agentName => $_getSZ(6);
  @$pb.TagNumber(7)
  set agentName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAgentName() => $_has(6);
  @$pb.TagNumber(7)
  void clearAgentName() => $_clearField(7);

  @$pb.TagNumber(8)
  JobState get state => $_getN(7);
  @$pb.TagNumber(8)
  set state(JobState value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasState() => $_has(7);
  @$pb.TagNumber(8)
  void clearState() => $_clearField(8);
  @$pb.TagNumber(8)
  JobState ensureState() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get dispatchId => $_getSZ(8);
  @$pb.TagNumber(9)
  set dispatchId($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDispatchId() => $_has(8);
  @$pb.TagNumber(9)
  void clearDispatchId() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get enableRecording => $_getBF(9);
  @$pb.TagNumber(10)
  set enableRecording($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasEnableRecording() => $_has(9);
  @$pb.TagNumber(10)
  void clearEnableRecording() => $_clearField(10);
}

class JobState extends $pb.GeneratedMessage {
  factory JobState({
    JobStatus? status,
    $core.String? error,
    $fixnum.Int64? startedAt,
    $fixnum.Int64? endedAt,
    $fixnum.Int64? updatedAt,
    $core.String? participantIdentity,
    $core.String? workerId,
    $core.String? agentId,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (error != null) result.error = error;
    if (startedAt != null) result.startedAt = startedAt;
    if (endedAt != null) result.endedAt = endedAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (workerId != null) result.workerId = workerId;
    if (agentId != null) result.agentId = agentId;
    return result;
  }

  JobState._();

  factory JobState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JobState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JobState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..e<JobStatus>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: JobStatus.JS_PENDING,
        valueOf: JobStatus.valueOf,
        enumValues: JobStatus.values)
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..aInt64(3, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(4, _omitFieldNames ? '' : 'endedAt')
    ..aInt64(5, _omitFieldNames ? '' : 'updatedAt')
    ..aOS(6, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(7, _omitFieldNames ? '' : 'workerId')
    ..aOS(8, _omitFieldNames ? '' : 'agentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JobState clone() => JobState()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JobState copyWith(void Function(JobState) updates) =>
      super.copyWith((message) => updates(message as JobState)) as JobState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JobState create() => JobState._();
  @$core.override
  JobState createEmptyInstance() => create();
  static $pb.PbList<JobState> createRepeated() => $pb.PbList<JobState>();
  @$core.pragma('dart2js:noInline')
  static JobState getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JobState>(create);
  static JobState? _defaultInstance;

  @$pb.TagNumber(1)
  JobStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(JobStatus value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get startedAt => $_getI64(2);
  @$pb.TagNumber(3)
  set startedAt($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStartedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartedAt() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get endedAt => $_getI64(3);
  @$pb.TagNumber(4)
  set endedAt($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEndedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndedAt() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get updatedAt => $_getI64(4);
  @$pb.TagNumber(5)
  set updatedAt($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUpdatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdatedAt() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get participantIdentity => $_getSZ(5);
  @$pb.TagNumber(6)
  set participantIdentity($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasParticipantIdentity() => $_has(5);
  @$pb.TagNumber(6)
  void clearParticipantIdentity() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get workerId => $_getSZ(6);
  @$pb.TagNumber(7)
  set workerId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasWorkerId() => $_has(6);
  @$pb.TagNumber(7)
  void clearWorkerId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get agentId => $_getSZ(7);
  @$pb.TagNumber(8)
  set agentId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAgentId() => $_has(7);
  @$pb.TagNumber(8)
  void clearAgentId() => $_clearField(8);
}

enum WorkerMessage_Message {
  register,
  availability,
  updateWorker,
  updateJob,
  ping,
  simulateJob,
  migrateJob,
  notSet
}

/// from Worker to Server
class WorkerMessage extends $pb.GeneratedMessage {
  factory WorkerMessage({
    RegisterWorkerRequest? register,
    AvailabilityResponse? availability,
    UpdateWorkerStatus? updateWorker,
    UpdateJobStatus? updateJob,
    WorkerPing? ping,
    SimulateJobRequest? simulateJob,
    MigrateJobRequest? migrateJob,
  }) {
    final result = create();
    if (register != null) result.register = register;
    if (availability != null) result.availability = availability;
    if (updateWorker != null) result.updateWorker = updateWorker;
    if (updateJob != null) result.updateJob = updateJob;
    if (ping != null) result.ping = ping;
    if (simulateJob != null) result.simulateJob = simulateJob;
    if (migrateJob != null) result.migrateJob = migrateJob;
    return result;
  }

  WorkerMessage._();

  factory WorkerMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorkerMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, WorkerMessage_Message>
      _WorkerMessage_MessageByTag = {
    1: WorkerMessage_Message.register,
    2: WorkerMessage_Message.availability,
    3: WorkerMessage_Message.updateWorker,
    4: WorkerMessage_Message.updateJob,
    5: WorkerMessage_Message.ping,
    6: WorkerMessage_Message.simulateJob,
    7: WorkerMessage_Message.migrateJob,
    0: WorkerMessage_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorkerMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7])
    ..aOM<RegisterWorkerRequest>(1, _omitFieldNames ? '' : 'register',
        subBuilder: RegisterWorkerRequest.create)
    ..aOM<AvailabilityResponse>(2, _omitFieldNames ? '' : 'availability',
        subBuilder: AvailabilityResponse.create)
    ..aOM<UpdateWorkerStatus>(3, _omitFieldNames ? '' : 'updateWorker',
        subBuilder: UpdateWorkerStatus.create)
    ..aOM<UpdateJobStatus>(4, _omitFieldNames ? '' : 'updateJob',
        subBuilder: UpdateJobStatus.create)
    ..aOM<WorkerPing>(5, _omitFieldNames ? '' : 'ping',
        subBuilder: WorkerPing.create)
    ..aOM<SimulateJobRequest>(6, _omitFieldNames ? '' : 'simulateJob',
        subBuilder: SimulateJobRequest.create)
    ..aOM<MigrateJobRequest>(7, _omitFieldNames ? '' : 'migrateJob',
        subBuilder: MigrateJobRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerMessage clone() => WorkerMessage()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerMessage copyWith(void Function(WorkerMessage) updates) =>
      super.copyWith((message) => updates(message as WorkerMessage))
          as WorkerMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorkerMessage create() => WorkerMessage._();
  @$core.override
  WorkerMessage createEmptyInstance() => create();
  static $pb.PbList<WorkerMessage> createRepeated() =>
      $pb.PbList<WorkerMessage>();
  @$core.pragma('dart2js:noInline')
  static WorkerMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WorkerMessage>(create);
  static WorkerMessage? _defaultInstance;

  WorkerMessage_Message whichMessage() =>
      _WorkerMessage_MessageByTag[$_whichOneof(0)]!;
  void clearMessage() => $_clearField($_whichOneof(0));

  /// agent workers need to register themselves with the server first
  @$pb.TagNumber(1)
  RegisterWorkerRequest get register => $_getN(0);
  @$pb.TagNumber(1)
  set register(RegisterWorkerRequest value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRegister() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegister() => $_clearField(1);
  @$pb.TagNumber(1)
  RegisterWorkerRequest ensureRegister() => $_ensure(0);

  /// worker confirms to server that it's available for a job, or declines it
  @$pb.TagNumber(2)
  AvailabilityResponse get availability => $_getN(1);
  @$pb.TagNumber(2)
  set availability(AvailabilityResponse value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAvailability() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvailability() => $_clearField(2);
  @$pb.TagNumber(2)
  AvailabilityResponse ensureAvailability() => $_ensure(1);

  /// worker can update its status to the server, including taking itself out of the pool
  @$pb.TagNumber(3)
  UpdateWorkerStatus get updateWorker => $_getN(2);
  @$pb.TagNumber(3)
  set updateWorker(UpdateWorkerStatus value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdateWorker() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateWorker() => $_clearField(3);
  @$pb.TagNumber(3)
  UpdateWorkerStatus ensureUpdateWorker() => $_ensure(2);

  /// job can send status updates to the server, useful for tracking progress
  @$pb.TagNumber(4)
  UpdateJobStatus get updateJob => $_getN(3);
  @$pb.TagNumber(4)
  set updateJob(UpdateJobStatus value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasUpdateJob() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdateJob() => $_clearField(4);
  @$pb.TagNumber(4)
  UpdateJobStatus ensureUpdateJob() => $_ensure(3);

  @$pb.TagNumber(5)
  WorkerPing get ping => $_getN(4);
  @$pb.TagNumber(5)
  set ping(WorkerPing value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPing() => $_has(4);
  @$pb.TagNumber(5)
  void clearPing() => $_clearField(5);
  @$pb.TagNumber(5)
  WorkerPing ensurePing() => $_ensure(4);

  @$pb.TagNumber(6)
  SimulateJobRequest get simulateJob => $_getN(5);
  @$pb.TagNumber(6)
  set simulateJob(SimulateJobRequest value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasSimulateJob() => $_has(5);
  @$pb.TagNumber(6)
  void clearSimulateJob() => $_clearField(6);
  @$pb.TagNumber(6)
  SimulateJobRequest ensureSimulateJob() => $_ensure(5);

  @$pb.TagNumber(7)
  MigrateJobRequest get migrateJob => $_getN(6);
  @$pb.TagNumber(7)
  set migrateJob(MigrateJobRequest value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasMigrateJob() => $_has(6);
  @$pb.TagNumber(7)
  void clearMigrateJob() => $_clearField(7);
  @$pb.TagNumber(7)
  MigrateJobRequest ensureMigrateJob() => $_ensure(6);
}

enum ServerMessage_Message {
  register,
  availability,
  assignment,
  pong,
  termination,
  notSet
}

/// from Server to Worker
class ServerMessage extends $pb.GeneratedMessage {
  factory ServerMessage({
    RegisterWorkerResponse? register,
    AvailabilityRequest? availability,
    JobAssignment? assignment,
    WorkerPong? pong,
    JobTermination? termination,
  }) {
    final result = create();
    if (register != null) result.register = register;
    if (availability != null) result.availability = availability;
    if (assignment != null) result.assignment = assignment;
    if (pong != null) result.pong = pong;
    if (termination != null) result.termination = termination;
    return result;
  }

  ServerMessage._();

  factory ServerMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ServerMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ServerMessage_Message>
      _ServerMessage_MessageByTag = {
    1: ServerMessage_Message.register,
    2: ServerMessage_Message.availability,
    3: ServerMessage_Message.assignment,
    4: ServerMessage_Message.pong,
    5: ServerMessage_Message.termination,
    0: ServerMessage_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ServerMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<RegisterWorkerResponse>(1, _omitFieldNames ? '' : 'register',
        subBuilder: RegisterWorkerResponse.create)
    ..aOM<AvailabilityRequest>(2, _omitFieldNames ? '' : 'availability',
        subBuilder: AvailabilityRequest.create)
    ..aOM<JobAssignment>(3, _omitFieldNames ? '' : 'assignment',
        subBuilder: JobAssignment.create)
    ..aOM<WorkerPong>(4, _omitFieldNames ? '' : 'pong',
        subBuilder: WorkerPong.create)
    ..aOM<JobTermination>(5, _omitFieldNames ? '' : 'termination',
        subBuilder: JobTermination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ServerMessage clone() => ServerMessage()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ServerMessage copyWith(void Function(ServerMessage) updates) =>
      super.copyWith((message) => updates(message as ServerMessage))
          as ServerMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerMessage create() => ServerMessage._();
  @$core.override
  ServerMessage createEmptyInstance() => create();
  static $pb.PbList<ServerMessage> createRepeated() =>
      $pb.PbList<ServerMessage>();
  @$core.pragma('dart2js:noInline')
  static ServerMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ServerMessage>(create);
  static ServerMessage? _defaultInstance;

  ServerMessage_Message whichMessage() =>
      _ServerMessage_MessageByTag[$_whichOneof(0)]!;
  void clearMessage() => $_clearField($_whichOneof(0));

  /// server confirms the registration, from this moment on, the worker is considered active
  @$pb.TagNumber(1)
  RegisterWorkerResponse get register => $_getN(0);
  @$pb.TagNumber(1)
  set register(RegisterWorkerResponse value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRegister() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegister() => $_clearField(1);
  @$pb.TagNumber(1)
  RegisterWorkerResponse ensureRegister() => $_ensure(0);

  /// server asks worker to confirm availability for a job
  @$pb.TagNumber(2)
  AvailabilityRequest get availability => $_getN(1);
  @$pb.TagNumber(2)
  set availability(AvailabilityRequest value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAvailability() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvailability() => $_clearField(2);
  @$pb.TagNumber(2)
  AvailabilityRequest ensureAvailability() => $_ensure(1);

  @$pb.TagNumber(3)
  JobAssignment get assignment => $_getN(2);
  @$pb.TagNumber(3)
  set assignment(JobAssignment value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAssignment() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssignment() => $_clearField(3);
  @$pb.TagNumber(3)
  JobAssignment ensureAssignment() => $_ensure(2);

  @$pb.TagNumber(4)
  WorkerPong get pong => $_getN(3);
  @$pb.TagNumber(4)
  set pong(WorkerPong value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPong() => $_has(3);
  @$pb.TagNumber(4)
  void clearPong() => $_clearField(4);
  @$pb.TagNumber(4)
  WorkerPong ensurePong() => $_ensure(3);

  @$pb.TagNumber(5)
  JobTermination get termination => $_getN(4);
  @$pb.TagNumber(5)
  set termination(JobTermination value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTermination() => $_has(4);
  @$pb.TagNumber(5)
  void clearTermination() => $_clearField(5);
  @$pb.TagNumber(5)
  JobTermination ensureTermination() => $_ensure(4);
}

class SimulateJobRequest extends $pb.GeneratedMessage {
  factory SimulateJobRequest({
    JobType? type,
    $0.Room? room,
    $0.ParticipantInfo? participant,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (room != null) result.room = room;
    if (participant != null) result.participant = participant;
    return result;
  }

  SimulateJobRequest._();

  factory SimulateJobRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SimulateJobRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SimulateJobRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..e<JobType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: JobType.JT_ROOM,
        valueOf: JobType.valueOf,
        enumValues: JobType.values)
    ..aOM<$0.Room>(2, _omitFieldNames ? '' : 'room', subBuilder: $0.Room.create)
    ..aOM<$0.ParticipantInfo>(3, _omitFieldNames ? '' : 'participant',
        subBuilder: $0.ParticipantInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimulateJobRequest clone() => SimulateJobRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimulateJobRequest copyWith(void Function(SimulateJobRequest) updates) =>
      super.copyWith((message) => updates(message as SimulateJobRequest))
          as SimulateJobRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SimulateJobRequest create() => SimulateJobRequest._();
  @$core.override
  SimulateJobRequest createEmptyInstance() => create();
  static $pb.PbList<SimulateJobRequest> createRepeated() =>
      $pb.PbList<SimulateJobRequest>();
  @$core.pragma('dart2js:noInline')
  static SimulateJobRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SimulateJobRequest>(create);
  static SimulateJobRequest? _defaultInstance;

  @$pb.TagNumber(1)
  JobType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(JobType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Room get room => $_getN(1);
  @$pb.TagNumber(2)
  set room($0.Room value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Room ensureRoom() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.ParticipantInfo get participant => $_getN(2);
  @$pb.TagNumber(3)
  set participant($0.ParticipantInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasParticipant() => $_has(2);
  @$pb.TagNumber(3)
  void clearParticipant() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.ParticipantInfo ensureParticipant() => $_ensure(2);
}

class WorkerPing extends $pb.GeneratedMessage {
  factory WorkerPing({
    $fixnum.Int64? timestamp,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  WorkerPing._();

  factory WorkerPing.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorkerPing.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorkerPing',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerPing clone() => WorkerPing()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerPing copyWith(void Function(WorkerPing) updates) =>
      super.copyWith((message) => updates(message as WorkerPing)) as WorkerPing;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorkerPing create() => WorkerPing._();
  @$core.override
  WorkerPing createEmptyInstance() => create();
  static $pb.PbList<WorkerPing> createRepeated() => $pb.PbList<WorkerPing>();
  @$core.pragma('dart2js:noInline')
  static WorkerPing getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WorkerPing>(create);
  static WorkerPing? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);
}

class WorkerPong extends $pb.GeneratedMessage {
  factory WorkerPong({
    $fixnum.Int64? lastTimestamp,
    $fixnum.Int64? timestamp,
  }) {
    final result = create();
    if (lastTimestamp != null) result.lastTimestamp = lastTimestamp;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  WorkerPong._();

  factory WorkerPong.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorkerPong.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorkerPong',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'lastTimestamp')
    ..aInt64(2, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerPong clone() => WorkerPong()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerPong copyWith(void Function(WorkerPong) updates) =>
      super.copyWith((message) => updates(message as WorkerPong)) as WorkerPong;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorkerPong create() => WorkerPong._();
  @$core.override
  WorkerPong createEmptyInstance() => create();
  static $pb.PbList<WorkerPong> createRepeated() => $pb.PbList<WorkerPong>();
  @$core.pragma('dart2js:noInline')
  static WorkerPong getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WorkerPong>(create);
  static WorkerPong? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get lastTimestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set lastTimestamp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLastTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastTimestamp() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set timestamp($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => $_clearField(2);
}

class RegisterWorkerRequest extends $pb.GeneratedMessage {
  factory RegisterWorkerRequest({
    JobType? type,
    $core.String? version,
    $core.int? pingInterval,
    $core.String? namespace,
    $0.ParticipantPermission? allowedPermissions,
    $core.String? agentName,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (version != null) result.version = version;
    if (pingInterval != null) result.pingInterval = pingInterval;
    if (namespace != null) result.namespace = namespace;
    if (allowedPermissions != null)
      result.allowedPermissions = allowedPermissions;
    if (agentName != null) result.agentName = agentName;
    return result;
  }

  RegisterWorkerRequest._();

  factory RegisterWorkerRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterWorkerRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterWorkerRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..e<JobType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: JobType.JT_ROOM,
        valueOf: JobType.valueOf,
        enumValues: JobType.values)
    ..aOS(3, _omitFieldNames ? '' : 'version')
    ..a<$core.int>(
        5, _omitFieldNames ? '' : 'pingInterval', $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'namespace')
    ..aOM<$0.ParticipantPermission>(
        7, _omitFieldNames ? '' : 'allowedPermissions',
        subBuilder: $0.ParticipantPermission.create)
    ..aOS(8, _omitFieldNames ? '' : 'agentName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterWorkerRequest clone() =>
      RegisterWorkerRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterWorkerRequest copyWith(
          void Function(RegisterWorkerRequest) updates) =>
      super.copyWith((message) => updates(message as RegisterWorkerRequest))
          as RegisterWorkerRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterWorkerRequest create() => RegisterWorkerRequest._();
  @$core.override
  RegisterWorkerRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterWorkerRequest> createRepeated() =>
      $pb.PbList<RegisterWorkerRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterWorkerRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterWorkerRequest>(create);
  static RegisterWorkerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  JobType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(JobType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  /// string worker_id = 2;
  @$pb.TagNumber(3)
  $core.String get version => $_getSZ(1);
  @$pb.TagNumber(3)
  set version($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(3)
  void clearVersion() => $_clearField(3);

  /// string name = 4 [deprecated = true];
  @$pb.TagNumber(5)
  $core.int get pingInterval => $_getIZ(2);
  @$pb.TagNumber(5)
  set pingInterval($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(5)
  $core.bool hasPingInterval() => $_has(2);
  @$pb.TagNumber(5)
  void clearPingInterval() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get namespace => $_getSZ(3);
  @$pb.TagNumber(6)
  set namespace($core.String value) => $_setString(3, value);
  @$pb.TagNumber(6)
  $core.bool hasNamespace() => $_has(3);
  @$pb.TagNumber(6)
  void clearNamespace() => $_clearField(6);

  @$pb.TagNumber(7)
  $0.ParticipantPermission get allowedPermissions => $_getN(4);
  @$pb.TagNumber(7)
  set allowedPermissions($0.ParticipantPermission value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasAllowedPermissions() => $_has(4);
  @$pb.TagNumber(7)
  void clearAllowedPermissions() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.ParticipantPermission ensureAllowedPermissions() => $_ensure(4);

  @$pb.TagNumber(8)
  $core.String get agentName => $_getSZ(5);
  @$pb.TagNumber(8)
  set agentName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(8)
  $core.bool hasAgentName() => $_has(5);
  @$pb.TagNumber(8)
  void clearAgentName() => $_clearField(8);
}

class RegisterWorkerResponse extends $pb.GeneratedMessage {
  factory RegisterWorkerResponse({
    $core.String? workerId,
    $0.ServerInfo? serverInfo,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (serverInfo != null) result.serverInfo = serverInfo;
    return result;
  }

  RegisterWorkerResponse._();

  factory RegisterWorkerResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterWorkerResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterWorkerResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOM<$0.ServerInfo>(3, _omitFieldNames ? '' : 'serverInfo',
        subBuilder: $0.ServerInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterWorkerResponse clone() =>
      RegisterWorkerResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterWorkerResponse copyWith(
          void Function(RegisterWorkerResponse) updates) =>
      super.copyWith((message) => updates(message as RegisterWorkerResponse))
          as RegisterWorkerResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterWorkerResponse create() => RegisterWorkerResponse._();
  @$core.override
  RegisterWorkerResponse createEmptyInstance() => create();
  static $pb.PbList<RegisterWorkerResponse> createRepeated() =>
      $pb.PbList<RegisterWorkerResponse>();
  @$core.pragma('dart2js:noInline')
  static RegisterWorkerResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterWorkerResponse>(create);
  static RegisterWorkerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(3)
  $0.ServerInfo get serverInfo => $_getN(1);
  @$pb.TagNumber(3)
  set serverInfo($0.ServerInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasServerInfo() => $_has(1);
  @$pb.TagNumber(3)
  void clearServerInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.ServerInfo ensureServerInfo() => $_ensure(1);
}

class MigrateJobRequest extends $pb.GeneratedMessage {
  factory MigrateJobRequest({
    $core.Iterable<$core.String>? jobIds,
  }) {
    final result = create();
    if (jobIds != null) result.jobIds.addAll(jobIds);
    return result;
  }

  MigrateJobRequest._();

  factory MigrateJobRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MigrateJobRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MigrateJobRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPS(2, _omitFieldNames ? '' : 'jobIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MigrateJobRequest clone() => MigrateJobRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MigrateJobRequest copyWith(void Function(MigrateJobRequest) updates) =>
      super.copyWith((message) => updates(message as MigrateJobRequest))
          as MigrateJobRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MigrateJobRequest create() => MigrateJobRequest._();
  @$core.override
  MigrateJobRequest createEmptyInstance() => create();
  static $pb.PbList<MigrateJobRequest> createRepeated() =>
      $pb.PbList<MigrateJobRequest>();
  @$core.pragma('dart2js:noInline')
  static MigrateJobRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MigrateJobRequest>(create);
  static MigrateJobRequest? _defaultInstance;

  /// string job_id = 1 [deprecated = true];
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get jobIds => $_getList(0);
}

class AvailabilityRequest extends $pb.GeneratedMessage {
  factory AvailabilityRequest({
    Job? job,
    $core.bool? resuming,
  }) {
    final result = create();
    if (job != null) result.job = job;
    if (resuming != null) result.resuming = resuming;
    return result;
  }

  AvailabilityRequest._();

  factory AvailabilityRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AvailabilityRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AvailabilityRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOM<Job>(1, _omitFieldNames ? '' : 'job', subBuilder: Job.create)
    ..aOB(2, _omitFieldNames ? '' : 'resuming')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AvailabilityRequest clone() => AvailabilityRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AvailabilityRequest copyWith(void Function(AvailabilityRequest) updates) =>
      super.copyWith((message) => updates(message as AvailabilityRequest))
          as AvailabilityRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AvailabilityRequest create() => AvailabilityRequest._();
  @$core.override
  AvailabilityRequest createEmptyInstance() => create();
  static $pb.PbList<AvailabilityRequest> createRepeated() =>
      $pb.PbList<AvailabilityRequest>();
  @$core.pragma('dart2js:noInline')
  static AvailabilityRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvailabilityRequest>(create);
  static AvailabilityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Job get job => $_getN(0);
  @$pb.TagNumber(1)
  set job(Job value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasJob() => $_has(0);
  @$pb.TagNumber(1)
  void clearJob() => $_clearField(1);
  @$pb.TagNumber(1)
  Job ensureJob() => $_ensure(0);

  /// True when the job was previously assigned to another worker but has been
  /// migrated due to different reasons (e.g. worker failure, job migration)
  @$pb.TagNumber(2)
  $core.bool get resuming => $_getBF(1);
  @$pb.TagNumber(2)
  set resuming($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasResuming() => $_has(1);
  @$pb.TagNumber(2)
  void clearResuming() => $_clearField(2);
}

class AvailabilityResponse extends $pb.GeneratedMessage {
  factory AvailabilityResponse({
    $core.String? jobId,
    $core.bool? available,
    $core.bool? supportsResume,
    $core.String? participantName,
    $core.String? participantIdentity,
    $core.String? participantMetadata,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        participantAttributes,
    $core.bool? terminate,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (available != null) result.available = available;
    if (supportsResume != null) result.supportsResume = supportsResume;
    if (participantName != null) result.participantName = participantName;
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (participantMetadata != null)
      result.participantMetadata = participantMetadata;
    if (participantAttributes != null)
      result.participantAttributes.addEntries(participantAttributes);
    if (terminate != null) result.terminate = terminate;
    return result;
  }

  AvailabilityResponse._();

  factory AvailabilityResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AvailabilityResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AvailabilityResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aOB(2, _omitFieldNames ? '' : 'available')
    ..aOB(3, _omitFieldNames ? '' : 'supportsResume')
    ..aOS(4, _omitFieldNames ? '' : 'participantName')
    ..aOS(5, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(6, _omitFieldNames ? '' : 'participantMetadata')
    ..m<$core.String, $core.String>(
        7, _omitFieldNames ? '' : 'participantAttributes',
        entryClassName: 'AvailabilityResponse.ParticipantAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOB(8, _omitFieldNames ? '' : 'terminate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AvailabilityResponse clone() =>
      AvailabilityResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AvailabilityResponse copyWith(void Function(AvailabilityResponse) updates) =>
      super.copyWith((message) => updates(message as AvailabilityResponse))
          as AvailabilityResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AvailabilityResponse create() => AvailabilityResponse._();
  @$core.override
  AvailabilityResponse createEmptyInstance() => create();
  static $pb.PbList<AvailabilityResponse> createRepeated() =>
      $pb.PbList<AvailabilityResponse>();
  @$core.pragma('dart2js:noInline')
  static AvailabilityResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvailabilityResponse>(create);
  static AvailabilityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get available => $_getBF(1);
  @$pb.TagNumber(2)
  set available($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAvailable() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvailable() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get supportsResume => $_getBF(2);
  @$pb.TagNumber(3)
  set supportsResume($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSupportsResume() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupportsResume() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get participantName => $_getSZ(3);
  @$pb.TagNumber(4)
  set participantName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasParticipantName() => $_has(3);
  @$pb.TagNumber(4)
  void clearParticipantName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get participantIdentity => $_getSZ(4);
  @$pb.TagNumber(5)
  set participantIdentity($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasParticipantIdentity() => $_has(4);
  @$pb.TagNumber(5)
  void clearParticipantIdentity() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get participantMetadata => $_getSZ(5);
  @$pb.TagNumber(6)
  set participantMetadata($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasParticipantMetadata() => $_has(5);
  @$pb.TagNumber(6)
  void clearParticipantMetadata() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbMap<$core.String, $core.String> get participantAttributes =>
      $_getMap(6);

  @$pb.TagNumber(8)
  $core.bool get terminate => $_getBF(7);
  @$pb.TagNumber(8)
  set terminate($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTerminate() => $_has(7);
  @$pb.TagNumber(8)
  void clearTerminate() => $_clearField(8);
}

class UpdateJobStatus extends $pb.GeneratedMessage {
  factory UpdateJobStatus({
    $core.String? jobId,
    JobStatus? status,
    $core.String? error,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (status != null) result.status = status;
    if (error != null) result.error = error;
    return result;
  }

  UpdateJobStatus._();

  factory UpdateJobStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateJobStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateJobStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..e<JobStatus>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: JobStatus.JS_PENDING,
        valueOf: JobStatus.valueOf,
        enumValues: JobStatus.values)
    ..aOS(3, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateJobStatus clone() => UpdateJobStatus()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateJobStatus copyWith(void Function(UpdateJobStatus) updates) =>
      super.copyWith((message) => updates(message as UpdateJobStatus))
          as UpdateJobStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateJobStatus create() => UpdateJobStatus._();
  @$core.override
  UpdateJobStatus createEmptyInstance() => create();
  static $pb.PbList<UpdateJobStatus> createRepeated() =>
      $pb.PbList<UpdateJobStatus>();
  @$core.pragma('dart2js:noInline')
  static UpdateJobStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateJobStatus>(create);
  static UpdateJobStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);

  /// The worker can indicate the job end by either specifying SUCCESS or FAILED
  @$pb.TagNumber(2)
  JobStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(JobStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  /// metadata shown on the dashboard, useful for debugging
  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(2);
  @$pb.TagNumber(3)
  set error($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);
}

class UpdateWorkerStatus extends $pb.GeneratedMessage {
  factory UpdateWorkerStatus({
    WorkerStatus? status,
    $core.double? load,
    $core.int? jobCount,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (load != null) result.load = load;
    if (jobCount != null) result.jobCount = jobCount;
    return result;
  }

  UpdateWorkerStatus._();

  factory UpdateWorkerStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateWorkerStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateWorkerStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..e<WorkerStatus>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: WorkerStatus.WS_AVAILABLE,
        valueOf: WorkerStatus.valueOf,
        enumValues: WorkerStatus.values)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'load', $pb.PbFieldType.OF)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'jobCount', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateWorkerStatus clone() => UpdateWorkerStatus()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateWorkerStatus copyWith(void Function(UpdateWorkerStatus) updates) =>
      super.copyWith((message) => updates(message as UpdateWorkerStatus))
          as UpdateWorkerStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateWorkerStatus create() => UpdateWorkerStatus._();
  @$core.override
  UpdateWorkerStatus createEmptyInstance() => create();
  static $pb.PbList<UpdateWorkerStatus> createRepeated() =>
      $pb.PbList<UpdateWorkerStatus>();
  @$core.pragma('dart2js:noInline')
  static UpdateWorkerStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateWorkerStatus>(create);
  static UpdateWorkerStatus? _defaultInstance;

  @$pb.TagNumber(1)
  WorkerStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(WorkerStatus value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  /// optional string metadata = 2 [deprecated=true];
  @$pb.TagNumber(3)
  $core.double get load => $_getN(1);
  @$pb.TagNumber(3)
  set load($core.double value) => $_setFloat(1, value);
  @$pb.TagNumber(3)
  $core.bool hasLoad() => $_has(1);
  @$pb.TagNumber(3)
  void clearLoad() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get jobCount => $_getIZ(2);
  @$pb.TagNumber(4)
  set jobCount($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(4)
  $core.bool hasJobCount() => $_has(2);
  @$pb.TagNumber(4)
  void clearJobCount() => $_clearField(4);
}

class JobAssignment extends $pb.GeneratedMessage {
  factory JobAssignment({
    Job? job,
    $core.String? url,
    $core.String? token,
  }) {
    final result = create();
    if (job != null) result.job = job;
    if (url != null) result.url = url;
    if (token != null) result.token = token;
    return result;
  }

  JobAssignment._();

  factory JobAssignment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JobAssignment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JobAssignment',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOM<Job>(1, _omitFieldNames ? '' : 'job', subBuilder: Job.create)
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JobAssignment clone() => JobAssignment()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JobAssignment copyWith(void Function(JobAssignment) updates) =>
      super.copyWith((message) => updates(message as JobAssignment))
          as JobAssignment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JobAssignment create() => JobAssignment._();
  @$core.override
  JobAssignment createEmptyInstance() => create();
  static $pb.PbList<JobAssignment> createRepeated() =>
      $pb.PbList<JobAssignment>();
  @$core.pragma('dart2js:noInline')
  static JobAssignment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JobAssignment>(create);
  static JobAssignment? _defaultInstance;

  @$pb.TagNumber(1)
  Job get job => $_getN(0);
  @$pb.TagNumber(1)
  set job(Job value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasJob() => $_has(0);
  @$pb.TagNumber(1)
  void clearJob() => $_clearField(1);
  @$pb.TagNumber(1)
  Job ensureJob() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => $_clearField(3);
}

class JobTermination extends $pb.GeneratedMessage {
  factory JobTermination({
    $core.String? jobId,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    return result;
  }

  JobTermination._();

  factory JobTermination.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JobTermination.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JobTermination',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JobTermination clone() => JobTermination()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JobTermination copyWith(void Function(JobTermination) updates) =>
      super.copyWith((message) => updates(message as JobTermination))
          as JobTermination;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JobTermination create() => JobTermination._();
  @$core.override
  JobTermination createEmptyInstance() => create();
  static $pb.PbList<JobTermination> createRepeated() =>
      $pb.PbList<JobTermination>();
  @$core.pragma('dart2js:noInline')
  static JobTermination getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JobTermination>(create);
  static JobTermination? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
