// This is a generated file - do not edit.
//
// Generated from wajlc_common.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_models.pb.dart' as $0;
import 'wajlc_room_artifacts.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CommonNotifyEvent extends $pb.GeneratedMessage {
  factory CommonNotifyEvent({
    $core.String? event,
    NotifyEventRoom? room,
    $0.ParticipantInfo? participant,
    RecordingInfoEvent? recordingInfo,
    SpeechServiceEvent? speechService,
    $0.TrackInfo? track,
    AnalyticsEvent? analytics,
    $1.RoomArtifactWebhookEvent? roomArtifact,
    $core.String? id,
    $fixnum.Int64? createdAt,
  }) {
    final result = create();
    if (event != null) result.event = event;
    if (room != null) result.room = room;
    if (participant != null) result.participant = participant;
    if (recordingInfo != null) result.recordingInfo = recordingInfo;
    if (speechService != null) result.speechService = speechService;
    if (track != null) result.track = track;
    if (analytics != null) result.analytics = analytics;
    if (roomArtifact != null) result.roomArtifact = roomArtifact;
    if (id != null) result.id = id;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  CommonNotifyEvent._();

  factory CommonNotifyEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommonNotifyEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommonNotifyEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'event')
    ..aOM<NotifyEventRoom>(2, _omitFieldNames ? '' : 'room',
        subBuilder: NotifyEventRoom.create)
    ..aOM<$0.ParticipantInfo>(3, _omitFieldNames ? '' : 'participant',
        subBuilder: $0.ParticipantInfo.create)
    ..aOM<RecordingInfoEvent>(4, _omitFieldNames ? '' : 'recordingInfo',
        subBuilder: RecordingInfoEvent.create)
    ..aOM<SpeechServiceEvent>(5, _omitFieldNames ? '' : 'speechService',
        subBuilder: SpeechServiceEvent.create)
    ..aOM<$0.TrackInfo>(6, _omitFieldNames ? '' : 'track',
        subBuilder: $0.TrackInfo.create)
    ..aOM<AnalyticsEvent>(7, _omitFieldNames ? '' : 'analytics',
        subBuilder: AnalyticsEvent.create)
    ..aOM<$1.RoomArtifactWebhookEvent>(8, _omitFieldNames ? '' : 'roomArtifact',
        subBuilder: $1.RoomArtifactWebhookEvent.create)
    ..aOS(9, _omitFieldNames ? '' : 'id')
    ..aInt64(10, _omitFieldNames ? '' : 'createdAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonNotifyEvent clone() => CommonNotifyEvent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonNotifyEvent copyWith(void Function(CommonNotifyEvent) updates) =>
      super.copyWith((message) => updates(message as CommonNotifyEvent))
          as CommonNotifyEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommonNotifyEvent create() => CommonNotifyEvent._();
  @$core.override
  CommonNotifyEvent createEmptyInstance() => create();
  static $pb.PbList<CommonNotifyEvent> createRepeated() =>
      $pb.PbList<CommonNotifyEvent>();
  @$core.pragma('dart2js:noInline')
  static CommonNotifyEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonNotifyEvent>(create);
  static CommonNotifyEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get event => $_getSZ(0);
  @$pb.TagNumber(1)
  set event($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => $_clearField(1);

  @$pb.TagNumber(2)
  NotifyEventRoom get room => $_getN(1);
  @$pb.TagNumber(2)
  set room(NotifyEventRoom value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => $_clearField(2);
  @$pb.TagNumber(2)
  NotifyEventRoom ensureRoom() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.ParticipantInfo get participant => $_getN(2);
  @$pb.TagNumber(3)
  set participant($0.ParticipantInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasParticipant() => $_has(2);
  @$pb.TagNumber(3)
  void clearParticipant() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.ParticipantInfo ensureParticipant() => $_ensure(2);

  @$pb.TagNumber(4)
  RecordingInfoEvent get recordingInfo => $_getN(3);
  @$pb.TagNumber(4)
  set recordingInfo(RecordingInfoEvent value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRecordingInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearRecordingInfo() => $_clearField(4);
  @$pb.TagNumber(4)
  RecordingInfoEvent ensureRecordingInfo() => $_ensure(3);

  @$pb.TagNumber(5)
  SpeechServiceEvent get speechService => $_getN(4);
  @$pb.TagNumber(5)
  set speechService(SpeechServiceEvent value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSpeechService() => $_has(4);
  @$pb.TagNumber(5)
  void clearSpeechService() => $_clearField(5);
  @$pb.TagNumber(5)
  SpeechServiceEvent ensureSpeechService() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.TrackInfo get track => $_getN(5);
  @$pb.TagNumber(6)
  set track($0.TrackInfo value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasTrack() => $_has(5);
  @$pb.TagNumber(6)
  void clearTrack() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.TrackInfo ensureTrack() => $_ensure(5);

  @$pb.TagNumber(7)
  AnalyticsEvent get analytics => $_getN(6);
  @$pb.TagNumber(7)
  set analytics(AnalyticsEvent value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasAnalytics() => $_has(6);
  @$pb.TagNumber(7)
  void clearAnalytics() => $_clearField(7);
  @$pb.TagNumber(7)
  AnalyticsEvent ensureAnalytics() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.RoomArtifactWebhookEvent get roomArtifact => $_getN(7);
  @$pb.TagNumber(8)
  set roomArtifact($1.RoomArtifactWebhookEvent value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasRoomArtifact() => $_has(7);
  @$pb.TagNumber(8)
  void clearRoomArtifact() => $_clearField(8);
  @$pb.TagNumber(8)
  $1.RoomArtifactWebhookEvent ensureRoomArtifact() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get id => $_getSZ(8);
  @$pb.TagNumber(9)
  set id($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasId() => $_has(8);
  @$pb.TagNumber(9)
  void clearId() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get createdAt => $_getI64(9);
  @$pb.TagNumber(10)
  set createdAt($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedAt() => $_clearField(10);
}

class NotifyEventRoom extends $pb.GeneratedMessage {
  factory NotifyEventRoom({
    $core.String? sid,
    $core.String? roomId,
    $core.int? emptyTimeout,
    $core.int? maxParticipants,
    $fixnum.Int64? creationTime,
    $core.Iterable<$0.Codec>? enabledCodecs,
    $core.String? metadata,
    $core.int? numParticipants,
  }) {
    final result = create();
    if (sid != null) result.sid = sid;
    if (roomId != null) result.roomId = roomId;
    if (emptyTimeout != null) result.emptyTimeout = emptyTimeout;
    if (maxParticipants != null) result.maxParticipants = maxParticipants;
    if (creationTime != null) result.creationTime = creationTime;
    if (enabledCodecs != null) result.enabledCodecs.addAll(enabledCodecs);
    if (metadata != null) result.metadata = metadata;
    if (numParticipants != null) result.numParticipants = numParticipants;
    return result;
  }

  NotifyEventRoom._();

  factory NotifyEventRoom.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotifyEventRoom.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotifyEventRoom',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sid')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'emptyTimeout', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'maxParticipants', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'creationTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<$0.Codec>(
        6, _omitFieldNames ? '' : 'enabledCodecs', $pb.PbFieldType.PM,
        subBuilder: $0.Codec.create)
    ..aOS(7, _omitFieldNames ? '' : 'metadata')
    ..a<$core.int>(
        8, _omitFieldNames ? '' : 'numParticipants', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyEventRoom clone() => NotifyEventRoom()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotifyEventRoom copyWith(void Function(NotifyEventRoom) updates) =>
      super.copyWith((message) => updates(message as NotifyEventRoom))
          as NotifyEventRoom;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyEventRoom create() => NotifyEventRoom._();
  @$core.override
  NotifyEventRoom createEmptyInstance() => create();
  static $pb.PbList<NotifyEventRoom> createRepeated() =>
      $pb.PbList<NotifyEventRoom>();
  @$core.pragma('dart2js:noInline')
  static NotifyEventRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NotifyEventRoom>(create);
  static NotifyEventRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sid => $_getSZ(0);
  @$pb.TagNumber(1)
  set sid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get emptyTimeout => $_getIZ(2);
  @$pb.TagNumber(3)
  set emptyTimeout($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEmptyTimeout() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmptyTimeout() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get maxParticipants => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxParticipants($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMaxParticipants() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxParticipants() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get creationTime => $_getI64(4);
  @$pb.TagNumber(5)
  set creationTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreationTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreationTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$0.Codec> get enabledCodecs => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get metadata => $_getSZ(6);
  @$pb.TagNumber(7)
  set metadata($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMetadata() => $_has(6);
  @$pb.TagNumber(7)
  void clearMetadata() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get numParticipants => $_getIZ(7);
  @$pb.TagNumber(8)
  set numParticipants($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasNumParticipants() => $_has(7);
  @$pb.TagNumber(8)
  void clearNumParticipants() => $_clearField(8);
}

class RecordingInfoEvent extends $pb.GeneratedMessage {
  factory RecordingInfoEvent({
    $core.String? recordId,
    $core.String? recorderId,
    $core.String? recorderMsg,
    $core.String? filePath,
    $core.double? fileSize,
  }) {
    final result = create();
    if (recordId != null) result.recordId = recordId;
    if (recorderId != null) result.recorderId = recorderId;
    if (recorderMsg != null) result.recorderMsg = recorderMsg;
    if (filePath != null) result.filePath = filePath;
    if (fileSize != null) result.fileSize = fileSize;
    return result;
  }

  RecordingInfoEvent._();

  factory RecordingInfoEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecordingInfoEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordingInfoEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recordId')
    ..aOS(2, _omitFieldNames ? '' : 'recorderId')
    ..aOS(3, _omitFieldNames ? '' : 'recorderMsg')
    ..aOS(4, _omitFieldNames ? '' : 'filePath')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'fileSize', $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingInfoEvent clone() => RecordingInfoEvent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingInfoEvent copyWith(void Function(RecordingInfoEvent) updates) =>
      super.copyWith((message) => updates(message as RecordingInfoEvent))
          as RecordingInfoEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordingInfoEvent create() => RecordingInfoEvent._();
  @$core.override
  RecordingInfoEvent createEmptyInstance() => create();
  static $pb.PbList<RecordingInfoEvent> createRepeated() =>
      $pb.PbList<RecordingInfoEvent>();
  @$core.pragma('dart2js:noInline')
  static RecordingInfoEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordingInfoEvent>(create);
  static RecordingInfoEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recordId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recordId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get recorderId => $_getSZ(1);
  @$pb.TagNumber(2)
  set recorderId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRecorderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecorderId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get recorderMsg => $_getSZ(2);
  @$pb.TagNumber(3)
  set recorderMsg($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRecorderMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecorderMsg() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get filePath => $_getSZ(3);
  @$pb.TagNumber(4)
  set filePath($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFilePath() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilePath() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get fileSize => $_getN(4);
  @$pb.TagNumber(5)
  set fileSize($core.double value) => $_setFloat(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFileSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileSize() => $_clearField(5);
}

class SpeechServiceEvent extends $pb.GeneratedMessage {
  factory SpeechServiceEvent({
    $core.String? userId,
    $fixnum.Int64? totalUsage,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (totalUsage != null) result.totalUsage = totalUsage;
    return result;
  }

  SpeechServiceEvent._();

  factory SpeechServiceEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpeechServiceEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpeechServiceEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..aInt64(4, _omitFieldNames ? '' : 'totalUsage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechServiceEvent clone() => SpeechServiceEvent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechServiceEvent copyWith(void Function(SpeechServiceEvent) updates) =>
      super.copyWith((message) => updates(message as SpeechServiceEvent))
          as SpeechServiceEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechServiceEvent create() => SpeechServiceEvent._();
  @$core.override
  SpeechServiceEvent createEmptyInstance() => create();
  static $pb.PbList<SpeechServiceEvent> createRepeated() =>
      $pb.PbList<SpeechServiceEvent>();
  @$core.pragma('dart2js:noInline')
  static SpeechServiceEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeechServiceEvent>(create);
  static SpeechServiceEvent? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalUsage => $_getI64(1);
  @$pb.TagNumber(4)
  set totalUsage($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalUsage() => $_has(1);
  @$pb.TagNumber(4)
  void clearTotalUsage() => $_clearField(4);
}

class AnalyticsEvent extends $pb.GeneratedMessage {
  factory AnalyticsEvent({
    $core.String? fileId,
  }) {
    final result = create();
    if (fileId != null) result.fileId = fileId;
    return result;
  }

  AnalyticsEvent._();

  factory AnalyticsEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsEvent clone() => AnalyticsEvent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsEvent copyWith(void Function(AnalyticsEvent) updates) =>
      super.copyWith((message) => updates(message as AnalyticsEvent))
          as AnalyticsEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsEvent create() => AnalyticsEvent._();
  @$core.override
  AnalyticsEvent createEmptyInstance() => create();
  static $pb.PbList<AnalyticsEvent> createRepeated() =>
      $pb.PbList<AnalyticsEvent>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsEvent>(create);
  static AnalyticsEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
