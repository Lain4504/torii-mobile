// This is a generated file - do not edit.
//
// Generated from livekit_egress.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_egress.pbenum.dart';
import 'livekit_models.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'livekit_egress.pbenum.dart';

enum RoomCompositeEgressRequest_Output { file, stream, segments, notSet }

enum RoomCompositeEgressRequest_Options { preset, advanced, notSet }

/// composite using a web browser
class RoomCompositeEgressRequest extends $pb.GeneratedMessage {
  factory RoomCompositeEgressRequest({
    $core.String? roomName,
    $core.String? layout,
    $core.bool? audioOnly,
    $core.bool? videoOnly,
    $core.String? customBaseUrl,
    @$core.Deprecated('This field is deprecated.') EncodedFileOutput? file,
    @$core.Deprecated('This field is deprecated.') StreamOutput? stream,
    EncodingOptionsPreset? preset,
    EncodingOptions? advanced,
    @$core.Deprecated('This field is deprecated.')
    SegmentedFileOutput? segments,
    $core.Iterable<EncodedFileOutput>? fileOutputs,
    $core.Iterable<StreamOutput>? streamOutputs,
    $core.Iterable<SegmentedFileOutput>? segmentOutputs,
    $core.Iterable<ImageOutput>? imageOutputs,
    AudioMixing? audioMixing,
    $core.Iterable<$0.WebhookConfig>? webhooks,
  }) {
    final result = create();
    if (roomName != null) result.roomName = roomName;
    if (layout != null) result.layout = layout;
    if (audioOnly != null) result.audioOnly = audioOnly;
    if (videoOnly != null) result.videoOnly = videoOnly;
    if (customBaseUrl != null) result.customBaseUrl = customBaseUrl;
    if (file != null) result.file = file;
    if (stream != null) result.stream = stream;
    if (preset != null) result.preset = preset;
    if (advanced != null) result.advanced = advanced;
    if (segments != null) result.segments = segments;
    if (fileOutputs != null) result.fileOutputs.addAll(fileOutputs);
    if (streamOutputs != null) result.streamOutputs.addAll(streamOutputs);
    if (segmentOutputs != null) result.segmentOutputs.addAll(segmentOutputs);
    if (imageOutputs != null) result.imageOutputs.addAll(imageOutputs);
    if (audioMixing != null) result.audioMixing = audioMixing;
    if (webhooks != null) result.webhooks.addAll(webhooks);
    return result;
  }

  RoomCompositeEgressRequest._();

