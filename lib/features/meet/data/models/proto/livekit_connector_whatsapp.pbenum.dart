// This is a generated file - do not edit.
//
// Generated from livekit_connector_whatsapp.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class WhatsAppCallDirection extends $pb.ProtobufEnum {
  static const WhatsAppCallDirection WHATSAPP_CALL_DIRECTION_INBOUND =
      WhatsAppCallDirection._(
          0, _omitEnumNames ? '' : 'WHATSAPP_CALL_DIRECTION_INBOUND');
  static const WhatsAppCallDirection WHATSAPP_CALL_DIRECTION_OUTBOUND =
      WhatsAppCallDirection._(
          2, _omitEnumNames ? '' : 'WHATSAPP_CALL_DIRECTION_OUTBOUND');

  static const $core.List<WhatsAppCallDirection> values =
      <WhatsAppCallDirection>[
    WHATSAPP_CALL_DIRECTION_INBOUND,
    WHATSAPP_CALL_DIRECTION_OUTBOUND,
  ];

  static final $core.Map<$core.int, WhatsAppCallDirection> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static WhatsAppCallDirection? valueOf($core.int value) => _byValue[value];

  const WhatsAppCallDirection._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
