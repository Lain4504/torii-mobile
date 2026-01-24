//
//  Generated code. Do not modify.
//  source: livekit_phone_number.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'google/protobuf/timestamp.pbjson.dart' as $0;
import 'livekit_models.pbjson.dart' as $2;

@$core.Deprecated('Use phoneNumberStatusDescriptor instead')
const PhoneNumberStatus$json = {
  '1': 'PhoneNumberStatus',
  '2': [
    {'1': 'PHONE_NUMBER_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'PHONE_NUMBER_STATUS_ACTIVE', '2': 1},
    {'1': 'PHONE_NUMBER_STATUS_PENDING', '2': 2},
    {'1': 'PHONE_NUMBER_STATUS_RELEASED', '2': 3},
    {'1': 'PHONE_NUMBER_STATUS_OFFLINE', '2': 4},
  ],
};

/// Descriptor for `PhoneNumberStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List phoneNumberStatusDescriptor = $convert.base64Decode(
    'ChFQaG9uZU51bWJlclN0YXR1cxIjCh9QSE9ORV9OVU1CRVJfU1RBVFVTX1VOU1BFQ0lGSUVEEA'
    'ASHgoaUEhPTkVfTlVNQkVSX1NUQVRVU19BQ1RJVkUQARIfChtQSE9ORV9OVU1CRVJfU1RBVFVT'
    'X1BFTkRJTkcQAhIgChxQSE9ORV9OVU1CRVJfU1RBVFVTX1JFTEVBU0VEEAMSHwobUEhPTkVfTl'
    'VNQkVSX1NUQVRVU19PRkZMSU5FEAQ=');

@$core.Deprecated('Use phoneNumberTypeDescriptor instead')
const PhoneNumberType$json = {
  '1': 'PhoneNumberType',
  '2': [
    {'1': 'PHONE_NUMBER_TYPE_UNKNOWN', '2': 0},
    {'1': 'PHONE_NUMBER_TYPE_MOBILE', '2': 1},
    {'1': 'PHONE_NUMBER_TYPE_LOCAL', '2': 2},
    {'1': 'PHONE_NUMBER_TYPE_TOLL_FREE', '2': 3},
  ],
};

/// Descriptor for `PhoneNumberType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List phoneNumberTypeDescriptor = $convert.base64Decode(
    'Cg9QaG9uZU51bWJlclR5cGUSHQoZUEhPTkVfTlVNQkVSX1RZUEVfVU5LTk9XThAAEhwKGFBIT0'
    '5FX05VTUJFUl9UWVBFX01PQklMRRABEhsKF1BIT05FX05VTUJFUl9UWVBFX0xPQ0FMEAISHwob'
    'UEhPTkVfTlVNQkVSX1RZUEVfVE9MTF9GUkVFEAM=');

@$core.Deprecated('Use searchPhoneNumbersRequestDescriptor instead')
const SearchPhoneNumbersRequest$json = {
  '1': 'SearchPhoneNumbersRequest',
  '2': [
    {'1': 'country_code', '3': 1, '4': 1, '5': 9, '10': 'countryCode'},
    {'1': 'area_code', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'areaCode', '17': true},
    {'1': 'limit', '3': 3, '4': 1, '5': 5, '9': 1, '10': 'limit', '17': true},
    {'1': 'page_token', '3': 4, '4': 1, '5': 11, '6': '.livekit.TokenPagination', '9': 2, '10': 'pageToken', '17': true},
  ],
  '8': [
    {'1': '_area_code'},
    {'1': '_limit'},
    {'1': '_page_token'},
  ],
};

