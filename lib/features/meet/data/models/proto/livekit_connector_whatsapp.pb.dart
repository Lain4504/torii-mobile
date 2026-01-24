//
//  Generated code. Do not modify.
//  source: livekit_connector_whatsapp.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_agent_dispatch.pb.dart' as $6;
import 'livekit_connector_whatsapp.pbenum.dart';
import 'livekit_rtc.pb.dart' as $14;

export 'livekit_connector_whatsapp.pbenum.dart';

class DialWhatsAppCallRequest extends $pb.GeneratedMessage {
  factory DialWhatsAppCallRequest({
    $core.String? whatsappPhoneNumberId,
    $core.String? whatsappToPhoneNumber,
    $core.String? whatsappApiKey,
    $core.String? whatsappBizOpaqueCallbackData,
    $core.String? roomName,
    $core.Iterable<$6.RoomAgentDispatch>? agents,
    $core.String? participantIdentity,
    $core.String? participantName,
    $core.String? participantMetadata,
    $core.Map<$core.String, $core.String>? participantAttributes,
    $core.String? destinationCountry,
    $core.String? whatsappCloudApiVersion,
  }) {
    final $result = create();
    if (whatsappPhoneNumberId != null) {
      $result.whatsappPhoneNumberId = whatsappPhoneNumberId;
    }
    if (whatsappToPhoneNumber != null) {
      $result.whatsappToPhoneNumber = whatsappToPhoneNumber;
    }
    if (whatsappApiKey != null) {
      $result.whatsappApiKey = whatsappApiKey;
    }
    if (whatsappBizOpaqueCallbackData != null) {
      $result.whatsappBizOpaqueCallbackData = whatsappBizOpaqueCallbackData;
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
    if (whatsappCloudApiVersion != null) {
      $result.whatsappCloudApiVersion = whatsappCloudApiVersion;
    }
    return $result;
  }
  DialWhatsAppCallRequest._() : super();
  factory DialWhatsAppCallRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DialWhatsAppCallRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DialWhatsAppCallRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'whatsappPhoneNumberId')
    ..aOS(2, _omitFieldNames ? '' : 'whatsappToPhoneNumber')
    ..aOS(3, _omitFieldNames ? '' : 'whatsappApiKey')
    ..aOS(4, _omitFieldNames ? '' : 'whatsappBizOpaqueCallbackData')
    ..aOS(5, _omitFieldNames ? '' : 'roomName')
    ..pc<$6.RoomAgentDispatch>(6, _omitFieldNames ? '' : 'agents', $pb.PbFieldType.PM, subBuilder: $6.RoomAgentDispatch.create)
    ..aOS(7, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(8, _omitFieldNames ? '' : 'participantName')
    ..aOS(9, _omitFieldNames ? '' : 'participantMetadata')
    ..m<$core.String, $core.String>(10, _omitFieldNames ? '' : 'participantAttributes', entryClassName: 'DialWhatsAppCallRequest.ParticipantAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..aOS(11, _omitFieldNames ? '' : 'destinationCountry')
    ..aOS(12, _omitFieldNames ? '' : 'whatsappCloudApiVersion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DialWhatsAppCallRequest clone() => DialWhatsAppCallRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DialWhatsAppCallRequest copyWith(void Function(DialWhatsAppCallRequest) updates) => super.copyWith((message) => updates(message as DialWhatsAppCallRequest)) as DialWhatsAppCallRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DialWhatsAppCallRequest create() => DialWhatsAppCallRequest._();
  DialWhatsAppCallRequest createEmptyInstance() => create();
  static $pb.PbList<DialWhatsAppCallRequest> createRepeated() => $pb.PbList<DialWhatsAppCallRequest>();
  @$core.pragma('dart2js:noInline')
  static DialWhatsAppCallRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DialWhatsAppCallRequest>(create);
  static DialWhatsAppCallRequest? _defaultInstance;

  /// Required - The number of the business that is initiating the call
  @$pb.TagNumber(1)
  $core.String get whatsappPhoneNumberId => $_getSZ(0);
  @$pb.TagNumber(1)
  set whatsappPhoneNumberId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWhatsappPhoneNumberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhatsappPhoneNumberId() => clearField(1);

  /// Required - The number of the user that is supossed to receive the call
  @$pb.TagNumber(2)
  $core.String get whatsappToPhoneNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set whatsappToPhoneNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWhatsappToPhoneNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearWhatsappToPhoneNumber() => clearField(2);

  /// Required - The API key of the business that is initiating the call
  @$pb.TagNumber(3)
  $core.String get whatsappApiKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set whatsappApiKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWhatsappApiKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearWhatsappApiKey() => clearField(3);

  /// Optional - An arbitrary string you can pass in that is useful for tracking and logging purposes.
  @$pb.TagNumber(4)
  $core.String get whatsappBizOpaqueCallbackData => $_getSZ(3);
  @$pb.TagNumber(4)
  set whatsappBizOpaqueCallbackData($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWhatsappBizOpaqueCallbackData() => $_has(3);
  @$pb.TagNumber(4)
  void clearWhatsappBizOpaqueCallbackData() => clearField(4);

  /// Optional - What LiveKit room should this participant be connected too
  @$pb.TagNumber(5)
  $core.String get roomName => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRoomName() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomName() => clearField(5);

  /// Optional - Agents to dispatch the call to
  @$pb.TagNumber(6)
  $core.List<$6.RoomAgentDispatch> get agents => $_getList(5);

  /// Optional - Identity of the participant in LiveKit room
  @$pb.TagNumber(7)
  $core.String get participantIdentity => $_getSZ(6);
  @$pb.TagNumber(7)
  set participantIdentity($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasParticipantIdentity() => $_has(6);
  @$pb.TagNumber(7)
  void clearParticipantIdentity() => clearField(7);

  /// Optional - Name of the participant in LiveKit room
  @$pb.TagNumber(8)
  $core.String get participantName => $_getSZ(7);
  @$pb.TagNumber(8)
  set participantName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasParticipantName() => $_has(7);
  @$pb.TagNumber(8)
  void clearParticipantName() => clearField(8);

  /// Optional - User-defined metadata. Will be attached to a created Participant in the room.
  @$pb.TagNumber(9)
  $core.String get participantMetadata => $_getSZ(8);
  @$pb.TagNumber(9)
  set participantMetadata($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasParticipantMetadata() => $_has(8);
  @$pb.TagNumber(9)
  void clearParticipantMetadata() => clearField(9);

  /// Optional - User-defined attributes. Will be attached to a created Participant in the room.
  @$pb.TagNumber(10)
  $core.Map<$core.String, $core.String> get participantAttributes => $_getMap(9);

  /// Optional - Country where the call terminates as ISO 3166-1 alpha-2 (https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). This will be used by the livekit infrastructure to route calls.
  @$pb.TagNumber(11)
  $core.String get destinationCountry => $_getSZ(10);
  @$pb.TagNumber(11)
  set destinationCountry($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasDestinationCountry() => $_has(10);
  @$pb.TagNumber(11)
  void clearDestinationCountry() => clearField(11);

  /// Required - WhatsApp Cloud API version, eg: 23.0, 24.0, etc.
  @$pb.TagNumber(12)
  $core.String get whatsappCloudApiVersion => $_getSZ(11);
  @$pb.TagNumber(12)
  set whatsappCloudApiVersion($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasWhatsappCloudApiVersion() => $_has(11);
  @$pb.TagNumber(12)
  void clearWhatsappCloudApiVersion() => clearField(12);
}

class DialWhatsAppCallResponse extends $pb.GeneratedMessage {
  factory DialWhatsAppCallResponse({
    $core.String? whatsappCallId,
    $core.String? roomName,
  }) {
    final $result = create();
    if (whatsappCallId != null) {
      $result.whatsappCallId = whatsappCallId;
    }
    if (roomName != null) {
      $result.roomName = roomName;
    }
    return $result;
  }
  DialWhatsAppCallResponse._() : super();
  factory DialWhatsAppCallResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DialWhatsAppCallResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DialWhatsAppCallResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'whatsappCallId')
    ..aOS(2, _omitFieldNames ? '' : 'roomName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DialWhatsAppCallResponse clone() => DialWhatsAppCallResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DialWhatsAppCallResponse copyWith(void Function(DialWhatsAppCallResponse) updates) => super.copyWith((message) => updates(message as DialWhatsAppCallResponse)) as DialWhatsAppCallResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DialWhatsAppCallResponse create() => DialWhatsAppCallResponse._();
  DialWhatsAppCallResponse createEmptyInstance() => create();
  static $pb.PbList<DialWhatsAppCallResponse> createRepeated() => $pb.PbList<DialWhatsAppCallResponse>();
  @$core.pragma('dart2js:noInline')
  static DialWhatsAppCallResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DialWhatsAppCallResponse>(create);
  static DialWhatsAppCallResponse? _defaultInstance;

  /// Call ID sent by Meta
  @$pb.TagNumber(1)
  $core.String get whatsappCallId => $_getSZ(0);
  @$pb.TagNumber(1)
  set whatsappCallId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWhatsappCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhatsappCallId() => clearField(1);

  /// The name of the LiveKit room that the call is connected to
  @$pb.TagNumber(2)
  $core.String get roomName => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomName() => clearField(2);
}

class DisconnectWhatsAppCallRequest extends $pb.GeneratedMessage {
  factory DisconnectWhatsAppCallRequest({
    $core.String? whatsappCallId,
    $core.String? whatsappApiKey,
  }) {
    final $result = create();
    if (whatsappCallId != null) {
      $result.whatsappCallId = whatsappCallId;
    }
    if (whatsappApiKey != null) {
      $result.whatsappApiKey = whatsappApiKey;
    }
    return $result;
  }
  DisconnectWhatsAppCallRequest._() : super();
  factory DisconnectWhatsAppCallRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisconnectWhatsAppCallRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DisconnectWhatsAppCallRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'whatsappCallId')
    ..aOS(2, _omitFieldNames ? '' : 'whatsappApiKey')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisconnectWhatsAppCallRequest clone() => DisconnectWhatsAppCallRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisconnectWhatsAppCallRequest copyWith(void Function(DisconnectWhatsAppCallRequest) updates) => super.copyWith((message) => updates(message as DisconnectWhatsAppCallRequest)) as DisconnectWhatsAppCallRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisconnectWhatsAppCallRequest create() => DisconnectWhatsAppCallRequest._();
  DisconnectWhatsAppCallRequest createEmptyInstance() => create();
  static $pb.PbList<DisconnectWhatsAppCallRequest> createRepeated() => $pb.PbList<DisconnectWhatsAppCallRequest>();
  @$core.pragma('dart2js:noInline')
  static DisconnectWhatsAppCallRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisconnectWhatsAppCallRequest>(create);
  static DisconnectWhatsAppCallRequest? _defaultInstance;

  /// Required - Call ID sent by Meta
  @$pb.TagNumber(1)
  $core.String get whatsappCallId => $_getSZ(0);
  @$pb.TagNumber(1)
  set whatsappCallId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWhatsappCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhatsappCallId() => clearField(1);

  /// Required - The API key of the business that is disconnecting the call
  @$pb.TagNumber(2)
  $core.String get whatsappApiKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set whatsappApiKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWhatsappApiKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearWhatsappApiKey() => clearField(2);
}

class DisconnectWhatsAppCallResponse extends $pb.GeneratedMessage {
  factory DisconnectWhatsAppCallResponse() => create();
  DisconnectWhatsAppCallResponse._() : super();
  factory DisconnectWhatsAppCallResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisconnectWhatsAppCallResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DisconnectWhatsAppCallResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisconnectWhatsAppCallResponse clone() => DisconnectWhatsAppCallResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisconnectWhatsAppCallResponse copyWith(void Function(DisconnectWhatsAppCallResponse) updates) => super.copyWith((message) => updates(message as DisconnectWhatsAppCallResponse)) as DisconnectWhatsAppCallResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisconnectWhatsAppCallResponse create() => DisconnectWhatsAppCallResponse._();
  DisconnectWhatsAppCallResponse createEmptyInstance() => create();
  static $pb.PbList<DisconnectWhatsAppCallResponse> createRepeated() => $pb.PbList<DisconnectWhatsAppCallResponse>();
  @$core.pragma('dart2js:noInline')
  static DisconnectWhatsAppCallResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisconnectWhatsAppCallResponse>(create);
  static DisconnectWhatsAppCallResponse? _defaultInstance;
}

class ConnectWhatsAppCallRequest extends $pb.GeneratedMessage {
  factory ConnectWhatsAppCallRequest({
    $core.String? whatsappCallId,
    $14.SessionDescription? sdp,
  }) {
    final $result = create();
    if (whatsappCallId != null) {
      $result.whatsappCallId = whatsappCallId;
    }
    if (sdp != null) {
      $result.sdp = sdp;
    }
    return $result;
  }
  ConnectWhatsAppCallRequest._() : super();
  factory ConnectWhatsAppCallRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectWhatsAppCallRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConnectWhatsAppCallRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'whatsappCallId')
    ..aOM<$14.SessionDescription>(2, _omitFieldNames ? '' : 'sdp', subBuilder: $14.SessionDescription.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectWhatsAppCallRequest clone() => ConnectWhatsAppCallRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectWhatsAppCallRequest copyWith(void Function(ConnectWhatsAppCallRequest) updates) => super.copyWith((message) => updates(message as ConnectWhatsAppCallRequest)) as ConnectWhatsAppCallRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectWhatsAppCallRequest create() => ConnectWhatsAppCallRequest._();
  ConnectWhatsAppCallRequest createEmptyInstance() => create();
  static $pb.PbList<ConnectWhatsAppCallRequest> createRepeated() => $pb.PbList<ConnectWhatsAppCallRequest>();
  @$core.pragma('dart2js:noInline')
  static ConnectWhatsAppCallRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectWhatsAppCallRequest>(create);
  static ConnectWhatsAppCallRequest? _defaultInstance;

  /// Required - Call ID sent by Meta
  @$pb.TagNumber(1)
  $core.String get whatsappCallId => $_getSZ(0);
  @$pb.TagNumber(1)
  set whatsappCallId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWhatsappCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhatsappCallId() => clearField(1);

  /// Required - The call connect webhook comes with SDP from Meta
  /// It is the answer SDP for a business initiated call
  @$pb.TagNumber(2)
  $14.SessionDescription get sdp => $_getN(1);
  @$pb.TagNumber(2)
  set sdp($14.SessionDescription v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSdp() => $_has(1);
  @$pb.TagNumber(2)
  void clearSdp() => clearField(2);
  @$pb.TagNumber(2)
  $14.SessionDescription ensureSdp() => $_ensure(1);
}

class ConnectWhatsAppCallResponse extends $pb.GeneratedMessage {
  factory ConnectWhatsAppCallResponse() => create();
  ConnectWhatsAppCallResponse._() : super();
  factory ConnectWhatsAppCallResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectWhatsAppCallResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConnectWhatsAppCallResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectWhatsAppCallResponse clone() => ConnectWhatsAppCallResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectWhatsAppCallResponse copyWith(void Function(ConnectWhatsAppCallResponse) updates) => super.copyWith((message) => updates(message as ConnectWhatsAppCallResponse)) as ConnectWhatsAppCallResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectWhatsAppCallResponse create() => ConnectWhatsAppCallResponse._();
  ConnectWhatsAppCallResponse createEmptyInstance() => create();
  static $pb.PbList<ConnectWhatsAppCallResponse> createRepeated() => $pb.PbList<ConnectWhatsAppCallResponse>();
  @$core.pragma('dart2js:noInline')
  static ConnectWhatsAppCallResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectWhatsAppCallResponse>(create);
  static ConnectWhatsAppCallResponse? _defaultInstance;
}

class AcceptWhatsAppCallRequest extends $pb.GeneratedMessage {
  factory AcceptWhatsAppCallRequest({
    $core.String? whatsappPhoneNumberId,
    $core.String? whatsappApiKey,
    $core.String? whatsappCallId,
    $core.String? whatsappBizOpaqueCallbackData,
    $14.SessionDescription? sdp,
    $core.String? roomName,
    $core.Iterable<$6.RoomAgentDispatch>? agents,
    $core.String? participantIdentity,
    $core.String? participantName,
    $core.String? participantMetadata,
    $core.Map<$core.String, $core.String>? participantAttributes,
    $core.String? destinationCountry,
    $core.String? whatsappCloudApiVersion,
  }) {
    final $result = create();
    if (whatsappPhoneNumberId != null) {
      $result.whatsappPhoneNumberId = whatsappPhoneNumberId;
    }
    if (whatsappApiKey != null) {
      $result.whatsappApiKey = whatsappApiKey;
    }
    if (whatsappCallId != null) {
      $result.whatsappCallId = whatsappCallId;
    }
    if (whatsappBizOpaqueCallbackData != null) {
      $result.whatsappBizOpaqueCallbackData = whatsappBizOpaqueCallbackData;
    }
    if (sdp != null) {
      $result.sdp = sdp;
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
    if (whatsappCloudApiVersion != null) {
      $result.whatsappCloudApiVersion = whatsappCloudApiVersion;
    }
    return $result;
  }
  AcceptWhatsAppCallRequest._() : super();
  factory AcceptWhatsAppCallRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AcceptWhatsAppCallRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AcceptWhatsAppCallRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'whatsappPhoneNumberId')
    ..aOS(2, _omitFieldNames ? '' : 'whatsappApiKey')
    ..aOS(3, _omitFieldNames ? '' : 'whatsappCallId')
    ..aOS(4, _omitFieldNames ? '' : 'whatsappBizOpaqueCallbackData')
    ..aOM<$14.SessionDescription>(5, _omitFieldNames ? '' : 'sdp', subBuilder: $14.SessionDescription.create)
    ..aOS(6, _omitFieldNames ? '' : 'roomName')
    ..pc<$6.RoomAgentDispatch>(7, _omitFieldNames ? '' : 'agents', $pb.PbFieldType.PM, subBuilder: $6.RoomAgentDispatch.create)
    ..aOS(8, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(9, _omitFieldNames ? '' : 'participantName')
    ..aOS(10, _omitFieldNames ? '' : 'participantMetadata')
    ..m<$core.String, $core.String>(11, _omitFieldNames ? '' : 'participantAttributes', entryClassName: 'AcceptWhatsAppCallRequest.ParticipantAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..aOS(12, _omitFieldNames ? '' : 'destinationCountry')
    ..aOS(13, _omitFieldNames ? '' : 'whatsappCloudApiVersion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AcceptWhatsAppCallRequest clone() => AcceptWhatsAppCallRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AcceptWhatsAppCallRequest copyWith(void Function(AcceptWhatsAppCallRequest) updates) => super.copyWith((message) => updates(message as AcceptWhatsAppCallRequest)) as AcceptWhatsAppCallRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AcceptWhatsAppCallRequest create() => AcceptWhatsAppCallRequest._();
  AcceptWhatsAppCallRequest createEmptyInstance() => create();
  static $pb.PbList<AcceptWhatsAppCallRequest> createRepeated() => $pb.PbList<AcceptWhatsAppCallRequest>();
  @$core.pragma('dart2js:noInline')
  static AcceptWhatsAppCallRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AcceptWhatsAppCallRequest>(create);
  static AcceptWhatsAppCallRequest? _defaultInstance;

  /// Required - The number of the business that is conencting the call
  @$pb.TagNumber(1)
  $core.String get whatsappPhoneNumberId => $_getSZ(0);
  @$pb.TagNumber(1)
  set whatsappPhoneNumberId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWhatsappPhoneNumberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhatsappPhoneNumberId() => clearField(1);

  /// Required - The API key of the business that is connecting the call
  @$pb.TagNumber(2)
  $core.String get whatsappApiKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set whatsappApiKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWhatsappApiKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearWhatsappApiKey() => clearField(2);

  /// Required - Call ID sent by Meta
  @$pb.TagNumber(3)
  $core.String get whatsappCallId => $_getSZ(2);
  @$pb.TagNumber(3)
  set whatsappCallId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWhatsappCallId() => $_has(2);
  @$pb.TagNumber(3)
  void clearWhatsappCallId() => clearField(3);

  /// Optional - An arbitrary string you can pass in that is useful for tracking and logging purposes.
  @$pb.TagNumber(4)
  $core.String get whatsappBizOpaqueCallbackData => $_getSZ(3);
  @$pb.TagNumber(4)
  set whatsappBizOpaqueCallbackData($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWhatsappBizOpaqueCallbackData() => $_has(3);
  @$pb.TagNumber(4)
  void clearWhatsappBizOpaqueCallbackData() => clearField(4);

  /// Required - The call accept webhook comes with SDP from Meta
  /// It is the for a user initiated call
  @$pb.TagNumber(5)
  $14.SessionDescription get sdp => $_getN(4);
  @$pb.TagNumber(5)
  set sdp($14.SessionDescription v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSdp() => $_has(4);
  @$pb.TagNumber(5)
  void clearSdp() => clearField(5);
  @$pb.TagNumber(5)
  $14.SessionDescription ensureSdp() => $_ensure(4);

  /// Optional - What LiveKit room should this participant be connected too
  @$pb.TagNumber(6)
  $core.String get roomName => $_getSZ(5);
  @$pb.TagNumber(6)
  set roomName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRoomName() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomName() => clearField(6);

  /// Optional - Agents to dispatch the call to
  @$pb.TagNumber(7)
  $core.List<$6.RoomAgentDispatch> get agents => $_getList(6);

  /// Optional - Identity of the participant in LiveKit room
  @$pb.TagNumber(8)
  $core.String get participantIdentity => $_getSZ(7);
  @$pb.TagNumber(8)
  set participantIdentity($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasParticipantIdentity() => $_has(7);
  @$pb.TagNumber(8)
  void clearParticipantIdentity() => clearField(8);

  /// Optional - Name of the participant in LiveKit room
  @$pb.TagNumber(9)
  $core.String get participantName => $_getSZ(8);
  @$pb.TagNumber(9)
  set participantName($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasParticipantName() => $_has(8);
  @$pb.TagNumber(9)
  void clearParticipantName() => clearField(9);

  /// Optional - User-defined metadata. Will be attached to a created Participant in the room.
  @$pb.TagNumber(10)
  $core.String get participantMetadata => $_getSZ(9);
  @$pb.TagNumber(10)
  set participantMetadata($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasParticipantMetadata() => $_has(9);
  @$pb.TagNumber(10)
  void clearParticipantMetadata() => clearField(10);

  /// Optional - User-defined attributes. Will be attached to a created Participant in the room.
  @$pb.TagNumber(11)
  $core.Map<$core.String, $core.String> get participantAttributes => $_getMap(10);

  /// Optional - Country where the call terminates as ISO 3166-1 alpha-2 (https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). This will be used by the livekit infrastructure to route calls.
  @$pb.TagNumber(12)
  $core.String get destinationCountry => $_getSZ(11);
  @$pb.TagNumber(12)
  set destinationCountry($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasDestinationCountry() => $_has(11);
  @$pb.TagNumber(12)
  void clearDestinationCountry() => clearField(12);

  /// Required - WhatsApp Cloud API version, eg: 23.0, 24.0, etc.
  @$pb.TagNumber(13)
  $core.String get whatsappCloudApiVersion => $_getSZ(12);
  @$pb.TagNumber(13)
  set whatsappCloudApiVersion($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasWhatsappCloudApiVersion() => $_has(12);
  @$pb.TagNumber(13)
  void clearWhatsappCloudApiVersion() => clearField(13);
}

class AcceptWhatsAppCallResponse extends $pb.GeneratedMessage {
  factory AcceptWhatsAppCallResponse({
    $core.String? roomName,
  }) {
    final $result = create();
    if (roomName != null) {
      $result.roomName = roomName;
    }
    return $result;
  }
  AcceptWhatsAppCallResponse._() : super();
  factory AcceptWhatsAppCallResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AcceptWhatsAppCallResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AcceptWhatsAppCallResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AcceptWhatsAppCallResponse clone() => AcceptWhatsAppCallResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AcceptWhatsAppCallResponse copyWith(void Function(AcceptWhatsAppCallResponse) updates) => super.copyWith((message) => updates(message as AcceptWhatsAppCallResponse)) as AcceptWhatsAppCallResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AcceptWhatsAppCallResponse create() => AcceptWhatsAppCallResponse._();
  AcceptWhatsAppCallResponse createEmptyInstance() => create();
  static $pb.PbList<AcceptWhatsAppCallResponse> createRepeated() => $pb.PbList<AcceptWhatsAppCallResponse>();
  @$core.pragma('dart2js:noInline')
  static AcceptWhatsAppCallResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AcceptWhatsAppCallResponse>(create);
  static AcceptWhatsAppCallResponse? _defaultInstance;

  /// The name of the LiveKit room that the call is connected to
  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => clearField(1);
}

class WhatsAppCall extends $pb.GeneratedMessage {
  factory WhatsAppCall({
    $core.String? whatsappCallId,
    WhatsAppCallDirection? direction,
  }) {
    final $result = create();
    if (whatsappCallId != null) {
      $result.whatsappCallId = whatsappCallId;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    return $result;
  }
  WhatsAppCall._() : super();
  factory WhatsAppCall.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WhatsAppCall.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WhatsAppCall', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'whatsappCallId')
    ..e<WhatsAppCallDirection>(2, _omitFieldNames ? '' : 'direction', $pb.PbFieldType.OE, defaultOrMaker: WhatsAppCallDirection.WHATSAPP_CALL_DIRECTION_INBOUND, valueOf: WhatsAppCallDirection.valueOf, enumValues: WhatsAppCallDirection.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WhatsAppCall clone() => WhatsAppCall()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WhatsAppCall copyWith(void Function(WhatsAppCall) updates) => super.copyWith((message) => updates(message as WhatsAppCall)) as WhatsAppCall;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhatsAppCall create() => WhatsAppCall._();
  WhatsAppCall createEmptyInstance() => create();
  static $pb.PbList<WhatsAppCall> createRepeated() => $pb.PbList<WhatsAppCall>();
  @$core.pragma('dart2js:noInline')
  static WhatsAppCall getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WhatsAppCall>(create);
  static WhatsAppCall? _defaultInstance;

  /// list of call ids that are currently active
  @$pb.TagNumber(1)
  $core.String get whatsappCallId => $_getSZ(0);
  @$pb.TagNumber(1)
  set whatsappCallId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWhatsappCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhatsappCallId() => clearField(1);

  /// Direction of the call
  @$pb.TagNumber(2)
  WhatsAppCallDirection get direction => $_getN(1);
  @$pb.TagNumber(2)
  set direction(WhatsAppCallDirection v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDirection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirection() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
