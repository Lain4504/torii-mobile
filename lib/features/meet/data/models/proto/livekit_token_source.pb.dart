//
//  Generated code. Do not modify.
//  source: livekit_token_source.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_room.pb.dart' as $9;

class TokenSourceRequest extends $pb.GeneratedMessage {
  factory TokenSourceRequest({
    $core.String? roomName,
    $core.String? participantName,
    $core.String? participantIdentity,
    $core.String? participantMetadata,
    $core.Map<$core.String, $core.String>? participantAttributes,
    $9.RoomConfiguration? roomConfig,
  }) {
    final $result = create();
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (participantName != null) {
      $result.participantName = participantName;
    }
    if (participantIdentity != null) {
      $result.participantIdentity = participantIdentity;
    }
    if (participantMetadata != null) {
      $result.participantMetadata = participantMetadata;
    }
    if (participantAttributes != null) {
      $result.participantAttributes.addAll(participantAttributes);
    }
    if (roomConfig != null) {
      $result.roomConfig = roomConfig;
    }
    return $result;
  }
  TokenSourceRequest._() : super();
  factory TokenSourceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TokenSourceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TokenSourceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomName')
    ..aOS(2, _omitFieldNames ? '' : 'participantName')
    ..aOS(3, _omitFieldNames ? '' : 'participantIdentity')
    ..aOS(4, _omitFieldNames ? '' : 'participantMetadata')
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'participantAttributes', entryClassName: 'TokenSourceRequest.ParticipantAttributesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('livekit'))
    ..aOM<$9.RoomConfiguration>(6, _omitFieldNames ? '' : 'roomConfig', subBuilder: $9.RoomConfiguration.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TokenSourceRequest clone() => TokenSourceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TokenSourceRequest copyWith(void Function(TokenSourceRequest) updates) => super.copyWith((message) => updates(message as TokenSourceRequest)) as TokenSourceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenSourceRequest create() => TokenSourceRequest._();
  TokenSourceRequest createEmptyInstance() => create();
  static $pb.PbList<TokenSourceRequest> createRepeated() => $pb.PbList<TokenSourceRequest>();
  @$core.pragma('dart2js:noInline')
  static TokenSourceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TokenSourceRequest>(create);
  static TokenSourceRequest? _defaultInstance;

  /// The name of the room being requested when generating credentials
  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => clearField(1);

  /// The name of the participant being requested for this client when generating credentials
  @$pb.TagNumber(2)
  $core.String get participantName => $_getSZ(1);
  @$pb.TagNumber(2)
  set participantName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParticipantName() => $_has(1);
  @$pb.TagNumber(2)
  void clearParticipantName() => clearField(2);

  /// The identity of the participant being requested for this client when generating credentials
  @$pb.TagNumber(3)
  $core.String get participantIdentity => $_getSZ(2);
  @$pb.TagNumber(3)
  set participantIdentity($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasParticipantIdentity() => $_has(2);
  @$pb.TagNumber(3)
  void clearParticipantIdentity() => clearField(3);

  /// Any participant metadata being included along with the credentials generation operation
  @$pb.TagNumber(4)
  $core.String get participantMetadata => $_getSZ(3);
  @$pb.TagNumber(4)
  set participantMetadata($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasParticipantMetadata() => $_has(3);
  @$pb.TagNumber(4)
  void clearParticipantMetadata() => clearField(4);

  /// Any participant attributes being included along with the credentials generation operation
  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get participantAttributes => $_getMap(4);

  /// A RoomConfiguration object can be passed to request extra parameters should be included when
  /// generating connection credentials - dispatching agents, defining egress settings, etc
  /// More info: https://docs.livekit.io/home/get-started/authentication/#room-configuration
  @$pb.TagNumber(6)
  $9.RoomConfiguration get roomConfig => $_getN(5);
  @$pb.TagNumber(6)
  set roomConfig($9.RoomConfiguration v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasRoomConfig() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomConfig() => clearField(6);
  @$pb.TagNumber(6)
  $9.RoomConfiguration ensureRoomConfig() => $_ensure(5);
}

class TokenSourceResponse extends $pb.GeneratedMessage {
  factory TokenSourceResponse({
    $core.String? serverUrl,
    $core.String? participantToken,
  }) {
    final $result = create();
    if (serverUrl != null) {
      $result.serverUrl = serverUrl;
    }
    if (participantToken != null) {
      $result.participantToken = participantToken;
    }
    return $result;
  }
  TokenSourceResponse._() : super();
  factory TokenSourceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TokenSourceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TokenSourceResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverUrl')
    ..aOS(2, _omitFieldNames ? '' : 'participantToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TokenSourceResponse clone() => TokenSourceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TokenSourceResponse copyWith(void Function(TokenSourceResponse) updates) => super.copyWith((message) => updates(message as TokenSourceResponse)) as TokenSourceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenSourceResponse create() => TokenSourceResponse._();
  TokenSourceResponse createEmptyInstance() => create();
  static $pb.PbList<TokenSourceResponse> createRepeated() => $pb.PbList<TokenSourceResponse>();
  @$core.pragma('dart2js:noInline')
  static TokenSourceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TokenSourceResponse>(create);
  static TokenSourceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serverUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set serverUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasServerUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get participantToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set participantToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParticipantToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearParticipantToken() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
