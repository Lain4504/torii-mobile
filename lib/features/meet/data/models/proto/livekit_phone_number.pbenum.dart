//
//  Generated code. Do not modify.
//  source: livekit_phone_number.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Phone number status enumeration
class PhoneNumberStatus extends $pb.ProtobufEnum {
  static const PhoneNumberStatus PHONE_NUMBER_STATUS_UNSPECIFIED = PhoneNumberStatus._(0, _omitEnumNames ? '' : 'PHONE_NUMBER_STATUS_UNSPECIFIED');
  static const PhoneNumberStatus PHONE_NUMBER_STATUS_ACTIVE = PhoneNumberStatus._(1, _omitEnumNames ? '' : 'PHONE_NUMBER_STATUS_ACTIVE');
  static const PhoneNumberStatus PHONE_NUMBER_STATUS_PENDING = PhoneNumberStatus._(2, _omitEnumNames ? '' : 'PHONE_NUMBER_STATUS_PENDING');
  static const PhoneNumberStatus PHONE_NUMBER_STATUS_RELEASED = PhoneNumberStatus._(3, _omitEnumNames ? '' : 'PHONE_NUMBER_STATUS_RELEASED');
  static const PhoneNumberStatus PHONE_NUMBER_STATUS_OFFLINE = PhoneNumberStatus._(4, _omitEnumNames ? '' : 'PHONE_NUMBER_STATUS_OFFLINE');

  static const $core.List<PhoneNumberStatus> values = <PhoneNumberStatus> [
    PHONE_NUMBER_STATUS_UNSPECIFIED,
    PHONE_NUMBER_STATUS_ACTIVE,
    PHONE_NUMBER_STATUS_PENDING,
    PHONE_NUMBER_STATUS_RELEASED,
    PHONE_NUMBER_STATUS_OFFLINE,
  ];

  static final $core.Map<$core.int, PhoneNumberStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PhoneNumberStatus? valueOf($core.int value) => _byValue[value];

  const PhoneNumberStatus._($core.int v, $core.String n) : super(v, n);
}

/// Phone number type enumeration
class PhoneNumberType extends $pb.ProtobufEnum {
  static const PhoneNumberType PHONE_NUMBER_TYPE_UNKNOWN = PhoneNumberType._(0, _omitEnumNames ? '' : 'PHONE_NUMBER_TYPE_UNKNOWN');
  static const PhoneNumberType PHONE_NUMBER_TYPE_MOBILE = PhoneNumberType._(1, _omitEnumNames ? '' : 'PHONE_NUMBER_TYPE_MOBILE');
  static const PhoneNumberType PHONE_NUMBER_TYPE_LOCAL = PhoneNumberType._(2, _omitEnumNames ? '' : 'PHONE_NUMBER_TYPE_LOCAL');
  static const PhoneNumberType PHONE_NUMBER_TYPE_TOLL_FREE = PhoneNumberType._(3, _omitEnumNames ? '' : 'PHONE_NUMBER_TYPE_TOLL_FREE');

  static const $core.List<PhoneNumberType> values = <PhoneNumberType> [
    PHONE_NUMBER_TYPE_UNKNOWN,
    PHONE_NUMBER_TYPE_MOBILE,
    PHONE_NUMBER_TYPE_LOCAL,
    PHONE_NUMBER_TYPE_TOLL_FREE,
  ];

  static final $core.Map<$core.int, PhoneNumberType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PhoneNumberType? valueOf($core.int value) => _byValue[value];

  const PhoneNumberType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
