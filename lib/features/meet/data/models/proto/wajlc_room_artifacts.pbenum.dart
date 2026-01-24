//
//  Generated code. Do not modify.
//  source: wajlc_room_artifacts.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomArtifactType extends $pb.ProtobufEnum {
  static const RoomArtifactType UNKNOWN_ARTIFACT = RoomArtifactType._(0, _omitEnumNames ? '' : 'UNKNOWN_ARTIFACT');
  static const RoomArtifactType MEETING_ANALYTICS = RoomArtifactType._(1, _omitEnumNames ? '' : 'MEETING_ANALYTICS');
  static const RoomArtifactType MEETING_SUMMARY = RoomArtifactType._(2, _omitEnumNames ? '' : 'MEETING_SUMMARY');
  static const RoomArtifactType MEETING_SUMMARY_USAGE = RoomArtifactType._(3, _omitEnumNames ? '' : 'MEETING_SUMMARY_USAGE');
  static const RoomArtifactType SPEECH_TRANSCRIPTION = RoomArtifactType._(4, _omitEnumNames ? '' : 'SPEECH_TRANSCRIPTION');
  static const RoomArtifactType SPEECH_TRANSCRIPTION_USAGE = RoomArtifactType._(5, _omitEnumNames ? '' : 'SPEECH_TRANSCRIPTION_USAGE');
  static const RoomArtifactType SYNTHESIZED_SPEECH_USAGE = RoomArtifactType._(6, _omitEnumNames ? '' : 'SYNTHESIZED_SPEECH_USAGE');
  static const RoomArtifactType CHAT_TRANSLATION_USAGE = RoomArtifactType._(7, _omitEnumNames ? '' : 'CHAT_TRANSLATION_USAGE');
  static const RoomArtifactType AI_TEXT_CHAT_INTERACTION_USAGE = RoomArtifactType._(8, _omitEnumNames ? '' : 'AI_TEXT_CHAT_INTERACTION_USAGE');
  static const RoomArtifactType AI_TEXT_CHAT_SUMMARIZATION_USAGE = RoomArtifactType._(9, _omitEnumNames ? '' : 'AI_TEXT_CHAT_SUMMARIZATION_USAGE');

  static const $core.List<RoomArtifactType> values = <RoomArtifactType> [
    UNKNOWN_ARTIFACT,
    MEETING_ANALYTICS,
    MEETING_SUMMARY,
    MEETING_SUMMARY_USAGE,
    SPEECH_TRANSCRIPTION,
    SPEECH_TRANSCRIPTION_USAGE,
    SYNTHESIZED_SPEECH_USAGE,
    CHAT_TRANSLATION_USAGE,
    AI_TEXT_CHAT_INTERACTION_USAGE,
    AI_TEXT_CHAT_SUMMARIZATION_USAGE,
  ];

  static final $core.Map<$core.int, RoomArtifactType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RoomArtifactType? valueOf($core.int value) => _byValue[value];

  const RoomArtifactType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
