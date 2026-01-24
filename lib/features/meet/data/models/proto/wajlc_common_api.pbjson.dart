//
//  Generated code. Do not modify.
//  source: wajlc_common_api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use switchPresenterTaskDescriptor instead')
const SwitchPresenterTask$json = {
  '1': 'SwitchPresenterTask',
  '2': [
    {'1': 'PROMOTE', '2': 0},
    {'1': 'DEMOTE', '2': 1},
  ],
};

/// Descriptor for `SwitchPresenterTask`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List switchPresenterTaskDescriptor = $convert.base64Decode(
    'ChNTd2l0Y2hQcmVzZW50ZXJUYXNrEgsKB1BST01PVEUQABIKCgZERU1PVEUQAQ==');

@$core.Deprecated('Use externalMediaPlayerTaskDescriptor instead')
const ExternalMediaPlayerTask$json = {
  '1': 'ExternalMediaPlayerTask',
  '2': [
    {'1': 'START_PLAYBACK', '2': 0},
    {'1': 'END_PLAYBACK', '2': 1},
  ],
};

/// Descriptor for `ExternalMediaPlayerTask`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List externalMediaPlayerTaskDescriptor = $convert.base64Decode(
    'ChdFeHRlcm5hbE1lZGlhUGxheWVyVGFzaxISCg5TVEFSVF9QTEFZQkFDSxAAEhAKDEVORF9QTE'
    'FZQkFDSxAB');

@$core.Deprecated('Use externalDisplayLinkTaskDescriptor instead')
const ExternalDisplayLinkTask$json = {
  '1': 'ExternalDisplayLinkTask',
  '2': [
    {'1': 'START_EXTERNAL_LINK', '2': 0},
    {'1': 'STOP_EXTERNAL_LINK', '2': 1},
  ],
};

/// Descriptor for `ExternalDisplayLinkTask`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List externalDisplayLinkTaskDescriptor = $convert.base64Decode(
    'ChdFeHRlcm5hbERpc3BsYXlMaW5rVGFzaxIXChNTVEFSVF9FWFRFUk5BTF9MSU5LEAASFgoSU1'
    'RPUF9FWFRFUk5BTF9MSU5LEAE=');

@$core.Deprecated('Use roomUploadedFileTypeDescriptor instead')
const RoomUploadedFileType$json = {
  '1': 'RoomUploadedFileType',
  '2': [
    {'1': 'CHAT_FILE', '2': 0},
    {'1': 'WHITEBOARD_IMAGE_FILE', '2': 1},
    {'1': 'WHITEBOARD_CONVERTED_FILE', '2': 2},
    {'1': 'EXTERNAL_MEDIA_PLAYER_FILE', '2': 3},
    {'1': 'VIRTUAL_BACKGROUND', '2': 4},
  ],
};

/// Descriptor for `RoomUploadedFileType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roomUploadedFileTypeDescriptor = $convert.base64Decode(
    'ChRSb29tVXBsb2FkZWRGaWxlVHlwZRINCglDSEFUX0ZJTEUQABIZChVXSElURUJPQVJEX0lNQU'
    'dFX0ZJTEUQARIdChlXSElURUJPQVJEX0NPTlZFUlRFRF9GSUxFEAISHgoaRVhURVJOQUxfTUVE'
    'SUFfUExBWUVSX0ZJTEUQAxIWChJWSVJUVUFMX0JBQ0tHUk9VTkQQBA==');

@$core.Deprecated('Use commonResponseDescriptor instead')
const CommonResponse$json = {
  '1': 'CommonResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `CommonResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commonResponseDescriptor = $convert.base64Decode(
    'Cg5Db21tb25SZXNwb25zZRIWCgZzdGF0dXMYASABKAhSBnN0YXR1cxIQCgNtc2cYAiABKAlSA2'
    '1zZw==');

