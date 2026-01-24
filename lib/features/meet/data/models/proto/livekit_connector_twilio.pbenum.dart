// This is a generated file - do not edit.
//
// Generated from livekit_connector_twilio.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ConnectTwilioCallRequest_TwilioCallDirection extends $pb.ProtobufEnum {
  /// Call is inbound to LiveKit from Twilio
  static const ConnectTwilioCallRequest_TwilioCallDirection
      TWILIO_CALL_DIRECTION_INBOUND =
      ConnectTwilioCallRequest_TwilioCallDirection._(
          0, _omitEnumNames ? '' : 'TWILIO_CALL_DIRECTION_INBOUND');

  /// Call is outbound from LiveKit to Twilio
  static const ConnectTwilioCallRequest_TwilioCallDirection
      TWILIO_CALL_DIRECTION_OUTBOUND =
      ConnectTwilioCallRequest_TwilioCallDirection._(
          1, _omitEnumNames ? '' : 'TWILIO_CALL_DIRECTION_OUTBOUND');

  static const $core.List<ConnectTwilioCallRequest_TwilioCallDirection> values =
      <ConnectTwilioCallRequest_TwilioCallDirection>[
    TWILIO_CALL_DIRECTION_INBOUND,
    TWILIO_CALL_DIRECTION_OUTBOUND,
  ];

  static final $core.List<ConnectTwilioCallRequest_TwilioCallDirection?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ConnectTwilioCallRequest_TwilioCallDirection? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ConnectTwilioCallRequest_TwilioCallDirection._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
