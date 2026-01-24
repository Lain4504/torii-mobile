// This is a generated file - do not edit.
//
// Generated from wajlc_common_api.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SwitchPresenterTask extends $pb.ProtobufEnum {
  static const SwitchPresenterTask PROMOTE =
      SwitchPresenterTask._(0, _omitEnumNames ? '' : 'PROMOTE');
  static const SwitchPresenterTask DEMOTE =
      SwitchPresenterTask._(1, _omitEnumNames ? '' : 'DEMOTE');

  static const $core.List<SwitchPresenterTask> values = <SwitchPresenterTask>[
    PROMOTE,
    DEMOTE,
  ];

  static final $core.List<SwitchPresenterTask?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static SwitchPresenterTask? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SwitchPresenterTask._(super.value, super.name);
}

class ExternalMediaPlayerTask extends $pb.ProtobufEnum {
  static const ExternalMediaPlayerTask START_PLAYBACK =
      ExternalMediaPlayerTask._(0, _omitEnumNames ? '' : 'START_PLAYBACK');
  static const ExternalMediaPlayerTask END_PLAYBACK =
      ExternalMediaPlayerTask._(1, _omitEnumNames ? '' : 'END_PLAYBACK');

  static const $core.List<ExternalMediaPlayerTask> values =
      <ExternalMediaPlayerTask>[
    START_PLAYBACK,
    END_PLAYBACK,
  ];

  static final $core.List<ExternalMediaPlayerTask?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ExternalMediaPlayerTask? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ExternalMediaPlayerTask._(super.value, super.name);
}

class ExternalDisplayLinkTask extends $pb.ProtobufEnum {
  static const ExternalDisplayLinkTask START_EXTERNAL_LINK =
      ExternalDisplayLinkTask._(0, _omitEnumNames ? '' : 'START_EXTERNAL_LINK');
  static const ExternalDisplayLinkTask STOP_EXTERNAL_LINK =
      ExternalDisplayLinkTask._(1, _omitEnumNames ? '' : 'STOP_EXTERNAL_LINK');

  static const $core.List<ExternalDisplayLinkTask> values =
      <ExternalDisplayLinkTask>[
    START_EXTERNAL_LINK,
    STOP_EXTERNAL_LINK,
  ];

  static final $core.List<ExternalDisplayLinkTask?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ExternalDisplayLinkTask? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ExternalDisplayLinkTask._(super.value, super.name);
}

class RoomUploadedFileType extends $pb.ProtobufEnum {
  static const RoomUploadedFileType CHAT_FILE =
      RoomUploadedFileType._(0, _omitEnumNames ? '' : 'CHAT_FILE');
  static const RoomUploadedFileType WHITEBOARD_IMAGE_FILE =
      RoomUploadedFileType._(1, _omitEnumNames ? '' : 'WHITEBOARD_IMAGE_FILE');
  static const RoomUploadedFileType WHITEBOARD_CONVERTED_FILE =
      RoomUploadedFileType._(
          2, _omitEnumNames ? '' : 'WHITEBOARD_CONVERTED_FILE');
  static const RoomUploadedFileType EXTERNAL_MEDIA_PLAYER_FILE =
      RoomUploadedFileType._(
          3, _omitEnumNames ? '' : 'EXTERNAL_MEDIA_PLAYER_FILE');
  static const RoomUploadedFileType VIRTUAL_BACKGROUND =
      RoomUploadedFileType._(4, _omitEnumNames ? '' : 'VIRTUAL_BACKGROUND');

  static const $core.List<RoomUploadedFileType> values = <RoomUploadedFileType>[
    CHAT_FILE,
    WHITEBOARD_IMAGE_FILE,
    WHITEBOARD_CONVERTED_FILE,
    EXTERNAL_MEDIA_PLAYER_FILE,
    VIRTUAL_BACKGROUND,
  ];

  static final $core.List<RoomUploadedFileType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static RoomUploadedFileType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RoomUploadedFileType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
