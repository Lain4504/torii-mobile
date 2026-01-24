// This is a generated file - do not edit.
//
// Generated from livekit_ingress.proto.

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

import 'livekit_ingress.pbenum.dart';
import 'livekit_models.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'livekit_ingress.pbenum.dart';

class CreateIngressRequest extends $pb.GeneratedMessage {
  factory CreateIngressRequest({
    IngressInput? inputType,
    $core.String? name,
    $core.String? roomName,
    $core.String? participantIdentity,
    $core.String? participantName,
    IngressAudioOptions? audio,
    IngressVideoOptions? video,
    @$core.Deprecated('This field is deprecated.')
    $core.bool? bypassTranscoding,
    $core.String? url,
    $core.String? participantMetadata,
    $core.bool? enableTranscoding,
    $core.bool? enabled,
  }) {
    final result = create();
    if (inputType != null) result.inputType = inputType;
    if (name != null) result.name = name;
    if (roomName != null) result.roomName = roomName;
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (participantName != null) result.participantName = participantName;
    if (audio != null) result.audio = audio;
    if (video != null) result.video = video;
    if (bypassTranscoding != null) result.bypassTranscoding = bypassTranscoding;
    if (url != null) result.url = url;
    if (participantMetadata != null)
      result.participantMetadata = participantMetadata;
    if (enableTranscoding != null) result.enableTranscoding = enableTranscoding;
    if (enabled != null) result.enabled = enabled;
    return result;
  }

  CreateIngressRequest._();

