// This is a generated file - do not edit.
//
// Generated from wajlc_gen_token.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use generateTokenReqDescriptor instead')
const GenerateTokenReq$json = {
  '1': 'GenerateTokenReq',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'roomId'},
    {
      '1': 'user_info',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.wajlc.UserInfo',
      '8': {},
      '10': 'userInfo'
    },
  ],
};

/// Descriptor for `GenerateTokenReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateTokenReqDescriptor = $convert.base64Decode(
    'ChBHZW5lcmF0ZVRva2VuUmVxEpQBCgdyb29tX2lkGAEgASgJQnu6SHi6AXUKDnJvb21faWRfZm'
    '9ybWF0EkFyb29tX2lkIHNob3VsZCBvbmx5IGNvbnRhaW4gbGV0dGVycyAoYS16IEEtWiksIGRp'
    'Z2l0cyAoMC05KSBvciAtXxogdGhpcy5tYXRjaGVzKCdeW2EtekEtWjAtOS1fXSskJylSBnJvb2'
    '1JZBI0Cgl1c2VyX2luZm8YAiABKAsyDy53YWpsYy5Vc2VySW5mb0IGukgDyAEBUgh1c2VySW5m'
    'bw==');

@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = {
  '1': 'UserInfo',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'is_admin', '3': 3, '4': 1, '5': 8, '10': 'isAdmin'},
    {'1': 'is_hidden', '3': 4, '4': 1, '5': 8, '10': 'isHidden'},
    {
      '1': 'user_metadata',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.wajlc.UserMetadata',
      '10': 'userMetadata'
    },
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode(
    'CghVc2VySW5mbxIaCgRuYW1lGAEgASgJQga6SAPIAQFSBG5hbWUSFwoHdXNlcl9pZBgCIAEoCV'
    'IGdXNlcklkEhkKCGlzX2FkbWluGAMgASgIUgdpc0FkbWluEhsKCWlzX2hpZGRlbhgEIAEoCFII'
    'aXNIaWRkZW4SOAoNdXNlcl9tZXRhZGF0YRgFIAEoCzITLndhamxjLlVzZXJNZXRhZGF0YVIMdX'
    'Nlck1ldGFkYXRh');

@$core.Deprecated('Use userMetadataDescriptor instead')
const UserMetadata$json = {
  '1': 'UserMetadata',
  '2': [
    {
      '1': 'profile_pic',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'profilePic',
      '17': true
    },
    {'1': 'is_admin', '3': 2, '4': 1, '5': 8, '10': 'isAdmin'},
    {
      '1': 'record_webcam',
      '3': 3,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'recordWebcam',
      '17': true
    },
    {'1': 'is_presenter', '3': 4, '4': 1, '5': 8, '8': {}, '10': 'isPresenter'},
    {'1': 'raised_hand', '3': 5, '4': 1, '5': 8, '8': {}, '10': 'raisedHand'},
    {
      '1': 'wait_for_approval',
      '3': 6,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'waitForApproval'
    },
    {
      '1': 'preferred_lang',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'preferredLang',
      '17': true
    },
    {
      '1': 'lock_settings',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.wajlc.LockSettings',
      '10': 'lockSettings'
    },
    {
      '1': 'metadata_id',
      '3': 9,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 3,
      '10': 'metadataId',
      '17': true
    },
    {
      '1': 'extra_data',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.wajlc.UserMetadata.ExtraDataEntry',
      '10': 'extraData'
    },
    {
      '1': 'ex_user_id',
      '3': 11,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'exUserId',
      '17': true
    },
  ],
  '3': [UserMetadata_ExtraDataEntry$json],
  '8': [
    {'1': '_profile_pic'},
    {'1': '_record_webcam'},
    {'1': '_preferred_lang'},
    {'1': '_metadata_id'},
    {'1': '_ex_user_id'},
  ],
};

