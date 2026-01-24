//
//  Generated code. Do not modify.
//  source: wajlc_gen_token.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GenerateTokenReq extends $pb.GeneratedMessage {
  factory GenerateTokenReq({
    $core.String? roomId,
    UserInfo? userInfo,
  }) {
    final $result = create();
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (userInfo != null) {
      $result.userInfo = userInfo;
    }
    return $result;
  }
  GenerateTokenReq._() : super();
  factory GenerateTokenReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateTokenReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerateTokenReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOM<UserInfo>(2, _omitFieldNames ? '' : 'userInfo', subBuilder: UserInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateTokenReq clone() => GenerateTokenReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerateTokenReq copyWith(void Function(GenerateTokenReq) updates) => super.copyWith((message) => updates(message as GenerateTokenReq)) as GenerateTokenReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateTokenReq create() => GenerateTokenReq._();
  GenerateTokenReq createEmptyInstance() => create();
  static $pb.PbList<GenerateTokenReq> createRepeated() => $pb.PbList<GenerateTokenReq>();
  @$core.pragma('dart2js:noInline')
  static GenerateTokenReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateTokenReq>(create);
  static GenerateTokenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  UserInfo get userInfo => $_getN(1);
  @$pb.TagNumber(2)
  set userInfo(UserInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserInfo() => clearField(2);
  @$pb.TagNumber(2)
  UserInfo ensureUserInfo() => $_ensure(1);
}

class UserInfo extends $pb.GeneratedMessage {
  factory UserInfo({
    $core.String? name,
    $core.String? userId,
    $core.bool? isAdmin,
    $core.bool? isHidden,
    UserMetadata? userMetadata,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (isAdmin != null) {
      $result.isAdmin = isAdmin;
    }
    if (isHidden != null) {
      $result.isHidden = isHidden;
    }
    if (userMetadata != null) {
      $result.userMetadata = userMetadata;
    }
    return $result;
  }
  UserInfo._() : super();
  factory UserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOB(3, _omitFieldNames ? '' : 'isAdmin')
    ..aOB(4, _omitFieldNames ? '' : 'isHidden')
    ..aOM<UserMetadata>(5, _omitFieldNames ? '' : 'userMetadata', subBuilder: UserMetadata.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfo clone() => UserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfo copyWith(void Function(UserInfo) updates) => super.copyWith((message) => updates(message as UserInfo)) as UserInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfo create() => UserInfo._();
  UserInfo createEmptyInstance() => create();
  static $pb.PbList<UserInfo> createRepeated() => $pb.PbList<UserInfo>();
  @$core.pragma('dart2js:noInline')
  static UserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfo>(create);
  static UserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAdmin => $_getBF(2);
  @$pb.TagNumber(3)
  set isAdmin($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAdmin() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAdmin() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isHidden => $_getBF(3);
  @$pb.TagNumber(4)
  set isHidden($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsHidden() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsHidden() => clearField(4);

  @$pb.TagNumber(5)
  UserMetadata get userMetadata => $_getN(4);
  @$pb.TagNumber(5)
  set userMetadata(UserMetadata v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserMetadata() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserMetadata() => clearField(5);
  @$pb.TagNumber(5)
  UserMetadata ensureUserMetadata() => $_ensure(4);
}

class UserMetadata extends $pb.GeneratedMessage {
  factory UserMetadata({
    $core.String? profilePic,
    $core.bool? isAdmin,
    $core.bool? recordWebcam,
    $core.bool? isPresenter,
    $core.bool? raisedHand,
    $core.bool? waitForApproval,
    $core.String? preferredLang,
    LockSettings? lockSettings,
    $core.String? metadataId,
    $core.Map<$core.String, $core.String>? extraData,
    $core.String? exUserId,
  }) {
    final $result = create();
    if (profilePic != null) {
      $result.profilePic = profilePic;
    }
    if (isAdmin != null) {
      $result.isAdmin = isAdmin;
    }
    if (recordWebcam != null) {
      $result.recordWebcam = recordWebcam;
    }
    if (isPresenter != null) {
      $result.isPresenter = isPresenter;
    }
    if (raisedHand != null) {
      $result.raisedHand = raisedHand;
    }
    if (waitForApproval != null) {
      $result.waitForApproval = waitForApproval;
    }
    if (preferredLang != null) {
      $result.preferredLang = preferredLang;
    }
    if (lockSettings != null) {
      $result.lockSettings = lockSettings;
    }
    if (metadataId != null) {
      $result.metadataId = metadataId;
    }
    if (extraData != null) {
      $result.extraData.addAll(extraData);
    }
    if (exUserId != null) {
      $result.exUserId = exUserId;
    }
    return $result;
  }
  UserMetadata._() : super();
  factory UserMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserMetadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'profilePic')
    ..aOB(2, _omitFieldNames ? '' : 'isAdmin')
    ..aOB(3, _omitFieldNames ? '' : 'recordWebcam')
    ..aOB(4, _omitFieldNames ? '' : 'isPresenter')
    ..aOB(5, _omitFieldNames ? '' : 'raisedHand')
    ..aOB(6, _omitFieldNames ? '' : 'waitForApproval')
    ..aOS(7, _omitFieldNames ? '' : 'preferredLang')
    ..aOM<LockSettings>(8, _omitFieldNames ? '' : 'lockSettings', subBuilder: LockSettings.create)
    ..aOS(9, _omitFieldNames ? '' : 'metadataId')
    ..m<$core.String, $core.String>(10, _omitFieldNames ? '' : 'extraData', entryClassName: 'UserMetadata.ExtraDataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('wajlc'))
    ..aOS(11, _omitFieldNames ? '' : 'exUserId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserMetadata clone() => UserMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserMetadata copyWith(void Function(UserMetadata) updates) => super.copyWith((message) => updates(message as UserMetadata)) as UserMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserMetadata create() => UserMetadata._();
  UserMetadata createEmptyInstance() => create();
  static $pb.PbList<UserMetadata> createRepeated() => $pb.PbList<UserMetadata>();
  @$core.pragma('dart2js:noInline')
  static UserMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserMetadata>(create);
  static UserMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get profilePic => $_getSZ(0);
  @$pb.TagNumber(1)
  set profilePic($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProfilePic() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfilePic() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAdmin => $_getBF(1);
  @$pb.TagNumber(2)
  set isAdmin($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsAdmin() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAdmin() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get recordWebcam => $_getBF(2);
  @$pb.TagNumber(3)
  set recordWebcam($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRecordWebcam() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecordWebcam() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isPresenter => $_getBF(3);
  @$pb.TagNumber(4)
  set isPresenter($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsPresenter() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsPresenter() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get raisedHand => $_getBF(4);
  @$pb.TagNumber(5)
  set raisedHand($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRaisedHand() => $_has(4);
  @$pb.TagNumber(5)
  void clearRaisedHand() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get waitForApproval => $_getBF(5);
  @$pb.TagNumber(6)
  set waitForApproval($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWaitForApproval() => $_has(5);
  @$pb.TagNumber(6)
  void clearWaitForApproval() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get preferredLang => $_getSZ(6);
  @$pb.TagNumber(7)
  set preferredLang($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPreferredLang() => $_has(6);
  @$pb.TagNumber(7)
  void clearPreferredLang() => clearField(7);

  @$pb.TagNumber(8)
  LockSettings get lockSettings => $_getN(7);
  @$pb.TagNumber(8)
  set lockSettings(LockSettings v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasLockSettings() => $_has(7);
  @$pb.TagNumber(8)
  void clearLockSettings() => clearField(8);
  @$pb.TagNumber(8)
  LockSettings ensureLockSettings() => $_ensure(7);

  /// we'll use this as version control
  @$pb.TagNumber(9)
  $core.String get metadataId => $_getSZ(8);
  @$pb.TagNumber(9)
  set metadataId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMetadataId() => $_has(8);
  @$pb.TagNumber(9)
  void clearMetadataId() => clearField(9);

  @$pb.TagNumber(10)
  $core.Map<$core.String, $core.String> get extraData => $_getMap(9);

  /// if remain empty then will use value from user_id
  @$pb.TagNumber(11)
  $core.String get exUserId => $_getSZ(10);
  @$pb.TagNumber(11)
  set exUserId($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasExUserId() => $_has(10);
  @$pb.TagNumber(11)
  void clearExUserId() => clearField(11);
}

class WajlcTokenClaims extends $pb.GeneratedMessage {
  factory WajlcTokenClaims({
    $core.String? name,
    $core.String? userId,
    $core.String? roomId,
    $core.bool? isAdmin,
    $core.bool? isHidden,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (isAdmin != null) {
      $result.isAdmin = isAdmin;
    }
    if (isHidden != null) {
      $result.isHidden = isHidden;
    }
    return $result;
  }
  WajlcTokenClaims._() : super();
  factory WajlcTokenClaims.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WajlcTokenClaims.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WajlcTokenClaims', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..aOB(4, _omitFieldNames ? '' : 'isAdmin')
    ..aOB(5, _omitFieldNames ? '' : 'isHidden')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WajlcTokenClaims clone() => WajlcTokenClaims()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WajlcTokenClaims copyWith(void Function(WajlcTokenClaims) updates) => super.copyWith((message) => updates(message as WajlcTokenClaims)) as WajlcTokenClaims;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WajlcTokenClaims create() => WajlcTokenClaims._();
  WajlcTokenClaims createEmptyInstance() => create();
  static $pb.PbList<WajlcTokenClaims> createRepeated() => $pb.PbList<WajlcTokenClaims>();
  @$core.pragma('dart2js:noInline')
  static WajlcTokenClaims getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WajlcTokenClaims>(create);
  static WajlcTokenClaims? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isAdmin => $_getBF(3);
  @$pb.TagNumber(4)
  set isAdmin($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsAdmin() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsAdmin() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isHidden => $_getBF(4);
  @$pb.TagNumber(5)
  set isHidden($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsHidden() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsHidden() => clearField(5);
}

class LockSettings extends $pb.GeneratedMessage {
  factory LockSettings({
    $core.bool? lockMicrophone,
    $core.bool? lockWebcam,
    $core.bool? lockScreenSharing,
    $core.bool? lockChat,
    $core.bool? lockChatSendMessage,
    $core.bool? lockChatFileShare,
    $core.bool? lockPrivateChat,
    $core.bool? lockWhiteboard,
    $core.bool? lockSharedNotepad,
  }) {
    final $result = create();
    if (lockMicrophone != null) {
      $result.lockMicrophone = lockMicrophone;
    }
    if (lockWebcam != null) {
      $result.lockWebcam = lockWebcam;
    }
    if (lockScreenSharing != null) {
      $result.lockScreenSharing = lockScreenSharing;
    }
    if (lockChat != null) {
      $result.lockChat = lockChat;
    }
    if (lockChatSendMessage != null) {
      $result.lockChatSendMessage = lockChatSendMessage;
    }
    if (lockChatFileShare != null) {
      $result.lockChatFileShare = lockChatFileShare;
    }
    if (lockPrivateChat != null) {
      $result.lockPrivateChat = lockPrivateChat;
    }
    if (lockWhiteboard != null) {
      $result.lockWhiteboard = lockWhiteboard;
    }
    if (lockSharedNotepad != null) {
      $result.lockSharedNotepad = lockSharedNotepad;
    }
    return $result;
  }
  LockSettings._() : super();
  factory LockSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LockSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LockSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'lockMicrophone')
    ..aOB(2, _omitFieldNames ? '' : 'lockWebcam')
    ..aOB(3, _omitFieldNames ? '' : 'lockScreenSharing')
    ..aOB(4, _omitFieldNames ? '' : 'lockChat')
    ..aOB(5, _omitFieldNames ? '' : 'lockChatSendMessage')
    ..aOB(6, _omitFieldNames ? '' : 'lockChatFileShare')
    ..aOB(7, _omitFieldNames ? '' : 'lockPrivateChat')
    ..aOB(8, _omitFieldNames ? '' : 'lockWhiteboard')
    ..aOB(9, _omitFieldNames ? '' : 'lockSharedNotepad')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LockSettings clone() => LockSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LockSettings copyWith(void Function(LockSettings) updates) => super.copyWith((message) => updates(message as LockSettings)) as LockSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LockSettings create() => LockSettings._();
  LockSettings createEmptyInstance() => create();
  static $pb.PbList<LockSettings> createRepeated() => $pb.PbList<LockSettings>();
  @$core.pragma('dart2js:noInline')
  static LockSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LockSettings>(create);
  static LockSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get lockMicrophone => $_getBF(0);
  @$pb.TagNumber(1)
  set lockMicrophone($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLockMicrophone() => $_has(0);
  @$pb.TagNumber(1)
  void clearLockMicrophone() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get lockWebcam => $_getBF(1);
  @$pb.TagNumber(2)
  set lockWebcam($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLockWebcam() => $_has(1);
  @$pb.TagNumber(2)
  void clearLockWebcam() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get lockScreenSharing => $_getBF(2);
  @$pb.TagNumber(3)
  set lockScreenSharing($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLockScreenSharing() => $_has(2);
  @$pb.TagNumber(3)
  void clearLockScreenSharing() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get lockChat => $_getBF(3);
  @$pb.TagNumber(4)
  set lockChat($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLockChat() => $_has(3);
  @$pb.TagNumber(4)
  void clearLockChat() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get lockChatSendMessage => $_getBF(4);
  @$pb.TagNumber(5)
  set lockChatSendMessage($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLockChatSendMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearLockChatSendMessage() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get lockChatFileShare => $_getBF(5);
  @$pb.TagNumber(6)
  set lockChatFileShare($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLockChatFileShare() => $_has(5);
  @$pb.TagNumber(6)
  void clearLockChatFileShare() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get lockPrivateChat => $_getBF(6);
  @$pb.TagNumber(7)
  set lockPrivateChat($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLockPrivateChat() => $_has(6);
  @$pb.TagNumber(7)
  void clearLockPrivateChat() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get lockWhiteboard => $_getBF(7);
  @$pb.TagNumber(8)
  set lockWhiteboard($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLockWhiteboard() => $_has(7);
  @$pb.TagNumber(8)
  void clearLockWhiteboard() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get lockSharedNotepad => $_getBF(8);
  @$pb.TagNumber(9)
  set lockSharedNotepad($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLockSharedNotepad() => $_has(8);
  @$pb.TagNumber(9)
  void clearLockSharedNotepad() => clearField(9);
}

class GenerateTokenRes extends $pb.GeneratedMessage {
  factory GenerateTokenRes({
    $core.bool? status,
    $core.String? msg,
    $core.String? token,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (token != null) {
      $result.token = token;
    }
    return $result;
  }
  GenerateTokenRes._() : super();
  factory GenerateTokenRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateTokenRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerateTokenRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateTokenRes clone() => GenerateTokenRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerateTokenRes copyWith(void Function(GenerateTokenRes) updates) => super.copyWith((message) => updates(message as GenerateTokenRes)) as GenerateTokenRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateTokenRes create() => GenerateTokenRes._();
  GenerateTokenRes createEmptyInstance() => create();
  static $pb.PbList<GenerateTokenRes> createRepeated() => $pb.PbList<GenerateTokenRes>();
  @$core.pragma('dart2js:noInline')
  static GenerateTokenRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateTokenRes>(create);
  static GenerateTokenRes? _defaultInstance;

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
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => clearField(3);
}

class CustomDesignParams extends $pb.GeneratedMessage {
  factory CustomDesignParams({
    $core.String? primaryColor,
    $core.String? secondaryColor,
    $core.String? backgroundColor,
    $core.String? backgroundImage,
    $core.String? headerBgColor,
    $core.String? footerBgColor,
    $core.String? leftSideBgColor,
    $core.String? rightSideBgColor,
    $core.String? customCssUrl,
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
    if (backgroundImage != null) {
      $result.backgroundImage = backgroundImage;
    }
    if (headerBgColor != null) {
      $result.headerBgColor = headerBgColor;
    }
    if (footerBgColor != null) {
      $result.footerBgColor = footerBgColor;
    }
    if (leftSideBgColor != null) {
      $result.leftSideBgColor = leftSideBgColor;
    }
    if (rightSideBgColor != null) {
      $result.rightSideBgColor = rightSideBgColor;
    }
    if (customCssUrl != null) {
      $result.customCssUrl = customCssUrl;
    }
    if (customLogo != null) {
      $result.customLogo = customLogo;
    }
    return $result;
  }
  CustomDesignParams._() : super();
  factory CustomDesignParams.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CustomDesignParams.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CustomDesignParams', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'primaryColor')
    ..aOS(2, _omitFieldNames ? '' : 'secondaryColor')
    ..aOS(3, _omitFieldNames ? '' : 'backgroundColor')
    ..aOS(4, _omitFieldNames ? '' : 'backgroundImage')
    ..aOS(5, _omitFieldNames ? '' : 'headerBgColor')
    ..aOS(6, _omitFieldNames ? '' : 'footerBgColor')
    ..aOS(7, _omitFieldNames ? '' : 'leftSideBgColor')
    ..aOS(8, _omitFieldNames ? '' : 'rightSideBgColor')
    ..aOS(9, _omitFieldNames ? '' : 'customCssUrl')
    ..aOS(10, _omitFieldNames ? '' : 'customLogo')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CustomDesignParams clone() => CustomDesignParams()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CustomDesignParams copyWith(void Function(CustomDesignParams) updates) => super.copyWith((message) => updates(message as CustomDesignParams)) as CustomDesignParams;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomDesignParams create() => CustomDesignParams._();
  CustomDesignParams createEmptyInstance() => create();
  static $pb.PbList<CustomDesignParams> createRepeated() => $pb.PbList<CustomDesignParams>();
  @$core.pragma('dart2js:noInline')
  static CustomDesignParams getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CustomDesignParams>(create);
  static CustomDesignParams? _defaultInstance;

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
  $core.String get backgroundImage => $_getSZ(3);
  @$pb.TagNumber(4)
  set backgroundImage($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBackgroundImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearBackgroundImage() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get headerBgColor => $_getSZ(4);
  @$pb.TagNumber(5)
  set headerBgColor($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeaderBgColor() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeaderBgColor() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get footerBgColor => $_getSZ(5);
  @$pb.TagNumber(6)
  set footerBgColor($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFooterBgColor() => $_has(5);
  @$pb.TagNumber(6)
  void clearFooterBgColor() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get leftSideBgColor => $_getSZ(6);
  @$pb.TagNumber(7)
  set leftSideBgColor($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLeftSideBgColor() => $_has(6);
  @$pb.TagNumber(7)
  void clearLeftSideBgColor() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get rightSideBgColor => $_getSZ(7);
  @$pb.TagNumber(8)
  set rightSideBgColor($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRightSideBgColor() => $_has(7);
  @$pb.TagNumber(8)
  void clearRightSideBgColor() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get customCssUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set customCssUrl($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCustomCssUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearCustomCssUrl() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get customLogo => $_getSZ(9);
  @$pb.TagNumber(10)
  set customLogo($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCustomLogo() => $_has(9);
  @$pb.TagNumber(10)
  void clearCustomLogo() => clearField(10);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