  factory CreateIngressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateIngressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateIngressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aE<IngressInput>(1, _omitFieldNames ? '' : 'inputType',
        enumValues: IngressInput.values)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'roomName')
    ..aOS(4, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(5, _omitFieldNames ? '' : 'participantName')
    ..aOM<IngressAudioOptions>(6, _omitFieldNames ? '' : 'audio',
        subBuilder: IngressAudioOptions.create)
    ..aOM<IngressVideoOptions>(7, _omitFieldNames ? '' : 'video',
        subBuilder: IngressVideoOptions.create)
    ..aOB(8, _omitFieldNames ? '' : 'bypassTranscoding')
    ..aOS(9, _omitFieldNames ? '' : 'url')
    ..aOS(10, _omitFieldNames ? '' : 'participantMetadata')
    ..aOB(11, _omitFieldNames ? '' : 'enableTranscoding')
    ..aOB(12, _omitFieldNames ? '' : 'enabled')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateIngressRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateIngressRequest copyWith(void Function(CreateIngressRequest) updates) =>
      super.copyWith((message) => updates(message as CreateIngressRequest))
          as CreateIngressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateIngressRequest create() => CreateIngressRequest._();
  @$core.override
  CreateIngressRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateIngressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateIngressRequest>(create);
  static CreateIngressRequest? _defaultInstance;

  @$pb.TagNumber(1)
  IngressInput get inputType => $_getN(0);
  @$pb.TagNumber(1)
  set inputType(IngressInput value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInputType() => $_has(0);
  @$pb.TagNumber(1)
  void clearInputType() => $_clearField(1);

  /// User provided identifier for the ingress
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// room to publish to
  @$pb.TagNumber(3)
  $core.String get roomName => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomName() => $_clearField(3);

  /// publish as participant
  @$pb.TagNumber(4)
  $core.String get participantIdentity => $_getSZ(3);
  @$pb.TagNumber(4)
  set participantIdentity($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasParticipantIdentity() => $_has(3);
  @$pb.TagNumber(4)
  void clearParticipantIdentity() => $_clearField(4);

  /// name of publishing participant (used for display only)
  @$pb.TagNumber(5)
  $core.String get participantName => $_getSZ(4);
  @$pb.TagNumber(5)
  set participantName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasParticipantName() => $_has(4);
  @$pb.TagNumber(5)
  void clearParticipantName() => $_clearField(5);

  @$pb.TagNumber(6)
  IngressAudioOptions get audio => $_getN(5);
  @$pb.TagNumber(6)
  set audio(IngressAudioOptions value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasAudio() => $_has(5);
  @$pb.TagNumber(6)
  void clearAudio() => $_clearField(6);
  @$pb.TagNumber(6)
  IngressAudioOptions ensureAudio() => $_ensure(5);

  @$pb.TagNumber(7)
  IngressVideoOptions get video => $_getN(6);
  @$pb.TagNumber(7)
  set video(IngressVideoOptions value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasVideo() => $_has(6);
  @$pb.TagNumber(7)
  void clearVideo() => $_clearField(7);
  @$pb.TagNumber(7)
  IngressVideoOptions ensureVideo() => $_ensure(6);

  /// [depreacted ] whether to pass through the incoming media without transcoding, only compatible with some input types. Use `enable_transcoding` instead.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.bool get bypassTranscoding => $_getBF(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  set bypassTranscoding($core.bool value) => $_setBool(7, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.bool hasBypassTranscoding() => $_has(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  void clearBypassTranscoding() => $_clearField(8);

  /// Where to pull media from, only for URL input type
  @$pb.TagNumber(9)
  $core.String get url => $_getSZ(8);
  @$pb.TagNumber(9)
  set url($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearUrl() => $_clearField(9);

  /// metadata associated with the publishing participant
  @$pb.TagNumber(10)
  $core.String get participantMetadata => $_getSZ(9);
  @$pb.TagNumber(10)
  set participantMetadata($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasParticipantMetadata() => $_has(9);
  @$pb.TagNumber(10)
  void clearParticipantMetadata() => $_clearField(10);

  /// Whether to transcode the ingested media. Only WHIP supports disabling transcoding currently. WHIP will default to transcoding disabled. Replaces `bypass_transcoding.
  @$pb.TagNumber(11)
  $core.bool get enableTranscoding => $_getBF(10);
  @$pb.TagNumber(11)
  set enableTranscoding($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasEnableTranscoding() => $_has(10);
  @$pb.TagNumber(11)
  void clearEnableTranscoding() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get enabled => $_getBF(11);
  @$pb.TagNumber(12)
  set enabled($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasEnabled() => $_has(11);
  @$pb.TagNumber(12)
  void clearEnabled() => $_clearField(12);
}

enum IngressAudioOptions_EncodingOptions { preset, options, notSet }

class IngressAudioOptions extends $pb.GeneratedMessage {
  factory IngressAudioOptions({
    $core.String? name,
    $0.TrackSource? source,
    IngressAudioEncodingPreset? preset,
    IngressAudioEncodingOptions? options,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (source != null) result.source = source;
    if (preset != null) result.preset = preset;
    if (options != null) result.options = options;
    return result;
  }

  IngressAudioOptions._();

  factory IngressAudioOptions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IngressAudioOptions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, IngressAudioOptions_EncodingOptions>
      _IngressAudioOptions_EncodingOptionsByTag = {
    3: IngressAudioOptions_EncodingOptions.preset,
    4: IngressAudioOptions_EncodingOptions.options,
    0: IngressAudioOptions_EncodingOptions.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IngressAudioOptions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aE<$0.TrackSource>(2, _omitFieldNames ? '' : 'source',
        enumValues: $0.TrackSource.values)
    ..aE<IngressAudioEncodingPreset>(3, _omitFieldNames ? '' : 'preset',
        enumValues: IngressAudioEncodingPreset.values)
    ..aOM<IngressAudioEncodingOptions>(4, _omitFieldNames ? '' : 'options',
        subBuilder: IngressAudioEncodingOptions.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressAudioOptions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressAudioOptions copyWith(void Function(IngressAudioOptions) updates) =>
      super.copyWith((message) => updates(message as IngressAudioOptions))
          as IngressAudioOptions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IngressAudioOptions create() => IngressAudioOptions._();
  @$core.override
  IngressAudioOptions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IngressAudioOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IngressAudioOptions>(create);
  static IngressAudioOptions? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  IngressAudioOptions_EncodingOptions whichEncodingOptions() =>
      _IngressAudioOptions_EncodingOptionsByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearEncodingOptions() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.TrackSource get source => $_getN(1);
  @$pb.TagNumber(2)
  set source($0.TrackSource value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSource() => $_has(1);
  @$pb.TagNumber(2)
  void clearSource() => $_clearField(2);

  @$pb.TagNumber(3)
  IngressAudioEncodingPreset get preset => $_getN(2);
  @$pb.TagNumber(3)
  set preset(IngressAudioEncodingPreset value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPreset() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreset() => $_clearField(3);

  @$pb.TagNumber(4)
  IngressAudioEncodingOptions get options => $_getN(3);
  @$pb.TagNumber(4)
  set options(IngressAudioEncodingOptions value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasOptions() => $_has(3);
  @$pb.TagNumber(4)
  void clearOptions() => $_clearField(4);
  @$pb.TagNumber(4)
  IngressAudioEncodingOptions ensureOptions() => $_ensure(3);
}

enum IngressVideoOptions_EncodingOptions { preset, options, notSet }

class IngressVideoOptions extends $pb.GeneratedMessage {
  factory IngressVideoOptions({
    $core.String? name,
    $0.TrackSource? source,
    IngressVideoEncodingPreset? preset,
    IngressVideoEncodingOptions? options,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (source != null) result.source = source;
    if (preset != null) result.preset = preset;
    if (options != null) result.options = options;
    return result;
  }

  IngressVideoOptions._();

  factory IngressVideoOptions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IngressVideoOptions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, IngressVideoOptions_EncodingOptions>
      _IngressVideoOptions_EncodingOptionsByTag = {
    3: IngressVideoOptions_EncodingOptions.preset,
    4: IngressVideoOptions_EncodingOptions.options,
    0: IngressVideoOptions_EncodingOptions.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IngressVideoOptions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aE<$0.TrackSource>(2, _omitFieldNames ? '' : 'source',
        enumValues: $0.TrackSource.values)
    ..aE<IngressVideoEncodingPreset>(3, _omitFieldNames ? '' : 'preset',
        enumValues: IngressVideoEncodingPreset.values)
    ..aOM<IngressVideoEncodingOptions>(4, _omitFieldNames ? '' : 'options',
        subBuilder: IngressVideoEncodingOptions.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressVideoOptions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressVideoOptions copyWith(void Function(IngressVideoOptions) updates) =>
      super.copyWith((message) => updates(message as IngressVideoOptions))
          as IngressVideoOptions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IngressVideoOptions create() => IngressVideoOptions._();
  @$core.override
  IngressVideoOptions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IngressVideoOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IngressVideoOptions>(create);
  static IngressVideoOptions? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  IngressVideoOptions_EncodingOptions whichEncodingOptions() =>
      _IngressVideoOptions_EncodingOptionsByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearEncodingOptions() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.TrackSource get source => $_getN(1);
  @$pb.TagNumber(2)
  set source($0.TrackSource value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSource() => $_has(1);
  @$pb.TagNumber(2)
  void clearSource() => $_clearField(2);

  @$pb.TagNumber(3)
  IngressVideoEncodingPreset get preset => $_getN(2);
  @$pb.TagNumber(3)
  set preset(IngressVideoEncodingPreset value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPreset() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreset() => $_clearField(3);

  @$pb.TagNumber(4)
  IngressVideoEncodingOptions get options => $_getN(3);
  @$pb.TagNumber(4)
  set options(IngressVideoEncodingOptions value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasOptions() => $_has(3);
  @$pb.TagNumber(4)
  void clearOptions() => $_clearField(4);
  @$pb.TagNumber(4)
  IngressVideoEncodingOptions ensureOptions() => $_ensure(3);
}

class IngressAudioEncodingOptions extends $pb.GeneratedMessage {
  factory IngressAudioEncodingOptions({
    $0.AudioCodec? audioCodec,
    $core.int? bitrate,
    $core.bool? disableDtx,
    $core.int? channels,
  }) {
    final result = create();
    if (audioCodec != null) result.audioCodec = audioCodec;
    if (bitrate != null) result.bitrate = bitrate;
    if (disableDtx != null) result.disableDtx = disableDtx;
    if (channels != null) result.channels = channels;
    return result;
  }

  IngressAudioEncodingOptions._();

  factory IngressAudioEncodingOptions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IngressAudioEncodingOptions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IngressAudioEncodingOptions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aE<$0.AudioCodec>(1, _omitFieldNames ? '' : 'audioCodec',
        enumValues: $0.AudioCodec.values)
    ..aI(2, _omitFieldNames ? '' : 'bitrate', fieldType: $pb.PbFieldType.OU3)
    ..aOB(3, _omitFieldNames ? '' : 'disableDtx')
    ..aI(4, _omitFieldNames ? '' : 'channels', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressAudioEncodingOptions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressAudioEncodingOptions copyWith(
          void Function(IngressAudioEncodingOptions) updates) =>
      super.copyWith(
              (message) => updates(message as IngressAudioEncodingOptions))
          as IngressAudioEncodingOptions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IngressAudioEncodingOptions create() =>
      IngressAudioEncodingOptions._();
  @$core.override
  IngressAudioEncodingOptions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IngressAudioEncodingOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IngressAudioEncodingOptions>(create);
  static IngressAudioEncodingOptions? _defaultInstance;

  /// desired audio codec to publish to room
  @$pb.TagNumber(1)
  $0.AudioCodec get audioCodec => $_getN(0);
  @$pb.TagNumber(1)
  set audioCodec($0.AudioCodec value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAudioCodec() => $_has(0);
  @$pb.TagNumber(1)
  void clearAudioCodec() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get bitrate => $_getIZ(1);
  @$pb.TagNumber(2)
  set bitrate($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBitrate() => $_has(1);
  @$pb.TagNumber(2)
  void clearBitrate() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get disableDtx => $_getBF(2);
  @$pb.TagNumber(3)
  set disableDtx($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDisableDtx() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisableDtx() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get channels => $_getIZ(3);
  @$pb.TagNumber(4)
  set channels($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChannels() => $_has(3);
  @$pb.TagNumber(4)
  void clearChannels() => $_clearField(4);
}

class IngressVideoEncodingOptions extends $pb.GeneratedMessage {
  factory IngressVideoEncodingOptions({
    $0.VideoCodec? videoCodec,
    $core.double? frameRate,
    $core.Iterable<$0.VideoLayer>? layers,
  }) {
    final result = create();
    if (videoCodec != null) result.videoCodec = videoCodec;
    if (frameRate != null) result.frameRate = frameRate;
    if (layers != null) result.layers.addAll(layers);
    return result;
  }

  IngressVideoEncodingOptions._();

  factory IngressVideoEncodingOptions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IngressVideoEncodingOptions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IngressVideoEncodingOptions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aE<$0.VideoCodec>(1, _omitFieldNames ? '' : 'videoCodec',
        enumValues: $0.VideoCodec.values)
    ..aD(2, _omitFieldNames ? '' : 'frameRate')
    ..pPM<$0.VideoLayer>(3, _omitFieldNames ? '' : 'layers',
        subBuilder: $0.VideoLayer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressVideoEncodingOptions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressVideoEncodingOptions copyWith(
          void Function(IngressVideoEncodingOptions) updates) =>
      super.copyWith(
              (message) => updates(message as IngressVideoEncodingOptions))
          as IngressVideoEncodingOptions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IngressVideoEncodingOptions create() =>
      IngressVideoEncodingOptions._();
  @$core.override
  IngressVideoEncodingOptions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IngressVideoEncodingOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IngressVideoEncodingOptions>(create);
  static IngressVideoEncodingOptions? _defaultInstance;

  /// desired codec to publish to room
  @$pb.TagNumber(1)
  $0.VideoCodec get videoCodec => $_getN(0);
  @$pb.TagNumber(1)
  set videoCodec($0.VideoCodec value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasVideoCodec() => $_has(0);
  @$pb.TagNumber(1)
  void clearVideoCodec() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get frameRate => $_getN(1);
  @$pb.TagNumber(2)
  set frameRate($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFrameRate() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrameRate() => $_clearField(2);

  /// simulcast layers to publish, when empty, should usually be set to layers at 1/2 and 1/4 of the dimensions
  @$pb.TagNumber(3)
  $pb.PbList<$0.VideoLayer> get layers => $_getList(2);
}

class IngressInfo extends $pb.GeneratedMessage {
  factory IngressInfo({
    $core.String? ingressId,
    $core.String? name,
    $core.String? streamKey,
    $core.String? url,
    IngressInput? inputType,
    IngressAudioOptions? audio,
    IngressVideoOptions? video,
    $core.String? roomName,
    $core.String? participantIdentity,
    $core.String? participantName,
    $core.bool? reusable,
    IngressState? state,
    @$core.Deprecated('This field is deprecated.')
    $core.bool? bypassTranscoding,
    $core.String? participantMetadata,
    $core.bool? enableTranscoding,
    $core.bool? enabled,
  }) {
    final result = create();
    if (ingressId != null) result.ingressId = ingressId;
    if (name != null) result.name = name;
    if (streamKey != null) result.streamKey = streamKey;
    if (url != null) result.url = url;
    if (inputType != null) result.inputType = inputType;
    if (audio != null) result.audio = audio;
    if (video != null) result.video = video;
    if (roomName != null) result.roomName = roomName;
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (participantName != null) result.participantName = participantName;
    if (reusable != null) result.reusable = reusable;
    if (state != null) result.state = state;
    if (bypassTranscoding != null) result.bypassTranscoding = bypassTranscoding;
    if (participantMetadata != null)
      result.participantMetadata = participantMetadata;
    if (enableTranscoding != null) result.enableTranscoding = enableTranscoding;
    if (enabled != null) result.enabled = enabled;
    return result;
  }

  IngressInfo._();

  factory IngressInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IngressInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IngressInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ingressId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'streamKey')
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..aE<IngressInput>(5, _omitFieldNames ? '' : 'inputType',
        enumValues: IngressInput.values)
    ..aOM<IngressAudioOptions>(6, _omitFieldNames ? '' : 'audio',
        subBuilder: IngressAudioOptions.create)
    ..aOM<IngressVideoOptions>(7, _omitFieldNames ? '' : 'video',
        subBuilder: IngressVideoOptions.create)
    ..aOS(8, _omitFieldNames ? '' : 'roomName')
    ..aOS(9, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(10, _omitFieldNames ? '' : 'participantName')
    ..aOB(11, _omitFieldNames ? '' : 'reusable')
    ..aOM<IngressState>(12, _omitFieldNames ? '' : 'state',
        subBuilder: IngressState.create)
    ..aOB(13, _omitFieldNames ? '' : 'bypassTranscoding')
    ..aOS(14, _omitFieldNames ? '' : 'participantMetadata')
    ..aOB(15, _omitFieldNames ? '' : 'enableTranscoding')
    ..aOB(16, _omitFieldNames ? '' : 'enabled')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressInfo copyWith(void Function(IngressInfo) updates) =>
      super.copyWith((message) => updates(message as IngressInfo))
          as IngressInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IngressInfo create() => IngressInfo._();
  @$core.override
  IngressInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IngressInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IngressInfo>(create);
  static IngressInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ingressId => $_getSZ(0);
  @$pb.TagNumber(1)
  set ingressId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIngressId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIngressId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get streamKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set streamKey($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStreamKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearStreamKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => $_clearField(4);

  /// for RTMP input, it'll be a rtmp:// URL
  /// for FILE input, it'll be a http:// URL
  /// for SRT input, it'll be a srt:// URL
  @$pb.TagNumber(5)
  IngressInput get inputType => $_getN(4);
  @$pb.TagNumber(5)
  set inputType(IngressInput value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasInputType() => $_has(4);
  @$pb.TagNumber(5)
  void clearInputType() => $_clearField(5);

  @$pb.TagNumber(6)
  IngressAudioOptions get audio => $_getN(5);
  @$pb.TagNumber(6)
  set audio(IngressAudioOptions value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasAudio() => $_has(5);
  @$pb.TagNumber(6)
  void clearAudio() => $_clearField(6);
  @$pb.TagNumber(6)
  IngressAudioOptions ensureAudio() => $_ensure(5);

  @$pb.TagNumber(7)
  IngressVideoOptions get video => $_getN(6);
  @$pb.TagNumber(7)
  set video(IngressVideoOptions value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasVideo() => $_has(6);
  @$pb.TagNumber(7)
  void clearVideo() => $_clearField(7);
  @$pb.TagNumber(7)
  IngressVideoOptions ensureVideo() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get roomName => $_getSZ(7);
  @$pb.TagNumber(8)
  set roomName($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRoomName() => $_has(7);
  @$pb.TagNumber(8)
  void clearRoomName() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get participantIdentity => $_getSZ(8);
  @$pb.TagNumber(9)
  set participantIdentity($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasParticipantIdentity() => $_has(8);
  @$pb.TagNumber(9)
  void clearParticipantIdentity() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get participantName => $_getSZ(9);
  @$pb.TagNumber(10)
  set participantName($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasParticipantName() => $_has(9);
  @$pb.TagNumber(10)
  void clearParticipantName() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get reusable => $_getBF(10);
  @$pb.TagNumber(11)
  set reusable($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasReusable() => $_has(10);
  @$pb.TagNumber(11)
  void clearReusable() => $_clearField(11);

  @$pb.TagNumber(12)
  IngressState get state => $_getN(11);
  @$pb.TagNumber(12)
  set state(IngressState value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasState() => $_has(11);
  @$pb.TagNumber(12)
  void clearState() => $_clearField(12);
  @$pb.TagNumber(12)
  IngressState ensureState() => $_ensure(11);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  $core.bool get bypassTranscoding => $_getBF(12);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  set bypassTranscoding($core.bool value) => $_setBool(12, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  $core.bool hasBypassTranscoding() => $_has(12);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  void clearBypassTranscoding() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get participantMetadata => $_getSZ(13);
  @$pb.TagNumber(14)
  set participantMetadata($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasParticipantMetadata() => $_has(13);
  @$pb.TagNumber(14)
  void clearParticipantMetadata() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.bool get enableTranscoding => $_getBF(14);
  @$pb.TagNumber(15)
  set enableTranscoding($core.bool value) => $_setBool(14, value);
  @$pb.TagNumber(15)
  $core.bool hasEnableTranscoding() => $_has(14);
  @$pb.TagNumber(15)
  void clearEnableTranscoding() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.bool get enabled => $_getBF(15);
  @$pb.TagNumber(16)
  set enabled($core.bool value) => $_setBool(15, value);
  @$pb.TagNumber(16)
  $core.bool hasEnabled() => $_has(15);
  @$pb.TagNumber(16)
  void clearEnabled() => $_clearField(16);
}

class IngressState extends $pb.GeneratedMessage {
  factory IngressState({
    IngressState_Status? status,
    $core.String? error,
    InputVideoState? video,
    InputAudioState? audio,
    $core.String? roomId,
    $core.Iterable<$0.TrackInfo>? tracks,
    $fixnum.Int64? startedAt,
    $fixnum.Int64? endedAt,
    $core.String? resourceId,
    $fixnum.Int64? updatedAt,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (error != null) result.error = error;
    if (video != null) result.video = video;
    if (audio != null) result.audio = audio;
    if (roomId != null) result.roomId = roomId;
    if (tracks != null) result.tracks.addAll(tracks);
    if (startedAt != null) result.startedAt = startedAt;
    if (endedAt != null) result.endedAt = endedAt;
    if (resourceId != null) result.resourceId = resourceId;
    if (updatedAt != null) result.updatedAt = updatedAt;
    return result;
  }

  IngressState._();

  factory IngressState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IngressState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IngressState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aE<IngressState_Status>(1, _omitFieldNames ? '' : 'status',
        enumValues: IngressState_Status.values)
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..aOM<InputVideoState>(3, _omitFieldNames ? '' : 'video',
        subBuilder: InputVideoState.create)
    ..aOM<InputAudioState>(4, _omitFieldNames ? '' : 'audio',
        subBuilder: InputAudioState.create)
    ..aOS(5, _omitFieldNames ? '' : 'roomId')
    ..pPM<$0.TrackInfo>(6, _omitFieldNames ? '' : 'tracks',
        subBuilder: $0.TrackInfo.create)
    ..aInt64(7, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(8, _omitFieldNames ? '' : 'endedAt')
    ..aOS(9, _omitFieldNames ? '' : 'resourceId')
    ..aInt64(10, _omitFieldNames ? '' : 'updatedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngressState copyWith(void Function(IngressState) updates) =>
      super.copyWith((message) => updates(message as IngressState))
          as IngressState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IngressState create() => IngressState._();
  @$core.override
  IngressState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IngressState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IngressState>(create);
  static IngressState? _defaultInstance;

  @$pb.TagNumber(1)
  IngressState_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(IngressState_Status value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);

  @$pb.TagNumber(3)
  InputVideoState get video => $_getN(2);
  @$pb.TagNumber(3)
  set video(InputVideoState value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasVideo() => $_has(2);
  @$pb.TagNumber(3)
  void clearVideo() => $_clearField(3);
  @$pb.TagNumber(3)
  InputVideoState ensureVideo() => $_ensure(2);

  @$pb.TagNumber(4)
  InputAudioState get audio => $_getN(3);
  @$pb.TagNumber(4)
  set audio(InputAudioState value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAudio() => $_has(3);
  @$pb.TagNumber(4)
  void clearAudio() => $_clearField(4);
  @$pb.TagNumber(4)
  InputAudioState ensureAudio() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get roomId => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRoomId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomId() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$0.TrackInfo> get tracks => $_getList(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get startedAt => $_getI64(6);
  @$pb.TagNumber(7)
  set startedAt($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStartedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearStartedAt() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get endedAt => $_getI64(7);
  @$pb.TagNumber(8)
  set endedAt($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasEndedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearEndedAt() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get resourceId => $_getSZ(8);
  @$pb.TagNumber(9)
  set resourceId($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasResourceId() => $_has(8);
  @$pb.TagNumber(9)
  void clearResourceId() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get updatedAt => $_getI64(9);
  @$pb.TagNumber(10)
  set updatedAt($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasUpdatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdatedAt() => $_clearField(10);
}

class InputVideoState extends $pb.GeneratedMessage {
  factory InputVideoState({
    $core.String? mimeType,
    $core.int? averageBitrate,
    $core.int? width,
    $core.int? height,
    $core.double? framerate,
  }) {
    final result = create();
    if (mimeType != null) result.mimeType = mimeType;
    if (averageBitrate != null) result.averageBitrate = averageBitrate;
    if (width != null) result.width = width;
    if (height != null) result.height = height;
    if (framerate != null) result.framerate = framerate;
    return result;
  }

  InputVideoState._();

  factory InputVideoState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InputVideoState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InputVideoState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mimeType')
    ..aI(2, _omitFieldNames ? '' : 'averageBitrate',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'width', fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'height', fieldType: $pb.PbFieldType.OU3)
    ..aD(5, _omitFieldNames ? '' : 'framerate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputVideoState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputVideoState copyWith(void Function(InputVideoState) updates) =>
      super.copyWith((message) => updates(message as InputVideoState))
          as InputVideoState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputVideoState create() => InputVideoState._();
  @$core.override
  InputVideoState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InputVideoState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InputVideoState>(create);
  static InputVideoState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mimeType => $_getSZ(0);
  @$pb.TagNumber(1)
  set mimeType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMimeType() => $_has(0);
  @$pb.TagNumber(1)
  void clearMimeType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get averageBitrate => $_getIZ(1);
  @$pb.TagNumber(2)
  set averageBitrate($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAverageBitrate() => $_has(1);
  @$pb.TagNumber(2)
  void clearAverageBitrate() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get framerate => $_getN(4);
  @$pb.TagNumber(5)
  set framerate($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFramerate() => $_has(4);
  @$pb.TagNumber(5)
  void clearFramerate() => $_clearField(5);
}

class InputAudioState extends $pb.GeneratedMessage {
  factory InputAudioState({
    $core.String? mimeType,
    $core.int? averageBitrate,
    $core.int? channels,
    $core.int? sampleRate,
  }) {
    final result = create();
    if (mimeType != null) result.mimeType = mimeType;
    if (averageBitrate != null) result.averageBitrate = averageBitrate;
    if (channels != null) result.channels = channels;
    if (sampleRate != null) result.sampleRate = sampleRate;
    return result;
  }

  InputAudioState._();

  factory InputAudioState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InputAudioState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InputAudioState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mimeType')
    ..aI(2, _omitFieldNames ? '' : 'averageBitrate',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'channels', fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'sampleRate', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputAudioState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputAudioState copyWith(void Function(InputAudioState) updates) =>
      super.copyWith((message) => updates(message as InputAudioState))
          as InputAudioState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputAudioState create() => InputAudioState._();
  @$core.override
  InputAudioState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InputAudioState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InputAudioState>(create);
  static InputAudioState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mimeType => $_getSZ(0);
  @$pb.TagNumber(1)
  set mimeType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMimeType() => $_has(0);
  @$pb.TagNumber(1)
  void clearMimeType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get averageBitrate => $_getIZ(1);
  @$pb.TagNumber(2)
  set averageBitrate($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAverageBitrate() => $_has(1);
  @$pb.TagNumber(2)
  void clearAverageBitrate() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get channels => $_getIZ(2);
  @$pb.TagNumber(3)
  set channels($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannels() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannels() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get sampleRate => $_getIZ(3);
  @$pb.TagNumber(4)
  set sampleRate($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSampleRate() => $_has(3);
  @$pb.TagNumber(4)
  void clearSampleRate() => $_clearField(4);
}

class UpdateIngressRequest extends $pb.GeneratedMessage {
  factory UpdateIngressRequest({
    $core.String? ingressId,
    $core.String? name,
    $core.String? roomName,
    $core.String? participantIdentity,
    $core.String? participantName,
    IngressAudioOptions? audio,
    IngressVideoOptions? video,
    @$core.Deprecated('This field is deprecated.')
    $core.bool? bypassTranscoding,
    $core.String? participantMetadata,
    $core.bool? enableTranscoding,
    $core.bool? enabled,
  }) {
    final result = create();
    if (ingressId != null) result.ingressId = ingressId;
    if (name != null) result.name = name;
    if (roomName != null) result.roomName = roomName;
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (participantName != null) result.participantName = participantName;
    if (audio != null) result.audio = audio;
    if (video != null) result.video = video;
    if (bypassTranscoding != null) result.bypassTranscoding = bypassTranscoding;
    if (participantMetadata != null)
      result.participantMetadata = participantMetadata;
    if (enableTranscoding != null) result.enableTranscoding = enableTranscoding;
    if (enabled != null) result.enabled = enabled;
    return result;
  }

  UpdateIngressRequest._();

  factory UpdateIngressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateIngressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateIngressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ingressId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'roomName')
    ..aOS(4, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(5, _omitFieldNames ? '' : 'participantName')
    ..aOM<IngressAudioOptions>(6, _omitFieldNames ? '' : 'audio',
        subBuilder: IngressAudioOptions.create)
    ..aOM<IngressVideoOptions>(7, _omitFieldNames ? '' : 'video',
        subBuilder: IngressVideoOptions.create)
    ..aOB(8, _omitFieldNames ? '' : 'bypassTranscoding')
    ..aOS(9, _omitFieldNames ? '' : 'participantMetadata')
    ..aOB(10, _omitFieldNames ? '' : 'enableTranscoding')
    ..aOB(11, _omitFieldNames ? '' : 'enabled')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateIngressRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateIngressRequest copyWith(void Function(UpdateIngressRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateIngressRequest))
          as UpdateIngressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateIngressRequest create() => UpdateIngressRequest._();
  @$core.override
  UpdateIngressRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateIngressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateIngressRequest>(create);
  static UpdateIngressRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ingressId => $_getSZ(0);
  @$pb.TagNumber(1)
  set ingressId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIngressId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIngressId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomName => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get participantIdentity => $_getSZ(3);
  @$pb.TagNumber(4)
  set participantIdentity($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasParticipantIdentity() => $_has(3);
  @$pb.TagNumber(4)
  void clearParticipantIdentity() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get participantName => $_getSZ(4);
  @$pb.TagNumber(5)
  set participantName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasParticipantName() => $_has(4);
  @$pb.TagNumber(5)
  void clearParticipantName() => $_clearField(5);

  @$pb.TagNumber(6)
  IngressAudioOptions get audio => $_getN(5);
  @$pb.TagNumber(6)
  set audio(IngressAudioOptions value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasAudio() => $_has(5);
  @$pb.TagNumber(6)
  void clearAudio() => $_clearField(6);
  @$pb.TagNumber(6)
  IngressAudioOptions ensureAudio() => $_ensure(5);

  @$pb.TagNumber(7)
  IngressVideoOptions get video => $_getN(6);
  @$pb.TagNumber(7)
  set video(IngressVideoOptions value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasVideo() => $_has(6);
  @$pb.TagNumber(7)
  void clearVideo() => $_clearField(7);
  @$pb.TagNumber(7)
  IngressVideoOptions ensureVideo() => $_ensure(6);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.bool get bypassTranscoding => $_getBF(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  set bypassTranscoding($core.bool value) => $_setBool(7, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.bool hasBypassTranscoding() => $_has(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  void clearBypassTranscoding() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get participantMetadata => $_getSZ(8);
  @$pb.TagNumber(9)
  set participantMetadata($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasParticipantMetadata() => $_has(8);
  @$pb.TagNumber(9)
  void clearParticipantMetadata() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get enableTranscoding => $_getBF(9);
  @$pb.TagNumber(10)
  set enableTranscoding($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasEnableTranscoding() => $_has(9);
  @$pb.TagNumber(10)
  void clearEnableTranscoding() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get enabled => $_getBF(10);
  @$pb.TagNumber(11)
  set enabled($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasEnabled() => $_has(10);
  @$pb.TagNumber(11)
  void clearEnabled() => $_clearField(11);
}

class ListIngressRequest extends $pb.GeneratedMessage {
  factory ListIngressRequest({
    $core.String? roomName,
    $core.String? ingressId,
  }) {
    final result = create();
    if (roomName != null) result.roomName = roomName;
    if (ingressId != null) result.ingressId = ingressId;
    return result;
  }

  ListIngressRequest._();

  factory ListIngressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListIngressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListIngressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOS(2, _omitFieldNames ? '' : 'ingressId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListIngressRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListIngressRequest copyWith(void Function(ListIngressRequest) updates) =>
      super.copyWith((message) => updates(message as ListIngressRequest))
          as ListIngressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListIngressRequest create() => ListIngressRequest._();
  @$core.override
  ListIngressRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListIngressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListIngressRequest>(create);
  static ListIngressRequest? _defaultInstance;

  /// when blank, lists all ingress endpoints
  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get ingressId => $_getSZ(1);
  @$pb.TagNumber(2)
  set ingressId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIngressId() => $_has(1);
  @$pb.TagNumber(2)
  void clearIngressId() => $_clearField(2);
}

class ListIngressResponse extends $pb.GeneratedMessage {
  factory ListIngressResponse({
    $core.Iterable<IngressInfo>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListIngressResponse._();

  factory ListIngressResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListIngressResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListIngressResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPM<IngressInfo>(1, _omitFieldNames ? '' : 'items',
        subBuilder: IngressInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListIngressResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListIngressResponse copyWith(void Function(ListIngressResponse) updates) =>
      super.copyWith((message) => updates(message as ListIngressResponse))
          as ListIngressResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListIngressResponse create() => ListIngressResponse._();
  @$core.override
  ListIngressResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListIngressResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListIngressResponse>(create);
  static ListIngressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<IngressInfo> get items => $_getList(0);
}

class DeleteIngressRequest extends $pb.GeneratedMessage {
  factory DeleteIngressRequest({
    $core.String? ingressId,
  }) {
    final result = create();
    if (ingressId != null) result.ingressId = ingressId;
    return result;
  }

  DeleteIngressRequest._();

  factory DeleteIngressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteIngressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteIngressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ingressId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteIngressRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteIngressRequest copyWith(void Function(DeleteIngressRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteIngressRequest))
          as DeleteIngressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteIngressRequest create() => DeleteIngressRequest._();
  @$core.override
  DeleteIngressRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteIngressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteIngressRequest>(create);
  static DeleteIngressRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ingressId => $_getSZ(0);
  @$pb.TagNumber(1)
  set ingressId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIngressId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIngressId() => $_clearField(1);
}

class IngressApi {
  final $pb.RpcClient _client;

  IngressApi(this._client);

  /// Create a new Ingress
  $async.Future<IngressInfo> createIngress(
          $pb.ClientContext? ctx, CreateIngressRequest request) =>
      _client.invoke<IngressInfo>(
          ctx, 'Ingress', 'CreateIngress', request, IngressInfo());

  /// Update an existing Ingress. Ingress can only be updated when it's in ENDPOINT_WAITING state.
  $async.Future<IngressInfo> updateIngress(
          $pb.ClientContext? ctx, UpdateIngressRequest request) =>
      _client.invoke<IngressInfo>(
          ctx, 'Ingress', 'UpdateIngress', request, IngressInfo());
  $async.Future<ListIngressResponse> listIngress(
          $pb.ClientContext? ctx, ListIngressRequest request) =>
      _client.invoke<ListIngressResponse>(
          ctx, 'Ingress', 'ListIngress', request, ListIngressResponse());
  $async.Future<IngressInfo> deleteIngress(
          $pb.ClientContext? ctx, DeleteIngressRequest request) =>
      _client.invoke<IngressInfo>(
          ctx, 'Ingress', 'DeleteIngress', request, IngressInfo());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
