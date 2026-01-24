//
//  Generated code. Do not modify.
//  source: livekit_agent_dispatch.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_agent_dispatch.pb.dart' as $6;
import 'livekit_agent_dispatch.pbjson.dart';

export 'livekit_agent_dispatch.pb.dart';

abstract class AgentDispatchServiceBase extends $pb.GeneratedService {
  $async.Future<$6.AgentDispatch> createDispatch($pb.ServerContext ctx, $6.CreateAgentDispatchRequest request);
  $async.Future<$6.AgentDispatch> deleteDispatch($pb.ServerContext ctx, $6.DeleteAgentDispatchRequest request);
  $async.Future<$6.ListAgentDispatchResponse> listDispatch($pb.ServerContext ctx, $6.ListAgentDispatchRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateDispatch': return $6.CreateAgentDispatchRequest();
      case 'DeleteDispatch': return $6.DeleteAgentDispatchRequest();
      case 'ListDispatch': return $6.ListAgentDispatchRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateDispatch': return this.createDispatch(ctx, request as $6.CreateAgentDispatchRequest);
      case 'DeleteDispatch': return this.deleteDispatch(ctx, request as $6.DeleteAgentDispatchRequest);
      case 'ListDispatch': return this.listDispatch(ctx, request as $6.ListAgentDispatchRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => AgentDispatchServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => AgentDispatchServiceBase$messageJson;
}

