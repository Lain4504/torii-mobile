// This is a generated file - do not edit.
//
// Generated from wajlc_insights.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use insightsServiceTypeDescriptor instead')
const InsightsServiceType$json = {
  '1': 'InsightsServiceType',
  '2': [
    {'1': 'INSIGHTS_SERVICE_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'INSIGHTS_SERVICE_TYPE_TRANSCRIPTION', '2': 1},
    {'1': 'INSIGHTS_SERVICE_TYPE_TRANSLATION', '2': 2},
    {'1': 'INSIGHTS_SERVICE_TYPE_SPEECH_SYNTHESIS', '2': 3},
    {'1': 'INSIGHTS_SERVICE_TYPE_AI_TEXT_CHAT', '2': 4},
    {'1': 'INSIGHTS_SERVICE_TYPE_CHAT_TRANSLATION', '2': 5},
    {'1': 'INSIGHTS_SERVICE_TYPE_MEETING_SUMMARIZING', '2': 6},
  ],
};

/// Descriptor for `InsightsServiceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List insightsServiceTypeDescriptor = $convert.base64Decode(
    'ChNJbnNpZ2h0c1NlcnZpY2VUeXBlEiUKIUlOU0lHSFRTX1NFUlZJQ0VfVFlQRV9VTlNQRUNJRk'
    'lFRBAAEicKI0lOU0lHSFRTX1NFUlZJQ0VfVFlQRV9UUkFOU0NSSVBUSU9OEAESJQohSU5TSUdI'
    'VFNfU0VSVklDRV9UWVBFX1RSQU5TTEFUSU9OEAISKgomSU5TSUdIVFNfU0VSVklDRV9UWVBFX1'
    'NQRUVDSF9TWU5USEVTSVMQAxImCiJJTlNJR0hUU19TRVJWSUNFX1RZUEVfQUlfVEVYVF9DSEFU'
    'EAQSKgomSU5TSUdIVFNfU0VSVklDRV9UWVBFX0NIQVRfVFJBTlNMQVRJT04QBRItCilJTlNJR0'
    'hUU19TRVJWSUNFX1RZUEVfTUVFVElOR19TVU1NQVJJWklORxAG');

@$core.Deprecated('Use insightsUserSessionActionDescriptor instead')
const InsightsUserSessionAction$json = {
  '1': 'InsightsUserSessionAction',
  '2': [
    {'1': 'USER_SESSION_ACTION_UNSPECIFIED', '2': 0},
    {'1': 'USER_SESSION_ACTION_START', '2': 1},
    {'1': 'USER_SESSION_ACTION_STOP', '2': 2},
  ],
};

/// Descriptor for `InsightsUserSessionAction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List insightsUserSessionActionDescriptor = $convert.base64Decode(
    'ChlJbnNpZ2h0c1VzZXJTZXNzaW9uQWN0aW9uEiMKH1VTRVJfU0VTU0lPTl9BQ1RJT05fVU5TUE'
    'VDSUZJRUQQABIdChlVU0VSX1NFU1NJT05fQUNUSU9OX1NUQVJUEAESHAoYVVNFUl9TRVNTSU9O'
    'X0FDVElPTl9TVE9QEAI=');

@$core.Deprecated('Use insightsAITextChatRoleDescriptor instead')
const InsightsAITextChatRole$json = {
  '1': 'InsightsAITextChatRole',
  '2': [
    {'1': 'INSIGHTS_AI_TEXT_CHAT_ROLE_UNSPECIFIED', '2': 0},
    {'1': 'INSIGHTS_AI_TEXT_CHAT_ROLE_SYSTEM', '2': 1},
    {'1': 'INSIGHTS_AI_TEXT_CHAT_ROLE_USER', '2': 2},
    {'1': 'INSIGHTS_AI_TEXT_CHAT_ROLE_MODEL', '2': 3},
  ],
};

/// Descriptor for `InsightsAITextChatRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List insightsAITextChatRoleDescriptor = $convert.base64Decode(
    'ChZJbnNpZ2h0c0FJVGV4dENoYXRSb2xlEioKJklOU0lHSFRTX0FJX1RFWFRfQ0hBVF9ST0xFX1'
    'VOU1BFQ0lGSUVEEAASJQohSU5TSUdIVFNfQUlfVEVYVF9DSEFUX1JPTEVfU1lTVEVNEAESIwof'
    'SU5TSUdIVFNfQUlfVEVYVF9DSEFUX1JPTEVfVVNFUhACEiQKIElOU0lHSFRTX0FJX1RFWFRfQ0'
    'hBVF9ST0xFX01PREVMEAM=');

