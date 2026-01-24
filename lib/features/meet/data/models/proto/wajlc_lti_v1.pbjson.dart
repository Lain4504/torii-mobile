// This is a generated file - do not edit.
//
// Generated from wajlc_lti_v1.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use ltiClaimsDescriptor instead')
const LtiClaims$json = {
  '1': 'LtiClaims',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'is_admin', '3': 3, '4': 1, '5': 8, '10': 'isAdmin'},
    {'1': 'room_id', '3': 4, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_title', '3': 5, '4': 1, '5': 9, '10': 'roomTitle'},
    {
      '1': 'lti_custom_parameters',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.wajlc.LtiCustomParameters',
      '10': 'ltiCustomParameters'
    },
  ],
};

/// Descriptor for `LtiClaims`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ltiClaimsDescriptor = $convert.base64Decode(
    'CglMdGlDbGFpbXMSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhIKBG5hbWUYAiABKAlSBG5hbW'
    'USGQoIaXNfYWRtaW4YAyABKAhSB2lzQWRtaW4SFwoHcm9vbV9pZBgEIAEoCVIGcm9vbUlkEh0K'
    'CnJvb21fdGl0bGUYBSABKAlSCXJvb21UaXRsZRJOChVsdGlfY3VzdG9tX3BhcmFtZXRlcnMYBi'
    'ABKAsyGi53YWpsYy5MdGlDdXN0b21QYXJhbWV0ZXJzUhNsdGlDdXN0b21QYXJhbWV0ZXJz');

@$core.Deprecated('Use ltiCustomParametersDescriptor instead')
const LtiCustomParameters$json = {
  '1': 'LtiCustomParameters',
  '2': [
    {
      '1': 'room_duration',
      '3': 1,
      '4': 1,
      '5': 4,
      '9': 0,
      '10': 'roomDuration',
      '17': true
    },
    {
      '1': 'allow_polls',
      '3': 2,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'allowPolls',
      '17': true
    },
    {
      '1': 'allow_shared_note_pad',
      '3': 3,
      '4': 1,
      '5': 8,
      '9': 2,
      '10': 'allowSharedNotePad',
      '17': true
    },
    {
      '1': 'allow_breakout_room',
      '3': 4,
      '4': 1,
      '5': 8,
      '9': 3,
      '10': 'allowBreakoutRoom',
      '17': true
    },
    {
      '1': 'allow_recording',
      '3': 5,
      '4': 1,
      '5': 8,
      '9': 4,
      '10': 'allowRecording',
      '17': true
    },
    {
      '1': 'allow_rtmp',
      '3': 6,
      '4': 1,
      '5': 8,
      '9': 5,
      '10': 'allowRtmp',
      '17': true
    },
    {
      '1': 'allow_view_other_webcams',
      '3': 7,
      '4': 1,
      '5': 8,
      '9': 6,
      '10': 'allowViewOtherWebcams',
      '17': true
    },
    {
      '1': 'allow_view_other_users_list',
      '3': 8,
      '4': 1,
      '5': 8,
      '9': 7,
      '10': 'allowViewOtherUsersList',
      '17': true
    },
    {
      '1': 'mute_on_start',
      '3': 9,
      '4': 1,
      '5': 8,
      '9': 8,
      '10': 'muteOnStart',
      '17': true
    },
    {
      '1': 'lti_custom_design',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.wajlc.LtiCustomDesign',
      '10': 'ltiCustomDesign'
    },
  ],
  '8': [
    {'1': '_room_duration'},
    {'1': '_allow_polls'},
    {'1': '_allow_shared_note_pad'},
    {'1': '_allow_breakout_room'},
    {'1': '_allow_recording'},
    {'1': '_allow_rtmp'},
    {'1': '_allow_view_other_webcams'},
    {'1': '_allow_view_other_users_list'},
    {'1': '_mute_on_start'},
  ],
};

