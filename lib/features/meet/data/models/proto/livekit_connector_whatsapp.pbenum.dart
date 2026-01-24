//
//  Generated code. Do not modify.
//  source: livekit_connector_whatsapp.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class WhatsAppCallDirection extends $pb.ProtobufEnum {
  static const WhatsAppCallDirection WHATSAPP_CALL_DIRECTION_INBOUND = WhatsAppCallDirection._(0, _omitEnumNames ? '' : 'WHATSAPP_CALL_DIRECTION_INBOUND');
  static const WhatsAppCallDirection WHATSAPP_CALL_DIRECTION_OUTBOUND = WhatsAppCallDirection._(2, _omitEnumNames ? '' : 'WHATSAPP_CALL_DIRECTION_OUTBOUND');

  static const $core.List<WhatsAppCallDirection> values = <WhatsAppCallDirection> [
    WHATSAPP_CALL_DIRECTION_INBOUND,
    WHATSAPP_CALL_DIRECTION_OUTBOUND,
  ];

  static final $core.Map<$core.int, WhatsAppCallDirection> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WhatsAppCallDirection? valueOf($core.int value) => _byValue[value];

  const WhatsAppCallDirection._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
