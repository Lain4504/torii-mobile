// This is a generated file - do not edit.
//
// Generated from livekit_sip.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SIPStatusCode extends $pb.ProtobufEnum {
  static const SIPStatusCode SIP_STATUS_UNKNOWN =
      SIPStatusCode._(0, _omitEnumNames ? '' : 'SIP_STATUS_UNKNOWN');
  static const SIPStatusCode SIP_STATUS_TRYING =
      SIPStatusCode._(100, _omitEnumNames ? '' : 'SIP_STATUS_TRYING');
  static const SIPStatusCode SIP_STATUS_RINGING =
      SIPStatusCode._(180, _omitEnumNames ? '' : 'SIP_STATUS_RINGING');
  static const SIPStatusCode SIP_STATUS_CALL_IS_FORWARDED = SIPStatusCode._(
      181, _omitEnumNames ? '' : 'SIP_STATUS_CALL_IS_FORWARDED');
  static const SIPStatusCode SIP_STATUS_QUEUED =
      SIPStatusCode._(182, _omitEnumNames ? '' : 'SIP_STATUS_QUEUED');
  static const SIPStatusCode SIP_STATUS_SESSION_PROGRESS =
      SIPStatusCode._(183, _omitEnumNames ? '' : 'SIP_STATUS_SESSION_PROGRESS');
  static const SIPStatusCode SIP_STATUS_EARLY_DIALOG_TERMINATED =
      SIPStatusCode._(
          199, _omitEnumNames ? '' : 'SIP_STATUS_EARLY_DIALOG_TERMINATED');
  static const SIPStatusCode SIP_STATUS_OK =
      SIPStatusCode._(200, _omitEnumNames ? '' : 'SIP_STATUS_OK');
  static const SIPStatusCode SIP_STATUS_ACCEPTED =
      SIPStatusCode._(202, _omitEnumNames ? '' : 'SIP_STATUS_ACCEPTED');
  static const SIPStatusCode SIP_STATUS_NO_NOTIFICATION =
      SIPStatusCode._(204, _omitEnumNames ? '' : 'SIP_STATUS_NO_NOTIFICATION');
  static const SIPStatusCode SIP_STATUS_MULTIPLE_CHOICES =
      SIPStatusCode._(300, _omitEnumNames ? '' : 'SIP_STATUS_MULTIPLE_CHOICES');
  static const SIPStatusCode SIP_STATUS_MOVED_PERMANENTLY = SIPStatusCode._(
      301, _omitEnumNames ? '' : 'SIP_STATUS_MOVED_PERMANENTLY');
  static const SIPStatusCode SIP_STATUS_MOVED_TEMPORARILY = SIPStatusCode._(
      302, _omitEnumNames ? '' : 'SIP_STATUS_MOVED_TEMPORARILY');
  static const SIPStatusCode SIP_STATUS_USE_PROXY =
      SIPStatusCode._(305, _omitEnumNames ? '' : 'SIP_STATUS_USE_PROXY');
  static const SIPStatusCode SIP_STATUS_ALTERNATIVE_SERVICE = SIPStatusCode._(
      380, _omitEnumNames ? '' : 'SIP_STATUS_ALTERNATIVE_SERVICE');
  static const SIPStatusCode SIP_STATUS_BAD_REQUEST =
      SIPStatusCode._(400, _omitEnumNames ? '' : 'SIP_STATUS_BAD_REQUEST');
  static const SIPStatusCode SIP_STATUS_UNAUTHORIZED =
      SIPStatusCode._(401, _omitEnumNames ? '' : 'SIP_STATUS_UNAUTHORIZED');
  static const SIPStatusCode SIP_STATUS_PAYMENT_REQUIRED =
      SIPStatusCode._(402, _omitEnumNames ? '' : 'SIP_STATUS_PAYMENT_REQUIRED');
  static const SIPStatusCode SIP_STATUS_FORBIDDEN =
      SIPStatusCode._(403, _omitEnumNames ? '' : 'SIP_STATUS_FORBIDDEN');
  static const SIPStatusCode SIP_STATUS_NOTFOUND =
      SIPStatusCode._(404, _omitEnumNames ? '' : 'SIP_STATUS_NOTFOUND');
  static const SIPStatusCode SIP_STATUS_METHOD_NOT_ALLOWED = SIPStatusCode._(
      405, _omitEnumNames ? '' : 'SIP_STATUS_METHOD_NOT_ALLOWED');
  static const SIPStatusCode SIP_STATUS_NOT_ACCEPTABLE =
      SIPStatusCode._(406, _omitEnumNames ? '' : 'SIP_STATUS_NOT_ACCEPTABLE');
  static const SIPStatusCode SIP_STATUS_PROXY_AUTH_REQUIRED = SIPStatusCode._(
      407, _omitEnumNames ? '' : 'SIP_STATUS_PROXY_AUTH_REQUIRED');
  static const SIPStatusCode SIP_STATUS_REQUEST_TIMEOUT =
      SIPStatusCode._(408, _omitEnumNames ? '' : 'SIP_STATUS_REQUEST_TIMEOUT');
  static const SIPStatusCode SIP_STATUS_CONFLICT =
      SIPStatusCode._(409, _omitEnumNames ? '' : 'SIP_STATUS_CONFLICT');
  static const SIPStatusCode SIP_STATUS_GONE =
      SIPStatusCode._(410, _omitEnumNames ? '' : 'SIP_STATUS_GONE');
  static const SIPStatusCode SIP_STATUS_LENGTH_REQUIRED =
      SIPStatusCode._(411, _omitEnumNames ? '' : 'SIP_STATUS_LENGTH_REQUIRED');
  static const SIPStatusCode SIP_STATUS_CONDITIONAL_REQUEST_FAILED =
      SIPStatusCode._(
          412, _omitEnumNames ? '' : 'SIP_STATUS_CONDITIONAL_REQUEST_FAILED');
  static const SIPStatusCode SIP_STATUS_REQUEST_ENTITY_TOO_LARGE =
      SIPStatusCode._(
          413, _omitEnumNames ? '' : 'SIP_STATUS_REQUEST_ENTITY_TOO_LARGE');
  static const SIPStatusCode SIP_STATUS_REQUEST_URI_TOO_LONG = SIPStatusCode._(
      414, _omitEnumNames ? '' : 'SIP_STATUS_REQUEST_URI_TOO_LONG');
  static const SIPStatusCode SIP_STATUS_UNSUPPORTED_MEDIA_TYPE =
      SIPStatusCode._(
          415, _omitEnumNames ? '' : 'SIP_STATUS_UNSUPPORTED_MEDIA_TYPE');
  static const SIPStatusCode SIP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE =
      SIPStatusCode._(416,
          _omitEnumNames ? '' : 'SIP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE');
  static const SIPStatusCode SIP_STATUS_UNKNOWN_RESOURCE_PRIORITY =
      SIPStatusCode._(
          417, _omitEnumNames ? '' : 'SIP_STATUS_UNKNOWN_RESOURCE_PRIORITY');
  static const SIPStatusCode SIP_STATUS_BAD_EXTENSION =
      SIPStatusCode._(420, _omitEnumNames ? '' : 'SIP_STATUS_BAD_EXTENSION');
  static const SIPStatusCode SIP_STATUS_EXTENSION_REQUIRED = SIPStatusCode._(
      421, _omitEnumNames ? '' : 'SIP_STATUS_EXTENSION_REQUIRED');
  static const SIPStatusCode SIP_STATUS_SESSION_INTERVAL_TOO_SMALL =
      SIPStatusCode._(
          422, _omitEnumNames ? '' : 'SIP_STATUS_SESSION_INTERVAL_TOO_SMALL');
  static const SIPStatusCode SIP_STATUS_INTERVAL_TOO_BRIEF = SIPStatusCode._(
      423, _omitEnumNames ? '' : 'SIP_STATUS_INTERVAL_TOO_BRIEF');
  static const SIPStatusCode SIP_STATUS_BAD_LOCATION_INFORMATION =
      SIPStatusCode._(
          424, _omitEnumNames ? '' : 'SIP_STATUS_BAD_LOCATION_INFORMATION');
  static const SIPStatusCode SIP_STATUS_BAD_ALERT_MESSAGE = SIPStatusCode._(
      425, _omitEnumNames ? '' : 'SIP_STATUS_BAD_ALERT_MESSAGE');
  static const SIPStatusCode SIP_STATUS_USE_IDENTITY_HEADER = SIPStatusCode._(
      428, _omitEnumNames ? '' : 'SIP_STATUS_USE_IDENTITY_HEADER');
  static const SIPStatusCode SIP_STATUS_PROVIDE_REFERRER_IDENTITY =
      SIPStatusCode._(
          429, _omitEnumNames ? '' : 'SIP_STATUS_PROVIDE_REFERRER_IDENTITY');
  static const SIPStatusCode SIP_STATUS_FLOW_FAILED =
      SIPStatusCode._(430, _omitEnumNames ? '' : 'SIP_STATUS_FLOW_FAILED');
  static const SIPStatusCode SIP_STATUS_ANONYMITY_DISALLOWED = SIPStatusCode._(
      433, _omitEnumNames ? '' : 'SIP_STATUS_ANONYMITY_DISALLOWED');
  static const SIPStatusCode SIP_STATUS_BAD_IDENTITY_INFO = SIPStatusCode._(
      436, _omitEnumNames ? '' : 'SIP_STATUS_BAD_IDENTITY_INFO');
  static const SIPStatusCode SIP_STATUS_UNSUPPORTED_CERTIFICATE =
      SIPStatusCode._(
          437, _omitEnumNames ? '' : 'SIP_STATUS_UNSUPPORTED_CERTIFICATE');
  static const SIPStatusCode SIP_STATUS_INVALID_IDENTITY_HEADER =
      SIPStatusCode._(
          438, _omitEnumNames ? '' : 'SIP_STATUS_INVALID_IDENTITY_HEADER');
  static const SIPStatusCode SIP_STATUS_FIRST_HOP_LACKS_OUTBOUND_SUPPORT =
      SIPStatusCode._(439,
          _omitEnumNames ? '' : 'SIP_STATUS_FIRST_HOP_LACKS_OUTBOUND_SUPPORT');
  static const SIPStatusCode SIP_STATUS_MAX_BREADTH_EXCEEDED = SIPStatusCode._(
      440, _omitEnumNames ? '' : 'SIP_STATUS_MAX_BREADTH_EXCEEDED');
  static const SIPStatusCode SIP_STATUS_BAD_INFO_PACKAGE =
      SIPStatusCode._(469, _omitEnumNames ? '' : 'SIP_STATUS_BAD_INFO_PACKAGE');
  static const SIPStatusCode SIP_STATUS_CONSENT_NEEDED =
      SIPStatusCode._(470, _omitEnumNames ? '' : 'SIP_STATUS_CONSENT_NEEDED');
  static const SIPStatusCode SIP_STATUS_TEMPORARILY_UNAVAILABLE =
      SIPStatusCode._(
          480, _omitEnumNames ? '' : 'SIP_STATUS_TEMPORARILY_UNAVAILABLE');
  static const SIPStatusCode SIP_STATUS_CALL_TRANSACTION_DOES_NOT_EXISTS =
      SIPStatusCode._(481,
          _omitEnumNames ? '' : 'SIP_STATUS_CALL_TRANSACTION_DOES_NOT_EXISTS');
  static const SIPStatusCode SIP_STATUS_LOOP_DETECTED =
      SIPStatusCode._(482, _omitEnumNames ? '' : 'SIP_STATUS_LOOP_DETECTED');
  static const SIPStatusCode SIP_STATUS_TOO_MANY_HOPS =
      SIPStatusCode._(483, _omitEnumNames ? '' : 'SIP_STATUS_TOO_MANY_HOPS');
  static const SIPStatusCode SIP_STATUS_ADDRESS_INCOMPLETE = SIPStatusCode._(
      484, _omitEnumNames ? '' : 'SIP_STATUS_ADDRESS_INCOMPLETE');
  static const SIPStatusCode SIP_STATUS_AMBIGUOUS =
      SIPStatusCode._(485, _omitEnumNames ? '' : 'SIP_STATUS_AMBIGUOUS');
  static const SIPStatusCode SIP_STATUS_BUSY_HERE =
      SIPStatusCode._(486, _omitEnumNames ? '' : 'SIP_STATUS_BUSY_HERE');
  static const SIPStatusCode SIP_STATUS_REQUEST_TERMINATED = SIPStatusCode._(
      487, _omitEnumNames ? '' : 'SIP_STATUS_REQUEST_TERMINATED');
  static const SIPStatusCode SIP_STATUS_NOT_ACCEPTABLE_HERE = SIPStatusCode._(
      488, _omitEnumNames ? '' : 'SIP_STATUS_NOT_ACCEPTABLE_HERE');
  static const SIPStatusCode SIP_STATUS_BAD_EVENT =
      SIPStatusCode._(489, _omitEnumNames ? '' : 'SIP_STATUS_BAD_EVENT');
  static const SIPStatusCode SIP_STATUS_REQUEST_PENDING =
      SIPStatusCode._(491, _omitEnumNames ? '' : 'SIP_STATUS_REQUEST_PENDING');
  static const SIPStatusCode SIP_STATUS_UNDECIPHERABLE =
      SIPStatusCode._(493, _omitEnumNames ? '' : 'SIP_STATUS_UNDECIPHERABLE');
  static const SIPStatusCode SIP_STATUS_SECURITY_AGREEMENT_REQUIRED =
      SIPStatusCode._(
          494, _omitEnumNames ? '' : 'SIP_STATUS_SECURITY_AGREEMENT_REQUIRED');
  static const SIPStatusCode SIP_STATUS_INTERNAL_SERVER_ERROR = SIPStatusCode._(
      500, _omitEnumNames ? '' : 'SIP_STATUS_INTERNAL_SERVER_ERROR');
  static const SIPStatusCode SIP_STATUS_NOT_IMPLEMENTED =
      SIPStatusCode._(501, _omitEnumNames ? '' : 'SIP_STATUS_NOT_IMPLEMENTED');
  static const SIPStatusCode SIP_STATUS_BAD_GATEWAY =
      SIPStatusCode._(502, _omitEnumNames ? '' : 'SIP_STATUS_BAD_GATEWAY');
  static const SIPStatusCode SIP_STATUS_SERVICE_UNAVAILABLE = SIPStatusCode._(
      503, _omitEnumNames ? '' : 'SIP_STATUS_SERVICE_UNAVAILABLE');
  static const SIPStatusCode SIP_STATUS_GATEWAY_TIMEOUT =
      SIPStatusCode._(504, _omitEnumNames ? '' : 'SIP_STATUS_GATEWAY_TIMEOUT');
  static const SIPStatusCode SIP_STATUS_VERSION_NOT_SUPPORTED = SIPStatusCode._(
      505, _omitEnumNames ? '' : 'SIP_STATUS_VERSION_NOT_SUPPORTED');
  static const SIPStatusCode SIP_STATUS_MESSAGE_TOO_LARGE = SIPStatusCode._(
      513, _omitEnumNames ? '' : 'SIP_STATUS_MESSAGE_TOO_LARGE');
  static const SIPStatusCode SIP_STATUS_GLOBAL_BUSY_EVERYWHERE =
      SIPStatusCode._(
          600, _omitEnumNames ? '' : 'SIP_STATUS_GLOBAL_BUSY_EVERYWHERE');
  static const SIPStatusCode SIP_STATUS_GLOBAL_DECLINE =
      SIPStatusCode._(603, _omitEnumNames ? '' : 'SIP_STATUS_GLOBAL_DECLINE');
  static const SIPStatusCode SIP_STATUS_GLOBAL_DOES_NOT_EXIST_ANYWHERE =
      SIPStatusCode._(604,
          _omitEnumNames ? '' : 'SIP_STATUS_GLOBAL_DOES_NOT_EXIST_ANYWHERE');
  static const SIPStatusCode SIP_STATUS_GLOBAL_NOT_ACCEPTABLE = SIPStatusCode._(
      606, _omitEnumNames ? '' : 'SIP_STATUS_GLOBAL_NOT_ACCEPTABLE');
  static const SIPStatusCode SIP_STATUS_GLOBAL_UNWANTED =
      SIPStatusCode._(607, _omitEnumNames ? '' : 'SIP_STATUS_GLOBAL_UNWANTED');
  static const SIPStatusCode SIP_STATUS_GLOBAL_REJECTED =
      SIPStatusCode._(608, _omitEnumNames ? '' : 'SIP_STATUS_GLOBAL_REJECTED');

  static const $core.List<SIPStatusCode> values = <SIPStatusCode>[
    SIP_STATUS_UNKNOWN,
    SIP_STATUS_TRYING,
    SIP_STATUS_RINGING,
    SIP_STATUS_CALL_IS_FORWARDED,
    SIP_STATUS_QUEUED,
    SIP_STATUS_SESSION_PROGRESS,
    SIP_STATUS_EARLY_DIALOG_TERMINATED,
    SIP_STATUS_OK,
    SIP_STATUS_ACCEPTED,
    SIP_STATUS_NO_NOTIFICATION,
    SIP_STATUS_MULTIPLE_CHOICES,
    SIP_STATUS_MOVED_PERMANENTLY,
    SIP_STATUS_MOVED_TEMPORARILY,
    SIP_STATUS_USE_PROXY,
    SIP_STATUS_ALTERNATIVE_SERVICE,
    SIP_STATUS_BAD_REQUEST,
    SIP_STATUS_UNAUTHORIZED,
    SIP_STATUS_PAYMENT_REQUIRED,
    SIP_STATUS_FORBIDDEN,
    SIP_STATUS_NOTFOUND,
    SIP_STATUS_METHOD_NOT_ALLOWED,
    SIP_STATUS_NOT_ACCEPTABLE,
    SIP_STATUS_PROXY_AUTH_REQUIRED,
    SIP_STATUS_REQUEST_TIMEOUT,
    SIP_STATUS_CONFLICT,
    SIP_STATUS_GONE,
    SIP_STATUS_LENGTH_REQUIRED,
    SIP_STATUS_CONDITIONAL_REQUEST_FAILED,
    SIP_STATUS_REQUEST_ENTITY_TOO_LARGE,
    SIP_STATUS_REQUEST_URI_TOO_LONG,
    SIP_STATUS_UNSUPPORTED_MEDIA_TYPE,
    SIP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE,
    SIP_STATUS_UNKNOWN_RESOURCE_PRIORITY,
    SIP_STATUS_BAD_EXTENSION,
    SIP_STATUS_EXTENSION_REQUIRED,
    SIP_STATUS_SESSION_INTERVAL_TOO_SMALL,
    SIP_STATUS_INTERVAL_TOO_BRIEF,
    SIP_STATUS_BAD_LOCATION_INFORMATION,
    SIP_STATUS_BAD_ALERT_MESSAGE,
    SIP_STATUS_USE_IDENTITY_HEADER,
    SIP_STATUS_PROVIDE_REFERRER_IDENTITY,
    SIP_STATUS_FLOW_FAILED,
    SIP_STATUS_ANONYMITY_DISALLOWED,
    SIP_STATUS_BAD_IDENTITY_INFO,
    SIP_STATUS_UNSUPPORTED_CERTIFICATE,
    SIP_STATUS_INVALID_IDENTITY_HEADER,
    SIP_STATUS_FIRST_HOP_LACKS_OUTBOUND_SUPPORT,
    SIP_STATUS_MAX_BREADTH_EXCEEDED,
    SIP_STATUS_BAD_INFO_PACKAGE,
    SIP_STATUS_CONSENT_NEEDED,
    SIP_STATUS_TEMPORARILY_UNAVAILABLE,
    SIP_STATUS_CALL_TRANSACTION_DOES_NOT_EXISTS,
    SIP_STATUS_LOOP_DETECTED,
    SIP_STATUS_TOO_MANY_HOPS,
    SIP_STATUS_ADDRESS_INCOMPLETE,
    SIP_STATUS_AMBIGUOUS,
    SIP_STATUS_BUSY_HERE,
    SIP_STATUS_REQUEST_TERMINATED,
    SIP_STATUS_NOT_ACCEPTABLE_HERE,
    SIP_STATUS_BAD_EVENT,
    SIP_STATUS_REQUEST_PENDING,
    SIP_STATUS_UNDECIPHERABLE,
    SIP_STATUS_SECURITY_AGREEMENT_REQUIRED,
    SIP_STATUS_INTERNAL_SERVER_ERROR,
    SIP_STATUS_NOT_IMPLEMENTED,
    SIP_STATUS_BAD_GATEWAY,
    SIP_STATUS_SERVICE_UNAVAILABLE,
    SIP_STATUS_GATEWAY_TIMEOUT,
    SIP_STATUS_VERSION_NOT_SUPPORTED,
    SIP_STATUS_MESSAGE_TOO_LARGE,
    SIP_STATUS_GLOBAL_BUSY_EVERYWHERE,
    SIP_STATUS_GLOBAL_DECLINE,
    SIP_STATUS_GLOBAL_DOES_NOT_EXIST_ANYWHERE,
    SIP_STATUS_GLOBAL_NOT_ACCEPTABLE,
    SIP_STATUS_GLOBAL_UNWANTED,
    SIP_STATUS_GLOBAL_REJECTED,
  ];

  static final $core.Map<$core.int, SIPStatusCode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SIPStatusCode? valueOf($core.int value) => _byValue[value];

  const SIPStatusCode._(super.value, super.name);
}

