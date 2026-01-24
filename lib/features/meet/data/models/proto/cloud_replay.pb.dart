//
//  Generated code. Do not modify.
//  source: cloud_replay.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/empty.pb.dart' as $3;
import 'livekit_models.pb.dart' as $2;

class ListReplaysRequest extends $pb.GeneratedMessage {
  factory ListReplaysRequest({
    $core.String? roomName,
    $2.TokenPagination? pageToken,
  }) {
    final $result = create();
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListReplaysRequest._() : super();
  factory ListReplaysRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListReplaysRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListReplaysRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOM<$2.TokenPagination>(2, _omitFieldNames ? '' : 'pageToken', subBuilder: $2.TokenPagination.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListReplaysRequest clone() => ListReplaysRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListReplaysRequest copyWith(void Function(ListReplaysRequest) updates) => super.copyWith((message) => updates(message as ListReplaysRequest)) as ListReplaysRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReplaysRequest create() => ListReplaysRequest._();
  ListReplaysRequest createEmptyInstance() => create();
  static $pb.PbList<ListReplaysRequest> createRepeated() => $pb.PbList<ListReplaysRequest>();
  @$core.pragma('dart2js:noInline')
  static ListReplaysRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListReplaysRequest>(create);
  static ListReplaysRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => clearField(1);

  @$pb.TagNumber(2)
  $2.TokenPagination get pageToken => $_getN(1);
  @$pb.TagNumber(2)
  set pageToken($2.TokenPagination v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => clearField(2);
  @$pb.TagNumber(2)
  $2.TokenPagination ensurePageToken() => $_ensure(1);
}

class ListReplaysResponse extends $pb.GeneratedMessage {
  factory ListReplaysResponse({
    $core.Iterable<ReplayInfo>? replays,
    $2.TokenPagination? nextPageToken,
  }) {
    final $result = create();
    if (replays != null) {
      $result.replays.addAll(replays);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListReplaysResponse._() : super();
  factory ListReplaysResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListReplaysResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListReplaysResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'), createEmptyInstance: create)
    ..pc<ReplayInfo>(1, _omitFieldNames ? '' : 'replays', $pb.PbFieldType.PM, subBuilder: ReplayInfo.create)
    ..aOM<$2.TokenPagination>(2, _omitFieldNames ? '' : 'nextPageToken', subBuilder: $2.TokenPagination.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListReplaysResponse clone() => ListReplaysResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListReplaysResponse copyWith(void Function(ListReplaysResponse) updates) => super.copyWith((message) => updates(message as ListReplaysResponse)) as ListReplaysResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReplaysResponse create() => ListReplaysResponse._();
  ListReplaysResponse createEmptyInstance() => create();
  static $pb.PbList<ListReplaysResponse> createRepeated() => $pb.PbList<ListReplaysResponse>();
  @$core.pragma('dart2js:noInline')
  static ListReplaysResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListReplaysResponse>(create);
  static ListReplaysResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ReplayInfo> get replays => $_getList(0);

  @$pb.TagNumber(2)
  $2.TokenPagination get nextPageToken => $_getN(1);
  @$pb.TagNumber(2)
  set nextPageToken($2.TokenPagination v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => clearField(2);
  @$pb.TagNumber(2)
  $2.TokenPagination ensureNextPageToken() => $_ensure(1);
}

class ReplayInfo extends $pb.GeneratedMessage {
  factory ReplayInfo({
    $core.String? replayId,
    $core.String? roomName,
    $fixnum.Int64? startTime,
    $fixnum.Int64? duration,
  }) {
    final $result = create();
    if (replayId != null) {
      $result.replayId = replayId;
    }
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    return $result;
  }
  ReplayInfo._() : super();
  factory ReplayInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplayInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplayInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'replayId')
    ..aOS(2, _omitFieldNames ? '' : 'roomName')
    ..aInt64(3, _omitFieldNames ? '' : 'startTime')
    ..aInt64(4, _omitFieldNames ? '' : 'duration')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplayInfo clone() => ReplayInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplayInfo copyWith(void Function(ReplayInfo) updates) => super.copyWith((message) => updates(message as ReplayInfo)) as ReplayInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplayInfo create() => ReplayInfo._();
  ReplayInfo createEmptyInstance() => create();
  static $pb.PbList<ReplayInfo> createRepeated() => $pb.PbList<ReplayInfo>();
  @$core.pragma('dart2js:noInline')
  static ReplayInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplayInfo>(create);
  static ReplayInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get replayId => $_getSZ(0);
  @$pb.TagNumber(1)
  set replayId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReplayId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReplayId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomName => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomName() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get startTime => $_getI64(2);
  @$pb.TagNumber(3)
  set startTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStartTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTime() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get duration => $_getI64(3);
  @$pb.TagNumber(4)
  set duration($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);
}

class DeleteReplayRequest extends $pb.GeneratedMessage {
  factory DeleteReplayRequest({
    $core.String? replayId,
  }) {
    final $result = create();
    if (replayId != null) {
      $result.replayId = replayId;
    }
    return $result;
  }
  DeleteReplayRequest._() : super();
  factory DeleteReplayRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteReplayRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteReplayRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'replayId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteReplayRequest clone() => DeleteReplayRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteReplayRequest copyWith(void Function(DeleteReplayRequest) updates) => super.copyWith((message) => updates(message as DeleteReplayRequest)) as DeleteReplayRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteReplayRequest create() => DeleteReplayRequest._();
  DeleteReplayRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteReplayRequest> createRepeated() => $pb.PbList<DeleteReplayRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteReplayRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteReplayRequest>(create);
  static DeleteReplayRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get replayId => $_getSZ(0);
  @$pb.TagNumber(1)
  set replayId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReplayId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReplayId() => clearField(1);
}

class PlaybackRequest extends $pb.GeneratedMessage {
  factory PlaybackRequest({
    $core.String? replayId,
    $core.String? playbackRoom,
    $fixnum.Int64? seekOffset,
  }) {
    final $result = create();
    if (replayId != null) {
      $result.replayId = replayId;
    }
    if (playbackRoom != null) {
      $result.playbackRoom = playbackRoom;
    }
    if (seekOffset != null) {
      $result.seekOffset = seekOffset;
    }
    return $result;
  }
  PlaybackRequest._() : super();
  factory PlaybackRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaybackRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlaybackRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'replayId')
    ..aOS(2, _omitFieldNames ? '' : 'playbackRoom')
    ..aInt64(3, _omitFieldNames ? '' : 'seekOffset')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaybackRequest clone() => PlaybackRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaybackRequest copyWith(void Function(PlaybackRequest) updates) => super.copyWith((message) => updates(message as PlaybackRequest)) as PlaybackRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlaybackRequest create() => PlaybackRequest._();
  PlaybackRequest createEmptyInstance() => create();
  static $pb.PbList<PlaybackRequest> createRepeated() => $pb.PbList<PlaybackRequest>();
  @$core.pragma('dart2js:noInline')
  static PlaybackRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaybackRequest>(create);
  static PlaybackRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get replayId => $_getSZ(0);
  @$pb.TagNumber(1)
  set replayId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReplayId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReplayId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get playbackRoom => $_getSZ(1);
  @$pb.TagNumber(2)
  set playbackRoom($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlaybackRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlaybackRoom() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get seekOffset => $_getI64(2);
  @$pb.TagNumber(3)
  set seekOffset($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSeekOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeekOffset() => clearField(3);
}

class PlaybackResponse extends $pb.GeneratedMessage {
  factory PlaybackResponse({
    $core.String? playbackId,
  }) {
    final $result = create();
    if (playbackId != null) {
      $result.playbackId = playbackId;
    }
    return $result;
  }
  PlaybackResponse._() : super();
  factory PlaybackResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaybackResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlaybackResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playbackId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaybackResponse clone() => PlaybackResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaybackResponse copyWith(void Function(PlaybackResponse) updates) => super.copyWith((message) => updates(message as PlaybackResponse)) as PlaybackResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlaybackResponse create() => PlaybackResponse._();
  PlaybackResponse createEmptyInstance() => create();
  static $pb.PbList<PlaybackResponse> createRepeated() => $pb.PbList<PlaybackResponse>();
  @$core.pragma('dart2js:noInline')
  static PlaybackResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaybackResponse>(create);
  static PlaybackResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playbackId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playbackId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlaybackId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaybackId() => clearField(1);
}

class SeekRequest extends $pb.GeneratedMessage {
  factory SeekRequest({
    $core.String? playbackId,
    $fixnum.Int64? seekOffset,
  }) {
    final $result = create();
    if (playbackId != null) {
      $result.playbackId = playbackId;
    }
    if (seekOffset != null) {
      $result.seekOffset = seekOffset;
    }
    return $result;
  }
  SeekRequest._() : super();
  factory SeekRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SeekRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SeekRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playbackId')
    ..aInt64(2, _omitFieldNames ? '' : 'seekOffset')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SeekRequest clone() => SeekRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SeekRequest copyWith(void Function(SeekRequest) updates) => super.copyWith((message) => updates(message as SeekRequest)) as SeekRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SeekRequest create() => SeekRequest._();
  SeekRequest createEmptyInstance() => create();
  static $pb.PbList<SeekRequest> createRepeated() => $pb.PbList<SeekRequest>();
  @$core.pragma('dart2js:noInline')
  static SeekRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SeekRequest>(create);
  static SeekRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playbackId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playbackId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlaybackId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaybackId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get seekOffset => $_getI64(1);
  @$pb.TagNumber(2)
  set seekOffset($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSeekOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeekOffset() => clearField(2);
}

class ClosePlaybackRequest extends $pb.GeneratedMessage {
  factory ClosePlaybackRequest({
    $core.String? playbackId,
  }) {
    final $result = create();
    if (playbackId != null) {
      $result.playbackId = playbackId;
    }
    return $result;
  }
  ClosePlaybackRequest._() : super();
  factory ClosePlaybackRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClosePlaybackRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ClosePlaybackRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playbackId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClosePlaybackRequest clone() => ClosePlaybackRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClosePlaybackRequest copyWith(void Function(ClosePlaybackRequest) updates) => super.copyWith((message) => updates(message as ClosePlaybackRequest)) as ClosePlaybackRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClosePlaybackRequest create() => ClosePlaybackRequest._();
  ClosePlaybackRequest createEmptyInstance() => create();
  static $pb.PbList<ClosePlaybackRequest> createRepeated() => $pb.PbList<ClosePlaybackRequest>();
  @$core.pragma('dart2js:noInline')
  static ClosePlaybackRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClosePlaybackRequest>(create);
  static ClosePlaybackRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playbackId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playbackId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlaybackId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaybackId() => clearField(1);
}

class ReplayApi {
  $pb.RpcClient _client;
  ReplayApi(this._client);

  $async.Future<ListReplaysResponse> listReplays($pb.ClientContext? ctx, ListReplaysRequest request) =>
    _client.invoke<ListReplaysResponse>(ctx, 'Replay', 'ListReplays', request, ListReplaysResponse())
  ;
  $async.Future<$3.Empty> deleteReplay($pb.ClientContext? ctx, DeleteReplayRequest request) =>
    _client.invoke<$3.Empty>(ctx, 'Replay', 'DeleteReplay', request, $3.Empty())
  ;
  $async.Future<PlaybackResponse> playback($pb.ClientContext? ctx, PlaybackRequest request) =>
    _client.invoke<PlaybackResponse>(ctx, 'Replay', 'Playback', request, PlaybackResponse())
  ;
  $async.Future<$3.Empty> seek($pb.ClientContext? ctx, SeekRequest request) =>
    _client.invoke<$3.Empty>(ctx, 'Replay', 'Seek', request, $3.Empty())
  ;
  $async.Future<$3.Empty> close($pb.ClientContext? ctx, ClosePlaybackRequest request) =>
    _client.invoke<$3.Empty>(ctx, 'Replay', 'Close', request, $3.Empty())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
