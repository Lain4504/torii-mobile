//
//  Generated code. Do not modify.
//  source: wajlc_room_artifacts.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_room_artifacts.pbenum.dart';

export 'wajlc_room_artifacts.pbenum.dart';

/// FileInfo contains details about a generated file artifact.
class RoomArtifactFileInfo extends $pb.GeneratedMessage {
  factory RoomArtifactFileInfo({
    $core.String? filePath,
    $fixnum.Int64? fileSize,
    $core.String? mimeType,
  }) {
    final $result = create();
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (fileSize != null) {
      $result.fileSize = fileSize;
    }
    if (mimeType != null) {
      $result.mimeType = mimeType;
    }
    return $result;
  }
  RoomArtifactFileInfo._() : super();
  factory RoomArtifactFileInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomArtifactFileInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomArtifactFileInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'filePath')
    ..aInt64(2, _omitFieldNames ? '' : 'fileSize')
    ..aOS(3, _omitFieldNames ? '' : 'mimeType')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomArtifactFileInfo clone() => RoomArtifactFileInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomArtifactFileInfo copyWith(void Function(RoomArtifactFileInfo) updates) => super.copyWith((message) => updates(message as RoomArtifactFileInfo)) as RoomArtifactFileInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactFileInfo create() => RoomArtifactFileInfo._();
  RoomArtifactFileInfo createEmptyInstance() => create();
  static $pb.PbList<RoomArtifactFileInfo> createRepeated() => $pb.PbList<RoomArtifactFileInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactFileInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomArtifactFileInfo>(create);
  static RoomArtifactFileInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filePath => $_getSZ(0);
  @$pb.TagNumber(1)
  set filePath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilePath() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilePath() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get fileSize => $_getI64(1);
  @$pb.TagNumber(2)
  set fileSize($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileSize() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mimeType => $_getSZ(2);
  @$pb.TagNumber(3)
  set mimeType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMimeType() => $_has(2);
  @$pb.TagNumber(3)
  void clearMimeType() => clearField(3);
}

