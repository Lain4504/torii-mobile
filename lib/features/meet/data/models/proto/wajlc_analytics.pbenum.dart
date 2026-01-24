// This is a generated file - do not edit.
//
// Generated from wajlc_analytics.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AnalyticsEventType extends $pb.ProtobufEnum {
  static const AnalyticsEventType ANALYTICS_EVENT_TYPE_ROOM =
      AnalyticsEventType._(
          0, _omitEnumNames ? '' : 'ANALYTICS_EVENT_TYPE_ROOM');
  static const AnalyticsEventType ANALYTICS_EVENT_TYPE_USER =
      AnalyticsEventType._(
          1, _omitEnumNames ? '' : 'ANALYTICS_EVENT_TYPE_USER');

  static const $core.List<AnalyticsEventType> values = <AnalyticsEventType>[
    ANALYTICS_EVENT_TYPE_ROOM,
    ANALYTICS_EVENT_TYPE_USER,
  ];

  static final $core.List<AnalyticsEventType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static AnalyticsEventType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AnalyticsEventType._(super.value, super.name);
}

class AnalyticsEvents extends $pb.ProtobufEnum {
  static const AnalyticsEvents ANALYTICS_EVENT_UNKNOWN =
      AnalyticsEvents._(0, _omitEnumNames ? '' : 'ANALYTICS_EVENT_UNKNOWN');

  /// room related
  static const AnalyticsEvents ANALYTICS_EVENT_ROOM_POLL_ADDED =
      AnalyticsEvents._(
          1, _omitEnumNames ? '' : 'ANALYTICS_EVENT_ROOM_POLL_ADDED');
  static const AnalyticsEvents ANALYTICS_EVENT_ROOM_POLL_ENDED =
      AnalyticsEvents._(
          2, _omitEnumNames ? '' : 'ANALYTICS_EVENT_ROOM_POLL_ENDED');

