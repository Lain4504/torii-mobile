// This is a generated file - do not edit.
//
// Generated from wajlc_create_room.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_auth_room.pb.dart' as $1;
import 'wajlc_gen_token.pb.dart' as $0;
import 'wajlc_ingress.pbenum.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CreateRoomReq extends $pb.GeneratedMessage {
  factory CreateRoomReq({
    $core.String? roomId,
    $core.int? emptyTimeout,
    $core.int? maxParticipants,
    RoomMetadata? metadata,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (emptyTimeout != null) result.emptyTimeout = emptyTimeout;
    if (maxParticipants != null) result.maxParticipants = maxParticipants;
    if (metadata != null) result.metadata = metadata;
    return result;
  }

  CreateRoomReq._();

  factory CreateRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'emptyTimeout', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'maxParticipants', $pb.PbFieldType.OU3)
    ..aOM<RoomMetadata>(4, _omitFieldNames ? '' : 'metadata',
        subBuilder: RoomMetadata.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateRoomReq clone() => CreateRoomReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateRoomReq copyWith(void Function(CreateRoomReq) updates) =>
      super.copyWith((message) => updates(message as CreateRoomReq))
          as CreateRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRoomReq create() => CreateRoomReq._();
  @$core.override
  CreateRoomReq createEmptyInstance() => create();
  static $pb.PbList<CreateRoomReq> createRepeated() =>
      $pb.PbList<CreateRoomReq>();
  @$core.pragma('dart2js:noInline')
  static CreateRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateRoomReq>(create);
  static CreateRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get emptyTimeout => $_getIZ(1);
  @$pb.TagNumber(2)
  set emptyTimeout($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEmptyTimeout() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmptyTimeout() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get maxParticipants => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxParticipants($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMaxParticipants() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxParticipants() => $_clearField(3);

  @$pb.TagNumber(4)
  RoomMetadata get metadata => $_getN(3);
  @$pb.TagNumber(4)
  set metadata(RoomMetadata value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMetadata() => $_has(3);
  @$pb.TagNumber(4)
  void clearMetadata() => $_clearField(4);
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
    $0.LockSettings? defaultLockSettings,
    CopyrightConf? copyrightConf,
    $core.String? metadataId,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? extraData,
  }) {
    final result = create();
    if (roomTitle != null) result.roomTitle = roomTitle;
    if (welcomeMessage != null) result.welcomeMessage = welcomeMessage;
    if (isRecording != null) result.isRecording = isRecording;
    if (isActiveRtmp != null) result.isActiveRtmp = isActiveRtmp;
    if (parentRoomId != null) result.parentRoomId = parentRoomId;
    if (isBreakoutRoom != null) result.isBreakoutRoom = isBreakoutRoom;
    if (webhookUrl != null) result.webhookUrl = webhookUrl;
    if (startedAt != null) result.startedAt = startedAt;
    if (logoutUrl != null) result.logoutUrl = logoutUrl;
    if (roomFeatures != null) result.roomFeatures = roomFeatures;
    if (defaultLockSettings != null)
      result.defaultLockSettings = defaultLockSettings;
    if (copyrightConf != null) result.copyrightConf = copyrightConf;
    if (metadataId != null) result.metadataId = metadataId;
    if (extraData != null) result.extraData.addEntries(extraData);
    return result;
  }

  RoomMetadata._();

  factory RoomMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomTitle')
    ..aOS(2, _omitFieldNames ? '' : 'welcomeMessage')
    ..aOB(3, _omitFieldNames ? '' : 'isRecording')
    ..aOB(4, _omitFieldNames ? '' : 'isActiveRtmp')
    ..aOS(5, _omitFieldNames ? '' : 'parentRoomId')
    ..aOB(6, _omitFieldNames ? '' : 'isBreakoutRoom')
    ..aOS(7, _omitFieldNames ? '' : 'webhookUrl')
    ..a<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'startedAt', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(9, _omitFieldNames ? '' : 'logoutUrl')
    ..aOM<RoomCreateFeatures>(10, _omitFieldNames ? '' : 'roomFeatures',
        subBuilder: RoomCreateFeatures.create)
    ..aOM<$0.LockSettings>(11, _omitFieldNames ? '' : 'defaultLockSettings',
        subBuilder: $0.LockSettings.create)
    ..aOM<CopyrightConf>(12, _omitFieldNames ? '' : 'copyrightConf',
        subBuilder: CopyrightConf.create)
    ..aOS(13, _omitFieldNames ? '' : 'metadataId')
    ..m<$core.String, $core.String>(14, _omitFieldNames ? '' : 'extraData',
        entryClassName: 'RoomMetadata.ExtraDataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('wajlc'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMetadata clone() => RoomMetadata()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMetadata copyWith(void Function(RoomMetadata) updates) =>
      super.copyWith((message) => updates(message as RoomMetadata))
          as RoomMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomMetadata create() => RoomMetadata._();
  @$core.override
  RoomMetadata createEmptyInstance() => create();
  static $pb.PbList<RoomMetadata> createRepeated() =>
      $pb.PbList<RoomMetadata>();
  @$core.pragma('dart2js:noInline')
  static RoomMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomMetadata>(create);
  static RoomMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomTitle => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomTitle($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get welcomeMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set welcomeMessage($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWelcomeMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearWelcomeMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isRecording => $_getBF(2);
  @$pb.TagNumber(3)
  set isRecording($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsRecording() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsRecording() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isActiveRtmp => $_getBF(3);
  @$pb.TagNumber(4)
  set isActiveRtmp($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsActiveRtmp() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsActiveRtmp() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get parentRoomId => $_getSZ(4);
  @$pb.TagNumber(5)
  set parentRoomId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasParentRoomId() => $_has(4);
  @$pb.TagNumber(5)
  void clearParentRoomId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isBreakoutRoom => $_getBF(5);
  @$pb.TagNumber(6)
  set isBreakoutRoom($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsBreakoutRoom() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsBreakoutRoom() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get webhookUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set webhookUrl($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasWebhookUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearWebhookUrl() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get startedAt => $_getI64(7);
  @$pb.TagNumber(8)
  set startedAt($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasStartedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearStartedAt() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get logoutUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set logoutUrl($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasLogoutUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearLogoutUrl() => $_clearField(9);

  @$pb.TagNumber(10)
  RoomCreateFeatures get roomFeatures => $_getN(9);
  @$pb.TagNumber(10)
  set roomFeatures(RoomCreateFeatures value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasRoomFeatures() => $_has(9);
  @$pb.TagNumber(10)
  void clearRoomFeatures() => $_clearField(10);
  @$pb.TagNumber(10)
  RoomCreateFeatures ensureRoomFeatures() => $_ensure(9);

  @$pb.TagNumber(11)
  $0.LockSettings get defaultLockSettings => $_getN(10);
  @$pb.TagNumber(11)
  set defaultLockSettings($0.LockSettings value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasDefaultLockSettings() => $_has(10);
  @$pb.TagNumber(11)
  void clearDefaultLockSettings() => $_clearField(11);
  @$pb.TagNumber(11)
  $0.LockSettings ensureDefaultLockSettings() => $_ensure(10);

  @$pb.TagNumber(12)
  CopyrightConf get copyrightConf => $_getN(11);
  @$pb.TagNumber(12)
  set copyrightConf(CopyrightConf value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasCopyrightConf() => $_has(11);
  @$pb.TagNumber(12)
  void clearCopyrightConf() => $_clearField(12);
  @$pb.TagNumber(12)
  CopyrightConf ensureCopyrightConf() => $_ensure(11);

  /// we'll use this as version control
  @$pb.TagNumber(13)
  $core.String get metadataId => $_getSZ(12);
  @$pb.TagNumber(13)
  set metadataId($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasMetadataId() => $_has(12);
  @$pb.TagNumber(13)
  void clearMetadataId() => $_clearField(13);

  @$pb.TagNumber(14)
  $pb.PbMap<$core.String, $core.String> get extraData => $_getMap(13);
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
    @$core.Deprecated('This field is deprecated.') $core.bool? allowPolls,
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
    final result = create();
    if (allowWebcams != null) result.allowWebcams = allowWebcams;
    if (muteOnStart != null) result.muteOnStart = muteOnStart;
    if (allowScreenShare != null) result.allowScreenShare = allowScreenShare;
    if (allowRtmp != null) result.allowRtmp = allowRtmp;
    if (allowViewOtherWebcams != null)
      result.allowViewOtherWebcams = allowViewOtherWebcams;
    if (allowViewOtherUsersList != null)
      result.allowViewOtherUsersList = allowViewOtherUsersList;
    if (adminOnlyWebcams != null) result.adminOnlyWebcams = adminOnlyWebcams;
    if (allowPolls != null) result.allowPolls = allowPolls;
    if (roomDuration != null) result.roomDuration = roomDuration;
    if (enableAnalytics != null) result.enableAnalytics = enableAnalytics;
    if (allowVirtualBg != null) result.allowVirtualBg = allowVirtualBg;
    if (allowRaiseHand != null) result.allowRaiseHand = allowRaiseHand;
    if (autoGenUserId != null) result.autoGenUserId = autoGenUserId;
    if (recordingFeatures != null) result.recordingFeatures = recordingFeatures;
    if (chatFeatures != null) result.chatFeatures = chatFeatures;
    if (sharedNotePadFeatures != null)
      result.sharedNotePadFeatures = sharedNotePadFeatures;
    if (whiteboardFeatures != null)
      result.whiteboardFeatures = whiteboardFeatures;
    if (externalMediaPlayerFeatures != null)
      result.externalMediaPlayerFeatures = externalMediaPlayerFeatures;
    if (waitingRoomFeatures != null)
      result.waitingRoomFeatures = waitingRoomFeatures;
    if (breakoutRoomFeatures != null)
      result.breakoutRoomFeatures = breakoutRoomFeatures;
    if (displayExternalLinkFeatures != null)
      result.displayExternalLinkFeatures = displayExternalLinkFeatures;
    if (ingressFeatures != null) result.ingressFeatures = ingressFeatures;
    if (speechToTextTranslationFeatures != null)
      result.speechToTextTranslationFeatures = speechToTextTranslationFeatures;
    if (endToEndEncryptionFeatures != null)
      result.endToEndEncryptionFeatures = endToEndEncryptionFeatures;
    if (pollsFeatures != null) result.pollsFeatures = pollsFeatures;
    if (insightsFeatures != null) result.insightsFeatures = insightsFeatures;
    return result;
  }

  RoomCreateFeatures._();

  factory RoomCreateFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomCreateFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomCreateFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'allowWebcams')
    ..aOB(2, _omitFieldNames ? '' : 'muteOnStart')
    ..aOB(3, _omitFieldNames ? '' : 'allowScreenShare')
    ..aOB(4, _omitFieldNames ? '' : 'allowRtmp')
    ..aOB(5, _omitFieldNames ? '' : 'allowViewOtherWebcams')
    ..aOB(6, _omitFieldNames ? '' : 'allowViewOtherUsersList')
    ..aOB(7, _omitFieldNames ? '' : 'adminOnlyWebcams')
    ..aOB(8, _omitFieldNames ? '' : 'allowPolls')
    ..a<$fixnum.Int64>(
        9, _omitFieldNames ? '' : 'roomDuration', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(10, _omitFieldNames ? '' : 'enableAnalytics')
    ..aOB(11, _omitFieldNames ? '' : 'allowVirtualBg')
    ..aOB(12, _omitFieldNames ? '' : 'allowRaiseHand')
    ..aOB(13, _omitFieldNames ? '' : 'autoGenUserId')
    ..aOM<RecordingFeatures>(14, _omitFieldNames ? '' : 'recordingFeatures',
        subBuilder: RecordingFeatures.create)
    ..aOM<ChatFeatures>(15, _omitFieldNames ? '' : 'chatFeatures',
        subBuilder: ChatFeatures.create)
    ..aOM<SharedNotePadFeatures>(
        16, _omitFieldNames ? '' : 'sharedNotePadFeatures',
        subBuilder: SharedNotePadFeatures.create)
    ..aOM<WhiteboardFeatures>(17, _omitFieldNames ? '' : 'whiteboardFeatures',
        subBuilder: WhiteboardFeatures.create)
    ..aOM<ExternalMediaPlayerFeatures>(
        18, _omitFieldNames ? '' : 'externalMediaPlayerFeatures',
        subBuilder: ExternalMediaPlayerFeatures.create)
    ..aOM<WaitingRoomFeatures>(19, _omitFieldNames ? '' : 'waitingRoomFeatures',
        subBuilder: WaitingRoomFeatures.create)
    ..aOM<BreakoutRoomFeatures>(
        20, _omitFieldNames ? '' : 'breakoutRoomFeatures',
        subBuilder: BreakoutRoomFeatures.create)
    ..aOM<DisplayExternalLinkFeatures>(
        21, _omitFieldNames ? '' : 'displayExternalLinkFeatures',
        subBuilder: DisplayExternalLinkFeatures.create)
    ..aOM<IngressFeatures>(22, _omitFieldNames ? '' : 'ingressFeatures',
        subBuilder: IngressFeatures.create)
    ..aOM<SpeechToTextTranslationFeatures>(
        23, _omitFieldNames ? '' : 'speechToTextTranslationFeatures',
        subBuilder: SpeechToTextTranslationFeatures.create)
    ..aOM<EndToEndEncryptionFeatures>(
        24, _omitFieldNames ? '' : 'endToEndEncryptionFeatures',
        subBuilder: EndToEndEncryptionFeatures.create)
    ..aOM<PollsFeatures>(25, _omitFieldNames ? '' : 'pollsFeatures',
        subBuilder: PollsFeatures.create)
    ..aOM<InsightsFeatures>(26, _omitFieldNames ? '' : 'insightsFeatures',
        subBuilder: InsightsFeatures.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomCreateFeatures clone() => RoomCreateFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomCreateFeatures copyWith(void Function(RoomCreateFeatures) updates) =>
      super.copyWith((message) => updates(message as RoomCreateFeatures))
          as RoomCreateFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomCreateFeatures create() => RoomCreateFeatures._();
  @$core.override
  RoomCreateFeatures createEmptyInstance() => create();
  static $pb.PbList<RoomCreateFeatures> createRepeated() =>
      $pb.PbList<RoomCreateFeatures>();
  @$core.pragma('dart2js:noInline')
  static RoomCreateFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCreateFeatures>(create);
  static RoomCreateFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get allowWebcams => $_getBF(0);
  @$pb.TagNumber(1)
  set allowWebcams($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAllowWebcams() => $_has(0);
  @$pb.TagNumber(1)
  void clearAllowWebcams() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get muteOnStart => $_getBF(1);
  @$pb.TagNumber(2)
  set muteOnStart($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMuteOnStart() => $_has(1);
  @$pb.TagNumber(2)
  void clearMuteOnStart() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get allowScreenShare => $_getBF(2);
  @$pb.TagNumber(3)
  set allowScreenShare($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAllowScreenShare() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowScreenShare() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get allowRtmp => $_getBF(3);
  @$pb.TagNumber(4)
  set allowRtmp($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAllowRtmp() => $_has(3);
  @$pb.TagNumber(4)
  void clearAllowRtmp() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get allowViewOtherWebcams => $_getBF(4);
  @$pb.TagNumber(5)
  set allowViewOtherWebcams($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAllowViewOtherWebcams() => $_has(4);
  @$pb.TagNumber(5)
  void clearAllowViewOtherWebcams() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get allowViewOtherUsersList => $_getBF(5);
  @$pb.TagNumber(6)
  set allowViewOtherUsersList($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAllowViewOtherUsersList() => $_has(5);
  @$pb.TagNumber(6)
  void clearAllowViewOtherUsersList() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get adminOnlyWebcams => $_getBF(6);
  @$pb.TagNumber(7)
  set adminOnlyWebcams($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAdminOnlyWebcams() => $_has(6);
  @$pb.TagNumber(7)
  void clearAdminOnlyWebcams() => $_clearField(7);

  /// deprecated use polls_features
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.bool get allowPolls => $_getBF(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  set allowPolls($core.bool value) => $_setBool(7, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.bool hasAllowPolls() => $_has(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  void clearAllowPolls() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get roomDuration => $_getI64(8);
  @$pb.TagNumber(9)
  set roomDuration($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRoomDuration() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoomDuration() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get enableAnalytics => $_getBF(9);
  @$pb.TagNumber(10)
  set enableAnalytics($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasEnableAnalytics() => $_has(9);
  @$pb.TagNumber(10)
  void clearEnableAnalytics() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get allowVirtualBg => $_getBF(10);
  @$pb.TagNumber(11)
  set allowVirtualBg($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasAllowVirtualBg() => $_has(10);
  @$pb.TagNumber(11)
  void clearAllowVirtualBg() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get allowRaiseHand => $_getBF(11);
  @$pb.TagNumber(12)
  set allowRaiseHand($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasAllowRaiseHand() => $_has(11);
  @$pb.TagNumber(12)
  void clearAllowRaiseHand() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.bool get autoGenUserId => $_getBF(12);
  @$pb.TagNumber(13)
  set autoGenUserId($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(13)
  $core.bool hasAutoGenUserId() => $_has(12);
  @$pb.TagNumber(13)
  void clearAutoGenUserId() => $_clearField(13);

  @$pb.TagNumber(14)
  RecordingFeatures get recordingFeatures => $_getN(13);
  @$pb.TagNumber(14)
  set recordingFeatures(RecordingFeatures value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasRecordingFeatures() => $_has(13);
  @$pb.TagNumber(14)
  void clearRecordingFeatures() => $_clearField(14);
  @$pb.TagNumber(14)
  RecordingFeatures ensureRecordingFeatures() => $_ensure(13);

  @$pb.TagNumber(15)
  ChatFeatures get chatFeatures => $_getN(14);
  @$pb.TagNumber(15)
  set chatFeatures(ChatFeatures value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasChatFeatures() => $_has(14);
  @$pb.TagNumber(15)
  void clearChatFeatures() => $_clearField(15);
  @$pb.TagNumber(15)
  ChatFeatures ensureChatFeatures() => $_ensure(14);

  @$pb.TagNumber(16)
  SharedNotePadFeatures get sharedNotePadFeatures => $_getN(15);
  @$pb.TagNumber(16)
  set sharedNotePadFeatures(SharedNotePadFeatures value) =>
      $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasSharedNotePadFeatures() => $_has(15);
  @$pb.TagNumber(16)
  void clearSharedNotePadFeatures() => $_clearField(16);
  @$pb.TagNumber(16)
  SharedNotePadFeatures ensureSharedNotePadFeatures() => $_ensure(15);

  @$pb.TagNumber(17)
  WhiteboardFeatures get whiteboardFeatures => $_getN(16);
  @$pb.TagNumber(17)
  set whiteboardFeatures(WhiteboardFeatures value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasWhiteboardFeatures() => $_has(16);
  @$pb.TagNumber(17)
  void clearWhiteboardFeatures() => $_clearField(17);
  @$pb.TagNumber(17)
  WhiteboardFeatures ensureWhiteboardFeatures() => $_ensure(16);

  @$pb.TagNumber(18)
  ExternalMediaPlayerFeatures get externalMediaPlayerFeatures => $_getN(17);
  @$pb.TagNumber(18)
  set externalMediaPlayerFeatures(ExternalMediaPlayerFeatures value) =>
      $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasExternalMediaPlayerFeatures() => $_has(17);
  @$pb.TagNumber(18)
  void clearExternalMediaPlayerFeatures() => $_clearField(18);
  @$pb.TagNumber(18)
  ExternalMediaPlayerFeatures ensureExternalMediaPlayerFeatures() =>
      $_ensure(17);

  @$pb.TagNumber(19)
  WaitingRoomFeatures get waitingRoomFeatures => $_getN(18);
  @$pb.TagNumber(19)
  set waitingRoomFeatures(WaitingRoomFeatures value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasWaitingRoomFeatures() => $_has(18);
  @$pb.TagNumber(19)
  void clearWaitingRoomFeatures() => $_clearField(19);
  @$pb.TagNumber(19)
  WaitingRoomFeatures ensureWaitingRoomFeatures() => $_ensure(18);

  @$pb.TagNumber(20)
  BreakoutRoomFeatures get breakoutRoomFeatures => $_getN(19);
  @$pb.TagNumber(20)
  set breakoutRoomFeatures(BreakoutRoomFeatures value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasBreakoutRoomFeatures() => $_has(19);
  @$pb.TagNumber(20)
  void clearBreakoutRoomFeatures() => $_clearField(20);
  @$pb.TagNumber(20)
  BreakoutRoomFeatures ensureBreakoutRoomFeatures() => $_ensure(19);

  @$pb.TagNumber(21)
  DisplayExternalLinkFeatures get displayExternalLinkFeatures => $_getN(20);
  @$pb.TagNumber(21)
  set displayExternalLinkFeatures(DisplayExternalLinkFeatures value) =>
      $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasDisplayExternalLinkFeatures() => $_has(20);
  @$pb.TagNumber(21)
  void clearDisplayExternalLinkFeatures() => $_clearField(21);
  @$pb.TagNumber(21)
  DisplayExternalLinkFeatures ensureDisplayExternalLinkFeatures() =>
      $_ensure(20);

  @$pb.TagNumber(22)
  IngressFeatures get ingressFeatures => $_getN(21);
  @$pb.TagNumber(22)
  set ingressFeatures(IngressFeatures value) => $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasIngressFeatures() => $_has(21);
  @$pb.TagNumber(22)
  void clearIngressFeatures() => $_clearField(22);
  @$pb.TagNumber(22)
  IngressFeatures ensureIngressFeatures() => $_ensure(21);

  /// deprecated use insights_features
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(23)
  SpeechToTextTranslationFeatures get speechToTextTranslationFeatures =>
      $_getN(22);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(23)
  set speechToTextTranslationFeatures(SpeechToTextTranslationFeatures value) =>
      $_setField(23, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(23)
  $core.bool hasSpeechToTextTranslationFeatures() => $_has(22);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(23)
  void clearSpeechToTextTranslationFeatures() => $_clearField(23);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(23)
  SpeechToTextTranslationFeatures ensureSpeechToTextTranslationFeatures() =>
      $_ensure(22);

  @$pb.TagNumber(24)
  EndToEndEncryptionFeatures get endToEndEncryptionFeatures => $_getN(23);
  @$pb.TagNumber(24)
  set endToEndEncryptionFeatures(EndToEndEncryptionFeatures value) =>
      $_setField(24, value);
  @$pb.TagNumber(24)
  $core.bool hasEndToEndEncryptionFeatures() => $_has(23);
  @$pb.TagNumber(24)
  void clearEndToEndEncryptionFeatures() => $_clearField(24);
  @$pb.TagNumber(24)
  EndToEndEncryptionFeatures ensureEndToEndEncryptionFeatures() => $_ensure(23);

  @$pb.TagNumber(25)
  PollsFeatures get pollsFeatures => $_getN(24);
  @$pb.TagNumber(25)
  set pollsFeatures(PollsFeatures value) => $_setField(25, value);
  @$pb.TagNumber(25)
  $core.bool hasPollsFeatures() => $_has(24);
  @$pb.TagNumber(25)
  void clearPollsFeatures() => $_clearField(25);
  @$pb.TagNumber(25)
  PollsFeatures ensurePollsFeatures() => $_ensure(24);

  @$pb.TagNumber(26)
  InsightsFeatures get insightsFeatures => $_getN(25);
  @$pb.TagNumber(26)
  set insightsFeatures(InsightsFeatures value) => $_setField(26, value);
  @$pb.TagNumber(26)
  $core.bool hasInsightsFeatures() => $_has(25);
  @$pb.TagNumber(26)
  void clearInsightsFeatures() => $_clearField(26);
  @$pb.TagNumber(26)
  InsightsFeatures ensureInsightsFeatures() => $_ensure(25);
}

class ChatFeatures extends $pb.GeneratedMessage {
  factory ChatFeatures({
    @$core.Deprecated('This field is deprecated.') $core.bool? allowChat,
    @$core.Deprecated('This field is deprecated.') $core.bool? allowFileUpload,
    $core.Iterable<$core.String>? allowedFileTypes,
    $fixnum.Int64? maxFileSize,
    $core.bool? isAllow,
    $core.bool? isAllowFileUpload,
  }) {
    final result = create();
    if (allowChat != null) result.allowChat = allowChat;
    if (allowFileUpload != null) result.allowFileUpload = allowFileUpload;
    if (allowedFileTypes != null)
      result.allowedFileTypes.addAll(allowedFileTypes);
    if (maxFileSize != null) result.maxFileSize = maxFileSize;
    if (isAllow != null) result.isAllow = isAllow;
    if (isAllowFileUpload != null) result.isAllowFileUpload = isAllowFileUpload;
    return result;
  }

  ChatFeatures._();

  factory ChatFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'allowChat')
    ..aOB(2, _omitFieldNames ? '' : 'allowFileUpload')
    ..pPS(3, _omitFieldNames ? '' : 'allowedFileTypes')
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'maxFileSize', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(5, _omitFieldNames ? '' : 'isAllow')
    ..aOB(6, _omitFieldNames ? '' : 'isAllowFileUpload')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatFeatures clone() => ChatFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatFeatures copyWith(void Function(ChatFeatures) updates) =>
      super.copyWith((message) => updates(message as ChatFeatures))
          as ChatFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatFeatures create() => ChatFeatures._();
  @$core.override
  ChatFeatures createEmptyInstance() => create();
  static $pb.PbList<ChatFeatures> createRepeated() =>
      $pb.PbList<ChatFeatures>();
  @$core.pragma('dart2js:noInline')
  static ChatFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatFeatures>(create);
  static ChatFeatures? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool get allowChat => $_getBF(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set allowChat($core.bool value) => $_setBool(0, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasAllowChat() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearAllowChat() => $_clearField(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool get allowFileUpload => $_getBF(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set allowFileUpload($core.bool value) => $_setBool(1, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasAllowFileUpload() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearAllowFileUpload() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get allowedFileTypes => $_getList(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get maxFileSize => $_getI64(3);
  @$pb.TagNumber(4)
  set maxFileSize($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMaxFileSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxFileSize() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isAllow => $_getBF(4);
  @$pb.TagNumber(5)
  set isAllow($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsAllow() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsAllow() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isAllowFileUpload => $_getBF(5);
  @$pb.TagNumber(6)
  set isAllowFileUpload($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsAllowFileUpload() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsAllowFileUpload() => $_clearField(6);
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
    final result = create();
    if (allowedSharedNotePad != null)
      result.allowedSharedNotePad = allowedSharedNotePad;
    if (isActive != null) result.isActive = isActive;
    if (visible != null) result.visible = visible;
    if (nodeId != null) result.nodeId = nodeId;
    if (host != null) result.host = host;
    if (notePadId != null) result.notePadId = notePadId;
    if (readOnlyPadId != null) result.readOnlyPadId = readOnlyPadId;
    if (isAllow != null) result.isAllow = isAllow;
    return result;
  }

  SharedNotePadFeatures._();

  factory SharedNotePadFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SharedNotePadFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SharedNotePadFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'allowedSharedNotePad')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..aOB(3, _omitFieldNames ? '' : 'visible')
    ..aOS(4, _omitFieldNames ? '' : 'nodeId')
    ..aOS(5, _omitFieldNames ? '' : 'host')
    ..aOS(6, _omitFieldNames ? '' : 'notePadId')
    ..aOS(7, _omitFieldNames ? '' : 'readOnlyPadId')
    ..aOB(8, _omitFieldNames ? '' : 'isAllow')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SharedNotePadFeatures clone() =>
      SharedNotePadFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SharedNotePadFeatures copyWith(
          void Function(SharedNotePadFeatures) updates) =>
      super.copyWith((message) => updates(message as SharedNotePadFeatures))
          as SharedNotePadFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SharedNotePadFeatures create() => SharedNotePadFeatures._();
  @$core.override
  SharedNotePadFeatures createEmptyInstance() => create();
  static $pb.PbList<SharedNotePadFeatures> createRepeated() =>
      $pb.PbList<SharedNotePadFeatures>();
  @$core.pragma('dart2js:noInline')
  static SharedNotePadFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SharedNotePadFeatures>(create);
  static SharedNotePadFeatures? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool get allowedSharedNotePad => $_getBF(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set allowedSharedNotePad($core.bool value) => $_setBool(0, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasAllowedSharedNotePad() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearAllowedSharedNotePad() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get visible => $_getBF(2);
  @$pb.TagNumber(3)
  set visible($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVisible() => $_has(2);
  @$pb.TagNumber(3)
  void clearVisible() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get nodeId => $_getSZ(3);
  @$pb.TagNumber(4)
  set nodeId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNodeId() => $_has(3);
  @$pb.TagNumber(4)
  void clearNodeId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get host => $_getSZ(4);
  @$pb.TagNumber(5)
  set host($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasHost() => $_has(4);
  @$pb.TagNumber(5)
  void clearHost() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get notePadId => $_getSZ(5);
  @$pb.TagNumber(6)
  set notePadId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNotePadId() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotePadId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get readOnlyPadId => $_getSZ(6);
  @$pb.TagNumber(7)
  set readOnlyPadId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasReadOnlyPadId() => $_has(6);
  @$pb.TagNumber(7)
  void clearReadOnlyPadId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isAllow => $_getBF(7);
  @$pb.TagNumber(8)
  set isAllow($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIsAllow() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsAllow() => $_clearField(8);
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
    final result = create();
    if (allowedWhiteboard != null) result.allowedWhiteboard = allowedWhiteboard;
    if (visible != null) result.visible = visible;
    if (preloadFile != null) result.preloadFile = preloadFile;
    if (whiteboardFileId != null) result.whiteboardFileId = whiteboardFileId;
    if (fileName != null) result.fileName = fileName;
    if (filePath != null) result.filePath = filePath;
    if (totalPages != null) result.totalPages = totalPages;
    if (maxAllowedFileSize != null)
      result.maxAllowedFileSize = maxAllowedFileSize;
    if (isAllow != null) result.isAllow = isAllow;
    return result;
  }

  WhiteboardFeatures._();

  factory WhiteboardFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhiteboardFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhiteboardFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'allowedWhiteboard')
    ..aOB(2, _omitFieldNames ? '' : 'visible')
    ..aOS(3, _omitFieldNames ? '' : 'preloadFile')
    ..aOS(4, _omitFieldNames ? '' : 'whiteboardFileId')
    ..aOS(5, _omitFieldNames ? '' : 'fileName')
    ..aOS(6, _omitFieldNames ? '' : 'filePath')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'totalPages', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'maxAllowedFileSize', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(9, _omitFieldNames ? '' : 'isAllow')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhiteboardFeatures clone() => WhiteboardFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhiteboardFeatures copyWith(void Function(WhiteboardFeatures) updates) =>
      super.copyWith((message) => updates(message as WhiteboardFeatures))
          as WhiteboardFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhiteboardFeatures create() => WhiteboardFeatures._();
  @$core.override
  WhiteboardFeatures createEmptyInstance() => create();
  static $pb.PbList<WhiteboardFeatures> createRepeated() =>
      $pb.PbList<WhiteboardFeatures>();
  @$core.pragma('dart2js:noInline')
  static WhiteboardFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WhiteboardFeatures>(create);
  static WhiteboardFeatures? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool get allowedWhiteboard => $_getBF(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set allowedWhiteboard($core.bool value) => $_setBool(0, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasAllowedWhiteboard() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearAllowedWhiteboard() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get visible => $_getBF(1);
  @$pb.TagNumber(2)
  set visible($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVisible() => $_has(1);
  @$pb.TagNumber(2)
  void clearVisible() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get preloadFile => $_getSZ(2);
  @$pb.TagNumber(3)
  set preloadFile($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPreloadFile() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreloadFile() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get whiteboardFileId => $_getSZ(3);
  @$pb.TagNumber(4)
  set whiteboardFileId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWhiteboardFileId() => $_has(3);
  @$pb.TagNumber(4)
  void clearWhiteboardFileId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get fileName => $_getSZ(4);
  @$pb.TagNumber(5)
  set fileName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFileName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get filePath => $_getSZ(5);
  @$pb.TagNumber(6)
  set filePath($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFilePath() => $_has(5);
  @$pb.TagNumber(6)
  void clearFilePath() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get totalPages => $_getIZ(6);
  @$pb.TagNumber(7)
  set totalPages($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTotalPages() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalPages() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get maxAllowedFileSize => $_getI64(7);
  @$pb.TagNumber(8)
  set maxAllowedFileSize($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasMaxAllowedFileSize() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxAllowedFileSize() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isAllow => $_getBF(8);
  @$pb.TagNumber(9)
  set isAllow($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIsAllow() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsAllow() => $_clearField(9);
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
    final result = create();
    if (allowedExternalMediaPlayer != null)
      result.allowedExternalMediaPlayer = allowedExternalMediaPlayer;
    if (isActive != null) result.isActive = isActive;
    if (sharedBy != null) result.sharedBy = sharedBy;
    if (url != null) result.url = url;
    if (isAllow != null) result.isAllow = isAllow;
    return result;
  }

  ExternalMediaPlayerFeatures._();

  factory ExternalMediaPlayerFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExternalMediaPlayerFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExternalMediaPlayerFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'allowedExternalMediaPlayer')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..aOS(3, _omitFieldNames ? '' : 'sharedBy')
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..aOB(5, _omitFieldNames ? '' : 'isAllow')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExternalMediaPlayerFeatures clone() =>
      ExternalMediaPlayerFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExternalMediaPlayerFeatures copyWith(
          void Function(ExternalMediaPlayerFeatures) updates) =>
      super.copyWith(
              (message) => updates(message as ExternalMediaPlayerFeatures))
          as ExternalMediaPlayerFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExternalMediaPlayerFeatures create() =>
      ExternalMediaPlayerFeatures._();
  @$core.override
  ExternalMediaPlayerFeatures createEmptyInstance() => create();
  static $pb.PbList<ExternalMediaPlayerFeatures> createRepeated() =>
      $pb.PbList<ExternalMediaPlayerFeatures>();
  @$core.pragma('dart2js:noInline')
  static ExternalMediaPlayerFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExternalMediaPlayerFeatures>(create);
  static ExternalMediaPlayerFeatures? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool get allowedExternalMediaPlayer => $_getBF(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set allowedExternalMediaPlayer($core.bool value) => $_setBool(0, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasAllowedExternalMediaPlayer() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearAllowedExternalMediaPlayer() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get sharedBy => $_getSZ(2);
  @$pb.TagNumber(3)
  set sharedBy($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSharedBy() => $_has(2);
  @$pb.TagNumber(3)
  void clearSharedBy() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isAllow => $_getBF(4);
  @$pb.TagNumber(5)
  set isAllow($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsAllow() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsAllow() => $_clearField(5);
}

class WaitingRoomFeatures extends $pb.GeneratedMessage {
  factory WaitingRoomFeatures({
    $core.bool? isActive,
    $core.String? waitingRoomMsg,
  }) {
    final result = create();
    if (isActive != null) result.isActive = isActive;
    if (waitingRoomMsg != null) result.waitingRoomMsg = waitingRoomMsg;
    return result;
  }

  WaitingRoomFeatures._();

  factory WaitingRoomFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WaitingRoomFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WaitingRoomFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isActive')
    ..aOS(2, _omitFieldNames ? '' : 'waitingRoomMsg')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WaitingRoomFeatures clone() => WaitingRoomFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WaitingRoomFeatures copyWith(void Function(WaitingRoomFeatures) updates) =>
      super.copyWith((message) => updates(message as WaitingRoomFeatures))
          as WaitingRoomFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WaitingRoomFeatures create() => WaitingRoomFeatures._();
  @$core.override
  WaitingRoomFeatures createEmptyInstance() => create();
  static $pb.PbList<WaitingRoomFeatures> createRepeated() =>
      $pb.PbList<WaitingRoomFeatures>();
  @$core.pragma('dart2js:noInline')
  static WaitingRoomFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WaitingRoomFeatures>(create);
  static WaitingRoomFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isActive => $_getBF(0);
  @$pb.TagNumber(1)
  set isActive($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsActive() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsActive() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get waitingRoomMsg => $_getSZ(1);
  @$pb.TagNumber(2)
  set waitingRoomMsg($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWaitingRoomMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearWaitingRoomMsg() => $_clearField(2);
}

class BreakoutRoomFeatures extends $pb.GeneratedMessage {
  factory BreakoutRoomFeatures({
    $core.bool? isAllow,
    $core.bool? isActive,
    $core.int? allowedNumberRooms,
  }) {
    final result = create();
    if (isAllow != null) result.isAllow = isAllow;
    if (isActive != null) result.isActive = isActive;
    if (allowedNumberRooms != null)
      result.allowedNumberRooms = allowedNumberRooms;
    return result;
  }

  BreakoutRoomFeatures._();

  factory BreakoutRoomFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BreakoutRoomFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BreakoutRoomFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'allowedNumberRooms', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BreakoutRoomFeatures clone() =>
      BreakoutRoomFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BreakoutRoomFeatures copyWith(void Function(BreakoutRoomFeatures) updates) =>
      super.copyWith((message) => updates(message as BreakoutRoomFeatures))
          as BreakoutRoomFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BreakoutRoomFeatures create() => BreakoutRoomFeatures._();
  @$core.override
  BreakoutRoomFeatures createEmptyInstance() => create();
  static $pb.PbList<BreakoutRoomFeatures> createRepeated() =>
      $pb.PbList<BreakoutRoomFeatures>();
  @$core.pragma('dart2js:noInline')
  static BreakoutRoomFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BreakoutRoomFeatures>(create);
  static BreakoutRoomFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get allowedNumberRooms => $_getIZ(2);
  @$pb.TagNumber(3)
  set allowedNumberRooms($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAllowedNumberRooms() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowedNumberRooms() => $_clearField(3);
}

class DisplayExternalLinkFeatures extends $pb.GeneratedMessage {
  factory DisplayExternalLinkFeatures({
    $core.bool? isAllow,
    $core.bool? isActive,
    $core.String? link,
    $core.String? sharedBy,
  }) {
    final result = create();
    if (isAllow != null) result.isAllow = isAllow;
    if (isActive != null) result.isActive = isActive;
    if (link != null) result.link = link;
    if (sharedBy != null) result.sharedBy = sharedBy;
    return result;
  }

  DisplayExternalLinkFeatures._();

  factory DisplayExternalLinkFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DisplayExternalLinkFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DisplayExternalLinkFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..aOS(3, _omitFieldNames ? '' : 'link')
    ..aOS(4, _omitFieldNames ? '' : 'sharedBy')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisplayExternalLinkFeatures clone() =>
      DisplayExternalLinkFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisplayExternalLinkFeatures copyWith(
          void Function(DisplayExternalLinkFeatures) updates) =>
      super.copyWith(
              (message) => updates(message as DisplayExternalLinkFeatures))
          as DisplayExternalLinkFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisplayExternalLinkFeatures create() =>
      DisplayExternalLinkFeatures._();
  @$core.override
  DisplayExternalLinkFeatures createEmptyInstance() => create();
  static $pb.PbList<DisplayExternalLinkFeatures> createRepeated() =>
      $pb.PbList<DisplayExternalLinkFeatures>();
  @$core.pragma('dart2js:noInline')
  static DisplayExternalLinkFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DisplayExternalLinkFeatures>(create);
  static DisplayExternalLinkFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get link => $_getSZ(2);
  @$pb.TagNumber(3)
  set link($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLink() => $_has(2);
  @$pb.TagNumber(3)
  void clearLink() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get sharedBy => $_getSZ(3);
  @$pb.TagNumber(4)
  set sharedBy($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSharedBy() => $_has(3);
  @$pb.TagNumber(4)
  void clearSharedBy() => $_clearField(4);
}

class RecordingFeatures extends $pb.GeneratedMessage {
  factory RecordingFeatures({
    $core.bool? isAllow,
    $core.bool? isAllowCloud,
    $core.bool? enableAutoCloudRecording,
    $core.bool? isAllowLocal,
    $core.bool? onlyRecordAdminWebcams,
  }) {
    final result = create();
    if (isAllow != null) result.isAllow = isAllow;
    if (isAllowCloud != null) result.isAllowCloud = isAllowCloud;
    if (enableAutoCloudRecording != null)
      result.enableAutoCloudRecording = enableAutoCloudRecording;
    if (isAllowLocal != null) result.isAllowLocal = isAllowLocal;
    if (onlyRecordAdminWebcams != null)
      result.onlyRecordAdminWebcams = onlyRecordAdminWebcams;
    return result;
  }

  RecordingFeatures._();

  factory RecordingFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecordingFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordingFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isAllowCloud')
    ..aOB(3, _omitFieldNames ? '' : 'enableAutoCloudRecording')
    ..aOB(4, _omitFieldNames ? '' : 'isAllowLocal')
    ..aOB(5, _omitFieldNames ? '' : 'onlyRecordAdminWebcams')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingFeatures clone() => RecordingFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingFeatures copyWith(void Function(RecordingFeatures) updates) =>
      super.copyWith((message) => updates(message as RecordingFeatures))
          as RecordingFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordingFeatures create() => RecordingFeatures._();
  @$core.override
  RecordingFeatures createEmptyInstance() => create();
  static $pb.PbList<RecordingFeatures> createRepeated() =>
      $pb.PbList<RecordingFeatures>();
  @$core.pragma('dart2js:noInline')
  static RecordingFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordingFeatures>(create);
  static RecordingFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAllowCloud => $_getBF(1);
  @$pb.TagNumber(2)
  set isAllowCloud($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsAllowCloud() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAllowCloud() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get enableAutoCloudRecording => $_getBF(2);
  @$pb.TagNumber(3)
  set enableAutoCloudRecording($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEnableAutoCloudRecording() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnableAutoCloudRecording() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isAllowLocal => $_getBF(3);
  @$pb.TagNumber(4)
  set isAllowLocal($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsAllowLocal() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsAllowLocal() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get onlyRecordAdminWebcams => $_getBF(4);
  @$pb.TagNumber(5)
  set onlyRecordAdminWebcams($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOnlyRecordAdminWebcams() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlyRecordAdminWebcams() => $_clearField(5);
}

class IngressFeatures extends $pb.GeneratedMessage {
  factory IngressFeatures({
    $core.bool? isAllow,
    $2.IngressInput? inputType,
    $core.String? url,
    $core.String? streamKey,
  }) {
    final result = create();
    if (isAllow != null) result.isAllow = isAllow;
    if (inputType != null) result.inputType = inputType;
    if (url != null) result.url = url;
    if (streamKey != null) result.streamKey = streamKey;
    return result;
  }

  IngressFeatures._();

  factory IngressFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IngressFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IngressFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..e<$2.IngressInput>(
        2, _omitFieldNames ? '' : 'inputType', $pb.PbFieldType.OE,
        defaultOrMaker: $2.IngressInput.RTMP_INPUT,
        valueOf: $2.IngressInput.valueOf,
        enumValues: $2.IngressInput.values)
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..aOS(4, _omitFieldNames ? '' : 'streamKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressFeatures clone() => IngressFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressFeatures copyWith(void Function(IngressFeatures) updates) =>
      super.copyWith((message) => updates(message as IngressFeatures))
          as IngressFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IngressFeatures create() => IngressFeatures._();
  @$core.override
  IngressFeatures createEmptyInstance() => create();
  static $pb.PbList<IngressFeatures> createRepeated() =>
      $pb.PbList<IngressFeatures>();
  @$core.pragma('dart2js:noInline')
  static IngressFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IngressFeatures>(create);
  static IngressFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.IngressInput get inputType => $_getN(1);
  @$pb.TagNumber(2)
  set inputType($2.IngressInput value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasInputType() => $_has(1);
  @$pb.TagNumber(2)
  void clearInputType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get streamKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set streamKey($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStreamKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearStreamKey() => $_clearField(4);
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
    final result = create();
    if (isAllow != null) result.isAllow = isAllow;
    if (isAllowTranslation != null)
      result.isAllowTranslation = isAllowTranslation;
    if (isEnabled != null) result.isEnabled = isEnabled;
    if (isEnabledTranslation != null)
      result.isEnabledTranslation = isEnabledTranslation;
    if (allowedSpeechLangs != null)
      result.allowedSpeechLangs.addAll(allowedSpeechLangs);
    if (allowedSpeechUsers != null)
      result.allowedSpeechUsers.addAll(allowedSpeechUsers);
    if (allowedTransLangs != null)
      result.allowedTransLangs.addAll(allowedTransLangs);
    if (defaultSubtitleLang != null)
      result.defaultSubtitleLang = defaultSubtitleLang;
    if (maxNumTranLangsAllowSelecting != null)
      result.maxNumTranLangsAllowSelecting = maxNumTranLangsAllowSelecting;
    return result;
  }

  SpeechToTextTranslationFeatures._();

  factory SpeechToTextTranslationFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpeechToTextTranslationFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpeechToTextTranslationFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isAllowTranslation')
    ..aOB(3, _omitFieldNames ? '' : 'isEnabled')
    ..aOB(4, _omitFieldNames ? '' : 'isEnabledTranslation')
    ..pPS(7, _omitFieldNames ? '' : 'allowedSpeechLangs')
    ..pPS(8, _omitFieldNames ? '' : 'allowedSpeechUsers')
    ..pPS(9, _omitFieldNames ? '' : 'allowedTransLangs')
    ..aOS(10, _omitFieldNames ? '' : 'defaultSubtitleLang')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'maxNumTranLangsAllowSelecting',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToTextTranslationFeatures clone() =>
      SpeechToTextTranslationFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToTextTranslationFeatures copyWith(
          void Function(SpeechToTextTranslationFeatures) updates) =>
      super.copyWith(
              (message) => updates(message as SpeechToTextTranslationFeatures))
          as SpeechToTextTranslationFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechToTextTranslationFeatures create() =>
      SpeechToTextTranslationFeatures._();
  @$core.override
  SpeechToTextTranslationFeatures createEmptyInstance() => create();
  static $pb.PbList<SpeechToTextTranslationFeatures> createRepeated() =>
      $pb.PbList<SpeechToTextTranslationFeatures>();
  @$core.pragma('dart2js:noInline')
  static SpeechToTextTranslationFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeechToTextTranslationFeatures>(
          create);
  static SpeechToTextTranslationFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAllowTranslation => $_getBF(1);
  @$pb.TagNumber(2)
  set isAllowTranslation($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsAllowTranslation() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAllowTranslation() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isEnabled => $_getBF(2);
  @$pb.TagNumber(3)
  set isEnabled($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsEnabled() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsEnabled() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isEnabledTranslation => $_getBF(3);
  @$pb.TagNumber(4)
  set isEnabledTranslation($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsEnabledTranslation() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsEnabledTranslation() => $_clearField(4);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get allowedSpeechLangs => $_getList(4);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get allowedSpeechUsers => $_getList(5);

  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get allowedTransLangs => $_getList(6);

  @$pb.TagNumber(10)
  $core.String get defaultSubtitleLang => $_getSZ(7);
  @$pb.TagNumber(10)
  set defaultSubtitleLang($core.String value) => $_setString(7, value);
  @$pb.TagNumber(10)
  $core.bool hasDefaultSubtitleLang() => $_has(7);
  @$pb.TagNumber(10)
  void clearDefaultSubtitleLang() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get maxNumTranLangsAllowSelecting => $_getIZ(8);
  @$pb.TagNumber(11)
  set maxNumTranLangsAllowSelecting($core.int value) =>
      $_setSignedInt32(8, value);
  @$pb.TagNumber(11)
  $core.bool hasMaxNumTranLangsAllowSelecting() => $_has(8);
  @$pb.TagNumber(11)
  void clearMaxNumTranLangsAllowSelecting() => $_clearField(11);
}

class EndToEndEncryptionFeatures extends $pb.GeneratedMessage {
  factory EndToEndEncryptionFeatures({
    $core.bool? isEnabled,
    $core.bool? includedChatMessages,
    $core.bool? includedWhiteboard,
    $core.String? encryptionKey,
    $core.bool? enabledSelfInsertEncryptionKey,
  }) {
    final result = create();
    if (isEnabled != null) result.isEnabled = isEnabled;
    if (includedChatMessages != null)
      result.includedChatMessages = includedChatMessages;
    if (includedWhiteboard != null)
      result.includedWhiteboard = includedWhiteboard;
    if (encryptionKey != null) result.encryptionKey = encryptionKey;
    if (enabledSelfInsertEncryptionKey != null)
      result.enabledSelfInsertEncryptionKey = enabledSelfInsertEncryptionKey;
    return result;
  }

  EndToEndEncryptionFeatures._();

  factory EndToEndEncryptionFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EndToEndEncryptionFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EndToEndEncryptionFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isEnabled')
    ..aOB(2, _omitFieldNames ? '' : 'includedChatMessages')
    ..aOB(3, _omitFieldNames ? '' : 'includedWhiteboard')
    ..aOS(4, _omitFieldNames ? '' : 'encryptionKey')
    ..aOB(5, _omitFieldNames ? '' : 'enabledSelfInsertEncryptionKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndToEndEncryptionFeatures clone() =>
      EndToEndEncryptionFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndToEndEncryptionFeatures copyWith(
          void Function(EndToEndEncryptionFeatures) updates) =>
      super.copyWith(
              (message) => updates(message as EndToEndEncryptionFeatures))
          as EndToEndEncryptionFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndToEndEncryptionFeatures create() => EndToEndEncryptionFeatures._();
  @$core.override
  EndToEndEncryptionFeatures createEmptyInstance() => create();
  static $pb.PbList<EndToEndEncryptionFeatures> createRepeated() =>
      $pb.PbList<EndToEndEncryptionFeatures>();
  @$core.pragma('dart2js:noInline')
  static EndToEndEncryptionFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EndToEndEncryptionFeatures>(create);
  static EndToEndEncryptionFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isEnabled => $_getBF(0);
  @$pb.TagNumber(1)
  set isEnabled($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsEnabled() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get includedChatMessages => $_getBF(1);
  @$pb.TagNumber(2)
  set includedChatMessages($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIncludedChatMessages() => $_has(1);
  @$pb.TagNumber(2)
  void clearIncludedChatMessages() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get includedWhiteboard => $_getBF(2);
  @$pb.TagNumber(3)
  set includedWhiteboard($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIncludedWhiteboard() => $_has(2);
  @$pb.TagNumber(3)
  void clearIncludedWhiteboard() => $_clearField(3);

  /// internal fields
  @$pb.TagNumber(4)
  $core.String get encryptionKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set encryptionKey($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEncryptionKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearEncryptionKey() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get enabledSelfInsertEncryptionKey => $_getBF(4);
  @$pb.TagNumber(5)
  set enabledSelfInsertEncryptionKey($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEnabledSelfInsertEncryptionKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearEnabledSelfInsertEncryptionKey() => $_clearField(5);
}

class PollsFeatures extends $pb.GeneratedMessage {
  factory PollsFeatures({
    $core.bool? isAllow,
    $core.bool? isActive,
  }) {
    final result = create();
    if (isAllow != null) result.isAllow = isAllow;
    if (isActive != null) result.isActive = isActive;
    return result;
  }

  PollsFeatures._();

  factory PollsFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PollsFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PollsFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PollsFeatures clone() => PollsFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PollsFeatures copyWith(void Function(PollsFeatures) updates) =>
      super.copyWith((message) => updates(message as PollsFeatures))
          as PollsFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PollsFeatures create() => PollsFeatures._();
  @$core.override
  PollsFeatures createEmptyInstance() => create();
  static $pb.PbList<PollsFeatures> createRepeated() =>
      $pb.PbList<PollsFeatures>();
  @$core.pragma('dart2js:noInline')
  static PollsFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PollsFeatures>(create);
  static PollsFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => $_clearField(2);
}

class InsightsFeatures extends $pb.GeneratedMessage {
  factory InsightsFeatures({
    $core.bool? isAllow,
    InsightsTranscriptionFeatures? transcriptionFeatures,
    InsightsChatTranslationFeatures? chatTranslationFeatures,
    InsightsAIFeatures? aiFeatures,
  }) {
    final result = create();
    if (isAllow != null) result.isAllow = isAllow;
    if (transcriptionFeatures != null)
      result.transcriptionFeatures = transcriptionFeatures;
    if (chatTranslationFeatures != null)
      result.chatTranslationFeatures = chatTranslationFeatures;
    if (aiFeatures != null) result.aiFeatures = aiFeatures;
    return result;
  }

  InsightsFeatures._();

  factory InsightsFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InsightsFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InsightsFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOM<InsightsTranscriptionFeatures>(
        2, _omitFieldNames ? '' : 'transcriptionFeatures',
        subBuilder: InsightsTranscriptionFeatures.create)
    ..aOM<InsightsChatTranslationFeatures>(
        3, _omitFieldNames ? '' : 'chatTranslationFeatures',
        subBuilder: InsightsChatTranslationFeatures.create)
    ..aOM<InsightsAIFeatures>(4, _omitFieldNames ? '' : 'aiFeatures',
        subBuilder: InsightsAIFeatures.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InsightsFeatures clone() => InsightsFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InsightsFeatures copyWith(void Function(InsightsFeatures) updates) =>
      super.copyWith((message) => updates(message as InsightsFeatures))
          as InsightsFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsFeatures create() => InsightsFeatures._();
  @$core.override
  InsightsFeatures createEmptyInstance() => create();
  static $pb.PbList<InsightsFeatures> createRepeated() =>
      $pb.PbList<InsightsFeatures>();
  @$core.pragma('dart2js:noInline')
  static InsightsFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InsightsFeatures>(create);
  static InsightsFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => $_clearField(1);

  @$pb.TagNumber(2)
  InsightsTranscriptionFeatures get transcriptionFeatures => $_getN(1);
  @$pb.TagNumber(2)
  set transcriptionFeatures(InsightsTranscriptionFeatures value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTranscriptionFeatures() => $_has(1);
  @$pb.TagNumber(2)
  void clearTranscriptionFeatures() => $_clearField(2);
  @$pb.TagNumber(2)
  InsightsTranscriptionFeatures ensureTranscriptionFeatures() => $_ensure(1);

  @$pb.TagNumber(3)
  InsightsChatTranslationFeatures get chatTranslationFeatures => $_getN(2);
  @$pb.TagNumber(3)
  set chatTranslationFeatures(InsightsChatTranslationFeatures value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasChatTranslationFeatures() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatTranslationFeatures() => $_clearField(3);
  @$pb.TagNumber(3)
  InsightsChatTranslationFeatures ensureChatTranslationFeatures() =>
      $_ensure(2);

  @$pb.TagNumber(4)
  InsightsAIFeatures get aiFeatures => $_getN(3);
  @$pb.TagNumber(4)
  set aiFeatures(InsightsAIFeatures value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAiFeatures() => $_has(3);
  @$pb.TagNumber(4)
  void clearAiFeatures() => $_clearField(4);
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
    final result = create();
    if (isAllow != null) result.isAllow = isAllow;
    if (isAllowTranslation != null)
      result.isAllowTranslation = isAllowTranslation;
    if (isAllowSpeechSynthesis != null)
      result.isAllowSpeechSynthesis = isAllowSpeechSynthesis;
    if (isEnabled != null) result.isEnabled = isEnabled;
    if (allowedSpokenLangs != null)
      result.allowedSpokenLangs.addAll(allowedSpokenLangs);
    if (allowedSpeechUsers != null)
      result.allowedSpeechUsers.addAll(allowedSpeechUsers);
    if (isEnabledTranslation != null)
      result.isEnabledTranslation = isEnabledTranslation;
    if (maxSelectedTransLangs != null)
      result.maxSelectedTransLangs = maxSelectedTransLangs;
    if (allowedTransLangs != null)
      result.allowedTransLangs.addAll(allowedTransLangs);
    if (defaultSubtitleLang != null)
      result.defaultSubtitleLang = defaultSubtitleLang;
    if (isEnabledSpeechSynthesis != null)
      result.isEnabledSpeechSynthesis = isEnabledSpeechSynthesis;
    return result;
  }

  InsightsTranscriptionFeatures._();

  factory InsightsTranscriptionFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InsightsTranscriptionFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InsightsTranscriptionFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isAllowTranslation')
    ..aOB(3, _omitFieldNames ? '' : 'isAllowSpeechSynthesis')
    ..aOB(4, _omitFieldNames ? '' : 'isEnabled')
    ..pPS(5, _omitFieldNames ? '' : 'allowedSpokenLangs')
    ..pPS(6, _omitFieldNames ? '' : 'allowedSpeechUsers')
    ..aOB(7, _omitFieldNames ? '' : 'isEnabledTranslation')
    ..a<$core.int>(
        8, _omitFieldNames ? '' : 'maxSelectedTransLangs', $pb.PbFieldType.O3)
    ..pPS(9, _omitFieldNames ? '' : 'allowedTransLangs')
    ..aOS(10, _omitFieldNames ? '' : 'defaultSubtitleLang')
    ..aOB(11, _omitFieldNames ? '' : 'isEnabledSpeechSynthesis')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InsightsTranscriptionFeatures clone() =>
      InsightsTranscriptionFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InsightsTranscriptionFeatures copyWith(
          void Function(InsightsTranscriptionFeatures) updates) =>
      super.copyWith(
              (message) => updates(message as InsightsTranscriptionFeatures))
          as InsightsTranscriptionFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsTranscriptionFeatures create() =>
      InsightsTranscriptionFeatures._();
  @$core.override
  InsightsTranscriptionFeatures createEmptyInstance() => create();
  static $pb.PbList<InsightsTranscriptionFeatures> createRepeated() =>
      $pb.PbList<InsightsTranscriptionFeatures>();
  @$core.pragma('dart2js:noInline')
  static InsightsTranscriptionFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InsightsTranscriptionFeatures>(create);
  static InsightsTranscriptionFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAllowTranslation => $_getBF(1);
  @$pb.TagNumber(2)
  set isAllowTranslation($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsAllowTranslation() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAllowTranslation() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAllowSpeechSynthesis => $_getBF(2);
  @$pb.TagNumber(3)
  set isAllowSpeechSynthesis($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsAllowSpeechSynthesis() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAllowSpeechSynthesis() => $_clearField(3);

  /// all internal usage fields
  @$pb.TagNumber(4)
  $core.bool get isEnabled => $_getBF(3);
  @$pb.TagNumber(4)
  set isEnabled($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsEnabled() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsEnabled() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get allowedSpokenLangs => $_getList(4);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get allowedSpeechUsers => $_getList(5);

  @$pb.TagNumber(7)
  $core.bool get isEnabledTranslation => $_getBF(6);
  @$pb.TagNumber(7)
  set isEnabledTranslation($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIsEnabledTranslation() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsEnabledTranslation() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get maxSelectedTransLangs => $_getIZ(7);
  @$pb.TagNumber(8)
  set maxSelectedTransLangs($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasMaxSelectedTransLangs() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxSelectedTransLangs() => $_clearField(8);

  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get allowedTransLangs => $_getList(8);

  @$pb.TagNumber(10)
  $core.String get defaultSubtitleLang => $_getSZ(9);
  @$pb.TagNumber(10)
  set defaultSubtitleLang($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasDefaultSubtitleLang() => $_has(9);
  @$pb.TagNumber(10)
  void clearDefaultSubtitleLang() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isEnabledSpeechSynthesis => $_getBF(10);
  @$pb.TagNumber(11)
  set isEnabledSpeechSynthesis($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasIsEnabledSpeechSynthesis() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsEnabledSpeechSynthesis() => $_clearField(11);
}

class InsightsChatTranslationFeatures extends $pb.GeneratedMessage {
  factory InsightsChatTranslationFeatures({
    $core.bool? isAllow,
    $core.bool? isEnabled,
    $core.Iterable<$core.String>? allowedTransLangs,
    $core.int? maxSelectedTransLangs,
    $core.String? defaultLang,
  }) {
    final result = create();
    if (isAllow != null) result.isAllow = isAllow;
    if (isEnabled != null) result.isEnabled = isEnabled;
    if (allowedTransLangs != null)
      result.allowedTransLangs.addAll(allowedTransLangs);
    if (maxSelectedTransLangs != null)
      result.maxSelectedTransLangs = maxSelectedTransLangs;
    if (defaultLang != null) result.defaultLang = defaultLang;
    return result;
  }

  InsightsChatTranslationFeatures._();

  factory InsightsChatTranslationFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InsightsChatTranslationFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InsightsChatTranslationFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isEnabled')
    ..pPS(3, _omitFieldNames ? '' : 'allowedTransLangs')
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'maxSelectedTransLangs', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'defaultLang')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InsightsChatTranslationFeatures clone() =>
      InsightsChatTranslationFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InsightsChatTranslationFeatures copyWith(
          void Function(InsightsChatTranslationFeatures) updates) =>
      super.copyWith(
              (message) => updates(message as InsightsChatTranslationFeatures))
          as InsightsChatTranslationFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsChatTranslationFeatures create() =>
      InsightsChatTranslationFeatures._();
  @$core.override
  InsightsChatTranslationFeatures createEmptyInstance() => create();
  static $pb.PbList<InsightsChatTranslationFeatures> createRepeated() =>
      $pb.PbList<InsightsChatTranslationFeatures>();
  @$core.pragma('dart2js:noInline')
  static InsightsChatTranslationFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InsightsChatTranslationFeatures>(
          create);
  static InsightsChatTranslationFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => $_clearField(1);

  /// all internal usage fields
  @$pb.TagNumber(2)
  $core.bool get isEnabled => $_getBF(1);
  @$pb.TagNumber(2)
  set isEnabled($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsEnabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsEnabled() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get allowedTransLangs => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get maxSelectedTransLangs => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxSelectedTransLangs($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMaxSelectedTransLangs() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxSelectedTransLangs() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get defaultLang => $_getSZ(4);
  @$pb.TagNumber(5)
  set defaultLang($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDefaultLang() => $_has(4);
  @$pb.TagNumber(5)
  void clearDefaultLang() => $_clearField(5);
}

class InsightsAIFeatures extends $pb.GeneratedMessage {
  factory InsightsAIFeatures({
    $core.bool? isAllow,
    InsightsAITextChatFeatures? aiTextChatFeatures,
    InsightsAIMeetingSummarizationFeatures? meetingSummarizationFeatures,
  }) {
    final result = create();
    if (isAllow != null) result.isAllow = isAllow;
    if (aiTextChatFeatures != null)
      result.aiTextChatFeatures = aiTextChatFeatures;
    if (meetingSummarizationFeatures != null)
      result.meetingSummarizationFeatures = meetingSummarizationFeatures;
    return result;
  }

  InsightsAIFeatures._();

  factory InsightsAIFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InsightsAIFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InsightsAIFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOM<InsightsAITextChatFeatures>(
        2, _omitFieldNames ? '' : 'aiTextChatFeatures',
        subBuilder: InsightsAITextChatFeatures.create)
    ..aOM<InsightsAIMeetingSummarizationFeatures>(
        3, _omitFieldNames ? '' : 'meetingSummarizationFeatures',
        subBuilder: InsightsAIMeetingSummarizationFeatures.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InsightsAIFeatures clone() => InsightsAIFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InsightsAIFeatures copyWith(void Function(InsightsAIFeatures) updates) =>
      super.copyWith((message) => updates(message as InsightsAIFeatures))
          as InsightsAIFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsAIFeatures create() => InsightsAIFeatures._();
  @$core.override
  InsightsAIFeatures createEmptyInstance() => create();
  static $pb.PbList<InsightsAIFeatures> createRepeated() =>
      $pb.PbList<InsightsAIFeatures>();
  @$core.pragma('dart2js:noInline')
  static InsightsAIFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InsightsAIFeatures>(create);
  static InsightsAIFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => $_clearField(1);

  @$pb.TagNumber(2)
  InsightsAITextChatFeatures get aiTextChatFeatures => $_getN(1);
  @$pb.TagNumber(2)
  set aiTextChatFeatures(InsightsAITextChatFeatures value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAiTextChatFeatures() => $_has(1);
  @$pb.TagNumber(2)
  void clearAiTextChatFeatures() => $_clearField(2);
  @$pb.TagNumber(2)
  InsightsAITextChatFeatures ensureAiTextChatFeatures() => $_ensure(1);

  @$pb.TagNumber(3)
  InsightsAIMeetingSummarizationFeatures get meetingSummarizationFeatures =>
      $_getN(2);
  @$pb.TagNumber(3)
  set meetingSummarizationFeatures(
          InsightsAIMeetingSummarizationFeatures value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMeetingSummarizationFeatures() => $_has(2);
  @$pb.TagNumber(3)
  void clearMeetingSummarizationFeatures() => $_clearField(3);
  @$pb.TagNumber(3)
  InsightsAIMeetingSummarizationFeatures ensureMeetingSummarizationFeatures() =>
      $_ensure(2);
}

class InsightsAITextChatFeatures extends $pb.GeneratedMessage {
  factory InsightsAITextChatFeatures({
    $core.bool? isAllow,
    $core.bool? isEnabled,
    $core.bool? isAllowedEveryone,
    $core.Iterable<$core.String>? allowedUserIds,
  }) {
    final result = create();
    if (isAllow != null) result.isAllow = isAllow;
    if (isEnabled != null) result.isEnabled = isEnabled;
    if (isAllowedEveryone != null) result.isAllowedEveryone = isAllowedEveryone;
    if (allowedUserIds != null) result.allowedUserIds.addAll(allowedUserIds);
    return result;
  }

  InsightsAITextChatFeatures._();

  factory InsightsAITextChatFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InsightsAITextChatFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InsightsAITextChatFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOB(2, _omitFieldNames ? '' : 'isEnabled')
    ..aOB(3, _omitFieldNames ? '' : 'isAllowedEveryone')
    ..pPS(4, _omitFieldNames ? '' : 'allowedUserIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InsightsAITextChatFeatures clone() =>
      InsightsAITextChatFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InsightsAITextChatFeatures copyWith(
          void Function(InsightsAITextChatFeatures) updates) =>
      super.copyWith(
              (message) => updates(message as InsightsAITextChatFeatures))
          as InsightsAITextChatFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsAITextChatFeatures create() => InsightsAITextChatFeatures._();
  @$core.override
  InsightsAITextChatFeatures createEmptyInstance() => create();
  static $pb.PbList<InsightsAITextChatFeatures> createRepeated() =>
      $pb.PbList<InsightsAITextChatFeatures>();
  @$core.pragma('dart2js:noInline')
  static InsightsAITextChatFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InsightsAITextChatFeatures>(create);
  static InsightsAITextChatFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => $_clearField(1);

  /// all internal usage fields
  @$pb.TagNumber(2)
  $core.bool get isEnabled => $_getBF(1);
  @$pb.TagNumber(2)
  set isEnabled($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsEnabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsEnabled() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAllowedEveryone => $_getBF(2);
  @$pb.TagNumber(3)
  set isAllowedEveryone($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsAllowedEveryone() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAllowedEveryone() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get allowedUserIds => $_getList(3);
}

class InsightsAIMeetingSummarizationFeatures extends $pb.GeneratedMessage {
  factory InsightsAIMeetingSummarizationFeatures({
    $core.bool? isAllow,
    $core.String? summarizationPrompt,
    $core.bool? isEnabled,
  }) {
    final result = create();
    if (isAllow != null) result.isAllow = isAllow;
    if (summarizationPrompt != null)
      result.summarizationPrompt = summarizationPrompt;
    if (isEnabled != null) result.isEnabled = isEnabled;
    return result;
  }

  InsightsAIMeetingSummarizationFeatures._();

  factory InsightsAIMeetingSummarizationFeatures.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InsightsAIMeetingSummarizationFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InsightsAIMeetingSummarizationFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAllow')
    ..aOS(2, _omitFieldNames ? '' : 'summarizationPrompt')
    ..aOB(3, _omitFieldNames ? '' : 'isEnabled')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InsightsAIMeetingSummarizationFeatures clone() =>
      InsightsAIMeetingSummarizationFeatures()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InsightsAIMeetingSummarizationFeatures copyWith(
          void Function(InsightsAIMeetingSummarizationFeatures) updates) =>
      super.copyWith((message) =>
              updates(message as InsightsAIMeetingSummarizationFeatures))
          as InsightsAIMeetingSummarizationFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsightsAIMeetingSummarizationFeatures create() =>
      InsightsAIMeetingSummarizationFeatures._();
  @$core.override
  InsightsAIMeetingSummarizationFeatures createEmptyInstance() => create();
  static $pb.PbList<InsightsAIMeetingSummarizationFeatures> createRepeated() =>
      $pb.PbList<InsightsAIMeetingSummarizationFeatures>();
  @$core.pragma('dart2js:noInline')
  static InsightsAIMeetingSummarizationFeatures getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          InsightsAIMeetingSummarizationFeatures>(create);
  static InsightsAIMeetingSummarizationFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAllow => $_getBF(0);
  @$pb.TagNumber(1)
  set isAllow($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAllow() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get summarizationPrompt => $_getSZ(1);
  @$pb.TagNumber(2)
  set summarizationPrompt($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSummarizationPrompt() => $_has(1);
  @$pb.TagNumber(2)
  void clearSummarizationPrompt() => $_clearField(2);

  /// all internal usage fields
  @$pb.TagNumber(3)
  $core.bool get isEnabled => $_getBF(2);
  @$pb.TagNumber(3)
  set isEnabled($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsEnabled() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsEnabled() => $_clearField(3);
}

class CopyrightConf extends $pb.GeneratedMessage {
  factory CopyrightConf({
    $core.bool? display,
    $core.String? text,
  }) {
    final result = create();
    if (display != null) result.display = display;
    if (text != null) result.text = text;
    return result;
  }

  CopyrightConf._();

  factory CopyrightConf.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CopyrightConf.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CopyrightConf',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'display')
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CopyrightConf clone() => CopyrightConf()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CopyrightConf copyWith(void Function(CopyrightConf) updates) =>
      super.copyWith((message) => updates(message as CopyrightConf))
          as CopyrightConf;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CopyrightConf create() => CopyrightConf._();
  @$core.override
  CopyrightConf createEmptyInstance() => create();
  static $pb.PbList<CopyrightConf> createRepeated() =>
      $pb.PbList<CopyrightConf>();
  @$core.pragma('dart2js:noInline')
  static CopyrightConf getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CopyrightConf>(create);
  static CopyrightConf? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get display => $_getBF(0);
  @$pb.TagNumber(1)
  set display($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDisplay() => $_has(0);
  @$pb.TagNumber(1)
  void clearDisplay() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(3)
  set text($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(3)
  void clearText() => $_clearField(3);
}

class CreateRoomRes extends $pb.GeneratedMessage {
  factory CreateRoomRes({
    $core.bool? status,
    $core.String? msg,
    $1.ActiveRoomInfo? roomInfo,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (roomInfo != null) result.roomInfo = roomInfo;
    return result;
  }

  CreateRoomRes._();

  factory CreateRoomRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateRoomRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateRoomRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOM<$1.ActiveRoomInfo>(3, _omitFieldNames ? '' : 'roomInfo',
        subBuilder: $1.ActiveRoomInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateRoomRes clone() => CreateRoomRes()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateRoomRes copyWith(void Function(CreateRoomRes) updates) =>
      super.copyWith((message) => updates(message as CreateRoomRes))
          as CreateRoomRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRoomRes create() => CreateRoomRes._();
  @$core.override
  CreateRoomRes createEmptyInstance() => create();
  static $pb.PbList<CreateRoomRes> createRepeated() =>
      $pb.PbList<CreateRoomRes>();
  @$core.pragma('dart2js:noInline')
  static CreateRoomRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateRoomRes>(create);
  static CreateRoomRes? _defaultInstance;

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
  $1.ActiveRoomInfo get roomInfo => $_getN(2);
  @$pb.TagNumber(3)
  set roomInfo($1.ActiveRoomInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.ActiveRoomInfo ensureRoomInfo() => $_ensure(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
