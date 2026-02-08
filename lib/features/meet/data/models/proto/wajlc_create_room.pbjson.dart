// This is a generated file - do not edit.
//
// Generated from wajlc_create_room.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createRoomReqDescriptor instead')
const CreateRoomReq$json = {
  '1': 'CreateRoomReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'roomId'},
    {
      '1': 'empty_timeout',
      '3': 2,
      '4': 1,
      '5': 13,
      '8': {},
      '9': 0,
      '10': 'emptyTimeout',
      '17': true
    },
    {
      '1': 'max_participants',
      '3': 3,
      '4': 1,
      '5': 13,
      '8': {},
      '9': 1,
      '10': 'maxParticipants',
      '17': true
    },
    {
      '1': 'metadata',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RoomMetadata',
      '8': {},
      '10': 'metadata'
    },
  ],
  '8': [
    {'1': '_empty_timeout'},
    {'1': '_max_participants'},
  ],
};

/// Descriptor for `CreateRoomReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomReqDescriptor = $convert.base64Decode(
    'Cg1DcmVhdGVSb29tUmVxEpsBCgdyb29tX2lkGAEgASgJQoEBukh+ugF7Cg5yb29tX2lkX2Zvcm'
    '1hdBJHcm9vbV9pZCBzaG91bGQgb25seSBjb250YWluIEFTQ0lJIGxldHRlcnMgKGEteiBBLVop'
    'LCBkaWdpdHMgKDAtOSkgb3IgLV8aIHRoaXMubWF0Y2hlcygnXlthLXpBLVowLTktX10rJCcpUg'
    'Zyb29tSWQSMQoNZW1wdHlfdGltZW91dBgCIAEoDUIHukgEKgIgAEgAUgxlbXB0eVRpbWVvdXSI'
    'AQESNwoQbWF4X3BhcnRpY2lwYW50cxgDIAEoDUIHukgEKgIgAEgBUg9tYXhQYXJ0aWNpcGFudH'
    'OIAQESNwoIbWV0YWRhdGEYBCABKAsyEy53YWpsYy5Sb29tTWV0YWRhdGFCBrpIA8gBAVIIbWV0'
    'YWRhdGFCEAoOX2VtcHR5X3RpbWVvdXRCEwoRX21heF9wYXJ0aWNpcGFudHM=');

@$core.Deprecated('Use roomMetadataDescriptor instead')
const RoomMetadata$json = {
  '1': 'RoomMetadata',
  '2': [
    {'1': 'room_title', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'roomTitle'},
    {
      '1': 'welcome_message',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'welcomeMessage',
      '17': true
    },
    {'1': 'is_recording', '3': 3, '4': 1, '5': 8, '8': {}, '10': 'isRecording'},
    {
      '1': 'is_active_rtmp',
      '3': 4,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'isActiveRtmp'
    },
    {
      '1': 'parent_room_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'parentRoomId'
    },
    {
      '1': 'is_breakout_room',
      '3': 6,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'isBreakoutRoom'
    },
    {
      '1': 'webhook_url',
      '3': 7,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 1,
      '10': 'webhookUrl',
      '17': true
    },
    {'1': 'started_at', '3': 8, '4': 1, '5': 4, '8': {}, '10': 'startedAt'},
    {
      '1': 'logout_url',
      '3': 9,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 2,
      '10': 'logoutUrl',
      '17': true
    },
    {
      '1': 'room_features',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RoomCreateFeatures',
      '8': {},
      '10': 'roomFeatures'
    },
    {
      '1': 'default_lock_settings',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.wajlc.LockSettings',
      '10': 'defaultLockSettings'
    },
    {
      '1': 'copyright_conf',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.wajlc.CopyrightConf',
      '10': 'copyrightConf'
    },
    {
      '1': 'metadata_id',
      '3': 13,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 3,
      '10': 'metadataId',
      '17': true
    },
    {
      '1': 'extra_data',
      '3': 14,
      '4': 3,
      '5': 11,
      '6': '.wajlc.RoomMetadata.ExtraDataEntry',
      '10': 'extraData'
    },
  ],
  '3': [RoomMetadata_ExtraDataEntry$json],
  '8': [
    {'1': '_welcome_message'},
    {'1': '_webhook_url'},
    {'1': '_logout_url'},
    {'1': '_metadata_id'},
  ],
};

@$core.Deprecated('Use roomMetadataDescriptor instead')
const RoomMetadata_ExtraDataEntry$json = {
  '1': 'ExtraDataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RoomMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomMetadataDescriptor = $convert.base64Decode(
    'CgxSb29tTWV0YWRhdGESJQoKcm9vbV90aXRsZRgBIAEoCUIGukgDyAEBUglyb29tVGl0bGUSLA'
    'oPd2VsY29tZV9tZXNzYWdlGAIgASgJSABSDndlbGNvbWVNZXNzYWdliAEBEioKDGlzX3JlY29y'
    'ZGluZxgDIAEoCEIHukgEagIIAFILaXNSZWNvcmRpbmcSLQoOaXNfYWN0aXZlX3J0bXAYBCABKA'
    'hCB7pIBGoCCABSDGlzQWN0aXZlUnRtcBKEAQoOcGFyZW50X3Jvb21faWQYBSABKAlCXrpIW7oB'
    'WAoVcGFyZW50X3Jvb21faWRfZm9ybWF0EitwYXJlbnRfcm9vbV9pZCBzaG91bGQgbm90IGNvbn'
    'RhaW4gYW55IHZhbHVlGhJ0aGlzLm1hdGNoZXMoJ14kJylSDHBhcmVudFJvb21JZBIxChBpc19i'
    'cmVha291dF9yb29tGAYgASgIQge6SARqAggAUg5pc0JyZWFrb3V0Um9vbRIuCgt3ZWJob29rX3'
    'VybBgHIAEoCUIIukgFcgOIAQFIAVIKd2ViaG9va1VybIgBARImCgpzdGFydGVkX2F0GAggASgE'
    'Qge6SAQyAggAUglzdGFydGVkQXQSLAoKbG9nb3V0X3VybBgJIAEoCUIIukgFcgOIAQFIAlIJbG'
    '9nb3V0VXJsiAEBEkYKDXJvb21fZmVhdHVyZXMYCiABKAsyGS53YWpsYy5Sb29tQ3JlYXRlRmVh'
    'dHVyZXNCBrpIA8gBAVIMcm9vbUZlYXR1cmVzEkcKFWRlZmF1bHRfbG9ja19zZXR0aW5ncxgLIA'
    'EoCzITLndhamxjLkxvY2tTZXR0aW5nc1ITZGVmYXVsdExvY2tTZXR0aW5ncxI7Cg5jb3B5cmln'
    'aHRfY29uZhgMIAEoCzIULndhamxjLkNvcHlyaWdodENvbmZSDWNvcHlyaWdodENvbmYSfgoLbW'
    'V0YWRhdGFfaWQYDSABKAlCWLpIVboBUgoSbWV0YWRhdGFfaWRfZm9ybWF0EihtZXRhZGF0YV9p'
    'ZCBzaG91bGQgbm90IGNvbnRhaW4gYW55IHZhbHVlGhJ0aGlzLm1hdGNoZXMoJ14kJylIA1IKbW'
    'V0YWRhdGFJZIgBARJBCgpleHRyYV9kYXRhGA4gAygLMiIud2FqbGMuUm9vbU1ldGFkYXRhLkV4'
    'dHJhRGF0YUVudHJ5UglleHRyYURhdGEaPAoORXh0cmFEYXRhRW50cnkSEAoDa2V5GAEgASgJUg'
    'NrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AUISChBfd2VsY29tZV9tZXNzYWdlQg4KDF93'
    'ZWJob29rX3VybEINCgtfbG9nb3V0X3VybEIOCgxfbWV0YWRhdGFfaWQ=');

