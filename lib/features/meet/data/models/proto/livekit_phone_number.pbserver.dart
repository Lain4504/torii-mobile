// This is a generated file - do not edit.
//
// Generated from livekit_phone_number.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'livekit_phone_number.pb.dart' as $2;
import 'livekit_phone_number.pbjson.dart';

export 'livekit_phone_number.pb.dart';

abstract class PhoneNumberServiceBase extends $pb.GeneratedService {
  $async.Future<$2.SearchPhoneNumbersResponse> searchPhoneNumbers(
      $pb.ServerContext ctx, $2.SearchPhoneNumbersRequest request);
  $async.Future<$2.PurchasePhoneNumberResponse> purchasePhoneNumber(
      $pb.ServerContext ctx, $2.PurchasePhoneNumberRequest request);
  $async.Future<$2.ListPhoneNumbersResponse> listPhoneNumbers(
      $pb.ServerContext ctx, $2.ListPhoneNumbersRequest request);
  $async.Future<$2.GetPhoneNumberResponse> getPhoneNumber(
      $pb.ServerContext ctx, $2.GetPhoneNumberRequest request);
  $async.Future<$2.UpdatePhoneNumberResponse> updatePhoneNumber(
      $pb.ServerContext ctx, $2.UpdatePhoneNumberRequest request);
  $async.Future<$2.ReleasePhoneNumbersResponse> releasePhoneNumbers(
      $pb.ServerContext ctx, $2.ReleasePhoneNumbersRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'SearchPhoneNumbers':
        return $2.SearchPhoneNumbersRequest();
      case 'PurchasePhoneNumber':
        return $2.PurchasePhoneNumberRequest();
      case 'ListPhoneNumbers':
        return $2.ListPhoneNumbersRequest();
      case 'GetPhoneNumber':
        return $2.GetPhoneNumberRequest();
      case 'UpdatePhoneNumber':
        return $2.UpdatePhoneNumberRequest();
      case 'ReleasePhoneNumbers':
        return $2.ReleasePhoneNumbersRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'SearchPhoneNumbers':
        return searchPhoneNumbers(ctx, request as $2.SearchPhoneNumbersRequest);
      case 'PurchasePhoneNumber':
        return purchasePhoneNumber(
            ctx, request as $2.PurchasePhoneNumberRequest);
      case 'ListPhoneNumbers':
        return listPhoneNumbers(ctx, request as $2.ListPhoneNumbersRequest);
      case 'GetPhoneNumber':
        return getPhoneNumber(ctx, request as $2.GetPhoneNumberRequest);
      case 'UpdatePhoneNumber':
        return updatePhoneNumber(ctx, request as $2.UpdatePhoneNumberRequest);
      case 'ReleasePhoneNumbers':
        return releasePhoneNumbers(
            ctx, request as $2.ReleasePhoneNumbersRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json =>
      PhoneNumberServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => PhoneNumberServiceBase$messageJson;
}
