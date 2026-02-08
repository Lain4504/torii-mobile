// This is a generated file - do not edit.
//
// Generated from wajlc_recording.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_recorder.pbenum.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class RecordingReq extends $pb.GeneratedMessage {
  factory RecordingReq({
    $0.RecordingTasks? task,
    $core.String? roomId,
    $fixnum.Int64? roomTableId,
    $core.String? sid,
    $core.String? rtmpUrl,
    $core.String? customDesign,
    $0.CloudRecordingVariants? recordingVariant,
  }) {
    final result = create();
    if (task != null) result.task = task;
    if (roomId != null) result.roomId = roomId;
    if (roomTableId != null) result.roomTableId = roomTableId;
    if (sid != null) result.sid = sid;
    if (rtmpUrl != null) result.rtmpUrl = rtmpUrl;
    if (customDesign != null) result.customDesign = customDesign;
    if (recordingVariant != null) result.recordingVariant = recordingVariant;
    return result;
  }

  RecordingReq._();

  factory RecordingReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecordingReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordingReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..e<$0.RecordingTasks>(1, _omitFieldNames ? '' : 'task', $pb.PbFieldType.OE,
        defaultOrMaker: $0.RecordingTasks.START_RECORDING,
        valueOf: $0.RecordingTasks.valueOf,
        enumValues: $0.RecordingTasks.values)
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aInt64(3, _omitFieldNames ? '' : 'roomTableId')
    ..aOS(4, _omitFieldNames ? '' : 'sid')
    ..aOS(5, _omitFieldNames ? '' : 'rtmpUrl')
    ..aOS(6, _omitFieldNames ? '' : 'customDesign')
    ..e<$0.CloudRecordingVariants>(
        7, _omitFieldNames ? '' : 'recordingVariant', $pb.PbFieldType.OE,
        defaultOrMaker: $0.CloudRecordingVariants.FULL_SCREEN_CLOUD_RECORDING,
        valueOf: $0.CloudRecordingVariants.valueOf,
        enumValues: $0.CloudRecordingVariants.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingReq clone() => RecordingReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingReq copyWith(void Function(RecordingReq) updates) =>
      super.copyWith((message) => updates(message as RecordingReq))
          as RecordingReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordingReq create() => RecordingReq._();
  @$core.override
  RecordingReq createEmptyInstance() => create();
  static $pb.PbList<RecordingReq> createRepeated() =>
      $pb.PbList<RecordingReq>();
  @$core.pragma('dart2js:noInline')
  static RecordingReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordingReq>(create);
  static RecordingReq? _defaultInstance;

  @$pb.TagNumber(1)
  $0.RecordingTasks get task => $_getN(0);
  @$pb.TagNumber(1)
  set task($0.RecordingTasks value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get roomTableId => $_getI64(2);
  @$pb.TagNumber(3)
  set roomTableId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomTableId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomTableId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get sid => $_getSZ(3);
  @$pb.TagNumber(4)
  set sid($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSid() => $_has(3);
  @$pb.TagNumber(4)
  void clearSid() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get rtmpUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set rtmpUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRtmpUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearRtmpUrl() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get customDesign => $_getSZ(5);
  @$pb.TagNumber(6)
  set customDesign($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCustomDesign() => $_has(5);
  @$pb.TagNumber(6)
  void clearCustomDesign() => $_clearField(6);

  @$pb.TagNumber(7)
  $0.CloudRecordingVariants get recordingVariant => $_getN(6);
  @$pb.TagNumber(7)
  set recordingVariant($0.CloudRecordingVariants value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasRecordingVariant() => $_has(6);
  @$pb.TagNumber(7)
  void clearRecordingVariant() => $_clearField(7);
}

class RecordingInfoFile extends $pb.GeneratedMessage {
  factory RecordingInfoFile({
    $fixnum.Int64? roomTableId,
    $core.String? roomId,
    $core.String? roomTitle,
    $core.String? roomSid,
    $fixnum.Int64? roomCreationTime,
    $fixnum.Int64? roomEnded,
    $core.String? recordingId,
    $core.String? recorderId,
    $core.String? filePath,
    $core.double? fileSize,
    $fixnum.Int64? creationTime,
  }) {
    final result = create();
    if (roomTableId != null) result.roomTableId = roomTableId;
    if (roomId != null) result.roomId = roomId;
    if (roomTitle != null) result.roomTitle = roomTitle;
    if (roomSid != null) result.roomSid = roomSid;
    if (roomCreationTime != null) result.roomCreationTime = roomCreationTime;
    if (roomEnded != null) result.roomEnded = roomEnded;
    if (recordingId != null) result.recordingId = recordingId;
    if (recorderId != null) result.recorderId = recorderId;
    if (filePath != null) result.filePath = filePath;
    if (fileSize != null) result.fileSize = fileSize;
    if (creationTime != null) result.creationTime = creationTime;
    return result;
  }

  RecordingInfoFile._();

  factory RecordingInfoFile.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecordingInfoFile.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordingInfoFile',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomTableId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'roomTitle')
    ..aOS(4, _omitFieldNames ? '' : 'roomSid')
    ..aInt64(5, _omitFieldNames ? '' : 'roomCreationTime')
    ..aInt64(6, _omitFieldNames ? '' : 'roomEnded')
    ..aOS(7, _omitFieldNames ? '' : 'recordingId')
    ..aOS(8, _omitFieldNames ? '' : 'recorderId')
    ..aOS(9, _omitFieldNames ? '' : 'filePath')
    ..a<$core.double>(10, _omitFieldNames ? '' : 'fileSize', $pb.PbFieldType.OF)
    ..aInt64(11, _omitFieldNames ? '' : 'creationTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingInfoFile clone() => RecordingInfoFile()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingInfoFile copyWith(void Function(RecordingInfoFile) updates) =>
      super.copyWith((message) => updates(message as RecordingInfoFile))
          as RecordingInfoFile;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordingInfoFile create() => RecordingInfoFile._();
  @$core.override
  RecordingInfoFile createEmptyInstance() => create();
  static $pb.PbList<RecordingInfoFile> createRepeated() =>
      $pb.PbList<RecordingInfoFile>();
  @$core.pragma('dart2js:noInline')
  static RecordingInfoFile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordingInfoFile>(create);
  static RecordingInfoFile? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomTableId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomTableId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomTableId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomTableId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomTitle => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomTitle($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomSid => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomSid($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomSid() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomSid() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get roomCreationTime => $_getI64(4);
  @$pb.TagNumber(5)
  set roomCreationTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRoomCreationTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomCreationTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get roomEnded => $_getI64(5);
  @$pb.TagNumber(6)
  set roomEnded($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRoomEnded() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomEnded() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get recordingId => $_getSZ(6);
  @$pb.TagNumber(7)
  set recordingId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRecordingId() => $_has(6);
  @$pb.TagNumber(7)
  void clearRecordingId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get recorderId => $_getSZ(7);
  @$pb.TagNumber(8)
  set recorderId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRecorderId() => $_has(7);
  @$pb.TagNumber(8)
  void clearRecorderId() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get filePath => $_getSZ(8);
  @$pb.TagNumber(9)
  set filePath($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasFilePath() => $_has(8);
  @$pb.TagNumber(9)
  void clearFilePath() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get fileSize => $_getN(9);
  @$pb.TagNumber(10)
  set fileSize($core.double value) => $_setFloat(9, value);
  @$pb.TagNumber(10)
  $core.bool hasFileSize() => $_has(9);
  @$pb.TagNumber(10)
  void clearFileSize() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get creationTime => $_getI64(10);
  @$pb.TagNumber(11)
  set creationTime($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCreationTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreationTime() => $_clearField(11);
}

class RecordingSubtitle extends $pb.GeneratedMessage {
  factory RecordingSubtitle({
    $core.String? label,
    $core.String? url,
  }) {
    final result = create();
    if (label != null) result.label = label;
    if (url != null) result.url = url;
    return result;
  }

  RecordingSubtitle._();

  factory RecordingSubtitle.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecordingSubtitle.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordingSubtitle',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'label')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingSubtitle clone() => RecordingSubtitle()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingSubtitle copyWith(void Function(RecordingSubtitle) updates) =>
      super.copyWith((message) => updates(message as RecordingSubtitle))
          as RecordingSubtitle;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordingSubtitle create() => RecordingSubtitle._();
  @$core.override
  RecordingSubtitle createEmptyInstance() => create();
  static $pb.PbList<RecordingSubtitle> createRepeated() =>
      $pb.PbList<RecordingSubtitle>();
  @$core.pragma('dart2js:noInline')
  static RecordingSubtitle getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordingSubtitle>(create);
  static RecordingSubtitle? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);
}

class RecordingMetadata extends $pb.GeneratedMessage {
  factory RecordingMetadata({
    $core.String? title,
    $core.String? description,
    $core.Iterable<$core.MapEntry<$core.String, RecordingSubtitle>>? subtitles,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? extraData,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (description != null) result.description = description;
    if (subtitles != null) result.subtitles.addEntries(subtitles);
    if (extraData != null) result.extraData.addEntries(extraData);
    return result;
  }

  RecordingMetadata._();

  factory RecordingMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecordingMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordingMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..m<$core.String, RecordingSubtitle>(3, _omitFieldNames ? '' : 'subtitles',
        entryClassName: 'RecordingMetadata.SubtitlesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: RecordingSubtitle.create,
        valueDefaultOrMaker: RecordingSubtitle.getDefault,
        packageName: const $pb.PackageName('wajlc'))
    ..m<$core.String, $core.String>(4, _omitFieldNames ? '' : 'extraData',
        entryClassName: 'RecordingMetadata.ExtraDataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('wajlc'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingMetadata clone() => RecordingMetadata()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecordingMetadata copyWith(void Function(RecordingMetadata) updates) =>
      super.copyWith((message) => updates(message as RecordingMetadata))
          as RecordingMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordingMetadata create() => RecordingMetadata._();
  @$core.override
  RecordingMetadata createEmptyInstance() => create();
  static $pb.PbList<RecordingMetadata> createRepeated() =>
      $pb.PbList<RecordingMetadata>();
  @$core.pragma('dart2js:noInline')
  static RecordingMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordingMetadata>(create);
  static RecordingMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  /// e.g. map<language, RecordingSubtitle>
  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, RecordingSubtitle> get subtitles => $_getMap(2);

  @$pb.TagNumber(4)
  $pb.PbMap<$core.String, $core.String> get extraData => $_getMap(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