@$core.Deprecated('Use roomCreateFeaturesDescriptor instead')
const RoomCreateFeatures$json = {
  '1': 'RoomCreateFeatures',
  '2': [
    {'1': 'allow_webcams', '3': 1, '4': 1, '5': 8, '10': 'allowWebcams'},
    {'1': 'mute_on_start', '3': 2, '4': 1, '5': 8, '10': 'muteOnStart'},
    {
      '1': 'allow_screen_share',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'allowScreenShare'
    },
    {'1': 'allow_rtmp', '3': 4, '4': 1, '5': 8, '10': 'allowRtmp'},
    {
      '1': 'allow_view_other_webcams',
      '3': 5,
      '4': 1,
      '5': 8,
      '10': 'allowViewOtherWebcams'
    },
    {
      '1': 'allow_view_other_users_list',
      '3': 6,
      '4': 1,
      '5': 8,
      '10': 'allowViewOtherUsersList'
    },
    {
      '1': 'admin_only_webcams',
      '3': 7,
      '4': 1,
      '5': 8,
      '10': 'adminOnlyWebcams'
    },
    {
      '1': 'allow_polls',
      '3': 8,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '9': 0,
      '10': 'allowPolls',
      '17': true,
    },
    {
      '1': 'room_duration',
      '3': 9,
      '4': 1,
      '5': 4,
      '9': 1,
      '10': 'roomDuration',
      '17': true
    },
    {'1': 'enable_analytics', '3': 10, '4': 1, '5': 8, '10': 'enableAnalytics'},
    {
      '1': 'allow_virtual_bg',
      '3': 11,
      '4': 1,
      '5': 8,
      '9': 2,
      '10': 'allowVirtualBg',
      '17': true
    },
    {
      '1': 'allow_raise_hand',
      '3': 12,
      '4': 1,
      '5': 8,
      '9': 3,
      '10': 'allowRaiseHand',
      '17': true
    },
    {
      '1': 'auto_gen_user_id',
      '3': 13,
      '4': 1,
      '5': 8,
      '9': 4,
      '10': 'autoGenUserId',
      '17': true
    },
    {
      '1': 'recording_features',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.wajlc.RecordingFeatures',
      '10': 'recordingFeatures'
    },
    {
      '1': 'chat_features',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.wajlc.ChatFeatures',
      '10': 'chatFeatures'
    },
    {
      '1': 'shared_note_pad_features',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.wajlc.SharedNotePadFeatures',
      '10': 'sharedNotePadFeatures'
    },
    {
      '1': 'whiteboard_features',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.wajlc.WhiteboardFeatures',
      '10': 'whiteboardFeatures'
    },
    {
      '1': 'external_media_player_features',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.wajlc.ExternalMediaPlayerFeatures',
      '10': 'externalMediaPlayerFeatures'
    },
    {
      '1': 'waiting_room_features',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.wajlc.WaitingRoomFeatures',
      '10': 'waitingRoomFeatures'
    },
    {
      '1': 'breakout_room_features',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.wajlc.BreakoutRoomFeatures',
      '10': 'breakoutRoomFeatures'
    },
    {
      '1': 'display_external_link_features',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.wajlc.DisplayExternalLinkFeatures',
      '10': 'displayExternalLinkFeatures'
    },
    {
      '1': 'ingress_features',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.wajlc.IngressFeatures',
      '10': 'ingressFeatures'
    },
    {
      '1': 'speech_to_text_translation_features',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.wajlc.SpeechToTextTranslationFeatures',
      '8': {'3': true},
      '10': 'speechToTextTranslationFeatures',
    },
    {
      '1': 'end_to_end_encryption_features',
      '3': 24,
      '4': 1,
      '5': 11,
      '6': '.wajlc.EndToEndEncryptionFeatures',
      '10': 'endToEndEncryptionFeatures'
    },
    {
      '1': 'polls_features',
      '3': 25,
      '4': 1,
      '5': 11,
      '6': '.wajlc.PollsFeatures',
      '10': 'pollsFeatures'
    },
    {
      '1': 'insights_features',
      '3': 26,
      '4': 1,
      '5': 11,
      '6': '.wajlc.InsightsFeatures',
      '10': 'insightsFeatures'
    },
  ],
  '8': [
    {'1': '_allow_polls'},
    {'1': '_room_duration'},
    {'1': '_allow_virtual_bg'},
    {'1': '_allow_raise_hand'},
    {'1': '_auto_gen_user_id'},
  ],
};