@$core.Deprecated('Use insightsSupportedLangInfoDescriptor instead')
const InsightsSupportedLangInfo$json = {
  '1': 'InsightsSupportedLangInfo',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'locale', '3': 3, '4': 1, '5': 9, '10': 'locale'},
  ],
};

/// Descriptor for `InsightsSupportedLangInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsSupportedLangInfoDescriptor =
    $convert.base64Decode(
        'ChlJbnNpZ2h0c1N1cHBvcnRlZExhbmdJbmZvEhIKBGNvZGUYASABKAlSBGNvZGUSEgoEbmFtZR'
        'gCIAEoCVIEbmFtZRIWCgZsb2NhbGUYAyABKAlSBmxvY2FsZQ==');

@$core.Deprecated('Use insightsTranscriptionConfigReqDescriptor instead')
const InsightsTranscriptionConfigReq$json = {
  '1': 'InsightsTranscriptionConfigReq',
  '2': [
    {'1': 'is_enabled', '3': 1, '4': 1, '5': 8, '10': 'isEnabled'},
    {
      '1': 'allowed_spoken_langs',
      '3': 2,
      '4': 3,
      '5': 9,
      '10': 'allowedSpokenLangs'
    },
    {
      '1': 'allowed_speech_users',
      '3': 3,
      '4': 3,
      '5': 9,
      '10': 'allowedSpeechUsers'
    },
    {
      '1': 'is_enabled_translation',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'isEnabledTranslation'
    },
    {
      '1': 'allowed_trans_langs',
      '3': 5,
      '4': 3,
      '5': 9,
      '10': 'allowedTransLangs'
    },
    {
      '1': 'default_subtitle_lang',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'defaultSubtitleLang',
      '17': true
    },
    {
      '1': 'is_enabled_speech_synthesis',
      '3': 7,
      '4': 1,
      '5': 8,
      '10': 'isEnabledSpeechSynthesis'
    },
  ],
  '8': [
    {'1': '_default_subtitle_lang'},
  ],
};

/// Descriptor for `InsightsTranscriptionConfigReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsTranscriptionConfigReqDescriptor = $convert.base64Decode(
    'Ch5JbnNpZ2h0c1RyYW5zY3JpcHRpb25Db25maWdSZXESHQoKaXNfZW5hYmxlZBgBIAEoCFIJaX'
    'NFbmFibGVkEjAKFGFsbG93ZWRfc3Bva2VuX2xhbmdzGAIgAygJUhJhbGxvd2VkU3Bva2VuTGFu'
    'Z3MSMAoUYWxsb3dlZF9zcGVlY2hfdXNlcnMYAyADKAlSEmFsbG93ZWRTcGVlY2hVc2VycxI0Ch'
    'Zpc19lbmFibGVkX3RyYW5zbGF0aW9uGAQgASgIUhRpc0VuYWJsZWRUcmFuc2xhdGlvbhIuChNh'
    'bGxvd2VkX3RyYW5zX2xhbmdzGAUgAygJUhFhbGxvd2VkVHJhbnNMYW5ncxI3ChVkZWZhdWx0X3'
    'N1YnRpdGxlX2xhbmcYBiABKAlIAFITZGVmYXVsdFN1YnRpdGxlTGFuZ4gBARI9Chtpc19lbmFi'
    'bGVkX3NwZWVjaF9zeW50aGVzaXMYByABKAhSGGlzRW5hYmxlZFNwZWVjaFN5bnRoZXNpc0IYCh'
    'ZfZGVmYXVsdF9zdWJ0aXRsZV9sYW5n');

@$core.Deprecated('Use insightsTranscriptionUserSessionReqDescriptor instead')
const InsightsTranscriptionUserSessionReq$json = {
  '1': 'InsightsTranscriptionUserSessionReq',
  '2': [
    {
      '1': 'action',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.wajlc.InsightsUserSessionAction',
      '10': 'action'
    },
    {
      '1': 'spoken_lang',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'spokenLang',
      '17': true
    },
    {
      '1': 'allowed_transcription_storage',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'allowedTranscriptionStorage'
    },
  ],
  '8': [
    {'1': '_spoken_lang'},
  ],
};

