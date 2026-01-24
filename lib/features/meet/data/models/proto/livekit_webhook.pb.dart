//
//  Generated code. Do not modify.
//  source: livekit_webhook.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_egress.pb.dart' as $7;
import 'livekit_ingress.pb.dart' as $8;
import 'livekit_models.pb.dart' as $2;

class WebhookEvent extends $pb.GeneratedMessage {
  factory WebhookEvent({
    $core.String? event,
    $2.Room? room,
    $2.ParticipantInfo? participant,
    $core.String? id,
    $fixnum.Int64? createdAt,
    $2.TrackInfo? track,
    $7.EgressInfo? egressInfo,
    $8.IngressInfo? ingressInfo,
  @$core.Deprecated('This field is deprecated.')
    $core.int? numDropped,
  }) {
    final $result = create();
    if (event != null) {
      $result.event = event;
    }
    if (room != null) {
      $result.room = room;
    }
    if (participant != null) {
      $result.participant = participant;
    }
    if (id != null) {
      $result.id = id;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (track != null) {
      $result.track = track;
    }
    if (egressInfo != null) {
      $result.egressInfo = egressInfo;
    }
    if (ingressInfo != null) {
      $result.ingressInfo = ingressInfo;
    }
    if (numDropped != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.numDropped = numDropped;
    }
    return $result;
  }
  WebhookEvent._() : super();
  factory WebhookEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WebhookEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WebhookEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'event')
    ..aOM<$2.Room>(2, _omitFieldNames ? '' : 'room', subBuilder: $2.Room.create)
    ..aOM<$2.ParticipantInfo>(3, _omitFieldNames ? '' : 'participant', subBuilder: $2.ParticipantInfo.create)
    ..aOS(6, _omitFieldNames ? '' : 'id')
    ..aInt64(7, _omitFieldNames ? '' : 'createdAt')
    ..aOM<$2.TrackInfo>(8, _omitFieldNames ? '' : 'track', subBuilder: $2.TrackInfo.create)
    ..aOM<$7.EgressInfo>(9, _omitFieldNames ? '' : 'egressInfo', subBuilder: $7.EgressInfo.create)
    ..aOM<$8.IngressInfo>(10, _omitFieldNames ? '' : 'ingressInfo', subBuilder: $8.IngressInfo.create)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'numDropped', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WebhookEvent clone() => WebhookEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WebhookEvent copyWith(void Function(WebhookEvent) updates) => super.copyWith((message) => updates(message as WebhookEvent)) as WebhookEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WebhookEvent create() => WebhookEvent._();
  WebhookEvent createEmptyInstance() => create();
  static $pb.PbList<WebhookEvent> createRepeated() => $pb.PbList<WebhookEvent>();
  @$core.pragma('dart2js:noInline')
  static WebhookEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WebhookEvent>(create);
  static WebhookEvent? _defaultInstance;

  /// one of room_started, room_finished, participant_joined, participant_left, participant_connection_aborted,
  /// track_published, track_unpublished, egress_started, egress_updated, egress_ended,
  /// ingress_started, ingress_ended
  @$pb.TagNumber(1)
  $core.String get event => $_getSZ(0);
  @$pb.TagNumber(1)
  set event($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);

  @$pb.TagNumber(2)
  $2.Room get room => $_getN(1);
  @$pb.TagNumber(2)
  set room($2.Room v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => clearField(2);
  @$pb.TagNumber(2)
  $2.Room ensureRoom() => $_ensure(1);

  /// set when event is participant_* or track_*
  @$pb.TagNumber(3)
  $2.ParticipantInfo get participant => $_getN(2);
  @$pb.TagNumber(3)
  set participant($2.ParticipantInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasParticipant() => $_has(2);
  @$pb.TagNumber(3)
  void clearParticipant() => clearField(3);
  @$pb.TagNumber(3)
  $2.ParticipantInfo ensureParticipant() => $_ensure(2);

  /// unique event uuid
  @$pb.TagNumber(6)
  $core.String get id => $_getSZ(3);
  @$pb.TagNumber(6)
  set id($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(6)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(6)
  void clearId() => clearField(6);

  /// timestamp in seconds
  @$pb.TagNumber(7)
  $fixnum.Int64 get createdAt => $_getI64(4);
  @$pb.TagNumber(7)
  set createdAt($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);

  /// set when event is track_*
  @$pb.TagNumber(8)
  $2.TrackInfo get track => $_getN(5);
  @$pb.TagNumber(8)
  set track($2.TrackInfo v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasTrack() => $_has(5);
  @$pb.TagNumber(8)
  void clearTrack() => clearField(8);
  @$pb.TagNumber(8)
  $2.TrackInfo ensureTrack() => $_ensure(5);

  /// set when event is egress_*
  @$pb.TagNumber(9)
  $7.EgressInfo get egressInfo => $_getN(6);
  @$pb.TagNumber(9)
  set egressInfo($7.EgressInfo v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasEgressInfo() => $_has(6);
  @$pb.TagNumber(9)
  void clearEgressInfo() => clearField(9);
  @$pb.TagNumber(9)
  $7.EgressInfo ensureEgressInfo() => $_ensure(6);

  /// set when event is ingress_*
  @$pb.TagNumber(10)
  $8.IngressInfo get ingressInfo => $_getN(7);
  @$pb.TagNumber(10)
  set ingressInfo($8.IngressInfo v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasIngressInfo() => $_has(7);
  @$pb.TagNumber(10)
  void clearIngressInfo() => clearField(10);
  @$pb.TagNumber(10)
  $8.IngressInfo ensureIngressInfo() => $_ensure(7);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  $core.int get numDropped => $_getIZ(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  set numDropped($core.int v) { $_setSignedInt32(8, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  $core.bool hasNumDropped() => $_has(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  void clearNumDropped() => clearField(11);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
