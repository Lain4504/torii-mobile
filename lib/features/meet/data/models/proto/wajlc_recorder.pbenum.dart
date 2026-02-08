// This is a generated file - do not edit.
//
// Generated from wajlc_recorder.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RecordingTasks extends $pb.ProtobufEnum {
  static const RecordingTasks START_RECORDING =
      RecordingTasks._(0, _omitEnumNames ? '' : 'START_RECORDING');
  static const RecordingTasks STOP_RECORDING =
      RecordingTasks._(1, _omitEnumNames ? '' : 'STOP_RECORDING');
  static const RecordingTasks START_RTMP =
      RecordingTasks._(2, _omitEnumNames ? '' : 'START_RTMP');
  static const RecordingTasks STOP_RTMP =
      RecordingTasks._(3, _omitEnumNames ? '' : 'STOP_RTMP');
  static const RecordingTasks END_RECORDING =
      RecordingTasks._(4, _omitEnumNames ? '' : 'END_RECORDING');
  static const RecordingTasks END_RTMP =
      RecordingTasks._(5, _omitEnumNames ? '' : 'END_RTMP');
  static const RecordingTasks RECORDING_PROCEEDED =
      RecordingTasks._(6, _omitEnumNames ? '' : 'RECORDING_PROCEEDED');
  static const RecordingTasks STOP =
      RecordingTasks._(7, _omitEnumNames ? '' : 'STOP');

  static const $core.List<RecordingTasks> values = <RecordingTasks>[
    START_RECORDING,
    STOP_RECORDING,
    START_RTMP,
    STOP_RTMP,
    END_RECORDING,
    END_RTMP,
    RECORDING_PROCEEDED,
    STOP,
  ];

  static final $core.List<RecordingTasks?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static RecordingTasks? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RecordingTasks._(super.value, super.name);
}

class RecorderInfoKeys extends $pb.ProtobufEnum {
  static const RecorderInfoKeys RECORDER_INFO_MAX_LIMIT =
      RecorderInfoKeys._(0, _omitEnumNames ? '' : 'RECORDER_INFO_MAX_LIMIT');
  static const RecorderInfoKeys RECORDER_INFO_LAST_PING =
      RecorderInfoKeys._(1, _omitEnumNames ? '' : 'RECORDER_INFO_LAST_PING');
  static const RecorderInfoKeys RECORDER_INFO_CURRENT_PROGRESS =
      RecorderInfoKeys._(
          3, _omitEnumNames ? '' : 'RECORDER_INFO_CURRENT_PROGRESS');

  static const $core.List<RecorderInfoKeys> values = <RecorderInfoKeys>[
    RECORDER_INFO_MAX_LIMIT,
    RECORDER_INFO_LAST_PING,
    RECORDER_INFO_CURRENT_PROGRESS,
  ];

  static final $core.List<RecorderInfoKeys?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static RecorderInfoKeys? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RecorderInfoKeys._(super.value, super.name);
}

class CloudRecordingVariants extends $pb.ProtobufEnum {
  static const CloudRecordingVariants FULL_SCREEN_CLOUD_RECORDING =
      CloudRecordingVariants._(
          0, _omitEnumNames ? '' : 'FULL_SCREEN_CLOUD_RECORDING');
  static const CloudRecordingVariants MEDIA_ONLY_CLOUD_RECORDING =
      CloudRecordingVariants._(
          1, _omitEnumNames ? '' : 'MEDIA_ONLY_CLOUD_RECORDING');

  static const $core.List<CloudRecordingVariants> values =
      <CloudRecordingVariants>[
    FULL_SCREEN_CLOUD_RECORDING,
    MEDIA_ONLY_CLOUD_RECORDING,
  ];

  static final $core.List<CloudRecordingVariants?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static CloudRecordingVariants? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CloudRecordingVariants._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