/// Descriptor for `InsightsTranscriptionUserSessionReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsTranscriptionUserSessionReqDescriptor =
    $convert.base64Decode(
        'CiNJbnNpZ2h0c1RyYW5zY3JpcHRpb25Vc2VyU2Vzc2lvblJlcRI4CgZhY3Rpb24YASABKA4yIC'
        '53YWpsYy5JbnNpZ2h0c1VzZXJTZXNzaW9uQWN0aW9uUgZhY3Rpb24SJAoLc3Bva2VuX2xhbmcY'
        'AiABKAlIAFIKc3Bva2VuTGFuZ4gBARJCCh1hbGxvd2VkX3RyYW5zY3JpcHRpb25fc3RvcmFnZR'
        'gDIAEoCFIbYWxsb3dlZFRyYW5zY3JpcHRpb25TdG9yYWdlQg4KDF9zcG9rZW5fbGFuZw==');

@$core.Deprecated('Use insightsTranscriptionResultDescriptor instead')
const InsightsTranscriptionResult$json = {
  '1': 'InsightsTranscriptionResult',
  '2': [
    {'1': 'from_user_id', '3': 1, '4': 1, '5': 9, '10': 'fromUserId'},
    {'1': 'from_user_name', '3': 2, '4': 1, '5': 9, '10': 'fromUserName'},
    {'1': 'lang', '3': 3, '4': 1, '5': 9, '10': 'lang'},
    {'1': 'text', '3': 4, '4': 1, '5': 9, '10': 'text'},
    {'1': 'is_partial', '3': 5, '4': 1, '5': 8, '10': 'isPartial'},
    {
      '1': 'allowed_transcription_storage',
      '3': 6,
      '4': 1,
      '5': 8,
      '10': 'allowedTranscriptionStorage'
    },
    {
      '1': 'translations',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.wajlc.InsightsTranscriptionResult.TranslationsEntry',
      '10': 'translations'
    },
  ],
  '3': [InsightsTranscriptionResult_TranslationsEntry$json],
};

@$core.Deprecated('Use insightsTranscriptionResultDescriptor instead')
const InsightsTranscriptionResult_TranslationsEntry$json = {
  '1': 'TranslationsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `InsightsTranscriptionResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsTranscriptionResultDescriptor = $convert.base64Decode(
    'ChtJbnNpZ2h0c1RyYW5zY3JpcHRpb25SZXN1bHQSIAoMZnJvbV91c2VyX2lkGAEgASgJUgpmcm'
    '9tVXNlcklkEiQKDmZyb21fdXNlcl9uYW1lGAIgASgJUgxmcm9tVXNlck5hbWUSEgoEbGFuZxgD'
    'IAEoCVIEbGFuZxISCgR0ZXh0GAQgASgJUgR0ZXh0Eh0KCmlzX3BhcnRpYWwYBSABKAhSCWlzUG'
    'FydGlhbBJCCh1hbGxvd2VkX3RyYW5zY3JpcHRpb25fc3RvcmFnZRgGIAEoCFIbYWxsb3dlZFRy'
    'YW5zY3JpcHRpb25TdG9yYWdlElgKDHRyYW5zbGF0aW9ucxgHIAMoCzI0LndhamxjLkluc2lnaH'
    'RzVHJhbnNjcmlwdGlvblJlc3VsdC5UcmFuc2xhdGlvbnNFbnRyeVIMdHJhbnNsYXRpb25zGj8K'
    'EVRyYW5zbGF0aW9uc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YW'
    'x1ZToCOAE=');

@$core.Deprecated('Use insightsChatTranslationConfigReqDescriptor instead')
const InsightsChatTranslationConfigReq$json = {
  '1': 'InsightsChatTranslationConfigReq',
  '2': [
    {'1': 'is_enabled', '3': 1, '4': 1, '5': 8, '10': 'isEnabled'},
    {
      '1': 'allowed_trans_langs',
      '3': 5,
      '4': 3,
      '5': 9,
      '10': 'allowedTransLangs'
    },
    {
      '1': 'default_lang',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'defaultLang',
      '17': true
    },
  ],
  '8': [
    {'1': '_default_lang'},
  ],
};

