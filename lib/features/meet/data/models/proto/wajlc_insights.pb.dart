//
//  Generated code. Do not modify.
//  source: wajlc_insights.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_insights.pbenum.dart';

export 'wajlc_insights.pbenum.dart';

class InsightsSupportedLangInfo extends $pb.GeneratedMessage {
  factory InsightsSupportedLangInfo({
    $core.String? code,
    $core.String? name,
    $core.String? locale,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (name != null) {
      $result.name = name;
    }
    if (locale != null) {
      $result.locale = locale;
    }
    return $result;
  }
  InsightsSupportedLangInfo._() : super();
  factory InsightsSupportedLangInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsSupportedLangInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsSupportedLangInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'locale')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsSupportedLangInfo clone() => InsightsSupportedLangInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsSupportedLangInfo copyWith(void Function(InsightsSupportedLangInfo) updates) => super.copyWith((message) => updates(message as InsightsSupportedLangInfo)) as InsightsSupportedLangInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsSupportedLangInfo create() => InsightsSupportedLangInfo._();
  InsightsSupportedLangInfo createEmptyInstance() => create();
  static $pb.PbList<InsightsSupportedLangInfo> createRepeated() => $pb.PbList<InsightsSupportedLangInfo>();
  @$core.pragma('dart2js:noInline')
  static InsightsSupportedLangInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsSupportedLangInfo>(create);
  static InsightsSupportedLangInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get locale => $_getSZ(2);
  @$pb.TagNumber(3)
  set locale($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocale() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocale() => clearField(3);
}

class InsightsTranscriptionConfigReq extends $pb.GeneratedMessage {
  factory InsightsTranscriptionConfigReq({
    $core.bool? isEnabled,
    $core.Iterable<$core.String>? allowedSpokenLangs,
    $core.Iterable<$core.String>? allowedSpeechUsers,
    $core.bool? isEnabledTranslation,
    $core.Iterable<$core.String>? allowedTransLangs,
    $core.String? defaultSubtitleLang,
    $core.bool? isEnabledSpeechSynthesis,
  }) {
    final $result = create();
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    if (allowedSpokenLangs != null) {
      $result.allowedSpokenLangs.addAll(allowedSpokenLangs);
    }
    if (allowedSpeechUsers != null) {
      $result.allowedSpeechUsers.addAll(allowedSpeechUsers);
    }
    if (isEnabledTranslation != null) {
      $result.isEnabledTranslation = isEnabledTranslation;
    }
    if (allowedTransLangs != null) {
      $result.allowedTransLangs.addAll(allowedTransLangs);
    }
    if (defaultSubtitleLang != null) {
      $result.defaultSubtitleLang = defaultSubtitleLang;
    }
    if (isEnabledSpeechSynthesis != null) {
      $result.isEnabledSpeechSynthesis = isEnabledSpeechSynthesis;
    }
    return $result;
  }
  InsightsTranscriptionConfigReq._() : super();
  factory InsightsTranscriptionConfigReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsTranscriptionConfigReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsTranscriptionConfigReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isEnabled')
    ..pPS(2, _omitFieldNames ? '' : 'allowedSpokenLangs')
    ..pPS(3, _omitFieldNames ? '' : 'allowedSpeechUsers')
    ..aOB(4, _omitFieldNames ? '' : 'isEnabledTranslation')
    ..pPS(5, _omitFieldNames ? '' : 'allowedTransLangs')
    ..aOS(6, _omitFieldNames ? '' : 'defaultSubtitleLang')
    ..aOB(7, _omitFieldNames ? '' : 'isEnabledSpeechSynthesis')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsTranscriptionConfigReq clone() => InsightsTranscriptionConfigReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsTranscriptionConfigReq copyWith(void Function(InsightsTranscriptionConfigReq) updates) => super.copyWith((message) => updates(message as InsightsTranscriptionConfigReq)) as InsightsTranscriptionConfigReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsTranscriptionConfigReq create() => InsightsTranscriptionConfigReq._();
  InsightsTranscriptionConfigReq createEmptyInstance() => create();
  static $pb.PbList<InsightsTranscriptionConfigReq> createRepeated() => $pb.PbList<InsightsTranscriptionConfigReq>();
  @$core.pragma('dart2js:noInline')
  static InsightsTranscriptionConfigReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsTranscriptionConfigReq>(create);
  static InsightsTranscriptionConfigReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isEnabled => $_getBF(0);
  @$pb.TagNumber(1)
  set isEnabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsEnabled() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get allowedSpokenLangs => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.String> get allowedSpeechUsers => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get isEnabledTranslation => $_getBF(3);
  @$pb.TagNumber(4)
  set isEnabledTranslation($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsEnabledTranslation() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsEnabledTranslation() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get allowedTransLangs => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get defaultSubtitleLang => $_getSZ(5);
  @$pb.TagNumber(6)
  set defaultSubtitleLang($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDefaultSubtitleLang() => $_has(5);
  @$pb.TagNumber(6)
  void clearDefaultSubtitleLang() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isEnabledSpeechSynthesis => $_getBF(6);
  @$pb.TagNumber(7)
  set isEnabledSpeechSynthesis($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsEnabledSpeechSynthesis() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsEnabledSpeechSynthesis() => clearField(7);
}

class InsightsTranscriptionUserSessionReq extends $pb.GeneratedMessage {
  factory InsightsTranscriptionUserSessionReq({
    InsightsUserSessionAction? action,
    $core.String? spokenLang,
    $core.bool? allowedTranscriptionStorage,
  }) {
    final $result = create();
    if (action != null) {
      $result.action = action;
    }
    if (spokenLang != null) {
      $result.spokenLang = spokenLang;
    }
    if (allowedTranscriptionStorage != null) {
      $result.allowedTranscriptionStorage = allowedTranscriptionStorage;
    }
    return $result;
  }
  InsightsTranscriptionUserSessionReq._() : super();
  factory InsightsTranscriptionUserSessionReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsTranscriptionUserSessionReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsTranscriptionUserSessionReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..e<InsightsUserSessionAction>(1, _omitFieldNames ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: InsightsUserSessionAction.USER_SESSION_ACTION_UNSPECIFIED, valueOf: InsightsUserSessionAction.valueOf, enumValues: InsightsUserSessionAction.values)
    ..aOS(2, _omitFieldNames ? '' : 'spokenLang')
    ..aOB(3, _omitFieldNames ? '' : 'allowedTranscriptionStorage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsTranscriptionUserSessionReq clone() => InsightsTranscriptionUserSessionReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsTranscriptionUserSessionReq copyWith(void Function(InsightsTranscriptionUserSessionReq) updates) => super.copyWith((message) => updates(message as InsightsTranscriptionUserSessionReq)) as InsightsTranscriptionUserSessionReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsTranscriptionUserSessionReq create() => InsightsTranscriptionUserSessionReq._();
  InsightsTranscriptionUserSessionReq createEmptyInstance() => create();
  static $pb.PbList<InsightsTranscriptionUserSessionReq> createRepeated() => $pb.PbList<InsightsTranscriptionUserSessionReq>();
  @$core.pragma('dart2js:noInline')
  static InsightsTranscriptionUserSessionReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsTranscriptionUserSessionReq>(create);
  static InsightsTranscriptionUserSessionReq? _defaultInstance;

  @$pb.TagNumber(1)
  InsightsUserSessionAction get action => $_getN(0);
  @$pb.TagNumber(1)
  set action(InsightsUserSessionAction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get spokenLang => $_getSZ(1);
  @$pb.TagNumber(2)
  set spokenLang($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSpokenLang() => $_has(1);
  @$pb.TagNumber(2)
  void clearSpokenLang() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get allowedTranscriptionStorage => $_getBF(2);
  @$pb.TagNumber(3)
  set allowedTranscriptionStorage($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAllowedTranscriptionStorage() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowedTranscriptionStorage() => clearField(3);
}

class InsightsTranscriptionResult extends $pb.GeneratedMessage {
  factory InsightsTranscriptionResult({
    $core.String? fromUserId,
    $core.String? fromUserName,
    $core.String? lang,
    $core.String? text,
    $core.bool? isPartial,
    $core.bool? allowedTranscriptionStorage,
    $core.Map<$core.String, $core.String>? translations,
  }) {
    final $result = create();
    if (fromUserId != null) {
      $result.fromUserId = fromUserId;
    }
    if (fromUserName != null) {
      $result.fromUserName = fromUserName;
    }
    if (lang != null) {
      $result.lang = lang;
    }
    if (text != null) {
      $result.text = text;
    }
    if (isPartial != null) {
      $result.isPartial = isPartial;
    }
    if (allowedTranscriptionStorage != null) {
      $result.allowedTranscriptionStorage = allowedTranscriptionStorage;
    }
    if (translations != null) {
      $result.translations.addAll(translations);
    }
    return $result;
  }
  InsightsTranscriptionResult._() : super();
  factory InsightsTranscriptionResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsTranscriptionResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsTranscriptionResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fromUserId')
    ..aOS(2, _omitFieldNames ? '' : 'fromUserName')
    ..aOS(3, _omitFieldNames ? '' : 'lang')
    ..aOS(4, _omitFieldNames ? '' : 'text')
    ..aOB(5, _omitFieldNames ? '' : 'isPartial')
    ..aOB(6, _omitFieldNames ? '' : 'allowedTranscriptionStorage')
    ..m<$core.String, $core.String>(7, _omitFieldNames ? '' : 'translations', entryClassName: 'InsightsTranscriptionResult.TranslationsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('wajlc'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsTranscriptionResult clone() => InsightsTranscriptionResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsTranscriptionResult copyWith(void Function(InsightsTranscriptionResult) updates) => super.copyWith((message) => updates(message as InsightsTranscriptionResult)) as InsightsTranscriptionResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsTranscriptionResult create() => InsightsTranscriptionResult._();
  InsightsTranscriptionResult createEmptyInstance() => create();
  static $pb.PbList<InsightsTranscriptionResult> createRepeated() => $pb.PbList<InsightsTranscriptionResult>();
  @$core.pragma('dart2js:noInline')
  static InsightsTranscriptionResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsTranscriptionResult>(create);
  static InsightsTranscriptionResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fromUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFromUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fromUserName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fromUserName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFromUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromUserName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lang => $_getSZ(2);
  @$pb.TagNumber(3)
  set lang($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLang() => $_has(2);
  @$pb.TagNumber(3)
  void clearLang() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get text => $_getSZ(3);
  @$pb.TagNumber(4)
  set text($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasText() => $_has(3);
  @$pb.TagNumber(4)
  void clearText() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isPartial => $_getBF(4);
  @$pb.TagNumber(5)
  set isPartial($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsPartial() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsPartial() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get allowedTranscriptionStorage => $_getBF(5);
  @$pb.TagNumber(6)
  set allowedTranscriptionStorage($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAllowedTranscriptionStorage() => $_has(5);
  @$pb.TagNumber(6)
  void clearAllowedTranscriptionStorage() => clearField(6);

  @$pb.TagNumber(7)
  $core.Map<$core.String, $core.String> get translations => $_getMap(6);
}

class InsightsChatTranslationConfigReq extends $pb.GeneratedMessage {
  factory InsightsChatTranslationConfigReq({
    $core.bool? isEnabled,
    $core.Iterable<$core.String>? allowedTransLangs,
    $core.String? defaultLang,
  }) {
    final $result = create();
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    if (allowedTransLangs != null) {
      $result.allowedTransLangs.addAll(allowedTransLangs);
    }
    if (defaultLang != null) {
      $result.defaultLang = defaultLang;
    }
    return $result;
  }
  InsightsChatTranslationConfigReq._() : super();
  factory InsightsChatTranslationConfigReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsChatTranslationConfigReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsChatTranslationConfigReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isEnabled')
    ..pPS(5, _omitFieldNames ? '' : 'allowedTransLangs')
    ..aOS(6, _omitFieldNames ? '' : 'defaultLang')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsChatTranslationConfigReq clone() => InsightsChatTranslationConfigReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsChatTranslationConfigReq copyWith(void Function(InsightsChatTranslationConfigReq) updates) => super.copyWith((message) => updates(message as InsightsChatTranslationConfigReq)) as InsightsChatTranslationConfigReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsChatTranslationConfigReq create() => InsightsChatTranslationConfigReq._();
  InsightsChatTranslationConfigReq createEmptyInstance() => create();
  static $pb.PbList<InsightsChatTranslationConfigReq> createRepeated() => $pb.PbList<InsightsChatTranslationConfigReq>();
  @$core.pragma('dart2js:noInline')
  static InsightsChatTranslationConfigReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsChatTranslationConfigReq>(create);
  static InsightsChatTranslationConfigReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isEnabled => $_getBF(0);
  @$pb.TagNumber(1)
  set isEnabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsEnabled() => clearField(1);

  @$pb.TagNumber(5)
  $core.List<$core.String> get allowedTransLangs => $_getList(1);

  @$pb.TagNumber(6)
  $core.String get defaultLang => $_getSZ(2);
  @$pb.TagNumber(6)
  set defaultLang($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(6)
  $core.bool hasDefaultLang() => $_has(2);
  @$pb.TagNumber(6)
  void clearDefaultLang() => clearField(6);
}

class InsightsTranslateTextReq extends $pb.GeneratedMessage {
  factory InsightsTranslateTextReq({
    $core.String? text,
    $core.String? sourceLang,
    $core.Iterable<$core.String>? targetLangs,
  }) {
    final $result = create();
    if (text != null) {
      $result.text = text;
    }
    if (sourceLang != null) {
      $result.sourceLang = sourceLang;
    }
    if (targetLangs != null) {
      $result.targetLangs.addAll(targetLangs);
    }
    return $result;
  }
  InsightsTranslateTextReq._() : super();
  factory InsightsTranslateTextReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsTranslateTextReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsTranslateTextReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..aOS(2, _omitFieldNames ? '' : 'sourceLang')
    ..pPS(3, _omitFieldNames ? '' : 'targetLangs')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsTranslateTextReq clone() => InsightsTranslateTextReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsTranslateTextReq copyWith(void Function(InsightsTranslateTextReq) updates) => super.copyWith((message) => updates(message as InsightsTranslateTextReq)) as InsightsTranslateTextReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsTranslateTextReq create() => InsightsTranslateTextReq._();
  InsightsTranslateTextReq createEmptyInstance() => create();
  static $pb.PbList<InsightsTranslateTextReq> createRepeated() => $pb.PbList<InsightsTranslateTextReq>();
  @$core.pragma('dart2js:noInline')
  static InsightsTranslateTextReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsTranslateTextReq>(create);
  static InsightsTranslateTextReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sourceLang => $_getSZ(1);
  @$pb.TagNumber(2)
  set sourceLang($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSourceLang() => $_has(1);
  @$pb.TagNumber(2)
  void clearSourceLang() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get targetLangs => $_getList(2);
}

class InsightsTextTranslationResult extends $pb.GeneratedMessage {
  factory InsightsTextTranslationResult({
    $core.String? sourceText,
    $core.String? sourceLang,
    $core.Map<$core.String, $core.String>? translations,
  }) {
    final $result = create();
    if (sourceText != null) {
      $result.sourceText = sourceText;
    }
    if (sourceLang != null) {
      $result.sourceLang = sourceLang;
    }
    if (translations != null) {
      $result.translations.addAll(translations);
    }
    return $result;
  }
  InsightsTextTranslationResult._() : super();
  factory InsightsTextTranslationResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsTextTranslationResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsTextTranslationResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sourceText')
    ..aOS(2, _omitFieldNames ? '' : 'sourceLang')
    ..m<$core.String, $core.String>(3, _omitFieldNames ? '' : 'translations', entryClassName: 'InsightsTextTranslationResult.TranslationsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('wajlc'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsTextTranslationResult clone() => InsightsTextTranslationResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsTextTranslationResult copyWith(void Function(InsightsTextTranslationResult) updates) => super.copyWith((message) => updates(message as InsightsTextTranslationResult)) as InsightsTextTranslationResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsTextTranslationResult create() => InsightsTextTranslationResult._();
  InsightsTextTranslationResult createEmptyInstance() => create();
  static $pb.PbList<InsightsTextTranslationResult> createRepeated() => $pb.PbList<InsightsTextTranslationResult>();
  @$core.pragma('dart2js:noInline')
  static InsightsTextTranslationResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsTextTranslationResult>(create);
  static InsightsTextTranslationResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sourceText => $_getSZ(0);
  @$pb.TagNumber(1)
  set sourceText($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSourceText() => $_has(0);
  @$pb.TagNumber(1)
  void clearSourceText() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sourceLang => $_getSZ(1);
  @$pb.TagNumber(2)
  set sourceLang($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSourceLang() => $_has(1);
  @$pb.TagNumber(2)
  void clearSourceLang() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.String> get translations => $_getMap(2);
}

class InsightsTranslateTextRes extends $pb.GeneratedMessage {
  factory InsightsTranslateTextRes({
    $core.bool? status,
    $core.String? msg,
    InsightsTextTranslationResult? result,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (result != null) {
      $result.result = result;
    }
    return $result;
  }
  InsightsTranslateTextRes._() : super();
  factory InsightsTranslateTextRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsTranslateTextRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsTranslateTextRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<InsightsTextTranslationResult>(3, _omitFieldNames ? '' : 'result', subBuilder: InsightsTextTranslationResult.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsTranslateTextRes clone() => InsightsTranslateTextRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsTranslateTextRes copyWith(void Function(InsightsTranslateTextRes) updates) => super.copyWith((message) => updates(message as InsightsTranslateTextRes)) as InsightsTranslateTextRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsTranslateTextRes create() => InsightsTranslateTextRes._();
  InsightsTranslateTextRes createEmptyInstance() => create();
  static $pb.PbList<InsightsTranslateTextRes> createRepeated() => $pb.PbList<InsightsTranslateTextRes>();
  @$core.pragma('dart2js:noInline')
  static InsightsTranslateTextRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsTranslateTextRes>(create);
  static InsightsTranslateTextRes? _defaultInstance;

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
  InsightsTextTranslationResult get result => $_getN(2);
  @$pb.TagNumber(3)
  set result(InsightsTextTranslationResult v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearResult() => clearField(3);
  @$pb.TagNumber(3)
  InsightsTextTranslationResult ensureResult() => $_ensure(2);
}

class InsightsGetSupportedLanguagesReq extends $pb.GeneratedMessage {
  factory InsightsGetSupportedLanguagesReq({
    InsightsServiceType? serviceType,
  }) {
    final $result = create();
    if (serviceType != null) {
      $result.serviceType = serviceType;
    }
    return $result;
  }
  InsightsGetSupportedLanguagesReq._() : super();
  factory InsightsGetSupportedLanguagesReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsGetSupportedLanguagesReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsGetSupportedLanguagesReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..e<InsightsServiceType>(1, _omitFieldNames ? '' : 'serviceType', $pb.PbFieldType.OE, defaultOrMaker: InsightsServiceType.INSIGHTS_SERVICE_TYPE_UNSPECIFIED, valueOf: InsightsServiceType.valueOf, enumValues: InsightsServiceType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsGetSupportedLanguagesReq clone() => InsightsGetSupportedLanguagesReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsGetSupportedLanguagesReq copyWith(void Function(InsightsGetSupportedLanguagesReq) updates) => super.copyWith((message) => updates(message as InsightsGetSupportedLanguagesReq)) as InsightsGetSupportedLanguagesReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsGetSupportedLanguagesReq create() => InsightsGetSupportedLanguagesReq._();
  InsightsGetSupportedLanguagesReq createEmptyInstance() => create();
  static $pb.PbList<InsightsGetSupportedLanguagesReq> createRepeated() => $pb.PbList<InsightsGetSupportedLanguagesReq>();
  @$core.pragma('dart2js:noInline')
  static InsightsGetSupportedLanguagesReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsGetSupportedLanguagesReq>(create);
  static InsightsGetSupportedLanguagesReq? _defaultInstance;

  @$pb.TagNumber(1)
  InsightsServiceType get serviceType => $_getN(0);
  @$pb.TagNumber(1)
  set serviceType(InsightsServiceType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasServiceType() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceType() => clearField(1);
}

class InsightsGetSupportedLanguagesRes extends $pb.GeneratedMessage {
  factory InsightsGetSupportedLanguagesRes({
    $core.bool? status,
    $core.String? msg,
    $core.Iterable<InsightsSupportedLangInfo>? languages,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (languages != null) {
      $result.languages.addAll(languages);
    }
    return $result;
  }
  InsightsGetSupportedLanguagesRes._() : super();
  factory InsightsGetSupportedLanguagesRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsGetSupportedLanguagesRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsGetSupportedLanguagesRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..pc<InsightsSupportedLangInfo>(3, _omitFieldNames ? '' : 'languages', $pb.PbFieldType.PM, subBuilder: InsightsSupportedLangInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsGetSupportedLanguagesRes clone() => InsightsGetSupportedLanguagesRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsGetSupportedLanguagesRes copyWith(void Function(InsightsGetSupportedLanguagesRes) updates) => super.copyWith((message) => updates(message as InsightsGetSupportedLanguagesRes)) as InsightsGetSupportedLanguagesRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsGetSupportedLanguagesRes create() => InsightsGetSupportedLanguagesRes._();
  InsightsGetSupportedLanguagesRes createEmptyInstance() => create();
  static $pb.PbList<InsightsGetSupportedLanguagesRes> createRepeated() => $pb.PbList<InsightsGetSupportedLanguagesRes>();
  @$core.pragma('dart2js:noInline')
  static InsightsGetSupportedLanguagesRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsGetSupportedLanguagesRes>(create);
  static InsightsGetSupportedLanguagesRes? _defaultInstance;

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
  $core.List<InsightsSupportedLangInfo> get languages => $_getList(2);
}

class InsightsGetUserStatusRes extends $pb.GeneratedMessage {
  factory InsightsGetUserStatusRes({
    $core.bool? status,
    $core.String? msg,
    InsightsServiceType? serviceType,
    $core.bool? isActive,
    $core.String? spokenLang,
    $core.bool? allowedTranscriptionStorage,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (serviceType != null) {
      $result.serviceType = serviceType;
    }
    if (isActive != null) {
      $result.isActive = isActive;
    }
    if (spokenLang != null) {
      $result.spokenLang = spokenLang;
    }
    if (allowedTranscriptionStorage != null) {
      $result.allowedTranscriptionStorage = allowedTranscriptionStorage;
    }
    return $result;
  }
  InsightsGetUserStatusRes._() : super();
  factory InsightsGetUserStatusRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsGetUserStatusRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsGetUserStatusRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..e<InsightsServiceType>(3, _omitFieldNames ? '' : 'serviceType', $pb.PbFieldType.OE, defaultOrMaker: InsightsServiceType.INSIGHTS_SERVICE_TYPE_UNSPECIFIED, valueOf: InsightsServiceType.valueOf, enumValues: InsightsServiceType.values)
    ..aOB(4, _omitFieldNames ? '' : 'isActive')
    ..aOS(5, _omitFieldNames ? '' : 'spokenLang')
    ..aOB(6, _omitFieldNames ? '' : 'allowedTranscriptionStorage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsGetUserStatusRes clone() => InsightsGetUserStatusRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsGetUserStatusRes copyWith(void Function(InsightsGetUserStatusRes) updates) => super.copyWith((message) => updates(message as InsightsGetUserStatusRes)) as InsightsGetUserStatusRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsGetUserStatusRes create() => InsightsGetUserStatusRes._();
  InsightsGetUserStatusRes createEmptyInstance() => create();
  static $pb.PbList<InsightsGetUserStatusRes> createRepeated() => $pb.PbList<InsightsGetUserStatusRes>();
  @$core.pragma('dart2js:noInline')
  static InsightsGetUserStatusRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsGetUserStatusRes>(create);
  static InsightsGetUserStatusRes? _defaultInstance;

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
  InsightsServiceType get serviceType => $_getN(2);
  @$pb.TagNumber(3)
  set serviceType(InsightsServiceType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasServiceType() => $_has(2);
  @$pb.TagNumber(3)
  void clearServiceType() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isActive => $_getBF(3);
  @$pb.TagNumber(4)
  set isActive($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsActive() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsActive() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get spokenLang => $_getSZ(4);
  @$pb.TagNumber(5)
  set spokenLang($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSpokenLang() => $_has(4);
  @$pb.TagNumber(5)
  void clearSpokenLang() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get allowedTranscriptionStorage => $_getBF(5);
  @$pb.TagNumber(6)
  set allowedTranscriptionStorage($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAllowedTranscriptionStorage() => $_has(5);
  @$pb.TagNumber(6)
  void clearAllowedTranscriptionStorage() => clearField(6);
}

class InsightsAITextChatContent extends $pb.GeneratedMessage {
  factory InsightsAITextChatContent({
    InsightsAITextChatRole? role,
    $core.String? text,
    $core.String? streamId,
  }) {
    final $result = create();
    if (role != null) {
      $result.role = role;
    }
    if (text != null) {
      $result.text = text;
    }
    if (streamId != null) {
      $result.streamId = streamId;
    }
    return $result;
  }
  InsightsAITextChatContent._() : super();
  factory InsightsAITextChatContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsAITextChatContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsAITextChatContent', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..e<InsightsAITextChatRole>(1, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: InsightsAITextChatRole.INSIGHTS_AI_TEXT_CHAT_ROLE_UNSPECIFIED, valueOf: InsightsAITextChatRole.valueOf, enumValues: InsightsAITextChatRole.values)
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..aOS(3, _omitFieldNames ? '' : 'streamId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsAITextChatContent clone() => InsightsAITextChatContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsAITextChatContent copyWith(void Function(InsightsAITextChatContent) updates) => super.copyWith((message) => updates(message as InsightsAITextChatContent)) as InsightsAITextChatContent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsAITextChatContent create() => InsightsAITextChatContent._();
  InsightsAITextChatContent createEmptyInstance() => create();
  static $pb.PbList<InsightsAITextChatContent> createRepeated() => $pb.PbList<InsightsAITextChatContent>();
  @$core.pragma('dart2js:noInline')
  static InsightsAITextChatContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsAITextChatContent>(create);
  static InsightsAITextChatContent? _defaultInstance;

  @$pb.TagNumber(1)
  InsightsAITextChatRole get role => $_getN(0);
  @$pb.TagNumber(1)
  set role(InsightsAITextChatRole v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearRole() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get streamId => $_getSZ(2);
  @$pb.TagNumber(3)
  set streamId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStreamId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStreamId() => clearField(3);
}

class InsightsAITextChatStreamResult extends $pb.GeneratedMessage {
  factory InsightsAITextChatStreamResult({
    $core.String? id,
    $core.String? text,
    $core.bool? isLastChunk,
    $core.int? promptTokens,
    $core.int? completionTokens,
    $core.int? totalTokens,
    $core.String? createdAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (text != null) {
      $result.text = text;
    }
    if (isLastChunk != null) {
      $result.isLastChunk = isLastChunk;
    }
    if (promptTokens != null) {
      $result.promptTokens = promptTokens;
    }
    if (completionTokens != null) {
      $result.completionTokens = completionTokens;
    }
    if (totalTokens != null) {
      $result.totalTokens = totalTokens;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  InsightsAITextChatStreamResult._() : super();
  factory InsightsAITextChatStreamResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsAITextChatStreamResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsAITextChatStreamResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..aOB(3, _omitFieldNames ? '' : 'isLastChunk')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'promptTokens', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'completionTokens', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'totalTokens', $pb.PbFieldType.OU3)
    ..aOS(7, _omitFieldNames ? '' : 'createdAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsAITextChatStreamResult clone() => InsightsAITextChatStreamResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsAITextChatStreamResult copyWith(void Function(InsightsAITextChatStreamResult) updates) => super.copyWith((message) => updates(message as InsightsAITextChatStreamResult)) as InsightsAITextChatStreamResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsAITextChatStreamResult create() => InsightsAITextChatStreamResult._();
  InsightsAITextChatStreamResult createEmptyInstance() => create();
  static $pb.PbList<InsightsAITextChatStreamResult> createRepeated() => $pb.PbList<InsightsAITextChatStreamResult>();
  @$core.pragma('dart2js:noInline')
  static InsightsAITextChatStreamResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsAITextChatStreamResult>(create);
  static InsightsAITextChatStreamResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isLastChunk => $_getBF(2);
  @$pb.TagNumber(3)
  set isLastChunk($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsLastChunk() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsLastChunk() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get promptTokens => $_getIZ(3);
  @$pb.TagNumber(4)
  set promptTokens($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPromptTokens() => $_has(3);
  @$pb.TagNumber(4)
  void clearPromptTokens() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get completionTokens => $_getIZ(4);
  @$pb.TagNumber(5)
  set completionTokens($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCompletionTokens() => $_has(4);
  @$pb.TagNumber(5)
  void clearCompletionTokens() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get totalTokens => $_getIZ(5);
  @$pb.TagNumber(6)
  set totalTokens($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTotalTokens() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalTokens() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get createdAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set createdAt($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);
}

class InsightsAITextChatConfigReq extends $pb.GeneratedMessage {
  factory InsightsAITextChatConfigReq({
    $core.bool? isEnabled,
    $core.bool? isAllowedEveryone,
    $core.Iterable<$core.String>? allowedUserIds,
  }) {
    final $result = create();
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    if (isAllowedEveryone != null) {
      $result.isAllowedEveryone = isAllowedEveryone;
    }
    if (allowedUserIds != null) {
      $result.allowedUserIds.addAll(allowedUserIds);
    }
    return $result;
  }
  InsightsAITextChatConfigReq._() : super();
  factory InsightsAITextChatConfigReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsAITextChatConfigReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsAITextChatConfigReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isEnabled')
    ..aOB(3, _omitFieldNames ? '' : 'isAllowedEveryone')
    ..pPS(4, _omitFieldNames ? '' : 'allowedUserIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsAITextChatConfigReq clone() => InsightsAITextChatConfigReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsAITextChatConfigReq copyWith(void Function(InsightsAITextChatConfigReq) updates) => super.copyWith((message) => updates(message as InsightsAITextChatConfigReq)) as InsightsAITextChatConfigReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsAITextChatConfigReq create() => InsightsAITextChatConfigReq._();
  InsightsAITextChatConfigReq createEmptyInstance() => create();
  static $pb.PbList<InsightsAITextChatConfigReq> createRepeated() => $pb.PbList<InsightsAITextChatConfigReq>();
  @$core.pragma('dart2js:noInline')
  static InsightsAITextChatConfigReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsAITextChatConfigReq>(create);
  static InsightsAITextChatConfigReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isEnabled => $_getBF(0);
  @$pb.TagNumber(1)
  set isEnabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsEnabled() => clearField(1);

  @$pb.TagNumber(3)
  $core.bool get isAllowedEveryone => $_getBF(1);
  @$pb.TagNumber(3)
  set isAllowedEveryone($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAllowedEveryone() => $_has(1);
  @$pb.TagNumber(3)
  void clearIsAllowedEveryone() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get allowedUserIds => $_getList(2);
}

class InsightsAIMeetingSummarizationConfigReq extends $pb.GeneratedMessage {
  factory InsightsAIMeetingSummarizationConfigReq({
    $core.bool? isEnabled,
    $core.String? summarizationPrompt,
  }) {
    final $result = create();
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    if (summarizationPrompt != null) {
      $result.summarizationPrompt = summarizationPrompt;
    }
    return $result;
  }
  InsightsAIMeetingSummarizationConfigReq._() : super();
  factory InsightsAIMeetingSummarizationConfigReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsAIMeetingSummarizationConfigReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsAIMeetingSummarizationConfigReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isEnabled')
    ..aOS(3, _omitFieldNames ? '' : 'summarizationPrompt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsAIMeetingSummarizationConfigReq clone() => InsightsAIMeetingSummarizationConfigReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsAIMeetingSummarizationConfigReq copyWith(void Function(InsightsAIMeetingSummarizationConfigReq) updates) => super.copyWith((message) => updates(message as InsightsAIMeetingSummarizationConfigReq)) as InsightsAIMeetingSummarizationConfigReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsAIMeetingSummarizationConfigReq create() => InsightsAIMeetingSummarizationConfigReq._();
  InsightsAIMeetingSummarizationConfigReq createEmptyInstance() => create();
  static $pb.PbList<InsightsAIMeetingSummarizationConfigReq> createRepeated() => $pb.PbList<InsightsAIMeetingSummarizationConfigReq>();
  @$core.pragma('dart2js:noInline')
  static InsightsAIMeetingSummarizationConfigReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsAIMeetingSummarizationConfigReq>(create);
  static InsightsAIMeetingSummarizationConfigReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isEnabled => $_getBF(0);
  @$pb.TagNumber(1)
  set isEnabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsEnabled() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get summarizationPrompt => $_getSZ(1);
  @$pb.TagNumber(3)
  set summarizationPrompt($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasSummarizationPrompt() => $_has(1);
  @$pb.TagNumber(3)
  void clearSummarizationPrompt() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
