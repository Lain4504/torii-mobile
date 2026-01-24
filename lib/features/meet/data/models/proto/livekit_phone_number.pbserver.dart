//
//  Generated code. Do not modify.
//  source: livekit_phone_number.proto
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

import 'livekit_phone_number.pb.dart' as $17;
import 'livekit_phone_number.pbjson.dart';

export 'livekit_phone_number.pb.dart';

abstract class PhoneNumberServiceBase extends $pb.GeneratedService {
  $async.Future<$17.SearchPhoneNumbersResponse> searchPhoneNumbers($pb.ServerContext ctx, $17.SearchPhoneNumbersRequest request);
  $async.Future<$17.PurchasePhoneNumberResponse> purchasePhoneNumber($pb.ServerContext ctx, $17.PurchasePhoneNumberRequest request);
  $async.Future<$17.ListPhoneNumbersResponse> listPhoneNumbers($pb.ServerContext ctx, $17.ListPhoneNumbersRequest request);
  $async.Future<$17.GetPhoneNumberResponse> getPhoneNumber($pb.ServerContext ctx, $17.GetPhoneNumberRequest request);
  $async.Future<$17.UpdatePhoneNumberResponse> updatePhoneNumber($pb.ServerContext ctx, $17.UpdatePhoneNumberRequest request);
  $async.Future<$17.ReleasePhoneNumbersResponse> releasePhoneNumbers($pb.ServerContext ctx, $17.ReleasePhoneNumbersRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'SearchPhoneNumbers': return $17.SearchPhoneNumbersRequest();
      case 'PurchasePhoneNumber': return $17.PurchasePhoneNumberRequest();
      case 'ListPhoneNumbers': return $17.ListPhoneNumbersRequest();
      case 'GetPhoneNumber': return $17.GetPhoneNumberRequest();
      case 'UpdatePhoneNumber': return $17.UpdatePhoneNumberRequest();
      case 'ReleasePhoneNumbers': return $17.ReleasePhoneNumbersRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'SearchPhoneNumbers': return this.searchPhoneNumbers(ctx, request as $17.SearchPhoneNumbersRequest);
      case 'PurchasePhoneNumber': return this.purchasePhoneNumber(ctx, request as $17.PurchasePhoneNumberRequest);
      case 'ListPhoneNumbers': return this.listPhoneNumbers(ctx, request as $17.ListPhoneNumbersRequest);
      case 'GetPhoneNumber': return this.getPhoneNumber(ctx, request as $17.GetPhoneNumberRequest);
      case 'UpdatePhoneNumber': return this.updatePhoneNumber(ctx, request as $17.UpdatePhoneNumberRequest);
      case 'ReleasePhoneNumbers': return this.releasePhoneNumbers(ctx, request as $17.ReleasePhoneNumbersRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => PhoneNumberServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => PhoneNumberServiceBase$messageJson;
}