/// Descriptor for `SearchPhoneNumbersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchPhoneNumbersRequestDescriptor = $convert.base64Decode(
    'ChlTZWFyY2hQaG9uZU51bWJlcnNSZXF1ZXN0EiEKDGNvdW50cnlfY29kZRgBIAEoCVILY291bn'
    'RyeUNvZGUSIAoJYXJlYV9jb2RlGAIgASgJSABSCGFyZWFDb2RliAEBEhkKBWxpbWl0GAMgASgF'
    'SAFSBWxpbWl0iAEBEjwKCnBhZ2VfdG9rZW4YBCABKAsyGC5saXZla2l0LlRva2VuUGFnaW5hdG'
    'lvbkgCUglwYWdlVG9rZW6IAQFCDAoKX2FyZWFfY29kZUIICgZfbGltaXRCDQoLX3BhZ2VfdG9r'
    'ZW4=');

@$core.Deprecated('Use searchPhoneNumbersResponseDescriptor instead')
const SearchPhoneNumbersResponse$json = {
  '1': 'SearchPhoneNumbersResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.livekit.PhoneNumber', '10': 'items'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 11, '6': '.livekit.TokenPagination', '10': 'nextPageToken'},
  ],
};

/// Descriptor for `SearchPhoneNumbersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchPhoneNumbersResponseDescriptor = $convert.base64Decode(
    'ChpTZWFyY2hQaG9uZU51bWJlcnNSZXNwb25zZRIqCgVpdGVtcxgBIAMoCzIULmxpdmVraXQuUG'
    'hvbmVOdW1iZXJSBWl0ZW1zEkAKD25leHRfcGFnZV90b2tlbhgCIAEoCzIYLmxpdmVraXQuVG9r'
    'ZW5QYWdpbmF0aW9uUg1uZXh0UGFnZVRva2Vu');

@$core.Deprecated('Use purchasePhoneNumberRequestDescriptor instead')
const PurchasePhoneNumberRequest$json = {
  '1': 'PurchasePhoneNumberRequest',
  '2': [
    {'1': 'phone_numbers', '3': 1, '4': 3, '5': 9, '10': 'phoneNumbers'},
    {'1': 'sip_dispatch_rule_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'sipDispatchRuleId', '17': true},
  ],
  '8': [
    {'1': '_sip_dispatch_rule_id'},
  ],
};

/// Descriptor for `PurchasePhoneNumberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List purchasePhoneNumberRequestDescriptor = $convert.base64Decode(
    'ChpQdXJjaGFzZVBob25lTnVtYmVyUmVxdWVzdBIjCg1waG9uZV9udW1iZXJzGAEgAygJUgxwaG'
    '9uZU51bWJlcnMSNAoUc2lwX2Rpc3BhdGNoX3J1bGVfaWQYAiABKAlIAFIRc2lwRGlzcGF0Y2hS'
    'dWxlSWSIAQFCFwoVX3NpcF9kaXNwYXRjaF9ydWxlX2lk');

@$core.Deprecated('Use purchasePhoneNumberResponseDescriptor instead')
const PurchasePhoneNumberResponse$json = {
  '1': 'PurchasePhoneNumberResponse',
  '2': [
    {'1': 'phone_numbers', '3': 1, '4': 3, '5': 11, '6': '.livekit.PhoneNumber', '10': 'phoneNumbers'},
  ],
};

/// Descriptor for `PurchasePhoneNumberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List purchasePhoneNumberResponseDescriptor = $convert.base64Decode(
    'ChtQdXJjaGFzZVBob25lTnVtYmVyUmVzcG9uc2USOQoNcGhvbmVfbnVtYmVycxgBIAMoCzIULm'
    'xpdmVraXQuUGhvbmVOdW1iZXJSDHBob25lTnVtYmVycw==');

@$core.Deprecated('Use listPhoneNumbersRequestDescriptor instead')
const ListPhoneNumbersRequest$json = {
  '1': 'ListPhoneNumbersRequest',
  '2': [
    {'1': 'limit', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'limit', '17': true},
    {'1': 'statuses', '3': 2, '4': 3, '5': 14, '6': '.livekit.PhoneNumberStatus', '10': 'statuses'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 11, '6': '.livekit.TokenPagination', '9': 1, '10': 'pageToken', '17': true},
    {'1': 'sip_dispatch_rule_id', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'sipDispatchRuleId', '17': true},
  ],
  '8': [
    {'1': '_limit'},
    {'1': '_page_token'},
    {'1': '_sip_dispatch_rule_id'},
  ],
};