/// ProviderJobInfo contains details about an asynchronous job sent to a provider.
class RoomArtifactProviderJobInfo extends $pb.GeneratedMessage {
  factory RoomArtifactProviderJobInfo({
    $core.String? jobId,
    $core.String? fileName,
  }) {
    final $result = create();
    if (jobId != null) {
      $result.jobId = jobId;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    return $result;
  }
  RoomArtifactProviderJobInfo._() : super();
  factory RoomArtifactProviderJobInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomArtifactProviderJobInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomArtifactProviderJobInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aOS(2, _omitFieldNames ? '' : 'fileName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomArtifactProviderJobInfo clone() => RoomArtifactProviderJobInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomArtifactProviderJobInfo copyWith(void Function(RoomArtifactProviderJobInfo) updates) => super.copyWith((message) => updates(message as RoomArtifactProviderJobInfo)) as RoomArtifactProviderJobInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactProviderJobInfo create() => RoomArtifactProviderJobInfo._();
  RoomArtifactProviderJobInfo createEmptyInstance() => create();
  static $pb.PbList<RoomArtifactProviderJobInfo> createRepeated() => $pb.PbList<RoomArtifactProviderJobInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactProviderJobInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomArtifactProviderJobInfo>(create);
  static RoomArtifactProviderJobInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => clearField(2);
}

/// UserInfo contains details about the user associated with an artifact.
class RoomArtifactUserInfo extends $pb.GeneratedMessage {
  factory RoomArtifactUserInfo({
    $core.String? userId,
    $core.String? name,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  RoomArtifactUserInfo._() : super();
  factory RoomArtifactUserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomArtifactUserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomArtifactUserInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomArtifactUserInfo clone() => RoomArtifactUserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomArtifactUserInfo copyWith(void Function(RoomArtifactUserInfo) updates) => super.copyWith((message) => updates(message as RoomArtifactUserInfo)) as RoomArtifactUserInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactUserInfo create() => RoomArtifactUserInfo._();
  RoomArtifactUserInfo createEmptyInstance() => create();
  static $pb.PbList<RoomArtifactUserInfo> createRepeated() => $pb.PbList<RoomArtifactUserInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactUserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomArtifactUserInfo>(create);
  static RoomArtifactUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class RoomArtifactTokenUsage extends $pb.GeneratedMessage {
  factory RoomArtifactTokenUsage({
    $core.int? promptTokens,
    $core.int? completionTokens,
    $core.int? totalTokens,
    $core.Map<$core.String, $fixnum.Int64>? breakdown,
    $core.double? promptTokensEstimatedCost,
    $core.double? completionTokensEstimatedCost,
    $core.double? totalTokensEstimatedCost,
  }) {
    final $result = create();
    if (promptTokens != null) {
      $result.promptTokens = promptTokens;
    }
    if (completionTokens != null) {
      $result.completionTokens = completionTokens;
    }
    if (totalTokens != null) {
      $result.totalTokens = totalTokens;
    }
    if (breakdown != null) {
      $result.breakdown.addAll(breakdown);
    }
    if (promptTokensEstimatedCost != null) {
      $result.promptTokensEstimatedCost = promptTokensEstimatedCost;
    }
    if (completionTokensEstimatedCost != null) {
      $result.completionTokensEstimatedCost = completionTokensEstimatedCost;
    }
    if (totalTokensEstimatedCost != null) {
      $result.totalTokensEstimatedCost = totalTokensEstimatedCost;
    }
    return $result;
  }
  RoomArtifactTokenUsage._() : super();
  factory RoomArtifactTokenUsage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomArtifactTokenUsage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomArtifactTokenUsage', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'promptTokens', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'completionTokens', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'totalTokens', $pb.PbFieldType.OU3)
    ..m<$core.String, $fixnum.Int64>(4, _omitFieldNames ? '' : 'breakdown', entryClassName: 'RoomArtifactTokenUsage.BreakdownEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('wajlc'))
    ..a<$core.double>(5, _omitFieldNames ? '' : 'promptTokensEstimatedCost', $pb.PbFieldType.OD)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'completionTokensEstimatedCost', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'totalTokensEstimatedCost', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomArtifactTokenUsage clone() => RoomArtifactTokenUsage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomArtifactTokenUsage copyWith(void Function(RoomArtifactTokenUsage) updates) => super.copyWith((message) => updates(message as RoomArtifactTokenUsage)) as RoomArtifactTokenUsage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactTokenUsage create() => RoomArtifactTokenUsage._();
  RoomArtifactTokenUsage createEmptyInstance() => create();
  static $pb.PbList<RoomArtifactTokenUsage> createRepeated() => $pb.PbList<RoomArtifactTokenUsage>();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactTokenUsage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomArtifactTokenUsage>(create);
  static RoomArtifactTokenUsage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get promptTokens => $_getIZ(0);
  @$pb.TagNumber(1)
  set promptTokens($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPromptTokens() => $_has(0);
  @$pb.TagNumber(1)
  void clearPromptTokens() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get completionTokens => $_getIZ(1);
  @$pb.TagNumber(2)
  set completionTokens($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompletionTokens() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompletionTokens() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalTokens => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalTokens($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalTokens() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalTokens() => clearField(3);

  @$pb.TagNumber(4)
  $core.Map<$core.String, $fixnum.Int64> get breakdown => $_getMap(3);

  @$pb.TagNumber(5)
  $core.double get promptTokensEstimatedCost => $_getN(4);
  @$pb.TagNumber(5)
  set promptTokensEstimatedCost($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPromptTokensEstimatedCost() => $_has(4);
  @$pb.TagNumber(5)
  void clearPromptTokensEstimatedCost() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get completionTokensEstimatedCost => $_getN(5);
  @$pb.TagNumber(6)
  set completionTokensEstimatedCost($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCompletionTokensEstimatedCost() => $_has(5);
  @$pb.TagNumber(6)
  void clearCompletionTokensEstimatedCost() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get totalTokensEstimatedCost => $_getN(6);
  @$pb.TagNumber(7)
  set totalTokensEstimatedCost($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalTokensEstimatedCost() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalTokensEstimatedCost() => clearField(7);
}

class RoomArtifactDurationUsage extends $pb.GeneratedMessage {
  factory RoomArtifactDurationUsage({
    $core.int? durationSec,
    $core.Map<$core.String, $fixnum.Int64>? breakdown,
    $core.double? durationSecEstimatedCost,
  }) {
    final $result = create();
    if (durationSec != null) {
      $result.durationSec = durationSec;
    }
    if (breakdown != null) {
      $result.breakdown.addAll(breakdown);
    }
    if (durationSecEstimatedCost != null) {
      $result.durationSecEstimatedCost = durationSecEstimatedCost;
    }
    return $result;
  }
  RoomArtifactDurationUsage._() : super();
  factory RoomArtifactDurationUsage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomArtifactDurationUsage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomArtifactDurationUsage', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'durationSec', $pb.PbFieldType.OU3)
    ..m<$core.String, $fixnum.Int64>(2, _omitFieldNames ? '' : 'breakdown', entryClassName: 'RoomArtifactDurationUsage.BreakdownEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('wajlc'))
    ..a<$core.double>(3, _omitFieldNames ? '' : 'durationSecEstimatedCost', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomArtifactDurationUsage clone() => RoomArtifactDurationUsage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomArtifactDurationUsage copyWith(void Function(RoomArtifactDurationUsage) updates) => super.copyWith((message) => updates(message as RoomArtifactDurationUsage)) as RoomArtifactDurationUsage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactDurationUsage create() => RoomArtifactDurationUsage._();
  RoomArtifactDurationUsage createEmptyInstance() => create();
  static $pb.PbList<RoomArtifactDurationUsage> createRepeated() => $pb.PbList<RoomArtifactDurationUsage>();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactDurationUsage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomArtifactDurationUsage>(create);
  static RoomArtifactDurationUsage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get durationSec => $_getIZ(0);
  @$pb.TagNumber(1)
  set durationSec($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDurationSec() => $_has(0);
  @$pb.TagNumber(1)
  void clearDurationSec() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.String, $fixnum.Int64> get breakdown => $_getMap(1);

  @$pb.TagNumber(3)
  $core.double get durationSecEstimatedCost => $_getN(2);
  @$pb.TagNumber(3)
  set durationSecEstimatedCost($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDurationSecEstimatedCost() => $_has(2);
  @$pb.TagNumber(3)
  void clearDurationSecEstimatedCost() => clearField(3);
}

class RoomArtifactCharacterCountUsage extends $pb.GeneratedMessage {
  factory RoomArtifactCharacterCountUsage({
    $core.int? totalCharacters,
    $core.Map<$core.String, $fixnum.Int64>? breakdown,
    $core.double? totalCharactersEstimatedCost,
  }) {
    final $result = create();
    if (totalCharacters != null) {
      $result.totalCharacters = totalCharacters;
    }
    if (breakdown != null) {
      $result.breakdown.addAll(breakdown);
    }
    if (totalCharactersEstimatedCost != null) {
      $result.totalCharactersEstimatedCost = totalCharactersEstimatedCost;
    }
    return $result;
  }
  RoomArtifactCharacterCountUsage._() : super();
  factory RoomArtifactCharacterCountUsage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomArtifactCharacterCountUsage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomArtifactCharacterCountUsage', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'totalCharacters', $pb.PbFieldType.OU3)
    ..m<$core.String, $fixnum.Int64>(2, _omitFieldNames ? '' : 'breakdown', entryClassName: 'RoomArtifactCharacterCountUsage.BreakdownEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('wajlc'))
    ..a<$core.double>(3, _omitFieldNames ? '' : 'totalCharactersEstimatedCost', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomArtifactCharacterCountUsage clone() => RoomArtifactCharacterCountUsage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomArtifactCharacterCountUsage copyWith(void Function(RoomArtifactCharacterCountUsage) updates) => super.copyWith((message) => updates(message as RoomArtifactCharacterCountUsage)) as RoomArtifactCharacterCountUsage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactCharacterCountUsage create() => RoomArtifactCharacterCountUsage._();
  RoomArtifactCharacterCountUsage createEmptyInstance() => create();
  static $pb.PbList<RoomArtifactCharacterCountUsage> createRepeated() => $pb.PbList<RoomArtifactCharacterCountUsage>();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactCharacterCountUsage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomArtifactCharacterCountUsage>(create);
  static RoomArtifactCharacterCountUsage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalCharacters => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalCharacters($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotalCharacters() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalCharacters() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.String, $fixnum.Int64> get breakdown => $_getMap(1);

  @$pb.TagNumber(3)
  $core.double get totalCharactersEstimatedCost => $_getN(2);
  @$pb.TagNumber(3)
  set totalCharactersEstimatedCost($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalCharactersEstimatedCost() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalCharactersEstimatedCost() => clearField(3);
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
    final $result = create();
    if (userInfo != null) {
      $result.userInfo = userInfo;
    }
    if (providerJobInfo != null) {
      $result.providerJobInfo = providerJobInfo;
    }
    if (fileInfo != null) {
      $result.fileInfo = fileInfo;
    }
    if (tokenUsage != null) {
      $result.tokenUsage = tokenUsage;
    }
    if (durationUsage != null) {
      $result.durationUsage = durationUsage;
    }
    if (characterCountUsage != null) {
      $result.characterCountUsage = characterCountUsage;
    }
    if (referenceArtifactId != null) {
      $result.referenceArtifactId = referenceArtifactId;
    }
    return $result;
  }
  RoomArtifactMetadata._() : super();
  factory RoomArtifactMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomArtifactMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, RoomArtifactMetadata_UsageDetails> _RoomArtifactMetadata_UsageDetailsByTag = {
    4 : RoomArtifactMetadata_UsageDetails.tokenUsage,
    5 : RoomArtifactMetadata_UsageDetails.durationUsage,
    6 : RoomArtifactMetadata_UsageDetails.characterCountUsage,
    0 : RoomArtifactMetadata_UsageDetails.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomArtifactMetadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..oo(0, [4, 5, 6])
    ..aOM<RoomArtifactUserInfo>(1, _omitFieldNames ? '' : 'userInfo', subBuilder: RoomArtifactUserInfo.create)
    ..aOM<RoomArtifactProviderJobInfo>(2, _omitFieldNames ? '' : 'providerJobInfo', subBuilder: RoomArtifactProviderJobInfo.create)
    ..aOM<RoomArtifactFileInfo>(3, _omitFieldNames ? '' : 'fileInfo', subBuilder: RoomArtifactFileInfo.create)
    ..aOM<RoomArtifactTokenUsage>(4, _omitFieldNames ? '' : 'tokenUsage', subBuilder: RoomArtifactTokenUsage.create)
    ..aOM<RoomArtifactDurationUsage>(5, _omitFieldNames ? '' : 'durationUsage', subBuilder: RoomArtifactDurationUsage.create)
    ..aOM<RoomArtifactCharacterCountUsage>(6, _omitFieldNames ? '' : 'characterCountUsage', subBuilder: RoomArtifactCharacterCountUsage.create)
    ..aOS(10, _omitFieldNames ? '' : 'referenceArtifactId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomArtifactMetadata clone() => RoomArtifactMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomArtifactMetadata copyWith(void Function(RoomArtifactMetadata) updates) => super.copyWith((message) => updates(message as RoomArtifactMetadata)) as RoomArtifactMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactMetadata create() => RoomArtifactMetadata._();
  RoomArtifactMetadata createEmptyInstance() => create();
  static $pb.PbList<RoomArtifactMetadata> createRepeated() => $pb.PbList<RoomArtifactMetadata>();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomArtifactMetadata>(create);
  static RoomArtifactMetadata? _defaultInstance;

  RoomArtifactMetadata_UsageDetails whichUsageDetails() => _RoomArtifactMetadata_UsageDetailsByTag[$_whichOneof(0)]!;
  void clearUsageDetails() => clearField($_whichOneof(0));

  /// Optional: Information about the user who initiated or is associated with the artifact.
  @$pb.TagNumber(1)
  RoomArtifactUserInfo get userInfo => $_getN(0);
  @$pb.TagNumber(1)
  set userInfo(RoomArtifactUserInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserInfo() => clearField(1);
  @$pb.TagNumber(1)
  RoomArtifactUserInfo ensureUserInfo() => $_ensure(0);

  /// Optional: Information about an asynchronous provider job.
  @$pb.TagNumber(2)
  RoomArtifactProviderJobInfo get providerJobInfo => $_getN(1);
  @$pb.TagNumber(2)
  set providerJobInfo(RoomArtifactProviderJobInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProviderJobInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearProviderJobInfo() => clearField(2);
  @$pb.TagNumber(2)
  RoomArtifactProviderJobInfo ensureProviderJobInfo() => $_ensure(1);

  /// Optional: Information about the final generated file artifact.
  @$pb.TagNumber(3)
  RoomArtifactFileInfo get fileInfo => $_getN(2);
  @$pb.TagNumber(3)
  set fileInfo(RoomArtifactFileInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFileInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileInfo() => clearField(3);
  @$pb.TagNumber(3)
  RoomArtifactFileInfo ensureFileInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  RoomArtifactTokenUsage get tokenUsage => $_getN(3);
  @$pb.TagNumber(4)
  set tokenUsage(RoomArtifactTokenUsage v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTokenUsage() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenUsage() => clearField(4);
  @$pb.TagNumber(4)
  RoomArtifactTokenUsage ensureTokenUsage() => $_ensure(3);

  @$pb.TagNumber(5)
  RoomArtifactDurationUsage get durationUsage => $_getN(4);
  @$pb.TagNumber(5)
  set durationUsage(RoomArtifactDurationUsage v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDurationUsage() => $_has(4);
  @$pb.TagNumber(5)
  void clearDurationUsage() => clearField(5);
  @$pb.TagNumber(5)
  RoomArtifactDurationUsage ensureDurationUsage() => $_ensure(4);

  @$pb.TagNumber(6)
  RoomArtifactCharacterCountUsage get characterCountUsage => $_getN(5);
  @$pb.TagNumber(6)
  set characterCountUsage(RoomArtifactCharacterCountUsage v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCharacterCountUsage() => $_has(5);
  @$pb.TagNumber(6)
  void clearCharacterCountUsage() => clearField(6);
  @$pb.TagNumber(6)
  RoomArtifactCharacterCountUsage ensureCharacterCountUsage() => $_ensure(5);

  /// A field to link a file artifact back to its usage artifact.
  @$pb.TagNumber(10)
  $core.String get referenceArtifactId => $_getSZ(6);
  @$pb.TagNumber(10)
  set referenceArtifactId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(10)
  $core.bool hasReferenceArtifactId() => $_has(6);
  @$pb.TagNumber(10)
  void clearReferenceArtifactId() => clearField(10);
}

/// Webhook-specific Messages
class RoomArtifactWebhookEvent extends $pb.GeneratedMessage {
  factory RoomArtifactWebhookEvent({
    RoomArtifactType? type,
    $core.String? artifactId,
    RoomArtifactMetadata? metadata,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (artifactId != null) {
      $result.artifactId = artifactId;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  RoomArtifactWebhookEvent._() : super();
  factory RoomArtifactWebhookEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomArtifactWebhookEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomArtifactWebhookEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..e<RoomArtifactType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: RoomArtifactType.UNKNOWN_ARTIFACT, valueOf: RoomArtifactType.valueOf, enumValues: RoomArtifactType.values)
    ..aOS(2, _omitFieldNames ? '' : 'artifactId')
    ..aOM<RoomArtifactMetadata>(3, _omitFieldNames ? '' : 'metadata', subBuilder: RoomArtifactMetadata.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomArtifactWebhookEvent clone() => RoomArtifactWebhookEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomArtifactWebhookEvent copyWith(void Function(RoomArtifactWebhookEvent) updates) => super.copyWith((message) => updates(message as RoomArtifactWebhookEvent)) as RoomArtifactWebhookEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomArtifactWebhookEvent create() => RoomArtifactWebhookEvent._();
  RoomArtifactWebhookEvent createEmptyInstance() => create();
  static $pb.PbList<RoomArtifactWebhookEvent> createRepeated() => $pb.PbList<RoomArtifactWebhookEvent>();
  @$core.pragma('dart2js:noInline')
  static RoomArtifactWebhookEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomArtifactWebhookEvent>(create);
  static RoomArtifactWebhookEvent? _defaultInstance;

  @$pb.TagNumber(1)
  RoomArtifactType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(RoomArtifactType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get artifactId => $_getSZ(1);
  @$pb.TagNumber(2)
  set artifactId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasArtifactId() => $_has(1);
  @$pb.TagNumber(2)
  void clearArtifactId() => clearField(2);

  @$pb.TagNumber(3)
  RoomArtifactMetadata get metadata => $_getN(2);
  @$pb.TagNumber(3)
  set metadata(RoomArtifactMetadata v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearMetadata() => clearField(3);
  @$pb.TagNumber(3)
  RoomArtifactMetadata ensureMetadata() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