class SIPTransport extends $pb.ProtobufEnum {
  static const SIPTransport SIP_TRANSPORT_AUTO =
      SIPTransport._(0, _omitEnumNames ? '' : 'SIP_TRANSPORT_AUTO');
  static const SIPTransport SIP_TRANSPORT_UDP =
      SIPTransport._(1, _omitEnumNames ? '' : 'SIP_TRANSPORT_UDP');
  static const SIPTransport SIP_TRANSPORT_TCP =
      SIPTransport._(2, _omitEnumNames ? '' : 'SIP_TRANSPORT_TCP');
  static const SIPTransport SIP_TRANSPORT_TLS =
      SIPTransport._(3, _omitEnumNames ? '' : 'SIP_TRANSPORT_TLS');

  static const $core.List<SIPTransport> values = <SIPTransport>[
    SIP_TRANSPORT_AUTO,
    SIP_TRANSPORT_UDP,
    SIP_TRANSPORT_TCP,
    SIP_TRANSPORT_TLS,
  ];

  static final $core.List<SIPTransport?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static SIPTransport? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SIPTransport._(super.value, super.name);
}

class SIPHeaderOptions extends $pb.ProtobufEnum {
  static const SIPHeaderOptions SIP_NO_HEADERS =
      SIPHeaderOptions._(0, _omitEnumNames ? '' : 'SIP_NO_HEADERS');
  static const SIPHeaderOptions SIP_X_HEADERS =
      SIPHeaderOptions._(1, _omitEnumNames ? '' : 'SIP_X_HEADERS');
  static const SIPHeaderOptions SIP_ALL_HEADERS =
      SIPHeaderOptions._(2, _omitEnumNames ? '' : 'SIP_ALL_HEADERS');

