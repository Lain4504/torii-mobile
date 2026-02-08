// This is a generated file - do not edit.
//
// Generated from wajlc_lti_v1.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class LtiClaims extends $pb.GeneratedMessage {
  factory LtiClaims({
    $core.String? userId,
    $core.String? name,
    $core.bool? isAdmin,
    $core.String? roomId,
    $core.String? roomTitle,
    LtiCustomParameters? ltiCustomParameters,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (name != null) result.name = name;
    if (isAdmin != null) result.isAdmin = isAdmin;
    if (roomId != null) result.roomId = roomId;
    if (roomTitle != null) result.roomTitle = roomTitle;
    if (ltiCustomParameters != null)
      result.ltiCustomParameters = ltiCustomParameters;
    return result;
  }

  LtiClaims._();

  factory LtiClaims.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LtiClaims.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LtiClaims',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOB(3, _omitFieldNames ? '' : 'isAdmin')
    ..aOS(4, _omitFieldNames ? '' : 'roomId')
    ..aOS(5, _omitFieldNames ? '' : 'roomTitle')
    ..aOM<LtiCustomParameters>(6, _omitFieldNames ? '' : 'ltiCustomParameters',
        subBuilder: LtiCustomParameters.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LtiClaims clone() => LtiClaims()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LtiClaims copyWith(void Function(LtiClaims) updates) =>
      super.copyWith((message) => updates(message as LtiClaims)) as LtiClaims;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LtiClaims create() => LtiClaims._();
  @$core.override
  LtiClaims createEmptyInstance() => create();
  static $pb.PbList<LtiClaims> createRepeated() => $pb.PbList<LtiClaims>();
  @$core.pragma('dart2js:noInline')
  static LtiClaims getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LtiClaims>(create);
  static LtiClaims? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.bool get isAdmin => $_getBF(2);
  @$pb.TagNumber(3)
  set isAdmin($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsAdmin() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAdmin() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomId => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get roomTitle => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomTitle($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRoomTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomTitle() => $_clearField(5);

  @$pb.TagNumber(6)
  LtiCustomParameters get ltiCustomParameters => $_getN(5);
  @$pb.TagNumber(6)
  set ltiCustomParameters(LtiCustomParameters value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasLtiCustomParameters() => $_has(5);
  @$pb.TagNumber(6)
  void clearLtiCustomParameters() => $_clearField(6);
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
    final result = create();
    if (roomDuration != null) result.roomDuration = roomDuration;
    if (allowPolls != null) result.allowPolls = allowPolls;
    if (allowSharedNotePad != null)
      result.allowSharedNotePad = allowSharedNotePad;
    if (allowBreakoutRoom != null) result.allowBreakoutRoom = allowBreakoutRoom;
    if (allowRecording != null) result.allowRecording = allowRecording;
    if (allowRtmp != null) result.allowRtmp = allowRtmp;
    if (allowViewOtherWebcams != null)
      result.allowViewOtherWebcams = allowViewOtherWebcams;
    if (allowViewOtherUsersList != null)
      result.allowViewOtherUsersList = allowViewOtherUsersList;
    if (muteOnStart != null) result.muteOnStart = muteOnStart;
    if (ltiCustomDesign != null) result.ltiCustomDesign = ltiCustomDesign;
    return result;
  }

  LtiCustomParameters._();

  factory LtiCustomParameters.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LtiCustomParameters.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LtiCustomParameters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'roomDuration', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(2, _omitFieldNames ? '' : 'allowPolls')
    ..aOB(3, _omitFieldNames ? '' : 'allowSharedNotePad')
    ..aOB(4, _omitFieldNames ? '' : 'allowBreakoutRoom')
    ..aOB(5, _omitFieldNames ? '' : 'allowRecording')
    ..aOB(6, _omitFieldNames ? '' : 'allowRtmp')
    ..aOB(7, _omitFieldNames ? '' : 'allowViewOtherWebcams')
    ..aOB(8, _omitFieldNames ? '' : 'allowViewOtherUsersList')
    ..aOB(9, _omitFieldNames ? '' : 'muteOnStart')
    ..aOM<LtiCustomDesign>(10, _omitFieldNames ? '' : 'ltiCustomDesign',
        subBuilder: LtiCustomDesign.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LtiCustomParameters clone() => LtiCustomParameters()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LtiCustomParameters copyWith(void Function(LtiCustomParameters) updates) =>
      super.copyWith((message) => updates(message as LtiCustomParameters))
          as LtiCustomParameters;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LtiCustomParameters create() => LtiCustomParameters._();
  @$core.override
  LtiCustomParameters createEmptyInstance() => create();
  static $pb.PbList<LtiCustomParameters> createRepeated() =>
      $pb.PbList<LtiCustomParameters>();
  @$core.pragma('dart2js:noInline')
  static LtiCustomParameters getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LtiCustomParameters>(create);
  static LtiCustomParameters? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomDuration => $_getI64(0);
  @$pb.TagNumber(1)
  set roomDuration($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomDuration() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomDuration() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get allowPolls => $_getBF(1);
  @$pb.TagNumber(2)
  set allowPolls($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAllowPolls() => $_has(1);
  @$pb.TagNumber(2)
  void clearAllowPolls() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get allowSharedNotePad => $_getBF(2);
  @$pb.TagNumber(3)
  set allowSharedNotePad($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAllowSharedNotePad() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowSharedNotePad() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get allowBreakoutRoom => $_getBF(3);
  @$pb.TagNumber(4)
  set allowBreakoutRoom($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAllowBreakoutRoom() => $_has(3);
  @$pb.TagNumber(4)
  void clearAllowBreakoutRoom() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get allowRecording => $_getBF(4);
  @$pb.TagNumber(5)
  set allowRecording($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAllowRecording() => $_has(4);
  @$pb.TagNumber(5)
  void clearAllowRecording() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get allowRtmp => $_getBF(5);
  @$pb.TagNumber(6)
  set allowRtmp($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAllowRtmp() => $_has(5);
  @$pb.TagNumber(6)
  void clearAllowRtmp() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get allowViewOtherWebcams => $_getBF(6);
  @$pb.TagNumber(7)
  set allowViewOtherWebcams($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAllowViewOtherWebcams() => $_has(6);
  @$pb.TagNumber(7)
  void clearAllowViewOtherWebcams() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get allowViewOtherUsersList => $_getBF(7);
  @$pb.TagNumber(8)
  set allowViewOtherUsersList($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAllowViewOtherUsersList() => $_has(7);
  @$pb.TagNumber(8)
  void clearAllowViewOtherUsersList() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get muteOnStart => $_getBF(8);
  @$pb.TagNumber(9)
  set muteOnStart($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasMuteOnStart() => $_has(8);
  @$pb.TagNumber(9)
  void clearMuteOnStart() => $_clearField(9);

  @$pb.TagNumber(10)
  LtiCustomDesign get ltiCustomDesign => $_getN(9);
  @$pb.TagNumber(10)
  set ltiCustomDesign(LtiCustomDesign value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasLtiCustomDesign() => $_has(9);
  @$pb.TagNumber(10)
  void clearLtiCustomDesign() => $_clearField(10);
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
    final result = create();
    if (primaryColor != null) result.primaryColor = primaryColor;
    if (secondaryColor != null) result.secondaryColor = secondaryColor;
    if (backgroundColor != null) result.backgroundColor = backgroundColor;
    if (customLogo != null) result.customLogo = customLogo;
    return result;
  }

  LtiCustomDesign._();

  factory LtiCustomDesign.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LtiCustomDesign.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LtiCustomDesign',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'primaryColor')
    ..aOS(2, _omitFieldNames ? '' : 'secondaryColor')
    ..aOS(3, _omitFieldNames ? '' : 'backgroundColor')
    ..aOS(4, _omitFieldNames ? '' : 'customLogo')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LtiCustomDesign clone() => LtiCustomDesign()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LtiCustomDesign copyWith(void Function(LtiCustomDesign) updates) =>
      super.copyWith((message) => updates(message as LtiCustomDesign))
          as LtiCustomDesign;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LtiCustomDesign create() => LtiCustomDesign._();
  @$core.override
  LtiCustomDesign createEmptyInstance() => create();
  static $pb.PbList<LtiCustomDesign> createRepeated() =>
      $pb.PbList<LtiCustomDesign>();
  @$core.pragma('dart2js:noInline')
  static LtiCustomDesign getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LtiCustomDesign>(create);
  static LtiCustomDesign? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get primaryColor => $_getSZ(0);
  @$pb.TagNumber(1)
  set primaryColor($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrimaryColor() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrimaryColor() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get secondaryColor => $_getSZ(1);
  @$pb.TagNumber(2)
  set secondaryColor($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSecondaryColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecondaryColor() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get backgroundColor => $_getSZ(2);
  @$pb.TagNumber(3)
  set backgroundColor($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBackgroundColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearBackgroundColor() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get customLogo => $_getSZ(3);
  @$pb.TagNumber(4)
  set customLogo($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCustomLogo() => $_has(3);
  @$pb.TagNumber(4)
  void clearCustomLogo() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
