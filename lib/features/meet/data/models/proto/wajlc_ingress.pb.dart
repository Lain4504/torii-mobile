// This is a generated file - do not edit.
//
// Generated from wajlc_ingress.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_ingress.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'wajlc_ingress.pbenum.dart';

class CreateIngressReq extends $pb.GeneratedMessage {
  factory CreateIngressReq({
    IngressInput? inputType,
    $core.String? participantName,
    $core.String? roomId,
  }) {
    final result = create();
    if (inputType != null) result.inputType = inputType;
    if (participantName != null) result.participantName = participantName;
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  CreateIngressReq._();

  factory CreateIngressReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateIngressReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateIngressReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aE<IngressInput>(1, _omitFieldNames ? '' : 'inputType',
        enumValues: IngressInput.values)
    ..aOS(2, _omitFieldNames ? '' : 'participantName')
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateIngressReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateIngressReq copyWith(void Function(CreateIngressReq) updates) =>
      super.copyWith((message) => updates(message as CreateIngressReq))
          as CreateIngressReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateIngressReq create() => CreateIngressReq._();
  @$core.override
  CreateIngressReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateIngressReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateIngressReq>(create);
  static CreateIngressReq? _defaultInstance;

  @$pb.TagNumber(1)
  IngressInput get inputType => $_getN(0);
  @$pb.TagNumber(1)
  set inputType(IngressInput value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInputType() => $_has(0);
  @$pb.TagNumber(1)
  void clearInputType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get participantName => $_getSZ(1);
  @$pb.TagNumber(2)
  set participantName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasParticipantName() => $_has(1);
  @$pb.TagNumber(2)
  void clearParticipantName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => $_clearField(3);
}

class CreateIngressRes extends $pb.GeneratedMessage {
  factory CreateIngressRes({
    $core.bool? status,
    $core.String? msg,
    IngressInput? inputType,
    $core.String? url,
    $core.String? streamKey,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (inputType != null) result.inputType = inputType;
    if (url != null) result.url = url;
    if (streamKey != null) result.streamKey = streamKey;
    return result;
  }

  CreateIngressRes._();

  factory CreateIngressRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateIngressRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateIngressRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aE<IngressInput>(3, _omitFieldNames ? '' : 'inputType',
        enumValues: IngressInput.values)
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..aOS(5, _omitFieldNames ? '' : 'streamKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateIngressRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateIngressRes copyWith(void Function(CreateIngressRes) updates) =>
      super.copyWith((message) => updates(message as CreateIngressRes))
          as CreateIngressRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateIngressRes create() => CreateIngressRes._();
  @$core.override
  CreateIngressRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateIngressRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateIngressRes>(create);
  static CreateIngressRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => $_clearField(2);

  @$pb.TagNumber(3)
  IngressInput get inputType => $_getN(2);
  @$pb.TagNumber(3)
  set inputType(IngressInput value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasInputType() => $_has(2);
  @$pb.TagNumber(3)
  void clearInputType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get streamKey => $_getSZ(4);
  @$pb.TagNumber(5)
  set streamKey($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStreamKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearStreamKey() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
