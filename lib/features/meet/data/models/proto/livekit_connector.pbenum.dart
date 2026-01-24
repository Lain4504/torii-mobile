//
//  Generated code. Do not modify.
//  source: livekit_connector.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ConnectorType extends $pb.ProtobufEnum {
  static const ConnectorType Unspecified = ConnectorType._(0, _omitEnumNames ? '' : 'Unspecified');
  static const ConnectorType WhatsApp = ConnectorType._(1, _omitEnumNames ? '' : 'WhatsApp');
  static const ConnectorType Twilio = ConnectorType._(2, _omitEnumNames ? '' : 'Twilio');

  static const $core.List<ConnectorType> values = <ConnectorType> [
    Unspecified,
    WhatsApp,
    Twilio,
  ];

  static final $core.Map<$core.int, ConnectorType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConnectorType? valueOf($core.int value) => _byValue[value];

  const ConnectorType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