  factory RoomCompositeEgressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomCompositeEgressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, RoomCompositeEgressRequest_Output>
      _RoomCompositeEgressRequest_OutputByTag = {
    6: RoomCompositeEgressRequest_Output.file,
    7: RoomCompositeEgressRequest_Output.stream,
    10: RoomCompositeEgressRequest_Output.segments,
    0: RoomCompositeEgressRequest_Output.notSet
  };
  static const $core.Map<$core.int, RoomCompositeEgressRequest_Options>
      _RoomCompositeEgressRequest_OptionsByTag = {
    8: RoomCompositeEgressRequest_Options.preset,
    9: RoomCompositeEgressRequest_Options.advanced,
    0: RoomCompositeEgressRequest_Options.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomCompositeEgressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [6, 7, 10])
    ..oo(1, [8, 9])
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOS(2, _omitFieldNames ? '' : 'layout')
    ..aOB(3, _omitFieldNames ? '' : 'audioOnly')
    ..aOB(4, _omitFieldNames ? '' : 'videoOnly')
    ..aOS(5, _omitFieldNames ? '' : 'customBaseUrl')
    ..aOM<EncodedFileOutput>(6, _omitFieldNames ? '' : 'file',
        subBuilder: EncodedFileOutput.create)
    ..aOM<StreamOutput>(7, _omitFieldNames ? '' : 'stream',
        subBuilder: StreamOutput.create)
    ..e<EncodingOptionsPreset>(
        8, _omitFieldNames ? '' : 'preset', $pb.PbFieldType.OE,
        defaultOrMaker: EncodingOptionsPreset.H264_720P_30,
        valueOf: EncodingOptionsPreset.valueOf,
        enumValues: EncodingOptionsPreset.values)
    ..aOM<EncodingOptions>(9, _omitFieldNames ? '' : 'advanced',
        subBuilder: EncodingOptions.create)
    ..aOM<SegmentedFileOutput>(10, _omitFieldNames ? '' : 'segments',
        subBuilder: SegmentedFileOutput.create)
    ..pc<EncodedFileOutput>(
        11, _omitFieldNames ? '' : 'fileOutputs', $pb.PbFieldType.PM,
        subBuilder: EncodedFileOutput.create)
    ..pc<StreamOutput>(
        12, _omitFieldNames ? '' : 'streamOutputs', $pb.PbFieldType.PM,
        subBuilder: StreamOutput.create)
    ..pc<SegmentedFileOutput>(
        13, _omitFieldNames ? '' : 'segmentOutputs', $pb.PbFieldType.PM,
        subBuilder: SegmentedFileOutput.create)
    ..pc<ImageOutput>(
        14, _omitFieldNames ? '' : 'imageOutputs', $pb.PbFieldType.PM,
        subBuilder: ImageOutput.create)
    ..e<AudioMixing>(
        15, _omitFieldNames ? '' : 'audioMixing', $pb.PbFieldType.OE,
        defaultOrMaker: AudioMixing.DEFAULT_MIXING,
        valueOf: AudioMixing.valueOf,
        enumValues: AudioMixing.values)
    ..pc<$0.WebhookConfig>(
        16, _omitFieldNames ? '' : 'webhooks', $pb.PbFieldType.PM,
        subBuilder: $0.WebhookConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomCompositeEgressRequest clone() =>
      RoomCompositeEgressRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomCompositeEgressRequest copyWith(
          void Function(RoomCompositeEgressRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RoomCompositeEgressRequest))
          as RoomCompositeEgressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomCompositeEgressRequest create() => RoomCompositeEgressRequest._();
  @$core.override
  RoomCompositeEgressRequest createEmptyInstance() => create();
  static $pb.PbList<RoomCompositeEgressRequest> createRepeated() =>
      $pb.PbList<RoomCompositeEgressRequest>();
  @$core.pragma('dart2js:noInline')
  static RoomCompositeEgressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCompositeEgressRequest>(create);
  static RoomCompositeEgressRequest? _defaultInstance;

  RoomCompositeEgressRequest_Output whichOutput() =>
      _RoomCompositeEgressRequest_OutputByTag[$_whichOneof(0)]!;
  void clearOutput() => $_clearField($_whichOneof(0));

  RoomCompositeEgressRequest_Options whichOptions() =>
      _RoomCompositeEgressRequest_OptionsByTag[$_whichOneof(1)]!;
  void clearOptions() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get layout => $_getSZ(1);
  @$pb.TagNumber(2)
  set layout($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLayout() => $_has(1);
  @$pb.TagNumber(2)
  void clearLayout() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get audioOnly => $_getBF(2);
  @$pb.TagNumber(3)
  set audioOnly($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAudioOnly() => $_has(2);
  @$pb.TagNumber(3)
  void clearAudioOnly() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get videoOnly => $_getBF(3);
  @$pb.TagNumber(4)
  set videoOnly($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVideoOnly() => $_has(3);
  @$pb.TagNumber(4)
  void clearVideoOnly() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get customBaseUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set customBaseUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCustomBaseUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearCustomBaseUrl() => $_clearField(5);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  EncodedFileOutput get file => $_getN(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set file(EncodedFileOutput value) => $_setField(6, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasFile() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearFile() => $_clearField(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  EncodedFileOutput ensureFile() => $_ensure(5);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  StreamOutput get stream => $_getN(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  set stream(StreamOutput value) => $_setField(7, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  $core.bool hasStream() => $_has(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  void clearStream() => $_clearField(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  StreamOutput ensureStream() => $_ensure(6);

  @$pb.TagNumber(8)
  EncodingOptionsPreset get preset => $_getN(7);
  @$pb.TagNumber(8)
  set preset(EncodingOptionsPreset value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasPreset() => $_has(7);
  @$pb.TagNumber(8)
  void clearPreset() => $_clearField(8);

  @$pb.TagNumber(9)
  EncodingOptions get advanced => $_getN(8);
  @$pb.TagNumber(9)
  set advanced(EncodingOptions value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasAdvanced() => $_has(8);
  @$pb.TagNumber(9)
  void clearAdvanced() => $_clearField(9);
  @$pb.TagNumber(9)
  EncodingOptions ensureAdvanced() => $_ensure(8);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  SegmentedFileOutput get segments => $_getN(9);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  set segments(SegmentedFileOutput value) => $_setField(10, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  $core.bool hasSegments() => $_has(9);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  void clearSegments() => $_clearField(10);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  SegmentedFileOutput ensureSegments() => $_ensure(9);

  @$pb.TagNumber(11)
  $pb.PbList<EncodedFileOutput> get fileOutputs => $_getList(10);

  @$pb.TagNumber(12)
  $pb.PbList<StreamOutput> get streamOutputs => $_getList(11);

  @$pb.TagNumber(13)
  $pb.PbList<SegmentedFileOutput> get segmentOutputs => $_getList(12);

  @$pb.TagNumber(14)
  $pb.PbList<ImageOutput> get imageOutputs => $_getList(13);

  @$pb.TagNumber(15)
  AudioMixing get audioMixing => $_getN(14);
  @$pb.TagNumber(15)
  set audioMixing(AudioMixing value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasAudioMixing() => $_has(14);
  @$pb.TagNumber(15)
  void clearAudioMixing() => $_clearField(15);

  @$pb.TagNumber(16)
  $pb.PbList<$0.WebhookConfig> get webhooks => $_getList(15);
}

enum WebEgressRequest_Output { file, stream, segments, notSet }

enum WebEgressRequest_Options { preset, advanced, notSet }

/// record any website
class WebEgressRequest extends $pb.GeneratedMessage {
  factory WebEgressRequest({
    $core.String? url,
    $core.bool? audioOnly,
    $core.bool? videoOnly,
    @$core.Deprecated('This field is deprecated.') EncodedFileOutput? file,
    @$core.Deprecated('This field is deprecated.') StreamOutput? stream,
    @$core.Deprecated('This field is deprecated.')
    SegmentedFileOutput? segments,
    EncodingOptionsPreset? preset,
    EncodingOptions? advanced,
    $core.Iterable<EncodedFileOutput>? fileOutputs,
    $core.Iterable<StreamOutput>? streamOutputs,
    $core.Iterable<SegmentedFileOutput>? segmentOutputs,
    $core.bool? awaitStartSignal,
    $core.Iterable<ImageOutput>? imageOutputs,
    $core.Iterable<$0.WebhookConfig>? webhooks,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (audioOnly != null) result.audioOnly = audioOnly;
    if (videoOnly != null) result.videoOnly = videoOnly;
    if (file != null) result.file = file;
    if (stream != null) result.stream = stream;
    if (segments != null) result.segments = segments;
    if (preset != null) result.preset = preset;
    if (advanced != null) result.advanced = advanced;
    if (fileOutputs != null) result.fileOutputs.addAll(fileOutputs);
    if (streamOutputs != null) result.streamOutputs.addAll(streamOutputs);
    if (segmentOutputs != null) result.segmentOutputs.addAll(segmentOutputs);
    if (awaitStartSignal != null) result.awaitStartSignal = awaitStartSignal;
    if (imageOutputs != null) result.imageOutputs.addAll(imageOutputs);
    if (webhooks != null) result.webhooks.addAll(webhooks);
    return result;
  }

  WebEgressRequest._();

  factory WebEgressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WebEgressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, WebEgressRequest_Output>
      _WebEgressRequest_OutputByTag = {
    4: WebEgressRequest_Output.file,
    5: WebEgressRequest_Output.stream,
    6: WebEgressRequest_Output.segments,
    0: WebEgressRequest_Output.notSet
  };
  static const $core.Map<$core.int, WebEgressRequest_Options>
      _WebEgressRequest_OptionsByTag = {
    7: WebEgressRequest_Options.preset,
    8: WebEgressRequest_Options.advanced,
    0: WebEgressRequest_Options.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WebEgressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [4, 5, 6])
    ..oo(1, [7, 8])
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOB(2, _omitFieldNames ? '' : 'audioOnly')
    ..aOB(3, _omitFieldNames ? '' : 'videoOnly')
    ..aOM<EncodedFileOutput>(4, _omitFieldNames ? '' : 'file',
        subBuilder: EncodedFileOutput.create)
    ..aOM<StreamOutput>(5, _omitFieldNames ? '' : 'stream',
        subBuilder: StreamOutput.create)
    ..aOM<SegmentedFileOutput>(6, _omitFieldNames ? '' : 'segments',
        subBuilder: SegmentedFileOutput.create)
    ..e<EncodingOptionsPreset>(
        7, _omitFieldNames ? '' : 'preset', $pb.PbFieldType.OE,
        defaultOrMaker: EncodingOptionsPreset.H264_720P_30,
        valueOf: EncodingOptionsPreset.valueOf,
        enumValues: EncodingOptionsPreset.values)
    ..aOM<EncodingOptions>(8, _omitFieldNames ? '' : 'advanced',
        subBuilder: EncodingOptions.create)
    ..pc<EncodedFileOutput>(
        9, _omitFieldNames ? '' : 'fileOutputs', $pb.PbFieldType.PM,
        subBuilder: EncodedFileOutput.create)
    ..pc<StreamOutput>(
        10, _omitFieldNames ? '' : 'streamOutputs', $pb.PbFieldType.PM,
        subBuilder: StreamOutput.create)
    ..pc<SegmentedFileOutput>(
        11, _omitFieldNames ? '' : 'segmentOutputs', $pb.PbFieldType.PM,
        subBuilder: SegmentedFileOutput.create)
    ..aOB(12, _omitFieldNames ? '' : 'awaitStartSignal')
    ..pc<ImageOutput>(
        13, _omitFieldNames ? '' : 'imageOutputs', $pb.PbFieldType.PM,
        subBuilder: ImageOutput.create)
    ..pc<$0.WebhookConfig>(
        14, _omitFieldNames ? '' : 'webhooks', $pb.PbFieldType.PM,
        subBuilder: $0.WebhookConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebEgressRequest clone() => WebEgressRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebEgressRequest copyWith(void Function(WebEgressRequest) updates) =>
      super.copyWith((message) => updates(message as WebEgressRequest))
          as WebEgressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WebEgressRequest create() => WebEgressRequest._();
  @$core.override
  WebEgressRequest createEmptyInstance() => create();
  static $pb.PbList<WebEgressRequest> createRepeated() =>
      $pb.PbList<WebEgressRequest>();
  @$core.pragma('dart2js:noInline')
  static WebEgressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WebEgressRequest>(create);
  static WebEgressRequest? _defaultInstance;

  WebEgressRequest_Output whichOutput() =>
      _WebEgressRequest_OutputByTag[$_whichOneof(0)]!;
  void clearOutput() => $_clearField($_whichOneof(0));

  WebEgressRequest_Options whichOptions() =>
      _WebEgressRequest_OptionsByTag[$_whichOneof(1)]!;
  void clearOptions() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get audioOnly => $_getBF(1);
  @$pb.TagNumber(2)
  set audioOnly($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAudioOnly() => $_has(1);
  @$pb.TagNumber(2)
  void clearAudioOnly() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get videoOnly => $_getBF(2);
  @$pb.TagNumber(3)
  set videoOnly($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVideoOnly() => $_has(2);
  @$pb.TagNumber(3)
  void clearVideoOnly() => $_clearField(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  EncodedFileOutput get file => $_getN(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set file(EncodedFileOutput value) => $_setField(4, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasFile() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearFile() => $_clearField(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  EncodedFileOutput ensureFile() => $_ensure(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  StreamOutput get stream => $_getN(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set stream(StreamOutput value) => $_setField(5, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasStream() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearStream() => $_clearField(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  StreamOutput ensureStream() => $_ensure(4);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  SegmentedFileOutput get segments => $_getN(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set segments(SegmentedFileOutput value) => $_setField(6, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasSegments() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearSegments() => $_clearField(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  SegmentedFileOutput ensureSegments() => $_ensure(5);

  @$pb.TagNumber(7)
  EncodingOptionsPreset get preset => $_getN(6);
  @$pb.TagNumber(7)
  set preset(EncodingOptionsPreset value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasPreset() => $_has(6);
  @$pb.TagNumber(7)
  void clearPreset() => $_clearField(7);

  @$pb.TagNumber(8)
  EncodingOptions get advanced => $_getN(7);
  @$pb.TagNumber(8)
  set advanced(EncodingOptions value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasAdvanced() => $_has(7);
  @$pb.TagNumber(8)
  void clearAdvanced() => $_clearField(8);
  @$pb.TagNumber(8)
  EncodingOptions ensureAdvanced() => $_ensure(7);

  @$pb.TagNumber(9)
  $pb.PbList<EncodedFileOutput> get fileOutputs => $_getList(8);

  @$pb.TagNumber(10)
  $pb.PbList<StreamOutput> get streamOutputs => $_getList(9);

  @$pb.TagNumber(11)
  $pb.PbList<SegmentedFileOutput> get segmentOutputs => $_getList(10);

  @$pb.TagNumber(12)
  $core.bool get awaitStartSignal => $_getBF(11);
  @$pb.TagNumber(12)
  set awaitStartSignal($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasAwaitStartSignal() => $_has(11);
  @$pb.TagNumber(12)
  void clearAwaitStartSignal() => $_clearField(12);

  @$pb.TagNumber(13)
  $pb.PbList<ImageOutput> get imageOutputs => $_getList(12);

  @$pb.TagNumber(14)
  $pb.PbList<$0.WebhookConfig> get webhooks => $_getList(13);
}

enum ParticipantEgressRequest_Options { preset, advanced, notSet }

/// record audio and video from a single participant
class ParticipantEgressRequest extends $pb.GeneratedMessage {
  factory ParticipantEgressRequest({
    $core.String? roomName,
    $core.String? identity,
    $core.bool? screenShare,
    EncodingOptionsPreset? preset,
    EncodingOptions? advanced,
    $core.Iterable<EncodedFileOutput>? fileOutputs,
    $core.Iterable<StreamOutput>? streamOutputs,
    $core.Iterable<SegmentedFileOutput>? segmentOutputs,
    $core.Iterable<ImageOutput>? imageOutputs,
    $core.Iterable<$0.WebhookConfig>? webhooks,
  }) {
    final result = create();
    if (roomName != null) result.roomName = roomName;
    if (identity != null) result.identity = identity;
    if (screenShare != null) result.screenShare = screenShare;
    if (preset != null) result.preset = preset;
    if (advanced != null) result.advanced = advanced;
    if (fileOutputs != null) result.fileOutputs.addAll(fileOutputs);
    if (streamOutputs != null) result.streamOutputs.addAll(streamOutputs);
    if (segmentOutputs != null) result.segmentOutputs.addAll(segmentOutputs);
    if (imageOutputs != null) result.imageOutputs.addAll(imageOutputs);
    if (webhooks != null) result.webhooks.addAll(webhooks);
    return result;
  }

  ParticipantEgressRequest._();

  factory ParticipantEgressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParticipantEgressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ParticipantEgressRequest_Options>
      _ParticipantEgressRequest_OptionsByTag = {
    4: ParticipantEgressRequest_Options.preset,
    5: ParticipantEgressRequest_Options.advanced,
    0: ParticipantEgressRequest_Options.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParticipantEgressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [4, 5])
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOS(2, _omitFieldNames ? '' : 'identity')
    ..aOB(3, _omitFieldNames ? '' : 'screenShare')
    ..e<EncodingOptionsPreset>(
        4, _omitFieldNames ? '' : 'preset', $pb.PbFieldType.OE,
        defaultOrMaker: EncodingOptionsPreset.H264_720P_30,
        valueOf: EncodingOptionsPreset.valueOf,
        enumValues: EncodingOptionsPreset.values)
    ..aOM<EncodingOptions>(5, _omitFieldNames ? '' : 'advanced',
        subBuilder: EncodingOptions.create)
    ..pc<EncodedFileOutput>(
        6, _omitFieldNames ? '' : 'fileOutputs', $pb.PbFieldType.PM,
        subBuilder: EncodedFileOutput.create)
    ..pc<StreamOutput>(
        7, _omitFieldNames ? '' : 'streamOutputs', $pb.PbFieldType.PM,
        subBuilder: StreamOutput.create)
    ..pc<SegmentedFileOutput>(
        8, _omitFieldNames ? '' : 'segmentOutputs', $pb.PbFieldType.PM,
        subBuilder: SegmentedFileOutput.create)
    ..pc<ImageOutput>(
        9, _omitFieldNames ? '' : 'imageOutputs', $pb.PbFieldType.PM,
        subBuilder: ImageOutput.create)
    ..pc<$0.WebhookConfig>(
        10, _omitFieldNames ? '' : 'webhooks', $pb.PbFieldType.PM,
        subBuilder: $0.WebhookConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParticipantEgressRequest clone() =>
      ParticipantEgressRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParticipantEgressRequest copyWith(
          void Function(ParticipantEgressRequest) updates) =>
      super.copyWith((message) => updates(message as ParticipantEgressRequest))
          as ParticipantEgressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParticipantEgressRequest create() => ParticipantEgressRequest._();
  @$core.override
  ParticipantEgressRequest createEmptyInstance() => create();
  static $pb.PbList<ParticipantEgressRequest> createRepeated() =>
      $pb.PbList<ParticipantEgressRequest>();
  @$core.pragma('dart2js:noInline')
  static ParticipantEgressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParticipantEgressRequest>(create);
  static ParticipantEgressRequest? _defaultInstance;

  ParticipantEgressRequest_Options whichOptions() =>
      _ParticipantEgressRequest_OptionsByTag[$_whichOneof(0)]!;
  void clearOptions() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get identity => $_getSZ(1);
  @$pb.TagNumber(2)
  set identity($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentity() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get screenShare => $_getBF(2);
  @$pb.TagNumber(3)
  set screenShare($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasScreenShare() => $_has(2);
  @$pb.TagNumber(3)
  void clearScreenShare() => $_clearField(3);

  @$pb.TagNumber(4)
  EncodingOptionsPreset get preset => $_getN(3);
  @$pb.TagNumber(4)
  set preset(EncodingOptionsPreset value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPreset() => $_has(3);
  @$pb.TagNumber(4)
  void clearPreset() => $_clearField(4);

  @$pb.TagNumber(5)
  EncodingOptions get advanced => $_getN(4);
  @$pb.TagNumber(5)
  set advanced(EncodingOptions value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasAdvanced() => $_has(4);
  @$pb.TagNumber(5)
  void clearAdvanced() => $_clearField(5);
  @$pb.TagNumber(5)
  EncodingOptions ensureAdvanced() => $_ensure(4);

  @$pb.TagNumber(6)
  $pb.PbList<EncodedFileOutput> get fileOutputs => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<StreamOutput> get streamOutputs => $_getList(6);

  @$pb.TagNumber(8)
  $pb.PbList<SegmentedFileOutput> get segmentOutputs => $_getList(7);

  @$pb.TagNumber(9)
  $pb.PbList<ImageOutput> get imageOutputs => $_getList(8);

  @$pb.TagNumber(10)
  $pb.PbList<$0.WebhookConfig> get webhooks => $_getList(9);
}

enum TrackCompositeEgressRequest_Output { file, stream, segments, notSet }

enum TrackCompositeEgressRequest_Options { preset, advanced, notSet }

/// containerize up to one audio and one video track
class TrackCompositeEgressRequest extends $pb.GeneratedMessage {
  factory TrackCompositeEgressRequest({
    $core.String? roomName,
    $core.String? audioTrackId,
    $core.String? videoTrackId,
    @$core.Deprecated('This field is deprecated.') EncodedFileOutput? file,
    @$core.Deprecated('This field is deprecated.') StreamOutput? stream,
    EncodingOptionsPreset? preset,
    EncodingOptions? advanced,
    @$core.Deprecated('This field is deprecated.')
    SegmentedFileOutput? segments,
    $core.Iterable<EncodedFileOutput>? fileOutputs,
    $core.Iterable<StreamOutput>? streamOutputs,
    $core.Iterable<SegmentedFileOutput>? segmentOutputs,
    $core.Iterable<ImageOutput>? imageOutputs,
    $core.Iterable<$0.WebhookConfig>? webhooks,
  }) {
    final result = create();
    if (roomName != null) result.roomName = roomName;
    if (audioTrackId != null) result.audioTrackId = audioTrackId;
    if (videoTrackId != null) result.videoTrackId = videoTrackId;
    if (file != null) result.file = file;
    if (stream != null) result.stream = stream;
    if (preset != null) result.preset = preset;
    if (advanced != null) result.advanced = advanced;
    if (segments != null) result.segments = segments;
    if (fileOutputs != null) result.fileOutputs.addAll(fileOutputs);
    if (streamOutputs != null) result.streamOutputs.addAll(streamOutputs);
    if (segmentOutputs != null) result.segmentOutputs.addAll(segmentOutputs);
    if (imageOutputs != null) result.imageOutputs.addAll(imageOutputs);
    if (webhooks != null) result.webhooks.addAll(webhooks);
    return result;
  }

  TrackCompositeEgressRequest._();

  factory TrackCompositeEgressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrackCompositeEgressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, TrackCompositeEgressRequest_Output>
      _TrackCompositeEgressRequest_OutputByTag = {
    4: TrackCompositeEgressRequest_Output.file,
    5: TrackCompositeEgressRequest_Output.stream,
    8: TrackCompositeEgressRequest_Output.segments,
    0: TrackCompositeEgressRequest_Output.notSet
  };
  static const $core.Map<$core.int, TrackCompositeEgressRequest_Options>
      _TrackCompositeEgressRequest_OptionsByTag = {
    6: TrackCompositeEgressRequest_Options.preset,
    7: TrackCompositeEgressRequest_Options.advanced,
    0: TrackCompositeEgressRequest_Options.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrackCompositeEgressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [4, 5, 8])
    ..oo(1, [6, 7])
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOS(2, _omitFieldNames ? '' : 'audioTrackId')
    ..aOS(3, _omitFieldNames ? '' : 'videoTrackId')
    ..aOM<EncodedFileOutput>(4, _omitFieldNames ? '' : 'file',
        subBuilder: EncodedFileOutput.create)
    ..aOM<StreamOutput>(5, _omitFieldNames ? '' : 'stream',
        subBuilder: StreamOutput.create)
    ..e<EncodingOptionsPreset>(
        6, _omitFieldNames ? '' : 'preset', $pb.PbFieldType.OE,
        defaultOrMaker: EncodingOptionsPreset.H264_720P_30,
        valueOf: EncodingOptionsPreset.valueOf,
        enumValues: EncodingOptionsPreset.values)
    ..aOM<EncodingOptions>(7, _omitFieldNames ? '' : 'advanced',
        subBuilder: EncodingOptions.create)
    ..aOM<SegmentedFileOutput>(8, _omitFieldNames ? '' : 'segments',
        subBuilder: SegmentedFileOutput.create)
    ..pc<EncodedFileOutput>(
        11, _omitFieldNames ? '' : 'fileOutputs', $pb.PbFieldType.PM,
        subBuilder: EncodedFileOutput.create)
    ..pc<StreamOutput>(
        12, _omitFieldNames ? '' : 'streamOutputs', $pb.PbFieldType.PM,
        subBuilder: StreamOutput.create)
    ..pc<SegmentedFileOutput>(
        13, _omitFieldNames ? '' : 'segmentOutputs', $pb.PbFieldType.PM,
        subBuilder: SegmentedFileOutput.create)
    ..pc<ImageOutput>(
        14, _omitFieldNames ? '' : 'imageOutputs', $pb.PbFieldType.PM,
        subBuilder: ImageOutput.create)
    ..pc<$0.WebhookConfig>(
        15, _omitFieldNames ? '' : 'webhooks', $pb.PbFieldType.PM,
        subBuilder: $0.WebhookConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrackCompositeEgressRequest clone() =>
      TrackCompositeEgressRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrackCompositeEgressRequest copyWith(
          void Function(TrackCompositeEgressRequest) updates) =>
      super.copyWith(
              (message) => updates(message as TrackCompositeEgressRequest))
          as TrackCompositeEgressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrackCompositeEgressRequest create() =>
      TrackCompositeEgressRequest._();
  @$core.override
  TrackCompositeEgressRequest createEmptyInstance() => create();
  static $pb.PbList<TrackCompositeEgressRequest> createRepeated() =>
      $pb.PbList<TrackCompositeEgressRequest>();
  @$core.pragma('dart2js:noInline')
  static TrackCompositeEgressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrackCompositeEgressRequest>(create);
  static TrackCompositeEgressRequest? _defaultInstance;

  TrackCompositeEgressRequest_Output whichOutput() =>
      _TrackCompositeEgressRequest_OutputByTag[$_whichOneof(0)]!;
  void clearOutput() => $_clearField($_whichOneof(0));

  TrackCompositeEgressRequest_Options whichOptions() =>
      _TrackCompositeEgressRequest_OptionsByTag[$_whichOneof(1)]!;
  void clearOptions() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get audioTrackId => $_getSZ(1);
  @$pb.TagNumber(2)
  set audioTrackId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAudioTrackId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAudioTrackId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get videoTrackId => $_getSZ(2);
  @$pb.TagNumber(3)
  set videoTrackId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVideoTrackId() => $_has(2);
  @$pb.TagNumber(3)
  void clearVideoTrackId() => $_clearField(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  EncodedFileOutput get file => $_getN(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set file(EncodedFileOutput value) => $_setField(4, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasFile() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearFile() => $_clearField(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  EncodedFileOutput ensureFile() => $_ensure(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  StreamOutput get stream => $_getN(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set stream(StreamOutput value) => $_setField(5, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasStream() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearStream() => $_clearField(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  StreamOutput ensureStream() => $_ensure(4);

  @$pb.TagNumber(6)
  EncodingOptionsPreset get preset => $_getN(5);
  @$pb.TagNumber(6)
  set preset(EncodingOptionsPreset value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasPreset() => $_has(5);
  @$pb.TagNumber(6)
  void clearPreset() => $_clearField(6);

  @$pb.TagNumber(7)
  EncodingOptions get advanced => $_getN(6);
  @$pb.TagNumber(7)
  set advanced(EncodingOptions value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasAdvanced() => $_has(6);
  @$pb.TagNumber(7)
  void clearAdvanced() => $_clearField(7);
  @$pb.TagNumber(7)
  EncodingOptions ensureAdvanced() => $_ensure(6);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  SegmentedFileOutput get segments => $_getN(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  set segments(SegmentedFileOutput value) => $_setField(8, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.bool hasSegments() => $_has(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  void clearSegments() => $_clearField(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  SegmentedFileOutput ensureSegments() => $_ensure(7);

  @$pb.TagNumber(11)
  $pb.PbList<EncodedFileOutput> get fileOutputs => $_getList(8);

  @$pb.TagNumber(12)
  $pb.PbList<StreamOutput> get streamOutputs => $_getList(9);

  @$pb.TagNumber(13)
  $pb.PbList<SegmentedFileOutput> get segmentOutputs => $_getList(10);

  @$pb.TagNumber(14)
  $pb.PbList<ImageOutput> get imageOutputs => $_getList(11);

  @$pb.TagNumber(15)
  $pb.PbList<$0.WebhookConfig> get webhooks => $_getList(12);
}

enum TrackEgressRequest_Output { file, websocketUrl, notSet }

/// record tracks individually, without transcoding
class TrackEgressRequest extends $pb.GeneratedMessage {
  factory TrackEgressRequest({
    $core.String? roomName,
    $core.String? trackId,
    DirectFileOutput? file,
    $core.String? websocketUrl,
    $core.Iterable<$0.WebhookConfig>? webhooks,
  }) {
    final result = create();
    if (roomName != null) result.roomName = roomName;
    if (trackId != null) result.trackId = trackId;
    if (file != null) result.file = file;
    if (websocketUrl != null) result.websocketUrl = websocketUrl;
    if (webhooks != null) result.webhooks.addAll(webhooks);
    return result;
  }

  TrackEgressRequest._();

  factory TrackEgressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrackEgressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, TrackEgressRequest_Output>
      _TrackEgressRequest_OutputByTag = {
    3: TrackEgressRequest_Output.file,
    4: TrackEgressRequest_Output.websocketUrl,
    0: TrackEgressRequest_Output.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrackEgressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOS(2, _omitFieldNames ? '' : 'trackId')
    ..aOM<DirectFileOutput>(3, _omitFieldNames ? '' : 'file',
        subBuilder: DirectFileOutput.create)
    ..aOS(4, _omitFieldNames ? '' : 'websocketUrl')
    ..pc<$0.WebhookConfig>(
        5, _omitFieldNames ? '' : 'webhooks', $pb.PbFieldType.PM,
        subBuilder: $0.WebhookConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrackEgressRequest clone() => TrackEgressRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrackEgressRequest copyWith(void Function(TrackEgressRequest) updates) =>
      super.copyWith((message) => updates(message as TrackEgressRequest))
          as TrackEgressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrackEgressRequest create() => TrackEgressRequest._();
  @$core.override
  TrackEgressRequest createEmptyInstance() => create();
  static $pb.PbList<TrackEgressRequest> createRepeated() =>
      $pb.PbList<TrackEgressRequest>();
  @$core.pragma('dart2js:noInline')
  static TrackEgressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrackEgressRequest>(create);
  static TrackEgressRequest? _defaultInstance;

  TrackEgressRequest_Output whichOutput() =>
      _TrackEgressRequest_OutputByTag[$_whichOneof(0)]!;
  void clearOutput() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get trackId => $_getSZ(1);
  @$pb.TagNumber(2)
  set trackId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTrackId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTrackId() => $_clearField(2);

  @$pb.TagNumber(3)
  DirectFileOutput get file => $_getN(2);
  @$pb.TagNumber(3)
  set file(DirectFileOutput value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFile() => $_has(2);
  @$pb.TagNumber(3)
  void clearFile() => $_clearField(3);
  @$pb.TagNumber(3)
  DirectFileOutput ensureFile() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get websocketUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set websocketUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWebsocketUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearWebsocketUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$0.WebhookConfig> get webhooks => $_getList(4);
}

enum EncodedFileOutput_Output { s3, gcp, azure, aliOSS, notSet }

class EncodedFileOutput extends $pb.GeneratedMessage {
  factory EncodedFileOutput({
    EncodedFileType? fileType,
    $core.String? filepath,
    S3Upload? s3,
    GCPUpload? gcp,
    AzureBlobUpload? azure,
    $core.bool? disableManifest,
    AliOSSUpload? aliOSS,
  }) {
    final result = create();
    if (fileType != null) result.fileType = fileType;
    if (filepath != null) result.filepath = filepath;
    if (s3 != null) result.s3 = s3;
    if (gcp != null) result.gcp = gcp;
    if (azure != null) result.azure = azure;
    if (disableManifest != null) result.disableManifest = disableManifest;
    if (aliOSS != null) result.aliOSS = aliOSS;
    return result;
  }

  EncodedFileOutput._();

  factory EncodedFileOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EncodedFileOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, EncodedFileOutput_Output>
      _EncodedFileOutput_OutputByTag = {
    3: EncodedFileOutput_Output.s3,
    4: EncodedFileOutput_Output.gcp,
    5: EncodedFileOutput_Output.azure,
    7: EncodedFileOutput_Output.aliOSS,
    0: EncodedFileOutput_Output.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EncodedFileOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 7])
    ..e<EncodedFileType>(
        1, _omitFieldNames ? '' : 'fileType', $pb.PbFieldType.OE,
        defaultOrMaker: EncodedFileType.DEFAULT_FILETYPE,
        valueOf: EncodedFileType.valueOf,
        enumValues: EncodedFileType.values)
    ..aOS(2, _omitFieldNames ? '' : 'filepath')
    ..aOM<S3Upload>(3, _omitFieldNames ? '' : 's3', subBuilder: S3Upload.create)
    ..aOM<GCPUpload>(4, _omitFieldNames ? '' : 'gcp',
        subBuilder: GCPUpload.create)
    ..aOM<AzureBlobUpload>(5, _omitFieldNames ? '' : 'azure',
        subBuilder: AzureBlobUpload.create)
    ..aOB(6, _omitFieldNames ? '' : 'disableManifest')
    ..aOM<AliOSSUpload>(7, _omitFieldNames ? '' : 'aliOSS',
        protoName: 'aliOSS', subBuilder: AliOSSUpload.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EncodedFileOutput clone() => EncodedFileOutput()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EncodedFileOutput copyWith(void Function(EncodedFileOutput) updates) =>
      super.copyWith((message) => updates(message as EncodedFileOutput))
          as EncodedFileOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EncodedFileOutput create() => EncodedFileOutput._();
  @$core.override
  EncodedFileOutput createEmptyInstance() => create();
  static $pb.PbList<EncodedFileOutput> createRepeated() =>
      $pb.PbList<EncodedFileOutput>();
  @$core.pragma('dart2js:noInline')
  static EncodedFileOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EncodedFileOutput>(create);
  static EncodedFileOutput? _defaultInstance;

  EncodedFileOutput_Output whichOutput() =>
      _EncodedFileOutput_OutputByTag[$_whichOneof(0)]!;
  void clearOutput() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  EncodedFileType get fileType => $_getN(0);
  @$pb.TagNumber(1)
  set fileType(EncodedFileType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFileType() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get filepath => $_getSZ(1);
  @$pb.TagNumber(2)
  set filepath($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFilepath() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilepath() => $_clearField(2);

  @$pb.TagNumber(3)
  S3Upload get s3 => $_getN(2);
  @$pb.TagNumber(3)
  set s3(S3Upload value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasS3() => $_has(2);
  @$pb.TagNumber(3)
  void clearS3() => $_clearField(3);
  @$pb.TagNumber(3)
  S3Upload ensureS3() => $_ensure(2);

  @$pb.TagNumber(4)
  GCPUpload get gcp => $_getN(3);
  @$pb.TagNumber(4)
  set gcp(GCPUpload value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasGcp() => $_has(3);
  @$pb.TagNumber(4)
  void clearGcp() => $_clearField(4);
  @$pb.TagNumber(4)
  GCPUpload ensureGcp() => $_ensure(3);

  @$pb.TagNumber(5)
  AzureBlobUpload get azure => $_getN(4);
  @$pb.TagNumber(5)
  set azure(AzureBlobUpload value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasAzure() => $_has(4);
  @$pb.TagNumber(5)
  void clearAzure() => $_clearField(5);
  @$pb.TagNumber(5)
  AzureBlobUpload ensureAzure() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.bool get disableManifest => $_getBF(5);
  @$pb.TagNumber(6)
  set disableManifest($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDisableManifest() => $_has(5);
  @$pb.TagNumber(6)
  void clearDisableManifest() => $_clearField(6);

  @$pb.TagNumber(7)
  AliOSSUpload get aliOSS => $_getN(6);
  @$pb.TagNumber(7)
  set aliOSS(AliOSSUpload value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasAliOSS() => $_has(6);
  @$pb.TagNumber(7)
  void clearAliOSS() => $_clearField(7);
  @$pb.TagNumber(7)
  AliOSSUpload ensureAliOSS() => $_ensure(6);
}

enum SegmentedFileOutput_Output { s3, gcp, azure, aliOSS, notSet }

/// Used to generate HLS segments or other kind of segmented output
class SegmentedFileOutput extends $pb.GeneratedMessage {
  factory SegmentedFileOutput({
    SegmentedFileProtocol? protocol,
    $core.String? filenamePrefix,
    $core.String? playlistName,
    $core.int? segmentDuration,
    S3Upload? s3,
    GCPUpload? gcp,
    AzureBlobUpload? azure,
    $core.bool? disableManifest,
    AliOSSUpload? aliOSS,
    SegmentedFileSuffix? filenameSuffix,
    $core.String? livePlaylistName,
  }) {
    final result = create();
    if (protocol != null) result.protocol = protocol;
    if (filenamePrefix != null) result.filenamePrefix = filenamePrefix;
    if (playlistName != null) result.playlistName = playlistName;
    if (segmentDuration != null) result.segmentDuration = segmentDuration;
    if (s3 != null) result.s3 = s3;
    if (gcp != null) result.gcp = gcp;
    if (azure != null) result.azure = azure;
    if (disableManifest != null) result.disableManifest = disableManifest;
    if (aliOSS != null) result.aliOSS = aliOSS;
    if (filenameSuffix != null) result.filenameSuffix = filenameSuffix;
    if (livePlaylistName != null) result.livePlaylistName = livePlaylistName;
    return result;
  }

  SegmentedFileOutput._();

  factory SegmentedFileOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SegmentedFileOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SegmentedFileOutput_Output>
      _SegmentedFileOutput_OutputByTag = {
    5: SegmentedFileOutput_Output.s3,
    6: SegmentedFileOutput_Output.gcp,
    7: SegmentedFileOutput_Output.azure,
    9: SegmentedFileOutput_Output.aliOSS,
    0: SegmentedFileOutput_Output.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SegmentedFileOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [5, 6, 7, 9])
    ..e<SegmentedFileProtocol>(
        1, _omitFieldNames ? '' : 'protocol', $pb.PbFieldType.OE,
        defaultOrMaker: SegmentedFileProtocol.DEFAULT_SEGMENTED_FILE_PROTOCOL,
        valueOf: SegmentedFileProtocol.valueOf,
        enumValues: SegmentedFileProtocol.values)
    ..aOS(2, _omitFieldNames ? '' : 'filenamePrefix')
    ..aOS(3, _omitFieldNames ? '' : 'playlistName')
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'segmentDuration', $pb.PbFieldType.OU3)
    ..aOM<S3Upload>(5, _omitFieldNames ? '' : 's3', subBuilder: S3Upload.create)
    ..aOM<GCPUpload>(6, _omitFieldNames ? '' : 'gcp',
        subBuilder: GCPUpload.create)
    ..aOM<AzureBlobUpload>(7, _omitFieldNames ? '' : 'azure',
        subBuilder: AzureBlobUpload.create)
    ..aOB(8, _omitFieldNames ? '' : 'disableManifest')
    ..aOM<AliOSSUpload>(9, _omitFieldNames ? '' : 'aliOSS',
        protoName: 'aliOSS', subBuilder: AliOSSUpload.create)
    ..e<SegmentedFileSuffix>(
        10, _omitFieldNames ? '' : 'filenameSuffix', $pb.PbFieldType.OE,
        defaultOrMaker: SegmentedFileSuffix.INDEX,
        valueOf: SegmentedFileSuffix.valueOf,
        enumValues: SegmentedFileSuffix.values)
    ..aOS(11, _omitFieldNames ? '' : 'livePlaylistName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SegmentedFileOutput clone() => SegmentedFileOutput()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SegmentedFileOutput copyWith(void Function(SegmentedFileOutput) updates) =>
      super.copyWith((message) => updates(message as SegmentedFileOutput))
          as SegmentedFileOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SegmentedFileOutput create() => SegmentedFileOutput._();
  @$core.override
  SegmentedFileOutput createEmptyInstance() => create();
  static $pb.PbList<SegmentedFileOutput> createRepeated() =>
      $pb.PbList<SegmentedFileOutput>();
  @$core.pragma('dart2js:noInline')
  static SegmentedFileOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SegmentedFileOutput>(create);
  static SegmentedFileOutput? _defaultInstance;

  SegmentedFileOutput_Output whichOutput() =>
      _SegmentedFileOutput_OutputByTag[$_whichOneof(0)]!;
  void clearOutput() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  SegmentedFileProtocol get protocol => $_getN(0);
  @$pb.TagNumber(1)
  set protocol(SegmentedFileProtocol value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProtocol() => $_has(0);
  @$pb.TagNumber(1)
  void clearProtocol() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get filenamePrefix => $_getSZ(1);
  @$pb.TagNumber(2)
  set filenamePrefix($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFilenamePrefix() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilenamePrefix() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get playlistName => $_getSZ(2);
  @$pb.TagNumber(3)
  set playlistName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPlaylistName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlaylistName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get segmentDuration => $_getIZ(3);
  @$pb.TagNumber(4)
  set segmentDuration($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSegmentDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearSegmentDuration() => $_clearField(4);

  @$pb.TagNumber(5)
  S3Upload get s3 => $_getN(4);
  @$pb.TagNumber(5)
  set s3(S3Upload value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasS3() => $_has(4);
  @$pb.TagNumber(5)
  void clearS3() => $_clearField(5);
  @$pb.TagNumber(5)
  S3Upload ensureS3() => $_ensure(4);

  @$pb.TagNumber(6)
  GCPUpload get gcp => $_getN(5);
  @$pb.TagNumber(6)
  set gcp(GCPUpload value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasGcp() => $_has(5);
  @$pb.TagNumber(6)
  void clearGcp() => $_clearField(6);
  @$pb.TagNumber(6)
  GCPUpload ensureGcp() => $_ensure(5);

  @$pb.TagNumber(7)
  AzureBlobUpload get azure => $_getN(6);
  @$pb.TagNumber(7)
  set azure(AzureBlobUpload value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasAzure() => $_has(6);
  @$pb.TagNumber(7)
  void clearAzure() => $_clearField(7);
  @$pb.TagNumber(7)
  AzureBlobUpload ensureAzure() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.bool get disableManifest => $_getBF(7);
  @$pb.TagNumber(8)
  set disableManifest($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDisableManifest() => $_has(7);
  @$pb.TagNumber(8)
  void clearDisableManifest() => $_clearField(8);

  @$pb.TagNumber(9)
  AliOSSUpload get aliOSS => $_getN(8);
  @$pb.TagNumber(9)
  set aliOSS(AliOSSUpload value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasAliOSS() => $_has(8);
  @$pb.TagNumber(9)
  void clearAliOSS() => $_clearField(9);
  @$pb.TagNumber(9)
  AliOSSUpload ensureAliOSS() => $_ensure(8);

  @$pb.TagNumber(10)
  SegmentedFileSuffix get filenameSuffix => $_getN(9);
  @$pb.TagNumber(10)
  set filenameSuffix(SegmentedFileSuffix value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasFilenameSuffix() => $_has(9);
  @$pb.TagNumber(10)
  void clearFilenameSuffix() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get livePlaylistName => $_getSZ(10);
  @$pb.TagNumber(11)
  set livePlaylistName($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasLivePlaylistName() => $_has(10);
  @$pb.TagNumber(11)
  void clearLivePlaylistName() => $_clearField(11);
}

enum DirectFileOutput_Output { s3, gcp, azure, aliOSS, notSet }

class DirectFileOutput extends $pb.GeneratedMessage {
  factory DirectFileOutput({
    $core.String? filepath,
    S3Upload? s3,
    GCPUpload? gcp,
    AzureBlobUpload? azure,
    $core.bool? disableManifest,
    AliOSSUpload? aliOSS,
  }) {
    final result = create();
    if (filepath != null) result.filepath = filepath;
    if (s3 != null) result.s3 = s3;
    if (gcp != null) result.gcp = gcp;
    if (azure != null) result.azure = azure;
    if (disableManifest != null) result.disableManifest = disableManifest;
    if (aliOSS != null) result.aliOSS = aliOSS;
    return result;
  }

  DirectFileOutput._();

  factory DirectFileOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DirectFileOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, DirectFileOutput_Output>
      _DirectFileOutput_OutputByTag = {
    2: DirectFileOutput_Output.s3,
    3: DirectFileOutput_Output.gcp,
    4: DirectFileOutput_Output.azure,
    6: DirectFileOutput_Output.aliOSS,
    0: DirectFileOutput_Output.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DirectFileOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 6])
    ..aOS(1, _omitFieldNames ? '' : 'filepath')
    ..aOM<S3Upload>(2, _omitFieldNames ? '' : 's3', subBuilder: S3Upload.create)
    ..aOM<GCPUpload>(3, _omitFieldNames ? '' : 'gcp',
        subBuilder: GCPUpload.create)
    ..aOM<AzureBlobUpload>(4, _omitFieldNames ? '' : 'azure',
        subBuilder: AzureBlobUpload.create)
    ..aOB(5, _omitFieldNames ? '' : 'disableManifest')
    ..aOM<AliOSSUpload>(6, _omitFieldNames ? '' : 'aliOSS',
        protoName: 'aliOSS', subBuilder: AliOSSUpload.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectFileOutput clone() => DirectFileOutput()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectFileOutput copyWith(void Function(DirectFileOutput) updates) =>
      super.copyWith((message) => updates(message as DirectFileOutput))
          as DirectFileOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DirectFileOutput create() => DirectFileOutput._();
  @$core.override
  DirectFileOutput createEmptyInstance() => create();
  static $pb.PbList<DirectFileOutput> createRepeated() =>
      $pb.PbList<DirectFileOutput>();
  @$core.pragma('dart2js:noInline')
  static DirectFileOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DirectFileOutput>(create);
  static DirectFileOutput? _defaultInstance;

  DirectFileOutput_Output whichOutput() =>
      _DirectFileOutput_OutputByTag[$_whichOneof(0)]!;
  void clearOutput() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get filepath => $_getSZ(0);
  @$pb.TagNumber(1)
  set filepath($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFilepath() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilepath() => $_clearField(1);

  @$pb.TagNumber(2)
  S3Upload get s3 => $_getN(1);
  @$pb.TagNumber(2)
  set s3(S3Upload value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasS3() => $_has(1);
  @$pb.TagNumber(2)
  void clearS3() => $_clearField(2);
  @$pb.TagNumber(2)
  S3Upload ensureS3() => $_ensure(1);

  @$pb.TagNumber(3)
  GCPUpload get gcp => $_getN(2);
  @$pb.TagNumber(3)
  set gcp(GCPUpload value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGcp() => $_has(2);
  @$pb.TagNumber(3)
  void clearGcp() => $_clearField(3);
  @$pb.TagNumber(3)
  GCPUpload ensureGcp() => $_ensure(2);

  @$pb.TagNumber(4)
  AzureBlobUpload get azure => $_getN(3);
  @$pb.TagNumber(4)
  set azure(AzureBlobUpload value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAzure() => $_has(3);
  @$pb.TagNumber(4)
  void clearAzure() => $_clearField(4);
  @$pb.TagNumber(4)
  AzureBlobUpload ensureAzure() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get disableManifest => $_getBF(4);
  @$pb.TagNumber(5)
  set disableManifest($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDisableManifest() => $_has(4);
  @$pb.TagNumber(5)
  void clearDisableManifest() => $_clearField(5);

  @$pb.TagNumber(6)
  AliOSSUpload get aliOSS => $_getN(5);
  @$pb.TagNumber(6)
  set aliOSS(AliOSSUpload value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasAliOSS() => $_has(5);
  @$pb.TagNumber(6)
  void clearAliOSS() => $_clearField(6);
  @$pb.TagNumber(6)
  AliOSSUpload ensureAliOSS() => $_ensure(5);
}

enum ImageOutput_Output { s3, gcp, azure, aliOSS, notSet }

class ImageOutput extends $pb.GeneratedMessage {
  factory ImageOutput({
    $core.int? captureInterval,
    $core.int? width,
    $core.int? height,
    $core.String? filenamePrefix,
    ImageFileSuffix? filenameSuffix,
    $0.ImageCodec? imageCodec,
    $core.bool? disableManifest,
    S3Upload? s3,
    GCPUpload? gcp,
    AzureBlobUpload? azure,
    AliOSSUpload? aliOSS,
  }) {
    final result = create();
    if (captureInterval != null) result.captureInterval = captureInterval;
    if (width != null) result.width = width;
    if (height != null) result.height = height;
    if (filenamePrefix != null) result.filenamePrefix = filenamePrefix;
    if (filenameSuffix != null) result.filenameSuffix = filenameSuffix;
    if (imageCodec != null) result.imageCodec = imageCodec;
    if (disableManifest != null) result.disableManifest = disableManifest;
    if (s3 != null) result.s3 = s3;
    if (gcp != null) result.gcp = gcp;
    if (azure != null) result.azure = azure;
    if (aliOSS != null) result.aliOSS = aliOSS;
    return result;
  }

  ImageOutput._();

  factory ImageOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ImageOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ImageOutput_Output>
      _ImageOutput_OutputByTag = {
    8: ImageOutput_Output.s3,
    9: ImageOutput_Output.gcp,
    10: ImageOutput_Output.azure,
    11: ImageOutput_Output.aliOSS,
    0: ImageOutput_Output.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ImageOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [8, 9, 10, 11])
    ..a<$core.int>(
        1, _omitFieldNames ? '' : 'captureInterval', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'filenamePrefix')
    ..e<ImageFileSuffix>(
        5, _omitFieldNames ? '' : 'filenameSuffix', $pb.PbFieldType.OE,
        defaultOrMaker: ImageFileSuffix.IMAGE_SUFFIX_INDEX,
        valueOf: ImageFileSuffix.valueOf,
        enumValues: ImageFileSuffix.values)
    ..e<$0.ImageCodec>(
        6, _omitFieldNames ? '' : 'imageCodec', $pb.PbFieldType.OE,
        defaultOrMaker: $0.ImageCodec.IC_DEFAULT,
        valueOf: $0.ImageCodec.valueOf,
        enumValues: $0.ImageCodec.values)
    ..aOB(7, _omitFieldNames ? '' : 'disableManifest')
    ..aOM<S3Upload>(8, _omitFieldNames ? '' : 's3', subBuilder: S3Upload.create)
    ..aOM<GCPUpload>(9, _omitFieldNames ? '' : 'gcp',
        subBuilder: GCPUpload.create)
    ..aOM<AzureBlobUpload>(10, _omitFieldNames ? '' : 'azure',
        subBuilder: AzureBlobUpload.create)
    ..aOM<AliOSSUpload>(11, _omitFieldNames ? '' : 'aliOSS',
        protoName: 'aliOSS', subBuilder: AliOSSUpload.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageOutput clone() => ImageOutput()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageOutput copyWith(void Function(ImageOutput) updates) =>
      super.copyWith((message) => updates(message as ImageOutput))
          as ImageOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageOutput create() => ImageOutput._();
  @$core.override
  ImageOutput createEmptyInstance() => create();
  static $pb.PbList<ImageOutput> createRepeated() => $pb.PbList<ImageOutput>();
  @$core.pragma('dart2js:noInline')
  static ImageOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImageOutput>(create);
  static ImageOutput? _defaultInstance;

  ImageOutput_Output whichOutput() =>
      _ImageOutput_OutputByTag[$_whichOneof(0)]!;
  void clearOutput() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get captureInterval => $_getIZ(0);
  @$pb.TagNumber(1)
  set captureInterval($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCaptureInterval() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaptureInterval() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get width => $_getIZ(1);
  @$pb.TagNumber(2)
  set width($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearWidth() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get height => $_getIZ(2);
  @$pb.TagNumber(3)
  set height($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get filenamePrefix => $_getSZ(3);
  @$pb.TagNumber(4)
  set filenamePrefix($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFilenamePrefix() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilenamePrefix() => $_clearField(4);

  @$pb.TagNumber(5)
  ImageFileSuffix get filenameSuffix => $_getN(4);
  @$pb.TagNumber(5)
  set filenameSuffix(ImageFileSuffix value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasFilenameSuffix() => $_has(4);
  @$pb.TagNumber(5)
  void clearFilenameSuffix() => $_clearField(5);

  @$pb.TagNumber(6)
  $0.ImageCodec get imageCodec => $_getN(5);
  @$pb.TagNumber(6)
  set imageCodec($0.ImageCodec value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasImageCodec() => $_has(5);
  @$pb.TagNumber(6)
  void clearImageCodec() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get disableManifest => $_getBF(6);
  @$pb.TagNumber(7)
  set disableManifest($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDisableManifest() => $_has(6);
  @$pb.TagNumber(7)
  void clearDisableManifest() => $_clearField(7);

  @$pb.TagNumber(8)
  S3Upload get s3 => $_getN(7);
  @$pb.TagNumber(8)
  set s3(S3Upload value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasS3() => $_has(7);
  @$pb.TagNumber(8)
  void clearS3() => $_clearField(8);
  @$pb.TagNumber(8)
  S3Upload ensureS3() => $_ensure(7);

  @$pb.TagNumber(9)
  GCPUpload get gcp => $_getN(8);
  @$pb.TagNumber(9)
  set gcp(GCPUpload value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasGcp() => $_has(8);
  @$pb.TagNumber(9)
  void clearGcp() => $_clearField(9);
  @$pb.TagNumber(9)
  GCPUpload ensureGcp() => $_ensure(8);

  @$pb.TagNumber(10)
  AzureBlobUpload get azure => $_getN(9);
  @$pb.TagNumber(10)
  set azure(AzureBlobUpload value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasAzure() => $_has(9);
  @$pb.TagNumber(10)
  void clearAzure() => $_clearField(10);
  @$pb.TagNumber(10)
  AzureBlobUpload ensureAzure() => $_ensure(9);

  @$pb.TagNumber(11)
  AliOSSUpload get aliOSS => $_getN(10);
  @$pb.TagNumber(11)
  set aliOSS(AliOSSUpload value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasAliOSS() => $_has(10);
  @$pb.TagNumber(11)
  void clearAliOSS() => $_clearField(11);
  @$pb.TagNumber(11)
  AliOSSUpload ensureAliOSS() => $_ensure(10);
}

class S3Upload extends $pb.GeneratedMessage {
  factory S3Upload({
    $core.String? accessKey,
    $core.String? secret,
    $core.String? region,
    $core.String? endpoint,
    $core.String? bucket,
    $core.bool? forcePathStyle,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? metadata,
    $core.String? tagging,
    $core.String? contentDisposition,
    ProxyConfig? proxy,
    $core.String? sessionToken,
    $core.String? assumeRoleArn,
    $core.String? assumeRoleExternalId,
  }) {
    final result = create();
    if (accessKey != null) result.accessKey = accessKey;
    if (secret != null) result.secret = secret;
    if (region != null) result.region = region;
    if (endpoint != null) result.endpoint = endpoint;
    if (bucket != null) result.bucket = bucket;
    if (forcePathStyle != null) result.forcePathStyle = forcePathStyle;
    if (metadata != null) result.metadata.addEntries(metadata);
    if (tagging != null) result.tagging = tagging;
    if (contentDisposition != null)
      result.contentDisposition = contentDisposition;
    if (proxy != null) result.proxy = proxy;
    if (sessionToken != null) result.sessionToken = sessionToken;
    if (assumeRoleArn != null) result.assumeRoleArn = assumeRoleArn;
    if (assumeRoleExternalId != null)
      result.assumeRoleExternalId = assumeRoleExternalId;
    return result;
  }

  S3Upload._();

  factory S3Upload.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory S3Upload.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'S3Upload',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessKey')
    ..aOS(2, _omitFieldNames ? '' : 'secret')
    ..aOS(3, _omitFieldNames ? '' : 'region')
    ..aOS(4, _omitFieldNames ? '' : 'endpoint')
    ..aOS(5, _omitFieldNames ? '' : 'bucket')
    ..aOB(6, _omitFieldNames ? '' : 'forcePathStyle')
    ..m<$core.String, $core.String>(7, _omitFieldNames ? '' : 'metadata',
        entryClassName: 'S3Upload.MetadataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOS(8, _omitFieldNames ? '' : 'tagging')
    ..aOS(9, _omitFieldNames ? '' : 'contentDisposition')
    ..aOM<ProxyConfig>(10, _omitFieldNames ? '' : 'proxy',
        subBuilder: ProxyConfig.create)
    ..aOS(11, _omitFieldNames ? '' : 'sessionToken')
    ..aOS(12, _omitFieldNames ? '' : 'assumeRoleArn')
    ..aOS(13, _omitFieldNames ? '' : 'assumeRoleExternalId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S3Upload clone() => S3Upload()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  S3Upload copyWith(void Function(S3Upload) updates) =>
      super.copyWith((message) => updates(message as S3Upload)) as S3Upload;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S3Upload create() => S3Upload._();
  @$core.override
  S3Upload createEmptyInstance() => create();
  static $pb.PbList<S3Upload> createRepeated() => $pb.PbList<S3Upload>();
  @$core.pragma('dart2js:noInline')
  static S3Upload getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S3Upload>(create);
  static S3Upload? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccessKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get secret => $_getSZ(1);
  @$pb.TagNumber(2)
  set secret($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSecret() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecret() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get region => $_getSZ(2);
  @$pb.TagNumber(3)
  set region($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRegion() => $_has(2);
  @$pb.TagNumber(3)
  void clearRegion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get endpoint => $_getSZ(3);
  @$pb.TagNumber(4)
  set endpoint($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEndpoint() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndpoint() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get bucket => $_getSZ(4);
  @$pb.TagNumber(5)
  set bucket($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBucket() => $_has(4);
  @$pb.TagNumber(5)
  void clearBucket() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get forcePathStyle => $_getBF(5);
  @$pb.TagNumber(6)
  set forcePathStyle($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasForcePathStyle() => $_has(5);
  @$pb.TagNumber(6)
  void clearForcePathStyle() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbMap<$core.String, $core.String> get metadata => $_getMap(6);

  @$pb.TagNumber(8)
  $core.String get tagging => $_getSZ(7);
  @$pb.TagNumber(8)
  set tagging($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTagging() => $_has(7);
  @$pb.TagNumber(8)
  void clearTagging() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get contentDisposition => $_getSZ(8);
  @$pb.TagNumber(9)
  set contentDisposition($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasContentDisposition() => $_has(8);
  @$pb.TagNumber(9)
  void clearContentDisposition() => $_clearField(9);

  @$pb.TagNumber(10)
  ProxyConfig get proxy => $_getN(9);
  @$pb.TagNumber(10)
  set proxy(ProxyConfig value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasProxy() => $_has(9);
  @$pb.TagNumber(10)
  void clearProxy() => $_clearField(10);
  @$pb.TagNumber(10)
  ProxyConfig ensureProxy() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get sessionToken => $_getSZ(10);
  @$pb.TagNumber(11)
  set sessionToken($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasSessionToken() => $_has(10);
  @$pb.TagNumber(11)
  void clearSessionToken() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get assumeRoleArn => $_getSZ(11);
  @$pb.TagNumber(12)
  set assumeRoleArn($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasAssumeRoleArn() => $_has(11);
  @$pb.TagNumber(12)
  void clearAssumeRoleArn() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get assumeRoleExternalId => $_getSZ(12);
  @$pb.TagNumber(13)
  set assumeRoleExternalId($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasAssumeRoleExternalId() => $_has(12);
  @$pb.TagNumber(13)
  void clearAssumeRoleExternalId() => $_clearField(13);
}

class GCPUpload extends $pb.GeneratedMessage {
  factory GCPUpload({
    $core.String? credentials,
    $core.String? bucket,
    ProxyConfig? proxy,
  }) {
    final result = create();
    if (credentials != null) result.credentials = credentials;
    if (bucket != null) result.bucket = bucket;
    if (proxy != null) result.proxy = proxy;
    return result;
  }

  GCPUpload._();

  factory GCPUpload.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GCPUpload.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GCPUpload',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'credentials')
    ..aOS(2, _omitFieldNames ? '' : 'bucket')
    ..aOM<ProxyConfig>(3, _omitFieldNames ? '' : 'proxy',
        subBuilder: ProxyConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GCPUpload clone() => GCPUpload()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GCPUpload copyWith(void Function(GCPUpload) updates) =>
      super.copyWith((message) => updates(message as GCPUpload)) as GCPUpload;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GCPUpload create() => GCPUpload._();
  @$core.override
  GCPUpload createEmptyInstance() => create();
  static $pb.PbList<GCPUpload> createRepeated() => $pb.PbList<GCPUpload>();
  @$core.pragma('dart2js:noInline')
  static GCPUpload getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GCPUpload>(create);
  static GCPUpload? _defaultInstance;

  /// service account credentials serialized in JSON "credentials.json"
  @$pb.TagNumber(1)
  $core.String get credentials => $_getSZ(0);
  @$pb.TagNumber(1)
  set credentials($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCredentials() => $_has(0);
  @$pb.TagNumber(1)
  void clearCredentials() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get bucket => $_getSZ(1);
  @$pb.TagNumber(2)
  set bucket($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBucket() => $_has(1);
  @$pb.TagNumber(2)
  void clearBucket() => $_clearField(2);

  @$pb.TagNumber(3)
  ProxyConfig get proxy => $_getN(2);
  @$pb.TagNumber(3)
  set proxy(ProxyConfig value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasProxy() => $_has(2);
  @$pb.TagNumber(3)
  void clearProxy() => $_clearField(3);
  @$pb.TagNumber(3)
  ProxyConfig ensureProxy() => $_ensure(2);
}

class AzureBlobUpload extends $pb.GeneratedMessage {
  factory AzureBlobUpload({
    $core.String? accountName,
    $core.String? accountKey,
    $core.String? containerName,
  }) {
    final result = create();
    if (accountName != null) result.accountName = accountName;
    if (accountKey != null) result.accountKey = accountKey;
    if (containerName != null) result.containerName = containerName;
    return result;
  }

  AzureBlobUpload._();

  factory AzureBlobUpload.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AzureBlobUpload.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AzureBlobUpload',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountName')
    ..aOS(2, _omitFieldNames ? '' : 'accountKey')
    ..aOS(3, _omitFieldNames ? '' : 'containerName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AzureBlobUpload clone() => AzureBlobUpload()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AzureBlobUpload copyWith(void Function(AzureBlobUpload) updates) =>
      super.copyWith((message) => updates(message as AzureBlobUpload))
          as AzureBlobUpload;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AzureBlobUpload create() => AzureBlobUpload._();
  @$core.override
  AzureBlobUpload createEmptyInstance() => create();
  static $pb.PbList<AzureBlobUpload> createRepeated() =>
      $pb.PbList<AzureBlobUpload>();
  @$core.pragma('dart2js:noInline')
  static AzureBlobUpload getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AzureBlobUpload>(create);
  static AzureBlobUpload? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountName => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get accountKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set accountKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAccountKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get containerName => $_getSZ(2);
  @$pb.TagNumber(3)
  set containerName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContainerName() => $_has(2);
  @$pb.TagNumber(3)
  void clearContainerName() => $_clearField(3);
}

class AliOSSUpload extends $pb.GeneratedMessage {
  factory AliOSSUpload({
    $core.String? accessKey,
    $core.String? secret,
    $core.String? region,
    $core.String? endpoint,
    $core.String? bucket,
  }) {
    final result = create();
    if (accessKey != null) result.accessKey = accessKey;
    if (secret != null) result.secret = secret;
    if (region != null) result.region = region;
    if (endpoint != null) result.endpoint = endpoint;
    if (bucket != null) result.bucket = bucket;
    return result;
  }

  AliOSSUpload._();

  factory AliOSSUpload.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AliOSSUpload.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AliOSSUpload',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessKey')
    ..aOS(2, _omitFieldNames ? '' : 'secret')
    ..aOS(3, _omitFieldNames ? '' : 'region')
    ..aOS(4, _omitFieldNames ? '' : 'endpoint')
    ..aOS(5, _omitFieldNames ? '' : 'bucket')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AliOSSUpload clone() => AliOSSUpload()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AliOSSUpload copyWith(void Function(AliOSSUpload) updates) =>
      super.copyWith((message) => updates(message as AliOSSUpload))
          as AliOSSUpload;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AliOSSUpload create() => AliOSSUpload._();
  @$core.override
  AliOSSUpload createEmptyInstance() => create();
  static $pb.PbList<AliOSSUpload> createRepeated() =>
      $pb.PbList<AliOSSUpload>();
  @$core.pragma('dart2js:noInline')
  static AliOSSUpload getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AliOSSUpload>(create);
  static AliOSSUpload? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccessKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get secret => $_getSZ(1);
  @$pb.TagNumber(2)
  set secret($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSecret() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecret() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get region => $_getSZ(2);
  @$pb.TagNumber(3)
  set region($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRegion() => $_has(2);
  @$pb.TagNumber(3)
  void clearRegion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get endpoint => $_getSZ(3);
  @$pb.TagNumber(4)
  set endpoint($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEndpoint() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndpoint() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get bucket => $_getSZ(4);
  @$pb.TagNumber(5)
  set bucket($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBucket() => $_has(4);
  @$pb.TagNumber(5)
  void clearBucket() => $_clearField(5);
}

class ProxyConfig extends $pb.GeneratedMessage {
  factory ProxyConfig({
    $core.String? url,
    $core.String? username,
    $core.String? password,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (username != null) result.username = username;
    if (password != null) result.password = password;
    return result;
  }

  ProxyConfig._();

  factory ProxyConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProxyConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProxyConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'username')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProxyConfig clone() => ProxyConfig()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProxyConfig copyWith(void Function(ProxyConfig) updates) =>
      super.copyWith((message) => updates(message as ProxyConfig))
          as ProxyConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProxyConfig create() => ProxyConfig._();
  @$core.override
  ProxyConfig createEmptyInstance() => create();
  static $pb.PbList<ProxyConfig> createRepeated() => $pb.PbList<ProxyConfig>();
  @$core.pragma('dart2js:noInline')
  static ProxyConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProxyConfig>(create);
  static ProxyConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => $_clearField(3);
}

class StreamOutput extends $pb.GeneratedMessage {
  factory StreamOutput({
    StreamProtocol? protocol,
    $core.Iterable<$core.String>? urls,
  }) {
    final result = create();
    if (protocol != null) result.protocol = protocol;
    if (urls != null) result.urls.addAll(urls);
    return result;
  }

  StreamOutput._();

  factory StreamOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..e<StreamProtocol>(
        1, _omitFieldNames ? '' : 'protocol', $pb.PbFieldType.OE,
        defaultOrMaker: StreamProtocol.DEFAULT_PROTOCOL,
        valueOf: StreamProtocol.valueOf,
        enumValues: StreamProtocol.values)
    ..pPS(2, _omitFieldNames ? '' : 'urls')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamOutput clone() => StreamOutput()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamOutput copyWith(void Function(StreamOutput) updates) =>
      super.copyWith((message) => updates(message as StreamOutput))
          as StreamOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamOutput create() => StreamOutput._();
  @$core.override
  StreamOutput createEmptyInstance() => create();
  static $pb.PbList<StreamOutput> createRepeated() =>
      $pb.PbList<StreamOutput>();
  @$core.pragma('dart2js:noInline')
  static StreamOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamOutput>(create);
  static StreamOutput? _defaultInstance;

  @$pb.TagNumber(1)
  StreamProtocol get protocol => $_getN(0);
  @$pb.TagNumber(1)
  set protocol(StreamProtocol value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProtocol() => $_has(0);
  @$pb.TagNumber(1)
  void clearProtocol() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get urls => $_getList(1);
}

class EncodingOptions extends $pb.GeneratedMessage {
  factory EncodingOptions({
    $core.int? width,
    $core.int? height,
    $core.int? depth,
    $core.int? framerate,
    $0.AudioCodec? audioCodec,
    $core.int? audioBitrate,
    $core.int? audioFrequency,
    $0.VideoCodec? videoCodec,
    $core.int? videoBitrate,
    $core.double? keyFrameInterval,
    $core.int? audioQuality,
    $core.int? videoQuality,
  }) {
    final result = create();
    if (width != null) result.width = width;
    if (height != null) result.height = height;
    if (depth != null) result.depth = depth;
    if (framerate != null) result.framerate = framerate;
    if (audioCodec != null) result.audioCodec = audioCodec;
    if (audioBitrate != null) result.audioBitrate = audioBitrate;
    if (audioFrequency != null) result.audioFrequency = audioFrequency;
    if (videoCodec != null) result.videoCodec = videoCodec;
    if (videoBitrate != null) result.videoBitrate = videoBitrate;
    if (keyFrameInterval != null) result.keyFrameInterval = keyFrameInterval;
    if (audioQuality != null) result.audioQuality = audioQuality;
    if (videoQuality != null) result.videoQuality = videoQuality;
    return result;
  }

  EncodingOptions._();

  factory EncodingOptions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EncodingOptions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EncodingOptions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'depth', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'framerate', $pb.PbFieldType.O3)
    ..e<$0.AudioCodec>(
        5, _omitFieldNames ? '' : 'audioCodec', $pb.PbFieldType.OE,
        defaultOrMaker: $0.AudioCodec.DEFAULT_AC,
        valueOf: $0.AudioCodec.valueOf,
        enumValues: $0.AudioCodec.values)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'audioBitrate', $pb.PbFieldType.O3)
    ..a<$core.int>(
        7, _omitFieldNames ? '' : 'audioFrequency', $pb.PbFieldType.O3)
    ..e<$0.VideoCodec>(
        8, _omitFieldNames ? '' : 'videoCodec', $pb.PbFieldType.OE,
        defaultOrMaker: $0.VideoCodec.DEFAULT_VC,
        valueOf: $0.VideoCodec.valueOf,
        enumValues: $0.VideoCodec.values)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'videoBitrate', $pb.PbFieldType.O3)
    ..a<$core.double>(
        10, _omitFieldNames ? '' : 'keyFrameInterval', $pb.PbFieldType.OD)
    ..a<$core.int>(
        11, _omitFieldNames ? '' : 'audioQuality', $pb.PbFieldType.O3)
    ..a<$core.int>(
        12, _omitFieldNames ? '' : 'videoQuality', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EncodingOptions clone() => EncodingOptions()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EncodingOptions copyWith(void Function(EncodingOptions) updates) =>
      super.copyWith((message) => updates(message as EncodingOptions))
          as EncodingOptions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EncodingOptions create() => EncodingOptions._();
  @$core.override
  EncodingOptions createEmptyInstance() => create();
  static $pb.PbList<EncodingOptions> createRepeated() =>
      $pb.PbList<EncodingOptions>();
  @$core.pragma('dart2js:noInline')
  static EncodingOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EncodingOptions>(create);
  static EncodingOptions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get width => $_getIZ(0);
  @$pb.TagNumber(1)
  set width($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWidth() => $_has(0);
  @$pb.TagNumber(1)
  void clearWidth() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get height => $_getIZ(1);
  @$pb.TagNumber(2)
  set height($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get depth => $_getIZ(2);
  @$pb.TagNumber(3)
  set depth($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDepth() => $_has(2);
  @$pb.TagNumber(3)
  void clearDepth() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get framerate => $_getIZ(3);
  @$pb.TagNumber(4)
  set framerate($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFramerate() => $_has(3);
  @$pb.TagNumber(4)
  void clearFramerate() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.AudioCodec get audioCodec => $_getN(4);
  @$pb.TagNumber(5)
  set audioCodec($0.AudioCodec value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasAudioCodec() => $_has(4);
  @$pb.TagNumber(5)
  void clearAudioCodec() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get audioBitrate => $_getIZ(5);
  @$pb.TagNumber(6)
  set audioBitrate($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAudioBitrate() => $_has(5);
  @$pb.TagNumber(6)
  void clearAudioBitrate() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get audioFrequency => $_getIZ(6);
  @$pb.TagNumber(7)
  set audioFrequency($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAudioFrequency() => $_has(6);
  @$pb.TagNumber(7)
  void clearAudioFrequency() => $_clearField(7);

  @$pb.TagNumber(8)
  $0.VideoCodec get videoCodec => $_getN(7);
  @$pb.TagNumber(8)
  set videoCodec($0.VideoCodec value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasVideoCodec() => $_has(7);
  @$pb.TagNumber(8)
  void clearVideoCodec() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get videoBitrate => $_getIZ(8);
  @$pb.TagNumber(9)
  set videoBitrate($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasVideoBitrate() => $_has(8);
  @$pb.TagNumber(9)
  void clearVideoBitrate() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get keyFrameInterval => $_getN(9);
  @$pb.TagNumber(10)
  set keyFrameInterval($core.double value) => $_setDouble(9, value);
  @$pb.TagNumber(10)
  $core.bool hasKeyFrameInterval() => $_has(9);
  @$pb.TagNumber(10)
  void clearKeyFrameInterval() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get audioQuality => $_getIZ(10);
  @$pb.TagNumber(11)
  set audioQuality($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasAudioQuality() => $_has(10);
  @$pb.TagNumber(11)
  void clearAudioQuality() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get videoQuality => $_getIZ(11);
  @$pb.TagNumber(12)
  set videoQuality($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasVideoQuality() => $_has(11);
  @$pb.TagNumber(12)
  void clearVideoQuality() => $_clearField(12);
}

class UpdateLayoutRequest extends $pb.GeneratedMessage {
  factory UpdateLayoutRequest({
    $core.String? egressId,
    $core.String? layout,
  }) {
    final result = create();
    if (egressId != null) result.egressId = egressId;
    if (layout != null) result.layout = layout;
    return result;
  }

  UpdateLayoutRequest._();

  factory UpdateLayoutRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateLayoutRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateLayoutRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'egressId')
    ..aOS(2, _omitFieldNames ? '' : 'layout')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateLayoutRequest clone() => UpdateLayoutRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateLayoutRequest copyWith(void Function(UpdateLayoutRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateLayoutRequest))
          as UpdateLayoutRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLayoutRequest create() => UpdateLayoutRequest._();
  @$core.override
  UpdateLayoutRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateLayoutRequest> createRepeated() =>
      $pb.PbList<UpdateLayoutRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateLayoutRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateLayoutRequest>(create);
  static UpdateLayoutRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get egressId => $_getSZ(0);
  @$pb.TagNumber(1)
  set egressId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEgressId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEgressId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get layout => $_getSZ(1);
  @$pb.TagNumber(2)
  set layout($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLayout() => $_has(1);
  @$pb.TagNumber(2)
  void clearLayout() => $_clearField(2);
}

class UpdateStreamRequest extends $pb.GeneratedMessage {
  factory UpdateStreamRequest({
    $core.String? egressId,
    $core.Iterable<$core.String>? addOutputUrls,
    $core.Iterable<$core.String>? removeOutputUrls,
  }) {
    final result = create();
    if (egressId != null) result.egressId = egressId;
    if (addOutputUrls != null) result.addOutputUrls.addAll(addOutputUrls);
    if (removeOutputUrls != null)
      result.removeOutputUrls.addAll(removeOutputUrls);
    return result;
  }

  UpdateStreamRequest._();

  factory UpdateStreamRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStreamRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStreamRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'egressId')
    ..pPS(2, _omitFieldNames ? '' : 'addOutputUrls')
    ..pPS(3, _omitFieldNames ? '' : 'removeOutputUrls')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStreamRequest clone() => UpdateStreamRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStreamRequest copyWith(void Function(UpdateStreamRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateStreamRequest))
          as UpdateStreamRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStreamRequest create() => UpdateStreamRequest._();
  @$core.override
  UpdateStreamRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateStreamRequest> createRepeated() =>
      $pb.PbList<UpdateStreamRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateStreamRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStreamRequest>(create);
  static UpdateStreamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get egressId => $_getSZ(0);
  @$pb.TagNumber(1)
  set egressId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEgressId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEgressId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get addOutputUrls => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get removeOutputUrls => $_getList(2);
}

class ListEgressRequest extends $pb.GeneratedMessage {
  factory ListEgressRequest({
    $core.String? roomName,
    $core.String? egressId,
    $core.bool? active,
  }) {
    final result = create();
    if (roomName != null) result.roomName = roomName;
    if (egressId != null) result.egressId = egressId;
    if (active != null) result.active = active;
    return result;
  }

  ListEgressRequest._();

  factory ListEgressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListEgressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListEgressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOS(2, _omitFieldNames ? '' : 'egressId')
    ..aOB(3, _omitFieldNames ? '' : 'active')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListEgressRequest clone() => ListEgressRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListEgressRequest copyWith(void Function(ListEgressRequest) updates) =>
      super.copyWith((message) => updates(message as ListEgressRequest))
          as ListEgressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListEgressRequest create() => ListEgressRequest._();
  @$core.override
  ListEgressRequest createEmptyInstance() => create();
  static $pb.PbList<ListEgressRequest> createRepeated() =>
      $pb.PbList<ListEgressRequest>();
  @$core.pragma('dart2js:noInline')
  static ListEgressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListEgressRequest>(create);
  static ListEgressRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get egressId => $_getSZ(1);
  @$pb.TagNumber(2)
  set egressId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEgressId() => $_has(1);
  @$pb.TagNumber(2)
  void clearEgressId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get active => $_getBF(2);
  @$pb.TagNumber(3)
  set active($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasActive() => $_has(2);
  @$pb.TagNumber(3)
  void clearActive() => $_clearField(3);
}

class ListEgressResponse extends $pb.GeneratedMessage {
  factory ListEgressResponse({
    $core.Iterable<EgressInfo>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListEgressResponse._();

  factory ListEgressResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListEgressResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListEgressResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pc<EgressInfo>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: EgressInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListEgressResponse clone() => ListEgressResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListEgressResponse copyWith(void Function(ListEgressResponse) updates) =>
      super.copyWith((message) => updates(message as ListEgressResponse))
          as ListEgressResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListEgressResponse create() => ListEgressResponse._();
  @$core.override
  ListEgressResponse createEmptyInstance() => create();
  static $pb.PbList<ListEgressResponse> createRepeated() =>
      $pb.PbList<ListEgressResponse>();
  @$core.pragma('dart2js:noInline')
  static ListEgressResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListEgressResponse>(create);
  static ListEgressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<EgressInfo> get items => $_getList(0);
}

class StopEgressRequest extends $pb.GeneratedMessage {
  factory StopEgressRequest({
    $core.String? egressId,
  }) {
    final result = create();
    if (egressId != null) result.egressId = egressId;
    return result;
  }

  StopEgressRequest._();

  factory StopEgressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopEgressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StopEgressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'egressId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopEgressRequest clone() => StopEgressRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopEgressRequest copyWith(void Function(StopEgressRequest) updates) =>
      super.copyWith((message) => updates(message as StopEgressRequest))
          as StopEgressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopEgressRequest create() => StopEgressRequest._();
  @$core.override
  StopEgressRequest createEmptyInstance() => create();
  static $pb.PbList<StopEgressRequest> createRepeated() =>
      $pb.PbList<StopEgressRequest>();
  @$core.pragma('dart2js:noInline')
  static StopEgressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StopEgressRequest>(create);
  static StopEgressRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get egressId => $_getSZ(0);
  @$pb.TagNumber(1)
  set egressId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEgressId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEgressId() => $_clearField(1);
}

enum EgressInfo_Request {
  roomComposite,
  trackComposite,
  track,
  web,
  participant,
  notSet
}

enum EgressInfo_Result { stream, file, segments, notSet }

class EgressInfo extends $pb.GeneratedMessage {
  factory EgressInfo({
    $core.String? egressId,
    $core.String? roomId,
    EgressStatus? status,
    RoomCompositeEgressRequest? roomComposite,
    TrackCompositeEgressRequest? trackComposite,
    TrackEgressRequest? track,
    @$core.Deprecated('This field is deprecated.') StreamInfoList? stream,
    @$core.Deprecated('This field is deprecated.') FileInfo? file,
    $core.String? error,
    $fixnum.Int64? startedAt,
    $fixnum.Int64? endedAt,
    @$core.Deprecated('This field is deprecated.') SegmentsInfo? segments,
    $core.String? roomName,
    WebEgressRequest? web,
    $core.Iterable<StreamInfo>? streamResults,
    $core.Iterable<FileInfo>? fileResults,
    $core.Iterable<SegmentsInfo>? segmentResults,
    $fixnum.Int64? updatedAt,
    ParticipantEgressRequest? participant,
    $core.Iterable<ImagesInfo>? imageResults,
    $core.String? details,
    $core.int? errorCode,
    $core.String? manifestLocation,
    $core.bool? backupStorageUsed,
    EgressSourceType? sourceType,
  }) {
    final result = create();
    if (egressId != null) result.egressId = egressId;
    if (roomId != null) result.roomId = roomId;
    if (status != null) result.status = status;
    if (roomComposite != null) result.roomComposite = roomComposite;
    if (trackComposite != null) result.trackComposite = trackComposite;
    if (track != null) result.track = track;
    if (stream != null) result.stream = stream;
    if (file != null) result.file = file;
    if (error != null) result.error = error;
    if (startedAt != null) result.startedAt = startedAt;
    if (endedAt != null) result.endedAt = endedAt;
    if (segments != null) result.segments = segments;
    if (roomName != null) result.roomName = roomName;
    if (web != null) result.web = web;
    if (streamResults != null) result.streamResults.addAll(streamResults);
    if (fileResults != null) result.fileResults.addAll(fileResults);
    if (segmentResults != null) result.segmentResults.addAll(segmentResults);
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (participant != null) result.participant = participant;
    if (imageResults != null) result.imageResults.addAll(imageResults);
    if (details != null) result.details = details;
    if (errorCode != null) result.errorCode = errorCode;
    if (manifestLocation != null) result.manifestLocation = manifestLocation;
    if (backupStorageUsed != null) result.backupStorageUsed = backupStorageUsed;
    if (sourceType != null) result.sourceType = sourceType;
    return result;
  }

  EgressInfo._();

  factory EgressInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EgressInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, EgressInfo_Request>
      _EgressInfo_RequestByTag = {
    4: EgressInfo_Request.roomComposite,
    5: EgressInfo_Request.trackComposite,
    6: EgressInfo_Request.track,
    14: EgressInfo_Request.web,
    19: EgressInfo_Request.participant,
    0: EgressInfo_Request.notSet
  };
  static const $core.Map<$core.int, EgressInfo_Result> _EgressInfo_ResultByTag =
      {
    7: EgressInfo_Result.stream,
    8: EgressInfo_Result.file,
    12: EgressInfo_Result.segments,
    0: EgressInfo_Result.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EgressInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [4, 5, 6, 14, 19])
    ..oo(1, [7, 8, 12])
    ..aOS(1, _omitFieldNames ? '' : 'egressId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..e<EgressStatus>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: EgressStatus.EGRESS_STARTING,
        valueOf: EgressStatus.valueOf,
        enumValues: EgressStatus.values)
    ..aOM<RoomCompositeEgressRequest>(4, _omitFieldNames ? '' : 'roomComposite',
        subBuilder: RoomCompositeEgressRequest.create)
    ..aOM<TrackCompositeEgressRequest>(
        5, _omitFieldNames ? '' : 'trackComposite',
        subBuilder: TrackCompositeEgressRequest.create)
    ..aOM<TrackEgressRequest>(6, _omitFieldNames ? '' : 'track',
        subBuilder: TrackEgressRequest.create)
    ..aOM<StreamInfoList>(7, _omitFieldNames ? '' : 'stream',
        subBuilder: StreamInfoList.create)
    ..aOM<FileInfo>(8, _omitFieldNames ? '' : 'file',
        subBuilder: FileInfo.create)
    ..aOS(9, _omitFieldNames ? '' : 'error')
    ..aInt64(10, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(11, _omitFieldNames ? '' : 'endedAt')
    ..aOM<SegmentsInfo>(12, _omitFieldNames ? '' : 'segments',
        subBuilder: SegmentsInfo.create)
    ..aOS(13, _omitFieldNames ? '' : 'roomName')
    ..aOM<WebEgressRequest>(14, _omitFieldNames ? '' : 'web',
        subBuilder: WebEgressRequest.create)
    ..pc<StreamInfo>(
        15, _omitFieldNames ? '' : 'streamResults', $pb.PbFieldType.PM,
        subBuilder: StreamInfo.create)
    ..pc<FileInfo>(16, _omitFieldNames ? '' : 'fileResults', $pb.PbFieldType.PM,
        subBuilder: FileInfo.create)
    ..pc<SegmentsInfo>(
        17, _omitFieldNames ? '' : 'segmentResults', $pb.PbFieldType.PM,
        subBuilder: SegmentsInfo.create)
    ..aInt64(18, _omitFieldNames ? '' : 'updatedAt')
    ..aOM<ParticipantEgressRequest>(19, _omitFieldNames ? '' : 'participant',
        subBuilder: ParticipantEgressRequest.create)
    ..pc<ImagesInfo>(
        20, _omitFieldNames ? '' : 'imageResults', $pb.PbFieldType.PM,
        subBuilder: ImagesInfo.create)
    ..aOS(21, _omitFieldNames ? '' : 'details')
    ..a<$core.int>(22, _omitFieldNames ? '' : 'errorCode', $pb.PbFieldType.O3)
    ..aOS(23, _omitFieldNames ? '' : 'manifestLocation')
    ..aOB(25, _omitFieldNames ? '' : 'backupStorageUsed')
    ..e<EgressSourceType>(
        26, _omitFieldNames ? '' : 'sourceType', $pb.PbFieldType.OE,
        defaultOrMaker: EgressSourceType.EGRESS_SOURCE_TYPE_WEB,
        valueOf: EgressSourceType.valueOf,
        enumValues: EgressSourceType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EgressInfo clone() => EgressInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EgressInfo copyWith(void Function(EgressInfo) updates) =>
      super.copyWith((message) => updates(message as EgressInfo)) as EgressInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EgressInfo create() => EgressInfo._();
  @$core.override
  EgressInfo createEmptyInstance() => create();
  static $pb.PbList<EgressInfo> createRepeated() => $pb.PbList<EgressInfo>();
  @$core.pragma('dart2js:noInline')
  static EgressInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EgressInfo>(create);
  static EgressInfo? _defaultInstance;

  EgressInfo_Request whichRequest() =>
      _EgressInfo_RequestByTag[$_whichOneof(0)]!;
  void clearRequest() => $_clearField($_whichOneof(0));

  EgressInfo_Result whichResult() => _EgressInfo_ResultByTag[$_whichOneof(1)]!;
  void clearResult() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $core.String get egressId => $_getSZ(0);
  @$pb.TagNumber(1)
  set egressId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEgressId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEgressId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  EgressStatus get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(EgressStatus value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);

  @$pb.TagNumber(4)
  RoomCompositeEgressRequest get roomComposite => $_getN(3);
  @$pb.TagNumber(4)
  set roomComposite(RoomCompositeEgressRequest value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomComposite() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomComposite() => $_clearField(4);
  @$pb.TagNumber(4)
  RoomCompositeEgressRequest ensureRoomComposite() => $_ensure(3);

  @$pb.TagNumber(5)
  TrackCompositeEgressRequest get trackComposite => $_getN(4);
  @$pb.TagNumber(5)
  set trackComposite(TrackCompositeEgressRequest value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTrackComposite() => $_has(4);
  @$pb.TagNumber(5)
  void clearTrackComposite() => $_clearField(5);
  @$pb.TagNumber(5)
  TrackCompositeEgressRequest ensureTrackComposite() => $_ensure(4);

  @$pb.TagNumber(6)
  TrackEgressRequest get track => $_getN(5);
  @$pb.TagNumber(6)
  set track(TrackEgressRequest value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasTrack() => $_has(5);
  @$pb.TagNumber(6)
  void clearTrack() => $_clearField(6);
  @$pb.TagNumber(6)
  TrackEgressRequest ensureTrack() => $_ensure(5);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  StreamInfoList get stream => $_getN(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  set stream(StreamInfoList value) => $_setField(7, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  $core.bool hasStream() => $_has(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  void clearStream() => $_clearField(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  StreamInfoList ensureStream() => $_ensure(6);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  FileInfo get file => $_getN(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  set file(FileInfo value) => $_setField(8, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.bool hasFile() => $_has(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  void clearFile() => $_clearField(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  FileInfo ensureFile() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get error => $_getSZ(8);
  @$pb.TagNumber(9)
  set error($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasError() => $_has(8);
  @$pb.TagNumber(9)
  void clearError() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get startedAt => $_getI64(9);
  @$pb.TagNumber(10)
  set startedAt($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasStartedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearStartedAt() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get endedAt => $_getI64(10);
  @$pb.TagNumber(11)
  set endedAt($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasEndedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearEndedAt() => $_clearField(11);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  SegmentsInfo get segments => $_getN(11);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  set segments(SegmentsInfo value) => $_setField(12, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  $core.bool hasSegments() => $_has(11);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  void clearSegments() => $_clearField(12);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  SegmentsInfo ensureSegments() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.String get roomName => $_getSZ(12);
  @$pb.TagNumber(13)
  set roomName($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasRoomName() => $_has(12);
  @$pb.TagNumber(13)
  void clearRoomName() => $_clearField(13);

  @$pb.TagNumber(14)
  WebEgressRequest get web => $_getN(13);
  @$pb.TagNumber(14)
  set web(WebEgressRequest value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasWeb() => $_has(13);
  @$pb.TagNumber(14)
  void clearWeb() => $_clearField(14);
  @$pb.TagNumber(14)
  WebEgressRequest ensureWeb() => $_ensure(13);

  @$pb.TagNumber(15)
  $pb.PbList<StreamInfo> get streamResults => $_getList(14);

  @$pb.TagNumber(16)
  $pb.PbList<FileInfo> get fileResults => $_getList(15);

  @$pb.TagNumber(17)
  $pb.PbList<SegmentsInfo> get segmentResults => $_getList(16);

  @$pb.TagNumber(18)
  $fixnum.Int64 get updatedAt => $_getI64(17);
  @$pb.TagNumber(18)
  set updatedAt($fixnum.Int64 value) => $_setInt64(17, value);
  @$pb.TagNumber(18)
  $core.bool hasUpdatedAt() => $_has(17);
  @$pb.TagNumber(18)
  void clearUpdatedAt() => $_clearField(18);

  @$pb.TagNumber(19)
  ParticipantEgressRequest get participant => $_getN(18);
  @$pb.TagNumber(19)
  set participant(ParticipantEgressRequest value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasParticipant() => $_has(18);
  @$pb.TagNumber(19)
  void clearParticipant() => $_clearField(19);
  @$pb.TagNumber(19)
  ParticipantEgressRequest ensureParticipant() => $_ensure(18);

  @$pb.TagNumber(20)
  $pb.PbList<ImagesInfo> get imageResults => $_getList(19);

  @$pb.TagNumber(21)
  $core.String get details => $_getSZ(20);
  @$pb.TagNumber(21)
  set details($core.String value) => $_setString(20, value);
  @$pb.TagNumber(21)
  $core.bool hasDetails() => $_has(20);
  @$pb.TagNumber(21)
  void clearDetails() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.int get errorCode => $_getIZ(21);
  @$pb.TagNumber(22)
  set errorCode($core.int value) => $_setSignedInt32(21, value);
  @$pb.TagNumber(22)
  $core.bool hasErrorCode() => $_has(21);
  @$pb.TagNumber(22)
  void clearErrorCode() => $_clearField(22);

  @$pb.TagNumber(23)
  $core.String get manifestLocation => $_getSZ(22);
  @$pb.TagNumber(23)
  set manifestLocation($core.String value) => $_setString(22, value);
  @$pb.TagNumber(23)
  $core.bool hasManifestLocation() => $_has(22);
  @$pb.TagNumber(23)
  void clearManifestLocation() => $_clearField(23);

  @$pb.TagNumber(25)
  $core.bool get backupStorageUsed => $_getBF(23);
  @$pb.TagNumber(25)
  set backupStorageUsed($core.bool value) => $_setBool(23, value);
  @$pb.TagNumber(25)
  $core.bool hasBackupStorageUsed() => $_has(23);
  @$pb.TagNumber(25)
  void clearBackupStorageUsed() => $_clearField(25);

  @$pb.TagNumber(26)
  EgressSourceType get sourceType => $_getN(24);
  @$pb.TagNumber(26)
  set sourceType(EgressSourceType value) => $_setField(26, value);
  @$pb.TagNumber(26)
  $core.bool hasSourceType() => $_has(24);
  @$pb.TagNumber(26)
  void clearSourceType() => $_clearField(26);
}

@$core.Deprecated('This message is deprecated')
class StreamInfoList extends $pb.GeneratedMessage {
  factory StreamInfoList({
    $core.Iterable<StreamInfo>? info,
  }) {
    final result = create();
    if (info != null) result.info.addAll(info);
    return result;
  }

  StreamInfoList._();

  factory StreamInfoList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamInfoList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamInfoList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pc<StreamInfo>(1, _omitFieldNames ? '' : 'info', $pb.PbFieldType.PM,
        subBuilder: StreamInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamInfoList clone() => StreamInfoList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamInfoList copyWith(void Function(StreamInfoList) updates) =>
      super.copyWith((message) => updates(message as StreamInfoList))
          as StreamInfoList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamInfoList create() => StreamInfoList._();
  @$core.override
  StreamInfoList createEmptyInstance() => create();
  static $pb.PbList<StreamInfoList> createRepeated() =>
      $pb.PbList<StreamInfoList>();
  @$core.pragma('dart2js:noInline')
  static StreamInfoList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamInfoList>(create);
  static StreamInfoList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<StreamInfo> get info => $_getList(0);
}

class StreamInfo extends $pb.GeneratedMessage {
  factory StreamInfo({
    $core.String? url,
    $fixnum.Int64? startedAt,
    $fixnum.Int64? endedAt,
    $fixnum.Int64? duration,
    StreamInfo_Status? status,
    $core.String? error,
    $fixnum.Int64? lastRetryAt,
    $core.int? retries,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (startedAt != null) result.startedAt = startedAt;
    if (endedAt != null) result.endedAt = endedAt;
    if (duration != null) result.duration = duration;
    if (status != null) result.status = status;
    if (error != null) result.error = error;
    if (lastRetryAt != null) result.lastRetryAt = lastRetryAt;
    if (retries != null) result.retries = retries;
    return result;
  }

  StreamInfo._();

  factory StreamInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aInt64(2, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(3, _omitFieldNames ? '' : 'endedAt')
    ..aInt64(4, _omitFieldNames ? '' : 'duration')
    ..e<StreamInfo_Status>(
        5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: StreamInfo_Status.ACTIVE,
        valueOf: StreamInfo_Status.valueOf,
        enumValues: StreamInfo_Status.values)
    ..aOS(6, _omitFieldNames ? '' : 'error')
    ..aInt64(7, _omitFieldNames ? '' : 'lastRetryAt')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'retries', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamInfo clone() => StreamInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamInfo copyWith(void Function(StreamInfo) updates) =>
      super.copyWith((message) => updates(message as StreamInfo)) as StreamInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamInfo create() => StreamInfo._();
  @$core.override
  StreamInfo createEmptyInstance() => create();
  static $pb.PbList<StreamInfo> createRepeated() => $pb.PbList<StreamInfo>();
  @$core.pragma('dart2js:noInline')
  static StreamInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamInfo>(create);
  static StreamInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get startedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set startedAt($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartedAt() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get endedAt => $_getI64(2);
  @$pb.TagNumber(3)
  set endedAt($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEndedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndedAt() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get duration => $_getI64(3);
  @$pb.TagNumber(4)
  set duration($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => $_clearField(4);

  @$pb.TagNumber(5)
  StreamInfo_Status get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(StreamInfo_Status value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get error => $_getSZ(5);
  @$pb.TagNumber(6)
  set error($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasError() => $_has(5);
  @$pb.TagNumber(6)
  void clearError() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get lastRetryAt => $_getI64(6);
  @$pb.TagNumber(7)
  set lastRetryAt($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLastRetryAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastRetryAt() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get retries => $_getIZ(7);
  @$pb.TagNumber(8)
  set retries($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRetries() => $_has(7);
  @$pb.TagNumber(8)
  void clearRetries() => $_clearField(8);
}

class FileInfo extends $pb.GeneratedMessage {
  factory FileInfo({
    $core.String? filename,
    $fixnum.Int64? startedAt,
    $fixnum.Int64? endedAt,
    $fixnum.Int64? size,
    $core.String? location,
    $fixnum.Int64? duration,
  }) {
    final result = create();
    if (filename != null) result.filename = filename;
    if (startedAt != null) result.startedAt = startedAt;
    if (endedAt != null) result.endedAt = endedAt;
    if (size != null) result.size = size;
    if (location != null) result.location = location;
    if (duration != null) result.duration = duration;
    return result;
  }

  FileInfo._();

  factory FileInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FileInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FileInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'filename')
    ..aInt64(2, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(3, _omitFieldNames ? '' : 'endedAt')
    ..aInt64(4, _omitFieldNames ? '' : 'size')
    ..aOS(5, _omitFieldNames ? '' : 'location')
    ..aInt64(6, _omitFieldNames ? '' : 'duration')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileInfo clone() => FileInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileInfo copyWith(void Function(FileInfo) updates) =>
      super.copyWith((message) => updates(message as FileInfo)) as FileInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileInfo create() => FileInfo._();
  @$core.override
  FileInfo createEmptyInstance() => create();
  static $pb.PbList<FileInfo> createRepeated() => $pb.PbList<FileInfo>();
  @$core.pragma('dart2js:noInline')
  static FileInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileInfo>(create);
  static FileInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filename => $_getSZ(0);
  @$pb.TagNumber(1)
  set filename($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFilename() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilename() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get startedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set startedAt($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartedAt() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get endedAt => $_getI64(2);
  @$pb.TagNumber(3)
  set endedAt($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEndedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndedAt() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get size => $_getI64(3);
  @$pb.TagNumber(4)
  set size($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearSize() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get location => $_getSZ(4);
  @$pb.TagNumber(5)
  set location($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearLocation() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get duration => $_getI64(5);
  @$pb.TagNumber(6)
  set duration($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearDuration() => $_clearField(6);
}

class SegmentsInfo extends $pb.GeneratedMessage {
  factory SegmentsInfo({
    $core.String? playlistName,
    $fixnum.Int64? duration,
    $fixnum.Int64? size,
    $core.String? playlistLocation,
    $fixnum.Int64? segmentCount,
    $fixnum.Int64? startedAt,
    $fixnum.Int64? endedAt,
    $core.String? livePlaylistName,
    $core.String? livePlaylistLocation,
  }) {
    final result = create();
    if (playlistName != null) result.playlistName = playlistName;
    if (duration != null) result.duration = duration;
    if (size != null) result.size = size;
    if (playlistLocation != null) result.playlistLocation = playlistLocation;
    if (segmentCount != null) result.segmentCount = segmentCount;
    if (startedAt != null) result.startedAt = startedAt;
    if (endedAt != null) result.endedAt = endedAt;
    if (livePlaylistName != null) result.livePlaylistName = livePlaylistName;
    if (livePlaylistLocation != null)
      result.livePlaylistLocation = livePlaylistLocation;
    return result;
  }

  SegmentsInfo._();

  factory SegmentsInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SegmentsInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SegmentsInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playlistName')
    ..aInt64(2, _omitFieldNames ? '' : 'duration')
    ..aInt64(3, _omitFieldNames ? '' : 'size')
    ..aOS(4, _omitFieldNames ? '' : 'playlistLocation')
    ..aInt64(5, _omitFieldNames ? '' : 'segmentCount')
    ..aInt64(6, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(7, _omitFieldNames ? '' : 'endedAt')
    ..aOS(8, _omitFieldNames ? '' : 'livePlaylistName')
    ..aOS(9, _omitFieldNames ? '' : 'livePlaylistLocation')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SegmentsInfo clone() => SegmentsInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SegmentsInfo copyWith(void Function(SegmentsInfo) updates) =>
      super.copyWith((message) => updates(message as SegmentsInfo))
          as SegmentsInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SegmentsInfo create() => SegmentsInfo._();
  @$core.override
  SegmentsInfo createEmptyInstance() => create();
  static $pb.PbList<SegmentsInfo> createRepeated() =>
      $pb.PbList<SegmentsInfo>();
  @$core.pragma('dart2js:noInline')
  static SegmentsInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SegmentsInfo>(create);
  static SegmentsInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playlistName => $_getSZ(0);
  @$pb.TagNumber(1)
  set playlistName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPlaylistName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaylistName() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get duration => $_getI64(1);
  @$pb.TagNumber(2)
  set duration($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(2);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get playlistLocation => $_getSZ(3);
  @$pb.TagNumber(4)
  set playlistLocation($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPlaylistLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlaylistLocation() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get segmentCount => $_getI64(4);
  @$pb.TagNumber(5)
  set segmentCount($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSegmentCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearSegmentCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get startedAt => $_getI64(5);
  @$pb.TagNumber(6)
  set startedAt($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStartedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartedAt() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get endedAt => $_getI64(6);
  @$pb.TagNumber(7)
  set endedAt($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasEndedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndedAt() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get livePlaylistName => $_getSZ(7);
  @$pb.TagNumber(8)
  set livePlaylistName($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLivePlaylistName() => $_has(7);
  @$pb.TagNumber(8)
  void clearLivePlaylistName() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get livePlaylistLocation => $_getSZ(8);
  @$pb.TagNumber(9)
  set livePlaylistLocation($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasLivePlaylistLocation() => $_has(8);
  @$pb.TagNumber(9)
  void clearLivePlaylistLocation() => $_clearField(9);
}

class ImagesInfo extends $pb.GeneratedMessage {
  factory ImagesInfo({
    $fixnum.Int64? imageCount,
    $fixnum.Int64? startedAt,
    $fixnum.Int64? endedAt,
    $core.String? filenamePrefix,
  }) {
    final result = create();
    if (imageCount != null) result.imageCount = imageCount;
    if (startedAt != null) result.startedAt = startedAt;
    if (endedAt != null) result.endedAt = endedAt;
    if (filenamePrefix != null) result.filenamePrefix = filenamePrefix;
    return result;
  }

  ImagesInfo._();

  factory ImagesInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ImagesInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ImagesInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'imageCount')
    ..aInt64(2, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(3, _omitFieldNames ? '' : 'endedAt')
    ..aOS(4, _omitFieldNames ? '' : 'filenamePrefix')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImagesInfo clone() => ImagesInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImagesInfo copyWith(void Function(ImagesInfo) updates) =>
      super.copyWith((message) => updates(message as ImagesInfo)) as ImagesInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImagesInfo create() => ImagesInfo._();
  @$core.override
  ImagesInfo createEmptyInstance() => create();
  static $pb.PbList<ImagesInfo> createRepeated() => $pb.PbList<ImagesInfo>();
  @$core.pragma('dart2js:noInline')
  static ImagesInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImagesInfo>(create);
  static ImagesInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get imageCount => $_getI64(0);
  @$pb.TagNumber(1)
  set imageCount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasImageCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get startedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set startedAt($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartedAt() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get endedAt => $_getI64(2);
  @$pb.TagNumber(3)
  set endedAt($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEndedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndedAt() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get filenamePrefix => $_getSZ(3);
  @$pb.TagNumber(4)
  set filenamePrefix($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFilenamePrefix() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilenamePrefix() => $_clearField(4);
}

enum AutoParticipantEgress_Options { preset, advanced, notSet }

class AutoParticipantEgress extends $pb.GeneratedMessage {
  factory AutoParticipantEgress({
    EncodingOptionsPreset? preset,
    EncodingOptions? advanced,
    $core.Iterable<EncodedFileOutput>? fileOutputs,
    $core.Iterable<SegmentedFileOutput>? segmentOutputs,
  }) {
    final result = create();
    if (preset != null) result.preset = preset;
    if (advanced != null) result.advanced = advanced;
    if (fileOutputs != null) result.fileOutputs.addAll(fileOutputs);
    if (segmentOutputs != null) result.segmentOutputs.addAll(segmentOutputs);
    return result;
  }

  AutoParticipantEgress._();

  factory AutoParticipantEgress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AutoParticipantEgress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, AutoParticipantEgress_Options>
      _AutoParticipantEgress_OptionsByTag = {
    1: AutoParticipantEgress_Options.preset,
    2: AutoParticipantEgress_Options.advanced,
    0: AutoParticipantEgress_Options.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AutoParticipantEgress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<EncodingOptionsPreset>(
        1, _omitFieldNames ? '' : 'preset', $pb.PbFieldType.OE,
        defaultOrMaker: EncodingOptionsPreset.H264_720P_30,
        valueOf: EncodingOptionsPreset.valueOf,
        enumValues: EncodingOptionsPreset.values)
    ..aOM<EncodingOptions>(2, _omitFieldNames ? '' : 'advanced',
        subBuilder: EncodingOptions.create)
    ..pc<EncodedFileOutput>(
        3, _omitFieldNames ? '' : 'fileOutputs', $pb.PbFieldType.PM,
        subBuilder: EncodedFileOutput.create)
    ..pc<SegmentedFileOutput>(
        4, _omitFieldNames ? '' : 'segmentOutputs', $pb.PbFieldType.PM,
        subBuilder: SegmentedFileOutput.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoParticipantEgress clone() =>
      AutoParticipantEgress()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoParticipantEgress copyWith(
          void Function(AutoParticipantEgress) updates) =>
      super.copyWith((message) => updates(message as AutoParticipantEgress))
          as AutoParticipantEgress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutoParticipantEgress create() => AutoParticipantEgress._();
  @$core.override
  AutoParticipantEgress createEmptyInstance() => create();
  static $pb.PbList<AutoParticipantEgress> createRepeated() =>
      $pb.PbList<AutoParticipantEgress>();
  @$core.pragma('dart2js:noInline')
  static AutoParticipantEgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AutoParticipantEgress>(create);
  static AutoParticipantEgress? _defaultInstance;

  AutoParticipantEgress_Options whichOptions() =>
      _AutoParticipantEgress_OptionsByTag[$_whichOneof(0)]!;
  void clearOptions() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  EncodingOptionsPreset get preset => $_getN(0);
  @$pb.TagNumber(1)
  set preset(EncodingOptionsPreset value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPreset() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreset() => $_clearField(1);

  @$pb.TagNumber(2)
  EncodingOptions get advanced => $_getN(1);
  @$pb.TagNumber(2)
  set advanced(EncodingOptions value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAdvanced() => $_has(1);
  @$pb.TagNumber(2)
  void clearAdvanced() => $_clearField(2);
  @$pb.TagNumber(2)
  EncodingOptions ensureAdvanced() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbList<EncodedFileOutput> get fileOutputs => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<SegmentedFileOutput> get segmentOutputs => $_getList(3);
}

enum AutoTrackEgress_Output { s3, gcp, azure, aliOSS, notSet }

class AutoTrackEgress extends $pb.GeneratedMessage {
  factory AutoTrackEgress({
    $core.String? filepath,
    S3Upload? s3,
    GCPUpload? gcp,
    AzureBlobUpload? azure,
    $core.bool? disableManifest,
    AliOSSUpload? aliOSS,
  }) {
    final result = create();
    if (filepath != null) result.filepath = filepath;
    if (s3 != null) result.s3 = s3;
    if (gcp != null) result.gcp = gcp;
    if (azure != null) result.azure = azure;
    if (disableManifest != null) result.disableManifest = disableManifest;
    if (aliOSS != null) result.aliOSS = aliOSS;
    return result;
  }

  AutoTrackEgress._();

  factory AutoTrackEgress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AutoTrackEgress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, AutoTrackEgress_Output>
      _AutoTrackEgress_OutputByTag = {
    2: AutoTrackEgress_Output.s3,
    3: AutoTrackEgress_Output.gcp,
    4: AutoTrackEgress_Output.azure,
    6: AutoTrackEgress_Output.aliOSS,
    0: AutoTrackEgress_Output.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AutoTrackEgress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 6])
    ..aOS(1, _omitFieldNames ? '' : 'filepath')
    ..aOM<S3Upload>(2, _omitFieldNames ? '' : 's3', subBuilder: S3Upload.create)
    ..aOM<GCPUpload>(3, _omitFieldNames ? '' : 'gcp',
        subBuilder: GCPUpload.create)
    ..aOM<AzureBlobUpload>(4, _omitFieldNames ? '' : 'azure',
        subBuilder: AzureBlobUpload.create)
    ..aOB(5, _omitFieldNames ? '' : 'disableManifest')
    ..aOM<AliOSSUpload>(6, _omitFieldNames ? '' : 'aliOSS',
        protoName: 'aliOSS', subBuilder: AliOSSUpload.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoTrackEgress clone() => AutoTrackEgress()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoTrackEgress copyWith(void Function(AutoTrackEgress) updates) =>
      super.copyWith((message) => updates(message as AutoTrackEgress))
          as AutoTrackEgress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutoTrackEgress create() => AutoTrackEgress._();
  @$core.override
  AutoTrackEgress createEmptyInstance() => create();
  static $pb.PbList<AutoTrackEgress> createRepeated() =>
      $pb.PbList<AutoTrackEgress>();
  @$core.pragma('dart2js:noInline')
  static AutoTrackEgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AutoTrackEgress>(create);
  static AutoTrackEgress? _defaultInstance;

  AutoTrackEgress_Output whichOutput() =>
      _AutoTrackEgress_OutputByTag[$_whichOneof(0)]!;
  void clearOutput() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get filepath => $_getSZ(0);
  @$pb.TagNumber(1)
  set filepath($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFilepath() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilepath() => $_clearField(1);

  @$pb.TagNumber(2)
  S3Upload get s3 => $_getN(1);
  @$pb.TagNumber(2)
  set s3(S3Upload value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasS3() => $_has(1);
  @$pb.TagNumber(2)
  void clearS3() => $_clearField(2);
  @$pb.TagNumber(2)
  S3Upload ensureS3() => $_ensure(1);

  @$pb.TagNumber(3)
  GCPUpload get gcp => $_getN(2);
  @$pb.TagNumber(3)
  set gcp(GCPUpload value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGcp() => $_has(2);
  @$pb.TagNumber(3)
  void clearGcp() => $_clearField(3);
  @$pb.TagNumber(3)
  GCPUpload ensureGcp() => $_ensure(2);

  @$pb.TagNumber(4)
  AzureBlobUpload get azure => $_getN(3);
  @$pb.TagNumber(4)
  set azure(AzureBlobUpload value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAzure() => $_has(3);
  @$pb.TagNumber(4)
  void clearAzure() => $_clearField(4);
  @$pb.TagNumber(4)
  AzureBlobUpload ensureAzure() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get disableManifest => $_getBF(4);
  @$pb.TagNumber(5)
  set disableManifest($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDisableManifest() => $_has(4);
  @$pb.TagNumber(5)
  void clearDisableManifest() => $_clearField(5);

  @$pb.TagNumber(6)
  AliOSSUpload get aliOSS => $_getN(5);
  @$pb.TagNumber(6)
  set aliOSS(AliOSSUpload value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasAliOSS() => $_has(5);
  @$pb.TagNumber(6)
  void clearAliOSS() => $_clearField(6);
  @$pb.TagNumber(6)
  AliOSSUpload ensureAliOSS() => $_ensure(5);
}

class EgressApi {
  final $pb.RpcClient _client;

  EgressApi(this._client);

  /// start recording or streaming a room, participant, or tracks
  $async.Future<EgressInfo> startRoomCompositeEgress(
          $pb.ClientContext? ctx, RoomCompositeEgressRequest request) =>
      _client.invoke<EgressInfo>(
          ctx, 'Egress', 'StartRoomCompositeEgress', request, EgressInfo());
  $async.Future<EgressInfo> startWebEgress(
          $pb.ClientContext? ctx, WebEgressRequest request) =>
      _client.invoke<EgressInfo>(
          ctx, 'Egress', 'StartWebEgress', request, EgressInfo());
  $async.Future<EgressInfo> startParticipantEgress(
          $pb.ClientContext? ctx, ParticipantEgressRequest request) =>
      _client.invoke<EgressInfo>(
          ctx, 'Egress', 'StartParticipantEgress', request, EgressInfo());
  $async.Future<EgressInfo> startTrackCompositeEgress(
          $pb.ClientContext? ctx, TrackCompositeEgressRequest request) =>
      _client.invoke<EgressInfo>(
          ctx, 'Egress', 'StartTrackCompositeEgress', request, EgressInfo());
  $async.Future<EgressInfo> startTrackEgress(
          $pb.ClientContext? ctx, TrackEgressRequest request) =>
      _client.invoke<EgressInfo>(
          ctx, 'Egress', 'StartTrackEgress', request, EgressInfo());

  /// update web composite layout
  $async.Future<EgressInfo> updateLayout(
          $pb.ClientContext? ctx, UpdateLayoutRequest request) =>
      _client.invoke<EgressInfo>(
          ctx, 'Egress', 'UpdateLayout', request, EgressInfo());

  /// add or remove stream endpoints
  $async.Future<EgressInfo> updateStream(
          $pb.ClientContext? ctx, UpdateStreamRequest request) =>
      _client.invoke<EgressInfo>(
          ctx, 'Egress', 'UpdateStream', request, EgressInfo());

  /// list available egress
  $async.Future<ListEgressResponse> listEgress(
          $pb.ClientContext? ctx, ListEgressRequest request) =>
      _client.invoke<ListEgressResponse>(
          ctx, 'Egress', 'ListEgress', request, ListEgressResponse());

  /// stop a recording or stream
  $async.Future<EgressInfo> stopEgress(
          $pb.ClientContext? ctx, StopEgressRequest request) =>
      _client.invoke<EgressInfo>(
          ctx, 'Egress', 'StopEgress', request, EgressInfo());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
