// This is a generated file - do not edit.
//
// Generated from livekit_internal.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_agent_dispatch.pb.dart' as $4;
import 'livekit_egress.pb.dart' as $3;
import 'livekit_internal.pbenum.dart';
import 'livekit_models.pb.dart' as $0;
import 'livekit_room.pb.dart' as $1;
import 'livekit_rtc.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

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
    final result = create();
    if (id != null) result.id = id;
    if (ip != null) result.ip = ip;
    if (numCpus != null) result.numCpus = numCpus;
    if (stats != null) result.stats = stats;
    if (type != null) result.type = type;
    if (state != null) result.state = state;
    if (region != null) result.region = region;
    return result;
  }

  Node._();

  factory Node.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Node.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Node',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'ip')
    ..aI(3, _omitFieldNames ? '' : 'numCpus', fieldType: $pb.PbFieldType.OU3)
    ..aOM<NodeStats>(4, _omitFieldNames ? '' : 'stats',
        subBuilder: NodeStats.create)
    ..aE<NodeType>(5, _omitFieldNames ? '' : 'type',
        enumValues: NodeType.values)
    ..aE<NodeState>(6, _omitFieldNames ? '' : 'state',
        enumValues: NodeState.values)
    ..aOS(7, _omitFieldNames ? '' : 'region')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Node clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Node copyWith(void Function(Node) updates) =>
      super.copyWith((message) => updates(message as Node)) as Node;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Node create() => Node._();
  @$core.override
  Node createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Node getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Node>(create);
  static Node? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get ip => $_getSZ(1);
  @$pb.TagNumber(2)
  set ip($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIp() => $_has(1);
  @$pb.TagNumber(2)
  void clearIp() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get numCpus => $_getIZ(2);
  @$pb.TagNumber(3)
  set numCpus($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNumCpus() => $_has(2);
  @$pb.TagNumber(3)
  void clearNumCpus() => $_clearField(3);

  @$pb.TagNumber(4)
  NodeStats get stats => $_getN(3);
  @$pb.TagNumber(4)
  set stats(NodeStats value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStats() => $_has(3);
  @$pb.TagNumber(4)
  void clearStats() => $_clearField(4);
  @$pb.TagNumber(4)
  NodeStats ensureStats() => $_ensure(3);

  @$pb.TagNumber(5)
  NodeType get type => $_getN(4);
  @$pb.TagNumber(5)
  set type(NodeType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);

  @$pb.TagNumber(6)
  NodeState get state => $_getN(5);
  @$pb.TagNumber(6)
  set state(NodeState value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get region => $_getSZ(6);
  @$pb.TagNumber(7)
  set region($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRegion() => $_has(6);
  @$pb.TagNumber(7)
  void clearRegion() => $_clearField(7);
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
    @$core.Deprecated('This field is deprecated.') $core.double? bytesInPerSec,
    @$core.Deprecated('This field is deprecated.') $core.double? bytesOutPerSec,
    $core.double? packetsInPerSec,
    @$core.Deprecated('This field is deprecated.')
    $core.double? packetsOutPerSec,
    @$core.Deprecated('This field is deprecated.') $core.double? nackPerSec,
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
    @$core.Deprecated('This field is deprecated.') $core.double? memoryLoad,
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
    final result = create();
    if (startedAt != null) result.startedAt = startedAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (numRooms != null) result.numRooms = numRooms;
    if (numClients != null) result.numClients = numClients;
    if (numTracksIn != null) result.numTracksIn = numTracksIn;
    if (numTracksOut != null) result.numTracksOut = numTracksOut;
    if (bytesIn != null) result.bytesIn = bytesIn;
    if (bytesOut != null) result.bytesOut = bytesOut;
    if (packetsIn != null) result.packetsIn = packetsIn;
    if (packetsOut != null) result.packetsOut = packetsOut;
    if (nackTotal != null) result.nackTotal = nackTotal;
    if (bytesInPerSec != null) result.bytesInPerSec = bytesInPerSec;
    if (bytesOutPerSec != null) result.bytesOutPerSec = bytesOutPerSec;
    if (packetsInPerSec != null) result.packetsInPerSec = packetsInPerSec;
    if (packetsOutPerSec != null) result.packetsOutPerSec = packetsOutPerSec;
    if (nackPerSec != null) result.nackPerSec = nackPerSec;
    if (numCpus != null) result.numCpus = numCpus;
    if (loadAvgLast1min != null) result.loadAvgLast1min = loadAvgLast1min;
    if (loadAvgLast5min != null) result.loadAvgLast5min = loadAvgLast5min;
    if (loadAvgLast15min != null) result.loadAvgLast15min = loadAvgLast15min;
    if (cpuLoad != null) result.cpuLoad = cpuLoad;
    if (retransmitBytesOut != null)
      result.retransmitBytesOut = retransmitBytesOut;
    if (retransmitPacketsOut != null)
      result.retransmitPacketsOut = retransmitPacketsOut;
    if (retransmitBytesOutPerSec != null)
      result.retransmitBytesOutPerSec = retransmitBytesOutPerSec;
    if (retransmitPacketsOutPerSec != null)
      result.retransmitPacketsOutPerSec = retransmitPacketsOutPerSec;
    if (participantSignalConnected != null)
      result.participantSignalConnected = participantSignalConnected;
    if (participantSignalConnectedPerSec != null)
      result.participantSignalConnectedPerSec =
          participantSignalConnectedPerSec;
    if (sysPacketsOut != null) result.sysPacketsOut = sysPacketsOut;
    if (sysPacketsDropped != null) result.sysPacketsDropped = sysPacketsDropped;
    if (sysPacketsOutPerSec != null)
      result.sysPacketsOutPerSec = sysPacketsOutPerSec;
    if (sysPacketsDroppedPerSec != null)
      result.sysPacketsDroppedPerSec = sysPacketsDroppedPerSec;
    if (sysPacketsDroppedPctPerSec != null)
      result.sysPacketsDroppedPctPerSec = sysPacketsDroppedPctPerSec;
    if (memoryLoad != null) result.memoryLoad = memoryLoad;
    if (memoryTotal != null) result.memoryTotal = memoryTotal;
    if (memoryUsed != null) result.memoryUsed = memoryUsed;
    if (numTrackPublishAttempts != null)
      result.numTrackPublishAttempts = numTrackPublishAttempts;
    if (trackPublishAttemptsPerSec != null)
      result.trackPublishAttemptsPerSec = trackPublishAttemptsPerSec;
    if (numTrackPublishSuccess != null)
      result.numTrackPublishSuccess = numTrackPublishSuccess;
    if (trackPublishSuccessPerSec != null)
      result.trackPublishSuccessPerSec = trackPublishSuccessPerSec;
    if (numTrackSubscribeAttempts != null)
      result.numTrackSubscribeAttempts = numTrackSubscribeAttempts;
    if (trackSubscribeAttemptsPerSec != null)
      result.trackSubscribeAttemptsPerSec = trackSubscribeAttemptsPerSec;
    if (numTrackSubscribeSuccess != null)
      result.numTrackSubscribeSuccess = numTrackSubscribeSuccess;
    if (trackSubscribeSuccessPerSec != null)
      result.trackSubscribeSuccessPerSec = trackSubscribeSuccessPerSec;
    if (participantRtcConnected != null)
      result.participantRtcConnected = participantRtcConnected;
    if (participantRtcConnectedPerSec != null)
      result.participantRtcConnectedPerSec = participantRtcConnectedPerSec;
    if (participantRtcInit != null)
      result.participantRtcInit = participantRtcInit;
    if (participantRtcInitPerSec != null)
      result.participantRtcInitPerSec = participantRtcInitPerSec;
    if (forwardLatency != null) result.forwardLatency = forwardLatency;
    if (forwardJitter != null) result.forwardJitter = forwardJitter;
    if (rates != null) result.rates.addAll(rates);
    if (numTrackPublishCancels != null)
      result.numTrackPublishCancels = numTrackPublishCancels;
    if (numTrackSubscribeCancels != null)
      result.numTrackSubscribeCancels = numTrackSubscribeCancels;
    if (participantRtcCanceled != null)
      result.participantRtcCanceled = participantRtcCanceled;
    return result;
  }

  NodeStats._();

  factory NodeStats.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NodeStats.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NodeStats',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(2, _omitFieldNames ? '' : 'updatedAt')
    ..aI(3, _omitFieldNames ? '' : 'numRooms')
    ..aI(4, _omitFieldNames ? '' : 'numClients')
    ..aI(5, _omitFieldNames ? '' : 'numTracksIn')
    ..aI(6, _omitFieldNames ? '' : 'numTracksOut')
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'bytesIn', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'bytesOut', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        9, _omitFieldNames ? '' : 'packetsIn', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'packetsOut', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        11, _omitFieldNames ? '' : 'nackTotal', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aD(12, _omitFieldNames ? '' : 'bytesInPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..aD(13, _omitFieldNames ? '' : 'bytesOutPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..aD(14, _omitFieldNames ? '' : 'packetsInPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..aD(15, _omitFieldNames ? '' : 'packetsOutPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..aD(16, _omitFieldNames ? '' : 'nackPerSec', fieldType: $pb.PbFieldType.OF)
    ..aI(17, _omitFieldNames ? '' : 'numCpus', fieldType: $pb.PbFieldType.OU3)
    ..aD(18, _omitFieldNames ? '' : 'loadAvgLast1min',
        fieldType: $pb.PbFieldType.OF)
    ..aD(19, _omitFieldNames ? '' : 'loadAvgLast5min',
        fieldType: $pb.PbFieldType.OF)
    ..aD(20, _omitFieldNames ? '' : 'loadAvgLast15min',
        fieldType: $pb.PbFieldType.OF)
    ..aD(21, _omitFieldNames ? '' : 'cpuLoad', fieldType: $pb.PbFieldType.OF)
    ..a<$fixnum.Int64>(
        22, _omitFieldNames ? '' : 'retransmitBytesOut', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        23, _omitFieldNames ? '' : 'retransmitPacketsOut', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aD(24, _omitFieldNames ? '' : 'retransmitBytesOutPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..aD(25, _omitFieldNames ? '' : 'retransmitPacketsOutPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..a<$fixnum.Int64>(26, _omitFieldNames ? '' : 'participantSignalConnected',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aD(27, _omitFieldNames ? '' : 'participantSignalConnectedPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..aI(28, _omitFieldNames ? '' : 'sysPacketsOut',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(29, _omitFieldNames ? '' : 'sysPacketsDropped',
        fieldType: $pb.PbFieldType.OU3)
    ..aD(30, _omitFieldNames ? '' : 'sysPacketsOutPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..aD(31, _omitFieldNames ? '' : 'sysPacketsDroppedPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..aD(32, _omitFieldNames ? '' : 'sysPacketsDroppedPctPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..aD(33, _omitFieldNames ? '' : 'memoryLoad', fieldType: $pb.PbFieldType.OF)
    ..a<$fixnum.Int64>(
        34, _omitFieldNames ? '' : 'memoryTotal', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        35, _omitFieldNames ? '' : 'memoryUsed', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(36, _omitFieldNames ? '' : 'numTrackPublishAttempts')
    ..aD(37, _omitFieldNames ? '' : 'trackPublishAttemptsPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..aI(38, _omitFieldNames ? '' : 'numTrackPublishSuccess')
    ..aD(39, _omitFieldNames ? '' : 'trackPublishSuccessPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..aI(40, _omitFieldNames ? '' : 'numTrackSubscribeAttempts')
    ..aD(41, _omitFieldNames ? '' : 'trackSubscribeAttemptsPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..aI(42, _omitFieldNames ? '' : 'numTrackSubscribeSuccess')
    ..aD(43, _omitFieldNames ? '' : 'trackSubscribeSuccessPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..a<$fixnum.Int64>(44, _omitFieldNames ? '' : 'participantRtcConnected',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aD(45, _omitFieldNames ? '' : 'participantRtcConnectedPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..a<$fixnum.Int64>(
        46, _omitFieldNames ? '' : 'participantRtcInit', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aD(47, _omitFieldNames ? '' : 'participantRtcInitPerSec',
        fieldType: $pb.PbFieldType.OF)
    ..aI(48, _omitFieldNames ? '' : 'forwardLatency',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(49, _omitFieldNames ? '' : 'forwardJitter',
        fieldType: $pb.PbFieldType.OU3)
    ..pPM<NodeStatsRate>(50, _omitFieldNames ? '' : 'rates',
        subBuilder: NodeStatsRate.create)
    ..aI(51, _omitFieldNames ? '' : 'numTrackPublishCancels')
    ..aI(52, _omitFieldNames ? '' : 'numTrackSubscribeCancels')
    ..a<$fixnum.Int64>(53, _omitFieldNames ? '' : 'participantRtcCanceled',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeStats clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeStats copyWith(void Function(NodeStats) updates) =>
      super.copyWith((message) => updates(message as NodeStats)) as NodeStats;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeStats create() => NodeStats._();
  @$core.override
  NodeStats createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NodeStats getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeStats>(create);
  static NodeStats? _defaultInstance;

  /// when server was started
  @$pb.TagNumber(1)
  $fixnum.Int64 get startedAt => $_getI64(0);
  @$pb.TagNumber(1)
  set startedAt($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStartedAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartedAt() => $_clearField(1);

  /// when server last reported its status
  @$pb.TagNumber(2)
  $fixnum.Int64 get updatedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set updatedAt($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUpdatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdatedAt() => $_clearField(2);

  /// room
  @$pb.TagNumber(3)
  $core.int get numRooms => $_getIZ(2);
  @$pb.TagNumber(3)
  set numRooms($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNumRooms() => $_has(2);
  @$pb.TagNumber(3)
  void clearNumRooms() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get numClients => $_getIZ(3);
  @$pb.TagNumber(4)
  set numClients($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNumClients() => $_has(3);
  @$pb.TagNumber(4)
  void clearNumClients() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get numTracksIn => $_getIZ(4);
  @$pb.TagNumber(5)
  set numTracksIn($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNumTracksIn() => $_has(4);
  @$pb.TagNumber(5)
  void clearNumTracksIn() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get numTracksOut => $_getIZ(5);
  @$pb.TagNumber(6)
  set numTracksOut($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNumTracksOut() => $_has(5);
  @$pb.TagNumber(6)
  void clearNumTracksOut() => $_clearField(6);

  /// packet
  @$pb.TagNumber(7)
  $fixnum.Int64 get bytesIn => $_getI64(6);
  @$pb.TagNumber(7)
  set bytesIn($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBytesIn() => $_has(6);
  @$pb.TagNumber(7)
  void clearBytesIn() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get bytesOut => $_getI64(7);
  @$pb.TagNumber(8)
  set bytesOut($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasBytesOut() => $_has(7);
  @$pb.TagNumber(8)
  void clearBytesOut() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get packetsIn => $_getI64(8);
  @$pb.TagNumber(9)
  set packetsIn($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasPacketsIn() => $_has(8);
  @$pb.TagNumber(9)
  void clearPacketsIn() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get packetsOut => $_getI64(9);
  @$pb.TagNumber(10)
  set packetsOut($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPacketsOut() => $_has(9);
  @$pb.TagNumber(10)
  void clearPacketsOut() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get nackTotal => $_getI64(10);
  @$pb.TagNumber(11)
  set nackTotal($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasNackTotal() => $_has(10);
  @$pb.TagNumber(11)
  void clearNackTotal() => $_clearField(11);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  $core.double get bytesInPerSec => $_getN(11);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  set bytesInPerSec($core.double value) => $_setFloat(11, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  $core.bool hasBytesInPerSec() => $_has(11);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  void clearBytesInPerSec() => $_clearField(12);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  $core.double get bytesOutPerSec => $_getN(12);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  set bytesOutPerSec($core.double value) => $_setFloat(12, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  $core.bool hasBytesOutPerSec() => $_has(12);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  void clearBytesOutPerSec() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.double get packetsInPerSec => $_getN(13);
  @$pb.TagNumber(14)
  set packetsInPerSec($core.double value) => $_setFloat(13, value);
  @$pb.TagNumber(14)
  $core.bool hasPacketsInPerSec() => $_has(13);
  @$pb.TagNumber(14)
  void clearPacketsInPerSec() => $_clearField(14);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(15)
  $core.double get packetsOutPerSec => $_getN(14);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(15)
  set packetsOutPerSec($core.double value) => $_setFloat(14, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(15)
  $core.bool hasPacketsOutPerSec() => $_has(14);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(15)
  void clearPacketsOutPerSec() => $_clearField(15);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(16)
  $core.double get nackPerSec => $_getN(15);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(16)
  set nackPerSec($core.double value) => $_setFloat(15, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(16)
  $core.bool hasNackPerSec() => $_has(15);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(16)
  void clearNackPerSec() => $_clearField(16);

  /// system
  @$pb.TagNumber(17)
  $core.int get numCpus => $_getIZ(16);
  @$pb.TagNumber(17)
  set numCpus($core.int value) => $_setUnsignedInt32(16, value);
  @$pb.TagNumber(17)
  $core.bool hasNumCpus() => $_has(16);
  @$pb.TagNumber(17)
  void clearNumCpus() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.double get loadAvgLast1min => $_getN(17);
  @$pb.TagNumber(18)
  set loadAvgLast1min($core.double value) => $_setFloat(17, value);
  @$pb.TagNumber(18)
  $core.bool hasLoadAvgLast1min() => $_has(17);
  @$pb.TagNumber(18)
  void clearLoadAvgLast1min() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.double get loadAvgLast5min => $_getN(18);
  @$pb.TagNumber(19)
  set loadAvgLast5min($core.double value) => $_setFloat(18, value);
  @$pb.TagNumber(19)
  $core.bool hasLoadAvgLast5min() => $_has(18);
  @$pb.TagNumber(19)
  void clearLoadAvgLast5min() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.double get loadAvgLast15min => $_getN(19);
  @$pb.TagNumber(20)
  set loadAvgLast15min($core.double value) => $_setFloat(19, value);
  @$pb.TagNumber(20)
  $core.bool hasLoadAvgLast15min() => $_has(19);
  @$pb.TagNumber(20)
  void clearLoadAvgLast15min() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.double get cpuLoad => $_getN(20);
  @$pb.TagNumber(21)
  set cpuLoad($core.double value) => $_setFloat(20, value);
  @$pb.TagNumber(21)
  $core.bool hasCpuLoad() => $_has(20);
  @$pb.TagNumber(21)
  void clearCpuLoad() => $_clearField(21);

  /// retransmissions
  @$pb.TagNumber(22)
  $fixnum.Int64 get retransmitBytesOut => $_getI64(21);
  @$pb.TagNumber(22)
  set retransmitBytesOut($fixnum.Int64 value) => $_setInt64(21, value);
  @$pb.TagNumber(22)
  $core.bool hasRetransmitBytesOut() => $_has(21);
  @$pb.TagNumber(22)
  void clearRetransmitBytesOut() => $_clearField(22);

  @$pb.TagNumber(23)
  $fixnum.Int64 get retransmitPacketsOut => $_getI64(22);
  @$pb.TagNumber(23)
  set retransmitPacketsOut($fixnum.Int64 value) => $_setInt64(22, value);
  @$pb.TagNumber(23)
  $core.bool hasRetransmitPacketsOut() => $_has(22);
  @$pb.TagNumber(23)
  void clearRetransmitPacketsOut() => $_clearField(23);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(24)
  $core.double get retransmitBytesOutPerSec => $_getN(23);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(24)
  set retransmitBytesOutPerSec($core.double value) => $_setFloat(23, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(24)
  $core.bool hasRetransmitBytesOutPerSec() => $_has(23);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(24)
  void clearRetransmitBytesOutPerSec() => $_clearField(24);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(25)
  $core.double get retransmitPacketsOutPerSec => $_getN(24);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(25)
  set retransmitPacketsOutPerSec($core.double value) => $_setFloat(24, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(25)
  $core.bool hasRetransmitPacketsOutPerSec() => $_has(24);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(25)
  void clearRetransmitPacketsOutPerSec() => $_clearField(25);

  /// participant joins
  @$pb.TagNumber(26)
  $fixnum.Int64 get participantSignalConnected => $_getI64(25);
  @$pb.TagNumber(26)
  set participantSignalConnected($fixnum.Int64 value) => $_setInt64(25, value);
  @$pb.TagNumber(26)
  $core.bool hasParticipantSignalConnected() => $_has(25);
  @$pb.TagNumber(26)
  void clearParticipantSignalConnected() => $_clearField(26);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(27)
  $core.double get participantSignalConnectedPerSec => $_getN(26);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(27)
  set participantSignalConnectedPerSec($core.double value) =>
      $_setFloat(26, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(27)
  $core.bool hasParticipantSignalConnectedPerSec() => $_has(26);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(27)
  void clearParticipantSignalConnectedPerSec() => $_clearField(27);

  @$pb.TagNumber(28)
  $core.int get sysPacketsOut => $_getIZ(27);
  @$pb.TagNumber(28)
  set sysPacketsOut($core.int value) => $_setUnsignedInt32(27, value);
  @$pb.TagNumber(28)
  $core.bool hasSysPacketsOut() => $_has(27);
  @$pb.TagNumber(28)
  void clearSysPacketsOut() => $_clearField(28);

  @$pb.TagNumber(29)
  $core.int get sysPacketsDropped => $_getIZ(28);
  @$pb.TagNumber(29)
  set sysPacketsDropped($core.int value) => $_setUnsignedInt32(28, value);
  @$pb.TagNumber(29)
  $core.bool hasSysPacketsDropped() => $_has(28);
  @$pb.TagNumber(29)
  void clearSysPacketsDropped() => $_clearField(29);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(30)
  $core.double get sysPacketsOutPerSec => $_getN(29);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(30)
  set sysPacketsOutPerSec($core.double value) => $_setFloat(29, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(30)
  $core.bool hasSysPacketsOutPerSec() => $_has(29);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(30)
  void clearSysPacketsOutPerSec() => $_clearField(30);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(31)
  $core.double get sysPacketsDroppedPerSec => $_getN(30);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(31)
  set sysPacketsDroppedPerSec($core.double value) => $_setFloat(30, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(31)
  $core.bool hasSysPacketsDroppedPerSec() => $_has(30);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(31)
  void clearSysPacketsDroppedPerSec() => $_clearField(31);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(32)
  $core.double get sysPacketsDroppedPctPerSec => $_getN(31);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(32)
  set sysPacketsDroppedPctPerSec($core.double value) => $_setFloat(31, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(32)
  $core.bool hasSysPacketsDroppedPctPerSec() => $_has(31);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(32)
  void clearSysPacketsDroppedPctPerSec() => $_clearField(32);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(33)
  $core.double get memoryLoad => $_getN(32);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(33)
  set memoryLoad($core.double value) => $_setFloat(32, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(33)
  $core.bool hasMemoryLoad() => $_has(32);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(33)
  void clearMemoryLoad() => $_clearField(33);

  @$pb.TagNumber(34)
  $fixnum.Int64 get memoryTotal => $_getI64(33);
  @$pb.TagNumber(34)
  set memoryTotal($fixnum.Int64 value) => $_setInt64(33, value);
  @$pb.TagNumber(34)
  $core.bool hasMemoryTotal() => $_has(33);
  @$pb.TagNumber(34)
  void clearMemoryTotal() => $_clearField(34);

  @$pb.TagNumber(35)
  $fixnum.Int64 get memoryUsed => $_getI64(34);
  @$pb.TagNumber(35)
  set memoryUsed($fixnum.Int64 value) => $_setInt64(34, value);
  @$pb.TagNumber(35)
  $core.bool hasMemoryUsed() => $_has(34);
  @$pb.TagNumber(35)
  void clearMemoryUsed() => $_clearField(35);

  @$pb.TagNumber(36)
  $core.int get numTrackPublishAttempts => $_getIZ(35);
  @$pb.TagNumber(36)
  set numTrackPublishAttempts($core.int value) => $_setSignedInt32(35, value);
  @$pb.TagNumber(36)
  $core.bool hasNumTrackPublishAttempts() => $_has(35);
  @$pb.TagNumber(36)
  void clearNumTrackPublishAttempts() => $_clearField(36);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(37)
  $core.double get trackPublishAttemptsPerSec => $_getN(36);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(37)
  set trackPublishAttemptsPerSec($core.double value) => $_setFloat(36, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(37)
  $core.bool hasTrackPublishAttemptsPerSec() => $_has(36);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(37)
  void clearTrackPublishAttemptsPerSec() => $_clearField(37);

  @$pb.TagNumber(38)
  $core.int get numTrackPublishSuccess => $_getIZ(37);
  @$pb.TagNumber(38)
  set numTrackPublishSuccess($core.int value) => $_setSignedInt32(37, value);
  @$pb.TagNumber(38)
  $core.bool hasNumTrackPublishSuccess() => $_has(37);
  @$pb.TagNumber(38)
  void clearNumTrackPublishSuccess() => $_clearField(38);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(39)
  $core.double get trackPublishSuccessPerSec => $_getN(38);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(39)
  set trackPublishSuccessPerSec($core.double value) => $_setFloat(38, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(39)
  $core.bool hasTrackPublishSuccessPerSec() => $_has(38);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(39)
  void clearTrackPublishSuccessPerSec() => $_clearField(39);

  @$pb.TagNumber(40)
  $core.int get numTrackSubscribeAttempts => $_getIZ(39);
  @$pb.TagNumber(40)
  set numTrackSubscribeAttempts($core.int value) => $_setSignedInt32(39, value);
  @$pb.TagNumber(40)
  $core.bool hasNumTrackSubscribeAttempts() => $_has(39);
  @$pb.TagNumber(40)
  void clearNumTrackSubscribeAttempts() => $_clearField(40);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(41)
  $core.double get trackSubscribeAttemptsPerSec => $_getN(40);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(41)
  set trackSubscribeAttemptsPerSec($core.double value) => $_setFloat(40, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(41)
  $core.bool hasTrackSubscribeAttemptsPerSec() => $_has(40);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(41)
  void clearTrackSubscribeAttemptsPerSec() => $_clearField(41);

  @$pb.TagNumber(42)
  $core.int get numTrackSubscribeSuccess => $_getIZ(41);
  @$pb.TagNumber(42)
  set numTrackSubscribeSuccess($core.int value) => $_setSignedInt32(41, value);
  @$pb.TagNumber(42)
  $core.bool hasNumTrackSubscribeSuccess() => $_has(41);
  @$pb.TagNumber(42)
  void clearNumTrackSubscribeSuccess() => $_clearField(42);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(43)
  $core.double get trackSubscribeSuccessPerSec => $_getN(42);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(43)
  set trackSubscribeSuccessPerSec($core.double value) => $_setFloat(42, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(43)
  $core.bool hasTrackSubscribeSuccessPerSec() => $_has(42);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(43)
  void clearTrackSubscribeSuccessPerSec() => $_clearField(43);

  @$pb.TagNumber(44)
  $fixnum.Int64 get participantRtcConnected => $_getI64(43);
  @$pb.TagNumber(44)
  set participantRtcConnected($fixnum.Int64 value) => $_setInt64(43, value);
  @$pb.TagNumber(44)
  $core.bool hasParticipantRtcConnected() => $_has(43);
  @$pb.TagNumber(44)
  void clearParticipantRtcConnected() => $_clearField(44);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(45)
  $core.double get participantRtcConnectedPerSec => $_getN(44);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(45)
  set participantRtcConnectedPerSec($core.double value) =>
      $_setFloat(44, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(45)
  $core.bool hasParticipantRtcConnectedPerSec() => $_has(44);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(45)
  void clearParticipantRtcConnectedPerSec() => $_clearField(45);

  @$pb.TagNumber(46)
  $fixnum.Int64 get participantRtcInit => $_getI64(45);
  @$pb.TagNumber(46)
  set participantRtcInit($fixnum.Int64 value) => $_setInt64(45, value);
  @$pb.TagNumber(46)
  $core.bool hasParticipantRtcInit() => $_has(45);
  @$pb.TagNumber(46)
  void clearParticipantRtcInit() => $_clearField(46);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(47)
  $core.double get participantRtcInitPerSec => $_getN(46);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(47)
  set participantRtcInitPerSec($core.double value) => $_setFloat(46, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(47)
  $core.bool hasParticipantRtcInitPerSec() => $_has(46);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(47)
  void clearParticipantRtcInitPerSec() => $_clearField(47);

  /// forward metrics
  @$pb.TagNumber(48)
  $core.int get forwardLatency => $_getIZ(47);
  @$pb.TagNumber(48)
  set forwardLatency($core.int value) => $_setUnsignedInt32(47, value);
  @$pb.TagNumber(48)
  $core.bool hasForwardLatency() => $_has(47);
  @$pb.TagNumber(48)
  void clearForwardLatency() => $_clearField(48);

  @$pb.TagNumber(49)
  $core.int get forwardJitter => $_getIZ(48);
  @$pb.TagNumber(49)
  set forwardJitter($core.int value) => $_setUnsignedInt32(48, value);
  @$pb.TagNumber(49)
  $core.bool hasForwardJitter() => $_has(48);
  @$pb.TagNumber(49)
  void clearForwardJitter() => $_clearField(49);

  @$pb.TagNumber(50)
  $pb.PbList<NodeStatsRate> get rates => $_getList(49);

  @$pb.TagNumber(51)
  $core.int get numTrackPublishCancels => $_getIZ(50);
  @$pb.TagNumber(51)
  set numTrackPublishCancels($core.int value) => $_setSignedInt32(50, value);
  @$pb.TagNumber(51)
  $core.bool hasNumTrackPublishCancels() => $_has(50);
  @$pb.TagNumber(51)
  void clearNumTrackPublishCancels() => $_clearField(51);

  @$pb.TagNumber(52)
  $core.int get numTrackSubscribeCancels => $_getIZ(51);
  @$pb.TagNumber(52)
  set numTrackSubscribeCancels($core.int value) => $_setSignedInt32(51, value);
  @$pb.TagNumber(52)
  $core.bool hasNumTrackSubscribeCancels() => $_has(51);
  @$pb.TagNumber(52)
  void clearNumTrackSubscribeCancels() => $_clearField(52);

  @$pb.TagNumber(53)
  $fixnum.Int64 get participantRtcCanceled => $_getI64(52);
  @$pb.TagNumber(53)
  set participantRtcCanceled($fixnum.Int64 value) => $_setInt64(52, value);
  @$pb.TagNumber(53)
  $core.bool hasParticipantRtcCanceled() => $_has(52);
  @$pb.TagNumber(53)
  void clearParticipantRtcCanceled() => $_clearField(53);
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
    final result = create();
    if (startedAt != null) result.startedAt = startedAt;
    if (endedAt != null) result.endedAt = endedAt;
    if (duration != null) result.duration = duration;
    if (trackPublishAttempts != null)
      result.trackPublishAttempts = trackPublishAttempts;
    if (trackPublishSuccess != null)
      result.trackPublishSuccess = trackPublishSuccess;
    if (trackSubscribeAttempts != null)
      result.trackSubscribeAttempts = trackSubscribeAttempts;
    if (trackSubscribeSuccess != null)
      result.trackSubscribeSuccess = trackSubscribeSuccess;
    if (bytesIn != null) result.bytesIn = bytesIn;
    if (bytesOut != null) result.bytesOut = bytesOut;
    if (packetsIn != null) result.packetsIn = packetsIn;
    if (packetsOut != null) result.packetsOut = packetsOut;
    if (nackTotal != null) result.nackTotal = nackTotal;
    if (sysPacketsOut != null) result.sysPacketsOut = sysPacketsOut;
    if (sysPacketsDropped != null) result.sysPacketsDropped = sysPacketsDropped;
    if (retransmitBytesOut != null)
      result.retransmitBytesOut = retransmitBytesOut;
    if (retransmitPacketsOut != null)
      result.retransmitPacketsOut = retransmitPacketsOut;
    if (participantSignalConnected != null)
      result.participantSignalConnected = participantSignalConnected;
    if (participantRtcConnected != null)
      result.participantRtcConnected = participantRtcConnected;
    if (participantRtcInit != null)
      result.participantRtcInit = participantRtcInit;
    if (cpuLoad != null) result.cpuLoad = cpuLoad;
    if (memoryLoad != null) result.memoryLoad = memoryLoad;
    if (memoryUsed != null) result.memoryUsed = memoryUsed;
    if (memoryTotal != null) result.memoryTotal = memoryTotal;
    if (trackPublishCancels != null)
      result.trackPublishCancels = trackPublishCancels;
    if (trackSubscribeCancels != null)
      result.trackSubscribeCancels = trackSubscribeCancels;
    if (participantRtcCanceled != null)
      result.participantRtcCanceled = participantRtcCanceled;
    return result;
  }

  NodeStatsRate._();

  factory NodeStatsRate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NodeStatsRate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NodeStatsRate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startedAt')
    ..aInt64(2, _omitFieldNames ? '' : 'endedAt')
    ..aInt64(3, _omitFieldNames ? '' : 'duration')
    ..aD(4, _omitFieldNames ? '' : 'trackPublishAttempts',
        fieldType: $pb.PbFieldType.OF)
    ..aD(5, _omitFieldNames ? '' : 'trackPublishSuccess',
        fieldType: $pb.PbFieldType.OF)
    ..aD(6, _omitFieldNames ? '' : 'trackSubscribeAttempts',
        fieldType: $pb.PbFieldType.OF)
    ..aD(7, _omitFieldNames ? '' : 'trackSubscribeSuccess',
        fieldType: $pb.PbFieldType.OF)
    ..aD(8, _omitFieldNames ? '' : 'bytesIn', fieldType: $pb.PbFieldType.OF)
    ..aD(9, _omitFieldNames ? '' : 'bytesOut', fieldType: $pb.PbFieldType.OF)
    ..aD(10, _omitFieldNames ? '' : 'packetsIn', fieldType: $pb.PbFieldType.OF)
    ..aD(11, _omitFieldNames ? '' : 'packetsOut', fieldType: $pb.PbFieldType.OF)
    ..aD(12, _omitFieldNames ? '' : 'nackTotal', fieldType: $pb.PbFieldType.OF)
    ..aD(13, _omitFieldNames ? '' : 'sysPacketsOut',
        fieldType: $pb.PbFieldType.OF)
    ..aD(14, _omitFieldNames ? '' : 'sysPacketsDropped',
        fieldType: $pb.PbFieldType.OF)
    ..aD(15, _omitFieldNames ? '' : 'retransmitBytesOut',
        fieldType: $pb.PbFieldType.OF)
    ..aD(16, _omitFieldNames ? '' : 'retransmitPacketsOut',
        fieldType: $pb.PbFieldType.OF)
    ..aD(17, _omitFieldNames ? '' : 'participantSignalConnected',
        fieldType: $pb.PbFieldType.OF)
    ..aD(18, _omitFieldNames ? '' : 'participantRtcConnected',
        fieldType: $pb.PbFieldType.OF)
    ..aD(19, _omitFieldNames ? '' : 'participantRtcInit',
        fieldType: $pb.PbFieldType.OF)
    ..aD(20, _omitFieldNames ? '' : 'cpuLoad', fieldType: $pb.PbFieldType.OF)
    ..aD(21, _omitFieldNames ? '' : 'memoryLoad', fieldType: $pb.PbFieldType.OF)
    ..aD(22, _omitFieldNames ? '' : 'memoryUsed', fieldType: $pb.PbFieldType.OF)
    ..aD(23, _omitFieldNames ? '' : 'memoryTotal',
        fieldType: $pb.PbFieldType.OF)
    ..aD(24, _omitFieldNames ? '' : 'trackPublishCancels',
        fieldType: $pb.PbFieldType.OF)
    ..aD(25, _omitFieldNames ? '' : 'trackSubscribeCancels',
        fieldType: $pb.PbFieldType.OF)
    ..aD(26, _omitFieldNames ? '' : 'participantRtcCanceled',
        fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeStatsRate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeStatsRate copyWith(void Function(NodeStatsRate) updates) =>
      super.copyWith((message) => updates(message as NodeStatsRate))
          as NodeStatsRate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeStatsRate create() => NodeStatsRate._();
  @$core.override
  NodeStatsRate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NodeStatsRate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NodeStatsRate>(create);
  static NodeStatsRate? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get startedAt => $_getI64(0);
  @$pb.TagNumber(1)
  set startedAt($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStartedAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartedAt() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set endedAt($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEndedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndedAt() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get duration => $_getI64(2);
  @$pb.TagNumber(3)
  set duration($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get trackPublishAttempts => $_getN(3);
  @$pb.TagNumber(4)
  set trackPublishAttempts($core.double value) => $_setFloat(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTrackPublishAttempts() => $_has(3);
  @$pb.TagNumber(4)
  void clearTrackPublishAttempts() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get trackPublishSuccess => $_getN(4);
  @$pb.TagNumber(5)
  set trackPublishSuccess($core.double value) => $_setFloat(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTrackPublishSuccess() => $_has(4);
  @$pb.TagNumber(5)
  void clearTrackPublishSuccess() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get trackSubscribeAttempts => $_getN(5);
  @$pb.TagNumber(6)
  set trackSubscribeAttempts($core.double value) => $_setFloat(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTrackSubscribeAttempts() => $_has(5);
  @$pb.TagNumber(6)
  void clearTrackSubscribeAttempts() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get trackSubscribeSuccess => $_getN(6);
  @$pb.TagNumber(7)
  set trackSubscribeSuccess($core.double value) => $_setFloat(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTrackSubscribeSuccess() => $_has(6);
  @$pb.TagNumber(7)
  void clearTrackSubscribeSuccess() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get bytesIn => $_getN(7);
  @$pb.TagNumber(8)
  set bytesIn($core.double value) => $_setFloat(7, value);
  @$pb.TagNumber(8)
  $core.bool hasBytesIn() => $_has(7);
  @$pb.TagNumber(8)
  void clearBytesIn() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get bytesOut => $_getN(8);
  @$pb.TagNumber(9)
  set bytesOut($core.double value) => $_setFloat(8, value);
  @$pb.TagNumber(9)
  $core.bool hasBytesOut() => $_has(8);
  @$pb.TagNumber(9)
  void clearBytesOut() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get packetsIn => $_getN(9);
  @$pb.TagNumber(10)
  set packetsIn($core.double value) => $_setFloat(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPacketsIn() => $_has(9);
  @$pb.TagNumber(10)
  void clearPacketsIn() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get packetsOut => $_getN(10);
  @$pb.TagNumber(11)
  set packetsOut($core.double value) => $_setFloat(10, value);
  @$pb.TagNumber(11)
  $core.bool hasPacketsOut() => $_has(10);
  @$pb.TagNumber(11)
  void clearPacketsOut() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get nackTotal => $_getN(11);
  @$pb.TagNumber(12)
  set nackTotal($core.double value) => $_setFloat(11, value);
  @$pb.TagNumber(12)
  $core.bool hasNackTotal() => $_has(11);
  @$pb.TagNumber(12)
  void clearNackTotal() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.double get sysPacketsOut => $_getN(12);
  @$pb.TagNumber(13)
  set sysPacketsOut($core.double value) => $_setFloat(12, value);
  @$pb.TagNumber(13)
  $core.bool hasSysPacketsOut() => $_has(12);
  @$pb.TagNumber(13)
  void clearSysPacketsOut() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.double get sysPacketsDropped => $_getN(13);
  @$pb.TagNumber(14)
  set sysPacketsDropped($core.double value) => $_setFloat(13, value);
  @$pb.TagNumber(14)
  $core.bool hasSysPacketsDropped() => $_has(13);
  @$pb.TagNumber(14)
  void clearSysPacketsDropped() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.double get retransmitBytesOut => $_getN(14);
  @$pb.TagNumber(15)
  set retransmitBytesOut($core.double value) => $_setFloat(14, value);
  @$pb.TagNumber(15)
  $core.bool hasRetransmitBytesOut() => $_has(14);
  @$pb.TagNumber(15)
  void clearRetransmitBytesOut() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.double get retransmitPacketsOut => $_getN(15);
  @$pb.TagNumber(16)
  set retransmitPacketsOut($core.double value) => $_setFloat(15, value);
  @$pb.TagNumber(16)
  $core.bool hasRetransmitPacketsOut() => $_has(15);
  @$pb.TagNumber(16)
  void clearRetransmitPacketsOut() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.double get participantSignalConnected => $_getN(16);
  @$pb.TagNumber(17)
  set participantSignalConnected($core.double value) => $_setFloat(16, value);
  @$pb.TagNumber(17)
  $core.bool hasParticipantSignalConnected() => $_has(16);
  @$pb.TagNumber(17)
  void clearParticipantSignalConnected() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.double get participantRtcConnected => $_getN(17);
  @$pb.TagNumber(18)
  set participantRtcConnected($core.double value) => $_setFloat(17, value);
  @$pb.TagNumber(18)
  $core.bool hasParticipantRtcConnected() => $_has(17);
  @$pb.TagNumber(18)
  void clearParticipantRtcConnected() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.double get participantRtcInit => $_getN(18);
  @$pb.TagNumber(19)
  set participantRtcInit($core.double value) => $_setFloat(18, value);
  @$pb.TagNumber(19)
  $core.bool hasParticipantRtcInit() => $_has(18);
  @$pb.TagNumber(19)
  void clearParticipantRtcInit() => $_clearField(19);

  /// time weighted averages across stats windows forming part of a rate measurement interval
  @$pb.TagNumber(20)
  $core.double get cpuLoad => $_getN(19);
  @$pb.TagNumber(20)
  set cpuLoad($core.double value) => $_setFloat(19, value);
  @$pb.TagNumber(20)
  $core.bool hasCpuLoad() => $_has(19);
  @$pb.TagNumber(20)
  void clearCpuLoad() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.double get memoryLoad => $_getN(20);
  @$pb.TagNumber(21)
  set memoryLoad($core.double value) => $_setFloat(20, value);
  @$pb.TagNumber(21)
  $core.bool hasMemoryLoad() => $_has(20);
  @$pb.TagNumber(21)
  void clearMemoryLoad() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.double get memoryUsed => $_getN(21);
  @$pb.TagNumber(22)
  set memoryUsed($core.double value) => $_setFloat(21, value);
  @$pb.TagNumber(22)
  $core.bool hasMemoryUsed() => $_has(21);
  @$pb.TagNumber(22)
  void clearMemoryUsed() => $_clearField(22);

  @$pb.TagNumber(23)
  $core.double get memoryTotal => $_getN(22);
  @$pb.TagNumber(23)
  set memoryTotal($core.double value) => $_setFloat(22, value);
  @$pb.TagNumber(23)
  $core.bool hasMemoryTotal() => $_has(22);
  @$pb.TagNumber(23)
  void clearMemoryTotal() => $_clearField(23);

  @$pb.TagNumber(24)
  $core.double get trackPublishCancels => $_getN(23);
  @$pb.TagNumber(24)
  set trackPublishCancels($core.double value) => $_setFloat(23, value);
  @$pb.TagNumber(24)
  $core.bool hasTrackPublishCancels() => $_has(23);
  @$pb.TagNumber(24)
  void clearTrackPublishCancels() => $_clearField(24);

  @$pb.TagNumber(25)
  $core.double get trackSubscribeCancels => $_getN(24);
  @$pb.TagNumber(25)
  set trackSubscribeCancels($core.double value) => $_setFloat(24, value);
  @$pb.TagNumber(25)
  $core.bool hasTrackSubscribeCancels() => $_has(24);
  @$pb.TagNumber(25)
  void clearTrackSubscribeCancels() => $_clearField(25);

  @$pb.TagNumber(26)
  $core.double get participantRtcCanceled => $_getN(25);
  @$pb.TagNumber(26)
  set participantRtcCanceled($core.double value) => $_setFloat(25, value);
  @$pb.TagNumber(26)
  $core.bool hasParticipantRtcCanceled() => $_has(25);
  @$pb.TagNumber(26)
  void clearParticipantRtcCanceled() => $_clearField(26);
}

class StartSession extends $pb.GeneratedMessage {
  factory StartSession({
    $core.String? roomName,
    $core.String? identity,
    $core.String? connectionId,
    $core.bool? reconnect,
    $core.bool? autoSubscribe,
    @$core.Deprecated('This field is deprecated.') $core.bool? hidden,
    $0.ClientInfo? client,
    @$core.Deprecated('This field is deprecated.') $core.bool? recorder,
    $core.String? name,
    $core.String? grantsJson,
    $core.bool? adaptiveStream,
    $core.String? participantId,
    $0.ReconnectReason? reconnectReason,
    $core.bool? subscriberAllowPause,
    $core.bool? disableIceLite,
    $1.CreateRoomRequest? createRoom,
    $core.Iterable<$2.AddTrackRequest>? addTrackRequests,
    $2.SessionDescription? publisherOffer,
    $2.SyncState? syncState,
    $core.bool? useSinglePeerConnection,
  }) {
    final result = create();
    if (roomName != null) result.roomName = roomName;
    if (identity != null) result.identity = identity;
    if (connectionId != null) result.connectionId = connectionId;
    if (reconnect != null) result.reconnect = reconnect;
    if (autoSubscribe != null) result.autoSubscribe = autoSubscribe;
    if (hidden != null) result.hidden = hidden;
    if (client != null) result.client = client;
    if (recorder != null) result.recorder = recorder;
    if (name != null) result.name = name;
    if (grantsJson != null) result.grantsJson = grantsJson;
    if (adaptiveStream != null) result.adaptiveStream = adaptiveStream;
    if (participantId != null) result.participantId = participantId;
    if (reconnectReason != null) result.reconnectReason = reconnectReason;
    if (subscriberAllowPause != null)
      result.subscriberAllowPause = subscriberAllowPause;
    if (disableIceLite != null) result.disableIceLite = disableIceLite;
    if (createRoom != null) result.createRoom = createRoom;
    if (addTrackRequests != null)
      result.addTrackRequests.addAll(addTrackRequests);
    if (publisherOffer != null) result.publisherOffer = publisherOffer;
    if (syncState != null) result.syncState = syncState;
    if (useSinglePeerConnection != null)
      result.useSinglePeerConnection = useSinglePeerConnection;
    return result;
  }

  StartSession._();

  factory StartSession.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartSession.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartSession',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOS(2, _omitFieldNames ? '' : 'identity')
    ..aOS(3, _omitFieldNames ? '' : 'connectionId')
    ..aOB(4, _omitFieldNames ? '' : 'reconnect')
    ..aOB(9, _omitFieldNames ? '' : 'autoSubscribe')
    ..aOB(10, _omitFieldNames ? '' : 'hidden')
    ..aOM<$0.ClientInfo>(11, _omitFieldNames ? '' : 'client',
        subBuilder: $0.ClientInfo.create)
    ..aOB(12, _omitFieldNames ? '' : 'recorder')
    ..aOS(13, _omitFieldNames ? '' : 'name')
    ..aOS(14, _omitFieldNames ? '' : 'grantsJson')
    ..aOB(15, _omitFieldNames ? '' : 'adaptiveStream')
    ..aOS(16, _omitFieldNames ? '' : 'participantId')
    ..aE<$0.ReconnectReason>(17, _omitFieldNames ? '' : 'reconnectReason',
        enumValues: $0.ReconnectReason.values)
    ..aOB(18, _omitFieldNames ? '' : 'subscriberAllowPause')
    ..aOB(19, _omitFieldNames ? '' : 'disableIceLite')
    ..aOM<$1.CreateRoomRequest>(20, _omitFieldNames ? '' : 'createRoom',
        subBuilder: $1.CreateRoomRequest.create)
    ..pPM<$2.AddTrackRequest>(21, _omitFieldNames ? '' : 'addTrackRequests',
        subBuilder: $2.AddTrackRequest.create)
    ..aOM<$2.SessionDescription>(22, _omitFieldNames ? '' : 'publisherOffer',
        subBuilder: $2.SessionDescription.create)
    ..aOM<$2.SyncState>(23, _omitFieldNames ? '' : 'syncState',
        subBuilder: $2.SyncState.create)
    ..aOB(24, _omitFieldNames ? '' : 'useSinglePeerConnection')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartSession clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartSession copyWith(void Function(StartSession) updates) =>
      super.copyWith((message) => updates(message as StartSession))
          as StartSession;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartSession create() => StartSession._();
  @$core.override
  StartSession createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartSession getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartSession>(create);
  static StartSession? _defaultInstance;

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
  $core.String get connectionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set connectionId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasConnectionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearConnectionId() => $_clearField(3);

  /// if a client is reconnecting (i.e. resume instead of restart)
  @$pb.TagNumber(4)
  $core.bool get reconnect => $_getBF(3);
  @$pb.TagNumber(4)
  set reconnect($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReconnect() => $_has(3);
  @$pb.TagNumber(4)
  void clearReconnect() => $_clearField(4);

  @$pb.TagNumber(9)
  $core.bool get autoSubscribe => $_getBF(4);
  @$pb.TagNumber(9)
  set autoSubscribe($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(9)
  $core.bool hasAutoSubscribe() => $_has(4);
  @$pb.TagNumber(9)
  void clearAutoSubscribe() => $_clearField(9);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  $core.bool get hidden => $_getBF(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  set hidden($core.bool value) => $_setBool(5, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  $core.bool hasHidden() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  void clearHidden() => $_clearField(10);

  @$pb.TagNumber(11)
  $0.ClientInfo get client => $_getN(6);
  @$pb.TagNumber(11)
  set client($0.ClientInfo value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasClient() => $_has(6);
  @$pb.TagNumber(11)
  void clearClient() => $_clearField(11);
  @$pb.TagNumber(11)
  $0.ClientInfo ensureClient() => $_ensure(6);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  $core.bool get recorder => $_getBF(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  set recorder($core.bool value) => $_setBool(7, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  $core.bool hasRecorder() => $_has(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(12)
  void clearRecorder() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get name => $_getSZ(8);
  @$pb.TagNumber(13)
  set name($core.String value) => $_setString(8, value);
  @$pb.TagNumber(13)
  $core.bool hasName() => $_has(8);
  @$pb.TagNumber(13)
  void clearName() => $_clearField(13);

  /// A user's ClaimGrants serialized in JSON
  @$pb.TagNumber(14)
  $core.String get grantsJson => $_getSZ(9);
  @$pb.TagNumber(14)
  set grantsJson($core.String value) => $_setString(9, value);
  @$pb.TagNumber(14)
  $core.bool hasGrantsJson() => $_has(9);
  @$pb.TagNumber(14)
  void clearGrantsJson() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.bool get adaptiveStream => $_getBF(10);
  @$pb.TagNumber(15)
  set adaptiveStream($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(15)
  $core.bool hasAdaptiveStream() => $_has(10);
  @$pb.TagNumber(15)
  void clearAdaptiveStream() => $_clearField(15);

  /// if reconnect, client will set current sid
  @$pb.TagNumber(16)
  $core.String get participantId => $_getSZ(11);
  @$pb.TagNumber(16)
  set participantId($core.String value) => $_setString(11, value);
  @$pb.TagNumber(16)
  $core.bool hasParticipantId() => $_has(11);
  @$pb.TagNumber(16)
  void clearParticipantId() => $_clearField(16);

  @$pb.TagNumber(17)
  $0.ReconnectReason get reconnectReason => $_getN(12);
  @$pb.TagNumber(17)
  set reconnectReason($0.ReconnectReason value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasReconnectReason() => $_has(12);
  @$pb.TagNumber(17)
  void clearReconnectReason() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.bool get subscriberAllowPause => $_getBF(13);
  @$pb.TagNumber(18)
  set subscriberAllowPause($core.bool value) => $_setBool(13, value);
  @$pb.TagNumber(18)
  $core.bool hasSubscriberAllowPause() => $_has(13);
  @$pb.TagNumber(18)
  void clearSubscriberAllowPause() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.bool get disableIceLite => $_getBF(14);
  @$pb.TagNumber(19)
  set disableIceLite($core.bool value) => $_setBool(14, value);
  @$pb.TagNumber(19)
  $core.bool hasDisableIceLite() => $_has(14);
  @$pb.TagNumber(19)
  void clearDisableIceLite() => $_clearField(19);

  @$pb.TagNumber(20)
  $1.CreateRoomRequest get createRoom => $_getN(15);
  @$pb.TagNumber(20)
  set createRoom($1.CreateRoomRequest value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasCreateRoom() => $_has(15);
  @$pb.TagNumber(20)
  void clearCreateRoom() => $_clearField(20);
  @$pb.TagNumber(20)
  $1.CreateRoomRequest ensureCreateRoom() => $_ensure(15);

  @$pb.TagNumber(21)
  $pb.PbList<$2.AddTrackRequest> get addTrackRequests => $_getList(16);

  @$pb.TagNumber(22)
  $2.SessionDescription get publisherOffer => $_getN(17);
  @$pb.TagNumber(22)
  set publisherOffer($2.SessionDescription value) => $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasPublisherOffer() => $_has(17);
  @$pb.TagNumber(22)
  void clearPublisherOffer() => $_clearField(22);
  @$pb.TagNumber(22)
  $2.SessionDescription ensurePublisherOffer() => $_ensure(17);

  @$pb.TagNumber(23)
  $2.SyncState get syncState => $_getN(18);
  @$pb.TagNumber(23)
  set syncState($2.SyncState value) => $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasSyncState() => $_has(18);
  @$pb.TagNumber(23)
  void clearSyncState() => $_clearField(23);
  @$pb.TagNumber(23)
  $2.SyncState ensureSyncState() => $_ensure(18);

  @$pb.TagNumber(24)
  $core.bool get useSinglePeerConnection => $_getBF(19);
  @$pb.TagNumber(24)
  set useSinglePeerConnection($core.bool value) => $_setBool(19, value);
  @$pb.TagNumber(24)
  $core.bool hasUseSinglePeerConnection() => $_has(19);
  @$pb.TagNumber(24)
  void clearUseSinglePeerConnection() => $_clearField(24);
}

/// room info that should not be returned to clients
class RoomInternal extends $pb.GeneratedMessage {
  factory RoomInternal({
    $3.AutoTrackEgress? trackEgress,
    $3.AutoParticipantEgress? participantEgress,
    $0.PlayoutDelay? playoutDelay,
    $core.bool? syncStreams,
    $core.Iterable<$4.RoomAgentDispatch>? agentDispatches,
    $core.bool? replayEnabled,
  }) {
    final result = create();
    if (trackEgress != null) result.trackEgress = trackEgress;
    if (participantEgress != null) result.participantEgress = participantEgress;
    if (playoutDelay != null) result.playoutDelay = playoutDelay;
    if (syncStreams != null) result.syncStreams = syncStreams;
    if (agentDispatches != null) result.agentDispatches.addAll(agentDispatches);
    if (replayEnabled != null) result.replayEnabled = replayEnabled;
    return result;
  }

  RoomInternal._();

  factory RoomInternal.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomInternal.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomInternal',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOM<$3.AutoTrackEgress>(1, _omitFieldNames ? '' : 'trackEgress',
        subBuilder: $3.AutoTrackEgress.create)
    ..aOM<$3.AutoParticipantEgress>(
        2, _omitFieldNames ? '' : 'participantEgress',
        subBuilder: $3.AutoParticipantEgress.create)
    ..aOM<$0.PlayoutDelay>(3, _omitFieldNames ? '' : 'playoutDelay',
        subBuilder: $0.PlayoutDelay.create)
    ..aOB(4, _omitFieldNames ? '' : 'syncStreams')
    ..pPM<$4.RoomAgentDispatch>(5, _omitFieldNames ? '' : 'agentDispatches',
        subBuilder: $4.RoomAgentDispatch.create)
    ..aOB(6, _omitFieldNames ? '' : 'replayEnabled')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomInternal clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomInternal copyWith(void Function(RoomInternal) updates) =>
      super.copyWith((message) => updates(message as RoomInternal))
          as RoomInternal;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomInternal create() => RoomInternal._();
  @$core.override
  RoomInternal createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomInternal getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInternal>(create);
  static RoomInternal? _defaultInstance;

  @$pb.TagNumber(1)
  $3.AutoTrackEgress get trackEgress => $_getN(0);
  @$pb.TagNumber(1)
  set trackEgress($3.AutoTrackEgress value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTrackEgress() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrackEgress() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.AutoTrackEgress ensureTrackEgress() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.AutoParticipantEgress get participantEgress => $_getN(1);
  @$pb.TagNumber(2)
  set participantEgress($3.AutoParticipantEgress value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasParticipantEgress() => $_has(1);
  @$pb.TagNumber(2)
  void clearParticipantEgress() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.AutoParticipantEgress ensureParticipantEgress() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.PlayoutDelay get playoutDelay => $_getN(2);
  @$pb.TagNumber(3)
  set playoutDelay($0.PlayoutDelay value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPlayoutDelay() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayoutDelay() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.PlayoutDelay ensurePlayoutDelay() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get syncStreams => $_getBF(3);
  @$pb.TagNumber(4)
  set syncStreams($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSyncStreams() => $_has(3);
  @$pb.TagNumber(4)
  void clearSyncStreams() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$4.RoomAgentDispatch> get agentDispatches => $_getList(4);

  @$pb.TagNumber(6)
  $core.bool get replayEnabled => $_getBF(5);
  @$pb.TagNumber(6)
  set replayEnabled($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasReplayEnabled() => $_has(5);
  @$pb.TagNumber(6)
  void clearReplayEnabled() => $_clearField(6);
}

class ICEConfig extends $pb.GeneratedMessage {
  factory ICEConfig({
    ICECandidateType? preferenceSubscriber,
    ICECandidateType? preferencePublisher,
  }) {
    final result = create();
    if (preferenceSubscriber != null)
      result.preferenceSubscriber = preferenceSubscriber;
    if (preferencePublisher != null)
      result.preferencePublisher = preferencePublisher;
    return result;
  }

  ICEConfig._();

  factory ICEConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ICEConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ICEConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aE<ICECandidateType>(1, _omitFieldNames ? '' : 'preferenceSubscriber',
        enumValues: ICECandidateType.values)
    ..aE<ICECandidateType>(2, _omitFieldNames ? '' : 'preferencePublisher',
        enumValues: ICECandidateType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ICEConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ICEConfig copyWith(void Function(ICEConfig) updates) =>
      super.copyWith((message) => updates(message as ICEConfig)) as ICEConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ICEConfig create() => ICEConfig._();
  @$core.override
  ICEConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ICEConfig getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ICEConfig>(create);
  static ICEConfig? _defaultInstance;

  @$pb.TagNumber(1)
  ICECandidateType get preferenceSubscriber => $_getN(0);
  @$pb.TagNumber(1)
  set preferenceSubscriber(ICECandidateType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPreferenceSubscriber() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreferenceSubscriber() => $_clearField(1);

  @$pb.TagNumber(2)
  ICECandidateType get preferencePublisher => $_getN(1);
  @$pb.TagNumber(2)
  set preferencePublisher(ICECandidateType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPreferencePublisher() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreferencePublisher() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
