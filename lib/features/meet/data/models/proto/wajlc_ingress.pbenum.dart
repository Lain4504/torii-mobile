// This is a generated file - do not edit.
//
// Generated from wajlc_ingress.proto.

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

  static const $core.List<IngressInput> values = <IngressInput>[
    RTMP_INPUT,
    WHIP_INPUT,
  ];

  static final $core.List<IngressInput?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static IngressInput? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const IngressInput._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
