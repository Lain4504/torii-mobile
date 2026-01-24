// This is a generated file - do not edit.
//
// Generated from livekit_cloud_agent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AgentSecretKind extends $pb.ProtobufEnum {
  static const AgentSecretKind AGENT_SECRET_KIND_UNKNOWN =
      AgentSecretKind._(0, _omitEnumNames ? '' : 'AGENT_SECRET_KIND_UNKNOWN');
  static const AgentSecretKind AGENT_SECRET_KIND_ENVIRONMENT =
      AgentSecretKind._(
          1, _omitEnumNames ? '' : 'AGENT_SECRET_KIND_ENVIRONMENT');
  static const AgentSecretKind AGENT_SECRET_KIND_FILE =
      AgentSecretKind._(2, _omitEnumNames ? '' : 'AGENT_SECRET_KIND_FILE');

  static const $core.List<AgentSecretKind> values = <AgentSecretKind>[
    AGENT_SECRET_KIND_UNKNOWN,
    AGENT_SECRET_KIND_ENVIRONMENT,
    AGENT_SECRET_KIND_FILE,
  ];

  static final $core.List<AgentSecretKind?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static AgentSecretKind? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AgentSecretKind._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