/// Descriptor for `InsightsChatTranslationConfigReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsChatTranslationConfigReqDescriptor =
    $convert.base64Decode(
        'CiBJbnNpZ2h0c0NoYXRUcmFuc2xhdGlvbkNvbmZpZ1JlcRIdCgppc19lbmFibGVkGAEgASgIUg'
        'lpc0VuYWJsZWQSLgoTYWxsb3dlZF90cmFuc19sYW5ncxgFIAMoCVIRYWxsb3dlZFRyYW5zTGFu'
        'Z3MSJgoMZGVmYXVsdF9sYW5nGAYgASgJSABSC2RlZmF1bHRMYW5niAEBQg8KDV9kZWZhdWx0X2'
        'xhbmc=');

@$core.Deprecated('Use insightsTranslateTextReqDescriptor instead')
const InsightsTranslateTextReq$json = {
  '1': 'InsightsTranslateTextReq',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    {'1': 'source_lang', '3': 2, '4': 1, '5': 9, '10': 'sourceLang'},
    {'1': 'target_langs', '3': 3, '4': 3, '5': 9, '10': 'targetLangs'},
  ],
};

/// Descriptor for `InsightsTranslateTextReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsTranslateTextReqDescriptor = $convert.base64Decode(
    'ChhJbnNpZ2h0c1RyYW5zbGF0ZVRleHRSZXESEgoEdGV4dBgBIAEoCVIEdGV4dBIfCgtzb3VyY2'
    'VfbGFuZxgCIAEoCVIKc291cmNlTGFuZxIhCgx0YXJnZXRfbGFuZ3MYAyADKAlSC3RhcmdldExh'
    'bmdz');

@$core.Deprecated('Use insightsTextTranslationResultDescriptor instead')
const InsightsTextTranslationResult$json = {
  '1': 'InsightsTextTranslationResult',
  '2': [
    {'1': 'source_text', '3': 1, '4': 1, '5': 9, '10': 'sourceText'},
    {'1': 'source_lang', '3': 2, '4': 1, '5': 9, '10': 'sourceLang'},
    {
      '1': 'translations',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.wajlc.InsightsTextTranslationResult.TranslationsEntry',
      '10': 'translations'
    },
  ],
  '3': [InsightsTextTranslationResult_TranslationsEntry$json],
};

@$core.Deprecated('Use insightsTextTranslationResultDescriptor instead')
const InsightsTextTranslationResult_TranslationsEntry$json = {
  '1': 'TranslationsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `InsightsTextTranslationResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsTextTranslationResultDescriptor = $convert.base64Decode(
    'Ch1JbnNpZ2h0c1RleHRUcmFuc2xhdGlvblJlc3VsdBIfCgtzb3VyY2VfdGV4dBgBIAEoCVIKc2'
    '91cmNlVGV4dBIfCgtzb3VyY2VfbGFuZxgCIAEoCVIKc291cmNlTGFuZxJaCgx0cmFuc2xhdGlv'
    'bnMYAyADKAsyNi53YWpsYy5JbnNpZ2h0c1RleHRUcmFuc2xhdGlvblJlc3VsdC5UcmFuc2xhdG'
    'lvbnNFbnRyeVIMdHJhbnNsYXRpb25zGj8KEVRyYW5zbGF0aW9uc0VudHJ5EhAKA2tleRgBIAEo'
    'CVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use insightsTranslateTextResDescriptor instead')
const InsightsTranslateTextRes$json = {
  '1': 'InsightsTranslateTextRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'result',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.InsightsTextTranslationResult',
      '9': 0,
      '10': 'result',
      '17': true
    },
  ],
  '8': [
    {'1': '_result'},
  ],
};

/// Descriptor for `InsightsTranslateTextRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsTranslateTextResDescriptor = $convert.base64Decode(
    'ChhJbnNpZ2h0c1RyYW5zbGF0ZVRleHRSZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSEAoDbX'
    'NnGAIgASgJUgNtc2cSQQoGcmVzdWx0GAMgASgLMiQud2FqbGMuSW5zaWdodHNUZXh0VHJhbnNs'
    'YXRpb25SZXN1bHRIAFIGcmVzdWx0iAEBQgkKB19yZXN1bHQ=');