/// Descriptor for `LtiCustomParameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ltiCustomParametersDescriptor = $convert.base64Decode(
    'ChNMdGlDdXN0b21QYXJhbWV0ZXJzEigKDXJvb21fZHVyYXRpb24YASABKARIAFIMcm9vbUR1cm'
    'F0aW9uiAEBEiQKC2FsbG93X3BvbGxzGAIgASgISAFSCmFsbG93UG9sbHOIAQESNgoVYWxsb3df'
    'c2hhcmVkX25vdGVfcGFkGAMgASgISAJSEmFsbG93U2hhcmVkTm90ZVBhZIgBARIzChNhbGxvd1'
    '9icmVha291dF9yb29tGAQgASgISANSEWFsbG93QnJlYWtvdXRSb29tiAEBEiwKD2FsbG93X3Jl'
    'Y29yZGluZxgFIAEoCEgEUg5hbGxvd1JlY29yZGluZ4gBARIiCgphbGxvd19ydG1wGAYgASgISA'
    'VSCWFsbG93UnRtcIgBARI8ChhhbGxvd192aWV3X290aGVyX3dlYmNhbXMYByABKAhIBlIVYWxs'
    'b3dWaWV3T3RoZXJXZWJjYW1ziAEBEkEKG2FsbG93X3ZpZXdfb3RoZXJfdXNlcnNfbGlzdBgIIA'
    'EoCEgHUhdhbGxvd1ZpZXdPdGhlclVzZXJzTGlzdIgBARInCg1tdXRlX29uX3N0YXJ0GAkgASgI'
    'SAhSC211dGVPblN0YXJ0iAEBEkIKEWx0aV9jdXN0b21fZGVzaWduGAogASgLMhYud2FqbGMuTH'
    'RpQ3VzdG9tRGVzaWduUg9sdGlDdXN0b21EZXNpZ25CEAoOX3Jvb21fZHVyYXRpb25CDgoMX2Fs'
    'bG93X3BvbGxzQhgKFl9hbGxvd19zaGFyZWRfbm90ZV9wYWRCFgoUX2FsbG93X2JyZWFrb3V0X3'
    'Jvb21CEgoQX2FsbG93X3JlY29yZGluZ0INCgtfYWxsb3dfcnRtcEIbChlfYWxsb3dfdmlld19v'
    'dGhlcl93ZWJjYW1zQh4KHF9hbGxvd192aWV3X290aGVyX3VzZXJzX2xpc3RCEAoOX211dGVfb2'
    '5fc3RhcnQ=');

@$core.Deprecated('Use ltiCustomDesignDescriptor instead')
const LtiCustomDesign$json = {
  '1': 'LtiCustomDesign',
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
      '1': 'custom_logo',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'customLogo',
      '17': true
    },
  ],
  '8': [
    {'1': '_primary_color'},
    {'1': '_secondary_color'},
    {'1': '_background_color'},
    {'1': '_custom_logo'},
  ],
};

/// Descriptor for `LtiCustomDesign`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ltiCustomDesignDescriptor = $convert.base64Decode(
    'Cg9MdGlDdXN0b21EZXNpZ24SKAoNcHJpbWFyeV9jb2xvchgBIAEoCUgAUgxwcmltYXJ5Q29sb3'
    'KIAQESLAoPc2Vjb25kYXJ5X2NvbG9yGAIgASgJSAFSDnNlY29uZGFyeUNvbG9yiAEBEi4KEGJh'
    'Y2tncm91bmRfY29sb3IYAyABKAlIAlIPYmFja2dyb3VuZENvbG9yiAEBEiQKC2N1c3RvbV9sb2'
    'dvGAQgASgJSANSCmN1c3RvbUxvZ2+IAQFCEAoOX3ByaW1hcnlfY29sb3JCEgoQX3NlY29uZGFy'
    'eV9jb2xvckITChFfYmFja2dyb3VuZF9jb2xvckIOCgxfY3VzdG9tX2xvZ28=');
