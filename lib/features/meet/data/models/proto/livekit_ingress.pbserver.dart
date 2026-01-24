// This is a generated file - do not edit.
//
// Generated from livekit_ingress.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_ingress.pb.dart' as $1;
import 'livekit_ingress.pbjson.dart';

export 'livekit_ingress.pb.dart';

abstract class IngressServiceBase extends $pb.GeneratedService {
  $async.Future<$1.IngressInfo> createIngress(
      $pb.ServerContext ctx, $1.CreateIngressRequest request);
  $async.Future<$1.IngressInfo> updateIngress(
      $pb.ServerContext ctx, $1.UpdateIngressRequest request);
  $async.Future<$1.ListIngressResponse> listIngress(
      $pb.ServerContext ctx, $1.ListIngressRequest request);
  $async.Future<$1.IngressInfo> deleteIngress(
      $pb.ServerContext ctx, $1.DeleteIngressRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateIngress':
        return $1.CreateIngressRequest();
      case 'UpdateIngress':
        return $1.UpdateIngressRequest();
      case 'ListIngress':
        return $1.ListIngressRequest();
      case 'DeleteIngress':
        return $1.DeleteIngressRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateIngress':
        return createIngress(ctx, request as $1.CreateIngressRequest);
      case 'UpdateIngress':
        return updateIngress(ctx, request as $1.UpdateIngressRequest);
      case 'ListIngress':
        return listIngress(ctx, request as $1.ListIngressRequest);
      case 'DeleteIngress':
        return deleteIngress(ctx, request as $1.DeleteIngressRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => IngressServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => IngressServiceBase$messageJson;
}
