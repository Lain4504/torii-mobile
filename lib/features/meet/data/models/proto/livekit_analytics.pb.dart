// This is a generated file - do not edit.
//
// Generated from livekit_analytics.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $0;

import 'livekit_analytics.pbenum.dart';
import 'livekit_egress.pb.dart' as $2;
import 'livekit_ingress.pb.dart' as $3;
import 'livekit_models.pb.dart' as $1;
import 'livekit_room.pb.dart' as $5;
import 'livekit_sip.pb.dart' as $4;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'livekit_analytics.pbenum.dart';

class AnalyticsVideoLayer extends $pb.GeneratedMessage {
  factory AnalyticsVideoLayer({
    $core.int? layer,
    $core.int? packets,
    $fixnum.Int64? bytes,
    $core.int? frames,
  }) {
    final result = create();
    if (layer != null) result.layer = layer;
    if (packets != null) result.packets = packets;
    if (bytes != null) result.bytes = bytes;
    if (frames != null) result.frames = frames;
    return result;
  }

  AnalyticsVideoLayer._();

  factory AnalyticsVideoLayer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsVideoLayer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsVideoLayer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'layer')
    ..aI(2, _omitFieldNames ? '' : 'packets', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'bytes', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(4, _omitFieldNames ? '' : 'frames', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsVideoLayer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsVideoLayer copyWith(void Function(AnalyticsVideoLayer) updates) =>
      super.copyWith((message) => updates(message as AnalyticsVideoLayer))
          as AnalyticsVideoLayer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsVideoLayer create() => AnalyticsVideoLayer._();
  @$core.override
  AnalyticsVideoLayer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsVideoLayer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsVideoLayer>(create);
  static AnalyticsVideoLayer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get layer => $_getIZ(0);
  @$pb.TagNumber(1)
  set layer($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLayer() => $_has(0);
  @$pb.TagNumber(1)
  void clearLayer() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get packets => $_getIZ(1);
  @$pb.TagNumber(2)
  set packets($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPackets() => $_has(1);
  @$pb.TagNumber(2)
  void clearPackets() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get bytes => $_getI64(2);
  @$pb.TagNumber(3)
  set bytes($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBytes() => $_has(2);
  @$pb.TagNumber(3)
  void clearBytes() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get frames => $_getIZ(3);
  @$pb.TagNumber(4)
  set frames($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFrames() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrames() => $_clearField(4);
}

class AnalyticsStream extends $pb.GeneratedMessage {
  factory AnalyticsStream({
    $core.int? ssrc,
    $core.int? primaryPackets,
    $fixnum.Int64? primaryBytes,
    $core.int? retransmitPackets,
    $fixnum.Int64? retransmitBytes,
    $core.int? paddingPackets,
    $fixnum.Int64? paddingBytes,
    $core.int? packetsLost,
    $core.int? frames,
    $core.int? rtt,
    $core.int? jitter,
    $core.int? nacks,
    $core.int? plis,
    $core.int? firs,
    $core.Iterable<AnalyticsVideoLayer>? videoLayers,
    $0.Timestamp? startTime,
    $0.Timestamp? endTime,
    $core.int? packetsOutOfOrder,
  }) {
    final result = create();
    if (ssrc != null) result.ssrc = ssrc;
    if (primaryPackets != null) result.primaryPackets = primaryPackets;
    if (primaryBytes != null) result.primaryBytes = primaryBytes;
    if (retransmitPackets != null) result.retransmitPackets = retransmitPackets;
    if (retransmitBytes != null) result.retransmitBytes = retransmitBytes;
    if (paddingPackets != null) result.paddingPackets = paddingPackets;
    if (paddingBytes != null) result.paddingBytes = paddingBytes;
    if (packetsLost != null) result.packetsLost = packetsLost;
    if (frames != null) result.frames = frames;
    if (rtt != null) result.rtt = rtt;
    if (jitter != null) result.jitter = jitter;
    if (nacks != null) result.nacks = nacks;
    if (plis != null) result.plis = plis;
    if (firs != null) result.firs = firs;
    if (videoLayers != null) result.videoLayers.addAll(videoLayers);
    if (startTime != null) result.startTime = startTime;
    if (endTime != null) result.endTime = endTime;
    if (packetsOutOfOrder != null) result.packetsOutOfOrder = packetsOutOfOrder;
    return result;
  }

  AnalyticsStream._();

  factory AnalyticsStream.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsStream.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsStream',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'ssrc', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'primaryPackets',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'primaryBytes', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(4, _omitFieldNames ? '' : 'retransmitPackets',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'retransmitBytes', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(6, _omitFieldNames ? '' : 'paddingPackets',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'paddingBytes', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(8, _omitFieldNames ? '' : 'packetsLost',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(9, _omitFieldNames ? '' : 'frames', fieldType: $pb.PbFieldType.OU3)
    ..aI(10, _omitFieldNames ? '' : 'rtt', fieldType: $pb.PbFieldType.OU3)
    ..aI(11, _omitFieldNames ? '' : 'jitter', fieldType: $pb.PbFieldType.OU3)
    ..aI(12, _omitFieldNames ? '' : 'nacks', fieldType: $pb.PbFieldType.OU3)
    ..aI(13, _omitFieldNames ? '' : 'plis', fieldType: $pb.PbFieldType.OU3)
    ..aI(14, _omitFieldNames ? '' : 'firs', fieldType: $pb.PbFieldType.OU3)
    ..pPM<AnalyticsVideoLayer>(15, _omitFieldNames ? '' : 'videoLayers',
        subBuilder: AnalyticsVideoLayer.create)
    ..aOM<$0.Timestamp>(17, _omitFieldNames ? '' : 'startTime',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(18, _omitFieldNames ? '' : 'endTime',
        subBuilder: $0.Timestamp.create)
    ..aI(19, _omitFieldNames ? '' : 'packetsOutOfOrder',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsStream clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsStream copyWith(void Function(AnalyticsStream) updates) =>
      super.copyWith((message) => updates(message as AnalyticsStream))
          as AnalyticsStream;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsStream create() => AnalyticsStream._();
  @$core.override
  AnalyticsStream createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsStream getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsStream>(create);
  static AnalyticsStream? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get ssrc => $_getIZ(0);
  @$pb.TagNumber(1)
  set ssrc($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSsrc() => $_has(0);
  @$pb.TagNumber(1)
  void clearSsrc() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get primaryPackets => $_getIZ(1);
  @$pb.TagNumber(2)
  set primaryPackets($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrimaryPackets() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrimaryPackets() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get primaryBytes => $_getI64(2);
  @$pb.TagNumber(3)
  set primaryBytes($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrimaryBytes() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrimaryBytes() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get retransmitPackets => $_getIZ(3);
  @$pb.TagNumber(4)
  set retransmitPackets($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRetransmitPackets() => $_has(3);
  @$pb.TagNumber(4)
  void clearRetransmitPackets() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get retransmitBytes => $_getI64(4);
  @$pb.TagNumber(5)
  set retransmitBytes($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRetransmitBytes() => $_has(4);
  @$pb.TagNumber(5)
  void clearRetransmitBytes() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get paddingPackets => $_getIZ(5);
  @$pb.TagNumber(6)
  set paddingPackets($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPaddingPackets() => $_has(5);
  @$pb.TagNumber(6)
  void clearPaddingPackets() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get paddingBytes => $_getI64(6);
  @$pb.TagNumber(7)
  set paddingBytes($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPaddingBytes() => $_has(6);
  @$pb.TagNumber(7)
  void clearPaddingBytes() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get packetsLost => $_getIZ(7);
  @$pb.TagNumber(8)
  set packetsLost($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPacketsLost() => $_has(7);
  @$pb.TagNumber(8)
  void clearPacketsLost() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get frames => $_getIZ(8);
  @$pb.TagNumber(9)
  set frames($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasFrames() => $_has(8);
  @$pb.TagNumber(9)
  void clearFrames() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get rtt => $_getIZ(9);
  @$pb.TagNumber(10)
  set rtt($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasRtt() => $_has(9);
  @$pb.TagNumber(10)
  void clearRtt() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get jitter => $_getIZ(10);
  @$pb.TagNumber(11)
  set jitter($core.int value) => $_setUnsignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasJitter() => $_has(10);
  @$pb.TagNumber(11)
  void clearJitter() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get nacks => $_getIZ(11);
  @$pb.TagNumber(12)
  set nacks($core.int value) => $_setUnsignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasNacks() => $_has(11);
  @$pb.TagNumber(12)
  void clearNacks() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get plis => $_getIZ(12);
  @$pb.TagNumber(13)
  set plis($core.int value) => $_setUnsignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasPlis() => $_has(12);
  @$pb.TagNumber(13)
  void clearPlis() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.int get firs => $_getIZ(13);
  @$pb.TagNumber(14)
  set firs($core.int value) => $_setUnsignedInt32(13, value);
  @$pb.TagNumber(14)
  $core.bool hasFirs() => $_has(13);
  @$pb.TagNumber(14)
  void clearFirs() => $_clearField(14);

  @$pb.TagNumber(15)
  $pb.PbList<AnalyticsVideoLayer> get videoLayers => $_getList(14);

  @$pb.TagNumber(17)
  $0.Timestamp get startTime => $_getN(15);
  @$pb.TagNumber(17)
  set startTime($0.Timestamp value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasStartTime() => $_has(15);
  @$pb.TagNumber(17)
  void clearStartTime() => $_clearField(17);
  @$pb.TagNumber(17)
  $0.Timestamp ensureStartTime() => $_ensure(15);

  @$pb.TagNumber(18)
  $0.Timestamp get endTime => $_getN(16);
  @$pb.TagNumber(18)
  set endTime($0.Timestamp value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasEndTime() => $_has(16);
  @$pb.TagNumber(18)
  void clearEndTime() => $_clearField(18);
  @$pb.TagNumber(18)
  $0.Timestamp ensureEndTime() => $_ensure(16);

  @$pb.TagNumber(19)
  $core.int get packetsOutOfOrder => $_getIZ(17);
  @$pb.TagNumber(19)
  set packetsOutOfOrder($core.int value) => $_setUnsignedInt32(17, value);
  @$pb.TagNumber(19)
  $core.bool hasPacketsOutOfOrder() => $_has(17);
  @$pb.TagNumber(19)
  void clearPacketsOutOfOrder() => $_clearField(19);
}

class AnalyticsStat extends $pb.GeneratedMessage {
  factory AnalyticsStat({
    $core.String? analyticsKey,
    StreamType? kind,
    $0.Timestamp? timeStamp,
    $core.String? node,
    $core.String? roomId,
    $core.String? roomName,
    $core.String? participantId,
    $core.String? trackId,
    $core.double? score,
    $core.Iterable<AnalyticsStream>? streams,
    $core.String? mime,
    $core.double? minScore,
    $core.double? medianScore,
    $core.String? id,
  }) {
    final result = create();
    if (analyticsKey != null) result.analyticsKey = analyticsKey;
    if (kind != null) result.kind = kind;
    if (timeStamp != null) result.timeStamp = timeStamp;
    if (node != null) result.node = node;
    if (roomId != null) result.roomId = roomId;
    if (roomName != null) result.roomName = roomName;
    if (participantId != null) result.participantId = participantId;
    if (trackId != null) result.trackId = trackId;
    if (score != null) result.score = score;
    if (streams != null) result.streams.addAll(streams);
    if (mime != null) result.mime = mime;
    if (minScore != null) result.minScore = minScore;
    if (medianScore != null) result.medianScore = medianScore;
    if (id != null) result.id = id;
    return result;
  }

  AnalyticsStat._();

  factory AnalyticsStat.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsStat.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsStat',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'analyticsKey')
    ..aE<StreamType>(2, _omitFieldNames ? '' : 'kind',
        enumValues: StreamType.values)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'timeStamp',
        subBuilder: $0.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'node')
    ..aOS(5, _omitFieldNames ? '' : 'roomId')
    ..aOS(6, _omitFieldNames ? '' : 'roomName')
    ..aOS(7, _omitFieldNames ? '' : 'participantId')
    ..aOS(8, _omitFieldNames ? '' : 'trackId')
    ..aD(9, _omitFieldNames ? '' : 'score', fieldType: $pb.PbFieldType.OF)
    ..pPM<AnalyticsStream>(10, _omitFieldNames ? '' : 'streams',
        subBuilder: AnalyticsStream.create)
    ..aOS(11, _omitFieldNames ? '' : 'mime')
    ..aD(12, _omitFieldNames ? '' : 'minScore', fieldType: $pb.PbFieldType.OF)
    ..aD(13, _omitFieldNames ? '' : 'medianScore',
        fieldType: $pb.PbFieldType.OF)
    ..aOS(14, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsStat clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsStat copyWith(void Function(AnalyticsStat) updates) =>
      super.copyWith((message) => updates(message as AnalyticsStat))
          as AnalyticsStat;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsStat create() => AnalyticsStat._();
  @$core.override
  AnalyticsStat createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsStat getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsStat>(create);
  static AnalyticsStat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get analyticsKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set analyticsKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAnalyticsKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearAnalyticsKey() => $_clearField(1);

  @$pb.TagNumber(2)
  StreamType get kind => $_getN(1);
  @$pb.TagNumber(2)
  set kind(StreamType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasKind() => $_has(1);
  @$pb.TagNumber(2)
  void clearKind() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get timeStamp => $_getN(2);
  @$pb.TagNumber(3)
  set timeStamp($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTimeStamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimeStamp() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureTimeStamp() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get node => $_getSZ(3);
  @$pb.TagNumber(4)
  set node($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNode() => $_has(3);
  @$pb.TagNumber(4)
  void clearNode() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get roomId => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRoomId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get roomName => $_getSZ(5);
  @$pb.TagNumber(6)
  set roomName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRoomName() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomName() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get participantId => $_getSZ(6);
  @$pb.TagNumber(7)
  set participantId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasParticipantId() => $_has(6);
  @$pb.TagNumber(7)
  void clearParticipantId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get trackId => $_getSZ(7);
  @$pb.TagNumber(8)
  set trackId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTrackId() => $_has(7);
  @$pb.TagNumber(8)
  void clearTrackId() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get score => $_getN(8);
  @$pb.TagNumber(9)
  set score($core.double value) => $_setFloat(8, value);
  @$pb.TagNumber(9)
  $core.bool hasScore() => $_has(8);
  @$pb.TagNumber(9)
  void clearScore() => $_clearField(9);

  @$pb.TagNumber(10)
  $pb.PbList<AnalyticsStream> get streams => $_getList(9);

  @$pb.TagNumber(11)
  $core.String get mime => $_getSZ(10);
  @$pb.TagNumber(11)
  set mime($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasMime() => $_has(10);
  @$pb.TagNumber(11)
  void clearMime() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get minScore => $_getN(11);
  @$pb.TagNumber(12)
  set minScore($core.double value) => $_setFloat(11, value);
  @$pb.TagNumber(12)
  $core.bool hasMinScore() => $_has(11);
  @$pb.TagNumber(12)
  void clearMinScore() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.double get medianScore => $_getN(12);
  @$pb.TagNumber(13)
  set medianScore($core.double value) => $_setFloat(12, value);
  @$pb.TagNumber(13)
  $core.bool hasMedianScore() => $_has(12);
  @$pb.TagNumber(13)
  void clearMedianScore() => $_clearField(13);

  /// unique id for this stat
  @$pb.TagNumber(14)
  $core.String get id => $_getSZ(13);
  @$pb.TagNumber(14)
  set id($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasId() => $_has(13);
  @$pb.TagNumber(14)
  void clearId() => $_clearField(14);
}

class AnalyticsStats extends $pb.GeneratedMessage {
  factory AnalyticsStats({
    $core.Iterable<AnalyticsStat>? stats,
  }) {
    final result = create();
    if (stats != null) result.stats.addAll(stats);
    return result;
  }

  AnalyticsStats._();

  factory AnalyticsStats.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsStats.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsStats',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPM<AnalyticsStat>(1, _omitFieldNames ? '' : 'stats',
        subBuilder: AnalyticsStat.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsStats clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsStats copyWith(void Function(AnalyticsStats) updates) =>
      super.copyWith((message) => updates(message as AnalyticsStats))
          as AnalyticsStats;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsStats create() => AnalyticsStats._();
  @$core.override
  AnalyticsStats createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsStats getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsStats>(create);
  static AnalyticsStats? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AnalyticsStat> get stats => $_getList(0);
}

class AnalyticsClientMeta extends $pb.GeneratedMessage {
  factory AnalyticsClientMeta({
    $core.String? region,
    $core.String? node,
    $core.String? clientAddr,
    $core.int? clientConnectTime,
    $core.String? connectionType,
    $1.ReconnectReason? reconnectReason,
    $core.String? geoHash,
    $core.String? country,
    $core.int? ispAsn,
  }) {
    final result = create();
    if (region != null) result.region = region;
    if (node != null) result.node = node;
    if (clientAddr != null) result.clientAddr = clientAddr;
    if (clientConnectTime != null) result.clientConnectTime = clientConnectTime;
    if (connectionType != null) result.connectionType = connectionType;
    if (reconnectReason != null) result.reconnectReason = reconnectReason;
    if (geoHash != null) result.geoHash = geoHash;
    if (country != null) result.country = country;
    if (ispAsn != null) result.ispAsn = ispAsn;
    return result;
  }

  AnalyticsClientMeta._();

  factory AnalyticsClientMeta.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsClientMeta.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsClientMeta',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'region')
    ..aOS(2, _omitFieldNames ? '' : 'node')
    ..aOS(3, _omitFieldNames ? '' : 'clientAddr')
    ..aI(4, _omitFieldNames ? '' : 'clientConnectTime',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'connectionType')
    ..aE<$1.ReconnectReason>(6, _omitFieldNames ? '' : 'reconnectReason',
        enumValues: $1.ReconnectReason.values)
    ..aOS(7, _omitFieldNames ? '' : 'geoHash')
    ..aOS(8, _omitFieldNames ? '' : 'country')
    ..aI(9, _omitFieldNames ? '' : 'ispAsn', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsClientMeta clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsClientMeta copyWith(void Function(AnalyticsClientMeta) updates) =>
      super.copyWith((message) => updates(message as AnalyticsClientMeta))
          as AnalyticsClientMeta;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsClientMeta create() => AnalyticsClientMeta._();
  @$core.override
  AnalyticsClientMeta createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsClientMeta getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsClientMeta>(create);
  static AnalyticsClientMeta? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get region => $_getSZ(0);
  @$pb.TagNumber(1)
  set region($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRegion() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get node => $_getSZ(1);
  @$pb.TagNumber(2)
  set node($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNode() => $_has(1);
  @$pb.TagNumber(2)
  void clearNode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get clientAddr => $_getSZ(2);
  @$pb.TagNumber(3)
  set clientAddr($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasClientAddr() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientAddr() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get clientConnectTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set clientConnectTime($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasClientConnectTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearClientConnectTime() => $_clearField(4);

  /// udp, tcp, turn
  @$pb.TagNumber(5)
  $core.String get connectionType => $_getSZ(4);
  @$pb.TagNumber(5)
  set connectionType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasConnectionType() => $_has(4);
  @$pb.TagNumber(5)
  void clearConnectionType() => $_clearField(5);

  @$pb.TagNumber(6)
  $1.ReconnectReason get reconnectReason => $_getN(5);
  @$pb.TagNumber(6)
  set reconnectReason($1.ReconnectReason value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasReconnectReason() => $_has(5);
  @$pb.TagNumber(6)
  void clearReconnectReason() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get geoHash => $_getSZ(6);
  @$pb.TagNumber(7)
  set geoHash($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasGeoHash() => $_has(6);
  @$pb.TagNumber(7)
  void clearGeoHash() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get country => $_getSZ(7);
  @$pb.TagNumber(8)
  set country($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCountry() => $_has(7);
  @$pb.TagNumber(8)
  void clearCountry() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get ispAsn => $_getIZ(8);
  @$pb.TagNumber(9)
  set ispAsn($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIspAsn() => $_has(8);
  @$pb.TagNumber(9)
  void clearIspAsn() => $_clearField(9);
}

class AnalyticsEvent extends $pb.GeneratedMessage {
  factory AnalyticsEvent({
    AnalyticsEventType? type,
    $0.Timestamp? timestamp,
    $core.String? roomId,
    $1.Room? room,
    $core.String? participantId,
    $1.ParticipantInfo? participant,
    $core.String? trackId,
    $1.TrackInfo? track,
    $core.String? analyticsKey,
    $1.ClientInfo? clientInfo,
    AnalyticsClientMeta? clientMeta,
    $core.String? egressId,
    $1.VideoQuality? maxSubscribedVideoQuality,
    $1.ParticipantInfo? publisher,
    $core.String? mime,
    $2.EgressInfo? egress,
    $3.IngressInfo? ingress,
    $core.String? ingressId,
    $core.String? error,
    $1.RTPStats? rtpStats,
    $core.int? videoLayer,
    $core.String? nodeId,
    $core.String? id,
    $core.String? sipCallId,
    $4.SIPCallInfo? sipCall,
    $core.String? sipTrunkId,
    $4.SIPInboundTrunkInfo? sipInboundTrunk,
    $4.SIPOutboundTrunkInfo? sipOutboundTrunk,
    $core.String? sipDispatchRuleId,
    $4.SIPDispatchRuleInfo? sipDispatchRule,
    ReportInfo? report,
    APICallInfo? apiCall,
    WebhookInfo? webhook,
    $4.SIPTransferInfo? sipTransfer,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (timestamp != null) result.timestamp = timestamp;
    if (roomId != null) result.roomId = roomId;
    if (room != null) result.room = room;
    if (participantId != null) result.participantId = participantId;
    if (participant != null) result.participant = participant;
    if (trackId != null) result.trackId = trackId;
    if (track != null) result.track = track;
    if (analyticsKey != null) result.analyticsKey = analyticsKey;
    if (clientInfo != null) result.clientInfo = clientInfo;
    if (clientMeta != null) result.clientMeta = clientMeta;
    if (egressId != null) result.egressId = egressId;
    if (maxSubscribedVideoQuality != null)
      result.maxSubscribedVideoQuality = maxSubscribedVideoQuality;
    if (publisher != null) result.publisher = publisher;
    if (mime != null) result.mime = mime;
    if (egress != null) result.egress = egress;
    if (ingress != null) result.ingress = ingress;
    if (ingressId != null) result.ingressId = ingressId;
    if (error != null) result.error = error;
    if (rtpStats != null) result.rtpStats = rtpStats;
    if (videoLayer != null) result.videoLayer = videoLayer;
    if (nodeId != null) result.nodeId = nodeId;
    if (id != null) result.id = id;
    if (sipCallId != null) result.sipCallId = sipCallId;
    if (sipCall != null) result.sipCall = sipCall;
    if (sipTrunkId != null) result.sipTrunkId = sipTrunkId;
    if (sipInboundTrunk != null) result.sipInboundTrunk = sipInboundTrunk;
    if (sipOutboundTrunk != null) result.sipOutboundTrunk = sipOutboundTrunk;
    if (sipDispatchRuleId != null) result.sipDispatchRuleId = sipDispatchRuleId;
    if (sipDispatchRule != null) result.sipDispatchRule = sipDispatchRule;
    if (report != null) result.report = report;
    if (apiCall != null) result.apiCall = apiCall;
    if (webhook != null) result.webhook = webhook;
    if (sipTransfer != null) result.sipTransfer = sipTransfer;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aE<AnalyticsEventType>(1, _omitFieldNames ? '' : 'type',
        enumValues: AnalyticsEventType.values)
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..aOM<$1.Room>(4, _omitFieldNames ? '' : 'room', subBuilder: $1.Room.create)
    ..aOS(5, _omitFieldNames ? '' : 'participantId')
    ..aOM<$1.ParticipantInfo>(6, _omitFieldNames ? '' : 'participant',
        subBuilder: $1.ParticipantInfo.create)
    ..aOS(7, _omitFieldNames ? '' : 'trackId')
    ..aOM<$1.TrackInfo>(8, _omitFieldNames ? '' : 'track',
        subBuilder: $1.TrackInfo.create)
    ..aOS(10, _omitFieldNames ? '' : 'analyticsKey')
    ..aOM<$1.ClientInfo>(11, _omitFieldNames ? '' : 'clientInfo',
        subBuilder: $1.ClientInfo.create)
    ..aOM<AnalyticsClientMeta>(12, _omitFieldNames ? '' : 'clientMeta',
        subBuilder: AnalyticsClientMeta.create)
    ..aOS(13, _omitFieldNames ? '' : 'egressId')
    ..aE<$1.VideoQuality>(
        14, _omitFieldNames ? '' : 'maxSubscribedVideoQuality',
        enumValues: $1.VideoQuality.values)
    ..aOM<$1.ParticipantInfo>(15, _omitFieldNames ? '' : 'publisher',
        subBuilder: $1.ParticipantInfo.create)
    ..aOS(16, _omitFieldNames ? '' : 'mime')
    ..aOM<$2.EgressInfo>(17, _omitFieldNames ? '' : 'egress',
        subBuilder: $2.EgressInfo.create)
    ..aOM<$3.IngressInfo>(18, _omitFieldNames ? '' : 'ingress',
        subBuilder: $3.IngressInfo.create)
    ..aOS(19, _omitFieldNames ? '' : 'ingressId')
    ..aOS(20, _omitFieldNames ? '' : 'error')
    ..aOM<$1.RTPStats>(21, _omitFieldNames ? '' : 'rtpStats',
        subBuilder: $1.RTPStats.create)
    ..aI(22, _omitFieldNames ? '' : 'videoLayer')
    ..aOS(24, _omitFieldNames ? '' : 'nodeId')
    ..aOS(25, _omitFieldNames ? '' : 'id')
    ..aOS(26, _omitFieldNames ? '' : 'sipCallId')
    ..aOM<$4.SIPCallInfo>(27, _omitFieldNames ? '' : 'sipCall',
        subBuilder: $4.SIPCallInfo.create)
    ..aOS(28, _omitFieldNames ? '' : 'sipTrunkId')
    ..aOM<$4.SIPInboundTrunkInfo>(29, _omitFieldNames ? '' : 'sipInboundTrunk',
        subBuilder: $4.SIPInboundTrunkInfo.create)
    ..aOM<$4.SIPOutboundTrunkInfo>(
        30, _omitFieldNames ? '' : 'sipOutboundTrunk',
        subBuilder: $4.SIPOutboundTrunkInfo.create)
    ..aOS(31, _omitFieldNames ? '' : 'sipDispatchRuleId')
    ..aOM<$4.SIPDispatchRuleInfo>(32, _omitFieldNames ? '' : 'sipDispatchRule',
        subBuilder: $4.SIPDispatchRuleInfo.create)
    ..aOM<ReportInfo>(33, _omitFieldNames ? '' : 'report',
        subBuilder: ReportInfo.create)
    ..aOM<APICallInfo>(34, _omitFieldNames ? '' : 'apiCall',
        subBuilder: APICallInfo.create)
    ..aOM<WebhookInfo>(35, _omitFieldNames ? '' : 'webhook',
        subBuilder: WebhookInfo.create)
    ..aOM<$4.SIPTransferInfo>(36, _omitFieldNames ? '' : 'sipTransfer',
        subBuilder: $4.SIPTransferInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsEvent clone() => deepCopy();
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
  @$core.pragma('dart2js:noInline')
  static AnalyticsEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsEvent>(create);
  static AnalyticsEvent? _defaultInstance;

  @$pb.TagNumber(1)
  AnalyticsEventType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(AnalyticsEventType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Timestamp get timestamp => $_getN(1);
  @$pb.TagNumber(2)
  set timestamp($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureTimestamp() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => $_clearField(3);

  @$pb.TagNumber(4)
  $1.Room get room => $_getN(3);
  @$pb.TagNumber(4)
  set room($1.Room value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRoom() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoom() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Room ensureRoom() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get participantId => $_getSZ(4);
  @$pb.TagNumber(5)
  set participantId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasParticipantId() => $_has(4);
  @$pb.TagNumber(5)
  void clearParticipantId() => $_clearField(5);

  @$pb.TagNumber(6)
  $1.ParticipantInfo get participant => $_getN(5);
  @$pb.TagNumber(6)
  set participant($1.ParticipantInfo value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasParticipant() => $_has(5);
  @$pb.TagNumber(6)
  void clearParticipant() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.ParticipantInfo ensureParticipant() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get trackId => $_getSZ(6);
  @$pb.TagNumber(7)
  set trackId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTrackId() => $_has(6);
  @$pb.TagNumber(7)
  void clearTrackId() => $_clearField(7);

  @$pb.TagNumber(8)
  $1.TrackInfo get track => $_getN(7);
  @$pb.TagNumber(8)
  set track($1.TrackInfo value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasTrack() => $_has(7);
  @$pb.TagNumber(8)
  void clearTrack() => $_clearField(8);
  @$pb.TagNumber(8)
  $1.TrackInfo ensureTrack() => $_ensure(7);

  @$pb.TagNumber(10)
  $core.String get analyticsKey => $_getSZ(8);
  @$pb.TagNumber(10)
  set analyticsKey($core.String value) => $_setString(8, value);
  @$pb.TagNumber(10)
  $core.bool hasAnalyticsKey() => $_has(8);
  @$pb.TagNumber(10)
  void clearAnalyticsKey() => $_clearField(10);

  @$pb.TagNumber(11)
  $1.ClientInfo get clientInfo => $_getN(9);
  @$pb.TagNumber(11)
  set clientInfo($1.ClientInfo value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasClientInfo() => $_has(9);
  @$pb.TagNumber(11)
  void clearClientInfo() => $_clearField(11);
  @$pb.TagNumber(11)
  $1.ClientInfo ensureClientInfo() => $_ensure(9);

  @$pb.TagNumber(12)
  AnalyticsClientMeta get clientMeta => $_getN(10);
  @$pb.TagNumber(12)
  set clientMeta(AnalyticsClientMeta value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasClientMeta() => $_has(10);
  @$pb.TagNumber(12)
  void clearClientMeta() => $_clearField(12);
  @$pb.TagNumber(12)
  AnalyticsClientMeta ensureClientMeta() => $_ensure(10);

  @$pb.TagNumber(13)
  $core.String get egressId => $_getSZ(11);
  @$pb.TagNumber(13)
  set egressId($core.String value) => $_setString(11, value);
  @$pb.TagNumber(13)
  $core.bool hasEgressId() => $_has(11);
  @$pb.TagNumber(13)
  void clearEgressId() => $_clearField(13);

  @$pb.TagNumber(14)
  $1.VideoQuality get maxSubscribedVideoQuality => $_getN(12);
  @$pb.TagNumber(14)
  set maxSubscribedVideoQuality($1.VideoQuality value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasMaxSubscribedVideoQuality() => $_has(12);
  @$pb.TagNumber(14)
  void clearMaxSubscribedVideoQuality() => $_clearField(14);

  @$pb.TagNumber(15)
  $1.ParticipantInfo get publisher => $_getN(13);
  @$pb.TagNumber(15)
  set publisher($1.ParticipantInfo value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasPublisher() => $_has(13);
  @$pb.TagNumber(15)
  void clearPublisher() => $_clearField(15);
  @$pb.TagNumber(15)
  $1.ParticipantInfo ensurePublisher() => $_ensure(13);

  @$pb.TagNumber(16)
  $core.String get mime => $_getSZ(14);
  @$pb.TagNumber(16)
  set mime($core.String value) => $_setString(14, value);
  @$pb.TagNumber(16)
  $core.bool hasMime() => $_has(14);
  @$pb.TagNumber(16)
  void clearMime() => $_clearField(16);

  @$pb.TagNumber(17)
  $2.EgressInfo get egress => $_getN(15);
  @$pb.TagNumber(17)
  set egress($2.EgressInfo value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasEgress() => $_has(15);
  @$pb.TagNumber(17)
  void clearEgress() => $_clearField(17);
  @$pb.TagNumber(17)
  $2.EgressInfo ensureEgress() => $_ensure(15);

  @$pb.TagNumber(18)
  $3.IngressInfo get ingress => $_getN(16);
  @$pb.TagNumber(18)
  set ingress($3.IngressInfo value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasIngress() => $_has(16);
  @$pb.TagNumber(18)
  void clearIngress() => $_clearField(18);
  @$pb.TagNumber(18)
  $3.IngressInfo ensureIngress() => $_ensure(16);

  @$pb.TagNumber(19)
  $core.String get ingressId => $_getSZ(17);
  @$pb.TagNumber(19)
  set ingressId($core.String value) => $_setString(17, value);
  @$pb.TagNumber(19)
  $core.bool hasIngressId() => $_has(17);
  @$pb.TagNumber(19)
  void clearIngressId() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.String get error => $_getSZ(18);
  @$pb.TagNumber(20)
  set error($core.String value) => $_setString(18, value);
  @$pb.TagNumber(20)
  $core.bool hasError() => $_has(18);
  @$pb.TagNumber(20)
  void clearError() => $_clearField(20);

  @$pb.TagNumber(21)
  $1.RTPStats get rtpStats => $_getN(19);
  @$pb.TagNumber(21)
  set rtpStats($1.RTPStats value) => $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasRtpStats() => $_has(19);
  @$pb.TagNumber(21)
  void clearRtpStats() => $_clearField(21);
  @$pb.TagNumber(21)
  $1.RTPStats ensureRtpStats() => $_ensure(19);

  @$pb.TagNumber(22)
  $core.int get videoLayer => $_getIZ(20);
  @$pb.TagNumber(22)
  set videoLayer($core.int value) => $_setSignedInt32(20, value);
  @$pb.TagNumber(22)
  $core.bool hasVideoLayer() => $_has(20);
  @$pb.TagNumber(22)
  void clearVideoLayer() => $_clearField(22);

  @$pb.TagNumber(24)
  $core.String get nodeId => $_getSZ(21);
  @$pb.TagNumber(24)
  set nodeId($core.String value) => $_setString(21, value);
  @$pb.TagNumber(24)
  $core.bool hasNodeId() => $_has(21);
  @$pb.TagNumber(24)
  void clearNodeId() => $_clearField(24);

  /// unique id for this event
  @$pb.TagNumber(25)
  $core.String get id => $_getSZ(22);
  @$pb.TagNumber(25)
  set id($core.String value) => $_setString(22, value);
  @$pb.TagNumber(25)
  $core.bool hasId() => $_has(22);
  @$pb.TagNumber(25)
  void clearId() => $_clearField(25);

  @$pb.TagNumber(26)
  $core.String get sipCallId => $_getSZ(23);
  @$pb.TagNumber(26)
  set sipCallId($core.String value) => $_setString(23, value);
  @$pb.TagNumber(26)
  $core.bool hasSipCallId() => $_has(23);
  @$pb.TagNumber(26)
  void clearSipCallId() => $_clearField(26);

  @$pb.TagNumber(27)
  $4.SIPCallInfo get sipCall => $_getN(24);
  @$pb.TagNumber(27)
  set sipCall($4.SIPCallInfo value) => $_setField(27, value);
  @$pb.TagNumber(27)
  $core.bool hasSipCall() => $_has(24);
  @$pb.TagNumber(27)
  void clearSipCall() => $_clearField(27);
  @$pb.TagNumber(27)
  $4.SIPCallInfo ensureSipCall() => $_ensure(24);

  @$pb.TagNumber(28)
  $core.String get sipTrunkId => $_getSZ(25);
  @$pb.TagNumber(28)
  set sipTrunkId($core.String value) => $_setString(25, value);
  @$pb.TagNumber(28)
  $core.bool hasSipTrunkId() => $_has(25);
  @$pb.TagNumber(28)
  void clearSipTrunkId() => $_clearField(28);

  @$pb.TagNumber(29)
  $4.SIPInboundTrunkInfo get sipInboundTrunk => $_getN(26);
  @$pb.TagNumber(29)
  set sipInboundTrunk($4.SIPInboundTrunkInfo value) => $_setField(29, value);
  @$pb.TagNumber(29)
  $core.bool hasSipInboundTrunk() => $_has(26);
  @$pb.TagNumber(29)
  void clearSipInboundTrunk() => $_clearField(29);
  @$pb.TagNumber(29)
  $4.SIPInboundTrunkInfo ensureSipInboundTrunk() => $_ensure(26);

  @$pb.TagNumber(30)
  $4.SIPOutboundTrunkInfo get sipOutboundTrunk => $_getN(27);
  @$pb.TagNumber(30)
  set sipOutboundTrunk($4.SIPOutboundTrunkInfo value) => $_setField(30, value);
  @$pb.TagNumber(30)
  $core.bool hasSipOutboundTrunk() => $_has(27);
  @$pb.TagNumber(30)
  void clearSipOutboundTrunk() => $_clearField(30);
  @$pb.TagNumber(30)
  $4.SIPOutboundTrunkInfo ensureSipOutboundTrunk() => $_ensure(27);

  @$pb.TagNumber(31)
  $core.String get sipDispatchRuleId => $_getSZ(28);
  @$pb.TagNumber(31)
  set sipDispatchRuleId($core.String value) => $_setString(28, value);
  @$pb.TagNumber(31)
  $core.bool hasSipDispatchRuleId() => $_has(28);
  @$pb.TagNumber(31)
  void clearSipDispatchRuleId() => $_clearField(31);

  @$pb.TagNumber(32)
  $4.SIPDispatchRuleInfo get sipDispatchRule => $_getN(29);
  @$pb.TagNumber(32)
  set sipDispatchRule($4.SIPDispatchRuleInfo value) => $_setField(32, value);
  @$pb.TagNumber(32)
  $core.bool hasSipDispatchRule() => $_has(29);
  @$pb.TagNumber(32)
  void clearSipDispatchRule() => $_clearField(32);
  @$pb.TagNumber(32)
  $4.SIPDispatchRuleInfo ensureSipDispatchRule() => $_ensure(29);

  @$pb.TagNumber(33)
  ReportInfo get report => $_getN(30);
  @$pb.TagNumber(33)
  set report(ReportInfo value) => $_setField(33, value);
  @$pb.TagNumber(33)
  $core.bool hasReport() => $_has(30);
  @$pb.TagNumber(33)
  void clearReport() => $_clearField(33);
  @$pb.TagNumber(33)
  ReportInfo ensureReport() => $_ensure(30);

  @$pb.TagNumber(34)
  APICallInfo get apiCall => $_getN(31);
  @$pb.TagNumber(34)
  set apiCall(APICallInfo value) => $_setField(34, value);
  @$pb.TagNumber(34)
  $core.bool hasApiCall() => $_has(31);
  @$pb.TagNumber(34)
  void clearApiCall() => $_clearField(34);
  @$pb.TagNumber(34)
  APICallInfo ensureApiCall() => $_ensure(31);

  @$pb.TagNumber(35)
  WebhookInfo get webhook => $_getN(32);
  @$pb.TagNumber(35)
  set webhook(WebhookInfo value) => $_setField(35, value);
  @$pb.TagNumber(35)
  $core.bool hasWebhook() => $_has(32);
  @$pb.TagNumber(35)
  void clearWebhook() => $_clearField(35);
  @$pb.TagNumber(35)
  WebhookInfo ensureWebhook() => $_ensure(32);

  @$pb.TagNumber(36)
  $4.SIPTransferInfo get sipTransfer => $_getN(33);
  @$pb.TagNumber(36)
  set sipTransfer($4.SIPTransferInfo value) => $_setField(36, value);
  @$pb.TagNumber(36)
  $core.bool hasSipTransfer() => $_has(33);
  @$pb.TagNumber(36)
  void clearSipTransfer() => $_clearField(36);
  @$pb.TagNumber(36)
  $4.SIPTransferInfo ensureSipTransfer() => $_ensure(33);
}

class AnalyticsEvents extends $pb.GeneratedMessage {
  factory AnalyticsEvents({
    $core.Iterable<AnalyticsEvent>? events,
  }) {
    final result = create();
    if (events != null) result.events.addAll(events);
    return result;
  }

  AnalyticsEvents._();

  factory AnalyticsEvents.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsEvents.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsEvents',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..pPM<AnalyticsEvent>(1, _omitFieldNames ? '' : 'events',
        subBuilder: AnalyticsEvent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsEvents clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsEvents copyWith(void Function(AnalyticsEvents) updates) =>
      super.copyWith((message) => updates(message as AnalyticsEvents))
          as AnalyticsEvents;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsEvents create() => AnalyticsEvents._();
  @$core.override
  AnalyticsEvents createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsEvents getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsEvents>(create);
  static AnalyticsEvents? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AnalyticsEvent> get events => $_getList(0);
}

class AnalyticsRoomParticipant extends $pb.GeneratedMessage {
  factory AnalyticsRoomParticipant({
    $core.String? id,
    $core.String? identity,
    $core.String? name,
    $1.ParticipantInfo_State? state,
    $0.Timestamp? joinedAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (identity != null) result.identity = identity;
    if (name != null) result.name = name;
    if (state != null) result.state = state;
    if (joinedAt != null) result.joinedAt = joinedAt;
    return result;
  }

  AnalyticsRoomParticipant._();

  factory AnalyticsRoomParticipant.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsRoomParticipant.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsRoomParticipant',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'identity')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aE<$1.ParticipantInfo_State>(4, _omitFieldNames ? '' : 'state',
        enumValues: $1.ParticipantInfo_State.values)
    ..aOM<$0.Timestamp>(5, _omitFieldNames ? '' : 'joinedAt',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsRoomParticipant clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsRoomParticipant copyWith(
          void Function(AnalyticsRoomParticipant) updates) =>
      super.copyWith((message) => updates(message as AnalyticsRoomParticipant))
          as AnalyticsRoomParticipant;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsRoomParticipant create() => AnalyticsRoomParticipant._();
  @$core.override
  AnalyticsRoomParticipant createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsRoomParticipant getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsRoomParticipant>(create);
  static AnalyticsRoomParticipant? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get identity => $_getSZ(1);
  @$pb.TagNumber(2)
  set identity($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentity() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $1.ParticipantInfo_State get state => $_getN(3);
  @$pb.TagNumber(4)
  set state($1.ParticipantInfo_State value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.Timestamp get joinedAt => $_getN(4);
  @$pb.TagNumber(5)
  set joinedAt($0.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasJoinedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearJoinedAt() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureJoinedAt() => $_ensure(4);
}

class AnalyticsRoom extends $pb.GeneratedMessage {
  factory AnalyticsRoom({
    $core.String? id,
    $core.String? name,
    $0.Timestamp? createdAt,
    $core.Iterable<AnalyticsRoomParticipant>? participants,
    $core.String? projectId,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (createdAt != null) result.createdAt = createdAt;
    if (participants != null) result.participants.addAll(participants);
    if (projectId != null) result.projectId = projectId;
    return result;
  }

  AnalyticsRoom._();

  factory AnalyticsRoom.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsRoom.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsRoom',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..pPM<AnalyticsRoomParticipant>(4, _omitFieldNames ? '' : 'participants',
        subBuilder: AnalyticsRoomParticipant.create)
    ..aOS(5, _omitFieldNames ? '' : 'projectId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsRoom clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsRoom copyWith(void Function(AnalyticsRoom) updates) =>
      super.copyWith((message) => updates(message as AnalyticsRoom))
          as AnalyticsRoom;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsRoom create() => AnalyticsRoom._();
  @$core.override
  AnalyticsRoom createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsRoom>(create);
  static AnalyticsRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureCreatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $pb.PbList<AnalyticsRoomParticipant> get participants => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get projectId => $_getSZ(4);
  @$pb.TagNumber(5)
  set projectId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasProjectId() => $_has(4);
  @$pb.TagNumber(5)
  void clearProjectId() => $_clearField(5);
}

class AnalyticsNodeRooms extends $pb.GeneratedMessage {
  factory AnalyticsNodeRooms({
    $core.String? nodeId,
    $fixnum.Int64? sequenceNumber,
    $0.Timestamp? timestamp,
    $core.Iterable<AnalyticsRoom>? rooms,
  }) {
    final result = create();
    if (nodeId != null) result.nodeId = nodeId;
    if (sequenceNumber != null) result.sequenceNumber = sequenceNumber;
    if (timestamp != null) result.timestamp = timestamp;
    if (rooms != null) result.rooms.addAll(rooms);
    return result;
  }

  AnalyticsNodeRooms._();

  factory AnalyticsNodeRooms.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyticsNodeRooms.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyticsNodeRooms',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeId')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'sequenceNumber', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..pPM<AnalyticsRoom>(4, _omitFieldNames ? '' : 'rooms',
        subBuilder: AnalyticsRoom.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsNodeRooms clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyticsNodeRooms copyWith(void Function(AnalyticsNodeRooms) updates) =>
      super.copyWith((message) => updates(message as AnalyticsNodeRooms))
          as AnalyticsNodeRooms;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsNodeRooms create() => AnalyticsNodeRooms._();
  @$core.override
  AnalyticsNodeRooms createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyticsNodeRooms getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyticsNodeRooms>(create);
  static AnalyticsNodeRooms? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nodeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get sequenceNumber => $_getI64(1);
  @$pb.TagNumber(2)
  set sequenceNumber($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSequenceNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearSequenceNumber() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get timestamp => $_getN(2);
  @$pb.TagNumber(3)
  set timestamp($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureTimestamp() => $_ensure(2);

  @$pb.TagNumber(4)
  $pb.PbList<AnalyticsRoom> get rooms => $_getList(3);
}

enum ReportInfo_Message { featureUsage, notSet }

class ReportInfo extends $pb.GeneratedMessage {
  factory ReportInfo({
    FeatureUsageInfo? featureUsage,
  }) {
    final result = create();
    if (featureUsage != null) result.featureUsage = featureUsage;
    return result;
  }

  ReportInfo._();

  factory ReportInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReportInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ReportInfo_Message>
      _ReportInfo_MessageByTag = {
    1: ReportInfo_Message.featureUsage,
    0: ReportInfo_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<FeatureUsageInfo>(1, _omitFieldNames ? '' : 'featureUsage',
        subBuilder: FeatureUsageInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportInfo copyWith(void Function(ReportInfo) updates) =>
      super.copyWith((message) => updates(message as ReportInfo)) as ReportInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportInfo create() => ReportInfo._();
  @$core.override
  ReportInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReportInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportInfo>(create);
  static ReportInfo? _defaultInstance;

  @$pb.TagNumber(1)
  ReportInfo_Message whichMessage() =>
      _ReportInfo_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  FeatureUsageInfo get featureUsage => $_getN(0);
  @$pb.TagNumber(1)
  set featureUsage(FeatureUsageInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFeatureUsage() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeatureUsage() => $_clearField(1);
  @$pb.TagNumber(1)
  FeatureUsageInfo ensureFeatureUsage() => $_ensure(0);
}

class TimeRange extends $pb.GeneratedMessage {
  factory TimeRange({
    $0.Timestamp? startedAt,
    $0.Timestamp? endedAt,
  }) {
    final result = create();
    if (startedAt != null) result.startedAt = startedAt;
    if (endedAt != null) result.endedAt = endedAt;
    return result;
  }

  TimeRange._();

  factory TimeRange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TimeRange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TimeRange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'startedAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'endedAt',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TimeRange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TimeRange copyWith(void Function(TimeRange) updates) =>
      super.copyWith((message) => updates(message as TimeRange)) as TimeRange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimeRange create() => TimeRange._();
  @$core.override
  TimeRange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TimeRange getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimeRange>(create);
  static TimeRange? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Timestamp get startedAt => $_getN(0);
  @$pb.TagNumber(1)
  set startedAt($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStartedAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartedAt() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureStartedAt() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Timestamp get endedAt => $_getN(1);
  @$pb.TagNumber(2)
  set endedAt($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEndedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndedAt() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureEndedAt() => $_ensure(1);
}

class FeatureUsageInfo extends $pb.GeneratedMessage {
  factory FeatureUsageInfo({
    FeatureUsageInfo_Feature? feature,
    $core.String? projectId,
    $core.String? roomName,
    $core.String? roomId,
    $core.String? participantIdentity,
    $core.String? participantId,
    $core.String? trackId,
    $core.Iterable<TimeRange>? timeRanges,
  }) {
    final result = create();
    if (feature != null) result.feature = feature;
    if (projectId != null) result.projectId = projectId;
    if (roomName != null) result.roomName = roomName;
    if (roomId != null) result.roomId = roomId;
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (participantId != null) result.participantId = participantId;
    if (trackId != null) result.trackId = trackId;
    if (timeRanges != null) result.timeRanges.addAll(timeRanges);
    return result;
  }

  FeatureUsageInfo._();

  factory FeatureUsageInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FeatureUsageInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FeatureUsageInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aE<FeatureUsageInfo_Feature>(1, _omitFieldNames ? '' : 'feature',
        enumValues: FeatureUsageInfo_Feature.values)
    ..aOS(2, _omitFieldNames ? '' : 'projectId')
    ..aOS(3, _omitFieldNames ? '' : 'roomName')
    ..aOS(4, _omitFieldNames ? '' : 'roomId')
    ..aOS(5, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(6, _omitFieldNames ? '' : 'participantId')
    ..aOS(7, _omitFieldNames ? '' : 'trackId')
    ..pPM<TimeRange>(8, _omitFieldNames ? '' : 'timeRanges',
        subBuilder: TimeRange.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FeatureUsageInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FeatureUsageInfo copyWith(void Function(FeatureUsageInfo) updates) =>
      super.copyWith((message) => updates(message as FeatureUsageInfo))
          as FeatureUsageInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FeatureUsageInfo create() => FeatureUsageInfo._();
  @$core.override
  FeatureUsageInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FeatureUsageInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FeatureUsageInfo>(create);
  static FeatureUsageInfo? _defaultInstance;

  @$pb.TagNumber(1)
  FeatureUsageInfo_Feature get feature => $_getN(0);
  @$pb.TagNumber(1)
  set feature(FeatureUsageInfo_Feature value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFeature() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeature() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get projectId => $_getSZ(1);
  @$pb.TagNumber(2)
  set projectId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProjectId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomName => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomId => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get participantIdentity => $_getSZ(4);
  @$pb.TagNumber(5)
  set participantIdentity($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasParticipantIdentity() => $_has(4);
  @$pb.TagNumber(5)
  void clearParticipantIdentity() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get participantId => $_getSZ(5);
  @$pb.TagNumber(6)
  set participantId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasParticipantId() => $_has(5);
  @$pb.TagNumber(6)
  void clearParticipantId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get trackId => $_getSZ(6);
  @$pb.TagNumber(7)
  set trackId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTrackId() => $_has(6);
  @$pb.TagNumber(7)
  void clearTrackId() => $_clearField(7);

  /// time ranges during which the feature was enabled.
  /// for e. g., noise cancellation may not be applied when a media track is paused/muted,
  /// this allows reporting only periods during which a feature is avtive.
  @$pb.TagNumber(8)
  $pb.PbList<TimeRange> get timeRanges => $_getList(7);
}

enum APICallRequest_Message {
  createRoomRequest,
  listRoomsRequest,
  deleteRoomRequest,
  listParticipantsRequest,
  roomParticipantIdentity,
  muteRoomTrackRequest,
  updateParticipantRequest,
  updateSubscriptionsRequest,
  sendDataRequest,
  updateRoomMetadataRequest,
  notSet
}

class APICallRequest extends $pb.GeneratedMessage {
  factory APICallRequest({
    $5.CreateRoomRequest? createRoomRequest,
    $5.ListRoomsRequest? listRoomsRequest,
    $5.DeleteRoomRequest? deleteRoomRequest,
    $5.ListParticipantsRequest? listParticipantsRequest,
    $5.RoomParticipantIdentity? roomParticipantIdentity,
    $5.MuteRoomTrackRequest? muteRoomTrackRequest,
    $5.UpdateParticipantRequest? updateParticipantRequest,
    $5.UpdateSubscriptionsRequest? updateSubscriptionsRequest,
    $5.SendDataRequest? sendDataRequest,
    $5.UpdateRoomMetadataRequest? updateRoomMetadataRequest,
  }) {
    final result = create();
    if (createRoomRequest != null) result.createRoomRequest = createRoomRequest;
    if (listRoomsRequest != null) result.listRoomsRequest = listRoomsRequest;
    if (deleteRoomRequest != null) result.deleteRoomRequest = deleteRoomRequest;
    if (listParticipantsRequest != null)
      result.listParticipantsRequest = listParticipantsRequest;
    if (roomParticipantIdentity != null)
      result.roomParticipantIdentity = roomParticipantIdentity;
    if (muteRoomTrackRequest != null)
      result.muteRoomTrackRequest = muteRoomTrackRequest;
    if (updateParticipantRequest != null)
      result.updateParticipantRequest = updateParticipantRequest;
    if (updateSubscriptionsRequest != null)
      result.updateSubscriptionsRequest = updateSubscriptionsRequest;
    if (sendDataRequest != null) result.sendDataRequest = sendDataRequest;
    if (updateRoomMetadataRequest != null)
      result.updateRoomMetadataRequest = updateRoomMetadataRequest;
    return result;
  }

  APICallRequest._();

  factory APICallRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory APICallRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, APICallRequest_Message>
      _APICallRequest_MessageByTag = {
    1: APICallRequest_Message.createRoomRequest,
    2: APICallRequest_Message.listRoomsRequest,
    3: APICallRequest_Message.deleteRoomRequest,
    4: APICallRequest_Message.listParticipantsRequest,
    5: APICallRequest_Message.roomParticipantIdentity,
    6: APICallRequest_Message.muteRoomTrackRequest,
    7: APICallRequest_Message.updateParticipantRequest,
    8: APICallRequest_Message.updateSubscriptionsRequest,
    9: APICallRequest_Message.sendDataRequest,
    10: APICallRequest_Message.updateRoomMetadataRequest,
    0: APICallRequest_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'APICallRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    ..aOM<$5.CreateRoomRequest>(1, _omitFieldNames ? '' : 'createRoomRequest',
        subBuilder: $5.CreateRoomRequest.create)
    ..aOM<$5.ListRoomsRequest>(2, _omitFieldNames ? '' : 'listRoomsRequest',
        subBuilder: $5.ListRoomsRequest.create)
    ..aOM<$5.DeleteRoomRequest>(3, _omitFieldNames ? '' : 'deleteRoomRequest',
        subBuilder: $5.DeleteRoomRequest.create)
    ..aOM<$5.ListParticipantsRequest>(
        4, _omitFieldNames ? '' : 'listParticipantsRequest',
        subBuilder: $5.ListParticipantsRequest.create)
    ..aOM<$5.RoomParticipantIdentity>(
        5, _omitFieldNames ? '' : 'roomParticipantIdentity',
        subBuilder: $5.RoomParticipantIdentity.create)
    ..aOM<$5.MuteRoomTrackRequest>(
        6, _omitFieldNames ? '' : 'muteRoomTrackRequest',
        subBuilder: $5.MuteRoomTrackRequest.create)
    ..aOM<$5.UpdateParticipantRequest>(
        7, _omitFieldNames ? '' : 'updateParticipantRequest',
        subBuilder: $5.UpdateParticipantRequest.create)
    ..aOM<$5.UpdateSubscriptionsRequest>(
        8, _omitFieldNames ? '' : 'updateSubscriptionsRequest',
        subBuilder: $5.UpdateSubscriptionsRequest.create)
    ..aOM<$5.SendDataRequest>(9, _omitFieldNames ? '' : 'sendDataRequest',
        subBuilder: $5.SendDataRequest.create)
    ..aOM<$5.UpdateRoomMetadataRequest>(
        10, _omitFieldNames ? '' : 'updateRoomMetadataRequest',
        subBuilder: $5.UpdateRoomMetadataRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  APICallRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  APICallRequest copyWith(void Function(APICallRequest) updates) =>
      super.copyWith((message) => updates(message as APICallRequest))
          as APICallRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static APICallRequest create() => APICallRequest._();
  @$core.override
  APICallRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static APICallRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<APICallRequest>(create);
  static APICallRequest? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  APICallRequest_Message whichMessage() =>
      _APICallRequest_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  void clearMessage() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $5.CreateRoomRequest get createRoomRequest => $_getN(0);
  @$pb.TagNumber(1)
  set createRoomRequest($5.CreateRoomRequest value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCreateRoomRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreateRoomRequest() => $_clearField(1);
  @$pb.TagNumber(1)
  $5.CreateRoomRequest ensureCreateRoomRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  $5.ListRoomsRequest get listRoomsRequest => $_getN(1);
  @$pb.TagNumber(2)
  set listRoomsRequest($5.ListRoomsRequest value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasListRoomsRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearListRoomsRequest() => $_clearField(2);
  @$pb.TagNumber(2)
  $5.ListRoomsRequest ensureListRoomsRequest() => $_ensure(1);

  @$pb.TagNumber(3)
  $5.DeleteRoomRequest get deleteRoomRequest => $_getN(2);
  @$pb.TagNumber(3)
  set deleteRoomRequest($5.DeleteRoomRequest value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDeleteRoomRequest() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeleteRoomRequest() => $_clearField(3);
  @$pb.TagNumber(3)
  $5.DeleteRoomRequest ensureDeleteRoomRequest() => $_ensure(2);

  @$pb.TagNumber(4)
  $5.ListParticipantsRequest get listParticipantsRequest => $_getN(3);
  @$pb.TagNumber(4)
  set listParticipantsRequest($5.ListParticipantsRequest value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasListParticipantsRequest() => $_has(3);
  @$pb.TagNumber(4)
  void clearListParticipantsRequest() => $_clearField(4);
  @$pb.TagNumber(4)
  $5.ListParticipantsRequest ensureListParticipantsRequest() => $_ensure(3);

  @$pb.TagNumber(5)
  $5.RoomParticipantIdentity get roomParticipantIdentity => $_getN(4);
  @$pb.TagNumber(5)
  set roomParticipantIdentity($5.RoomParticipantIdentity value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRoomParticipantIdentity() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomParticipantIdentity() => $_clearField(5);
  @$pb.TagNumber(5)
  $5.RoomParticipantIdentity ensureRoomParticipantIdentity() => $_ensure(4);

  @$pb.TagNumber(6)
  $5.MuteRoomTrackRequest get muteRoomTrackRequest => $_getN(5);
  @$pb.TagNumber(6)
  set muteRoomTrackRequest($5.MuteRoomTrackRequest value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasMuteRoomTrackRequest() => $_has(5);
  @$pb.TagNumber(6)
  void clearMuteRoomTrackRequest() => $_clearField(6);
  @$pb.TagNumber(6)
  $5.MuteRoomTrackRequest ensureMuteRoomTrackRequest() => $_ensure(5);

  @$pb.TagNumber(7)
  $5.UpdateParticipantRequest get updateParticipantRequest => $_getN(6);
  @$pb.TagNumber(7)
  set updateParticipantRequest($5.UpdateParticipantRequest value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasUpdateParticipantRequest() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateParticipantRequest() => $_clearField(7);
  @$pb.TagNumber(7)
  $5.UpdateParticipantRequest ensureUpdateParticipantRequest() => $_ensure(6);

  @$pb.TagNumber(8)
  $5.UpdateSubscriptionsRequest get updateSubscriptionsRequest => $_getN(7);
  @$pb.TagNumber(8)
  set updateSubscriptionsRequest($5.UpdateSubscriptionsRequest value) =>
      $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasUpdateSubscriptionsRequest() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdateSubscriptionsRequest() => $_clearField(8);
  @$pb.TagNumber(8)
  $5.UpdateSubscriptionsRequest ensureUpdateSubscriptionsRequest() =>
      $_ensure(7);

  @$pb.TagNumber(9)
  $5.SendDataRequest get sendDataRequest => $_getN(8);
  @$pb.TagNumber(9)
  set sendDataRequest($5.SendDataRequest value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasSendDataRequest() => $_has(8);
  @$pb.TagNumber(9)
  void clearSendDataRequest() => $_clearField(9);
  @$pb.TagNumber(9)
  $5.SendDataRequest ensureSendDataRequest() => $_ensure(8);

  @$pb.TagNumber(10)
  $5.UpdateRoomMetadataRequest get updateRoomMetadataRequest => $_getN(9);
  @$pb.TagNumber(10)
  set updateRoomMetadataRequest($5.UpdateRoomMetadataRequest value) =>
      $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasUpdateRoomMetadataRequest() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdateRoomMetadataRequest() => $_clearField(10);
  @$pb.TagNumber(10)
  $5.UpdateRoomMetadataRequest ensureUpdateRoomMetadataRequest() => $_ensure(9);
}

class APICallInfo extends $pb.GeneratedMessage {
  factory APICallInfo({
    $core.String? projectId,
    APICallRequest? request,
    $core.String? service,
    $core.String? method,
    $core.String? nodeId,
    $core.int? status,
    $core.String? twirpErrorCode,
    $core.String? twirpErrorMessage,
    $core.String? roomName,
    $core.String? roomId,
    $core.String? participantIdentity,
    $core.String? participantId,
    $core.String? trackId,
    $0.Timestamp? startedAt,
    $fixnum.Int64? durationNs,
  }) {
    final result = create();
    if (projectId != null) result.projectId = projectId;
    if (request != null) result.request = request;
    if (service != null) result.service = service;
    if (method != null) result.method = method;
    if (nodeId != null) result.nodeId = nodeId;
    if (status != null) result.status = status;
    if (twirpErrorCode != null) result.twirpErrorCode = twirpErrorCode;
    if (twirpErrorMessage != null) result.twirpErrorMessage = twirpErrorMessage;
    if (roomName != null) result.roomName = roomName;
    if (roomId != null) result.roomId = roomId;
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (participantId != null) result.participantId = participantId;
    if (trackId != null) result.trackId = trackId;
    if (startedAt != null) result.startedAt = startedAt;
    if (durationNs != null) result.durationNs = durationNs;
    return result;
  }

  APICallInfo._();

  factory APICallInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory APICallInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'APICallInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'projectId')
    ..aOM<APICallRequest>(2, _omitFieldNames ? '' : 'request',
        subBuilder: APICallRequest.create)
    ..aOS(3, _omitFieldNames ? '' : 'service')
    ..aOS(4, _omitFieldNames ? '' : 'method')
    ..aOS(5, _omitFieldNames ? '' : 'nodeId')
    ..aI(6, _omitFieldNames ? '' : 'status')
    ..aOS(7, _omitFieldNames ? '' : 'twirpErrorCode')
    ..aOS(8, _omitFieldNames ? '' : 'twirpErrorMessage')
    ..aOS(9, _omitFieldNames ? '' : 'roomName')
    ..aOS(10, _omitFieldNames ? '' : 'roomId')
    ..aOS(11, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(12, _omitFieldNames ? '' : 'participantId')
    ..aOS(13, _omitFieldNames ? '' : 'trackId')
    ..aOM<$0.Timestamp>(14, _omitFieldNames ? '' : 'startedAt',
        subBuilder: $0.Timestamp.create)
    ..aInt64(15, _omitFieldNames ? '' : 'durationNs')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  APICallInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  APICallInfo copyWith(void Function(APICallInfo) updates) =>
      super.copyWith((message) => updates(message as APICallInfo))
          as APICallInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static APICallInfo create() => APICallInfo._();
  @$core.override
  APICallInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static APICallInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<APICallInfo>(create);
  static APICallInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get projectId => $_getSZ(0);
  @$pb.TagNumber(1)
  set projectId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => $_clearField(1);

  @$pb.TagNumber(2)
  APICallRequest get request => $_getN(1);
  @$pb.TagNumber(2)
  set request(APICallRequest value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequest() => $_clearField(2);
  @$pb.TagNumber(2)
  APICallRequest ensureRequest() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get service => $_getSZ(2);
  @$pb.TagNumber(3)
  set service($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasService() => $_has(2);
  @$pb.TagNumber(3)
  void clearService() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get method => $_getSZ(3);
  @$pb.TagNumber(4)
  set method($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMethod() => $_has(3);
  @$pb.TagNumber(4)
  void clearMethod() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get nodeId => $_getSZ(4);
  @$pb.TagNumber(5)
  set nodeId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNodeId() => $_has(4);
  @$pb.TagNumber(5)
  void clearNodeId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get status => $_getIZ(5);
  @$pb.TagNumber(6)
  set status($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get twirpErrorCode => $_getSZ(6);
  @$pb.TagNumber(7)
  set twirpErrorCode($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTwirpErrorCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearTwirpErrorCode() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get twirpErrorMessage => $_getSZ(7);
  @$pb.TagNumber(8)
  set twirpErrorMessage($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTwirpErrorMessage() => $_has(7);
  @$pb.TagNumber(8)
  void clearTwirpErrorMessage() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get roomName => $_getSZ(8);
  @$pb.TagNumber(9)
  set roomName($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRoomName() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoomName() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get roomId => $_getSZ(9);
  @$pb.TagNumber(10)
  set roomId($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasRoomId() => $_has(9);
  @$pb.TagNumber(10)
  void clearRoomId() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get participantIdentity => $_getSZ(10);
  @$pb.TagNumber(11)
  set participantIdentity($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasParticipantIdentity() => $_has(10);
  @$pb.TagNumber(11)
  void clearParticipantIdentity() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get participantId => $_getSZ(11);
  @$pb.TagNumber(12)
  set participantId($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasParticipantId() => $_has(11);
  @$pb.TagNumber(12)
  void clearParticipantId() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get trackId => $_getSZ(12);
  @$pb.TagNumber(13)
  set trackId($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasTrackId() => $_has(12);
  @$pb.TagNumber(13)
  void clearTrackId() => $_clearField(13);

  @$pb.TagNumber(14)
  $0.Timestamp get startedAt => $_getN(13);
  @$pb.TagNumber(14)
  set startedAt($0.Timestamp value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasStartedAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearStartedAt() => $_clearField(14);
  @$pb.TagNumber(14)
  $0.Timestamp ensureStartedAt() => $_ensure(13);

  @$pb.TagNumber(15)
  $fixnum.Int64 get durationNs => $_getI64(14);
  @$pb.TagNumber(15)
  set durationNs($fixnum.Int64 value) => $_setInt64(14, value);
  @$pb.TagNumber(15)
  $core.bool hasDurationNs() => $_has(14);
  @$pb.TagNumber(15)
  void clearDurationNs() => $_clearField(15);
}

class WebhookInfo extends $pb.GeneratedMessage {
  factory WebhookInfo({
    $core.String? eventId,
    $core.String? event,
    $core.String? projectId,
    $core.String? roomName,
    $core.String? roomId,
    $core.String? participantIdentity,
    $core.String? participantId,
    $core.String? trackId,
    $core.String? egressId,
    $core.String? ingressId,
    $0.Timestamp? createdAt,
    $0.Timestamp? queuedAt,
    $fixnum.Int64? queueDurationNs,
    $0.Timestamp? sentAt,
    $fixnum.Int64? sendDurationNs,
    $core.String? url,
    $core.int? numDropped,
    $core.bool? isDropped,
    $core.String? serviceStatus,
    $core.int? serviceErrorCode,
    $core.String? serviceError,
    $core.String? sendError,
  }) {
    final result = create();
    if (eventId != null) result.eventId = eventId;
    if (event != null) result.event = event;
    if (projectId != null) result.projectId = projectId;
    if (roomName != null) result.roomName = roomName;
    if (roomId != null) result.roomId = roomId;
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (participantId != null) result.participantId = participantId;
    if (trackId != null) result.trackId = trackId;
    if (egressId != null) result.egressId = egressId;
    if (ingressId != null) result.ingressId = ingressId;
    if (createdAt != null) result.createdAt = createdAt;
    if (queuedAt != null) result.queuedAt = queuedAt;
    if (queueDurationNs != null) result.queueDurationNs = queueDurationNs;
    if (sentAt != null) result.sentAt = sentAt;
    if (sendDurationNs != null) result.sendDurationNs = sendDurationNs;
    if (url != null) result.url = url;
    if (numDropped != null) result.numDropped = numDropped;
    if (isDropped != null) result.isDropped = isDropped;
    if (serviceStatus != null) result.serviceStatus = serviceStatus;
    if (serviceErrorCode != null) result.serviceErrorCode = serviceErrorCode;
    if (serviceError != null) result.serviceError = serviceError;
    if (sendError != null) result.sendError = sendError;
    return result;
  }

  WebhookInfo._();

  factory WebhookInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WebhookInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WebhookInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'eventId')
    ..aOS(2, _omitFieldNames ? '' : 'event')
    ..aOS(3, _omitFieldNames ? '' : 'projectId')
    ..aOS(4, _omitFieldNames ? '' : 'roomName')
    ..aOS(5, _omitFieldNames ? '' : 'roomId')
    ..aOS(6, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(7, _omitFieldNames ? '' : 'participantId')
    ..aOS(8, _omitFieldNames ? '' : 'trackId')
    ..aOS(9, _omitFieldNames ? '' : 'egressId')
    ..aOS(10, _omitFieldNames ? '' : 'ingressId')
    ..aOM<$0.Timestamp>(11, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(12, _omitFieldNames ? '' : 'queuedAt',
        subBuilder: $0.Timestamp.create)
    ..aInt64(13, _omitFieldNames ? '' : 'queueDurationNs')
    ..aOM<$0.Timestamp>(14, _omitFieldNames ? '' : 'sentAt',
        subBuilder: $0.Timestamp.create)
    ..aInt64(15, _omitFieldNames ? '' : 'sendDurationNs')
    ..aOS(16, _omitFieldNames ? '' : 'url')
    ..aI(17, _omitFieldNames ? '' : 'numDropped')
    ..aOB(18, _omitFieldNames ? '' : 'isDropped')
    ..aOS(19, _omitFieldNames ? '' : 'serviceStatus')
    ..aI(20, _omitFieldNames ? '' : 'serviceErrorCode')
    ..aOS(21, _omitFieldNames ? '' : 'serviceError')
    ..aOS(22, _omitFieldNames ? '' : 'sendError')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebhookInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebhookInfo copyWith(void Function(WebhookInfo) updates) =>
      super.copyWith((message) => updates(message as WebhookInfo))
          as WebhookInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WebhookInfo create() => WebhookInfo._();
  @$core.override
  WebhookInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WebhookInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WebhookInfo>(create);
  static WebhookInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get eventId => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get event => $_getSZ(1);
  @$pb.TagNumber(2)
  set event($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEvent() => $_has(1);
  @$pb.TagNumber(2)
  void clearEvent() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get projectId => $_getSZ(2);
  @$pb.TagNumber(3)
  set projectId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasProjectId() => $_has(2);
  @$pb.TagNumber(3)
  void clearProjectId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomName => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomName() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get roomId => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRoomId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get participantIdentity => $_getSZ(5);
  @$pb.TagNumber(6)
  set participantIdentity($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasParticipantIdentity() => $_has(5);
  @$pb.TagNumber(6)
  void clearParticipantIdentity() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get participantId => $_getSZ(6);
  @$pb.TagNumber(7)
  set participantId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasParticipantId() => $_has(6);
  @$pb.TagNumber(7)
  void clearParticipantId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get trackId => $_getSZ(7);
  @$pb.TagNumber(8)
  set trackId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTrackId() => $_has(7);
  @$pb.TagNumber(8)
  void clearTrackId() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get egressId => $_getSZ(8);
  @$pb.TagNumber(9)
  set egressId($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasEgressId() => $_has(8);
  @$pb.TagNumber(9)
  void clearEgressId() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get ingressId => $_getSZ(9);
  @$pb.TagNumber(10)
  set ingressId($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasIngressId() => $_has(9);
  @$pb.TagNumber(10)
  void clearIngressId() => $_clearField(10);

  @$pb.TagNumber(11)
  $0.Timestamp get createdAt => $_getN(10);
  @$pb.TagNumber(11)
  set createdAt($0.Timestamp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasCreatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreatedAt() => $_clearField(11);
  @$pb.TagNumber(11)
  $0.Timestamp ensureCreatedAt() => $_ensure(10);

  @$pb.TagNumber(12)
  $0.Timestamp get queuedAt => $_getN(11);
  @$pb.TagNumber(12)
  set queuedAt($0.Timestamp value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasQueuedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearQueuedAt() => $_clearField(12);
  @$pb.TagNumber(12)
  $0.Timestamp ensureQueuedAt() => $_ensure(11);

  @$pb.TagNumber(13)
  $fixnum.Int64 get queueDurationNs => $_getI64(12);
  @$pb.TagNumber(13)
  set queueDurationNs($fixnum.Int64 value) => $_setInt64(12, value);
  @$pb.TagNumber(13)
  $core.bool hasQueueDurationNs() => $_has(12);
  @$pb.TagNumber(13)
  void clearQueueDurationNs() => $_clearField(13);

  @$pb.TagNumber(14)
  $0.Timestamp get sentAt => $_getN(13);
  @$pb.TagNumber(14)
  set sentAt($0.Timestamp value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasSentAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearSentAt() => $_clearField(14);
  @$pb.TagNumber(14)
  $0.Timestamp ensureSentAt() => $_ensure(13);

  @$pb.TagNumber(15)
  $fixnum.Int64 get sendDurationNs => $_getI64(14);
  @$pb.TagNumber(15)
  set sendDurationNs($fixnum.Int64 value) => $_setInt64(14, value);
  @$pb.TagNumber(15)
  $core.bool hasSendDurationNs() => $_has(14);
  @$pb.TagNumber(15)
  void clearSendDurationNs() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get url => $_getSZ(15);
  @$pb.TagNumber(16)
  set url($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasUrl() => $_has(15);
  @$pb.TagNumber(16)
  void clearUrl() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.int get numDropped => $_getIZ(16);
  @$pb.TagNumber(17)
  set numDropped($core.int value) => $_setSignedInt32(16, value);
  @$pb.TagNumber(17)
  $core.bool hasNumDropped() => $_has(16);
  @$pb.TagNumber(17)
  void clearNumDropped() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.bool get isDropped => $_getBF(17);
  @$pb.TagNumber(18)
  set isDropped($core.bool value) => $_setBool(17, value);
  @$pb.TagNumber(18)
  $core.bool hasIsDropped() => $_has(17);
  @$pb.TagNumber(18)
  void clearIsDropped() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.String get serviceStatus => $_getSZ(18);
  @$pb.TagNumber(19)
  set serviceStatus($core.String value) => $_setString(18, value);
  @$pb.TagNumber(19)
  $core.bool hasServiceStatus() => $_has(18);
  @$pb.TagNumber(19)
  void clearServiceStatus() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.int get serviceErrorCode => $_getIZ(19);
  @$pb.TagNumber(20)
  set serviceErrorCode($core.int value) => $_setSignedInt32(19, value);
  @$pb.TagNumber(20)
  $core.bool hasServiceErrorCode() => $_has(19);
  @$pb.TagNumber(20)
  void clearServiceErrorCode() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.String get serviceError => $_getSZ(20);
  @$pb.TagNumber(21)
  set serviceError($core.String value) => $_setString(20, value);
  @$pb.TagNumber(21)
  $core.bool hasServiceError() => $_has(20);
  @$pb.TagNumber(21)
  void clearServiceError() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.String get sendError => $_getSZ(21);
  @$pb.TagNumber(22)
  set sendError($core.String value) => $_setString(21, value);
  @$pb.TagNumber(22)
  $core.bool hasSendError() => $_has(21);
  @$pb.TagNumber(22)
  void clearSendError() => $_clearField(22);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