@$core.Deprecated('Use verifyTokenReqDescriptor instead')
const VerifyTokenReq$json = {
  '1': 'VerifyTokenReq',
  '2': [
    {'1': 'is_production', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isProduction', '17': true},
  ],
  '8': [
    {'1': '_is_production'},
  ],
};

/// Descriptor for `VerifyTokenReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyTokenReqDescriptor = $convert.base64Decode(
    'Cg5WZXJpZnlUb2tlblJlcRIoCg1pc19wcm9kdWN0aW9uGAEgASgISABSDGlzUHJvZHVjdGlvbo'
    'gBAUIQCg5faXNfcHJvZHVjdGlvbg==');

@$core.Deprecated('Use verifyTokenResDescriptor instead')
const VerifyTokenRes$json = {
  '1': 'VerifyTokenRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'nats_ws_urls', '3': 3, '4': 3, '5': 9, '10': 'natsWsUrls'},
    {'1': 'server_version', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'serverVersion', '17': true},
    {'1': 'room_id', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'roomId', '17': true},
    {'1': 'user_id', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'userId', '17': true},
    {'1': 'nats_subjects', '3': 7, '4': 1, '5': 11, '6': '.wajlc.NatsSubjects', '9': 3, '10': 'natsSubjects', '17': true},
    {'1': 'enabled_self_insert_encryption_key', '3': 8, '4': 1, '5': 8, '9': 4, '10': 'enabledSelfInsertEncryptionKey', '17': true},
    {'1': 'is_cloud', '3': 9, '4': 1, '5': 8, '9': 5, '10': 'isCloud', '17': true},
  ],
  '8': [
    {'1': '_server_version'},
    {'1': '_room_id'},
    {'1': '_user_id'},
    {'1': '_nats_subjects'},
    {'1': '_enabled_self_insert_encryption_key'},
    {'1': '_is_cloud'},
  ],
};

/// Descriptor for `VerifyTokenRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyTokenResDescriptor = $convert.base64Decode(
    'Cg5WZXJpZnlUb2tlblJlcxIWCgZzdGF0dXMYASABKAhSBnN0YXR1cxIQCgNtc2cYAiABKAlSA2'
    '1zZxIgCgxuYXRzX3dzX3VybHMYAyADKAlSCm5hdHNXc1VybHMSKgoOc2VydmVyX3ZlcnNpb24Y'
    'BCABKAlIAFINc2VydmVyVmVyc2lvbogBARIcCgdyb29tX2lkGAUgASgJSAFSBnJvb21JZIgBAR'
    'IcCgd1c2VyX2lkGAYgASgJSAJSBnVzZXJJZIgBARI9Cg1uYXRzX3N1YmplY3RzGAcgASgLMhMu'
    'd2FqbGMuTmF0c1N1YmplY3RzSANSDG5hdHNTdWJqZWN0c4gBARJPCiJlbmFibGVkX3NlbGZfaW'
    '5zZXJ0X2VuY3J5cHRpb25fa2V5GAggASgISARSHmVuYWJsZWRTZWxmSW5zZXJ0RW5jcnlwdGlv'
    'bktleYgBARIeCghpc19jbG91ZBgJIAEoCEgFUgdpc0Nsb3VkiAEBQhEKD19zZXJ2ZXJfdmVyc2'
    'lvbkIKCghfcm9vbV9pZEIKCghfdXNlcl9pZEIQCg5fbmF0c19zdWJqZWN0c0IlCiNfZW5hYmxl'
    'ZF9zZWxmX2luc2VydF9lbmNyeXB0aW9uX2tleUILCglfaXNfY2xvdWQ=');

@$core.Deprecated('Use muteUnMuteTrackReqDescriptor instead')
const MuteUnMuteTrackReq$json = {
  '1': 'MuteUnMuteTrackReq',
  '2': [
    {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'track_sid', '3': 4, '4': 1, '5': 9, '10': 'trackSid'},
    {'1': 'muted', '3': 5, '4': 1, '5': 8, '10': 'muted'},
    {'1': 'requested_user_id', '3': 6, '4': 1, '5': 9, '10': 'requestedUserId'},
  ],
};

