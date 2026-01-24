// This is a generated file - do not edit.
//
// Generated from livekit_connector_whatsapp.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_agent_dispatch.pb.dart' as $0;
import 'livekit_connector_whatsapp.pbenum.dart';
import 'livekit_rtc.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'livekit_connector_whatsapp.pbenum.dart';

class DialWhatsAppCallRequest extends $pb.GeneratedMessage {
  factory DialWhatsAppCallRequest({
    $core.String? whatsappPhoneNumberId,
    $core.String? whatsappToPhoneNumber,
    $core.String? whatsappApiKey,
    $core.String? whatsappBizOpaqueCallbackData,
    $core.String? roomName,
    $core.Iterable<$0.RoomAgentDispatch>? agents,
    $core.String? participantIdentity,
    $core.String? participantName,
    $core.String? participantMetadata,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        participantAttributes,
    $core.String? destinationCountry,
    $core.String? whatsappCloudApiVersion,
  }) {
    final result = create();
    if (whatsappPhoneNumberId != null)
      result.whatsappPhoneNumberId = whatsappPhoneNumberId;
    if (whatsappToPhoneNumber != null)
      result.whatsappToPhoneNumber = whatsappToPhoneNumber;
    if (whatsappApiKey != null) result.whatsappApiKey = whatsappApiKey;
    if (whatsappBizOpaqueCallbackData != null)
      result.whatsappBizOpaqueCallbackData = whatsappBizOpaqueCallbackData;
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
    if (whatsappCloudApiVersion != null)
      result.whatsappCloudApiVersion = whatsappCloudApiVersion;
    return result;
  }

  DialWhatsAppCallRequest._();

