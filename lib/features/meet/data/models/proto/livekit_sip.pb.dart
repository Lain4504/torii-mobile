//
//  Generated code. Do not modify.
//  source: livekit_sip.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/any.pb.dart' as $11;
import 'google/protobuf/duration.pb.dart' as $10;
import 'google/protobuf/empty.pb.dart' as $3;
import 'livekit_models.pb.dart' as $2;
import 'livekit_models.pbenum.dart' as $2;
import 'livekit_room.pb.dart' as $9;
import 'livekit_sip.pbenum.dart';

export 'livekit_sip.pbenum.dart';

/// SIPStatus is returned as an error detail in CreateSIPParticipant.
class SIPStatus extends $pb.GeneratedMessage {
  factory SIPStatus({
    SIPStatusCode? code,
    $core.String? status,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  SIPStatus._() : super();
  factory SIPStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPStatus', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..e<SIPStatusCode>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: SIPStatusCode.SIP_STATUS_UNKNOWN, valueOf: SIPStatusCode.valueOf, enumValues: SIPStatusCode.values)
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPStatus clone() => SIPStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPStatus copyWith(void Function(SIPStatus) updates) => super.copyWith((message) => updates(message as SIPStatus)) as SIPStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPStatus create() => SIPStatus._();
  SIPStatus createEmptyInstance() => create();
  static $pb.PbList<SIPStatus> createRepeated() => $pb.PbList<SIPStatus>();
  @$core.pragma('dart2js:noInline')
  static SIPStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPStatus>(create);
  static SIPStatus? _defaultInstance;

  @$pb.TagNumber(1)
  SIPStatusCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(SIPStatusCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class CreateSIPTrunkRequest extends $pb.GeneratedMessage {
  factory CreateSIPTrunkRequest({
    $core.Iterable<$core.String>? inboundAddresses,
    $core.String? outboundAddress,
    $core.String? outboundNumber,
  @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.String>? inboundNumbersRegex,
    $core.String? inboundUsername,
    $core.String? inboundPassword,
    $core.String? outboundUsername,
    $core.String? outboundPassword,
    $core.Iterable<$core.String>? inboundNumbers,
    $core.String? name,
    $core.String? metadata,
  }) {
    final $result = create();
    if (inboundAddresses != null) {
      $result.inboundAddresses.addAll(inboundAddresses);
    }
    if (outboundAddress != null) {
      $result.outboundAddress = outboundAddress;
    }
    if (outboundNumber != null) {
      $result.outboundNumber = outboundNumber;
    }
    if (inboundNumbersRegex != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.inboundNumbersRegex.addAll(inboundNumbersRegex);
    }
    if (inboundUsername != null) {
      $result.inboundUsername = inboundUsername;
    }
    if (inboundPassword != null) {
      $result.inboundPassword = inboundPassword;
    }
    if (outboundUsername != null) {
      $result.outboundUsername = outboundUsername;
    }
    if (outboundPassword != null) {
      $result.outboundPassword = outboundPassword;
    }
    if (inboundNumbers != null) {
      $result.inboundNumbers.addAll(inboundNumbers);
    }
    if (name != null) {
      $result.name = name;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  CreateSIPTrunkRequest._() : super();
  factory CreateSIPTrunkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSIPTrunkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSIPTrunkRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'inboundAddresses')
    ..aOS(2, _omitFieldNames ? '' : 'outboundAddress')
    ..aOS(3, _omitFieldNames ? '' : 'outboundNumber')
    ..pPS(4, _omitFieldNames ? '' : 'inboundNumbersRegex')
    ..aOS(5, _omitFieldNames ? '' : 'inboundUsername')
    ..aOS(6, _omitFieldNames ? '' : 'inboundPassword')
    ..aOS(7, _omitFieldNames ? '' : 'outboundUsername')
    ..aOS(8, _omitFieldNames ? '' : 'outboundPassword')
    ..pPS(9, _omitFieldNames ? '' : 'inboundNumbers')
    ..aOS(10, _omitFieldNames ? '' : 'name')
    ..aOS(11, _omitFieldNames ? '' : 'metadata')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSIPTrunkRequest clone() => CreateSIPTrunkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSIPTrunkRequest copyWith(void Function(CreateSIPTrunkRequest) updates) => super.copyWith((message) => updates(message as CreateSIPTrunkRequest)) as CreateSIPTrunkRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSIPTrunkRequest create() => CreateSIPTrunkRequest._();
  CreateSIPTrunkRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSIPTrunkRequest> createRepeated() => $pb.PbList<CreateSIPTrunkRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSIPTrunkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSIPTrunkRequest>(create);
  static CreateSIPTrunkRequest? _defaultInstance;

  /// CIDR or IPs that traffic is accepted from
  /// An empty list means all inbound traffic is accepted.
  @$pb.TagNumber(1)
  $core.List<$core.String> get inboundAddresses => $_getList(0);

  /// IP that SIP INVITE is sent too
  @$pb.TagNumber(2)
  $core.String get outboundAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set outboundAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOutboundAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearOutboundAddress() => clearField(2);

  /// Number used to make outbound calls
  @$pb.TagNumber(3)
  $core.String get outboundNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set outboundNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOutboundNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearOutboundNumber() => clearField(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.List<$core.String> get inboundNumbersRegex => $_getList(3);

  /// Username and password used to authenticate inbound and outbound SIP invites
  /// May be empty to have no Authentication
  @$pb.TagNumber(5)
  $core.String get inboundUsername => $_getSZ(4);
  @$pb.TagNumber(5)
  set inboundUsername($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInboundUsername() => $_has(4);
  @$pb.TagNumber(5)
  void clearInboundUsername() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get inboundPassword => $_getSZ(5);
  @$pb.TagNumber(6)
  set inboundPassword($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasInboundPassword() => $_has(5);
  @$pb.TagNumber(6)
  void clearInboundPassword() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get outboundUsername => $_getSZ(6);
  @$pb.TagNumber(7)
  set outboundUsername($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOutboundUsername() => $_has(6);
  @$pb.TagNumber(7)
  void clearOutboundUsername() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get outboundPassword => $_getSZ(7);
  @$pb.TagNumber(8)
  set outboundPassword($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOutboundPassword() => $_has(7);
  @$pb.TagNumber(8)
  void clearOutboundPassword() => clearField(8);

  /// Accepted `To` values. This Trunk will only accept a call made to
  /// these numbers. This allows you to have distinct Trunks for different phone
  /// numbers at the same provider.
  @$pb.TagNumber(9)
  $core.List<$core.String> get inboundNumbers => $_getList(8);

  /// Optional human-readable name for the Trunk.
  @$pb.TagNumber(10)
  $core.String get name => $_getSZ(9);
  @$pb.TagNumber(10)
  set name($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasName() => $_has(9);
  @$pb.TagNumber(10)
  void clearName() => clearField(10);

  /// Optional user-defined metadata for the Trunk.
  @$pb.TagNumber(11)
  $core.String get metadata => $_getSZ(10);
  @$pb.TagNumber(11)
  set metadata($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasMetadata() => $_has(10);
  @$pb.TagNumber(11)
  void clearMetadata() => clearField(11);
}

class ProviderInfo extends $pb.GeneratedMessage {
  factory ProviderInfo({
    $core.String? id,
    $core.String? name,
    ProviderType? type,
    $core.bool? preventTransfer,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (type != null) {
      $result.type = type;
    }
    if (preventTransfer != null) {
      $result.preventTransfer = preventTransfer;
    }
    return $result;
  }
  ProviderInfo._() : super();
  factory ProviderInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProviderInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProviderInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..e<ProviderType>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: ProviderType.PROVIDER_TYPE_UNKNOWN, valueOf: ProviderType.valueOf, enumValues: ProviderType.values)
    ..aOB(4, _omitFieldNames ? '' : 'preventTransfer')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProviderInfo clone() => ProviderInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProviderInfo copyWith(void Function(ProviderInfo) updates) => super.copyWith((message) => updates(message as ProviderInfo)) as ProviderInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProviderInfo create() => ProviderInfo._();
  ProviderInfo createEmptyInstance() => create();
  static $pb.PbList<ProviderInfo> createRepeated() => $pb.PbList<ProviderInfo>();
  @$core.pragma('dart2js:noInline')
  static ProviderInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProviderInfo>(create);
  static ProviderInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  ProviderType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(ProviderType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get preventTransfer => $_getBF(3);
  @$pb.TagNumber(4)
  set preventTransfer($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPreventTransfer() => $_has(3);
  @$pb.TagNumber(4)
  void clearPreventTransfer() => clearField(4);
}

class SIPTrunkInfo extends $pb.GeneratedMessage {
  factory SIPTrunkInfo({
    $core.String? sipTrunkId,
    $core.Iterable<$core.String>? inboundAddresses,
    $core.String? outboundAddress,
    $core.String? outboundNumber,
  @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.String>? inboundNumbersRegex,
    $core.String? inboundUsername,
    $core.String? inboundPassword,
    $core.String? outboundUsername,
    $core.String? outboundPassword,
    $core.Iterable<$core.String>? inboundNumbers,
    $core.String? name,
    $core.String? metadata,
    SIPTransport? transport,
    SIPTrunkInfo_TrunkKind? kind,
  }) {
    final $result = create();
    if (sipTrunkId != null) {
      $result.sipTrunkId = sipTrunkId;
    }
    if (inboundAddresses != null) {
      $result.inboundAddresses.addAll(inboundAddresses);
    }
    if (outboundAddress != null) {
      $result.outboundAddress = outboundAddress;
    }
    if (outboundNumber != null) {
      $result.outboundNumber = outboundNumber;
    }
    if (inboundNumbersRegex != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.inboundNumbersRegex.addAll(inboundNumbersRegex);
    }
    if (inboundUsername != null) {
      $result.inboundUsername = inboundUsername;
    }
    if (inboundPassword != null) {
      $result.inboundPassword = inboundPassword;
    }
    if (outboundUsername != null) {
      $result.outboundUsername = outboundUsername;
    }
    if (outboundPassword != null) {
      $result.outboundPassword = outboundPassword;
    }
    if (inboundNumbers != null) {
      $result.inboundNumbers.addAll(inboundNumbers);
    }
    if (name != null) {
      $result.name = name;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (transport != null) {
      $result.transport = transport;
    }
    if (kind != null) {
      $result.kind = kind;
    }
    return $result;
  }
  SIPTrunkInfo._() : super();
  factory SIPTrunkInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPTrunkInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPTrunkInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..pPS(2, _omitFieldNames ? '' : 'inboundAddresses')
    ..aOS(3, _omitFieldNames ? '' : 'outboundAddress')
    ..aOS(4, _omitFieldNames ? '' : 'outboundNumber')
    ..pPS(5, _omitFieldNames ? '' : 'inboundNumbersRegex')
    ..aOS(6, _omitFieldNames ? '' : 'inboundUsername')
    ..aOS(7, _omitFieldNames ? '' : 'inboundPassword')
    ..aOS(8, _omitFieldNames ? '' : 'outboundUsername')
    ..aOS(9, _omitFieldNames ? '' : 'outboundPassword')
    ..pPS(10, _omitFieldNames ? '' : 'inboundNumbers')
    ..aOS(11, _omitFieldNames ? '' : 'name')
    ..aOS(12, _omitFieldNames ? '' : 'metadata')
    ..e<SIPTransport>(13, _omitFieldNames ? '' : 'transport', $pb.PbFieldType.OE, defaultOrMaker: SIPTransport.SIP_TRANSPORT_AUTO, valueOf: SIPTransport.valueOf, enumValues: SIPTransport.values)
    ..e<SIPTrunkInfo_TrunkKind>(14, _omitFieldNames ? '' : 'kind', $pb.PbFieldType.OE, defaultOrMaker: SIPTrunkInfo_TrunkKind.TRUNK_LEGACY, valueOf: SIPTrunkInfo_TrunkKind.valueOf, enumValues: SIPTrunkInfo_TrunkKind.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPTrunkInfo clone() => SIPTrunkInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPTrunkInfo copyWith(void Function(SIPTrunkInfo) updates) => super.copyWith((message) => updates(message as SIPTrunkInfo)) as SIPTrunkInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPTrunkInfo create() => SIPTrunkInfo._();
  SIPTrunkInfo createEmptyInstance() => create();
  static $pb.PbList<SIPTrunkInfo> createRepeated() => $pb.PbList<SIPTrunkInfo>();
  @$core.pragma('dart2js:noInline')
  static SIPTrunkInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPTrunkInfo>(create);
  static SIPTrunkInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => clearField(1);

  /// CIDR or IPs that traffic is accepted from
  /// An empty list means all inbound traffic is accepted.
  @$pb.TagNumber(2)
  $core.List<$core.String> get inboundAddresses => $_getList(1);

  /// IP that SIP INVITE is sent too
  @$pb.TagNumber(3)
  $core.String get outboundAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set outboundAddress($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOutboundAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearOutboundAddress() => clearField(3);

  /// Number used to make outbound calls
  @$pb.TagNumber(4)
  $core.String get outboundNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set outboundNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOutboundNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearOutboundNumber() => clearField(4);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.List<$core.String> get inboundNumbersRegex => $_getList(4);

  /// Username and password used to authenticate inbound and outbound SIP invites
  /// May be empty to have no Authentication
  @$pb.TagNumber(6)
  $core.String get inboundUsername => $_getSZ(5);
  @$pb.TagNumber(6)
  set inboundUsername($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasInboundUsername() => $_has(5);
  @$pb.TagNumber(6)
  void clearInboundUsername() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get inboundPassword => $_getSZ(6);
  @$pb.TagNumber(7)
  set inboundPassword($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasInboundPassword() => $_has(6);
  @$pb.TagNumber(7)
  void clearInboundPassword() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get outboundUsername => $_getSZ(7);
  @$pb.TagNumber(8)
  set outboundUsername($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOutboundUsername() => $_has(7);
  @$pb.TagNumber(8)
  void clearOutboundUsername() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get outboundPassword => $_getSZ(8);
  @$pb.TagNumber(9)
  set outboundPassword($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasOutboundPassword() => $_has(8);
  @$pb.TagNumber(9)
  void clearOutboundPassword() => clearField(9);

  /// Accepted `To` values. This Trunk will only accept a call made to
  /// these numbers. This allows you to have distinct Trunks for different phone
  /// numbers at the same provider.
  @$pb.TagNumber(10)
  $core.List<$core.String> get inboundNumbers => $_getList(9);

  /// Human-readable name for the Trunk.
  @$pb.TagNumber(11)
  $core.String get name => $_getSZ(10);
  @$pb.TagNumber(11)
  set name($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasName() => $_has(10);
  @$pb.TagNumber(11)
  void clearName() => clearField(11);

  /// User-defined metadata for the Trunk.
  @$pb.TagNumber(12)
  $core.String get metadata => $_getSZ(11);
  @$pb.TagNumber(12)
  set metadata($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasMetadata() => $_has(11);
  @$pb.TagNumber(12)
  void clearMetadata() => clearField(12);

  /// Transport used for inbound and outbound calls.
  @$pb.TagNumber(13)
  SIPTransport get transport => $_getN(12);
  @$pb.TagNumber(13)
  set transport(SIPTransport v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasTransport() => $_has(12);
  @$pb.TagNumber(13)
  void clearTransport() => clearField(13);

  @$pb.TagNumber(14)
  SIPTrunkInfo_TrunkKind get kind => $_getN(13);
  @$pb.TagNumber(14)
  set kind(SIPTrunkInfo_TrunkKind v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasKind() => $_has(13);
  @$pb.TagNumber(14)
  void clearKind() => clearField(14);
}

class CreateSIPInboundTrunkRequest extends $pb.GeneratedMessage {
  factory CreateSIPInboundTrunkRequest({
    SIPInboundTrunkInfo? trunk,
  }) {
    final $result = create();
    if (trunk != null) {
      $result.trunk = trunk;
    }
    return $result;
  }
  CreateSIPInboundTrunkRequest._() : super();
  factory CreateSIPInboundTrunkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSIPInboundTrunkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSIPInboundTrunkRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<SIPInboundTrunkInfo>(1, _omitFieldNames ? '' : 'trunk', subBuilder: SIPInboundTrunkInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSIPInboundTrunkRequest clone() => CreateSIPInboundTrunkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSIPInboundTrunkRequest copyWith(void Function(CreateSIPInboundTrunkRequest) updates) => super.copyWith((message) => updates(message as CreateSIPInboundTrunkRequest)) as CreateSIPInboundTrunkRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSIPInboundTrunkRequest create() => CreateSIPInboundTrunkRequest._();
  CreateSIPInboundTrunkRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSIPInboundTrunkRequest> createRepeated() => $pb.PbList<CreateSIPInboundTrunkRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSIPInboundTrunkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSIPInboundTrunkRequest>(create);
  static CreateSIPInboundTrunkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  SIPInboundTrunkInfo get trunk => $_getN(0);
  @$pb.TagNumber(1)
  set trunk(SIPInboundTrunkInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrunk() => clearField(1);
  @$pb.TagNumber(1)
  SIPInboundTrunkInfo ensureTrunk() => $_ensure(0);
}

enum UpdateSIPInboundTrunkRequest_Action {
  replace, 
  update, 
  notSet
}

class UpdateSIPInboundTrunkRequest extends $pb.GeneratedMessage {
  factory UpdateSIPInboundTrunkRequest({
    $core.String? sipTrunkId,
    SIPInboundTrunkInfo? replace,
    SIPInboundTrunkUpdate? update,
  }) {
    final $result = create();
    if (sipTrunkId != null) {
      $result.sipTrunkId = sipTrunkId;
    }
    if (replace != null) {
      $result.replace = replace;
    }
    if (update != null) {
      $result.update = update;
    }
    return $result;
  }
  UpdateSIPInboundTrunkRequest._() : super();
  factory UpdateSIPInboundTrunkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSIPInboundTrunkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UpdateSIPInboundTrunkRequest_Action> _UpdateSIPInboundTrunkRequest_ActionByTag = {
    2 : UpdateSIPInboundTrunkRequest_Action.replace,
    3 : UpdateSIPInboundTrunkRequest_Action.update,
    0 : UpdateSIPInboundTrunkRequest_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSIPInboundTrunkRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..aOM<SIPInboundTrunkInfo>(2, _omitFieldNames ? '' : 'replace', subBuilder: SIPInboundTrunkInfo.create)
    ..aOM<SIPInboundTrunkUpdate>(3, _omitFieldNames ? '' : 'update', subBuilder: SIPInboundTrunkUpdate.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSIPInboundTrunkRequest clone() => UpdateSIPInboundTrunkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSIPInboundTrunkRequest copyWith(void Function(UpdateSIPInboundTrunkRequest) updates) => super.copyWith((message) => updates(message as UpdateSIPInboundTrunkRequest)) as UpdateSIPInboundTrunkRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSIPInboundTrunkRequest create() => UpdateSIPInboundTrunkRequest._();
  UpdateSIPInboundTrunkRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSIPInboundTrunkRequest> createRepeated() => $pb.PbList<UpdateSIPInboundTrunkRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSIPInboundTrunkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSIPInboundTrunkRequest>(create);
  static UpdateSIPInboundTrunkRequest? _defaultInstance;

  UpdateSIPInboundTrunkRequest_Action whichAction() => _UpdateSIPInboundTrunkRequest_ActionByTag[$_whichOneof(0)]!;
  void clearAction() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => clearField(1);

  @$pb.TagNumber(2)
  SIPInboundTrunkInfo get replace => $_getN(1);
  @$pb.TagNumber(2)
  set replace(SIPInboundTrunkInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasReplace() => $_has(1);
  @$pb.TagNumber(2)
  void clearReplace() => clearField(2);
  @$pb.TagNumber(2)
  SIPInboundTrunkInfo ensureReplace() => $_ensure(1);

  @$pb.TagNumber(3)
  SIPInboundTrunkUpdate get update => $_getN(2);
  @$pb.TagNumber(3)
  set update(SIPInboundTrunkUpdate v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdate() => clearField(3);
  @$pb.TagNumber(3)
  SIPInboundTrunkUpdate ensureUpdate() => $_ensure(2);
}

class SIPInboundTrunkInfo extends $pb.GeneratedMessage {
  factory SIPInboundTrunkInfo({
    $core.String? sipTrunkId,
    $core.String? name,
    $core.String? metadata,
    $core.Iterable<$core.String>? numbers,
    $core.Iterable<$core.String>? allowedAddresses,
    $core.Iterable<$core.String>? allowedNumbers,
    $core.String? authUsername,
    $core.String? authPassword,
    $core.Map<$core.String, $core.String>? headers,
    $core.Map<$core.String, $core.String>? headersToAttributes,
    $10.Duration? ringingTimeout,
    $10.Duration? maxCallDuration,
    $core.bool? krispEnabled,
    $core.Map<$core.String, $core.String>? attributesToHeaders,
    SIPHeaderOptions? includeHeaders,
    SIPMediaEncryption? mediaEncryption,
  }) {
    final $result = create();
    if (sipTrunkId != null) {
      $result.sipTrunkId = sipTrunkId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (numbers != null) {
      $result.numbers.addAll(numbers);
    }
    if (allowedAddresses != null) {
      $result.allowedAddresses.addAll(allowedAddresses);
    }
    if (allowedNumbers != null) {
      $result.allowedNumbers.addAll(allowedNumbers);
    }
    if (authUsername != null) {
      $result.authUsername = authUsername;
    }
    if (authPassword != null) {
      $result.authPassword = authPassword;
    }
    if (headers != null) {
      $result.headers.addAll(headers);
    }
    if (headersToAttributes != null) {
      $result.headersToAttributes.addAll(headersToAttributes);
    }
    if (ringingTimeout != null) {
      $result.ringingTimeout = ringingTimeout;
    }
    if (maxCallDuration != null) {
      $result.maxCallDuration = maxCallDuration;
    }
    if (krispEnabled != null) {
      $result.krispEnabled = krispEnabled;
    }
    if (attributesToHeaders != null) {
      $result.attributesToHeaders.addAll(attributesToHeaders);
    }
    if (includeHeaders != null) {
      $result.includeHeaders = includeHeaders;
    }
    if (mediaEncryption != null) {
      $result.mediaEncryption = mediaEncryption;
    }
    return $result;
  }
  SIPInboundTrunkInfo._() : super();
  factory SIPInboundTrunkInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPInboundTrunkInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPInboundTrunkInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'metadata')
    ..pPS(4, _omitFieldNames ? '' : 'numbers')
    ..pPS(5, _omitFieldNames ? '' : 'allowedAddresses')
    ..pPS(6, _omitFieldNames ? '' : 'allowedNumbers')
    ..aOS(7, _omitFieldNames ? '' : 'authUsername')
    ..aOS(8, _omitFieldNames ? '' : 'authPassword')
    ..m<$core.String, $core.String>(9, _omitFieldNames ? '' : 'headers', entryClassName: 'SIPInboundTrunkInfo.HeadersEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..m<$core.String, $core.String>(10, _omitFieldNames ? '' : 'headersToAttributes', entryClassName: 'SIPInboundTrunkInfo.HeadersToAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..aOM<$10.Duration>(11, _omitFieldNames ? '' : 'ringingTimeout', subBuilder: $10.Duration.create)
    ..aOM<$10.Duration>(12, _omitFieldNames ? '' : 'maxCallDuration', subBuilder: $10.Duration.create)
    ..aOB(13, _omitFieldNames ? '' : 'krispEnabled')
    ..m<$core.String, $core.String>(14, _omitFieldNames ? '' : 'attributesToHeaders', entryClassName: 'SIPInboundTrunkInfo.AttributesToHeadersEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..e<SIPHeaderOptions>(15, _omitFieldNames ? '' : 'includeHeaders', $pb.PbFieldType.OE, defaultOrMaker: SIPHeaderOptions.SIP_NO_HEADERS, valueOf: SIPHeaderOptions.valueOf, enumValues: SIPHeaderOptions.values)
    ..e<SIPMediaEncryption>(16, _omitFieldNames ? '' : 'mediaEncryption', $pb.PbFieldType.OE, defaultOrMaker: SIPMediaEncryption.SIP_MEDIA_ENCRYPT_DISABLE, valueOf: SIPMediaEncryption.valueOf, enumValues: SIPMediaEncryption.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPInboundTrunkInfo clone() => SIPInboundTrunkInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPInboundTrunkInfo copyWith(void Function(SIPInboundTrunkInfo) updates) => super.copyWith((message) => updates(message as SIPInboundTrunkInfo)) as SIPInboundTrunkInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPInboundTrunkInfo create() => SIPInboundTrunkInfo._();
  SIPInboundTrunkInfo createEmptyInstance() => create();
  static $pb.PbList<SIPInboundTrunkInfo> createRepeated() => $pb.PbList<SIPInboundTrunkInfo>();
  @$core.pragma('dart2js:noInline')
  static SIPInboundTrunkInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPInboundTrunkInfo>(create);
  static SIPInboundTrunkInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => clearField(1);

  /// Human-readable name for the Trunk.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  /// User-defined metadata for the Trunk.
  @$pb.TagNumber(3)
  $core.String get metadata => $_getSZ(2);
  @$pb.TagNumber(3)
  set metadata($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearMetadata() => clearField(3);

  /// Numbers associated with LiveKit SIP. The Trunk will only accept calls made to these numbers.
  /// Creating multiple Trunks with different phone numbers allows having different rules for a single provider.
  @$pb.TagNumber(4)
  $core.List<$core.String> get numbers => $_getList(3);

  /// CIDR or IPs that traffic is accepted from.
  /// An empty list means all inbound traffic is accepted.
  @$pb.TagNumber(5)
  $core.List<$core.String> get allowedAddresses => $_getList(4);

  /// Numbers that are allowed to make calls to this Trunk.
  /// An empty list means calls from any phone number is accepted.
  @$pb.TagNumber(6)
  $core.List<$core.String> get allowedNumbers => $_getList(5);

  /// Username and password used to authenticate inbound SIP invites.
  /// May be empty to have no authentication.
  @$pb.TagNumber(7)
  $core.String get authUsername => $_getSZ(6);
  @$pb.TagNumber(7)
  set authUsername($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAuthUsername() => $_has(6);
  @$pb.TagNumber(7)
  void clearAuthUsername() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get authPassword => $_getSZ(7);
  @$pb.TagNumber(8)
  set authPassword($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAuthPassword() => $_has(7);
  @$pb.TagNumber(8)
  void clearAuthPassword() => clearField(8);

  /// Include these SIP X-* headers in 200 OK responses.
  @$pb.TagNumber(9)
  $core.Map<$core.String, $core.String> get headers => $_getMap(8);

  /// Map SIP X-* headers from INVITE to SIP participant attributes.
  @$pb.TagNumber(10)
  $core.Map<$core.String, $core.String> get headersToAttributes => $_getMap(9);

  /// Max time for the caller to wait for track subscription.
  @$pb.TagNumber(11)
  $10.Duration get ringingTimeout => $_getN(10);
  @$pb.TagNumber(11)
  set ringingTimeout($10.Duration v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasRingingTimeout() => $_has(10);
  @$pb.TagNumber(11)
  void clearRingingTimeout() => clearField(11);
  @$pb.TagNumber(11)
  $10.Duration ensureRingingTimeout() => $_ensure(10);

  /// Max call duration.
  @$pb.TagNumber(12)
  $10.Duration get maxCallDuration => $_getN(11);
  @$pb.TagNumber(12)
  set maxCallDuration($10.Duration v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasMaxCallDuration() => $_has(11);
  @$pb.TagNumber(12)
  void clearMaxCallDuration() => clearField(12);
  @$pb.TagNumber(12)
  $10.Duration ensureMaxCallDuration() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.bool get krispEnabled => $_getBF(12);
  @$pb.TagNumber(13)
  set krispEnabled($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasKrispEnabled() => $_has(12);
  @$pb.TagNumber(13)
  void clearKrispEnabled() => clearField(13);

  /// Map LiveKit attributes to SIP X-* headers when sending BYE or REFER requests.
  /// Keys are the names of attributes and values are the names of X-* headers they will be mapped to.
  @$pb.TagNumber(14)
  $core.Map<$core.String, $core.String> get attributesToHeaders => $_getMap(13);

  ///  Map SIP headers from INVITE to sip.h.* participant attributes automatically.
  ///
  ///  When the names of required headers is known, using headers_to_attributes is strongly recommended.
  ///
  ///  When mapping INVITE headers to response headers with attributes_to_headers map,
  ///  lowercase header names should be used, for example: sip.h.x-custom-header.
  @$pb.TagNumber(15)
  SIPHeaderOptions get includeHeaders => $_getN(14);
  @$pb.TagNumber(15)
  set includeHeaders(SIPHeaderOptions v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasIncludeHeaders() => $_has(14);
  @$pb.TagNumber(15)
  void clearIncludeHeaders() => clearField(15);

  @$pb.TagNumber(16)
  SIPMediaEncryption get mediaEncryption => $_getN(15);
  @$pb.TagNumber(16)
  set mediaEncryption(SIPMediaEncryption v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasMediaEncryption() => $_has(15);
  @$pb.TagNumber(16)
  void clearMediaEncryption() => clearField(16);
}

class SIPInboundTrunkUpdate extends $pb.GeneratedMessage {
  factory SIPInboundTrunkUpdate({
    $2.ListUpdate? numbers,
    $2.ListUpdate? allowedAddresses,
    $2.ListUpdate? allowedNumbers,
    $core.String? authUsername,
    $core.String? authPassword,
    $core.String? name,
    $core.String? metadata,
    SIPMediaEncryption? mediaEncryption,
  }) {
    final $result = create();
    if (numbers != null) {
      $result.numbers = numbers;
    }
    if (allowedAddresses != null) {
      $result.allowedAddresses = allowedAddresses;
    }
    if (allowedNumbers != null) {
      $result.allowedNumbers = allowedNumbers;
    }
    if (authUsername != null) {
      $result.authUsername = authUsername;
    }
    if (authPassword != null) {
      $result.authPassword = authPassword;
    }
    if (name != null) {
      $result.name = name;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (mediaEncryption != null) {
      $result.mediaEncryption = mediaEncryption;
    }
    return $result;
  }
  SIPInboundTrunkUpdate._() : super();
  factory SIPInboundTrunkUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPInboundTrunkUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPInboundTrunkUpdate', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<$2.ListUpdate>(1, _omitFieldNames ? '' : 'numbers', subBuilder: $2.ListUpdate.create)
    ..aOM<$2.ListUpdate>(2, _omitFieldNames ? '' : 'allowedAddresses', subBuilder: $2.ListUpdate.create)
    ..aOM<$2.ListUpdate>(3, _omitFieldNames ? '' : 'allowedNumbers', subBuilder: $2.ListUpdate.create)
    ..aOS(4, _omitFieldNames ? '' : 'authUsername')
    ..aOS(5, _omitFieldNames ? '' : 'authPassword')
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..aOS(7, _omitFieldNames ? '' : 'metadata')
    ..e<SIPMediaEncryption>(8, _omitFieldNames ? '' : 'mediaEncryption', $pb.PbFieldType.OE, defaultOrMaker: SIPMediaEncryption.SIP_MEDIA_ENCRYPT_DISABLE, valueOf: SIPMediaEncryption.valueOf, enumValues: SIPMediaEncryption.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPInboundTrunkUpdate clone() => SIPInboundTrunkUpdate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPInboundTrunkUpdate copyWith(void Function(SIPInboundTrunkUpdate) updates) => super.copyWith((message) => updates(message as SIPInboundTrunkUpdate)) as SIPInboundTrunkUpdate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPInboundTrunkUpdate create() => SIPInboundTrunkUpdate._();
  SIPInboundTrunkUpdate createEmptyInstance() => create();
  static $pb.PbList<SIPInboundTrunkUpdate> createRepeated() => $pb.PbList<SIPInboundTrunkUpdate>();
  @$core.pragma('dart2js:noInline')
  static SIPInboundTrunkUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPInboundTrunkUpdate>(create);
  static SIPInboundTrunkUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $2.ListUpdate get numbers => $_getN(0);
  @$pb.TagNumber(1)
  set numbers($2.ListUpdate v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumbers() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumbers() => clearField(1);
  @$pb.TagNumber(1)
  $2.ListUpdate ensureNumbers() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.ListUpdate get allowedAddresses => $_getN(1);
  @$pb.TagNumber(2)
  set allowedAddresses($2.ListUpdate v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAllowedAddresses() => $_has(1);
  @$pb.TagNumber(2)
  void clearAllowedAddresses() => clearField(2);
  @$pb.TagNumber(2)
  $2.ListUpdate ensureAllowedAddresses() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.ListUpdate get allowedNumbers => $_getN(2);
  @$pb.TagNumber(3)
  set allowedNumbers($2.ListUpdate v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAllowedNumbers() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowedNumbers() => clearField(3);
  @$pb.TagNumber(3)
  $2.ListUpdate ensureAllowedNumbers() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get authUsername => $_getSZ(3);
  @$pb.TagNumber(4)
  set authUsername($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthUsername() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthUsername() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get authPassword => $_getSZ(4);
  @$pb.TagNumber(5)
  set authPassword($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAuthPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthPassword() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get metadata => $_getSZ(6);
  @$pb.TagNumber(7)
  set metadata($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMetadata() => $_has(6);
  @$pb.TagNumber(7)
  void clearMetadata() => clearField(7);

  @$pb.TagNumber(8)
  SIPMediaEncryption get mediaEncryption => $_getN(7);
  @$pb.TagNumber(8)
  set mediaEncryption(SIPMediaEncryption v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasMediaEncryption() => $_has(7);
  @$pb.TagNumber(8)
  void clearMediaEncryption() => clearField(8);
}

class CreateSIPOutboundTrunkRequest extends $pb.GeneratedMessage {
  factory CreateSIPOutboundTrunkRequest({
    SIPOutboundTrunkInfo? trunk,
  }) {
    final $result = create();
    if (trunk != null) {
      $result.trunk = trunk;
    }
    return $result;
  }
  CreateSIPOutboundTrunkRequest._() : super();
  factory CreateSIPOutboundTrunkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSIPOutboundTrunkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSIPOutboundTrunkRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<SIPOutboundTrunkInfo>(1, _omitFieldNames ? '' : 'trunk', subBuilder: SIPOutboundTrunkInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSIPOutboundTrunkRequest clone() => CreateSIPOutboundTrunkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSIPOutboundTrunkRequest copyWith(void Function(CreateSIPOutboundTrunkRequest) updates) => super.copyWith((message) => updates(message as CreateSIPOutboundTrunkRequest)) as CreateSIPOutboundTrunkRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSIPOutboundTrunkRequest create() => CreateSIPOutboundTrunkRequest._();
  CreateSIPOutboundTrunkRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSIPOutboundTrunkRequest> createRepeated() => $pb.PbList<CreateSIPOutboundTrunkRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSIPOutboundTrunkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSIPOutboundTrunkRequest>(create);
  static CreateSIPOutboundTrunkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  SIPOutboundTrunkInfo get trunk => $_getN(0);
  @$pb.TagNumber(1)
  set trunk(SIPOutboundTrunkInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrunk() => clearField(1);
  @$pb.TagNumber(1)
  SIPOutboundTrunkInfo ensureTrunk() => $_ensure(0);
}

enum UpdateSIPOutboundTrunkRequest_Action {
  replace, 
  update, 
  notSet
}

class UpdateSIPOutboundTrunkRequest extends $pb.GeneratedMessage {
  factory UpdateSIPOutboundTrunkRequest({
    $core.String? sipTrunkId,
    SIPOutboundTrunkInfo? replace,
    SIPOutboundTrunkUpdate? update,
  }) {
    final $result = create();
    if (sipTrunkId != null) {
      $result.sipTrunkId = sipTrunkId;
    }
    if (replace != null) {
      $result.replace = replace;
    }
    if (update != null) {
      $result.update = update;
    }
    return $result;
  }
  UpdateSIPOutboundTrunkRequest._() : super();
  factory UpdateSIPOutboundTrunkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSIPOutboundTrunkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UpdateSIPOutboundTrunkRequest_Action> _UpdateSIPOutboundTrunkRequest_ActionByTag = {
    2 : UpdateSIPOutboundTrunkRequest_Action.replace,
    3 : UpdateSIPOutboundTrunkRequest_Action.update,
    0 : UpdateSIPOutboundTrunkRequest_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSIPOutboundTrunkRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..aOM<SIPOutboundTrunkInfo>(2, _omitFieldNames ? '' : 'replace', subBuilder: SIPOutboundTrunkInfo.create)
    ..aOM<SIPOutboundTrunkUpdate>(3, _omitFieldNames ? '' : 'update', subBuilder: SIPOutboundTrunkUpdate.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSIPOutboundTrunkRequest clone() => UpdateSIPOutboundTrunkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSIPOutboundTrunkRequest copyWith(void Function(UpdateSIPOutboundTrunkRequest) updates) => super.copyWith((message) => updates(message as UpdateSIPOutboundTrunkRequest)) as UpdateSIPOutboundTrunkRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSIPOutboundTrunkRequest create() => UpdateSIPOutboundTrunkRequest._();
  UpdateSIPOutboundTrunkRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSIPOutboundTrunkRequest> createRepeated() => $pb.PbList<UpdateSIPOutboundTrunkRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSIPOutboundTrunkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSIPOutboundTrunkRequest>(create);
  static UpdateSIPOutboundTrunkRequest? _defaultInstance;

  UpdateSIPOutboundTrunkRequest_Action whichAction() => _UpdateSIPOutboundTrunkRequest_ActionByTag[$_whichOneof(0)]!;
  void clearAction() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => clearField(1);

  @$pb.TagNumber(2)
  SIPOutboundTrunkInfo get replace => $_getN(1);
  @$pb.TagNumber(2)
  set replace(SIPOutboundTrunkInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasReplace() => $_has(1);
  @$pb.TagNumber(2)
  void clearReplace() => clearField(2);
  @$pb.TagNumber(2)
  SIPOutboundTrunkInfo ensureReplace() => $_ensure(1);

  @$pb.TagNumber(3)
  SIPOutboundTrunkUpdate get update => $_getN(2);
  @$pb.TagNumber(3)
  set update(SIPOutboundTrunkUpdate v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdate() => clearField(3);
  @$pb.TagNumber(3)
  SIPOutboundTrunkUpdate ensureUpdate() => $_ensure(2);
}

class SIPOutboundTrunkInfo extends $pb.GeneratedMessage {
  factory SIPOutboundTrunkInfo({
    $core.String? sipTrunkId,
    $core.String? name,
    $core.String? metadata,
    $core.String? address,
    SIPTransport? transport,
    $core.Iterable<$core.String>? numbers,
    $core.String? authUsername,
    $core.String? authPassword,
    $core.Map<$core.String, $core.String>? headers,
    $core.Map<$core.String, $core.String>? headersToAttributes,
    $core.Map<$core.String, $core.String>? attributesToHeaders,
    SIPHeaderOptions? includeHeaders,
    SIPMediaEncryption? mediaEncryption,
    $core.String? destinationCountry,
  }) {
    final $result = create();
    if (sipTrunkId != null) {
      $result.sipTrunkId = sipTrunkId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (address != null) {
      $result.address = address;
    }
    if (transport != null) {
      $result.transport = transport;
    }
    if (numbers != null) {
      $result.numbers.addAll(numbers);
    }
    if (authUsername != null) {
      $result.authUsername = authUsername;
    }
    if (authPassword != null) {
      $result.authPassword = authPassword;
    }
    if (headers != null) {
      $result.headers.addAll(headers);
    }
    if (headersToAttributes != null) {
      $result.headersToAttributes.addAll(headersToAttributes);
    }
    if (attributesToHeaders != null) {
      $result.attributesToHeaders.addAll(attributesToHeaders);
    }
    if (includeHeaders != null) {
      $result.includeHeaders = includeHeaders;
    }
    if (mediaEncryption != null) {
      $result.mediaEncryption = mediaEncryption;
    }
    if (destinationCountry != null) {
      $result.destinationCountry = destinationCountry;
    }
    return $result;
  }
  SIPOutboundTrunkInfo._() : super();
  factory SIPOutboundTrunkInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPOutboundTrunkInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPOutboundTrunkInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'metadata')
    ..aOS(4, _omitFieldNames ? '' : 'address')
    ..e<SIPTransport>(5, _omitFieldNames ? '' : 'transport', $pb.PbFieldType.OE, defaultOrMaker: SIPTransport.SIP_TRANSPORT_AUTO, valueOf: SIPTransport.valueOf, enumValues: SIPTransport.values)
    ..pPS(6, _omitFieldNames ? '' : 'numbers')
    ..aOS(7, _omitFieldNames ? '' : 'authUsername')
    ..aOS(8, _omitFieldNames ? '' : 'authPassword')
    ..m<$core.String, $core.String>(9, _omitFieldNames ? '' : 'headers', entryClassName: 'SIPOutboundTrunkInfo.HeadersEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..m<$core.String, $core.String>(10, _omitFieldNames ? '' : 'headersToAttributes', entryClassName: 'SIPOutboundTrunkInfo.HeadersToAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..m<$core.String, $core.String>(11, _omitFieldNames ? '' : 'attributesToHeaders', entryClassName: 'SIPOutboundTrunkInfo.AttributesToHeadersEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..e<SIPHeaderOptions>(12, _omitFieldNames ? '' : 'includeHeaders', $pb.PbFieldType.OE, defaultOrMaker: SIPHeaderOptions.SIP_NO_HEADERS, valueOf: SIPHeaderOptions.valueOf, enumValues: SIPHeaderOptions.values)
    ..e<SIPMediaEncryption>(13, _omitFieldNames ? '' : 'mediaEncryption', $pb.PbFieldType.OE, defaultOrMaker: SIPMediaEncryption.SIP_MEDIA_ENCRYPT_DISABLE, valueOf: SIPMediaEncryption.valueOf, enumValues: SIPMediaEncryption.values)
    ..aOS(14, _omitFieldNames ? '' : 'destinationCountry')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPOutboundTrunkInfo clone() => SIPOutboundTrunkInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPOutboundTrunkInfo copyWith(void Function(SIPOutboundTrunkInfo) updates) => super.copyWith((message) => updates(message as SIPOutboundTrunkInfo)) as SIPOutboundTrunkInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPOutboundTrunkInfo create() => SIPOutboundTrunkInfo._();
  SIPOutboundTrunkInfo createEmptyInstance() => create();
  static $pb.PbList<SIPOutboundTrunkInfo> createRepeated() => $pb.PbList<SIPOutboundTrunkInfo>();
  @$core.pragma('dart2js:noInline')
  static SIPOutboundTrunkInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPOutboundTrunkInfo>(create);
  static SIPOutboundTrunkInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => clearField(1);

  /// Human-readable name for the Trunk.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  /// User-defined metadata for the Trunk.
  @$pb.TagNumber(3)
  $core.String get metadata => $_getSZ(2);
  @$pb.TagNumber(3)
  set metadata($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearMetadata() => clearField(3);

  /// Hostname or IP that SIP INVITE is sent too.
  /// Note that this is not a SIP URI and should not contain the 'sip:' protocol prefix.
  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => clearField(4);

  /// SIP Transport used for outbound call.
  @$pb.TagNumber(5)
  SIPTransport get transport => $_getN(4);
  @$pb.TagNumber(5)
  set transport(SIPTransport v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTransport() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransport() => clearField(5);

  /// Numbers used to make the calls. Random one from this list will be selected.
  @$pb.TagNumber(6)
  $core.List<$core.String> get numbers => $_getList(5);

  /// Username and password used to authenticate with SIP server.
  /// May be empty to have no authentication.
  @$pb.TagNumber(7)
  $core.String get authUsername => $_getSZ(6);
  @$pb.TagNumber(7)
  set authUsername($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAuthUsername() => $_has(6);
  @$pb.TagNumber(7)
  void clearAuthUsername() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get authPassword => $_getSZ(7);
  @$pb.TagNumber(8)
  set authPassword($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAuthPassword() => $_has(7);
  @$pb.TagNumber(8)
  void clearAuthPassword() => clearField(8);

  /// Include these SIP X-* headers in INVITE request.
  /// These headers are sent as-is and may help identify this call as coming from LiveKit for the other SIP endpoint.
  @$pb.TagNumber(9)
  $core.Map<$core.String, $core.String> get headers => $_getMap(8);

  /// Map SIP X-* headers from 200 OK to SIP participant attributes.
  /// Keys are the names of X-* headers and values are the names of attributes they will be mapped to.
  @$pb.TagNumber(10)
  $core.Map<$core.String, $core.String> get headersToAttributes => $_getMap(9);

  /// Map LiveKit attributes to SIP X-* headers when sending BYE or REFER requests.
  /// Keys are the names of attributes and values are the names of X-* headers they will be mapped to.
  @$pb.TagNumber(11)
  $core.Map<$core.String, $core.String> get attributesToHeaders => $_getMap(10);

  ///  Map SIP headers from 200 OK to sip.h.* participant attributes automatically.
  ///
  ///  When the names of required headers is known, using headers_to_attributes is strongly recommended.
  ///
  ///  When mapping 200 OK headers to follow-up request headers with attributes_to_headers map,
  ///  lowercase header names should be used, for example: sip.h.x-custom-header.
  @$pb.TagNumber(12)
  SIPHeaderOptions get includeHeaders => $_getN(11);
  @$pb.TagNumber(12)
  set includeHeaders(SIPHeaderOptions v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasIncludeHeaders() => $_has(11);
  @$pb.TagNumber(12)
  void clearIncludeHeaders() => clearField(12);

  @$pb.TagNumber(13)
  SIPMediaEncryption get mediaEncryption => $_getN(12);
  @$pb.TagNumber(13)
  set mediaEncryption(SIPMediaEncryption v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasMediaEncryption() => $_has(12);
  @$pb.TagNumber(13)
  void clearMediaEncryption() => clearField(13);

  /// country where the call terminates as ISO 3166-1 alpha-2 (https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). This will be used by the livekit infrastructure to route calls.
  @$pb.TagNumber(14)
  $core.String get destinationCountry => $_getSZ(13);
  @$pb.TagNumber(14)
  set destinationCountry($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasDestinationCountry() => $_has(13);
  @$pb.TagNumber(14)
  void clearDestinationCountry() => clearField(14);
}

class SIPOutboundTrunkUpdate extends $pb.GeneratedMessage {
  factory SIPOutboundTrunkUpdate({
    $core.String? address,
    SIPTransport? transport,
    $2.ListUpdate? numbers,
    $core.String? authUsername,
    $core.String? authPassword,
    $core.String? name,
    $core.String? metadata,
    SIPMediaEncryption? mediaEncryption,
    $core.String? destinationCountry,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    if (transport != null) {
      $result.transport = transport;
    }
    if (numbers != null) {
      $result.numbers = numbers;
    }
    if (authUsername != null) {
      $result.authUsername = authUsername;
    }
    if (authPassword != null) {
      $result.authPassword = authPassword;
    }
    if (name != null) {
      $result.name = name;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (mediaEncryption != null) {
      $result.mediaEncryption = mediaEncryption;
    }
    if (destinationCountry != null) {
      $result.destinationCountry = destinationCountry;
    }
    return $result;
  }
  SIPOutboundTrunkUpdate._() : super();
  factory SIPOutboundTrunkUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPOutboundTrunkUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPOutboundTrunkUpdate', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..e<SIPTransport>(2, _omitFieldNames ? '' : 'transport', $pb.PbFieldType.OE, defaultOrMaker: SIPTransport.SIP_TRANSPORT_AUTO, valueOf: SIPTransport.valueOf, enumValues: SIPTransport.values)
    ..aOM<$2.ListUpdate>(3, _omitFieldNames ? '' : 'numbers', subBuilder: $2.ListUpdate.create)
    ..aOS(4, _omitFieldNames ? '' : 'authUsername')
    ..aOS(5, _omitFieldNames ? '' : 'authPassword')
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..aOS(7, _omitFieldNames ? '' : 'metadata')
    ..e<SIPMediaEncryption>(8, _omitFieldNames ? '' : 'mediaEncryption', $pb.PbFieldType.OE, defaultOrMaker: SIPMediaEncryption.SIP_MEDIA_ENCRYPT_DISABLE, valueOf: SIPMediaEncryption.valueOf, enumValues: SIPMediaEncryption.values)
    ..aOS(9, _omitFieldNames ? '' : 'destinationCountry')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPOutboundTrunkUpdate clone() => SIPOutboundTrunkUpdate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPOutboundTrunkUpdate copyWith(void Function(SIPOutboundTrunkUpdate) updates) => super.copyWith((message) => updates(message as SIPOutboundTrunkUpdate)) as SIPOutboundTrunkUpdate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPOutboundTrunkUpdate create() => SIPOutboundTrunkUpdate._();
  SIPOutboundTrunkUpdate createEmptyInstance() => create();
  static $pb.PbList<SIPOutboundTrunkUpdate> createRepeated() => $pb.PbList<SIPOutboundTrunkUpdate>();
  @$core.pragma('dart2js:noInline')
  static SIPOutboundTrunkUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPOutboundTrunkUpdate>(create);
  static SIPOutboundTrunkUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  SIPTransport get transport => $_getN(1);
  @$pb.TagNumber(2)
  set transport(SIPTransport v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransport() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransport() => clearField(2);

  @$pb.TagNumber(3)
  $2.ListUpdate get numbers => $_getN(2);
  @$pb.TagNumber(3)
  set numbers($2.ListUpdate v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasNumbers() => $_has(2);
  @$pb.TagNumber(3)
  void clearNumbers() => clearField(3);
  @$pb.TagNumber(3)
  $2.ListUpdate ensureNumbers() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get authUsername => $_getSZ(3);
  @$pb.TagNumber(4)
  set authUsername($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthUsername() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthUsername() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get authPassword => $_getSZ(4);
  @$pb.TagNumber(5)
  set authPassword($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAuthPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthPassword() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get metadata => $_getSZ(6);
  @$pb.TagNumber(7)
  set metadata($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMetadata() => $_has(6);
  @$pb.TagNumber(7)
  void clearMetadata() => clearField(7);

  @$pb.TagNumber(8)
  SIPMediaEncryption get mediaEncryption => $_getN(7);
  @$pb.TagNumber(8)
  set mediaEncryption(SIPMediaEncryption v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasMediaEncryption() => $_has(7);
  @$pb.TagNumber(8)
  void clearMediaEncryption() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get destinationCountry => $_getSZ(8);
  @$pb.TagNumber(9)
  set destinationCountry($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDestinationCountry() => $_has(8);
  @$pb.TagNumber(9)
  void clearDestinationCountry() => clearField(9);
}

class GetSIPInboundTrunkRequest extends $pb.GeneratedMessage {
  factory GetSIPInboundTrunkRequest({
    $core.String? sipTrunkId,
  }) {
    final $result = create();
    if (sipTrunkId != null) {
      $result.sipTrunkId = sipTrunkId;
    }
    return $result;
  }
  GetSIPInboundTrunkRequest._() : super();
  factory GetSIPInboundTrunkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSIPInboundTrunkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSIPInboundTrunkRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSIPInboundTrunkRequest clone() => GetSIPInboundTrunkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSIPInboundTrunkRequest copyWith(void Function(GetSIPInboundTrunkRequest) updates) => super.copyWith((message) => updates(message as GetSIPInboundTrunkRequest)) as GetSIPInboundTrunkRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSIPInboundTrunkRequest create() => GetSIPInboundTrunkRequest._();
  GetSIPInboundTrunkRequest createEmptyInstance() => create();
  static $pb.PbList<GetSIPInboundTrunkRequest> createRepeated() => $pb.PbList<GetSIPInboundTrunkRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSIPInboundTrunkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSIPInboundTrunkRequest>(create);
  static GetSIPInboundTrunkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => clearField(1);
}

class GetSIPInboundTrunkResponse extends $pb.GeneratedMessage {
  factory GetSIPInboundTrunkResponse({
    SIPInboundTrunkInfo? trunk,
  }) {
    final $result = create();
    if (trunk != null) {
      $result.trunk = trunk;
    }
    return $result;
  }
  GetSIPInboundTrunkResponse._() : super();
  factory GetSIPInboundTrunkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSIPInboundTrunkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSIPInboundTrunkResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<SIPInboundTrunkInfo>(1, _omitFieldNames ? '' : 'trunk', subBuilder: SIPInboundTrunkInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSIPInboundTrunkResponse clone() => GetSIPInboundTrunkResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSIPInboundTrunkResponse copyWith(void Function(GetSIPInboundTrunkResponse) updates) => super.copyWith((message) => updates(message as GetSIPInboundTrunkResponse)) as GetSIPInboundTrunkResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSIPInboundTrunkResponse create() => GetSIPInboundTrunkResponse._();
  GetSIPInboundTrunkResponse createEmptyInstance() => create();
  static $pb.PbList<GetSIPInboundTrunkResponse> createRepeated() => $pb.PbList<GetSIPInboundTrunkResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSIPInboundTrunkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSIPInboundTrunkResponse>(create);
  static GetSIPInboundTrunkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  SIPInboundTrunkInfo get trunk => $_getN(0);
  @$pb.TagNumber(1)
  set trunk(SIPInboundTrunkInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrunk() => clearField(1);
  @$pb.TagNumber(1)
  SIPInboundTrunkInfo ensureTrunk() => $_ensure(0);
}

class GetSIPOutboundTrunkRequest extends $pb.GeneratedMessage {
  factory GetSIPOutboundTrunkRequest({
    $core.String? sipTrunkId,
  }) {
    final $result = create();
    if (sipTrunkId != null) {
      $result.sipTrunkId = sipTrunkId;
    }
    return $result;
  }
  GetSIPOutboundTrunkRequest._() : super();
  factory GetSIPOutboundTrunkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSIPOutboundTrunkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSIPOutboundTrunkRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSIPOutboundTrunkRequest clone() => GetSIPOutboundTrunkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSIPOutboundTrunkRequest copyWith(void Function(GetSIPOutboundTrunkRequest) updates) => super.copyWith((message) => updates(message as GetSIPOutboundTrunkRequest)) as GetSIPOutboundTrunkRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSIPOutboundTrunkRequest create() => GetSIPOutboundTrunkRequest._();
  GetSIPOutboundTrunkRequest createEmptyInstance() => create();
  static $pb.PbList<GetSIPOutboundTrunkRequest> createRepeated() => $pb.PbList<GetSIPOutboundTrunkRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSIPOutboundTrunkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSIPOutboundTrunkRequest>(create);
  static GetSIPOutboundTrunkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => clearField(1);
}

class GetSIPOutboundTrunkResponse extends $pb.GeneratedMessage {
  factory GetSIPOutboundTrunkResponse({
    SIPOutboundTrunkInfo? trunk,
  }) {
    final $result = create();
    if (trunk != null) {
      $result.trunk = trunk;
    }
    return $result;
  }
  GetSIPOutboundTrunkResponse._() : super();
  factory GetSIPOutboundTrunkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSIPOutboundTrunkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSIPOutboundTrunkResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<SIPOutboundTrunkInfo>(1, _omitFieldNames ? '' : 'trunk', subBuilder: SIPOutboundTrunkInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSIPOutboundTrunkResponse clone() => GetSIPOutboundTrunkResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSIPOutboundTrunkResponse copyWith(void Function(GetSIPOutboundTrunkResponse) updates) => super.copyWith((message) => updates(message as GetSIPOutboundTrunkResponse)) as GetSIPOutboundTrunkResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSIPOutboundTrunkResponse create() => GetSIPOutboundTrunkResponse._();
  GetSIPOutboundTrunkResponse createEmptyInstance() => create();
  static $pb.PbList<GetSIPOutboundTrunkResponse> createRepeated() => $pb.PbList<GetSIPOutboundTrunkResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSIPOutboundTrunkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSIPOutboundTrunkResponse>(create);
  static GetSIPOutboundTrunkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  SIPOutboundTrunkInfo get trunk => $_getN(0);
  @$pb.TagNumber(1)
  set trunk(SIPOutboundTrunkInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrunk() => clearField(1);
  @$pb.TagNumber(1)
  SIPOutboundTrunkInfo ensureTrunk() => $_ensure(0);
}

class ListSIPTrunkRequest extends $pb.GeneratedMessage {
  factory ListSIPTrunkRequest({
    $2.Pagination? page,
  }) {
    final $result = create();
    if (page != null) {
      $result.page = page;
    }
    return $result;
  }
  ListSIPTrunkRequest._() : super();
  factory ListSIPTrunkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSIPTrunkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSIPTrunkRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<$2.Pagination>(1, _omitFieldNames ? '' : 'page', subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSIPTrunkRequest clone() => ListSIPTrunkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSIPTrunkRequest copyWith(void Function(ListSIPTrunkRequest) updates) => super.copyWith((message) => updates(message as ListSIPTrunkRequest)) as ListSIPTrunkRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPTrunkRequest create() => ListSIPTrunkRequest._();
  ListSIPTrunkRequest createEmptyInstance() => create();
  static $pb.PbList<ListSIPTrunkRequest> createRepeated() => $pb.PbList<ListSIPTrunkRequest>();
  @$core.pragma('dart2js:noInline')
  static ListSIPTrunkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSIPTrunkRequest>(create);
  static ListSIPTrunkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Pagination get page => $_getN(0);
  @$pb.TagNumber(1)
  set page($2.Pagination v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => clearField(1);
  @$pb.TagNumber(1)
  $2.Pagination ensurePage() => $_ensure(0);
}

class ListSIPTrunkResponse extends $pb.GeneratedMessage {
  factory ListSIPTrunkResponse({
    $core.Iterable<SIPTrunkInfo>? items,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  ListSIPTrunkResponse._() : super();
  factory ListSIPTrunkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSIPTrunkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSIPTrunkResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<SIPTrunkInfo>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: SIPTrunkInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSIPTrunkResponse clone() => ListSIPTrunkResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSIPTrunkResponse copyWith(void Function(ListSIPTrunkResponse) updates) => super.copyWith((message) => updates(message as ListSIPTrunkResponse)) as ListSIPTrunkResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPTrunkResponse create() => ListSIPTrunkResponse._();
  ListSIPTrunkResponse createEmptyInstance() => create();
  static $pb.PbList<ListSIPTrunkResponse> createRepeated() => $pb.PbList<ListSIPTrunkResponse>();
  @$core.pragma('dart2js:noInline')
  static ListSIPTrunkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSIPTrunkResponse>(create);
  static ListSIPTrunkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SIPTrunkInfo> get items => $_getList(0);
}

/// ListSIPInboundTrunkRequest lists inbound trunks for given filters. If no filters are set, all trunks are listed.
class ListSIPInboundTrunkRequest extends $pb.GeneratedMessage {
  factory ListSIPInboundTrunkRequest({
    $core.Iterable<$core.String>? trunkIds,
    $core.Iterable<$core.String>? numbers,
    $2.Pagination? page,
  }) {
    final $result = create();
    if (trunkIds != null) {
      $result.trunkIds.addAll(trunkIds);
    }
    if (numbers != null) {
      $result.numbers.addAll(numbers);
    }
    if (page != null) {
      $result.page = page;
    }
    return $result;
  }
  ListSIPInboundTrunkRequest._() : super();
  factory ListSIPInboundTrunkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSIPInboundTrunkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSIPInboundTrunkRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'trunkIds')
    ..pPS(2, _omitFieldNames ? '' : 'numbers')
    ..aOM<$2.Pagination>(3, _omitFieldNames ? '' : 'page', subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSIPInboundTrunkRequest clone() => ListSIPInboundTrunkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSIPInboundTrunkRequest copyWith(void Function(ListSIPInboundTrunkRequest) updates) => super.copyWith((message) => updates(message as ListSIPInboundTrunkRequest)) as ListSIPInboundTrunkRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPInboundTrunkRequest create() => ListSIPInboundTrunkRequest._();
  ListSIPInboundTrunkRequest createEmptyInstance() => create();
  static $pb.PbList<ListSIPInboundTrunkRequest> createRepeated() => $pb.PbList<ListSIPInboundTrunkRequest>();
  @$core.pragma('dart2js:noInline')
  static ListSIPInboundTrunkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSIPInboundTrunkRequest>(create);
  static ListSIPInboundTrunkRequest? _defaultInstance;

  /// Trunk IDs to list. If this option is set, the response will contains trunks in the same order.
  /// If any of the trunks is missing, a nil item in that position will be sent in the response.
  @$pb.TagNumber(1)
  $core.List<$core.String> get trunkIds => $_getList(0);

  /// Only list trunks that contain one of the numbers, including wildcard trunks.
  @$pb.TagNumber(2)
  $core.List<$core.String> get numbers => $_getList(1);

  @$pb.TagNumber(3)
  $2.Pagination get page => $_getN(2);
  @$pb.TagNumber(3)
  set page($2.Pagination v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => clearField(3);
  @$pb.TagNumber(3)
  $2.Pagination ensurePage() => $_ensure(2);
}

class ListSIPInboundTrunkResponse extends $pb.GeneratedMessage {
  factory ListSIPInboundTrunkResponse({
    $core.Iterable<SIPInboundTrunkInfo>? items,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  ListSIPInboundTrunkResponse._() : super();
  factory ListSIPInboundTrunkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSIPInboundTrunkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSIPInboundTrunkResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<SIPInboundTrunkInfo>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: SIPInboundTrunkInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSIPInboundTrunkResponse clone() => ListSIPInboundTrunkResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSIPInboundTrunkResponse copyWith(void Function(ListSIPInboundTrunkResponse) updates) => super.copyWith((message) => updates(message as ListSIPInboundTrunkResponse)) as ListSIPInboundTrunkResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPInboundTrunkResponse create() => ListSIPInboundTrunkResponse._();
  ListSIPInboundTrunkResponse createEmptyInstance() => create();
  static $pb.PbList<ListSIPInboundTrunkResponse> createRepeated() => $pb.PbList<ListSIPInboundTrunkResponse>();
  @$core.pragma('dart2js:noInline')
  static ListSIPInboundTrunkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSIPInboundTrunkResponse>(create);
  static ListSIPInboundTrunkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SIPInboundTrunkInfo> get items => $_getList(0);
}

/// ListSIPOutboundTrunkRequest lists outbound trunks for given filters. If no filters are set, all trunks are listed.
class ListSIPOutboundTrunkRequest extends $pb.GeneratedMessage {
  factory ListSIPOutboundTrunkRequest({
    $core.Iterable<$core.String>? trunkIds,
    $core.Iterable<$core.String>? numbers,
    $2.Pagination? page,
  }) {
    final $result = create();
    if (trunkIds != null) {
      $result.trunkIds.addAll(trunkIds);
    }
    if (numbers != null) {
      $result.numbers.addAll(numbers);
    }
    if (page != null) {
      $result.page = page;
    }
    return $result;
  }
  ListSIPOutboundTrunkRequest._() : super();
  factory ListSIPOutboundTrunkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSIPOutboundTrunkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSIPOutboundTrunkRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'trunkIds')
    ..pPS(2, _omitFieldNames ? '' : 'numbers')
    ..aOM<$2.Pagination>(3, _omitFieldNames ? '' : 'page', subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSIPOutboundTrunkRequest clone() => ListSIPOutboundTrunkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSIPOutboundTrunkRequest copyWith(void Function(ListSIPOutboundTrunkRequest) updates) => super.copyWith((message) => updates(message as ListSIPOutboundTrunkRequest)) as ListSIPOutboundTrunkRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPOutboundTrunkRequest create() => ListSIPOutboundTrunkRequest._();
  ListSIPOutboundTrunkRequest createEmptyInstance() => create();
  static $pb.PbList<ListSIPOutboundTrunkRequest> createRepeated() => $pb.PbList<ListSIPOutboundTrunkRequest>();
  @$core.pragma('dart2js:noInline')
  static ListSIPOutboundTrunkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSIPOutboundTrunkRequest>(create);
  static ListSIPOutboundTrunkRequest? _defaultInstance;

  /// Trunk IDs to list. If this option is set, the response will contains trunks in the same order.
  /// If any of the trunks is missing, a nil item in that position will be sent in the response.
  @$pb.TagNumber(1)
  $core.List<$core.String> get trunkIds => $_getList(0);

  /// Only list trunks that contain one of the numbers, including wildcard trunks.
  @$pb.TagNumber(2)
  $core.List<$core.String> get numbers => $_getList(1);

  @$pb.TagNumber(3)
  $2.Pagination get page => $_getN(2);
  @$pb.TagNumber(3)
  set page($2.Pagination v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => clearField(3);
  @$pb.TagNumber(3)
  $2.Pagination ensurePage() => $_ensure(2);
}

class ListSIPOutboundTrunkResponse extends $pb.GeneratedMessage {
  factory ListSIPOutboundTrunkResponse({
    $core.Iterable<SIPOutboundTrunkInfo>? items,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  ListSIPOutboundTrunkResponse._() : super();
  factory ListSIPOutboundTrunkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSIPOutboundTrunkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSIPOutboundTrunkResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<SIPOutboundTrunkInfo>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: SIPOutboundTrunkInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSIPOutboundTrunkResponse clone() => ListSIPOutboundTrunkResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSIPOutboundTrunkResponse copyWith(void Function(ListSIPOutboundTrunkResponse) updates) => super.copyWith((message) => updates(message as ListSIPOutboundTrunkResponse)) as ListSIPOutboundTrunkResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPOutboundTrunkResponse create() => ListSIPOutboundTrunkResponse._();
  ListSIPOutboundTrunkResponse createEmptyInstance() => create();
  static $pb.PbList<ListSIPOutboundTrunkResponse> createRepeated() => $pb.PbList<ListSIPOutboundTrunkResponse>();
  @$core.pragma('dart2js:noInline')
  static ListSIPOutboundTrunkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSIPOutboundTrunkResponse>(create);
  static ListSIPOutboundTrunkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SIPOutboundTrunkInfo> get items => $_getList(0);
}

class DeleteSIPTrunkRequest extends $pb.GeneratedMessage {
  factory DeleteSIPTrunkRequest({
    $core.String? sipTrunkId,
  }) {
    final $result = create();
    if (sipTrunkId != null) {
      $result.sipTrunkId = sipTrunkId;
    }
    return $result;
  }
  DeleteSIPTrunkRequest._() : super();
  factory DeleteSIPTrunkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSIPTrunkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteSIPTrunkRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteSIPTrunkRequest clone() => DeleteSIPTrunkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteSIPTrunkRequest copyWith(void Function(DeleteSIPTrunkRequest) updates) => super.copyWith((message) => updates(message as DeleteSIPTrunkRequest)) as DeleteSIPTrunkRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSIPTrunkRequest create() => DeleteSIPTrunkRequest._();
  DeleteSIPTrunkRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteSIPTrunkRequest> createRepeated() => $pb.PbList<DeleteSIPTrunkRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteSIPTrunkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSIPTrunkRequest>(create);
  static DeleteSIPTrunkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => clearField(1);
}

class SIPDispatchRuleDirect extends $pb.GeneratedMessage {
  factory SIPDispatchRuleDirect({
    $core.String? roomName,
    $core.String? pin,
  }) {
    final $result = create();
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (pin != null) {
      $result.pin = pin;
    }
    return $result;
  }
  SIPDispatchRuleDirect._() : super();
  factory SIPDispatchRuleDirect.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPDispatchRuleDirect.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPDispatchRuleDirect', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOS(2, _omitFieldNames ? '' : 'pin')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPDispatchRuleDirect clone() => SIPDispatchRuleDirect()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPDispatchRuleDirect copyWith(void Function(SIPDispatchRuleDirect) updates) => super.copyWith((message) => updates(message as SIPDispatchRuleDirect)) as SIPDispatchRuleDirect;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleDirect create() => SIPDispatchRuleDirect._();
  SIPDispatchRuleDirect createEmptyInstance() => create();
  static $pb.PbList<SIPDispatchRuleDirect> createRepeated() => $pb.PbList<SIPDispatchRuleDirect>();
  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleDirect getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPDispatchRuleDirect>(create);
  static SIPDispatchRuleDirect? _defaultInstance;

  /// What room should call be directed into
  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => clearField(1);

  /// Optional pin required to enter room
  @$pb.TagNumber(2)
  $core.String get pin => $_getSZ(1);
  @$pb.TagNumber(2)
  set pin($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPin() => $_has(1);
  @$pb.TagNumber(2)
  void clearPin() => clearField(2);
}

class SIPDispatchRuleIndividual extends $pb.GeneratedMessage {
  factory SIPDispatchRuleIndividual({
    $core.String? roomPrefix,
    $core.String? pin,
  }) {
    final $result = create();
    if (roomPrefix != null) {
      $result.roomPrefix = roomPrefix;
    }
    if (pin != null) {
      $result.pin = pin;
    }
    return $result;
  }
  SIPDispatchRuleIndividual._() : super();
  factory SIPDispatchRuleIndividual.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPDispatchRuleIndividual.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPDispatchRuleIndividual', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomPrefix')
    ..aOS(2, _omitFieldNames ? '' : 'pin')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPDispatchRuleIndividual clone() => SIPDispatchRuleIndividual()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPDispatchRuleIndividual copyWith(void Function(SIPDispatchRuleIndividual) updates) => super.copyWith((message) => updates(message as SIPDispatchRuleIndividual)) as SIPDispatchRuleIndividual;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleIndividual create() => SIPDispatchRuleIndividual._();
  SIPDispatchRuleIndividual createEmptyInstance() => create();
  static $pb.PbList<SIPDispatchRuleIndividual> createRepeated() => $pb.PbList<SIPDispatchRuleIndividual>();
  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleIndividual getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPDispatchRuleIndividual>(create);
  static SIPDispatchRuleIndividual? _defaultInstance;

  /// Prefix used on new room name
  @$pb.TagNumber(1)
  $core.String get roomPrefix => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomPrefix($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomPrefix() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomPrefix() => clearField(1);

  /// Optional pin required to enter room
  @$pb.TagNumber(2)
  $core.String get pin => $_getSZ(1);
  @$pb.TagNumber(2)
  set pin($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPin() => $_has(1);
  @$pb.TagNumber(2)
  void clearPin() => clearField(2);
}

class SIPDispatchRuleCallee extends $pb.GeneratedMessage {
  factory SIPDispatchRuleCallee({
    $core.String? roomPrefix,
    $core.String? pin,
    $core.bool? randomize,
  }) {
    final $result = create();
    if (roomPrefix != null) {
      $result.roomPrefix = roomPrefix;
    }
    if (pin != null) {
      $result.pin = pin;
    }
    if (randomize != null) {
      $result.randomize = randomize;
    }
    return $result;
  }
  SIPDispatchRuleCallee._() : super();
  factory SIPDispatchRuleCallee.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPDispatchRuleCallee.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPDispatchRuleCallee', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomPrefix')
    ..aOS(2, _omitFieldNames ? '' : 'pin')
    ..aOB(3, _omitFieldNames ? '' : 'randomize')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPDispatchRuleCallee clone() => SIPDispatchRuleCallee()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPDispatchRuleCallee copyWith(void Function(SIPDispatchRuleCallee) updates) => super.copyWith((message) => updates(message as SIPDispatchRuleCallee)) as SIPDispatchRuleCallee;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleCallee create() => SIPDispatchRuleCallee._();
  SIPDispatchRuleCallee createEmptyInstance() => create();
  static $pb.PbList<SIPDispatchRuleCallee> createRepeated() => $pb.PbList<SIPDispatchRuleCallee>();
  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleCallee getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPDispatchRuleCallee>(create);
  static SIPDispatchRuleCallee? _defaultInstance;

  /// Prefix used on new room name
  @$pb.TagNumber(1)
  $core.String get roomPrefix => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomPrefix($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomPrefix() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomPrefix() => clearField(1);

  /// Optional pin required to enter room
  @$pb.TagNumber(2)
  $core.String get pin => $_getSZ(1);
  @$pb.TagNumber(2)
  set pin($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPin() => $_has(1);
  @$pb.TagNumber(2)
  void clearPin() => clearField(2);

  /// Optionally append random suffix
  @$pb.TagNumber(3)
  $core.bool get randomize => $_getBF(2);
  @$pb.TagNumber(3)
  set randomize($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRandomize() => $_has(2);
  @$pb.TagNumber(3)
  void clearRandomize() => clearField(3);
}

enum SIPDispatchRule_Rule {
  dispatchRuleDirect, 
  dispatchRuleIndividual, 
  dispatchRuleCallee, 
  notSet
}

class SIPDispatchRule extends $pb.GeneratedMessage {
  factory SIPDispatchRule({
    SIPDispatchRuleDirect? dispatchRuleDirect,
    SIPDispatchRuleIndividual? dispatchRuleIndividual,
    SIPDispatchRuleCallee? dispatchRuleCallee,
  }) {
    final $result = create();
    if (dispatchRuleDirect != null) {
      $result.dispatchRuleDirect = dispatchRuleDirect;
    }
    if (dispatchRuleIndividual != null) {
      $result.dispatchRuleIndividual = dispatchRuleIndividual;
    }
    if (dispatchRuleCallee != null) {
      $result.dispatchRuleCallee = dispatchRuleCallee;
    }
    return $result;
  }
  SIPDispatchRule._() : super();
  factory SIPDispatchRule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPDispatchRule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SIPDispatchRule_Rule> _SIPDispatchRule_RuleByTag = {
    1 : SIPDispatchRule_Rule.dispatchRuleDirect,
    2 : SIPDispatchRule_Rule.dispatchRuleIndividual,
    3 : SIPDispatchRule_Rule.dispatchRuleCallee,
    0 : SIPDispatchRule_Rule.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPDispatchRule', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<SIPDispatchRuleDirect>(1, _omitFieldNames ? '' : 'dispatchRuleDirect', subBuilder: SIPDispatchRuleDirect.create)
    ..aOM<SIPDispatchRuleIndividual>(2, _omitFieldNames ? '' : 'dispatchRuleIndividual', subBuilder: SIPDispatchRuleIndividual.create)
    ..aOM<SIPDispatchRuleCallee>(3, _omitFieldNames ? '' : 'dispatchRuleCallee', subBuilder: SIPDispatchRuleCallee.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPDispatchRule clone() => SIPDispatchRule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPDispatchRule copyWith(void Function(SIPDispatchRule) updates) => super.copyWith((message) => updates(message as SIPDispatchRule)) as SIPDispatchRule;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPDispatchRule create() => SIPDispatchRule._();
  SIPDispatchRule createEmptyInstance() => create();
  static $pb.PbList<SIPDispatchRule> createRepeated() => $pb.PbList<SIPDispatchRule>();
  @$core.pragma('dart2js:noInline')
  static SIPDispatchRule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPDispatchRule>(create);
  static SIPDispatchRule? _defaultInstance;

  SIPDispatchRule_Rule whichRule() => _SIPDispatchRule_RuleByTag[$_whichOneof(0)]!;
  void clearRule() => clearField($_whichOneof(0));

  /// SIPDispatchRuleDirect is a `SIP Dispatch Rule` that puts a user directly into a room
  /// This places users into an existing room. Optionally you can require a pin before a user can
  /// enter the room
  @$pb.TagNumber(1)
  SIPDispatchRuleDirect get dispatchRuleDirect => $_getN(0);
  @$pb.TagNumber(1)
  set dispatchRuleDirect(SIPDispatchRuleDirect v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDispatchRuleDirect() => $_has(0);
  @$pb.TagNumber(1)
  void clearDispatchRuleDirect() => clearField(1);
  @$pb.TagNumber(1)
  SIPDispatchRuleDirect ensureDispatchRuleDirect() => $_ensure(0);

  /// SIPDispatchRuleIndividual is a `SIP Dispatch Rule` that creates a new room for each caller.
  @$pb.TagNumber(2)
  SIPDispatchRuleIndividual get dispatchRuleIndividual => $_getN(1);
  @$pb.TagNumber(2)
  set dispatchRuleIndividual(SIPDispatchRuleIndividual v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDispatchRuleIndividual() => $_has(1);
  @$pb.TagNumber(2)
  void clearDispatchRuleIndividual() => clearField(2);
  @$pb.TagNumber(2)
  SIPDispatchRuleIndividual ensureDispatchRuleIndividual() => $_ensure(1);

  /// SIPDispatchRuleCallee is a `SIP Dispatch Rule` that creates a new room for each callee.
  @$pb.TagNumber(3)
  SIPDispatchRuleCallee get dispatchRuleCallee => $_getN(2);
  @$pb.TagNumber(3)
  set dispatchRuleCallee(SIPDispatchRuleCallee v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDispatchRuleCallee() => $_has(2);
  @$pb.TagNumber(3)
  void clearDispatchRuleCallee() => clearField(3);
  @$pb.TagNumber(3)
  SIPDispatchRuleCallee ensureDispatchRuleCallee() => $_ensure(2);
}

class CreateSIPDispatchRuleRequest extends $pb.GeneratedMessage {
  factory CreateSIPDispatchRuleRequest({
  @$core.Deprecated('This field is deprecated.')
    SIPDispatchRule? rule,
  @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.String>? trunkIds,
  @$core.Deprecated('This field is deprecated.')
    $core.bool? hidePhoneNumber,
  @$core.Deprecated('This field is deprecated.')
    $core.String? name,
  @$core.Deprecated('This field is deprecated.')
    $core.String? metadata,
  @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.String>? inboundNumbers,
  @$core.Deprecated('This field is deprecated.')
    $core.Map<$core.String, $core.String>? attributes,
  @$core.Deprecated('This field is deprecated.')
    $core.String? roomPreset,
  @$core.Deprecated('This field is deprecated.')
    $9.RoomConfiguration? roomConfig,
    SIPDispatchRuleInfo? dispatchRule,
  }) {
    final $result = create();
    if (rule != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.rule = rule;
    }
    if (trunkIds != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.trunkIds.addAll(trunkIds);
    }
    if (hidePhoneNumber != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.hidePhoneNumber = hidePhoneNumber;
    }
    if (name != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.name = name;
    }
    if (metadata != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.metadata = metadata;
    }
    if (inboundNumbers != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.inboundNumbers.addAll(inboundNumbers);
    }
    if (attributes != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.attributes.addAll(attributes);
    }
    if (roomPreset != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.roomPreset = roomPreset;
    }
    if (roomConfig != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.roomConfig = roomConfig;
    }
    if (dispatchRule != null) {
      $result.dispatchRule = dispatchRule;
    }
    return $result;
  }
  CreateSIPDispatchRuleRequest._() : super();
  factory CreateSIPDispatchRuleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSIPDispatchRuleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSIPDispatchRuleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<SIPDispatchRule>(1, _omitFieldNames ? '' : 'rule', subBuilder: SIPDispatchRule.create)
    ..pPS(2, _omitFieldNames ? '' : 'trunkIds')
    ..aOB(3, _omitFieldNames ? '' : 'hidePhoneNumber')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'metadata')
    ..pPS(6, _omitFieldNames ? '' : 'inboundNumbers')
    ..m<$core.String, $core.String>(7, _omitFieldNames ? '' : 'attributes', entryClassName: 'CreateSIPDispatchRuleRequest.AttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..aOS(8, _omitFieldNames ? '' : 'roomPreset')
    ..aOM<$9.RoomConfiguration>(9, _omitFieldNames ? '' : 'roomConfig', subBuilder: $9.RoomConfiguration.create)
    ..aOM<SIPDispatchRuleInfo>(10, _omitFieldNames ? '' : 'dispatchRule', subBuilder: SIPDispatchRuleInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSIPDispatchRuleRequest clone() => CreateSIPDispatchRuleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSIPDispatchRuleRequest copyWith(void Function(CreateSIPDispatchRuleRequest) updates) => super.copyWith((message) => updates(message as CreateSIPDispatchRuleRequest)) as CreateSIPDispatchRuleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSIPDispatchRuleRequest create() => CreateSIPDispatchRuleRequest._();
  CreateSIPDispatchRuleRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSIPDispatchRuleRequest> createRepeated() => $pb.PbList<CreateSIPDispatchRuleRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSIPDispatchRuleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSIPDispatchRuleRequest>(create);
  static CreateSIPDispatchRuleRequest? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  SIPDispatchRule get rule => $_getN(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set rule(SIPDispatchRule v) { setField(1, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasRule() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearRule() => clearField(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  SIPDispatchRule ensureRule() => $_ensure(0);

  /// What trunks are accepted for this dispatch rule
  /// If empty all trunks will match this dispatch rule
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.List<$core.String> get trunkIds => $_getList(1);

  /// By default the From value (Phone number) is used for participant name/identity and added to attributes.
  /// If true, a random value for identity will be used and numbers will be omitted from attributes.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.bool get hidePhoneNumber => $_getBF(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  set hidePhoneNumber($core.bool v) { $_setBool(2, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.bool hasHidePhoneNumber() => $_has(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  void clearHidePhoneNumber() => clearField(3);

  /// Optional human-readable name for the Dispatch Rule.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  /// User-defined metadata for the Dispatch Rule.
  /// Participants created by this rule will inherit this metadata.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.String get metadata => $_getSZ(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set metadata($core.String v) { $_setString(4, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasMetadata() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearMetadata() => clearField(5);

  /// Dispatch Rule will only accept a call made to these numbers (if set).
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.List<$core.String> get inboundNumbers => $_getList(5);

  /// User-defined attributes for the Dispatch Rule.
  /// Participants created by this rule will inherit these attributes.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  $core.Map<$core.String, $core.String> get attributes => $_getMap(6);

  /// Cloud-only, config preset to use
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.String get roomPreset => $_getSZ(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  set roomPreset($core.String v) { $_setString(7, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.bool hasRoomPreset() => $_has(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  void clearRoomPreset() => clearField(8);

  /// RoomConfiguration to use if the participant initiates the room
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $9.RoomConfiguration get roomConfig => $_getN(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  set roomConfig($9.RoomConfiguration v) { setField(9, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $core.bool hasRoomConfig() => $_has(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  void clearRoomConfig() => clearField(9);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $9.RoomConfiguration ensureRoomConfig() => $_ensure(8);

  @$pb.TagNumber(10)
  SIPDispatchRuleInfo get dispatchRule => $_getN(9);
  @$pb.TagNumber(10)
  set dispatchRule(SIPDispatchRuleInfo v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasDispatchRule() => $_has(9);
  @$pb.TagNumber(10)
  void clearDispatchRule() => clearField(10);
  @$pb.TagNumber(10)
  SIPDispatchRuleInfo ensureDispatchRule() => $_ensure(9);
}

enum UpdateSIPDispatchRuleRequest_Action {
  replace, 
  update, 
  notSet
}

class UpdateSIPDispatchRuleRequest extends $pb.GeneratedMessage {
  factory UpdateSIPDispatchRuleRequest({
    $core.String? sipDispatchRuleId,
    SIPDispatchRuleInfo? replace,
    SIPDispatchRuleUpdate? update,
  }) {
    final $result = create();
    if (sipDispatchRuleId != null) {
      $result.sipDispatchRuleId = sipDispatchRuleId;
    }
    if (replace != null) {
      $result.replace = replace;
    }
    if (update != null) {
      $result.update = update;
    }
    return $result;
  }
  UpdateSIPDispatchRuleRequest._() : super();
  factory UpdateSIPDispatchRuleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSIPDispatchRuleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UpdateSIPDispatchRuleRequest_Action> _UpdateSIPDispatchRuleRequest_ActionByTag = {
    2 : UpdateSIPDispatchRuleRequest_Action.replace,
    3 : UpdateSIPDispatchRuleRequest_Action.update,
    0 : UpdateSIPDispatchRuleRequest_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSIPDispatchRuleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'sipDispatchRuleId')
    ..aOM<SIPDispatchRuleInfo>(2, _omitFieldNames ? '' : 'replace', subBuilder: SIPDispatchRuleInfo.create)
    ..aOM<SIPDispatchRuleUpdate>(3, _omitFieldNames ? '' : 'update', subBuilder: SIPDispatchRuleUpdate.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSIPDispatchRuleRequest clone() => UpdateSIPDispatchRuleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSIPDispatchRuleRequest copyWith(void Function(UpdateSIPDispatchRuleRequest) updates) => super.copyWith((message) => updates(message as UpdateSIPDispatchRuleRequest)) as UpdateSIPDispatchRuleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSIPDispatchRuleRequest create() => UpdateSIPDispatchRuleRequest._();
  UpdateSIPDispatchRuleRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSIPDispatchRuleRequest> createRepeated() => $pb.PbList<UpdateSIPDispatchRuleRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSIPDispatchRuleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSIPDispatchRuleRequest>(create);
  static UpdateSIPDispatchRuleRequest? _defaultInstance;

  UpdateSIPDispatchRuleRequest_Action whichAction() => _UpdateSIPDispatchRuleRequest_ActionByTag[$_whichOneof(0)]!;
  void clearAction() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get sipDispatchRuleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipDispatchRuleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSipDispatchRuleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipDispatchRuleId() => clearField(1);

  @$pb.TagNumber(2)
  SIPDispatchRuleInfo get replace => $_getN(1);
  @$pb.TagNumber(2)
  set replace(SIPDispatchRuleInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasReplace() => $_has(1);
  @$pb.TagNumber(2)
  void clearReplace() => clearField(2);
  @$pb.TagNumber(2)
  SIPDispatchRuleInfo ensureReplace() => $_ensure(1);

  @$pb.TagNumber(3)
  SIPDispatchRuleUpdate get update => $_getN(2);
  @$pb.TagNumber(3)
  set update(SIPDispatchRuleUpdate v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdate() => clearField(3);
  @$pb.TagNumber(3)
  SIPDispatchRuleUpdate ensureUpdate() => $_ensure(2);
}

class SIPDispatchRuleInfo extends $pb.GeneratedMessage {
  factory SIPDispatchRuleInfo({
    $core.String? sipDispatchRuleId,
    SIPDispatchRule? rule,
    $core.Iterable<$core.String>? trunkIds,
    $core.bool? hidePhoneNumber,
    $core.String? name,
    $core.String? metadata,
    $core.Iterable<$core.String>? inboundNumbers,
    $core.Map<$core.String, $core.String>? attributes,
    $core.String? roomPreset,
    $9.RoomConfiguration? roomConfig,
    $core.bool? krispEnabled,
    SIPMediaEncryption? mediaEncryption,
  }) {
    final $result = create();
    if (sipDispatchRuleId != null) {
      $result.sipDispatchRuleId = sipDispatchRuleId;
    }
    if (rule != null) {
      $result.rule = rule;
    }
    if (trunkIds != null) {
      $result.trunkIds.addAll(trunkIds);
    }
    if (hidePhoneNumber != null) {
      $result.hidePhoneNumber = hidePhoneNumber;
    }
    if (name != null) {
      $result.name = name;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (inboundNumbers != null) {
      $result.inboundNumbers.addAll(inboundNumbers);
    }
    if (attributes != null) {
      $result.attributes.addAll(attributes);
    }
    if (roomPreset != null) {
      $result.roomPreset = roomPreset;
    }
    if (roomConfig != null) {
      $result.roomConfig = roomConfig;
    }
    if (krispEnabled != null) {
      $result.krispEnabled = krispEnabled;
    }
    if (mediaEncryption != null) {
      $result.mediaEncryption = mediaEncryption;
    }
    return $result;
  }
  SIPDispatchRuleInfo._() : super();
  factory SIPDispatchRuleInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPDispatchRuleInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPDispatchRuleInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipDispatchRuleId')
    ..aOM<SIPDispatchRule>(2, _omitFieldNames ? '' : 'rule', subBuilder: SIPDispatchRule.create)
    ..pPS(3, _omitFieldNames ? '' : 'trunkIds')
    ..aOB(4, _omitFieldNames ? '' : 'hidePhoneNumber')
    ..aOS(5, _omitFieldNames ? '' : 'name')
    ..aOS(6, _omitFieldNames ? '' : 'metadata')
    ..pPS(7, _omitFieldNames ? '' : 'inboundNumbers')
    ..m<$core.String, $core.String>(8, _omitFieldNames ? '' : 'attributes', entryClassName: 'SIPDispatchRuleInfo.AttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..aOS(9, _omitFieldNames ? '' : 'roomPreset')
    ..aOM<$9.RoomConfiguration>(10, _omitFieldNames ? '' : 'roomConfig', subBuilder: $9.RoomConfiguration.create)
    ..aOB(11, _omitFieldNames ? '' : 'krispEnabled')
    ..e<SIPMediaEncryption>(12, _omitFieldNames ? '' : 'mediaEncryption', $pb.PbFieldType.OE, defaultOrMaker: SIPMediaEncryption.SIP_MEDIA_ENCRYPT_DISABLE, valueOf: SIPMediaEncryption.valueOf, enumValues: SIPMediaEncryption.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPDispatchRuleInfo clone() => SIPDispatchRuleInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPDispatchRuleInfo copyWith(void Function(SIPDispatchRuleInfo) updates) => super.copyWith((message) => updates(message as SIPDispatchRuleInfo)) as SIPDispatchRuleInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleInfo create() => SIPDispatchRuleInfo._();
  SIPDispatchRuleInfo createEmptyInstance() => create();
  static $pb.PbList<SIPDispatchRuleInfo> createRepeated() => $pb.PbList<SIPDispatchRuleInfo>();
  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPDispatchRuleInfo>(create);
  static SIPDispatchRuleInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipDispatchRuleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipDispatchRuleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSipDispatchRuleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipDispatchRuleId() => clearField(1);

  @$pb.TagNumber(2)
  SIPDispatchRule get rule => $_getN(1);
  @$pb.TagNumber(2)
  set rule(SIPDispatchRule v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRule() => $_has(1);
  @$pb.TagNumber(2)
  void clearRule() => clearField(2);
  @$pb.TagNumber(2)
  SIPDispatchRule ensureRule() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.String> get trunkIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get hidePhoneNumber => $_getBF(3);
  @$pb.TagNumber(4)
  set hidePhoneNumber($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHidePhoneNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearHidePhoneNumber() => clearField(4);

  /// Human-readable name for the Dispatch Rule.
  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  /// User-defined metadata for the Dispatch Rule.
  /// Participants created by this rule will inherit this metadata.
  @$pb.TagNumber(6)
  $core.String get metadata => $_getSZ(5);
  @$pb.TagNumber(6)
  set metadata($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMetadata() => $_has(5);
  @$pb.TagNumber(6)
  void clearMetadata() => clearField(6);

  /// Dispatch Rule will only accept a call made to these numbers (if set).
  @$pb.TagNumber(7)
  $core.List<$core.String> get inboundNumbers => $_getList(6);

  /// User-defined attributes for the Dispatch Rule.
  /// Participants created by this rule will inherit these attributes.
  @$pb.TagNumber(8)
  $core.Map<$core.String, $core.String> get attributes => $_getMap(7);

  /// Cloud-only, config preset to use
  @$pb.TagNumber(9)
  $core.String get roomPreset => $_getSZ(8);
  @$pb.TagNumber(9)
  set roomPreset($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasRoomPreset() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoomPreset() => clearField(9);

  /// RoomConfiguration to use if the participant initiates the room
  @$pb.TagNumber(10)
  $9.RoomConfiguration get roomConfig => $_getN(9);
  @$pb.TagNumber(10)
  set roomConfig($9.RoomConfiguration v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasRoomConfig() => $_has(9);
  @$pb.TagNumber(10)
  void clearRoomConfig() => clearField(10);
  @$pb.TagNumber(10)
  $9.RoomConfiguration ensureRoomConfig() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.bool get krispEnabled => $_getBF(10);
  @$pb.TagNumber(11)
  set krispEnabled($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasKrispEnabled() => $_has(10);
  @$pb.TagNumber(11)
  void clearKrispEnabled() => clearField(11);

  @$pb.TagNumber(12)
  SIPMediaEncryption get mediaEncryption => $_getN(11);
  @$pb.TagNumber(12)
  set mediaEncryption(SIPMediaEncryption v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasMediaEncryption() => $_has(11);
  @$pb.TagNumber(12)
  void clearMediaEncryption() => clearField(12);
}

class SIPDispatchRuleUpdate extends $pb.GeneratedMessage {
  factory SIPDispatchRuleUpdate({
    $2.ListUpdate? trunkIds,
    SIPDispatchRule? rule,
    $core.String? name,
    $core.String? metadata,
    $core.Map<$core.String, $core.String>? attributes,
    SIPMediaEncryption? mediaEncryption,
  }) {
    final $result = create();
    if (trunkIds != null) {
      $result.trunkIds = trunkIds;
    }
    if (rule != null) {
      $result.rule = rule;
    }
    if (name != null) {
      $result.name = name;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (attributes != null) {
      $result.attributes.addAll(attributes);
    }
    if (mediaEncryption != null) {
      $result.mediaEncryption = mediaEncryption;
    }
    return $result;
  }
  SIPDispatchRuleUpdate._() : super();
  factory SIPDispatchRuleUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPDispatchRuleUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPDispatchRuleUpdate', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<$2.ListUpdate>(1, _omitFieldNames ? '' : 'trunkIds', subBuilder: $2.ListUpdate.create)
    ..aOM<SIPDispatchRule>(2, _omitFieldNames ? '' : 'rule', subBuilder: SIPDispatchRule.create)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'metadata')
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'attributes', entryClassName: 'SIPDispatchRuleUpdate.AttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..e<SIPMediaEncryption>(6, _omitFieldNames ? '' : 'mediaEncryption', $pb.PbFieldType.OE, defaultOrMaker: SIPMediaEncryption.SIP_MEDIA_ENCRYPT_DISABLE, valueOf: SIPMediaEncryption.valueOf, enumValues: SIPMediaEncryption.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPDispatchRuleUpdate clone() => SIPDispatchRuleUpdate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPDispatchRuleUpdate copyWith(void Function(SIPDispatchRuleUpdate) updates) => super.copyWith((message) => updates(message as SIPDispatchRuleUpdate)) as SIPDispatchRuleUpdate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleUpdate create() => SIPDispatchRuleUpdate._();
  SIPDispatchRuleUpdate createEmptyInstance() => create();
  static $pb.PbList<SIPDispatchRuleUpdate> createRepeated() => $pb.PbList<SIPDispatchRuleUpdate>();
  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPDispatchRuleUpdate>(create);
  static SIPDispatchRuleUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $2.ListUpdate get trunkIds => $_getN(0);
  @$pb.TagNumber(1)
  set trunkIds($2.ListUpdate v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrunkIds() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrunkIds() => clearField(1);
  @$pb.TagNumber(1)
  $2.ListUpdate ensureTrunkIds() => $_ensure(0);

  @$pb.TagNumber(2)
  SIPDispatchRule get rule => $_getN(1);
  @$pb.TagNumber(2)
  set rule(SIPDispatchRule v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRule() => $_has(1);
  @$pb.TagNumber(2)
  void clearRule() => clearField(2);
  @$pb.TagNumber(2)
  SIPDispatchRule ensureRule() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get metadata => $_getSZ(3);
  @$pb.TagNumber(4)
  set metadata($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMetadata() => $_has(3);
  @$pb.TagNumber(4)
  void clearMetadata() => clearField(4);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get attributes => $_getMap(4);

  @$pb.TagNumber(6)
  SIPMediaEncryption get mediaEncryption => $_getN(5);
  @$pb.TagNumber(6)
  set mediaEncryption(SIPMediaEncryption v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasMediaEncryption() => $_has(5);
  @$pb.TagNumber(6)
  void clearMediaEncryption() => clearField(6);
}

/// ListSIPDispatchRuleRequest lists dispatch rules for given filters. If no filters are set, all rules are listed.
class ListSIPDispatchRuleRequest extends $pb.GeneratedMessage {
  factory ListSIPDispatchRuleRequest({
    $core.Iterable<$core.String>? dispatchRuleIds,
    $core.Iterable<$core.String>? trunkIds,
    $2.Pagination? page,
  }) {
    final $result = create();
    if (dispatchRuleIds != null) {
      $result.dispatchRuleIds.addAll(dispatchRuleIds);
    }
    if (trunkIds != null) {
      $result.trunkIds.addAll(trunkIds);
    }
    if (page != null) {
      $result.page = page;
    }
    return $result;
  }
  ListSIPDispatchRuleRequest._() : super();
  factory ListSIPDispatchRuleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSIPDispatchRuleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSIPDispatchRuleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'dispatchRuleIds')
    ..pPS(2, _omitFieldNames ? '' : 'trunkIds')
    ..aOM<$2.Pagination>(3, _omitFieldNames ? '' : 'page', subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSIPDispatchRuleRequest clone() => ListSIPDispatchRuleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSIPDispatchRuleRequest copyWith(void Function(ListSIPDispatchRuleRequest) updates) => super.copyWith((message) => updates(message as ListSIPDispatchRuleRequest)) as ListSIPDispatchRuleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPDispatchRuleRequest create() => ListSIPDispatchRuleRequest._();
  ListSIPDispatchRuleRequest createEmptyInstance() => create();
  static $pb.PbList<ListSIPDispatchRuleRequest> createRepeated() => $pb.PbList<ListSIPDispatchRuleRequest>();
  @$core.pragma('dart2js:noInline')
  static ListSIPDispatchRuleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSIPDispatchRuleRequest>(create);
  static ListSIPDispatchRuleRequest? _defaultInstance;

  /// Rule IDs to list. If this option is set, the response will contains rules in the same order.
  /// If any of the rules is missing, a nil item in that position will be sent in the response.
  @$pb.TagNumber(1)
  $core.List<$core.String> get dispatchRuleIds => $_getList(0);

  /// Only list rules that contain one of the Trunk IDs, including wildcard rules.
  @$pb.TagNumber(2)
  $core.List<$core.String> get trunkIds => $_getList(1);

  @$pb.TagNumber(3)
  $2.Pagination get page => $_getN(2);
  @$pb.TagNumber(3)
  set page($2.Pagination v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => clearField(3);
  @$pb.TagNumber(3)
  $2.Pagination ensurePage() => $_ensure(2);
}

class ListSIPDispatchRuleResponse extends $pb.GeneratedMessage {
  factory ListSIPDispatchRuleResponse({
    $core.Iterable<SIPDispatchRuleInfo>? items,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  ListSIPDispatchRuleResponse._() : super();
  factory ListSIPDispatchRuleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSIPDispatchRuleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListSIPDispatchRuleResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<SIPDispatchRuleInfo>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: SIPDispatchRuleInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSIPDispatchRuleResponse clone() => ListSIPDispatchRuleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSIPDispatchRuleResponse copyWith(void Function(ListSIPDispatchRuleResponse) updates) => super.copyWith((message) => updates(message as ListSIPDispatchRuleResponse)) as ListSIPDispatchRuleResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPDispatchRuleResponse create() => ListSIPDispatchRuleResponse._();
  ListSIPDispatchRuleResponse createEmptyInstance() => create();
  static $pb.PbList<ListSIPDispatchRuleResponse> createRepeated() => $pb.PbList<ListSIPDispatchRuleResponse>();
  @$core.pragma('dart2js:noInline')
  static ListSIPDispatchRuleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSIPDispatchRuleResponse>(create);
  static ListSIPDispatchRuleResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SIPDispatchRuleInfo> get items => $_getList(0);
}

class DeleteSIPDispatchRuleRequest extends $pb.GeneratedMessage {
  factory DeleteSIPDispatchRuleRequest({
    $core.String? sipDispatchRuleId,
  }) {
    final $result = create();
    if (sipDispatchRuleId != null) {
      $result.sipDispatchRuleId = sipDispatchRuleId;
    }
    return $result;
  }
  DeleteSIPDispatchRuleRequest._() : super();
  factory DeleteSIPDispatchRuleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSIPDispatchRuleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteSIPDispatchRuleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipDispatchRuleId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteSIPDispatchRuleRequest clone() => DeleteSIPDispatchRuleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteSIPDispatchRuleRequest copyWith(void Function(DeleteSIPDispatchRuleRequest) updates) => super.copyWith((message) => updates(message as DeleteSIPDispatchRuleRequest)) as DeleteSIPDispatchRuleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSIPDispatchRuleRequest create() => DeleteSIPDispatchRuleRequest._();
  DeleteSIPDispatchRuleRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteSIPDispatchRuleRequest> createRepeated() => $pb.PbList<DeleteSIPDispatchRuleRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteSIPDispatchRuleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSIPDispatchRuleRequest>(create);
  static DeleteSIPDispatchRuleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipDispatchRuleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipDispatchRuleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSipDispatchRuleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipDispatchRuleId() => clearField(1);
}

class SIPOutboundConfig extends $pb.GeneratedMessage {
  factory SIPOutboundConfig({
    $core.String? hostname,
    SIPTransport? transport,
    $core.String? authUsername,
    $core.String? authPassword,
    $core.Map<$core.String, $core.String>? headersToAttributes,
    $core.Map<$core.String, $core.String>? attributesToHeaders,
    $core.String? destinationCountry,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (transport != null) {
      $result.transport = transport;
    }
    if (authUsername != null) {
      $result.authUsername = authUsername;
    }
    if (authPassword != null) {
      $result.authPassword = authPassword;
    }
    if (headersToAttributes != null) {
      $result.headersToAttributes.addAll(headersToAttributes);
    }
    if (attributesToHeaders != null) {
      $result.attributesToHeaders.addAll(attributesToHeaders);
    }
    if (destinationCountry != null) {
      $result.destinationCountry = destinationCountry;
    }
    return $result;
  }
  SIPOutboundConfig._() : super();
  factory SIPOutboundConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPOutboundConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPOutboundConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..e<SIPTransport>(2, _omitFieldNames ? '' : 'transport', $pb.PbFieldType.OE, defaultOrMaker: SIPTransport.SIP_TRANSPORT_AUTO, valueOf: SIPTransport.valueOf, enumValues: SIPTransport.values)
    ..aOS(3, _omitFieldNames ? '' : 'authUsername')
    ..aOS(4, _omitFieldNames ? '' : 'authPassword')
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'headersToAttributes', entryClassName: 'SIPOutboundConfig.HeadersToAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..m<$core.String, $core.String>(6, _omitFieldNames ? '' : 'attributesToHeaders', entryClassName: 'SIPOutboundConfig.AttributesToHeadersEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..aOS(7, _omitFieldNames ? '' : 'destinationCountry')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPOutboundConfig clone() => SIPOutboundConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPOutboundConfig copyWith(void Function(SIPOutboundConfig) updates) => super.copyWith((message) => updates(message as SIPOutboundConfig)) as SIPOutboundConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPOutboundConfig create() => SIPOutboundConfig._();
  SIPOutboundConfig createEmptyInstance() => create();
  static $pb.PbList<SIPOutboundConfig> createRepeated() => $pb.PbList<SIPOutboundConfig>();
  @$core.pragma('dart2js:noInline')
  static SIPOutboundConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPOutboundConfig>(create);
  static SIPOutboundConfig? _defaultInstance;

  /// SIP server address
  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);

  /// SIP Transport used for outbound call.
  @$pb.TagNumber(2)
  SIPTransport get transport => $_getN(1);
  @$pb.TagNumber(2)
  set transport(SIPTransport v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransport() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransport() => clearField(2);

  /// Username and password used to authenticate with SIP server.
  /// May be empty to have no authentication.
  @$pb.TagNumber(3)
  $core.String get authUsername => $_getSZ(2);
  @$pb.TagNumber(3)
  set authUsername($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthUsername() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthUsername() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get authPassword => $_getSZ(3);
  @$pb.TagNumber(4)
  set authPassword($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthPassword() => clearField(4);

  /// Map SIP X-* headers from 200 OK to SIP participant attributes.
  /// Keys are the names of X-* headers and values are the names of attributes they will be mapped to.
  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get headersToAttributes => $_getMap(4);

  /// Map LiveKit attributes to SIP X-* headers when sending BYE or REFER requests.
  /// Keys are the names of attributes and values are the names of X-* headers they will be mapped to.
  @$pb.TagNumber(6)
  $core.Map<$core.String, $core.String> get attributesToHeaders => $_getMap(5);

  /// country where the call terminates as ISO 3166-1 alpha-2 (https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). This will be used by the livekit infrastructure to route calls.
  @$pb.TagNumber(7)
  $core.String get destinationCountry => $_getSZ(6);
  @$pb.TagNumber(7)
  set destinationCountry($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDestinationCountry() => $_has(6);
  @$pb.TagNumber(7)
  void clearDestinationCountry() => clearField(7);
}

/// A SIP Participant is a singular SIP session connected to a LiveKit room via
/// a SIP Trunk into a SIP DispatchRule
class CreateSIPParticipantRequest extends $pb.GeneratedMessage {
  factory CreateSIPParticipantRequest({
    $core.String? sipTrunkId,
    $core.String? sipCallTo,
    $core.String? roomName,
    $core.String? participantIdentity,
    $core.String? dtmf,
  @$core.Deprecated('This field is deprecated.')
    $core.bool? playRingtone,
    $core.String? participantName,
    $core.String? participantMetadata,
    $core.Map<$core.String, $core.String>? participantAttributes,
    $core.bool? hidePhoneNumber,
    $10.Duration? ringingTimeout,
    $10.Duration? maxCallDuration,
    $core.bool? playDialtone,
    $core.bool? krispEnabled,
    $core.String? sipNumber,
    $core.Map<$core.String, $core.String>? headers,
    SIPHeaderOptions? includeHeaders,
    SIPMediaEncryption? mediaEncryption,
    $core.bool? waitUntilAnswered,
    SIPOutboundConfig? trunk,
    $core.String? displayName,
    Destination? destination,
  }) {
    final $result = create();
    if (sipTrunkId != null) {
      $result.sipTrunkId = sipTrunkId;
    }
    if (sipCallTo != null) {
      $result.sipCallTo = sipCallTo;
    }
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (participantIdentity != null) {
      $result.participantIdentity = participantIdentity;
    }
    if (dtmf != null) {
      $result.dtmf = dtmf;
    }
    if (playRingtone != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.playRingtone = playRingtone;
    }
    if (participantName != null) {
      $result.participantName = participantName;
    }
    if (participantMetadata != null) {
      $result.participantMetadata = participantMetadata;
    }
    if (participantAttributes != null) {
      $result.participantAttributes.addAll(participantAttributes);
    }
    if (hidePhoneNumber != null) {
      $result.hidePhoneNumber = hidePhoneNumber;
    }
    if (ringingTimeout != null) {
      $result.ringingTimeout = ringingTimeout;
    }
    if (maxCallDuration != null) {
      $result.maxCallDuration = maxCallDuration;
    }
    if (playDialtone != null) {
      $result.playDialtone = playDialtone;
    }
    if (krispEnabled != null) {
      $result.krispEnabled = krispEnabled;
    }
    if (sipNumber != null) {
      $result.sipNumber = sipNumber;
    }
    if (headers != null) {
      $result.headers.addAll(headers);
    }
    if (includeHeaders != null) {
      $result.includeHeaders = includeHeaders;
    }
    if (mediaEncryption != null) {
      $result.mediaEncryption = mediaEncryption;
    }
    if (waitUntilAnswered != null) {
      $result.waitUntilAnswered = waitUntilAnswered;
    }
    if (trunk != null) {
      $result.trunk = trunk;
    }
    if (displayName != null) {
      $result.displayName = displayName;
    }
    if (destination != null) {
      $result.destination = destination;
    }
    return $result;
  }
  CreateSIPParticipantRequest._() : super();
  factory CreateSIPParticipantRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSIPParticipantRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSIPParticipantRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..aOS(2, _omitFieldNames ? '' : 'sipCallTo')
    ..aOS(3, _omitFieldNames ? '' : 'roomName')
    ..aOS(4, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(5, _omitFieldNames ? '' : 'dtmf')
    ..aOB(6, _omitFieldNames ? '' : 'playRingtone')
    ..aOS(7, _omitFieldNames ? '' : 'participantName')
    ..aOS(8, _omitFieldNames ? '' : 'participantMetadata')
    ..m<$core.String, $core.String>(9, _omitFieldNames ? '' : 'participantAttributes', entryClassName: 'CreateSIPParticipantRequest.ParticipantAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..aOB(10, _omitFieldNames ? '' : 'hidePhoneNumber')
    ..aOM<$10.Duration>(11, _omitFieldNames ? '' : 'ringingTimeout', subBuilder: $10.Duration.create)
    ..aOM<$10.Duration>(12, _omitFieldNames ? '' : 'maxCallDuration', subBuilder: $10.Duration.create)
    ..aOB(13, _omitFieldNames ? '' : 'playDialtone')
    ..aOB(14, _omitFieldNames ? '' : 'krispEnabled')
    ..aOS(15, _omitFieldNames ? '' : 'sipNumber')
    ..m<$core.String, $core.String>(16, _omitFieldNames ? '' : 'headers', entryClassName: 'CreateSIPParticipantRequest.HeadersEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..e<SIPHeaderOptions>(17, _omitFieldNames ? '' : 'includeHeaders', $pb.PbFieldType.OE, defaultOrMaker: SIPHeaderOptions.SIP_NO_HEADERS, valueOf: SIPHeaderOptions.valueOf, enumValues: SIPHeaderOptions.values)
    ..e<SIPMediaEncryption>(18, _omitFieldNames ? '' : 'mediaEncryption', $pb.PbFieldType.OE, defaultOrMaker: SIPMediaEncryption.SIP_MEDIA_ENCRYPT_DISABLE, valueOf: SIPMediaEncryption.valueOf, enumValues: SIPMediaEncryption.values)
    ..aOB(19, _omitFieldNames ? '' : 'waitUntilAnswered')
    ..aOM<SIPOutboundConfig>(20, _omitFieldNames ? '' : 'trunk', subBuilder: SIPOutboundConfig.create)
    ..aOS(21, _omitFieldNames ? '' : 'displayName')
    ..aOM<Destination>(22, _omitFieldNames ? '' : 'destination', subBuilder: Destination.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSIPParticipantRequest clone() => CreateSIPParticipantRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSIPParticipantRequest copyWith(void Function(CreateSIPParticipantRequest) updates) => super.copyWith((message) => updates(message as CreateSIPParticipantRequest)) as CreateSIPParticipantRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSIPParticipantRequest create() => CreateSIPParticipantRequest._();
  CreateSIPParticipantRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSIPParticipantRequest> createRepeated() => $pb.PbList<CreateSIPParticipantRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSIPParticipantRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSIPParticipantRequest>(create);
  static CreateSIPParticipantRequest? _defaultInstance;

  /// What SIP Trunk should be used to dial the user
  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => clearField(1);

  /// What number should be dialed via SIP
  @$pb.TagNumber(2)
  $core.String get sipCallTo => $_getSZ(1);
  @$pb.TagNumber(2)
  set sipCallTo($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSipCallTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearSipCallTo() => clearField(2);

  /// What LiveKit room should this participant be connected too
  @$pb.TagNumber(3)
  $core.String get roomName => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomName() => clearField(3);

  /// Optional identity of the participant in LiveKit room
  @$pb.TagNumber(4)
  $core.String get participantIdentity => $_getSZ(3);
  @$pb.TagNumber(4)
  set participantIdentity($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasParticipantIdentity() => $_has(3);
  @$pb.TagNumber(4)
  void clearParticipantIdentity() => clearField(4);

  /// Optionally send following DTMF digits (extension codes) when making a call.
  /// Character 'w' can be used to add a 0.5 sec delay.
  @$pb.TagNumber(5)
  $core.String get dtmf => $_getSZ(4);
  @$pb.TagNumber(5)
  set dtmf($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDtmf() => $_has(4);
  @$pb.TagNumber(5)
  void clearDtmf() => clearField(5);

  /// Optionally play dialtone in the room as an audible indicator for existing participants. The `play_ringtone` option is deprectated but has the same effect.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool get playRingtone => $_getBF(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set playRingtone($core.bool v) { $_setBool(5, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasPlayRingtone() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearPlayRingtone() => clearField(6);

  /// Optional name of the participant in LiveKit room
  @$pb.TagNumber(7)
  $core.String get participantName => $_getSZ(6);
  @$pb.TagNumber(7)
  set participantName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasParticipantName() => $_has(6);
  @$pb.TagNumber(7)
  void clearParticipantName() => clearField(7);

  /// Optional user-defined metadata. Will be attached to a created Participant in the room.
  @$pb.TagNumber(8)
  $core.String get participantMetadata => $_getSZ(7);
  @$pb.TagNumber(8)
  set participantMetadata($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasParticipantMetadata() => $_has(7);
  @$pb.TagNumber(8)
  void clearParticipantMetadata() => clearField(8);

  /// Optional user-defined attributes. Will be attached to a created Participant in the room.
  @$pb.TagNumber(9)
  $core.Map<$core.String, $core.String> get participantAttributes => $_getMap(8);

  /// By default the From value (Phone number) is used for participant name/identity (if not set) and added to attributes.
  /// If true, a random value for identity will be used and numbers will be omitted from attributes.
  @$pb.TagNumber(10)
  $core.bool get hidePhoneNumber => $_getBF(9);
  @$pb.TagNumber(10)
  set hidePhoneNumber($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasHidePhoneNumber() => $_has(9);
  @$pb.TagNumber(10)
  void clearHidePhoneNumber() => clearField(10);

  /// Max time for the callee to answer the call.
  @$pb.TagNumber(11)
  $10.Duration get ringingTimeout => $_getN(10);
  @$pb.TagNumber(11)
  set ringingTimeout($10.Duration v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasRingingTimeout() => $_has(10);
  @$pb.TagNumber(11)
  void clearRingingTimeout() => clearField(11);
  @$pb.TagNumber(11)
  $10.Duration ensureRingingTimeout() => $_ensure(10);

  /// Max call duration.
  @$pb.TagNumber(12)
  $10.Duration get maxCallDuration => $_getN(11);
  @$pb.TagNumber(12)
  set maxCallDuration($10.Duration v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasMaxCallDuration() => $_has(11);
  @$pb.TagNumber(12)
  void clearMaxCallDuration() => clearField(12);
  @$pb.TagNumber(12)
  $10.Duration ensureMaxCallDuration() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.bool get playDialtone => $_getBF(12);
  @$pb.TagNumber(13)
  set playDialtone($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasPlayDialtone() => $_has(12);
  @$pb.TagNumber(13)
  void clearPlayDialtone() => clearField(13);

  /// Enable voice isolation for the callee.
  @$pb.TagNumber(14)
  $core.bool get krispEnabled => $_getBF(13);
  @$pb.TagNumber(14)
  set krispEnabled($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasKrispEnabled() => $_has(13);
  @$pb.TagNumber(14)
  void clearKrispEnabled() => clearField(14);

  /// Optional SIP From number to use. If empty, trunk number is used.
  @$pb.TagNumber(15)
  $core.String get sipNumber => $_getSZ(14);
  @$pb.TagNumber(15)
  set sipNumber($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasSipNumber() => $_has(14);
  @$pb.TagNumber(15)
  void clearSipNumber() => clearField(15);

  /// These headers are sent as-is and may help identify this call as coming from LiveKit for the other SIP endpoint.
  @$pb.TagNumber(16)
  $core.Map<$core.String, $core.String> get headers => $_getMap(15);

  ///  Map SIP headers from 200 OK to sip.h.* participant attributes automatically.
  ///
  ///  When the names of required headers is known, using headers_to_attributes is strongly recommended.
  ///
  ///  When mapping 200 OK headers to follow-up request headers with attributes_to_headers map,
  ///  lowercase header names should be used, for example: sip.h.x-custom-header.
  @$pb.TagNumber(17)
  SIPHeaderOptions get includeHeaders => $_getN(16);
  @$pb.TagNumber(17)
  set includeHeaders(SIPHeaderOptions v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasIncludeHeaders() => $_has(16);
  @$pb.TagNumber(17)
  void clearIncludeHeaders() => clearField(17);

  @$pb.TagNumber(18)
  SIPMediaEncryption get mediaEncryption => $_getN(17);
  @$pb.TagNumber(18)
  set mediaEncryption(SIPMediaEncryption v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasMediaEncryption() => $_has(17);
  @$pb.TagNumber(18)
  void clearMediaEncryption() => clearField(18);

  /// Wait for the answer for the call before returning.
  @$pb.TagNumber(19)
  $core.bool get waitUntilAnswered => $_getBF(18);
  @$pb.TagNumber(19)
  set waitUntilAnswered($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasWaitUntilAnswered() => $_has(18);
  @$pb.TagNumber(19)
  void clearWaitUntilAnswered() => clearField(19);

  @$pb.TagNumber(20)
  SIPOutboundConfig get trunk => $_getN(19);
  @$pb.TagNumber(20)
  set trunk(SIPOutboundConfig v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasTrunk() => $_has(19);
  @$pb.TagNumber(20)
  void clearTrunk() => clearField(20);
  @$pb.TagNumber(20)
  SIPOutboundConfig ensureTrunk() => $_ensure(19);

  ///  Optional display name for the 'From' SIP header.
  ///
  ///  Cases:
  ///  1) Unspecified: Use legacy behavior - display name will be set to be the caller's number.
  ///  2) Empty string: Do not send a display name, which will result in a CNAM lookup downstream.
  ///  3) Non-empty: Use the specified value as the display name.
  @$pb.TagNumber(21)
  $core.String get displayName => $_getSZ(20);
  @$pb.TagNumber(21)
  set displayName($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasDisplayName() => $_has(20);
  @$pb.TagNumber(21)
  void clearDisplayName() => clearField(21);

  @$pb.TagNumber(22)
  Destination get destination => $_getN(21);
  @$pb.TagNumber(22)
  set destination(Destination v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasDestination() => $_has(21);
  @$pb.TagNumber(22)
  void clearDestination() => clearField(22);
  @$pb.TagNumber(22)
  Destination ensureDestination() => $_ensure(21);
}

class SIPParticipantInfo extends $pb.GeneratedMessage {
  factory SIPParticipantInfo({
    $core.String? participantId,
    $core.String? participantIdentity,
    $core.String? roomName,
    $core.String? sipCallId,
  }) {
    final $result = create();
    if (participantId != null) {
      $result.participantId = participantId;
    }
    if (participantIdentity != null) {
      $result.participantIdentity = participantIdentity;
    }
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (sipCallId != null) {
      $result.sipCallId = sipCallId;
    }
    return $result;
  }
  SIPParticipantInfo._() : super();
  factory SIPParticipantInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPParticipantInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPParticipantInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'participantId')
    ..aOS(2, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(3, _omitFieldNames ? '' : 'roomName')
    ..aOS(4, _omitFieldNames ? '' : 'sipCallId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPParticipantInfo clone() => SIPParticipantInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPParticipantInfo copyWith(void Function(SIPParticipantInfo) updates) => super.copyWith((message) => updates(message as SIPParticipantInfo)) as SIPParticipantInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPParticipantInfo create() => SIPParticipantInfo._();
  SIPParticipantInfo createEmptyInstance() => create();
  static $pb.PbList<SIPParticipantInfo> createRepeated() => $pb.PbList<SIPParticipantInfo>();
  @$core.pragma('dart2js:noInline')
  static SIPParticipantInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPParticipantInfo>(create);
  static SIPParticipantInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get participantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set participantId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasParticipantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearParticipantId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get participantIdentity => $_getSZ(1);
  @$pb.TagNumber(2)
  set participantIdentity($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParticipantIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearParticipantIdentity() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomName => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sipCallId => $_getSZ(3);
  @$pb.TagNumber(4)
  set sipCallId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSipCallId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSipCallId() => clearField(4);
}

class TransferSIPParticipantRequest extends $pb.GeneratedMessage {
  factory TransferSIPParticipantRequest({
    $core.String? participantIdentity,
    $core.String? roomName,
    $core.String? transferTo,
    $core.bool? playDialtone,
    $core.Map<$core.String, $core.String>? headers,
    $10.Duration? ringingTimeout,
  }) {
    final $result = create();
    if (participantIdentity != null) {
      $result.participantIdentity = participantIdentity;
    }
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (transferTo != null) {
      $result.transferTo = transferTo;
    }
    if (playDialtone != null) {
      $result.playDialtone = playDialtone;
    }
    if (headers != null) {
      $result.headers.addAll(headers);
    }
    if (ringingTimeout != null) {
      $result.ringingTimeout = ringingTimeout;
    }
    return $result;
  }
  TransferSIPParticipantRequest._() : super();
  factory TransferSIPParticipantRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferSIPParticipantRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransferSIPParticipantRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(2, _omitFieldNames ? '' : 'roomName')
    ..aOS(3, _omitFieldNames ? '' : 'transferTo')
    ..aOB(4, _omitFieldNames ? '' : 'playDialtone')
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'headers', entryClassName: 'TransferSIPParticipantRequest.HeadersEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..aOM<$10.Duration>(6, _omitFieldNames ? '' : 'ringingTimeout', subBuilder: $10.Duration.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransferSIPParticipantRequest clone() => TransferSIPParticipantRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransferSIPParticipantRequest copyWith(void Function(TransferSIPParticipantRequest) updates) => super.copyWith((message) => updates(message as TransferSIPParticipantRequest)) as TransferSIPParticipantRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferSIPParticipantRequest create() => TransferSIPParticipantRequest._();
  TransferSIPParticipantRequest createEmptyInstance() => create();
  static $pb.PbList<TransferSIPParticipantRequest> createRepeated() => $pb.PbList<TransferSIPParticipantRequest>();
  @$core.pragma('dart2js:noInline')
  static TransferSIPParticipantRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferSIPParticipantRequest>(create);
  static TransferSIPParticipantRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get participantIdentity => $_getSZ(0);
  @$pb.TagNumber(1)
  set participantIdentity($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasParticipantIdentity() => $_has(0);
  @$pb.TagNumber(1)
  void clearParticipantIdentity() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomName => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get transferTo => $_getSZ(2);
  @$pb.TagNumber(3)
  set transferTo($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransferTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferTo() => clearField(3);

  /// Optionally play dialtone to the SIP participant as an audible indicator of being transferred
  @$pb.TagNumber(4)
  $core.bool get playDialtone => $_getBF(3);
  @$pb.TagNumber(4)
  set playDialtone($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlayDialtone() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlayDialtone() => clearField(4);

  /// Add the following headers to the REFER SIP request.
  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get headers => $_getMap(4);

  /// Max time for the transfer destination to answer the call.
  @$pb.TagNumber(6)
  $10.Duration get ringingTimeout => $_getN(5);
  @$pb.TagNumber(6)
  set ringingTimeout($10.Duration v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasRingingTimeout() => $_has(5);
  @$pb.TagNumber(6)
  void clearRingingTimeout() => clearField(6);
  @$pb.TagNumber(6)
  $10.Duration ensureRingingTimeout() => $_ensure(5);
}

class SIPCallInfo extends $pb.GeneratedMessage {
  factory SIPCallInfo({
    $core.String? callId,
    $core.String? trunkId,
    $core.String? roomName,
    $core.String? roomId,
    $core.String? participantIdentity,
    SIPUri? fromUri,
    SIPUri? toUri,
    SIPCallStatus? callStatus,
  @$core.Deprecated('This field is deprecated.')
    $fixnum.Int64? createdAt,
  @$core.Deprecated('This field is deprecated.')
    $fixnum.Int64? startedAt,
  @$core.Deprecated('This field is deprecated.')
    $fixnum.Int64? endedAt,
    $2.DisconnectReason? disconnectReason,
    $core.String? error,
    $core.Iterable<SIPFeature>? enabledFeatures,
    SIPCallDirection? callDirection,
    $core.String? dispatchRuleId,
    $core.String? region,
    $core.Map<$core.String, $core.String>? participantAttributes,
    SIPStatus? callStatusCode,
    $core.String? audioCodec,
    $core.String? mediaEncryption,
    $fixnum.Int64? createdAtNs,
    $fixnum.Int64? startedAtNs,
    $fixnum.Int64? endedAtNs,
    $core.String? pcapFileLink,
    $core.Iterable<$11.Any>? callContext,
    ProviderInfo? providerInfo,
  }) {
    final $result = create();
    if (callId != null) {
      $result.callId = callId;
    }
    if (trunkId != null) {
      $result.trunkId = trunkId;
    }
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (participantIdentity != null) {
      $result.participantIdentity = participantIdentity;
    }
    if (fromUri != null) {
      $result.fromUri = fromUri;
    }
    if (toUri != null) {
      $result.toUri = toUri;
    }
    if (callStatus != null) {
      $result.callStatus = callStatus;
    }
    if (createdAt != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.createdAt = createdAt;
    }
    if (startedAt != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.startedAt = startedAt;
    }
    if (endedAt != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.endedAt = endedAt;
    }
    if (disconnectReason != null) {
      $result.disconnectReason = disconnectReason;
    }
    if (error != null) {
      $result.error = error;
    }
    if (enabledFeatures != null) {
      $result.enabledFeatures.addAll(enabledFeatures);
    }
    if (callDirection != null) {
      $result.callDirection = callDirection;
    }
    if (dispatchRuleId != null) {
      $result.dispatchRuleId = dispatchRuleId;
    }
    if (region != null) {
      $result.region = region;
    }
    if (participantAttributes != null) {
      $result.participantAttributes.addAll(participantAttributes);
    }
    if (callStatusCode != null) {
      $result.callStatusCode = callStatusCode;
    }
    if (audioCodec != null) {
      $result.audioCodec = audioCodec;
    }
    if (mediaEncryption != null) {
      $result.mediaEncryption = mediaEncryption;
    }
    if (createdAtNs != null) {
      $result.createdAtNs = createdAtNs;
    }
    if (startedAtNs != null) {
      $result.startedAtNs = startedAtNs;
    }
    if (endedAtNs != null) {
      $result.endedAtNs = endedAtNs;
    }
    if (pcapFileLink != null) {
      $result.pcapFileLink = pcapFileLink;
    }
    if (callContext != null) {
      $result.callContext.addAll(callContext);
    }
    if (providerInfo != null) {
      $result.providerInfo = providerInfo;
    }
    return $result;
  }
  SIPCallInfo._() : super();
  factory SIPCallInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPCallInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPCallInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'callId')
    ..aOS(2, _omitFieldNames ? '' : 'trunkId')
    ..aOS(3, _omitFieldNames ? '' : 'roomName')
    ..aOS(4, _omitFieldNames ? '' : 'roomId')
    ..aOS(5, _omitFieldNames ? '' : 'participantIdentity')
    ..aOM<SIPUri>(6, _omitFieldNames ? '' : 'fromUri', subBuilder: SIPUri.create)
    ..aOM<SIPUri>(7, _omitFieldNames ? '' : 'toUri', subBuilder: SIPUri.create)
    ..e<SIPCallStatus>(8, _omitFieldNames ? '' : 'callStatus', $pb.PbFieldType.OE, defaultOrMaker: SIPCallStatus.SCS_CALL_INCOMING, valueOf: SIPCallStatus.valueOf, enumValues: SIPCallStatus.values)
    ..aInt64(9, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(10, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(11, _omitFieldNames ? '' : 'endedAt')
    ..e<$2.DisconnectReason>(12, _omitFieldNames ? '' : 'disconnectReason', $pb.PbFieldType.OE, defaultOrMaker: $2.DisconnectReason.UNKNOWN_REASON, valueOf: $2.DisconnectReason.valueOf, enumValues: $2.DisconnectReason.values)
    ..aOS(13, _omitFieldNames ? '' : 'error')
    ..pc<SIPFeature>(14, _omitFieldNames ? '' : 'enabledFeatures', $pb.PbFieldType.KE, valueOf: SIPFeature.valueOf, enumValues: SIPFeature.values, defaultEnumValue: SIPFeature.NONE)
    ..e<SIPCallDirection>(15, _omitFieldNames ? '' : 'callDirection', $pb.PbFieldType.OE, defaultOrMaker: SIPCallDirection.SCD_UNKNOWN, valueOf: SIPCallDirection.valueOf, enumValues: SIPCallDirection.values)
    ..aOS(16, _omitFieldNames ? '' : 'dispatchRuleId')
    ..aOS(17, _omitFieldNames ? '' : 'region')
    ..m<$core.String, $core.String>(18, _omitFieldNames ? '' : 'participantAttributes', entryClassName: 'SIPCallInfo.ParticipantAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..aOM<SIPStatus>(19, _omitFieldNames ? '' : 'callStatusCode', subBuilder: SIPStatus.create)
    ..aOS(20, _omitFieldNames ? '' : 'audioCodec')
    ..aOS(21, _omitFieldNames ? '' : 'mediaEncryption')
    ..aInt64(22, _omitFieldNames ? '' : 'createdAtNs')
    ..aInt64(23, _omitFieldNames ? '' : 'startedAtNs')
    ..aInt64(24, _omitFieldNames ? '' : 'endedAtNs')
    ..aOS(25, _omitFieldNames ? '' : 'pcapFileLink')
    ..pc<$11.Any>(26, _omitFieldNames ? '' : 'callContext', $pb.PbFieldType.PM, subBuilder: $11.Any.create)
    ..aOM<ProviderInfo>(27, _omitFieldNames ? '' : 'providerInfo', subBuilder: ProviderInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPCallInfo clone() => SIPCallInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPCallInfo copyWith(void Function(SIPCallInfo) updates) => super.copyWith((message) => updates(message as SIPCallInfo)) as SIPCallInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPCallInfo create() => SIPCallInfo._();
  SIPCallInfo createEmptyInstance() => create();
  static $pb.PbList<SIPCallInfo> createRepeated() => $pb.PbList<SIPCallInfo>();
  @$core.pragma('dart2js:noInline')
  static SIPCallInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPCallInfo>(create);
  static SIPCallInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get callId => $_getSZ(0);
  @$pb.TagNumber(1)
  set callId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get trunkId => $_getSZ(1);
  @$pb.TagNumber(2)
  set trunkId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTrunkId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTrunkId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomName => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomId => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get participantIdentity => $_getSZ(4);
  @$pb.TagNumber(5)
  set participantIdentity($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasParticipantIdentity() => $_has(4);
  @$pb.TagNumber(5)
  void clearParticipantIdentity() => clearField(5);

  @$pb.TagNumber(6)
  SIPUri get fromUri => $_getN(5);
  @$pb.TagNumber(6)
  set fromUri(SIPUri v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasFromUri() => $_has(5);
  @$pb.TagNumber(6)
  void clearFromUri() => clearField(6);
  @$pb.TagNumber(6)
  SIPUri ensureFromUri() => $_ensure(5);

  @$pb.TagNumber(7)
  SIPUri get toUri => $_getN(6);
  @$pb.TagNumber(7)
  set toUri(SIPUri v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasToUri() => $_has(6);
  @$pb.TagNumber(7)
  void clearToUri() => clearField(7);
  @$pb.TagNumber(7)
  SIPUri ensureToUri() => $_ensure(6);

  @$pb.TagNumber(8)
  SIPCallStatus get callStatus => $_getN(7);
  @$pb.TagNumber(8)
  set callStatus(SIPCallStatus v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCallStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearCallStatus() => clearField(8);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $fixnum.Int64 get createdAt => $_getI64(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  set createdAt($fixnum.Int64 v) { $_setInt64(8, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  void clearCreatedAt() => clearField(9);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  $fixnum.Int64 get startedAt => $_getI64(9);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  set startedAt($fixnum.Int64 v) { $_setInt64(9, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  $core.bool hasStartedAt() => $_has(9);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  void clearStartedAt() => clearField(10);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  $fixnum.Int64 get endedAt => $_getI64(10);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  set endedAt($fixnum.Int64 v) { $_setInt64(10, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  $core.bool hasEndedAt() => $_has(10);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  void clearEndedAt() => clearField(11);

  @$pb.TagNumber(12)
  $2.DisconnectReason get disconnectReason => $_getN(11);
  @$pb.TagNumber(12)
  set disconnectReason($2.DisconnectReason v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasDisconnectReason() => $_has(11);
  @$pb.TagNumber(12)
  void clearDisconnectReason() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get error => $_getSZ(12);
  @$pb.TagNumber(13)
  set error($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasError() => $_has(12);
  @$pb.TagNumber(13)
  void clearError() => clearField(13);

  @$pb.TagNumber(14)
  $core.List<SIPFeature> get enabledFeatures => $_getList(13);

  @$pb.TagNumber(15)
  SIPCallDirection get callDirection => $_getN(14);
  @$pb.TagNumber(15)
  set callDirection(SIPCallDirection v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCallDirection() => $_has(14);
  @$pb.TagNumber(15)
  void clearCallDirection() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get dispatchRuleId => $_getSZ(15);
  @$pb.TagNumber(16)
  set dispatchRuleId($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasDispatchRuleId() => $_has(15);
  @$pb.TagNumber(16)
  void clearDispatchRuleId() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get region => $_getSZ(16);
  @$pb.TagNumber(17)
  set region($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasRegion() => $_has(16);
  @$pb.TagNumber(17)
  void clearRegion() => clearField(17);

  @$pb.TagNumber(18)
  $core.Map<$core.String, $core.String> get participantAttributes => $_getMap(17);

  @$pb.TagNumber(19)
  SIPStatus get callStatusCode => $_getN(18);
  @$pb.TagNumber(19)
  set callStatusCode(SIPStatus v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasCallStatusCode() => $_has(18);
  @$pb.TagNumber(19)
  void clearCallStatusCode() => clearField(19);
  @$pb.TagNumber(19)
  SIPStatus ensureCallStatusCode() => $_ensure(18);

  @$pb.TagNumber(20)
  $core.String get audioCodec => $_getSZ(19);
  @$pb.TagNumber(20)
  set audioCodec($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasAudioCodec() => $_has(19);
  @$pb.TagNumber(20)
  void clearAudioCodec() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get mediaEncryption => $_getSZ(20);
  @$pb.TagNumber(21)
  set mediaEncryption($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasMediaEncryption() => $_has(20);
  @$pb.TagNumber(21)
  void clearMediaEncryption() => clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get createdAtNs => $_getI64(21);
  @$pb.TagNumber(22)
  set createdAtNs($fixnum.Int64 v) { $_setInt64(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasCreatedAtNs() => $_has(21);
  @$pb.TagNumber(22)
  void clearCreatedAtNs() => clearField(22);

  @$pb.TagNumber(23)
  $fixnum.Int64 get startedAtNs => $_getI64(22);
  @$pb.TagNumber(23)
  set startedAtNs($fixnum.Int64 v) { $_setInt64(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasStartedAtNs() => $_has(22);
  @$pb.TagNumber(23)
  void clearStartedAtNs() => clearField(23);

  @$pb.TagNumber(24)
  $fixnum.Int64 get endedAtNs => $_getI64(23);
  @$pb.TagNumber(24)
  set endedAtNs($fixnum.Int64 v) { $_setInt64(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasEndedAtNs() => $_has(23);
  @$pb.TagNumber(24)
  void clearEndedAtNs() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get pcapFileLink => $_getSZ(24);
  @$pb.TagNumber(25)
  set pcapFileLink($core.String v) { $_setString(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasPcapFileLink() => $_has(24);
  @$pb.TagNumber(25)
  void clearPcapFileLink() => clearField(25);

  @$pb.TagNumber(26)
  $core.List<$11.Any> get callContext => $_getList(25);

  @$pb.TagNumber(27)
  ProviderInfo get providerInfo => $_getN(26);
  @$pb.TagNumber(27)
  set providerInfo(ProviderInfo v) { setField(27, v); }
  @$pb.TagNumber(27)
  $core.bool hasProviderInfo() => $_has(26);
  @$pb.TagNumber(27)
  void clearProviderInfo() => clearField(27);
  @$pb.TagNumber(27)
  ProviderInfo ensureProviderInfo() => $_ensure(26);
}

class SIPTransferInfo extends $pb.GeneratedMessage {
  factory SIPTransferInfo({
    $core.String? transferId,
    $core.String? callId,
    $core.String? transferTo,
    $fixnum.Int64? transferInitiatedAtNs,
    $fixnum.Int64? transferCompletedAtNs,
    SIPTransferStatus? transferStatus,
    $core.String? error,
    SIPStatus? transferStatusCode,
  }) {
    final $result = create();
    if (transferId != null) {
      $result.transferId = transferId;
    }
    if (callId != null) {
      $result.callId = callId;
    }
    if (transferTo != null) {
      $result.transferTo = transferTo;
    }
    if (transferInitiatedAtNs != null) {
      $result.transferInitiatedAtNs = transferInitiatedAtNs;
    }
    if (transferCompletedAtNs != null) {
      $result.transferCompletedAtNs = transferCompletedAtNs;
    }
    if (transferStatus != null) {
      $result.transferStatus = transferStatus;
    }
    if (error != null) {
      $result.error = error;
    }
    if (transferStatusCode != null) {
      $result.transferStatusCode = transferStatusCode;
    }
    return $result;
  }
  SIPTransferInfo._() : super();
  factory SIPTransferInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPTransferInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPTransferInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..aOS(2, _omitFieldNames ? '' : 'callId')
    ..aOS(3, _omitFieldNames ? '' : 'transferTo')
    ..aInt64(4, _omitFieldNames ? '' : 'transferInitiatedAtNs')
    ..aInt64(5, _omitFieldNames ? '' : 'transferCompletedAtNs')
    ..e<SIPTransferStatus>(6, _omitFieldNames ? '' : 'transferStatus', $pb.PbFieldType.OE, defaultOrMaker: SIPTransferStatus.STS_TRANSFER_ONGOING, valueOf: SIPTransferStatus.valueOf, enumValues: SIPTransferStatus.values)
    ..aOS(7, _omitFieldNames ? '' : 'error')
    ..aOM<SIPStatus>(8, _omitFieldNames ? '' : 'transferStatusCode', subBuilder: SIPStatus.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPTransferInfo clone() => SIPTransferInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPTransferInfo copyWith(void Function(SIPTransferInfo) updates) => super.copyWith((message) => updates(message as SIPTransferInfo)) as SIPTransferInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPTransferInfo create() => SIPTransferInfo._();
  SIPTransferInfo createEmptyInstance() => create();
  static $pb.PbList<SIPTransferInfo> createRepeated() => $pb.PbList<SIPTransferInfo>();
  @$core.pragma('dart2js:noInline')
  static SIPTransferInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPTransferInfo>(create);
  static SIPTransferInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get callId => $_getSZ(1);
  @$pb.TagNumber(2)
  set callId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCallId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get transferTo => $_getSZ(2);
  @$pb.TagNumber(3)
  set transferTo($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransferTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferTo() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get transferInitiatedAtNs => $_getI64(3);
  @$pb.TagNumber(4)
  set transferInitiatedAtNs($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTransferInitiatedAtNs() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransferInitiatedAtNs() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get transferCompletedAtNs => $_getI64(4);
  @$pb.TagNumber(5)
  set transferCompletedAtNs($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTransferCompletedAtNs() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransferCompletedAtNs() => clearField(5);

  @$pb.TagNumber(6)
  SIPTransferStatus get transferStatus => $_getN(5);
  @$pb.TagNumber(6)
  set transferStatus(SIPTransferStatus v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTransferStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearTransferStatus() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get error => $_getSZ(6);
  @$pb.TagNumber(7)
  set error($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasError() => $_has(6);
  @$pb.TagNumber(7)
  void clearError() => clearField(7);

  @$pb.TagNumber(8)
  SIPStatus get transferStatusCode => $_getN(7);
  @$pb.TagNumber(8)
  set transferStatusCode(SIPStatus v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasTransferStatusCode() => $_has(7);
  @$pb.TagNumber(8)
  void clearTransferStatusCode() => clearField(8);
  @$pb.TagNumber(8)
  SIPStatus ensureTransferStatusCode() => $_ensure(7);
}

class SIPUri extends $pb.GeneratedMessage {
  factory SIPUri({
    $core.String? user,
    $core.String? host,
    $core.String? ip,
    $core.int? port,
    SIPTransport? transport,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    if (host != null) {
      $result.host = host;
    }
    if (ip != null) {
      $result.ip = ip;
    }
    if (port != null) {
      $result.port = port;
    }
    if (transport != null) {
      $result.transport = transport;
    }
    return $result;
  }
  SIPUri._() : super();
  factory SIPUri.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SIPUri.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SIPUri', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'user')
    ..aOS(2, _omitFieldNames ? '' : 'host')
    ..aOS(3, _omitFieldNames ? '' : 'ip')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'port', $pb.PbFieldType.OU3)
    ..e<SIPTransport>(5, _omitFieldNames ? '' : 'transport', $pb.PbFieldType.OE, defaultOrMaker: SIPTransport.SIP_TRANSPORT_AUTO, valueOf: SIPTransport.valueOf, enumValues: SIPTransport.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SIPUri clone() => SIPUri()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SIPUri copyWith(void Function(SIPUri) updates) => super.copyWith((message) => updates(message as SIPUri)) as SIPUri;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPUri create() => SIPUri._();
  SIPUri createEmptyInstance() => create();
  static $pb.PbList<SIPUri> createRepeated() => $pb.PbList<SIPUri>();
  @$core.pragma('dart2js:noInline')
  static SIPUri getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPUri>(create);
  static SIPUri? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get user => $_getSZ(0);
  @$pb.TagNumber(1)
  set user($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get host => $_getSZ(1);
  @$pb.TagNumber(2)
  set host($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHost() => $_has(1);
  @$pb.TagNumber(2)
  void clearHost() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ip => $_getSZ(2);
  @$pb.TagNumber(3)
  set ip($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIp() => $_has(2);
  @$pb.TagNumber(3)
  void clearIp() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get port => $_getIZ(3);
  @$pb.TagNumber(4)
  set port($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPort() => $_has(3);
  @$pb.TagNumber(4)
  void clearPort() => clearField(4);

  @$pb.TagNumber(5)
  SIPTransport get transport => $_getN(4);
  @$pb.TagNumber(5)
  set transport(SIPTransport v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTransport() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransport() => clearField(5);
}

class Destination extends $pb.GeneratedMessage {
  factory Destination({
    $core.String? city,
    $core.String? country,
    $core.String? region,
  }) {
    final $result = create();
    if (city != null) {
      $result.city = city;
    }
    if (country != null) {
      $result.country = country;
    }
    if (region != null) {
      $result.region = region;
    }
    return $result;
  }
  Destination._() : super();
  factory Destination.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Destination.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Destination', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'city')
    ..aOS(2, _omitFieldNames ? '' : 'country')
    ..aOS(3, _omitFieldNames ? '' : 'region')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Destination clone() => Destination()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Destination copyWith(void Function(Destination) updates) => super.copyWith((message) => updates(message as Destination)) as Destination;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Destination create() => Destination._();
  Destination createEmptyInstance() => create();
  static $pb.PbList<Destination> createRepeated() => $pb.PbList<Destination>();
  @$core.pragma('dart2js:noInline')
  static Destination getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Destination>(create);
  static Destination? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get city => $_getSZ(0);
  @$pb.TagNumber(1)
  set city($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCity() => $_has(0);
  @$pb.TagNumber(1)
  void clearCity() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get country => $_getSZ(1);
  @$pb.TagNumber(2)
  set country($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCountry() => $_has(1);
  @$pb.TagNumber(2)
  void clearCountry() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get region => $_getSZ(2);
  @$pb.TagNumber(3)
  set region($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRegion() => $_has(2);
  @$pb.TagNumber(3)
  void clearRegion() => clearField(3);
}

class SIPApi {
  $pb.RpcClient _client;
  SIPApi(this._client);

  $async.Future<ListSIPTrunkResponse> listSIPTrunk($pb.ClientContext? ctx, ListSIPTrunkRequest request) =>
    _client.invoke<ListSIPTrunkResponse>(ctx, 'SIP', 'ListSIPTrunk', request, ListSIPTrunkResponse())
  ;
  $async.Future<SIPInboundTrunkInfo> createSIPInboundTrunk($pb.ClientContext? ctx, CreateSIPInboundTrunkRequest request) =>
    _client.invoke<SIPInboundTrunkInfo>(ctx, 'SIP', 'CreateSIPInboundTrunk', request, SIPInboundTrunkInfo())
  ;
  $async.Future<SIPOutboundTrunkInfo> createSIPOutboundTrunk($pb.ClientContext? ctx, CreateSIPOutboundTrunkRequest request) =>
    _client.invoke<SIPOutboundTrunkInfo>(ctx, 'SIP', 'CreateSIPOutboundTrunk', request, SIPOutboundTrunkInfo())
  ;
  $async.Future<SIPInboundTrunkInfo> updateSIPInboundTrunk($pb.ClientContext? ctx, UpdateSIPInboundTrunkRequest request) =>
    _client.invoke<SIPInboundTrunkInfo>(ctx, 'SIP', 'UpdateSIPInboundTrunk', request, SIPInboundTrunkInfo())
  ;
  $async.Future<SIPOutboundTrunkInfo> updateSIPOutboundTrunk($pb.ClientContext? ctx, UpdateSIPOutboundTrunkRequest request) =>
    _client.invoke<SIPOutboundTrunkInfo>(ctx, 'SIP', 'UpdateSIPOutboundTrunk', request, SIPOutboundTrunkInfo())
  ;
  $async.Future<GetSIPInboundTrunkResponse> getSIPInboundTrunk($pb.ClientContext? ctx, GetSIPInboundTrunkRequest request) =>
    _client.invoke<GetSIPInboundTrunkResponse>(ctx, 'SIP', 'GetSIPInboundTrunk', request, GetSIPInboundTrunkResponse())
  ;
  $async.Future<GetSIPOutboundTrunkResponse> getSIPOutboundTrunk($pb.ClientContext? ctx, GetSIPOutboundTrunkRequest request) =>
    _client.invoke<GetSIPOutboundTrunkResponse>(ctx, 'SIP', 'GetSIPOutboundTrunk', request, GetSIPOutboundTrunkResponse())
  ;
  $async.Future<ListSIPInboundTrunkResponse> listSIPInboundTrunk($pb.ClientContext? ctx, ListSIPInboundTrunkRequest request) =>
    _client.invoke<ListSIPInboundTrunkResponse>(ctx, 'SIP', 'ListSIPInboundTrunk', request, ListSIPInboundTrunkResponse())
  ;
  $async.Future<ListSIPOutboundTrunkResponse> listSIPOutboundTrunk($pb.ClientContext? ctx, ListSIPOutboundTrunkRequest request) =>
    _client.invoke<ListSIPOutboundTrunkResponse>(ctx, 'SIP', 'ListSIPOutboundTrunk', request, ListSIPOutboundTrunkResponse())
  ;
  $async.Future<SIPTrunkInfo> deleteSIPTrunk($pb.ClientContext? ctx, DeleteSIPTrunkRequest request) =>
    _client.invoke<SIPTrunkInfo>(ctx, 'SIP', 'DeleteSIPTrunk', request, SIPTrunkInfo())
  ;
  $async.Future<SIPDispatchRuleInfo> createSIPDispatchRule($pb.ClientContext? ctx, CreateSIPDispatchRuleRequest request) =>
    _client.invoke<SIPDispatchRuleInfo>(ctx, 'SIP', 'CreateSIPDispatchRule', request, SIPDispatchRuleInfo())
  ;
  $async.Future<SIPDispatchRuleInfo> updateSIPDispatchRule($pb.ClientContext? ctx, UpdateSIPDispatchRuleRequest request) =>
    _client.invoke<SIPDispatchRuleInfo>(ctx, 'SIP', 'UpdateSIPDispatchRule', request, SIPDispatchRuleInfo())
  ;
  $async.Future<ListSIPDispatchRuleResponse> listSIPDispatchRule($pb.ClientContext? ctx, ListSIPDispatchRuleRequest request) =>
    _client.invoke<ListSIPDispatchRuleResponse>(ctx, 'SIP', 'ListSIPDispatchRule', request, ListSIPDispatchRuleResponse())
  ;
  $async.Future<SIPDispatchRuleInfo> deleteSIPDispatchRule($pb.ClientContext? ctx, DeleteSIPDispatchRuleRequest request) =>
    _client.invoke<SIPDispatchRuleInfo>(ctx, 'SIP', 'DeleteSIPDispatchRule', request, SIPDispatchRuleInfo())
  ;
  $async.Future<SIPParticipantInfo> createSIPParticipant($pb.ClientContext? ctx, CreateSIPParticipantRequest request) =>
    _client.invoke<SIPParticipantInfo>(ctx, 'SIP', 'CreateSIPParticipant', request, SIPParticipantInfo())
  ;
  $async.Future<$3.Empty> transferSIPParticipant($pb.ClientContext? ctx, TransferSIPParticipantRequest request) =>
    _client.invoke<$3.Empty>(ctx, 'SIP', 'TransferSIPParticipant', request, $3.Empty())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
