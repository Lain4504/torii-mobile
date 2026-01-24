// This is a generated file - do not edit.
//
// Generated from livekit_agent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class JobType extends $pb.ProtobufEnum {
  static const JobType JT_ROOM = JobType._(0, _omitEnumNames ? '' : 'JT_ROOM');
  static const JobType JT_PUBLISHER =
      JobType._(1, _omitEnumNames ? '' : 'JT_PUBLISHER');
  static const JobType JT_PARTICIPANT =
      JobType._(2, _omitEnumNames ? '' : 'JT_PARTICIPANT');

  static const $core.List<JobType> values = <JobType>[
    JT_ROOM,
    JT_PUBLISHER,
    JT_PARTICIPANT,
  ];

  static final $core.List<JobType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static JobType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const JobType._(super.value, super.name);
}

class WorkerStatus extends $pb.ProtobufEnum {
  static const WorkerStatus WS_AVAILABLE =
      WorkerStatus._(0, _omitEnumNames ? '' : 'WS_AVAILABLE');
  static const WorkerStatus WS_FULL =
      WorkerStatus._(1, _omitEnumNames ? '' : 'WS_FULL');

  static const $core.List<WorkerStatus> values = <WorkerStatus>[
    WS_AVAILABLE,
    WS_FULL,
  ];

  static final $core.List<WorkerStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static WorkerStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const WorkerStatus._(super.value, super.name);
}

class JobStatus extends $pb.ProtobufEnum {
  static const JobStatus JS_PENDING =
      JobStatus._(0, _omitEnumNames ? '' : 'JS_PENDING');
  static const JobStatus JS_RUNNING =
      JobStatus._(1, _omitEnumNames ? '' : 'JS_RUNNING');
  static const JobStatus JS_SUCCESS =
      JobStatus._(2, _omitEnumNames ? '' : 'JS_SUCCESS');
  static const JobStatus JS_FAILED =
      JobStatus._(3, _omitEnumNames ? '' : 'JS_FAILED');

  static const $core.List<JobStatus> values = <JobStatus>[
    JS_PENDING,
    JS_RUNNING,
    JS_SUCCESS,
    JS_FAILED,
  ];

  static final $core.List<JobStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static JobStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const JobStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
