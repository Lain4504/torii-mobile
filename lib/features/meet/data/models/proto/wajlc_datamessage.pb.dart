//
//  Generated code. Do not modify.
//  source: wajlc_datamessage.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wajlc_datamessage.pbenum.dart';

export 'wajlc_datamessage.pbenum.dart';

class DataChannelMessage extends $pb.GeneratedMessage {
  factory DataChannelMessage({
    $core.String? id,
    DataMsgBodyType? type,
    $core.String? fromUserId,
    $core.String? toUserId,
    $core.String? message,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (type != null) {
      $result.type = type;
    }
    if (fromUserId != null) {
      $result.fromUserId = fromUserId;
    }
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  DataChannelMessage._() : super();
  factory DataChannelMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DataChannelMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DataChannelMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..e<DataMsgBodyType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: DataMsgBodyType.UNKNOWN, valueOf: DataMsgBodyType.valueOf, enumValues: DataMsgBodyType.values)
    ..aOS(3, _omitFieldNames ? '' : 'fromUserId')
    ..aOS(4, _omitFieldNames ? '' : 'toUserId')
    ..aOS(5, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DataChannelMessage clone() => DataChannelMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DataChannelMessage copyWith(void Function(DataChannelMessage) updates) => super.copyWith((message) => updates(message as DataChannelMessage)) as DataChannelMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DataChannelMessage create() => DataChannelMessage._();
  DataChannelMessage createEmptyInstance() => create();
  static $pb.PbList<DataChannelMessage> createRepeated() => $pb.PbList<DataChannelMessage>();
  @$core.pragma('dart2js:noInline')
  static DataChannelMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DataChannelMessage>(create);
  static DataChannelMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  DataMsgBodyType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(DataMsgBodyType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fromUserId => $_getSZ(2);
  @$pb.TagNumber(3)
  set fromUserId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFromUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFromUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get toUserId => $_getSZ(3);
  @$pb.TagNumber(4)
  set toUserId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasToUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearToUserId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get message => $_getSZ(4);
  @$pb.TagNumber(5)
  set message($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessage() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
