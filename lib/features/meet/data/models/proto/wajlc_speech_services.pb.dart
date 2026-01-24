// This is a generated file - do not edit.
//
// Generated from wajlc_speech_services.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_speech_services.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'wajlc_speech_services.pbenum.dart';

class SpeechToTextTranslationReq extends $pb.GeneratedMessage {
  factory SpeechToTextTranslationReq({
    $core.String? roomId,
    $core.bool? isEnabled,
    $core.Iterable<$core.String>? allowedSpeechLangs,
    $core.Iterable<$core.String>? allowedSpeechUsers,
    $core.bool? isEnabledTranslation,
    $core.Iterable<$core.String>? allowedTransLangs,
    $core.String? defaultSubtitleLang,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (isEnabled != null) result.isEnabled = isEnabled;
    if (allowedSpeechLangs != null)
      result.allowedSpeechLangs.addAll(allowedSpeechLangs);
    if (allowedSpeechUsers != null)
      result.allowedSpeechUsers.addAll(allowedSpeechUsers);
    if (isEnabledTranslation != null)
      result.isEnabledTranslation = isEnabledTranslation;
    if (allowedTransLangs != null)
      result.allowedTransLangs.addAll(allowedTransLangs);
    if (defaultSubtitleLang != null)
      result.defaultSubtitleLang = defaultSubtitleLang;
    return result;
  }

  SpeechToTextTranslationReq._();

  factory SpeechToTextTranslationReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpeechToTextTranslationReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpeechToTextTranslationReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOB(3, _omitFieldNames ? '' : 'isEnabled')
    ..pPS(4, _omitFieldNames ? '' : 'allowedSpeechLangs')
    ..pPS(5, _omitFieldNames ? '' : 'allowedSpeechUsers')
    ..aOB(6, _omitFieldNames ? '' : 'isEnabledTranslation')
    ..pPS(7, _omitFieldNames ? '' : 'allowedTransLangs')
    ..aOS(8, _omitFieldNames ? '' : 'defaultSubtitleLang')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToTextTranslationReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToTextTranslationReq copyWith(
          void Function(SpeechToTextTranslationReq) updates) =>
      super.copyWith(
              (message) => updates(message as SpeechToTextTranslationReq))
          as SpeechToTextTranslationReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechToTextTranslationReq create() => SpeechToTextTranslationReq._();
  @$core.override
  SpeechToTextTranslationReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SpeechToTextTranslationReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeechToTextTranslationReq>(create);
  static SpeechToTextTranslationReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.bool get isEnabled => $_getBF(1);
  @$pb.TagNumber(3)
  set isEnabled($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(3)
  $core.bool hasIsEnabled() => $_has(1);
  @$pb.TagNumber(3)
  void clearIsEnabled() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get allowedSpeechLangs => $_getList(2);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get allowedSpeechUsers => $_getList(3);

  @$pb.TagNumber(6)
  $core.bool get isEnabledTranslation => $_getBF(4);
  @$pb.TagNumber(6)
  set isEnabledTranslation($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(6)
  $core.bool hasIsEnabledTranslation() => $_has(4);
  @$pb.TagNumber(6)
  void clearIsEnabledTranslation() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get allowedTransLangs => $_getList(5);

  @$pb.TagNumber(8)
  $core.String get defaultSubtitleLang => $_getSZ(6);
  @$pb.TagNumber(8)
  set defaultSubtitleLang($core.String value) => $_setString(6, value);
  @$pb.TagNumber(8)
  $core.bool hasDefaultSubtitleLang() => $_has(6);
  @$pb.TagNumber(8)
  void clearDefaultSubtitleLang() => $_clearField(8);
}

class GenerateAzureTokenReq extends $pb.GeneratedMessage {
  factory GenerateAzureTokenReq({
    $core.String? roomId,
    $core.String? userSid,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (userSid != null) result.userSid = userSid;
    return result;
  }

  GenerateAzureTokenReq._();

  factory GenerateAzureTokenReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateAzureTokenReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateAzureTokenReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'userSid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateAzureTokenReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateAzureTokenReq copyWith(
          void Function(GenerateAzureTokenReq) updates) =>
      super.copyWith((message) => updates(message as GenerateAzureTokenReq))
          as GenerateAzureTokenReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateAzureTokenReq create() => GenerateAzureTokenReq._();
  @$core.override
  GenerateAzureTokenReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateAzureTokenReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateAzureTokenReq>(create);
  static GenerateAzureTokenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userSid => $_getSZ(1);
  @$pb.TagNumber(2)
  set userSid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserSid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserSid() => $_clearField(2);
}

class GenerateAzureTokenRes extends $pb.GeneratedMessage {
  factory GenerateAzureTokenRes({
    $core.bool? status,
    $core.String? msg,
    $core.String? token,
    $core.String? serviceRegion,
    $core.String? keyId,
    $core.bool? renew,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (token != null) result.token = token;
    if (serviceRegion != null) result.serviceRegion = serviceRegion;
    if (keyId != null) result.keyId = keyId;
    if (renew != null) result.renew = renew;
    return result;
  }

  GenerateAzureTokenRes._();

  factory GenerateAzureTokenRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateAzureTokenRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateAzureTokenRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..aOS(4, _omitFieldNames ? '' : 'serviceRegion')
    ..aOS(5, _omitFieldNames ? '' : 'keyId')
    ..aOB(6, _omitFieldNames ? '' : 'renew')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateAzureTokenRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateAzureTokenRes copyWith(
          void Function(GenerateAzureTokenRes) updates) =>
      super.copyWith((message) => updates(message as GenerateAzureTokenRes))
          as GenerateAzureTokenRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateAzureTokenRes create() => GenerateAzureTokenRes._();
  @$core.override
  GenerateAzureTokenRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateAzureTokenRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateAzureTokenRes>(create);
  static GenerateAzureTokenRes? _defaultInstance;

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
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get serviceRegion => $_getSZ(3);
  @$pb.TagNumber(4)
  set serviceRegion($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasServiceRegion() => $_has(3);
  @$pb.TagNumber(4)
  void clearServiceRegion() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get keyId => $_getSZ(4);
  @$pb.TagNumber(5)
  set keyId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasKeyId() => $_has(4);
  @$pb.TagNumber(5)
  void clearKeyId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get renew => $_getBF(5);
  @$pb.TagNumber(6)
  set renew($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRenew() => $_has(5);
  @$pb.TagNumber(6)
  void clearRenew() => $_clearField(6);
}

class AzureTokenRenewReq extends $pb.GeneratedMessage {
  factory AzureTokenRenewReq({
    $core.String? roomId,
    $core.String? userSid,
    $core.String? serviceRegion,
    $core.String? keyId,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (userSid != null) result.userSid = userSid;
    if (serviceRegion != null) result.serviceRegion = serviceRegion;
    if (keyId != null) result.keyId = keyId;
    return result;
  }

  AzureTokenRenewReq._();

  factory AzureTokenRenewReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AzureTokenRenewReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AzureTokenRenewReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'userSid')
    ..aOS(3, _omitFieldNames ? '' : 'serviceRegion')
    ..aOS(4, _omitFieldNames ? '' : 'keyId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AzureTokenRenewReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AzureTokenRenewReq copyWith(void Function(AzureTokenRenewReq) updates) =>
      super.copyWith((message) => updates(message as AzureTokenRenewReq))
          as AzureTokenRenewReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AzureTokenRenewReq create() => AzureTokenRenewReq._();
  @$core.override
  AzureTokenRenewReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AzureTokenRenewReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AzureTokenRenewReq>(create);
  static AzureTokenRenewReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userSid => $_getSZ(1);
  @$pb.TagNumber(2)
  set userSid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserSid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserSid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get serviceRegion => $_getSZ(2);
  @$pb.TagNumber(3)
  set serviceRegion($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasServiceRegion() => $_has(2);
  @$pb.TagNumber(3)
  void clearServiceRegion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get keyId => $_getSZ(3);
  @$pb.TagNumber(4)
  set keyId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasKeyId() => $_has(3);
  @$pb.TagNumber(4)
  void clearKeyId() => $_clearField(4);
}

class SpeechServiceUserStatusReq extends $pb.GeneratedMessage {
  factory SpeechServiceUserStatusReq({
    $core.String? roomId,
    $core.String? roomSid,
    $core.String? userId,
    $core.String? keyId,
    SpeechServiceUserStatusTasks? task,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (roomSid != null) result.roomSid = roomSid;
    if (userId != null) result.userId = userId;
    if (keyId != null) result.keyId = keyId;
    if (task != null) result.task = task;
    return result;
  }

  SpeechServiceUserStatusReq._();

  factory SpeechServiceUserStatusReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpeechServiceUserStatusReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpeechServiceUserStatusReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'roomSid')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'keyId')
    ..aE<SpeechServiceUserStatusTasks>(5, _omitFieldNames ? '' : 'task',
        enumValues: SpeechServiceUserStatusTasks.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechServiceUserStatusReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechServiceUserStatusReq copyWith(
          void Function(SpeechServiceUserStatusReq) updates) =>
      super.copyWith(
              (message) => updates(message as SpeechServiceUserStatusReq))
          as SpeechServiceUserStatusReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechServiceUserStatusReq create() => SpeechServiceUserStatusReq._();
  @$core.override
  SpeechServiceUserStatusReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SpeechServiceUserStatusReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeechServiceUserStatusReq>(create);
  static SpeechServiceUserStatusReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomSid => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomSid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomSid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomSid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get keyId => $_getSZ(3);
  @$pb.TagNumber(4)
  set keyId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasKeyId() => $_has(3);
  @$pb.TagNumber(4)
  void clearKeyId() => $_clearField(4);

  @$pb.TagNumber(5)
  SpeechServiceUserStatusTasks get task => $_getN(4);
  @$pb.TagNumber(5)
  set task(SpeechServiceUserStatusTasks value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTask() => $_has(4);
  @$pb.TagNumber(5)
  void clearTask() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