  static const $core.List<SIPHeaderOptions> values = <SIPHeaderOptions>[
    SIP_NO_HEADERS,
    SIP_X_HEADERS,
    SIP_ALL_HEADERS,
  ];

  static final $core.List<SIPHeaderOptions?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SIPHeaderOptions? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SIPHeaderOptions._(super.value, super.name);
}

class SIPMediaEncryption extends $pb.ProtobufEnum {
  static const SIPMediaEncryption SIP_MEDIA_ENCRYPT_DISABLE =
      SIPMediaEncryption._(
          0, _omitEnumNames ? '' : 'SIP_MEDIA_ENCRYPT_DISABLE');
  static const SIPMediaEncryption SIP_MEDIA_ENCRYPT_ALLOW =
      SIPMediaEncryption._(1, _omitEnumNames ? '' : 'SIP_MEDIA_ENCRYPT_ALLOW');
  static const SIPMediaEncryption SIP_MEDIA_ENCRYPT_REQUIRE =
      SIPMediaEncryption._(
          2, _omitEnumNames ? '' : 'SIP_MEDIA_ENCRYPT_REQUIRE');

  static const $core.List<SIPMediaEncryption> values = <SIPMediaEncryption>[
    SIP_MEDIA_ENCRYPT_DISABLE,
    SIP_MEDIA_ENCRYPT_ALLOW,
    SIP_MEDIA_ENCRYPT_REQUIRE,
  ];

