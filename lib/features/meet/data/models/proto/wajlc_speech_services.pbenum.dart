//
//  Generated code. Do not modify.
//  source: wajlc_speech_services.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SpeechServiceUserStatusTasks extends $pb.ProtobufEnum {
  static const SpeechServiceUserStatusTasks SPEECH_TO_TEXT_SESSION_STARTED = SpeechServiceUserStatusTasks._(0, _omitEnumNames ? '' : 'SPEECH_TO_TEXT_SESSION_STARTED');
  static const SpeechServiceUserStatusTasks SPEECH_TO_TEXT_SESSION_ENDED = SpeechServiceUserStatusTasks._(1, _omitEnumNames ? '' : 'SPEECH_TO_TEXT_SESSION_ENDED');
  static const SpeechServiceUserStatusTasks SPEECH_TO_TEXT_TOTAL_USAGE = SpeechServiceUserStatusTasks._(2, _omitEnumNames ? '' : 'SPEECH_TO_TEXT_TOTAL_USAGE');

  static const $core.List<SpeechServiceUserStatusTasks> values = <SpeechServiceUserStatusTasks> [
    SPEECH_TO_TEXT_SESSION_STARTED,
    SPEECH_TO_TEXT_SESSION_ENDED,
    SPEECH_TO_TEXT_TOTAL_USAGE,
  ];

  static final $core.Map<$core.int, SpeechServiceUserStatusTasks> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SpeechServiceUserStatusTasks? valueOf($core.int value) => _byValue[value];

  const SpeechServiceUserStatusTasks._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
