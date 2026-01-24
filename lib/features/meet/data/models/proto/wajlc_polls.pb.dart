// This is a generated file - do not edit.
//
// Generated from wajlc_polls.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ActivatePollsReq extends $pb.GeneratedMessage {
  factory ActivatePollsReq({
    $core.String? roomId,
    $core.bool? isActive,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (isActive != null) result.isActive = isActive;
    return result;
  }

  ActivatePollsReq._();

  factory ActivatePollsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActivatePollsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActivatePollsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivatePollsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivatePollsReq copyWith(void Function(ActivatePollsReq) updates) =>
      super.copyWith((message) => updates(message as ActivatePollsReq))
          as ActivatePollsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivatePollsReq create() => ActivatePollsReq._();
  @$core.override
  ActivatePollsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActivatePollsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActivatePollsReq>(create);
  static ActivatePollsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => $_clearField(2);
}

class CreatePollReq extends $pb.GeneratedMessage {
  factory CreatePollReq({
    $core.String? roomId,
    $core.String? userId,
    $core.String? pollId,
    $core.String? question,
    $core.Iterable<CreatePollOptions>? options,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (userId != null) result.userId = userId;
    if (pollId != null) result.pollId = pollId;
    if (question != null) result.question = question;
    if (options != null) result.options.addAll(options);
    return result;
  }

  CreatePollReq._();

  factory CreatePollReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePollReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePollReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'pollId')
    ..aOS(4, _omitFieldNames ? '' : 'question')
    ..pPM<CreatePollOptions>(5, _omitFieldNames ? '' : 'options',
        subBuilder: CreatePollOptions.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePollReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePollReq copyWith(void Function(CreatePollReq) updates) =>
      super.copyWith((message) => updates(message as CreatePollReq))
          as CreatePollReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePollReq create() => CreatePollReq._();
  @$core.override
  CreatePollReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreatePollReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePollReq>(create);
  static CreatePollReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get pollId => $_getSZ(2);
  @$pb.TagNumber(3)
  set pollId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPollId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPollId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get question => $_getSZ(3);
  @$pb.TagNumber(4)
  set question($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuestion() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuestion() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<CreatePollOptions> get options => $_getList(4);
}

class CreatePollOptions extends $pb.GeneratedMessage {
  factory CreatePollOptions({
    $core.int? id,
    $core.String? text,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (text != null) result.text = text;
    return result;
  }

  CreatePollOptions._();

  factory CreatePollOptions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePollOptions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePollOptions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePollOptions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePollOptions copyWith(void Function(CreatePollOptions) updates) =>
      super.copyWith((message) => updates(message as CreatePollOptions))
          as CreatePollOptions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePollOptions create() => CreatePollOptions._();
  @$core.override
  CreatePollOptions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreatePollOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePollOptions>(create);
  static CreatePollOptions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => $_clearField(2);
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
    final result = create();
    if (id != null) result.id = id;
    if (roomId != null) result.roomId = roomId;
    if (question != null) result.question = question;
    if (options != null) result.options.addAll(options);
    if (isRunning != null) result.isRunning = isRunning;
    if (created != null) result.created = created;
    if (createdBy != null) result.createdBy = createdBy;
    if (closedBy != null) result.closedBy = closedBy;
    return result;
  }

  PollInfo._();

  factory PollInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PollInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PollInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'question')
    ..pPM<CreatePollOptions>(4, _omitFieldNames ? '' : 'options',
        subBuilder: CreatePollOptions.create)
    ..aOB(5, _omitFieldNames ? '' : 'isRunning')
    ..aInt64(6, _omitFieldNames ? '' : 'created')
    ..aOS(7, _omitFieldNames ? '' : 'createdBy')
    ..aOS(8, _omitFieldNames ? '' : 'closedBy')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PollInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PollInfo copyWith(void Function(PollInfo) updates) =>
      super.copyWith((message) => updates(message as PollInfo)) as PollInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PollInfo create() => PollInfo._();
  @$core.override
  PollInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PollInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PollInfo>(create);
  static PollInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get question => $_getSZ(2);
  @$pb.TagNumber(3)
  set question($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQuestion() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestion() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<CreatePollOptions> get options => $_getList(3);

  @$pb.TagNumber(5)
  $core.bool get isRunning => $_getBF(4);
  @$pb.TagNumber(5)
  set isRunning($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsRunning() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsRunning() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get created => $_getI64(5);
  @$pb.TagNumber(6)
  set created($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreated() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreated() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get createdBy => $_getSZ(6);
  @$pb.TagNumber(7)
  set createdBy($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreatedBy() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedBy() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get closedBy => $_getSZ(7);
  @$pb.TagNumber(8)
  set closedBy($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasClosedBy() => $_has(7);
  @$pb.TagNumber(8)
  void clearClosedBy() => $_clearField(8);
}

class SubmitPollResponseReq extends $pb.GeneratedMessage {
  factory SubmitPollResponseReq({
    $core.String? roomId,
    $core.String? userId,
    $core.String? name,
    $core.String? pollId,
    $fixnum.Int64? selectedOption,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (userId != null) result.userId = userId;
    if (name != null) result.name = name;
    if (pollId != null) result.pollId = pollId;
    if (selectedOption != null) result.selectedOption = selectedOption;
    return result;
  }

  SubmitPollResponseReq._();

  factory SubmitPollResponseReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitPollResponseReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitPollResponseReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'pollId')
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'selectedOption', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitPollResponseReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitPollResponseReq copyWith(
          void Function(SubmitPollResponseReq) updates) =>
      super.copyWith((message) => updates(message as SubmitPollResponseReq))
          as SubmitPollResponseReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitPollResponseReq create() => SubmitPollResponseReq._();
  @$core.override
  SubmitPollResponseReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitPollResponseReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitPollResponseReq>(create);
  static SubmitPollResponseReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get pollId => $_getSZ(3);
  @$pb.TagNumber(4)
  set pollId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPollId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPollId() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get selectedOption => $_getI64(4);
  @$pb.TagNumber(5)
  set selectedOption($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSelectedOption() => $_has(4);
  @$pb.TagNumber(5)
  void clearSelectedOption() => $_clearField(5);
}

class ClosePollReq extends $pb.GeneratedMessage {
  factory ClosePollReq({
    $core.String? roomId,
    $core.String? userId,
    $core.String? pollId,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (userId != null) result.userId = userId;
    if (pollId != null) result.pollId = pollId;
    return result;
  }

  ClosePollReq._();

  factory ClosePollReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClosePollReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClosePollReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'pollId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosePollReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosePollReq copyWith(void Function(ClosePollReq) updates) =>
      super.copyWith((message) => updates(message as ClosePollReq))
          as ClosePollReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClosePollReq create() => ClosePollReq._();
  @$core.override
  ClosePollReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClosePollReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClosePollReq>(create);
  static ClosePollReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get pollId => $_getSZ(2);
  @$pb.TagNumber(3)
  set pollId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPollId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPollId() => $_clearField(3);
}

class PollResponsesResultOptions extends $pb.GeneratedMessage {
  factory PollResponsesResultOptions({
    $fixnum.Int64? id,
    $core.String? text,
    $fixnum.Int64? voteCount,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (text != null) result.text = text;
    if (voteCount != null) result.voteCount = voteCount;
    return result;
  }

  PollResponsesResultOptions._();

  factory PollResponsesResultOptions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PollResponsesResultOptions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PollResponsesResultOptions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'voteCount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PollResponsesResultOptions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PollResponsesResultOptions copyWith(
          void Function(PollResponsesResultOptions) updates) =>
      super.copyWith(
              (message) => updates(message as PollResponsesResultOptions))
          as PollResponsesResultOptions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PollResponsesResultOptions create() => PollResponsesResultOptions._();
  @$core.override
  PollResponsesResultOptions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PollResponsesResultOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PollResponsesResultOptions>(create);
  static PollResponsesResultOptions? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get voteCount => $_getI64(2);
  @$pb.TagNumber(3)
  set voteCount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVoteCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearVoteCount() => $_clearField(3);
}

class PollResponsesResult extends $pb.GeneratedMessage {
  factory PollResponsesResult({
    $core.String? question,
    $fixnum.Int64? totalResponses,
    $core.Iterable<PollResponsesResultOptions>? options,
  }) {
    final result = create();
    if (question != null) result.question = question;
    if (totalResponses != null) result.totalResponses = totalResponses;
    if (options != null) result.options.addAll(options);
    return result;
  }

  PollResponsesResult._();

  factory PollResponsesResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PollResponsesResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PollResponsesResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'question')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'totalResponses', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<PollResponsesResultOptions>(3, _omitFieldNames ? '' : 'options',
        subBuilder: PollResponsesResultOptions.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PollResponsesResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PollResponsesResult copyWith(void Function(PollResponsesResult) updates) =>
      super.copyWith((message) => updates(message as PollResponsesResult))
          as PollResponsesResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PollResponsesResult create() => PollResponsesResult._();
  @$core.override
  PollResponsesResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PollResponsesResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PollResponsesResult>(create);
  static PollResponsesResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get question => $_getSZ(0);
  @$pb.TagNumber(1)
  set question($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuestion() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestion() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalResponses => $_getI64(1);
  @$pb.TagNumber(2)
  set totalResponses($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalResponses() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalResponses() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<PollResponsesResultOptions> get options => $_getList(2);
}

class PollsStats extends $pb.GeneratedMessage {
  factory PollsStats({
    $fixnum.Int64? totalPolls,
    $fixnum.Int64? totalRunning,
  }) {
    final result = create();
    if (totalPolls != null) result.totalPolls = totalPolls;
    if (totalRunning != null) result.totalRunning = totalRunning;
    return result;
  }

  PollsStats._();

  factory PollsStats.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PollsStats.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PollsStats',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'totalPolls', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'totalRunning', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PollsStats clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PollsStats copyWith(void Function(PollsStats) updates) =>
      super.copyWith((message) => updates(message as PollsStats)) as PollsStats;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PollsStats create() => PollsStats._();
  @$core.override
  PollsStats createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PollsStats getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PollsStats>(create);
  static PollsStats? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalPolls => $_getI64(0);
  @$pb.TagNumber(1)
  set totalPolls($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalPolls() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalPolls() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalRunning => $_getI64(1);
  @$pb.TagNumber(2)
  set totalRunning($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalRunning() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalRunning() => $_clearField(2);
}

class PollResponse extends $pb.GeneratedMessage {
  factory PollResponse({
    $core.bool? status,
    $core.String? msg,
    $core.String? pollId,
    $fixnum.Int64? totalResponses,
    $fixnum.Int64? voted,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? responses,
    $core.Iterable<PollInfo>? polls,
    PollsStats? stats,
    $fixnum.Int64? totalPolls,
    $fixnum.Int64? totalRunning,
    PollResponsesResult? pollResponsesResult,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (msg != null) result.msg = msg;
    if (pollId != null) result.pollId = pollId;
    if (totalResponses != null) result.totalResponses = totalResponses;
    if (voted != null) result.voted = voted;
    if (responses != null) result.responses.addEntries(responses);
    if (polls != null) result.polls.addAll(polls);
    if (stats != null) result.stats = stats;
    if (totalPolls != null) result.totalPolls = totalPolls;
    if (totalRunning != null) result.totalRunning = totalRunning;
    if (pollResponsesResult != null)
      result.pollResponsesResult = pollResponsesResult;
    return result;
  }

  PollResponse._();

  factory PollResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PollResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PollResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wajlc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..aOS(3, _omitFieldNames ? '' : 'pollId')
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'totalResponses', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'voted', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..m<$core.String, $core.String>(6, _omitFieldNames ? '' : 'responses',
        entryClassName: 'PollResponse.ResponsesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('wajlc'))
    ..pPM<PollInfo>(7, _omitFieldNames ? '' : 'polls',
        subBuilder: PollInfo.create)
    ..aOM<PollsStats>(8, _omitFieldNames ? '' : 'stats',
        subBuilder: PollsStats.create)
    ..a<$fixnum.Int64>(
        9, _omitFieldNames ? '' : 'totalPolls', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'totalRunning', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<PollResponsesResult>(11, _omitFieldNames ? '' : 'pollResponsesResult',
        subBuilder: PollResponsesResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PollResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PollResponse copyWith(void Function(PollResponse) updates) =>
      super.copyWith((message) => updates(message as PollResponse))
          as PollResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PollResponse create() => PollResponse._();
  @$core.override
  PollResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PollResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PollResponse>(create);
  static PollResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get pollId => $_getSZ(2);
  @$pb.TagNumber(3)
  set pollId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPollId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPollId() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalResponses => $_getI64(3);
  @$pb.TagNumber(4)
  set totalResponses($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalResponses() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalResponses() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get voted => $_getI64(4);
  @$pb.TagNumber(5)
  set voted($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVoted() => $_has(4);
  @$pb.TagNumber(5)
  void clearVoted() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbMap<$core.String, $core.String> get responses => $_getMap(5);

  @$pb.TagNumber(7)
  $pb.PbList<PollInfo> get polls => $_getList(6);

  @$pb.TagNumber(8)
  PollsStats get stats => $_getN(7);
  @$pb.TagNumber(8)
  set stats(PollsStats value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasStats() => $_has(7);
  @$pb.TagNumber(8)
  void clearStats() => $_clearField(8);
  @$pb.TagNumber(8)
  PollsStats ensureStats() => $_ensure(7);

  @$pb.TagNumber(9)
  $fixnum.Int64 get totalPolls => $_getI64(8);
  @$pb.TagNumber(9)
  set totalPolls($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasTotalPolls() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalPolls() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get totalRunning => $_getI64(9);
  @$pb.TagNumber(10)
  set totalRunning($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasTotalRunning() => $_has(9);
  @$pb.TagNumber(10)
  void clearTotalRunning() => $_clearField(10);

  @$pb.TagNumber(11)
  PollResponsesResult get pollResponsesResult => $_getN(10);
  @$pb.TagNumber(11)
  set pollResponsesResult(PollResponsesResult value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasPollResponsesResult() => $_has(10);
  @$pb.TagNumber(11)
  void clearPollResponsesResult() => $_clearField(11);
  @$pb.TagNumber(11)
  PollResponsesResult ensurePollResponsesResult() => $_ensure(10);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