/// Descriptor for `MuteUnMuteTrackReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List muteUnMuteTrackReqDescriptor = $convert.base64Decode(
    'ChJNdXRlVW5NdXRlVHJhY2tSZXESEAoDc2lkGAEgASgJUgNzaWQSFwoHcm9vbV9pZBgCIAEoCV'
    'IGcm9vbUlkEhcKB3VzZXJfaWQYAyABKAlSBnVzZXJJZBIbCgl0cmFja19zaWQYBCABKAlSCHRy'
    'YWNrU2lkEhQKBW11dGVkGAUgASgIUgVtdXRlZBIqChFyZXF1ZXN0ZWRfdXNlcl9pZBgGIAEoCV'
    'IPcmVxdWVzdGVkVXNlcklk');

@$core.Deprecated('Use removeParticipantReqDescriptor instead')
const RemoveParticipantReq$json = {
  '1': 'RemoveParticipantReq',
  '2': [
    {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'msg', '3': 4, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'block_user', '3': 5, '4': 1, '5': 8, '10': 'blockUser'},
  ],
};

/// Descriptor for `RemoveParticipantReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeParticipantReqDescriptor = $convert.base64Decode(
    'ChRSZW1vdmVQYXJ0aWNpcGFudFJlcRIQCgNzaWQYASABKAlSA3NpZBIXCgdyb29tX2lkGAIgAS'
    'gJUgZyb29tSWQSFwoHdXNlcl9pZBgDIAEoCVIGdXNlcklkEhAKA21zZxgEIAEoCVIDbXNnEh0K'
    'CmJsb2NrX3VzZXIYBSABKAhSCWJsb2NrVXNlcg==');

@$core.Deprecated('Use dataMessageReqDescriptor instead')
const DataMessageReq$json = {
  '1': 'DataMessageReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_sid', '3': 2, '4': 1, '5': 9, '10': 'roomSid'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'user_sid', '3': 4, '4': 1, '5': 9, '10': 'userSid'},
    {'1': 'msg_body_type', '3': 5, '4': 1, '5': 14, '6': '.wajlc.DataMsgBodyType', '10': 'msgBodyType'},
    {'1': 'msg', '3': 6, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'requested_user_id', '3': 7, '4': 1, '5': 9, '10': 'requestedUserId'},
    {'1': 'send_to', '3': 8, '4': 3, '5': 9, '10': 'sendTo'},
    {'1': 'is_admin', '3': 9, '4': 1, '5': 8, '10': 'isAdmin'},
  ],
};

/// Descriptor for `DataMessageReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dataMessageReqDescriptor = $convert.base64Decode(
    'Cg5EYXRhTWVzc2FnZVJlcRIXCgdyb29tX2lkGAEgASgJUgZyb29tSWQSGQoIcm9vbV9zaWQYAi'
    'ABKAlSB3Jvb21TaWQSFwoHdXNlcl9pZBgDIAEoCVIGdXNlcklkEhkKCHVzZXJfc2lkGAQgASgJ'
    'Ugd1c2VyU2lkEjoKDW1zZ19ib2R5X3R5cGUYBSABKA4yFi53YWpsYy5EYXRhTXNnQm9keVR5cG'
    'VSC21zZ0JvZHlUeXBlEhAKA21zZxgGIAEoCVIDbXNnEioKEXJlcXVlc3RlZF91c2VyX2lkGAcg'
    'ASgJUg9yZXF1ZXN0ZWRVc2VySWQSFwoHc2VuZF90bxgIIAMoCVIGc2VuZFRvEhkKCGlzX2FkbW'
    'luGAkgASgIUgdpc0FkbWlu');

@$core.Deprecated('Use roomEndAPIReqDescriptor instead')
const RoomEndAPIReq$json = {
  '1': 'RoomEndAPIReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `RoomEndAPIReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomEndAPIReqDescriptor = $convert.base64Decode(
    'Cg1Sb29tRW5kQVBJUmVxEhcKB3Jvb21faWQYASABKAlSBnJvb21JZA==');

