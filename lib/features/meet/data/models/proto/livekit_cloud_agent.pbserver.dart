//
//  Generated code. Do not modify.
//  source: livekit_cloud_agent.proto
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

import 'livekit_cloud_agent.pb.dart' as $13;
import 'livekit_cloud_agent.pbjson.dart';

export 'livekit_cloud_agent.pb.dart';

abstract class CloudAgentServiceBase extends $pb.GeneratedService {
  $async.Future<$13.CreateAgentResponse> createAgent($pb.ServerContext ctx, $13.CreateAgentRequest request);
  $async.Future<$13.ListAgentsResponse> listAgents($pb.ServerContext ctx, $13.ListAgentsRequest request);
  $async.Future<$13.ListAgentVersionsResponse> listAgentVersions($pb.ServerContext ctx, $13.ListAgentVersionsRequest request);
  $async.Future<$13.ListAgentSecretsResponse> listAgentSecrets($pb.ServerContext ctx, $13.ListAgentSecretsRequest request);
  $async.Future<$13.UpdateAgentResponse> updateAgent($pb.ServerContext ctx, $13.UpdateAgentRequest request);
  $async.Future<$13.RestartAgentResponse> restartAgent($pb.ServerContext ctx, $13.RestartAgentRequest request);
  $async.Future<$13.DeployAgentResponse> deployAgent($pb.ServerContext ctx, $13.DeployAgentRequest request);
  $async.Future<$13.UpdateAgentSecretsResponse> updateAgentSecrets($pb.ServerContext ctx, $13.UpdateAgentSecretsRequest request);
  $async.Future<$13.RollbackAgentResponse> rollbackAgent($pb.ServerContext ctx, $13.RollbackAgentRequest request);
  $async.Future<$13.DeleteAgentResponse> deleteAgent($pb.ServerContext ctx, $13.DeleteAgentRequest request);
  $async.Future<$13.ClientSettingsResponse> getClientSettings($pb.ServerContext ctx, $13.ClientSettingsRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateAgent': return $13.CreateAgentRequest();
      case 'ListAgents': return $13.ListAgentsRequest();
      case 'ListAgentVersions': return $13.ListAgentVersionsRequest();
      case 'ListAgentSecrets': return $13.ListAgentSecretsRequest();
      case 'UpdateAgent': return $13.UpdateAgentRequest();
      case 'RestartAgent': return $13.RestartAgentRequest();
      case 'DeployAgent': return $13.DeployAgentRequest();
      case 'UpdateAgentSecrets': return $13.UpdateAgentSecretsRequest();
      case 'RollbackAgent': return $13.RollbackAgentRequest();
      case 'DeleteAgent': return $13.DeleteAgentRequest();
      case 'GetClientSettings': return $13.ClientSettingsRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateAgent': return this.createAgent(ctx, request as $13.CreateAgentRequest);
      case 'ListAgents': return this.listAgents(ctx, request as $13.ListAgentsRequest);
      case 'ListAgentVersions': return this.listAgentVersions(ctx, request as $13.ListAgentVersionsRequest);
      case 'ListAgentSecrets': return this.listAgentSecrets(ctx, request as $13.ListAgentSecretsRequest);
      case 'UpdateAgent': return this.updateAgent(ctx, request as $13.UpdateAgentRequest);
      case 'RestartAgent': return this.restartAgent(ctx, request as $13.RestartAgentRequest);
      case 'DeployAgent': return this.deployAgent(ctx, request as $13.DeployAgentRequest);
      case 'UpdateAgentSecrets': return this.updateAgentSecrets(ctx, request as $13.UpdateAgentSecretsRequest);
      case 'RollbackAgent': return this.rollbackAgent(ctx, request as $13.RollbackAgentRequest);
      case 'DeleteAgent': return this.deleteAgent(ctx, request as $13.DeleteAgentRequest);
      case 'GetClientSettings': return this.getClientSettings(ctx, request as $13.ClientSettingsRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => CloudAgentServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => CloudAgentServiceBase$messageJson;
}