@$core.Deprecated('Use userMetadataDescriptor instead')
const UserMetadata_ExtraDataEntry$json = {
  '1': 'ExtraDataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `UserMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userMetadataDescriptor = $convert.base64Decode(
    'CgxVc2VyTWV0YWRhdGESLgoLcHJvZmlsZV9waWMYASABKAlCCLpIBXIDiAEBSABSCnByb2ZpbG'
    'VQaWOIAQESGQoIaXNfYWRtaW4YAiABKAhSB2lzQWRtaW4SKAoNcmVjb3JkX3dlYmNhbRgDIAEo'
    'CEgBUgxyZWNvcmRXZWJjYW2IAQESKgoMaXNfcHJlc2VudGVyGAQgASgIQge6SARqAggAUgtpc1'
    'ByZXNlbnRlchIoCgtyYWlzZWRfaGFuZBgFIAEoCEIHukgEagIIAFIKcmFpc2VkSGFuZBIzChF3'
    'YWl0X2Zvcl9hcHByb3ZhbBgGIAEoCEIHukgEagIIAFIPd2FpdEZvckFwcHJvdmFsEioKDnByZW'
    'ZlcnJlZF9sYW5nGAcgASgJSAJSDXByZWZlcnJlZExhbmeIAQESOAoNbG9ja19zZXR0aW5ncxgI'
    'IAEoCzITLndhamxjLkxvY2tTZXR0aW5nc1IMbG9ja1NldHRpbmdzEn4KC21ldGFkYXRhX2lkGA'
    'kgASgJQli6SFW6AVIKEm1ldGFkYXRhX2lkX2Zvcm1hdBIobWV0YWRhdGFfaWQgc2hvdWxkIG5v'
    'dCBjb250YWluIGFueSB2YWx1ZRoSdGhpcy5tYXRjaGVzKCdeJCcpSANSCm1ldGFkYXRhSWSIAQ'
    'ESQQoKZXh0cmFfZGF0YRgKIAMoCzIiLndhamxjLlVzZXJNZXRhZGF0YS5FeHRyYURhdGFFbnRy'
    'eVIJZXh0cmFEYXRhEiEKCmV4X3VzZXJfaWQYCyABKAlIBFIIZXhVc2VySWSIAQEaPAoORXh0cm'
    'FEYXRhRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AUIO'
    'CgxfcHJvZmlsZV9waWNCEAoOX3JlY29yZF93ZWJjYW1CEQoPX3ByZWZlcnJlZF9sYW5nQg4KDF'
    '9tZXRhZGF0YV9pZEINCgtfZXhfdXNlcl9pZA==');

@$core.Deprecated('Use wajlcTokenClaimsDescriptor instead')
const WajlcTokenClaims$json = {
  '1': 'WajlcTokenClaims',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'room_id', '3': 3, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'is_admin', '3': 4, '4': 1, '5': 8, '10': 'isAdmin'},
    {'1': 'is_hidden', '3': 5, '4': 1, '5': 8, '10': 'isHidden'},
    {
      '1': 'profile_pic',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'profilePic',
      '17': true
    },
  ],
  '8': [
    {'1': '_profile_pic'},
  ],
};

/// Descriptor for `WajlcTokenClaims`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wajlcTokenClaimsDescriptor = $convert.base64Decode(
    'ChBXYWpsY1Rva2VuQ2xhaW1zEhIKBG5hbWUYASABKAlSBG5hbWUSFwoHdXNlcl9pZBgCIAEoCV'
    'IGdXNlcklkEhcKB3Jvb21faWQYAyABKAlSBnJvb21JZBIZCghpc19hZG1pbhgEIAEoCFIHaXNB'
    'ZG1pbhIbCglpc19oaWRkZW4YBSABKAhSCGlzSGlkZGVuEiQKC3Byb2ZpbGVfcGljGAYgASgJSA'
    'BSCnByb2ZpbGVQaWOIAQFCDgoMX3Byb2ZpbGVfcGlj');

