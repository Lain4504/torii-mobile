// This is a generated file - do not edit.
//
// Generated from livekit_cloud_agent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_cloud_agent.pb.dart' as $1;
import 'livekit_cloud_agent.pbjson.dart';

export 'livekit_cloud_agent.pb.dart';

abstract class CloudAgentServiceBase extends $pb.GeneratedService {
  $async.Future<$1.CreateAgentResponse> createAgent(
      $pb.ServerContext ctx, $1.CreateAgentRequest request);
  $async.Future<$1.ListAgentsResponse> listAgents(
      $pb.ServerContext ctx, $1.ListAgentsRequest request);
  $async.Future<$1.ListAgentVersionsResponse> listAgentVersions(
      $pb.ServerContext ctx, $1.ListAgentVersionsRequest request);
  $async.Future<$1.ListAgentSecretsResponse> listAgentSecrets(
      $pb.ServerContext ctx, $1.ListAgentSecretsRequest request);
  $async.Future<$1.UpdateAgentResponse> updateAgent(
      $pb.ServerContext ctx, $1.UpdateAgentRequest request);
  $async.Future<$1.RestartAgentResponse> restartAgent(
      $pb.ServerContext ctx, $1.RestartAgentRequest request);
  $async.Future<$1.DeployAgentResponse> deployAgent(
      $pb.ServerContext ctx, $1.DeployAgentRequest request);
  $async.Future<$1.UpdateAgentSecretsResponse> updateAgentSecrets(
      $pb.ServerContext ctx, $1.UpdateAgentSecretsRequest request);
  $async.Future<$1.RollbackAgentResponse> rollbackAgent(
      $pb.ServerContext ctx, $1.RollbackAgentRequest request);
  $async.Future<$1.DeleteAgentResponse> deleteAgent(
      $pb.ServerContext ctx, $1.DeleteAgentRequest request);
  $async.Future<$1.ClientSettingsResponse> getClientSettings(
      $pb.ServerContext ctx, $1.ClientSettingsRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateAgent':
        return $1.CreateAgentRequest();
      case 'ListAgents':
        return $1.ListAgentsRequest();
      case 'ListAgentVersions':
        return $1.ListAgentVersionsRequest();
      case 'ListAgentSecrets':
        return $1.ListAgentSecretsRequest();
      case 'UpdateAgent':
        return $1.UpdateAgentRequest();
      case 'RestartAgent':
        return $1.RestartAgentRequest();
      case 'DeployAgent':
        return $1.DeployAgentRequest();
      case 'UpdateAgentSecrets':
        return $1.UpdateAgentSecretsRequest();
      case 'RollbackAgent':
        return $1.RollbackAgentRequest();
      case 'DeleteAgent':
        return $1.DeleteAgentRequest();
      case 'GetClientSettings':
        return $1.ClientSettingsRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateAgent':
        return createAgent(ctx, request as $1.CreateAgentRequest);
      case 'ListAgents':
        return listAgents(ctx, request as $1.ListAgentsRequest);
      case 'ListAgentVersions':
        return listAgentVersions(ctx, request as $1.ListAgentVersionsRequest);
      case 'ListAgentSecrets':
        return listAgentSecrets(ctx, request as $1.ListAgentSecretsRequest);
      case 'UpdateAgent':
        return updateAgent(ctx, request as $1.UpdateAgentRequest);
      case 'RestartAgent':
        return restartAgent(ctx, request as $1.RestartAgentRequest);
      case 'DeployAgent':
        return deployAgent(ctx, request as $1.DeployAgentRequest);
      case 'UpdateAgentSecrets':
        return updateAgentSecrets(ctx, request as $1.UpdateAgentSecretsRequest);
      case 'RollbackAgent':
        return rollbackAgent(ctx, request as $1.RollbackAgentRequest);
      case 'DeleteAgent':
        return deleteAgent(ctx, request as $1.DeleteAgentRequest);
      case 'GetClientSettings':
        return getClientSettings(ctx, request as $1.ClientSettingsRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json =>
      CloudAgentServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => CloudAgentServiceBase$messageJson;
}