/// Descriptor for `ListPhoneNumbersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPhoneNumbersRequestDescriptor = $convert.base64Decode(
    'ChdMaXN0UGhvbmVOdW1iZXJzUmVxdWVzdBIZCgVsaW1pdBgBIAEoBUgAUgVsaW1pdIgBARI2Cg'
    'hzdGF0dXNlcxgCIAMoDjIaLmxpdmVraXQuUGhvbmVOdW1iZXJTdGF0dXNSCHN0YXR1c2VzEjwK'
    'CnBhZ2VfdG9rZW4YAyABKAsyGC5saXZla2l0LlRva2VuUGFnaW5hdGlvbkgBUglwYWdlVG9rZW'
    '6IAQESNAoUc2lwX2Rpc3BhdGNoX3J1bGVfaWQYBCABKAlIAlIRc2lwRGlzcGF0Y2hSdWxlSWSI'
    'AQFCCAoGX2xpbWl0Qg0KC19wYWdlX3Rva2VuQhcKFV9zaXBfZGlzcGF0Y2hfcnVsZV9pZA==');

@$core.Deprecated('Use listPhoneNumbersResponseDescriptor instead')
const ListPhoneNumbersResponse$json = {
  '1': 'ListPhoneNumbersResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.livekit.PhoneNumber', '10': 'items'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 11, '6': '.livekit.TokenPagination', '10': 'nextPageToken'},
    {'1': 'total_count', '3': 3, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'offline_count', '3': 4, '4': 1, '5': 5, '10': 'offlineCount'},
  ],
};

/// Descriptor for `ListPhoneNumbersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPhoneNumbersResponseDescriptor = $convert.base64Decode(
    'ChhMaXN0UGhvbmVOdW1iZXJzUmVzcG9uc2USKgoFaXRlbXMYASADKAsyFC5saXZla2l0LlBob2'
    '5lTnVtYmVyUgVpdGVtcxJACg9uZXh0X3BhZ2VfdG9rZW4YAiABKAsyGC5saXZla2l0LlRva2Vu'
    'UGFnaW5hdGlvblINbmV4dFBhZ2VUb2tlbhIfCgt0b3RhbF9jb3VudBgDIAEoBVIKdG90YWxDb3'
    'VudBIjCg1vZmZsaW5lX2NvdW50GAQgASgFUgxvZmZsaW5lQ291bnQ=');

@$core.Deprecated('Use getPhoneNumberRequestDescriptor instead')
const GetPhoneNumberRequest$json = {
  '1': 'GetPhoneNumberRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'id', '17': true},
    {'1': 'phone_number', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'phoneNumber', '17': true},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_phone_number'},
  ],
};

/// Descriptor for `GetPhoneNumberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPhoneNumberRequestDescriptor = $convert.base64Decode(
    'ChVHZXRQaG9uZU51bWJlclJlcXVlc3QSEwoCaWQYASABKAlIAFICaWSIAQESJgoMcGhvbmVfbn'
    'VtYmVyGAIgASgJSAFSC3Bob25lTnVtYmVyiAEBQgUKA19pZEIPCg1fcGhvbmVfbnVtYmVy');

@$core.Deprecated('Use getPhoneNumberResponseDescriptor instead')
const GetPhoneNumberResponse$json = {
  '1': 'GetPhoneNumberResponse',
  '2': [
    {'1': 'phone_number', '3': 1, '4': 1, '5': 11, '6': '.livekit.PhoneNumber', '10': 'phoneNumber'},
  ],
};