@$core.Deprecated('Use lockSettingsDescriptor instead')
const LockSettings$json = {
  '1': 'LockSettings',
  '2': [
    {
      '1': 'lock_microphone',
      '3': 1,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'lockMicrophone',
      '17': true
    },
    {
      '1': 'lock_webcam',
      '3': 2,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'lockWebcam',
      '17': true
    },
    {
      '1': 'lock_screen_sharing',
      '3': 3,
      '4': 1,
      '5': 8,
      '9': 2,
      '10': 'lockScreenSharing',
      '17': true
    },
    {
      '1': 'lock_chat',
      '3': 4,
      '4': 1,
      '5': 8,
      '9': 3,
      '10': 'lockChat',
      '17': true
    },
    {
      '1': 'lock_chat_send_message',
      '3': 5,
      '4': 1,
      '5': 8,
      '9': 4,
      '10': 'lockChatSendMessage',
      '17': true
    },
    {
      '1': 'lock_chat_file_share',
      '3': 6,
      '4': 1,
      '5': 8,
      '9': 5,
      '10': 'lockChatFileShare',
      '17': true
    },
    {
      '1': 'lock_private_chat',
      '3': 7,
      '4': 1,
      '5': 8,
      '9': 6,
      '10': 'lockPrivateChat',
      '17': true
    },
    {
      '1': 'lock_whiteboard',
      '3': 8,
      '4': 1,
      '5': 8,
      '9': 7,
      '10': 'lockWhiteboard',
      '17': true
    },
    {
      '1': 'lock_shared_notepad',
      '3': 9,
      '4': 1,
      '5': 8,
      '9': 8,
      '10': 'lockSharedNotepad',
      '17': true
    },
  ],
  '8': [
    {'1': '_lock_microphone'},
    {'1': '_lock_webcam'},
    {'1': '_lock_screen_sharing'},
    {'1': '_lock_chat'},
    {'1': '_lock_chat_send_message'},
    {'1': '_lock_chat_file_share'},
    {'1': '_lock_private_chat'},
    {'1': '_lock_whiteboard'},
    {'1': '_lock_shared_notepad'},
  ],
};

/// Descriptor for `LockSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lockSettingsDescriptor = $convert.base64Decode(
    'CgxMb2NrU2V0dGluZ3MSLAoPbG9ja19taWNyb3Bob25lGAEgASgISABSDmxvY2tNaWNyb3Bob2'
    '5liAEBEiQKC2xvY2tfd2ViY2FtGAIgASgISAFSCmxvY2tXZWJjYW2IAQESMwoTbG9ja19zY3Jl'
    'ZW5fc2hhcmluZxgDIAEoCEgCUhFsb2NrU2NyZWVuU2hhcmluZ4gBARIgCglsb2NrX2NoYXQYBC'
    'ABKAhIA1IIbG9ja0NoYXSIAQESOAoWbG9ja19jaGF0X3NlbmRfbWVzc2FnZRgFIAEoCEgEUhNs'
    'b2NrQ2hhdFNlbmRNZXNzYWdliAEBEjQKFGxvY2tfY2hhdF9maWxlX3NoYXJlGAYgASgISAVSEW'
    'xvY2tDaGF0RmlsZVNoYXJliAEBEi8KEWxvY2tfcHJpdmF0ZV9jaGF0GAcgASgISAZSD2xvY2tQ'
    'cml2YXRlQ2hhdIgBARIsCg9sb2NrX3doaXRlYm9hcmQYCCABKAhIB1IObG9ja1doaXRlYm9hcm'
    'SIAQESMwoTbG9ja19zaGFyZWRfbm90ZXBhZBgJIAEoCEgIUhFsb2NrU2hhcmVkTm90ZXBhZIgB'
    'AUISChBfbG9ja19taWNyb3Bob25lQg4KDF9sb2NrX3dlYmNhbUIWChRfbG9ja19zY3JlZW5fc2'
    'hhcmluZ0IMCgpfbG9ja19jaGF0QhkKF19sb2NrX2NoYXRfc2VuZF9tZXNzYWdlQhcKFV9sb2Nr'
    'X2NoYXRfZmlsZV9zaGFyZUIUChJfbG9ja19wcml2YXRlX2NoYXRCEgoQX2xvY2tfd2hpdGVib2'
    'FyZEIWChRfbG9ja19zaGFyZWRfbm90ZXBhZA==');

@$core.Deprecated('Use generateTokenResDescriptor instead')
const GenerateTokenRes$json = {
  '1': 'GenerateTokenRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'token', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'token', '17': true},
  ],
  '8': [
    {'1': '_token'},
  ],
};

/// Descriptor for `GenerateTokenRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateTokenResDescriptor = $convert.base64Decode(
    'ChBHZW5lcmF0ZVRva2VuUmVzEhYKBnN0YXR1cxgBIAEoCFIGc3RhdHVzEhAKA21zZxgCIAEoCV'
    'IDbXNnEhkKBXRva2VuGAMgASgJSABSBXRva2VuiAEBQggKBl90b2tlbg==');