  factory DialWhatsAppCallRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DialWhatsAppCallRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DialWhatsAppCallRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'whatsappPhoneNumberId')
    ..aOS(2, _omitFieldNames ? '' : 'whatsappToPhoneNumber')
    ..aOS(3, _omitFieldNames ? '' : 'whatsappApiKey')
    ..aOS(4, _omitFieldNames ? '' : 'whatsappBizOpaqueCallbackData')
    ..aOS(5, _omitFieldNames ? '' : 'roomName')
    ..pPM<$0.RoomAgentDispatch>(6, _omitFieldNames ? '' : 'agents',
        subBuilder: $0.RoomAgentDispatch.create)
    ..aOS(7, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(8, _omitFieldNames ? '' : 'participantName')
    ..aOS(9, _omitFieldNames ? '' : 'participantMetadata')
    ..m<$core.String, $core.String>(
        10, _omitFieldNames ? '' : 'participantAttributes',
        entryClassName: 'DialWhatsAppCallRequest.ParticipantAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOS(11, _omitFieldNames ? '' : 'destinationCountry')
    ..aOS(12, _omitFieldNames ? '' : 'whatsappCloudApiVersion')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DialWhatsAppCallRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DialWhatsAppCallRequest copyWith(
          void Function(DialWhatsAppCallRequest) updates) =>
      super.copyWith((message) => updates(message as DialWhatsAppCallRequest))
          as DialWhatsAppCallRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DialWhatsAppCallRequest create() => DialWhatsAppCallRequest._();
  @$core.override
  DialWhatsAppCallRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DialWhatsAppCallRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DialWhatsAppCallRequest>(create);
  static DialWhatsAppCallRequest? _defaultInstance;

  /// Required - The number of the business that is initiating the call
  @$pb.TagNumber(1)
  $core.String get whatsappPhoneNumberId => $_getSZ(0);
  @$pb.TagNumber(1)
  set whatsappPhoneNumberId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWhatsappPhoneNumberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhatsappPhoneNumberId() => $_clearField(1);

  /// Required - The number of the user that is supossed to receive the call
  @$pb.TagNumber(2)
  $core.String get whatsappToPhoneNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set whatsappToPhoneNumber($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWhatsappToPhoneNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearWhatsappToPhoneNumber() => $_clearField(2);

  /// Required - The API key of the business that is initiating the call
  @$pb.TagNumber(3)
  $core.String get whatsappApiKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set whatsappApiKey($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWhatsappApiKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearWhatsappApiKey() => $_clearField(3);

  /// Optional - An arbitrary string you can pass in that is useful for tracking and logging purposes.
  @$pb.TagNumber(4)
  $core.String get whatsappBizOpaqueCallbackData => $_getSZ(3);
  @$pb.TagNumber(4)
  set whatsappBizOpaqueCallbackData($core.String value) =>
      $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWhatsappBizOpaqueCallbackData() => $_has(3);
  @$pb.TagNumber(4)
  void clearWhatsappBizOpaqueCallbackData() => $_clearField(4);

  /// Optional - What LiveKit room should this participant be connected too
  @$pb.TagNumber(5)
  $core.String get roomName => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRoomName() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomName() => $_clearField(5);

  /// Optional - Agents to dispatch the call to
  @$pb.TagNumber(6)
  $pb.PbList<$0.RoomAgentDispatch> get agents => $_getList(5);

  /// Optional - Identity of the participant in LiveKit room
  @$pb.TagNumber(7)
  $core.String get participantIdentity => $_getSZ(6);
  @$pb.TagNumber(7)
  set participantIdentity($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasParticipantIdentity() => $_has(6);
  @$pb.TagNumber(7)
  void clearParticipantIdentity() => $_clearField(7);

  /// Optional - Name of the participant in LiveKit room
  @$pb.TagNumber(8)
  $core.String get participantName => $_getSZ(7);
  @$pb.TagNumber(8)
  set participantName($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasParticipantName() => $_has(7);
  @$pb.TagNumber(8)
  void clearParticipantName() => $_clearField(8);

  /// Optional - User-defined metadata. Will be attached to a created Participant in the room.
  @$pb.TagNumber(9)
  $core.String get participantMetadata => $_getSZ(8);
  @$pb.TagNumber(9)
  set participantMetadata($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasParticipantMetadata() => $_has(8);
  @$pb.TagNumber(9)
  void clearParticipantMetadata() => $_clearField(9);

  /// Optional - User-defined attributes. Will be attached to a created Participant in the room.
  @$pb.TagNumber(10)
  $pb.PbMap<$core.String, $core.String> get participantAttributes =>
      $_getMap(9);

  /// Optional - Country where the call terminates as ISO 3166-1 alpha-2 (https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). This will be used by the livekit infrastructure to route calls.
  @$pb.TagNumber(11)
  $core.String get destinationCountry => $_getSZ(10);
  @$pb.TagNumber(11)
  set destinationCountry($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasDestinationCountry() => $_has(10);
  @$pb.TagNumber(11)
  void clearDestinationCountry() => $_clearField(11);

  /// Required - WhatsApp Cloud API version, eg: 23.0, 24.0, etc.
  @$pb.TagNumber(12)
  $core.String get whatsappCloudApiVersion => $_getSZ(11);
  @$pb.TagNumber(12)
  set whatsappCloudApiVersion($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasWhatsappCloudApiVersion() => $_has(11);
  @$pb.TagNumber(12)
  void clearWhatsappCloudApiVersion() => $_clearField(12);
}

class DialWhatsAppCallResponse extends $pb.GeneratedMessage {
  factory DialWhatsAppCallResponse({
    $core.String? whatsappCallId,
    $core.String? roomName,
  }) {
    final result = create();
    if (whatsappCallId != null) result.whatsappCallId = whatsappCallId;
    if (roomName != null) result.roomName = roomName;
    return result;
  }

  DialWhatsAppCallResponse._();

  factory DialWhatsAppCallResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DialWhatsAppCallResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DialWhatsAppCallResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'whatsappCallId')
    ..aOS(2, _omitFieldNames ? '' : 'roomName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DialWhatsAppCallResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DialWhatsAppCallResponse copyWith(
          void Function(DialWhatsAppCallResponse) updates) =>
      super.copyWith((message) => updates(message as DialWhatsAppCallResponse))
          as DialWhatsAppCallResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DialWhatsAppCallResponse create() => DialWhatsAppCallResponse._();
  @$core.override
  DialWhatsAppCallResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DialWhatsAppCallResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DialWhatsAppCallResponse>(create);
  static DialWhatsAppCallResponse? _defaultInstance;

  /// Call ID sent by Meta
  @$pb.TagNumber(1)
  $core.String get whatsappCallId => $_getSZ(0);
  @$pb.TagNumber(1)
  set whatsappCallId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWhatsappCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhatsappCallId() => $_clearField(1);

  /// The name of the LiveKit room that the call is connected to
  @$pb.TagNumber(2)
  $core.String get roomName => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomName() => $_clearField(2);
}

class DisconnectWhatsAppCallRequest extends $pb.GeneratedMessage {
  factory DisconnectWhatsAppCallRequest({
    $core.String? whatsappCallId,
    $core.String? whatsappApiKey,
  }) {
    final result = create();
    if (whatsappCallId != null) result.whatsappCallId = whatsappCallId;
    if (whatsappApiKey != null) result.whatsappApiKey = whatsappApiKey;
    return result;
  }

  DisconnectWhatsAppCallRequest._();

  factory DisconnectWhatsAppCallRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DisconnectWhatsAppCallRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DisconnectWhatsAppCallRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'whatsappCallId')
    ..aOS(2, _omitFieldNames ? '' : 'whatsappApiKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisconnectWhatsAppCallRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisconnectWhatsAppCallRequest copyWith(
          void Function(DisconnectWhatsAppCallRequest) updates) =>
      super.copyWith(
              (message) => updates(message as DisconnectWhatsAppCallRequest))
          as DisconnectWhatsAppCallRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisconnectWhatsAppCallRequest create() =>
      DisconnectWhatsAppCallRequest._();
  @$core.override
  DisconnectWhatsAppCallRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DisconnectWhatsAppCallRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DisconnectWhatsAppCallRequest>(create);
  static DisconnectWhatsAppCallRequest? _defaultInstance;

  /// Required - Call ID sent by Meta
  @$pb.TagNumber(1)
  $core.String get whatsappCallId => $_getSZ(0);
  @$pb.TagNumber(1)
  set whatsappCallId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWhatsappCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhatsappCallId() => $_clearField(1);

  /// Required - The API key of the business that is disconnecting the call
  @$pb.TagNumber(2)
  $core.String get whatsappApiKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set whatsappApiKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWhatsappApiKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearWhatsappApiKey() => $_clearField(2);
}

class DisconnectWhatsAppCallResponse extends $pb.GeneratedMessage {
  factory DisconnectWhatsAppCallResponse() => create();

  DisconnectWhatsAppCallResponse._();

  factory DisconnectWhatsAppCallResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DisconnectWhatsAppCallResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DisconnectWhatsAppCallResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisconnectWhatsAppCallResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisconnectWhatsAppCallResponse copyWith(
          void Function(DisconnectWhatsAppCallResponse) updates) =>
      super.copyWith(
              (message) => updates(message as DisconnectWhatsAppCallResponse))
          as DisconnectWhatsAppCallResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisconnectWhatsAppCallResponse create() =>
      DisconnectWhatsAppCallResponse._();
  @$core.override
  DisconnectWhatsAppCallResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DisconnectWhatsAppCallResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DisconnectWhatsAppCallResponse>(create);
  static DisconnectWhatsAppCallResponse? _defaultInstance;
}

class ConnectWhatsAppCallRequest extends $pb.GeneratedMessage {
  factory ConnectWhatsAppCallRequest({
    $core.String? whatsappCallId,
    $1.SessionDescription? sdp,
  }) {
    final result = create();
    if (whatsappCallId != null) result.whatsappCallId = whatsappCallId;
    if (sdp != null) result.sdp = sdp;
    return result;
  }

  ConnectWhatsAppCallRequest._();

  factory ConnectWhatsAppCallRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConnectWhatsAppCallRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConnectWhatsAppCallRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'whatsappCallId')
    ..aOM<$1.SessionDescription>(2, _omitFieldNames ? '' : 'sdp',
        subBuilder: $1.SessionDescription.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectWhatsAppCallRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectWhatsAppCallRequest copyWith(
          void Function(ConnectWhatsAppCallRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ConnectWhatsAppCallRequest))
          as ConnectWhatsAppCallRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectWhatsAppCallRequest create() => ConnectWhatsAppCallRequest._();
  @$core.override
  ConnectWhatsAppCallRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConnectWhatsAppCallRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectWhatsAppCallRequest>(create);
  static ConnectWhatsAppCallRequest? _defaultInstance;

  /// Required - Call ID sent by Meta
  @$pb.TagNumber(1)
  $core.String get whatsappCallId => $_getSZ(0);
  @$pb.TagNumber(1)
  set whatsappCallId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWhatsappCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhatsappCallId() => $_clearField(1);

  /// Required - The call connect webhook comes with SDP from Meta
  /// It is the answer SDP for a business initiated call
  @$pb.TagNumber(2)
  $1.SessionDescription get sdp => $_getN(1);
  @$pb.TagNumber(2)
  set sdp($1.SessionDescription value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSdp() => $_has(1);
  @$pb.TagNumber(2)
  void clearSdp() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.SessionDescription ensureSdp() => $_ensure(1);
}

class ConnectWhatsAppCallResponse extends $pb.GeneratedMessage {
  factory ConnectWhatsAppCallResponse() => create();

  ConnectWhatsAppCallResponse._();

  factory ConnectWhatsAppCallResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConnectWhatsAppCallResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConnectWhatsAppCallResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectWhatsAppCallResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectWhatsAppCallResponse copyWith(
          void Function(ConnectWhatsAppCallResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ConnectWhatsAppCallResponse))
          as ConnectWhatsAppCallResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectWhatsAppCallResponse create() =>
      ConnectWhatsAppCallResponse._();
  @$core.override
  ConnectWhatsAppCallResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConnectWhatsAppCallResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectWhatsAppCallResponse>(create);
  static ConnectWhatsAppCallResponse? _defaultInstance;
}

class AcceptWhatsAppCallRequest extends $pb.GeneratedMessage {
  factory AcceptWhatsAppCallRequest({
    $core.String? whatsappPhoneNumberId,
    $core.String? whatsappApiKey,
    $core.String? whatsappCallId,
    $core.String? whatsappBizOpaqueCallbackData,
    $1.SessionDescription? sdp,
    $core.String? roomName,
    $core.Iterable<$0.RoomAgentDispatch>? agents,
    $core.String? participantIdentity,
    $core.String? participantName,
    $core.String? participantMetadata,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        participantAttributes,
    $core.String? destinationCountry,
    $core.String? whatsappCloudApiVersion,
  }) {
    final result = create();
    if (whatsappPhoneNumberId != null)
      result.whatsappPhoneNumberId = whatsappPhoneNumberId;
    if (whatsappApiKey != null) result.whatsappApiKey = whatsappApiKey;
    if (whatsappCallId != null) result.whatsappCallId = whatsappCallId;
    if (whatsappBizOpaqueCallbackData != null)
      result.whatsappBizOpaqueCallbackData = whatsappBizOpaqueCallbackData;
    if (sdp != null) result.sdp = sdp;
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
    if (whatsappCloudApiVersion != null)
      result.whatsappCloudApiVersion = whatsappCloudApiVersion;
    return result;
  }

  AcceptWhatsAppCallRequest._();

  factory AcceptWhatsAppCallRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AcceptWhatsAppCallRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AcceptWhatsAppCallRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'whatsappPhoneNumberId')
    ..aOS(2, _omitFieldNames ? '' : 'whatsappApiKey')
    ..aOS(3, _omitFieldNames ? '' : 'whatsappCallId')
    ..aOS(4, _omitFieldNames ? '' : 'whatsappBizOpaqueCallbackData')
    ..aOM<$1.SessionDescription>(5, _omitFieldNames ? '' : 'sdp',
        subBuilder: $1.SessionDescription.create)
    ..aOS(6, _omitFieldNames ? '' : 'roomName')
    ..pPM<$0.RoomAgentDispatch>(7, _omitFieldNames ? '' : 'agents',
        subBuilder: $0.RoomAgentDispatch.create)
    ..aOS(8, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(9, _omitFieldNames ? '' : 'participantName')
    ..aOS(10, _omitFieldNames ? '' : 'participantMetadata')
    ..m<$core.String, $core.String>(
        11, _omitFieldNames ? '' : 'participantAttributes',
        entryClassName: 'AcceptWhatsAppCallRequest.ParticipantAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOS(12, _omitFieldNames ? '' : 'destinationCountry')
    ..aOS(13, _omitFieldNames ? '' : 'whatsappCloudApiVersion')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AcceptWhatsAppCallRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AcceptWhatsAppCallRequest copyWith(
          void Function(AcceptWhatsAppCallRequest) updates) =>
      super.copyWith((message) => updates(message as AcceptWhatsAppCallRequest))
          as AcceptWhatsAppCallRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AcceptWhatsAppCallRequest create() => AcceptWhatsAppCallRequest._();
  @$core.override
  AcceptWhatsAppCallRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AcceptWhatsAppCallRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AcceptWhatsAppCallRequest>(create);
  static AcceptWhatsAppCallRequest? _defaultInstance;

  /// Required - The number of the business that is conencting the call
  @$pb.TagNumber(1)
  $core.String get whatsappPhoneNumberId => $_getSZ(0);
  @$pb.TagNumber(1)
  set whatsappPhoneNumberId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWhatsappPhoneNumberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhatsappPhoneNumberId() => $_clearField(1);

  /// Required - The API key of the business that is connecting the call
  @$pb.TagNumber(2)
  $core.String get whatsappApiKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set whatsappApiKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWhatsappApiKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearWhatsappApiKey() => $_clearField(2);

  /// Required - Call ID sent by Meta
  @$pb.TagNumber(3)
  $core.String get whatsappCallId => $_getSZ(2);
  @$pb.TagNumber(3)
  set whatsappCallId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWhatsappCallId() => $_has(2);
  @$pb.TagNumber(3)
  void clearWhatsappCallId() => $_clearField(3);

  /// Optional - An arbitrary string you can pass in that is useful for tracking and logging purposes.
  @$pb.TagNumber(4)
  $core.String get whatsappBizOpaqueCallbackData => $_getSZ(3);
  @$pb.TagNumber(4)
  set whatsappBizOpaqueCallbackData($core.String value) =>
      $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWhatsappBizOpaqueCallbackData() => $_has(3);
  @$pb.TagNumber(4)
  void clearWhatsappBizOpaqueCallbackData() => $_clearField(4);

  /// Required - The call accept webhook comes with SDP from Meta
  /// It is the for a user initiated call
  @$pb.TagNumber(5)
  $1.SessionDescription get sdp => $_getN(4);
  @$pb.TagNumber(5)
  set sdp($1.SessionDescription value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSdp() => $_has(4);
  @$pb.TagNumber(5)
  void clearSdp() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.SessionDescription ensureSdp() => $_ensure(4);

  /// Optional - What LiveKit room should this participant be connected too
  @$pb.TagNumber(6)
  $core.String get roomName => $_getSZ(5);
  @$pb.TagNumber(6)
  set roomName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRoomName() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomName() => $_clearField(6);

  /// Optional - Agents to dispatch the call to
  @$pb.TagNumber(7)
  $pb.PbList<$0.RoomAgentDispatch> get agents => $_getList(6);

  /// Optional - Identity of the participant in LiveKit room
  @$pb.TagNumber(8)
  $core.String get participantIdentity => $_getSZ(7);
  @$pb.TagNumber(8)
  set participantIdentity($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasParticipantIdentity() => $_has(7);
  @$pb.TagNumber(8)
  void clearParticipantIdentity() => $_clearField(8);

  /// Optional - Name of the participant in LiveKit room
  @$pb.TagNumber(9)
  $core.String get participantName => $_getSZ(8);
  @$pb.TagNumber(9)
  set participantName($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasParticipantName() => $_has(8);
  @$pb.TagNumber(9)
  void clearParticipantName() => $_clearField(9);

  /// Optional - User-defined metadata. Will be attached to a created Participant in the room.
  @$pb.TagNumber(10)
  $core.String get participantMetadata => $_getSZ(9);
  @$pb.TagNumber(10)
  set participantMetadata($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasParticipantMetadata() => $_has(9);
  @$pb.TagNumber(10)
  void clearParticipantMetadata() => $_clearField(10);

  /// Optional - User-defined attributes. Will be attached to a created Participant in the room.
  @$pb.TagNumber(11)
  $pb.PbMap<$core.String, $core.String> get participantAttributes =>
      $_getMap(10);

  /// Optional - Country where the call terminates as ISO 3166-1 alpha-2 (https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). This will be used by the livekit infrastructure to route calls.
  @$pb.TagNumber(12)
  $core.String get destinationCountry => $_getSZ(11);
  @$pb.TagNumber(12)
  set destinationCountry($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasDestinationCountry() => $_has(11);
  @$pb.TagNumber(12)
  void clearDestinationCountry() => $_clearField(12);

  /// Required - WhatsApp Cloud API version, eg: 23.0, 24.0, etc.
  @$pb.TagNumber(13)
  $core.String get whatsappCloudApiVersion => $_getSZ(12);
  @$pb.TagNumber(13)
  set whatsappCloudApiVersion($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasWhatsappCloudApiVersion() => $_has(12);
  @$pb.TagNumber(13)
  void clearWhatsappCloudApiVersion() => $_clearField(13);
}

class AcceptWhatsAppCallResponse extends $pb.GeneratedMessage {
  factory AcceptWhatsAppCallResponse({
    $core.String? roomName,
  }) {
    final result = create();
    if (roomName != null) result.roomName = roomName;
    return result;
  }

  AcceptWhatsAppCallResponse._();

  factory AcceptWhatsAppCallResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AcceptWhatsAppCallResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AcceptWhatsAppCallResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AcceptWhatsAppCallResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AcceptWhatsAppCallResponse copyWith(
          void Function(AcceptWhatsAppCallResponse) updates) =>
      super.copyWith(
              (message) => updates(message as AcceptWhatsAppCallResponse))
          as AcceptWhatsAppCallResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AcceptWhatsAppCallResponse create() => AcceptWhatsAppCallResponse._();
  @$core.override
  AcceptWhatsAppCallResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AcceptWhatsAppCallResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AcceptWhatsAppCallResponse>(create);
  static AcceptWhatsAppCallResponse? _defaultInstance;

  /// The name of the LiveKit room that the call is connected to
  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => $_clearField(1);
}

class WhatsAppCall extends $pb.GeneratedMessage {
  factory WhatsAppCall({
    $core.String? whatsappCallId,
    WhatsAppCallDirection? direction,
  }) {
    final result = create();
    if (whatsappCallId != null) result.whatsappCallId = whatsappCallId;
    if (direction != null) result.direction = direction;
    return result;
  }

  WhatsAppCall._();

  factory WhatsAppCall.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhatsAppCall.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhatsAppCall',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'whatsappCallId')
    ..aE<WhatsAppCallDirection>(2, _omitFieldNames ? '' : 'direction',
        enumValues: WhatsAppCallDirection.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhatsAppCall clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhatsAppCall copyWith(void Function(WhatsAppCall) updates) =>
      super.copyWith((message) => updates(message as WhatsAppCall))
          as WhatsAppCall;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhatsAppCall create() => WhatsAppCall._();
  @$core.override
  WhatsAppCall createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WhatsAppCall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WhatsAppCall>(create);
  static WhatsAppCall? _defaultInstance;

  /// list of call ids that are currently active
  @$pb.TagNumber(1)
  $core.String get whatsappCallId => $_getSZ(0);
  @$pb.TagNumber(1)
  set whatsappCallId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWhatsappCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhatsappCallId() => $_clearField(1);

  /// Direction of the call
  @$pb.TagNumber(2)
  WhatsAppCallDirection get direction => $_getN(1);
  @$pb.TagNumber(2)
  set direction(WhatsAppCallDirection value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDirection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirection() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
