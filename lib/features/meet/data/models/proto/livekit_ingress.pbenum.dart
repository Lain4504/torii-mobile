// This is a generated file - do not edit.
//
// Generated from livekit_ingress.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class IngressInput extends $pb.ProtobufEnum {
  static const IngressInput RTMP_INPUT =
      IngressInput._(0, _omitEnumNames ? '' : 'RTMP_INPUT');
  static const IngressInput WHIP_INPUT =
      IngressInput._(1, _omitEnumNames ? '' : 'WHIP_INPUT');
  static const IngressInput URL_INPUT =
      IngressInput._(2, _omitEnumNames ? '' : 'URL_INPUT');

  static const $core.List<IngressInput> values = <IngressInput>[
    RTMP_INPUT,
    WHIP_INPUT,
    URL_INPUT,
  ];

  static final $core.List<IngressInput?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static IngressInput? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const IngressInput._(super.value, super.name);
}

class IngressAudioEncodingPreset extends $pb.ProtobufEnum {
  static const IngressAudioEncodingPreset OPUS_STEREO_96KBPS =
      IngressAudioEncodingPreset._(
          0, _omitEnumNames ? '' : 'OPUS_STEREO_96KBPS');
  static const IngressAudioEncodingPreset OPUS_MONO_64KBS =
      IngressAudioEncodingPreset._(1, _omitEnumNames ? '' : 'OPUS_MONO_64KBS');

  static const $core.List<IngressAudioEncodingPreset> values =
      <IngressAudioEncodingPreset>[
    OPUS_STEREO_96KBPS,
    OPUS_MONO_64KBS,
  ];

  static final $core.List<IngressAudioEncodingPreset?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static IngressAudioEncodingPreset? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const IngressAudioEncodingPreset._(super.value, super.name);
}

class IngressVideoEncodingPreset extends $pb.ProtobufEnum {
  static const IngressVideoEncodingPreset H264_720P_30FPS_3_LAYERS =
      IngressVideoEncodingPreset._(
          0, _omitEnumNames ? '' : 'H264_720P_30FPS_3_LAYERS');
  static const IngressVideoEncodingPreset H264_1080P_30FPS_3_LAYERS =
      IngressVideoEncodingPreset._(
          1, _omitEnumNames ? '' : 'H264_1080P_30FPS_3_LAYERS');
  static const IngressVideoEncodingPreset H264_540P_25FPS_2_LAYERS =
      IngressVideoEncodingPreset._(
          2, _omitEnumNames ? '' : 'H264_540P_25FPS_2_LAYERS');
  static const IngressVideoEncodingPreset H264_720P_30FPS_1_LAYER =
      IngressVideoEncodingPreset._(
          3, _omitEnumNames ? '' : 'H264_720P_30FPS_1_LAYER');
  static const IngressVideoEncodingPreset H264_1080P_30FPS_1_LAYER =
      IngressVideoEncodingPreset._(
          4, _omitEnumNames ? '' : 'H264_1080P_30FPS_1_LAYER');
  static const IngressVideoEncodingPreset H264_720P_30FPS_3_LAYERS_HIGH_MOTION =
      IngressVideoEncodingPreset._(
          5, _omitEnumNames ? '' : 'H264_720P_30FPS_3_LAYERS_HIGH_MOTION');
  static const IngressVideoEncodingPreset
      H264_1080P_30FPS_3_LAYERS_HIGH_MOTION = IngressVideoEncodingPreset._(
          6, _omitEnumNames ? '' : 'H264_1080P_30FPS_3_LAYERS_HIGH_MOTION');
  static const IngressVideoEncodingPreset H264_540P_25FPS_2_LAYERS_HIGH_MOTION =
      IngressVideoEncodingPreset._(
          7, _omitEnumNames ? '' : 'H264_540P_25FPS_2_LAYERS_HIGH_MOTION');
  static const IngressVideoEncodingPreset H264_720P_30FPS_1_LAYER_HIGH_MOTION =
      IngressVideoEncodingPreset._(
          8, _omitEnumNames ? '' : 'H264_720P_30FPS_1_LAYER_HIGH_MOTION');
  static const IngressVideoEncodingPreset H264_1080P_30FPS_1_LAYER_HIGH_MOTION =
      IngressVideoEncodingPreset._(
          9, _omitEnumNames ? '' : 'H264_1080P_30FPS_1_LAYER_HIGH_MOTION');

  static const $core.List<IngressVideoEncodingPreset> values =
      <IngressVideoEncodingPreset>[
    H264_720P_30FPS_3_LAYERS,
    H264_1080P_30FPS_3_LAYERS,
    H264_540P_25FPS_2_LAYERS,
    H264_720P_30FPS_1_LAYER,
    H264_1080P_30FPS_1_LAYER,
    H264_720P_30FPS_3_LAYERS_HIGH_MOTION,
    H264_1080P_30FPS_3_LAYERS_HIGH_MOTION,
    H264_540P_25FPS_2_LAYERS_HIGH_MOTION,
    H264_720P_30FPS_1_LAYER_HIGH_MOTION,
    H264_1080P_30FPS_1_LAYER_HIGH_MOTION,
  ];

  static final $core.List<IngressVideoEncodingPreset?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static IngressVideoEncodingPreset? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const IngressVideoEncodingPreset._(super.value, super.name);
}

class IngressState_Status extends $pb.ProtobufEnum {
  static const IngressState_Status ENDPOINT_INACTIVE =
      IngressState_Status._(0, _omitEnumNames ? '' : 'ENDPOINT_INACTIVE');
  static const IngressState_Status ENDPOINT_BUFFERING =
      IngressState_Status._(1, _omitEnumNames ? '' : 'ENDPOINT_BUFFERING');
  static const IngressState_Status ENDPOINT_PUBLISHING =
      IngressState_Status._(2, _omitEnumNames ? '' : 'ENDPOINT_PUBLISHING');
  static const IngressState_Status ENDPOINT_ERROR =
      IngressState_Status._(3, _omitEnumNames ? '' : 'ENDPOINT_ERROR');
  static const IngressState_Status ENDPOINT_COMPLETE =
      IngressState_Status._(4, _omitEnumNames ? '' : 'ENDPOINT_COMPLETE');

  static const $core.List<IngressState_Status> values = <IngressState_Status>[
    ENDPOINT_INACTIVE,
    ENDPOINT_BUFFERING,
    ENDPOINT_PUBLISHING,
    ENDPOINT_ERROR,
    ENDPOINT_COMPLETE,
  ];

  static final $core.List<IngressState_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static IngressState_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const IngressState_Status._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
