// This is a generated file - do not edit.
//
// Generated from livekit_webhook.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_egress.pb.dart' as $1;
import 'livekit_ingress.pb.dart' as $2;
import 'livekit_models.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class WebhookEvent extends $pb.GeneratedMessage {
  factory WebhookEvent({
    $core.String? event,
    $0.Room? room,
    $0.ParticipantInfo? participant,
    $core.String? id,
    $fixnum.Int64? createdAt,
    $0.TrackInfo? track,
    $1.EgressInfo? egressInfo,
    $2.IngressInfo? ingressInfo,
    @$core.Deprecated('This field is deprecated.') $core.int? numDropped,
  }) {
    final result = create();
    if (event != null) result.event = event;
    if (room != null) result.room = room;
    if (participant != null) result.participant = participant;
    if (id != null) result.id = id;
    if (createdAt != null) result.createdAt = createdAt;
    if (track != null) result.track = track;
    if (egressInfo != null) result.egressInfo = egressInfo;
    if (ingressInfo != null) result.ingressInfo = ingressInfo;
    if (numDropped != null) result.numDropped = numDropped;
    return result;
  }

  WebhookEvent._();

  factory WebhookEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WebhookEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WebhookEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'event')
    ..aOM<$0.Room>(2, _omitFieldNames ? '' : 'room', subBuilder: $0.Room.create)
    ..aOM<$0.ParticipantInfo>(3, _omitFieldNames ? '' : 'participant',
        subBuilder: $0.ParticipantInfo.create)
    ..aOS(6, _omitFieldNames ? '' : 'id')
    ..aInt64(7, _omitFieldNames ? '' : 'createdAt')
    ..aOM<$0.TrackInfo>(8, _omitFieldNames ? '' : 'track',
        subBuilder: $0.TrackInfo.create)
    ..aOM<$1.EgressInfo>(9, _omitFieldNames ? '' : 'egressInfo',
        subBuilder: $1.EgressInfo.create)
    ..aOM<$2.IngressInfo>(10, _omitFieldNames ? '' : 'ingressInfo',
        subBuilder: $2.IngressInfo.create)
    ..aI(11, _omitFieldNames ? '' : 'numDropped')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebhookEvent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebhookEvent copyWith(void Function(WebhookEvent) updates) =>
      super.copyWith((message) => updates(message as WebhookEvent))
          as WebhookEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WebhookEvent create() => WebhookEvent._();
  @$core.override
  WebhookEvent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WebhookEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WebhookEvent>(create);
  static WebhookEvent? _defaultInstance;

  /// one of room_started, room_finished, participant_joined, participant_left, participant_connection_aborted,
  /// track_published, track_unpublished, egress_started, egress_updated, egress_ended,
  /// ingress_started, ingress_ended
  @$pb.TagNumber(1)
  $core.String get event => $_getSZ(0);
  @$pb.TagNumber(1)
  set event($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Room get room => $_getN(1);
  @$pb.TagNumber(2)
  set room($0.Room value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Room ensureRoom() => $_ensure(1);

  /// set when event is participant_* or track_*
  @$pb.TagNumber(3)
  $0.ParticipantInfo get participant => $_getN(2);
  @$pb.TagNumber(3)
  set participant($0.ParticipantInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasParticipant() => $_has(2);
  @$pb.TagNumber(3)
  void clearParticipant() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.ParticipantInfo ensureParticipant() => $_ensure(2);

  /// unique event uuid
  @$pb.TagNumber(6)
  $core.String get id => $_getSZ(3);
  @$pb.TagNumber(6)
  set id($core.String value) => $_setString(3, value);
  @$pb.TagNumber(6)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(6)
  void clearId() => $_clearField(6);

  /// timestamp in seconds
  @$pb.TagNumber(7)
  $fixnum.Int64 get createdAt => $_getI64(4);
  @$pb.TagNumber(7)
  set createdAt($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(7)
  void clearCreatedAt() => $_clearField(7);

  /// set when event is track_*
  @$pb.TagNumber(8)
  $0.TrackInfo get track => $_getN(5);
  @$pb.TagNumber(8)
  set track($0.TrackInfo value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasTrack() => $_has(5);
  @$pb.TagNumber(8)
  void clearTrack() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.TrackInfo ensureTrack() => $_ensure(5);

  /// set when event is egress_*
  @$pb.TagNumber(9)
  $1.EgressInfo get egressInfo => $_getN(6);
  @$pb.TagNumber(9)
  set egressInfo($1.EgressInfo value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasEgressInfo() => $_has(6);
  @$pb.TagNumber(9)
  void clearEgressInfo() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.EgressInfo ensureEgressInfo() => $_ensure(6);

  /// set when event is ingress_*
  @$pb.TagNumber(10)
  $2.IngressInfo get ingressInfo => $_getN(7);
  @$pb.TagNumber(10)
  set ingressInfo($2.IngressInfo value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasIngressInfo() => $_has(7);
  @$pb.TagNumber(10)
  void clearIngressInfo() => $_clearField(10);
  @$pb.TagNumber(10)
  $2.IngressInfo ensureIngressInfo() => $_ensure(7);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  $core.int get numDropped => $_getIZ(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  set numDropped($core.int value) => $_setSignedInt32(8, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  $core.bool hasNumDropped() => $_has(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  void clearNumDropped() => $_clearField(11);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
