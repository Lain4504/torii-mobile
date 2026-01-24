// This is a generated file - do not edit.
//
// Generated from cloud_replay.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $1;

import 'livekit_models.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ListReplaysRequest extends $pb.GeneratedMessage {
  factory ListReplaysRequest({
    $core.String? roomName,
    $0.TokenPagination? pageToken,
  }) {
    final result = create();
    if (roomName != null) result.roomName = roomName;
    if (pageToken != null) result.pageToken = pageToken;
    return result;
  }

  ListReplaysRequest._();

  factory ListReplaysRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListReplaysRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListReplaysRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOM<$0.TokenPagination>(2, _omitFieldNames ? '' : 'pageToken',
        subBuilder: $0.TokenPagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReplaysRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReplaysRequest copyWith(void Function(ListReplaysRequest) updates) =>
      super.copyWith((message) => updates(message as ListReplaysRequest))
          as ListReplaysRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReplaysRequest create() => ListReplaysRequest._();
  @$core.override
  ListReplaysRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListReplaysRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListReplaysRequest>(create);
  static ListReplaysRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.TokenPagination get pageToken => $_getN(1);
  @$pb.TagNumber(2)
  set pageToken($0.TokenPagination value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.TokenPagination ensurePageToken() => $_ensure(1);
}

class ListReplaysResponse extends $pb.GeneratedMessage {
  factory ListReplaysResponse({
    $core.Iterable<ReplayInfo>? replays,
    $0.TokenPagination? nextPageToken,
  }) {
    final result = create();
    if (replays != null) result.replays.addAll(replays);
    if (nextPageToken != null) result.nextPageToken = nextPageToken;
    return result;
  }

  ListReplaysResponse._();

  factory ListReplaysResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListReplaysResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListReplaysResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'),
      createEmptyInstance: create)
    ..pPM<ReplayInfo>(1, _omitFieldNames ? '' : 'replays',
        subBuilder: ReplayInfo.create)
    ..aOM<$0.TokenPagination>(2, _omitFieldNames ? '' : 'nextPageToken',
        subBuilder: $0.TokenPagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReplaysResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReplaysResponse copyWith(void Function(ListReplaysResponse) updates) =>
      super.copyWith((message) => updates(message as ListReplaysResponse))
          as ListReplaysResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReplaysResponse create() => ListReplaysResponse._();
  @$core.override
  ListReplaysResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListReplaysResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListReplaysResponse>(create);
  static ListReplaysResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ReplayInfo> get replays => $_getList(0);

  @$pb.TagNumber(2)
  $0.TokenPagination get nextPageToken => $_getN(1);
  @$pb.TagNumber(2)
  set nextPageToken($0.TokenPagination value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.TokenPagination ensureNextPageToken() => $_ensure(1);
}

class ReplayInfo extends $pb.GeneratedMessage {
  factory ReplayInfo({
    $core.String? replayId,
    $core.String? roomName,
    $fixnum.Int64? startTime,
    $fixnum.Int64? duration,
  }) {
    final result = create();
    if (replayId != null) result.replayId = replayId;
    if (roomName != null) result.roomName = roomName;
    if (startTime != null) result.startTime = startTime;
    if (duration != null) result.duration = duration;
    return result;
  }

  ReplayInfo._();

  factory ReplayInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReplayInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReplayInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'replayId')
    ..aOS(2, _omitFieldNames ? '' : 'roomName')
    ..aInt64(3, _omitFieldNames ? '' : 'startTime')
    ..aInt64(4, _omitFieldNames ? '' : 'duration')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReplayInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReplayInfo copyWith(void Function(ReplayInfo) updates) =>
      super.copyWith((message) => updates(message as ReplayInfo)) as ReplayInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplayInfo create() => ReplayInfo._();
  @$core.override
  ReplayInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReplayInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReplayInfo>(create);
  static ReplayInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get replayId => $_getSZ(0);
  @$pb.TagNumber(1)
  set replayId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReplayId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReplayId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomName => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomName() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get startTime => $_getI64(2);
  @$pb.TagNumber(3)
  set startTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStartTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get duration => $_getI64(3);
  @$pb.TagNumber(4)
  set duration($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => $_clearField(4);
}

class DeleteReplayRequest extends $pb.GeneratedMessage {
  factory DeleteReplayRequest({
    $core.String? replayId,
  }) {
    final result = create();
    if (replayId != null) result.replayId = replayId;
    return result;
  }

  DeleteReplayRequest._();

  factory DeleteReplayRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteReplayRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteReplayRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'replayId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteReplayRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteReplayRequest copyWith(void Function(DeleteReplayRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteReplayRequest))
          as DeleteReplayRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteReplayRequest create() => DeleteReplayRequest._();
  @$core.override
  DeleteReplayRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteReplayRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteReplayRequest>(create);
  static DeleteReplayRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get replayId => $_getSZ(0);
  @$pb.TagNumber(1)
  set replayId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReplayId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReplayId() => $_clearField(1);
}

class PlaybackRequest extends $pb.GeneratedMessage {
  factory PlaybackRequest({
    $core.String? replayId,
    $core.String? playbackRoom,
    $fixnum.Int64? seekOffset,
  }) {
    final result = create();
    if (replayId != null) result.replayId = replayId;
    if (playbackRoom != null) result.playbackRoom = playbackRoom;
    if (seekOffset != null) result.seekOffset = seekOffset;
    return result;
  }

  PlaybackRequest._();

  factory PlaybackRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PlaybackRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PlaybackRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'replayId')
    ..aOS(2, _omitFieldNames ? '' : 'playbackRoom')
    ..aInt64(3, _omitFieldNames ? '' : 'seekOffset')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlaybackRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlaybackRequest copyWith(void Function(PlaybackRequest) updates) =>
      super.copyWith((message) => updates(message as PlaybackRequest))
          as PlaybackRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlaybackRequest create() => PlaybackRequest._();
  @$core.override
  PlaybackRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PlaybackRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PlaybackRequest>(create);
  static PlaybackRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get replayId => $_getSZ(0);
  @$pb.TagNumber(1)
  set replayId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReplayId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReplayId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get playbackRoom => $_getSZ(1);
  @$pb.TagNumber(2)
  set playbackRoom($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPlaybackRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlaybackRoom() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get seekOffset => $_getI64(2);
  @$pb.TagNumber(3)
  set seekOffset($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSeekOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeekOffset() => $_clearField(3);
}

class PlaybackResponse extends $pb.GeneratedMessage {
  factory PlaybackResponse({
    $core.String? playbackId,
  }) {
    final result = create();
    if (playbackId != null) result.playbackId = playbackId;
    return result;
  }

  PlaybackResponse._();

  factory PlaybackResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PlaybackResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PlaybackResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playbackId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlaybackResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlaybackResponse copyWith(void Function(PlaybackResponse) updates) =>
      super.copyWith((message) => updates(message as PlaybackResponse))
          as PlaybackResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlaybackResponse create() => PlaybackResponse._();
  @$core.override
  PlaybackResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PlaybackResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PlaybackResponse>(create);
  static PlaybackResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playbackId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playbackId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPlaybackId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaybackId() => $_clearField(1);
}

class SeekRequest extends $pb.GeneratedMessage {
  factory SeekRequest({
    $core.String? playbackId,
    $fixnum.Int64? seekOffset,
  }) {
    final result = create();
    if (playbackId != null) result.playbackId = playbackId;
    if (seekOffset != null) result.seekOffset = seekOffset;
    return result;
  }

  SeekRequest._();

  factory SeekRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SeekRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SeekRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playbackId')
    ..aInt64(2, _omitFieldNames ? '' : 'seekOffset')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SeekRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SeekRequest copyWith(void Function(SeekRequest) updates) =>
      super.copyWith((message) => updates(message as SeekRequest))
          as SeekRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SeekRequest create() => SeekRequest._();
  @$core.override
  SeekRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SeekRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SeekRequest>(create);
  static SeekRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playbackId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playbackId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPlaybackId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaybackId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get seekOffset => $_getI64(1);
  @$pb.TagNumber(2)
  set seekOffset($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSeekOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeekOffset() => $_clearField(2);
}

class ClosePlaybackRequest extends $pb.GeneratedMessage {
  factory ClosePlaybackRequest({
    $core.String? playbackId,
  }) {
    final result = create();
    if (playbackId != null) result.playbackId = playbackId;
    return result;
  }

  ClosePlaybackRequest._();

  factory ClosePlaybackRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClosePlaybackRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClosePlaybackRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'replay'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playbackId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosePlaybackRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosePlaybackRequest copyWith(void Function(ClosePlaybackRequest) updates) =>
      super.copyWith((message) => updates(message as ClosePlaybackRequest))
          as ClosePlaybackRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClosePlaybackRequest create() => ClosePlaybackRequest._();
  @$core.override
  ClosePlaybackRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClosePlaybackRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClosePlaybackRequest>(create);
  static ClosePlaybackRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playbackId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playbackId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPlaybackId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaybackId() => $_clearField(1);
}

/// Experimental (not currently available)
class ReplayApi {
  final $pb.RpcClient _client;

  ReplayApi(this._client);

  $async.Future<ListReplaysResponse> listReplays(
          $pb.ClientContext? ctx, ListReplaysRequest request) =>
      _client.invoke<ListReplaysResponse>(
          ctx, 'Replay', 'ListReplays', request, ListReplaysResponse());
  $async.Future<$1.Empty> deleteReplay(
          $pb.ClientContext? ctx, DeleteReplayRequest request) =>
      _client.invoke<$1.Empty>(
          ctx, 'Replay', 'DeleteReplay', request, $1.Empty());
  $async.Future<PlaybackResponse> playback(
          $pb.ClientContext? ctx, PlaybackRequest request) =>
      _client.invoke<PlaybackResponse>(
          ctx, 'Replay', 'Playback', request, PlaybackResponse());
  $async.Future<$1.Empty> seek($pb.ClientContext? ctx, SeekRequest request) =>
      _client.invoke<$1.Empty>(ctx, 'Replay', 'Seek', request, $1.Empty());
  $async.Future<$1.Empty> close(
          $pb.ClientContext? ctx, ClosePlaybackRequest request) =>
      _client.invoke<$1.Empty>(ctx, 'Replay', 'Close', request, $1.Empty());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
