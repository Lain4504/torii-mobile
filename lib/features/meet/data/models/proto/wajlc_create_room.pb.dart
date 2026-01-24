//
//  Generated code. Do not modify.
//  source: wajlc_create_room.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_auth_room.pb.dart' as $19;
import 'wajlc_gen_token.pb.dart' as $24;
import 'wajlc_ingress.pbenum.dart' as $25;

class CreateRoomReq extends $pb.GeneratedMessage {
  factory CreateRoomReq({
    $core.String? roomId,
    $core.int? emptyTimeout,
    $core.int? maxParticipants,
    RoomMetadata? metadata,
  }) {
    final $result = create();
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (emptyTimeout != null) {
      $result.emptyTimeout = emptyTimeout;
    }
    if (maxParticipants != null) {
      $result.maxParticipants = maxParticipants;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  CreateRoomReq._() : super();
  factory CreateRoomReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRoomReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRoomReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'emptyTimeout', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'maxParticipants', $pb.PbFieldType.OU3)
    ..aOM<RoomMetadata>(4, _omitFieldNames ? '' : 'metadata', subBuilder: RoomMetadata.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRoomReq clone() => CreateRoomReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRoomReq copyWith(void Function(CreateRoomReq) updates) => super.copyWith((message) => updates(message as CreateRoomReq)) as CreateRoomReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRoomReq create() => CreateRoomReq._();
  CreateRoomReq createEmptyInstance() => create();
  static $pb.PbList<CreateRoomReq> createRepeated() => $pb.PbList<CreateRoomReq>();
  @$core.pragma('dart2js:noInline')
  static CreateRoomReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRoomReq>(create);
  static CreateRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get emptyTimeout => $_getIZ(1);
  @$pb.TagNumber(2)
  set emptyTimeout($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmptyTimeout() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmptyTimeout() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get maxParticipants => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxParticipants($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaxParticipants() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxParticipants() => clearField(3);

  @$pb.TagNumber(4)
  RoomMetadata get metadata => $_getN(3);
  @$pb.TagNumber(4)
  set metadata(RoomMetadata v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMetadata() => $_has(3);
  @$pb.TagNumber(4)
  void clearMetadata() => clearField(4);
  @$pb.TagNumber(4)
  RoomMetadata ensureMetadata() => $_ensure(3);
}

class RoomMetadata extends $pb.GeneratedMessage {
  factory RoomMetadata({
    $core.String? roomTitle,
    $core.String? welcomeMessage,
    $core.bool? isRecording,
    $core.bool? isActiveRtmp,
    $core.String? parentRoomId,
    $core.bool? isBreakoutRoom,
    $core.String? webhookUrl,
    $fixnum.Int64? startedAt,
    $core.String? logoutUrl,
    RoomCreateFeatures? roomFeatures,
    $24.LockSettings? defaultLockSettings,
    CopyrightConf? copyrightConf,
    $core.String? metadataId,
    $core.Map<$core.String, $core.String>? extraData,
  }) {
    final $result = create();
    if (roomTitle != null) {
      $result.roomTitle = roomTitle;
    }
    if (welcomeMessage != null) {
      $result.welcomeMessage = welcomeMessage;
    }
    if (isRecording != null) {
      $result.isRecording = isRecording;
    }
    if (isActiveRtmp != null) {
      $result.isActiveRtmp = isActiveRtmp;
    }
    if (parentRoomId != null) {
      $result.parentRoomId = parentRoomId;
    }
    if (isBreakoutRoom != null) {
      $result.isBreakoutRoom = isBreakoutRoom;
    }
    if (webhookUrl != null) {
      $result.webhookUrl = webhookUrl;
    }
    if (startedAt != null) {
      $result.startedAt = startedAt;
    }
    if (logoutUrl != null) {
      $result.logoutUrl = logoutUrl;
    }
    if (roomFeatures != null) {
      $result.roomFeatures = roomFeatures;
    }
    if (defaultLockSettings != null) {
      $result.defaultLockSettings = defaultLockSettings;
    }
    if (copyrightConf != null) {
      $result.copyrightConf = copyrightConf;
    }
    if (metadataId != null) {
      $result.metadataId = metadataId;
    }
    if (extraData != null) {
      $result.extraData.addAll(extraData);
    }
    return $result;
  }
  RoomMetadata._() : super();
  factory RoomMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomMetadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomTitle')
    ..aOS(2, _omitFieldNames ? '' : 'welcomeMessage')
    ..aOB(3, _omitFieldNames ? '' : 'isRecording')
    ..aOB(4, _omitFieldNames ? '' : 'isActiveRtmp')
    ..aOS(5, _omitFieldNames ? '' : 'parentRoomId')
    ..aOB(6, _omitFieldNames ? '' : 'isBreakoutRoom')
    ..aOS(7, _omitFieldNames ? '' : 'webhookUrl')
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'startedAt', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(9, _omitFieldNames ? '' : 'logoutUrl')
    ..aOM<RoomCreateFeatures>(10, _omitFieldNames ? '' : 'roomFeatures', subBuilder: RoomCreateFeatures.create)
    ..aOM<$24.LockSettings>(11, _omitFieldNames ? '' : 'defaultLockSettings', subBuilder: $24.LockSettings.create)
    ..aOM<CopyrightConf>(12, _omitFieldNames ? '' : 'copyrightConf', subBuilder: CopyrightConf.create)
    ..aOS(13, _omitFieldNames ? '' : 'metadataId')
    ..m<$core.String, $core.String>(14, _omitFieldNames ? '' : 'extraData', entryClassName: 'RoomMetadata.ExtraDataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('wajlc'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomMetadata clone() => RoomMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomMetadata copyWith(void Function(RoomMetadata) updates) => super.copyWith((message) => updates(message as RoomMetadata)) as RoomMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomMetadata create() => RoomMetadata._();
  RoomMetadata createEmptyInstance() => create();
  static $pb.PbList<RoomMetadata> createRepeated() => $pb.PbList<RoomMetadata>();
  @$core.pragma('dart2js:noInline')
  static RoomMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomMetadata>(create);
  static RoomMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomTitle => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomTitle($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get welcomeMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set welcomeMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWelcomeMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearWelcomeMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isRecording => $_getBF(2);
  @$pb.TagNumber(3)
  set isRecording($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsRecording() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsRecording() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isActiveRtmp => $_getBF(3);
  @$pb.TagNumber(4)
  set isActiveRtmp($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsActiveRtmp() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsActiveRtmp() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get parentRoomId => $_getSZ(4);
  @$pb.TagNumber(5)
  set parentRoomId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasParentRoomId() => $_has(4);
  @$pb.TagNumber(5)
  void clearParentRoomId() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isBreakoutRoom => $_getBF(5);
  @$pb.TagNumber(6)
  set isBreakoutRoom($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsBreakoutRoom() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsBreakoutRoom() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get webhookUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set webhookUrl($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasWebhookUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearWebhookUrl() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get startedAt => $_getI64(7);
  @$pb.TagNumber(8)
  set startedAt($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStartedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearStartedAt() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get logoutUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set logoutUrl($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLogoutUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearLogoutUrl() => clearField(9);

  @$pb.TagNumber(10)
  RoomCreateFeatures get roomFeatures => $_getN(9);
  @$pb.TagNumber(10)
  set roomFeatures(RoomCreateFeatures v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasRoomFeatures() => $_has(9);
  @$pb.TagNumber(10)
  void clearRoomFeatures() => clearField(10);
  @$pb.TagNumber(10)
  RoomCreateFeatures ensureRoomFeatures() => $_ensure(9);

  @$pb.TagNumber(11)
  $24.LockSettings get defaultLockSettings => $_getN(10);
  @$pb.TagNumber(11)
  set defaultLockSettings($24.LockSettings v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasDefaultLockSettings() => $_has(10);
  @$pb.TagNumber(11)
  void clearDefaultLockSettings() => clearField(11);
  @$pb.TagNumber(11)
  $24.LockSettings ensureDefaultLockSettings() => $_ensure(10);

  @$pb.TagNumber(12)
  CopyrightConf get copyrightConf => $_getN(11);
  @$pb.TagNumber(12)
  set copyrightConf(CopyrightConf v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasCopyrightConf() => $_has(11);
  @$pb.TagNumber(12)
  void clearCopyrightConf() => clearField(12);
  @$pb.TagNumber(12)
  CopyrightConf ensureCopyrightConf() => $_ensure(11);

  /// we'll use this as version control
  @$pb.TagNumber(13)
  $core.String get metadataId => $_getSZ(12);
  @$pb.TagNumber(13)
  set metadataId($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasMetadataId() => $_has(12);
  @$pb.TagNumber(13)
  void clearMetadataId() => clearField(13);

  @$pb.TagNumber(14)
  $core.Map<$core.String, $core.String> get extraData => $_getMap(13);
}

class RoomCreateFeatures extends $pb.GeneratedMessage {
  factory RoomCreateFeatures({
    $core.bool? allowWebcams,
    $core.bool? muteOnStart,
    $core.bool? allowScreenShare,
    $core.bool? allowRtmp,
    $core.bool? allowViewOtherWebcams,
    $core.bool? allowViewOtherUsersList,
    $core.bool? adminOnlyWebcams,
  @$core.Deprecated('This field is deprecated.')
    $core.bool? allowPolls,
    $fixnum.Int64? roomDuration,
    $core.bool? enableAnalytics,
    $core.bool? allowVirtualBg,
    $core.bool? allowRaiseHand,
    $core.bool? autoGenUserId,
    RecordingFeatures? recordingFeatures,
    ChatFeatures? chatFeatures,
    SharedNotePadFeatures? sharedNotePadFeatures,
    WhiteboardFeatures? whiteboardFeatures,
    ExternalMediaPlayerFeatures? externalMediaPlayerFeatures,
    WaitingRoomFeatures? waitingRoomFeatures,
    BreakoutRoomFeatures? breakoutRoomFeatures,
    DisplayExternalLinkFeatures? displayExternalLinkFeatures,
    IngressFeatures? ingressFeatures,
  @$core.Deprecated('This field is deprecated.')
    SpeechToTextTranslationFeatures? speechToTextTranslationFeatures,
    EndToEndEncryptionFeatures? endToEndEncryptionFeatures,
    PollsFeatures? pollsFeatures,
    InsightsFeatures? insightsFeatures,
  }) {
    final $result = create();
    if (allowWebcams != null) {
      $result.allowWebcams = allowWebcams;
    }
    if (muteOnStart != null) {
      $result.muteOnStart = muteOnStart;
    }
    if (allowScreenShare != null) {
      $result.allowScreenShare = allowScreenShare;
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
    if (adminOnlyWebcams != null) {
      $result.adminOnlyWebcams = adminOnlyWebcams;
    }
    if (allowPolls != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.allowPolls = allowPolls;
    }
    if (roomDuration != null) {
      $result.roomDuration = roomDuration;
    }
    if (enableAnalytics != null) {
      $result.enableAnalytics = enableAnalytics;
    }
    if (allowVirtualBg != null) {
      $result.allowVirtualBg = allowVirtualBg;
    }
    if (allowRaiseHand != null) {
      $result.allowRaiseHand = allowRaiseHand;
    }
    if (autoGenUserId != null) {
      $result.autoGenUserId = autoGenUserId;
    }
    if (recordingFeatures != null) {
      $result.recordingFeatures = recordingFeatures;
    }
    if (chatFeatures != null) {
      $result.chatFeatures = chatFeatures;
    }
    if (sharedNotePadFeatures != null) {
      $result.sharedNotePadFeatures = sharedNotePadFeatures;
    }
    if (whiteboardFeatures != null) {
      $result.whiteboardFeatures = whiteboardFeatures;
    }
    if (externalMediaPlayerFeatures != null) {
      $result.externalMediaPlayerFeatures = externalMediaPlayerFeatures;
    }
    if (waitingRoomFeatures != null) {
      $result.waitingRoomFeatures = waitingRoomFeatures;
    }
    if (breakoutRoomFeatures != null) {
      $result.breakoutRoomFeatures = breakoutRoomFeatures;
    }
    if (displayExternalLinkFeatures != null) {
      $result.displayExternalLinkFeatures = displayExternalLinkFeatures;
    }
    if (ingressFeatures != null) {
      $result.ingressFeatures = ingressFeatures;
    }
    if (speechToTextTranslationFeatures != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.speechToTextTranslationFeatures = speechToTextTranslationFeatures;
    }
    if (endToEndEncryptionFeatures != null) {
      $result.endToEndEncryptionFeatures = endToEndEncryptionFeatures;
    }
    if (pollsFeatures != null) {
      $result.pollsFeatures = pollsFeatures;
    }
    if (insightsFeatures != null) {
      $result.insightsFeatures = insightsFeatures;
    }
    return $result;
  }
  RoomCreateFeatures._() : super();
  factory RoomCreateFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomCreateFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomCreateFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'allowWebcams')
    ..aOB(2, _omitFieldNames ? '' : 'muteOnStart')
    ..aOB(3, _omitFieldNames ? '' : 'allowScreenShare')
    ..aOB(4, _omitFieldNames ? '' : 'allowRtmp')
    ..aOB(5, _omitFieldNames ? '' : 'allowViewOtherWebcams')
    ..aOB(6, _omitFieldNames ? '' : 'allowViewOtherUsersList')
    ..aOB(7, _omitFieldNames ? '' : 'adminOnlyWebcams')
    ..aOB(8, _omitFieldNames ? '' : 'allowPolls')
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'roomDuration', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(10, _omitFieldNames ? '' : 'enableAnalytics')
    ..aOB(11, _omitFieldNames ? '' : 'allowVirtualBg')
    ..aOB(12, _omitFieldNames ? '' : 'allowRaiseHand')
    ..aOB(13, _omitFieldNames ? '' : 'autoGenUserId')
    ..aOM<RecordingFeatures>(14, _omitFieldNames ? '' : 'recordingFeatures', subBuilder: RecordingFeatures.create)
    ..aOM<ChatFeatures>(15, _omitFieldNames ? '' : 'chatFeatures', subBuilder: ChatFeatures.create)
    ..aOM<SharedNotePadFeatures>(16, _omitFieldNames ? '' : 'sharedNotePadFeatures', subBuilder: SharedNotePadFeatures.create)
    ..aOM<WhiteboardFeatures>(17, _omitFieldNames ? '' : 'whiteboardFeatures', subBuilder: WhiteboardFeatures.create)
    ..aOM<ExternalMediaPlayerFeatures>(18, _omitFieldNames ? '' : 'externalMediaPlayerFeatures', subBuilder: ExternalMediaPlayerFeatures.create)
    ..aOM<WaitingRoomFeatures>(19, _omitFieldNames ? '' : 'waitingRoomFeatures', subBuilder: WaitingRoomFeatures.create)
    ..aOM<BreakoutRoomFeatures>(20, _omitFieldNames ? '' : 'breakoutRoomFeatures', subBuilder: BreakoutRoomFeatures.create)
    ..aOM<DisplayExternalLinkFeatures>(21, _omitFieldNames ? '' : 'displayExternalLinkFeatures', subBuilder: DisplayExternalLinkFeatures.create)
    ..aOM<IngressFeatures>(22, _omitFieldNames ? '' : 'ingressFeatures', subBuilder: IngressFeatures.create)
    ..aOM<SpeechToTextTranslationFeatures>(23, _omitFieldNames ? '' : 'speechToTextTranslationFeatures', subBuilder: SpeechToTextTranslationFeatures.create)
    ..aOM<EndToEndEncryptionFeatures>(24, _omitFieldNames ? '' : 'endToEndEncryptionFeatures', subBuilder: EndToEndEncryptionFeatures.create)
    ..aOM<PollsFeatures>(25, _omitFieldNames ? '' : 'pollsFeatures', subBuilder: PollsFeatures.create)
    ..aOM<InsightsFeatures>(26, _omitFieldNames ? '' : 'insightsFeatures', subBuilder: InsightsFeatures.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomCreateFeatures clone() => RoomCreateFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomCreateFeatures copyWith(void Function(RoomCreateFeatures) updates) => super.copyWith((message) => updates(message as RoomCreateFeatures)) as RoomCreateFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomCreateFeatures create() => RoomCreateFeatures._();
  RoomCreateFeatures createEmptyInstance() => create();
  static $pb.PbList<RoomCreateFeatures> createRepeated() => $pb.PbList<RoomCreateFeatures>();
  @$core.pragma('dart2js:noInline')
  static RoomCreateFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomCreateFeatures>(create);
  static RoomCreateFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get allowWebcams => $_getBF(0);
  @$pb.TagNumber(1)
  set allowWebcams($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAllowWebcams() => $_has(0);
  @$pb.TagNumber(1)
  void clearAllowWebcams() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get muteOnStart => $_getBF(1);
  @$pb.TagNumber(2)
  set muteOnStart($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMuteOnStart() => $_has(1);
  @$pb.TagNumber(2)
  void clearMuteOnStart() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get allowScreenShare => $_getBF(2);
  @$pb.TagNumber(3)
  set allowScreenShare($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAllowScreenShare() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowScreenShare() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get allowRtmp => $_getBF(3);
  @$pb.TagNumber(4)
  set allowRtmp($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAllowRtmp() => $_has(3);
  @$pb.TagNumber(4)
  void clearAllowRtmp() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get allowViewOtherWebcams => $_getBF(4);
  @$pb.TagNumber(5)
  set allowViewOtherWebcams($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAllowViewOtherWebcams() => $_has(4);
  @$pb.TagNumber(5)
  void clearAllowViewOtherWebcams() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get allowViewOtherUsersList => $_getBF(5);
  @$pb.TagNumber(6)
  set allowViewOtherUsersList($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAllowViewOtherUsersList() => $_has(5);
  @$pb.TagNumber(6)
  void clearAllowViewOtherUsersList() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get adminOnlyWebcams => $_getBF(6);
  @$pb.TagNumber(7)
  set adminOnlyWebcams($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAdminOnlyWebcams() => $_has(6);
  @$pb.TagNumber(7)
  void clearAdminOnlyWebcams() => clearField(7);

  /// deprecated use polls_features
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.bool get allowPolls => $_getBF(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  set allowPolls($core.bool v) { $_setBool(7, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.bool hasAllowPolls() => $_has(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  void clearAllowPolls() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get roomDuration => $_getI64(8);
  @$pb.TagNumber(9)
  set roomDuration($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasRoomDuration() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoomDuration() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get enableAnalytics => $_getBF(9);
  @$pb.TagNumber(10)
  set enableAnalytics($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasEnableAnalytics() => $_has(9);
  @$pb.TagNumber(10)
  void clearEnableAnalytics() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get allowVirtualBg => $_getBF(10);
  @$pb.TagNumber(11)
  set allowVirtualBg($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasAllowVirtualBg() => $_has(10);
  @$pb.TagNumber(11)
  void clearAllowVirtualBg() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get allowRaiseHand => $_getBF(11);
  @$pb.TagNumber(12)
  set allowRaiseHand($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasAllowRaiseHand() => $_has(11);
  @$pb.TagNumber(12)
  void clearAllowRaiseHand() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get autoGenUserId => $_getBF(12);
  @$pb.TagNumber(13)
  set autoGenUserId($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasAutoGenUserId() => $_has(12);
  @$pb.TagNumber(13)
  void clearAutoGenUserId() => clearField(13);

  @$pb.TagNumber(14)
  RecordingFeatures get recordingFeatures => $_getN(13);
  @$pb.TagNumber(14)
  set recordingFeatures(RecordingFeatures v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasRecordingFeatures() => $_has(13);
  @$pb.TagNumber(14)
  void clearRecordingFeatures() => clearField(14);
  @$pb.TagNumber(14)
  RecordingFeatures ensureRecordingFeatures() => $_ensure(13);

  @$pb.TagNumber(15)
  ChatFeatures get chatFeatures => $_getN(14);
  @$pb.TagNumber(15)
  set chatFeatures(ChatFeatures v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasChatFeatures() => $_has(14);
  @$pb.TagNumber(15)
  void clearChatFeatures() => clearField(15);
  @$pb.TagNumber(15)
  ChatFeatures ensureChatFeatures() => $_ensure(14);

  @$pb.TagNumber(16)
  SharedNotePadFeatures get sharedNotePadFeatures => $_getN(15);
  @$pb.TagNumber(16)
  set sharedNotePadFeatures(SharedNotePadFeatures v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasSharedNotePadFeatures() => $_has(15);
  @$pb.TagNumber(16)
  void clearSharedNotePadFeatures() => clearField(16);
  @$pb.TagNumber(16)
  SharedNotePadFeatures ensureSharedNotePadFeatures() => $_ensure(15);

  @$pb.TagNumber(17)
  WhiteboardFeatures get whiteboardFeatures => $_getN(16);
  @$pb.TagNumber(17)
  set whiteboardFeatures(WhiteboardFeatures v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasWhiteboardFeatures() => $_has(16);
  @$pb.TagNumber(17)
  void clearWhiteboardFeatures() => clearField(17);
  @$pb.TagNumber(17)
  WhiteboardFeatures ensureWhiteboardFeatures() => $_ensure(16);

  @$pb.TagNumber(18)
  ExternalMediaPlayerFeatures get externalMediaPlayerFeatures => $_getN(17);
  @$pb.TagNumber(18)
  set externalMediaPlayerFeatures(ExternalMediaPlayerFeatures v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasExternalMediaPlayerFeatures() => $_has(17);
  @$pb.TagNumber(18)
  void clearExternalMediaPlayerFeatures() => clearField(18);
  @$pb.TagNumber(18)
  ExternalMediaPlayerFeatures ensureExternalMediaPlayerFeatures() => $_ensure(17);

  @$pb.TagNumber(19)
  WaitingRoomFeatures get waitingRoomFeatures => $_getN(18);
  @$pb.TagNumber(19)
  set waitingRoomFeatures(WaitingRoomFeatures v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasWaitingRoomFeatures() => $_has(18);
  @$pb.TagNumber(19)
  void clearWaitingRoomFeatures() => clearField(19);
  @$pb.TagNumber(19)
  WaitingRoomFeatures ensureWaitingRoomFeatures() => $_ensure(18);

  @$pb.TagNumber(20)
  BreakoutRoomFeatures get breakoutRoomFeatures => $_getN(19);
  @$pb.TagNumber(20)
  set breakoutRoomFeatures(BreakoutRoomFeatures v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasBreakoutRoomFeatures() => $_has(19);
  @$pb.TagNumber(20)
  void clearBreakoutRoomFeatures() => clearField(20);
  @$pb.TagNumber(20)
  BreakoutRoomFeatures ensureBreakoutRoomFeatures() => $_ensure(19);

  @$pb.TagNumber(21)
  DisplayExternalLinkFeatures get displayExternalLinkFeatures => $_getN(20);
  @$pb.TagNumber(21)
  set displayExternalLinkFeatures(DisplayExternalLinkFeatures v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasDisplayExternalLinkFeatures() => $_has(20);
  @$pb.TagNumber(21)
  void clearDisplayExternalLinkFeatures() => clearField(21);
  @$pb.TagNumber(21)
  DisplayExternalLinkFeatures ensureDisplayExternalLinkFeatures() => $_ensure(20);

  @$pb.TagNumber(22)
  IngressFeatures get ingressFeatures => $_getN(21);
  @$pb.TagNumber(22)
  set ingressFeatures(IngressFeatures v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasIngressFeatures() => $_has(21);
  @$pb.TagNumber(22)
  void clearIngressFeatures() => clearField(22);
  @$pb.TagNumber(22)
  IngressFeatures ensureIngressFeatures() => $_ensure(21);

  /// deprecated use insights_features
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(23)
  SpeechToTextTranslationFeatures get speechToTextTranslationFeatures => $_getN(22);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(23)
  set speechToTextTranslationFeatures(SpeechToTextTranslationFeatures v) { setField(23, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(23)
  $core.bool hasSpeechToTextTranslationFeatures() => $_has(22);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(23)
  void clearSpeechToTextTranslationFeatures() => clearField(23);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(23)
  SpeechToTextTranslationFeatures ensureSpeechToTextTranslationFeatures() => $_ensure(22);

  @$pb.TagNumber(24)
  EndToEndEncryptionFeatures get endToEndEncryptionFeatures => $_getN(23);
  @$pb.TagNumber(24)
  set endToEndEncryptionFeatures(EndToEndEncryptionFeatures v) { setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasEndToEndEncryptionFeatures() => $_has(23);
  @$pb.TagNumber(24)
  void clearEndToEndEncryptionFeatures() => clearField(24);
  @$pb.TagNumber(24)
  EndToEndEncryptionFeatures ensureEndToEndEncryptionFeatures() => $_ensure(23);

  @$pb.TagNumber(25)
  PollsFeatures get pollsFeatures => $_getN(24);
  @$pb.TagNumber(25)
  set pollsFeatures(PollsFeatures v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasPollsFeatures() => $_has(24);
  @$pb.TagNumber(25)
  void clearPollsFeatures() => clearField(25);
  @$pb.TagNumber(25)
  PollsFeatures ensurePollsFeatures() => $_ensure(24);

  @$pb.TagNumber(26)
  InsightsFeatures get insightsFeatures => $_getN(25);
  @$pb.TagNumber(26)
  set insightsFeatures(InsightsFeatures v) { setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasInsightsFeatures() => $_has(25);
  @$pb.TagNumber(26)
  void clearInsightsFeatures() => clearField(26);
  @$pb.TagNumber(26)
  InsightsFeatures ensureInsightsFeatures() => $_ensure(25);
}

class ChatFeatures extends $pb.GeneratedMessage {
  factory ChatFeatures({
  @$core.Deprecated('This field is deprecated.')
    $core.bool? allowChat,
  @$core.Deprecated('This field is deprecated.')
    $core.bool? allowFileUpload,
    $core.Iterable<$core.String>? allowedFileTypes,
    $fixnum.Int64? maxFileSize,
    $core.bool? isAllow,
    $core.bool? isAllowFileUpload,
  }) {
    final $result = create();
    if (allowChat != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.allowChat = allowChat;
    }
    if (allowFileUpload != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.allowFileUpload = allowFileUpload;
    }
    if (allowedFileTypes != null) {
      $result.allowedFileTypes.addAll(allowedFileTypes);
    }
    if (maxFileSize != null) {
      $result.maxFileSize = maxFileSize;
    }
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    if (isAllowFileUpload != null) {
      $result.isAllowFileUpload = isAllowFileUpload;
    }
    return $result;
  }
  ChatFeatures._() : super();
  factory ChatFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'allowChat')
    ..aOB(2, _omitFieldNames ? '' : 'allowFileUpload')
    ..pPS(3, _omitFieldNames ? '' : 'allowedFileTypes')
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'maxFileSize', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(5, _omitFieldNames ? '' : 'isAllow')
    ..aOB(6, _omitFieldNames ? '' : 'isAllowFileUpload')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatFeatures clone() => ChatFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatFeatures copyWith(void Function(ChatFeatures) updates) => super.copyWith((message) => updates(message as ChatFeatures)) as ChatFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatFeatures create() => ChatFeatures._();
  ChatFeatures createEmptyInstance() => create();
  static $pb.PbList<ChatFeatures> createRepeated() => $pb.PbList<ChatFeatures>();
  @$core.pragma('dart2js:noInline')
  static ChatFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatFeatures>(create);
  static ChatFeatures? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool get allowChat => $_getBF(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set allowChat($core.bool v) { $_setBool(0, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasAllowChat() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearAllowChat() => clearField(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool get allowFileUpload => $_getBF(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set allowFileUpload($core.bool v) { $_setBool(1, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasAllowFileUpload() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearAllowFileUpload() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get allowedFileTypes => $_getList(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get maxFileSize => $_getI64(3);
  @$pb.TagNumber(4)
  set maxFileSize($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMaxFileSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxFileSize() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isAllow => $_getBF(4);
  @$pb.TagNumber(5)
  set isAllow($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsAllow() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsAllow() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isAllowFileUpload => $_getBF(5);
  @$pb.TagNumber(6)
  set isAllowFileUpload($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsAllowFileUpload() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsAllowFileUpload() => clearField(6);
}

class SharedNotePadFeatures extends $pb.GeneratedMessage {
  factory SharedNotePadFeatures({
  @$core.Deprecated('This field is deprecated.')
    $core.bool? allowedSharedNotePad,
    $core.bool? isActive,
    $core.bool? visible,
    $core.String? nodeId,
    $core.String? host,
    $core.String? notePadId,
    $core.String? readOnlyPadId,
    $core.bool? isAllow,
  }) {
    final $result = create();
    if (allowedSharedNotePad != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.allowedSharedNotePad = allowedSharedNotePad;
    }
    if (isActive != null) {
      $result.isActive = isActive;
    }
    if (visible != null) {
      $result.visible = visible;
    }
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    if (host != null) {
      $result.host = host;
    }
    if (notePadId != null) {
      $result.notePadId = notePadId;
    }
    if (readOnlyPadId != null) {
      $result.readOnlyPadId = readOnlyPadId;
    }
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    return $result;
  }
  SharedNotePadFeatures._() : super();
  factory SharedNotePadFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SharedNotePadFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SharedNotePadFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'allowedSharedNotePad')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..aOB(3, _omitFieldNames ? '' : 'visible')
    ..aOS(4, _omitFieldNames ? '' : 'nodeId')
    ..aOS(5, _omitFieldNames ? '' : 'host')
    ..aOS(6, _omitFieldNames ? '' : 'notePadId')
    ..aOS(7, _omitFieldNames ? '' : 'readOnlyPadId')
    ..aOB(8, _omitFieldNames ? '' : 'isAllow')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SharedNotePadFeatures clone() => SharedNotePadFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SharedNotePadFeatures copyWith(void Function(SharedNotePadFeatures) updates) => super.copyWith((message) => updates(message as SharedNotePadFeatures)) as SharedNotePadFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SharedNotePadFeatures create() => SharedNotePadFeatures._();
  SharedNotePadFeatures createEmptyInstance() => create();
  static $pb.PbList<SharedNotePadFeatures> createRepeated() => $pb.PbList<SharedNotePadFeatures>();
  @$core.pragma('dart2js:noInline')
  static SharedNotePadFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SharedNotePadFeatures>(create);
  static SharedNotePadFeatures? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool get allowedSharedNotePad => $_getBF(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set allowedSharedNotePad($core.bool v) { $_setBool(0, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasAllowedSharedNotePad() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearAllowedSharedNotePad() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get visible => $_getBF(2);
  @$pb.TagNumber(3)
  set visible($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVisible() => $_has(2);
  @$pb.TagNumber(3)
  void clearVisible() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nodeId => $_getSZ(3);
  @$pb.TagNumber(4)
  set nodeId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNodeId() => $_has(3);
  @$pb.TagNumber(4)
  void clearNodeId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get host => $_getSZ(4);
  @$pb.TagNumber(5)
  set host($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHost() => $_has(4);
  @$pb.TagNumber(5)
  void clearHost() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get notePadId => $_getSZ(5);
  @$pb.TagNumber(6)
  set notePadId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNotePadId() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotePadId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get readOnlyPadId => $_getSZ(6);
  @$pb.TagNumber(7)
  set readOnlyPadId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasReadOnlyPadId() => $_has(6);
  @$pb.TagNumber(7)
  void clearReadOnlyPadId() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isAllow => $_getBF(7);
  @$pb.TagNumber(8)
  set isAllow($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsAllow() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsAllow() => clearField(8);
}

class WhiteboardFeatures extends $pb.GeneratedMessage {
  factory WhiteboardFeatures({
  @$core.Deprecated('This field is deprecated.')
    $core.bool? allowedWhiteboard,
    $core.bool? visible,
    $core.String? preloadFile,
    $core.String? whiteboardFileId,
    $core.String? fileName,
    $core.String? filePath,
    $core.int? totalPages,
    $fixnum.Int64? maxAllowedFileSize,
    $core.bool? isAllow,
  }) {
    final $result = create();
    if (allowedWhiteboard != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.allowedWhiteboard = allowedWhiteboard;
    }
    if (visible != null) {
      $result.visible = visible;
    }
    if (preloadFile != null) {
      $result.preloadFile = preloadFile;
    }
    if (whiteboardFileId != null) {
      $result.whiteboardFileId = whiteboardFileId;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (totalPages != null) {
      $result.totalPages = totalPages;
    }
    if (maxAllowedFileSize != null) {
      $result.maxAllowedFileSize = maxAllowedFileSize;
    }
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    return $result;
  }
  WhiteboardFeatures._() : super();
  factory WhiteboardFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WhiteboardFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WhiteboardFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'allowedWhiteboard')
    ..aOB(2, _omitFieldNames ? '' : 'visible')
    ..aOS(3, _omitFieldNames ? '' : 'preloadFile')
    ..aOS(4, _omitFieldNames ? '' : 'whiteboardFileId')
    ..aOS(5, _omitFieldNames ? '' : 'fileName')
    ..aOS(6, _omitFieldNames ? '' : 'filePath')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'totalPages', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'maxAllowedFileSize', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(9, _omitFieldNames ? '' : 'isAllow')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WhiteboardFeatures clone() => WhiteboardFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WhiteboardFeatures copyWith(void Function(WhiteboardFeatures) updates) => super.copyWith((message) => updates(message as WhiteboardFeatures)) as WhiteboardFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhiteboardFeatures create() => WhiteboardFeatures._();
  WhiteboardFeatures createEmptyInstance() => create();
  static $pb.PbList<WhiteboardFeatures> createRepeated() => $pb.PbList<WhiteboardFeatures>();
  @$core.pragma('dart2js:noInline')
  static WhiteboardFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WhiteboardFeatures>(create);
  static WhiteboardFeatures? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool get allowedWhiteboard => $_getBF(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set allowedWhiteboard($core.bool v) { $_setBool(0, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasAllowedWhiteboard() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearAllowedWhiteboard() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get visible => $_getBF(1);
  @$pb.TagNumber(2)
  set visible($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVisible() => $_has(1);
  @$pb.TagNumber(2)
  void clearVisible() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get preloadFile => $_getSZ(2);
  @$pb.TagNumber(3)
  set preloadFile($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPreloadFile() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreloadFile() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get whiteboardFileId => $_getSZ(3);
  @$pb.TagNumber(4)
  set whiteboardFileId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWhiteboardFileId() => $_has(3);
  @$pb.TagNumber(4)
  void clearWhiteboardFileId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get fileName => $_getSZ(4);
  @$pb.TagNumber(5)
  set fileName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFileName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get filePath => $_getSZ(5);
  @$pb.TagNumber(6)
  set filePath($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFilePath() => $_has(5);
  @$pb.TagNumber(6)
  void clearFilePath() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get totalPages => $_getIZ(6);
  @$pb.TagNumber(7)
  set totalPages($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalPages() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalPages() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get maxAllowedFileSize => $_getI64(7);
  @$pb.TagNumber(8)
  set maxAllowedFileSize($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMaxAllowedFileSize() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxAllowedFileSize() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isAllow => $_getBF(8);
  @$pb.TagNumber(9)
  set isAllow($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsAllow() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsAllow() => clearField(9);
}

class ExternalMediaPlayerFeatures extends $pb.GeneratedMessage {
  factory ExternalMediaPlayerFeatures({
  @$core.Deprecated('This field is deprecated.')
    $core.bool? allowedExternalMediaPlayer,
    $core.bool? isActive,
    $core.String? sharedBy,
    $core.String? url,
    $core.bool? isAllow,
  }) {
    final $result = create();
    if (allowedExternalMediaPlayer != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.allowedExternalMediaPlayer = allowedExternalMediaPlayer;
    }
    if (isActive != null) {
      $result.isActive = isActive;
    }
    if (sharedBy != null) {
      $result.sharedBy = sharedBy;
    }
    if (url != null) {
      $result.url = url;
    }
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    return $result;
  }
  ExternalMediaPlayerFeatures._() : super();
  factory ExternalMediaPlayerFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExternalMediaPlayerFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExternalMediaPlayerFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'allowedExternalMediaPlayer')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..aOS(3, _omitFieldNames ? '' : 'sharedBy')
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..aOB(5, _omitFieldNames ? '' : 'isAllow')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExternalMediaPlayerFeatures clone() => ExternalMediaPlayerFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExternalMediaPlayerFeatures copyWith(void Function(ExternalMediaPlayerFeatures) updates) => super.copyWith((message) => updates(message as ExternalMediaPlayerFeatures)) as ExternalMediaPlayerFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExternalMediaPlayerFeatures create() => ExternalMediaPlayerFeatures._();
  ExternalMediaPlayerFeatures createEmptyInstance() => create();
  static $pb.PbList<ExternalMediaPlayerFeatures> createRepeated() => $pb.PbList<ExternalMediaPlayerFeatures>();
  @$core.pragma('dart2js:noInline')
  static ExternalMediaPlayerFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExternalMediaPlayerFeatures>(create);
  static ExternalMediaPlayerFeatures? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool get allowedExternalMediaPlayer => $_getBF(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set allowedExternalMediaPlayer($core.bool v) { $_setBool(0, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasAllowedExternalMediaPlayer() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearAllowedExternalMediaPlayer() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sharedBy => $_getSZ(2);
  @$pb.TagNumber(3)
  set sharedBy($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSharedBy() => $_has(2);
  @$pb.TagNumber(3)
  void clearSharedBy() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isAllow => $_getBF(4);
  @$pb.TagNumber(5)
  set isAllow($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsAllow() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsAllow() => clearField(5);
}

class WaitingRoomFeatures extends $pb.GeneratedMessage {
  factory WaitingRoomFeatures({
    $core.bool? isActive,
    $core.String? waitingRoomMsg,
  }) {
    final $result = create();
    if (isActive != null) {
      $result.isActive = isActive;
    }
    if (waitingRoomMsg != null) {
      $result.waitingRoomMsg = waitingRoomMsg;
    }
    return $result;
  }
  WaitingRoomFeatures._() : super();
  factory WaitingRoomFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WaitingRoomFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WaitingRoomFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isActive')
    ..aOS(2, _omitFieldNames ? '' : 'waitingRoomMsg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WaitingRoomFeatures clone() => WaitingRoomFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WaitingRoomFeatures copyWith(void Function(WaitingRoomFeatures) updates) => super.copyWith((message) => updates(message as WaitingRoomFeatures)) as WaitingRoomFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WaitingRoomFeatures create() => WaitingRoomFeatures._();
  WaitingRoomFeatures createEmptyInstance() => create();
  static $pb.PbList<WaitingRoomFeatures> createRepeated() => $pb.PbList<WaitingRoomFeatures>();
  @$core.pragma('dart2js:noInline')
  static WaitingRoomFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WaitingRoomFeatures>(create);
  static WaitingRoomFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isActive => $_getBF(0);
  @$pb.TagNumber(1)
  set isActive($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsActive() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsActive() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get waitingRoomMsg => $_getSZ(1);
  @$pb.TagNumber(2)
  set waitingRoomMsg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWaitingRoomMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearWaitingRoomMsg() => clearField(2);
}

class BreakoutRoomFeatures extends $pb.GeneratedMessage {
  factory BreakoutRoomFeatures({
    $core.bool? isAllow,
    $core.bool? isActive,
    $core.int? allowedNumberRooms,
  }) {
    final $result = create();
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    if (isActive != null) {
      $result.isActive = isActive;
    }
    if (allowedNumberRooms != null) {
      $result.allowedNumberRooms = allowedNumberRooms;
    }
    return $result;
  }
  BreakoutRoomFeatures._() : super();
  factory BreakoutRoomFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BreakoutRoomFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BreakoutRoomFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'allowedNumberRooms', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BreakoutRoomFeatures clone() => BreakoutRoomFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BreakoutRoomFeatures copyWith(void Function(BreakoutRoomFeatures) updates) => super.copyWith((message) => updates(message as BreakoutRoomFeatures)) as BreakoutRoomFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BreakoutRoomFeatures create() => BreakoutRoomFeatures._();
  BreakoutRoomFeatures createEmptyInstance() => create();
  static $pb.PbList<BreakoutRoomFeatures> createRepeated() => $pb.PbList<BreakoutRoomFeatures>();
  @$core.pragma('dart2js:noInline')
  static BreakoutRoomFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BreakoutRoomFeatures>(create);
  static BreakoutRoomFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get allowedNumberRooms => $_getIZ(2);
  @$pb.TagNumber(3)
  set allowedNumberRooms($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAllowedNumberRooms() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowedNumberRooms() => clearField(3);
}

class DisplayExternalLinkFeatures extends $pb.GeneratedMessage {
  factory DisplayExternalLinkFeatures({
    $core.bool? isAllow,
    $core.bool? isActive,
    $core.String? link,
    $core.String? sharedBy,
  }) {
    final $result = create();
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    if (isActive != null) {
      $result.isActive = isActive;
    }
    if (link != null) {
      $result.link = link;
    }
    if (sharedBy != null) {
      $result.sharedBy = sharedBy;
    }
    return $result;
  }
  DisplayExternalLinkFeatures._() : super();
  factory DisplayExternalLinkFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisplayExternalLinkFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DisplayExternalLinkFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..aOS(3, _omitFieldNames ? '' : 'link')
    ..aOS(4, _omitFieldNames ? '' : 'sharedBy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisplayExternalLinkFeatures clone() => DisplayExternalLinkFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisplayExternalLinkFeatures copyWith(void Function(DisplayExternalLinkFeatures) updates) => super.copyWith((message) => updates(message as DisplayExternalLinkFeatures)) as DisplayExternalLinkFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisplayExternalLinkFeatures create() => DisplayExternalLinkFeatures._();
  DisplayExternalLinkFeatures createEmptyInstance() => create();
  static $pb.PbList<DisplayExternalLinkFeatures> createRepeated() => $pb.PbList<DisplayExternalLinkFeatures>();
  @$core.pragma('dart2js:noInline')
  static DisplayExternalLinkFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisplayExternalLinkFeatures>(create);
  static DisplayExternalLinkFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get link => $_getSZ(2);
  @$pb.TagNumber(3)
  set link($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLink() => $_has(2);
  @$pb.TagNumber(3)
  void clearLink() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sharedBy => $_getSZ(3);
  @$pb.TagNumber(4)
  set sharedBy($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSharedBy() => $_has(3);
  @$pb.TagNumber(4)
  void clearSharedBy() => clearField(4);
}

class RecordingFeatures extends $pb.GeneratedMessage {
  factory RecordingFeatures({
    $core.bool? isAllow,
    $core.bool? isAllowCloud,
    $core.bool? enableAutoCloudRecording,
    $core.bool? isAllowLocal,
    $core.bool? onlyRecordAdminWebcams,
  }) {
    final $result = create();
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    if (isAllowCloud != null) {
      $result.isAllowCloud = isAllowCloud;
    }
    if (enableAutoCloudRecording != null) {
      $result.enableAutoCloudRecording = enableAutoCloudRecording;
    }
    if (isAllowLocal != null) {
      $result.isAllowLocal = isAllowLocal;
    }
    if (onlyRecordAdminWebcams != null) {
      $result.onlyRecordAdminWebcams = onlyRecordAdminWebcams;
    }
    return $result;
  }
  RecordingFeatures._() : super();
  factory RecordingFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecordingFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecordingFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isAllowCloud')
    ..aOB(3, _omitFieldNames ? '' : 'enableAutoCloudRecording')
    ..aOB(4, _omitFieldNames ? '' : 'isAllowLocal')
    ..aOB(5, _omitFieldNames ? '' : 'onlyRecordAdminWebcams')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecordingFeatures clone() => RecordingFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecordingFeatures copyWith(void Function(RecordingFeatures) updates) => super.copyWith((message) => updates(message as RecordingFeatures)) as RecordingFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordingFeatures create() => RecordingFeatures._();
  RecordingFeatures createEmptyInstance() => create();
  static $pb.PbList<RecordingFeatures> createRepeated() => $pb.PbList<RecordingFeatures>();
  @$core.pragma('dart2js:noInline')
  static RecordingFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecordingFeatures>(create);
  static RecordingFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAllowCloud => $_getBF(1);
  @$pb.TagNumber(2)
  set isAllowCloud($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsAllowCloud() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAllowCloud() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get enableAutoCloudRecording => $_getBF(2);
  @$pb.TagNumber(3)
  set enableAutoCloudRecording($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEnableAutoCloudRecording() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnableAutoCloudRecording() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isAllowLocal => $_getBF(3);
  @$pb.TagNumber(4)
  set isAllowLocal($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsAllowLocal() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsAllowLocal() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get onlyRecordAdminWebcams => $_getBF(4);
  @$pb.TagNumber(5)
  set onlyRecordAdminWebcams($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOnlyRecordAdminWebcams() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlyRecordAdminWebcams() => clearField(5);
}

class IngressFeatures extends $pb.GeneratedMessage {
  factory IngressFeatures({
    $core.bool? isAllow,
    $25.IngressInput? inputType,
    $core.String? url,
    $core.String? streamKey,
  }) {
    final $result = create();
    if (isAllow != null) {
      $result.isAllow = isAllow;
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
  IngressFeatures._() : super();
  factory IngressFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IngressFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IngressFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..e<$25.IngressInput>(2, _omitFieldNames ? '' : 'inputType', $pb.PbFieldType.OE, defaultOrMaker: $25.IngressInput.RTMP_INPUT, valueOf: $25.IngressInput.valueOf, enumValues: $25.IngressInput.values)
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..aOS(4, _omitFieldNames ? '' : 'streamKey')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IngressFeatures clone() => IngressFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IngressFeatures copyWith(void Function(IngressFeatures) updates) => super.copyWith((message) => updates(message as IngressFeatures)) as IngressFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IngressFeatures create() => IngressFeatures._();
  IngressFeatures createEmptyInstance() => create();
  static $pb.PbList<IngressFeatures> createRepeated() => $pb.PbList<IngressFeatures>();
  @$core.pragma('dart2js:noInline')
  static IngressFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IngressFeatures>(create);
  static IngressFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => clearField(1);

  @$pb.TagNumber(2)
  $25.IngressInput get inputType => $_getN(1);
  @$pb.TagNumber(2)
  set inputType($25.IngressInput v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasInputType() => $_has(1);
  @$pb.TagNumber(2)
  void clearInputType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get streamKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set streamKey($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStreamKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearStreamKey() => clearField(4);
}

/// deprecated use insights_features
class SpeechToTextTranslationFeatures extends $pb.GeneratedMessage {
  factory SpeechToTextTranslationFeatures({
    $core.bool? isAllow,
    $core.bool? isAllowTranslation,
    $core.bool? isEnabled,
    $core.bool? isEnabledTranslation,
    $core.Iterable<$core.String>? allowedSpeechLangs,
    $core.Iterable<$core.String>? allowedSpeechUsers,
    $core.Iterable<$core.String>? allowedTransLangs,
    $core.String? defaultSubtitleLang,
    $core.int? maxNumTranLangsAllowSelecting,
  }) {
    final $result = create();
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    if (isAllowTranslation != null) {
      $result.isAllowTranslation = isAllowTranslation;
    }
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    if (isEnabledTranslation != null) {
      $result.isEnabledTranslation = isEnabledTranslation;
    }
    if (allowedSpeechLangs != null) {
      $result.allowedSpeechLangs.addAll(allowedSpeechLangs);
    }
    if (allowedSpeechUsers != null) {
      $result.allowedSpeechUsers.addAll(allowedSpeechUsers);
    }
    if (allowedTransLangs != null) {
      $result.allowedTransLangs.addAll(allowedTransLangs);
    }
    if (defaultSubtitleLang != null) {
      $result.defaultSubtitleLang = defaultSubtitleLang;
    }
    if (maxNumTranLangsAllowSelecting != null) {
      $result.maxNumTranLangsAllowSelecting = maxNumTranLangsAllowSelecting;
    }
    return $result;
  }
  SpeechToTextTranslationFeatures._() : super();
  factory SpeechToTextTranslationFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SpeechToTextTranslationFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SpeechToTextTranslationFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isAllowTranslation')
    ..aOB(3, _omitFieldNames ? '' : 'isEnabled')
    ..aOB(4, _omitFieldNames ? '' : 'isEnabledTranslation')
    ..pPS(7, _omitFieldNames ? '' : 'allowedSpeechLangs')
    ..pPS(8, _omitFieldNames ? '' : 'allowedSpeechUsers')
    ..pPS(9, _omitFieldNames ? '' : 'allowedTransLangs')
    ..aOS(10, _omitFieldNames ? '' : 'defaultSubtitleLang')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'maxNumTranLangsAllowSelecting', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SpeechToTextTranslationFeatures clone() => SpeechToTextTranslationFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SpeechToTextTranslationFeatures copyWith(void Function(SpeechToTextTranslationFeatures) updates) => super.copyWith((message) => updates(message as SpeechToTextTranslationFeatures)) as SpeechToTextTranslationFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechToTextTranslationFeatures create() => SpeechToTextTranslationFeatures._();
  SpeechToTextTranslationFeatures createEmptyInstance() => create();
  static $pb.PbList<SpeechToTextTranslationFeatures> createRepeated() => $pb.PbList<SpeechToTextTranslationFeatures>();
  @$core.pragma('dart2js:noInline')
  static SpeechToTextTranslationFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpeechToTextTranslationFeatures>(create);
  static SpeechToTextTranslationFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAllowTranslation => $_getBF(1);
  @$pb.TagNumber(2)
  set isAllowTranslation($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsAllowTranslation() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAllowTranslation() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isEnabled => $_getBF(2);
  @$pb.TagNumber(3)
  set isEnabled($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsEnabled() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsEnabled() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isEnabledTranslation => $_getBF(3);
  @$pb.TagNumber(4)
  set isEnabledTranslation($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsEnabledTranslation() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsEnabledTranslation() => clearField(4);

  @$pb.TagNumber(7)
  $core.List<$core.String> get allowedSpeechLangs => $_getList(4);

  @$pb.TagNumber(8)
  $core.List<$core.String> get allowedSpeechUsers => $_getList(5);

  @$pb.TagNumber(9)
  $core.List<$core.String> get allowedTransLangs => $_getList(6);

  @$pb.TagNumber(10)
  $core.String get defaultSubtitleLang => $_getSZ(7);
  @$pb.TagNumber(10)
  set defaultSubtitleLang($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(10)
  $core.bool hasDefaultSubtitleLang() => $_has(7);
  @$pb.TagNumber(10)
  void clearDefaultSubtitleLang() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get maxNumTranLangsAllowSelecting => $_getIZ(8);
  @$pb.TagNumber(11)
  set maxNumTranLangsAllowSelecting($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(11)
  $core.bool hasMaxNumTranLangsAllowSelecting() => $_has(8);
  @$pb.TagNumber(11)
  void clearMaxNumTranLangsAllowSelecting() => clearField(11);
}

class EndToEndEncryptionFeatures extends $pb.GeneratedMessage {
  factory EndToEndEncryptionFeatures({
    $core.bool? isEnabled,
    $core.bool? includedChatMessages,
    $core.bool? includedWhiteboard,
    $core.String? encryptionKey,
    $core.bool? enabledSelfInsertEncryptionKey,
  }) {
    final $result = create();
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    if (includedChatMessages != null) {
      $result.includedChatMessages = includedChatMessages;
    }
    if (includedWhiteboard != null) {
      $result.includedWhiteboard = includedWhiteboard;
    }
    if (encryptionKey != null) {
      $result.encryptionKey = encryptionKey;
    }
    if (enabledSelfInsertEncryptionKey != null) {
      $result.enabledSelfInsertEncryptionKey = enabledSelfInsertEncryptionKey;
    }
    return $result;
  }
  EndToEndEncryptionFeatures._() : super();
  factory EndToEndEncryptionFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EndToEndEncryptionFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EndToEndEncryptionFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isEnabled')
    ..aOB(2, _omitFieldNames ? '' : 'includedChatMessages')
    ..aOB(3, _omitFieldNames ? '' : 'includedWhiteboard')
    ..aOS(4, _omitFieldNames ? '' : 'encryptionKey')
    ..aOB(5, _omitFieldNames ? '' : 'enabledSelfInsertEncryptionKey')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EndToEndEncryptionFeatures clone() => EndToEndEncryptionFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EndToEndEncryptionFeatures copyWith(void Function(EndToEndEncryptionFeatures) updates) => super.copyWith((message) => updates(message as EndToEndEncryptionFeatures)) as EndToEndEncryptionFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndToEndEncryptionFeatures create() => EndToEndEncryptionFeatures._();
  EndToEndEncryptionFeatures createEmptyInstance() => create();
  static $pb.PbList<EndToEndEncryptionFeatures> createRepeated() => $pb.PbList<EndToEndEncryptionFeatures>();
  @$core.pragma('dart2js:noInline')
  static EndToEndEncryptionFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EndToEndEncryptionFeatures>(create);
  static EndToEndEncryptionFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isEnabled => $_getBF(0);
  @$pb.TagNumber(1)
  set isEnabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsEnabled() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get includedChatMessages => $_getBF(1);
  @$pb.TagNumber(2)
  set includedChatMessages($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIncludedChatMessages() => $_has(1);
  @$pb.TagNumber(2)
  void clearIncludedChatMessages() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get includedWhiteboard => $_getBF(2);
  @$pb.TagNumber(3)
  set includedWhiteboard($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIncludedWhiteboard() => $_has(2);
  @$pb.TagNumber(3)
  void clearIncludedWhiteboard() => clearField(3);

  /// internal fields
  @$pb.TagNumber(4)
  $core.String get encryptionKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set encryptionKey($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEncryptionKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearEncryptionKey() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get enabledSelfInsertEncryptionKey => $_getBF(4);
  @$pb.TagNumber(5)
  set enabledSelfInsertEncryptionKey($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEnabledSelfInsertEncryptionKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearEnabledSelfInsertEncryptionKey() => clearField(5);
}

class PollsFeatures extends $pb.GeneratedMessage {
  factory PollsFeatures({
    $core.bool? isAllow,
    $core.bool? isActive,
  }) {
    final $result = create();
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    if (isActive != null) {
      $result.isActive = isActive;
    }
    return $result;
  }
  PollsFeatures._() : super();
  factory PollsFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PollsFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PollsFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PollsFeatures clone() => PollsFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PollsFeatures copyWith(void Function(PollsFeatures) updates) => super.copyWith((message) => updates(message as PollsFeatures)) as PollsFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PollsFeatures create() => PollsFeatures._();
  PollsFeatures createEmptyInstance() => create();
  static $pb.PbList<PollsFeatures> createRepeated() => $pb.PbList<PollsFeatures>();
  @$core.pragma('dart2js:noInline')
  static PollsFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PollsFeatures>(create);
  static PollsFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => clearField(2);
}

class InsightsFeatures extends $pb.GeneratedMessage {
  factory InsightsFeatures({
    $core.bool? isAllow,
    InsightsTranscriptionFeatures? transcriptionFeatures,
    InsightsChatTranslationFeatures? chatTranslationFeatures,
    InsightsAIFeatures? aiFeatures,
  }) {
    final $result = create();
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    if (transcriptionFeatures != null) {
      $result.transcriptionFeatures = transcriptionFeatures;
    }
    if (chatTranslationFeatures != null) {
      $result.chatTranslationFeatures = chatTranslationFeatures;
    }
    if (aiFeatures != null) {
      $result.aiFeatures = aiFeatures;
    }
    return $result;
  }
  InsightsFeatures._() : super();
  factory InsightsFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOM<InsightsTranscriptionFeatures>(2, _omitFieldNames ? '' : 'transcriptionFeatures', subBuilder: InsightsTranscriptionFeatures.create)
    ..aOM<InsightsChatTranslationFeatures>(3, _omitFieldNames ? '' : 'chatTranslationFeatures', subBuilder: InsightsChatTranslationFeatures.create)
    ..aOM<InsightsAIFeatures>(4, _omitFieldNames ? '' : 'aiFeatures', subBuilder: InsightsAIFeatures.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsFeatures clone() => InsightsFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsFeatures copyWith(void Function(InsightsFeatures) updates) => super.copyWith((message) => updates(message as InsightsFeatures)) as InsightsFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsFeatures create() => InsightsFeatures._();
  InsightsFeatures createEmptyInstance() => create();
  static $pb.PbList<InsightsFeatures> createRepeated() => $pb.PbList<InsightsFeatures>();
  @$core.pragma('dart2js:noInline')
  static InsightsFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsFeatures>(create);
  static InsightsFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => clearField(1);

  @$pb.TagNumber(2)
  InsightsTranscriptionFeatures get transcriptionFeatures => $_getN(1);
  @$pb.TagNumber(2)
  set transcriptionFeatures(InsightsTranscriptionFeatures v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTranscriptionFeatures() => $_has(1);
  @$pb.TagNumber(2)
  void clearTranscriptionFeatures() => clearField(2);
  @$pb.TagNumber(2)
  InsightsTranscriptionFeatures ensureTranscriptionFeatures() => $_ensure(1);

  @$pb.TagNumber(3)
  InsightsChatTranslationFeatures get chatTranslationFeatures => $_getN(2);
  @$pb.TagNumber(3)
  set chatTranslationFeatures(InsightsChatTranslationFeatures v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatTranslationFeatures() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatTranslationFeatures() => clearField(3);
  @$pb.TagNumber(3)
  InsightsChatTranslationFeatures ensureChatTranslationFeatures() => $_ensure(2);

  @$pb.TagNumber(4)
  InsightsAIFeatures get aiFeatures => $_getN(3);
  @$pb.TagNumber(4)
  set aiFeatures(InsightsAIFeatures v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAiFeatures() => $_has(3);
  @$pb.TagNumber(4)
  void clearAiFeatures() => clearField(4);
  @$pb.TagNumber(4)
  InsightsAIFeatures ensureAiFeatures() => $_ensure(3);
}

class InsightsTranscriptionFeatures extends $pb.GeneratedMessage {
  factory InsightsTranscriptionFeatures({
    $core.bool? isAllow,
    $core.bool? isAllowTranslation,
    $core.bool? isAllowSpeechSynthesis,
    $core.bool? isEnabled,
    $core.Iterable<$core.String>? allowedSpokenLangs,
    $core.Iterable<$core.String>? allowedSpeechUsers,
    $core.bool? isEnabledTranslation,
    $core.int? maxSelectedTransLangs,
    $core.Iterable<$core.String>? allowedTransLangs,
    $core.String? defaultSubtitleLang,
    $core.bool? isEnabledSpeechSynthesis,
  }) {
    final $result = create();
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    if (isAllowTranslation != null) {
      $result.isAllowTranslation = isAllowTranslation;
    }
    if (isAllowSpeechSynthesis != null) {
      $result.isAllowSpeechSynthesis = isAllowSpeechSynthesis;
    }
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
    if (maxSelectedTransLangs != null) {
      $result.maxSelectedTransLangs = maxSelectedTransLangs;
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
  InsightsTranscriptionFeatures._() : super();
  factory InsightsTranscriptionFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsTranscriptionFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsTranscriptionFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isAllowTranslation')
    ..aOB(3, _omitFieldNames ? '' : 'isAllowSpeechSynthesis')
    ..aOB(4, _omitFieldNames ? '' : 'isEnabled')
    ..pPS(5, _omitFieldNames ? '' : 'allowedSpokenLangs')
    ..pPS(6, _omitFieldNames ? '' : 'allowedSpeechUsers')
    ..aOB(7, _omitFieldNames ? '' : 'isEnabledTranslation')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'maxSelectedTransLangs', $pb.PbFieldType.O3)
    ..pPS(9, _omitFieldNames ? '' : 'allowedTransLangs')
    ..aOS(10, _omitFieldNames ? '' : 'defaultSubtitleLang')
    ..aOB(11, _omitFieldNames ? '' : 'isEnabledSpeechSynthesis')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsTranscriptionFeatures clone() => InsightsTranscriptionFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsTranscriptionFeatures copyWith(void Function(InsightsTranscriptionFeatures) updates) => super.copyWith((message) => updates(message as InsightsTranscriptionFeatures)) as InsightsTranscriptionFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsTranscriptionFeatures create() => InsightsTranscriptionFeatures._();
  InsightsTranscriptionFeatures createEmptyInstance() => create();
  static $pb.PbList<InsightsTranscriptionFeatures> createRepeated() => $pb.PbList<InsightsTranscriptionFeatures>();
  @$core.pragma('dart2js:noInline')
  static InsightsTranscriptionFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsTranscriptionFeatures>(create);
  static InsightsTranscriptionFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAllowTranslation => $_getBF(1);
  @$pb.TagNumber(2)
  set isAllowTranslation($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsAllowTranslation() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAllowTranslation() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAllowSpeechSynthesis => $_getBF(2);
  @$pb.TagNumber(3)
  set isAllowSpeechSynthesis($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAllowSpeechSynthesis() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAllowSpeechSynthesis() => clearField(3);

  /// all internal usage fields
  @$pb.TagNumber(4)
  $core.bool get isEnabled => $_getBF(3);
  @$pb.TagNumber(4)
  set isEnabled($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsEnabled() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsEnabled() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get allowedSpokenLangs => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get allowedSpeechUsers => $_getList(5);

  @$pb.TagNumber(7)
  $core.bool get isEnabledTranslation => $_getBF(6);
  @$pb.TagNumber(7)
  set isEnabledTranslation($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsEnabledTranslation() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsEnabledTranslation() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get maxSelectedTransLangs => $_getIZ(7);
  @$pb.TagNumber(8)
  set maxSelectedTransLangs($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMaxSelectedTransLangs() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxSelectedTransLangs() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.String> get allowedTransLangs => $_getList(8);

  @$pb.TagNumber(10)
  $core.String get defaultSubtitleLang => $_getSZ(9);
  @$pb.TagNumber(10)
  set defaultSubtitleLang($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDefaultSubtitleLang() => $_has(9);
  @$pb.TagNumber(10)
  void clearDefaultSubtitleLang() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isEnabledSpeechSynthesis => $_getBF(10);
  @$pb.TagNumber(11)
  set isEnabledSpeechSynthesis($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasIsEnabledSpeechSynthesis() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsEnabledSpeechSynthesis() => clearField(11);
}

class InsightsChatTranslationFeatures extends $pb.GeneratedMessage {
  factory InsightsChatTranslationFeatures({
    $core.bool? isAllow,
    $core.bool? isEnabled,
    $core.Iterable<$core.String>? allowedTransLangs,
    $core.int? maxSelectedTransLangs,
    $core.String? defaultLang,
  }) {
    final $result = create();
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    if (allowedTransLangs != null) {
      $result.allowedTransLangs.addAll(allowedTransLangs);
    }
    if (maxSelectedTransLangs != null) {
      $result.maxSelectedTransLangs = maxSelectedTransLangs;
    }
    if (defaultLang != null) {
      $result.defaultLang = defaultLang;
    }
    return $result;
  }
  InsightsChatTranslationFeatures._() : super();
  factory InsightsChatTranslationFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsChatTranslationFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsChatTranslationFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isEnabled')
    ..pPS(3, _omitFieldNames ? '' : 'allowedTransLangs')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'maxSelectedTransLangs', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'defaultLang')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsChatTranslationFeatures clone() => InsightsChatTranslationFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsChatTranslationFeatures copyWith(void Function(InsightsChatTranslationFeatures) updates) => super.copyWith((message) => updates(message as InsightsChatTranslationFeatures)) as InsightsChatTranslationFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsChatTranslationFeatures create() => InsightsChatTranslationFeatures._();
  InsightsChatTranslationFeatures createEmptyInstance() => create();
  static $pb.PbList<InsightsChatTranslationFeatures> createRepeated() => $pb.PbList<InsightsChatTranslationFeatures>();
  @$core.pragma('dart2js:noInline')
  static InsightsChatTranslationFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsChatTranslationFeatures>(create);
  static InsightsChatTranslationFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => clearField(1);

  /// all internal usage fields
  @$pb.TagNumber(2)
  $core.bool get isEnabled => $_getBF(1);
  @$pb.TagNumber(2)
  set isEnabled($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsEnabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsEnabled() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get allowedTransLangs => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get maxSelectedTransLangs => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxSelectedTransLangs($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMaxSelectedTransLangs() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxSelectedTransLangs() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get defaultLang => $_getSZ(4);
  @$pb.TagNumber(5)
  set defaultLang($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDefaultLang() => $_has(4);
  @$pb.TagNumber(5)
  void clearDefaultLang() => clearField(5);
}

class InsightsAIFeatures extends $pb.GeneratedMessage {
  factory InsightsAIFeatures({
    $core.bool? isAllow,
    InsightsAITextChatFeatures? aiTextChatFeatures,
    InsightsAIMeetingSummarizationFeatures? meetingSummarizationFeatures,
  }) {
    final $result = create();
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    if (aiTextChatFeatures != null) {
      $result.aiTextChatFeatures = aiTextChatFeatures;
    }
    if (meetingSummarizationFeatures != null) {
      $result.meetingSummarizationFeatures = meetingSummarizationFeatures;
    }
    return $result;
  }
  InsightsAIFeatures._() : super();
  factory InsightsAIFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsAIFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsAIFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOM<InsightsAITextChatFeatures>(2, _omitFieldNames ? '' : 'aiTextChatFeatures', subBuilder: InsightsAITextChatFeatures.create)
    ..aOM<InsightsAIMeetingSummarizationFeatures>(3, _omitFieldNames ? '' : 'meetingSummarizationFeatures', subBuilder: InsightsAIMeetingSummarizationFeatures.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsAIFeatures clone() => InsightsAIFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsAIFeatures copyWith(void Function(InsightsAIFeatures) updates) => super.copyWith((message) => updates(message as InsightsAIFeatures)) as InsightsAIFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsAIFeatures create() => InsightsAIFeatures._();
  InsightsAIFeatures createEmptyInstance() => create();
  static $pb.PbList<InsightsAIFeatures> createRepeated() => $pb.PbList<InsightsAIFeatures>();
  @$core.pragma('dart2js:noInline')
  static InsightsAIFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsAIFeatures>(create);
  static InsightsAIFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => clearField(1);

  @$pb.TagNumber(2)
  InsightsAITextChatFeatures get aiTextChatFeatures => $_getN(1);
  @$pb.TagNumber(2)
  set aiTextChatFeatures(InsightsAITextChatFeatures v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAiTextChatFeatures() => $_has(1);
  @$pb.TagNumber(2)
  void clearAiTextChatFeatures() => clearField(2);
  @$pb.TagNumber(2)
  InsightsAITextChatFeatures ensureAiTextChatFeatures() => $_ensure(1);

  @$pb.TagNumber(3)
  InsightsAIMeetingSummarizationFeatures get meetingSummarizationFeatures => $_getN(2);
  @$pb.TagNumber(3)
  set meetingSummarizationFeatures(InsightsAIMeetingSummarizationFeatures v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMeetingSummarizationFeatures() => $_has(2);
  @$pb.TagNumber(3)
  void clearMeetingSummarizationFeatures() => clearField(3);
  @$pb.TagNumber(3)
  InsightsAIMeetingSummarizationFeatures ensureMeetingSummarizationFeatures() => $_ensure(2);
}

class InsightsAITextChatFeatures extends $pb.GeneratedMessage {
  factory InsightsAITextChatFeatures({
    $core.bool? isAllow,
    $core.bool? isEnabled,
    $core.bool? isAllowedEveryone,
    $core.Iterable<$core.String>? allowedUserIds,
  }) {
    final $result = create();
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
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
  InsightsAITextChatFeatures._() : super();
  factory InsightsAITextChatFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsAITextChatFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsAITextChatFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isEnabled')
    ..aOB(3, _omitFieldNames ? '' : 'isAllowedEveryone')
    ..pPS(4, _omitFieldNames ? '' : 'allowedUserIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsAITextChatFeatures clone() => InsightsAITextChatFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsAITextChatFeatures copyWith(void Function(InsightsAITextChatFeatures) updates) => super.copyWith((message) => updates(message as InsightsAITextChatFeatures)) as InsightsAITextChatFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsAITextChatFeatures create() => InsightsAITextChatFeatures._();
  InsightsAITextChatFeatures createEmptyInstance() => create();
  static $pb.PbList<InsightsAITextChatFeatures> createRepeated() => $pb.PbList<InsightsAITextChatFeatures>();
  @$core.pragma('dart2js:noInline')
  static InsightsAITextChatFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsAITextChatFeatures>(create);
  static InsightsAITextChatFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => clearField(1);

  /// all internal usage fields
  @$pb.TagNumber(2)
  $core.bool get isEnabled => $_getBF(1);
  @$pb.TagNumber(2)
  set isEnabled($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsEnabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsEnabled() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAllowedEveryone => $_getBF(2);
  @$pb.TagNumber(3)
  set isAllowedEveryone($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAllowedEveryone() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAllowedEveryone() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get allowedUserIds => $_getList(3);
}

class InsightsAIMeetingSummarizationFeatures extends $pb.GeneratedMessage {
  factory InsightsAIMeetingSummarizationFeatures({
    $core.bool? isAllow,
    $core.String? summarizationPrompt,
    $core.bool? isEnabled,
  }) {
    final $result = create();
    if (isAllow != null) {
      $result.isAllow = isAllow;
    }
    if (summarizationPrompt != null) {
      $result.summarizationPrompt = summarizationPrompt;
    }
    if (isEnabled != null) {
      $result.isEnabled = isEnabled;
    }
    return $result;
  }
  InsightsAIMeetingSummarizationFeatures._() : super();
  factory InsightsAIMeetingSummarizationFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsightsAIMeetingSummarizationFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsightsAIMeetingSummarizationFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOS(2, _omitFieldNames ? '' : 'summarizationPrompt')
    ..aOB(3, _omitFieldNames ? '' : 'isEnabled')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsightsAIMeetingSummarizationFeatures clone() => InsightsAIMeetingSummarizationFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsightsAIMeetingSummarizationFeatures copyWith(void Function(InsightsAIMeetingSummarizationFeatures) updates) => super.copyWith((message) => updates(message as InsightsAIMeetingSummarizationFeatures)) as InsightsAIMeetingSummarizationFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsAIMeetingSummarizationFeatures create() => InsightsAIMeetingSummarizationFeatures._();
  InsightsAIMeetingSummarizationFeatures createEmptyInstance() => create();
  static $pb.PbList<InsightsAIMeetingSummarizationFeatures> createRepeated() => $pb.PbList<InsightsAIMeetingSummarizationFeatures>();
  @$core.pragma('dart2js:noInline')
  static InsightsAIMeetingSummarizationFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsightsAIMeetingSummarizationFeatures>(create);
  static InsightsAIMeetingSummarizationFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get summarizationPrompt => $_getSZ(1);
  @$pb.TagNumber(2)
  set summarizationPrompt($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSummarizationPrompt() => $_has(1);
  @$pb.TagNumber(2)
  void clearSummarizationPrompt() => clearField(2);

  /// all internal usage fields
  @$pb.TagNumber(3)
  $core.bool get isEnabled => $_getBF(2);
  @$pb.TagNumber(3)
  set isEnabled($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsEnabled() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsEnabled() => clearField(3);
}

class CopyrightConf extends $pb.GeneratedMessage {
  factory CopyrightConf({
    $core.bool? display,
    $core.String? text,
  }) {
    final $result = create();
    if (display != null) {
      $result.display = display;
    }
    if (text != null) {
      $result.text = text;
    }
    return $result;
  }
  CopyrightConf._() : super();
  factory CopyrightConf.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CopyrightConf.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CopyrightConf', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'display')
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CopyrightConf clone() => CopyrightConf()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CopyrightConf copyWith(void Function(CopyrightConf) updates) => super.copyWith((message) => updates(message as CopyrightConf)) as CopyrightConf;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CopyrightConf create() => CopyrightConf._();
  CopyrightConf createEmptyInstance() => create();
  static $pb.PbList<CopyrightConf> createRepeated() => $pb.PbList<CopyrightConf>();
  @$core.pragma('dart2js:noInline')
  static CopyrightConf getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CopyrightConf>(create);
  static CopyrightConf? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get display => $_getBF(0);
  @$pb.TagNumber(1)
  set display($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDisplay() => $_has(0);
  @$pb.TagNumber(1)
  void clearDisplay() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(3)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(3)
  void clearText() => clearField(3);
}

class CreateRoomRes extends $pb.GeneratedMessage {
  factory CreateRoomRes({
    $core.bool? status,
    $core.String? msg,
    $19.ActiveRoomInfo? roomInfo,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (roomInfo != null) {
      $result.roomInfo = roomInfo;
    }
    return $result;
  }
  CreateRoomRes._() : super();
  factory CreateRoomRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRoomRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRoomRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<$19.ActiveRoomInfo>(3, _omitFieldNames ? '' : 'roomInfo', subBuilder: $19.ActiveRoomInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRoomRes clone() => CreateRoomRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRoomRes copyWith(void Function(CreateRoomRes) updates) => super.copyWith((message) => updates(message as CreateRoomRes)) as CreateRoomRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRoomRes create() => CreateRoomRes._();
  CreateRoomRes createEmptyInstance() => create();
  static $pb.PbList<CreateRoomRes> createRepeated() => $pb.PbList<CreateRoomRes>();
  @$core.pragma('dart2js:noInline')
  static CreateRoomRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRoomRes>(create);
  static CreateRoomRes? _defaultInstance;

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
  $19.ActiveRoomInfo get roomInfo => $_getN(2);
  @$pb.TagNumber(3)
  set roomInfo($19.ActiveRoomInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomInfo() => clearField(3);
  @$pb.TagNumber(3)
  $19.ActiveRoomInfo ensureRoomInfo() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
