// This is a generated file - do not edit.
//
// Generated from wajlc_speech_services.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SpeechServiceUserStatusTasks extends $pb.ProtobufEnum {
  static const SpeechServiceUserStatusTasks SPEECH_TO_TEXT_SESSION_STARTED =
      SpeechServiceUserStatusTasks._(
          0, _omitEnumNames ? '' : 'SPEECH_TO_TEXT_SESSION_STARTED');
  static const SpeechServiceUserStatusTasks SPEECH_TO_TEXT_SESSION_ENDED =
      SpeechServiceUserStatusTasks._(
          1, _omitEnumNames ? '' : 'SPEECH_TO_TEXT_SESSION_ENDED');
  static const SpeechServiceUserStatusTasks SPEECH_TO_TEXT_TOTAL_USAGE =
      SpeechServiceUserStatusTasks._(
          2, _omitEnumNames ? '' : 'SPEECH_TO_TEXT_TOTAL_USAGE');

  static const $core.List<SpeechServiceUserStatusTasks> values =
      <SpeechServiceUserStatusTasks>[
    SPEECH_TO_TEXT_SESSION_STARTED,
    SPEECH_TO_TEXT_SESSION_ENDED,
    SPEECH_TO_TEXT_TOTAL_USAGE,
  ];

  static final $core.List<SpeechServiceUserStatusTasks?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SpeechServiceUserStatusTasks? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SpeechServiceUserStatusTasks._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