/// Descriptor for `RoomCreateFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomCreateFeaturesDescriptor = $convert.base64Decode(
    'ChJSb29tQ3JlYXRlRmVhdHVyZXMSIwoNYWxsb3dfd2ViY2FtcxgBIAEoCFIMYWxsb3dXZWJjYW'
    '1zEiIKDW11dGVfb25fc3RhcnQYAiABKAhSC211dGVPblN0YXJ0EiwKEmFsbG93X3NjcmVlbl9z'
    'aGFyZRgDIAEoCFIQYWxsb3dTY3JlZW5TaGFyZRIdCgphbGxvd19ydG1wGAQgASgIUglhbGxvd1'
    'J0bXASNwoYYWxsb3dfdmlld19vdGhlcl93ZWJjYW1zGAUgASgIUhVhbGxvd1ZpZXdPdGhlcldl'
    'YmNhbXMSPAobYWxsb3dfdmlld19vdGhlcl91c2Vyc19saXN0GAYgASgIUhdhbGxvd1ZpZXdPdG'
    'hlclVzZXJzTGlzdBIsChJhZG1pbl9vbmx5X3dlYmNhbXMYByABKAhSEGFkbWluT25seVdlYmNh'
    'bXMSKAoLYWxsb3dfcG9sbHMYCCABKAhCAhgBSABSCmFsbG93UG9sbHOIAQESKAoNcm9vbV9kdX'
    'JhdGlvbhgJIAEoBEgBUgxyb29tRHVyYXRpb26IAQESKQoQZW5hYmxlX2FuYWx5dGljcxgKIAEo'
    'CFIPZW5hYmxlQW5hbHl0aWNzEi0KEGFsbG93X3ZpcnR1YWxfYmcYCyABKAhIAlIOYWxsb3dWaX'
    'J0dWFsQmeIAQESLQoQYWxsb3dfcmFpc2VfaGFuZBgMIAEoCEgDUg5hbGxvd1JhaXNlSGFuZIgB'
    'ARIsChBhdXRvX2dlbl91c2VyX2lkGA0gASgISARSDWF1dG9HZW5Vc2VySWSIAQESRwoScmVjb3'
    'JkaW5nX2ZlYXR1cmVzGA4gASgLMhgud2FqbGMuUmVjb3JkaW5nRmVhdHVyZXNSEXJlY29yZGlu'
    'Z0ZlYXR1cmVzEjgKDWNoYXRfZmVhdHVyZXMYDyABKAsyEy53YWpsYy5DaGF0RmVhdHVyZXNSDG'
    'NoYXRGZWF0dXJlcxJVChhzaGFyZWRfbm90ZV9wYWRfZmVhdHVyZXMYECABKAsyHC53YWpsYy5T'
    'aGFyZWROb3RlUGFkRmVhdHVyZXNSFXNoYXJlZE5vdGVQYWRGZWF0dXJlcxJKChN3aGl0ZWJvYX'
    'JkX2ZlYXR1cmVzGBEgASgLMhkud2FqbGMuV2hpdGVib2FyZEZlYXR1cmVzUhJ3aGl0ZWJvYXJk'
    'RmVhdHVyZXMSZwoeZXh0ZXJuYWxfbWVkaWFfcGxheWVyX2ZlYXR1cmVzGBIgASgLMiIud2FqbG'
    'MuRXh0ZXJuYWxNZWRpYVBsYXllckZlYXR1cmVzUhtleHRlcm5hbE1lZGlhUGxheWVyRmVhdHVy'
    'ZXMSTgoVd2FpdGluZ19yb29tX2ZlYXR1cmVzGBMgASgLMhoud2FqbGMuV2FpdGluZ1Jvb21GZW'
    'F0dXJlc1ITd2FpdGluZ1Jvb21GZWF0dXJlcxJRChZicmVha291dF9yb29tX2ZlYXR1cmVzGBQg'
    'ASgLMhsud2FqbGMuQnJlYWtvdXRSb29tRmVhdHVyZXNSFGJyZWFrb3V0Um9vbUZlYXR1cmVzEm'
    'cKHmRpc3BsYXlfZXh0ZXJuYWxfbGlua19mZWF0dXJlcxgVIAEoCzIiLndhamxjLkRpc3BsYXlF'
    'eHRlcm5hbExpbmtGZWF0dXJlc1IbZGlzcGxheUV4dGVybmFsTGlua0ZlYXR1cmVzEkEKEGluZ3'
    'Jlc3NfZmVhdHVyZXMYFiABKAsyFi53YWpsYy5JbmdyZXNzRmVhdHVyZXNSD2luZ3Jlc3NGZWF0'
    'dXJlcxJ4CiNzcGVlY2hfdG9fdGV4dF90cmFuc2xhdGlvbl9mZWF0dXJlcxgXIAEoCzImLndham'
    'xjLlNwZWVjaFRvVGV4dFRyYW5zbGF0aW9uRmVhdHVyZXNCAhgBUh9zcGVlY2hUb1RleHRUcmFu'
    'c2xhdGlvbkZlYXR1cmVzEmUKHmVuZF90b19lbmRfZW5jcnlwdGlvbl9mZWF0dXJlcxgYIAEoCz'
    'IhLndhamxjLkVuZFRvRW5kRW5jcnlwdGlvbkZlYXR1cmVzUhplbmRUb0VuZEVuY3J5cHRpb25G'
    'ZWF0dXJlcxI7Cg5wb2xsc19mZWF0dXJlcxgZIAEoCzIULndhamxjLlBvbGxzRmVhdHVyZXNSDX'
    'BvbGxzRmVhdHVyZXMSRAoRaW5zaWdodHNfZmVhdHVyZXMYGiABKAsyFy53YWpsYy5JbnNpZ2h0'
    'c0ZlYXR1cmVzUhBpbnNpZ2h0c0ZlYXR1cmVzQg4KDF9hbGxvd19wb2xsc0IQCg5fcm9vbV9kdX'
    'JhdGlvbkITChFfYWxsb3dfdmlydHVhbF9iZ0ITChFfYWxsb3dfcmFpc2VfaGFuZEITChFfYXV0'
    'b19nZW5fdXNlcl9pZA==');

@$core.Deprecated('Use chatFeaturesDescriptor instead')
const ChatFeatures$json = {
  '1': 'ChatFeatures',
  '2': [
    {
      '1': 'allow_chat',
      '3': 1,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '9': 0,
      '10': 'allowChat',
      '17': true,
    },
    {
      '1': 'allow_file_upload',
      '3': 2,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '9': 1,
      '10': 'allowFileUpload',
      '17': true,
    },
    {'1': 'is_allow', '3': 5, '4': 1, '5': 8, '10': 'isAllow'},
    {
      '1': 'is_allow_file_upload',
      '3': 6,
      '4': 1,
      '5': 8,
      '10': 'isAllowFileUpload'
    },
    {
      '1': 'allowed_file_types',
      '3': 3,
      '4': 3,
      '5': 9,
      '10': 'allowedFileTypes'
    },
    {
      '1': 'max_file_size',
      '3': 4,
      '4': 1,
      '5': 4,
      '9': 2,
      '10': 'maxFileSize',
      '17': true
    },
  ],
  '8': [
    {'1': '_allow_chat'},
    {'1': '_allow_file_upload'},
    {'1': '_max_file_size'},
  ],
};

/// Descriptor for `ChatFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatFeaturesDescriptor = $convert.base64Decode(
    'CgxDaGF0RmVhdHVyZXMSJgoKYWxsb3dfY2hhdBgBIAEoCEICGAFIAFIJYWxsb3dDaGF0iAEBEj'
    'MKEWFsbG93X2ZpbGVfdXBsb2FkGAIgASgIQgIYAUgBUg9hbGxvd0ZpbGVVcGxvYWSIAQESGQoI'
    'aXNfYWxsb3cYBSABKAhSB2lzQWxsb3cSLwoUaXNfYWxsb3dfZmlsZV91cGxvYWQYBiABKAhSEW'
    'lzQWxsb3dGaWxlVXBsb2FkEiwKEmFsbG93ZWRfZmlsZV90eXBlcxgDIAMoCVIQYWxsb3dlZEZp'
    'bGVUeXBlcxInCg1tYXhfZmlsZV9zaXplGAQgASgESAJSC21heEZpbGVTaXpliAEBQg0KC19hbG'
    'xvd19jaGF0QhQKEl9hbGxvd19maWxlX3VwbG9hZEIQCg5fbWF4X2ZpbGVfc2l6ZQ==');

@$core.Deprecated('Use sharedNotePadFeaturesDescriptor instead')
const SharedNotePadFeatures$json = {
  '1': 'SharedNotePadFeatures',
  '2': [
    {
      '1': 'allowed_shared_note_pad',
      '3': 1,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '9': 0,
      '10': 'allowedSharedNotePad',
      '17': true,
    },
    {'1': 'is_allow', '3': 8, '4': 1, '5': 8, '10': 'isAllow'},
    {'1': 'is_active', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'isActive'},
    {'1': 'visible', '3': 3, '4': 1, '5': 8, '8': {}, '10': 'visible'},
    {'1': 'node_id', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'nodeId'},
    {'1': 'host', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'host'},
    {'1': 'note_pad_id', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'notePadId'},
    {
      '1': 'read_only_pad_id',
      '3': 7,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'readOnlyPadId'
    },
  ],
  '8': [
    {'1': '_allowed_shared_note_pad'},
  ],
};