@$core.Deprecated('Use changeVisibilityResDescriptor instead')
const ChangeVisibilityRes$json = {
  '1': 'ChangeVisibilityRes',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'visible_notepad', '3': 2, '4': 1, '5': 8, '9': 0, '10': 'visibleNotepad', '17': true},
    {'1': 'visible_white_board', '3': 3, '4': 1, '5': 8, '9': 1, '10': 'visibleWhiteBoard', '17': true},
  ],
  '8': [
    {'1': '_visible_notepad'},
    {'1': '_visible_white_board'},
  ],
};

/// Descriptor for `ChangeVisibilityRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeVisibilityResDescriptor = $convert.base64Decode(
    'ChNDaGFuZ2VWaXNpYmlsaXR5UmVzEhcKB3Jvb21faWQYASABKAlSBnJvb21JZBIsCg92aXNpYm'
    'xlX25vdGVwYWQYAiABKAhIAFIOdmlzaWJsZU5vdGVwYWSIAQESMwoTdmlzaWJsZV93aGl0ZV9i'
    'b2FyZBgDIAEoCEgBUhF2aXNpYmxlV2hpdGVCb2FyZIgBAUISChBfdmlzaWJsZV9ub3RlcGFkQh'
    'YKFF92aXNpYmxlX3doaXRlX2JvYXJk');

@$core.Deprecated('Use switchPresenterReqDescriptor instead')
const SwitchPresenterReq$json = {
  '1': 'SwitchPresenterReq',
  '2': [
    {'1': 'task', '3': 1, '4': 1, '5': 14, '6': '.wajlc.SwitchPresenterTask', '10': 'task'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'room_id', '3': 3, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'requested_user_id', '3': 4, '4': 1, '5': 9, '10': 'requestedUserId'},
  ],
};

/// Descriptor for `SwitchPresenterReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switchPresenterReqDescriptor = $convert.base64Decode(
    'ChJTd2l0Y2hQcmVzZW50ZXJSZXESLgoEdGFzaxgBIAEoDjIaLndhamxjLlN3aXRjaFByZXNlbn'
    'RlclRhc2tSBHRhc2sSFwoHdXNlcl9pZBgCIAEoCVIGdXNlcklkEhcKB3Jvb21faWQYAyABKAlS'
    'BnJvb21JZBIqChFyZXF1ZXN0ZWRfdXNlcl9pZBgEIAEoCVIPcmVxdWVzdGVkVXNlcklk');

@$core.Deprecated('Use externalMediaPlayerReqDescriptor instead')
const ExternalMediaPlayerReq$json = {
  '1': 'ExternalMediaPlayerReq',
  '2': [
    {'1': 'task', '3': 1, '4': 1, '5': 14, '6': '.wajlc.ExternalMediaPlayerTask', '10': 'task'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    {'1': 'seek_to', '3': 3, '4': 1, '5': 1, '9': 1, '10': 'seekTo', '17': true},
    {'1': 'room_id', '3': 4, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 5, '4': 1, '5': 9, '10': 'userId'},
  ],
  '8': [
    {'1': '_url'},
    {'1': '_seek_to'},
  ],
};

/// Descriptor for `ExternalMediaPlayerReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List externalMediaPlayerReqDescriptor = $convert.base64Decode(
    'ChZFeHRlcm5hbE1lZGlhUGxheWVyUmVxEjIKBHRhc2sYASABKA4yHi53YWpsYy5FeHRlcm5hbE'
    '1lZGlhUGxheWVyVGFza1IEdGFzaxIVCgN1cmwYAiABKAlIAFIDdXJsiAEBEhwKB3NlZWtfdG8Y'
    'AyABKAFIAVIGc2Vla1RviAEBEhcKB3Jvb21faWQYBCABKAlSBnJvb21JZBIXCgd1c2VyX2lkGA'
    'UgASgJUgZ1c2VySWRCBgoEX3VybEIKCghfc2Vla190bw==');

