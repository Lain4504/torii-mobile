//
//  Generated code. Do not modify.
//  source: livekit_agent.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_agent.pbenum.dart';
import 'livekit_models.pb.dart' as $2;

export 'livekit_agent.pbenum.dart';

class Job extends $pb.GeneratedMessage {
  factory Job({
    $core.String? id,
    JobType? type,
    $2.Room? room,
    $2.ParticipantInfo? participant,
  @$core.Deprecated('This field is deprecated.')
    $core.String? namespace,
    $core.String? metadata,
    $core.String? agentName,
    JobState? state,
    $core.String? dispatchId,
    $core.bool? enableRecording,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (type != null) {
      $result.type = type;
    }
    if (room != null) {
      $result.room = room;
    }
    if (participant != null) {
      $result.participant = participant;
    }
    if (namespace != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.namespace = namespace;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (agentName != null) {
      $result.agentName = agentName;
    }
    if (state != null) {
      $result.state = state;
    }
    if (dispatchId != null) {
      $result.dispatchId = dispatchId;
    }
    if (enableRecording != null) {
      $result.enableRecording = enableRecording;
    }
    return $result;
  }
  Job._() : super();
  factory Job.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Job.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Job', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..e<JobType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: JobType.JT_ROOM, valueOf: JobType.valueOf, enumValues: JobType.values)
    ..aOM<$2.Room>(3, _omitFieldNames ? '' : 'room', subBuilder: $2.Room.create)
    ..aOM<$2.ParticipantInfo>(4, _omitFieldNames ? '' : 'participant', subBuilder: $2.ParticipantInfo.create)
    ..aOS(5, _omitFieldNames ? '' : 'namespace')
    ..aOS(6, _omitFieldNames ? '' : 'metadata')
    ..aOS(7, _omitFieldNames ? '' : 'agentName')
    ..aOM<JobState>(8, _omitFieldNames ? '' : 'state', subBuilder: JobState.create)
    ..aOS(9, _omitFieldNames ? '' : 'dispatchId')
    ..aOB(10, _omitFieldNames ? '' : 'enableRecording')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Job clone() => Job()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Job copyWith(void Function(Job) updates) => super.copyWith((message) => updates(message as Job)) as Job;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Job create() => Job._();
  Job createEmptyInstance() => create();
  static $pb.PbList<Job> createRepeated() => $pb.PbList<Job>();
  @$core.pragma('dart2js:noInline')
  static Job getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Job>(create);
  static Job? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  JobType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(JobType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $2.Room get room => $_getN(2);
  @$pb.TagNumber(3)
  set room($2.Room v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoom() => clearField(3);
  @$pb.TagNumber(3)
  $2.Room ensureRoom() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.ParticipantInfo get participant => $_getN(3);
  @$pb.TagNumber(4)
  set participant($2.ParticipantInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasParticipant() => $_has(3);
  @$pb.TagNumber(4)
  void clearParticipant() => clearField(4);
  @$pb.TagNumber(4)
  $2.ParticipantInfo ensureParticipant() => $_ensure(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.String get namespace => $_getSZ(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set namespace($core.String v) { $_setString(4, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasNamespace() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearNamespace() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get metadata => $_getSZ(5);
  @$pb.TagNumber(6)
  set metadata($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMetadata() => $_has(5);
  @$pb.TagNumber(6)
  void clearMetadata() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get agentName => $_getSZ(6);
  @$pb.TagNumber(7)
  set agentName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAgentName() => $_has(6);
  @$pb.TagNumber(7)
  void clearAgentName() => clearField(7);

  @$pb.TagNumber(8)
  JobState get state => $_getN(7);
  @$pb.TagNumber(8)
  set state(JobState v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasState() => $_has(7);
  @$pb.TagNumber(8)
  void clearState() => clearField(8);
  @$pb.TagNumber(8)
  JobState ensureState() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get dispatchId => $_getSZ(8);
  @$pb.TagNumber(9)
  set dispatchId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDispatchId() => $_has(8);
  @$pb.TagNumber(9)
  void clearDispatchId() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get enableRecording => $_getBF(9);
  @$pb.TagNumber(10)
  set enableRecording($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasEnableRecording() => $_has(9);
  @$pb.TagNumber(10)
  void clearEnableRecording() => clearField(10);
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
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (error != null) {
      $result.error = error;
    }
    if (startedAt != null) {
      $result.startedAt = startedAt;
    }
    if (endedAt != null) {
      $result.endedAt = endedAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (participantIdentity != null) {
      $result.participantIdentity = participantIdentity;
    }
    if (workerId != null) {
      $result.workerId = workerId;
    }
    if (agentId != null) {
      $result.agentId = agentId;
    }
    return $result;
  }
  JobState._() : super();
  factory JobState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JobState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JobState', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..e<JobStatus>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: JobStatus.JS_PENDING, valueOf: JobStatus.valueOf, enumValues: JobStatus.values)
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..aInt64(3, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(4, _omitFieldNames ? '' : 'endedAt')
    ..aInt64(5, _omitFieldNames ? '' : 'updatedAt')
    ..aOS(6, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(7, _omitFieldNames ? '' : 'workerId')
    ..aOS(8, _omitFieldNames ? '' : 'agentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JobState clone() => JobState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JobState copyWith(void Function(JobState) updates) => super.copyWith((message) => updates(message as JobState)) as JobState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JobState create() => JobState._();
  JobState createEmptyInstance() => create();
  static $pb.PbList<JobState> createRepeated() => $pb.PbList<JobState>();
  @$core.pragma('dart2js:noInline')
  static JobState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JobState>(create);
  static JobState? _defaultInstance;

  @$pb.TagNumber(1)
  JobStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(JobStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get startedAt => $_getI64(2);
  @$pb.TagNumber(3)
  set startedAt($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStartedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartedAt() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get endedAt => $_getI64(3);
  @$pb.TagNumber(4)
  set endedAt($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEndedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndedAt() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get updatedAt => $_getI64(4);
  @$pb.TagNumber(5)
  set updatedAt($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdatedAt() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get participantIdentity => $_getSZ(5);
  @$pb.TagNumber(6)
  set participantIdentity($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasParticipantIdentity() => $_has(5);
  @$pb.TagNumber(6)
  void clearParticipantIdentity() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get workerId => $_getSZ(6);
  @$pb.TagNumber(7)
  set workerId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasWorkerId() => $_has(6);
  @$pb.TagNumber(7)
  void clearWorkerId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get agentId => $_getSZ(7);
  @$pb.TagNumber(8)
  set agentId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAgentId() => $_has(7);
  @$pb.TagNumber(8)
  void clearAgentId() => clearField(8);
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
    final $result = create();
    if (register != null) {
      $result.register = register;
    }
    if (availability != null) {
      $result.availability = availability;
    }
    if (updateWorker != null) {
      $result.updateWorker = updateWorker;
    }
    if (updateJob != null) {
      $result.updateJob = updateJob;
    }
    if (ping != null) {
      $result.ping = ping;
    }
    if (simulateJob != null) {
      $result.simulateJob = simulateJob;
    }
    if (migrateJob != null) {
      $result.migrateJob = migrateJob;
    }
    return $result;
  }
  WorkerMessage._() : super();
  factory WorkerMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WorkerMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, WorkerMessage_Message> _WorkerMessage_MessageByTag = {
    1 : WorkerMessage_Message.register,
    2 : WorkerMessage_Message.availability,
    3 : WorkerMessage_Message.updateWorker,
    4 : WorkerMessage_Message.updateJob,
    5 : WorkerMessage_Message.ping,
    6 : WorkerMessage_Message.simulateJob,
    7 : WorkerMessage_Message.migrateJob,
    0 : WorkerMessage_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WorkerMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7])
    ..aOM<RegisterWorkerRequest>(1, _omitFieldNames ? '' : 'register', subBuilder: RegisterWorkerRequest.create)
    ..aOM<AvailabilityResponse>(2, _omitFieldNames ? '' : 'availability', subBuilder: AvailabilityResponse.create)
    ..aOM<UpdateWorkerStatus>(3, _omitFieldNames ? '' : 'updateWorker', subBuilder: UpdateWorkerStatus.create)
    ..aOM<UpdateJobStatus>(4, _omitFieldNames ? '' : 'updateJob', subBuilder: UpdateJobStatus.create)
    ..aOM<WorkerPing>(5, _omitFieldNames ? '' : 'ping', subBuilder: WorkerPing.create)
    ..aOM<SimulateJobRequest>(6, _omitFieldNames ? '' : 'simulateJob', subBuilder: SimulateJobRequest.create)
    ..aOM<MigrateJobRequest>(7, _omitFieldNames ? '' : 'migrateJob', subBuilder: MigrateJobRequest.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WorkerMessage clone() => WorkerMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WorkerMessage copyWith(void Function(WorkerMessage) updates) => super.copyWith((message) => updates(message as WorkerMessage)) as WorkerMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorkerMessage create() => WorkerMessage._();
  WorkerMessage createEmptyInstance() => create();
  static $pb.PbList<WorkerMessage> createRepeated() => $pb.PbList<WorkerMessage>();
  @$core.pragma('dart2js:noInline')
  static WorkerMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WorkerMessage>(create);
  static WorkerMessage? _defaultInstance;

  WorkerMessage_Message whichMessage() => _WorkerMessage_MessageByTag[$_whichOneof(0)]!;
  void clearMessage() => clearField($_whichOneof(0));

  /// agent workers need to register themselves with the server first
  @$pb.TagNumber(1)
  RegisterWorkerRequest get register => $_getN(0);
  @$pb.TagNumber(1)
  set register(RegisterWorkerRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRegister() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegister() => clearField(1);
  @$pb.TagNumber(1)
  RegisterWorkerRequest ensureRegister() => $_ensure(0);

  /// worker confirms to server that it's available for a job, or declines it
  @$pb.TagNumber(2)
  AvailabilityResponse get availability => $_getN(1);
  @$pb.TagNumber(2)
  set availability(AvailabilityResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAvailability() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvailability() => clearField(2);
  @$pb.TagNumber(2)
  AvailabilityResponse ensureAvailability() => $_ensure(1);

  /// worker can update its status to the server, including taking itself out of the pool
  @$pb.TagNumber(3)
  UpdateWorkerStatus get updateWorker => $_getN(2);
  @$pb.TagNumber(3)
  set updateWorker(UpdateWorkerStatus v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdateWorker() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateWorker() => clearField(3);
  @$pb.TagNumber(3)
  UpdateWorkerStatus ensureUpdateWorker() => $_ensure(2);

  /// job can send status updates to the server, useful for tracking progress
  @$pb.TagNumber(4)
  UpdateJobStatus get updateJob => $_getN(3);
  @$pb.TagNumber(4)
  set updateJob(UpdateJobStatus v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUpdateJob() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdateJob() => clearField(4);
  @$pb.TagNumber(4)
  UpdateJobStatus ensureUpdateJob() => $_ensure(3);

  @$pb.TagNumber(5)
  WorkerPing get ping => $_getN(4);
  @$pb.TagNumber(5)
  set ping(WorkerPing v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPing() => $_has(4);
  @$pb.TagNumber(5)
  void clearPing() => clearField(5);
  @$pb.TagNumber(5)
  WorkerPing ensurePing() => $_ensure(4);

  @$pb.TagNumber(6)
  SimulateJobRequest get simulateJob => $_getN(5);
  @$pb.TagNumber(6)
  set simulateJob(SimulateJobRequest v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasSimulateJob() => $_has(5);
  @$pb.TagNumber(6)
  void clearSimulateJob() => clearField(6);
  @$pb.TagNumber(6)
  SimulateJobRequest ensureSimulateJob() => $_ensure(5);

  @$pb.TagNumber(7)
  MigrateJobRequest get migrateJob => $_getN(6);
  @$pb.TagNumber(7)
  set migrateJob(MigrateJobRequest v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasMigrateJob() => $_has(6);
  @$pb.TagNumber(7)
  void clearMigrateJob() => clearField(7);
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
    final $result = create();
    if (register != null) {
      $result.register = register;
    }
    if (availability != null) {
      $result.availability = availability;
    }
    if (assignment != null) {
      $result.assignment = assignment;
    }
    if (pong != null) {
      $result.pong = pong;
    }
    if (termination != null) {
      $result.termination = termination;
    }
    return $result;
  }
  ServerMessage._() : super();
  factory ServerMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ServerMessage_Message> _ServerMessage_MessageByTag = {
    1 : ServerMessage_Message.register,
    2 : ServerMessage_Message.availability,
    3 : ServerMessage_Message.assignment,
    4 : ServerMessage_Message.pong,
    5 : ServerMessage_Message.termination,
    0 : ServerMessage_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServerMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<RegisterWorkerResponse>(1, _omitFieldNames ? '' : 'register', subBuilder: RegisterWorkerResponse.create)
    ..aOM<AvailabilityRequest>(2, _omitFieldNames ? '' : 'availability', subBuilder: AvailabilityRequest.create)
    ..aOM<JobAssignment>(3, _omitFieldNames ? '' : 'assignment', subBuilder: JobAssignment.create)
    ..aOM<WorkerPong>(4, _omitFieldNames ? '' : 'pong', subBuilder: WorkerPong.create)
    ..aOM<JobTermination>(5, _omitFieldNames ? '' : 'termination', subBuilder: JobTermination.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerMessage clone() => ServerMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerMessage copyWith(void Function(ServerMessage) updates) => super.copyWith((message) => updates(message as ServerMessage)) as ServerMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerMessage create() => ServerMessage._();
  ServerMessage createEmptyInstance() => create();
  static $pb.PbList<ServerMessage> createRepeated() => $pb.PbList<ServerMessage>();
  @$core.pragma('dart2js:noInline')
  static ServerMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerMessage>(create);
  static ServerMessage? _defaultInstance;

  ServerMessage_Message whichMessage() => _ServerMessage_MessageByTag[$_whichOneof(0)]!;
  void clearMessage() => clearField($_whichOneof(0));

  /// server confirms the registration, from this moment on, the worker is considered active
  @$pb.TagNumber(1)
  RegisterWorkerResponse get register => $_getN(0);
  @$pb.TagNumber(1)
  set register(RegisterWorkerResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRegister() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegister() => clearField(1);
  @$pb.TagNumber(1)
  RegisterWorkerResponse ensureRegister() => $_ensure(0);

  /// server asks worker to confirm availability for a job
  @$pb.TagNumber(2)
  AvailabilityRequest get availability => $_getN(1);
  @$pb.TagNumber(2)
  set availability(AvailabilityRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAvailability() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvailability() => clearField(2);
  @$pb.TagNumber(2)
  AvailabilityRequest ensureAvailability() => $_ensure(1);

  @$pb.TagNumber(3)
  JobAssignment get assignment => $_getN(2);
  @$pb.TagNumber(3)
  set assignment(JobAssignment v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAssignment() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssignment() => clearField(3);
  @$pb.TagNumber(3)
  JobAssignment ensureAssignment() => $_ensure(2);

  @$pb.TagNumber(4)
  WorkerPong get pong => $_getN(3);
  @$pb.TagNumber(4)
  set pong(WorkerPong v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPong() => $_has(3);
  @$pb.TagNumber(4)
  void clearPong() => clearField(4);
  @$pb.TagNumber(4)
  WorkerPong ensurePong() => $_ensure(3);

  @$pb.TagNumber(5)
  JobTermination get termination => $_getN(4);
  @$pb.TagNumber(5)
  set termination(JobTermination v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTermination() => $_has(4);
  @$pb.TagNumber(5)
  void clearTermination() => clearField(5);
  @$pb.TagNumber(5)
  JobTermination ensureTermination() => $_ensure(4);
}

class SimulateJobRequest extends $pb.GeneratedMessage {
  factory SimulateJobRequest({
    JobType? type,
    $2.Room? room,
    $2.ParticipantInfo? participant,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (room != null) {
      $result.room = room;
    }
    if (participant != null) {
      $result.participant = participant;
    }
    return $result;
  }
  SimulateJobRequest._() : super();
  factory SimulateJobRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SimulateJobRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SimulateJobRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..e<JobType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: JobType.JT_ROOM, valueOf: JobType.valueOf, enumValues: JobType.values)
    ..aOM<$2.Room>(2, _omitFieldNames ? '' : 'room', subBuilder: $2.Room.create)
    ..aOM<$2.ParticipantInfo>(3, _omitFieldNames ? '' : 'participant', subBuilder: $2.ParticipantInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SimulateJobRequest clone() => SimulateJobRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SimulateJobRequest copyWith(void Function(SimulateJobRequest) updates) => super.copyWith((message) => updates(message as SimulateJobRequest)) as SimulateJobRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SimulateJobRequest create() => SimulateJobRequest._();
  SimulateJobRequest createEmptyInstance() => create();
  static $pb.PbList<SimulateJobRequest> createRepeated() => $pb.PbList<SimulateJobRequest>();
  @$core.pragma('dart2js:noInline')
  static SimulateJobRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SimulateJobRequest>(create);
  static SimulateJobRequest? _defaultInstance;

  @$pb.TagNumber(1)
  JobType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(JobType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $2.Room get room => $_getN(1);
  @$pb.TagNumber(2)
  set room($2.Room v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => clearField(2);
  @$pb.TagNumber(2)
  $2.Room ensureRoom() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.ParticipantInfo get participant => $_getN(2);
  @$pb.TagNumber(3)
  set participant($2.ParticipantInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasParticipant() => $_has(2);
  @$pb.TagNumber(3)
  void clearParticipant() => clearField(3);
  @$pb.TagNumber(3)
  $2.ParticipantInfo ensureParticipant() => $_ensure(2);
}

class WorkerPing extends $pb.GeneratedMessage {
  factory WorkerPing({
    $fixnum.Int64? timestamp,
  }) {
    final $result = create();
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  WorkerPing._() : super();
  factory WorkerPing.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WorkerPing.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WorkerPing', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WorkerPing clone() => WorkerPing()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WorkerPing copyWith(void Function(WorkerPing) updates) => super.copyWith((message) => updates(message as WorkerPing)) as WorkerPing;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorkerPing create() => WorkerPing._();
  WorkerPing createEmptyInstance() => create();
  static $pb.PbList<WorkerPing> createRepeated() => $pb.PbList<WorkerPing>();
  @$core.pragma('dart2js:noInline')
  static WorkerPing getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WorkerPing>(create);
  static WorkerPing? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => clearField(1);
}

class WorkerPong extends $pb.GeneratedMessage {
  factory WorkerPong({
    $fixnum.Int64? lastTimestamp,
    $fixnum.Int64? timestamp,
  }) {
    final $result = create();
    if (lastTimestamp != null) {
      $result.lastTimestamp = lastTimestamp;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  WorkerPong._() : super();
  factory WorkerPong.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WorkerPong.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WorkerPong', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'lastTimestamp')
    ..aInt64(2, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WorkerPong clone() => WorkerPong()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WorkerPong copyWith(void Function(WorkerPong) updates) => super.copyWith((message) => updates(message as WorkerPong)) as WorkerPong;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorkerPong create() => WorkerPong._();
  WorkerPong createEmptyInstance() => create();
  static $pb.PbList<WorkerPong> createRepeated() => $pb.PbList<WorkerPong>();
  @$core.pragma('dart2js:noInline')
  static WorkerPong getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WorkerPong>(create);
  static WorkerPong? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get lastTimestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set lastTimestamp($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastTimestamp() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set timestamp($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => clearField(2);
}

class RegisterWorkerRequest extends $pb.GeneratedMessage {
  factory RegisterWorkerRequest({
    JobType? type,
    $core.String? version,
    $core.int? pingInterval,
    $core.String? namespace,
    $2.ParticipantPermission? allowedPermissions,
    $core.String? agentName,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (version != null) {
      $result.version = version;
    }
    if (pingInterval != null) {
      $result.pingInterval = pingInterval;
    }
    if (namespace != null) {
      $result.namespace = namespace;
    }
    if (allowedPermissions != null) {
      $result.allowedPermissions = allowedPermissions;
    }
    if (agentName != null) {
      $result.agentName = agentName;
    }
    return $result;
  }
  RegisterWorkerRequest._() : super();
  factory RegisterWorkerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterWorkerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegisterWorkerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..e<JobType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: JobType.JT_ROOM, valueOf: JobType.valueOf, enumValues: JobType.values)
    ..aOS(3, _omitFieldNames ? '' : 'version')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'pingInterval', $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'namespace')
    ..aOM<$2.ParticipantPermission>(7, _omitFieldNames ? '' : 'allowedPermissions', subBuilder: $2.ParticipantPermission.create)
    ..aOS(8, _omitFieldNames ? '' : 'agentName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterWorkerRequest clone() => RegisterWorkerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterWorkerRequest copyWith(void Function(RegisterWorkerRequest) updates) => super.copyWith((message) => updates(message as RegisterWorkerRequest)) as RegisterWorkerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterWorkerRequest create() => RegisterWorkerRequest._();
  RegisterWorkerRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterWorkerRequest> createRepeated() => $pb.PbList<RegisterWorkerRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterWorkerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterWorkerRequest>(create);
  static RegisterWorkerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  JobType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(JobType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  /// string worker_id = 2;
  @$pb.TagNumber(3)
  $core.String get version => $_getSZ(1);
  @$pb.TagNumber(3)
  set version($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);

  /// string name = 4 [deprecated = true];
  @$pb.TagNumber(5)
  $core.int get pingInterval => $_getIZ(2);
  @$pb.TagNumber(5)
  set pingInterval($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(5)
  $core.bool hasPingInterval() => $_has(2);
  @$pb.TagNumber(5)
  void clearPingInterval() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get namespace => $_getSZ(3);
  @$pb.TagNumber(6)
  set namespace($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(6)
  $core.bool hasNamespace() => $_has(3);
  @$pb.TagNumber(6)
  void clearNamespace() => clearField(6);

  @$pb.TagNumber(7)
  $2.ParticipantPermission get allowedPermissions => $_getN(4);
  @$pb.TagNumber(7)
  set allowedPermissions($2.ParticipantPermission v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAllowedPermissions() => $_has(4);
  @$pb.TagNumber(7)
  void clearAllowedPermissions() => clearField(7);
  @$pb.TagNumber(7)
  $2.ParticipantPermission ensureAllowedPermissions() => $_ensure(4);

  @$pb.TagNumber(8)
  $core.String get agentName => $_getSZ(5);
  @$pb.TagNumber(8)
  set agentName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(8)
  $core.bool hasAgentName() => $_has(5);
  @$pb.TagNumber(8)
  void clearAgentName() => clearField(8);
}

class RegisterWorkerResponse extends $pb.GeneratedMessage {
  factory RegisterWorkerResponse({
    $core.String? workerId,
    $2.ServerInfo? serverInfo,
  }) {
    final $result = create();
    if (workerId != null) {
      $result.workerId = workerId;
    }
    if (serverInfo != null) {
      $result.serverInfo = serverInfo;
    }
    return $result;
  }
  RegisterWorkerResponse._() : super();
  factory RegisterWorkerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterWorkerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegisterWorkerResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOM<$2.ServerInfo>(3, _omitFieldNames ? '' : 'serverInfo', subBuilder: $2.ServerInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterWorkerResponse clone() => RegisterWorkerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterWorkerResponse copyWith(void Function(RegisterWorkerResponse) updates) => super.copyWith((message) => updates(message as RegisterWorkerResponse)) as RegisterWorkerResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterWorkerResponse create() => RegisterWorkerResponse._();
  RegisterWorkerResponse createEmptyInstance() => create();
  static $pb.PbList<RegisterWorkerResponse> createRepeated() => $pb.PbList<RegisterWorkerResponse>();
  @$core.pragma('dart2js:noInline')
  static RegisterWorkerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterWorkerResponse>(create);
  static RegisterWorkerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => clearField(1);

  @$pb.TagNumber(3)
  $2.ServerInfo get serverInfo => $_getN(1);
  @$pb.TagNumber(3)
  set serverInfo($2.ServerInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasServerInfo() => $_has(1);
  @$pb.TagNumber(3)
  void clearServerInfo() => clearField(3);
  @$pb.TagNumber(3)
  $2.ServerInfo ensureServerInfo() => $_ensure(1);
}

class MigrateJobRequest extends $pb.GeneratedMessage {
  factory MigrateJobRequest({
    $core.Iterable<$core.String>? jobIds,
  }) {
    final $result = create();
    if (jobIds != null) {
      $result.jobIds.addAll(jobIds);
    }
    return $result;
  }
  MigrateJobRequest._() : super();
  factory MigrateJobRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MigrateJobRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MigrateJobRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pPS(2, _omitFieldNames ? '' : 'jobIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MigrateJobRequest clone() => MigrateJobRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MigrateJobRequest copyWith(void Function(MigrateJobRequest) updates) => super.copyWith((message) => updates(message as MigrateJobRequest)) as MigrateJobRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MigrateJobRequest create() => MigrateJobRequest._();
  MigrateJobRequest createEmptyInstance() => create();
  static $pb.PbList<MigrateJobRequest> createRepeated() => $pb.PbList<MigrateJobRequest>();
  @$core.pragma('dart2js:noInline')
  static MigrateJobRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MigrateJobRequest>(create);
  static MigrateJobRequest? _defaultInstance;

  /// string job_id = 1 [deprecated = true];
  @$pb.TagNumber(2)
  $core.List<$core.String> get jobIds => $_getList(0);
}

class AvailabilityRequest extends $pb.GeneratedMessage {
  factory AvailabilityRequest({
    Job? job,
    $core.bool? resuming,
  }) {
    final $result = create();
    if (job != null) {
      $result.job = job;
    }
    if (resuming != null) {
      $result.resuming = resuming;
    }
    return $result;
  }
  AvailabilityRequest._() : super();
  factory AvailabilityRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AvailabilityRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AvailabilityRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<Job>(1, _omitFieldNames ? '' : 'job', subBuilder: Job.create)
    ..aOB(2, _omitFieldNames ? '' : 'resuming')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AvailabilityRequest clone() => AvailabilityRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AvailabilityRequest copyWith(void Function(AvailabilityRequest) updates) => super.copyWith((message) => updates(message as AvailabilityRequest)) as AvailabilityRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AvailabilityRequest create() => AvailabilityRequest._();
  AvailabilityRequest createEmptyInstance() => create();
  static $pb.PbList<AvailabilityRequest> createRepeated() => $pb.PbList<AvailabilityRequest>();
  @$core.pragma('dart2js:noInline')
  static AvailabilityRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AvailabilityRequest>(create);
  static AvailabilityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Job get job => $_getN(0);
  @$pb.TagNumber(1)
  set job(Job v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasJob() => $_has(0);
  @$pb.TagNumber(1)
  void clearJob() => clearField(1);
  @$pb.TagNumber(1)
  Job ensureJob() => $_ensure(0);

  /// True when the job was previously assigned to another worker but has been
  /// migrated due to different reasons (e.g. worker failure, job migration)
  @$pb.TagNumber(2)
  $core.bool get resuming => $_getBF(1);
  @$pb.TagNumber(2)
  set resuming($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResuming() => $_has(1);
  @$pb.TagNumber(2)
  void clearResuming() => clearField(2);
}

class AvailabilityResponse extends $pb.GeneratedMessage {
  factory AvailabilityResponse({
    $core.String? jobId,
    $core.bool? available,
    $core.bool? supportsResume,
    $core.String? participantName,
    $core.String? participantIdentity,
    $core.String? participantMetadata,
    $core.Map<$core.String, $core.String>? participantAttributes,
    $core.bool? terminate,
  }) {
    final $result = create();
    if (jobId != null) {
      $result.jobId = jobId;
    }
    if (available != null) {
      $result.available = available;
    }
    if (supportsResume != null) {
      $result.supportsResume = supportsResume;
    }
    if (participantName != null) {
      $result.participantName = participantName;
    }
    if (participantIdentity != null) {
      $result.participantIdentity = participantIdentity;
    }
    if (participantMetadata != null) {
      $result.participantMetadata = participantMetadata;
    }
    if (participantAttributes != null) {
      $result.participantAttributes.addAll(participantAttributes);
    }
    if (terminate != null) {
      $result.terminate = terminate;
    }
    return $result;
  }
  AvailabilityResponse._() : super();
  factory AvailabilityResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AvailabilityResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AvailabilityResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aOB(2, _omitFieldNames ? '' : 'available')
    ..aOB(3, _omitFieldNames ? '' : 'supportsResume')
    ..aOS(4, _omitFieldNames ? '' : 'participantName')
    ..aOS(5, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(6, _omitFieldNames ? '' : 'participantMetadata')
    ..m<$core.String, $core.String>(7, _omitFieldNames ? '' : 'participantAttributes', entryClassName: 'AvailabilityResponse.ParticipantAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..aOB(8, _omitFieldNames ? '' : 'terminate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AvailabilityResponse clone() => AvailabilityResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AvailabilityResponse copyWith(void Function(AvailabilityResponse) updates) => super.copyWith((message) => updates(message as AvailabilityResponse)) as AvailabilityResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AvailabilityResponse create() => AvailabilityResponse._();
  AvailabilityResponse createEmptyInstance() => create();
  static $pb.PbList<AvailabilityResponse> createRepeated() => $pb.PbList<AvailabilityResponse>();
  @$core.pragma('dart2js:noInline')
  static AvailabilityResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AvailabilityResponse>(create);
  static AvailabilityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get available => $_getBF(1);
  @$pb.TagNumber(2)
  set available($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAvailable() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvailable() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get supportsResume => $_getBF(2);
  @$pb.TagNumber(3)
  set supportsResume($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSupportsResume() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupportsResume() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get participantName => $_getSZ(3);
  @$pb.TagNumber(4)
  set participantName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasParticipantName() => $_has(3);
  @$pb.TagNumber(4)
  void clearParticipantName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get participantIdentity => $_getSZ(4);
  @$pb.TagNumber(5)
  set participantIdentity($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasParticipantIdentity() => $_has(4);
  @$pb.TagNumber(5)
  void clearParticipantIdentity() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get participantMetadata => $_getSZ(5);
  @$pb.TagNumber(6)
  set participantMetadata($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasParticipantMetadata() => $_has(5);
  @$pb.TagNumber(6)
  void clearParticipantMetadata() => clearField(6);

  @$pb.TagNumber(7)
  $core.Map<$core.String, $core.String> get participantAttributes => $_getMap(6);

  @$pb.TagNumber(8)
  $core.bool get terminate => $_getBF(7);
  @$pb.TagNumber(8)
  set terminate($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTerminate() => $_has(7);
  @$pb.TagNumber(8)
  void clearTerminate() => clearField(8);
}

class UpdateJobStatus extends $pb.GeneratedMessage {
  factory UpdateJobStatus({
    $core.String? jobId,
    JobStatus? status,
    $core.String? error,
  }) {
    final $result = create();
    if (jobId != null) {
      $result.jobId = jobId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  UpdateJobStatus._() : super();
  factory UpdateJobStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateJobStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateJobStatus', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..e<JobStatus>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: JobStatus.JS_PENDING, valueOf: JobStatus.valueOf, enumValues: JobStatus.values)
    ..aOS(3, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateJobStatus clone() => UpdateJobStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateJobStatus copyWith(void Function(UpdateJobStatus) updates) => super.copyWith((message) => updates(message as UpdateJobStatus)) as UpdateJobStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateJobStatus create() => UpdateJobStatus._();
  UpdateJobStatus createEmptyInstance() => create();
  static $pb.PbList<UpdateJobStatus> createRepeated() => $pb.PbList<UpdateJobStatus>();
  @$core.pragma('dart2js:noInline')
  static UpdateJobStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateJobStatus>(create);
  static UpdateJobStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => clearField(1);

  /// The worker can indicate the job end by either specifying SUCCESS or FAILED
  @$pb.TagNumber(2)
  JobStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(JobStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  /// metadata shown on the dashboard, useful for debugging
  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(2);
  @$pb.TagNumber(3)
  set error($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

class UpdateWorkerStatus extends $pb.GeneratedMessage {
  factory UpdateWorkerStatus({
    WorkerStatus? status,
    $core.double? load,
    $core.int? jobCount,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (load != null) {
      $result.load = load;
    }
    if (jobCount != null) {
      $result.jobCount = jobCount;
    }
    return $result;
  }
  UpdateWorkerStatus._() : super();
  factory UpdateWorkerStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateWorkerStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateWorkerStatus', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..e<WorkerStatus>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: WorkerStatus.WS_AVAILABLE, valueOf: WorkerStatus.valueOf, enumValues: WorkerStatus.values)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'load', $pb.PbFieldType.OF)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'jobCount', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateWorkerStatus clone() => UpdateWorkerStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateWorkerStatus copyWith(void Function(UpdateWorkerStatus) updates) => super.copyWith((message) => updates(message as UpdateWorkerStatus)) as UpdateWorkerStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateWorkerStatus create() => UpdateWorkerStatus._();
  UpdateWorkerStatus createEmptyInstance() => create();
  static $pb.PbList<UpdateWorkerStatus> createRepeated() => $pb.PbList<UpdateWorkerStatus>();
  @$core.pragma('dart2js:noInline')
  static UpdateWorkerStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateWorkerStatus>(create);
  static UpdateWorkerStatus? _defaultInstance;

  @$pb.TagNumber(1)
  WorkerStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(WorkerStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  /// optional string metadata = 2 [deprecated=true];
  @$pb.TagNumber(3)
  $core.double get load => $_getN(1);
  @$pb.TagNumber(3)
  set load($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasLoad() => $_has(1);
  @$pb.TagNumber(3)
  void clearLoad() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get jobCount => $_getIZ(2);
  @$pb.TagNumber(4)
  set jobCount($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasJobCount() => $_has(2);
  @$pb.TagNumber(4)
  void clearJobCount() => clearField(4);
}

class JobAssignment extends $pb.GeneratedMessage {
  factory JobAssignment({
    Job? job,
    $core.String? url,
    $core.String? token,
  }) {
    final $result = create();
    if (job != null) {
      $result.job = job;
    }
    if (url != null) {
      $result.url = url;
    }
    if (token != null) {
      $result.token = token;
    }
    return $result;
  }
  JobAssignment._() : super();
  factory JobAssignment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JobAssignment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JobAssignment', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<Job>(1, _omitFieldNames ? '' : 'job', subBuilder: Job.create)
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JobAssignment clone() => JobAssignment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JobAssignment copyWith(void Function(JobAssignment) updates) => super.copyWith((message) => updates(message as JobAssignment)) as JobAssignment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JobAssignment create() => JobAssignment._();
  JobAssignment createEmptyInstance() => create();
  static $pb.PbList<JobAssignment> createRepeated() => $pb.PbList<JobAssignment>();
  @$core.pragma('dart2js:noInline')
  static JobAssignment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JobAssignment>(create);
  static JobAssignment? _defaultInstance;

  @$pb.TagNumber(1)
  Job get job => $_getN(0);
  @$pb.TagNumber(1)
  set job(Job v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasJob() => $_has(0);
  @$pb.TagNumber(1)
  void clearJob() => clearField(1);
  @$pb.TagNumber(1)
  Job ensureJob() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => clearField(3);
}

class JobTermination extends $pb.GeneratedMessage {
  factory JobTermination({
    $core.String? jobId,
  }) {
    final $result = create();
    if (jobId != null) {
      $result.jobId = jobId;
    }
    return $result;
  }
  JobTermination._() : super();
  factory JobTermination.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JobTermination.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JobTermination', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JobTermination clone() => JobTermination()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JobTermination copyWith(void Function(JobTermination) updates) => super.copyWith((message) => updates(message as JobTermination)) as JobTermination;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JobTermination create() => JobTermination._();
  JobTermination createEmptyInstance() => create();
  static $pb.PbList<JobTermination> createRepeated() => $pb.PbList<JobTermination>();
  @$core.pragma('dart2js:noInline')
  static JobTermination getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JobTermination>(create);
  static JobTermination? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
