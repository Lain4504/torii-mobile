//
//  Generated code. Do not modify.
//  source: wajlc_recorder.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_recorder.pbenum.dart';

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
    final $result = create();
    if (from != null) {
      $result.from = from;
    }
    if (task != null) {
      $result.task = task;
    }
    if (roomTableId != null) {
      $result.roomTableId = roomTableId;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (roomSid != null) {
      $result.roomSid = roomSid;
    }
    if (recordingId != null) {
      $result.recordingId = recordingId;
    }
    if (recorderId != null) {
      $result.recorderId = recorderId;
    }
    if (accessToken != null) {
      $result.accessToken = accessToken;
    }
    if (rtmpUrl != null) {
      $result.rtmpUrl = rtmpUrl;
    }
    return $result;
  }
  WajlcToRecorder._() : super();
  factory WajlcToRecorder.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WajlcToRecorder.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WajlcToRecorder', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'from')
    ..e<RecordingTasks>(2, _omitFieldNames ? '' : 'task', $pb.PbFieldType.OE, defaultOrMaker: RecordingTasks.START_RECORDING, valueOf: RecordingTasks.valueOf, enumValues: RecordingTasks.values)
    ..aInt64(3, _omitFieldNames ? '' : 'roomTableId')
    ..aOS(4, _omitFieldNames ? '' : 'roomId')
    ..aOS(5, _omitFieldNames ? '' : 'roomSid')
    ..aOS(6, _omitFieldNames ? '' : 'recordingId')
    ..aOS(7, _omitFieldNames ? '' : 'recorderId')
    ..aOS(8, _omitFieldNames ? '' : 'accessToken')
    ..aOS(9, _omitFieldNames ? '' : 'rtmpUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WajlcToRecorder clone() => WajlcToRecorder()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WajlcToRecorder copyWith(void Function(WajlcToRecorder) updates) => super.copyWith((message) => updates(message as WajlcToRecorder)) as WajlcToRecorder;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WajlcToRecorder create() => WajlcToRecorder._();
  WajlcToRecorder createEmptyInstance() => create();
  static $pb.PbList<WajlcToRecorder> createRepeated() => $pb.PbList<WajlcToRecorder>();
  @$core.pragma('dart2js:noInline')
  static WajlcToRecorder getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WajlcToRecorder>(create);
  static WajlcToRecorder? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get from => $_getSZ(0);
  @$pb.TagNumber(1)
  set from($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);

  @$pb.TagNumber(2)
  RecordingTasks get task => $_getN(1);
  @$pb.TagNumber(2)
  set task(RecordingTasks v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearTask() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get roomTableId => $_getI64(2);
  @$pb.TagNumber(3)
  set roomTableId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomTableId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomTableId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomId => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get roomSid => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomSid($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRoomSid() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomSid() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get recordingId => $_getSZ(5);
  @$pb.TagNumber(6)
  set recordingId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRecordingId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRecordingId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get recorderId => $_getSZ(6);
  @$pb.TagNumber(7)
  set recorderId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRecorderId() => $_has(6);
  @$pb.TagNumber(7)
  void clearRecorderId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get accessToken => $_getSZ(7);
  @$pb.TagNumber(8)
  set accessToken($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAccessToken() => $_has(7);
  @$pb.TagNumber(8)
  void clearAccessToken() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get rtmpUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set rtmpUrl($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasRtmpUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearRtmpUrl() => clearField(9);
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
    final $result = create();
    if (from != null) {
      $result.from = from;
    }
    if (task != null) {
      $result.task = task;
    }
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (recordingId != null) {
      $result.recordingId = recordingId;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (roomSid != null) {
      $result.roomSid = roomSid;
    }
    if (recorderId != null) {
      $result.recorderId = recorderId;
    }
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (fileSize != null) {
      $result.fileSize = fileSize;
    }
    if (roomTableId != null) {
      $result.roomTableId = roomTableId;
    }
    if (recordingVariant != null) {
      $result.recordingVariant = recordingVariant;
    }
    return $result;
  }
  RecorderToWajlc._() : super();
  factory RecorderToWajlc.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecorderToWajlc.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecorderToWajlc', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'from')
    ..e<RecordingTasks>(2, _omitFieldNames ? '' : 'task', $pb.PbFieldType.OE, defaultOrMaker: RecordingTasks.START_RECORDING, valueOf: RecordingTasks.valueOf, enumValues: RecordingTasks.values)
    ..aOB(3, _omitFieldNames ? '' : 'status')
    ..aOS(4, _omitFieldNames ? '' : 'msg')
    ..aOS(5, _omitFieldNames ? '' : 'recordingId')
    ..aOS(6, _omitFieldNames ? '' : 'roomId')
    ..aOS(7, _omitFieldNames ? '' : 'roomSid')
    ..aOS(8, _omitFieldNames ? '' : 'recorderId')
    ..aOS(9, _omitFieldNames ? '' : 'filePath')
    ..a<$core.double>(10, _omitFieldNames ? '' : 'fileSize', $pb.PbFieldType.OF)
    ..aInt64(11, _omitFieldNames ? '' : 'roomTableId')
    ..e<CloudRecordingVariants>(12, _omitFieldNames ? '' : 'recordingVariant', $pb.PbFieldType.OE, defaultOrMaker: CloudRecordingVariants.FULL_SCREEN_CLOUD_RECORDING, valueOf: CloudRecordingVariants.valueOf, enumValues: CloudRecordingVariants.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecorderToWajlc clone() => RecorderToWajlc()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecorderToWajlc copyWith(void Function(RecorderToWajlc) updates) => super.copyWith((message) => updates(message as RecorderToWajlc)) as RecorderToWajlc;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecorderToWajlc create() => RecorderToWajlc._();
  RecorderToWajlc createEmptyInstance() => create();
  static $pb.PbList<RecorderToWajlc> createRepeated() => $pb.PbList<RecorderToWajlc>();
  @$core.pragma('dart2js:noInline')
  static RecorderToWajlc getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecorderToWajlc>(create);
  static RecorderToWajlc? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get from => $_getSZ(0);
  @$pb.TagNumber(1)
  set from($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);

  @$pb.TagNumber(2)
  RecordingTasks get task => $_getN(1);
  @$pb.TagNumber(2)
  set task(RecordingTasks v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearTask() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get status => $_getBF(2);
  @$pb.TagNumber(3)
  set status($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get msg => $_getSZ(3);
  @$pb.TagNumber(4)
  set msg($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearMsg() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get recordingId => $_getSZ(4);
  @$pb.TagNumber(5)
  set recordingId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRecordingId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRecordingId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get roomId => $_getSZ(5);
  @$pb.TagNumber(6)
  set roomId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRoomId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get roomSid => $_getSZ(6);
  @$pb.TagNumber(7)
  set roomSid($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRoomSid() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoomSid() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get recorderId => $_getSZ(7);
  @$pb.TagNumber(8)
  set recorderId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRecorderId() => $_has(7);
  @$pb.TagNumber(8)
  void clearRecorderId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get filePath => $_getSZ(8);
  @$pb.TagNumber(9)
  set filePath($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFilePath() => $_has(8);
  @$pb.TagNumber(9)
  void clearFilePath() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get fileSize => $_getN(9);
  @$pb.TagNumber(10)
  set fileSize($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasFileSize() => $_has(9);
  @$pb.TagNumber(10)
  void clearFileSize() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get roomTableId => $_getI64(10);
  @$pb.TagNumber(11)
  set roomTableId($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasRoomTableId() => $_has(10);
  @$pb.TagNumber(11)
  void clearRoomTableId() => clearField(11);

  @$pb.TagNumber(12)
  CloudRecordingVariants get recordingVariant => $_getN(11);
  @$pb.TagNumber(12)
  set recordingVariant(CloudRecordingVariants v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasRecordingVariant() => $_has(11);
  @$pb.TagNumber(12)
  void clearRecordingVariant() => clearField(12);
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
    final $result = create();
    if (recordingId != null) {
      $result.recordingId = recordingId;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (roomSid != null) {
      $result.roomSid = roomSid;
    }
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (roomTableId != null) {
      $result.roomTableId = roomTableId;
    }
    if (recorderId != null) {
      $result.recorderId = recorderId;
    }
    if (recordingVariant != null) {
      $result.recordingVariant = recordingVariant;
    }
    return $result;
  }
  TranscodingTask._() : super();
  factory TranscodingTask.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TranscodingTask.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TranscodingTask', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recordingId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'roomSid')
    ..aOS(4, _omitFieldNames ? '' : 'filePath')
    ..aOS(5, _omitFieldNames ? '' : 'fileName')
    ..aInt64(6, _omitFieldNames ? '' : 'roomTableId')
    ..aOS(7, _omitFieldNames ? '' : 'recorderId')
    ..e<CloudRecordingVariants>(8, _omitFieldNames ? '' : 'recordingVariant', $pb.PbFieldType.OE, defaultOrMaker: CloudRecordingVariants.FULL_SCREEN_CLOUD_RECORDING, valueOf: CloudRecordingVariants.valueOf, enumValues: CloudRecordingVariants.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TranscodingTask clone() => TranscodingTask()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TranscodingTask copyWith(void Function(TranscodingTask) updates) => super.copyWith((message) => updates(message as TranscodingTask)) as TranscodingTask;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TranscodingTask create() => TranscodingTask._();
  TranscodingTask createEmptyInstance() => create();
  static $pb.PbList<TranscodingTask> createRepeated() => $pb.PbList<TranscodingTask>();
  @$core.pragma('dart2js:noInline')
  static TranscodingTask getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TranscodingTask>(create);
  static TranscodingTask? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recordingId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recordingId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRecordingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordingId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomSid => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomSid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomSid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomSid() => clearField(3);

  /// directory where raw file is stored
  @$pb.TagNumber(4)
  $core.String get filePath => $_getSZ(3);
  @$pb.TagNumber(4)
  set filePath($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFilePath() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilePath() => clearField(4);

  /// raw file name e.g. rec-xxx_raw.mp4
  @$pb.TagNumber(5)
  $core.String get fileName => $_getSZ(4);
  @$pb.TagNumber(5)
  set fileName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFileName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileName() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get roomTableId => $_getI64(5);
  @$pb.TagNumber(6)
  set roomTableId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRoomTableId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomTableId() => clearField(6);

  /// ID of the original recorder that captured the file
  @$pb.TagNumber(7)
  $core.String get recorderId => $_getSZ(6);
  @$pb.TagNumber(7)
  set recorderId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRecorderId() => $_has(6);
  @$pb.TagNumber(7)
  void clearRecorderId() => clearField(7);

  /// The variant of the recording
  @$pb.TagNumber(8)
  CloudRecordingVariants get recordingVariant => $_getN(7);
  @$pb.TagNumber(8)
  set recordingVariant(CloudRecordingVariants v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasRecordingVariant() => $_has(7);
  @$pb.TagNumber(8)
  void clearRecordingVariant() => clearField(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