@$core.Deprecated('Use externalDisplayLinkReqDescriptor instead')
const ExternalDisplayLinkReq$json = {
  '1': 'ExternalDisplayLinkReq',
  '2': [
    {'1': 'task', '3': 1, '4': 1, '5': 14, '6': '.wajlc.ExternalDisplayLinkTask', '10': 'task'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    {'1': 'room_id', '3': 4, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 5, '4': 1, '5': 9, '10': 'userId'},
  ],
  '8': [
    {'1': '_url'},
  ],
};

/// Descriptor for `ExternalDisplayLinkReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List externalDisplayLinkReqDescriptor = $convert.base64Decode(
    'ChZFeHRlcm5hbERpc3BsYXlMaW5rUmVxEjIKBHRhc2sYASABKA4yHi53YWpsYy5FeHRlcm5hbE'
    'Rpc3BsYXlMaW5rVGFza1IEdGFzaxIVCgN1cmwYAiABKAlIAFIDdXJsiAEBEhcKB3Jvb21faWQY'
    'BCABKAlSBnJvb21JZBIXCgd1c2VyX2lkGAUgASgJUgZ1c2VySWRCBgoEX3VybA==');

@$core.Deprecated('Use createEtherpadSessionResDescriptor instead')
const CreateEtherpadSessionRes$json = {
  '1': 'CreateEtherpadSessionRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'pad_id', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'padId', '17': true},
    {'1': 'readonly_pad_id', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'readonlyPadId', '17': true},
  ],
  '8': [
    {'1': '_pad_id'},
    {'1': '_readonly_pad_id'},
  ],
};

/// Descriptor for `CreateEtherpadSessionRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEtherpadSessionResDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVFdGhlcnBhZFNlc3Npb25SZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSEAoDbX'
    'NnGAIgASgJUgNtc2cSGgoGcGFkX2lkGAMgASgJSABSBXBhZElkiAEBEisKD3JlYWRvbmx5X3Bh'
    'ZF9pZBgEIAEoCUgBUg1yZWFkb25seVBhZElkiAEBQgkKB19wYWRfaWRCEgoQX3JlYWRvbmx5X3'
    'BhZF9pZA==');

@$core.Deprecated('Use cleanEtherpadReqDescriptor instead')
const CleanEtherpadReq$json = {
  '1': 'CleanEtherpadReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'node_id', '3': 2, '4': 1, '5': 9, '10': 'nodeId'},
    {'1': 'pad_id', '3': 3, '4': 1, '5': 9, '10': 'padId'},
  ],
};

/// Descriptor for `CleanEtherpadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cleanEtherpadReqDescriptor = $convert.base64Decode(
    'ChBDbGVhbkV0aGVycGFkUmVxEhcKB3Jvb21faWQYASABKAlSBnJvb21JZBIXCgdub2RlX2lkGA'
    'IgASgJUgZub2RlSWQSFQoGcGFkX2lkGAMgASgJUgVwYWRJZA==');

@$core.Deprecated('Use changeEtherpadStatusReqDescriptor instead')
const ChangeEtherpadStatusReq$json = {
  '1': 'ChangeEtherpadStatusReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'is_active', '3': 2, '4': 1, '5': 8, '10': 'isActive'},
  ],
};

/// Descriptor for `ChangeEtherpadStatusReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeEtherpadStatusReqDescriptor = $convert.base64Decode(
    'ChdDaGFuZ2VFdGhlcnBhZFN0YXR1c1JlcRIXCgdyb29tX2lkGAEgASgJUgZyb29tSWQSGwoJaX'
    'NfYWN0aXZlGAIgASgIUghpc0FjdGl2ZQ==');

@$core.Deprecated('Use approveWaitingUsersReqDescriptor instead')
const ApproveWaitingUsersReq$json = {
  '1': 'ApproveWaitingUsersReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `ApproveWaitingUsersReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approveWaitingUsersReqDescriptor = $convert.base64Decode(
    'ChZBcHByb3ZlV2FpdGluZ1VzZXJzUmVxEhcKB3Jvb21faWQYASABKAlSBnJvb21JZBIXCgd1c2'
    'VyX2lkGAIgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use updateWaitingRoomMessageReqDescriptor instead')
