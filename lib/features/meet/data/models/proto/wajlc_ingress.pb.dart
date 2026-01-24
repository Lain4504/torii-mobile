//
//  Generated code. Do not modify.
//  source: wajlc_ingress.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_ingress.pbenum.dart';

export 'wajlc_ingress.pbenum.dart';

class CreateIngressReq extends $pb.GeneratedMessage {
  factory CreateIngressReq({
    IngressInput? inputType,
    $core.String? participantName,
    $core.String? roomId,
  }) {
    final $result = create();
    if (inputType != null) {
      $result.inputType = inputType;
    }
    if (participantName != null) {
      $result.participantName = participantName;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    return $result;
  }
  CreateIngressReq._() : super();
  factory CreateIngressReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateIngressReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateIngressReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..e<IngressInput>(1, _omitFieldNames ? '' : 'inputType', $pb.PbFieldType.OE, defaultOrMaker: IngressInput.RTMP_INPUT, valueOf: IngressInput.valueOf, enumValues: IngressInput.values)
    ..aOS(2, _omitFieldNames ? '' : 'participantName')
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateIngressReq clone() => CreateIngressReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateIngressReq copyWith(void Function(CreateIngressReq) updates) => super.copyWith((message) => updates(message as CreateIngressReq)) as CreateIngressReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateIngressReq create() => CreateIngressReq._();
  CreateIngressReq createEmptyInstance() => create();
  static $pb.PbList<CreateIngressReq> createRepeated() => $pb.PbList<CreateIngressReq>();
  @$core.pragma('dart2js:noInline')
  static CreateIngressReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateIngressReq>(create);
  static CreateIngressReq? _defaultInstance;

  @$pb.TagNumber(1)
  IngressInput get inputType => $_getN(0);
  @$pb.TagNumber(1)
  set inputType(IngressInput v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInputType() => $_has(0);
  @$pb.TagNumber(1)
  void clearInputType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get participantName => $_getSZ(1);
  @$pb.TagNumber(2)
  set participantName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParticipantName() => $_has(1);
  @$pb.TagNumber(2)
  void clearParticipantName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => clearField(3);
}

class CreateIngressRes extends $pb.GeneratedMessage {
  factory CreateIngressRes({
    $core.bool? status,
    $core.String? msg,
    IngressInput? inputType,
    $core.String? url,
    $core.String? streamKey,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (inputType != null) {
      $result.inputType = inputType;
    }
    if (url != null) {
      $result.url = url;
    }
    if (streamKey != null) {
      $result.streamKey = streamKey;
    }
    return $result;
  }
  CreateIngressRes._() : super();
  factory CreateIngressRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateIngressRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateIngressRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..e<IngressInput>(3, _omitFieldNames ? '' : 'inputType', $pb.PbFieldType.OE, defaultOrMaker: IngressInput.RTMP_INPUT, valueOf: IngressInput.valueOf, enumValues: IngressInput.values)
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..aOS(5, _omitFieldNames ? '' : 'streamKey')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateIngressRes clone() => CreateIngressRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateIngressRes copyWith(void Function(CreateIngressRes) updates) => super.copyWith((message) => updates(message as CreateIngressRes)) as CreateIngressRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateIngressRes create() => CreateIngressRes._();
  CreateIngressRes createEmptyInstance() => create();
  static $pb.PbList<CreateIngressRes> createRepeated() => $pb.PbList<CreateIngressRes>();
  @$core.pragma('dart2js:noInline')
  static CreateIngressRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateIngressRes>(create);
  static CreateIngressRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  IngressInput get inputType => $_getN(2);
  @$pb.TagNumber(3)
  set inputType(IngressInput v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasInputType() => $_has(2);
  @$pb.TagNumber(3)
  void clearInputType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get streamKey => $_getSZ(4);
  @$pb.TagNumber(5)
  set streamKey($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStreamKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearStreamKey() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
