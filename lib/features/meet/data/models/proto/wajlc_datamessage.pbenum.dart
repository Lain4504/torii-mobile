// This is a generated file - do not edit.
//
// Generated from wajlc_datamessage.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class DataMsgBodyType extends $pb.ProtobufEnum {
  /// SYSTEM type
  static const DataMsgBodyType UNKNOWN =
      DataMsgBodyType._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const DataMsgBodyType FILE_UPLOAD =
      DataMsgBodyType._(1, _omitEnumNames ? '' : 'FILE_UPLOAD');
  static const DataMsgBodyType INFO =
      DataMsgBodyType._(2, _omitEnumNames ? '' : 'INFO');
  static const DataMsgBodyType ALERT =
      DataMsgBodyType._(3, _omitEnumNames ? '' : 'ALERT');
  static const DataMsgBodyType USER_VISIBILITY_CHANGE =
      DataMsgBodyType._(4, _omitEnumNames ? '' : 'USER_VISIBILITY_CHANGE');
  static const DataMsgBodyType EXTERNAL_MEDIA_PLAYER_EVENTS = DataMsgBodyType._(
      5, _omitEnumNames ? '' : 'EXTERNAL_MEDIA_PLAYER_EVENTS');
  static const DataMsgBodyType NEW_POLL_RESPONSE =
      DataMsgBodyType._(6, _omitEnumNames ? '' : 'NEW_POLL_RESPONSE');
  static const DataMsgBodyType PUSH_JOIN_BREAKOUT_ROOM =
      DataMsgBodyType._(19, _omitEnumNames ? '' : 'PUSH_JOIN_BREAKOUT_ROOM');
  static const DataMsgBodyType SPEECH_SUBTITLE_TEXT =
      DataMsgBodyType._(7, _omitEnumNames ? '' : 'SPEECH_SUBTITLE_TEXT');

  /// WHITEBOARD type
  static const DataMsgBodyType REQ_FULL_WHITEBOARD_DATA =
      DataMsgBodyType._(8, _omitEnumNames ? '' : 'REQ_FULL_WHITEBOARD_DATA');
  static const DataMsgBodyType RES_FULL_WHITEBOARD_DATA =
      DataMsgBodyType._(9, _omitEnumNames ? '' : 'RES_FULL_WHITEBOARD_DATA');
  static const DataMsgBodyType SCENE_UPDATE =
      DataMsgBodyType._(10, _omitEnumNames ? '' : 'SCENE_UPDATE');
  static const DataMsgBodyType POINTER_UPDATE =
      DataMsgBodyType._(11, _omitEnumNames ? '' : 'POINTER_UPDATE');
  static const DataMsgBodyType WHITEBOARD_APP_STATE_CHANGE = DataMsgBodyType._(
      12, _omitEnumNames ? '' : 'WHITEBOARD_APP_STATE_CHANGE');
  static const DataMsgBodyType PAGE_CHANGE =
      DataMsgBodyType._(15, _omitEnumNames ? '' : 'PAGE_CHANGE');
  static const DataMsgBodyType FILE_CHANGE =
      DataMsgBodyType._(17, _omitEnumNames ? '' : 'FILE_CHANGE');
  static const DataMsgBodyType UPDATE_CURRENT_OFFICE_FILE_PAGES =
      DataMsgBodyType._(
          18, _omitEnumNames ? '' : 'UPDATE_CURRENT_OFFICE_FILE_PAGES');
  static const DataMsgBodyType WHITEBOARD_RESET =
      DataMsgBodyType._(20, _omitEnumNames ? '' : 'WHITEBOARD_RESET');
  @$core.Deprecated('This enum value is deprecated')
  static const DataMsgBodyType ADD_WHITEBOARD_FILE =
      DataMsgBodyType._(13, _omitEnumNames ? '' : 'ADD_WHITEBOARD_FILE');
  @$core.Deprecated('This enum value is deprecated')
  static const DataMsgBodyType ADD_WHITEBOARD_OFFICE_FILE =
      DataMsgBodyType._(14, _omitEnumNames ? '' : 'ADD_WHITEBOARD_OFFICE_FILE');
  static const DataMsgBodyType USER_CONNECTION_QUALITY_CHANGE =
      DataMsgBodyType._(
          16, _omitEnumNames ? '' : 'USER_CONNECTION_QUALITY_CHANGE');

  static const $core.List<DataMsgBodyType> values = <DataMsgBodyType>[
    UNKNOWN,
    FILE_UPLOAD,
    INFO,
    ALERT,
    USER_VISIBILITY_CHANGE,
    EXTERNAL_MEDIA_PLAYER_EVENTS,
    NEW_POLL_RESPONSE,
    PUSH_JOIN_BREAKOUT_ROOM,
    SPEECH_SUBTITLE_TEXT,
    REQ_FULL_WHITEBOARD_DATA,
    RES_FULL_WHITEBOARD_DATA,
    SCENE_UPDATE,
    POINTER_UPDATE,
    WHITEBOARD_APP_STATE_CHANGE,
    PAGE_CHANGE,
    FILE_CHANGE,
    UPDATE_CURRENT_OFFICE_FILE_PAGES,
    WHITEBOARD_RESET,
    ADD_WHITEBOARD_FILE,
    ADD_WHITEBOARD_OFFICE_FILE,
    USER_CONNECTION_QUALITY_CHANGE,
  ];

  static final $core.List<DataMsgBodyType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 20);
  static DataMsgBodyType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DataMsgBodyType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
