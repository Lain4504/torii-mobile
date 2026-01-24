//
//  Generated code. Do not modify.
//  source: livekit_connector_twilio.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_agent_dispatch.pb.dart' as $6;
import 'livekit_connector_twilio.pbenum.dart';

export 'livekit_connector_twilio.pbenum.dart';

class ConnectTwilioCallRequest extends $pb.GeneratedMessage {
  factory ConnectTwilioCallRequest({
    ConnectTwilioCallRequest_TwilioCallDirection? twilioCallDirection,
    $core.String? roomName,
    $core.Iterable<$6.RoomAgentDispatch>? agents,
    $core.String? participantIdentity,
    $core.String? participantName,
    $core.String? participantMetadata,
    $core.Map<$core.String, $core.String>? participantAttributes,
    $core.String? destinationCountry,
  }) {
    final $result = create();
    if (twilioCallDirection != null) {
      $result.twilioCallDirection = twilioCallDirection;
    }
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (agents != null) {
      $result.agents.addAll(agents);
    }
    if (participantIdentity != null) {
      $result.participantIdentity = participantIdentity;
    }
    if (participantName != null) {
      $result.participantName = participantName;
    }
    if (participantMetadata != null) {
      $result.participantMetadata = participantMetadata;
    }
    if (participantAttributes != null) {
      $result.participantAttributes.addAll(participantAttributes);
    }
    if (destinationCountry != null) {
      $result.destinationCountry = destinationCountry;
    }
    return $result;
  }
  ConnectTwilioCallRequest._() : super();
  factory ConnectTwilioCallRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectTwilioCallRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConnectTwilioCallRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..e<ConnectTwilioCallRequest_TwilioCallDirection>(1, _omitFieldNames ? '' : 'twilioCallDirection', $pb.PbFieldType.OE, defaultOrMaker: ConnectTwilioCallRequest_TwilioCallDirection.TWILIO_CALL_DIRECTION_INBOUND, valueOf: ConnectTwilioCallRequest_TwilioCallDirection.valueOf, enumValues: ConnectTwilioCallRequest_TwilioCallDirection.values)
    ..aOS(2, _omitFieldNames ? '' : 'roomName')
    ..pc<$6.RoomAgentDispatch>(3, _omitFieldNames ? '' : 'agents', $pb.PbFieldType.PM, subBuilder: $6.RoomAgentDispatch.create)
    ..aOS(4, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(5, _omitFieldNames ? '' : 'participantName')
    ..aOS(6, _omitFieldNames ? '' : 'participantMetadata')
    ..m<$core.String, $core.String>(7, _omitFieldNames ? '' : 'participantAttributes', entryClassName: 'ConnectTwilioCallRequest.ParticipantAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..aOS(8, _omitFieldNames ? '' : 'destinationCountry')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectTwilioCallRequest clone() => ConnectTwilioCallRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectTwilioCallRequest copyWith(void Function(ConnectTwilioCallRequest) updates) => super.copyWith((message) => updates(message as ConnectTwilioCallRequest)) as ConnectTwilioCallRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectTwilioCallRequest create() => ConnectTwilioCallRequest._();
  ConnectTwilioCallRequest createEmptyInstance() => create();
  static $pb.PbList<ConnectTwilioCallRequest> createRepeated() => $pb.PbList<ConnectTwilioCallRequest>();
  @$core.pragma('dart2js:noInline')
  static ConnectTwilioCallRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectTwilioCallRequest>(create);
  static ConnectTwilioCallRequest? _defaultInstance;

  /// The Direction of the call
  @$pb.TagNumber(1)
  ConnectTwilioCallRequest_TwilioCallDirection get twilioCallDirection => $_getN(0);
  @$pb.TagNumber(1)
  set twilioCallDirection(ConnectTwilioCallRequest_TwilioCallDirection v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTwilioCallDirection() => $_has(0);
  @$pb.TagNumber(1)
  void clearTwilioCallDirection() => clearField(1);

  /// What LiveKit room should this call be connected to
  @$pb.TagNumber(2)
  $core.String get roomName => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomName() => clearField(2);

  /// Optional agents to dispatch the call to
  @$pb.TagNumber(3)
  $core.List<$6.RoomAgentDispatch> get agents => $_getList(2);

  /// Optional identity of the participant in LiveKit room
  @$pb.TagNumber(4)
  $core.String get participantIdentity => $_getSZ(3);
  @$pb.TagNumber(4)
  set participantIdentity($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasParticipantIdentity() => $_has(3);
  @$pb.TagNumber(4)
  void clearParticipantIdentity() => clearField(4);

  /// Optional name of the participant in LiveKit room
  @$pb.TagNumber(5)
  $core.String get participantName => $_getSZ(4);
  @$pb.TagNumber(5)
  set participantName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasParticipantName() => $_has(4);
  @$pb.TagNumber(5)
  void clearParticipantName() => clearField(5);

  /// Optional user-defined metadata. Will be attached to a created Participant in the room.
  @$pb.TagNumber(6)
  $core.String get participantMetadata => $_getSZ(5);
  @$pb.TagNumber(6)
  set participantMetadata($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasParticipantMetadata() => $_has(5);
  @$pb.TagNumber(6)
  void clearParticipantMetadata() => clearField(6);

  /// Optional user-defined attributes. Will be attached to a created Participant in the room.
  @$pb.TagNumber(7)
  $core.Map<$core.String, $core.String> get participantAttributes => $_getMap(6);

  /// Country where the call terminates as ISO 3166-1 alpha-2 (https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). This will be used by the livekit infrastructure to route calls.
  @$pb.TagNumber(8)
  $core.String get destinationCountry => $_getSZ(7);
  @$pb.TagNumber(8)
  set destinationCountry($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDestinationCountry() => $_has(7);
  @$pb.TagNumber(8)
  void clearDestinationCountry() => clearField(8);
}

class ConnectTwilioCallResponse extends $pb.GeneratedMessage {
  factory ConnectTwilioCallResponse({
    $core.String? connectUrl,
  }) {
    final $result = create();
    if (connectUrl != null) {
      $result.connectUrl = connectUrl;
    }
    return $result;
  }
  ConnectTwilioCallResponse._() : super();
  factory ConnectTwilioCallResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectTwilioCallResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConnectTwilioCallResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'connectUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectTwilioCallResponse clone() => ConnectTwilioCallResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectTwilioCallResponse copyWith(void Function(ConnectTwilioCallResponse) updates) => super.copyWith((message) => updates(message as ConnectTwilioCallResponse)) as ConnectTwilioCallResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectTwilioCallResponse create() => ConnectTwilioCallResponse._();
  ConnectTwilioCallResponse createEmptyInstance() => create();
  static $pb.PbList<ConnectTwilioCallResponse> createRepeated() => $pb.PbList<ConnectTwilioCallResponse>();
  @$core.pragma('dart2js:noInline')
  static ConnectTwilioCallResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectTwilioCallResponse>(create);
  static ConnectTwilioCallResponse? _defaultInstance;

  /// The websocket URL which twilio media stream will connect to
  @$pb.TagNumber(1)
  $core.String get connectUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set connectUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConnectUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearConnectUrl() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
