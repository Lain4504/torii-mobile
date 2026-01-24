// This is a generated file - do not edit.
//
// Generated from wajlc_datamessage.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_datamessage.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'wajlc_datamessage.pbenum.dart';

class DataChannelMessage extends $pb.GeneratedMessage {
  factory DataChannelMessage({
    $core.String? id,
    DataMsgBodyType? type,
    $core.String? fromUserId,
    $core.String? toUserId,
    $core.String? message,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (fromUserId != null) result.fromUserId = fromUserId;
    if (toUserId != null) result.toUserId = toUserId;
    if (message != null) result.message = message;
    return result;
  }

  DataChannelMessage._();

  factory DataChannelMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DataChannelMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DataChannelMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aE<DataMsgBodyType>(2, _omitFieldNames ? '' : 'type',
        enumValues: DataMsgBodyType.values)
    ..aOS(3, _omitFieldNames ? '' : 'fromUserId')
    ..aOS(4, _omitFieldNames ? '' : 'toUserId')
    ..aOS(5, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DataChannelMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DataChannelMessage copyWith(void Function(DataChannelMessage) updates) =>
      super.copyWith((message) => updates(message as DataChannelMessage))
          as DataChannelMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DataChannelMessage create() => DataChannelMessage._();
  @$core.override
  DataChannelMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DataChannelMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DataChannelMessage>(create);
  static DataChannelMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  DataMsgBodyType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(DataMsgBodyType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fromUserId => $_getSZ(2);
  @$pb.TagNumber(3)
  set fromUserId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFromUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFromUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get toUserId => $_getSZ(3);
  @$pb.TagNumber(4)
  set toUserId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasToUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearToUserId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get message => $_getSZ(4);
  @$pb.TagNumber(5)
  set message($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessage() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