/// Descriptor for `SharedNotePadFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sharedNotePadFeaturesDescriptor = $convert.base64Decode(
    'ChVTaGFyZWROb3RlUGFkRmVhdHVyZXMSPgoXYWxsb3dlZF9zaGFyZWRfbm90ZV9wYWQYASABKA'
    'hCAhgBSABSFGFsbG93ZWRTaGFyZWROb3RlUGFkiAEBEhkKCGlzX2FsbG93GAggASgIUgdpc0Fs'
    'bG93EiQKCWlzX2FjdGl2ZRgCIAEoCEIHukgEagIIAFIIaXNBY3RpdmUSIQoHdmlzaWJsZRgDIA'
    'EoCEIHukgEagIIAFIHdmlzaWJsZRJpCgdub2RlX2lkGAQgASgJQlC6SE26AUoKDm5vZGVfaWRf'
    'Zm9ybWF0EiRub2RlX2lkIHNob3VsZCBub3QgY29udGFpbiBhbnkgdmFsdWUaEnRoaXMubWF0Y2'
    'hlcygnXiQnKVIGbm9kZUlkEl4KBGhvc3QYBSABKAlCSrpIR7oBRAoLaG9zdF9mb3JtYXQSIWhv'
    'c3Qgc2hvdWxkIG5vdCBjb250YWluIGFueSB2YWx1ZRoSdGhpcy5tYXRjaGVzKCdeJCcpUgRob3'
    'N0EngKC25vdGVfcGFkX2lkGAYgASgJQli6SFW6AVIKEm5vdGVfcGFkX2lkX2Zvcm1hdBIobm90'
    'ZV9wYWRfaWQgc2hvdWxkIG5vdCBjb250YWluIGFueSB2YWx1ZRoSdGhpcy5tYXRjaGVzKCdeJC'
    'cpUglub3RlUGFkSWQSiwEKEHJlYWRfb25seV9wYWRfaWQYByABKAlCYrpIX7oBXAoXcmVhZF9v'
    'bmx5X3BhZF9pZF9mb3JtYXQSLXJlYWRfb25seV9wYWRfaWQgc2hvdWxkIG5vdCBjb250YWluIG'
    'FueSB2YWx1ZRoSdGhpcy5tYXRjaGVzKCdeJCcpUg1yZWFkT25seVBhZElkQhoKGF9hbGxvd2Vk'
    'X3NoYXJlZF9ub3RlX3BhZA==');

@$core.Deprecated('Use whiteboardFeaturesDescriptor instead')
const WhiteboardFeatures$json = {
  '1': 'WhiteboardFeatures',
  '2': [
    {
      '1': 'allowed_whiteboard',
      '3': 1,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '9': 0,
      '10': 'allowedWhiteboard',
      '17': true,
    },
    {'1': 'is_allow', '3': 9, '4': 1, '5': 8, '10': 'isAllow'},
    {'1': 'visible', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'visible'},
    {
      '1': 'preload_file',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 1,
      '10': 'preloadFile',
      '17': true
    },
    {
      '1': 'whiteboard_file_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'whiteboardFileId'
    },
    {'1': 'file_name', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'fileName'},
    {'1': 'file_path', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'filePath'},
    {'1': 'total_pages', '3': 7, '4': 1, '5': 13, '10': 'totalPages'},
    {
      '1': 'max_allowed_file_size',
      '3': 8,
      '4': 1,
      '5': 4,
      '8': {},
      '9': 2,
      '10': 'maxAllowedFileSize',
      '17': true
    },
  ],
  '8': [
    {'1': '_allowed_whiteboard'},
    {'1': '_preload_file'},
    {'1': '_max_allowed_file_size'},
  ],
};

/// Descriptor for `WhiteboardFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List whiteboardFeaturesDescriptor = $convert.base64Decode(
    'ChJXaGl0ZWJvYXJkRmVhdHVyZXMSNgoSYWxsb3dlZF93aGl0ZWJvYXJkGAEgASgIQgIYAUgAUh'
    'FhbGxvd2VkV2hpdGVib2FyZIgBARIZCghpc19hbGxvdxgJIAEoCFIHaXNBbGxvdxIhCgd2aXNp'
    'YmxlGAIgASgIQge6SARqAggAUgd2aXNpYmxlEjAKDHByZWxvYWRfZmlsZRgDIAEoCUIIukgFcg'
    'OIAQFIAVILcHJlbG9hZEZpbGWIAQESlAEKEndoaXRlYm9hcmRfZmlsZV9pZBgEIAEoCUJmukhj'
    'ugFgChl3aGl0ZWJvYXJkX2ZpbGVfaWRfZm9ybWF0Ei93aGl0ZWJvYXJkX2ZpbGVfaWQgc2hvdW'
    'xkIG5vdCBjb250YWluIGFueSB2YWx1ZRoSdGhpcy5tYXRjaGVzKCdeJCcpUhB3aGl0ZWJvYXJk'
    'RmlsZUlkEnEKCWZpbGVfbmFtZRgFIAEoCUJUukhRugFOChBmaWxlX25hbWVfZm9ybWF0EiZmaW'
    'xlX25hbWUgc2hvdWxkIG5vdCBjb250YWluIGFueSB2YWx1ZRoSdGhpcy5tYXRjaGVzKCdeJCcp'
    'UghmaWxlTmFtZRJxCglmaWxlX3BhdGgYBiABKAlCVLpIUboBTgoQZmlsZV9wYXRoX2Zvcm1hdB'
    'ImZmlsZV9wYXRoIHNob3VsZCBub3QgY29udGFpbiBhbnkgdmFsdWUaEnRoaXMubWF0Y2hlcygn'
    'XiQnKVIIZmlsZVBhdGgSHwoLdG90YWxfcGFnZXMYByABKA1SCnRvdGFsUGFnZXMSPwoVbWF4X2'
    'FsbG93ZWRfZmlsZV9zaXplGAggASgEQge6SAQyAggASAJSEm1heEFsbG93ZWRGaWxlU2l6ZYgB'
    'AUIVChNfYWxsb3dlZF93aGl0ZWJvYXJkQg8KDV9wcmVsb2FkX2ZpbGVCGAoWX21heF9hbGxvd2'
    'VkX2ZpbGVfc2l6ZQ==');

@$core.Deprecated('Use externalMediaPlayerFeaturesDescriptor instead')
const ExternalMediaPlayerFeatures$json = {
  '1': 'ExternalMediaPlayerFeatures',
  '2': [
    {
      '1': 'allowed_external_media_player',
      '3': 1,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '9': 0,
      '10': 'allowedExternalMediaPlayer',
      '17': true,
    },
    {'1': 'is_allow', '3': 5, '4': 1, '5': 8, '10': 'isAllow'},
    {'1': 'is_active', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'isActive'},
    {
      '1': 'shared_by',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 1,
      '10': 'sharedBy',
      '17': true
    },
    {
      '1': 'url',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 2,
      '10': 'url',
      '17': true
    },
  ],
  '8': [
    {'1': '_allowed_external_media_player'},
    {'1': '_shared_by'},
    {'1': '_url'},
  ],
};

