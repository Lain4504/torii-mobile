// This is a generated file - do not edit.
//
// Generated from livekit_connector_twilio.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_agent_dispatch.pb.dart' as $0;
import 'livekit_connector_twilio.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'livekit_connector_twilio.pbenum.dart';

class ConnectTwilioCallRequest extends $pb.GeneratedMessage {
  factory ConnectTwilioCallRequest({
    ConnectTwilioCallRequest_TwilioCallDirection? twilioCallDirection,
    $core.String? roomName,
    $core.Iterable<$0.RoomAgentDispatch>? agents,
    $core.String? participantIdentity,
    $core.String? participantName,
    $core.String? participantMetadata,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        participantAttributes,
    $core.String? destinationCountry,
  }) {
    final result = create();
    if (twilioCallDirection != null)
      result.twilioCallDirection = twilioCallDirection;
    if (roomName != null) result.roomName = roomName;
    if (agents != null) result.agents.addAll(agents);
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (participantName != null) result.participantName = participantName;
    if (participantMetadata != null)
      result.participantMetadata = participantMetadata;
    if (participantAttributes != null)
      result.participantAttributes.addEntries(participantAttributes);
    if (destinationCountry != null)
      result.destinationCountry = destinationCountry;
    return result;
  }

  ConnectTwilioCallRequest._();

  factory ConnectTwilioCallRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConnectTwilioCallRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConnectTwilioCallRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aE<ConnectTwilioCallRequest_TwilioCallDirection>(
        1, _omitFieldNames ? '' : 'twilioCallDirection',
        enumValues: ConnectTwilioCallRequest_TwilioCallDirection.values)
    ..aOS(2, _omitFieldNames ? '' : 'roomName')
    ..pPM<$0.RoomAgentDispatch>(3, _omitFieldNames ? '' : 'agents',
        subBuilder: $0.RoomAgentDispatch.create)
    ..aOS(4, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(5, _omitFieldNames ? '' : 'participantName')
    ..aOS(6, _omitFieldNames ? '' : 'participantMetadata')
    ..m<$core.String, $core.String>(
        7, _omitFieldNames ? '' : 'participantAttributes',
        entryClassName: 'ConnectTwilioCallRequest.ParticipantAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOS(8, _omitFieldNames ? '' : 'destinationCountry')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectTwilioCallRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectTwilioCallRequest copyWith(
          void Function(ConnectTwilioCallRequest) updates) =>
      super.copyWith((message) => updates(message as ConnectTwilioCallRequest))
          as ConnectTwilioCallRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectTwilioCallRequest create() => ConnectTwilioCallRequest._();
  @$core.override
  ConnectTwilioCallRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConnectTwilioCallRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectTwilioCallRequest>(create);
  static ConnectTwilioCallRequest? _defaultInstance;

  /// The Direction of the call
  @$pb.TagNumber(1)
  ConnectTwilioCallRequest_TwilioCallDirection get twilioCallDirection =>
      $_getN(0);
  @$pb.TagNumber(1)
  set twilioCallDirection(ConnectTwilioCallRequest_TwilioCallDirection value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTwilioCallDirection() => $_has(0);
  @$pb.TagNumber(1)
  void clearTwilioCallDirection() => $_clearField(1);

  /// What LiveKit room should this call be connected to
  @$pb.TagNumber(2)
  $core.String get roomName => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomName() => $_clearField(2);

  /// Optional agents to dispatch the call to
  @$pb.TagNumber(3)
  $pb.PbList<$0.RoomAgentDispatch> get agents => $_getList(2);

  /// Optional identity of the participant in LiveKit room
  @$pb.TagNumber(4)
  $core.String get participantIdentity => $_getSZ(3);
  @$pb.TagNumber(4)
  set participantIdentity($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasParticipantIdentity() => $_has(3);
  @$pb.TagNumber(4)
  void clearParticipantIdentity() => $_clearField(4);

  /// Optional name of the participant in LiveKit room
  @$pb.TagNumber(5)
  $core.String get participantName => $_getSZ(4);
  @$pb.TagNumber(5)
  set participantName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasParticipantName() => $_has(4);
  @$pb.TagNumber(5)
  void clearParticipantName() => $_clearField(5);

  /// Optional user-defined metadata. Will be attached to a created Participant in the room.
  @$pb.TagNumber(6)
  $core.String get participantMetadata => $_getSZ(5);
  @$pb.TagNumber(6)
  set participantMetadata($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasParticipantMetadata() => $_has(5);
  @$pb.TagNumber(6)
  void clearParticipantMetadata() => $_clearField(6);

  /// Optional user-defined attributes. Will be attached to a created Participant in the room.
  @$pb.TagNumber(7)
  $pb.PbMap<$core.String, $core.String> get participantAttributes =>
      $_getMap(6);

  /// Country where the call terminates as ISO 3166-1 alpha-2 (https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). This will be used by the livekit infrastructure to route calls.
  @$pb.TagNumber(8)
  $core.String get destinationCountry => $_getSZ(7);
  @$pb.TagNumber(8)
  set destinationCountry($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDestinationCountry() => $_has(7);
  @$pb.TagNumber(8)
  void clearDestinationCountry() => $_clearField(8);
}

class ConnectTwilioCallResponse extends $pb.GeneratedMessage {
  factory ConnectTwilioCallResponse({
    $core.String? connectUrl,
  }) {
    final result = create();
    if (connectUrl != null) result.connectUrl = connectUrl;
    return result;
  }

  ConnectTwilioCallResponse._();

  factory ConnectTwilioCallResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConnectTwilioCallResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConnectTwilioCallResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'connectUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectTwilioCallResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectTwilioCallResponse copyWith(
          void Function(ConnectTwilioCallResponse) updates) =>
      super.copyWith((message) => updates(message as ConnectTwilioCallResponse))
          as ConnectTwilioCallResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectTwilioCallResponse create() => ConnectTwilioCallResponse._();
  @$core.override
  ConnectTwilioCallResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConnectTwilioCallResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectTwilioCallResponse>(create);
  static ConnectTwilioCallResponse? _defaultInstance;

  /// The websocket URL which twilio media stream will connect to
  @$pb.TagNumber(1)
  $core.String get connectUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set connectUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConnectUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearConnectUrl() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