/// Descriptor for `GetPhoneNumberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPhoneNumberResponseDescriptor = $convert.base64Decode(
    'ChZHZXRQaG9uZU51bWJlclJlc3BvbnNlEjcKDHBob25lX251bWJlchgBIAEoCzIULmxpdmVraX'
    'QuUGhvbmVOdW1iZXJSC3Bob25lTnVtYmVy');

@$core.Deprecated('Use updatePhoneNumberRequestDescriptor instead')
const UpdatePhoneNumberRequest$json = {
  '1': 'UpdatePhoneNumberRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'id', '17': true},
    {'1': 'phone_number', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'phoneNumber', '17': true},
    {'1': 'sip_dispatch_rule_id', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'sipDispatchRuleId', '17': true},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_phone_number'},
    {'1': '_sip_dispatch_rule_id'},
  ],
};

/// Descriptor for `UpdatePhoneNumberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePhoneNumberRequestDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVQaG9uZU51bWJlclJlcXVlc3QSEwoCaWQYASABKAlIAFICaWSIAQESJgoMcGhvbm'
    'VfbnVtYmVyGAIgASgJSAFSC3Bob25lTnVtYmVyiAEBEjQKFHNpcF9kaXNwYXRjaF9ydWxlX2lk'
    'GAMgASgJSAJSEXNpcERpc3BhdGNoUnVsZUlkiAEBQgUKA19pZEIPCg1fcGhvbmVfbnVtYmVyQh'
    'cKFV9zaXBfZGlzcGF0Y2hfcnVsZV9pZA==');

@$core.Deprecated('Use updatePhoneNumberResponseDescriptor instead')
const UpdatePhoneNumberResponse$json = {
  '1': 'UpdatePhoneNumberResponse',
  '2': [
    {'1': 'phone_number', '3': 1, '4': 1, '5': 11, '6': '.livekit.PhoneNumber', '10': 'phoneNumber'},
  ],
};

/// Descriptor for `UpdatePhoneNumberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePhoneNumberResponseDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVQaG9uZU51bWJlclJlc3BvbnNlEjcKDHBob25lX251bWJlchgBIAEoCzIULmxpdm'
    'VraXQuUGhvbmVOdW1iZXJSC3Bob25lTnVtYmVy');

@$core.Deprecated('Use releasePhoneNumbersRequestDescriptor instead')
const ReleasePhoneNumbersRequest$json = {
  '1': 'ReleasePhoneNumbersRequest',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
    {'1': 'phone_numbers', '3': 2, '4': 3, '5': 9, '10': 'phoneNumbers'},
  ],
};

/// Descriptor for `ReleasePhoneNumbersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List releasePhoneNumbersRequestDescriptor = $convert.base64Decode(
    'ChpSZWxlYXNlUGhvbmVOdW1iZXJzUmVxdWVzdBIQCgNpZHMYASADKAlSA2lkcxIjCg1waG9uZV'
    '9udW1iZXJzGAIgAygJUgxwaG9uZU51bWJlcnM=');

@$core.Deprecated('Use releasePhoneNumbersResponseDescriptor instead')
const ReleasePhoneNumbersResponse$json = {
  '1': 'ReleasePhoneNumbersResponse',
};

/// Descriptor for `ReleasePhoneNumbersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List releasePhoneNumbersResponseDescriptor = $convert.base64Decode(
    'ChtSZWxlYXNlUGhvbmVOdW1iZXJzUmVzcG9uc2U=');

