//
//  Generated code. Do not modify.
//  source: livekit_ingress.proto
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

import 'livekit_ingress.pb.dart' as $8;
import 'livekit_ingress.pbjson.dart';

export 'livekit_ingress.pb.dart';

abstract class IngressServiceBase extends $pb.GeneratedService {
  $async.Future<$8.IngressInfo> createIngress($pb.ServerContext ctx, $8.CreateIngressRequest request);
  $async.Future<$8.IngressInfo> updateIngress($pb.ServerContext ctx, $8.UpdateIngressRequest request);
  $async.Future<$8.ListIngressResponse> listIngress($pb.ServerContext ctx, $8.ListIngressRequest request);
  $async.Future<$8.IngressInfo> deleteIngress($pb.ServerContext ctx, $8.DeleteIngressRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateIngress': return $8.CreateIngressRequest();
      case 'UpdateIngress': return $8.UpdateIngressRequest();
      case 'ListIngress': return $8.ListIngressRequest();
      case 'DeleteIngress': return $8.DeleteIngressRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateIngress': return this.createIngress(ctx, request as $8.CreateIngressRequest);
      case 'UpdateIngress': return this.updateIngress(ctx, request as $8.UpdateIngressRequest);
      case 'ListIngress': return this.listIngress(ctx, request as $8.ListIngressRequest);
      case 'DeleteIngress': return this.deleteIngress(ctx, request as $8.DeleteIngressRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => IngressServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => IngressServiceBase$messageJson;
}

