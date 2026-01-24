//
//  Generated code. Do not modify.
//  source: livekit_analytics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;
import 'livekit_analytics.pbenum.dart';
import 'livekit_egress.pb.dart' as $7;
import 'livekit_ingress.pb.dart' as $8;
import 'livekit_models.pb.dart' as $2;
import 'livekit_models.pbenum.dart' as $2;
import 'livekit_room.pb.dart' as $9;
import 'livekit_sip.pb.dart' as $12;

export 'livekit_analytics.pbenum.dart';

class AnalyticsVideoLayer extends $pb.GeneratedMessage {
  factory AnalyticsVideoLayer({
    $core.int? layer,
    $core.int? packets,
    $fixnum.Int64? bytes,
    $core.int? frames,
  }) {
    final $result = create();
    if (layer != null) {
      $result.layer = layer;
    }
    if (packets != null) {
      $result.packets = packets;
    }
    if (bytes != null) {
      $result.bytes = bytes;
    }
    if (frames != null) {
      $result.frames = frames;
    }
    return $result;
  }
  AnalyticsVideoLayer._() : super();
  factory AnalyticsVideoLayer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsVideoLayer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsVideoLayer', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'layer', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'packets', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'bytes', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'frames', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsVideoLayer clone() => AnalyticsVideoLayer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsVideoLayer copyWith(void Function(AnalyticsVideoLayer) updates) => super.copyWith((message) => updates(message as AnalyticsVideoLayer)) as AnalyticsVideoLayer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsVideoLayer create() => AnalyticsVideoLayer._();
  AnalyticsVideoLayer createEmptyInstance() => create();
  static $pb.PbList<AnalyticsVideoLayer> createRepeated() => $pb.PbList<AnalyticsVideoLayer>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsVideoLayer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsVideoLayer>(create);
  static AnalyticsVideoLayer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get layer => $_getIZ(0);
  @$pb.TagNumber(1)
  set layer($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLayer() => $_has(0);
  @$pb.TagNumber(1)
  void clearLayer() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get packets => $_getIZ(1);
  @$pb.TagNumber(2)
  set packets($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPackets() => $_has(1);
  @$pb.TagNumber(2)
  void clearPackets() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get bytes => $_getI64(2);
  @$pb.TagNumber(3)
  set bytes($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBytes() => $_has(2);
  @$pb.TagNumber(3)
  void clearBytes() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get frames => $_getIZ(3);
  @$pb.TagNumber(4)
  set frames($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrames() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrames() => clearField(4);
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
    final $result = create();
    if (ssrc != null) {
      $result.ssrc = ssrc;
    }
    if (primaryPackets != null) {
      $result.primaryPackets = primaryPackets;
    }
    if (primaryBytes != null) {
      $result.primaryBytes = primaryBytes;
    }
    if (retransmitPackets != null) {
      $result.retransmitPackets = retransmitPackets;
    }
    if (retransmitBytes != null) {
      $result.retransmitBytes = retransmitBytes;
    }
    if (paddingPackets != null) {
      $result.paddingPackets = paddingPackets;
    }
    if (paddingBytes != null) {
      $result.paddingBytes = paddingBytes;
    }
    if (packetsLost != null) {
      $result.packetsLost = packetsLost;
    }
    if (frames != null) {
      $result.frames = frames;
    }
    if (rtt != null) {
      $result.rtt = rtt;
    }
    if (jitter != null) {
      $result.jitter = jitter;
    }
    if (nacks != null) {
      $result.nacks = nacks;
    }
    if (plis != null) {
      $result.plis = plis;
    }
    if (firs != null) {
      $result.firs = firs;
    }
    if (videoLayers != null) {
      $result.videoLayers.addAll(videoLayers);
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (packetsOutOfOrder != null) {
      $result.packetsOutOfOrder = packetsOutOfOrder;
    }
    return $result;
  }
  AnalyticsStream._() : super();
  factory AnalyticsStream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsStream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsStream', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'ssrc', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'primaryPackets', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'primaryBytes', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'retransmitPackets', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'retransmitBytes', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'paddingPackets', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'paddingBytes', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'packetsLost', $pb.PbFieldType.OU3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'frames', $pb.PbFieldType.OU3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'rtt', $pb.PbFieldType.OU3)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'jitter', $pb.PbFieldType.OU3)
    ..a<$core.int>(12, _omitFieldNames ? '' : 'nacks', $pb.PbFieldType.OU3)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'plis', $pb.PbFieldType.OU3)
    ..a<$core.int>(14, _omitFieldNames ? '' : 'firs', $pb.PbFieldType.OU3)
    ..pc<AnalyticsVideoLayer>(15, _omitFieldNames ? '' : 'videoLayers', $pb.PbFieldType.PM, subBuilder: AnalyticsVideoLayer.create)
    ..aOM<$0.Timestamp>(17, _omitFieldNames ? '' : 'startTime', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(18, _omitFieldNames ? '' : 'endTime', subBuilder: $0.Timestamp.create)
    ..a<$core.int>(19, _omitFieldNames ? '' : 'packetsOutOfOrder', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsStream clone() => AnalyticsStream()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsStream copyWith(void Function(AnalyticsStream) updates) => super.copyWith((message) => updates(message as AnalyticsStream)) as AnalyticsStream;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsStream create() => AnalyticsStream._();
  AnalyticsStream createEmptyInstance() => create();
  static $pb.PbList<AnalyticsStream> createRepeated() => $pb.PbList<AnalyticsStream>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsStream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsStream>(create);
  static AnalyticsStream? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get ssrc => $_getIZ(0);
  @$pb.TagNumber(1)
  set ssrc($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSsrc() => $_has(0);
  @$pb.TagNumber(1)
  void clearSsrc() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get primaryPackets => $_getIZ(1);
  @$pb.TagNumber(2)
  set primaryPackets($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrimaryPackets() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrimaryPackets() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get primaryBytes => $_getI64(2);
  @$pb.TagNumber(3)
  set primaryBytes($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPrimaryBytes() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrimaryBytes() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get retransmitPackets => $_getIZ(3);
  @$pb.TagNumber(4)
  set retransmitPackets($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRetransmitPackets() => $_has(3);
  @$pb.TagNumber(4)
  void clearRetransmitPackets() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get retransmitBytes => $_getI64(4);
  @$pb.TagNumber(5)
  set retransmitBytes($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRetransmitBytes() => $_has(4);
  @$pb.TagNumber(5)
  void clearRetransmitBytes() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get paddingPackets => $_getIZ(5);
  @$pb.TagNumber(6)
  set paddingPackets($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPaddingPackets() => $_has(5);
  @$pb.TagNumber(6)
  void clearPaddingPackets() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get paddingBytes => $_getI64(6);
  @$pb.TagNumber(7)
  set paddingBytes($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPaddingBytes() => $_has(6);
  @$pb.TagNumber(7)
  void clearPaddingBytes() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get packetsLost => $_getIZ(7);
  @$pb.TagNumber(8)
  set packetsLost($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPacketsLost() => $_has(7);
  @$pb.TagNumber(8)
  void clearPacketsLost() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get frames => $_getIZ(8);
  @$pb.TagNumber(9)
  set frames($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFrames() => $_has(8);
  @$pb.TagNumber(9)
  void clearFrames() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get rtt => $_getIZ(9);
  @$pb.TagNumber(10)
  set rtt($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasRtt() => $_has(9);
  @$pb.TagNumber(10)
  void clearRtt() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get jitter => $_getIZ(10);
  @$pb.TagNumber(11)
  set jitter($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasJitter() => $_has(10);
  @$pb.TagNumber(11)
  void clearJitter() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get nacks => $_getIZ(11);
  @$pb.TagNumber(12)
  set nacks($core.int v) { $_setUnsignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasNacks() => $_has(11);
  @$pb.TagNumber(12)
  void clearNacks() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get plis => $_getIZ(12);
  @$pb.TagNumber(13)
  set plis($core.int v) { $_setUnsignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasPlis() => $_has(12);
  @$pb.TagNumber(13)
  void clearPlis() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get firs => $_getIZ(13);
  @$pb.TagNumber(14)
  set firs($core.int v) { $_setUnsignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasFirs() => $_has(13);
  @$pb.TagNumber(14)
  void clearFirs() => clearField(14);

  @$pb.TagNumber(15)
  $core.List<AnalyticsVideoLayer> get videoLayers => $_getList(14);

  @$pb.TagNumber(17)
  $0.Timestamp get startTime => $_getN(15);
  @$pb.TagNumber(17)
  set startTime($0.Timestamp v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasStartTime() => $_has(15);
  @$pb.TagNumber(17)
  void clearStartTime() => clearField(17);
  @$pb.TagNumber(17)
  $0.Timestamp ensureStartTime() => $_ensure(15);

  @$pb.TagNumber(18)
  $0.Timestamp get endTime => $_getN(16);
  @$pb.TagNumber(18)
  set endTime($0.Timestamp v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasEndTime() => $_has(16);
  @$pb.TagNumber(18)
  void clearEndTime() => clearField(18);
  @$pb.TagNumber(18)
  $0.Timestamp ensureEndTime() => $_ensure(16);

  @$pb.TagNumber(19)
  $core.int get packetsOutOfOrder => $_getIZ(17);
  @$pb.TagNumber(19)
  set packetsOutOfOrder($core.int v) { $_setUnsignedInt32(17, v); }
  @$pb.TagNumber(19)
  $core.bool hasPacketsOutOfOrder() => $_has(17);
  @$pb.TagNumber(19)
  void clearPacketsOutOfOrder() => clearField(19);
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
    final $result = create();
    if (analyticsKey != null) {
      $result.analyticsKey = analyticsKey;
    }
    if (kind != null) {
      $result.kind = kind;
    }
    if (timeStamp != null) {
      $result.timeStamp = timeStamp;
    }
    if (node != null) {
      $result.node = node;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (participantId != null) {
      $result.participantId = participantId;
    }
    if (trackId != null) {
      $result.trackId = trackId;
    }
    if (score != null) {
      $result.score = score;
    }
    if (streams != null) {
      $result.streams.addAll(streams);
    }
    if (mime != null) {
      $result.mime = mime;
    }
    if (minScore != null) {
      $result.minScore = minScore;
    }
    if (medianScore != null) {
      $result.medianScore = medianScore;
    }
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  AnalyticsStat._() : super();
  factory AnalyticsStat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsStat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsStat', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'analyticsKey')
    ..e<StreamType>(2, _omitFieldNames ? '' : 'kind', $pb.PbFieldType.OE, defaultOrMaker: StreamType.UPSTREAM, valueOf: StreamType.valueOf, enumValues: StreamType.values)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'timeStamp', subBuilder: $0.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'node')
    ..aOS(5, _omitFieldNames ? '' : 'roomId')
    ..aOS(6, _omitFieldNames ? '' : 'roomName')
    ..aOS(7, _omitFieldNames ? '' : 'participantId')
    ..aOS(8, _omitFieldNames ? '' : 'trackId')
    ..a<$core.double>(9, _omitFieldNames ? '' : 'score', $pb.PbFieldType.OF)
    ..pc<AnalyticsStream>(10, _omitFieldNames ? '' : 'streams', $pb.PbFieldType.PM, subBuilder: AnalyticsStream.create)
    ..aOS(11, _omitFieldNames ? '' : 'mime')
    ..a<$core.double>(12, _omitFieldNames ? '' : 'minScore', $pb.PbFieldType.OF)
    ..a<$core.double>(13, _omitFieldNames ? '' : 'medianScore', $pb.PbFieldType.OF)
    ..aOS(14, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsStat clone() => AnalyticsStat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsStat copyWith(void Function(AnalyticsStat) updates) => super.copyWith((message) => updates(message as AnalyticsStat)) as AnalyticsStat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsStat create() => AnalyticsStat._();
  AnalyticsStat createEmptyInstance() => create();
  static $pb.PbList<AnalyticsStat> createRepeated() => $pb.PbList<AnalyticsStat>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsStat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsStat>(create);
  static AnalyticsStat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get analyticsKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set analyticsKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAnalyticsKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearAnalyticsKey() => clearField(1);

  @$pb.TagNumber(2)
  StreamType get kind => $_getN(1);
  @$pb.TagNumber(2)
  set kind(StreamType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasKind() => $_has(1);
  @$pb.TagNumber(2)
  void clearKind() => clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get timeStamp => $_getN(2);
  @$pb.TagNumber(3)
  set timeStamp($0.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimeStamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimeStamp() => clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureTimeStamp() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get node => $_getSZ(3);
  @$pb.TagNumber(4)
  set node($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNode() => $_has(3);
  @$pb.TagNumber(4)
  void clearNode() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get roomId => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRoomId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get roomName => $_getSZ(5);
  @$pb.TagNumber(6)
  set roomName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRoomName() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get participantId => $_getSZ(6);
  @$pb.TagNumber(7)
  set participantId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasParticipantId() => $_has(6);
  @$pb.TagNumber(7)
  void clearParticipantId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get trackId => $_getSZ(7);
  @$pb.TagNumber(8)
  set trackId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTrackId() => $_has(7);
  @$pb.TagNumber(8)
  void clearTrackId() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get score => $_getN(8);
  @$pb.TagNumber(9)
  set score($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasScore() => $_has(8);
  @$pb.TagNumber(9)
  void clearScore() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<AnalyticsStream> get streams => $_getList(9);

  @$pb.TagNumber(11)
  $core.String get mime => $_getSZ(10);
  @$pb.TagNumber(11)
  set mime($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasMime() => $_has(10);
  @$pb.TagNumber(11)
  void clearMime() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get minScore => $_getN(11);
  @$pb.TagNumber(12)
  set minScore($core.double v) { $_setFloat(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasMinScore() => $_has(11);
  @$pb.TagNumber(12)
  void clearMinScore() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get medianScore => $_getN(12);
  @$pb.TagNumber(13)
  set medianScore($core.double v) { $_setFloat(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasMedianScore() => $_has(12);
  @$pb.TagNumber(13)
  void clearMedianScore() => clearField(13);

  /// unique id for this stat
  @$pb.TagNumber(14)
  $core.String get id => $_getSZ(13);
  @$pb.TagNumber(14)
  set id($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasId() => $_has(13);
  @$pb.TagNumber(14)
  void clearId() => clearField(14);
}

class AnalyticsStats extends $pb.GeneratedMessage {
  factory AnalyticsStats({
    $core.Iterable<AnalyticsStat>? stats,
  }) {
    final $result = create();
    if (stats != null) {
      $result.stats.addAll(stats);
    }
    return $result;
  }
  AnalyticsStats._() : super();
  factory AnalyticsStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsStats', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<AnalyticsStat>(1, _omitFieldNames ? '' : 'stats', $pb.PbFieldType.PM, subBuilder: AnalyticsStat.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsStats clone() => AnalyticsStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsStats copyWith(void Function(AnalyticsStats) updates) => super.copyWith((message) => updates(message as AnalyticsStats)) as AnalyticsStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsStats create() => AnalyticsStats._();
  AnalyticsStats createEmptyInstance() => create();
  static $pb.PbList<AnalyticsStats> createRepeated() => $pb.PbList<AnalyticsStats>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsStats>(create);
  static AnalyticsStats? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AnalyticsStat> get stats => $_getList(0);
}

class AnalyticsClientMeta extends $pb.GeneratedMessage {
  factory AnalyticsClientMeta({
    $core.String? region,
    $core.String? node,
    $core.String? clientAddr,
    $core.int? clientConnectTime,
    $core.String? connectionType,
    $2.ReconnectReason? reconnectReason,
    $core.String? geoHash,
    $core.String? country,
    $core.int? ispAsn,
  }) {
    final $result = create();
    if (region != null) {
      $result.region = region;
    }
    if (node != null) {
      $result.node = node;
    }
    if (clientAddr != null) {
      $result.clientAddr = clientAddr;
    }
    if (clientConnectTime != null) {
      $result.clientConnectTime = clientConnectTime;
    }
    if (connectionType != null) {
      $result.connectionType = connectionType;
    }
    if (reconnectReason != null) {
      $result.reconnectReason = reconnectReason;
    }
    if (geoHash != null) {
      $result.geoHash = geoHash;
    }
    if (country != null) {
      $result.country = country;
    }
    if (ispAsn != null) {
      $result.ispAsn = ispAsn;
    }
    return $result;
  }
  AnalyticsClientMeta._() : super();
  factory AnalyticsClientMeta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsClientMeta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsClientMeta', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'region')
    ..aOS(2, _omitFieldNames ? '' : 'node')
    ..aOS(3, _omitFieldNames ? '' : 'clientAddr')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'clientConnectTime', $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'connectionType')
    ..e<$2.ReconnectReason>(6, _omitFieldNames ? '' : 'reconnectReason', $pb.PbFieldType.OE, defaultOrMaker: $2.ReconnectReason.RR_UNKNOWN, valueOf: $2.ReconnectReason.valueOf, enumValues: $2.ReconnectReason.values)
    ..aOS(7, _omitFieldNames ? '' : 'geoHash')
    ..aOS(8, _omitFieldNames ? '' : 'country')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'ispAsn', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsClientMeta clone() => AnalyticsClientMeta()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsClientMeta copyWith(void Function(AnalyticsClientMeta) updates) => super.copyWith((message) => updates(message as AnalyticsClientMeta)) as AnalyticsClientMeta;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsClientMeta create() => AnalyticsClientMeta._();
  AnalyticsClientMeta createEmptyInstance() => create();
  static $pb.PbList<AnalyticsClientMeta> createRepeated() => $pb.PbList<AnalyticsClientMeta>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsClientMeta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsClientMeta>(create);
  static AnalyticsClientMeta? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get region => $_getSZ(0);
  @$pb.TagNumber(1)
  set region($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRegion() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegion() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get node => $_getSZ(1);
  @$pb.TagNumber(2)
  set node($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNode() => $_has(1);
  @$pb.TagNumber(2)
  void clearNode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get clientAddr => $_getSZ(2);
  @$pb.TagNumber(3)
  set clientAddr($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClientAddr() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientAddr() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get clientConnectTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set clientConnectTime($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClientConnectTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearClientConnectTime() => clearField(4);

  /// udp, tcp, turn
  @$pb.TagNumber(5)
  $core.String get connectionType => $_getSZ(4);
  @$pb.TagNumber(5)
  set connectionType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasConnectionType() => $_has(4);
  @$pb.TagNumber(5)
  void clearConnectionType() => clearField(5);

  @$pb.TagNumber(6)
  $2.ReconnectReason get reconnectReason => $_getN(5);
  @$pb.TagNumber(6)
  set reconnectReason($2.ReconnectReason v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasReconnectReason() => $_has(5);
  @$pb.TagNumber(6)
  void clearReconnectReason() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get geoHash => $_getSZ(6);
  @$pb.TagNumber(7)
  set geoHash($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasGeoHash() => $_has(6);
  @$pb.TagNumber(7)
  void clearGeoHash() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get country => $_getSZ(7);
  @$pb.TagNumber(8)
  set country($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCountry() => $_has(7);
  @$pb.TagNumber(8)
  void clearCountry() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get ispAsn => $_getIZ(8);
  @$pb.TagNumber(9)
  set ispAsn($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIspAsn() => $_has(8);
  @$pb.TagNumber(9)
  void clearIspAsn() => clearField(9);
}

class AnalyticsEvent extends $pb.GeneratedMessage {
  factory AnalyticsEvent({
    AnalyticsEventType? type,
    $0.Timestamp? timestamp,
    $core.String? roomId,
    $2.Room? room,
    $core.String? participantId,
    $2.ParticipantInfo? participant,
    $core.String? trackId,
    $2.TrackInfo? track,
    $core.String? analyticsKey,
    $2.ClientInfo? clientInfo,
    AnalyticsClientMeta? clientMeta,
    $core.String? egressId,
    $2.VideoQuality? maxSubscribedVideoQuality,
    $2.ParticipantInfo? publisher,
    $core.String? mime,
    $7.EgressInfo? egress,
    $8.IngressInfo? ingress,
    $core.String? ingressId,
    $core.String? error,
    $2.RTPStats? rtpStats,
    $core.int? videoLayer,
    $core.String? nodeId,
    $core.String? id,
    $core.String? sipCallId,
    $12.SIPCallInfo? sipCall,
    $core.String? sipTrunkId,
    $12.SIPInboundTrunkInfo? sipInboundTrunk,
    $12.SIPOutboundTrunkInfo? sipOutboundTrunk,
    $core.String? sipDispatchRuleId,
    $12.SIPDispatchRuleInfo? sipDispatchRule,
    ReportInfo? report,
    APICallInfo? apiCall,
    WebhookInfo? webhook,
    $12.SIPTransferInfo? sipTransfer,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (room != null) {
      $result.room = room;
    }
    if (participantId != null) {
      $result.participantId = participantId;
    }
    if (participant != null) {
      $result.participant = participant;
    }
    if (trackId != null) {
      $result.trackId = trackId;
    }
    if (track != null) {
      $result.track = track;
    }
    if (analyticsKey != null) {
      $result.analyticsKey = analyticsKey;
    }
    if (clientInfo != null) {
      $result.clientInfo = clientInfo;
    }
    if (clientMeta != null) {
      $result.clientMeta = clientMeta;
    }
    if (egressId != null) {
      $result.egressId = egressId;
    }
    if (maxSubscribedVideoQuality != null) {
      $result.maxSubscribedVideoQuality = maxSubscribedVideoQuality;
    }
    if (publisher != null) {
      $result.publisher = publisher;
    }
    if (mime != null) {
      $result.mime = mime;
    }
    if (egress != null) {
      $result.egress = egress;
    }
    if (ingress != null) {
      $result.ingress = ingress;
    }
    if (ingressId != null) {
      $result.ingressId = ingressId;
    }
    if (error != null) {
      $result.error = error;
    }
    if (rtpStats != null) {
      $result.rtpStats = rtpStats;
    }
    if (videoLayer != null) {
      $result.videoLayer = videoLayer;
    }
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    if (id != null) {
      $result.id = id;
    }
    if (sipCallId != null) {
      $result.sipCallId = sipCallId;
    }
    if (sipCall != null) {
      $result.sipCall = sipCall;
    }
    if (sipTrunkId != null) {
      $result.sipTrunkId = sipTrunkId;
    }
    if (sipInboundTrunk != null) {
      $result.sipInboundTrunk = sipInboundTrunk;
    }
    if (sipOutboundTrunk != null) {
      $result.sipOutboundTrunk = sipOutboundTrunk;
    }
    if (sipDispatchRuleId != null) {
      $result.sipDispatchRuleId = sipDispatchRuleId;
    }
    if (sipDispatchRule != null) {
      $result.sipDispatchRule = sipDispatchRule;
    }
    if (report != null) {
      $result.report = report;
    }
    if (apiCall != null) {
      $result.apiCall = apiCall;
    }
    if (webhook != null) {
      $result.webhook = webhook;
    }
    if (sipTransfer != null) {
      $result.sipTransfer = sipTransfer;
    }
    return $result;
  }
  AnalyticsEvent._() : super();
  factory AnalyticsEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..e<AnalyticsEventType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: AnalyticsEventType.ROOM_CREATED, valueOf: AnalyticsEventType.valueOf, enumValues: AnalyticsEventType.values)
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'timestamp', subBuilder: $0.Timestamp.create)
    ..aOS(3, _omitFieldNames ? '' : 'roomId')
    ..aOM<$2.Room>(4, _omitFieldNames ? '' : 'room', subBuilder: $2.Room.create)
    ..aOS(5, _omitFieldNames ? '' : 'participantId')
    ..aOM<$2.ParticipantInfo>(6, _omitFieldNames ? '' : 'participant', subBuilder: $2.ParticipantInfo.create)
    ..aOS(7, _omitFieldNames ? '' : 'trackId')
    ..aOM<$2.TrackInfo>(8, _omitFieldNames ? '' : 'track', subBuilder: $2.TrackInfo.create)
    ..aOS(10, _omitFieldNames ? '' : 'analyticsKey')
    ..aOM<$2.ClientInfo>(11, _omitFieldNames ? '' : 'clientInfo', subBuilder: $2.ClientInfo.create)
    ..aOM<AnalyticsClientMeta>(12, _omitFieldNames ? '' : 'clientMeta', subBuilder: AnalyticsClientMeta.create)
    ..aOS(13, _omitFieldNames ? '' : 'egressId')
    ..e<$2.VideoQuality>(14, _omitFieldNames ? '' : 'maxSubscribedVideoQuality', $pb.PbFieldType.OE, defaultOrMaker: $2.VideoQuality.LOW, valueOf: $2.VideoQuality.valueOf, enumValues: $2.VideoQuality.values)
    ..aOM<$2.ParticipantInfo>(15, _omitFieldNames ? '' : 'publisher', subBuilder: $2.ParticipantInfo.create)
    ..aOS(16, _omitFieldNames ? '' : 'mime')
    ..aOM<$7.EgressInfo>(17, _omitFieldNames ? '' : 'egress', subBuilder: $7.EgressInfo.create)
    ..aOM<$8.IngressInfo>(18, _omitFieldNames ? '' : 'ingress', subBuilder: $8.IngressInfo.create)
    ..aOS(19, _omitFieldNames ? '' : 'ingressId')
    ..aOS(20, _omitFieldNames ? '' : 'error')
    ..aOM<$2.RTPStats>(21, _omitFieldNames ? '' : 'rtpStats', subBuilder: $2.RTPStats.create)
    ..a<$core.int>(22, _omitFieldNames ? '' : 'videoLayer', $pb.PbFieldType.O3)
    ..aOS(24, _omitFieldNames ? '' : 'nodeId')
    ..aOS(25, _omitFieldNames ? '' : 'id')
    ..aOS(26, _omitFieldNames ? '' : 'sipCallId')
    ..aOM<$12.SIPCallInfo>(27, _omitFieldNames ? '' : 'sipCall', subBuilder: $12.SIPCallInfo.create)
    ..aOS(28, _omitFieldNames ? '' : 'sipTrunkId')
    ..aOM<$12.SIPInboundTrunkInfo>(29, _omitFieldNames ? '' : 'sipInboundTrunk', subBuilder: $12.SIPInboundTrunkInfo.create)
    ..aOM<$12.SIPOutboundTrunkInfo>(30, _omitFieldNames ? '' : 'sipOutboundTrunk', subBuilder: $12.SIPOutboundTrunkInfo.create)
    ..aOS(31, _omitFieldNames ? '' : 'sipDispatchRuleId')
    ..aOM<$12.SIPDispatchRuleInfo>(32, _omitFieldNames ? '' : 'sipDispatchRule', subBuilder: $12.SIPDispatchRuleInfo.create)
    ..aOM<ReportInfo>(33, _omitFieldNames ? '' : 'report', subBuilder: ReportInfo.create)
    ..aOM<APICallInfo>(34, _omitFieldNames ? '' : 'apiCall', subBuilder: APICallInfo.create)
    ..aOM<WebhookInfo>(35, _omitFieldNames ? '' : 'webhook', subBuilder: WebhookInfo.create)
    ..aOM<$12.SIPTransferInfo>(36, _omitFieldNames ? '' : 'sipTransfer', subBuilder: $12.SIPTransferInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsEvent clone() => AnalyticsEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsEvent copyWith(void Function(AnalyticsEvent) updates) => super.copyWith((message) => updates(message as AnalyticsEvent)) as AnalyticsEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsEvent create() => AnalyticsEvent._();
  AnalyticsEvent createEmptyInstance() => create();
  static $pb.PbList<AnalyticsEvent> createRepeated() => $pb.PbList<AnalyticsEvent>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsEvent>(create);
  static AnalyticsEvent? _defaultInstance;

  @$pb.TagNumber(1)
  AnalyticsEventType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(AnalyticsEventType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $0.Timestamp get timestamp => $_getN(1);
  @$pb.TagNumber(2)
  set timestamp($0.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureTimestamp() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get roomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => clearField(3);

  @$pb.TagNumber(4)
  $2.Room get room => $_getN(3);
  @$pb.TagNumber(4)
  set room($2.Room v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoom() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoom() => clearField(4);
  @$pb.TagNumber(4)
  $2.Room ensureRoom() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get participantId => $_getSZ(4);
  @$pb.TagNumber(5)
  set participantId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasParticipantId() => $_has(4);
  @$pb.TagNumber(5)
  void clearParticipantId() => clearField(5);

  @$pb.TagNumber(6)
  $2.ParticipantInfo get participant => $_getN(5);
  @$pb.TagNumber(6)
  set participant($2.ParticipantInfo v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasParticipant() => $_has(5);
  @$pb.TagNumber(6)
  void clearParticipant() => clearField(6);
  @$pb.TagNumber(6)
  $2.ParticipantInfo ensureParticipant() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get trackId => $_getSZ(6);
  @$pb.TagNumber(7)
  set trackId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTrackId() => $_has(6);
  @$pb.TagNumber(7)
  void clearTrackId() => clearField(7);

  @$pb.TagNumber(8)
  $2.TrackInfo get track => $_getN(7);
  @$pb.TagNumber(8)
  set track($2.TrackInfo v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasTrack() => $_has(7);
  @$pb.TagNumber(8)
  void clearTrack() => clearField(8);
  @$pb.TagNumber(8)
  $2.TrackInfo ensureTrack() => $_ensure(7);

  @$pb.TagNumber(10)
  $core.String get analyticsKey => $_getSZ(8);
  @$pb.TagNumber(10)
  set analyticsKey($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasAnalyticsKey() => $_has(8);
  @$pb.TagNumber(10)
  void clearAnalyticsKey() => clearField(10);

  @$pb.TagNumber(11)
  $2.ClientInfo get clientInfo => $_getN(9);
  @$pb.TagNumber(11)
  set clientInfo($2.ClientInfo v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasClientInfo() => $_has(9);
  @$pb.TagNumber(11)
  void clearClientInfo() => clearField(11);
  @$pb.TagNumber(11)
  $2.ClientInfo ensureClientInfo() => $_ensure(9);

  @$pb.TagNumber(12)
  AnalyticsClientMeta get clientMeta => $_getN(10);
  @$pb.TagNumber(12)
  set clientMeta(AnalyticsClientMeta v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasClientMeta() => $_has(10);
  @$pb.TagNumber(12)
  void clearClientMeta() => clearField(12);
  @$pb.TagNumber(12)
  AnalyticsClientMeta ensureClientMeta() => $_ensure(10);

  @$pb.TagNumber(13)
  $core.String get egressId => $_getSZ(11);
  @$pb.TagNumber(13)
  set egressId($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasEgressId() => $_has(11);
  @$pb.TagNumber(13)
  void clearEgressId() => clearField(13);

  @$pb.TagNumber(14)
  $2.VideoQuality get maxSubscribedVideoQuality => $_getN(12);
  @$pb.TagNumber(14)
  set maxSubscribedVideoQuality($2.VideoQuality v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasMaxSubscribedVideoQuality() => $_has(12);
  @$pb.TagNumber(14)
  void clearMaxSubscribedVideoQuality() => clearField(14);

  @$pb.TagNumber(15)
  $2.ParticipantInfo get publisher => $_getN(13);
  @$pb.TagNumber(15)
  set publisher($2.ParticipantInfo v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasPublisher() => $_has(13);
  @$pb.TagNumber(15)
  void clearPublisher() => clearField(15);
  @$pb.TagNumber(15)
  $2.ParticipantInfo ensurePublisher() => $_ensure(13);

  @$pb.TagNumber(16)
  $core.String get mime => $_getSZ(14);
  @$pb.TagNumber(16)
  set mime($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(16)
  $core.bool hasMime() => $_has(14);
  @$pb.TagNumber(16)
  void clearMime() => clearField(16);

  @$pb.TagNumber(17)
  $7.EgressInfo get egress => $_getN(15);
  @$pb.TagNumber(17)
  set egress($7.EgressInfo v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasEgress() => $_has(15);
  @$pb.TagNumber(17)
  void clearEgress() => clearField(17);
  @$pb.TagNumber(17)
  $7.EgressInfo ensureEgress() => $_ensure(15);

  @$pb.TagNumber(18)
  $8.IngressInfo get ingress => $_getN(16);
  @$pb.TagNumber(18)
  set ingress($8.IngressInfo v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasIngress() => $_has(16);
  @$pb.TagNumber(18)
  void clearIngress() => clearField(18);
  @$pb.TagNumber(18)
  $8.IngressInfo ensureIngress() => $_ensure(16);

  @$pb.TagNumber(19)
  $core.String get ingressId => $_getSZ(17);
  @$pb.TagNumber(19)
  set ingressId($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(19)
  $core.bool hasIngressId() => $_has(17);
  @$pb.TagNumber(19)
  void clearIngressId() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get error => $_getSZ(18);
  @$pb.TagNumber(20)
  set error($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(20)
  $core.bool hasError() => $_has(18);
  @$pb.TagNumber(20)
  void clearError() => clearField(20);

  @$pb.TagNumber(21)
  $2.RTPStats get rtpStats => $_getN(19);
  @$pb.TagNumber(21)
  set rtpStats($2.RTPStats v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasRtpStats() => $_has(19);
  @$pb.TagNumber(21)
  void clearRtpStats() => clearField(21);
  @$pb.TagNumber(21)
  $2.RTPStats ensureRtpStats() => $_ensure(19);

  @$pb.TagNumber(22)
  $core.int get videoLayer => $_getIZ(20);
  @$pb.TagNumber(22)
  set videoLayer($core.int v) { $_setSignedInt32(20, v); }
  @$pb.TagNumber(22)
  $core.bool hasVideoLayer() => $_has(20);
  @$pb.TagNumber(22)
  void clearVideoLayer() => clearField(22);

  @$pb.TagNumber(24)
  $core.String get nodeId => $_getSZ(21);
  @$pb.TagNumber(24)
  set nodeId($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(24)
  $core.bool hasNodeId() => $_has(21);
  @$pb.TagNumber(24)
  void clearNodeId() => clearField(24);

  /// unique id for this event
  @$pb.TagNumber(25)
  $core.String get id => $_getSZ(22);
  @$pb.TagNumber(25)
  set id($core.String v) { $_setString(22, v); }
  @$pb.TagNumber(25)
  $core.bool hasId() => $_has(22);
  @$pb.TagNumber(25)
  void clearId() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get sipCallId => $_getSZ(23);
  @$pb.TagNumber(26)
  set sipCallId($core.String v) { $_setString(23, v); }
  @$pb.TagNumber(26)
  $core.bool hasSipCallId() => $_has(23);
  @$pb.TagNumber(26)
  void clearSipCallId() => clearField(26);

  @$pb.TagNumber(27)
  $12.SIPCallInfo get sipCall => $_getN(24);
  @$pb.TagNumber(27)
  set sipCall($12.SIPCallInfo v) { setField(27, v); }
  @$pb.TagNumber(27)
  $core.bool hasSipCall() => $_has(24);
  @$pb.TagNumber(27)
  void clearSipCall() => clearField(27);
  @$pb.TagNumber(27)
  $12.SIPCallInfo ensureSipCall() => $_ensure(24);

  @$pb.TagNumber(28)
  $core.String get sipTrunkId => $_getSZ(25);
  @$pb.TagNumber(28)
  set sipTrunkId($core.String v) { $_setString(25, v); }
  @$pb.TagNumber(28)
  $core.bool hasSipTrunkId() => $_has(25);
  @$pb.TagNumber(28)
  void clearSipTrunkId() => clearField(28);

  @$pb.TagNumber(29)
  $12.SIPInboundTrunkInfo get sipInboundTrunk => $_getN(26);
  @$pb.TagNumber(29)
  set sipInboundTrunk($12.SIPInboundTrunkInfo v) { setField(29, v); }
  @$pb.TagNumber(29)
  $core.bool hasSipInboundTrunk() => $_has(26);
  @$pb.TagNumber(29)
  void clearSipInboundTrunk() => clearField(29);
  @$pb.TagNumber(29)
  $12.SIPInboundTrunkInfo ensureSipInboundTrunk() => $_ensure(26);

  @$pb.TagNumber(30)
  $12.SIPOutboundTrunkInfo get sipOutboundTrunk => $_getN(27);
  @$pb.TagNumber(30)
  set sipOutboundTrunk($12.SIPOutboundTrunkInfo v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasSipOutboundTrunk() => $_has(27);
  @$pb.TagNumber(30)
  void clearSipOutboundTrunk() => clearField(30);
  @$pb.TagNumber(30)
  $12.SIPOutboundTrunkInfo ensureSipOutboundTrunk() => $_ensure(27);

  @$pb.TagNumber(31)
  $core.String get sipDispatchRuleId => $_getSZ(28);
  @$pb.TagNumber(31)
  set sipDispatchRuleId($core.String v) { $_setString(28, v); }
  @$pb.TagNumber(31)
  $core.bool hasSipDispatchRuleId() => $_has(28);
  @$pb.TagNumber(31)
  void clearSipDispatchRuleId() => clearField(31);

  @$pb.TagNumber(32)
  $12.SIPDispatchRuleInfo get sipDispatchRule => $_getN(29);
  @$pb.TagNumber(32)
  set sipDispatchRule($12.SIPDispatchRuleInfo v) { setField(32, v); }
  @$pb.TagNumber(32)
  $core.bool hasSipDispatchRule() => $_has(29);
  @$pb.TagNumber(32)
  void clearSipDispatchRule() => clearField(32);
  @$pb.TagNumber(32)
  $12.SIPDispatchRuleInfo ensureSipDispatchRule() => $_ensure(29);

  @$pb.TagNumber(33)
  ReportInfo get report => $_getN(30);
  @$pb.TagNumber(33)
  set report(ReportInfo v) { setField(33, v); }
  @$pb.TagNumber(33)
  $core.bool hasReport() => $_has(30);
  @$pb.TagNumber(33)
  void clearReport() => clearField(33);
  @$pb.TagNumber(33)
  ReportInfo ensureReport() => $_ensure(30);

  @$pb.TagNumber(34)
  APICallInfo get apiCall => $_getN(31);
  @$pb.TagNumber(34)
  set apiCall(APICallInfo v) { setField(34, v); }
  @$pb.TagNumber(34)
  $core.bool hasApiCall() => $_has(31);
  @$pb.TagNumber(34)
  void clearApiCall() => clearField(34);
  @$pb.TagNumber(34)
  APICallInfo ensureApiCall() => $_ensure(31);

  @$pb.TagNumber(35)
  WebhookInfo get webhook => $_getN(32);
  @$pb.TagNumber(35)
  set webhook(WebhookInfo v) { setField(35, v); }
  @$pb.TagNumber(35)
  $core.bool hasWebhook() => $_has(32);
  @$pb.TagNumber(35)
  void clearWebhook() => clearField(35);
  @$pb.TagNumber(35)
  WebhookInfo ensureWebhook() => $_ensure(32);

  @$pb.TagNumber(36)
  $12.SIPTransferInfo get sipTransfer => $_getN(33);
  @$pb.TagNumber(36)
  set sipTransfer($12.SIPTransferInfo v) { setField(36, v); }
  @$pb.TagNumber(36)
  $core.bool hasSipTransfer() => $_has(33);
  @$pb.TagNumber(36)
  void clearSipTransfer() => clearField(36);
  @$pb.TagNumber(36)
  $12.SIPTransferInfo ensureSipTransfer() => $_ensure(33);
}

class AnalyticsEvents extends $pb.GeneratedMessage {
  factory AnalyticsEvents({
    $core.Iterable<AnalyticsEvent>? events,
  }) {
    final $result = create();
    if (events != null) {
      $result.events.addAll(events);
    }
    return $result;
  }
  AnalyticsEvents._() : super();
  factory AnalyticsEvents.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsEvents.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsEvents', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<AnalyticsEvent>(1, _omitFieldNames ? '' : 'events', $pb.PbFieldType.PM, subBuilder: AnalyticsEvent.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsEvents clone() => AnalyticsEvents()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsEvents copyWith(void Function(AnalyticsEvents) updates) => super.copyWith((message) => updates(message as AnalyticsEvents)) as AnalyticsEvents;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsEvents create() => AnalyticsEvents._();
  AnalyticsEvents createEmptyInstance() => create();
  static $pb.PbList<AnalyticsEvents> createRepeated() => $pb.PbList<AnalyticsEvents>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsEvents getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsEvents>(create);
  static AnalyticsEvents? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AnalyticsEvent> get events => $_getList(0);
}

class AnalyticsRoomParticipant extends $pb.GeneratedMessage {
  factory AnalyticsRoomParticipant({
    $core.String? id,
    $core.String? identity,
    $core.String? name,
    $2.ParticipantInfo_State? state,
    $0.Timestamp? joinedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (identity != null) {
      $result.identity = identity;
    }
    if (name != null) {
      $result.name = name;
    }
    if (state != null) {
      $result.state = state;
    }
    if (joinedAt != null) {
      $result.joinedAt = joinedAt;
    }
    return $result;
  }
  AnalyticsRoomParticipant._() : super();
  factory AnalyticsRoomParticipant.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsRoomParticipant.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsRoomParticipant', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'identity')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..e<$2.ParticipantInfo_State>(4, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $2.ParticipantInfo_State.JOINING, valueOf: $2.ParticipantInfo_State.valueOf, enumValues: $2.ParticipantInfo_State.values)
    ..aOM<$0.Timestamp>(5, _omitFieldNames ? '' : 'joinedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsRoomParticipant clone() => AnalyticsRoomParticipant()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsRoomParticipant copyWith(void Function(AnalyticsRoomParticipant) updates) => super.copyWith((message) => updates(message as AnalyticsRoomParticipant)) as AnalyticsRoomParticipant;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsRoomParticipant create() => AnalyticsRoomParticipant._();
  AnalyticsRoomParticipant createEmptyInstance() => create();
  static $pb.PbList<AnalyticsRoomParticipant> createRepeated() => $pb.PbList<AnalyticsRoomParticipant>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsRoomParticipant getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsRoomParticipant>(create);
  static AnalyticsRoomParticipant? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get identity => $_getSZ(1);
  @$pb.TagNumber(2)
  set identity($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentity() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $2.ParticipantInfo_State get state => $_getN(3);
  @$pb.TagNumber(4)
  set state($2.ParticipantInfo_State v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $0.Timestamp get joinedAt => $_getN(4);
  @$pb.TagNumber(5)
  set joinedAt($0.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasJoinedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearJoinedAt() => clearField(5);
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
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (participants != null) {
      $result.participants.addAll(participants);
    }
    if (projectId != null) {
      $result.projectId = projectId;
    }
    return $result;
  }
  AnalyticsRoom._() : super();
  factory AnalyticsRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..pc<AnalyticsRoomParticipant>(4, _omitFieldNames ? '' : 'participants', $pb.PbFieldType.PM, subBuilder: AnalyticsRoomParticipant.create)
    ..aOS(5, _omitFieldNames ? '' : 'projectId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsRoom clone() => AnalyticsRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsRoom copyWith(void Function(AnalyticsRoom) updates) => super.copyWith((message) => updates(message as AnalyticsRoom)) as AnalyticsRoom;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsRoom create() => AnalyticsRoom._();
  AnalyticsRoom createEmptyInstance() => create();
  static $pb.PbList<AnalyticsRoom> createRepeated() => $pb.PbList<AnalyticsRoom>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsRoom>(create);
  static AnalyticsRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($0.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureCreatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<AnalyticsRoomParticipant> get participants => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get projectId => $_getSZ(4);
  @$pb.TagNumber(5)
  set projectId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasProjectId() => $_has(4);
  @$pb.TagNumber(5)
  void clearProjectId() => clearField(5);
}

class AnalyticsNodeRooms extends $pb.GeneratedMessage {
  factory AnalyticsNodeRooms({
    $core.String? nodeId,
    $fixnum.Int64? sequenceNumber,
    $0.Timestamp? timestamp,
    $core.Iterable<AnalyticsRoom>? rooms,
  }) {
    final $result = create();
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    if (sequenceNumber != null) {
      $result.sequenceNumber = sequenceNumber;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (rooms != null) {
      $result.rooms.addAll(rooms);
    }
    return $result;
  }
  AnalyticsNodeRooms._() : super();
  factory AnalyticsNodeRooms.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyticsNodeRooms.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyticsNodeRooms', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeId')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'sequenceNumber', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'timestamp', subBuilder: $0.Timestamp.create)
    ..pc<AnalyticsRoom>(4, _omitFieldNames ? '' : 'rooms', $pb.PbFieldType.PM, subBuilder: AnalyticsRoom.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyticsNodeRooms clone() => AnalyticsNodeRooms()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyticsNodeRooms copyWith(void Function(AnalyticsNodeRooms) updates) => super.copyWith((message) => updates(message as AnalyticsNodeRooms)) as AnalyticsNodeRooms;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyticsNodeRooms create() => AnalyticsNodeRooms._();
  AnalyticsNodeRooms createEmptyInstance() => create();
  static $pb.PbList<AnalyticsNodeRooms> createRepeated() => $pb.PbList<AnalyticsNodeRooms>();
  @$core.pragma('dart2js:noInline')
  static AnalyticsNodeRooms getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyticsNodeRooms>(create);
  static AnalyticsNodeRooms? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nodeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get sequenceNumber => $_getI64(1);
  @$pb.TagNumber(2)
  set sequenceNumber($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSequenceNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearSequenceNumber() => clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get timestamp => $_getN(2);
  @$pb.TagNumber(3)
  set timestamp($0.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureTimestamp() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<AnalyticsRoom> get rooms => $_getList(3);
}

enum ReportInfo_Message {
  featureUsage, 
  notSet
}

class ReportInfo extends $pb.GeneratedMessage {
  factory ReportInfo({
    FeatureUsageInfo? featureUsage,
  }) {
    final $result = create();
    if (featureUsage != null) {
      $result.featureUsage = featureUsage;
    }
    return $result;
  }
  ReportInfo._() : super();
  factory ReportInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReportInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ReportInfo_Message> _ReportInfo_MessageByTag = {
    1 : ReportInfo_Message.featureUsage,
    0 : ReportInfo_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReportInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<FeatureUsageInfo>(1, _omitFieldNames ? '' : 'featureUsage', subBuilder: FeatureUsageInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReportInfo clone() => ReportInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReportInfo copyWith(void Function(ReportInfo) updates) => super.copyWith((message) => updates(message as ReportInfo)) as ReportInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportInfo create() => ReportInfo._();
  ReportInfo createEmptyInstance() => create();
  static $pb.PbList<ReportInfo> createRepeated() => $pb.PbList<ReportInfo>();
  @$core.pragma('dart2js:noInline')
  static ReportInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportInfo>(create);
  static ReportInfo? _defaultInstance;

  ReportInfo_Message whichMessage() => _ReportInfo_MessageByTag[$_whichOneof(0)]!;
  void clearMessage() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  FeatureUsageInfo get featureUsage => $_getN(0);
  @$pb.TagNumber(1)
  set featureUsage(FeatureUsageInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFeatureUsage() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeatureUsage() => clearField(1);
  @$pb.TagNumber(1)
  FeatureUsageInfo ensureFeatureUsage() => $_ensure(0);
}

class TimeRange extends $pb.GeneratedMessage {
  factory TimeRange({
    $0.Timestamp? startedAt,
    $0.Timestamp? endedAt,
  }) {
    final $result = create();
    if (startedAt != null) {
      $result.startedAt = startedAt;
    }
    if (endedAt != null) {
      $result.endedAt = endedAt;
    }
    return $result;
  }
  TimeRange._() : super();
  factory TimeRange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimeRange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TimeRange', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'startedAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'endedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimeRange clone() => TimeRange()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimeRange copyWith(void Function(TimeRange) updates) => super.copyWith((message) => updates(message as TimeRange)) as TimeRange;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimeRange create() => TimeRange._();
  TimeRange createEmptyInstance() => create();
  static $pb.PbList<TimeRange> createRepeated() => $pb.PbList<TimeRange>();
  @$core.pragma('dart2js:noInline')
  static TimeRange getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimeRange>(create);
  static TimeRange? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Timestamp get startedAt => $_getN(0);
  @$pb.TagNumber(1)
  set startedAt($0.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStartedAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartedAt() => clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureStartedAt() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Timestamp get endedAt => $_getN(1);
  @$pb.TagNumber(2)
  set endedAt($0.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndedAt() => clearField(2);
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
    final $result = create();
    if (feature != null) {
      $result.feature = feature;
    }
    if (projectId != null) {
      $result.projectId = projectId;
    }
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (participantIdentity != null) {
      $result.participantIdentity = participantIdentity;
    }
    if (participantId != null) {
      $result.participantId = participantId;
    }
    if (trackId != null) {
      $result.trackId = trackId;
    }
    if (timeRanges != null) {
      $result.timeRanges.addAll(timeRanges);
    }
    return $result;
  }
  FeatureUsageInfo._() : super();
  factory FeatureUsageInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FeatureUsageInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FeatureUsageInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..e<FeatureUsageInfo_Feature>(1, _omitFieldNames ? '' : 'feature', $pb.PbFieldType.OE, defaultOrMaker: FeatureUsageInfo_Feature.KRISP_NOISE_CANCELLATION, valueOf: FeatureUsageInfo_Feature.valueOf, enumValues: FeatureUsageInfo_Feature.values)
    ..aOS(2, _omitFieldNames ? '' : 'projectId')
    ..aOS(3, _omitFieldNames ? '' : 'roomName')
    ..aOS(4, _omitFieldNames ? '' : 'roomId')
    ..aOS(5, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(6, _omitFieldNames ? '' : 'participantId')
    ..aOS(7, _omitFieldNames ? '' : 'trackId')
    ..pc<TimeRange>(8, _omitFieldNames ? '' : 'timeRanges', $pb.PbFieldType.PM, subBuilder: TimeRange.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FeatureUsageInfo clone() => FeatureUsageInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FeatureUsageInfo copyWith(void Function(FeatureUsageInfo) updates) => super.copyWith((message) => updates(message as FeatureUsageInfo)) as FeatureUsageInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FeatureUsageInfo create() => FeatureUsageInfo._();
  FeatureUsageInfo createEmptyInstance() => create();
  static $pb.PbList<FeatureUsageInfo> createRepeated() => $pb.PbList<FeatureUsageInfo>();
  @$core.pragma('dart2js:noInline')
  static FeatureUsageInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FeatureUsageInfo>(create);
  static FeatureUsageInfo? _defaultInstance;

  @$pb.TagNumber(1)
  FeatureUsageInfo_Feature get feature => $_getN(0);
  @$pb.TagNumber(1)
  set feature(FeatureUsageInfo_Feature v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFeature() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeature() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get projectId => $_getSZ(1);
  @$pb.TagNumber(2)
  set projectId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProjectId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomName => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomId => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get participantIdentity => $_getSZ(4);
  @$pb.TagNumber(5)
  set participantIdentity($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasParticipantIdentity() => $_has(4);
  @$pb.TagNumber(5)
  void clearParticipantIdentity() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get participantId => $_getSZ(5);
  @$pb.TagNumber(6)
  set participantId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasParticipantId() => $_has(5);
  @$pb.TagNumber(6)
  void clearParticipantId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get trackId => $_getSZ(6);
  @$pb.TagNumber(7)
  set trackId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTrackId() => $_has(6);
  @$pb.TagNumber(7)
  void clearTrackId() => clearField(7);

  /// time ranges during which the feature was enabled.
  /// for e. g., noise cancellation may not be applied when a media track is paused/muted,
  /// this allows reporting only periods during which a feature is avtive.
  @$pb.TagNumber(8)
  $core.List<TimeRange> get timeRanges => $_getList(7);
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
    $9.CreateRoomRequest? createRoomRequest,
    $9.ListRoomsRequest? listRoomsRequest,
    $9.DeleteRoomRequest? deleteRoomRequest,
    $9.ListParticipantsRequest? listParticipantsRequest,
    $9.RoomParticipantIdentity? roomParticipantIdentity,
    $9.MuteRoomTrackRequest? muteRoomTrackRequest,
    $9.UpdateParticipantRequest? updateParticipantRequest,
    $9.UpdateSubscriptionsRequest? updateSubscriptionsRequest,
    $9.SendDataRequest? sendDataRequest,
    $9.UpdateRoomMetadataRequest? updateRoomMetadataRequest,
  }) {
    final $result = create();
    if (createRoomRequest != null) {
      $result.createRoomRequest = createRoomRequest;
    }
    if (listRoomsRequest != null) {
      $result.listRoomsRequest = listRoomsRequest;
    }
    if (deleteRoomRequest != null) {
      $result.deleteRoomRequest = deleteRoomRequest;
    }
    if (listParticipantsRequest != null) {
      $result.listParticipantsRequest = listParticipantsRequest;
    }
    if (roomParticipantIdentity != null) {
      $result.roomParticipantIdentity = roomParticipantIdentity;
    }
    if (muteRoomTrackRequest != null) {
      $result.muteRoomTrackRequest = muteRoomTrackRequest;
    }
    if (updateParticipantRequest != null) {
      $result.updateParticipantRequest = updateParticipantRequest;
    }
    if (updateSubscriptionsRequest != null) {
      $result.updateSubscriptionsRequest = updateSubscriptionsRequest;
    }
    if (sendDataRequest != null) {
      $result.sendDataRequest = sendDataRequest;
    }
    if (updateRoomMetadataRequest != null) {
      $result.updateRoomMetadataRequest = updateRoomMetadataRequest;
    }
    return $result;
  }
  APICallRequest._() : super();
  factory APICallRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory APICallRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, APICallRequest_Message> _APICallRequest_MessageByTag = {
    1 : APICallRequest_Message.createRoomRequest,
    2 : APICallRequest_Message.listRoomsRequest,
    3 : APICallRequest_Message.deleteRoomRequest,
    4 : APICallRequest_Message.listParticipantsRequest,
    5 : APICallRequest_Message.roomParticipantIdentity,
    6 : APICallRequest_Message.muteRoomTrackRequest,
    7 : APICallRequest_Message.updateParticipantRequest,
    8 : APICallRequest_Message.updateSubscriptionsRequest,
    9 : APICallRequest_Message.sendDataRequest,
    10 : APICallRequest_Message.updateRoomMetadataRequest,
    0 : APICallRequest_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'APICallRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    ..aOM<$9.CreateRoomRequest>(1, _omitFieldNames ? '' : 'createRoomRequest', subBuilder: $9.CreateRoomRequest.create)
    ..aOM<$9.ListRoomsRequest>(2, _omitFieldNames ? '' : 'listRoomsRequest', subBuilder: $9.ListRoomsRequest.create)
    ..aOM<$9.DeleteRoomRequest>(3, _omitFieldNames ? '' : 'deleteRoomRequest', subBuilder: $9.DeleteRoomRequest.create)
    ..aOM<$9.ListParticipantsRequest>(4, _omitFieldNames ? '' : 'listParticipantsRequest', subBuilder: $9.ListParticipantsRequest.create)
    ..aOM<$9.RoomParticipantIdentity>(5, _omitFieldNames ? '' : 'roomParticipantIdentity', subBuilder: $9.RoomParticipantIdentity.create)
    ..aOM<$9.MuteRoomTrackRequest>(6, _omitFieldNames ? '' : 'muteRoomTrackRequest', subBuilder: $9.MuteRoomTrackRequest.create)
    ..aOM<$9.UpdateParticipantRequest>(7, _omitFieldNames ? '' : 'updateParticipantRequest', subBuilder: $9.UpdateParticipantRequest.create)
    ..aOM<$9.UpdateSubscriptionsRequest>(8, _omitFieldNames ? '' : 'updateSubscriptionsRequest', subBuilder: $9.UpdateSubscriptionsRequest.create)
    ..aOM<$9.SendDataRequest>(9, _omitFieldNames ? '' : 'sendDataRequest', subBuilder: $9.SendDataRequest.create)
    ..aOM<$9.UpdateRoomMetadataRequest>(10, _omitFieldNames ? '' : 'updateRoomMetadataRequest', subBuilder: $9.UpdateRoomMetadataRequest.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  APICallRequest clone() => APICallRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  APICallRequest copyWith(void Function(APICallRequest) updates) => super.copyWith((message) => updates(message as APICallRequest)) as APICallRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static APICallRequest create() => APICallRequest._();
  APICallRequest createEmptyInstance() => create();
  static $pb.PbList<APICallRequest> createRepeated() => $pb.PbList<APICallRequest>();
  @$core.pragma('dart2js:noInline')
  static APICallRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<APICallRequest>(create);
  static APICallRequest? _defaultInstance;

  APICallRequest_Message whichMessage() => _APICallRequest_MessageByTag[$_whichOneof(0)]!;
  void clearMessage() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $9.CreateRoomRequest get createRoomRequest => $_getN(0);
  @$pb.TagNumber(1)
  set createRoomRequest($9.CreateRoomRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreateRoomRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreateRoomRequest() => clearField(1);
  @$pb.TagNumber(1)
  $9.CreateRoomRequest ensureCreateRoomRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  $9.ListRoomsRequest get listRoomsRequest => $_getN(1);
  @$pb.TagNumber(2)
  set listRoomsRequest($9.ListRoomsRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasListRoomsRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearListRoomsRequest() => clearField(2);
  @$pb.TagNumber(2)
  $9.ListRoomsRequest ensureListRoomsRequest() => $_ensure(1);

  @$pb.TagNumber(3)
  $9.DeleteRoomRequest get deleteRoomRequest => $_getN(2);
  @$pb.TagNumber(3)
  set deleteRoomRequest($9.DeleteRoomRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeleteRoomRequest() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeleteRoomRequest() => clearField(3);
  @$pb.TagNumber(3)
  $9.DeleteRoomRequest ensureDeleteRoomRequest() => $_ensure(2);

  @$pb.TagNumber(4)
  $9.ListParticipantsRequest get listParticipantsRequest => $_getN(3);
  @$pb.TagNumber(4)
  set listParticipantsRequest($9.ListParticipantsRequest v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasListParticipantsRequest() => $_has(3);
  @$pb.TagNumber(4)
  void clearListParticipantsRequest() => clearField(4);
  @$pb.TagNumber(4)
  $9.ListParticipantsRequest ensureListParticipantsRequest() => $_ensure(3);

  @$pb.TagNumber(5)
  $9.RoomParticipantIdentity get roomParticipantIdentity => $_getN(4);
  @$pb.TagNumber(5)
  set roomParticipantIdentity($9.RoomParticipantIdentity v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRoomParticipantIdentity() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomParticipantIdentity() => clearField(5);
  @$pb.TagNumber(5)
  $9.RoomParticipantIdentity ensureRoomParticipantIdentity() => $_ensure(4);

  @$pb.TagNumber(6)
  $9.MuteRoomTrackRequest get muteRoomTrackRequest => $_getN(5);
  @$pb.TagNumber(6)
  set muteRoomTrackRequest($9.MuteRoomTrackRequest v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasMuteRoomTrackRequest() => $_has(5);
  @$pb.TagNumber(6)
  void clearMuteRoomTrackRequest() => clearField(6);
  @$pb.TagNumber(6)
  $9.MuteRoomTrackRequest ensureMuteRoomTrackRequest() => $_ensure(5);

  @$pb.TagNumber(7)
  $9.UpdateParticipantRequest get updateParticipantRequest => $_getN(6);
  @$pb.TagNumber(7)
  set updateParticipantRequest($9.UpdateParticipantRequest v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdateParticipantRequest() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateParticipantRequest() => clearField(7);
  @$pb.TagNumber(7)
  $9.UpdateParticipantRequest ensureUpdateParticipantRequest() => $_ensure(6);

  @$pb.TagNumber(8)
  $9.UpdateSubscriptionsRequest get updateSubscriptionsRequest => $_getN(7);
  @$pb.TagNumber(8)
  set updateSubscriptionsRequest($9.UpdateSubscriptionsRequest v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdateSubscriptionsRequest() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdateSubscriptionsRequest() => clearField(8);
  @$pb.TagNumber(8)
  $9.UpdateSubscriptionsRequest ensureUpdateSubscriptionsRequest() => $_ensure(7);

  @$pb.TagNumber(9)
  $9.SendDataRequest get sendDataRequest => $_getN(8);
  @$pb.TagNumber(9)
  set sendDataRequest($9.SendDataRequest v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasSendDataRequest() => $_has(8);
  @$pb.TagNumber(9)
  void clearSendDataRequest() => clearField(9);
  @$pb.TagNumber(9)
  $9.SendDataRequest ensureSendDataRequest() => $_ensure(8);

  @$pb.TagNumber(10)
  $9.UpdateRoomMetadataRequest get updateRoomMetadataRequest => $_getN(9);
  @$pb.TagNumber(10)
  set updateRoomMetadataRequest($9.UpdateRoomMetadataRequest v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasUpdateRoomMetadataRequest() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdateRoomMetadataRequest() => clearField(10);
  @$pb.TagNumber(10)
  $9.UpdateRoomMetadataRequest ensureUpdateRoomMetadataRequest() => $_ensure(9);
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
    final $result = create();
    if (projectId != null) {
      $result.projectId = projectId;
    }
    if (request != null) {
      $result.request = request;
    }
    if (service != null) {
      $result.service = service;
    }
    if (method != null) {
      $result.method = method;
    }
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (twirpErrorCode != null) {
      $result.twirpErrorCode = twirpErrorCode;
    }
    if (twirpErrorMessage != null) {
      $result.twirpErrorMessage = twirpErrorMessage;
    }
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (participantIdentity != null) {
      $result.participantIdentity = participantIdentity;
    }
    if (participantId != null) {
      $result.participantId = participantId;
    }
    if (trackId != null) {
      $result.trackId = trackId;
    }
    if (startedAt != null) {
      $result.startedAt = startedAt;
    }
    if (durationNs != null) {
      $result.durationNs = durationNs;
    }
    return $result;
  }
  APICallInfo._() : super();
  factory APICallInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory APICallInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'APICallInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'projectId')
    ..aOM<APICallRequest>(2, _omitFieldNames ? '' : 'request', subBuilder: APICallRequest.create)
    ..aOS(3, _omitFieldNames ? '' : 'service')
    ..aOS(4, _omitFieldNames ? '' : 'method')
    ..aOS(5, _omitFieldNames ? '' : 'nodeId')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'twirpErrorCode')
    ..aOS(8, _omitFieldNames ? '' : 'twirpErrorMessage')
    ..aOS(9, _omitFieldNames ? '' : 'roomName')
    ..aOS(10, _omitFieldNames ? '' : 'roomId')
    ..aOS(11, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(12, _omitFieldNames ? '' : 'participantId')
    ..aOS(13, _omitFieldNames ? '' : 'trackId')
    ..aOM<$0.Timestamp>(14, _omitFieldNames ? '' : 'startedAt', subBuilder: $0.Timestamp.create)
    ..aInt64(15, _omitFieldNames ? '' : 'durationNs')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  APICallInfo clone() => APICallInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  APICallInfo copyWith(void Function(APICallInfo) updates) => super.copyWith((message) => updates(message as APICallInfo)) as APICallInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static APICallInfo create() => APICallInfo._();
  APICallInfo createEmptyInstance() => create();
  static $pb.PbList<APICallInfo> createRepeated() => $pb.PbList<APICallInfo>();
  @$core.pragma('dart2js:noInline')
  static APICallInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<APICallInfo>(create);
  static APICallInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get projectId => $_getSZ(0);
  @$pb.TagNumber(1)
  set projectId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => clearField(1);

  @$pb.TagNumber(2)
  APICallRequest get request => $_getN(1);
  @$pb.TagNumber(2)
  set request(APICallRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequest() => clearField(2);
  @$pb.TagNumber(2)
  APICallRequest ensureRequest() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get service => $_getSZ(2);
  @$pb.TagNumber(3)
  set service($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasService() => $_has(2);
  @$pb.TagNumber(3)
  void clearService() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get method => $_getSZ(3);
  @$pb.TagNumber(4)
  set method($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMethod() => $_has(3);
  @$pb.TagNumber(4)
  void clearMethod() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get nodeId => $_getSZ(4);
  @$pb.TagNumber(5)
  set nodeId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNodeId() => $_has(4);
  @$pb.TagNumber(5)
  void clearNodeId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get status => $_getIZ(5);
  @$pb.TagNumber(6)
  set status($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get twirpErrorCode => $_getSZ(6);
  @$pb.TagNumber(7)
  set twirpErrorCode($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTwirpErrorCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearTwirpErrorCode() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get twirpErrorMessage => $_getSZ(7);
  @$pb.TagNumber(8)
  set twirpErrorMessage($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTwirpErrorMessage() => $_has(7);
  @$pb.TagNumber(8)
  void clearTwirpErrorMessage() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get roomName => $_getSZ(8);
  @$pb.TagNumber(9)
  set roomName($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasRoomName() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoomName() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get roomId => $_getSZ(9);
  @$pb.TagNumber(10)
  set roomId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasRoomId() => $_has(9);
  @$pb.TagNumber(10)
  void clearRoomId() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get participantIdentity => $_getSZ(10);
  @$pb.TagNumber(11)
  set participantIdentity($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasParticipantIdentity() => $_has(10);
  @$pb.TagNumber(11)
  void clearParticipantIdentity() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get participantId => $_getSZ(11);
  @$pb.TagNumber(12)
  set participantId($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasParticipantId() => $_has(11);
  @$pb.TagNumber(12)
  void clearParticipantId() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get trackId => $_getSZ(12);
  @$pb.TagNumber(13)
  set trackId($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasTrackId() => $_has(12);
  @$pb.TagNumber(13)
  void clearTrackId() => clearField(13);

  @$pb.TagNumber(14)
  $0.Timestamp get startedAt => $_getN(13);
  @$pb.TagNumber(14)
  set startedAt($0.Timestamp v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasStartedAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearStartedAt() => clearField(14);
  @$pb.TagNumber(14)
  $0.Timestamp ensureStartedAt() => $_ensure(13);

  @$pb.TagNumber(15)
  $fixnum.Int64 get durationNs => $_getI64(14);
  @$pb.TagNumber(15)
  set durationNs($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasDurationNs() => $_has(14);
  @$pb.TagNumber(15)
  void clearDurationNs() => clearField(15);
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
    final $result = create();
    if (eventId != null) {
      $result.eventId = eventId;
    }
    if (event != null) {
      $result.event = event;
    }
    if (projectId != null) {
      $result.projectId = projectId;
    }
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (participantIdentity != null) {
      $result.participantIdentity = participantIdentity;
    }
    if (participantId != null) {
      $result.participantId = participantId;
    }
    if (trackId != null) {
      $result.trackId = trackId;
    }
    if (egressId != null) {
      $result.egressId = egressId;
    }
    if (ingressId != null) {
      $result.ingressId = ingressId;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (queuedAt != null) {
      $result.queuedAt = queuedAt;
    }
    if (queueDurationNs != null) {
      $result.queueDurationNs = queueDurationNs;
    }
    if (sentAt != null) {
      $result.sentAt = sentAt;
    }
    if (sendDurationNs != null) {
      $result.sendDurationNs = sendDurationNs;
    }
    if (url != null) {
      $result.url = url;
    }
    if (numDropped != null) {
      $result.numDropped = numDropped;
    }
    if (isDropped != null) {
      $result.isDropped = isDropped;
    }
    if (serviceStatus != null) {
      $result.serviceStatus = serviceStatus;
    }
    if (serviceErrorCode != null) {
      $result.serviceErrorCode = serviceErrorCode;
    }
    if (serviceError != null) {
      $result.serviceError = serviceError;
    }
    if (sendError != null) {
      $result.sendError = sendError;
    }
    return $result;
  }
  WebhookInfo._() : super();
  factory WebhookInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WebhookInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WebhookInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
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
    ..aOM<$0.Timestamp>(11, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(12, _omitFieldNames ? '' : 'queuedAt', subBuilder: $0.Timestamp.create)
    ..aInt64(13, _omitFieldNames ? '' : 'queueDurationNs')
    ..aOM<$0.Timestamp>(14, _omitFieldNames ? '' : 'sentAt', subBuilder: $0.Timestamp.create)
    ..aInt64(15, _omitFieldNames ? '' : 'sendDurationNs')
    ..aOS(16, _omitFieldNames ? '' : 'url')
    ..a<$core.int>(17, _omitFieldNames ? '' : 'numDropped', $pb.PbFieldType.O3)
    ..aOB(18, _omitFieldNames ? '' : 'isDropped')
    ..aOS(19, _omitFieldNames ? '' : 'serviceStatus')
    ..a<$core.int>(20, _omitFieldNames ? '' : 'serviceErrorCode', $pb.PbFieldType.O3)
    ..aOS(21, _omitFieldNames ? '' : 'serviceError')
    ..aOS(22, _omitFieldNames ? '' : 'sendError')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WebhookInfo clone() => WebhookInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WebhookInfo copyWith(void Function(WebhookInfo) updates) => super.copyWith((message) => updates(message as WebhookInfo)) as WebhookInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WebhookInfo create() => WebhookInfo._();
  WebhookInfo createEmptyInstance() => create();
  static $pb.PbList<WebhookInfo> createRepeated() => $pb.PbList<WebhookInfo>();
  @$core.pragma('dart2js:noInline')
  static WebhookInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WebhookInfo>(create);
  static WebhookInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get eventId => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get event => $_getSZ(1);
  @$pb.TagNumber(2)
  set event($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEvent() => $_has(1);
  @$pb.TagNumber(2)
  void clearEvent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get projectId => $_getSZ(2);
  @$pb.TagNumber(3)
  set projectId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProjectId() => $_has(2);
  @$pb.TagNumber(3)
  void clearProjectId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomName => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomName() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get roomId => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRoomId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get participantIdentity => $_getSZ(5);
  @$pb.TagNumber(6)
  set participantIdentity($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasParticipantIdentity() => $_has(5);
  @$pb.TagNumber(6)
  void clearParticipantIdentity() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get participantId => $_getSZ(6);
  @$pb.TagNumber(7)
  set participantId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasParticipantId() => $_has(6);
  @$pb.TagNumber(7)
  void clearParticipantId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get trackId => $_getSZ(7);
  @$pb.TagNumber(8)
  set trackId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTrackId() => $_has(7);
  @$pb.TagNumber(8)
  void clearTrackId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get egressId => $_getSZ(8);
  @$pb.TagNumber(9)
  set egressId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasEgressId() => $_has(8);
  @$pb.TagNumber(9)
  void clearEgressId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get ingressId => $_getSZ(9);
  @$pb.TagNumber(10)
  set ingressId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIngressId() => $_has(9);
  @$pb.TagNumber(10)
  void clearIngressId() => clearField(10);

  @$pb.TagNumber(11)
  $0.Timestamp get createdAt => $_getN(10);
  @$pb.TagNumber(11)
  set createdAt($0.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreatedAt() => clearField(11);
  @$pb.TagNumber(11)
  $0.Timestamp ensureCreatedAt() => $_ensure(10);

  @$pb.TagNumber(12)
  $0.Timestamp get queuedAt => $_getN(11);
  @$pb.TagNumber(12)
  set queuedAt($0.Timestamp v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasQueuedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearQueuedAt() => clearField(12);
  @$pb.TagNumber(12)
  $0.Timestamp ensureQueuedAt() => $_ensure(11);

  @$pb.TagNumber(13)
  $fixnum.Int64 get queueDurationNs => $_getI64(12);
  @$pb.TagNumber(13)
  set queueDurationNs($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasQueueDurationNs() => $_has(12);
  @$pb.TagNumber(13)
  void clearQueueDurationNs() => clearField(13);

  @$pb.TagNumber(14)
  $0.Timestamp get sentAt => $_getN(13);
  @$pb.TagNumber(14)
  set sentAt($0.Timestamp v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasSentAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearSentAt() => clearField(14);
  @$pb.TagNumber(14)
  $0.Timestamp ensureSentAt() => $_ensure(13);

  @$pb.TagNumber(15)
  $fixnum.Int64 get sendDurationNs => $_getI64(14);
  @$pb.TagNumber(15)
  set sendDurationNs($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasSendDurationNs() => $_has(14);
  @$pb.TagNumber(15)
  void clearSendDurationNs() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get url => $_getSZ(15);
  @$pb.TagNumber(16)
  set url($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasUrl() => $_has(15);
  @$pb.TagNumber(16)
  void clearUrl() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get numDropped => $_getIZ(16);
  @$pb.TagNumber(17)
  set numDropped($core.int v) { $_setSignedInt32(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasNumDropped() => $_has(16);
  @$pb.TagNumber(17)
  void clearNumDropped() => clearField(17);

  @$pb.TagNumber(18)
  $core.bool get isDropped => $_getBF(17);
  @$pb.TagNumber(18)
  set isDropped($core.bool v) { $_setBool(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasIsDropped() => $_has(17);
  @$pb.TagNumber(18)
  void clearIsDropped() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get serviceStatus => $_getSZ(18);
  @$pb.TagNumber(19)
  set serviceStatus($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasServiceStatus() => $_has(18);
  @$pb.TagNumber(19)
  void clearServiceStatus() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get serviceErrorCode => $_getIZ(19);
  @$pb.TagNumber(20)
  set serviceErrorCode($core.int v) { $_setSignedInt32(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasServiceErrorCode() => $_has(19);
  @$pb.TagNumber(20)
  void clearServiceErrorCode() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get serviceError => $_getSZ(20);
  @$pb.TagNumber(21)
  set serviceError($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasServiceError() => $_has(20);
  @$pb.TagNumber(21)
  void clearServiceError() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get sendError => $_getSZ(21);
  @$pb.TagNumber(22)
  set sendError($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasSendError() => $_has(21);
  @$pb.TagNumber(22)
  void clearSendError() => clearField(22);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