const UpdateWaitingRoomMessageReq$json = {
  '1': 'UpdateWaitingRoomMessageReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `UpdateWaitingRoomMessageReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateWaitingRoomMessageReqDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVXYWl0aW5nUm9vbU1lc3NhZ2VSZXESFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEh'
    'AKA21zZxgCIAEoCVIDbXNn');

@$core.Deprecated('Use updateUserLockSettingsReqDescriptor instead')
const UpdateUserLockSettingsReq$json = {
  '1': 'UpdateUserLockSettingsReq',
  '2': [
    {'1': 'room_sid', '3': 1, '4': 1, '5': 9, '10': 'roomSid'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'service', '3': 4, '4': 1, '5': 9, '10': 'service'},
    {'1': 'direction', '3': 5, '4': 1, '5': 9, '10': 'direction'},
    {'1': 'requested_user_id', '3': 6, '4': 1, '5': 9, '10': 'requestedUserId'},
  ],
};

/// Descriptor for `UpdateUserLockSettingsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserLockSettingsReqDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVVc2VyTG9ja1NldHRpbmdzUmVxEhkKCHJvb21fc2lkGAEgASgJUgdyb29tU2lkEh'
    'cKB3Jvb21faWQYAiABKAlSBnJvb21JZBIXCgd1c2VyX2lkGAMgASgJUgZ1c2VySWQSGAoHc2Vy'
    'dmljZRgEIAEoCVIHc2VydmljZRIcCglkaXJlY3Rpb24YBSABKAlSCWRpcmVjdGlvbhIqChFyZX'
    'F1ZXN0ZWRfdXNlcl9pZBgGIAEoCVIPcmVxdWVzdGVkVXNlcklk');

@$core.Deprecated('Use uploadBase64EncodedDataReqDescriptor instead')
const UploadBase64EncodedDataReq$json = {
  '1': 'UploadBase64EncodedDataReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'data', '3': 3, '4': 1, '5': 9, '10': 'data'},
    {'1': 'file_name', '3': 4, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'file_type', '3': 5, '4': 1, '5': 14, '6': '.wajlc.RoomUploadedFileType', '10': 'fileType'},
  ],
};

/// Descriptor for `UploadBase64EncodedDataReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadBase64EncodedDataReqDescriptor = $convert.base64Decode(
    'ChpVcGxvYWRCYXNlNjRFbmNvZGVkRGF0YVJlcRIXCgdyb29tX2lkGAEgASgJUgZyb29tSWQSEg'
    'oEZGF0YRgDIAEoCVIEZGF0YRIbCglmaWxlX25hbWUYBCABKAlSCGZpbGVOYW1lEjgKCWZpbGVf'
    'dHlwZRgFIAEoDjIbLndhamxjLlJvb21VcGxvYWRlZEZpbGVUeXBlUghmaWxlVHlwZQ==');

@$core.Deprecated('Use uploadBase64EncodedDataResDescriptor instead')
const UploadBase64EncodedDataRes$json = {
  '1': 'UploadBase64EncodedDataRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'file_path', '3': 3, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'file_name', '3': 4, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'file_extension', '3': 5, '4': 1, '5': 9, '10': 'fileExtension'},
    {'1': 'file_mime_type', '3': 6, '4': 1, '5': 9, '10': 'fileMimeType'},
  ],
};

/// Descriptor for `UploadBase64EncodedDataRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadBase64EncodedDataResDescriptor = $convert.base64Decode(
    'ChpVcGxvYWRCYXNlNjRFbmNvZGVkRGF0YVJlcxIWCgZzdGF0dXMYASABKAhSBnN0YXR1cxIQCg'
    'Ntc2cYAiABKAlSA21zZxIbCglmaWxlX3BhdGgYAyABKAlSCGZpbGVQYXRoEhsKCWZpbGVfbmFt'
    'ZRgEIAEoCVIIZmlsZU5hbWUSJQoOZmlsZV9leHRlbnNpb24YBSABKAlSDWZpbGVFeHRlbnNpb2'
    '4SJAoOZmlsZV9taW1lX3R5cGUYBiABKAlSDGZpbGVNaW1lVHlwZQ==');

