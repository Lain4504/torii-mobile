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

import 'package:protobuf/protobuf.dart' as $pb;

class JobType extends $pb.ProtobufEnum {
  static const JobType JT_ROOM = JobType._(0, _omitEnumNames ? '' : 'JT_ROOM');
  static const JobType JT_PUBLISHER = JobType._(1, _omitEnumNames ? '' : 'JT_PUBLISHER');
  static const JobType JT_PARTICIPANT = JobType._(2, _omitEnumNames ? '' : 'JT_PARTICIPANT');

  static const $core.List<JobType> values = <JobType> [
    JT_ROOM,
    JT_PUBLISHER,
    JT_PARTICIPANT,
  ];

  static final $core.Map<$core.int, JobType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static JobType? valueOf($core.int value) => _byValue[value];

  const JobType._($core.int v, $core.String n) : super(v, n);
}

class WorkerStatus extends $pb.ProtobufEnum {
  static const WorkerStatus WS_AVAILABLE = WorkerStatus._(0, _omitEnumNames ? '' : 'WS_AVAILABLE');
  static const WorkerStatus WS_FULL = WorkerStatus._(1, _omitEnumNames ? '' : 'WS_FULL');

  static const $core.List<WorkerStatus> values = <WorkerStatus> [
    WS_AVAILABLE,
    WS_FULL,
  ];

  static final $core.Map<$core.int, WorkerStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WorkerStatus? valueOf($core.int value) => _byValue[value];

  const WorkerStatus._($core.int v, $core.String n) : super(v, n);
}

class JobStatus extends $pb.ProtobufEnum {
  static const JobStatus JS_PENDING = JobStatus._(0, _omitEnumNames ? '' : 'JS_PENDING');
  static const JobStatus JS_RUNNING = JobStatus._(1, _omitEnumNames ? '' : 'JS_RUNNING');
  static const JobStatus JS_SUCCESS = JobStatus._(2, _omitEnumNames ? '' : 'JS_SUCCESS');
  static const JobStatus JS_FAILED = JobStatus._(3, _omitEnumNames ? '' : 'JS_FAILED');

  static const $core.List<JobStatus> values = <JobStatus> [
    JS_PENDING,
    JS_RUNNING,
    JS_SUCCESS,
    JS_FAILED,
  ];

  static final $core.Map<$core.int, JobStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static JobStatus? valueOf($core.int value) => _byValue[value];

  const JobStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
