//
//  Generated code. Do not modify.
//  source: livekit_internal.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_agent_dispatch.pb.dart' as $6;
import 'livekit_egress.pb.dart' as $7;
import 'livekit_internal.pbenum.dart';
import 'livekit_models.pb.dart' as $2;
import 'livekit_models.pbenum.dart' as $2;
import 'livekit_room.pb.dart' as $9;
import 'livekit_rtc.pb.dart' as $14;

export 'livekit_internal.pbenum.dart';

class Node extends $pb.GeneratedMessage {
  factory Node({
    $core.String? id,
    $core.String? ip,
    $core.int? numCpus,
    NodeStats? stats,
    NodeType? type,
    NodeState? state,
    $core.String? region,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (ip != null) {
      $result.ip = ip;
    }
    if (numCpus != null) {
      $result.numCpus = numCpus;
    }
    if (stats != null) {
      $result.stats = stats;
    }
    if (type != null) {
      $result.type = type;
    }
    if (state != null) {
      $result.state = state;
    }
    if (region != null) {
      $result.region = region;
    }
    return $result;
  }
  Node._() : super();
  factory Node.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Node.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Node', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'ip')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'numCpus', $pb.PbFieldType.OU3)
    ..aOM<NodeStats>(4, _omitFieldNames ? '' : 'stats', subBuilder: NodeStats.create)
    ..e<NodeType>(5, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: NodeType.SERVER, valueOf: NodeType.valueOf, enumValues: NodeType.values)
    ..e<NodeState>(6, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: NodeState.STARTING_UP, valueOf: NodeState.valueOf, enumValues: NodeState.values)
    ..aOS(7, _omitFieldNames ? '' : 'region')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Node clone() => Node()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Node copyWith(void Function(Node) updates) => super.copyWith((message) => updates(message as Node)) as Node;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Node create() => Node._();
  Node createEmptyInstance() => create();
  static $pb.PbList<Node> createRepeated() => $pb.PbList<Node>();
  @$core.pragma('dart2js:noInline')
  static Node getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Node>(create);
  static Node? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ip => $_getSZ(1);
  @$pb.TagNumber(2)
  set ip($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIp() => $_has(1);
  @$pb.TagNumber(2)
  void clearIp() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get numCpus => $_getIZ(2);
  @$pb.TagNumber(3)
  set numCpus($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNumCpus() => $_has(2);
  @$pb.TagNumber(3)
  void clearNumCpus() => clearField(3);

  @$pb.TagNumber(4)
  NodeStats get stats => $_getN(3);
  @$pb.TagNumber(4)
  set stats(NodeStats v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStats() => $_has(3);
  @$pb.TagNumber(4)
  void clearStats() => clearField(4);
  @$pb.TagNumber(4)
  NodeStats ensureStats() => $_ensure(3);

  @$pb.TagNumber(5)
  NodeType get type => $_getN(4);
  @$pb.TagNumber(5)
  set type(NodeType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  NodeState get state => $_getN(5);
  @$pb.TagNumber(6)
  set state(NodeState v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get region => $_getSZ(6);
  @$pb.TagNumber(7)
  set region($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRegion() => $_has(6);
  @$pb.TagNumber(7)
  void clearRegion() => clearField(7);
}

class NodeStats extends $pb.GeneratedMessage {
  factory NodeStats({
    $fixnum.Int64? startedAt,
    $fixnum.Int64? updatedAt,
    $core.int? numRooms,
    $core.int? numClients,
    $core.int? numTracksIn,
    $core.int? numTracksOut,
    $fixnum.Int64? bytesIn,
    $fixnum.Int64? bytesOut,
    $fixnum.Int64? packetsIn,
    $fixnum.Int64? packetsOut,
    $fixnum.Int64? nackTotal,
  @$core.Deprecated('This field is deprecated.')
    $core.double? bytesInPerSec,
  @$core.Deprecated('This field is deprecated.')
    $core.double? bytesOutPerSec,
    $core.double? packetsInPerSec,
  @$core.Deprecated('This field is deprecated.')
    $core.double? packetsOutPerSec,
  @$core.Deprecated('This field is deprecated.')
    $core.double? nackPerSec,
    $core.int? numCpus,
    $core.double? loadAvgLast1min,
    $core.double? loadAvgLast5min,
    $core.double? loadAvgLast15min,
    $core.double? cpuLoad,
    $fixnum.Int64? retransmitBytesOut,
    $fixnum.Int64? retransmitPacketsOut,
  @$core.Deprecated('This field is deprecated.')
    $core.double? retransmitBytesOutPerSec,
  @$core.Deprecated('This field is deprecated.')
    $core.double? retransmitPacketsOutPerSec,
    $fixnum.Int64? participantSignalConnected,
  @$core.Deprecated('This field is deprecated.')
    $core.double? participantSignalConnectedPerSec,
    $core.int? sysPacketsOut,
    $core.int? sysPacketsDropped,
  @$core.Deprecated('This field is deprecated.')
    $core.double? sysPacketsOutPerSec,
  @$core.Deprecated('This field is deprecated.')
    $core.double? sysPacketsDroppedPerSec,
  @$core.Deprecated('This field is deprecated.')
    $core.double? sysPacketsDroppedPctPerSec,
  @$core.Deprecated('This field is deprecated.')
    $core.double? memoryLoad,
    $fixnum.Int64? memoryTotal,
    $fixnum.Int64? memoryUsed,
    $core.int? numTrackPublishAttempts,
  @$core.Deprecated('This field is deprecated.')
    $core.double? trackPublishAttemptsPerSec,
    $core.int? numTrackPublishSuccess,
  @$core.Deprecated('This field is deprecated.')
    $core.double? trackPublishSuccessPerSec,
    $core.int? numTrackSubscribeAttempts,
  @$core.Deprecated('This field is deprecated.')
    $core.double? trackSubscribeAttemptsPerSec,
    $core.int? numTrackSubscribeSuccess,
  @$core.Deprecated('This field is deprecated.')
    $core.double? trackSubscribeSuccessPerSec,
    $fixnum.Int64? participantRtcConnected,
  @$core.Deprecated('This field is deprecated.')
    $core.double? participantRtcConnectedPerSec,
    $fixnum.Int64? participantRtcInit,
  @$core.Deprecated('This field is deprecated.')
    $core.double? participantRtcInitPerSec,
    $core.int? forwardLatency,
    $core.int? forwardJitter,
    $core.Iterable<NodeStatsRate>? rates,
    $core.int? numTrackPublishCancels,
    $core.int? numTrackSubscribeCancels,
    $fixnum.Int64? participantRtcCanceled,
  }) {
    final $result = create();
    if (startedAt != null) {
      $result.startedAt = startedAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (numRooms != null) {
      $result.numRooms = numRooms;
    }
    if (numClients != null) {
      $result.numClients = numClients;
    }
    if (numTracksIn != null) {
      $result.numTracksIn = numTracksIn;
    }
    if (numTracksOut != null) {
      $result.numTracksOut = numTracksOut;
    }
    if (bytesIn != null) {
      $result.bytesIn = bytesIn;
    }
    if (bytesOut != null) {
      $result.bytesOut = bytesOut;
    }
    if (packetsIn != null) {
      $result.packetsIn = packetsIn;
    }
    if (packetsOut != null) {
      $result.packetsOut = packetsOut;
    }
    if (nackTotal != null) {
      $result.nackTotal = nackTotal;
    }
    if (bytesInPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.bytesInPerSec = bytesInPerSec;
    }
    if (bytesOutPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.bytesOutPerSec = bytesOutPerSec;
    }
    if (packetsInPerSec != null) {
      $result.packetsInPerSec = packetsInPerSec;
    }
    if (packetsOutPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.packetsOutPerSec = packetsOutPerSec;
    }
    if (nackPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.nackPerSec = nackPerSec;
    }
    if (numCpus != null) {
      $result.numCpus = numCpus;
    }
    if (loadAvgLast1min != null) {
      $result.loadAvgLast1min = loadAvgLast1min;
    }
    if (loadAvgLast5min != null) {
      $result.loadAvgLast5min = loadAvgLast5min;
    }
    if (loadAvgLast15min != null) {
      $result.loadAvgLast15min = loadAvgLast15min;
    }
    if (cpuLoad != null) {
      $result.cpuLoad = cpuLoad;
    }
    if (retransmitBytesOut != null) {
      $result.retransmitBytesOut = retransmitBytesOut;
    }
    if (retransmitPacketsOut != null) {
      $result.retransmitPacketsOut = retransmitPacketsOut;
    }
    if (retransmitBytesOutPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.retransmitBytesOutPerSec = retransmitBytesOutPerSec;
    }
    if (retransmitPacketsOutPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.retransmitPacketsOutPerSec = retransmitPacketsOutPerSec;
    }
    if (participantSignalConnected != null) {
      $result.participantSignalConnected = participantSignalConnected;
    }
    if (participantSignalConnectedPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.participantSignalConnectedPerSec = participantSignalConnectedPerSec;
    }
    if (sysPacketsOut != null) {
      $result.sysPacketsOut = sysPacketsOut;
    }
    if (sysPacketsDropped != null) {
      $result.sysPacketsDropped = sysPacketsDropped;
    }
    if (sysPacketsOutPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.sysPacketsOutPerSec = sysPacketsOutPerSec;
    }
    if (sysPacketsDroppedPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.sysPacketsDroppedPerSec = sysPacketsDroppedPerSec;
    }
    if (sysPacketsDroppedPctPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.sysPacketsDroppedPctPerSec = sysPacketsDroppedPctPerSec;
    }
    if (memoryLoad != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.memoryLoad = memoryLoad;
    }
    if (memoryTotal != null) {
      $result.memoryTotal = memoryTotal;
    }
    if (memoryUsed != null) {
      $result.memoryUsed = memoryUsed;
    }
    if (numTrackPublishAttempts != null) {
      $result.numTrackPublishAttempts = numTrackPublishAttempts;
    }
    if (trackPublishAttemptsPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.trackPublishAttemptsPerSec = trackPublishAttemptsPerSec;
    }
    if (numTrackPublishSuccess != null) {
      $result.numTrackPublishSuccess = numTrackPublishSuccess;
    }
    if (trackPublishSuccessPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.trackPublishSuccessPerSec = trackPublishSuccessPerSec;
    }
    if (numTrackSubscribeAttempts != null) {
      $result.numTrackSubscribeAttempts = numTrackSubscribeAttempts;
    }
    if (trackSubscribeAttemptsPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.trackSubscribeAttemptsPerSec = trackSubscribeAttemptsPerSec;
    }
    if (numTrackSubscribeSuccess != null) {
      $result.numTrackSubscribeSuccess = numTrackSubscribeSuccess;
    }
    if (trackSubscribeSuccessPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.trackSubscribeSuccessPerSec = trackSubscribeSuccessPerSec;
    }
    if (participantRtcConnected != null) {
      $result.participantRtcConnected = participantRtcConnected;
    }
    if (participantRtcConnectedPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.participantRtcConnectedPerSec = participantRtcConnectedPerSec;
    }
    if (participantRtcInit != null) {
      $result.participantRtcInit = participantRtcInit;
    }
    if (participantRtcInitPerSec != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.participantRtcInitPerSec = participantRtcInitPerSec;
    }
    if (forwardLatency != null) {
      $result.forwardLatency = forwardLatency;
    }
    if (forwardJitter != null) {
      $result.forwardJitter = forwardJitter;
    }
    if (rates != null) {
      $result.rates.addAll(rates);
    }
    if (numTrackPublishCancels != null) {
      $result.numTrackPublishCancels = numTrackPublishCancels;
    }
    if (numTrackSubscribeCancels != null) {
      $result.numTrackSubscribeCancels = numTrackSubscribeCancels;
    }
    if (participantRtcCanceled != null) {
      $result.participantRtcCanceled = participantRtcCanceled;
    }
    return $result;
  }
  NodeStats._() : super();
  factory NodeStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NodeStats', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(2, _omitFieldNames ? '' : 'updatedAt')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'numRooms', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'numClients', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'numTracksIn', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'numTracksOut', $pb.PbFieldType.O3)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'bytesIn', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'bytesOut', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'packetsIn', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(10, _omitFieldNames ? '' : 'packetsOut', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(11, _omitFieldNames ? '' : 'nackTotal', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(12, _omitFieldNames ? '' : 'bytesInPerSec', $pb.PbFieldType.OF)
    ..a<$core.double>(13, _omitFieldNames ? '' : 'bytesOutPerSec', $pb.PbFieldType.OF)
    ..a<$core.double>(14, _omitFieldNames ? '' : 'packetsInPerSec', $pb.PbFieldType.OF)
    ..a<$core.double>(15, _omitFieldNames ? '' : 'packetsOutPerSec', $pb.PbFieldType.OF)
    ..a<$core.double>(16, _omitFieldNames ? '' : 'nackPerSec', $pb.PbFieldType.OF)
    ..a<$core.int>(17, _omitFieldNames ? '' : 'numCpus', $pb.PbFieldType.OU3)
    ..a<$core.double>(18, _omitFieldNames ? '' : 'loadAvgLast1min', $pb.PbFieldType.OF)
    ..a<$core.double>(19, _omitFieldNames ? '' : 'loadAvgLast5min', $pb.PbFieldType.OF)
    ..a<$core.double>(20, _omitFieldNames ? '' : 'loadAvgLast15min', $pb.PbFieldType.OF)
    ..a<$core.double>(21, _omitFieldNames ? '' : 'cpuLoad', $pb.PbFieldType.OF)
    ..a<$fixnum.Int64>(22, _omitFieldNames ? '' : 'retransmitBytesOut', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(23, _omitFieldNames ? '' : 'retransmitPacketsOut', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(24, _omitFieldNames ? '' : 'retransmitBytesOutPerSec', $pb.PbFieldType.OF)
    ..a<$core.double>(25, _omitFieldNames ? '' : 'retransmitPacketsOutPerSec', $pb.PbFieldType.OF)
    ..a<$fixnum.Int64>(26, _omitFieldNames ? '' : 'participantSignalConnected', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(27, _omitFieldNames ? '' : 'participantSignalConnectedPerSec', $pb.PbFieldType.OF)
    ..a<$core.int>(28, _omitFieldNames ? '' : 'sysPacketsOut', $pb.PbFieldType.OU3)
    ..a<$core.int>(29, _omitFieldNames ? '' : 'sysPacketsDropped', $pb.PbFieldType.OU3)
    ..a<$core.double>(30, _omitFieldNames ? '' : 'sysPacketsOutPerSec', $pb.PbFieldType.OF)
    ..a<$core.double>(31, _omitFieldNames ? '' : 'sysPacketsDroppedPerSec', $pb.PbFieldType.OF)
    ..a<$core.double>(32, _omitFieldNames ? '' : 'sysPacketsDroppedPctPerSec', $pb.PbFieldType.OF)
    ..a<$core.double>(33, _omitFieldNames ? '' : 'memoryLoad', $pb.PbFieldType.OF)
    ..a<$fixnum.Int64>(34, _omitFieldNames ? '' : 'memoryTotal', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(35, _omitFieldNames ? '' : 'memoryUsed', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(36, _omitFieldNames ? '' : 'numTrackPublishAttempts', $pb.PbFieldType.O3)
    ..a<$core.double>(37, _omitFieldNames ? '' : 'trackPublishAttemptsPerSec', $pb.PbFieldType.OF)
    ..a<$core.int>(38, _omitFieldNames ? '' : 'numTrackPublishSuccess', $pb.PbFieldType.O3)
    ..a<$core.double>(39, _omitFieldNames ? '' : 'trackPublishSuccessPerSec', $pb.PbFieldType.OF)
    ..a<$core.int>(40, _omitFieldNames ? '' : 'numTrackSubscribeAttempts', $pb.PbFieldType.O3)
    ..a<$core.double>(41, _omitFieldNames ? '' : 'trackSubscribeAttemptsPerSec', $pb.PbFieldType.OF)
    ..a<$core.int>(42, _omitFieldNames ? '' : 'numTrackSubscribeSuccess', $pb.PbFieldType.O3)
    ..a<$core.double>(43, _omitFieldNames ? '' : 'trackSubscribeSuccessPerSec', $pb.PbFieldType.OF)
    ..a<$fixnum.Int64>(44, _omitFieldNames ? '' : 'participantRtcConnected', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(45, _omitFieldNames ? '' : 'participantRtcConnectedPerSec', $pb.PbFieldType.OF)
    ..a<$fixnum.Int64>(46, _omitFieldNames ? '' : 'participantRtcInit', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(47, _omitFieldNames ? '' : 'participantRtcInitPerSec', $pb.PbFieldType.OF)
    ..a<$core.int>(48, _omitFieldNames ? '' : 'forwardLatency', $pb.PbFieldType.OU3)
    ..a<$core.int>(49, _omitFieldNames ? '' : 'forwardJitter', $pb.PbFieldType.OU3)
    ..pc<NodeStatsRate>(50, _omitFieldNames ? '' : 'rates', $pb.PbFieldType.PM, subBuilder: NodeStatsRate.create)
    ..a<$core.int>(51, _omitFieldNames ? '' : 'numTrackPublishCancels', $pb.PbFieldType.O3)
    ..a<$core.int>(52, _omitFieldNames ? '' : 'numTrackSubscribeCancels', $pb.PbFieldType.O3)
    ..a<$fixnum.Int64>(53, _omitFieldNames ? '' : 'participantRtcCanceled', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NodeStats clone() => NodeStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NodeStats copyWith(void Function(NodeStats) updates) => super.copyWith((message) => updates(message as NodeStats)) as NodeStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeStats create() => NodeStats._();
  NodeStats createEmptyInstance() => create();
  static $pb.PbList<NodeStats> createRepeated() => $pb.PbList<NodeStats>();
  @$core.pragma('dart2js:noInline')
  static NodeStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeStats>(create);
  static NodeStats? _defaultInstance;

  /// when server was started
  @$pb.TagNumber(1)
  $fixnum.Int64 get startedAt => $_getI64(0);
  @$pb.TagNumber(1)
  set startedAt($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStartedAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartedAt() => clearField(1);

  /// when server last reported its status
  @$pb.TagNumber(2)
  $fixnum.Int64 get updatedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set updatedAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpdatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdatedAt() => clearField(2);

  /// room
  @$pb.TagNumber(3)
  $core.int get numRooms => $_getIZ(2);
  @$pb.TagNumber(3)
  set numRooms($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNumRooms() => $_has(2);
  @$pb.TagNumber(3)
  void clearNumRooms() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get numClients => $_getIZ(3);
  @$pb.TagNumber(4)
  set numClients($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNumClients() => $_has(3);
  @$pb.TagNumber(4)
  void clearNumClients() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get numTracksIn => $_getIZ(4);
  @$pb.TagNumber(5)
  set numTracksIn($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNumTracksIn() => $_has(4);
  @$pb.TagNumber(5)
  void clearNumTracksIn() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get numTracksOut => $_getIZ(5);
  @$pb.TagNumber(6)
  set numTracksOut($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNumTracksOut() => $_has(5);
  @$pb.TagNumber(6)
  void clearNumTracksOut() => clearField(6);

  /// packet
  @$pb.TagNumber(7)
  $fixnum.Int64 get bytesIn => $_getI64(6);
  @$pb.TagNumber(7)
  set bytesIn($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBytesIn() => $_has(6);
  @$pb.TagNumber(7)
  void clearBytesIn() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get bytesOut => $_getI64(7);
  @$pb.TagNumber(8)
  set bytesOut($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBytesOut() => $_has(7);
  @$pb.TagNumber(8)
  void clearBytesOut() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get packetsIn => $_getI64(8);
  @$pb.TagNumber(9)
  set packetsIn($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPacketsIn() => $_has(8);
  @$pb.TagNumber(9)
  void clearPacketsIn() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get packetsOut => $_getI64(9);
  @$pb.TagNumber(10)
  set packetsOut($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPacketsOut() => $_has(9);
  @$pb.TagNumber(10)
  void clearPacketsOut() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get nackTotal => $_getI64(10);
  @$pb.TagNumber(11)
  set nackTotal($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasNackTotal() => $_has(10);
  @$pb.TagNumber(11)
  void clearNackTotal() => clearField(11);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  $core.double get bytesInPerSec => $_getN(11);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  set bytesInPerSec($core.double v) { $_setFloat(11, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  $core.bool hasBytesInPerSec() => $_has(11);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  void clearBytesInPerSec() => clearField(12);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  $core.double get bytesOutPerSec => $_getN(12);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  set bytesOutPerSec($core.double v) { $_setFloat(12, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  $core.bool hasBytesOutPerSec() => $_has(12);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  void clearBytesOutPerSec() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get packetsInPerSec => $_getN(13);
  @$pb.TagNumber(14)
  set packetsInPerSec($core.double v) { $_setFloat(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasPacketsInPerSec() => $_has(13);
  @$pb.TagNumber(14)
  void clearPacketsInPerSec() => clearField(14);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(15)
  $core.double get packetsOutPerSec => $_getN(14);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(15)
  set packetsOutPerSec($core.double v) { $_setFloat(14, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(15)
  $core.bool hasPacketsOutPerSec() => $_has(14);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(15)
  void clearPacketsOutPerSec() => clearField(15);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(16)
  $core.double get nackPerSec => $_getN(15);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(16)
  set nackPerSec($core.double v) { $_setFloat(15, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(16)
  $core.bool hasNackPerSec() => $_has(15);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(16)
  void clearNackPerSec() => clearField(16);

  /// system
  @$pb.TagNumber(17)
  $core.int get numCpus => $_getIZ(16);
  @$pb.TagNumber(17)
  set numCpus($core.int v) { $_setUnsignedInt32(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasNumCpus() => $_has(16);
  @$pb.TagNumber(17)
  void clearNumCpus() => clearField(17);

  @$pb.TagNumber(18)
  $core.double get loadAvgLast1min => $_getN(17);
  @$pb.TagNumber(18)
  set loadAvgLast1min($core.double v) { $_setFloat(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasLoadAvgLast1min() => $_has(17);
  @$pb.TagNumber(18)
  void clearLoadAvgLast1min() => clearField(18);

  @$pb.TagNumber(19)
  $core.double get loadAvgLast5min => $_getN(18);
  @$pb.TagNumber(19)
  set loadAvgLast5min($core.double v) { $_setFloat(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasLoadAvgLast5min() => $_has(18);
  @$pb.TagNumber(19)
  void clearLoadAvgLast5min() => clearField(19);

  @$pb.TagNumber(20)
  $core.double get loadAvgLast15min => $_getN(19);
  @$pb.TagNumber(20)
  set loadAvgLast15min($core.double v) { $_setFloat(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasLoadAvgLast15min() => $_has(19);
  @$pb.TagNumber(20)
  void clearLoadAvgLast15min() => clearField(20);

  @$pb.TagNumber(21)
  $core.double get cpuLoad => $_getN(20);
  @$pb.TagNumber(21)
  set cpuLoad($core.double v) { $_setFloat(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasCpuLoad() => $_has(20);
  @$pb.TagNumber(21)
  void clearCpuLoad() => clearField(21);

  /// retransmissions
  @$pb.TagNumber(22)
  $fixnum.Int64 get retransmitBytesOut => $_getI64(21);
  @$pb.TagNumber(22)
  set retransmitBytesOut($fixnum.Int64 v) { $_setInt64(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasRetransmitBytesOut() => $_has(21);
  @$pb.TagNumber(22)
  void clearRetransmitBytesOut() => clearField(22);

  @$pb.TagNumber(23)
  $fixnum.Int64 get retransmitPacketsOut => $_getI64(22);
  @$pb.TagNumber(23)
  set retransmitPacketsOut($fixnum.Int64 v) { $_setInt64(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasRetransmitPacketsOut() => $_has(22);
  @$pb.TagNumber(23)
  void clearRetransmitPacketsOut() => clearField(23);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(24)
  $core.double get retransmitBytesOutPerSec => $_getN(23);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(24)
  set retransmitBytesOutPerSec($core.double v) { $_setFloat(23, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(24)
  $core.bool hasRetransmitBytesOutPerSec() => $_has(23);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(24)
  void clearRetransmitBytesOutPerSec() => clearField(24);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(25)
  $core.double get retransmitPacketsOutPerSec => $_getN(24);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(25)
  set retransmitPacketsOutPerSec($core.double v) { $_setFloat(24, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(25)
  $core.bool hasRetransmitPacketsOutPerSec() => $_has(24);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(25)
  void clearRetransmitPacketsOutPerSec() => clearField(25);

  /// participant joins
  @$pb.TagNumber(26)
  $fixnum.Int64 get participantSignalConnected => $_getI64(25);
  @$pb.TagNumber(26)
  set participantSignalConnected($fixnum.Int64 v) { $_setInt64(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasParticipantSignalConnected() => $_has(25);
  @$pb.TagNumber(26)
  void clearParticipantSignalConnected() => clearField(26);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(27)
  $core.double get participantSignalConnectedPerSec => $_getN(26);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(27)
  set participantSignalConnectedPerSec($core.double v) { $_setFloat(26, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(27)
  $core.bool hasParticipantSignalConnectedPerSec() => $_has(26);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(27)
  void clearParticipantSignalConnectedPerSec() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get sysPacketsOut => $_getIZ(27);
  @$pb.TagNumber(28)
  set sysPacketsOut($core.int v) { $_setUnsignedInt32(27, v); }
  @$pb.TagNumber(28)
  $core.bool hasSysPacketsOut() => $_has(27);
  @$pb.TagNumber(28)
  void clearSysPacketsOut() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get sysPacketsDropped => $_getIZ(28);
  @$pb.TagNumber(29)
  set sysPacketsDropped($core.int v) { $_setUnsignedInt32(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasSysPacketsDropped() => $_has(28);
  @$pb.TagNumber(29)
  void clearSysPacketsDropped() => clearField(29);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(30)
  $core.double get sysPacketsOutPerSec => $_getN(29);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(30)
  set sysPacketsOutPerSec($core.double v) { $_setFloat(29, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(30)
  $core.bool hasSysPacketsOutPerSec() => $_has(29);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(30)
  void clearSysPacketsOutPerSec() => clearField(30);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(31)
  $core.double get sysPacketsDroppedPerSec => $_getN(30);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(31)
  set sysPacketsDroppedPerSec($core.double v) { $_setFloat(30, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(31)
  $core.bool hasSysPacketsDroppedPerSec() => $_has(30);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(31)
  void clearSysPacketsDroppedPerSec() => clearField(31);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(32)
  $core.double get sysPacketsDroppedPctPerSec => $_getN(31);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(32)
  set sysPacketsDroppedPctPerSec($core.double v) { $_setFloat(31, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(32)
  $core.bool hasSysPacketsDroppedPctPerSec() => $_has(31);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(32)
  void clearSysPacketsDroppedPctPerSec() => clearField(32);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(33)
  $core.double get memoryLoad => $_getN(32);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(33)
  set memoryLoad($core.double v) { $_setFloat(32, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(33)
  $core.bool hasMemoryLoad() => $_has(32);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(33)
  void clearMemoryLoad() => clearField(33);

  @$pb.TagNumber(34)
  $fixnum.Int64 get memoryTotal => $_getI64(33);
  @$pb.TagNumber(34)
  set memoryTotal($fixnum.Int64 v) { $_setInt64(33, v); }
  @$pb.TagNumber(34)
  $core.bool hasMemoryTotal() => $_has(33);
  @$pb.TagNumber(34)
  void clearMemoryTotal() => clearField(34);

  @$pb.TagNumber(35)
  $fixnum.Int64 get memoryUsed => $_getI64(34);
  @$pb.TagNumber(35)
  set memoryUsed($fixnum.Int64 v) { $_setInt64(34, v); }
  @$pb.TagNumber(35)
  $core.bool hasMemoryUsed() => $_has(34);
  @$pb.TagNumber(35)
  void clearMemoryUsed() => clearField(35);

  @$pb.TagNumber(36)
  $core.int get numTrackPublishAttempts => $_getIZ(35);
  @$pb.TagNumber(36)
  set numTrackPublishAttempts($core.int v) { $_setSignedInt32(35, v); }
  @$pb.TagNumber(36)
  $core.bool hasNumTrackPublishAttempts() => $_has(35);
  @$pb.TagNumber(36)
  void clearNumTrackPublishAttempts() => clearField(36);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(37)
  $core.double get trackPublishAttemptsPerSec => $_getN(36);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(37)
  set trackPublishAttemptsPerSec($core.double v) { $_setFloat(36, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(37)
  $core.bool hasTrackPublishAttemptsPerSec() => $_has(36);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(37)
  void clearTrackPublishAttemptsPerSec() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get numTrackPublishSuccess => $_getIZ(37);
  @$pb.TagNumber(38)
  set numTrackPublishSuccess($core.int v) { $_setSignedInt32(37, v); }
  @$pb.TagNumber(38)
  $core.bool hasNumTrackPublishSuccess() => $_has(37);
  @$pb.TagNumber(38)
  void clearNumTrackPublishSuccess() => clearField(38);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(39)
  $core.double get trackPublishSuccessPerSec => $_getN(38);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(39)
  set trackPublishSuccessPerSec($core.double v) { $_setFloat(38, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(39)
  $core.bool hasTrackPublishSuccessPerSec() => $_has(38);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(39)
  void clearTrackPublishSuccessPerSec() => clearField(39);

  @$pb.TagNumber(40)
  $core.int get numTrackSubscribeAttempts => $_getIZ(39);
  @$pb.TagNumber(40)
  set numTrackSubscribeAttempts($core.int v) { $_setSignedInt32(39, v); }
  @$pb.TagNumber(40)
  $core.bool hasNumTrackSubscribeAttempts() => $_has(39);
  @$pb.TagNumber(40)
  void clearNumTrackSubscribeAttempts() => clearField(40);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(41)
  $core.double get trackSubscribeAttemptsPerSec => $_getN(40);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(41)
  set trackSubscribeAttemptsPerSec($core.double v) { $_setFloat(40, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(41)
  $core.bool hasTrackSubscribeAttemptsPerSec() => $_has(40);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(41)
  void clearTrackSubscribeAttemptsPerSec() => clearField(41);

  @$pb.TagNumber(42)
  $core.int get numTrackSubscribeSuccess => $_getIZ(41);
  @$pb.TagNumber(42)
  set numTrackSubscribeSuccess($core.int v) { $_setSignedInt32(41, v); }
  @$pb.TagNumber(42)
  $core.bool hasNumTrackSubscribeSuccess() => $_has(41);
  @$pb.TagNumber(42)
  void clearNumTrackSubscribeSuccess() => clearField(42);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(43)
  $core.double get trackSubscribeSuccessPerSec => $_getN(42);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(43)
  set trackSubscribeSuccessPerSec($core.double v) { $_setFloat(42, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(43)
  $core.bool hasTrackSubscribeSuccessPerSec() => $_has(42);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(43)
  void clearTrackSubscribeSuccessPerSec() => clearField(43);

  @$pb.TagNumber(44)
  $fixnum.Int64 get participantRtcConnected => $_getI64(43);
  @$pb.TagNumber(44)
  set participantRtcConnected($fixnum.Int64 v) { $_setInt64(43, v); }
  @$pb.TagNumber(44)
  $core.bool hasParticipantRtcConnected() => $_has(43);
  @$pb.TagNumber(44)
  void clearParticipantRtcConnected() => clearField(44);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(45)
  $core.double get participantRtcConnectedPerSec => $_getN(44);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(45)
  set participantRtcConnectedPerSec($core.double v) { $_setFloat(44, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(45)
  $core.bool hasParticipantRtcConnectedPerSec() => $_has(44);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(45)
  void clearParticipantRtcConnectedPerSec() => clearField(45);

  @$pb.TagNumber(46)
  $fixnum.Int64 get participantRtcInit => $_getI64(45);
  @$pb.TagNumber(46)
  set participantRtcInit($fixnum.Int64 v) { $_setInt64(45, v); }
  @$pb.TagNumber(46)
  $core.bool hasParticipantRtcInit() => $_has(45);
  @$pb.TagNumber(46)
  void clearParticipantRtcInit() => clearField(46);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(47)
  $core.double get participantRtcInitPerSec => $_getN(46);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(47)
  set participantRtcInitPerSec($core.double v) { $_setFloat(46, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(47)
  $core.bool hasParticipantRtcInitPerSec() => $_has(46);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(47)
  void clearParticipantRtcInitPerSec() => clearField(47);

  /// forward metrics
  @$pb.TagNumber(48)
  $core.int get forwardLatency => $_getIZ(47);
  @$pb.TagNumber(48)
  set forwardLatency($core.int v) { $_setUnsignedInt32(47, v); }
  @$pb.TagNumber(48)
  $core.bool hasForwardLatency() => $_has(47);
  @$pb.TagNumber(48)
  void clearForwardLatency() => clearField(48);

  @$pb.TagNumber(49)
  $core.int get forwardJitter => $_getIZ(48);
  @$pb.TagNumber(49)
  set forwardJitter($core.int v) { $_setUnsignedInt32(48, v); }
  @$pb.TagNumber(49)
  $core.bool hasForwardJitter() => $_has(48);
  @$pb.TagNumber(49)
  void clearForwardJitter() => clearField(49);

  @$pb.TagNumber(50)
  $core.List<NodeStatsRate> get rates => $_getList(49);

  @$pb.TagNumber(51)
  $core.int get numTrackPublishCancels => $_getIZ(50);
  @$pb.TagNumber(51)
  set numTrackPublishCancels($core.int v) { $_setSignedInt32(50, v); }
  @$pb.TagNumber(51)
  $core.bool hasNumTrackPublishCancels() => $_has(50);
  @$pb.TagNumber(51)
  void clearNumTrackPublishCancels() => clearField(51);

  @$pb.TagNumber(52)
  $core.int get numTrackSubscribeCancels => $_getIZ(51);
  @$pb.TagNumber(52)
  set numTrackSubscribeCancels($core.int v) { $_setSignedInt32(51, v); }
  @$pb.TagNumber(52)
  $core.bool hasNumTrackSubscribeCancels() => $_has(51);
  @$pb.TagNumber(52)
  void clearNumTrackSubscribeCancels() => clearField(52);

  @$pb.TagNumber(53)
  $fixnum.Int64 get participantRtcCanceled => $_getI64(52);
  @$pb.TagNumber(53)
  set participantRtcCanceled($fixnum.Int64 v) { $_setInt64(52, v); }
  @$pb.TagNumber(53)
  $core.bool hasParticipantRtcCanceled() => $_has(52);
  @$pb.TagNumber(53)
  void clearParticipantRtcCanceled() => clearField(53);
}

/// rates of different node stats (per second)
class NodeStatsRate extends $pb.GeneratedMessage {
  factory NodeStatsRate({
    $fixnum.Int64? startedAt,
    $fixnum.Int64? endedAt,
    $fixnum.Int64? duration,
    $core.double? trackPublishAttempts,
    $core.double? trackPublishSuccess,
    $core.double? trackSubscribeAttempts,
    $core.double? trackSubscribeSuccess,
    $core.double? bytesIn,
    $core.double? bytesOut,
    $core.double? packetsIn,
    $core.double? packetsOut,
    $core.double? nackTotal,
    $core.double? sysPacketsOut,
    $core.double? sysPacketsDropped,
    $core.double? retransmitBytesOut,
    $core.double? retransmitPacketsOut,
    $core.double? participantSignalConnected,
    $core.double? participantRtcConnected,
    $core.double? participantRtcInit,
    $core.double? cpuLoad,
    $core.double? memoryLoad,
    $core.double? memoryUsed,
    $core.double? memoryTotal,
    $core.double? trackPublishCancels,
    $core.double? trackSubscribeCancels,
    $core.double? participantRtcCanceled,
  }) {
    final $result = create();
    if (startedAt != null) {
      $result.startedAt = startedAt;
    }
    if (endedAt != null) {
      $result.endedAt = endedAt;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (trackPublishAttempts != null) {
      $result.trackPublishAttempts = trackPublishAttempts;
    }
    if (trackPublishSuccess != null) {
      $result.trackPublishSuccess = trackPublishSuccess;
    }
    if (trackSubscribeAttempts != null) {
      $result.trackSubscribeAttempts = trackSubscribeAttempts;
    }
    if (trackSubscribeSuccess != null) {
      $result.trackSubscribeSuccess = trackSubscribeSuccess;
    }
    if (bytesIn != null) {
      $result.bytesIn = bytesIn;
    }
    if (bytesOut != null) {
      $result.bytesOut = bytesOut;
    }
    if (packetsIn != null) {
      $result.packetsIn = packetsIn;
    }
    if (packetsOut != null) {
      $result.packetsOut = packetsOut;
    }
    if (nackTotal != null) {
      $result.nackTotal = nackTotal;
    }
    if (sysPacketsOut != null) {
      $result.sysPacketsOut = sysPacketsOut;
    }
    if (sysPacketsDropped != null) {
      $result.sysPacketsDropped = sysPacketsDropped;
    }
    if (retransmitBytesOut != null) {
      $result.retransmitBytesOut = retransmitBytesOut;
    }
    if (retransmitPacketsOut != null) {
      $result.retransmitPacketsOut = retransmitPacketsOut;
    }
    if (participantSignalConnected != null) {
      $result.participantSignalConnected = participantSignalConnected;
    }
    if (participantRtcConnected != null) {
      $result.participantRtcConnected = participantRtcConnected;
    }
    if (participantRtcInit != null) {
      $result.participantRtcInit = participantRtcInit;
    }
    if (cpuLoad != null) {
      $result.cpuLoad = cpuLoad;
    }
    if (memoryLoad != null) {
      $result.memoryLoad = memoryLoad;
    }
    if (memoryUsed != null) {
      $result.memoryUsed = memoryUsed;
    }
    if (memoryTotal != null) {
      $result.memoryTotal = memoryTotal;
    }
    if (trackPublishCancels != null) {
      $result.trackPublishCancels = trackPublishCancels;
    }
    if (trackSubscribeCancels != null) {
      $result.trackSubscribeCancels = trackSubscribeCancels;
    }
    if (participantRtcCanceled != null) {
      $result.participantRtcCanceled = participantRtcCanceled;
    }
    return $result;
  }
  NodeStatsRate._() : super();
  factory NodeStatsRate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeStatsRate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NodeStatsRate', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(2, _omitFieldNames ? '' : 'endedAt')
    ..aInt64(3, _omitFieldNames ? '' : 'duration')
    ..a<$core.double>(4, _omitFieldNames ? '' : 'trackPublishAttempts', $pb.PbFieldType.OF)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'trackPublishSuccess', $pb.PbFieldType.OF)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'trackSubscribeAttempts', $pb.PbFieldType.OF)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'trackSubscribeSuccess', $pb.PbFieldType.OF)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'bytesIn', $pb.PbFieldType.OF)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'bytesOut', $pb.PbFieldType.OF)
    ..a<$core.double>(10, _omitFieldNames ? '' : 'packetsIn', $pb.PbFieldType.OF)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'packetsOut', $pb.PbFieldType.OF)
    ..a<$core.double>(12, _omitFieldNames ? '' : 'nackTotal', $pb.PbFieldType.OF)
    ..a<$core.double>(13, _omitFieldNames ? '' : 'sysPacketsOut', $pb.PbFieldType.OF)
    ..a<$core.double>(14, _omitFieldNames ? '' : 'sysPacketsDropped', $pb.PbFieldType.OF)
    ..a<$core.double>(15, _omitFieldNames ? '' : 'retransmitBytesOut', $pb.PbFieldType.OF)
    ..a<$core.double>(16, _omitFieldNames ? '' : 'retransmitPacketsOut', $pb.PbFieldType.OF)
    ..a<$core.double>(17, _omitFieldNames ? '' : 'participantSignalConnected', $pb.PbFieldType.OF)
    ..a<$core.double>(18, _omitFieldNames ? '' : 'participantRtcConnected', $pb.PbFieldType.OF)
    ..a<$core.double>(19, _omitFieldNames ? '' : 'participantRtcInit', $pb.PbFieldType.OF)
    ..a<$core.double>(20, _omitFieldNames ? '' : 'cpuLoad', $pb.PbFieldType.OF)
    ..a<$core.double>(21, _omitFieldNames ? '' : 'memoryLoad', $pb.PbFieldType.OF)
    ..a<$core.double>(22, _omitFieldNames ? '' : 'memoryUsed', $pb.PbFieldType.OF)
    ..a<$core.double>(23, _omitFieldNames ? '' : 'memoryTotal', $pb.PbFieldType.OF)
    ..a<$core.double>(24, _omitFieldNames ? '' : 'trackPublishCancels', $pb.PbFieldType.OF)
    ..a<$core.double>(25, _omitFieldNames ? '' : 'trackSubscribeCancels', $pb.PbFieldType.OF)
    ..a<$core.double>(26, _omitFieldNames ? '' : 'participantRtcCanceled', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NodeStatsRate clone() => NodeStatsRate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NodeStatsRate copyWith(void Function(NodeStatsRate) updates) => super.copyWith((message) => updates(message as NodeStatsRate)) as NodeStatsRate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeStatsRate create() => NodeStatsRate._();
  NodeStatsRate createEmptyInstance() => create();
  static $pb.PbList<NodeStatsRate> createRepeated() => $pb.PbList<NodeStatsRate>();
  @$core.pragma('dart2js:noInline')
  static NodeStatsRate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeStatsRate>(create);
  static NodeStatsRate? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get startedAt => $_getI64(0);
  @$pb.TagNumber(1)
  set startedAt($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStartedAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartedAt() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set endedAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndedAt() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get duration => $_getI64(2);
  @$pb.TagNumber(3)
  set duration($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get trackPublishAttempts => $_getN(3);
  @$pb.TagNumber(4)
  set trackPublishAttempts($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTrackPublishAttempts() => $_has(3);
  @$pb.TagNumber(4)
  void clearTrackPublishAttempts() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get trackPublishSuccess => $_getN(4);
  @$pb.TagNumber(5)
  set trackPublishSuccess($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTrackPublishSuccess() => $_has(4);
  @$pb.TagNumber(5)
  void clearTrackPublishSuccess() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get trackSubscribeAttempts => $_getN(5);
  @$pb.TagNumber(6)
  set trackSubscribeAttempts($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTrackSubscribeAttempts() => $_has(5);
  @$pb.TagNumber(6)
  void clearTrackSubscribeAttempts() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get trackSubscribeSuccess => $_getN(6);
  @$pb.TagNumber(7)
  set trackSubscribeSuccess($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTrackSubscribeSuccess() => $_has(6);
  @$pb.TagNumber(7)
  void clearTrackSubscribeSuccess() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get bytesIn => $_getN(7);
  @$pb.TagNumber(8)
  set bytesIn($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBytesIn() => $_has(7);
  @$pb.TagNumber(8)
  void clearBytesIn() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get bytesOut => $_getN(8);
  @$pb.TagNumber(9)
  set bytesOut($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBytesOut() => $_has(8);
  @$pb.TagNumber(9)
  void clearBytesOut() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get packetsIn => $_getN(9);
  @$pb.TagNumber(10)
  set packetsIn($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPacketsIn() => $_has(9);
  @$pb.TagNumber(10)
  void clearPacketsIn() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get packetsOut => $_getN(10);
  @$pb.TagNumber(11)
  set packetsOut($core.double v) { $_setFloat(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasPacketsOut() => $_has(10);
  @$pb.TagNumber(11)
  void clearPacketsOut() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get nackTotal => $_getN(11);
  @$pb.TagNumber(12)
  set nackTotal($core.double v) { $_setFloat(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasNackTotal() => $_has(11);
  @$pb.TagNumber(12)
  void clearNackTotal() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get sysPacketsOut => $_getN(12);
  @$pb.TagNumber(13)
  set sysPacketsOut($core.double v) { $_setFloat(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSysPacketsOut() => $_has(12);
  @$pb.TagNumber(13)
  void clearSysPacketsOut() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get sysPacketsDropped => $_getN(13);
  @$pb.TagNumber(14)
  set sysPacketsDropped($core.double v) { $_setFloat(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasSysPacketsDropped() => $_has(13);
  @$pb.TagNumber(14)
  void clearSysPacketsDropped() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get retransmitBytesOut => $_getN(14);
  @$pb.TagNumber(15)
  set retransmitBytesOut($core.double v) { $_setFloat(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasRetransmitBytesOut() => $_has(14);
  @$pb.TagNumber(15)
  void clearRetransmitBytesOut() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get retransmitPacketsOut => $_getN(15);
  @$pb.TagNumber(16)
  set retransmitPacketsOut($core.double v) { $_setFloat(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasRetransmitPacketsOut() => $_has(15);
  @$pb.TagNumber(16)
  void clearRetransmitPacketsOut() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get participantSignalConnected => $_getN(16);
  @$pb.TagNumber(17)
  set participantSignalConnected($core.double v) { $_setFloat(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasParticipantSignalConnected() => $_has(16);
  @$pb.TagNumber(17)
  void clearParticipantSignalConnected() => clearField(17);

  @$pb.TagNumber(18)
  $core.double get participantRtcConnected => $_getN(17);
  @$pb.TagNumber(18)
  set participantRtcConnected($core.double v) { $_setFloat(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasParticipantRtcConnected() => $_has(17);
  @$pb.TagNumber(18)
  void clearParticipantRtcConnected() => clearField(18);

  @$pb.TagNumber(19)
  $core.double get participantRtcInit => $_getN(18);
  @$pb.TagNumber(19)
  set participantRtcInit($core.double v) { $_setFloat(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasParticipantRtcInit() => $_has(18);
  @$pb.TagNumber(19)
  void clearParticipantRtcInit() => clearField(19);

  /// time weighted averages across stats windows forming part of a rate measurement interval
  @$pb.TagNumber(20)
  $core.double get cpuLoad => $_getN(19);
  @$pb.TagNumber(20)
  set cpuLoad($core.double v) { $_setFloat(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasCpuLoad() => $_has(19);
  @$pb.TagNumber(20)
  void clearCpuLoad() => clearField(20);

  @$pb.TagNumber(21)
  $core.double get memoryLoad => $_getN(20);
  @$pb.TagNumber(21)
  set memoryLoad($core.double v) { $_setFloat(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasMemoryLoad() => $_has(20);
  @$pb.TagNumber(21)
  void clearMemoryLoad() => clearField(21);

  @$pb.TagNumber(22)
  $core.double get memoryUsed => $_getN(21);
  @$pb.TagNumber(22)
  set memoryUsed($core.double v) { $_setFloat(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasMemoryUsed() => $_has(21);
  @$pb.TagNumber(22)
  void clearMemoryUsed() => clearField(22);

  @$pb.TagNumber(23)
  $core.double get memoryTotal => $_getN(22);
  @$pb.TagNumber(23)
  set memoryTotal($core.double v) { $_setFloat(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasMemoryTotal() => $_has(22);
  @$pb.TagNumber(23)
  void clearMemoryTotal() => clearField(23);

  @$pb.TagNumber(24)
  $core.double get trackPublishCancels => $_getN(23);
  @$pb.TagNumber(24)
  set trackPublishCancels($core.double v) { $_setFloat(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasTrackPublishCancels() => $_has(23);
  @$pb.TagNumber(24)
  void clearTrackPublishCancels() => clearField(24);

  @$pb.TagNumber(25)
  $core.double get trackSubscribeCancels => $_getN(24);
  @$pb.TagNumber(25)
  set trackSubscribeCancels($core.double v) { $_setFloat(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasTrackSubscribeCancels() => $_has(24);
  @$pb.TagNumber(25)
  void clearTrackSubscribeCancels() => clearField(25);

  @$pb.TagNumber(26)
  $core.double get participantRtcCanceled => $_getN(25);
  @$pb.TagNumber(26)
  set participantRtcCanceled($core.double v) { $_setFloat(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasParticipantRtcCanceled() => $_has(25);
  @$pb.TagNumber(26)
  void clearParticipantRtcCanceled() => clearField(26);
}

class StartSession extends $pb.GeneratedMessage {
  factory StartSession({
    $core.String? roomName,
    $core.String? identity,
    $core.String? connectionId,
    $core.bool? reconnect,
    $core.bool? autoSubscribe,
  @$core.Deprecated('This field is deprecated.')
    $core.bool? hidden,
    $2.ClientInfo? client,
  @$core.Deprecated('This field is deprecated.')
    $core.bool? recorder,
    $core.String? name,
    $core.String? grantsJson,
    $core.bool? adaptiveStream,
    $core.String? participantId,
    $2.ReconnectReason? reconnectReason,
    $core.bool? subscriberAllowPause,
    $core.bool? disableIceLite,
    $9.CreateRoomRequest? createRoom,
    $core.Iterable<$14.AddTrackRequest>? addTrackRequests,
    $14.SessionDescription? publisherOffer,
    $14.SyncState? syncState,
    $core.bool? useSinglePeerConnection,
  }) {
    final $result = create();
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (identity != null) {
      $result.identity = identity;
    }
    if (connectionId != null) {
      $result.connectionId = connectionId;
    }
    if (reconnect != null) {
      $result.reconnect = reconnect;
    }
    if (autoSubscribe != null) {
      $result.autoSubscribe = autoSubscribe;
    }
    if (hidden != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.hidden = hidden;
    }
    if (client != null) {
      $result.client = client;
    }
    if (recorder != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.recorder = recorder;
    }
    if (name != null) {
      $result.name = name;
    }
    if (grantsJson != null) {
      $result.grantsJson = grantsJson;
    }
    if (adaptiveStream != null) {
      $result.adaptiveStream = adaptiveStream;
    }
    if (participantId != null) {
      $result.participantId = participantId;
    }
    if (reconnectReason != null) {
      $result.reconnectReason = reconnectReason;
    }
    if (subscriberAllowPause != null) {
      $result.subscriberAllowPause = subscriberAllowPause;
    }
    if (disableIceLite != null) {
      $result.disableIceLite = disableIceLite;
    }
    if (createRoom != null) {
      $result.createRoom = createRoom;
    }
    if (addTrackRequests != null) {
      $result.addTrackRequests.addAll(addTrackRequests);
    }
    if (publisherOffer != null) {
      $result.publisherOffer = publisherOffer;
    }
    if (syncState != null) {
      $result.syncState = syncState;
    }
    if (useSinglePeerConnection != null) {
      $result.useSinglePeerConnection = useSinglePeerConnection;
    }
    return $result;
  }
  StartSession._() : super();
  factory StartSession.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartSession.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StartSession', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOS(2, _omitFieldNames ? '' : 'identity')
    ..aOS(3, _omitFieldNames ? '' : 'connectionId')
    ..aOB(4, _omitFieldNames ? '' : 'reconnect')
    ..aOB(9, _omitFieldNames ? '' : 'autoSubscribe')
    ..aOB(10, _omitFieldNames ? '' : 'hidden')
    ..aOM<$2.ClientInfo>(11, _omitFieldNames ? '' : 'client', subBuilder: $2.ClientInfo.create)
    ..aOB(12, _omitFieldNames ? '' : 'recorder')
    ..aOS(13, _omitFieldNames ? '' : 'name')
    ..aOS(14, _omitFieldNames ? '' : 'grantsJson')
    ..aOB(15, _omitFieldNames ? '' : 'adaptiveStream')
    ..aOS(16, _omitFieldNames ? '' : 'participantId')
    ..e<$2.ReconnectReason>(17, _omitFieldNames ? '' : 'reconnectReason', $pb.PbFieldType.OE, defaultOrMaker: $2.ReconnectReason.RR_UNKNOWN, valueOf: $2.ReconnectReason.valueOf, enumValues: $2.ReconnectReason.values)
    ..aOB(18, _omitFieldNames ? '' : 'subscriberAllowPause')
    ..aOB(19, _omitFieldNames ? '' : 'disableIceLite')
    ..aOM<$9.CreateRoomRequest>(20, _omitFieldNames ? '' : 'createRoom', subBuilder: $9.CreateRoomRequest.create)
    ..pc<$14.AddTrackRequest>(21, _omitFieldNames ? '' : 'addTrackRequests', $pb.PbFieldType.PM, subBuilder: $14.AddTrackRequest.create)
    ..aOM<$14.SessionDescription>(22, _omitFieldNames ? '' : 'publisherOffer', subBuilder: $14.SessionDescription.create)
    ..aOM<$14.SyncState>(23, _omitFieldNames ? '' : 'syncState', subBuilder: $14.SyncState.create)
    ..aOB(24, _omitFieldNames ? '' : 'useSinglePeerConnection')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartSession clone() => StartSession()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartSession copyWith(void Function(StartSession) updates) => super.copyWith((message) => updates(message as StartSession)) as StartSession;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartSession create() => StartSession._();
  StartSession createEmptyInstance() => create();
  static $pb.PbList<StartSession> createRepeated() => $pb.PbList<StartSession>();
  @$core.pragma('dart2js:noInline')
  static StartSession getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartSession>(create);
  static StartSession? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get identity => $_getSZ(1);
  @$pb.TagNumber(2)
  set identity($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentity() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get connectionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set connectionId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasConnectionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearConnectionId() => clearField(3);

  /// if a client is reconnecting (i.e. resume instead of restart)
  @$pb.TagNumber(4)
  $core.bool get reconnect => $_getBF(3);
  @$pb.TagNumber(4)
  set reconnect($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReconnect() => $_has(3);
  @$pb.TagNumber(4)
  void clearReconnect() => clearField(4);

  @$pb.TagNumber(9)
  $core.bool get autoSubscribe => $_getBF(4);
  @$pb.TagNumber(9)
  set autoSubscribe($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(9)
  $core.bool hasAutoSubscribe() => $_has(4);
  @$pb.TagNumber(9)
  void clearAutoSubscribe() => clearField(9);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  $core.bool get hidden => $_getBF(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  set hidden($core.bool v) { $_setBool(5, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  $core.bool hasHidden() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  void clearHidden() => clearField(10);

  @$pb.TagNumber(11)
  $2.ClientInfo get client => $_getN(6);
  @$pb.TagNumber(11)
  set client($2.ClientInfo v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasClient() => $_has(6);
  @$pb.TagNumber(11)
  void clearClient() => clearField(11);
  @$pb.TagNumber(11)
  $2.ClientInfo ensureClient() => $_ensure(6);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  $core.bool get recorder => $_getBF(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  set recorder($core.bool v) { $_setBool(7, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  $core.bool hasRecorder() => $_has(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  void clearRecorder() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get name => $_getSZ(8);
  @$pb.TagNumber(13)
  set name($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(13)
  $core.bool hasName() => $_has(8);
  @$pb.TagNumber(13)
  void clearName() => clearField(13);

  /// A user's ClaimGrants serialized in JSON
  @$pb.TagNumber(14)
  $core.String get grantsJson => $_getSZ(9);
  @$pb.TagNumber(14)
  set grantsJson($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(14)
  $core.bool hasGrantsJson() => $_has(9);
  @$pb.TagNumber(14)
  void clearGrantsJson() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get adaptiveStream => $_getBF(10);
  @$pb.TagNumber(15)
  set adaptiveStream($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(15)
  $core.bool hasAdaptiveStream() => $_has(10);
  @$pb.TagNumber(15)
  void clearAdaptiveStream() => clearField(15);

  /// if reconnect, client will set current sid
  @$pb.TagNumber(16)
  $core.String get participantId => $_getSZ(11);
  @$pb.TagNumber(16)
  set participantId($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(16)
  $core.bool hasParticipantId() => $_has(11);
  @$pb.TagNumber(16)
  void clearParticipantId() => clearField(16);

  @$pb.TagNumber(17)
  $2.ReconnectReason get reconnectReason => $_getN(12);
  @$pb.TagNumber(17)
  set reconnectReason($2.ReconnectReason v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasReconnectReason() => $_has(12);
  @$pb.TagNumber(17)
  void clearReconnectReason() => clearField(17);

  @$pb.TagNumber(18)
  $core.bool get subscriberAllowPause => $_getBF(13);
  @$pb.TagNumber(18)
  set subscriberAllowPause($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(18)
  $core.bool hasSubscriberAllowPause() => $_has(13);
  @$pb.TagNumber(18)
  void clearSubscriberAllowPause() => clearField(18);

  @$pb.TagNumber(19)
  $core.bool get disableIceLite => $_getBF(14);
  @$pb.TagNumber(19)
  set disableIceLite($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(19)
  $core.bool hasDisableIceLite() => $_has(14);
  @$pb.TagNumber(19)
  void clearDisableIceLite() => clearField(19);

  @$pb.TagNumber(20)
  $9.CreateRoomRequest get createRoom => $_getN(15);
  @$pb.TagNumber(20)
  set createRoom($9.CreateRoomRequest v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasCreateRoom() => $_has(15);
  @$pb.TagNumber(20)
  void clearCreateRoom() => clearField(20);
  @$pb.TagNumber(20)
  $9.CreateRoomRequest ensureCreateRoom() => $_ensure(15);

  @$pb.TagNumber(21)
  $core.List<$14.AddTrackRequest> get addTrackRequests => $_getList(16);

  @$pb.TagNumber(22)
  $14.SessionDescription get publisherOffer => $_getN(17);
  @$pb.TagNumber(22)
  set publisherOffer($14.SessionDescription v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasPublisherOffer() => $_has(17);
  @$pb.TagNumber(22)
  void clearPublisherOffer() => clearField(22);
  @$pb.TagNumber(22)
  $14.SessionDescription ensurePublisherOffer() => $_ensure(17);

  @$pb.TagNumber(23)
  $14.SyncState get syncState => $_getN(18);
  @$pb.TagNumber(23)
  set syncState($14.SyncState v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasSyncState() => $_has(18);
  @$pb.TagNumber(23)
  void clearSyncState() => clearField(23);
  @$pb.TagNumber(23)
  $14.SyncState ensureSyncState() => $_ensure(18);

  @$pb.TagNumber(24)
  $core.bool get useSinglePeerConnection => $_getBF(19);
  @$pb.TagNumber(24)
  set useSinglePeerConnection($core.bool v) { $_setBool(19, v); }
  @$pb.TagNumber(24)
  $core.bool hasUseSinglePeerConnection() => $_has(19);
  @$pb.TagNumber(24)
  void clearUseSinglePeerConnection() => clearField(24);
}

/// room info that should not be returned to clients
class RoomInternal extends $pb.GeneratedMessage {
  factory RoomInternal({
    $7.AutoTrackEgress? trackEgress,
    $7.AutoParticipantEgress? participantEgress,
    $2.PlayoutDelay? playoutDelay,
    $core.bool? syncStreams,
    $core.Iterable<$6.RoomAgentDispatch>? agentDispatches,
    $core.bool? replayEnabled,
  }) {
    final $result = create();
    if (trackEgress != null) {
      $result.trackEgress = trackEgress;
    }
    if (participantEgress != null) {
      $result.participantEgress = participantEgress;
    }
    if (playoutDelay != null) {
      $result.playoutDelay = playoutDelay;
    }
    if (syncStreams != null) {
      $result.syncStreams = syncStreams;
    }
    if (agentDispatches != null) {
      $result.agentDispatches.addAll(agentDispatches);
    }
    if (replayEnabled != null) {
      $result.replayEnabled = replayEnabled;
    }
    return $result;
  }
  RoomInternal._() : super();
  factory RoomInternal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomInternal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomInternal', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<$7.AutoTrackEgress>(1, _omitFieldNames ? '' : 'trackEgress', subBuilder: $7.AutoTrackEgress.create)
    ..aOM<$7.AutoParticipantEgress>(2, _omitFieldNames ? '' : 'participantEgress', subBuilder: $7.AutoParticipantEgress.create)
    ..aOM<$2.PlayoutDelay>(3, _omitFieldNames ? '' : 'playoutDelay', subBuilder: $2.PlayoutDelay.create)
    ..aOB(4, _omitFieldNames ? '' : 'syncStreams')
    ..pc<$6.RoomAgentDispatch>(5, _omitFieldNames ? '' : 'agentDispatches', $pb.PbFieldType.PM, subBuilder: $6.RoomAgentDispatch.create)
    ..aOB(6, _omitFieldNames ? '' : 'replayEnabled')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomInternal clone() => RoomInternal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomInternal copyWith(void Function(RoomInternal) updates) => super.copyWith((message) => updates(message as RoomInternal)) as RoomInternal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomInternal create() => RoomInternal._();
  RoomInternal createEmptyInstance() => create();
  static $pb.PbList<RoomInternal> createRepeated() => $pb.PbList<RoomInternal>();
  @$core.pragma('dart2js:noInline')
  static RoomInternal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomInternal>(create);
  static RoomInternal? _defaultInstance;

  @$pb.TagNumber(1)
  $7.AutoTrackEgress get trackEgress => $_getN(0);
  @$pb.TagNumber(1)
  set trackEgress($7.AutoTrackEgress v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrackEgress() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrackEgress() => clearField(1);
  @$pb.TagNumber(1)
  $7.AutoTrackEgress ensureTrackEgress() => $_ensure(0);

  @$pb.TagNumber(2)
  $7.AutoParticipantEgress get participantEgress => $_getN(1);
  @$pb.TagNumber(2)
  set participantEgress($7.AutoParticipantEgress v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasParticipantEgress() => $_has(1);
  @$pb.TagNumber(2)
  void clearParticipantEgress() => clearField(2);
  @$pb.TagNumber(2)
  $7.AutoParticipantEgress ensureParticipantEgress() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.PlayoutDelay get playoutDelay => $_getN(2);
  @$pb.TagNumber(3)
  set playoutDelay($2.PlayoutDelay v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlayoutDelay() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayoutDelay() => clearField(3);
  @$pb.TagNumber(3)
  $2.PlayoutDelay ensurePlayoutDelay() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get syncStreams => $_getBF(3);
  @$pb.TagNumber(4)
  set syncStreams($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSyncStreams() => $_has(3);
  @$pb.TagNumber(4)
  void clearSyncStreams() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$6.RoomAgentDispatch> get agentDispatches => $_getList(4);

  @$pb.TagNumber(6)
  $core.bool get replayEnabled => $_getBF(5);
  @$pb.TagNumber(6)
  set replayEnabled($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasReplayEnabled() => $_has(5);
  @$pb.TagNumber(6)
  void clearReplayEnabled() => clearField(6);
}

class ICEConfig extends $pb.GeneratedMessage {
  factory ICEConfig({
    ICECandidateType? preferenceSubscriber,
    ICECandidateType? preferencePublisher,
  }) {
    final $result = create();
    if (preferenceSubscriber != null) {
      $result.preferenceSubscriber = preferenceSubscriber;
    }
    if (preferencePublisher != null) {
      $result.preferencePublisher = preferencePublisher;
    }
    return $result;
  }
  ICEConfig._() : super();
  factory ICEConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ICEConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ICEConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..e<ICECandidateType>(1, _omitFieldNames ? '' : 'preferenceSubscriber', $pb.PbFieldType.OE, defaultOrMaker: ICECandidateType.ICT_NONE, valueOf: ICECandidateType.valueOf, enumValues: ICECandidateType.values)
    ..e<ICECandidateType>(2, _omitFieldNames ? '' : 'preferencePublisher', $pb.PbFieldType.OE, defaultOrMaker: ICECandidateType.ICT_NONE, valueOf: ICECandidateType.valueOf, enumValues: ICECandidateType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ICEConfig clone() => ICEConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ICEConfig copyWith(void Function(ICEConfig) updates) => super.copyWith((message) => updates(message as ICEConfig)) as ICEConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ICEConfig create() => ICEConfig._();
  ICEConfig createEmptyInstance() => create();
  static $pb.PbList<ICEConfig> createRepeated() => $pb.PbList<ICEConfig>();
  @$core.pragma('dart2js:noInline')
  static ICEConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ICEConfig>(create);
  static ICEConfig? _defaultInstance;

  @$pb.TagNumber(1)
  ICECandidateType get preferenceSubscriber => $_getN(0);
  @$pb.TagNumber(1)
  set preferenceSubscriber(ICECandidateType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPreferenceSubscriber() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreferenceSubscriber() => clearField(1);

  @$pb.TagNumber(2)
  ICECandidateType get preferencePublisher => $_getN(1);
  @$pb.TagNumber(2)
  set preferencePublisher(ICECandidateType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPreferencePublisher() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreferencePublisher() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
