// This is a generated file - do not edit.
//
// Generated from livekit_sip.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart' as $3;
import 'package:protobuf/well_known_types/google/protobuf/duration.pb.dart'
    as $0;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $4;

import 'livekit_models.pb.dart' as $1;
import 'livekit_room.pb.dart' as $2;
import 'livekit_sip.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'livekit_sip.pbenum.dart';

/// SIPStatus is returned as an error detail in CreateSIPParticipant.
class SIPStatus extends $pb.GeneratedMessage {
  factory SIPStatus({
    SIPStatusCode? code,
    $core.String? status,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (status != null) result.status = status;
    return result;
  }

  SIPStatus._();

  factory SIPStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aE<SIPStatusCode>(1, _omitFieldNames ? '' : 'code',
        enumValues: SIPStatusCode.values)
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPStatus copyWith(void Function(SIPStatus) updates) =>
      super.copyWith((message) => updates(message as SIPStatus)) as SIPStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPStatus create() => SIPStatus._();
  @$core.override
  SIPStatus createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPStatus getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPStatus>(create);
  static SIPStatus? _defaultInstance;

  @$pb.TagNumber(1)
  SIPStatusCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(SIPStatusCode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);
}

@$core.Deprecated('This message is deprecated')
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
    final result = create();
    if (inboundAddresses != null)
      result.inboundAddresses.addAll(inboundAddresses);
    if (outboundAddress != null) result.outboundAddress = outboundAddress;
    if (outboundNumber != null) result.outboundNumber = outboundNumber;
    if (inboundNumbersRegex != null)
      result.inboundNumbersRegex.addAll(inboundNumbersRegex);
    if (inboundUsername != null) result.inboundUsername = inboundUsername;
    if (inboundPassword != null) result.inboundPassword = inboundPassword;
    if (outboundUsername != null) result.outboundUsername = outboundUsername;
    if (outboundPassword != null) result.outboundPassword = outboundPassword;
    if (inboundNumbers != null) result.inboundNumbers.addAll(inboundNumbers);
    if (name != null) result.name = name;
    if (metadata != null) result.metadata = metadata;
    return result;
  }

  CreateSIPTrunkRequest._();

  factory CreateSIPTrunkRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSIPTrunkRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSIPTrunkRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
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
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSIPTrunkRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSIPTrunkRequest copyWith(
          void Function(CreateSIPTrunkRequest) updates) =>
      super.copyWith((message) => updates(message as CreateSIPTrunkRequest))
          as CreateSIPTrunkRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSIPTrunkRequest create() => CreateSIPTrunkRequest._();
  @$core.override
  CreateSIPTrunkRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateSIPTrunkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSIPTrunkRequest>(create);
  static CreateSIPTrunkRequest? _defaultInstance;

  /// CIDR or IPs that traffic is accepted from
  /// An empty list means all inbound traffic is accepted.
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get inboundAddresses => $_getList(0);

  /// IP that SIP INVITE is sent too
  @$pb.TagNumber(2)
  $core.String get outboundAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set outboundAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOutboundAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearOutboundAddress() => $_clearField(2);

  /// Number used to make outbound calls
  @$pb.TagNumber(3)
  $core.String get outboundNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set outboundNumber($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOutboundNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearOutboundNumber() => $_clearField(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get inboundNumbersRegex => $_getList(3);

  /// Username and password used to authenticate inbound and outbound SIP invites
  /// May be empty to have no Authentication
  @$pb.TagNumber(5)
  $core.String get inboundUsername => $_getSZ(4);
  @$pb.TagNumber(5)
  set inboundUsername($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasInboundUsername() => $_has(4);
  @$pb.TagNumber(5)
  void clearInboundUsername() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get inboundPassword => $_getSZ(5);
  @$pb.TagNumber(6)
  set inboundPassword($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasInboundPassword() => $_has(5);
  @$pb.TagNumber(6)
  void clearInboundPassword() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get outboundUsername => $_getSZ(6);
  @$pb.TagNumber(7)
  set outboundUsername($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasOutboundUsername() => $_has(6);
  @$pb.TagNumber(7)
  void clearOutboundUsername() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get outboundPassword => $_getSZ(7);
  @$pb.TagNumber(8)
  set outboundPassword($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasOutboundPassword() => $_has(7);
  @$pb.TagNumber(8)
  void clearOutboundPassword() => $_clearField(8);

  /// Accepted `To` values. This Trunk will only accept a call made to
  /// these numbers. This allows you to have distinct Trunks for different phone
  /// numbers at the same provider.
  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get inboundNumbers => $_getList(8);

  /// Optional human-readable name for the Trunk.
  @$pb.TagNumber(10)
  $core.String get name => $_getSZ(9);
  @$pb.TagNumber(10)
  set name($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasName() => $_has(9);
  @$pb.TagNumber(10)
  void clearName() => $_clearField(10);

  /// Optional user-defined metadata for the Trunk.
  @$pb.TagNumber(11)
  $core.String get metadata => $_getSZ(10);
  @$pb.TagNumber(11)
  set metadata($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasMetadata() => $_has(10);
  @$pb.TagNumber(11)
  void clearMetadata() => $_clearField(11);
}

class ProviderInfo extends $pb.GeneratedMessage {
  factory ProviderInfo({
    $core.String? id,
    $core.String? name,
    ProviderType? type,
    $core.bool? preventTransfer,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    if (preventTransfer != null) result.preventTransfer = preventTransfer;
    return result;
  }

  ProviderInfo._();

  factory ProviderInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProviderInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProviderInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aE<ProviderType>(3, _omitFieldNames ? '' : 'type',
        enumValues: ProviderType.values)
    ..aOB(4, _omitFieldNames ? '' : 'preventTransfer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProviderInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProviderInfo copyWith(void Function(ProviderInfo) updates) =>
      super.copyWith((message) => updates(message as ProviderInfo))
          as ProviderInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProviderInfo create() => ProviderInfo._();
  @$core.override
  ProviderInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProviderInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProviderInfo>(create);
  static ProviderInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  ProviderType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(ProviderType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get preventTransfer => $_getBF(3);
  @$pb.TagNumber(4)
  set preventTransfer($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPreventTransfer() => $_has(3);
  @$pb.TagNumber(4)
  void clearPreventTransfer() => $_clearField(4);
}

@$core.Deprecated('This message is deprecated')
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
    final result = create();
    if (sipTrunkId != null) result.sipTrunkId = sipTrunkId;
    if (inboundAddresses != null)
      result.inboundAddresses.addAll(inboundAddresses);
    if (outboundAddress != null) result.outboundAddress = outboundAddress;
    if (outboundNumber != null) result.outboundNumber = outboundNumber;
    if (inboundNumbersRegex != null)
      result.inboundNumbersRegex.addAll(inboundNumbersRegex);
    if (inboundUsername != null) result.inboundUsername = inboundUsername;
    if (inboundPassword != null) result.inboundPassword = inboundPassword;
    if (outboundUsername != null) result.outboundUsername = outboundUsername;
    if (outboundPassword != null) result.outboundPassword = outboundPassword;
    if (inboundNumbers != null) result.inboundNumbers.addAll(inboundNumbers);
    if (name != null) result.name = name;
    if (metadata != null) result.metadata = metadata;
    if (transport != null) result.transport = transport;
    if (kind != null) result.kind = kind;
    return result;
  }

  SIPTrunkInfo._();

  factory SIPTrunkInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPTrunkInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPTrunkInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
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
    ..aE<SIPTransport>(13, _omitFieldNames ? '' : 'transport',
        enumValues: SIPTransport.values)
    ..aE<SIPTrunkInfo_TrunkKind>(14, _omitFieldNames ? '' : 'kind',
        enumValues: SIPTrunkInfo_TrunkKind.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPTrunkInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPTrunkInfo copyWith(void Function(SIPTrunkInfo) updates) =>
      super.copyWith((message) => updates(message as SIPTrunkInfo))
          as SIPTrunkInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPTrunkInfo create() => SIPTrunkInfo._();
  @$core.override
  SIPTrunkInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPTrunkInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPTrunkInfo>(create);
  static SIPTrunkInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => $_clearField(1);

  /// CIDR or IPs that traffic is accepted from
  /// An empty list means all inbound traffic is accepted.
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get inboundAddresses => $_getList(1);

  /// IP that SIP INVITE is sent too
  @$pb.TagNumber(3)
  $core.String get outboundAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set outboundAddress($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOutboundAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearOutboundAddress() => $_clearField(3);

  /// Number used to make outbound calls
  @$pb.TagNumber(4)
  $core.String get outboundNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set outboundNumber($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOutboundNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearOutboundNumber() => $_clearField(4);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get inboundNumbersRegex => $_getList(4);

  /// Username and password used to authenticate inbound and outbound SIP invites
  /// May be empty to have no Authentication
  @$pb.TagNumber(6)
  $core.String get inboundUsername => $_getSZ(5);
  @$pb.TagNumber(6)
  set inboundUsername($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasInboundUsername() => $_has(5);
  @$pb.TagNumber(6)
  void clearInboundUsername() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get inboundPassword => $_getSZ(6);
  @$pb.TagNumber(7)
  set inboundPassword($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasInboundPassword() => $_has(6);
  @$pb.TagNumber(7)
  void clearInboundPassword() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get outboundUsername => $_getSZ(7);
  @$pb.TagNumber(8)
  set outboundUsername($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasOutboundUsername() => $_has(7);
  @$pb.TagNumber(8)
  void clearOutboundUsername() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get outboundPassword => $_getSZ(8);
  @$pb.TagNumber(9)
  set outboundPassword($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasOutboundPassword() => $_has(8);
  @$pb.TagNumber(9)
  void clearOutboundPassword() => $_clearField(9);

  /// Accepted `To` values. This Trunk will only accept a call made to
  /// these numbers. This allows you to have distinct Trunks for different phone
  /// numbers at the same provider.
  @$pb.TagNumber(10)
  $pb.PbList<$core.String> get inboundNumbers => $_getList(9);

  /// Human-readable name for the Trunk.
  @$pb.TagNumber(11)
  $core.String get name => $_getSZ(10);
  @$pb.TagNumber(11)
  set name($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasName() => $_has(10);
  @$pb.TagNumber(11)
  void clearName() => $_clearField(11);

  /// User-defined metadata for the Trunk.
  @$pb.TagNumber(12)
  $core.String get metadata => $_getSZ(11);
  @$pb.TagNumber(12)
  set metadata($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasMetadata() => $_has(11);
  @$pb.TagNumber(12)
  void clearMetadata() => $_clearField(12);

  /// Transport used for inbound and outbound calls.
  @$pb.TagNumber(13)
  SIPTransport get transport => $_getN(12);
  @$pb.TagNumber(13)
  set transport(SIPTransport value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasTransport() => $_has(12);
  @$pb.TagNumber(13)
  void clearTransport() => $_clearField(13);

  @$pb.TagNumber(14)
  SIPTrunkInfo_TrunkKind get kind => $_getN(13);
  @$pb.TagNumber(14)
  set kind(SIPTrunkInfo_TrunkKind value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasKind() => $_has(13);
  @$pb.TagNumber(14)
  void clearKind() => $_clearField(14);
}

class CreateSIPInboundTrunkRequest extends $pb.GeneratedMessage {
  factory CreateSIPInboundTrunkRequest({
    SIPInboundTrunkInfo? trunk,
  }) {
    final result = create();
    if (trunk != null) result.trunk = trunk;
    return result;
  }

  CreateSIPInboundTrunkRequest._();

  factory CreateSIPInboundTrunkRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSIPInboundTrunkRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSIPInboundTrunkRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOM<SIPInboundTrunkInfo>(1, _omitFieldNames ? '' : 'trunk',
        subBuilder: SIPInboundTrunkInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSIPInboundTrunkRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSIPInboundTrunkRequest copyWith(
          void Function(CreateSIPInboundTrunkRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateSIPInboundTrunkRequest))
          as CreateSIPInboundTrunkRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSIPInboundTrunkRequest create() =>
      CreateSIPInboundTrunkRequest._();
  @$core.override
  CreateSIPInboundTrunkRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateSIPInboundTrunkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSIPInboundTrunkRequest>(create);
  static CreateSIPInboundTrunkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  SIPInboundTrunkInfo get trunk => $_getN(0);
  @$pb.TagNumber(1)
  set trunk(SIPInboundTrunkInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTrunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrunk() => $_clearField(1);
  @$pb.TagNumber(1)
  SIPInboundTrunkInfo ensureTrunk() => $_ensure(0);
}

enum UpdateSIPInboundTrunkRequest_Action { replace, update, notSet }

class UpdateSIPInboundTrunkRequest extends $pb.GeneratedMessage {
  factory UpdateSIPInboundTrunkRequest({
    $core.String? sipTrunkId,
    SIPInboundTrunkInfo? replace,
    SIPInboundTrunkUpdate? update,
  }) {
    final result = create();
    if (sipTrunkId != null) result.sipTrunkId = sipTrunkId;
    if (replace != null) result.replace = replace;
    if (update != null) result.update = update;
    return result;
  }

  UpdateSIPInboundTrunkRequest._();

  factory UpdateSIPInboundTrunkRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateSIPInboundTrunkRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, UpdateSIPInboundTrunkRequest_Action>
      _UpdateSIPInboundTrunkRequest_ActionByTag = {
    2: UpdateSIPInboundTrunkRequest_Action.replace,
    3: UpdateSIPInboundTrunkRequest_Action.update,
    0: UpdateSIPInboundTrunkRequest_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateSIPInboundTrunkRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..aOM<SIPInboundTrunkInfo>(2, _omitFieldNames ? '' : 'replace',
        subBuilder: SIPInboundTrunkInfo.create)
    ..aOM<SIPInboundTrunkUpdate>(3, _omitFieldNames ? '' : 'update',
        subBuilder: SIPInboundTrunkUpdate.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSIPInboundTrunkRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSIPInboundTrunkRequest copyWith(
          void Function(UpdateSIPInboundTrunkRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateSIPInboundTrunkRequest))
          as UpdateSIPInboundTrunkRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSIPInboundTrunkRequest create() =>
      UpdateSIPInboundTrunkRequest._();
  @$core.override
  UpdateSIPInboundTrunkRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateSIPInboundTrunkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateSIPInboundTrunkRequest>(create);
  static UpdateSIPInboundTrunkRequest? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  UpdateSIPInboundTrunkRequest_Action whichAction() =>
      _UpdateSIPInboundTrunkRequest_ActionByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearAction() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => $_clearField(1);

  @$pb.TagNumber(2)
  SIPInboundTrunkInfo get replace => $_getN(1);
  @$pb.TagNumber(2)
  set replace(SIPInboundTrunkInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReplace() => $_has(1);
  @$pb.TagNumber(2)
  void clearReplace() => $_clearField(2);
  @$pb.TagNumber(2)
  SIPInboundTrunkInfo ensureReplace() => $_ensure(1);

  @$pb.TagNumber(3)
  SIPInboundTrunkUpdate get update => $_getN(2);
  @$pb.TagNumber(3)
  set update(SIPInboundTrunkUpdate value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdate() => $_clearField(3);
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
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? headers,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        headersToAttributes,
    $0.Duration? ringingTimeout,
    $0.Duration? maxCallDuration,
    $core.bool? krispEnabled,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        attributesToHeaders,
    SIPHeaderOptions? includeHeaders,
    SIPMediaEncryption? mediaEncryption,
  }) {
    final result = create();
    if (sipTrunkId != null) result.sipTrunkId = sipTrunkId;
    if (name != null) result.name = name;
    if (metadata != null) result.metadata = metadata;
    if (numbers != null) result.numbers.addAll(numbers);
    if (allowedAddresses != null)
      result.allowedAddresses.addAll(allowedAddresses);
    if (allowedNumbers != null) result.allowedNumbers.addAll(allowedNumbers);
    if (authUsername != null) result.authUsername = authUsername;
    if (authPassword != null) result.authPassword = authPassword;
    if (headers != null) result.headers.addEntries(headers);
    if (headersToAttributes != null)
      result.headersToAttributes.addEntries(headersToAttributes);
    if (ringingTimeout != null) result.ringingTimeout = ringingTimeout;
    if (maxCallDuration != null) result.maxCallDuration = maxCallDuration;
    if (krispEnabled != null) result.krispEnabled = krispEnabled;
    if (attributesToHeaders != null)
      result.attributesToHeaders.addEntries(attributesToHeaders);
    if (includeHeaders != null) result.includeHeaders = includeHeaders;
    if (mediaEncryption != null) result.mediaEncryption = mediaEncryption;
    return result;
  }

  SIPInboundTrunkInfo._();

  factory SIPInboundTrunkInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPInboundTrunkInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPInboundTrunkInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'metadata')
    ..pPS(4, _omitFieldNames ? '' : 'numbers')
    ..pPS(5, _omitFieldNames ? '' : 'allowedAddresses')
    ..pPS(6, _omitFieldNames ? '' : 'allowedNumbers')
    ..aOS(7, _omitFieldNames ? '' : 'authUsername')
    ..aOS(8, _omitFieldNames ? '' : 'authPassword')
    ..m<$core.String, $core.String>(9, _omitFieldNames ? '' : 'headers',
        entryClassName: 'SIPInboundTrunkInfo.HeadersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..m<$core.String, $core.String>(
        10, _omitFieldNames ? '' : 'headersToAttributes',
        entryClassName: 'SIPInboundTrunkInfo.HeadersToAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOM<$0.Duration>(11, _omitFieldNames ? '' : 'ringingTimeout',
        subBuilder: $0.Duration.create)
    ..aOM<$0.Duration>(12, _omitFieldNames ? '' : 'maxCallDuration',
        subBuilder: $0.Duration.create)
    ..aOB(13, _omitFieldNames ? '' : 'krispEnabled')
    ..m<$core.String, $core.String>(
        14, _omitFieldNames ? '' : 'attributesToHeaders',
        entryClassName: 'SIPInboundTrunkInfo.AttributesToHeadersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aE<SIPHeaderOptions>(15, _omitFieldNames ? '' : 'includeHeaders',
        enumValues: SIPHeaderOptions.values)
    ..aE<SIPMediaEncryption>(16, _omitFieldNames ? '' : 'mediaEncryption',
        enumValues: SIPMediaEncryption.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPInboundTrunkInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPInboundTrunkInfo copyWith(void Function(SIPInboundTrunkInfo) updates) =>
      super.copyWith((message) => updates(message as SIPInboundTrunkInfo))
          as SIPInboundTrunkInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPInboundTrunkInfo create() => SIPInboundTrunkInfo._();
  @$core.override
  SIPInboundTrunkInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPInboundTrunkInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPInboundTrunkInfo>(create);
  static SIPInboundTrunkInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => $_clearField(1);

  /// Human-readable name for the Trunk.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// User-defined metadata for the Trunk.
  @$pb.TagNumber(3)
  $core.String get metadata => $_getSZ(2);
  @$pb.TagNumber(3)
  set metadata($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearMetadata() => $_clearField(3);

  /// Numbers associated with LiveKit SIP. The Trunk will only accept calls made to these numbers.
  /// Creating multiple Trunks with different phone numbers allows having different rules for a single provider.
  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get numbers => $_getList(3);

  /// CIDR or IPs that traffic is accepted from.
  /// An empty list means all inbound traffic is accepted.
  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get allowedAddresses => $_getList(4);

  /// Numbers that are allowed to make calls to this Trunk.
  /// An empty list means calls from any phone number is accepted.
  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get allowedNumbers => $_getList(5);

  /// Username and password used to authenticate inbound SIP invites.
  /// May be empty to have no authentication.
  @$pb.TagNumber(7)
  $core.String get authUsername => $_getSZ(6);
  @$pb.TagNumber(7)
  set authUsername($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAuthUsername() => $_has(6);
  @$pb.TagNumber(7)
  void clearAuthUsername() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get authPassword => $_getSZ(7);
  @$pb.TagNumber(8)
  set authPassword($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAuthPassword() => $_has(7);
  @$pb.TagNumber(8)
  void clearAuthPassword() => $_clearField(8);

  /// Include these SIP X-* headers in 200 OK responses.
  @$pb.TagNumber(9)
  $pb.PbMap<$core.String, $core.String> get headers => $_getMap(8);

  /// Map SIP X-* headers from INVITE to SIP participant attributes.
  @$pb.TagNumber(10)
  $pb.PbMap<$core.String, $core.String> get headersToAttributes => $_getMap(9);

  /// Max time for the caller to wait for track subscription.
  @$pb.TagNumber(11)
  $0.Duration get ringingTimeout => $_getN(10);
  @$pb.TagNumber(11)
  set ringingTimeout($0.Duration value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasRingingTimeout() => $_has(10);
  @$pb.TagNumber(11)
  void clearRingingTimeout() => $_clearField(11);
  @$pb.TagNumber(11)
  $0.Duration ensureRingingTimeout() => $_ensure(10);

  /// Max call duration.
  @$pb.TagNumber(12)
  $0.Duration get maxCallDuration => $_getN(11);
  @$pb.TagNumber(12)
  set maxCallDuration($0.Duration value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasMaxCallDuration() => $_has(11);
  @$pb.TagNumber(12)
  void clearMaxCallDuration() => $_clearField(12);
  @$pb.TagNumber(12)
  $0.Duration ensureMaxCallDuration() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.bool get krispEnabled => $_getBF(12);
  @$pb.TagNumber(13)
  set krispEnabled($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(13)
  $core.bool hasKrispEnabled() => $_has(12);
  @$pb.TagNumber(13)
  void clearKrispEnabled() => $_clearField(13);

  /// Map LiveKit attributes to SIP X-* headers when sending BYE or REFER requests.
  /// Keys are the names of attributes and values are the names of X-* headers they will be mapped to.
  @$pb.TagNumber(14)
  $pb.PbMap<$core.String, $core.String> get attributesToHeaders => $_getMap(13);

  /// Map SIP headers from INVITE to sip.h.* participant attributes automatically.
  ///
  /// When the names of required headers is known, using headers_to_attributes is strongly recommended.
  ///
  /// When mapping INVITE headers to response headers with attributes_to_headers map,
  /// lowercase header names should be used, for example: sip.h.x-custom-header.
  @$pb.TagNumber(15)
  SIPHeaderOptions get includeHeaders => $_getN(14);
  @$pb.TagNumber(15)
  set includeHeaders(SIPHeaderOptions value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasIncludeHeaders() => $_has(14);
  @$pb.TagNumber(15)
  void clearIncludeHeaders() => $_clearField(15);

  @$pb.TagNumber(16)
  SIPMediaEncryption get mediaEncryption => $_getN(15);
  @$pb.TagNumber(16)
  set mediaEncryption(SIPMediaEncryption value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasMediaEncryption() => $_has(15);
  @$pb.TagNumber(16)
  void clearMediaEncryption() => $_clearField(16);
}

class SIPInboundTrunkUpdate extends $pb.GeneratedMessage {
  factory SIPInboundTrunkUpdate({
    $1.ListUpdate? numbers,
    $1.ListUpdate? allowedAddresses,
    $1.ListUpdate? allowedNumbers,
    $core.String? authUsername,
    $core.String? authPassword,
    $core.String? name,
    $core.String? metadata,
    SIPMediaEncryption? mediaEncryption,
  }) {
    final result = create();
    if (numbers != null) result.numbers = numbers;
    if (allowedAddresses != null) result.allowedAddresses = allowedAddresses;
    if (allowedNumbers != null) result.allowedNumbers = allowedNumbers;
    if (authUsername != null) result.authUsername = authUsername;
    if (authPassword != null) result.authPassword = authPassword;
    if (name != null) result.name = name;
    if (metadata != null) result.metadata = metadata;
    if (mediaEncryption != null) result.mediaEncryption = mediaEncryption;
    return result;
  }

  SIPInboundTrunkUpdate._();

  factory SIPInboundTrunkUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPInboundTrunkUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPInboundTrunkUpdate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOM<$1.ListUpdate>(1, _omitFieldNames ? '' : 'numbers',
        subBuilder: $1.ListUpdate.create)
    ..aOM<$1.ListUpdate>(2, _omitFieldNames ? '' : 'allowedAddresses',
        subBuilder: $1.ListUpdate.create)
    ..aOM<$1.ListUpdate>(3, _omitFieldNames ? '' : 'allowedNumbers',
        subBuilder: $1.ListUpdate.create)
    ..aOS(4, _omitFieldNames ? '' : 'authUsername')
    ..aOS(5, _omitFieldNames ? '' : 'authPassword')
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..aOS(7, _omitFieldNames ? '' : 'metadata')
    ..aE<SIPMediaEncryption>(8, _omitFieldNames ? '' : 'mediaEncryption',
        enumValues: SIPMediaEncryption.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPInboundTrunkUpdate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPInboundTrunkUpdate copyWith(
          void Function(SIPInboundTrunkUpdate) updates) =>
      super.copyWith((message) => updates(message as SIPInboundTrunkUpdate))
          as SIPInboundTrunkUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPInboundTrunkUpdate create() => SIPInboundTrunkUpdate._();
  @$core.override
  SIPInboundTrunkUpdate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPInboundTrunkUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPInboundTrunkUpdate>(create);
  static SIPInboundTrunkUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $1.ListUpdate get numbers => $_getN(0);
  @$pb.TagNumber(1)
  set numbers($1.ListUpdate value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNumbers() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumbers() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.ListUpdate ensureNumbers() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.ListUpdate get allowedAddresses => $_getN(1);
  @$pb.TagNumber(2)
  set allowedAddresses($1.ListUpdate value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAllowedAddresses() => $_has(1);
  @$pb.TagNumber(2)
  void clearAllowedAddresses() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.ListUpdate ensureAllowedAddresses() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.ListUpdate get allowedNumbers => $_getN(2);
  @$pb.TagNumber(3)
  set allowedNumbers($1.ListUpdate value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAllowedNumbers() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowedNumbers() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.ListUpdate ensureAllowedNumbers() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get authUsername => $_getSZ(3);
  @$pb.TagNumber(4)
  set authUsername($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAuthUsername() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthUsername() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get authPassword => $_getSZ(4);
  @$pb.TagNumber(5)
  set authPassword($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAuthPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthPassword() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get metadata => $_getSZ(6);
  @$pb.TagNumber(7)
  set metadata($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMetadata() => $_has(6);
  @$pb.TagNumber(7)
  void clearMetadata() => $_clearField(7);

  @$pb.TagNumber(8)
  SIPMediaEncryption get mediaEncryption => $_getN(7);
  @$pb.TagNumber(8)
  set mediaEncryption(SIPMediaEncryption value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasMediaEncryption() => $_has(7);
  @$pb.TagNumber(8)
  void clearMediaEncryption() => $_clearField(8);
}

class CreateSIPOutboundTrunkRequest extends $pb.GeneratedMessage {
  factory CreateSIPOutboundTrunkRequest({
    SIPOutboundTrunkInfo? trunk,
  }) {
    final result = create();
    if (trunk != null) result.trunk = trunk;
    return result;
  }

  CreateSIPOutboundTrunkRequest._();

  factory CreateSIPOutboundTrunkRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSIPOutboundTrunkRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSIPOutboundTrunkRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOM<SIPOutboundTrunkInfo>(1, _omitFieldNames ? '' : 'trunk',
        subBuilder: SIPOutboundTrunkInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSIPOutboundTrunkRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSIPOutboundTrunkRequest copyWith(
          void Function(CreateSIPOutboundTrunkRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateSIPOutboundTrunkRequest))
          as CreateSIPOutboundTrunkRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSIPOutboundTrunkRequest create() =>
      CreateSIPOutboundTrunkRequest._();
  @$core.override
  CreateSIPOutboundTrunkRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateSIPOutboundTrunkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSIPOutboundTrunkRequest>(create);
  static CreateSIPOutboundTrunkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  SIPOutboundTrunkInfo get trunk => $_getN(0);
  @$pb.TagNumber(1)
  set trunk(SIPOutboundTrunkInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTrunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrunk() => $_clearField(1);
  @$pb.TagNumber(1)
  SIPOutboundTrunkInfo ensureTrunk() => $_ensure(0);
}

enum UpdateSIPOutboundTrunkRequest_Action { replace, update, notSet }

class UpdateSIPOutboundTrunkRequest extends $pb.GeneratedMessage {
  factory UpdateSIPOutboundTrunkRequest({
    $core.String? sipTrunkId,
    SIPOutboundTrunkInfo? replace,
    SIPOutboundTrunkUpdate? update,
  }) {
    final result = create();
    if (sipTrunkId != null) result.sipTrunkId = sipTrunkId;
    if (replace != null) result.replace = replace;
    if (update != null) result.update = update;
    return result;
  }

  UpdateSIPOutboundTrunkRequest._();

  factory UpdateSIPOutboundTrunkRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateSIPOutboundTrunkRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, UpdateSIPOutboundTrunkRequest_Action>
      _UpdateSIPOutboundTrunkRequest_ActionByTag = {
    2: UpdateSIPOutboundTrunkRequest_Action.replace,
    3: UpdateSIPOutboundTrunkRequest_Action.update,
    0: UpdateSIPOutboundTrunkRequest_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateSIPOutboundTrunkRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..aOM<SIPOutboundTrunkInfo>(2, _omitFieldNames ? '' : 'replace',
        subBuilder: SIPOutboundTrunkInfo.create)
    ..aOM<SIPOutboundTrunkUpdate>(3, _omitFieldNames ? '' : 'update',
        subBuilder: SIPOutboundTrunkUpdate.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSIPOutboundTrunkRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSIPOutboundTrunkRequest copyWith(
          void Function(UpdateSIPOutboundTrunkRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateSIPOutboundTrunkRequest))
          as UpdateSIPOutboundTrunkRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSIPOutboundTrunkRequest create() =>
      UpdateSIPOutboundTrunkRequest._();
  @$core.override
  UpdateSIPOutboundTrunkRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateSIPOutboundTrunkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateSIPOutboundTrunkRequest>(create);
  static UpdateSIPOutboundTrunkRequest? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  UpdateSIPOutboundTrunkRequest_Action whichAction() =>
      _UpdateSIPOutboundTrunkRequest_ActionByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearAction() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => $_clearField(1);

  @$pb.TagNumber(2)
  SIPOutboundTrunkInfo get replace => $_getN(1);
  @$pb.TagNumber(2)
  set replace(SIPOutboundTrunkInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReplace() => $_has(1);
  @$pb.TagNumber(2)
  void clearReplace() => $_clearField(2);
  @$pb.TagNumber(2)
  SIPOutboundTrunkInfo ensureReplace() => $_ensure(1);

  @$pb.TagNumber(3)
  SIPOutboundTrunkUpdate get update => $_getN(2);
  @$pb.TagNumber(3)
  set update(SIPOutboundTrunkUpdate value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdate() => $_clearField(3);
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
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? headers,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        headersToAttributes,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        attributesToHeaders,
    SIPHeaderOptions? includeHeaders,
    SIPMediaEncryption? mediaEncryption,
    $core.String? destinationCountry,
  }) {
    final result = create();
    if (sipTrunkId != null) result.sipTrunkId = sipTrunkId;
    if (name != null) result.name = name;
    if (metadata != null) result.metadata = metadata;
    if (address != null) result.address = address;
    if (transport != null) result.transport = transport;
    if (numbers != null) result.numbers.addAll(numbers);
    if (authUsername != null) result.authUsername = authUsername;
    if (authPassword != null) result.authPassword = authPassword;
    if (headers != null) result.headers.addEntries(headers);
    if (headersToAttributes != null)
      result.headersToAttributes.addEntries(headersToAttributes);
    if (attributesToHeaders != null)
      result.attributesToHeaders.addEntries(attributesToHeaders);
    if (includeHeaders != null) result.includeHeaders = includeHeaders;
    if (mediaEncryption != null) result.mediaEncryption = mediaEncryption;
    if (destinationCountry != null)
      result.destinationCountry = destinationCountry;
    return result;
  }

  SIPOutboundTrunkInfo._();

  factory SIPOutboundTrunkInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPOutboundTrunkInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPOutboundTrunkInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'metadata')
    ..aOS(4, _omitFieldNames ? '' : 'address')
    ..aE<SIPTransport>(5, _omitFieldNames ? '' : 'transport',
        enumValues: SIPTransport.values)
    ..pPS(6, _omitFieldNames ? '' : 'numbers')
    ..aOS(7, _omitFieldNames ? '' : 'authUsername')
    ..aOS(8, _omitFieldNames ? '' : 'authPassword')
    ..m<$core.String, $core.String>(9, _omitFieldNames ? '' : 'headers',
        entryClassName: 'SIPOutboundTrunkInfo.HeadersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..m<$core.String, $core.String>(
        10, _omitFieldNames ? '' : 'headersToAttributes',
        entryClassName: 'SIPOutboundTrunkInfo.HeadersToAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..m<$core.String, $core.String>(
        11, _omitFieldNames ? '' : 'attributesToHeaders',
        entryClassName: 'SIPOutboundTrunkInfo.AttributesToHeadersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aE<SIPHeaderOptions>(12, _omitFieldNames ? '' : 'includeHeaders',
        enumValues: SIPHeaderOptions.values)
    ..aE<SIPMediaEncryption>(13, _omitFieldNames ? '' : 'mediaEncryption',
        enumValues: SIPMediaEncryption.values)
    ..aOS(14, _omitFieldNames ? '' : 'destinationCountry')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPOutboundTrunkInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPOutboundTrunkInfo copyWith(void Function(SIPOutboundTrunkInfo) updates) =>
      super.copyWith((message) => updates(message as SIPOutboundTrunkInfo))
          as SIPOutboundTrunkInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPOutboundTrunkInfo create() => SIPOutboundTrunkInfo._();
  @$core.override
  SIPOutboundTrunkInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPOutboundTrunkInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPOutboundTrunkInfo>(create);
  static SIPOutboundTrunkInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => $_clearField(1);

  /// Human-readable name for the Trunk.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// User-defined metadata for the Trunk.
  @$pb.TagNumber(3)
  $core.String get metadata => $_getSZ(2);
  @$pb.TagNumber(3)
  set metadata($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearMetadata() => $_clearField(3);

  /// Hostname or IP that SIP INVITE is sent too.
  /// Note that this is not a SIP URI and should not contain the 'sip:' protocol prefix.
  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => $_clearField(4);

  /// SIP Transport used for outbound call.
  @$pb.TagNumber(5)
  SIPTransport get transport => $_getN(4);
  @$pb.TagNumber(5)
  set transport(SIPTransport value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTransport() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransport() => $_clearField(5);

  /// Numbers used to make the calls. Random one from this list will be selected.
  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get numbers => $_getList(5);

  /// Username and password used to authenticate with SIP server.
  /// May be empty to have no authentication.
  @$pb.TagNumber(7)
  $core.String get authUsername => $_getSZ(6);
  @$pb.TagNumber(7)
  set authUsername($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAuthUsername() => $_has(6);
  @$pb.TagNumber(7)
  void clearAuthUsername() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get authPassword => $_getSZ(7);
  @$pb.TagNumber(8)
  set authPassword($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAuthPassword() => $_has(7);
  @$pb.TagNumber(8)
  void clearAuthPassword() => $_clearField(8);

  /// Include these SIP X-* headers in INVITE request.
  /// These headers are sent as-is and may help identify this call as coming from LiveKit for the other SIP endpoint.
  @$pb.TagNumber(9)
  $pb.PbMap<$core.String, $core.String> get headers => $_getMap(8);

  /// Map SIP X-* headers from 200 OK to SIP participant attributes.
  /// Keys are the names of X-* headers and values are the names of attributes they will be mapped to.
  @$pb.TagNumber(10)
  $pb.PbMap<$core.String, $core.String> get headersToAttributes => $_getMap(9);

  /// Map LiveKit attributes to SIP X-* headers when sending BYE or REFER requests.
  /// Keys are the names of attributes and values are the names of X-* headers they will be mapped to.
  @$pb.TagNumber(11)
  $pb.PbMap<$core.String, $core.String> get attributesToHeaders => $_getMap(10);

  /// Map SIP headers from 200 OK to sip.h.* participant attributes automatically.
  ///
  /// When the names of required headers is known, using headers_to_attributes is strongly recommended.
  ///
  /// When mapping 200 OK headers to follow-up request headers with attributes_to_headers map,
  /// lowercase header names should be used, for example: sip.h.x-custom-header.
  @$pb.TagNumber(12)
  SIPHeaderOptions get includeHeaders => $_getN(11);
  @$pb.TagNumber(12)
  set includeHeaders(SIPHeaderOptions value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasIncludeHeaders() => $_has(11);
  @$pb.TagNumber(12)
  void clearIncludeHeaders() => $_clearField(12);

  @$pb.TagNumber(13)
  SIPMediaEncryption get mediaEncryption => $_getN(12);
  @$pb.TagNumber(13)
  set mediaEncryption(SIPMediaEncryption value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasMediaEncryption() => $_has(12);
  @$pb.TagNumber(13)
  void clearMediaEncryption() => $_clearField(13);

  /// country where the call terminates as ISO 3166-1 alpha-2 (https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). This will be used by the livekit infrastructure to route calls.
  @$pb.TagNumber(14)
  $core.String get destinationCountry => $_getSZ(13);
  @$pb.TagNumber(14)
  set destinationCountry($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasDestinationCountry() => $_has(13);
  @$pb.TagNumber(14)
  void clearDestinationCountry() => $_clearField(14);
}

class SIPOutboundTrunkUpdate extends $pb.GeneratedMessage {
  factory SIPOutboundTrunkUpdate({
    $core.String? address,
    SIPTransport? transport,
    $1.ListUpdate? numbers,
    $core.String? authUsername,
    $core.String? authPassword,
    $core.String? name,
    $core.String? metadata,
    SIPMediaEncryption? mediaEncryption,
    $core.String? destinationCountry,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (transport != null) result.transport = transport;
    if (numbers != null) result.numbers = numbers;
    if (authUsername != null) result.authUsername = authUsername;
    if (authPassword != null) result.authPassword = authPassword;
    if (name != null) result.name = name;
    if (metadata != null) result.metadata = metadata;
    if (mediaEncryption != null) result.mediaEncryption = mediaEncryption;
    if (destinationCountry != null)
      result.destinationCountry = destinationCountry;
    return result;
  }

  SIPOutboundTrunkUpdate._();

  factory SIPOutboundTrunkUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPOutboundTrunkUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPOutboundTrunkUpdate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..aE<SIPTransport>(2, _omitFieldNames ? '' : 'transport',
        enumValues: SIPTransport.values)
    ..aOM<$1.ListUpdate>(3, _omitFieldNames ? '' : 'numbers',
        subBuilder: $1.ListUpdate.create)
    ..aOS(4, _omitFieldNames ? '' : 'authUsername')
    ..aOS(5, _omitFieldNames ? '' : 'authPassword')
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..aOS(7, _omitFieldNames ? '' : 'metadata')
    ..aE<SIPMediaEncryption>(8, _omitFieldNames ? '' : 'mediaEncryption',
        enumValues: SIPMediaEncryption.values)
    ..aOS(9, _omitFieldNames ? '' : 'destinationCountry')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPOutboundTrunkUpdate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPOutboundTrunkUpdate copyWith(
          void Function(SIPOutboundTrunkUpdate) updates) =>
      super.copyWith((message) => updates(message as SIPOutboundTrunkUpdate))
          as SIPOutboundTrunkUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPOutboundTrunkUpdate create() => SIPOutboundTrunkUpdate._();
  @$core.override
  SIPOutboundTrunkUpdate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPOutboundTrunkUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPOutboundTrunkUpdate>(create);
  static SIPOutboundTrunkUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  SIPTransport get transport => $_getN(1);
  @$pb.TagNumber(2)
  set transport(SIPTransport value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTransport() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransport() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.ListUpdate get numbers => $_getN(2);
  @$pb.TagNumber(3)
  set numbers($1.ListUpdate value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasNumbers() => $_has(2);
  @$pb.TagNumber(3)
  void clearNumbers() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.ListUpdate ensureNumbers() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get authUsername => $_getSZ(3);
  @$pb.TagNumber(4)
  set authUsername($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAuthUsername() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthUsername() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get authPassword => $_getSZ(4);
  @$pb.TagNumber(5)
  set authPassword($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAuthPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthPassword() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get metadata => $_getSZ(6);
  @$pb.TagNumber(7)
  set metadata($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMetadata() => $_has(6);
  @$pb.TagNumber(7)
  void clearMetadata() => $_clearField(7);

  @$pb.TagNumber(8)
  SIPMediaEncryption get mediaEncryption => $_getN(7);
  @$pb.TagNumber(8)
  set mediaEncryption(SIPMediaEncryption value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasMediaEncryption() => $_has(7);
  @$pb.TagNumber(8)
  void clearMediaEncryption() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get destinationCountry => $_getSZ(8);
  @$pb.TagNumber(9)
  set destinationCountry($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDestinationCountry() => $_has(8);
  @$pb.TagNumber(9)
  void clearDestinationCountry() => $_clearField(9);
}

class GetSIPInboundTrunkRequest extends $pb.GeneratedMessage {
  factory GetSIPInboundTrunkRequest({
    $core.String? sipTrunkId,
  }) {
    final result = create();
    if (sipTrunkId != null) result.sipTrunkId = sipTrunkId;
    return result;
  }

  GetSIPInboundTrunkRequest._();

  factory GetSIPInboundTrunkRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSIPInboundTrunkRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSIPInboundTrunkRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSIPInboundTrunkRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSIPInboundTrunkRequest copyWith(
          void Function(GetSIPInboundTrunkRequest) updates) =>
      super.copyWith((message) => updates(message as GetSIPInboundTrunkRequest))
          as GetSIPInboundTrunkRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSIPInboundTrunkRequest create() => GetSIPInboundTrunkRequest._();
  @$core.override
  GetSIPInboundTrunkRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSIPInboundTrunkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSIPInboundTrunkRequest>(create);
  static GetSIPInboundTrunkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => $_clearField(1);
}

class GetSIPInboundTrunkResponse extends $pb.GeneratedMessage {
  factory GetSIPInboundTrunkResponse({
    SIPInboundTrunkInfo? trunk,
  }) {
    final result = create();
    if (trunk != null) result.trunk = trunk;
    return result;
  }

  GetSIPInboundTrunkResponse._();

  factory GetSIPInboundTrunkResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSIPInboundTrunkResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSIPInboundTrunkResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOM<SIPInboundTrunkInfo>(1, _omitFieldNames ? '' : 'trunk',
        subBuilder: SIPInboundTrunkInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSIPInboundTrunkResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSIPInboundTrunkResponse copyWith(
          void Function(GetSIPInboundTrunkResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetSIPInboundTrunkResponse))
          as GetSIPInboundTrunkResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSIPInboundTrunkResponse create() => GetSIPInboundTrunkResponse._();
  @$core.override
  GetSIPInboundTrunkResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSIPInboundTrunkResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSIPInboundTrunkResponse>(create);
  static GetSIPInboundTrunkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  SIPInboundTrunkInfo get trunk => $_getN(0);
  @$pb.TagNumber(1)
  set trunk(SIPInboundTrunkInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTrunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrunk() => $_clearField(1);
  @$pb.TagNumber(1)
  SIPInboundTrunkInfo ensureTrunk() => $_ensure(0);
}

class GetSIPOutboundTrunkRequest extends $pb.GeneratedMessage {
  factory GetSIPOutboundTrunkRequest({
    $core.String? sipTrunkId,
  }) {
    final result = create();
    if (sipTrunkId != null) result.sipTrunkId = sipTrunkId;
    return result;
  }

  GetSIPOutboundTrunkRequest._();

  factory GetSIPOutboundTrunkRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSIPOutboundTrunkRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSIPOutboundTrunkRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSIPOutboundTrunkRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSIPOutboundTrunkRequest copyWith(
          void Function(GetSIPOutboundTrunkRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetSIPOutboundTrunkRequest))
          as GetSIPOutboundTrunkRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSIPOutboundTrunkRequest create() => GetSIPOutboundTrunkRequest._();
  @$core.override
  GetSIPOutboundTrunkRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSIPOutboundTrunkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSIPOutboundTrunkRequest>(create);
  static GetSIPOutboundTrunkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => $_clearField(1);
}

class GetSIPOutboundTrunkResponse extends $pb.GeneratedMessage {
  factory GetSIPOutboundTrunkResponse({
    SIPOutboundTrunkInfo? trunk,
  }) {
    final result = create();
    if (trunk != null) result.trunk = trunk;
    return result;
  }

  GetSIPOutboundTrunkResponse._();

  factory GetSIPOutboundTrunkResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSIPOutboundTrunkResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSIPOutboundTrunkResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOM<SIPOutboundTrunkInfo>(1, _omitFieldNames ? '' : 'trunk',
        subBuilder: SIPOutboundTrunkInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSIPOutboundTrunkResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSIPOutboundTrunkResponse copyWith(
          void Function(GetSIPOutboundTrunkResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetSIPOutboundTrunkResponse))
          as GetSIPOutboundTrunkResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSIPOutboundTrunkResponse create() =>
      GetSIPOutboundTrunkResponse._();
  @$core.override
  GetSIPOutboundTrunkResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSIPOutboundTrunkResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSIPOutboundTrunkResponse>(create);
  static GetSIPOutboundTrunkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  SIPOutboundTrunkInfo get trunk => $_getN(0);
  @$pb.TagNumber(1)
  set trunk(SIPOutboundTrunkInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTrunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrunk() => $_clearField(1);
  @$pb.TagNumber(1)
  SIPOutboundTrunkInfo ensureTrunk() => $_ensure(0);
}

@$core.Deprecated('This message is deprecated')
class ListSIPTrunkRequest extends $pb.GeneratedMessage {
  factory ListSIPTrunkRequest({
    $1.Pagination? page,
  }) {
    final result = create();
    if (page != null) result.page = page;
    return result;
  }

  ListSIPTrunkRequest._();

  factory ListSIPTrunkRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSIPTrunkRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSIPTrunkRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOM<$1.Pagination>(1, _omitFieldNames ? '' : 'page',
        subBuilder: $1.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPTrunkRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPTrunkRequest copyWith(void Function(ListSIPTrunkRequest) updates) =>
      super.copyWith((message) => updates(message as ListSIPTrunkRequest))
          as ListSIPTrunkRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPTrunkRequest create() => ListSIPTrunkRequest._();
  @$core.override
  ListSIPTrunkRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSIPTrunkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSIPTrunkRequest>(create);
  static ListSIPTrunkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Pagination get page => $_getN(0);
  @$pb.TagNumber(1)
  set page($1.Pagination value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Pagination ensurePage() => $_ensure(0);
}

@$core.Deprecated('This message is deprecated')
class ListSIPTrunkResponse extends $pb.GeneratedMessage {
  factory ListSIPTrunkResponse({
    $core.Iterable<SIPTrunkInfo>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListSIPTrunkResponse._();

  factory ListSIPTrunkResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSIPTrunkResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSIPTrunkResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPM<SIPTrunkInfo>(1, _omitFieldNames ? '' : 'items',
        subBuilder: SIPTrunkInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPTrunkResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPTrunkResponse copyWith(void Function(ListSIPTrunkResponse) updates) =>
      super.copyWith((message) => updates(message as ListSIPTrunkResponse))
          as ListSIPTrunkResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPTrunkResponse create() => ListSIPTrunkResponse._();
  @$core.override
  ListSIPTrunkResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSIPTrunkResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSIPTrunkResponse>(create);
  static ListSIPTrunkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SIPTrunkInfo> get items => $_getList(0);
}

/// ListSIPInboundTrunkRequest lists inbound trunks for given filters. If no filters are set, all trunks are listed.
class ListSIPInboundTrunkRequest extends $pb.GeneratedMessage {
  factory ListSIPInboundTrunkRequest({
    $core.Iterable<$core.String>? trunkIds,
    $core.Iterable<$core.String>? numbers,
    $1.Pagination? page,
  }) {
    final result = create();
    if (trunkIds != null) result.trunkIds.addAll(trunkIds);
    if (numbers != null) result.numbers.addAll(numbers);
    if (page != null) result.page = page;
    return result;
  }

  ListSIPInboundTrunkRequest._();

  factory ListSIPInboundTrunkRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSIPInboundTrunkRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSIPInboundTrunkRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'trunkIds')
    ..pPS(2, _omitFieldNames ? '' : 'numbers')
    ..aOM<$1.Pagination>(3, _omitFieldNames ? '' : 'page',
        subBuilder: $1.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPInboundTrunkRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPInboundTrunkRequest copyWith(
          void Function(ListSIPInboundTrunkRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListSIPInboundTrunkRequest))
          as ListSIPInboundTrunkRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPInboundTrunkRequest create() => ListSIPInboundTrunkRequest._();
  @$core.override
  ListSIPInboundTrunkRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSIPInboundTrunkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSIPInboundTrunkRequest>(create);
  static ListSIPInboundTrunkRequest? _defaultInstance;

  /// Trunk IDs to list. If this option is set, the response will contains trunks in the same order.
  /// If any of the trunks is missing, a nil item in that position will be sent in the response.
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get trunkIds => $_getList(0);

  /// Only list trunks that contain one of the numbers, including wildcard trunks.
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get numbers => $_getList(1);

  @$pb.TagNumber(3)
  $1.Pagination get page => $_getN(2);
  @$pb.TagNumber(3)
  set page($1.Pagination value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Pagination ensurePage() => $_ensure(2);
}

class ListSIPInboundTrunkResponse extends $pb.GeneratedMessage {
  factory ListSIPInboundTrunkResponse({
    $core.Iterable<SIPInboundTrunkInfo>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListSIPInboundTrunkResponse._();

  factory ListSIPInboundTrunkResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSIPInboundTrunkResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSIPInboundTrunkResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPM<SIPInboundTrunkInfo>(1, _omitFieldNames ? '' : 'items',
        subBuilder: SIPInboundTrunkInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPInboundTrunkResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPInboundTrunkResponse copyWith(
          void Function(ListSIPInboundTrunkResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListSIPInboundTrunkResponse))
          as ListSIPInboundTrunkResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPInboundTrunkResponse create() =>
      ListSIPInboundTrunkResponse._();
  @$core.override
  ListSIPInboundTrunkResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSIPInboundTrunkResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSIPInboundTrunkResponse>(create);
  static ListSIPInboundTrunkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SIPInboundTrunkInfo> get items => $_getList(0);
}

/// ListSIPOutboundTrunkRequest lists outbound trunks for given filters. If no filters are set, all trunks are listed.
class ListSIPOutboundTrunkRequest extends $pb.GeneratedMessage {
  factory ListSIPOutboundTrunkRequest({
    $core.Iterable<$core.String>? trunkIds,
    $core.Iterable<$core.String>? numbers,
    $1.Pagination? page,
  }) {
    final result = create();
    if (trunkIds != null) result.trunkIds.addAll(trunkIds);
    if (numbers != null) result.numbers.addAll(numbers);
    if (page != null) result.page = page;
    return result;
  }

  ListSIPOutboundTrunkRequest._();

  factory ListSIPOutboundTrunkRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSIPOutboundTrunkRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSIPOutboundTrunkRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'trunkIds')
    ..pPS(2, _omitFieldNames ? '' : 'numbers')
    ..aOM<$1.Pagination>(3, _omitFieldNames ? '' : 'page',
        subBuilder: $1.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPOutboundTrunkRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPOutboundTrunkRequest copyWith(
          void Function(ListSIPOutboundTrunkRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListSIPOutboundTrunkRequest))
          as ListSIPOutboundTrunkRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPOutboundTrunkRequest create() =>
      ListSIPOutboundTrunkRequest._();
  @$core.override
  ListSIPOutboundTrunkRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSIPOutboundTrunkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSIPOutboundTrunkRequest>(create);
  static ListSIPOutboundTrunkRequest? _defaultInstance;

  /// Trunk IDs to list. If this option is set, the response will contains trunks in the same order.
  /// If any of the trunks is missing, a nil item in that position will be sent in the response.
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get trunkIds => $_getList(0);

  /// Only list trunks that contain one of the numbers, including wildcard trunks.
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get numbers => $_getList(1);

  @$pb.TagNumber(3)
  $1.Pagination get page => $_getN(2);
  @$pb.TagNumber(3)
  set page($1.Pagination value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Pagination ensurePage() => $_ensure(2);
}

class ListSIPOutboundTrunkResponse extends $pb.GeneratedMessage {
  factory ListSIPOutboundTrunkResponse({
    $core.Iterable<SIPOutboundTrunkInfo>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListSIPOutboundTrunkResponse._();

  factory ListSIPOutboundTrunkResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSIPOutboundTrunkResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSIPOutboundTrunkResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPM<SIPOutboundTrunkInfo>(1, _omitFieldNames ? '' : 'items',
        subBuilder: SIPOutboundTrunkInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPOutboundTrunkResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPOutboundTrunkResponse copyWith(
          void Function(ListSIPOutboundTrunkResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListSIPOutboundTrunkResponse))
          as ListSIPOutboundTrunkResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPOutboundTrunkResponse create() =>
      ListSIPOutboundTrunkResponse._();
  @$core.override
  ListSIPOutboundTrunkResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSIPOutboundTrunkResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSIPOutboundTrunkResponse>(create);
  static ListSIPOutboundTrunkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SIPOutboundTrunkInfo> get items => $_getList(0);
}

class DeleteSIPTrunkRequest extends $pb.GeneratedMessage {
  factory DeleteSIPTrunkRequest({
    $core.String? sipTrunkId,
  }) {
    final result = create();
    if (sipTrunkId != null) result.sipTrunkId = sipTrunkId;
    return result;
  }

  DeleteSIPTrunkRequest._();

  factory DeleteSIPTrunkRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteSIPTrunkRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteSIPTrunkRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSIPTrunkRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSIPTrunkRequest copyWith(
          void Function(DeleteSIPTrunkRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteSIPTrunkRequest))
          as DeleteSIPTrunkRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSIPTrunkRequest create() => DeleteSIPTrunkRequest._();
  @$core.override
  DeleteSIPTrunkRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteSIPTrunkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteSIPTrunkRequest>(create);
  static DeleteSIPTrunkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => $_clearField(1);
}

class SIPDispatchRuleDirect extends $pb.GeneratedMessage {
  factory SIPDispatchRuleDirect({
    $core.String? roomName,
    $core.String? pin,
  }) {
    final result = create();
    if (roomName != null) result.roomName = roomName;
    if (pin != null) result.pin = pin;
    return result;
  }

  SIPDispatchRuleDirect._();

  factory SIPDispatchRuleDirect.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPDispatchRuleDirect.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPDispatchRuleDirect',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOS(2, _omitFieldNames ? '' : 'pin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPDispatchRuleDirect clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPDispatchRuleDirect copyWith(
          void Function(SIPDispatchRuleDirect) updates) =>
      super.copyWith((message) => updates(message as SIPDispatchRuleDirect))
          as SIPDispatchRuleDirect;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleDirect create() => SIPDispatchRuleDirect._();
  @$core.override
  SIPDispatchRuleDirect createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleDirect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPDispatchRuleDirect>(create);
  static SIPDispatchRuleDirect? _defaultInstance;

  /// What room should call be directed into
  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => $_clearField(1);

  /// Optional pin required to enter room
  @$pb.TagNumber(2)
  $core.String get pin => $_getSZ(1);
  @$pb.TagNumber(2)
  set pin($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPin() => $_has(1);
  @$pb.TagNumber(2)
  void clearPin() => $_clearField(2);
}

class SIPDispatchRuleIndividual extends $pb.GeneratedMessage {
  factory SIPDispatchRuleIndividual({
    $core.String? roomPrefix,
    $core.String? pin,
  }) {
    final result = create();
    if (roomPrefix != null) result.roomPrefix = roomPrefix;
    if (pin != null) result.pin = pin;
    return result;
  }

  SIPDispatchRuleIndividual._();

  factory SIPDispatchRuleIndividual.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPDispatchRuleIndividual.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPDispatchRuleIndividual',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomPrefix')
    ..aOS(2, _omitFieldNames ? '' : 'pin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPDispatchRuleIndividual clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPDispatchRuleIndividual copyWith(
          void Function(SIPDispatchRuleIndividual) updates) =>
      super.copyWith((message) => updates(message as SIPDispatchRuleIndividual))
          as SIPDispatchRuleIndividual;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleIndividual create() => SIPDispatchRuleIndividual._();
  @$core.override
  SIPDispatchRuleIndividual createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleIndividual getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPDispatchRuleIndividual>(create);
  static SIPDispatchRuleIndividual? _defaultInstance;

  /// Prefix used on new room name
  @$pb.TagNumber(1)
  $core.String get roomPrefix => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomPrefix($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomPrefix() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomPrefix() => $_clearField(1);

  /// Optional pin required to enter room
  @$pb.TagNumber(2)
  $core.String get pin => $_getSZ(1);
  @$pb.TagNumber(2)
  set pin($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPin() => $_has(1);
  @$pb.TagNumber(2)
  void clearPin() => $_clearField(2);
}

class SIPDispatchRuleCallee extends $pb.GeneratedMessage {
  factory SIPDispatchRuleCallee({
    $core.String? roomPrefix,
    $core.String? pin,
    $core.bool? randomize,
  }) {
    final result = create();
    if (roomPrefix != null) result.roomPrefix = roomPrefix;
    if (pin != null) result.pin = pin;
    if (randomize != null) result.randomize = randomize;
    return result;
  }

  SIPDispatchRuleCallee._();

  factory SIPDispatchRuleCallee.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPDispatchRuleCallee.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPDispatchRuleCallee',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomPrefix')
    ..aOS(2, _omitFieldNames ? '' : 'pin')
    ..aOB(3, _omitFieldNames ? '' : 'randomize')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPDispatchRuleCallee clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPDispatchRuleCallee copyWith(
          void Function(SIPDispatchRuleCallee) updates) =>
      super.copyWith((message) => updates(message as SIPDispatchRuleCallee))
          as SIPDispatchRuleCallee;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleCallee create() => SIPDispatchRuleCallee._();
  @$core.override
  SIPDispatchRuleCallee createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleCallee getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPDispatchRuleCallee>(create);
  static SIPDispatchRuleCallee? _defaultInstance;

  /// Prefix used on new room name
  @$pb.TagNumber(1)
  $core.String get roomPrefix => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomPrefix($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomPrefix() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomPrefix() => $_clearField(1);

  /// Optional pin required to enter room
  @$pb.TagNumber(2)
  $core.String get pin => $_getSZ(1);
  @$pb.TagNumber(2)
  set pin($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPin() => $_has(1);
  @$pb.TagNumber(2)
  void clearPin() => $_clearField(2);

  /// Optionally append random suffix
  @$pb.TagNumber(3)
  $core.bool get randomize => $_getBF(2);
  @$pb.TagNumber(3)
  set randomize($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRandomize() => $_has(2);
  @$pb.TagNumber(3)
  void clearRandomize() => $_clearField(3);
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
    final result = create();
    if (dispatchRuleDirect != null)
      result.dispatchRuleDirect = dispatchRuleDirect;
    if (dispatchRuleIndividual != null)
      result.dispatchRuleIndividual = dispatchRuleIndividual;
    if (dispatchRuleCallee != null)
      result.dispatchRuleCallee = dispatchRuleCallee;
    return result;
  }

  SIPDispatchRule._();

  factory SIPDispatchRule.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPDispatchRule.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SIPDispatchRule_Rule>
      _SIPDispatchRule_RuleByTag = {
    1: SIPDispatchRule_Rule.dispatchRuleDirect,
    2: SIPDispatchRule_Rule.dispatchRuleIndividual,
    3: SIPDispatchRule_Rule.dispatchRuleCallee,
    0: SIPDispatchRule_Rule.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPDispatchRule',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<SIPDispatchRuleDirect>(1, _omitFieldNames ? '' : 'dispatchRuleDirect',
        subBuilder: SIPDispatchRuleDirect.create)
    ..aOM<SIPDispatchRuleIndividual>(
        2, _omitFieldNames ? '' : 'dispatchRuleIndividual',
        subBuilder: SIPDispatchRuleIndividual.create)
    ..aOM<SIPDispatchRuleCallee>(3, _omitFieldNames ? '' : 'dispatchRuleCallee',
        subBuilder: SIPDispatchRuleCallee.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPDispatchRule clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPDispatchRule copyWith(void Function(SIPDispatchRule) updates) =>
      super.copyWith((message) => updates(message as SIPDispatchRule))
          as SIPDispatchRule;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPDispatchRule create() => SIPDispatchRule._();
  @$core.override
  SIPDispatchRule createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPDispatchRule getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPDispatchRule>(create);
  static SIPDispatchRule? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  SIPDispatchRule_Rule whichRule() =>
      _SIPDispatchRule_RuleByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearRule() => $_clearField($_whichOneof(0));

  /// SIPDispatchRuleDirect is a `SIP Dispatch Rule` that puts a user directly into a room
  /// This places users into an existing room. Optionally you can require a pin before a user can
  /// enter the room
  @$pb.TagNumber(1)
  SIPDispatchRuleDirect get dispatchRuleDirect => $_getN(0);
  @$pb.TagNumber(1)
  set dispatchRuleDirect(SIPDispatchRuleDirect value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDispatchRuleDirect() => $_has(0);
  @$pb.TagNumber(1)
  void clearDispatchRuleDirect() => $_clearField(1);
  @$pb.TagNumber(1)
  SIPDispatchRuleDirect ensureDispatchRuleDirect() => $_ensure(0);

  /// SIPDispatchRuleIndividual is a `SIP Dispatch Rule` that creates a new room for each caller.
  @$pb.TagNumber(2)
  SIPDispatchRuleIndividual get dispatchRuleIndividual => $_getN(1);
  @$pb.TagNumber(2)
  set dispatchRuleIndividual(SIPDispatchRuleIndividual value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDispatchRuleIndividual() => $_has(1);
  @$pb.TagNumber(2)
  void clearDispatchRuleIndividual() => $_clearField(2);
  @$pb.TagNumber(2)
  SIPDispatchRuleIndividual ensureDispatchRuleIndividual() => $_ensure(1);

  /// SIPDispatchRuleCallee is a `SIP Dispatch Rule` that creates a new room for each callee.
  @$pb.TagNumber(3)
  SIPDispatchRuleCallee get dispatchRuleCallee => $_getN(2);
  @$pb.TagNumber(3)
  set dispatchRuleCallee(SIPDispatchRuleCallee value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDispatchRuleCallee() => $_has(2);
  @$pb.TagNumber(3)
  void clearDispatchRuleCallee() => $_clearField(3);
  @$pb.TagNumber(3)
  SIPDispatchRuleCallee ensureDispatchRuleCallee() => $_ensure(2);
}

class CreateSIPDispatchRuleRequest extends $pb.GeneratedMessage {
  factory CreateSIPDispatchRuleRequest({
    @$core.Deprecated('This field is deprecated.') SIPDispatchRule? rule,
    @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.String>? trunkIds,
    @$core.Deprecated('This field is deprecated.') $core.bool? hidePhoneNumber,
    @$core.Deprecated('This field is deprecated.') $core.String? name,
    @$core.Deprecated('This field is deprecated.') $core.String? metadata,
    @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.String>? inboundNumbers,
    @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? attributes,
    @$core.Deprecated('This field is deprecated.') $core.String? roomPreset,
    @$core.Deprecated('This field is deprecated.')
    $2.RoomConfiguration? roomConfig,
    SIPDispatchRuleInfo? dispatchRule,
  }) {
    final result = create();
    if (rule != null) result.rule = rule;
    if (trunkIds != null) result.trunkIds.addAll(trunkIds);
    if (hidePhoneNumber != null) result.hidePhoneNumber = hidePhoneNumber;
    if (name != null) result.name = name;
    if (metadata != null) result.metadata = metadata;
    if (inboundNumbers != null) result.inboundNumbers.addAll(inboundNumbers);
    if (attributes != null) result.attributes.addEntries(attributes);
    if (roomPreset != null) result.roomPreset = roomPreset;
    if (roomConfig != null) result.roomConfig = roomConfig;
    if (dispatchRule != null) result.dispatchRule = dispatchRule;
    return result;
  }

  CreateSIPDispatchRuleRequest._();

  factory CreateSIPDispatchRuleRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSIPDispatchRuleRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSIPDispatchRuleRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOM<SIPDispatchRule>(1, _omitFieldNames ? '' : 'rule',
        subBuilder: SIPDispatchRule.create)
    ..pPS(2, _omitFieldNames ? '' : 'trunkIds')
    ..aOB(3, _omitFieldNames ? '' : 'hidePhoneNumber')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'metadata')
    ..pPS(6, _omitFieldNames ? '' : 'inboundNumbers')
    ..m<$core.String, $core.String>(7, _omitFieldNames ? '' : 'attributes',
        entryClassName: 'CreateSIPDispatchRuleRequest.AttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOS(8, _omitFieldNames ? '' : 'roomPreset')
    ..aOM<$2.RoomConfiguration>(9, _omitFieldNames ? '' : 'roomConfig',
        subBuilder: $2.RoomConfiguration.create)
    ..aOM<SIPDispatchRuleInfo>(10, _omitFieldNames ? '' : 'dispatchRule',
        subBuilder: SIPDispatchRuleInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSIPDispatchRuleRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSIPDispatchRuleRequest copyWith(
          void Function(CreateSIPDispatchRuleRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateSIPDispatchRuleRequest))
          as CreateSIPDispatchRuleRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSIPDispatchRuleRequest create() =>
      CreateSIPDispatchRuleRequest._();
  @$core.override
  CreateSIPDispatchRuleRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateSIPDispatchRuleRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSIPDispatchRuleRequest>(create);
  static CreateSIPDispatchRuleRequest? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  SIPDispatchRule get rule => $_getN(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set rule(SIPDispatchRule value) => $_setField(1, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasRule() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearRule() => $_clearField(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  SIPDispatchRule ensureRule() => $_ensure(0);

  /// What trunks are accepted for this dispatch rule
  /// If empty all trunks will match this dispatch rule
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get trunkIds => $_getList(1);

  /// By default the From value (Phone number) is used for participant name/identity and added to attributes.
  /// If true, a random value for identity will be used and numbers will be omitted from attributes.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.bool get hidePhoneNumber => $_getBF(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  set hidePhoneNumber($core.bool value) => $_setBool(2, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.bool hasHidePhoneNumber() => $_has(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  void clearHidePhoneNumber() => $_clearField(3);

  /// Optional human-readable name for the Dispatch Rule.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(3, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  /// User-defined metadata for the Dispatch Rule.
  /// Participants created by this rule will inherit this metadata.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.String get metadata => $_getSZ(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set metadata($core.String value) => $_setString(4, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasMetadata() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearMetadata() => $_clearField(5);

  /// Dispatch Rule will only accept a call made to these numbers (if set).
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get inboundNumbers => $_getList(5);

  /// User-defined attributes for the Dispatch Rule.
  /// Participants created by this rule will inherit these attributes.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  $pb.PbMap<$core.String, $core.String> get attributes => $_getMap(6);

  /// Cloud-only, config preset to use
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.String get roomPreset => $_getSZ(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  set roomPreset($core.String value) => $_setString(7, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.bool hasRoomPreset() => $_has(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  void clearRoomPreset() => $_clearField(8);

  /// RoomConfiguration to use if the participant initiates the room
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $2.RoomConfiguration get roomConfig => $_getN(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  set roomConfig($2.RoomConfiguration value) => $_setField(9, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $core.bool hasRoomConfig() => $_has(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  void clearRoomConfig() => $_clearField(9);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $2.RoomConfiguration ensureRoomConfig() => $_ensure(8);

  @$pb.TagNumber(10)
  SIPDispatchRuleInfo get dispatchRule => $_getN(9);
  @$pb.TagNumber(10)
  set dispatchRule(SIPDispatchRuleInfo value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasDispatchRule() => $_has(9);
  @$pb.TagNumber(10)
  void clearDispatchRule() => $_clearField(10);
  @$pb.TagNumber(10)
  SIPDispatchRuleInfo ensureDispatchRule() => $_ensure(9);
}

enum UpdateSIPDispatchRuleRequest_Action { replace, update, notSet }

class UpdateSIPDispatchRuleRequest extends $pb.GeneratedMessage {
  factory UpdateSIPDispatchRuleRequest({
    $core.String? sipDispatchRuleId,
    SIPDispatchRuleInfo? replace,
    SIPDispatchRuleUpdate? update,
  }) {
    final result = create();
    if (sipDispatchRuleId != null) result.sipDispatchRuleId = sipDispatchRuleId;
    if (replace != null) result.replace = replace;
    if (update != null) result.update = update;
    return result;
  }

  UpdateSIPDispatchRuleRequest._();

  factory UpdateSIPDispatchRuleRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateSIPDispatchRuleRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, UpdateSIPDispatchRuleRequest_Action>
      _UpdateSIPDispatchRuleRequest_ActionByTag = {
    2: UpdateSIPDispatchRuleRequest_Action.replace,
    3: UpdateSIPDispatchRuleRequest_Action.update,
    0: UpdateSIPDispatchRuleRequest_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateSIPDispatchRuleRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'sipDispatchRuleId')
    ..aOM<SIPDispatchRuleInfo>(2, _omitFieldNames ? '' : 'replace',
        subBuilder: SIPDispatchRuleInfo.create)
    ..aOM<SIPDispatchRuleUpdate>(3, _omitFieldNames ? '' : 'update',
        subBuilder: SIPDispatchRuleUpdate.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSIPDispatchRuleRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSIPDispatchRuleRequest copyWith(
          void Function(UpdateSIPDispatchRuleRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateSIPDispatchRuleRequest))
          as UpdateSIPDispatchRuleRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSIPDispatchRuleRequest create() =>
      UpdateSIPDispatchRuleRequest._();
  @$core.override
  UpdateSIPDispatchRuleRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateSIPDispatchRuleRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateSIPDispatchRuleRequest>(create);
  static UpdateSIPDispatchRuleRequest? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  UpdateSIPDispatchRuleRequest_Action whichAction() =>
      _UpdateSIPDispatchRuleRequest_ActionByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearAction() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get sipDispatchRuleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipDispatchRuleId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSipDispatchRuleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipDispatchRuleId() => $_clearField(1);

  @$pb.TagNumber(2)
  SIPDispatchRuleInfo get replace => $_getN(1);
  @$pb.TagNumber(2)
  set replace(SIPDispatchRuleInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReplace() => $_has(1);
  @$pb.TagNumber(2)
  void clearReplace() => $_clearField(2);
  @$pb.TagNumber(2)
  SIPDispatchRuleInfo ensureReplace() => $_ensure(1);

  @$pb.TagNumber(3)
  SIPDispatchRuleUpdate get update => $_getN(2);
  @$pb.TagNumber(3)
  set update(SIPDispatchRuleUpdate value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdate() => $_clearField(3);
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
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? attributes,
    $core.String? roomPreset,
    $2.RoomConfiguration? roomConfig,
    $core.bool? krispEnabled,
    SIPMediaEncryption? mediaEncryption,
  }) {
    final result = create();
    if (sipDispatchRuleId != null) result.sipDispatchRuleId = sipDispatchRuleId;
    if (rule != null) result.rule = rule;
    if (trunkIds != null) result.trunkIds.addAll(trunkIds);
    if (hidePhoneNumber != null) result.hidePhoneNumber = hidePhoneNumber;
    if (name != null) result.name = name;
    if (metadata != null) result.metadata = metadata;
    if (inboundNumbers != null) result.inboundNumbers.addAll(inboundNumbers);
    if (attributes != null) result.attributes.addEntries(attributes);
    if (roomPreset != null) result.roomPreset = roomPreset;
    if (roomConfig != null) result.roomConfig = roomConfig;
    if (krispEnabled != null) result.krispEnabled = krispEnabled;
    if (mediaEncryption != null) result.mediaEncryption = mediaEncryption;
    return result;
  }

  SIPDispatchRuleInfo._();

  factory SIPDispatchRuleInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPDispatchRuleInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPDispatchRuleInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipDispatchRuleId')
    ..aOM<SIPDispatchRule>(2, _omitFieldNames ? '' : 'rule',
        subBuilder: SIPDispatchRule.create)
    ..pPS(3, _omitFieldNames ? '' : 'trunkIds')
    ..aOB(4, _omitFieldNames ? '' : 'hidePhoneNumber')
    ..aOS(5, _omitFieldNames ? '' : 'name')
    ..aOS(6, _omitFieldNames ? '' : 'metadata')
    ..pPS(7, _omitFieldNames ? '' : 'inboundNumbers')
    ..m<$core.String, $core.String>(8, _omitFieldNames ? '' : 'attributes',
        entryClassName: 'SIPDispatchRuleInfo.AttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOS(9, _omitFieldNames ? '' : 'roomPreset')
    ..aOM<$2.RoomConfiguration>(10, _omitFieldNames ? '' : 'roomConfig',
        subBuilder: $2.RoomConfiguration.create)
    ..aOB(11, _omitFieldNames ? '' : 'krispEnabled')
    ..aE<SIPMediaEncryption>(12, _omitFieldNames ? '' : 'mediaEncryption',
        enumValues: SIPMediaEncryption.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPDispatchRuleInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPDispatchRuleInfo copyWith(void Function(SIPDispatchRuleInfo) updates) =>
      super.copyWith((message) => updates(message as SIPDispatchRuleInfo))
          as SIPDispatchRuleInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleInfo create() => SIPDispatchRuleInfo._();
  @$core.override
  SIPDispatchRuleInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPDispatchRuleInfo>(create);
  static SIPDispatchRuleInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipDispatchRuleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipDispatchRuleId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSipDispatchRuleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipDispatchRuleId() => $_clearField(1);

  @$pb.TagNumber(2)
  SIPDispatchRule get rule => $_getN(1);
  @$pb.TagNumber(2)
  set rule(SIPDispatchRule value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRule() => $_has(1);
  @$pb.TagNumber(2)
  void clearRule() => $_clearField(2);
  @$pb.TagNumber(2)
  SIPDispatchRule ensureRule() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get trunkIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get hidePhoneNumber => $_getBF(3);
  @$pb.TagNumber(4)
  set hidePhoneNumber($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHidePhoneNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearHidePhoneNumber() => $_clearField(4);

  /// Human-readable name for the Dispatch Rule.
  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => $_clearField(5);

  /// User-defined metadata for the Dispatch Rule.
  /// Participants created by this rule will inherit this metadata.
  @$pb.TagNumber(6)
  $core.String get metadata => $_getSZ(5);
  @$pb.TagNumber(6)
  set metadata($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMetadata() => $_has(5);
  @$pb.TagNumber(6)
  void clearMetadata() => $_clearField(6);

  /// Dispatch Rule will only accept a call made to these numbers (if set).
  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get inboundNumbers => $_getList(6);

  /// User-defined attributes for the Dispatch Rule.
  /// Participants created by this rule will inherit these attributes.
  @$pb.TagNumber(8)
  $pb.PbMap<$core.String, $core.String> get attributes => $_getMap(7);

  /// Cloud-only, config preset to use
  @$pb.TagNumber(9)
  $core.String get roomPreset => $_getSZ(8);
  @$pb.TagNumber(9)
  set roomPreset($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRoomPreset() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoomPreset() => $_clearField(9);

  /// RoomConfiguration to use if the participant initiates the room
  @$pb.TagNumber(10)
  $2.RoomConfiguration get roomConfig => $_getN(9);
  @$pb.TagNumber(10)
  set roomConfig($2.RoomConfiguration value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasRoomConfig() => $_has(9);
  @$pb.TagNumber(10)
  void clearRoomConfig() => $_clearField(10);
  @$pb.TagNumber(10)
  $2.RoomConfiguration ensureRoomConfig() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.bool get krispEnabled => $_getBF(10);
  @$pb.TagNumber(11)
  set krispEnabled($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasKrispEnabled() => $_has(10);
  @$pb.TagNumber(11)
  void clearKrispEnabled() => $_clearField(11);

  @$pb.TagNumber(12)
  SIPMediaEncryption get mediaEncryption => $_getN(11);
  @$pb.TagNumber(12)
  set mediaEncryption(SIPMediaEncryption value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasMediaEncryption() => $_has(11);
  @$pb.TagNumber(12)
  void clearMediaEncryption() => $_clearField(12);
}

class SIPDispatchRuleUpdate extends $pb.GeneratedMessage {
  factory SIPDispatchRuleUpdate({
    $1.ListUpdate? trunkIds,
    SIPDispatchRule? rule,
    $core.String? name,
    $core.String? metadata,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? attributes,
    SIPMediaEncryption? mediaEncryption,
  }) {
    final result = create();
    if (trunkIds != null) result.trunkIds = trunkIds;
    if (rule != null) result.rule = rule;
    if (name != null) result.name = name;
    if (metadata != null) result.metadata = metadata;
    if (attributes != null) result.attributes.addEntries(attributes);
    if (mediaEncryption != null) result.mediaEncryption = mediaEncryption;
    return result;
  }

  SIPDispatchRuleUpdate._();

  factory SIPDispatchRuleUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPDispatchRuleUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPDispatchRuleUpdate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOM<$1.ListUpdate>(1, _omitFieldNames ? '' : 'trunkIds',
        subBuilder: $1.ListUpdate.create)
    ..aOM<SIPDispatchRule>(2, _omitFieldNames ? '' : 'rule',
        subBuilder: SIPDispatchRule.create)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'metadata')
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'attributes',
        entryClassName: 'SIPDispatchRuleUpdate.AttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aE<SIPMediaEncryption>(6, _omitFieldNames ? '' : 'mediaEncryption',
        enumValues: SIPMediaEncryption.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPDispatchRuleUpdate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPDispatchRuleUpdate copyWith(
          void Function(SIPDispatchRuleUpdate) updates) =>
      super.copyWith((message) => updates(message as SIPDispatchRuleUpdate))
          as SIPDispatchRuleUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleUpdate create() => SIPDispatchRuleUpdate._();
  @$core.override
  SIPDispatchRuleUpdate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPDispatchRuleUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPDispatchRuleUpdate>(create);
  static SIPDispatchRuleUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $1.ListUpdate get trunkIds => $_getN(0);
  @$pb.TagNumber(1)
  set trunkIds($1.ListUpdate value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTrunkIds() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrunkIds() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.ListUpdate ensureTrunkIds() => $_ensure(0);

  @$pb.TagNumber(2)
  SIPDispatchRule get rule => $_getN(1);
  @$pb.TagNumber(2)
  set rule(SIPDispatchRule value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRule() => $_has(1);
  @$pb.TagNumber(2)
  void clearRule() => $_clearField(2);
  @$pb.TagNumber(2)
  SIPDispatchRule ensureRule() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get metadata => $_getSZ(3);
  @$pb.TagNumber(4)
  set metadata($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMetadata() => $_has(3);
  @$pb.TagNumber(4)
  void clearMetadata() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $core.String> get attributes => $_getMap(4);

  @$pb.TagNumber(6)
  SIPMediaEncryption get mediaEncryption => $_getN(5);
  @$pb.TagNumber(6)
  set mediaEncryption(SIPMediaEncryption value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasMediaEncryption() => $_has(5);
  @$pb.TagNumber(6)
  void clearMediaEncryption() => $_clearField(6);
}

/// ListSIPDispatchRuleRequest lists dispatch rules for given filters. If no filters are set, all rules are listed.
class ListSIPDispatchRuleRequest extends $pb.GeneratedMessage {
  factory ListSIPDispatchRuleRequest({
    $core.Iterable<$core.String>? dispatchRuleIds,
    $core.Iterable<$core.String>? trunkIds,
    $1.Pagination? page,
  }) {
    final result = create();
    if (dispatchRuleIds != null) result.dispatchRuleIds.addAll(dispatchRuleIds);
    if (trunkIds != null) result.trunkIds.addAll(trunkIds);
    if (page != null) result.page = page;
    return result;
  }

  ListSIPDispatchRuleRequest._();

  factory ListSIPDispatchRuleRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSIPDispatchRuleRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSIPDispatchRuleRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'dispatchRuleIds')
    ..pPS(2, _omitFieldNames ? '' : 'trunkIds')
    ..aOM<$1.Pagination>(3, _omitFieldNames ? '' : 'page',
        subBuilder: $1.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPDispatchRuleRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPDispatchRuleRequest copyWith(
          void Function(ListSIPDispatchRuleRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListSIPDispatchRuleRequest))
          as ListSIPDispatchRuleRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPDispatchRuleRequest create() => ListSIPDispatchRuleRequest._();
  @$core.override
  ListSIPDispatchRuleRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSIPDispatchRuleRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSIPDispatchRuleRequest>(create);
  static ListSIPDispatchRuleRequest? _defaultInstance;

  /// Rule IDs to list. If this option is set, the response will contains rules in the same order.
  /// If any of the rules is missing, a nil item in that position will be sent in the response.
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get dispatchRuleIds => $_getList(0);

  /// Only list rules that contain one of the Trunk IDs, including wildcard rules.
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get trunkIds => $_getList(1);

  @$pb.TagNumber(3)
  $1.Pagination get page => $_getN(2);
  @$pb.TagNumber(3)
  set page($1.Pagination value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Pagination ensurePage() => $_ensure(2);
}

class ListSIPDispatchRuleResponse extends $pb.GeneratedMessage {
  factory ListSIPDispatchRuleResponse({
    $core.Iterable<SIPDispatchRuleInfo>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListSIPDispatchRuleResponse._();

  factory ListSIPDispatchRuleResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSIPDispatchRuleResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSIPDispatchRuleResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPM<SIPDispatchRuleInfo>(1, _omitFieldNames ? '' : 'items',
        subBuilder: SIPDispatchRuleInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPDispatchRuleResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSIPDispatchRuleResponse copyWith(
          void Function(ListSIPDispatchRuleResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListSIPDispatchRuleResponse))
          as ListSIPDispatchRuleResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSIPDispatchRuleResponse create() =>
      ListSIPDispatchRuleResponse._();
  @$core.override
  ListSIPDispatchRuleResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSIPDispatchRuleResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSIPDispatchRuleResponse>(create);
  static ListSIPDispatchRuleResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SIPDispatchRuleInfo> get items => $_getList(0);
}

class DeleteSIPDispatchRuleRequest extends $pb.GeneratedMessage {
  factory DeleteSIPDispatchRuleRequest({
    $core.String? sipDispatchRuleId,
  }) {
    final result = create();
    if (sipDispatchRuleId != null) result.sipDispatchRuleId = sipDispatchRuleId;
    return result;
  }

  DeleteSIPDispatchRuleRequest._();

  factory DeleteSIPDispatchRuleRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteSIPDispatchRuleRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteSIPDispatchRuleRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipDispatchRuleId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSIPDispatchRuleRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSIPDispatchRuleRequest copyWith(
          void Function(DeleteSIPDispatchRuleRequest) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteSIPDispatchRuleRequest))
          as DeleteSIPDispatchRuleRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSIPDispatchRuleRequest create() =>
      DeleteSIPDispatchRuleRequest._();
  @$core.override
  DeleteSIPDispatchRuleRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteSIPDispatchRuleRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteSIPDispatchRuleRequest>(create);
  static DeleteSIPDispatchRuleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sipDispatchRuleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipDispatchRuleId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSipDispatchRuleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipDispatchRuleId() => $_clearField(1);
}

class SIPOutboundConfig extends $pb.GeneratedMessage {
  factory SIPOutboundConfig({
    $core.String? hostname,
    SIPTransport? transport,
    $core.String? authUsername,
    $core.String? authPassword,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        headersToAttributes,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        attributesToHeaders,
    $core.String? destinationCountry,
  }) {
    final result = create();
    if (hostname != null) result.hostname = hostname;
    if (transport != null) result.transport = transport;
    if (authUsername != null) result.authUsername = authUsername;
    if (authPassword != null) result.authPassword = authPassword;
    if (headersToAttributes != null)
      result.headersToAttributes.addEntries(headersToAttributes);
    if (attributesToHeaders != null)
      result.attributesToHeaders.addEntries(attributesToHeaders);
    if (destinationCountry != null)
      result.destinationCountry = destinationCountry;
    return result;
  }

  SIPOutboundConfig._();

  factory SIPOutboundConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPOutboundConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPOutboundConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..aE<SIPTransport>(2, _omitFieldNames ? '' : 'transport',
        enumValues: SIPTransport.values)
    ..aOS(3, _omitFieldNames ? '' : 'authUsername')
    ..aOS(4, _omitFieldNames ? '' : 'authPassword')
    ..m<$core.String, $core.String>(
        5, _omitFieldNames ? '' : 'headersToAttributes',
        entryClassName: 'SIPOutboundConfig.HeadersToAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..m<$core.String, $core.String>(
        6, _omitFieldNames ? '' : 'attributesToHeaders',
        entryClassName: 'SIPOutboundConfig.AttributesToHeadersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOS(7, _omitFieldNames ? '' : 'destinationCountry')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPOutboundConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPOutboundConfig copyWith(void Function(SIPOutboundConfig) updates) =>
      super.copyWith((message) => updates(message as SIPOutboundConfig))
          as SIPOutboundConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPOutboundConfig create() => SIPOutboundConfig._();
  @$core.override
  SIPOutboundConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPOutboundConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPOutboundConfig>(create);
  static SIPOutboundConfig? _defaultInstance;

  /// SIP server address
  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => $_clearField(1);

  /// SIP Transport used for outbound call.
  @$pb.TagNumber(2)
  SIPTransport get transport => $_getN(1);
  @$pb.TagNumber(2)
  set transport(SIPTransport value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTransport() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransport() => $_clearField(2);

  /// Username and password used to authenticate with SIP server.
  /// May be empty to have no authentication.
  @$pb.TagNumber(3)
  $core.String get authUsername => $_getSZ(2);
  @$pb.TagNumber(3)
  set authUsername($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAuthUsername() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthUsername() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get authPassword => $_getSZ(3);
  @$pb.TagNumber(4)
  set authPassword($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAuthPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthPassword() => $_clearField(4);

  /// Map SIP X-* headers from 200 OK to SIP participant attributes.
  /// Keys are the names of X-* headers and values are the names of attributes they will be mapped to.
  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $core.String> get headersToAttributes => $_getMap(4);

  /// Map LiveKit attributes to SIP X-* headers when sending BYE or REFER requests.
  /// Keys are the names of attributes and values are the names of X-* headers they will be mapped to.
  @$pb.TagNumber(6)
  $pb.PbMap<$core.String, $core.String> get attributesToHeaders => $_getMap(5);

  /// country where the call terminates as ISO 3166-1 alpha-2 (https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). This will be used by the livekit infrastructure to route calls.
  @$pb.TagNumber(7)
  $core.String get destinationCountry => $_getSZ(6);
  @$pb.TagNumber(7)
  set destinationCountry($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDestinationCountry() => $_has(6);
  @$pb.TagNumber(7)
  void clearDestinationCountry() => $_clearField(7);
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
    @$core.Deprecated('This field is deprecated.') $core.bool? playRingtone,
    $core.String? participantName,
    $core.String? participantMetadata,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        participantAttributes,
    $core.bool? hidePhoneNumber,
    $0.Duration? ringingTimeout,
    $0.Duration? maxCallDuration,
    $core.bool? playDialtone,
    $core.bool? krispEnabled,
    $core.String? sipNumber,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? headers,
    SIPHeaderOptions? includeHeaders,
    SIPMediaEncryption? mediaEncryption,
    $core.bool? waitUntilAnswered,
    SIPOutboundConfig? trunk,
    $core.String? displayName,
    Destination? destination,
  }) {
    final result = create();
    if (sipTrunkId != null) result.sipTrunkId = sipTrunkId;
    if (sipCallTo != null) result.sipCallTo = sipCallTo;
    if (roomName != null) result.roomName = roomName;
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (dtmf != null) result.dtmf = dtmf;
    if (playRingtone != null) result.playRingtone = playRingtone;
    if (participantName != null) result.participantName = participantName;
    if (participantMetadata != null)
      result.participantMetadata = participantMetadata;
    if (participantAttributes != null)
      result.participantAttributes.addEntries(participantAttributes);
    if (hidePhoneNumber != null) result.hidePhoneNumber = hidePhoneNumber;
    if (ringingTimeout != null) result.ringingTimeout = ringingTimeout;
    if (maxCallDuration != null) result.maxCallDuration = maxCallDuration;
    if (playDialtone != null) result.playDialtone = playDialtone;
    if (krispEnabled != null) result.krispEnabled = krispEnabled;
    if (sipNumber != null) result.sipNumber = sipNumber;
    if (headers != null) result.headers.addEntries(headers);
    if (includeHeaders != null) result.includeHeaders = includeHeaders;
    if (mediaEncryption != null) result.mediaEncryption = mediaEncryption;
    if (waitUntilAnswered != null) result.waitUntilAnswered = waitUntilAnswered;
    if (trunk != null) result.trunk = trunk;
    if (displayName != null) result.displayName = displayName;
    if (destination != null) result.destination = destination;
    return result;
  }

  CreateSIPParticipantRequest._();

  factory CreateSIPParticipantRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSIPParticipantRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSIPParticipantRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sipTrunkId')
    ..aOS(2, _omitFieldNames ? '' : 'sipCallTo')
    ..aOS(3, _omitFieldNames ? '' : 'roomName')
    ..aOS(4, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(5, _omitFieldNames ? '' : 'dtmf')
    ..aOB(6, _omitFieldNames ? '' : 'playRingtone')
    ..aOS(7, _omitFieldNames ? '' : 'participantName')
    ..aOS(8, _omitFieldNames ? '' : 'participantMetadata')
    ..m<$core.String, $core.String>(
        9, _omitFieldNames ? '' : 'participantAttributes',
        entryClassName:
            'CreateSIPParticipantRequest.ParticipantAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOB(10, _omitFieldNames ? '' : 'hidePhoneNumber')
    ..aOM<$0.Duration>(11, _omitFieldNames ? '' : 'ringingTimeout',
        subBuilder: $0.Duration.create)
    ..aOM<$0.Duration>(12, _omitFieldNames ? '' : 'maxCallDuration',
        subBuilder: $0.Duration.create)
    ..aOB(13, _omitFieldNames ? '' : 'playDialtone')
    ..aOB(14, _omitFieldNames ? '' : 'krispEnabled')
    ..aOS(15, _omitFieldNames ? '' : 'sipNumber')
    ..m<$core.String, $core.String>(16, _omitFieldNames ? '' : 'headers',
        entryClassName: 'CreateSIPParticipantRequest.HeadersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aE<SIPHeaderOptions>(17, _omitFieldNames ? '' : 'includeHeaders',
        enumValues: SIPHeaderOptions.values)
    ..aE<SIPMediaEncryption>(18, _omitFieldNames ? '' : 'mediaEncryption',
        enumValues: SIPMediaEncryption.values)
    ..aOB(19, _omitFieldNames ? '' : 'waitUntilAnswered')
    ..aOM<SIPOutboundConfig>(20, _omitFieldNames ? '' : 'trunk',
        subBuilder: SIPOutboundConfig.create)
    ..aOS(21, _omitFieldNames ? '' : 'displayName')
    ..aOM<Destination>(22, _omitFieldNames ? '' : 'destination',
        subBuilder: Destination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSIPParticipantRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSIPParticipantRequest copyWith(
          void Function(CreateSIPParticipantRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateSIPParticipantRequest))
          as CreateSIPParticipantRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSIPParticipantRequest create() =>
      CreateSIPParticipantRequest._();
  @$core.override
  CreateSIPParticipantRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateSIPParticipantRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSIPParticipantRequest>(create);
  static CreateSIPParticipantRequest? _defaultInstance;

  /// What SIP Trunk should be used to dial the user
  @$pb.TagNumber(1)
  $core.String get sipTrunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sipTrunkId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSipTrunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSipTrunkId() => $_clearField(1);

  /// What number should be dialed via SIP
  @$pb.TagNumber(2)
  $core.String get sipCallTo => $_getSZ(1);
  @$pb.TagNumber(2)
  set sipCallTo($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSipCallTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearSipCallTo() => $_clearField(2);

  /// What LiveKit room should this participant be connected too
  @$pb.TagNumber(3)
  $core.String get roomName => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomName() => $_clearField(3);

  /// Optional identity of the participant in LiveKit room
  @$pb.TagNumber(4)
  $core.String get participantIdentity => $_getSZ(3);
  @$pb.TagNumber(4)
  set participantIdentity($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasParticipantIdentity() => $_has(3);
  @$pb.TagNumber(4)
  void clearParticipantIdentity() => $_clearField(4);

  /// Optionally send following DTMF digits (extension codes) when making a call.
  /// Character 'w' can be used to add a 0.5 sec delay.
  @$pb.TagNumber(5)
  $core.String get dtmf => $_getSZ(4);
  @$pb.TagNumber(5)
  set dtmf($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDtmf() => $_has(4);
  @$pb.TagNumber(5)
  void clearDtmf() => $_clearField(5);

  /// Optionally play dialtone in the room as an audible indicator for existing participants. The `play_ringtone` option is deprectated but has the same effect.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool get playRingtone => $_getBF(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set playRingtone($core.bool value) => $_setBool(5, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasPlayRingtone() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearPlayRingtone() => $_clearField(6);

  /// Optional name of the participant in LiveKit room
  @$pb.TagNumber(7)
  $core.String get participantName => $_getSZ(6);
  @$pb.TagNumber(7)
  set participantName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasParticipantName() => $_has(6);
  @$pb.TagNumber(7)
  void clearParticipantName() => $_clearField(7);

  /// Optional user-defined metadata. Will be attached to a created Participant in the room.
  @$pb.TagNumber(8)
  $core.String get participantMetadata => $_getSZ(7);
  @$pb.TagNumber(8)
  set participantMetadata($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasParticipantMetadata() => $_has(7);
  @$pb.TagNumber(8)
  void clearParticipantMetadata() => $_clearField(8);

  /// Optional user-defined attributes. Will be attached to a created Participant in the room.
  @$pb.TagNumber(9)
  $pb.PbMap<$core.String, $core.String> get participantAttributes =>
      $_getMap(8);

  /// By default the From value (Phone number) is used for participant name/identity (if not set) and added to attributes.
  /// If true, a random value for identity will be used and numbers will be omitted from attributes.
  @$pb.TagNumber(10)
  $core.bool get hidePhoneNumber => $_getBF(9);
  @$pb.TagNumber(10)
  set hidePhoneNumber($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasHidePhoneNumber() => $_has(9);
  @$pb.TagNumber(10)
  void clearHidePhoneNumber() => $_clearField(10);

  /// Max time for the callee to answer the call.
  @$pb.TagNumber(11)
  $0.Duration get ringingTimeout => $_getN(10);
  @$pb.TagNumber(11)
  set ringingTimeout($0.Duration value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasRingingTimeout() => $_has(10);
  @$pb.TagNumber(11)
  void clearRingingTimeout() => $_clearField(11);
  @$pb.TagNumber(11)
  $0.Duration ensureRingingTimeout() => $_ensure(10);

  /// Max call duration.
  @$pb.TagNumber(12)
  $0.Duration get maxCallDuration => $_getN(11);
  @$pb.TagNumber(12)
  set maxCallDuration($0.Duration value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasMaxCallDuration() => $_has(11);
  @$pb.TagNumber(12)
  void clearMaxCallDuration() => $_clearField(12);
  @$pb.TagNumber(12)
  $0.Duration ensureMaxCallDuration() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.bool get playDialtone => $_getBF(12);
  @$pb.TagNumber(13)
  set playDialtone($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(13)
  $core.bool hasPlayDialtone() => $_has(12);
  @$pb.TagNumber(13)
  void clearPlayDialtone() => $_clearField(13);

  /// Enable voice isolation for the callee.
  @$pb.TagNumber(14)
  $core.bool get krispEnabled => $_getBF(13);
  @$pb.TagNumber(14)
  set krispEnabled($core.bool value) => $_setBool(13, value);
  @$pb.TagNumber(14)
  $core.bool hasKrispEnabled() => $_has(13);
  @$pb.TagNumber(14)
  void clearKrispEnabled() => $_clearField(14);

  /// Optional SIP From number to use. If empty, trunk number is used.
  @$pb.TagNumber(15)
  $core.String get sipNumber => $_getSZ(14);
  @$pb.TagNumber(15)
  set sipNumber($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasSipNumber() => $_has(14);
  @$pb.TagNumber(15)
  void clearSipNumber() => $_clearField(15);

  /// These headers are sent as-is and may help identify this call as coming from LiveKit for the other SIP endpoint.
  @$pb.TagNumber(16)
  $pb.PbMap<$core.String, $core.String> get headers => $_getMap(15);

  /// Map SIP headers from 200 OK to sip.h.* participant attributes automatically.
  ///
  /// When the names of required headers is known, using headers_to_attributes is strongly recommended.
  ///
  /// When mapping 200 OK headers to follow-up request headers with attributes_to_headers map,
  /// lowercase header names should be used, for example: sip.h.x-custom-header.
  @$pb.TagNumber(17)
  SIPHeaderOptions get includeHeaders => $_getN(16);
  @$pb.TagNumber(17)
  set includeHeaders(SIPHeaderOptions value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasIncludeHeaders() => $_has(16);
  @$pb.TagNumber(17)
  void clearIncludeHeaders() => $_clearField(17);

  @$pb.TagNumber(18)
  SIPMediaEncryption get mediaEncryption => $_getN(17);
  @$pb.TagNumber(18)
  set mediaEncryption(SIPMediaEncryption value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasMediaEncryption() => $_has(17);
  @$pb.TagNumber(18)
  void clearMediaEncryption() => $_clearField(18);

  /// Wait for the answer for the call before returning.
  @$pb.TagNumber(19)
  $core.bool get waitUntilAnswered => $_getBF(18);
  @$pb.TagNumber(19)
  set waitUntilAnswered($core.bool value) => $_setBool(18, value);
  @$pb.TagNumber(19)
  $core.bool hasWaitUntilAnswered() => $_has(18);
  @$pb.TagNumber(19)
  void clearWaitUntilAnswered() => $_clearField(19);

  @$pb.TagNumber(20)
  SIPOutboundConfig get trunk => $_getN(19);
  @$pb.TagNumber(20)
  set trunk(SIPOutboundConfig value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasTrunk() => $_has(19);
  @$pb.TagNumber(20)
  void clearTrunk() => $_clearField(20);
  @$pb.TagNumber(20)
  SIPOutboundConfig ensureTrunk() => $_ensure(19);

  /// Optional display name for the 'From' SIP header.
  ///
  /// Cases:
  /// 1) Unspecified: Use legacy behavior - display name will be set to be the caller's number.
  /// 2) Empty string: Do not send a display name, which will result in a CNAM lookup downstream.
  /// 3) Non-empty: Use the specified value as the display name.
  @$pb.TagNumber(21)
  $core.String get displayName => $_getSZ(20);
  @$pb.TagNumber(21)
  set displayName($core.String value) => $_setString(20, value);
  @$pb.TagNumber(21)
  $core.bool hasDisplayName() => $_has(20);
  @$pb.TagNumber(21)
  void clearDisplayName() => $_clearField(21);

  @$pb.TagNumber(22)
  Destination get destination => $_getN(21);
  @$pb.TagNumber(22)
  set destination(Destination value) => $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasDestination() => $_has(21);
  @$pb.TagNumber(22)
  void clearDestination() => $_clearField(22);
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
    final result = create();
    if (participantId != null) result.participantId = participantId;
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (roomName != null) result.roomName = roomName;
    if (sipCallId != null) result.sipCallId = sipCallId;
    return result;
  }

  SIPParticipantInfo._();

  factory SIPParticipantInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPParticipantInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPParticipantInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'participantId')
    ..aOS(2, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(3, _omitFieldNames ? '' : 'roomName')
    ..aOS(4, _omitFieldNames ? '' : 'sipCallId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPParticipantInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPParticipantInfo copyWith(void Function(SIPParticipantInfo) updates) =>
      super.copyWith((message) => updates(message as SIPParticipantInfo))
          as SIPParticipantInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPParticipantInfo create() => SIPParticipantInfo._();
  @$core.override
  SIPParticipantInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPParticipantInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPParticipantInfo>(create);
  static SIPParticipantInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get participantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set participantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasParticipantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearParticipantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get participantIdentity => $_getSZ(1);
  @$pb.TagNumber(2)
  set participantIdentity($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasParticipantIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearParticipantIdentity() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomName => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get sipCallId => $_getSZ(3);
  @$pb.TagNumber(4)
  set sipCallId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSipCallId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSipCallId() => $_clearField(4);
}

class TransferSIPParticipantRequest extends $pb.GeneratedMessage {
  factory TransferSIPParticipantRequest({
    $core.String? participantIdentity,
    $core.String? roomName,
    $core.String? transferTo,
    $core.bool? playDialtone,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? headers,
    $0.Duration? ringingTimeout,
  }) {
    final result = create();
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (roomName != null) result.roomName = roomName;
    if (transferTo != null) result.transferTo = transferTo;
    if (playDialtone != null) result.playDialtone = playDialtone;
    if (headers != null) result.headers.addEntries(headers);
    if (ringingTimeout != null) result.ringingTimeout = ringingTimeout;
    return result;
  }

  TransferSIPParticipantRequest._();

  factory TransferSIPParticipantRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferSIPParticipantRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferSIPParticipantRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(2, _omitFieldNames ? '' : 'roomName')
    ..aOS(3, _omitFieldNames ? '' : 'transferTo')
    ..aOB(4, _omitFieldNames ? '' : 'playDialtone')
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'headers',
        entryClassName: 'TransferSIPParticipantRequest.HeadersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOM<$0.Duration>(6, _omitFieldNames ? '' : 'ringingTimeout',
        subBuilder: $0.Duration.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferSIPParticipantRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferSIPParticipantRequest copyWith(
          void Function(TransferSIPParticipantRequest) updates) =>
      super.copyWith(
              (message) => updates(message as TransferSIPParticipantRequest))
          as TransferSIPParticipantRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferSIPParticipantRequest create() =>
      TransferSIPParticipantRequest._();
  @$core.override
  TransferSIPParticipantRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferSIPParticipantRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferSIPParticipantRequest>(create);
  static TransferSIPParticipantRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get participantIdentity => $_getSZ(0);
  @$pb.TagNumber(1)
  set participantIdentity($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasParticipantIdentity() => $_has(0);
  @$pb.TagNumber(1)
  void clearParticipantIdentity() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomName => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get transferTo => $_getSZ(2);
  @$pb.TagNumber(3)
  set transferTo($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTransferTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferTo() => $_clearField(3);

  /// Optionally play dialtone to the SIP participant as an audible indicator of being transferred
  @$pb.TagNumber(4)
  $core.bool get playDialtone => $_getBF(3);
  @$pb.TagNumber(4)
  set playDialtone($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPlayDialtone() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlayDialtone() => $_clearField(4);

  /// Add the following headers to the REFER SIP request.
  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $core.String> get headers => $_getMap(4);

  /// Max time for the transfer destination to answer the call.
  @$pb.TagNumber(6)
  $0.Duration get ringingTimeout => $_getN(5);
  @$pb.TagNumber(6)
  set ringingTimeout($0.Duration value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasRingingTimeout() => $_has(5);
  @$pb.TagNumber(6)
  void clearRingingTimeout() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.Duration ensureRingingTimeout() => $_ensure(5);
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
    @$core.Deprecated('This field is deprecated.') $fixnum.Int64? createdAt,
    @$core.Deprecated('This field is deprecated.') $fixnum.Int64? startedAt,
    @$core.Deprecated('This field is deprecated.') $fixnum.Int64? endedAt,
    $1.DisconnectReason? disconnectReason,
    $core.String? error,
    $core.Iterable<SIPFeature>? enabledFeatures,
    SIPCallDirection? callDirection,
    $core.String? dispatchRuleId,
    $core.String? region,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        participantAttributes,
    SIPStatus? callStatusCode,
    $core.String? audioCodec,
    $core.String? mediaEncryption,
    $fixnum.Int64? createdAtNs,
    $fixnum.Int64? startedAtNs,
    $fixnum.Int64? endedAtNs,
    $core.String? pcapFileLink,
    $core.Iterable<$3.Any>? callContext,
    ProviderInfo? providerInfo,
  }) {
    final result = create();
    if (callId != null) result.callId = callId;
    if (trunkId != null) result.trunkId = trunkId;
    if (roomName != null) result.roomName = roomName;
    if (roomId != null) result.roomId = roomId;
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (fromUri != null) result.fromUri = fromUri;
    if (toUri != null) result.toUri = toUri;
    if (callStatus != null) result.callStatus = callStatus;
    if (createdAt != null) result.createdAt = createdAt;
    if (startedAt != null) result.startedAt = startedAt;
    if (endedAt != null) result.endedAt = endedAt;
    if (disconnectReason != null) result.disconnectReason = disconnectReason;
    if (error != null) result.error = error;
    if (enabledFeatures != null) result.enabledFeatures.addAll(enabledFeatures);
    if (callDirection != null) result.callDirection = callDirection;
    if (dispatchRuleId != null) result.dispatchRuleId = dispatchRuleId;
    if (region != null) result.region = region;
    if (participantAttributes != null)
      result.participantAttributes.addEntries(participantAttributes);
    if (callStatusCode != null) result.callStatusCode = callStatusCode;
    if (audioCodec != null) result.audioCodec = audioCodec;
    if (mediaEncryption != null) result.mediaEncryption = mediaEncryption;
    if (createdAtNs != null) result.createdAtNs = createdAtNs;
    if (startedAtNs != null) result.startedAtNs = startedAtNs;
    if (endedAtNs != null) result.endedAtNs = endedAtNs;
    if (pcapFileLink != null) result.pcapFileLink = pcapFileLink;
    if (callContext != null) result.callContext.addAll(callContext);
    if (providerInfo != null) result.providerInfo = providerInfo;
    return result;
  }

  SIPCallInfo._();

  factory SIPCallInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPCallInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPCallInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'callId')
    ..aOS(2, _omitFieldNames ? '' : 'trunkId')
    ..aOS(3, _omitFieldNames ? '' : 'roomName')
    ..aOS(4, _omitFieldNames ? '' : 'roomId')
    ..aOS(5, _omitFieldNames ? '' : 'participantIdentity')
    ..aOM<SIPUri>(6, _omitFieldNames ? '' : 'fromUri',
        subBuilder: SIPUri.create)
    ..aOM<SIPUri>(7, _omitFieldNames ? '' : 'toUri', subBuilder: SIPUri.create)
    ..aE<SIPCallStatus>(8, _omitFieldNames ? '' : 'callStatus',
        enumValues: SIPCallStatus.values)
    ..aInt64(9, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(10, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(11, _omitFieldNames ? '' : 'endedAt')
    ..aE<$1.DisconnectReason>(12, _omitFieldNames ? '' : 'disconnectReason',
        enumValues: $1.DisconnectReason.values)
    ..aOS(13, _omitFieldNames ? '' : 'error')
    ..pc<SIPFeature>(
        14, _omitFieldNames ? '' : 'enabledFeatures', $pb.PbFieldType.KE,
        valueOf: SIPFeature.valueOf,
        enumValues: SIPFeature.values,
        defaultEnumValue: SIPFeature.NONE)
    ..aE<SIPCallDirection>(15, _omitFieldNames ? '' : 'callDirection',
        enumValues: SIPCallDirection.values)
    ..aOS(16, _omitFieldNames ? '' : 'dispatchRuleId')
    ..aOS(17, _omitFieldNames ? '' : 'region')
    ..m<$core.String, $core.String>(
        18, _omitFieldNames ? '' : 'participantAttributes',
        entryClassName: 'SIPCallInfo.ParticipantAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOM<SIPStatus>(19, _omitFieldNames ? '' : 'callStatusCode',
        subBuilder: SIPStatus.create)
    ..aOS(20, _omitFieldNames ? '' : 'audioCodec')
    ..aOS(21, _omitFieldNames ? '' : 'mediaEncryption')
    ..aInt64(22, _omitFieldNames ? '' : 'createdAtNs')
    ..aInt64(23, _omitFieldNames ? '' : 'startedAtNs')
    ..aInt64(24, _omitFieldNames ? '' : 'endedAtNs')
    ..aOS(25, _omitFieldNames ? '' : 'pcapFileLink')
    ..pPM<$3.Any>(26, _omitFieldNames ? '' : 'callContext',
        subBuilder: $3.Any.create)
    ..aOM<ProviderInfo>(27, _omitFieldNames ? '' : 'providerInfo',
        subBuilder: ProviderInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPCallInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPCallInfo copyWith(void Function(SIPCallInfo) updates) =>
      super.copyWith((message) => updates(message as SIPCallInfo))
          as SIPCallInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPCallInfo create() => SIPCallInfo._();
  @$core.override
  SIPCallInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPCallInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPCallInfo>(create);
  static SIPCallInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get callId => $_getSZ(0);
  @$pb.TagNumber(1)
  set callId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get trunkId => $_getSZ(1);
  @$pb.TagNumber(2)
  set trunkId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTrunkId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTrunkId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomName => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomId => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get participantIdentity => $_getSZ(4);
  @$pb.TagNumber(5)
  set participantIdentity($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasParticipantIdentity() => $_has(4);
  @$pb.TagNumber(5)
  void clearParticipantIdentity() => $_clearField(5);

  @$pb.TagNumber(6)
  SIPUri get fromUri => $_getN(5);
  @$pb.TagNumber(6)
  set fromUri(SIPUri value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasFromUri() => $_has(5);
  @$pb.TagNumber(6)
  void clearFromUri() => $_clearField(6);
  @$pb.TagNumber(6)
  SIPUri ensureFromUri() => $_ensure(5);

  @$pb.TagNumber(7)
  SIPUri get toUri => $_getN(6);
  @$pb.TagNumber(7)
  set toUri(SIPUri value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasToUri() => $_has(6);
  @$pb.TagNumber(7)
  void clearToUri() => $_clearField(7);
  @$pb.TagNumber(7)
  SIPUri ensureToUri() => $_ensure(6);

  @$pb.TagNumber(8)
  SIPCallStatus get callStatus => $_getN(7);
  @$pb.TagNumber(8)
  set callStatus(SIPCallStatus value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasCallStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearCallStatus() => $_clearField(8);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $fixnum.Int64 get createdAt => $_getI64(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  set createdAt($fixnum.Int64 value) => $_setInt64(8, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  void clearCreatedAt() => $_clearField(9);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  $fixnum.Int64 get startedAt => $_getI64(9);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  set startedAt($fixnum.Int64 value) => $_setInt64(9, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  $core.bool hasStartedAt() => $_has(9);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  void clearStartedAt() => $_clearField(10);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  $fixnum.Int64 get endedAt => $_getI64(10);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  set endedAt($fixnum.Int64 value) => $_setInt64(10, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  $core.bool hasEndedAt() => $_has(10);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  void clearEndedAt() => $_clearField(11);

  @$pb.TagNumber(12)
  $1.DisconnectReason get disconnectReason => $_getN(11);
  @$pb.TagNumber(12)
  set disconnectReason($1.DisconnectReason value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasDisconnectReason() => $_has(11);
  @$pb.TagNumber(12)
  void clearDisconnectReason() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get error => $_getSZ(12);
  @$pb.TagNumber(13)
  set error($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasError() => $_has(12);
  @$pb.TagNumber(13)
  void clearError() => $_clearField(13);

  @$pb.TagNumber(14)
  $pb.PbList<SIPFeature> get enabledFeatures => $_getList(13);

  @$pb.TagNumber(15)
  SIPCallDirection get callDirection => $_getN(14);
  @$pb.TagNumber(15)
  set callDirection(SIPCallDirection value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasCallDirection() => $_has(14);
  @$pb.TagNumber(15)
  void clearCallDirection() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get dispatchRuleId => $_getSZ(15);
  @$pb.TagNumber(16)
  set dispatchRuleId($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasDispatchRuleId() => $_has(15);
  @$pb.TagNumber(16)
  void clearDispatchRuleId() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.String get region => $_getSZ(16);
  @$pb.TagNumber(17)
  set region($core.String value) => $_setString(16, value);
  @$pb.TagNumber(17)
  $core.bool hasRegion() => $_has(16);
  @$pb.TagNumber(17)
  void clearRegion() => $_clearField(17);

  @$pb.TagNumber(18)
  $pb.PbMap<$core.String, $core.String> get participantAttributes =>
      $_getMap(17);

  @$pb.TagNumber(19)
  SIPStatus get callStatusCode => $_getN(18);
  @$pb.TagNumber(19)
  set callStatusCode(SIPStatus value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasCallStatusCode() => $_has(18);
  @$pb.TagNumber(19)
  void clearCallStatusCode() => $_clearField(19);
  @$pb.TagNumber(19)
  SIPStatus ensureCallStatusCode() => $_ensure(18);

  @$pb.TagNumber(20)
  $core.String get audioCodec => $_getSZ(19);
  @$pb.TagNumber(20)
  set audioCodec($core.String value) => $_setString(19, value);
  @$pb.TagNumber(20)
  $core.bool hasAudioCodec() => $_has(19);
  @$pb.TagNumber(20)
  void clearAudioCodec() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.String get mediaEncryption => $_getSZ(20);
  @$pb.TagNumber(21)
  set mediaEncryption($core.String value) => $_setString(20, value);
  @$pb.TagNumber(21)
  $core.bool hasMediaEncryption() => $_has(20);
  @$pb.TagNumber(21)
  void clearMediaEncryption() => $_clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get createdAtNs => $_getI64(21);
  @$pb.TagNumber(22)
  set createdAtNs($fixnum.Int64 value) => $_setInt64(21, value);
  @$pb.TagNumber(22)
  $core.bool hasCreatedAtNs() => $_has(21);
  @$pb.TagNumber(22)
  void clearCreatedAtNs() => $_clearField(22);

  @$pb.TagNumber(23)
  $fixnum.Int64 get startedAtNs => $_getI64(22);
  @$pb.TagNumber(23)
  set startedAtNs($fixnum.Int64 value) => $_setInt64(22, value);
  @$pb.TagNumber(23)
  $core.bool hasStartedAtNs() => $_has(22);
  @$pb.TagNumber(23)
  void clearStartedAtNs() => $_clearField(23);

  @$pb.TagNumber(24)
  $fixnum.Int64 get endedAtNs => $_getI64(23);
  @$pb.TagNumber(24)
  set endedAtNs($fixnum.Int64 value) => $_setInt64(23, value);
  @$pb.TagNumber(24)
  $core.bool hasEndedAtNs() => $_has(23);
  @$pb.TagNumber(24)
  void clearEndedAtNs() => $_clearField(24);

  @$pb.TagNumber(25)
  $core.String get pcapFileLink => $_getSZ(24);
  @$pb.TagNumber(25)
  set pcapFileLink($core.String value) => $_setString(24, value);
  @$pb.TagNumber(25)
  $core.bool hasPcapFileLink() => $_has(24);
  @$pb.TagNumber(25)
  void clearPcapFileLink() => $_clearField(25);

  @$pb.TagNumber(26)
  $pb.PbList<$3.Any> get callContext => $_getList(25);

  @$pb.TagNumber(27)
  ProviderInfo get providerInfo => $_getN(26);
  @$pb.TagNumber(27)
  set providerInfo(ProviderInfo value) => $_setField(27, value);
  @$pb.TagNumber(27)
  $core.bool hasProviderInfo() => $_has(26);
  @$pb.TagNumber(27)
  void clearProviderInfo() => $_clearField(27);
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
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (callId != null) result.callId = callId;
    if (transferTo != null) result.transferTo = transferTo;
    if (transferInitiatedAtNs != null)
      result.transferInitiatedAtNs = transferInitiatedAtNs;
    if (transferCompletedAtNs != null)
      result.transferCompletedAtNs = transferCompletedAtNs;
    if (transferStatus != null) result.transferStatus = transferStatus;
    if (error != null) result.error = error;
    if (transferStatusCode != null)
      result.transferStatusCode = transferStatusCode;
    return result;
  }

  SIPTransferInfo._();

  factory SIPTransferInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPTransferInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPTransferInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..aOS(2, _omitFieldNames ? '' : 'callId')
    ..aOS(3, _omitFieldNames ? '' : 'transferTo')
    ..aInt64(4, _omitFieldNames ? '' : 'transferInitiatedAtNs')
    ..aInt64(5, _omitFieldNames ? '' : 'transferCompletedAtNs')
    ..aE<SIPTransferStatus>(6, _omitFieldNames ? '' : 'transferStatus',
        enumValues: SIPTransferStatus.values)
    ..aOS(7, _omitFieldNames ? '' : 'error')
    ..aOM<SIPStatus>(8, _omitFieldNames ? '' : 'transferStatusCode',
        subBuilder: SIPStatus.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPTransferInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPTransferInfo copyWith(void Function(SIPTransferInfo) updates) =>
      super.copyWith((message) => updates(message as SIPTransferInfo))
          as SIPTransferInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPTransferInfo create() => SIPTransferInfo._();
  @$core.override
  SIPTransferInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPTransferInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SIPTransferInfo>(create);
  static SIPTransferInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get callId => $_getSZ(1);
  @$pb.TagNumber(2)
  set callId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCallId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get transferTo => $_getSZ(2);
  @$pb.TagNumber(3)
  set transferTo($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTransferTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferTo() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get transferInitiatedAtNs => $_getI64(3);
  @$pb.TagNumber(4)
  set transferInitiatedAtNs($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTransferInitiatedAtNs() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransferInitiatedAtNs() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get transferCompletedAtNs => $_getI64(4);
  @$pb.TagNumber(5)
  set transferCompletedAtNs($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTransferCompletedAtNs() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransferCompletedAtNs() => $_clearField(5);

  @$pb.TagNumber(6)
  SIPTransferStatus get transferStatus => $_getN(5);
  @$pb.TagNumber(6)
  set transferStatus(SIPTransferStatus value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasTransferStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearTransferStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get error => $_getSZ(6);
  @$pb.TagNumber(7)
  set error($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasError() => $_has(6);
  @$pb.TagNumber(7)
  void clearError() => $_clearField(7);

  @$pb.TagNumber(8)
  SIPStatus get transferStatusCode => $_getN(7);
  @$pb.TagNumber(8)
  set transferStatusCode(SIPStatus value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasTransferStatusCode() => $_has(7);
  @$pb.TagNumber(8)
  void clearTransferStatusCode() => $_clearField(8);
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
    final result = create();
    if (user != null) result.user = user;
    if (host != null) result.host = host;
    if (ip != null) result.ip = ip;
    if (port != null) result.port = port;
    if (transport != null) result.transport = transport;
    return result;
  }

  SIPUri._();

  factory SIPUri.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SIPUri.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SIPUri',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'user')
    ..aOS(2, _omitFieldNames ? '' : 'host')
    ..aOS(3, _omitFieldNames ? '' : 'ip')
    ..aI(4, _omitFieldNames ? '' : 'port', fieldType: $pb.PbFieldType.OU3)
    ..aE<SIPTransport>(5, _omitFieldNames ? '' : 'transport',
        enumValues: SIPTransport.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPUri clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SIPUri copyWith(void Function(SIPUri) updates) =>
      super.copyWith((message) => updates(message as SIPUri)) as SIPUri;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SIPUri create() => SIPUri._();
  @$core.override
  SIPUri createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SIPUri getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SIPUri>(create);
  static SIPUri? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get user => $_getSZ(0);
  @$pb.TagNumber(1)
  set user($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get host => $_getSZ(1);
  @$pb.TagNumber(2)
  set host($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHost() => $_has(1);
  @$pb.TagNumber(2)
  void clearHost() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get ip => $_getSZ(2);
  @$pb.TagNumber(3)
  set ip($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIp() => $_has(2);
  @$pb.TagNumber(3)
  void clearIp() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get port => $_getIZ(3);
  @$pb.TagNumber(4)
  set port($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPort() => $_has(3);
  @$pb.TagNumber(4)
  void clearPort() => $_clearField(4);

  @$pb.TagNumber(5)
  SIPTransport get transport => $_getN(4);
  @$pb.TagNumber(5)
  set transport(SIPTransport value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTransport() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransport() => $_clearField(5);
}

class Destination extends $pb.GeneratedMessage {
  factory Destination({
    $core.String? city,
    $core.String? country,
    $core.String? region,
  }) {
    final result = create();
    if (city != null) result.city = city;
    if (country != null) result.country = country;
    if (region != null) result.region = region;
    return result;
  }

  Destination._();

  factory Destination.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Destination.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Destination',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'city')
    ..aOS(2, _omitFieldNames ? '' : 'country')
    ..aOS(3, _omitFieldNames ? '' : 'region')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Destination clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Destination copyWith(void Function(Destination) updates) =>
      super.copyWith((message) => updates(message as Destination))
          as Destination;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Destination create() => Destination._();
  @$core.override
  Destination createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Destination getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Destination>(create);
  static Destination? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get city => $_getSZ(0);
  @$pb.TagNumber(1)
  set city($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCity() => $_has(0);
  @$pb.TagNumber(1)
  void clearCity() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get country => $_getSZ(1);
  @$pb.TagNumber(2)
  set country($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCountry() => $_has(1);
  @$pb.TagNumber(2)
  void clearCountry() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get region => $_getSZ(2);
  @$pb.TagNumber(3)
  set region($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRegion() => $_has(2);
  @$pb.TagNumber(3)
  void clearRegion() => $_clearField(3);
}

class SIPApi {
  final $pb.RpcClient _client;

  SIPApi(this._client);

  @$core.Deprecated('This method is deprecated')
  $async.Future<ListSIPTrunkResponse> listSIPTrunk(
          $pb.ClientContext? ctx, ListSIPTrunkRequest request) =>
      _client.invoke<ListSIPTrunkResponse>(
          ctx, 'SIP', 'ListSIPTrunk', request, ListSIPTrunkResponse());
  $async.Future<SIPInboundTrunkInfo> createSIPInboundTrunk(
          $pb.ClientContext? ctx, CreateSIPInboundTrunkRequest request) =>
      _client.invoke<SIPInboundTrunkInfo>(
          ctx, 'SIP', 'CreateSIPInboundTrunk', request, SIPInboundTrunkInfo());
  $async.Future<SIPOutboundTrunkInfo> createSIPOutboundTrunk(
          $pb.ClientContext? ctx, CreateSIPOutboundTrunkRequest request) =>
      _client.invoke<SIPOutboundTrunkInfo>(ctx, 'SIP', 'CreateSIPOutboundTrunk',
          request, SIPOutboundTrunkInfo());
  $async.Future<SIPInboundTrunkInfo> updateSIPInboundTrunk(
          $pb.ClientContext? ctx, UpdateSIPInboundTrunkRequest request) =>
      _client.invoke<SIPInboundTrunkInfo>(
          ctx, 'SIP', 'UpdateSIPInboundTrunk', request, SIPInboundTrunkInfo());
  $async.Future<SIPOutboundTrunkInfo> updateSIPOutboundTrunk(
          $pb.ClientContext? ctx, UpdateSIPOutboundTrunkRequest request) =>
      _client.invoke<SIPOutboundTrunkInfo>(ctx, 'SIP', 'UpdateSIPOutboundTrunk',
          request, SIPOutboundTrunkInfo());
  $async.Future<GetSIPInboundTrunkResponse> getSIPInboundTrunk(
          $pb.ClientContext? ctx, GetSIPInboundTrunkRequest request) =>
      _client.invoke<GetSIPInboundTrunkResponse>(ctx, 'SIP',
          'GetSIPInboundTrunk', request, GetSIPInboundTrunkResponse());
  $async.Future<GetSIPOutboundTrunkResponse> getSIPOutboundTrunk(
          $pb.ClientContext? ctx, GetSIPOutboundTrunkRequest request) =>
      _client.invoke<GetSIPOutboundTrunkResponse>(ctx, 'SIP',
          'GetSIPOutboundTrunk', request, GetSIPOutboundTrunkResponse());
  $async.Future<ListSIPInboundTrunkResponse> listSIPInboundTrunk(
          $pb.ClientContext? ctx, ListSIPInboundTrunkRequest request) =>
      _client.invoke<ListSIPInboundTrunkResponse>(ctx, 'SIP',
          'ListSIPInboundTrunk', request, ListSIPInboundTrunkResponse());
  $async.Future<ListSIPOutboundTrunkResponse> listSIPOutboundTrunk(
          $pb.ClientContext? ctx, ListSIPOutboundTrunkRequest request) =>
      _client.invoke<ListSIPOutboundTrunkResponse>(ctx, 'SIP',
          'ListSIPOutboundTrunk', request, ListSIPOutboundTrunkResponse());
  $async.Future<SIPTrunkInfo> deleteSIPTrunk(
          $pb.ClientContext? ctx, DeleteSIPTrunkRequest request) =>
      _client.invoke<SIPTrunkInfo>(
          ctx, 'SIP', 'DeleteSIPTrunk', request, SIPTrunkInfo());
  $async.Future<SIPDispatchRuleInfo> createSIPDispatchRule(
          $pb.ClientContext? ctx, CreateSIPDispatchRuleRequest request) =>
      _client.invoke<SIPDispatchRuleInfo>(
          ctx, 'SIP', 'CreateSIPDispatchRule', request, SIPDispatchRuleInfo());
  $async.Future<SIPDispatchRuleInfo> updateSIPDispatchRule(
          $pb.ClientContext? ctx, UpdateSIPDispatchRuleRequest request) =>
      _client.invoke<SIPDispatchRuleInfo>(
          ctx, 'SIP', 'UpdateSIPDispatchRule', request, SIPDispatchRuleInfo());
  $async.Future<ListSIPDispatchRuleResponse> listSIPDispatchRule(
          $pb.ClientContext? ctx, ListSIPDispatchRuleRequest request) =>
      _client.invoke<ListSIPDispatchRuleResponse>(ctx, 'SIP',
          'ListSIPDispatchRule', request, ListSIPDispatchRuleResponse());
  $async.Future<SIPDispatchRuleInfo> deleteSIPDispatchRule(
          $pb.ClientContext? ctx, DeleteSIPDispatchRuleRequest request) =>
      _client.invoke<SIPDispatchRuleInfo>(
          ctx, 'SIP', 'DeleteSIPDispatchRule', request, SIPDispatchRuleInfo());
  $async.Future<SIPParticipantInfo> createSIPParticipant(
          $pb.ClientContext? ctx, CreateSIPParticipantRequest request) =>
      _client.invoke<SIPParticipantInfo>(
          ctx, 'SIP', 'CreateSIPParticipant', request, SIPParticipantInfo());
  $async.Future<$4.Empty> transferSIPParticipant(
          $pb.ClientContext? ctx, TransferSIPParticipantRequest request) =>
      _client.invoke<$4.Empty>(
          ctx, 'SIP', 'TransferSIPParticipant', request, $4.Empty());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