/// Descriptor for `ExternalMediaPlayerFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List externalMediaPlayerFeaturesDescriptor = $convert.base64Decode(
    'ChtFeHRlcm5hbE1lZGlhUGxheWVyRmVhdHVyZXMSSgodYWxsb3dlZF9leHRlcm5hbF9tZWRpYV'
    '9wbGF5ZXIYASABKAhCAhgBSABSGmFsbG93ZWRFeHRlcm5hbE1lZGlhUGxheWVyiAEBEhkKCGlz'
    'X2FsbG93GAUgASgIUgdpc0FsbG93EiQKCWlzX2FjdGl2ZRgCIAEoCEIHukgEagIIAFIIaXNBY3'
    'RpdmUSdgoJc2hhcmVkX2J5GAMgASgJQlS6SFG6AU4KEHNoYXJlZF9ieV9mb3JtYXQSJnNoYXJl'
    'ZF9ieSBzaG91bGQgbm90IGNvbnRhaW4gYW55IHZhbHVlGhJ0aGlzLm1hdGNoZXMoJ14kJylIAV'
    'IIc2hhcmVkQnmIAQESXwoDdXJsGAQgASgJQki6SEW6AUIKCnVybF9mb3JtYXQSIHVybCBzaG91'
    'bGQgbm90IGNvbnRhaW4gYW55IHZhbHVlGhJ0aGlzLm1hdGNoZXMoJ14kJylIAlIDdXJsiAEBQi'
    'AKHl9hbGxvd2VkX2V4dGVybmFsX21lZGlhX3BsYXllckIMCgpfc2hhcmVkX2J5QgYKBF91cmw=');

@$core.Deprecated('Use waitingRoomFeaturesDescriptor instead')
const WaitingRoomFeatures$json = {
  '1': 'WaitingRoomFeatures',
  '2': [
    {'1': 'is_active', '3': 1, '4': 1, '5': 8, '10': 'isActive'},
    {'1': 'waiting_room_msg', '3': 2, '4': 1, '5': 9, '10': 'waitingRoomMsg'},
  ],
};

/// Descriptor for `WaitingRoomFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List waitingRoomFeaturesDescriptor = $convert.base64Decode(
    'ChNXYWl0aW5nUm9vbUZlYXR1cmVzEhsKCWlzX2FjdGl2ZRgBIAEoCFIIaXNBY3RpdmUSKAoQd2'
    'FpdGluZ19yb29tX21zZxgCIAEoCVIOd2FpdGluZ1Jvb21Nc2c=');

@$core.Deprecated('Use breakoutRoomFeaturesDescriptor instead')
const BreakoutRoomFeatures$json = {
  '1': 'BreakoutRoomFeatures',
  '2': [
    {'1': 'is_allow', '3': 1, '4': 1, '5': 8, '10': 'isAllow'},
    {'1': 'is_active', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'isActive'},
    {
      '1': 'allowed_number_rooms',
      '3': 3,
      '4': 1,
      '5': 13,
      '10': 'allowedNumberRooms'
    },
  ],
};

/// Descriptor for `BreakoutRoomFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List breakoutRoomFeaturesDescriptor = $convert.base64Decode(
    'ChRCcmVha291dFJvb21GZWF0dXJlcxIZCghpc19hbGxvdxgBIAEoCFIHaXNBbGxvdxIkCglpc1'
    '9hY3RpdmUYAiABKAhCB7pIBGoCCABSCGlzQWN0aXZlEjAKFGFsbG93ZWRfbnVtYmVyX3Jvb21z'
    'GAMgASgNUhJhbGxvd2VkTnVtYmVyUm9vbXM=');

@$core.Deprecated('Use displayExternalLinkFeaturesDescriptor instead')
const DisplayExternalLinkFeatures$json = {
  '1': 'DisplayExternalLinkFeatures',
  '2': [
    {'1': 'is_allow', '3': 1, '4': 1, '5': 8, '10': 'isAllow'},
    {'1': 'is_active', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'isActive'},
    {'1': 'link', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'link', '17': true},
    {
      '1': 'shared_by',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'sharedBy',
      '17': true
    },
  ],
  '8': [
    {'1': '_link'},
    {'1': '_shared_by'},
  ],
};

/// Descriptor for `DisplayExternalLinkFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List displayExternalLinkFeaturesDescriptor = $convert.base64Decode(
    'ChtEaXNwbGF5RXh0ZXJuYWxMaW5rRmVhdHVyZXMSGQoIaXNfYWxsb3cYASABKAhSB2lzQWxsb3'
    'cSJAoJaXNfYWN0aXZlGAIgASgIQge6SARqAggAUghpc0FjdGl2ZRIXCgRsaW5rGAMgASgJSABS'
    'BGxpbmuIAQESIAoJc2hhcmVkX2J5GAQgASgJSAFSCHNoYXJlZEJ5iAEBQgcKBV9saW5rQgwKCl'
    '9zaGFyZWRfYnk=');

@$core.Deprecated('Use recordingFeaturesDescriptor instead')
const RecordingFeatures$json = {
  '1': 'RecordingFeatures',
  '2': [
    {'1': 'is_allow', '3': 1, '4': 1, '5': 8, '10': 'isAllow'},
    {'1': 'is_allow_cloud', '3': 2, '4': 1, '5': 8, '10': 'isAllowCloud'},
    {
      '1': 'enable_auto_cloud_recording',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'enableAutoCloudRecording'
    },
    {'1': 'is_allow_local', '3': 4, '4': 1, '5': 8, '10': 'isAllowLocal'},
    {
      '1': 'only_record_admin_webcams',
      '3': 5,
      '4': 1,
      '5': 8,
      '10': 'onlyRecordAdminWebcams'
    },
  ],
};

/// Descriptor for `RecordingFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordingFeaturesDescriptor = $convert.base64Decode(
    'ChFSZWNvcmRpbmdGZWF0dXJlcxIZCghpc19hbGxvdxgBIAEoCFIHaXNBbGxvdxIkCg5pc19hbG'
    'xvd19jbG91ZBgCIAEoCFIMaXNBbGxvd0Nsb3VkEj0KG2VuYWJsZV9hdXRvX2Nsb3VkX3JlY29y'
    'ZGluZxgDIAEoCFIYZW5hYmxlQXV0b0Nsb3VkUmVjb3JkaW5nEiQKDmlzX2FsbG93X2xvY2FsGA'
    'QgASgIUgxpc0FsbG93TG9jYWwSOQoZb25seV9yZWNvcmRfYWRtaW5fd2ViY2FtcxgFIAEoCFIW'
    'b25seVJlY29yZEFkbWluV2ViY2Ftcw==');

@$core.Deprecated('Use ingressFeaturesDescriptor instead')
const IngressFeatures$json = {
  '1': 'IngressFeatures',
  '2': [
    {'1': 'is_allow', '3': 1, '4': 1, '5': 8, '10': 'isAllow'},
    {
      '1': 'input_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.wajlc.IngressInput',
      '10': 'inputType'
    },
    {'1': 'url', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'url'},
    {'1': 'stream_key', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'streamKey'},
  ],
};

/// Descriptor for `IngressFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingressFeaturesDescriptor = $convert.base64Decode(
    'Cg9JbmdyZXNzRmVhdHVyZXMSGQoIaXNfYWxsb3cYASABKAhSB2lzQWxsb3cSMgoKaW5wdXRfdH'
    'lwZRgCIAEoDjITLndhamxjLkluZ3Jlc3NJbnB1dFIJaW5wdXRUeXBlEloKA3VybBgDIAEoCUJI'
    'ukhFugFCCgp1cmxfZm9ybWF0EiB1cmwgc2hvdWxkIG5vdCBjb250YWluIGFueSB2YWx1ZRoSdG'
    'hpcy5tYXRjaGVzKCdeJCcpUgN1cmwSdQoKc3RyZWFtX2tleRgEIAEoCUJWukhTugFQChFzdHJl'
    'YW1fa2V5X2Zvcm1hdBInc3RyZWFtX2tleSBzaG91bGQgbm90IGNvbnRhaW4gYW55IHZhbHVlGh'
    'J0aGlzLm1hdGNoZXMoJ14kJylSCXN0cmVhbUtleQ==');

