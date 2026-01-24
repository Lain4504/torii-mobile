//
//  Generated code. Do not modify.
//  source: livekit_connector_twilio.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ConnectTwilioCallRequest_TwilioCallDirection extends $pb.ProtobufEnum {
  static const ConnectTwilioCallRequest_TwilioCallDirection TWILIO_CALL_DIRECTION_INBOUND = ConnectTwilioCallRequest_TwilioCallDirection._(0, _omitEnumNames ? '' : 'TWILIO_CALL_DIRECTION_INBOUND');
  static const ConnectTwilioCallRequest_TwilioCallDirection TWILIO_CALL_DIRECTION_OUTBOUND = ConnectTwilioCallRequest_TwilioCallDirection._(1, _omitEnumNames ? '' : 'TWILIO_CALL_DIRECTION_OUTBOUND');

  static const $core.List<ConnectTwilioCallRequest_TwilioCallDirection> values = <ConnectTwilioCallRequest_TwilioCallDirection> [
    TWILIO_CALL_DIRECTION_INBOUND,
    TWILIO_CALL_DIRECTION_OUTBOUND,
  ];

  static final $core.Map<$core.int, ConnectTwilioCallRequest_TwilioCallDirection> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConnectTwilioCallRequest_TwilioCallDirection? valueOf($core.int value) => _byValue[value];

  const ConnectTwilioCallRequest_TwilioCallDirection._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