@$core.Deprecated('Use insightsGetSupportedLanguagesReqDescriptor instead')
const InsightsGetSupportedLanguagesReq$json = {
  '1': 'InsightsGetSupportedLanguagesReq',
  '2': [
    {
      '1': 'service_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.wajlc.InsightsServiceType',
      '10': 'serviceType'
    },
  ],
};

/// Descriptor for `InsightsGetSupportedLanguagesReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsGetSupportedLanguagesReqDescriptor =
    $convert.base64Decode(
        'CiBJbnNpZ2h0c0dldFN1cHBvcnRlZExhbmd1YWdlc1JlcRI9CgxzZXJ2aWNlX3R5cGUYASABKA'
        '4yGi53YWpsYy5JbnNpZ2h0c1NlcnZpY2VUeXBlUgtzZXJ2aWNlVHlwZQ==');

@$core.Deprecated('Use insightsGetSupportedLanguagesResDescriptor instead')
const InsightsGetSupportedLanguagesRes$json = {
  '1': 'InsightsGetSupportedLanguagesRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'languages',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.wajlc.InsightsSupportedLangInfo',
      '10': 'languages'
    },
  ],
};

/// Descriptor for `InsightsGetSupportedLanguagesRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsGetSupportedLanguagesResDescriptor =
    $convert.base64Decode(
        'CiBJbnNpZ2h0c0dldFN1cHBvcnRlZExhbmd1YWdlc1JlcxIWCgZzdGF0dXMYASABKAhSBnN0YX'
        'R1cxIQCgNtc2cYAiABKAlSA21zZxI+CglsYW5ndWFnZXMYAyADKAsyIC53YWpsYy5JbnNpZ2h0'
        'c1N1cHBvcnRlZExhbmdJbmZvUglsYW5ndWFnZXM=');

@$core.Deprecated('Use insightsGetUserStatusResDescriptor instead')
const InsightsGetUserStatusRes$json = {
  '1': 'InsightsGetUserStatusRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'service_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.wajlc.InsightsServiceType',
      '10': 'serviceType'
    },
    {'1': 'is_active', '3': 4, '4': 1, '5': 8, '10': 'isActive'},
    {
      '1': 'spoken_lang',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'spokenLang',
      '17': true
    },
    {
      '1': 'allowed_transcription_storage',
      '3': 6,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'allowedTranscriptionStorage',
      '17': true
    },
  ],
  '8': [
    {'1': '_spoken_lang'},
    {'1': '_allowed_transcription_storage'},
  ],
};

/// Descriptor for `InsightsGetUserStatusRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsGetUserStatusResDescriptor = $convert.base64Decode(
    'ChhJbnNpZ2h0c0dldFVzZXJTdGF0dXNSZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSEAoDbX'
    'NnGAIgASgJUgNtc2cSPQoMc2VydmljZV90eXBlGAMgASgOMhoud2FqbGMuSW5zaWdodHNTZXJ2'
    'aWNlVHlwZVILc2VydmljZVR5cGUSGwoJaXNfYWN0aXZlGAQgASgIUghpc0FjdGl2ZRIkCgtzcG'
    '9rZW5fbGFuZxgFIAEoCUgAUgpzcG9rZW5MYW5niAEBEkcKHWFsbG93ZWRfdHJhbnNjcmlwdGlv'
    'bl9zdG9yYWdlGAYgASgISAFSG2FsbG93ZWRUcmFuc2NyaXB0aW9uU3RvcmFnZYgBAUIOCgxfc3'
    'Bva2VuX2xhbmdCIAoeX2FsbG93ZWRfdHJhbnNjcmlwdGlvbl9zdG9yYWdl');

@$core.Deprecated('Use insightsAITextChatContentDescriptor instead')
const InsightsAITextChatContent$json = {
  '1': 'InsightsAITextChatContent',
  '2': [
    {
      '1': 'role',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.wajlc.InsightsAITextChatRole',
      '10': 'role'
    },
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    {
      '1': 'stream_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'streamId',
      '17': true
    },
  ],
  '8': [
    {'1': '_stream_id'},
  ],
};