@$core.Deprecated('Use phoneNumberDescriptor instead')
const PhoneNumber$json = {
  '1': 'PhoneNumber',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'e164_format', '3': 2, '4': 1, '5': 9, '10': 'e164Format'},
    {'1': 'country_code', '3': 3, '4': 1, '5': 9, '10': 'countryCode'},
    {'1': 'area_code', '3': 4, '4': 1, '5': 9, '10': 'areaCode'},
    {'1': 'number_type', '3': 5, '4': 1, '5': 14, '6': '.livekit.PhoneNumberType', '10': 'numberType'},
    {'1': 'locality', '3': 6, '4': 1, '5': 9, '10': 'locality'},
    {'1': 'region', '3': 7, '4': 1, '5': 9, '10': 'region'},
    {'1': 'spam_score', '3': 8, '4': 1, '5': 1, '10': 'spamScore'},
    {'1': 'created_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'capabilities', '3': 11, '4': 3, '5': 9, '10': 'capabilities'},
    {'1': 'status', '3': 12, '4': 1, '5': 14, '6': '.livekit.PhoneNumberStatus', '10': 'status'},
    {'1': 'assigned_at', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'assignedAt'},
    {'1': 'released_at', '3': 14, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'releasedAt'},
    {
      '1': 'sip_dispatch_rule_id',
      '3': 15,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'sipDispatchRuleId',
    },
    {'1': 'sip_dispatch_rule_ids', '3': 16, '4': 3, '5': 9, '10': 'sipDispatchRuleIds'},
  ],
};

/// Descriptor for `PhoneNumber`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List phoneNumberDescriptor = $convert.base64Decode(
    'CgtQaG9uZU51bWJlchIOCgJpZBgBIAEoCVICaWQSHwoLZTE2NF9mb3JtYXQYAiABKAlSCmUxNj'
    'RGb3JtYXQSIQoMY291bnRyeV9jb2RlGAMgASgJUgtjb3VudHJ5Q29kZRIbCglhcmVhX2NvZGUY'
    'BCABKAlSCGFyZWFDb2RlEjkKC251bWJlcl90eXBlGAUgASgOMhgubGl2ZWtpdC5QaG9uZU51bW'
    'JlclR5cGVSCm51bWJlclR5cGUSGgoIbG9jYWxpdHkYBiABKAlSCGxvY2FsaXR5EhYKBnJlZ2lv'
    'bhgHIAEoCVIGcmVnaW9uEh0KCnNwYW1fc2NvcmUYCCABKAFSCXNwYW1TY29yZRI5CgpjcmVhdG'
    'VkX2F0GAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVw'
    'ZGF0ZWRfYXQYCiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQSIg'
    'oMY2FwYWJpbGl0aWVzGAsgAygJUgxjYXBhYmlsaXRpZXMSMgoGc3RhdHVzGAwgASgOMhoubGl2'
    'ZWtpdC5QaG9uZU51bWJlclN0YXR1c1IGc3RhdHVzEjsKC2Fzc2lnbmVkX2F0GA0gASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKYXNzaWduZWRBdBI7CgtyZWxlYXNlZF9hdBgOIAEo'
    'CzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCnJlbGVhc2VkQXQSMwoUc2lwX2Rpc3BhdG'
    'NoX3J1bGVfaWQYDyABKAlCAhgBUhFzaXBEaXNwYXRjaFJ1bGVJZBIxChVzaXBfZGlzcGF0Y2hf'
    'cnVsZV9pZHMYECADKAlSEnNpcERpc3BhdGNoUnVsZUlkcw==');

const $core.Map<$core.String, $core.dynamic> PhoneNumberServiceBase$json = {
  '1': 'PhoneNumberService',
  '2': [
    {'1': 'SearchPhoneNumbers', '2': '.livekit.SearchPhoneNumbersRequest', '3': '.livekit.SearchPhoneNumbersResponse', '4': {}},
    {'1': 'PurchasePhoneNumber', '2': '.livekit.PurchasePhoneNumberRequest', '3': '.livekit.PurchasePhoneNumberResponse', '4': {}},
    {'1': 'ListPhoneNumbers', '2': '.livekit.ListPhoneNumbersRequest', '3': '.livekit.ListPhoneNumbersResponse', '4': {}},
    {'1': 'GetPhoneNumber', '2': '.livekit.GetPhoneNumberRequest', '3': '.livekit.GetPhoneNumberResponse', '4': {}},
    {'1': 'UpdatePhoneNumber', '2': '.livekit.UpdatePhoneNumberRequest', '3': '.livekit.UpdatePhoneNumberResponse', '4': {}},
    {'1': 'ReleasePhoneNumbers', '2': '.livekit.ReleasePhoneNumbersRequest', '3': '.livekit.ReleasePhoneNumbersResponse', '4': {}},
  ],
};