  /// user join will be room related
  /// after take record it will pass to user
  static const AnalyticsEvents ANALYTICS_EVENT_USER_JOINED =
      AnalyticsEvents._(3, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_JOINED');

  /// room recorder
  static const AnalyticsEvents ANALYTICS_EVENT_ROOM_RECORDING_STATUS =
      AnalyticsEvents._(
          4, _omitEnumNames ? '' : 'ANALYTICS_EVENT_ROOM_RECORDING_STATUS');
  static const AnalyticsEvents ANALYTICS_EVENT_ROOM_RTMP_STATUS =
      AnalyticsEvents._(
          5, _omitEnumNames ? '' : 'ANALYTICS_EVENT_ROOM_RTMP_STATUS');
  static const AnalyticsEvents ANALYTICS_EVENT_ROOM_BREAKOUT_ROOM =
      AnalyticsEvents._(
          6, _omitEnumNames ? '' : 'ANALYTICS_EVENT_ROOM_BREAKOUT_ROOM');
  static const AnalyticsEvents ANALYTICS_EVENT_ROOM_ETHERPAD_STATUS =
      AnalyticsEvents._(
          7, _omitEnumNames ? '' : 'ANALYTICS_EVENT_ROOM_ETHERPAD_STATUS');
  static const AnalyticsEvents
      ANALYTICS_EVENT_ROOM_EXTERNAL_DISPLAY_LINK_STATUS = AnalyticsEvents._(
          8,
          _omitEnumNames
              ? ''
              : 'ANALYTICS_EVENT_ROOM_EXTERNAL_DISPLAY_LINK_STATUS');
  static const AnalyticsEvents
      ANALYTICS_EVENT_ROOM_EXTERNAL_MEDIA_PLAYER_STATUS = AnalyticsEvents._(
          9,
          _omitEnumNames
              ? ''
              : 'ANALYTICS_EVENT_ROOM_EXTERNAL_MEDIA_PLAYER_STATUS');
  static const AnalyticsEvents ANALYTICS_EVENT_ROOM_SPEECH_SERVICE_STATUS =
      AnalyticsEvents._(10,
          _omitEnumNames ? '' : 'ANALYTICS_EVENT_ROOM_SPEECH_SERVICE_STATUS');
  static const AnalyticsEvents ANALYTICS_EVENT_ROOM_SPEECH_SERVICE_TOTAL_USAGE =
      AnalyticsEvents._(
          11,
          _omitEnumNames
              ? ''
              : 'ANALYTICS_EVENT_ROOM_SPEECH_SERVICE_TOTAL_USAGE');
  static const AnalyticsEvents ANALYTICS_EVENT_ROOM_INGRESS_CREATED =
      AnalyticsEvents._(
          12, _omitEnumNames ? '' : 'ANALYTICS_EVENT_ROOM_INGRESS_CREATED');
  static const AnalyticsEvents ANALYTICS_EVENT_ROOM_WHITEBOARD_FILES =
      AnalyticsEvents._(
          13, _omitEnumNames ? '' : 'ANALYTICS_EVENT_ROOM_WHITEBOARD_FILES');
  static const AnalyticsEvents
      ANALYTICS_EVENT_ROOM_INSIGHTS_TRANSCRIPTION_STATUS = AnalyticsEvents._(
          31,
          _omitEnumNames
              ? ''
              : 'ANALYTICS_EVENT_ROOM_INSIGHTS_TRANSCRIPTION_STATUS');
  static const AnalyticsEvents
      ANALYTICS_EVENT_ROOM_INSIGHTS_TRANSCRIPTION_TOTAL_USAGE =
      AnalyticsEvents._(
          32,
          _omitEnumNames
              ? ''
              : 'ANALYTICS_EVENT_ROOM_INSIGHTS_TRANSCRIPTION_TOTAL_USAGE');
  static const AnalyticsEvents
      ANALYTICS_EVENT_ROOM_INSIGHTS_SYNTHESIZED_SPEECH_TOTAL_USAGE =
      AnalyticsEvents._(
          33,
          _omitEnumNames
              ? ''
              : 'ANALYTICS_EVENT_ROOM_INSIGHTS_SYNTHESIZED_SPEECH_TOTAL_USAGE');
  static const AnalyticsEvents
      ANALYTICS_EVENT_ROOM_INSIGHTS_CHAT_TRANSLATION_STATUS = AnalyticsEvents._(
          34,
          _omitEnumNames
              ? ''
              : 'ANALYTICS_EVENT_ROOM_INSIGHTS_CHAT_TRANSLATION_STATUS');
  static const AnalyticsEvents
      ANALYTICS_EVENT_ROOM_INSIGHTS_CHAT_TRANSLATION_TOTAL_USAGE =
      AnalyticsEvents._(
          35,
          _omitEnumNames
              ? ''
              : 'ANALYTICS_EVENT_ROOM_INSIGHTS_CHAT_TRANSLATION_TOTAL_USAGE');
  static const AnalyticsEvents
      ANALYTICS_EVENT_ROOM_INSIGHTS_AI_TEXT_CHAT_STATUS = AnalyticsEvents._(
          36,
          _omitEnumNames
              ? ''
              : 'ANALYTICS_EVENT_ROOM_INSIGHTS_AI_TEXT_CHAT_STATUS');
  static const AnalyticsEvents
      ANALYTICS_EVENT_ROOM_INSIGHTS_AI_TEXT_CHAT_INTERACTION_TOTAL_USAGE =
      AnalyticsEvents._(
          37,
          _omitEnumNames
              ? ''
              : 'ANALYTICS_EVENT_ROOM_INSIGHTS_AI_TEXT_CHAT_INTERACTION_TOTAL_USAGE');
  static const AnalyticsEvents
      ANALYTICS_EVENT_ROOM_INSIGHTS_AI_TEXT_CHAT_SUMMARIZATION_TOTAL_USAGE =
      AnalyticsEvents._(
          38,
          _omitEnumNames
              ? ''
              : 'ANALYTICS_EVENT_ROOM_INSIGHTS_AI_TEXT_CHAT_SUMMARIZATION_TOTAL_USAGE');
  static const AnalyticsEvents
      ANALYTICS_EVENT_ROOM_INSIGHTS_AI_MEETING_SUMMARIZATION_STATUS =
      AnalyticsEvents._(
          39,
          _omitEnumNames
              ? ''
              : 'ANALYTICS_EVENT_ROOM_INSIGHTS_AI_MEETING_SUMMARIZATION_STATUS');

  /// here all related with user
  static const AnalyticsEvents ANALYTICS_EVENT_USER_LEFT =
      AnalyticsEvents._(14, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_LEFT');

  /// microphone
  static const AnalyticsEvents ANALYTICS_EVENT_USER_MIC_STATUS =
      AnalyticsEvents._(
          15, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_MIC_STATUS');
  static const AnalyticsEvents ANALYTICS_EVENT_USER_TALKED = AnalyticsEvents._(
      16, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_TALKED');
  static const AnalyticsEvents ANALYTICS_EVENT_USER_TALKED_DURATION =
      AnalyticsEvents._(
          17, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_TALKED_DURATION');

  /// webcam
  static const AnalyticsEvents ANALYTICS_EVENT_USER_WEBCAM_STATUS =
      AnalyticsEvents._(
          18, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_WEBCAM_STATUS');

  /// screen share
  static const AnalyticsEvents ANALYTICS_EVENT_USER_SCREEN_SHARE_STATUS =
      AnalyticsEvents._(
          19, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_SCREEN_SHARE_STATUS');

  /// polls
  static const AnalyticsEvents ANALYTICS_EVENT_USER_VOTED_POLL =
      AnalyticsEvents._(
          20, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_VOTED_POLL');

  /// chat
  static const AnalyticsEvents ANALYTICS_EVENT_USER_PUBLIC_CHAT =
      AnalyticsEvents._(
          21, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_PUBLIC_CHAT');
  static const AnalyticsEvents ANALYTICS_EVENT_USER_PRIVATE_CHAT =
      AnalyticsEvents._(
          22, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_PRIVATE_CHAT');
  static const AnalyticsEvents ANALYTICS_EVENT_USER_CHAT_FILES =
      AnalyticsEvents._(
          23, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_CHAT_FILES');

  /// whiteboard
  static const AnalyticsEvents ANALYTICS_EVENT_USER_WHITEBOARD_ANNOTATED =
      AnalyticsEvents._(24,
          _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_WHITEBOARD_ANNOTATED');
  static const AnalyticsEvents ANALYTICS_EVENT_USER_WHITEBOARD_FILES =
      AnalyticsEvents._(
          25, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_WHITEBOARD_FILES');

  /// speech services
  static const AnalyticsEvents ANALYTICS_EVENT_USER_SPEECH_SERVICES_USAGE =
      AnalyticsEvents._(26,
          _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_SPEECH_SERVICES_USAGE');
  static const AnalyticsEvents ANALYTICS_EVENT_USER_SPEECH_SERVICES_STATUS =
      AnalyticsEvents._(27,
          _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_SPEECH_SERVICES_STATUS');

  /// etc
  static const AnalyticsEvents ANALYTICS_EVENT_USER_INTERFACE_VISIBILITY =
      AnalyticsEvents._(28,
          _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_INTERFACE_VISIBILITY');
  static const AnalyticsEvents ANALYTICS_EVENT_USER_RAISE_HAND =
      AnalyticsEvents._(
          29, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_RAISE_HAND');
  static const AnalyticsEvents ANALYTICS_EVENT_USER_CONNECTION_QUALITY =
      AnalyticsEvents._(
          30, _omitEnumNames ? '' : 'ANALYTICS_EVENT_USER_CONNECTION_QUALITY');

  static const $core.List<AnalyticsEvents> values = <AnalyticsEvents>[
    ANALYTICS_EVENT_UNKNOWN,
    ANALYTICS_EVENT_ROOM_POLL_ADDED,
    ANALYTICS_EVENT_ROOM_POLL_ENDED,
    ANALYTICS_EVENT_USER_JOINED,
    ANALYTICS_EVENT_ROOM_RECORDING_STATUS,
    ANALYTICS_EVENT_ROOM_RTMP_STATUS,
    ANALYTICS_EVENT_ROOM_BREAKOUT_ROOM,
    ANALYTICS_EVENT_ROOM_ETHERPAD_STATUS,
    ANALYTICS_EVENT_ROOM_EXTERNAL_DISPLAY_LINK_STATUS,
    ANALYTICS_EVENT_ROOM_EXTERNAL_MEDIA_PLAYER_STATUS,
    ANALYTICS_EVENT_ROOM_SPEECH_SERVICE_STATUS,
    ANALYTICS_EVENT_ROOM_SPEECH_SERVICE_TOTAL_USAGE,
    ANALYTICS_EVENT_ROOM_INGRESS_CREATED,
    ANALYTICS_EVENT_ROOM_WHITEBOARD_FILES,
    ANALYTICS_EVENT_ROOM_INSIGHTS_TRANSCRIPTION_STATUS,
    ANALYTICS_EVENT_ROOM_INSIGHTS_TRANSCRIPTION_TOTAL_USAGE,
    ANALYTICS_EVENT_ROOM_INSIGHTS_SYNTHESIZED_SPEECH_TOTAL_USAGE,
    ANALYTICS_EVENT_ROOM_INSIGHTS_CHAT_TRANSLATION_STATUS,
    ANALYTICS_EVENT_ROOM_INSIGHTS_CHAT_TRANSLATION_TOTAL_USAGE,
    ANALYTICS_EVENT_ROOM_INSIGHTS_AI_TEXT_CHAT_STATUS,
    ANALYTICS_EVENT_ROOM_INSIGHTS_AI_TEXT_CHAT_INTERACTION_TOTAL_USAGE,
    ANALYTICS_EVENT_ROOM_INSIGHTS_AI_TEXT_CHAT_SUMMARIZATION_TOTAL_USAGE,
    ANALYTICS_EVENT_ROOM_INSIGHTS_AI_MEETING_SUMMARIZATION_STATUS,
    ANALYTICS_EVENT_USER_LEFT,
    ANALYTICS_EVENT_USER_MIC_STATUS,
    ANALYTICS_EVENT_USER_TALKED,
    ANALYTICS_EVENT_USER_TALKED_DURATION,
    ANALYTICS_EVENT_USER_WEBCAM_STATUS,
    ANALYTICS_EVENT_USER_SCREEN_SHARE_STATUS,
    ANALYTICS_EVENT_USER_VOTED_POLL,
    ANALYTICS_EVENT_USER_PUBLIC_CHAT,
    ANALYTICS_EVENT_USER_PRIVATE_CHAT,
    ANALYTICS_EVENT_USER_CHAT_FILES,
    ANALYTICS_EVENT_USER_WHITEBOARD_ANNOTATED,
    ANALYTICS_EVENT_USER_WHITEBOARD_FILES,
    ANALYTICS_EVENT_USER_SPEECH_SERVICES_USAGE,
    ANALYTICS_EVENT_USER_SPEECH_SERVICES_STATUS,
    ANALYTICS_EVENT_USER_INTERFACE_VISIBILITY,
    ANALYTICS_EVENT_USER_RAISE_HAND,
    ANALYTICS_EVENT_USER_CONNECTION_QUALITY,
  ];

  static final $core.List<AnalyticsEvents?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 39);
  static AnalyticsEvents? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AnalyticsEvents._(super.value, super.name);
}

class AnalyticsStatus extends $pb.ProtobufEnum {
  static const AnalyticsStatus ANALYTICS_STATUS_STARTED =
      AnalyticsStatus._(0, _omitEnumNames ? '' : 'ANALYTICS_STATUS_STARTED');
  static const AnalyticsStatus ANALYTICS_STATUS_ENDED =
      AnalyticsStatus._(1, _omitEnumNames ? '' : 'ANALYTICS_STATUS_ENDED');
  static const AnalyticsStatus ANALYTICS_STATUS_MUTED =
      AnalyticsStatus._(2, _omitEnumNames ? '' : 'ANALYTICS_STATUS_MUTED');
  static const AnalyticsStatus ANALYTICS_STATUS_UNMUTED =
      AnalyticsStatus._(3, _omitEnumNames ? '' : 'ANALYTICS_STATUS_UNMUTED');

  static const $core.List<AnalyticsStatus> values = <AnalyticsStatus>[
    ANALYTICS_STATUS_STARTED,
    ANALYTICS_STATUS_ENDED,
    ANALYTICS_STATUS_MUTED,
    ANALYTICS_STATUS_UNMUTED,
  ];

  static final $core.List<AnalyticsStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static AnalyticsStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AnalyticsStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