  static final $core.List<SIPMediaEncryption?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SIPMediaEncryption? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SIPMediaEncryption._(super.value, super.name);
}

class ProviderType extends $pb.ProtobufEnum {
  static const ProviderType PROVIDER_TYPE_UNKNOWN =
      ProviderType._(0, _omitEnumNames ? '' : 'PROVIDER_TYPE_UNKNOWN');
  static const ProviderType PROVIDER_TYPE_INTERNAL =
      ProviderType._(1, _omitEnumNames ? '' : 'PROVIDER_TYPE_INTERNAL');
  static const ProviderType PROVIDER_TYPE_EXTERNAL =
      ProviderType._(2, _omitEnumNames ? '' : 'PROVIDER_TYPE_EXTERNAL');

  static const $core.List<ProviderType> values = <ProviderType>[
    PROVIDER_TYPE_UNKNOWN,
    PROVIDER_TYPE_INTERNAL,
    PROVIDER_TYPE_EXTERNAL,
  ];

  static final $core.List<ProviderType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ProviderType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ProviderType._(super.value, super.name);
}

class SIPCallStatus extends $pb.ProtobufEnum {
  static const SIPCallStatus SCS_CALL_INCOMING =
      SIPCallStatus._(0, _omitEnumNames ? '' : 'SCS_CALL_INCOMING');
  static const SIPCallStatus SCS_PARTICIPANT_JOINED =
      SIPCallStatus._(1, _omitEnumNames ? '' : 'SCS_PARTICIPANT_JOINED');
  static const SIPCallStatus SCS_ACTIVE =
      SIPCallStatus._(2, _omitEnumNames ? '' : 'SCS_ACTIVE');
  static const SIPCallStatus SCS_DISCONNECTED =
      SIPCallStatus._(3, _omitEnumNames ? '' : 'SCS_DISCONNECTED');
  static const SIPCallStatus SCS_ERROR =
      SIPCallStatus._(4, _omitEnumNames ? '' : 'SCS_ERROR');

