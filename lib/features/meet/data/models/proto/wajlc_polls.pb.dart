//
//  Generated code. Do not modify.
//  source: wajlc_polls.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ActivatePollsReq extends $pb.GeneratedMessage {
  factory ActivatePollsReq({
    $core.String? roomId,
    $core.bool? isActive,
  }) {
    final $result = create();
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (isActive != null) {
      $result.isActive = isActive;
    }
    return $result;
  }
  ActivatePollsReq._() : super();
  factory ActivatePollsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActivatePollsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActivatePollsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActivatePollsReq clone() => ActivatePollsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActivatePollsReq copyWith(void Function(ActivatePollsReq) updates) => super.copyWith((message) => updates(message as ActivatePollsReq)) as ActivatePollsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivatePollsReq create() => ActivatePollsReq._();
  ActivatePollsReq createEmptyInstance() => create();
  static $pb.PbList<ActivatePollsReq> createRepeated() => $pb.PbList<ActivatePollsReq>();
  @$core.pragma('dart2js:noInline')
  static ActivatePollsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActivatePollsReq>(create);
  static ActivatePollsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => clearField(2);
}

class CreatePollReq extends $pb.GeneratedMessage {
  factory CreatePollReq({
    $core.String? roomId,
    $core.String? userId,
    $core.String? pollId,
    $core.String? question,
    $core.Iterable<CreatePollOptions>? options,
  }) {
    final $result = create();
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (pollId != null) {
      $result.pollId = pollId;
    }
    if (question != null) {
      $result.question = question;
    }
    if (options != null) {
      $result.options.addAll(options);
    }
    return $result;
  }
  CreatePollReq._() : super();
  factory CreatePollReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePollReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePollReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'pollId')
    ..aOS(4, _omitFieldNames ? '' : 'question')
    ..pc<CreatePollOptions>(5, _omitFieldNames ? '' : 'options', $pb.PbFieldType.PM, subBuilder: CreatePollOptions.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePollReq clone() => CreatePollReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePollReq copyWith(void Function(CreatePollReq) updates) => super.copyWith((message) => updates(message as CreatePollReq)) as CreatePollReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePollReq create() => CreatePollReq._();
  CreatePollReq createEmptyInstance() => create();
  static $pb.PbList<CreatePollReq> createRepeated() => $pb.PbList<CreatePollReq>();
  @$core.pragma('dart2js:noInline')
  static CreatePollReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePollReq>(create);
  static CreatePollReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get pollId => $_getSZ(2);
  @$pb.TagNumber(3)
  set pollId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPollId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPollId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get question => $_getSZ(3);
  @$pb.TagNumber(4)
  set question($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasQuestion() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuestion() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<CreatePollOptions> get options => $_getList(4);
}

class CreatePollOptions extends $pb.GeneratedMessage {
  factory CreatePollOptions({
    $core.int? id,
    $core.String? text,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (text != null) {
      $result.text = text;
    }
    return $result;
  }
  CreatePollOptions._() : super();
  factory CreatePollOptions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePollOptions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePollOptions', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePollOptions clone() => CreatePollOptions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePollOptions copyWith(void Function(CreatePollOptions) updates) => super.copyWith((message) => updates(message as CreatePollOptions)) as CreatePollOptions;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePollOptions create() => CreatePollOptions._();
  CreatePollOptions createEmptyInstance() => create();
  static $pb.PbList<CreatePollOptions> createRepeated() => $pb.PbList<CreatePollOptions>();
  @$core.pragma('dart2js:noInline')
  static CreatePollOptions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePollOptions>(create);
  static CreatePollOptions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);
}

class PollInfo extends $pb.GeneratedMessage {
  factory PollInfo({
    $core.String? id,
    $core.String? roomId,
    $core.String? question,
    $core.Iterable<CreatePollOptions>? options,
    $core.bool? isRunning,
    $fixnum.Int64? created,
    $core.String? createdBy,
    $core.String? closedBy,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (question != null) {
      $result.question = question;
    }
    if (options != null) {
      $result.options.addAll(options);
    }
    if (isRunning != null) {
      $result.isRunning = isRunning;
    }
    if (created != null) {
      $result.created = created;
    }
    if (createdBy != null) {
      $result.createdBy = createdBy;
    }
    if (closedBy != null) {
      $result.closedBy = closedBy;
    }
    return $result;
  }
  PollInfo._() : super();
  factory PollInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PollInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PollInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'question')
    ..pc<CreatePollOptions>(4, _omitFieldNames ? '' : 'options', $pb.PbFieldType.PM, subBuilder: CreatePollOptions.create)
    ..aOB(5, _omitFieldNames ? '' : 'isRunning')
    ..aInt64(6, _omitFieldNames ? '' : 'created')
    ..aOS(7, _omitFieldNames ? '' : 'createdBy')
    ..aOS(8, _omitFieldNames ? '' : 'closedBy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PollInfo clone() => PollInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PollInfo copyWith(void Function(PollInfo) updates) => super.copyWith((message) => updates(message as PollInfo)) as PollInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PollInfo create() => PollInfo._();
  PollInfo createEmptyInstance() => create();
  static $pb.PbList<PollInfo> createRepeated() => $pb.PbList<PollInfo>();
  @$core.pragma('dart2js:noInline')
  static PollInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PollInfo>(create);
  static PollInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get question => $_getSZ(2);
  @$pb.TagNumber(3)
  set question($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuestion() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestion() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<CreatePollOptions> get options => $_getList(3);

  @$pb.TagNumber(5)
  $core.bool get isRunning => $_getBF(4);
  @$pb.TagNumber(5)
  set isRunning($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRunning() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsRunning() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get created => $_getI64(5);
  @$pb.TagNumber(6)
  set created($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreated() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreated() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get createdBy => $_getSZ(6);
  @$pb.TagNumber(7)
  set createdBy($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedBy() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedBy() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get closedBy => $_getSZ(7);
  @$pb.TagNumber(8)
  set closedBy($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasClosedBy() => $_has(7);
  @$pb.TagNumber(8)
  void clearClosedBy() => clearField(8);
}

class SubmitPollResponseReq extends $pb.GeneratedMessage {
  factory SubmitPollResponseReq({
    $core.String? roomId,
    $core.String? userId,
    $core.String? name,
    $core.String? pollId,
    $fixnum.Int64? selectedOption,
  }) {
    final $result = create();
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (pollId != null) {
      $result.pollId = pollId;
    }
    if (selectedOption != null) {
      $result.selectedOption = selectedOption;
    }
    return $result;
  }
  SubmitPollResponseReq._() : super();
  factory SubmitPollResponseReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmitPollResponseReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubmitPollResponseReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'pollId')
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'selectedOption', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubmitPollResponseReq clone() => SubmitPollResponseReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubmitPollResponseReq copyWith(void Function(SubmitPollResponseReq) updates) => super.copyWith((message) => updates(message as SubmitPollResponseReq)) as SubmitPollResponseReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitPollResponseReq create() => SubmitPollResponseReq._();
  SubmitPollResponseReq createEmptyInstance() => create();
  static $pb.PbList<SubmitPollResponseReq> createRepeated() => $pb.PbList<SubmitPollResponseReq>();
  @$core.pragma('dart2js:noInline')
  static SubmitPollResponseReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmitPollResponseReq>(create);
  static SubmitPollResponseReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get pollId => $_getSZ(3);
  @$pb.TagNumber(4)
  set pollId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPollId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPollId() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get selectedOption => $_getI64(4);
  @$pb.TagNumber(5)
  set selectedOption($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSelectedOption() => $_has(4);
  @$pb.TagNumber(5)
  void clearSelectedOption() => clearField(5);
}

class ClosePollReq extends $pb.GeneratedMessage {
  factory ClosePollReq({
    $core.String? roomId,
    $core.String? userId,
    $core.String? pollId,
  }) {
    final $result = create();
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (pollId != null) {
      $result.pollId = pollId;
    }
    return $result;
  }
  ClosePollReq._() : super();
  factory ClosePollReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClosePollReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ClosePollReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'pollId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClosePollReq clone() => ClosePollReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClosePollReq copyWith(void Function(ClosePollReq) updates) => super.copyWith((message) => updates(message as ClosePollReq)) as ClosePollReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClosePollReq create() => ClosePollReq._();
  ClosePollReq createEmptyInstance() => create();
  static $pb.PbList<ClosePollReq> createRepeated() => $pb.PbList<ClosePollReq>();
  @$core.pragma('dart2js:noInline')
  static ClosePollReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClosePollReq>(create);
  static ClosePollReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get pollId => $_getSZ(2);
  @$pb.TagNumber(3)
  set pollId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPollId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPollId() => clearField(3);
}

class PollResponsesResultOptions extends $pb.GeneratedMessage {
  factory PollResponsesResultOptions({
    $fixnum.Int64? id,
    $core.String? text,
    $fixnum.Int64? voteCount,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (text != null) {
      $result.text = text;
    }
    if (voteCount != null) {
      $result.voteCount = voteCount;
    }
    return $result;
  }
  PollResponsesResultOptions._() : super();
  factory PollResponsesResultOptions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PollResponsesResultOptions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PollResponsesResultOptions', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'voteCount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PollResponsesResultOptions clone() => PollResponsesResultOptions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PollResponsesResultOptions copyWith(void Function(PollResponsesResultOptions) updates) => super.copyWith((message) => updates(message as PollResponsesResultOptions)) as PollResponsesResultOptions;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PollResponsesResultOptions create() => PollResponsesResultOptions._();
  PollResponsesResultOptions createEmptyInstance() => create();
  static $pb.PbList<PollResponsesResultOptions> createRepeated() => $pb.PbList<PollResponsesResultOptions>();
  @$core.pragma('dart2js:noInline')
  static PollResponsesResultOptions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PollResponsesResultOptions>(create);
  static PollResponsesResultOptions? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get voteCount => $_getI64(2);
  @$pb.TagNumber(3)
  set voteCount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVoteCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearVoteCount() => clearField(3);
}

class PollResponsesResult extends $pb.GeneratedMessage {
  factory PollResponsesResult({
    $core.String? question,
    $fixnum.Int64? totalResponses,
    $core.Iterable<PollResponsesResultOptions>? options,
  }) {
    final $result = create();
    if (question != null) {
      $result.question = question;
    }
    if (totalResponses != null) {
      $result.totalResponses = totalResponses;
    }
    if (options != null) {
      $result.options.addAll(options);
    }
    return $result;
  }
  PollResponsesResult._() : super();
  factory PollResponsesResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PollResponsesResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PollResponsesResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'question')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'totalResponses', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<PollResponsesResultOptions>(3, _omitFieldNames ? '' : 'options', $pb.PbFieldType.PM, subBuilder: PollResponsesResultOptions.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PollResponsesResult clone() => PollResponsesResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PollResponsesResult copyWith(void Function(PollResponsesResult) updates) => super.copyWith((message) => updates(message as PollResponsesResult)) as PollResponsesResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PollResponsesResult create() => PollResponsesResult._();
  PollResponsesResult createEmptyInstance() => create();
  static $pb.PbList<PollResponsesResult> createRepeated() => $pb.PbList<PollResponsesResult>();
  @$core.pragma('dart2js:noInline')
  static PollResponsesResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PollResponsesResult>(create);
  static PollResponsesResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get question => $_getSZ(0);
  @$pb.TagNumber(1)
  set question($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuestion() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestion() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalResponses => $_getI64(1);
  @$pb.TagNumber(2)
  set totalResponses($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalResponses() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalResponses() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<PollResponsesResultOptions> get options => $_getList(2);
}

class PollsStats extends $pb.GeneratedMessage {
  factory PollsStats({
    $fixnum.Int64? totalPolls,
    $fixnum.Int64? totalRunning,
  }) {
    final $result = create();
    if (totalPolls != null) {
      $result.totalPolls = totalPolls;
    }
    if (totalRunning != null) {
      $result.totalRunning = totalRunning;
    }
    return $result;
  }
  PollsStats._() : super();
  factory PollsStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PollsStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PollsStats', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'totalPolls', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'totalRunning', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PollsStats clone() => PollsStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PollsStats copyWith(void Function(PollsStats) updates) => super.copyWith((message) => updates(message as PollsStats)) as PollsStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PollsStats create() => PollsStats._();
  PollsStats createEmptyInstance() => create();
  static $pb.PbList<PollsStats> createRepeated() => $pb.PbList<PollsStats>();
  @$core.pragma('dart2js:noInline')
  static PollsStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PollsStats>(create);
  static PollsStats? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalPolls => $_getI64(0);
  @$pb.TagNumber(1)
  set totalPolls($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotalPolls() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalPolls() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalRunning => $_getI64(1);
  @$pb.TagNumber(2)
  set totalRunning($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalRunning() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalRunning() => clearField(2);
}

class PollResponse extends $pb.GeneratedMessage {
  factory PollResponse({
    $core.bool? status,
    $core.String? msg,
    $core.String? pollId,
    $fixnum.Int64? totalResponses,
    $fixnum.Int64? voted,
    $core.Map<$core.String, $core.String>? responses,
    $core.Iterable<PollInfo>? polls,
    PollsStats? stats,
    $fixnum.Int64? totalPolls,
    $fixnum.Int64? totalRunning,
    PollResponsesResult? pollResponsesResult,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    if (pollId != null) {
      $result.pollId = pollId;
    }
    if (totalResponses != null) {
      $result.totalResponses = totalResponses;
    }
    if (voted != null) {
      $result.voted = voted;
    }
    if (responses != null) {
      $result.responses.addAll(responses);
    }
    if (polls != null) {
      $result.polls.addAll(polls);
    }
    if (stats != null) {
      $result.stats = stats;
    }
    if (totalPolls != null) {
      $result.totalPolls = totalPolls;
    }
    if (totalRunning != null) {
      $result.totalRunning = totalRunning;
    }
    if (pollResponsesResult != null) {
      $result.pollResponsesResult = pollResponsesResult;
    }
    return $result;
  }
  PollResponse._() : super();
  factory PollResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PollResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PollResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'pollId')
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'totalResponses', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'voted', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..m<$core.String, $core.String>(6, _omitFieldNames ? '' : 'responses', entryClassName: 'PollResponse.ResponsesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('wajlc'))
    ..pc<PollInfo>(7, _omitFieldNames ? '' : 'polls', $pb.PbFieldType.PM, subBuilder: PollInfo.create)
    ..aOM<PollsStats>(8, _omitFieldNames ? '' : 'stats', subBuilder: PollsStats.create)
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'totalPolls', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(10, _omitFieldNames ? '' : 'totalRunning', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<PollResponsesResult>(11, _omitFieldNames ? '' : 'pollResponsesResult', subBuilder: PollResponsesResult.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PollResponse clone() => PollResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PollResponse copyWith(void Function(PollResponse) updates) => super.copyWith((message) => updates(message as PollResponse)) as PollResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PollResponse create() => PollResponse._();
  PollResponse createEmptyInstance() => create();
  static $pb.PbList<PollResponse> createRepeated() => $pb.PbList<PollResponse>();
  @$core.pragma('dart2js:noInline')
  static PollResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PollResponse>(create);
  static PollResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get pollId => $_getSZ(2);
  @$pb.TagNumber(3)
  set pollId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPollId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPollId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalResponses => $_getI64(3);
  @$pb.TagNumber(4)
  set totalResponses($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalResponses() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalResponses() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get voted => $_getI64(4);
  @$pb.TagNumber(5)
  set voted($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasVoted() => $_has(4);
  @$pb.TagNumber(5)
  void clearVoted() => clearField(5);

  @$pb.TagNumber(6)
  $core.Map<$core.String, $core.String> get responses => $_getMap(5);

  @$pb.TagNumber(7)
  $core.List<PollInfo> get polls => $_getList(6);

  @$pb.TagNumber(8)
  PollsStats get stats => $_getN(7);
  @$pb.TagNumber(8)
  set stats(PollsStats v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStats() => $_has(7);
  @$pb.TagNumber(8)
  void clearStats() => clearField(8);
  @$pb.TagNumber(8)
  PollsStats ensureStats() => $_ensure(7);

  @$pb.TagNumber(9)
  $fixnum.Int64 get totalPolls => $_getI64(8);
  @$pb.TagNumber(9)
  set totalPolls($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTotalPolls() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalPolls() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get totalRunning => $_getI64(9);
  @$pb.TagNumber(10)
  set totalRunning($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTotalRunning() => $_has(9);
  @$pb.TagNumber(10)
  void clearTotalRunning() => clearField(10);

  @$pb.TagNumber(11)
  PollResponsesResult get pollResponsesResult => $_getN(10);
  @$pb.TagNumber(11)
  set pollResponsesResult(PollResponsesResult v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasPollResponsesResult() => $_has(10);
  @$pb.TagNumber(11)
  void clearPollResponsesResult() => clearField(11);
  @$pb.TagNumber(11)
  PollResponsesResult ensurePollResponsesResult() => $_ensure(10);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