@$core.Deprecated('Use speechToTextTranslationFeaturesDescriptor instead')
const SpeechToTextTranslationFeatures$json = {
  '1': 'SpeechToTextTranslationFeatures',
  '2': [
    {'1': 'is_allow', '3': 1, '4': 1, '5': 8, '10': 'isAllow'},
    {
      '1': 'is_allow_translation',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'isAllowTranslation'
    },
    {'1': 'is_enabled', '3': 3, '4': 1, '5': 8, '8': {}, '10': 'isEnabled'},
    {
      '1': 'is_enabled_translation',
      '3': 4,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'isEnabledTranslation'
    },
    {
      '1': 'max_num_tran_langs_allow_selecting',
      '3': 11,
      '4': 1,
      '5': 5,
      '10': 'maxNumTranLangsAllowSelecting'
    },
    {
      '1': 'allowed_speech_langs',
      '3': 7,
      '4': 3,
      '5': 9,
      '8': {},
      '10': 'allowedSpeechLangs'
    },
    {
      '1': 'allowed_speech_users',
      '3': 8,
      '4': 3,
      '5': 9,
      '8': {},
      '10': 'allowedSpeechUsers'
    },
    {
      '1': 'allowed_trans_langs',
      '3': 9,
      '4': 3,
      '5': 9,
      '8': {},
      '10': 'allowedTransLangs'
    },
    {
      '1': 'default_subtitle_lang',
      '3': 10,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'defaultSubtitleLang',
      '17': true
    },
  ],
  '8': [
    {'1': '_default_subtitle_lang'},
  ],
};

/// Descriptor for `SpeechToTextTranslationFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speechToTextTranslationFeaturesDescriptor = $convert.base64Decode(
    'Ch9TcGVlY2hUb1RleHRUcmFuc2xhdGlvbkZlYXR1cmVzEhkKCGlzX2FsbG93GAEgASgIUgdpc0'
    'FsbG93EjAKFGlzX2FsbG93X3RyYW5zbGF0aW9uGAIgASgIUhJpc0FsbG93VHJhbnNsYXRpb24S'
    'JgoKaXNfZW5hYmxlZBgDIAEoCEIHukgEagIIAFIJaXNFbmFibGVkEj0KFmlzX2VuYWJsZWRfdH'
    'JhbnNsYXRpb24YBCABKAhCB7pIBGoCCABSFGlzRW5hYmxlZFRyYW5zbGF0aW9uEkkKIm1heF9u'
    'dW1fdHJhbl9sYW5nc19hbGxvd19zZWxlY3RpbmcYCyABKAVSHW1heE51bVRyYW5MYW5nc0FsbG'
    '93U2VsZWN0aW5nEjoKFGFsbG93ZWRfc3BlZWNoX2xhbmdzGAcgAygJQgi6SAWSAQIQAFISYWxs'
    'b3dlZFNwZWVjaExhbmdzEjoKFGFsbG93ZWRfc3BlZWNoX3VzZXJzGAggAygJQgi6SAWSAQIQAF'
    'ISYWxsb3dlZFNwZWVjaFVzZXJzEjgKE2FsbG93ZWRfdHJhbnNfbGFuZ3MYCSADKAlCCLpIBZIB'
    'AhAAUhFhbGxvd2VkVHJhbnNMYW5ncxKlAQoVZGVmYXVsdF9zdWJ0aXRsZV9sYW5nGAogASgJQm'
    'y6SGm6AWYKHGRlZmF1bHRfc3VidGl0bGVfbGFuZ19mb3JtYXQSMmRlZmF1bHRfc3VidGl0bGVf'
    'bGFuZyBzaG91bGQgbm90IGNvbnRhaW4gYW55IHZhbHVlGhJ0aGlzLm1hdGNoZXMoJ14kJylIAF'
    'ITZGVmYXVsdFN1YnRpdGxlTGFuZ4gBAUIYChZfZGVmYXVsdF9zdWJ0aXRsZV9sYW5n');

@$core.Deprecated('Use endToEndEncryptionFeaturesDescriptor instead')
const EndToEndEncryptionFeatures$json = {
  '1': 'EndToEndEncryptionFeatures',
  '2': [
    {'1': 'is_enabled', '3': 1, '4': 1, '5': 8, '10': 'isEnabled'},
    {
      '1': 'included_chat_messages',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'includedChatMessages'
    },
    {
      '1': 'included_whiteboard',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'includedWhiteboard'
    },
    {
      '1': 'enabled_self_insert_encryption_key',
      '3': 5,
      '4': 1,
      '5': 8,
      '10': 'enabledSelfInsertEncryptionKey'
    },
    {
      '1': 'encryption_key',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'encryptionKey',
      '17': true
    },
  ],
  '8': [
    {'1': '_encryption_key'},
  ],
};

/// Descriptor for `EndToEndEncryptionFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endToEndEncryptionFeaturesDescriptor = $convert.base64Decode(
    'ChpFbmRUb0VuZEVuY3J5cHRpb25GZWF0dXJlcxIdCgppc19lbmFibGVkGAEgASgIUglpc0VuYW'
    'JsZWQSNAoWaW5jbHVkZWRfY2hhdF9tZXNzYWdlcxgCIAEoCFIUaW5jbHVkZWRDaGF0TWVzc2Fn'
    'ZXMSLwoTaW5jbHVkZWRfd2hpdGVib2FyZBgDIAEoCFISaW5jbHVkZWRXaGl0ZWJvYXJkEkoKIm'
    'VuYWJsZWRfc2VsZl9pbnNlcnRfZW5jcnlwdGlvbl9rZXkYBSABKAhSHmVuYWJsZWRTZWxmSW5z'
    'ZXJ0RW5jcnlwdGlvbktleRKKAQoOZW5jcnlwdGlvbl9rZXkYBCABKAlCXrpIW7oBWAoVZW5jcn'
    'lwdGlvbl9rZXlfZm9ybWF0EitlbmNyeXB0aW9uX2tleSBzaG91bGQgbm90IGNvbnRhaW4gYW55'
    'IHZhbHVlGhJ0aGlzLm1hdGNoZXMoJ14kJylIAFINZW5jcnlwdGlvbktleYgBAUIRCg9fZW5jcn'
    'lwdGlvbl9rZXk=');

@$core.Deprecated('Use pollsFeaturesDescriptor instead')
const PollsFeatures$json = {
  '1': 'PollsFeatures',
  '2': [
    {'1': 'is_allow', '3': 1, '4': 1, '5': 8, '10': 'isAllow'},
    {'1': 'is_active', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'isActive'},
  ],
};

/// Descriptor for `PollsFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pollsFeaturesDescriptor = $convert.base64Decode(
    'Cg1Qb2xsc0ZlYXR1cmVzEhkKCGlzX2FsbG93GAEgASgIUgdpc0FsbG93EiQKCWlzX2FjdGl2ZR'
    'gCIAEoCEIHukgEagIIAFIIaXNBY3RpdmU=');