@$core.Deprecated('Use uploadedFileMergeReqDescriptor instead')
const UploadedFileMergeReq$json = {
  '1': 'UploadedFileMergeReq',
  '2': [
    {'1': 'room_sid', '3': 1, '4': 1, '5': 9, '10': 'roomSid'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'file_type', '3': 3, '4': 1, '5': 14, '6': '.wajlc.RoomUploadedFileType', '10': 'fileType'},
    {'1': 'resumable_identifier', '3': 4, '4': 1, '5': 9, '10': 'resumableIdentifier'},
    {'1': 'resumable_filename', '3': 5, '4': 1, '5': 9, '10': 'resumableFilename'},
    {'1': 'resumable_total_chunks', '3': 6, '4': 1, '5': 5, '10': 'resumableTotalChunks'},
  ],
};

/// Descriptor for `UploadedFileMergeReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadedFileMergeReqDescriptor = $convert.base64Decode(
    'ChRVcGxvYWRlZEZpbGVNZXJnZVJlcRIZCghyb29tX3NpZBgBIAEoCVIHcm9vbVNpZBIXCgdyb2'
    '9tX2lkGAIgASgJUgZyb29tSWQSOAoJZmlsZV90eXBlGAMgASgOMhsud2FqbGMuUm9vbVVwbG9h'
    'ZGVkRmlsZVR5cGVSCGZpbGVUeXBlEjEKFHJlc3VtYWJsZV9pZGVudGlmaWVyGAQgASgJUhNyZX'
    'N1bWFibGVJZGVudGlmaWVyEi0KEnJlc3VtYWJsZV9maWxlbmFtZRgFIAEoCVIRcmVzdW1hYmxl'
    'RmlsZW5hbWUSNAoWcmVzdW1hYmxlX3RvdGFsX2NodW5rcxgGIAEoBVIUcmVzdW1hYmxlVG90YW'
    'xDaHVua3M=');

@$core.Deprecated('Use uploadedFileResDescriptor instead')
const UploadedFileRes$json = {
  '1': 'UploadedFileRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'file_id', '3': 3, '4': 1, '5': 9, '10': 'fileId'},
    {'1': 'file_path', '3': 4, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'file_name', '3': 5, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'file_extension', '3': 6, '4': 1, '5': 9, '10': 'fileExtension'},
    {'1': 'file_mime_type', '3': 7, '4': 1, '5': 9, '10': 'fileMimeType'},
    {'1': 'file_type', '3': 8, '4': 1, '5': 14, '6': '.wajlc.RoomUploadedFileType', '10': 'fileType'},
  ],
};

/// Descriptor for `UploadedFileRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadedFileResDescriptor = $convert.base64Decode(
    'Cg9VcGxvYWRlZEZpbGVSZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSEAoDbXNnGAIgASgJUg'
    'Ntc2cSFwoHZmlsZV9pZBgDIAEoCVIGZmlsZUlkEhsKCWZpbGVfcGF0aBgEIAEoCVIIZmlsZVBh'
    'dGgSGwoJZmlsZV9uYW1lGAUgASgJUghmaWxlTmFtZRIlCg5maWxlX2V4dGVuc2lvbhgGIAEoCV'
    'INZmlsZUV4dGVuc2lvbhIkCg5maWxlX21pbWVfdHlwZRgHIAEoCVIMZmlsZU1pbWVUeXBlEjgK'
    'CWZpbGVfdHlwZRgIIAEoDjIbLndhamxjLlJvb21VcGxvYWRlZEZpbGVUeXBlUghmaWxlVHlwZQ'
    '==');

