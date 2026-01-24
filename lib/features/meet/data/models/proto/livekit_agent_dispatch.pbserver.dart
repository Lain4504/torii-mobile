// This is a generated file - do not edit.
//
// Generated from livekit_agent_dispatch.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_agent_dispatch.pb.dart' as $2;
import 'livekit_agent_dispatch.pbjson.dart';

export 'livekit_agent_dispatch.pb.dart';

abstract class AgentDispatchServiceBase extends $pb.GeneratedService {
  $async.Future<$2.AgentDispatch> createDispatch(
      $pb.ServerContext ctx, $2.CreateAgentDispatchRequest request);
  $async.Future<$2.AgentDispatch> deleteDispatch(
      $pb.ServerContext ctx, $2.DeleteAgentDispatchRequest request);
  $async.Future<$2.ListAgentDispatchResponse> listDispatch(
      $pb.ServerContext ctx, $2.ListAgentDispatchRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateDispatch':
        return $2.CreateAgentDispatchRequest();
      case 'DeleteDispatch':
        return $2.DeleteAgentDispatchRequest();
      case 'ListDispatch':
        return $2.ListAgentDispatchRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateDispatch':
        return createDispatch(ctx, request as $2.CreateAgentDispatchRequest);
      case 'DeleteDispatch':
        return deleteDispatch(ctx, request as $2.DeleteAgentDispatchRequest);
      case 'ListDispatch':
        return listDispatch(ctx, request as $2.ListAgentDispatchRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json =>
      AgentDispatchServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => AgentDispatchServiceBase$messageJson;
}