@$core.Deprecated('Use insightsFeaturesDescriptor instead')
const InsightsFeatures$json = {
  '1': 'InsightsFeatures',
  '2': [
    {'1': 'is_allow', '3': 1, '4': 1, '5': 8, '10': 'isAllow'},
    {
      '1': 'transcription_features',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.wajlc.InsightsTranscriptionFeatures',
      '9': 0,
      '10': 'transcriptionFeatures',
      '17': true
    },
    {
      '1': 'chat_translation_features',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.InsightsChatTranslationFeatures',
      '9': 1,
      '10': 'chatTranslationFeatures',
      '17': true
    },
    {
      '1': 'ai_features',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.wajlc.InsightsAIFeatures',
      '9': 2,
      '10': 'aiFeatures',
      '17': true
    },
  ],
  '8': [
    {'1': '_transcription_features'},
    {'1': '_chat_translation_features'},
    {'1': '_ai_features'},
  ],
};

/// Descriptor for `InsightsFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsFeaturesDescriptor = $convert.base64Decode(
    'ChBJbnNpZ2h0c0ZlYXR1cmVzEhkKCGlzX2FsbG93GAEgASgIUgdpc0FsbG93EmAKFnRyYW5zY3'
    'JpcHRpb25fZmVhdHVyZXMYAiABKAsyJC53YWpsYy5JbnNpZ2h0c1RyYW5zY3JpcHRpb25GZWF0'
    'dXJlc0gAUhV0cmFuc2NyaXB0aW9uRmVhdHVyZXOIAQESZwoZY2hhdF90cmFuc2xhdGlvbl9mZW'
    'F0dXJlcxgDIAEoCzImLndhamxjLkluc2lnaHRzQ2hhdFRyYW5zbGF0aW9uRmVhdHVyZXNIAVIX'
    'Y2hhdFRyYW5zbGF0aW9uRmVhdHVyZXOIAQESPwoLYWlfZmVhdHVyZXMYBCABKAsyGS53YWpsYy'
    '5JbnNpZ2h0c0FJRmVhdHVyZXNIAlIKYWlGZWF0dXJlc4gBAUIZChdfdHJhbnNjcmlwdGlvbl9m'
    'ZWF0dXJlc0IcChpfY2hhdF90cmFuc2xhdGlvbl9mZWF0dXJlc0IOCgxfYWlfZmVhdHVyZXM=');

@$core.Deprecated('Use insightsTranscriptionFeaturesDescriptor instead')
const InsightsTranscriptionFeatures$json = {
  '1': 'InsightsTranscriptionFeatures',
  '2': [
    {'1': 'is_allow', '3': 1, '4': 1, '5': 8, '10': 'isAllow'},
    {
      '1': 'is_allow_translation',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'isAllowTranslation'
    },
    {
      '1': 'is_allow_speech_synthesis',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'isAllowSpeechSynthesis'
    },
    {'1': 'is_enabled', '3': 4, '4': 1, '5': 8, '8': {}, '10': 'isEnabled'},
    {
      '1': 'allowed_spoken_langs',
      '3': 5,
      '4': 3,
      '5': 9,
      '8': {},
      '10': 'allowedSpokenLangs'
    },
    {
      '1': 'allowed_speech_users',
      '3': 6,
      '4': 3,
      '5': 9,
      '8': {},
      '10': 'allowedSpeechUsers'
    },
    {
      '1': 'is_enabled_translation',
      '3': 7,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'isEnabledTranslation'
    },
    {
      '1': 'max_selected_trans_langs',
      '3': 8,
      '4': 1,
      '5': 5,
      '8': {},
      '10': 'maxSelectedTransLangs'
    },
    {
      '1': 'allowed_trans_langs',
      '3': 9,
      '4': 3,
      '5': 9,
      '8': {},
      '10': 'allowedTransLangs'
    },
    {
      '1': 'default_subtitle_lang',
      '3': 10,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'defaultSubtitleLang',
      '17': true
    },
    {
      '1': 'is_enabled_speech_synthesis',
      '3': 11,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'isEnabledSpeechSynthesis'
    },
  ],
  '8': [
    {'1': '_default_subtitle_lang'},
  ],
};

/// Descriptor for `InsightsTranscriptionFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsTranscriptionFeaturesDescriptor = $convert.base64Decode(
    'Ch1JbnNpZ2h0c1RyYW5zY3JpcHRpb25GZWF0dXJlcxIZCghpc19hbGxvdxgBIAEoCFIHaXNBbG'
    'xvdxIwChRpc19hbGxvd190cmFuc2xhdGlvbhgCIAEoCFISaXNBbGxvd1RyYW5zbGF0aW9uEjkK'
    'GWlzX2FsbG93X3NwZWVjaF9zeW50aGVzaXMYAyABKAhSFmlzQWxsb3dTcGVlY2hTeW50aGVzaX'
    'MSJgoKaXNfZW5hYmxlZBgEIAEoCEIHukgEagIIAFIJaXNFbmFibGVkEjoKFGFsbG93ZWRfc3Bv'
    'a2VuX2xhbmdzGAUgAygJQgi6SAWSAQIQAFISYWxsb3dlZFNwb2tlbkxhbmdzEjoKFGFsbG93ZW'
    'Rfc3BlZWNoX3VzZXJzGAYgAygJQgi6SAWSAQIQAFISYWxsb3dlZFNwZWVjaFVzZXJzEj0KFmlz'
    'X2VuYWJsZWRfdHJhbnNsYXRpb24YByABKAhCB7pIBGoCCABSFGlzRW5hYmxlZFRyYW5zbGF0aW'
    '9uEkAKGG1heF9zZWxlY3RlZF90cmFuc19sYW5ncxgIIAEoBUIHukgEGgIIAFIVbWF4U2VsZWN0'
    'ZWRUcmFuc0xhbmdzEjgKE2FsbG93ZWRfdHJhbnNfbGFuZ3MYCSADKAlCCLpIBZIBAhAAUhFhbG'
    'xvd2VkVHJhbnNMYW5ncxKlAQoVZGVmYXVsdF9zdWJ0aXRsZV9sYW5nGAogASgJQmy6SGm6AWYK'
    'HGRlZmF1bHRfc3VidGl0bGVfbGFuZ19mb3JtYXQSMmRlZmF1bHRfc3VidGl0bGVfbGFuZyBzaG'
    '91bGQgbm90IGNvbnRhaW4gYW55IHZhbHVlGhJ0aGlzLm1hdGNoZXMoJ14kJylIAFITZGVmYXVs'
    'dFN1YnRpdGxlTGFuZ4gBARJGChtpc19lbmFibGVkX3NwZWVjaF9zeW50aGVzaXMYCyABKAhCB7'
    'pIBGoCCABSGGlzRW5hYmxlZFNwZWVjaFN5bnRoZXNpc0IYChZfZGVmYXVsdF9zdWJ0aXRsZV9s'
    'YW5n');

@$core.Deprecated('Use insightsChatTranslationFeaturesDescriptor instead')
const InsightsChatTranslationFeatures$json = {
  '1': 'InsightsChatTranslationFeatures',
  '2': [
    {'1': 'is_allow', '3': 1, '4': 1, '5': 8, '10': 'isAllow'},
    {'1': 'is_enabled', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'isEnabled'},
    {
      '1': 'allowed_trans_langs',
      '3': 3,
      '4': 3,
      '5': 9,
      '8': {},
      '10': 'allowedTransLangs'
    },
    {
      '1': 'max_selected_trans_langs',
      '3': 4,
      '4': 1,
      '5': 5,
      '8': {},
      '10': 'maxSelectedTransLangs'
    },
    {
      '1': 'default_lang',
      '3': 5,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'defaultLang',
      '17': true
    },
  ],
  '8': [
    {'1': '_default_lang'},
  ],
};

