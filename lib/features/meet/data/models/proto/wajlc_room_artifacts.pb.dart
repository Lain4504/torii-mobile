// This is a generated file - do not edit.
//
// Generated from wajlc_room_artifacts.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_room_artifacts.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'wajlc_room_artifacts.pbenum.dart';

/// FileInfo contains details about a generated file artifact.
class RoomArtifactFileInfo extends $pb.GeneratedMessage {
  factory RoomArtifactFileInfo({
    $core.String? filePath,
    $fixnum.Int64? fileSize,
    $core.String? mimeType,
  }) {
    final result = create();
    if (filePath != null) result.filePath = filePath;
    if (fileSize != null) result.fileSize = fileSize;
    if (mimeType != null) result.mimeType = mimeType;
    return result;
  }

  RoomArtifactFileInfo._();

  factory RoomArtifactFileInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomArtifactFileInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomArtifactFileInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'filePath')
    ..aInt64(2, _omitFieldNames ? '' : 'fileSize')
    ..aOS(3, _omitFieldNames ? '' : 'mimeType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactFileInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactFileInfo copyWith(void Function(RoomArtifactFileInfo) updates) =>
      super.copyWith((message) => updates(message as RoomArtifactFileInfo))
          as RoomArtifactFileInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactFileInfo create() => RoomArtifactFileInfo._();
  @$core.override
  RoomArtifactFileInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactFileInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomArtifactFileInfo>(create);
  static RoomArtifactFileInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filePath => $_getSZ(0);
  @$pb.TagNumber(1)
  set filePath($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFilePath() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilePath() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get fileSize => $_getI64(1);
  @$pb.TagNumber(2)
  set fileSize($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFileSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileSize() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get mimeType => $_getSZ(2);
  @$pb.TagNumber(3)
  set mimeType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMimeType() => $_has(2);
  @$pb.TagNumber(3)
  void clearMimeType() => $_clearField(3);
}

/// ProviderJobInfo contains details about an asynchronous job sent to a provider.
class RoomArtifactProviderJobInfo extends $pb.GeneratedMessage {
  factory RoomArtifactProviderJobInfo({
    $core.String? jobId,
    $core.String? fileName,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (fileName != null) result.fileName = fileName;
    return result;
  }

  RoomArtifactProviderJobInfo._();

  factory RoomArtifactProviderJobInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomArtifactProviderJobInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomArtifactProviderJobInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aOS(2, _omitFieldNames ? '' : 'fileName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactProviderJobInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactProviderJobInfo copyWith(
          void Function(RoomArtifactProviderJobInfo) updates) =>
      super.copyWith(
              (message) => updates(message as RoomArtifactProviderJobInfo))
          as RoomArtifactProviderJobInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactProviderJobInfo create() =>
      RoomArtifactProviderJobInfo._();
  @$core.override
  RoomArtifactProviderJobInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactProviderJobInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomArtifactProviderJobInfo>(create);
  static RoomArtifactProviderJobInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => $_clearField(2);
}

/// UserInfo contains details about the user associated with an artifact.
class RoomArtifactUserInfo extends $pb.GeneratedMessage {
  factory RoomArtifactUserInfo({
    $core.String? userId,
    $core.String? name,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (name != null) result.name = name;
    return result;
  }

  RoomArtifactUserInfo._();

  factory RoomArtifactUserInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomArtifactUserInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomArtifactUserInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactUserInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactUserInfo copyWith(void Function(RoomArtifactUserInfo) updates) =>
      super.copyWith((message) => updates(message as RoomArtifactUserInfo))
          as RoomArtifactUserInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactUserInfo create() => RoomArtifactUserInfo._();
  @$core.override
  RoomArtifactUserInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomArtifactUserInfo>(create);
  static RoomArtifactUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
}

class RoomArtifactTokenUsage extends $pb.GeneratedMessage {
  factory RoomArtifactTokenUsage({
    $core.int? promptTokens,
    $core.int? completionTokens,
    $core.int? totalTokens,
    $core.Iterable<$core.MapEntry<$core.String, $fixnum.Int64>>? breakdown,
    $core.double? promptTokensEstimatedCost,
    $core.double? completionTokensEstimatedCost,
    $core.double? totalTokensEstimatedCost,
  }) {
    final result = create();
    if (promptTokens != null) result.promptTokens = promptTokens;
    if (completionTokens != null) result.completionTokens = completionTokens;
    if (totalTokens != null) result.totalTokens = totalTokens;
    if (breakdown != null) result.breakdown.addEntries(breakdown);
    if (promptTokensEstimatedCost != null)
      result.promptTokensEstimatedCost = promptTokensEstimatedCost;
    if (completionTokensEstimatedCost != null)
      result.completionTokensEstimatedCost = completionTokensEstimatedCost;
    if (totalTokensEstimatedCost != null)
      result.totalTokensEstimatedCost = totalTokensEstimatedCost;
    return result;
  }

  RoomArtifactTokenUsage._();

  factory RoomArtifactTokenUsage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomArtifactTokenUsage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomArtifactTokenUsage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'promptTokens',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'completionTokens',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'totalTokens',
        fieldType: $pb.PbFieldType.OU3)
    ..m<$core.String, $fixnum.Int64>(4, _omitFieldNames ? '' : 'breakdown',
        entryClassName: 'RoomArtifactTokenUsage.BreakdownEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O6,
        packageName: const $pb.PackageName('wajlc'))
    ..aD(5, _omitFieldNames ? '' : 'promptTokensEstimatedCost')
    ..aD(6, _omitFieldNames ? '' : 'completionTokensEstimatedCost')
    ..aD(7, _omitFieldNames ? '' : 'totalTokensEstimatedCost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactTokenUsage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactTokenUsage copyWith(
          void Function(RoomArtifactTokenUsage) updates) =>
      super.copyWith((message) => updates(message as RoomArtifactTokenUsage))
          as RoomArtifactTokenUsage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactTokenUsage create() => RoomArtifactTokenUsage._();
  @$core.override
  RoomArtifactTokenUsage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactTokenUsage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomArtifactTokenUsage>(create);
  static RoomArtifactTokenUsage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get promptTokens => $_getIZ(0);
  @$pb.TagNumber(1)
  set promptTokens($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPromptTokens() => $_has(0);
  @$pb.TagNumber(1)
  void clearPromptTokens() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get completionTokens => $_getIZ(1);
  @$pb.TagNumber(2)
  set completionTokens($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCompletionTokens() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompletionTokens() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalTokens => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalTokens($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalTokens() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalTokens() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbMap<$core.String, $fixnum.Int64> get breakdown => $_getMap(3);

  @$pb.TagNumber(5)
  $core.double get promptTokensEstimatedCost => $_getN(4);
  @$pb.TagNumber(5)
  set promptTokensEstimatedCost($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPromptTokensEstimatedCost() => $_has(4);
  @$pb.TagNumber(5)
  void clearPromptTokensEstimatedCost() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get completionTokensEstimatedCost => $_getN(5);
  @$pb.TagNumber(6)
  set completionTokensEstimatedCost($core.double value) =>
      $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCompletionTokensEstimatedCost() => $_has(5);
  @$pb.TagNumber(6)
  void clearCompletionTokensEstimatedCost() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get totalTokensEstimatedCost => $_getN(6);
  @$pb.TagNumber(7)
  set totalTokensEstimatedCost($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTotalTokensEstimatedCost() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalTokensEstimatedCost() => $_clearField(7);
}

class RoomArtifactDurationUsage extends $pb.GeneratedMessage {
  factory RoomArtifactDurationUsage({
    $core.int? durationSec,
    $core.Iterable<$core.MapEntry<$core.String, $fixnum.Int64>>? breakdown,
    $core.double? durationSecEstimatedCost,
  }) {
    final result = create();
    if (durationSec != null) result.durationSec = durationSec;
    if (breakdown != null) result.breakdown.addEntries(breakdown);
    if (durationSecEstimatedCost != null)
      result.durationSecEstimatedCost = durationSecEstimatedCost;
    return result;
  }

  RoomArtifactDurationUsage._();

  factory RoomArtifactDurationUsage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomArtifactDurationUsage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomArtifactDurationUsage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'durationSec',
        fieldType: $pb.PbFieldType.OU3)
    ..m<$core.String, $fixnum.Int64>(2, _omitFieldNames ? '' : 'breakdown',
        entryClassName: 'RoomArtifactDurationUsage.BreakdownEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O6,
        packageName: const $pb.PackageName('wajlc'))
    ..aD(3, _omitFieldNames ? '' : 'durationSecEstimatedCost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactDurationUsage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactDurationUsage copyWith(
          void Function(RoomArtifactDurationUsage) updates) =>
      super.copyWith((message) => updates(message as RoomArtifactDurationUsage))
          as RoomArtifactDurationUsage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactDurationUsage create() => RoomArtifactDurationUsage._();
  @$core.override
  RoomArtifactDurationUsage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactDurationUsage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomArtifactDurationUsage>(create);
  static RoomArtifactDurationUsage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get durationSec => $_getIZ(0);
  @$pb.TagNumber(1)
  set durationSec($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDurationSec() => $_has(0);
  @$pb.TagNumber(1)
  void clearDurationSec() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $fixnum.Int64> get breakdown => $_getMap(1);

  @$pb.TagNumber(3)
  $core.double get durationSecEstimatedCost => $_getN(2);
  @$pb.TagNumber(3)
  set durationSecEstimatedCost($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDurationSecEstimatedCost() => $_has(2);
  @$pb.TagNumber(3)
  void clearDurationSecEstimatedCost() => $_clearField(3);
}

class RoomArtifactCharacterCountUsage extends $pb.GeneratedMessage {
  factory RoomArtifactCharacterCountUsage({
    $core.int? totalCharacters,
    $core.Iterable<$core.MapEntry<$core.String, $fixnum.Int64>>? breakdown,
    $core.double? totalCharactersEstimatedCost,
  }) {
    final result = create();
    if (totalCharacters != null) result.totalCharacters = totalCharacters;
    if (breakdown != null) result.breakdown.addEntries(breakdown);
    if (totalCharactersEstimatedCost != null)
      result.totalCharactersEstimatedCost = totalCharactersEstimatedCost;
    return result;
  }

  RoomArtifactCharacterCountUsage._();

  factory RoomArtifactCharacterCountUsage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomArtifactCharacterCountUsage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomArtifactCharacterCountUsage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'totalCharacters',
        fieldType: $pb.PbFieldType.OU3)
    ..m<$core.String, $fixnum.Int64>(2, _omitFieldNames ? '' : 'breakdown',
        entryClassName: 'RoomArtifactCharacterCountUsage.BreakdownEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O6,
        packageName: const $pb.PackageName('wajlc'))
    ..aD(3, _omitFieldNames ? '' : 'totalCharactersEstimatedCost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactCharacterCountUsage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactCharacterCountUsage copyWith(
          void Function(RoomArtifactCharacterCountUsage) updates) =>
      super.copyWith(
              (message) => updates(message as RoomArtifactCharacterCountUsage))
          as RoomArtifactCharacterCountUsage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactCharacterCountUsage create() =>
      RoomArtifactCharacterCountUsage._();
  @$core.override
  RoomArtifactCharacterCountUsage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactCharacterCountUsage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomArtifactCharacterCountUsage>(
          create);
  static RoomArtifactCharacterCountUsage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalCharacters => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalCharacters($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalCharacters() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalCharacters() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $fixnum.Int64> get breakdown => $_getMap(1);

  @$pb.TagNumber(3)
  $core.double get totalCharactersEstimatedCost => $_getN(2);
  @$pb.TagNumber(3)
  set totalCharactersEstimatedCost($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalCharactersEstimatedCost() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalCharactersEstimatedCost() => $_clearField(3);
}

enum RoomArtifactMetadata_UsageDetails {
  tokenUsage,
  durationUsage,
  characterCountUsage,
  notSet
}

/// RoomArtifactMetadata is the universal structure for the 'metadata' JSON field
/// in the wajlc_room_artifacts table. All fields are optional.
class RoomArtifactMetadata extends $pb.GeneratedMessage {
  factory RoomArtifactMetadata({
    RoomArtifactUserInfo? userInfo,
    RoomArtifactProviderJobInfo? providerJobInfo,
    RoomArtifactFileInfo? fileInfo,
    RoomArtifactTokenUsage? tokenUsage,
    RoomArtifactDurationUsage? durationUsage,
    RoomArtifactCharacterCountUsage? characterCountUsage,
    $core.String? referenceArtifactId,
  }) {
    final result = create();
    if (userInfo != null) result.userInfo = userInfo;
    if (providerJobInfo != null) result.providerJobInfo = providerJobInfo;
    if (fileInfo != null) result.fileInfo = fileInfo;
    if (tokenUsage != null) result.tokenUsage = tokenUsage;
    if (durationUsage != null) result.durationUsage = durationUsage;
    if (characterCountUsage != null)
      result.characterCountUsage = characterCountUsage;
    if (referenceArtifactId != null)
      result.referenceArtifactId = referenceArtifactId;
    return result;
  }

  RoomArtifactMetadata._();

  factory RoomArtifactMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomArtifactMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, RoomArtifactMetadata_UsageDetails>
      _RoomArtifactMetadata_UsageDetailsByTag = {
    4: RoomArtifactMetadata_UsageDetails.tokenUsage,
    5: RoomArtifactMetadata_UsageDetails.durationUsage,
    6: RoomArtifactMetadata_UsageDetails.characterCountUsage,
    0: RoomArtifactMetadata_UsageDetails.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomArtifactMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..oo(0, [4, 5, 6])
    ..aOM<RoomArtifactUserInfo>(1, _omitFieldNames ? '' : 'userInfo',
        subBuilder: RoomArtifactUserInfo.create)
    ..aOM<RoomArtifactProviderJobInfo>(
        2, _omitFieldNames ? '' : 'providerJobInfo',
        subBuilder: RoomArtifactProviderJobInfo.create)
    ..aOM<RoomArtifactFileInfo>(3, _omitFieldNames ? '' : 'fileInfo',
        subBuilder: RoomArtifactFileInfo.create)
    ..aOM<RoomArtifactTokenUsage>(4, _omitFieldNames ? '' : 'tokenUsage',
        subBuilder: RoomArtifactTokenUsage.create)
    ..aOM<RoomArtifactDurationUsage>(5, _omitFieldNames ? '' : 'durationUsage',
        subBuilder: RoomArtifactDurationUsage.create)
    ..aOM<RoomArtifactCharacterCountUsage>(
        6, _omitFieldNames ? '' : 'characterCountUsage',
        subBuilder: RoomArtifactCharacterCountUsage.create)
    ..aOS(10, _omitFieldNames ? '' : 'referenceArtifactId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactMetadata copyWith(void Function(RoomArtifactMetadata) updates) =>
      super.copyWith((message) => updates(message as RoomArtifactMetadata))
          as RoomArtifactMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactMetadata create() => RoomArtifactMetadata._();
  @$core.override
  RoomArtifactMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomArtifactMetadata>(create);
  static RoomArtifactMetadata? _defaultInstance;

  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  RoomArtifactMetadata_UsageDetails whichUsageDetails() =>
      _RoomArtifactMetadata_UsageDetailsByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  void clearUsageDetails() => $_clearField($_whichOneof(0));

  /// Optional: Information about the user who initiated or is associated with the artifact.
  @$pb.TagNumber(1)
  RoomArtifactUserInfo get userInfo => $_getN(0);
  @$pb.TagNumber(1)
  set userInfo(RoomArtifactUserInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUserInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  RoomArtifactUserInfo ensureUserInfo() => $_ensure(0);

  /// Optional: Information about an asynchronous provider job.
  @$pb.TagNumber(2)
  RoomArtifactProviderJobInfo get providerJobInfo => $_getN(1);
  @$pb.TagNumber(2)
  set providerJobInfo(RoomArtifactProviderJobInfo value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProviderJobInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearProviderJobInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  RoomArtifactProviderJobInfo ensureProviderJobInfo() => $_ensure(1);

  /// Optional: Information about the final generated file artifact.
  @$pb.TagNumber(3)
  RoomArtifactFileInfo get fileInfo => $_getN(2);
  @$pb.TagNumber(3)
  set fileInfo(RoomArtifactFileInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFileInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  RoomArtifactFileInfo ensureFileInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  RoomArtifactTokenUsage get tokenUsage => $_getN(3);
  @$pb.TagNumber(4)
  set tokenUsage(RoomArtifactTokenUsage value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTokenUsage() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenUsage() => $_clearField(4);
  @$pb.TagNumber(4)
  RoomArtifactTokenUsage ensureTokenUsage() => $_ensure(3);

  @$pb.TagNumber(5)
  RoomArtifactDurationUsage get durationUsage => $_getN(4);
  @$pb.TagNumber(5)
  set durationUsage(RoomArtifactDurationUsage value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDurationUsage() => $_has(4);
  @$pb.TagNumber(5)
  void clearDurationUsage() => $_clearField(5);
  @$pb.TagNumber(5)
  RoomArtifactDurationUsage ensureDurationUsage() => $_ensure(4);

  @$pb.TagNumber(6)
  RoomArtifactCharacterCountUsage get characterCountUsage => $_getN(5);
  @$pb.TagNumber(6)
  set characterCountUsage(RoomArtifactCharacterCountUsage value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCharacterCountUsage() => $_has(5);
  @$pb.TagNumber(6)
  void clearCharacterCountUsage() => $_clearField(6);
  @$pb.TagNumber(6)
  RoomArtifactCharacterCountUsage ensureCharacterCountUsage() => $_ensure(5);

  /// A field to link a file artifact back to its usage artifact.
  @$pb.TagNumber(10)
  $core.String get referenceArtifactId => $_getSZ(6);
  @$pb.TagNumber(10)
  set referenceArtifactId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(10)
  $core.bool hasReferenceArtifactId() => $_has(6);
  @$pb.TagNumber(10)
  void clearReferenceArtifactId() => $_clearField(10);
}

/// Webhook-specific Messages
class RoomArtifactWebhookEvent extends $pb.GeneratedMessage {
  factory RoomArtifactWebhookEvent({
    RoomArtifactType? type,
    $core.String? artifactId,
    RoomArtifactMetadata? metadata,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (artifactId != null) result.artifactId = artifactId;
    if (metadata != null) result.metadata = metadata;
    return result;
  }

  RoomArtifactWebhookEvent._();

  factory RoomArtifactWebhookEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomArtifactWebhookEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomArtifactWebhookEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aE<RoomArtifactType>(1, _omitFieldNames ? '' : 'type',
        enumValues: RoomArtifactType.values)
    ..aOS(2, _omitFieldNames ? '' : 'artifactId')
    ..aOM<RoomArtifactMetadata>(3, _omitFieldNames ? '' : 'metadata',
        subBuilder: RoomArtifactMetadata.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactWebhookEvent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomArtifactWebhookEvent copyWith(
          void Function(RoomArtifactWebhookEvent) updates) =>
      super.copyWith((message) => updates(message as RoomArtifactWebhookEvent))
          as RoomArtifactWebhookEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactWebhookEvent create() => RoomArtifactWebhookEvent._();
  @$core.override
  RoomArtifactWebhookEvent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactWebhookEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomArtifactWebhookEvent>(create);
  static RoomArtifactWebhookEvent? _defaultInstance;

  @$pb.TagNumber(1)
  RoomArtifactType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(RoomArtifactType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get artifactId => $_getSZ(1);
  @$pb.TagNumber(2)
  set artifactId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasArtifactId() => $_has(1);
  @$pb.TagNumber(2)
  void clearArtifactId() => $_clearField(2);

  @$pb.TagNumber(3)
  RoomArtifactMetadata get metadata => $_getN(2);
  @$pb.TagNumber(3)
  set metadata(RoomArtifactMetadata value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearMetadata() => $_clearField(3);
  @$pb.TagNumber(3)
  RoomArtifactMetadata ensureMetadata() => $_ensure(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