@$core.Deprecated('Use customDesignParamsDescriptor instead')
const CustomDesignParams$json = {
  '1': 'CustomDesignParams',
  '2': [
    {
      '1': 'primary_color',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'primaryColor',
      '17': true
    },
    {
      '1': 'secondary_color',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'secondaryColor',
      '17': true
    },
    {
      '1': 'background_color',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'backgroundColor',
      '17': true
    },
    {
      '1': 'background_image',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'backgroundImage',
      '17': true
    },
    {
      '1': 'header_bg_color',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'headerBgColor',
      '17': true
    },
    {
      '1': 'footer_bg_color',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'footerBgColor',
      '17': true
    },
    {
      '1': 'left_side_bg_color',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 6,
      '10': 'leftSideBgColor',
      '17': true
    },
    {
      '1': 'right_side_bg_color',
      '3': 8,
      '4': 1,
      '5': 9,
      '9': 7,
      '10': 'rightSideBgColor',
      '17': true
    },
    {
      '1': 'custom_css_url',
      '3': 9,
      '4': 1,
      '5': 9,
      '9': 8,
      '10': 'customCssUrl',
      '17': true
    },
    {
      '1': 'custom_logo',
      '3': 10,
      '4': 1,
      '5': 9,
      '9': 9,
      '10': 'customLogo',
      '17': true
    },
  ],
  '8': [
    {'1': '_primary_color'},
    {'1': '_secondary_color'},
    {'1': '_background_color'},
    {'1': '_background_image'},
    {'1': '_header_bg_color'},
    {'1': '_footer_bg_color'},
    {'1': '_left_side_bg_color'},
    {'1': '_right_side_bg_color'},
    {'1': '_custom_css_url'},
    {'1': '_custom_logo'},
  ],
};

/// Descriptor for `CustomDesignParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List customDesignParamsDescriptor = $convert.base64Decode(
    'ChJDdXN0b21EZXNpZ25QYXJhbXMSKAoNcHJpbWFyeV9jb2xvchgBIAEoCUgAUgxwcmltYXJ5Q2'
    '9sb3KIAQESLAoPc2Vjb25kYXJ5X2NvbG9yGAIgASgJSAFSDnNlY29uZGFyeUNvbG9yiAEBEi4K'
    'EGJhY2tncm91bmRfY29sb3IYAyABKAlIAlIPYmFja2dyb3VuZENvbG9yiAEBEi4KEGJhY2tncm'
    '91bmRfaW1hZ2UYBCABKAlIA1IPYmFja2dyb3VuZEltYWdliAEBEisKD2hlYWRlcl9iZ19jb2xv'
    'chgFIAEoCUgEUg1oZWFkZXJCZ0NvbG9yiAEBEisKD2Zvb3Rlcl9iZ19jb2xvchgGIAEoCUgFUg'
    '1mb290ZXJCZ0NvbG9yiAEBEjAKEmxlZnRfc2lkZV9iZ19jb2xvchgHIAEoCUgGUg9sZWZ0U2lk'
    'ZUJnQ29sb3KIAQESMgoTcmlnaHRfc2lkZV9iZ19jb2xvchgIIAEoCUgHUhByaWdodFNpZGVCZ0'
    'NvbG9yiAEBEikKDmN1c3RvbV9jc3NfdXJsGAkgASgJSAhSDGN1c3RvbUNzc1VybIgBARIkCgtj'
    'dXN0b21fbG9nbxgKIAEoCUgJUgpjdXN0b21Mb2dviAEBQhAKDl9wcmltYXJ5X2NvbG9yQhIKEF'
    '9zZWNvbmRhcnlfY29sb3JCEwoRX2JhY2tncm91bmRfY29sb3JCEwoRX2JhY2tncm91bmRfaW1h'
    'Z2VCEgoQX2hlYWRlcl9iZ19jb2xvckISChBfZm9vdGVyX2JnX2NvbG9yQhUKE19sZWZ0X3NpZG'
    'VfYmdfY29sb3JCFgoUX3JpZ2h0X3NpZGVfYmdfY29sb3JCEQoPX2N1c3RvbV9jc3NfdXJsQg4K'
    'DF9jdXN0b21fbG9nbw==');