/// Descriptor for `InsightsChatTranslationFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsChatTranslationFeaturesDescriptor = $convert.base64Decode(
    'Ch9JbnNpZ2h0c0NoYXRUcmFuc2xhdGlvbkZlYXR1cmVzEhkKCGlzX2FsbG93GAEgASgIUgdpc0'
    'FsbG93EiYKCmlzX2VuYWJsZWQYAiABKAhCB7pIBGoCCABSCWlzRW5hYmxlZBI4ChNhbGxvd2Vk'
    'X3RyYW5zX2xhbmdzGAMgAygJQgi6SAWSAQIQAFIRYWxsb3dlZFRyYW5zTGFuZ3MSQAoYbWF4X3'
    'NlbGVjdGVkX3RyYW5zX2xhbmdzGAQgASgFQge6SAQaAggAUhVtYXhTZWxlY3RlZFRyYW5zTGFu'
    'Z3MSggEKDGRlZmF1bHRfbGFuZxgFIAEoCUJaukhXugFUChNkZWZhdWx0X2xhbmdfZm9ybWF0Ei'
    'lkZWZhdWx0X2xhbmcgc2hvdWxkIG5vdCBjb250YWluIGFueSB2YWx1ZRoSdGhpcy5tYXRjaGVz'
    'KCdeJCcpSABSC2RlZmF1bHRMYW5niAEBQg8KDV9kZWZhdWx0X2xhbmc=');

@$core.Deprecated('Use insightsAIFeaturesDescriptor instead')
const InsightsAIFeatures$json = {
  '1': 'InsightsAIFeatures',
  '2': [
    {'1': 'is_allow', '3': 1, '4': 1, '5': 8, '10': 'isAllow'},
    {
      '1': 'ai_text_chat_features',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.wajlc.InsightsAITextChatFeatures',
      '9': 0,
      '10': 'aiTextChatFeatures',
      '17': true
    },
    {
      '1': 'meeting_summarization_features',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.InsightsAIMeetingSummarizationFeatures',
      '9': 1,
      '10': 'meetingSummarizationFeatures',
      '17': true
    },
  ],
  '8': [
    {'1': '_ai_text_chat_features'},
    {'1': '_meeting_summarization_features'},
  ],
};

/// Descriptor for `InsightsAIFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsAIFeaturesDescriptor = $convert.base64Decode(
    'ChJJbnNpZ2h0c0FJRmVhdHVyZXMSGQoIaXNfYWxsb3cYASABKAhSB2lzQWxsb3cSWQoVYWlfdG'
    'V4dF9jaGF0X2ZlYXR1cmVzGAIgASgLMiEud2FqbGMuSW5zaWdodHNBSVRleHRDaGF0RmVhdHVy'
    'ZXNIAFISYWlUZXh0Q2hhdEZlYXR1cmVziAEBEngKHm1lZXRpbmdfc3VtbWFyaXphdGlvbl9mZW'
    'F0dXJlcxgDIAEoCzItLndhamxjLkluc2lnaHRzQUlNZWV0aW5nU3VtbWFyaXphdGlvbkZlYXR1'
    'cmVzSAFSHG1lZXRpbmdTdW1tYXJpemF0aW9uRmVhdHVyZXOIAQFCGAoWX2FpX3RleHRfY2hhdF'
    '9mZWF0dXJlc0IhCh9fbWVldGluZ19zdW1tYXJpemF0aW9uX2ZlYXR1cmVz');

@$core.Deprecated('Use insightsAITextChatFeaturesDescriptor instead')
const InsightsAITextChatFeatures$json = {
  '1': 'InsightsAITextChatFeatures',
  '2': [
    {'1': 'is_allow', '3': 1, '4': 1, '5': 8, '10': 'isAllow'},
    {'1': 'is_enabled', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'isEnabled'},
    {
      '1': 'is_allowed_everyone',
      '3': 3,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'isAllowedEveryone'
    },
    {
      '1': 'allowed_user_ids',
      '3': 4,
      '4': 3,
      '5': 9,
      '8': {},
      '10': 'allowedUserIds'
    },
  ],
};

/// Descriptor for `InsightsAITextChatFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsAITextChatFeaturesDescriptor = $convert.base64Decode(
    'ChpJbnNpZ2h0c0FJVGV4dENoYXRGZWF0dXJlcxIZCghpc19hbGxvdxgBIAEoCFIHaXNBbGxvdx'
    'ImCgppc19lbmFibGVkGAIgASgIQge6SARqAggAUglpc0VuYWJsZWQSNwoTaXNfYWxsb3dlZF9l'
    'dmVyeW9uZRgDIAEoCEIHukgEagIIAFIRaXNBbGxvd2VkRXZlcnlvbmUSMgoQYWxsb3dlZF91c2'
    'VyX2lkcxgEIAMoCUIIukgFkgECEABSDmFsbG93ZWRVc2VySWRz');

@$core
    .Deprecated('Use insightsAIMeetingSummarizationFeaturesDescriptor instead')
const InsightsAIMeetingSummarizationFeatures$json = {
  '1': 'InsightsAIMeetingSummarizationFeatures',
  '2': [
    {'1': 'is_allow', '3': 1, '4': 1, '5': 8, '10': 'isAllow'},
    {
      '1': 'summarization_prompt',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'summarizationPrompt'
    },
    {'1': 'is_enabled', '3': 3, '4': 1, '5': 8, '8': {}, '10': 'isEnabled'},
  ],
};

/// Descriptor for `InsightsAIMeetingSummarizationFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insightsAIMeetingSummarizationFeaturesDescriptor =
    $convert.base64Decode(
        'CiZJbnNpZ2h0c0FJTWVldGluZ1N1bW1hcml6YXRpb25GZWF0dXJlcxIZCghpc19hbGxvdxgBIA'
        'EoCFIHaXNBbGxvdxIxChRzdW1tYXJpemF0aW9uX3Byb21wdBgCIAEoCVITc3VtbWFyaXphdGlv'
        'blByb21wdBImCgppc19lbmFibGVkGAMgASgIQge6SARqAggAUglpc0VuYWJsZWQ=');

@$core.Deprecated('Use copyrightConfDescriptor instead')
const CopyrightConf$json = {
  '1': 'CopyrightConf',
  '2': [
    {'1': 'display', '3': 1, '4': 1, '5': 8, '10': 'display'},
    {'1': 'text', '3': 3, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `CopyrightConf`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List copyrightConfDescriptor = $convert.base64Decode(
    'Cg1Db3B5cmlnaHRDb25mEhgKB2Rpc3BsYXkYASABKAhSB2Rpc3BsYXkSEgoEdGV4dBgDIAEoCV'
    'IEdGV4dA==');

@$core.Deprecated('Use createRoomResDescriptor instead')
const CreateRoomRes$json = {
  '1': 'CreateRoomRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {
      '1': 'room_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.wajlc.ActiveRoomInfo',
      '10': 'roomInfo'
    },
  ],
};

/// Descriptor for `CreateRoomRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomResDescriptor = $convert.base64Decode(
    'Cg1DcmVhdGVSb29tUmVzEhYKBnN0YXR1cxgBIAEoCFIGc3RhdHVzEhAKA21zZxgCIAEoCVIDbX'
    'NnEjIKCXJvb21faW5mbxgDIAEoCzIVLndhamxjLkFjdGl2ZVJvb21JbmZvUghyb29tSW5mbw==');
