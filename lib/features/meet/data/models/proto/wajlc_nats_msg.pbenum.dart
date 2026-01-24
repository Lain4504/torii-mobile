// This is a generated file - do not edit.
//
// Generated from wajlc_nats_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NatsMsgServerToClientEvents extends $pb.ProtobufEnum {
  /// initial data
  static const NatsMsgServerToClientEvents RES_INITIAL_DATA =
      NatsMsgServerToClientEvents._(
          0, _omitEnumNames ? '' : 'RES_INITIAL_DATA');
  static const NatsMsgServerToClientEvents RES_JOINED_USERS_LIST =
      NatsMsgServerToClientEvents._(
          1, _omitEnumNames ? '' : 'RES_JOINED_USERS_LIST');
  static const NatsMsgServerToClientEvents RES_MEDIA_SERVER_DATA =
      NatsMsgServerToClientEvents._(
          16, _omitEnumNames ? '' : 'RES_MEDIA_SERVER_DATA');
  static const NatsMsgServerToClientEvents ROOM_METADATA_UPDATE =
      NatsMsgServerToClientEvents._(
          2, _omitEnumNames ? '' : 'ROOM_METADATA_UPDATE');
  static const NatsMsgServerToClientEvents USER_METADATA_UPDATE =
      NatsMsgServerToClientEvents._(
          3, _omitEnumNames ? '' : 'USER_METADATA_UPDATE');
  static const NatsMsgServerToClientEvents USER_JOINED =
      NatsMsgServerToClientEvents._(4, _omitEnumNames ? '' : 'USER_JOINED');
  static const NatsMsgServerToClientEvents USER_DISCONNECTED =
      NatsMsgServerToClientEvents._(
          5, _omitEnumNames ? '' : 'USER_DISCONNECTED');
  static const NatsMsgServerToClientEvents USER_OFFLINE =
      NatsMsgServerToClientEvents._(6, _omitEnumNames ? '' : 'USER_OFFLINE');
  static const NatsMsgServerToClientEvents RESP_RENEW_WAJLC_TOKEN =
      NatsMsgServerToClientEvents._(
          7, _omitEnumNames ? '' : 'RESP_RENEW_WAJLC_TOKEN');
  static const NatsMsgServerToClientEvents SYSTEM_NOTIFICATION =
      NatsMsgServerToClientEvents._(
          8, _omitEnumNames ? '' : 'SYSTEM_NOTIFICATION');
  static const NatsMsgServerToClientEvents
      AZURE_COGNITIVE_SERVICE_SPEECH_TOKEN = NatsMsgServerToClientEvents._(
          9, _omitEnumNames ? '' : 'AZURE_COGNITIVE_SERVICE_SPEECH_TOKEN');
  static const NatsMsgServerToClientEvents SESSION_ENDED =
      NatsMsgServerToClientEvents._(10, _omitEnumNames ? '' : 'SESSION_ENDED');
  static const NatsMsgServerToClientEvents POLL_CLOSED =
      NatsMsgServerToClientEvents._(11, _omitEnumNames ? '' : 'POLL_CLOSED');
  static const NatsMsgServerToClientEvents POLL_CREATED =
      NatsMsgServerToClientEvents._(12, _omitEnumNames ? '' : 'POLL_CREATED');
  static const NatsMsgServerToClientEvents JOIN_BREAKOUT_ROOM =
      NatsMsgServerToClientEvents._(
          13, _omitEnumNames ? '' : 'JOIN_BREAKOUT_ROOM');
  static const NatsMsgServerToClientEvents BREAKOUT_ROOM_ENDED =
      NatsMsgServerToClientEvents._(
          15, _omitEnumNames ? '' : 'BREAKOUT_ROOM_ENDED');
  static const NatsMsgServerToClientEvents SYSTEM_CHAT_MSG =
      NatsMsgServerToClientEvents._(
          14, _omitEnumNames ? '' : 'SYSTEM_CHAT_MSG');
  static const NatsMsgServerToClientEvents TRANSCRIPTION_OUTPUT_TEXT =
      NatsMsgServerToClientEvents._(
          17, _omitEnumNames ? '' : 'TRANSCRIPTION_OUTPUT_TEXT');
  static const NatsMsgServerToClientEvents RESP_INSIGHTS_AI_TEXT_CHAT =
      NatsMsgServerToClientEvents._(
          19, _omitEnumNames ? '' : 'RESP_INSIGHTS_AI_TEXT_CHAT');

  static const $core.List<NatsMsgServerToClientEvents> values =
      <NatsMsgServerToClientEvents>[
    RES_INITIAL_DATA,
    RES_JOINED_USERS_LIST,
    RES_MEDIA_SERVER_DATA,
    ROOM_METADATA_UPDATE,
    USER_METADATA_UPDATE,
    USER_JOINED,
    USER_DISCONNECTED,
    USER_OFFLINE,
    RESP_RENEW_WAJLC_TOKEN,
    SYSTEM_NOTIFICATION,
    AZURE_COGNITIVE_SERVICE_SPEECH_TOKEN,
    SESSION_ENDED,
    POLL_CLOSED,
    POLL_CREATED,
    JOIN_BREAKOUT_ROOM,
    BREAKOUT_ROOM_ENDED,
    SYSTEM_CHAT_MSG,
    TRANSCRIPTION_OUTPUT_TEXT,
    RESP_INSIGHTS_AI_TEXT_CHAT,
  ];

  static final $core.List<NatsMsgServerToClientEvents?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 19);
  static NatsMsgServerToClientEvents? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const NatsMsgServerToClientEvents._(super.value, super.name);
}

