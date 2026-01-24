// This is a generated file - do not edit.
//
// Generated from livekit_connector.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ConnectorType extends $pb.ProtobufEnum {
  static const ConnectorType Unspecified =
      ConnectorType._(0, _omitEnumNames ? '' : 'Unspecified');
  static const ConnectorType WhatsApp =
      ConnectorType._(1, _omitEnumNames ? '' : 'WhatsApp');
  static const ConnectorType Twilio =
      ConnectorType._(2, _omitEnumNames ? '' : 'Twilio');

  static const $core.List<ConnectorType> values = <ConnectorType>[
    Unspecified,
    WhatsApp,
    Twilio,
  ];

  static final $core.List<ConnectorType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ConnectorType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ConnectorType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
