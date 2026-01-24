//
//  Generated code. Do not modify.
//  source: wajlc_common_api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SwitchPresenterTask extends $pb.ProtobufEnum {
  static const SwitchPresenterTask PROMOTE = SwitchPresenterTask._(0, _omitEnumNames ? '' : 'PROMOTE');
  static const SwitchPresenterTask DEMOTE = SwitchPresenterTask._(1, _omitEnumNames ? '' : 'DEMOTE');

  static const $core.List<SwitchPresenterTask> values = <SwitchPresenterTask> [
    PROMOTE,
    DEMOTE,
  ];

  static final $core.Map<$core.int, SwitchPresenterTask> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SwitchPresenterTask? valueOf($core.int value) => _byValue[value];

  const SwitchPresenterTask._($core.int v, $core.String n) : super(v, n);
}

class ExternalMediaPlayerTask extends $pb.ProtobufEnum {
  static const ExternalMediaPlayerTask START_PLAYBACK = ExternalMediaPlayerTask._(0, _omitEnumNames ? '' : 'START_PLAYBACK');
  static const ExternalMediaPlayerTask END_PLAYBACK = ExternalMediaPlayerTask._(1, _omitEnumNames ? '' : 'END_PLAYBACK');

  static const $core.List<ExternalMediaPlayerTask> values = <ExternalMediaPlayerTask> [
    START_PLAYBACK,
    END_PLAYBACK,
  ];

  static final $core.Map<$core.int, ExternalMediaPlayerTask> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ExternalMediaPlayerTask? valueOf($core.int value) => _byValue[value];

  const ExternalMediaPlayerTask._($core.int v, $core.String n) : super(v, n);
}

class ExternalDisplayLinkTask extends $pb.ProtobufEnum {
  static const ExternalDisplayLinkTask START_EXTERNAL_LINK = ExternalDisplayLinkTask._(0, _omitEnumNames ? '' : 'START_EXTERNAL_LINK');
  static const ExternalDisplayLinkTask STOP_EXTERNAL_LINK = ExternalDisplayLinkTask._(1, _omitEnumNames ? '' : 'STOP_EXTERNAL_LINK');

  static const $core.List<ExternalDisplayLinkTask> values = <ExternalDisplayLinkTask> [
    START_EXTERNAL_LINK,
    STOP_EXTERNAL_LINK,
  ];

  static final $core.Map<$core.int, ExternalDisplayLinkTask> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ExternalDisplayLinkTask? valueOf($core.int value) => _byValue[value];

  const ExternalDisplayLinkTask._($core.int v, $core.String n) : super(v, n);
}

class RoomUploadedFileType extends $pb.ProtobufEnum {
  static const RoomUploadedFileType CHAT_FILE = RoomUploadedFileType._(0, _omitEnumNames ? '' : 'CHAT_FILE');
  static const RoomUploadedFileType WHITEBOARD_IMAGE_FILE = RoomUploadedFileType._(1, _omitEnumNames ? '' : 'WHITEBOARD_IMAGE_FILE');
  static const RoomUploadedFileType WHITEBOARD_CONVERTED_FILE = RoomUploadedFileType._(2, _omitEnumNames ? '' : 'WHITEBOARD_CONVERTED_FILE');
  static const RoomUploadedFileType EXTERNAL_MEDIA_PLAYER_FILE = RoomUploadedFileType._(3, _omitEnumNames ? '' : 'EXTERNAL_MEDIA_PLAYER_FILE');
  static const RoomUploadedFileType VIRTUAL_BACKGROUND = RoomUploadedFileType._(4, _omitEnumNames ? '' : 'VIRTUAL_BACKGROUND');

  static const $core.List<RoomUploadedFileType> values = <RoomUploadedFileType> [
    CHAT_FILE,
    WHITEBOARD_IMAGE_FILE,
    WHITEBOARD_CONVERTED_FILE,
    EXTERNAL_MEDIA_PLAYER_FILE,
    VIRTUAL_BACKGROUND,
  ];

  static final $core.Map<$core.int, RoomUploadedFileType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RoomUploadedFileType? valueOf($core.int value) => _byValue[value];

  const RoomUploadedFileType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
