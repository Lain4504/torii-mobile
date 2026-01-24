//
//  Generated code. Do not modify.
//  source: wajlc_lti_v1.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class LtiClaims extends $pb.GeneratedMessage {
  factory LtiClaims({
    $core.String? userId,
    $core.String? name,
    $core.bool? isAdmin,
    $core.String? roomId,
    $core.String? roomTitle,
    LtiCustomParameters? ltiCustomParameters,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (isAdmin != null) {
      $result.isAdmin = isAdmin;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (roomTitle != null) {
      $result.roomTitle = roomTitle;
    }
    if (ltiCustomParameters != null) {
      $result.ltiCustomParameters = ltiCustomParameters;
    }
    return $result;
  }
  LtiClaims._() : super();
  factory LtiClaims.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LtiClaims.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LtiClaims', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOB(3, _omitFieldNames ? '' : 'isAdmin')
    ..aOS(4, _omitFieldNames ? '' : 'roomId')
    ..aOS(5, _omitFieldNames ? '' : 'roomTitle')
    ..aOM<LtiCustomParameters>(6, _omitFieldNames ? '' : 'ltiCustomParameters', subBuilder: LtiCustomParameters.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LtiClaims clone() => LtiClaims()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LtiClaims copyWith(void Function(LtiClaims) updates) => super.copyWith((message) => updates(message as LtiClaims)) as LtiClaims;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LtiClaims create() => LtiClaims._();
  LtiClaims createEmptyInstance() => create();
  static $pb.PbList<LtiClaims> createRepeated() => $pb.PbList<LtiClaims>();
  @$core.pragma('dart2js:noInline')
  static LtiClaims getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LtiClaims>(create);
  static LtiClaims? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.bool get isAdmin => $_getBF(2);
  @$pb.TagNumber(3)
  set isAdmin($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAdmin() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAdmin() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomId => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get roomTitle => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomTitle($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRoomTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomTitle() => clearField(5);

  @$pb.TagNumber(6)
  LtiCustomParameters get ltiCustomParameters => $_getN(5);
  @$pb.TagNumber(6)
  set ltiCustomParameters(LtiCustomParameters v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLtiCustomParameters() => $_has(5);
  @$pb.TagNumber(6)
  void clearLtiCustomParameters() => clearField(6);
  @$pb.TagNumber(6)
  LtiCustomParameters ensureLtiCustomParameters() => $_ensure(5);
}

class LtiCustomParameters extends $pb.GeneratedMessage {
  factory LtiCustomParameters({
    $fixnum.Int64? roomDuration,
    $core.bool? allowPolls,
    $core.bool? allowSharedNotePad,
    $core.bool? allowBreakoutRoom,
    $core.bool? allowRecording,
    $core.bool? allowRtmp,
    $core.bool? allowViewOtherWebcams,
    $core.bool? allowViewOtherUsersList,
    $core.bool? muteOnStart,
    LtiCustomDesign? ltiCustomDesign,
  }) {
    final $result = create();
    if (roomDuration != null) {
      $result.roomDuration = roomDuration;
    }
    if (allowPolls != null) {
      $result.allowPolls = allowPolls;
    }
    if (allowSharedNotePad != null) {
      $result.allowSharedNotePad = allowSharedNotePad;
    }
    if (allowBreakoutRoom != null) {
      $result.allowBreakoutRoom = allowBreakoutRoom;
    }
    if (allowRecording != null) {
      $result.allowRecording = allowRecording;
    }
    if (allowRtmp != null) {
      $result.allowRtmp = allowRtmp;
    }
    if (allowViewOtherWebcams != null) {
      $result.allowViewOtherWebcams = allowViewOtherWebcams;
    }
    if (allowViewOtherUsersList != null) {
      $result.allowViewOtherUsersList = allowViewOtherUsersList;
    }
    if (muteOnStart != null) {
      $result.muteOnStart = muteOnStart;
    }
    if (ltiCustomDesign != null) {
      $result.ltiCustomDesign = ltiCustomDesign;
    }
    return $result;
  }
  LtiCustomParameters._() : super();
  factory LtiCustomParameters.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LtiCustomParameters.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LtiCustomParameters', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'roomDuration', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(2, _omitFieldNames ? '' : 'allowPolls')
    ..aOB(3, _omitFieldNames ? '' : 'allowSharedNotePad')
    ..aOB(4, _omitFieldNames ? '' : 'allowBreakoutRoom')
    ..aOB(5, _omitFieldNames ? '' : 'allowRecording')
    ..aOB(6, _omitFieldNames ? '' : 'allowRtmp')
    ..aOB(7, _omitFieldNames ? '' : 'allowViewOtherWebcams')
    ..aOB(8, _omitFieldNames ? '' : 'allowViewOtherUsersList')
    ..aOB(9, _omitFieldNames ? '' : 'muteOnStart')
    ..aOM<LtiCustomDesign>(10, _omitFieldNames ? '' : 'ltiCustomDesign', subBuilder: LtiCustomDesign.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LtiCustomParameters clone() => LtiCustomParameters()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LtiCustomParameters copyWith(void Function(LtiCustomParameters) updates) => super.copyWith((message) => updates(message as LtiCustomParameters)) as LtiCustomParameters;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LtiCustomParameters create() => LtiCustomParameters._();
  LtiCustomParameters createEmptyInstance() => create();
  static $pb.PbList<LtiCustomParameters> createRepeated() => $pb.PbList<LtiCustomParameters>();
  @$core.pragma('dart2js:noInline')
  static LtiCustomParameters getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LtiCustomParameters>(create);
  static LtiCustomParameters? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomDuration => $_getI64(0);
  @$pb.TagNumber(1)
  set roomDuration($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomDuration() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomDuration() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get allowPolls => $_getBF(1);
  @$pb.TagNumber(2)
  set allowPolls($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAllowPolls() => $_has(1);
  @$pb.TagNumber(2)
  void clearAllowPolls() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get allowSharedNotePad => $_getBF(2);
  @$pb.TagNumber(3)
  set allowSharedNotePad($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAllowSharedNotePad() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowSharedNotePad() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get allowBreakoutRoom => $_getBF(3);
  @$pb.TagNumber(4)
  set allowBreakoutRoom($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAllowBreakoutRoom() => $_has(3);
  @$pb.TagNumber(4)
  void clearAllowBreakoutRoom() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get allowRecording => $_getBF(4);
  @$pb.TagNumber(5)
  set allowRecording($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAllowRecording() => $_has(4);
  @$pb.TagNumber(5)
  void clearAllowRecording() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get allowRtmp => $_getBF(5);
  @$pb.TagNumber(6)
  set allowRtmp($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAllowRtmp() => $_has(5);
  @$pb.TagNumber(6)
  void clearAllowRtmp() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get allowViewOtherWebcams => $_getBF(6);
  @$pb.TagNumber(7)
  set allowViewOtherWebcams($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAllowViewOtherWebcams() => $_has(6);
  @$pb.TagNumber(7)
  void clearAllowViewOtherWebcams() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get allowViewOtherUsersList => $_getBF(7);
  @$pb.TagNumber(8)
  set allowViewOtherUsersList($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAllowViewOtherUsersList() => $_has(7);
  @$pb.TagNumber(8)
  void clearAllowViewOtherUsersList() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get muteOnStart => $_getBF(8);
  @$pb.TagNumber(9)
  set muteOnStart($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMuteOnStart() => $_has(8);
  @$pb.TagNumber(9)
  void clearMuteOnStart() => clearField(9);

  @$pb.TagNumber(10)
  LtiCustomDesign get ltiCustomDesign => $_getN(9);
  @$pb.TagNumber(10)
  set ltiCustomDesign(LtiCustomDesign v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasLtiCustomDesign() => $_has(9);
  @$pb.TagNumber(10)
  void clearLtiCustomDesign() => clearField(10);
  @$pb.TagNumber(10)
  LtiCustomDesign ensureLtiCustomDesign() => $_ensure(9);
}

class LtiCustomDesign extends $pb.GeneratedMessage {
  factory LtiCustomDesign({
    $core.String? primaryColor,
    $core.String? secondaryColor,
    $core.String? backgroundColor,
    $core.String? customLogo,
  }) {
    final $result = create();
    if (primaryColor != null) {
      $result.primaryColor = primaryColor;
    }
    if (secondaryColor != null) {
      $result.secondaryColor = secondaryColor;
    }
    if (backgroundColor != null) {
      $result.backgroundColor = backgroundColor;
    }
    if (customLogo != null) {
      $result.customLogo = customLogo;
    }
    return $result;
  }
  LtiCustomDesign._() : super();
  factory LtiCustomDesign.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LtiCustomDesign.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LtiCustomDesign', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'primaryColor')
    ..aOS(2, _omitFieldNames ? '' : 'secondaryColor')
    ..aOS(3, _omitFieldNames ? '' : 'backgroundColor')
    ..aOS(4, _omitFieldNames ? '' : 'customLogo')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LtiCustomDesign clone() => LtiCustomDesign()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LtiCustomDesign copyWith(void Function(LtiCustomDesign) updates) => super.copyWith((message) => updates(message as LtiCustomDesign)) as LtiCustomDesign;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LtiCustomDesign create() => LtiCustomDesign._();
  LtiCustomDesign createEmptyInstance() => create();
  static $pb.PbList<LtiCustomDesign> createRepeated() => $pb.PbList<LtiCustomDesign>();
  @$core.pragma('dart2js:noInline')
  static LtiCustomDesign getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LtiCustomDesign>(create);
  static LtiCustomDesign? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get primaryColor => $_getSZ(0);
  @$pb.TagNumber(1)
  set primaryColor($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrimaryColor() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrimaryColor() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secondaryColor => $_getSZ(1);
  @$pb.TagNumber(2)
  set secondaryColor($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecondaryColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecondaryColor() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get backgroundColor => $_getSZ(2);
  @$pb.TagNumber(3)
  set backgroundColor($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBackgroundColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearBackgroundColor() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get customLogo => $_getSZ(3);
  @$pb.TagNumber(4)
  set customLogo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCustomLogo() => $_has(3);
  @$pb.TagNumber(4)
  void clearCustomLogo() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