  static const $core.List<SIPCallStatus> values = <SIPCallStatus>[
    SCS_CALL_INCOMING,
    SCS_PARTICIPANT_JOINED,
    SCS_ACTIVE,
    SCS_DISCONNECTED,
    SCS_ERROR,
  ];

  static final $core.List<SIPCallStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static SIPCallStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SIPCallStatus._(super.value, super.name);
}

class SIPTransferStatus extends $pb.ProtobufEnum {
  static const SIPTransferStatus STS_TRANSFER_ONGOING =
      SIPTransferStatus._(0, _omitEnumNames ? '' : 'STS_TRANSFER_ONGOING');
  static const SIPTransferStatus STS_TRANSFER_FAILED =
      SIPTransferStatus._(1, _omitEnumNames ? '' : 'STS_TRANSFER_FAILED');
  static const SIPTransferStatus STS_TRANSFER_SUCCESSFUL =
      SIPTransferStatus._(2, _omitEnumNames ? '' : 'STS_TRANSFER_SUCCESSFUL');

  static const $core.List<SIPTransferStatus> values = <SIPTransferStatus>[
    STS_TRANSFER_ONGOING,
    STS_TRANSFER_FAILED,
    STS_TRANSFER_SUCCESSFUL,
  ];

  static final $core.List<SIPTransferStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SIPTransferStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SIPTransferStatus._(super.value, super.name);
}

