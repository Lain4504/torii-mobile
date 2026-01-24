//
//  Generated code. Do not modify.
//  source: livekit_internal.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NodeType extends $pb.ProtobufEnum {
  static const NodeType SERVER = NodeType._(0, _omitEnumNames ? '' : 'SERVER');
  static const NodeType CONTROLLER = NodeType._(1, _omitEnumNames ? '' : 'CONTROLLER');
  static const NodeType MEDIA = NodeType._(2, _omitEnumNames ? '' : 'MEDIA');
  static const NodeType TURN = NodeType._(4, _omitEnumNames ? '' : 'TURN');
  static const NodeType SWEEPER = NodeType._(5, _omitEnumNames ? '' : 'SWEEPER');
  static const NodeType DIRECTOR = NodeType._(6, _omitEnumNames ? '' : 'DIRECTOR');
  static const NodeType HOSTED_AGENT = NodeType._(7, _omitEnumNames ? '' : 'HOSTED_AGENT');
  static const NodeType SETTINGS = NodeType._(8, _omitEnumNames ? '' : 'SETTINGS');

  static const $core.List<NodeType> values = <NodeType> [
    SERVER,
    CONTROLLER,
    MEDIA,
    TURN,
    SWEEPER,
    DIRECTOR,
    HOSTED_AGENT,
    SETTINGS,
  ];

  static final $core.Map<$core.int, NodeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NodeType? valueOf($core.int value) => _byValue[value];

  const NodeType._($core.int v, $core.String n) : super(v, n);
}

class NodeState extends $pb.ProtobufEnum {
  static const NodeState STARTING_UP = NodeState._(0, _omitEnumNames ? '' : 'STARTING_UP');
  static const NodeState SERVING = NodeState._(1, _omitEnumNames ? '' : 'SERVING');
  static const NodeState SHUTTING_DOWN = NodeState._(2, _omitEnumNames ? '' : 'SHUTTING_DOWN');

  static const $core.List<NodeState> values = <NodeState> [
    STARTING_UP,
    SERVING,
    SHUTTING_DOWN,
  ];

  static final $core.Map<$core.int, NodeState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NodeState? valueOf($core.int value) => _byValue[value];

  const NodeState._($core.int v, $core.String n) : super(v, n);
}

class ICECandidateType extends $pb.ProtobufEnum {
  static const ICECandidateType ICT_NONE = ICECandidateType._(0, _omitEnumNames ? '' : 'ICT_NONE');
  static const ICECandidateType ICT_TCP = ICECandidateType._(1, _omitEnumNames ? '' : 'ICT_TCP');
  static const ICECandidateType ICT_TLS = ICECandidateType._(2, _omitEnumNames ? '' : 'ICT_TLS');

  static const $core.List<ICECandidateType> values = <ICECandidateType> [
    ICT_NONE,
    ICT_TCP,
    ICT_TLS,
  ];

  static final $core.Map<$core.int, ICECandidateType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ICECandidateType? valueOf($core.int value) => _byValue[value];

  const ICECandidateType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