@$core.Deprecated('Use roomUploadedFileMetadataDescriptor instead')
const RoomUploadedFileMetadata$json = {
  '1': 'RoomUploadedFileMetadata',
  '2': [
    {'1': 'file_id', '3': 1, '4': 1, '5': 9, '10': 'fileId'},
    {'1': 'file_name', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'file_path', '3': 3, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'mime_type', '3': 4, '4': 1, '5': 9, '10': 'mimeType'},
    {'1': 'uploaded_by_user_id', '3': 5, '4': 1, '5': 9, '10': 'uploadedByUserId'},
    {'1': 'uploaded_by_name', '3': 6, '4': 1, '5': 9, '10': 'uploadedByName'},
    {'1': 'file_type', '3': 7, '4': 1, '5': 14, '6': '.wajlc.RoomUploadedFileType', '10': 'fileType'},
    {'1': 'total_pages', '3': 8, '4': 1, '5': 5, '9': 0, '10': 'totalPages', '17': true},
  ],
  '8': [
    {'1': '_total_pages'},
  ],
};

/// Descriptor for `RoomUploadedFileMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomUploadedFileMetadataDescriptor = $convert.base64Decode(
    'ChhSb29tVXBsb2FkZWRGaWxlTWV0YWRhdGESFwoHZmlsZV9pZBgBIAEoCVIGZmlsZUlkEhsKCW'
    'ZpbGVfbmFtZRgCIAEoCVIIZmlsZU5hbWUSGwoJZmlsZV9wYXRoGAMgASgJUghmaWxlUGF0aBIb'
    'CgltaW1lX3R5cGUYBCABKAlSCG1pbWVUeXBlEi0KE3VwbG9hZGVkX2J5X3VzZXJfaWQYBSABKA'
    'lSEHVwbG9hZGVkQnlVc2VySWQSKAoQdXBsb2FkZWRfYnlfbmFtZRgGIAEoCVIOdXBsb2FkZWRC'
    'eU5hbWUSOAoJZmlsZV90eXBlGAcgASgOMhsud2FqbGMuUm9vbVVwbG9hZGVkRmlsZVR5cGVSCG'
    'ZpbGVUeXBlEiQKC3RvdGFsX3BhZ2VzGAggASgFSABSCnRvdGFsUGFnZXOIAQFCDgoMX3RvdGFs'
    'X3BhZ2Vz');

@$core.Deprecated('Use getRoomUploadedFilesReqDescriptor instead')
const GetRoomUploadedFilesReq$json = {
  '1': 'GetRoomUploadedFilesReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'file_type', '3': 2, '4': 1, '5': 14, '6': '.wajlc.RoomUploadedFileType', '10': 'fileType'},
  ],
};

/// Descriptor for `GetRoomUploadedFilesReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomUploadedFilesReqDescriptor = $convert.base64Decode(
    'ChdHZXRSb29tVXBsb2FkZWRGaWxlc1JlcRIXCgdyb29tX2lkGAEgASgJUgZyb29tSWQSOAoJZm'
    'lsZV90eXBlGAIgASgOMhsud2FqbGMuUm9vbVVwbG9hZGVkRmlsZVR5cGVSCGZpbGVUeXBl');

@$core.Deprecated('Use getRoomUploadedFilesResDescriptor instead')
const GetRoomUploadedFilesRes$json = {
  '1': 'GetRoomUploadedFilesRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'files', '3': 3, '4': 3, '5': 11, '6': '.wajlc.RoomUploadedFileMetadata', '10': 'files'},
  ],
};

/// Descriptor for `GetRoomUploadedFilesRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomUploadedFilesResDescriptor = $convert.base64Decode(
    'ChdHZXRSb29tVXBsb2FkZWRGaWxlc1JlcxIWCgZzdGF0dXMYASABKAhSBnN0YXR1cxIQCgNtc2'
    'cYAiABKAlSA21zZxI1CgVmaWxlcxgDIAMoCzIfLndhamxjLlJvb21VcGxvYWRlZEZpbGVNZXRh'
    'ZGF0YVIFZmlsZXM=');

