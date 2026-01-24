// This is a generated file - do not edit.
//
// Generated from wajlc_gen_token.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GenerateTokenReq extends $pb.GeneratedMessage {
  factory GenerateTokenReq({
    $core.String? roomId,
    UserInfo? userInfo,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (userInfo != null) result.userInfo = userInfo;
    return result;
  }

  GenerateTokenReq._();

  factory GenerateTokenReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateTokenReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateTokenReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOM<UserInfo>(2, _omitFieldNames ? '' : 'userInfo',
        subBuilder: UserInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateTokenReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateTokenReq copyWith(void Function(GenerateTokenReq) updates) =>
      super.copyWith((message) => updates(message as GenerateTokenReq))
          as GenerateTokenReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateTokenReq create() => GenerateTokenReq._();
  @$core.override
  GenerateTokenReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateTokenReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateTokenReq>(create);
  static GenerateTokenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  UserInfo get userInfo => $_getN(1);
  @$pb.TagNumber(2)
  set userInfo(UserInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUserInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserInfo() => $_clearField(2);
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
    final result = create();
    if (name != null) result.name = name;
    if (userId != null) result.userId = userId;
    if (isAdmin != null) result.isAdmin = isAdmin;
    if (isHidden != null) result.isHidden = isHidden;
    if (userMetadata != null) result.userMetadata = userMetadata;
    return result;
  }

  UserInfo._();

  factory UserInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOB(3, _omitFieldNames ? '' : 'isAdmin')
    ..aOB(4, _omitFieldNames ? '' : 'isHidden')
    ..aOM<UserMetadata>(5, _omitFieldNames ? '' : 'userMetadata',
        subBuilder: UserMetadata.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfo copyWith(void Function(UserInfo) updates) =>
      super.copyWith((message) => updates(message as UserInfo)) as UserInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfo create() => UserInfo._();
  @$core.override
  UserInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfo>(create);
  static UserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAdmin => $_getBF(2);
  @$pb.TagNumber(3)
  set isAdmin($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsAdmin() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAdmin() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isHidden => $_getBF(3);
  @$pb.TagNumber(4)
  set isHidden($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsHidden() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsHidden() => $_clearField(4);

  @$pb.TagNumber(5)
  UserMetadata get userMetadata => $_getN(4);
  @$pb.TagNumber(5)
  set userMetadata(UserMetadata value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasUserMetadata() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserMetadata() => $_clearField(5);
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
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? extraData,
    $core.String? exUserId,
  }) {
    final result = create();
    if (profilePic != null) result.profilePic = profilePic;
    if (isAdmin != null) result.isAdmin = isAdmin;
    if (recordWebcam != null) result.recordWebcam = recordWebcam;
    if (isPresenter != null) result.isPresenter = isPresenter;
    if (raisedHand != null) result.raisedHand = raisedHand;
    if (waitForApproval != null) result.waitForApproval = waitForApproval;
    if (preferredLang != null) result.preferredLang = preferredLang;
    if (lockSettings != null) result.lockSettings = lockSettings;
    if (metadataId != null) result.metadataId = metadataId;
    if (extraData != null) result.extraData.addEntries(extraData);
    if (exUserId != null) result.exUserId = exUserId;
    return result;
  }

  UserMetadata._();

  factory UserMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'profilePic')
    ..aOB(2, _omitFieldNames ? '' : 'isAdmin')
    ..aOB(3, _omitFieldNames ? '' : 'recordWebcam')
    ..aOB(4, _omitFieldNames ? '' : 'isPresenter')
    ..aOB(5, _omitFieldNames ? '' : 'raisedHand')
    ..aOB(6, _omitFieldNames ? '' : 'waitForApproval')
    ..aOS(7, _omitFieldNames ? '' : 'preferredLang')
    ..aOM<LockSettings>(8, _omitFieldNames ? '' : 'lockSettings',
        subBuilder: LockSettings.create)
    ..aOS(9, _omitFieldNames ? '' : 'metadataId')
    ..m<$core.String, $core.String>(10, _omitFieldNames ? '' : 'extraData',
        entryClassName: 'UserMetadata.ExtraDataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('wajlc'))
    ..aOS(11, _omitFieldNames ? '' : 'exUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserMetadata copyWith(void Function(UserMetadata) updates) =>
      super.copyWith((message) => updates(message as UserMetadata))
          as UserMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserMetadata create() => UserMetadata._();
  @$core.override
  UserMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserMetadata>(create);
  static UserMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get profilePic => $_getSZ(0);
  @$pb.TagNumber(1)
  set profilePic($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProfilePic() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfilePic() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAdmin => $_getBF(1);
  @$pb.TagNumber(2)
  set isAdmin($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsAdmin() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAdmin() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get recordWebcam => $_getBF(2);
  @$pb.TagNumber(3)
  set recordWebcam($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRecordWebcam() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecordWebcam() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isPresenter => $_getBF(3);
  @$pb.TagNumber(4)
  set isPresenter($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsPresenter() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsPresenter() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get raisedHand => $_getBF(4);
  @$pb.TagNumber(5)
  set raisedHand($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRaisedHand() => $_has(4);
  @$pb.TagNumber(5)
  void clearRaisedHand() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get waitForApproval => $_getBF(5);
  @$pb.TagNumber(6)
  set waitForApproval($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasWaitForApproval() => $_has(5);
  @$pb.TagNumber(6)
  void clearWaitForApproval() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get preferredLang => $_getSZ(6);
  @$pb.TagNumber(7)
  set preferredLang($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPreferredLang() => $_has(6);
  @$pb.TagNumber(7)
  void clearPreferredLang() => $_clearField(7);

  @$pb.TagNumber(8)
  LockSettings get lockSettings => $_getN(7);
  @$pb.TagNumber(8)
  set lockSettings(LockSettings value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasLockSettings() => $_has(7);
  @$pb.TagNumber(8)
  void clearLockSettings() => $_clearField(8);
  @$pb.TagNumber(8)
  LockSettings ensureLockSettings() => $_ensure(7);

  /// we'll use this as version control
  @$pb.TagNumber(9)
  $core.String get metadataId => $_getSZ(8);
  @$pb.TagNumber(9)
  set metadataId($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasMetadataId() => $_has(8);
  @$pb.TagNumber(9)
  void clearMetadataId() => $_clearField(9);

  @$pb.TagNumber(10)
  $pb.PbMap<$core.String, $core.String> get extraData => $_getMap(9);

  /// if remain empty then will use value from user_id
  @$pb.TagNumber(11)
  $core.String get exUserId => $_getSZ(10);
  @$pb.TagNumber(11)
  set exUserId($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasExUserId() => $_has(10);
  @$pb.TagNumber(11)
  void clearExUserId() => $_clearField(11);
}

class WajlcTokenClaims extends $pb.GeneratedMessage {
  factory WajlcTokenClaims({
    $core.String? name,
    $core.String? userId,
    $core.String? roomId,
    $core.bool? isAdmin,
    $core.bool? isHidden,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (userId != null) result.userId = userId;
    if (roomId != null) result.roomId = roomId;
    if (isAdmin != null) result.isAdmin = isAdmin;
    if (isHidden != null) result.isHidden = isHidden;
    return result;
  }

  WajlcTokenClaims._();

  factory WajlcTokenClaims.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WajlcTokenClaims.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WajlcTokenClaims',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..aOB(4, _omitFieldNames ? '' : 'isAdmin')
    ..aOB(5, _omitFieldNames ? '' : 'isHidden')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WajlcTokenClaims clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WajlcTokenClaims copyWith(void Function(WajlcTokenClaims) updates) =>
      super.copyWith((message) => updates(message as WajlcTokenClaims))
          as WajlcTokenClaims;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WajlcTokenClaims create() => WajlcTokenClaims._();
  @$core.override
  WajlcTokenClaims createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WajlcTokenClaims getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WajlcTokenClaims>(create);
  static WajlcTokenClaims? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isAdmin => $_getBF(3);
  @$pb.TagNumber(4)
  set isAdmin($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsAdmin() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsAdmin() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isHidden => $_getBF(4);
  @$pb.TagNumber(5)
  set isHidden($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsHidden() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsHidden() => $_clearField(5);
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
    final result = create();
    if (lockMicrophone != null) result.lockMicrophone = lockMicrophone;
    if (lockWebcam != null) result.lockWebcam = lockWebcam;
    if (lockScreenSharing != null) result.lockScreenSharing = lockScreenSharing;
    if (lockChat != null) result.lockChat = lockChat;
    if (lockChatSendMessage != null)
      result.lockChatSendMessage = lockChatSendMessage;
    if (lockChatFileShare != null) result.lockChatFileShare = lockChatFileShare;
    if (lockPrivateChat != null) result.lockPrivateChat = lockPrivateChat;
    if (lockWhiteboard != null) result.lockWhiteboard = lockWhiteboard;
    if (lockSharedNotepad != null) result.lockSharedNotepad = lockSharedNotepad;
    return result;
  }

  LockSettings._();

  factory LockSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LockSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LockSettings',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'lockMicrophone')
    ..aOB(2, _omitFieldNames ? '' : 'lockWebcam')
    ..aOB(3, _omitFieldNames ? '' : 'lockScreenSharing')
    ..aOB(4, _omitFieldNames ? '' : 'lockChat')
    ..aOB(5, _omitFieldNames ? '' : 'lockChatSendMessage')
    ..aOB(6, _omitFieldNames ? '' : 'lockChatFileShare')
    ..aOB(7, _omitFieldNames ? '' : 'lockPrivateChat')
    ..aOB(8, _omitFieldNames ? '' : 'lockWhiteboard')
    ..aOB(9, _omitFieldNames ? '' : 'lockSharedNotepad')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LockSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LockSettings copyWith(void Function(LockSettings) updates) =>
      super.copyWith((message) => updates(message as LockSettings))
          as LockSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LockSettings create() => LockSettings._();
  @$core.override
  LockSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LockSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LockSettings>(create);
  static LockSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get lockMicrophone => $_getBF(0);
  @$pb.TagNumber(1)
  set lockMicrophone($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLockMicrophone() => $_has(0);
  @$pb.TagNumber(1)
  void clearLockMicrophone() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get lockWebcam => $_getBF(1);
  @$pb.TagNumber(2)
  set lockWebcam($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLockWebcam() => $_has(1);
  @$pb.TagNumber(2)
  void clearLockWebcam() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get lockScreenSharing => $_getBF(2);
  @$pb.TagNumber(3)
  set lockScreenSharing($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLockScreenSharing() => $_has(2);
  @$pb.TagNumber(3)
  void clearLockScreenSharing() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get lockChat => $_getBF(3);
  @$pb.TagNumber(4)
  set lockChat($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLockChat() => $_has(3);
  @$pb.TagNumber(4)
  void clearLockChat() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get lockChatSendMessage => $_getBF(4);
  @$pb.TagNumber(5)
  set lockChatSendMessage($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLockChatSendMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearLockChatSendMessage() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get lockChatFileShare => $_getBF(5);
  @$pb.TagNumber(6)
  set lockChatFileShare($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLockChatFileShare() => $_has(5);
  @$pb.TagNumber(6)
  void clearLockChatFileShare() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get lockPrivateChat => $_getBF(6);
  @$pb.TagNumber(7)
  set lockPrivateChat($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLockPrivateChat() => $_has(6);
  @$pb.TagNumber(7)
  void clearLockPrivateChat() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get lockWhiteboard => $_getBF(7);
  @$pb.TagNumber(8)
  set lockWhiteboard($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLockWhiteboard() => $_has(7);
  @$pb.TagNumber(8)
  void clearLockWhiteboard() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get lockSharedNotepad => $_getBF(8);
  @$pb.TagNumber(9)
  set lockSharedNotepad($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasLockSharedNotepad() => $_has(8);
  @$pb.TagNumber(9)
  void clearLockSharedNotepad() => $_clearField(9);
}

class GenerateTokenRes extends $pb.GeneratedMessage {
  factory GenerateTokenRes({
    $core.bool? status,
    $core.String? msg,
    $core.String? token,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (token != null) result.token = token;
    return result;
  }

  GenerateTokenRes._();

  factory GenerateTokenRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateTokenRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateTokenRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateTokenRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateTokenRes copyWith(void Function(GenerateTokenRes) updates) =>
      super.copyWith((message) => updates(message as GenerateTokenRes))
          as GenerateTokenRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateTokenRes create() => GenerateTokenRes._();
  @$core.override
  GenerateTokenRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateTokenRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateTokenRes>(create);
  static GenerateTokenRes? _defaultInstance;

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
    final result = create();
    if (primaryColor != null) result.primaryColor = primaryColor;
    if (secondaryColor != null) result.secondaryColor = secondaryColor;
    if (backgroundColor != null) result.backgroundColor = backgroundColor;
    if (backgroundImage != null) result.backgroundImage = backgroundImage;
    if (headerBgColor != null) result.headerBgColor = headerBgColor;
    if (footerBgColor != null) result.footerBgColor = footerBgColor;
    if (leftSideBgColor != null) result.leftSideBgColor = leftSideBgColor;
    if (rightSideBgColor != null) result.rightSideBgColor = rightSideBgColor;
    if (customCssUrl != null) result.customCssUrl = customCssUrl;
    if (customLogo != null) result.customLogo = customLogo;
    return result;
  }

  CustomDesignParams._();

  factory CustomDesignParams.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CustomDesignParams.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CustomDesignParams',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
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
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomDesignParams clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomDesignParams copyWith(void Function(CustomDesignParams) updates) =>
      super.copyWith((message) => updates(message as CustomDesignParams))
          as CustomDesignParams;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomDesignParams create() => CustomDesignParams._();
  @$core.override
  CustomDesignParams createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CustomDesignParams getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CustomDesignParams>(create);
  static CustomDesignParams? _defaultInstance;

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
  $core.String get backgroundImage => $_getSZ(3);
  @$pb.TagNumber(4)
  set backgroundImage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBackgroundImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearBackgroundImage() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get headerBgColor => $_getSZ(4);
  @$pb.TagNumber(5)
  set headerBgColor($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasHeaderBgColor() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeaderBgColor() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get footerBgColor => $_getSZ(5);
  @$pb.TagNumber(6)
  set footerBgColor($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFooterBgColor() => $_has(5);
  @$pb.TagNumber(6)
  void clearFooterBgColor() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get leftSideBgColor => $_getSZ(6);
  @$pb.TagNumber(7)
  set leftSideBgColor($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLeftSideBgColor() => $_has(6);
  @$pb.TagNumber(7)
  void clearLeftSideBgColor() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get rightSideBgColor => $_getSZ(7);
  @$pb.TagNumber(8)
  set rightSideBgColor($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRightSideBgColor() => $_has(7);
  @$pb.TagNumber(8)
  void clearRightSideBgColor() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get customCssUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set customCssUrl($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCustomCssUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearCustomCssUrl() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get customLogo => $_getSZ(9);
  @$pb.TagNumber(10)
  set customLogo($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCustomLogo() => $_has(9);
  @$pb.TagNumber(10)
  void clearCustomLogo() => $_clearField(10);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
