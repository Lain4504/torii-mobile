// This is a generated file - do not edit.
//
// Generated from wajlc_recorder.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_recorder.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'wajlc_recorder.pbenum.dart';

class WajlcToRecorder extends $pb.GeneratedMessage {
  factory WajlcToRecorder({
    $core.String? from,
    RecordingTasks? task,
    $fixnum.Int64? roomTableId,
    $core.String? roomId,
    $core.String? roomSid,
    $core.String? recordingId,
    $core.String? recorderId,
    $core.String? accessToken,
    $core.String? rtmpUrl,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (task != null) result.task = task;
    if (roomTableId != null) result.roomTableId = roomTableId;
    if (roomId != null) result.roomId = roomId;
    if (roomSid != null) result.roomSid = roomSid;
    if (recordingId != null) result.recordingId = recordingId;
    if (recorderId != null) result.recorderId = recorderId;
    if (accessToken != null) result.accessToken = accessToken;
    if (rtmpUrl != null) result.rtmpUrl = rtmpUrl;
    return result;
  }

  WajlcToRecorder._();

  factory WajlcToRecorder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WajlcToRecorder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WajlcToRecorder',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'from')
    ..e<RecordingTasks>(2, _omitFieldNames ? '' : 'task', $pb.PbFieldType.OE,
        defaultOrMaker: RecordingTasks.START_RECORDING,
        valueOf: RecordingTasks.valueOf,
        enumValues: RecordingTasks.values)
    ..aInt64(3, _omitFieldNames ? '' : 'roomTableId')
    ..aOS(4, _omitFieldNames ? '' : 'roomId')
    ..aOS(5, _omitFieldNames ? '' : 'roomSid')
    ..aOS(6, _omitFieldNames ? '' : 'recordingId')
    ..aOS(7, _omitFieldNames ? '' : 'recorderId')
    ..aOS(8, _omitFieldNames ? '' : 'accessToken')
    ..aOS(9, _omitFieldNames ? '' : 'rtmpUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WajlcToRecorder clone() => WajlcToRecorder()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WajlcToRecorder copyWith(void Function(WajlcToRecorder) updates) =>
      super.copyWith((message) => updates(message as WajlcToRecorder))
          as WajlcToRecorder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WajlcToRecorder create() => WajlcToRecorder._();
  @$core.override
  WajlcToRecorder createEmptyInstance() => create();
  static $pb.PbList<WajlcToRecorder> createRepeated() =>
      $pb.PbList<WajlcToRecorder>();
  @$core.pragma('dart2js:noInline')
  static WajlcToRecorder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WajlcToRecorder>(create);
  static WajlcToRecorder? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get from => $_getSZ(0);
  @$pb.TagNumber(1)
  set from($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  @$pb.TagNumber(2)
  RecordingTasks get task => $_getN(1);
  @$pb.TagNumber(2)
  set task(RecordingTasks value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearTask() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get roomTableId => $_getI64(2);
  @$pb.TagNumber(3)
  set roomTableId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomTableId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomTableId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomId => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get roomSid => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomSid($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRoomSid() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomSid() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get recordingId => $_getSZ(5);
  @$pb.TagNumber(6)
  set recordingId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRecordingId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRecordingId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get recorderId => $_getSZ(6);
  @$pb.TagNumber(7)
  set recorderId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRecorderId() => $_has(6);
  @$pb.TagNumber(7)
  void clearRecorderId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get accessToken => $_getSZ(7);
  @$pb.TagNumber(8)
  set accessToken($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAccessToken() => $_has(7);
  @$pb.TagNumber(8)
  void clearAccessToken() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get rtmpUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set rtmpUrl($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRtmpUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearRtmpUrl() => $_clearField(9);
}

class RecorderToWajlc extends $pb.GeneratedMessage {
  factory RecorderToWajlc({
    $core.String? from,
    RecordingTasks? task,
    $core.bool? status,
    $core.String? msg,
    $core.String? recordingId,
    $core.String? roomId,
    $core.String? roomSid,
    $core.String? recorderId,
    $core.String? filePath,
    $core.double? fileSize,
    $fixnum.Int64? roomTableId,
    CloudRecordingVariants? recordingVariant,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (task != null) result.task = task;
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (recordingId != null) result.recordingId = recordingId;
    if (roomId != null) result.roomId = roomId;
    if (roomSid != null) result.roomSid = roomSid;
    if (recorderId != null) result.recorderId = recorderId;
    if (filePath != null) result.filePath = filePath;
    if (fileSize != null) result.fileSize = fileSize;
    if (roomTableId != null) result.roomTableId = roomTableId;
    if (recordingVariant != null) result.recordingVariant = recordingVariant;
    return result;
  }

  RecorderToWajlc._();

  factory RecorderToWajlc.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecorderToWajlc.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecorderToWajlc',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'from')
    ..e<RecordingTasks>(2, _omitFieldNames ? '' : 'task', $pb.PbFieldType.OE,
        defaultOrMaker: RecordingTasks.START_RECORDING,
        valueOf: RecordingTasks.valueOf,
        enumValues: RecordingTasks.values)
    ..aOB(3, _omitFieldNames ? '' : 'status')
    ..aOS(4, _omitFieldNames ? '' : 'msg')
    ..aOS(5, _omitFieldNames ? '' : 'recordingId')
    ..aOS(6, _omitFieldNames ? '' : 'roomId')
    ..aOS(7, _omitFieldNames ? '' : 'roomSid')
    ..aOS(8, _omitFieldNames ? '' : 'recorderId')
    ..aOS(9, _omitFieldNames ? '' : 'filePath')
    ..a<$core.double>(10, _omitFieldNames ? '' : 'fileSize', $pb.PbFieldType.OF)
    ..aInt64(11, _omitFieldNames ? '' : 'roomTableId')
    ..e<CloudRecordingVariants>(
        12, _omitFieldNames ? '' : 'recordingVariant', $pb.PbFieldType.OE,
        defaultOrMaker: CloudRecordingVariants.FULL_SCREEN_CLOUD_RECORDING,
        valueOf: CloudRecordingVariants.valueOf,
        enumValues: CloudRecordingVariants.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecorderToWajlc clone() => RecorderToWajlc()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecorderToWajlc copyWith(void Function(RecorderToWajlc) updates) =>
      super.copyWith((message) => updates(message as RecorderToWajlc))
          as RecorderToWajlc;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecorderToWajlc create() => RecorderToWajlc._();
  @$core.override
  RecorderToWajlc createEmptyInstance() => create();
  static $pb.PbList<RecorderToWajlc> createRepeated() =>
      $pb.PbList<RecorderToWajlc>();
  @$core.pragma('dart2js:noInline')
  static RecorderToWajlc getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecorderToWajlc>(create);
  static RecorderToWajlc? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get from => $_getSZ(0);
  @$pb.TagNumber(1)
  set from($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  @$pb.TagNumber(2)
  RecordingTasks get task => $_getN(1);
  @$pb.TagNumber(2)
  set task(RecordingTasks value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearTask() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get status => $_getBF(2);
  @$pb.TagNumber(3)
  set status($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get msg => $_getSZ(3);
  @$pb.TagNumber(4)
  set msg($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearMsg() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get recordingId => $_getSZ(4);
  @$pb.TagNumber(5)
  set recordingId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRecordingId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRecordingId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get roomId => $_getSZ(5);
  @$pb.TagNumber(6)
  set roomId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRoomId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get roomSid => $_getSZ(6);
  @$pb.TagNumber(7)
  set roomSid($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRoomSid() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoomSid() => $_clearField(7);

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
  $fixnum.Int64 get roomTableId => $_getI64(10);
  @$pb.TagNumber(11)
  set roomTableId($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasRoomTableId() => $_has(10);
  @$pb.TagNumber(11)
  void clearRoomTableId() => $_clearField(11);

  @$pb.TagNumber(12)
  CloudRecordingVariants get recordingVariant => $_getN(11);
  @$pb.TagNumber(12)
  set recordingVariant(CloudRecordingVariants value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasRecordingVariant() => $_has(11);
  @$pb.TagNumber(12)
  void clearRecordingVariant() => $_clearField(12);
}

/// TranscodingTask will be the job for the transcoding worker.
class TranscodingTask extends $pb.GeneratedMessage {
  factory TranscodingTask({
    $core.String? recordingId,
    $core.String? roomId,
    $core.String? roomSid,
    $core.String? filePath,
    $core.String? fileName,
    $fixnum.Int64? roomTableId,
    $core.String? recorderId,
    CloudRecordingVariants? recordingVariant,
  }) {
    final result = create();
    if (recordingId != null) result.recordingId = recordingId;
    if (roomId != null) result.roomId = roomId;
    if (roomSid != null) result.roomSid = roomSid;
    if (filePath != null) result.filePath = filePath;
    if (fileName != null) result.fileName = fileName;
    if (roomTableId != null) result.roomTableId = roomTableId;
    if (recorderId != null) result.recorderId = recorderId;
    if (recordingVariant != null) result.recordingVariant = recordingVariant;
    return result;
  }

  TranscodingTask._();

  factory TranscodingTask.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TranscodingTask.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TranscodingTask',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recordingId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'roomSid')
    ..aOS(4, _omitFieldNames ? '' : 'filePath')
    ..aOS(5, _omitFieldNames ? '' : 'fileName')
    ..aInt64(6, _omitFieldNames ? '' : 'roomTableId')
    ..aOS(7, _omitFieldNames ? '' : 'recorderId')
    ..e<CloudRecordingVariants>(
        8, _omitFieldNames ? '' : 'recordingVariant', $pb.PbFieldType.OE,
        defaultOrMaker: CloudRecordingVariants.FULL_SCREEN_CLOUD_RECORDING,
        valueOf: CloudRecordingVariants.valueOf,
        enumValues: CloudRecordingVariants.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TranscodingTask clone() => TranscodingTask()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TranscodingTask copyWith(void Function(TranscodingTask) updates) =>
      super.copyWith((message) => updates(message as TranscodingTask))
          as TranscodingTask;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TranscodingTask create() => TranscodingTask._();
  @$core.override
  TranscodingTask createEmptyInstance() => create();
  static $pb.PbList<TranscodingTask> createRepeated() =>
      $pb.PbList<TranscodingTask>();
  @$core.pragma('dart2js:noInline')
  static TranscodingTask getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TranscodingTask>(create);
  static TranscodingTask? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recordingId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recordingId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRecordingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordingId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomSid => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomSid($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomSid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomSid() => $_clearField(3);

  /// directory where raw file is stored
  @$pb.TagNumber(4)
  $core.String get filePath => $_getSZ(3);
  @$pb.TagNumber(4)
  set filePath($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFilePath() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilePath() => $_clearField(4);

  /// raw file name e.g. rec-xxx_raw.mp4
  @$pb.TagNumber(5)
  $core.String get fileName => $_getSZ(4);
  @$pb.TagNumber(5)
  set fileName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFileName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileName() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get roomTableId => $_getI64(5);
  @$pb.TagNumber(6)
  set roomTableId($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRoomTableId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomTableId() => $_clearField(6);

  /// ID of the original recorder that captured the file
  @$pb.TagNumber(7)
  $core.String get recorderId => $_getSZ(6);
  @$pb.TagNumber(7)
  set recorderId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRecorderId() => $_has(6);
  @$pb.TagNumber(7)
  void clearRecorderId() => $_clearField(7);

  /// The variant of the recording
  @$pb.TagNumber(8)
  CloudRecordingVariants get recordingVariant => $_getN(7);
  @$pb.TagNumber(8)
  set recordingVariant(CloudRecordingVariants value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasRecordingVariant() => $_has(7);
  @$pb.TagNumber(8)
  void clearRecordingVariant() => $_clearField(8);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