@$core.Deprecated('Use phoneNumberServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> PhoneNumberServiceBase$messageJson = {
  '.livekit.SearchPhoneNumbersRequest': SearchPhoneNumbersRequest$json,
  '.livekit.TokenPagination': $2.TokenPagination$json,
  '.livekit.SearchPhoneNumbersResponse': SearchPhoneNumbersResponse$json,
  '.livekit.PhoneNumber': PhoneNumber$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.livekit.PurchasePhoneNumberRequest': PurchasePhoneNumberRequest$json,
  '.livekit.PurchasePhoneNumberResponse': PurchasePhoneNumberResponse$json,
  '.livekit.ListPhoneNumbersRequest': ListPhoneNumbersRequest$json,
  '.livekit.ListPhoneNumbersResponse': ListPhoneNumbersResponse$json,
  '.livekit.GetPhoneNumberRequest': GetPhoneNumberRequest$json,
  '.livekit.GetPhoneNumberResponse': GetPhoneNumberResponse$json,
  '.livekit.UpdatePhoneNumberRequest': UpdatePhoneNumberRequest$json,
  '.livekit.UpdatePhoneNumberResponse': UpdatePhoneNumberResponse$json,
  '.livekit.ReleasePhoneNumbersRequest': ReleasePhoneNumbersRequest$json,
  '.livekit.ReleasePhoneNumbersResponse': ReleasePhoneNumbersResponse$json,
};

/// Descriptor for `PhoneNumberService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List phoneNumberServiceDescriptor = $convert.base64Decode(
    'ChJQaG9uZU51bWJlclNlcnZpY2USXwoSU2VhcmNoUGhvbmVOdW1iZXJzEiIubGl2ZWtpdC5TZW'
    'FyY2hQaG9uZU51bWJlcnNSZXF1ZXN0GiMubGl2ZWtpdC5TZWFyY2hQaG9uZU51bWJlcnNSZXNw'
    'b25zZSIAEmIKE1B1cmNoYXNlUGhvbmVOdW1iZXISIy5saXZla2l0LlB1cmNoYXNlUGhvbmVOdW'
    '1iZXJSZXF1ZXN0GiQubGl2ZWtpdC5QdXJjaGFzZVBob25lTnVtYmVyUmVzcG9uc2UiABJZChBM'
    'aXN0UGhvbmVOdW1iZXJzEiAubGl2ZWtpdC5MaXN0UGhvbmVOdW1iZXJzUmVxdWVzdBohLmxpdm'
    'VraXQuTGlzdFBob25lTnVtYmVyc1Jlc3BvbnNlIgASUwoOR2V0UGhvbmVOdW1iZXISHi5saXZl'
    'a2l0LkdldFBob25lTnVtYmVyUmVxdWVzdBofLmxpdmVraXQuR2V0UGhvbmVOdW1iZXJSZXNwb2'
    '5zZSIAElwKEVVwZGF0ZVBob25lTnVtYmVyEiEubGl2ZWtpdC5VcGRhdGVQaG9uZU51bWJlclJl'
    'cXVlc3QaIi5saXZla2l0LlVwZGF0ZVBob25lTnVtYmVyUmVzcG9uc2UiABJiChNSZWxlYXNlUG'
    'hvbmVOdW1iZXJzEiMubGl2ZWtpdC5SZWxlYXNlUGhvbmVOdW1iZXJzUmVxdWVzdBokLmxpdmVr'
    'aXQuUmVsZWFzZVBob25lTnVtYmVyc1Jlc3BvbnNlIgA=');

