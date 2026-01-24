//
//  Generated code. Do not modify.
//  source: wajlc_insights.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class InsightsServiceType extends $pb.ProtobufEnum {
  static const InsightsServiceType INSIGHTS_SERVICE_TYPE_UNSPECIFIED = InsightsServiceType._(0, _omitEnumNames ? '' : 'INSIGHTS_SERVICE_TYPE_UNSPECIFIED');
  static const InsightsServiceType INSIGHTS_SERVICE_TYPE_TRANSCRIPTION = InsightsServiceType._(1, _omitEnumNames ? '' : 'INSIGHTS_SERVICE_TYPE_TRANSCRIPTION');
  static const InsightsServiceType INSIGHTS_SERVICE_TYPE_TRANSLATION = InsightsServiceType._(2, _omitEnumNames ? '' : 'INSIGHTS_SERVICE_TYPE_TRANSLATION');
  static const InsightsServiceType INSIGHTS_SERVICE_TYPE_SPEECH_SYNTHESIS = InsightsServiceType._(3, _omitEnumNames ? '' : 'INSIGHTS_SERVICE_TYPE_SPEECH_SYNTHESIS');
  static const InsightsServiceType INSIGHTS_SERVICE_TYPE_AI_TEXT_CHAT = InsightsServiceType._(4, _omitEnumNames ? '' : 'INSIGHTS_SERVICE_TYPE_AI_TEXT_CHAT');
  static const InsightsServiceType INSIGHTS_SERVICE_TYPE_CHAT_TRANSLATION = InsightsServiceType._(5, _omitEnumNames ? '' : 'INSIGHTS_SERVICE_TYPE_CHAT_TRANSLATION');
  static const InsightsServiceType INSIGHTS_SERVICE_TYPE_MEETING_SUMMARIZING = InsightsServiceType._(6, _omitEnumNames ? '' : 'INSIGHTS_SERVICE_TYPE_MEETING_SUMMARIZING');

  static const $core.List<InsightsServiceType> values = <InsightsServiceType> [
    INSIGHTS_SERVICE_TYPE_UNSPECIFIED,
    INSIGHTS_SERVICE_TYPE_TRANSCRIPTION,
    INSIGHTS_SERVICE_TYPE_TRANSLATION,
    INSIGHTS_SERVICE_TYPE_SPEECH_SYNTHESIS,
    INSIGHTS_SERVICE_TYPE_AI_TEXT_CHAT,
    INSIGHTS_SERVICE_TYPE_CHAT_TRANSLATION,
    INSIGHTS_SERVICE_TYPE_MEETING_SUMMARIZING,
  ];

  static final $core.Map<$core.int, InsightsServiceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static InsightsServiceType? valueOf($core.int value) => _byValue[value];

  const InsightsServiceType._($core.int v, $core.String n) : super(v, n);
}

class InsightsUserSessionAction extends $pb.ProtobufEnum {
  static const InsightsUserSessionAction USER_SESSION_ACTION_UNSPECIFIED = InsightsUserSessionAction._(0, _omitEnumNames ? '' : 'USER_SESSION_ACTION_UNSPECIFIED');
  static const InsightsUserSessionAction USER_SESSION_ACTION_START = InsightsUserSessionAction._(1, _omitEnumNames ? '' : 'USER_SESSION_ACTION_START');
  static const InsightsUserSessionAction USER_SESSION_ACTION_STOP = InsightsUserSessionAction._(2, _omitEnumNames ? '' : 'USER_SESSION_ACTION_STOP');

  static const $core.List<InsightsUserSessionAction> values = <InsightsUserSessionAction> [
    USER_SESSION_ACTION_UNSPECIFIED,
    USER_SESSION_ACTION_START,
    USER_SESSION_ACTION_STOP,
  ];

  static final $core.Map<$core.int, InsightsUserSessionAction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static InsightsUserSessionAction? valueOf($core.int value) => _byValue[value];

  const InsightsUserSessionAction._($core.int v, $core.String n) : super(v, n);
}

/// start AI Text Chat
class InsightsAITextChatRole extends $pb.ProtobufEnum {
  static const InsightsAITextChatRole INSIGHTS_AI_TEXT_CHAT_ROLE_UNSPECIFIED = InsightsAITextChatRole._(0, _omitEnumNames ? '' : 'INSIGHTS_AI_TEXT_CHAT_ROLE_UNSPECIFIED');
  static const InsightsAITextChatRole INSIGHTS_AI_TEXT_CHAT_ROLE_SYSTEM = InsightsAITextChatRole._(1, _omitEnumNames ? '' : 'INSIGHTS_AI_TEXT_CHAT_ROLE_SYSTEM');
  static const InsightsAITextChatRole INSIGHTS_AI_TEXT_CHAT_ROLE_USER = InsightsAITextChatRole._(2, _omitEnumNames ? '' : 'INSIGHTS_AI_TEXT_CHAT_ROLE_USER');
  static const InsightsAITextChatRole INSIGHTS_AI_TEXT_CHAT_ROLE_MODEL = InsightsAITextChatRole._(3, _omitEnumNames ? '' : 'INSIGHTS_AI_TEXT_CHAT_ROLE_MODEL');

  static const $core.List<InsightsAITextChatRole> values = <InsightsAITextChatRole> [
    INSIGHTS_AI_TEXT_CHAT_ROLE_UNSPECIFIED,
    INSIGHTS_AI_TEXT_CHAT_ROLE_SYSTEM,
    INSIGHTS_AI_TEXT_CHAT_ROLE_USER,
    INSIGHTS_AI_TEXT_CHAT_ROLE_MODEL,
  ];

  static final $core.Map<$core.int, InsightsAITextChatRole> _byValue = $pb.ProtobufEnum.initByValue(values);
  static InsightsAITextChatRole? valueOf($core.int value) => _byValue[value];

  const InsightsAITextChatRole._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
