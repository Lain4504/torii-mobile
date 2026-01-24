//
//  Generated code. Do not modify.
//  source: wajlc_ingress.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class IngressInput extends $pb.ProtobufEnum {
  static const IngressInput RTMP_INPUT = IngressInput._(0, _omitEnumNames ? '' : 'RTMP_INPUT');
  static const IngressInput WHIP_INPUT = IngressInput._(1, _omitEnumNames ? '' : 'WHIP_INPUT');

  static const $core.List<IngressInput> values = <IngressInput> [
    RTMP_INPUT,
    WHIP_INPUT,
  ];

  static final $core.Map<$core.int, IngressInput> _byValue = $pb.ProtobufEnum.initByValue(values);
  static IngressInput? valueOf($core.int value) => _byValue[value];

  const IngressInput._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