/// Descriptor for `InsightsAITextChatContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsAITextChatContentDescriptor = $convert.base64Decode(
    'ChlJbnNpZ2h0c0FJVGV4dENoYXRDb250ZW50EjEKBHJvbGUYASABKA4yHS53YWpsYy5JbnNpZ2'
    'h0c0FJVGV4dENoYXRSb2xlUgRyb2xlEhIKBHRleHQYAiABKAlSBHRleHQSIAoJc3RyZWFtX2lk'
    'GAMgASgJSABSCHN0cmVhbUlkiAEBQgwKCl9zdHJlYW1faWQ=');

@$core.Deprecated('Use insightsAITextChatStreamResultDescriptor instead')
const InsightsAITextChatStreamResult$json = {
  '1': 'InsightsAITextChatStreamResult',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    {'1': 'is_last_chunk', '3': 3, '4': 1, '5': 8, '10': 'isLastChunk'},
    {'1': 'prompt_tokens', '3': 4, '4': 1, '5': 13, '10': 'promptTokens'},
    {
      '1': 'completion_tokens',
      '3': 5,
      '4': 1,
      '5': 13,
      '10': 'completionTokens'
    },
    {'1': 'total_tokens', '3': 6, '4': 1, '5': 13, '10': 'totalTokens'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `InsightsAITextChatStreamResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsAITextChatStreamResultDescriptor = $convert.base64Decode(
    'Ch5JbnNpZ2h0c0FJVGV4dENoYXRTdHJlYW1SZXN1bHQSDgoCaWQYASABKAlSAmlkEhIKBHRleH'
    'QYAiABKAlSBHRleHQSIgoNaXNfbGFzdF9jaHVuaxgDIAEoCFILaXNMYXN0Q2h1bmsSIwoNcHJv'
    'bXB0X3Rva2VucxgEIAEoDVIMcHJvbXB0VG9rZW5zEisKEWNvbXBsZXRpb25fdG9rZW5zGAUgAS'
    'gNUhBjb21wbGV0aW9uVG9rZW5zEiEKDHRvdGFsX3Rva2VucxgGIAEoDVILdG90YWxUb2tlbnMS'
    'HQoKY3JlYXRlZF9hdBgHIAEoCVIJY3JlYXRlZEF0');

@$core.Deprecated('Use insightsAITextChatConfigReqDescriptor instead')
const InsightsAITextChatConfigReq$json = {
  '1': 'InsightsAITextChatConfigReq',
  '2': [
    {'1': 'is_enabled', '3': 1, '4': 1, '5': 8, '10': 'isEnabled'},
    {
      '1': 'is_allowed_everyone',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'isAllowedEveryone'
    },
    {'1': 'allowed_user_ids', '3': 4, '4': 3, '5': 9, '10': 'allowedUserIds'},
  ],
};

/// Descriptor for `InsightsAITextChatConfigReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsAITextChatConfigReqDescriptor =
    $convert.base64Decode(
        'ChtJbnNpZ2h0c0FJVGV4dENoYXRDb25maWdSZXESHQoKaXNfZW5hYmxlZBgBIAEoCFIJaXNFbm'
        'FibGVkEi4KE2lzX2FsbG93ZWRfZXZlcnlvbmUYAyABKAhSEWlzQWxsb3dlZEV2ZXJ5b25lEigK'
        'EGFsbG93ZWRfdXNlcl9pZHMYBCADKAlSDmFsbG93ZWRVc2VySWRz');

@$core
    .Deprecated('Use insightsAIMeetingSummarizationConfigReqDescriptor instead')
const InsightsAIMeetingSummarizationConfigReq$json = {
  '1': 'InsightsAIMeetingSummarizationConfigReq',
  '2': [
    {'1': 'is_enabled', '3': 1, '4': 1, '5': 8, '10': 'isEnabled'},
    {
      '1': 'summarization_prompt',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'summarizationPrompt'
    },
  ],
};

/// Descriptor for `InsightsAIMeetingSummarizationConfigReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsAIMeetingSummarizationConfigReqDescriptor =
    $convert.base64Decode(
        'CidJbnNpZ2h0c0FJTWVldGluZ1N1bW1hcml6YXRpb25Db25maWdSZXESHQoKaXNfZW5hYmxlZB'
        'gBIAEoCFIJaXNFbmFibGVkEjEKFHN1bW1hcml6YXRpb25fcHJvbXB0GAMgASgJUhNzdW1tYXJp'
        'emF0aW9uUHJvbXB0');