class SIPFeature extends $pb.ProtobufEnum {
  static const SIPFeature NONE = SIPFeature._(0, _omitEnumNames ? '' : 'NONE');
  static const SIPFeature KRISP_ENABLED =
      SIPFeature._(1, _omitEnumNames ? '' : 'KRISP_ENABLED');

  static const $core.List<SIPFeature> values = <SIPFeature>[
    NONE,
    KRISP_ENABLED,
  ];

  static final $core.List<SIPFeature?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static SIPFeature? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SIPFeature._(super.value, super.name);
}

class SIPCallDirection extends $pb.ProtobufEnum {
  static const SIPCallDirection SCD_UNKNOWN =
      SIPCallDirection._(0, _omitEnumNames ? '' : 'SCD_UNKNOWN');
  static const SIPCallDirection SCD_INBOUND =
      SIPCallDirection._(1, _omitEnumNames ? '' : 'SCD_INBOUND');
  static const SIPCallDirection SCD_OUTBOUND =
      SIPCallDirection._(2, _omitEnumNames ? '' : 'SCD_OUTBOUND');

  static const $core.List<SIPCallDirection> values = <SIPCallDirection>[
    SCD_UNKNOWN,
    SCD_INBOUND,
    SCD_OUTBOUND,
  ];

  static final $core.List<SIPCallDirection?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SIPCallDirection? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SIPCallDirection._(super.value, super.name);
}

class SIPTrunkInfo_TrunkKind extends $pb.ProtobufEnum {
  static const SIPTrunkInfo_TrunkKind TRUNK_LEGACY =
      SIPTrunkInfo_TrunkKind._(0, _omitEnumNames ? '' : 'TRUNK_LEGACY');
  static const SIPTrunkInfo_TrunkKind TRUNK_INBOUND =
      SIPTrunkInfo_TrunkKind._(1, _omitEnumNames ? '' : 'TRUNK_INBOUND');
  static const SIPTrunkInfo_TrunkKind TRUNK_OUTBOUND =
      SIPTrunkInfo_TrunkKind._(2, _omitEnumNames ? '' : 'TRUNK_OUTBOUND');

  static const $core.List<SIPTrunkInfo_TrunkKind> values =
      <SIPTrunkInfo_TrunkKind>[
    TRUNK_LEGACY,
    TRUNK_INBOUND,
    TRUNK_OUTBOUND,
  ];

  static final $core.List<SIPTrunkInfo_TrunkKind?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SIPTrunkInfo_TrunkKind? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SIPTrunkInfo_TrunkKind._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
