// This is a generated file - do not edit.
//
// Generated from livekit_token_source.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_room.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class TokenSourceRequest extends $pb.GeneratedMessage {
  factory TokenSourceRequest({
    $core.String? roomName,
    $core.String? participantName,
    $core.String? participantIdentity,
    $core.String? participantMetadata,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        participantAttributes,
    $0.RoomConfiguration? roomConfig,
  }) {
    final result = create();
    if (roomName != null) result.roomName = roomName;
    if (participantName != null) result.participantName = participantName;
    if (participantIdentity != null)
      result.participantIdentity = participantIdentity;
    if (participantMetadata != null)
      result.participantMetadata = participantMetadata;
    if (participantAttributes != null)
      result.participantAttributes.addEntries(participantAttributes);
    if (roomConfig != null) result.roomConfig = roomConfig;
    return result;
  }

  TokenSourceRequest._();

  factory TokenSourceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenSourceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenSourceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOS(2, _omitFieldNames ? '' : 'participantName')
    ..aOS(3, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(4, _omitFieldNames ? '' : 'participantMetadata')
    ..m<$core.String, $core.String>(
        5, _omitFieldNames ? '' : 'participantAttributes',
        entryClassName: 'TokenSourceRequest.ParticipantAttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('livekit'))
    ..aOM<$0.RoomConfiguration>(6, _omitFieldNames ? '' : 'roomConfig',
        subBuilder: $0.RoomConfiguration.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenSourceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenSourceRequest copyWith(void Function(TokenSourceRequest) updates) =>
      super.copyWith((message) => updates(message as TokenSourceRequest))
          as TokenSourceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenSourceRequest create() => TokenSourceRequest._();
  @$core.override
  TokenSourceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenSourceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenSourceRequest>(create);
  static TokenSourceRequest? _defaultInstance;

  /// The name of the room being requested when generating credentials
  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => $_clearField(1);

  /// The name of the participant being requested for this client when generating credentials
  @$pb.TagNumber(2)
  $core.String get participantName => $_getSZ(1);
  @$pb.TagNumber(2)
  set participantName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasParticipantName() => $_has(1);
  @$pb.TagNumber(2)
  void clearParticipantName() => $_clearField(2);

  /// The identity of the participant being requested for this client when generating credentials
  @$pb.TagNumber(3)
  $core.String get participantIdentity => $_getSZ(2);
  @$pb.TagNumber(3)
  set participantIdentity($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasParticipantIdentity() => $_has(2);
  @$pb.TagNumber(3)
  void clearParticipantIdentity() => $_clearField(3);

  /// Any participant metadata being included along with the credentials generation operation
  @$pb.TagNumber(4)
  $core.String get participantMetadata => $_getSZ(3);
  @$pb.TagNumber(4)
  set participantMetadata($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasParticipantMetadata() => $_has(3);
  @$pb.TagNumber(4)
  void clearParticipantMetadata() => $_clearField(4);

  /// Any participant attributes being included along with the credentials generation operation
  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $core.String> get participantAttributes =>
      $_getMap(4);

  /// A RoomConfiguration object can be passed to request extra parameters should be included when
  /// generating connection credentials - dispatching agents, defining egress settings, etc
  /// More info: https://docs.livekit.io/home/get-started/authentication/#room-configuration
  @$pb.TagNumber(6)
  $0.RoomConfiguration get roomConfig => $_getN(5);
  @$pb.TagNumber(6)
  set roomConfig($0.RoomConfiguration value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasRoomConfig() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomConfig() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.RoomConfiguration ensureRoomConfig() => $_ensure(5);
}

class TokenSourceResponse extends $pb.GeneratedMessage {
  factory TokenSourceResponse({
    $core.String? serverUrl,
    $core.String? participantToken,
  }) {
    final result = create();
    if (serverUrl != null) result.serverUrl = serverUrl;
    if (participantToken != null) result.participantToken = participantToken;
    return result;
  }

  TokenSourceResponse._();

  factory TokenSourceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenSourceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenSourceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverUrl')
    ..aOS(2, _omitFieldNames ? '' : 'participantToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenSourceResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenSourceResponse copyWith(void Function(TokenSourceResponse) updates) =>
      super.copyWith((message) => updates(message as TokenSourceResponse))
          as TokenSourceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenSourceResponse create() => TokenSourceResponse._();
  @$core.override
  TokenSourceResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenSourceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenSourceResponse>(create);
  static TokenSourceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serverUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set serverUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServerUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get participantToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set participantToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasParticipantToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearParticipantToken() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