class NatsMsgClientToServerEvents extends $pb.ProtobufEnum {
  static const NatsMsgClientToServerEvents REQ_INITIAL_DATA =
      NatsMsgClientToServerEvents._(
          0, _omitEnumNames ? '' : 'REQ_INITIAL_DATA');
  static const NatsMsgClientToServerEvents REQ_MEDIA_SERVER_DATA =
      NatsMsgClientToServerEvents._(
          8, _omitEnumNames ? '' : 'REQ_MEDIA_SERVER_DATA');
  static const NatsMsgClientToServerEvents REQ_JOINED_USERS_LIST =
      NatsMsgClientToServerEvents._(
          1, _omitEnumNames ? '' : 'REQ_JOINED_USERS_LIST');
  static const NatsMsgClientToServerEvents REQ_RENEW_WAJLC_TOKEN =
      NatsMsgClientToServerEvents._(
          2, _omitEnumNames ? '' : 'REQ_RENEW_WAJLC_TOKEN');
  static const NatsMsgClientToServerEvents PING =
      NatsMsgClientToServerEvents._(3, _omitEnumNames ? '' : 'PING');
  static const NatsMsgClientToServerEvents REQ_RAISE_HAND =
      NatsMsgClientToServerEvents._(4, _omitEnumNames ? '' : 'REQ_RAISE_HAND');
  static const NatsMsgClientToServerEvents REQ_LOWER_HAND =
      NatsMsgClientToServerEvents._(5, _omitEnumNames ? '' : 'REQ_LOWER_HAND');
  static const NatsMsgClientToServerEvents REQ_LOWER_OTHER_USER_HAND =
      NatsMsgClientToServerEvents._(
          6, _omitEnumNames ? '' : 'REQ_LOWER_OTHER_USER_HAND');
  static const NatsMsgClientToServerEvents PUSH_ANALYTICS_DATA =
      NatsMsgClientToServerEvents._(
          7, _omitEnumNames ? '' : 'PUSH_ANALYTICS_DATA');

  static const $core.List<NatsMsgClientToServerEvents> values =
      <NatsMsgClientToServerEvents>[
    REQ_INITIAL_DATA,
    REQ_MEDIA_SERVER_DATA,
    REQ_JOINED_USERS_LIST,
    REQ_RENEW_WAJLC_TOKEN,
    PING,
    REQ_RAISE_HAND,
    REQ_LOWER_HAND,
    REQ_LOWER_OTHER_USER_HAND,
    PUSH_ANALYTICS_DATA,
  ];

  static final $core.List<NatsMsgClientToServerEvents?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 8);
  static NatsMsgClientToServerEvents? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const NatsMsgClientToServerEvents._(super.value, super.name);
}

class NatsSystemNotificationTypes extends $pb.ProtobufEnum {
  static const NatsSystemNotificationTypes NATS_SYSTEM_NOTIFICATION_INFO =
      NatsSystemNotificationTypes._(
          0, _omitEnumNames ? '' : 'NATS_SYSTEM_NOTIFICATION_INFO');
  static const NatsSystemNotificationTypes NATS_SYSTEM_NOTIFICATION_WARNING =
      NatsSystemNotificationTypes._(
          1, _omitEnumNames ? '' : 'NATS_SYSTEM_NOTIFICATION_WARNING');
  static const NatsSystemNotificationTypes NATS_SYSTEM_NOTIFICATION_ERROR =
      NatsSystemNotificationTypes._(
          2, _omitEnumNames ? '' : 'NATS_SYSTEM_NOTIFICATION_ERROR');

  static const $core.List<NatsSystemNotificationTypes> values =
      <NatsSystemNotificationTypes>[
    NATS_SYSTEM_NOTIFICATION_INFO,
    NATS_SYSTEM_NOTIFICATION_WARNING,
    NATS_SYSTEM_NOTIFICATION_ERROR,
  ];

  static final $core.List<NatsSystemNotificationTypes?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static NatsSystemNotificationTypes? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const NatsSystemNotificationTypes._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
