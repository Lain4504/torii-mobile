//
//  Generated code. Do not modify.
//  source: livekit_cloud_agent.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AgentSecretKind extends $pb.ProtobufEnum {
  static const AgentSecretKind AGENT_SECRET_KIND_UNKNOWN = AgentSecretKind._(0, _omitEnumNames ? '' : 'AGENT_SECRET_KIND_UNKNOWN');
  static const AgentSecretKind AGENT_SECRET_KIND_ENVIRONMENT = AgentSecretKind._(1, _omitEnumNames ? '' : 'AGENT_SECRET_KIND_ENVIRONMENT');
  static const AgentSecretKind AGENT_SECRET_KIND_FILE = AgentSecretKind._(2, _omitEnumNames ? '' : 'AGENT_SECRET_KIND_FILE');

  static const $core.List<AgentSecretKind> values = <AgentSecretKind> [
    AGENT_SECRET_KIND_UNKNOWN,
    AGENT_SECRET_KIND_ENVIRONMENT,
    AGENT_SECRET_KIND_FILE,
  ];

  static final $core.Map<$core.int, AgentSecretKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AgentSecretKind? valueOf($core.int value) => _byValue[value];

  const AgentSecretKind._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
