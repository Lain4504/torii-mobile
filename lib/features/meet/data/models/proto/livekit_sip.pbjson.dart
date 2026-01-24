//
//  Generated code. Do not modify.
//  source: livekit_sip.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'google/protobuf/duration.pbjson.dart' as $10;
import 'google/protobuf/empty.pbjson.dart' as $3;
import 'livekit_agent_dispatch.pbjson.dart' as $6;
import 'livekit_egress.pbjson.dart' as $7;
import 'livekit_models.pbjson.dart' as $2;
import 'livekit_room.pbjson.dart' as $9;

@$core.Deprecated('Use sIPStatusCodeDescriptor instead')
const SIPStatusCode$json = {
  '1': 'SIPStatusCode',
  '2': [
    {'1': 'SIP_STATUS_UNKNOWN', '2': 0},
    {'1': 'SIP_STATUS_TRYING', '2': 100},
    {'1': 'SIP_STATUS_RINGING', '2': 180},
    {'1': 'SIP_STATUS_CALL_IS_FORWARDED', '2': 181},
    {'1': 'SIP_STATUS_QUEUED', '2': 182},
    {'1': 'SIP_STATUS_SESSION_PROGRESS', '2': 183},
    {'1': 'SIP_STATUS_EARLY_DIALOG_TERMINATED', '2': 199},
    {'1': 'SIP_STATUS_OK', '2': 200},
    {'1': 'SIP_STATUS_ACCEPTED', '2': 202},
    {'1': 'SIP_STATUS_NO_NOTIFICATION', '2': 204},
    {'1': 'SIP_STATUS_MULTIPLE_CHOICES', '2': 300},
    {'1': 'SIP_STATUS_MOVED_PERMANENTLY', '2': 301},
    {'1': 'SIP_STATUS_MOVED_TEMPORARILY', '2': 302},
    {'1': 'SIP_STATUS_USE_PROXY', '2': 305},
    {'1': 'SIP_STATUS_ALTERNATIVE_SERVICE', '2': 380},
    {'1': 'SIP_STATUS_BAD_REQUEST', '2': 400},
    {'1': 'SIP_STATUS_UNAUTHORIZED', '2': 401},
    {'1': 'SIP_STATUS_PAYMENT_REQUIRED', '2': 402},
    {'1': 'SIP_STATUS_FORBIDDEN', '2': 403},
    {'1': 'SIP_STATUS_NOTFOUND', '2': 404},
    {'1': 'SIP_STATUS_METHOD_NOT_ALLOWED', '2': 405},
    {'1': 'SIP_STATUS_NOT_ACCEPTABLE', '2': 406},
    {'1': 'SIP_STATUS_PROXY_AUTH_REQUIRED', '2': 407},
    {'1': 'SIP_STATUS_REQUEST_TIMEOUT', '2': 408},
    {'1': 'SIP_STATUS_CONFLICT', '2': 409},
    {'1': 'SIP_STATUS_GONE', '2': 410},
    {'1': 'SIP_STATUS_LENGTH_REQUIRED', '2': 411},
    {'1': 'SIP_STATUS_CONDITIONAL_REQUEST_FAILED', '2': 412},
    {'1': 'SIP_STATUS_REQUEST_ENTITY_TOO_LARGE', '2': 413},
    {'1': 'SIP_STATUS_REQUEST_URI_TOO_LONG', '2': 414},
    {'1': 'SIP_STATUS_UNSUPPORTED_MEDIA_TYPE', '2': 415},
    {'1': 'SIP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE', '2': 416},
    {'1': 'SIP_STATUS_UNKNOWN_RESOURCE_PRIORITY', '2': 417},
    {'1': 'SIP_STATUS_BAD_EXTENSION', '2': 420},
    {'1': 'SIP_STATUS_EXTENSION_REQUIRED', '2': 421},
    {'1': 'SIP_STATUS_SESSION_INTERVAL_TOO_SMALL', '2': 422},
    {'1': 'SIP_STATUS_INTERVAL_TOO_BRIEF', '2': 423},
    {'1': 'SIP_STATUS_BAD_LOCATION_INFORMATION', '2': 424},
    {'1': 'SIP_STATUS_BAD_ALERT_MESSAGE', '2': 425},
    {'1': 'SIP_STATUS_USE_IDENTITY_HEADER', '2': 428},
    {'1': 'SIP_STATUS_PROVIDE_REFERRER_IDENTITY', '2': 429},
    {'1': 'SIP_STATUS_FLOW_FAILED', '2': 430},
    {'1': 'SIP_STATUS_ANONYMITY_DISALLOWED', '2': 433},
    {'1': 'SIP_STATUS_BAD_IDENTITY_INFO', '2': 436},
    {'1': 'SIP_STATUS_UNSUPPORTED_CERTIFICATE', '2': 437},
    {'1': 'SIP_STATUS_INVALID_IDENTITY_HEADER', '2': 438},
    {'1': 'SIP_STATUS_FIRST_HOP_LACKS_OUTBOUND_SUPPORT', '2': 439},
    {'1': 'SIP_STATUS_MAX_BREADTH_EXCEEDED', '2': 440},
    {'1': 'SIP_STATUS_BAD_INFO_PACKAGE', '2': 469},
    {'1': 'SIP_STATUS_CONSENT_NEEDED', '2': 470},
    {'1': 'SIP_STATUS_TEMPORARILY_UNAVAILABLE', '2': 480},
    {'1': 'SIP_STATUS_CALL_TRANSACTION_DOES_NOT_EXISTS', '2': 481},
    {'1': 'SIP_STATUS_LOOP_DETECTED', '2': 482},
    {'1': 'SIP_STATUS_TOO_MANY_HOPS', '2': 483},
    {'1': 'SIP_STATUS_ADDRESS_INCOMPLETE', '2': 484},
    {'1': 'SIP_STATUS_AMBIGUOUS', '2': 485},
    {'1': 'SIP_STATUS_BUSY_HERE', '2': 486},
    {'1': 'SIP_STATUS_REQUEST_TERMINATED', '2': 487},
    {'1': 'SIP_STATUS_NOT_ACCEPTABLE_HERE', '2': 488},
    {'1': 'SIP_STATUS_BAD_EVENT', '2': 489},
    {'1': 'SIP_STATUS_REQUEST_PENDING', '2': 491},
    {'1': 'SIP_STATUS_UNDECIPHERABLE', '2': 493},
    {'1': 'SIP_STATUS_SECURITY_AGREEMENT_REQUIRED', '2': 494},
    {'1': 'SIP_STATUS_INTERNAL_SERVER_ERROR', '2': 500},
    {'1': 'SIP_STATUS_NOT_IMPLEMENTED', '2': 501},
    {'1': 'SIP_STATUS_BAD_GATEWAY', '2': 502},
    {'1': 'SIP_STATUS_SERVICE_UNAVAILABLE', '2': 503},
    {'1': 'SIP_STATUS_GATEWAY_TIMEOUT', '2': 504},
    {'1': 'SIP_STATUS_VERSION_NOT_SUPPORTED', '2': 505},
    {'1': 'SIP_STATUS_MESSAGE_TOO_LARGE', '2': 513},
    {'1': 'SIP_STATUS_GLOBAL_BUSY_EVERYWHERE', '2': 600},
    {'1': 'SIP_STATUS_GLOBAL_DECLINE', '2': 603},
    {'1': 'SIP_STATUS_GLOBAL_DOES_NOT_EXIST_ANYWHERE', '2': 604},
    {'1': 'SIP_STATUS_GLOBAL_NOT_ACCEPTABLE', '2': 606},
    {'1': 'SIP_STATUS_GLOBAL_UNWANTED', '2': 607},
    {'1': 'SIP_STATUS_GLOBAL_REJECTED', '2': 608},
  ],
};

/// Descriptor for `SIPStatusCode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sIPStatusCodeDescriptor = $convert.base64Decode(
    'Cg1TSVBTdGF0dXNDb2RlEhYKElNJUF9TVEFUVVNfVU5LTk9XThAAEhUKEVNJUF9TVEFUVVNfVF'
    'JZSU5HEGQSFwoSU0lQX1NUQVRVU19SSU5HSU5HELQBEiEKHFNJUF9TVEFUVVNfQ0FMTF9JU19G'
    'T1JXQVJERUQQtQESFgoRU0lQX1NUQVRVU19RVUVVRUQQtgESIAobU0lQX1NUQVRVU19TRVNTSU'
    '9OX1BST0dSRVNTELcBEicKIlNJUF9TVEFUVVNfRUFSTFlfRElBTE9HX1RFUk1JTkFURUQQxwES'
    'EgoNU0lQX1NUQVRVU19PSxDIARIYChNTSVBfU1RBVFVTX0FDQ0VQVEVEEMoBEh8KGlNJUF9TVE'
    'FUVVNfTk9fTk9USUZJQ0FUSU9OEMwBEiAKG1NJUF9TVEFUVVNfTVVMVElQTEVfQ0hPSUNFUxCs'
    'AhIhChxTSVBfU1RBVFVTX01PVkVEX1BFUk1BTkVOVExZEK0CEiEKHFNJUF9TVEFUVVNfTU9WRU'
    'RfVEVNUE9SQVJJTFkQrgISGQoUU0lQX1NUQVRVU19VU0VfUFJPWFkQsQISIwoeU0lQX1NUQVRV'
    'U19BTFRFUk5BVElWRV9TRVJWSUNFEPwCEhsKFlNJUF9TVEFUVVNfQkFEX1JFUVVFU1QQkAMSHA'
    'oXU0lQX1NUQVRVU19VTkFVVEhPUklaRUQQkQMSIAobU0lQX1NUQVRVU19QQVlNRU5UX1JFUVVJ'
    'UkVEEJIDEhkKFFNJUF9TVEFUVVNfRk9SQklEREVOEJMDEhgKE1NJUF9TVEFUVVNfTk9URk9VTk'
    'QQlAMSIgodU0lQX1NUQVRVU19NRVRIT0RfTk9UX0FMTE9XRUQQlQMSHgoZU0lQX1NUQVRVU19O'
    'T1RfQUNDRVBUQUJMRRCWAxIjCh5TSVBfU1RBVFVTX1BST1hZX0FVVEhfUkVRVUlSRUQQlwMSHw'
    'oaU0lQX1NUQVRVU19SRVFVRVNUX1RJTUVPVVQQmAMSGAoTU0lQX1NUQVRVU19DT05GTElDVBCZ'
    'AxIUCg9TSVBfU1RBVFVTX0dPTkUQmgMSHwoaU0lQX1NUQVRVU19MRU5HVEhfUkVRVUlSRUQQmw'
    'MSKgolU0lQX1NUQVRVU19DT05ESVRJT05BTF9SRVFVRVNUX0ZBSUxFRBCcAxIoCiNTSVBfU1RB'
    'VFVTX1JFUVVFU1RfRU5USVRZX1RPT19MQVJHRRCdAxIkCh9TSVBfU1RBVFVTX1JFUVVFU1RfVV'
    'JJX1RPT19MT05HEJ4DEiYKIVNJUF9TVEFUVVNfVU5TVVBQT1JURURfTUVESUFfVFlQRRCfAxIv'
    'CipTSVBfU1RBVFVTX1JFUVVFU1RFRF9SQU5HRV9OT1RfU0FUSVNGSUFCTEUQoAMSKQokU0lQX1'
    'NUQVRVU19VTktOT1dOX1JFU09VUkNFX1BSSU9SSVRZEKEDEh0KGFNJUF9TVEFUVVNfQkFEX0VY'
    'VEVOU0lPThCkAxIiCh1TSVBfU1RBVFVTX0VYVEVOU0lPTl9SRVFVSVJFRBClAxIqCiVTSVBfU1'
    'RBVFVTX1NFU1NJT05fSU5URVJWQUxfVE9PX1NNQUxMEKYDEiIKHVNJUF9TVEFUVVNfSU5URVJW'
    'QUxfVE9PX0JSSUVGEKcDEigKI1NJUF9TVEFUVVNfQkFEX0xPQ0FUSU9OX0lORk9STUFUSU9OEK'
    'gDEiEKHFNJUF9TVEFUVVNfQkFEX0FMRVJUX01FU1NBR0UQqQMSIwoeU0lQX1NUQVRVU19VU0Vf'
    'SURFTlRJVFlfSEVBREVSEKwDEikKJFNJUF9TVEFUVVNfUFJPVklERV9SRUZFUlJFUl9JREVOVE'
    'lUWRCtAxIbChZTSVBfU1RBVFVTX0ZMT1dfRkFJTEVEEK4DEiQKH1NJUF9TVEFUVVNfQU5PTllN'
    'SVRZX0RJU0FMTE9XRUQQsQMSIQocU0lQX1NUQVRVU19CQURfSURFTlRJVFlfSU5GTxC0AxInCi'
    'JTSVBfU1RBVFVTX1VOU1VQUE9SVEVEX0NFUlRJRklDQVRFELUDEicKIlNJUF9TVEFUVVNfSU5W'
    'QUxJRF9JREVOVElUWV9IRUFERVIQtgMSMAorU0lQX1NUQVRVU19GSVJTVF9IT1BfTEFDS1NfT1'
    'VUQk9VTkRfU1VQUE9SVBC3AxIkCh9TSVBfU1RBVFVTX01BWF9CUkVBRFRIX0VYQ0VFREVEELgD'
    'EiAKG1NJUF9TVEFUVVNfQkFEX0lORk9fUEFDS0FHRRDVAxIeChlTSVBfU1RBVFVTX0NPTlNFTl'
    'RfTkVFREVEENYDEicKIlNJUF9TVEFUVVNfVEVNUE9SQVJJTFlfVU5BVkFJTEFCTEUQ4AMSMAor'
    'U0lQX1NUQVRVU19DQUxMX1RSQU5TQUNUSU9OX0RPRVNfTk9UX0VYSVNUUxDhAxIdChhTSVBfU1'
    'RBVFVTX0xPT1BfREVURUNURUQQ4gMSHQoYU0lQX1NUQVRVU19UT09fTUFOWV9IT1BTEOMDEiIK'
    'HVNJUF9TVEFUVVNfQUREUkVTU19JTkNPTVBMRVRFEOQDEhkKFFNJUF9TVEFUVVNfQU1CSUdVT1'
    'VTEOUDEhkKFFNJUF9TVEFUVVNfQlVTWV9IRVJFEOYDEiIKHVNJUF9TVEFUVVNfUkVRVUVTVF9U'
    'RVJNSU5BVEVEEOcDEiMKHlNJUF9TVEFUVVNfTk9UX0FDQ0VQVEFCTEVfSEVSRRDoAxIZChRTSV'
    'BfU1RBVFVTX0JBRF9FVkVOVBDpAxIfChpTSVBfU1RBVFVTX1JFUVVFU1RfUEVORElORxDrAxIe'
    'ChlTSVBfU1RBVFVTX1VOREVDSVBIRVJBQkxFEO0DEisKJlNJUF9TVEFUVVNfU0VDVVJJVFlfQU'
    'dSRUVNRU5UX1JFUVVJUkVEEO4DEiUKIFNJUF9TVEFUVVNfSU5URVJOQUxfU0VSVkVSX0VSUk9S'
    'EPQDEh8KGlNJUF9TVEFUVVNfTk9UX0lNUExFTUVOVEVEEPUDEhsKFlNJUF9TVEFUVVNfQkFEX0'
    'dBVEVXQVkQ9gMSIwoeU0lQX1NUQVRVU19TRVJWSUNFX1VOQVZBSUxBQkxFEPcDEh8KGlNJUF9T'
    'VEFUVVNfR0FURVdBWV9USU1FT1VUEPgDEiUKIFNJUF9TVEFUVVNfVkVSU0lPTl9OT1RfU1VQUE'
    '9SVEVEEPkDEiEKHFNJUF9TVEFUVVNfTUVTU0FHRV9UT09fTEFSR0UQgQQSJgohU0lQX1NUQVRV'
    'U19HTE9CQUxfQlVTWV9FVkVSWVdIRVJFENgEEh4KGVNJUF9TVEFUVVNfR0xPQkFMX0RFQ0xJTk'
    'UQ2wQSLgopU0lQX1NUQVRVU19HTE9CQUxfRE9FU19OT1RfRVhJU1RfQU5ZV0hFUkUQ3AQSJQog'
    'U0lQX1NUQVRVU19HTE9CQUxfTk9UX0FDQ0VQVEFCTEUQ3gQSHwoaU0lQX1NUQVRVU19HTE9CQU'
    'xfVU5XQU5URUQQ3wQSHwoaU0lQX1NUQVRVU19HTE9CQUxfUkVKRUNURUQQ4AQ=');

@$core.Deprecated('Use sIPTransportDescriptor instead')
const SIPTransport$json = {
  '1': 'SIPTransport',
  '2': [
    {'1': 'SIP_TRANSPORT_AUTO', '2': 0},
    {'1': 'SIP_TRANSPORT_UDP', '2': 1},
    {'1': 'SIP_TRANSPORT_TCP', '2': 2},
    {'1': 'SIP_TRANSPORT_TLS', '2': 3},
  ],
};

/// Descriptor for `SIPTransport`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sIPTransportDescriptor = $convert.base64Decode(
    'CgxTSVBUcmFuc3BvcnQSFgoSU0lQX1RSQU5TUE9SVF9BVVRPEAASFQoRU0lQX1RSQU5TUE9SVF'
    '9VRFAQARIVChFTSVBfVFJBTlNQT1JUX1RDUBACEhUKEVNJUF9UUkFOU1BPUlRfVExTEAM=');

@$core.Deprecated('Use sIPHeaderOptionsDescriptor instead')
const SIPHeaderOptions$json = {
  '1': 'SIPHeaderOptions',
  '2': [
    {'1': 'SIP_NO_HEADERS', '2': 0},
    {'1': 'SIP_X_HEADERS', '2': 1},
    {'1': 'SIP_ALL_HEADERS', '2': 2},
  ],
};

/// Descriptor for `SIPHeaderOptions`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sIPHeaderOptionsDescriptor = $convert.base64Decode(
    'ChBTSVBIZWFkZXJPcHRpb25zEhIKDlNJUF9OT19IRUFERVJTEAASEQoNU0lQX1hfSEVBREVSUx'
    'ABEhMKD1NJUF9BTExfSEVBREVSUxAC');

@$core.Deprecated('Use sIPMediaEncryptionDescriptor instead')
const SIPMediaEncryption$json = {
  '1': 'SIPMediaEncryption',
  '2': [
    {'1': 'SIP_MEDIA_ENCRYPT_DISABLE', '2': 0},
    {'1': 'SIP_MEDIA_ENCRYPT_ALLOW', '2': 1},
    {'1': 'SIP_MEDIA_ENCRYPT_REQUIRE', '2': 2},
  ],
};

/// Descriptor for `SIPMediaEncryption`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sIPMediaEncryptionDescriptor = $convert.base64Decode(
    'ChJTSVBNZWRpYUVuY3J5cHRpb24SHQoZU0lQX01FRElBX0VOQ1JZUFRfRElTQUJMRRAAEhsKF1'
    'NJUF9NRURJQV9FTkNSWVBUX0FMTE9XEAESHQoZU0lQX01FRElBX0VOQ1JZUFRfUkVRVUlSRRAC');

@$core.Deprecated('Use providerTypeDescriptor instead')
const ProviderType$json = {
  '1': 'ProviderType',
  '2': [
    {'1': 'PROVIDER_TYPE_UNKNOWN', '2': 0},
    {'1': 'PROVIDER_TYPE_INTERNAL', '2': 1},
    {'1': 'PROVIDER_TYPE_EXTERNAL', '2': 2},
  ],
};

/// Descriptor for `ProviderType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List providerTypeDescriptor = $convert.base64Decode(
    'CgxQcm92aWRlclR5cGUSGQoVUFJPVklERVJfVFlQRV9VTktOT1dOEAASGgoWUFJPVklERVJfVF'
    'lQRV9JTlRFUk5BTBABEhoKFlBST1ZJREVSX1RZUEVfRVhURVJOQUwQAg==');

@$core.Deprecated('Use sIPCallStatusDescriptor instead')
const SIPCallStatus$json = {
  '1': 'SIPCallStatus',
  '2': [
    {'1': 'SCS_CALL_INCOMING', '2': 0},
    {'1': 'SCS_PARTICIPANT_JOINED', '2': 1},
    {'1': 'SCS_ACTIVE', '2': 2},
    {'1': 'SCS_DISCONNECTED', '2': 3},
    {'1': 'SCS_ERROR', '2': 4},
  ],
};

/// Descriptor for `SIPCallStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sIPCallStatusDescriptor = $convert.base64Decode(
    'Cg1TSVBDYWxsU3RhdHVzEhUKEVNDU19DQUxMX0lOQ09NSU5HEAASGgoWU0NTX1BBUlRJQ0lQQU'
    '5UX0pPSU5FRBABEg4KClNDU19BQ1RJVkUQAhIUChBTQ1NfRElTQ09OTkVDVEVEEAMSDQoJU0NT'
    'X0VSUk9SEAQ=');

@$core.Deprecated('Use sIPTransferStatusDescriptor instead')
const SIPTransferStatus$json = {
  '1': 'SIPTransferStatus',
  '2': [
    {'1': 'STS_TRANSFER_ONGOING', '2': 0},
    {'1': 'STS_TRANSFER_FAILED', '2': 1},
    {'1': 'STS_TRANSFER_SUCCESSFUL', '2': 2},
  ],
};

/// Descriptor for `SIPTransferStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sIPTransferStatusDescriptor = $convert.base64Decode(
    'ChFTSVBUcmFuc2ZlclN0YXR1cxIYChRTVFNfVFJBTlNGRVJfT05HT0lORxAAEhcKE1NUU19UUk'
    'FOU0ZFUl9GQUlMRUQQARIbChdTVFNfVFJBTlNGRVJfU1VDQ0VTU0ZVTBAC');

@$core.Deprecated('Use sIPFeatureDescriptor instead')
const SIPFeature$json = {
  '1': 'SIPFeature',
  '2': [
    {'1': 'NONE', '2': 0},
    {'1': 'KRISP_ENABLED', '2': 1},
  ],
};

/// Descriptor for `SIPFeature`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sIPFeatureDescriptor = $convert.base64Decode(
    'CgpTSVBGZWF0dXJlEggKBE5PTkUQABIRCg1LUklTUF9FTkFCTEVEEAE=');

@$core.Deprecated('Use sIPCallDirectionDescriptor instead')
const SIPCallDirection$json = {
  '1': 'SIPCallDirection',
  '2': [
    {'1': 'SCD_UNKNOWN', '2': 0},
    {'1': 'SCD_INBOUND', '2': 1},
    {'1': 'SCD_OUTBOUND', '2': 2},
  ],
};

/// Descriptor for `SIPCallDirection`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sIPCallDirectionDescriptor = $convert.base64Decode(
    'ChBTSVBDYWxsRGlyZWN0aW9uEg8KC1NDRF9VTktOT1dOEAASDwoLU0NEX0lOQk9VTkQQARIQCg'
    'xTQ0RfT1VUQk9VTkQQAg==');

@$core.Deprecated('Use sIPStatusDescriptor instead')
const SIPStatus$json = {
  '1': 'SIPStatus',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.livekit.SIPStatusCode', '10': 'code'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `SIPStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPStatusDescriptor = $convert.base64Decode(
    'CglTSVBTdGF0dXMSKgoEY29kZRgBIAEoDjIWLmxpdmVraXQuU0lQU3RhdHVzQ29kZVIEY29kZR'
    'IWCgZzdGF0dXMYAiABKAlSBnN0YXR1cw==');

@$core.Deprecated('Use createSIPTrunkRequestDescriptor instead')
const CreateSIPTrunkRequest$json = {
  '1': 'CreateSIPTrunkRequest',
  '2': [
    {'1': 'inbound_addresses', '3': 1, '4': 3, '5': 9, '10': 'inboundAddresses'},
    {'1': 'outbound_address', '3': 2, '4': 1, '5': 9, '10': 'outboundAddress'},
    {'1': 'outbound_number', '3': 3, '4': 1, '5': 9, '10': 'outboundNumber'},
    {
      '1': 'inbound_numbers_regex',
      '3': 4,
      '4': 3,
      '5': 9,
      '8': {'3': true},
      '10': 'inboundNumbersRegex',
    },
    {'1': 'inbound_numbers', '3': 9, '4': 3, '5': 9, '10': 'inboundNumbers'},
    {'1': 'inbound_username', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'inboundUsername'},
    {'1': 'inbound_password', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'inboundPassword'},
    {'1': 'outbound_username', '3': 7, '4': 1, '5': 9, '8': {}, '10': 'outboundUsername'},
    {'1': 'outbound_password', '3': 8, '4': 1, '5': 9, '8': {}, '10': 'outboundPassword'},
    {'1': 'name', '3': 10, '4': 1, '5': 9, '10': 'name'},
    {'1': 'metadata', '3': 11, '4': 1, '5': 9, '8': {}, '10': 'metadata'},
  ],
  '7': {'3': true},
};

/// Descriptor for `CreateSIPTrunkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSIPTrunkRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVTSVBUcnVua1JlcXVlc3QSKwoRaW5ib3VuZF9hZGRyZXNzZXMYASADKAlSEGluYm'
    '91bmRBZGRyZXNzZXMSKQoQb3V0Ym91bmRfYWRkcmVzcxgCIAEoCVIPb3V0Ym91bmRBZGRyZXNz'
    'EicKD291dGJvdW5kX251bWJlchgDIAEoCVIOb3V0Ym91bmROdW1iZXISNgoVaW5ib3VuZF9udW'
    '1iZXJzX3JlZ2V4GAQgAygJQgIYAVITaW5ib3VuZE51bWJlcnNSZWdleBInCg9pbmJvdW5kX251'
    'bWJlcnMYCSADKAlSDmluYm91bmROdW1iZXJzElEKEGluYm91bmRfdXNlcm5hbWUYBSABKAlCJo'
    'i1GAGStRgePHJlZGFjdGVkICh7eyAuU2l6ZSB9fSBieXRlcyk+Ug9pbmJvdW5kVXNlcm5hbWUS'
    'UQoQaW5ib3VuZF9wYXNzd29yZBgGIAEoCUImiLUYAZK1GB48cmVkYWN0ZWQgKHt7IC5TaXplIH'
    '19IGJ5dGVzKT5SD2luYm91bmRQYXNzd29yZBJTChFvdXRib3VuZF91c2VybmFtZRgHIAEoCUIm'
    'iLUYAZK1GB48cmVkYWN0ZWQgKHt7IC5TaXplIH19IGJ5dGVzKT5SEG91dGJvdW5kVXNlcm5hbW'
    'USUwoRb3V0Ym91bmRfcGFzc3dvcmQYCCABKAlCJoi1GAGStRgePHJlZGFjdGVkICh7eyAuU2l6'
    'ZSB9fSBieXRlcyk+UhBvdXRib3VuZFBhc3N3b3JkEhIKBG5hbWUYCiABKAlSBG5hbWUSQgoIbW'
    'V0YWRhdGEYCyABKAlCJoi1GAGStRgePHJlZGFjdGVkICh7eyAuU2l6ZSB9fSBieXRlcyk+Ught'
    'ZXRhZGF0YToCGAE=');

@$core.Deprecated('Use providerInfoDescriptor instead')
const ProviderInfo$json = {
  '1': 'ProviderInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.livekit.ProviderType', '10': 'type'},
    {'1': 'prevent_transfer', '3': 4, '4': 1, '5': 8, '10': 'preventTransfer'},
  ],
};

/// Descriptor for `ProviderInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List providerInfoDescriptor = $convert.base64Decode(
    'CgxQcm92aWRlckluZm8SDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSKQoEdH'
    'lwZRgDIAEoDjIVLmxpdmVraXQuUHJvdmlkZXJUeXBlUgR0eXBlEikKEHByZXZlbnRfdHJhbnNm'
    'ZXIYBCABKAhSD3ByZXZlbnRUcmFuc2Zlcg==');

@$core.Deprecated('Use sIPTrunkInfoDescriptor instead')
const SIPTrunkInfo$json = {
  '1': 'SIPTrunkInfo',
  '2': [
    {'1': 'sip_trunk_id', '3': 1, '4': 1, '5': 9, '10': 'sipTrunkId'},
    {'1': 'kind', '3': 14, '4': 1, '5': 14, '6': '.livekit.SIPTrunkInfo.TrunkKind', '10': 'kind'},
    {'1': 'inbound_addresses', '3': 2, '4': 3, '5': 9, '10': 'inboundAddresses'},
    {'1': 'outbound_address', '3': 3, '4': 1, '5': 9, '10': 'outboundAddress'},
    {'1': 'outbound_number', '3': 4, '4': 1, '5': 9, '10': 'outboundNumber'},
    {'1': 'transport', '3': 13, '4': 1, '5': 14, '6': '.livekit.SIPTransport', '10': 'transport'},
    {
      '1': 'inbound_numbers_regex',
      '3': 5,
      '4': 3,
      '5': 9,
      '8': {'3': true},
      '10': 'inboundNumbersRegex',
    },
    {'1': 'inbound_numbers', '3': 10, '4': 3, '5': 9, '10': 'inboundNumbers'},
    {'1': 'inbound_username', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'inboundUsername'},
    {'1': 'inbound_password', '3': 7, '4': 1, '5': 9, '8': {}, '10': 'inboundPassword'},
    {'1': 'outbound_username', '3': 8, '4': 1, '5': 9, '8': {}, '10': 'outboundUsername'},
    {'1': 'outbound_password', '3': 9, '4': 1, '5': 9, '8': {}, '10': 'outboundPassword'},
    {'1': 'name', '3': 11, '4': 1, '5': 9, '10': 'name'},
    {'1': 'metadata', '3': 12, '4': 1, '5': 9, '8': {}, '10': 'metadata'},
  ],
  '4': [SIPTrunkInfo_TrunkKind$json],
  '7': {'3': true},
};

@$core.Deprecated('Use sIPTrunkInfoDescriptor instead')
const SIPTrunkInfo_TrunkKind$json = {
  '1': 'TrunkKind',
  '2': [
    {'1': 'TRUNK_LEGACY', '2': 0},
    {'1': 'TRUNK_INBOUND', '2': 1},
    {'1': 'TRUNK_OUTBOUND', '2': 2},
  ],
};

/// Descriptor for `SIPTrunkInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPTrunkInfoDescriptor = $convert.base64Decode(
    'CgxTSVBUcnVua0luZm8SIAoMc2lwX3RydW5rX2lkGAEgASgJUgpzaXBUcnVua0lkEjMKBGtpbm'
    'QYDiABKA4yHy5saXZla2l0LlNJUFRydW5rSW5mby5UcnVua0tpbmRSBGtpbmQSKwoRaW5ib3Vu'
    'ZF9hZGRyZXNzZXMYAiADKAlSEGluYm91bmRBZGRyZXNzZXMSKQoQb3V0Ym91bmRfYWRkcmVzcx'
    'gDIAEoCVIPb3V0Ym91bmRBZGRyZXNzEicKD291dGJvdW5kX251bWJlchgEIAEoCVIOb3V0Ym91'
    'bmROdW1iZXISMwoJdHJhbnNwb3J0GA0gASgOMhUubGl2ZWtpdC5TSVBUcmFuc3BvcnRSCXRyYW'
    '5zcG9ydBI2ChVpbmJvdW5kX251bWJlcnNfcmVnZXgYBSADKAlCAhgBUhNpbmJvdW5kTnVtYmVy'
    'c1JlZ2V4EicKD2luYm91bmRfbnVtYmVycxgKIAMoCVIOaW5ib3VuZE51bWJlcnMSUQoQaW5ib3'
    'VuZF91c2VybmFtZRgGIAEoCUImiLUYAZK1GB48cmVkYWN0ZWQgKHt7IC5TaXplIH19IGJ5dGVz'
    'KT5SD2luYm91bmRVc2VybmFtZRJRChBpbmJvdW5kX3Bhc3N3b3JkGAcgASgJQiaItRgBkrUYHj'
    'xyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPlIPaW5ib3VuZFBhc3N3b3JkElMKEW91dGJv'
    'dW5kX3VzZXJuYW1lGAggASgJQiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZX'
    'MpPlIQb3V0Ym91bmRVc2VybmFtZRJTChFvdXRib3VuZF9wYXNzd29yZBgJIAEoCUImiLUYAZK1'
    'GB48cmVkYWN0ZWQgKHt7IC5TaXplIH19IGJ5dGVzKT5SEG91dGJvdW5kUGFzc3dvcmQSEgoEbm'
    'FtZRgLIAEoCVIEbmFtZRJCCghtZXRhZGF0YRgMIAEoCUImiLUYAZK1GB48cmVkYWN0ZWQgKHt7'
    'IC5TaXplIH19IGJ5dGVzKT5SCG1ldGFkYXRhIkQKCVRydW5rS2luZBIQCgxUUlVOS19MRUdBQ1'
    'kQABIRCg1UUlVOS19JTkJPVU5EEAESEgoOVFJVTktfT1VUQk9VTkQQAjoCGAE=');

@$core.Deprecated('Use createSIPInboundTrunkRequestDescriptor instead')
const CreateSIPInboundTrunkRequest$json = {
  '1': 'CreateSIPInboundTrunkRequest',
  '2': [
    {'1': 'trunk', '3': 1, '4': 1, '5': 11, '6': '.livekit.SIPInboundTrunkInfo', '10': 'trunk'},
  ],
};

/// Descriptor for `CreateSIPInboundTrunkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSIPInboundTrunkRequestDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVTSVBJbmJvdW5kVHJ1bmtSZXF1ZXN0EjIKBXRydW5rGAEgASgLMhwubGl2ZWtpdC'
    '5TSVBJbmJvdW5kVHJ1bmtJbmZvUgV0cnVuaw==');

@$core.Deprecated('Use updateSIPInboundTrunkRequestDescriptor instead')
const UpdateSIPInboundTrunkRequest$json = {
  '1': 'UpdateSIPInboundTrunkRequest',
  '2': [
    {'1': 'sip_trunk_id', '3': 1, '4': 1, '5': 9, '10': 'sipTrunkId'},
    {'1': 'replace', '3': 2, '4': 1, '5': 11, '6': '.livekit.SIPInboundTrunkInfo', '9': 0, '10': 'replace'},
    {'1': 'update', '3': 3, '4': 1, '5': 11, '6': '.livekit.SIPInboundTrunkUpdate', '9': 0, '10': 'update'},
  ],
  '8': [
    {'1': 'action'},
  ],
};

/// Descriptor for `UpdateSIPInboundTrunkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSIPInboundTrunkRequestDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVTSVBJbmJvdW5kVHJ1bmtSZXF1ZXN0EiAKDHNpcF90cnVua19pZBgBIAEoCVIKc2'
    'lwVHJ1bmtJZBI4CgdyZXBsYWNlGAIgASgLMhwubGl2ZWtpdC5TSVBJbmJvdW5kVHJ1bmtJbmZv'
    'SABSB3JlcGxhY2USOAoGdXBkYXRlGAMgASgLMh4ubGl2ZWtpdC5TSVBJbmJvdW5kVHJ1bmtVcG'
    'RhdGVIAFIGdXBkYXRlQggKBmFjdGlvbg==');

@$core.Deprecated('Use sIPInboundTrunkInfoDescriptor instead')
const SIPInboundTrunkInfo$json = {
  '1': 'SIPInboundTrunkInfo',
  '2': [
    {'1': 'sip_trunk_id', '3': 1, '4': 1, '5': 9, '10': 'sipTrunkId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'metadata', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'metadata'},
    {'1': 'numbers', '3': 4, '4': 3, '5': 9, '10': 'numbers'},
    {'1': 'allowed_addresses', '3': 5, '4': 3, '5': 9, '10': 'allowedAddresses'},
    {'1': 'allowed_numbers', '3': 6, '4': 3, '5': 9, '10': 'allowedNumbers'},
    {'1': 'auth_username', '3': 7, '4': 1, '5': 9, '8': {}, '10': 'authUsername'},
    {'1': 'auth_password', '3': 8, '4': 1, '5': 9, '8': {}, '10': 'authPassword'},
    {'1': 'headers', '3': 9, '4': 3, '5': 11, '6': '.livekit.SIPInboundTrunkInfo.HeadersEntry', '8': {}, '10': 'headers'},
    {'1': 'headers_to_attributes', '3': 10, '4': 3, '5': 11, '6': '.livekit.SIPInboundTrunkInfo.HeadersToAttributesEntry', '10': 'headersToAttributes'},
    {'1': 'attributes_to_headers', '3': 14, '4': 3, '5': 11, '6': '.livekit.SIPInboundTrunkInfo.AttributesToHeadersEntry', '10': 'attributesToHeaders'},
    {'1': 'include_headers', '3': 15, '4': 1, '5': 14, '6': '.livekit.SIPHeaderOptions', '10': 'includeHeaders'},
    {'1': 'ringing_timeout', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'ringingTimeout'},
    {'1': 'max_call_duration', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'maxCallDuration'},
    {'1': 'krisp_enabled', '3': 13, '4': 1, '5': 8, '10': 'krispEnabled'},
    {'1': 'media_encryption', '3': 16, '4': 1, '5': 14, '6': '.livekit.SIPMediaEncryption', '10': 'mediaEncryption'},
  ],
  '3': [SIPInboundTrunkInfo_HeadersEntry$json, SIPInboundTrunkInfo_HeadersToAttributesEntry$json, SIPInboundTrunkInfo_AttributesToHeadersEntry$json],
};

@$core.Deprecated('Use sIPInboundTrunkInfoDescriptor instead')
const SIPInboundTrunkInfo_HeadersEntry$json = {
  '1': 'HeadersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use sIPInboundTrunkInfoDescriptor instead')
const SIPInboundTrunkInfo_HeadersToAttributesEntry$json = {
  '1': 'HeadersToAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use sIPInboundTrunkInfoDescriptor instead')
const SIPInboundTrunkInfo_AttributesToHeadersEntry$json = {
  '1': 'AttributesToHeadersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SIPInboundTrunkInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPInboundTrunkInfoDescriptor = $convert.base64Decode(
    'ChNTSVBJbmJvdW5kVHJ1bmtJbmZvEiAKDHNpcF90cnVua19pZBgBIAEoCVIKc2lwVHJ1bmtJZB'
    'ISCgRuYW1lGAIgASgJUgRuYW1lEkIKCG1ldGFkYXRhGAMgASgJQiaItRgBkrUYHjxyZWRhY3Rl'
    'ZCAoe3sgLlNpemUgfX0gYnl0ZXMpPlIIbWV0YWRhdGESGAoHbnVtYmVycxgEIAMoCVIHbnVtYm'
    'VycxIrChFhbGxvd2VkX2FkZHJlc3NlcxgFIAMoCVIQYWxsb3dlZEFkZHJlc3NlcxInCg9hbGxv'
    'd2VkX251bWJlcnMYBiADKAlSDmFsbG93ZWROdW1iZXJzEksKDWF1dGhfdXNlcm5hbWUYByABKA'
    'lCJoi1GAGStRgePHJlZGFjdGVkICh7eyAuU2l6ZSB9fSBieXRlcyk+UgxhdXRoVXNlcm5hbWUS'
    'SwoNYXV0aF9wYXNzd29yZBgIIAEoCUImiLUYAZK1GB48cmVkYWN0ZWQgKHt7IC5TaXplIH19IG'
    'J5dGVzKT5SDGF1dGhQYXNzd29yZBJrCgdoZWFkZXJzGAkgAygLMikubGl2ZWtpdC5TSVBJbmJv'
    'dW5kVHJ1bmtJbmZvLkhlYWRlcnNFbnRyeUImiLUYAZK1GB48cmVkYWN0ZWQgKHt7IC5TaXplIH'
    '19IGJ5dGVzKT5SB2hlYWRlcnMSaQoVaGVhZGVyc190b19hdHRyaWJ1dGVzGAogAygLMjUubGl2'
    'ZWtpdC5TSVBJbmJvdW5kVHJ1bmtJbmZvLkhlYWRlcnNUb0F0dHJpYnV0ZXNFbnRyeVITaGVhZG'
    'Vyc1RvQXR0cmlidXRlcxJpChVhdHRyaWJ1dGVzX3RvX2hlYWRlcnMYDiADKAsyNS5saXZla2l0'
    'LlNJUEluYm91bmRUcnVua0luZm8uQXR0cmlidXRlc1RvSGVhZGVyc0VudHJ5UhNhdHRyaWJ1dG'
    'VzVG9IZWFkZXJzEkIKD2luY2x1ZGVfaGVhZGVycxgPIAEoDjIZLmxpdmVraXQuU0lQSGVhZGVy'
    'T3B0aW9uc1IOaW5jbHVkZUhlYWRlcnMSQgoPcmluZ2luZ190aW1lb3V0GAsgASgLMhkuZ29vZ2'
    'xlLnByb3RvYnVmLkR1cmF0aW9uUg5yaW5naW5nVGltZW91dBJFChFtYXhfY2FsbF9kdXJhdGlv'
    'bhgMIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIPbWF4Q2FsbER1cmF0aW9uEiMKDW'
    'tyaXNwX2VuYWJsZWQYDSABKAhSDGtyaXNwRW5hYmxlZBJGChBtZWRpYV9lbmNyeXB0aW9uGBAg'
    'ASgOMhsubGl2ZWtpdC5TSVBNZWRpYUVuY3J5cHRpb25SD21lZGlhRW5jcnlwdGlvbho6CgxIZW'
    'FkZXJzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4ARpG'
    'ChhIZWFkZXJzVG9BdHRyaWJ1dGVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAi'
    'ABKAlSBXZhbHVlOgI4ARpGChhBdHRyaWJ1dGVzVG9IZWFkZXJzRW50cnkSEAoDa2V5GAEgASgJ'
    'UgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use sIPInboundTrunkUpdateDescriptor instead')
const SIPInboundTrunkUpdate$json = {
  '1': 'SIPInboundTrunkUpdate',
  '2': [
    {'1': 'numbers', '3': 1, '4': 1, '5': 11, '6': '.livekit.ListUpdate', '10': 'numbers'},
    {'1': 'allowed_addresses', '3': 2, '4': 1, '5': 11, '6': '.livekit.ListUpdate', '10': 'allowedAddresses'},
    {'1': 'allowed_numbers', '3': 3, '4': 1, '5': 11, '6': '.livekit.ListUpdate', '10': 'allowedNumbers'},
    {'1': 'auth_username', '3': 4, '4': 1, '5': 9, '8': {}, '9': 0, '10': 'authUsername', '17': true},
    {'1': 'auth_password', '3': 5, '4': 1, '5': 9, '8': {}, '9': 1, '10': 'authPassword', '17': true},
    {'1': 'name', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'name', '17': true},
    {'1': 'metadata', '3': 7, '4': 1, '5': 9, '8': {}, '9': 3, '10': 'metadata', '17': true},
    {'1': 'media_encryption', '3': 8, '4': 1, '5': 14, '6': '.livekit.SIPMediaEncryption', '9': 4, '10': 'mediaEncryption', '17': true},
  ],
  '8': [
    {'1': '_auth_username'},
    {'1': '_auth_password'},
    {'1': '_name'},
    {'1': '_metadata'},
    {'1': '_media_encryption'},
  ],
};

/// Descriptor for `SIPInboundTrunkUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPInboundTrunkUpdateDescriptor = $convert.base64Decode(
    'ChVTSVBJbmJvdW5kVHJ1bmtVcGRhdGUSLQoHbnVtYmVycxgBIAEoCzITLmxpdmVraXQuTGlzdF'
    'VwZGF0ZVIHbnVtYmVycxJAChFhbGxvd2VkX2FkZHJlc3NlcxgCIAEoCzITLmxpdmVraXQuTGlz'
    'dFVwZGF0ZVIQYWxsb3dlZEFkZHJlc3NlcxI8Cg9hbGxvd2VkX251bWJlcnMYAyABKAsyEy5saX'
    'Zla2l0Lkxpc3RVcGRhdGVSDmFsbG93ZWROdW1iZXJzElAKDWF1dGhfdXNlcm5hbWUYBCABKAlC'
    'Joi1GAGStRgePHJlZGFjdGVkICh7eyAuU2l6ZSB9fSBieXRlcyk+SABSDGF1dGhVc2VybmFtZY'
    'gBARJQCg1hdXRoX3Bhc3N3b3JkGAUgASgJQiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUg'
    'fX0gYnl0ZXMpPkgBUgxhdXRoUGFzc3dvcmSIAQESFwoEbmFtZRgGIAEoCUgCUgRuYW1liAEBEk'
    'cKCG1ldGFkYXRhGAcgASgJQiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMp'
    'PkgDUghtZXRhZGF0YYgBARJLChBtZWRpYV9lbmNyeXB0aW9uGAggASgOMhsubGl2ZWtpdC5TSV'
    'BNZWRpYUVuY3J5cHRpb25IBFIPbWVkaWFFbmNyeXB0aW9uiAEBQhAKDl9hdXRoX3VzZXJuYW1l'
    'QhAKDl9hdXRoX3Bhc3N3b3JkQgcKBV9uYW1lQgsKCV9tZXRhZGF0YUITChFfbWVkaWFfZW5jcn'
    'lwdGlvbg==');

@$core.Deprecated('Use createSIPOutboundTrunkRequestDescriptor instead')
const CreateSIPOutboundTrunkRequest$json = {
  '1': 'CreateSIPOutboundTrunkRequest',
  '2': [
    {'1': 'trunk', '3': 1, '4': 1, '5': 11, '6': '.livekit.SIPOutboundTrunkInfo', '10': 'trunk'},
  ],
};

/// Descriptor for `CreateSIPOutboundTrunkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSIPOutboundTrunkRequestDescriptor = $convert.base64Decode(
    'Ch1DcmVhdGVTSVBPdXRib3VuZFRydW5rUmVxdWVzdBIzCgV0cnVuaxgBIAEoCzIdLmxpdmVraX'
    'QuU0lQT3V0Ym91bmRUcnVua0luZm9SBXRydW5r');

@$core.Deprecated('Use updateSIPOutboundTrunkRequestDescriptor instead')
const UpdateSIPOutboundTrunkRequest$json = {
  '1': 'UpdateSIPOutboundTrunkRequest',
  '2': [
    {'1': 'sip_trunk_id', '3': 1, '4': 1, '5': 9, '10': 'sipTrunkId'},
    {'1': 'replace', '3': 2, '4': 1, '5': 11, '6': '.livekit.SIPOutboundTrunkInfo', '9': 0, '10': 'replace'},
    {'1': 'update', '3': 3, '4': 1, '5': 11, '6': '.livekit.SIPOutboundTrunkUpdate', '9': 0, '10': 'update'},
  ],
  '8': [
    {'1': 'action'},
  ],
};

/// Descriptor for `UpdateSIPOutboundTrunkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSIPOutboundTrunkRequestDescriptor = $convert.base64Decode(
    'Ch1VcGRhdGVTSVBPdXRib3VuZFRydW5rUmVxdWVzdBIgCgxzaXBfdHJ1bmtfaWQYASABKAlSCn'
    'NpcFRydW5rSWQSOQoHcmVwbGFjZRgCIAEoCzIdLmxpdmVraXQuU0lQT3V0Ym91bmRUcnVua0lu'
    'Zm9IAFIHcmVwbGFjZRI5CgZ1cGRhdGUYAyABKAsyHy5saXZla2l0LlNJUE91dGJvdW5kVHJ1bm'
    'tVcGRhdGVIAFIGdXBkYXRlQggKBmFjdGlvbg==');

@$core.Deprecated('Use sIPOutboundTrunkInfoDescriptor instead')
const SIPOutboundTrunkInfo$json = {
  '1': 'SIPOutboundTrunkInfo',
  '2': [
    {'1': 'sip_trunk_id', '3': 1, '4': 1, '5': 9, '10': 'sipTrunkId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'metadata', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'metadata'},
    {'1': 'address', '3': 4, '4': 1, '5': 9, '10': 'address'},
    {'1': 'destination_country', '3': 14, '4': 1, '5': 9, '10': 'destinationCountry'},
    {'1': 'transport', '3': 5, '4': 1, '5': 14, '6': '.livekit.SIPTransport', '10': 'transport'},
    {'1': 'numbers', '3': 6, '4': 3, '5': 9, '10': 'numbers'},
    {'1': 'auth_username', '3': 7, '4': 1, '5': 9, '8': {}, '10': 'authUsername'},
    {'1': 'auth_password', '3': 8, '4': 1, '5': 9, '8': {}, '10': 'authPassword'},
    {'1': 'headers', '3': 9, '4': 3, '5': 11, '6': '.livekit.SIPOutboundTrunkInfo.HeadersEntry', '8': {}, '10': 'headers'},
    {'1': 'headers_to_attributes', '3': 10, '4': 3, '5': 11, '6': '.livekit.SIPOutboundTrunkInfo.HeadersToAttributesEntry', '10': 'headersToAttributes'},
    {'1': 'attributes_to_headers', '3': 11, '4': 3, '5': 11, '6': '.livekit.SIPOutboundTrunkInfo.AttributesToHeadersEntry', '10': 'attributesToHeaders'},
    {'1': 'include_headers', '3': 12, '4': 1, '5': 14, '6': '.livekit.SIPHeaderOptions', '10': 'includeHeaders'},
    {'1': 'media_encryption', '3': 13, '4': 1, '5': 14, '6': '.livekit.SIPMediaEncryption', '10': 'mediaEncryption'},
  ],
  '3': [SIPOutboundTrunkInfo_HeadersEntry$json, SIPOutboundTrunkInfo_HeadersToAttributesEntry$json, SIPOutboundTrunkInfo_AttributesToHeadersEntry$json],
};

@$core.Deprecated('Use sIPOutboundTrunkInfoDescriptor instead')
const SIPOutboundTrunkInfo_HeadersEntry$json = {
  '1': 'HeadersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use sIPOutboundTrunkInfoDescriptor instead')
const SIPOutboundTrunkInfo_HeadersToAttributesEntry$json = {
  '1': 'HeadersToAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use sIPOutboundTrunkInfoDescriptor instead')
const SIPOutboundTrunkInfo_AttributesToHeadersEntry$json = {
  '1': 'AttributesToHeadersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SIPOutboundTrunkInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPOutboundTrunkInfoDescriptor = $convert.base64Decode(
    'ChRTSVBPdXRib3VuZFRydW5rSW5mbxIgCgxzaXBfdHJ1bmtfaWQYASABKAlSCnNpcFRydW5rSW'
    'QSEgoEbmFtZRgCIAEoCVIEbmFtZRJCCghtZXRhZGF0YRgDIAEoCUImiLUYAZK1GB48cmVkYWN0'
    'ZWQgKHt7IC5TaXplIH19IGJ5dGVzKT5SCG1ldGFkYXRhEhgKB2FkZHJlc3MYBCABKAlSB2FkZH'
    'Jlc3MSLwoTZGVzdGluYXRpb25fY291bnRyeRgOIAEoCVISZGVzdGluYXRpb25Db3VudHJ5EjMK'
    'CXRyYW5zcG9ydBgFIAEoDjIVLmxpdmVraXQuU0lQVHJhbnNwb3J0Ugl0cmFuc3BvcnQSGAoHbn'
    'VtYmVycxgGIAMoCVIHbnVtYmVycxJLCg1hdXRoX3VzZXJuYW1lGAcgASgJQiaItRgBkrUYHjxy'
    'ZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPlIMYXV0aFVzZXJuYW1lEksKDWF1dGhfcGFzc3'
    'dvcmQYCCABKAlCJoi1GAGStRgePHJlZGFjdGVkICh7eyAuU2l6ZSB9fSBieXRlcyk+UgxhdXRo'
    'UGFzc3dvcmQSbAoHaGVhZGVycxgJIAMoCzIqLmxpdmVraXQuU0lQT3V0Ym91bmRUcnVua0luZm'
    '8uSGVhZGVyc0VudHJ5QiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPlIH'
    'aGVhZGVycxJqChVoZWFkZXJzX3RvX2F0dHJpYnV0ZXMYCiADKAsyNi5saXZla2l0LlNJUE91dG'
    'JvdW5kVHJ1bmtJbmZvLkhlYWRlcnNUb0F0dHJpYnV0ZXNFbnRyeVITaGVhZGVyc1RvQXR0cmli'
    'dXRlcxJqChVhdHRyaWJ1dGVzX3RvX2hlYWRlcnMYCyADKAsyNi5saXZla2l0LlNJUE91dGJvdW'
    '5kVHJ1bmtJbmZvLkF0dHJpYnV0ZXNUb0hlYWRlcnNFbnRyeVITYXR0cmlidXRlc1RvSGVhZGVy'
    'cxJCCg9pbmNsdWRlX2hlYWRlcnMYDCABKA4yGS5saXZla2l0LlNJUEhlYWRlck9wdGlvbnNSDm'
    'luY2x1ZGVIZWFkZXJzEkYKEG1lZGlhX2VuY3J5cHRpb24YDSABKA4yGy5saXZla2l0LlNJUE1l'
    'ZGlhRW5jcnlwdGlvblIPbWVkaWFFbmNyeXB0aW9uGjoKDEhlYWRlcnNFbnRyeRIQCgNrZXkYAS'
    'ABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGkYKGEhlYWRlcnNUb0F0dHJpYnV0'
    'ZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGkYKGE'
    'F0dHJpYnV0ZXNUb0hlYWRlcnNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEo'
    'CVIFdmFsdWU6AjgB');

@$core.Deprecated('Use sIPOutboundTrunkUpdateDescriptor instead')
const SIPOutboundTrunkUpdate$json = {
  '1': 'SIPOutboundTrunkUpdate',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'address', '17': true},
    {'1': 'transport', '3': 2, '4': 1, '5': 14, '6': '.livekit.SIPTransport', '9': 1, '10': 'transport', '17': true},
    {'1': 'destination_country', '3': 9, '4': 1, '5': 9, '9': 2, '10': 'destinationCountry', '17': true},
    {'1': 'numbers', '3': 3, '4': 1, '5': 11, '6': '.livekit.ListUpdate', '10': 'numbers'},
    {'1': 'auth_username', '3': 4, '4': 1, '5': 9, '8': {}, '9': 3, '10': 'authUsername', '17': true},
    {'1': 'auth_password', '3': 5, '4': 1, '5': 9, '8': {}, '9': 4, '10': 'authPassword', '17': true},
    {'1': 'name', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'name', '17': true},
    {'1': 'metadata', '3': 7, '4': 1, '5': 9, '8': {}, '9': 6, '10': 'metadata', '17': true},
    {'1': 'media_encryption', '3': 8, '4': 1, '5': 14, '6': '.livekit.SIPMediaEncryption', '9': 7, '10': 'mediaEncryption', '17': true},
  ],
  '8': [
    {'1': '_address'},
    {'1': '_transport'},
    {'1': '_destination_country'},
    {'1': '_auth_username'},
    {'1': '_auth_password'},
    {'1': '_name'},
    {'1': '_metadata'},
    {'1': '_media_encryption'},
  ],
};

/// Descriptor for `SIPOutboundTrunkUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPOutboundTrunkUpdateDescriptor = $convert.base64Decode(
    'ChZTSVBPdXRib3VuZFRydW5rVXBkYXRlEh0KB2FkZHJlc3MYASABKAlIAFIHYWRkcmVzc4gBAR'
    'I4Cgl0cmFuc3BvcnQYAiABKA4yFS5saXZla2l0LlNJUFRyYW5zcG9ydEgBUgl0cmFuc3BvcnSI'
    'AQESNAoTZGVzdGluYXRpb25fY291bnRyeRgJIAEoCUgCUhJkZXN0aW5hdGlvbkNvdW50cnmIAQ'
    'ESLQoHbnVtYmVycxgDIAEoCzITLmxpdmVraXQuTGlzdFVwZGF0ZVIHbnVtYmVycxJQCg1hdXRo'
    'X3VzZXJuYW1lGAQgASgJQiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPk'
    'gDUgxhdXRoVXNlcm5hbWWIAQESUAoNYXV0aF9wYXNzd29yZBgFIAEoCUImiLUYAZK1GB48cmVk'
    'YWN0ZWQgKHt7IC5TaXplIH19IGJ5dGVzKT5IBFIMYXV0aFBhc3N3b3JkiAEBEhcKBG5hbWUYBi'
    'ABKAlIBVIEbmFtZYgBARJHCghtZXRhZGF0YRgHIAEoCUImiLUYAZK1GB48cmVkYWN0ZWQgKHt7'
    'IC5TaXplIH19IGJ5dGVzKT5IBlIIbWV0YWRhdGGIAQESSwoQbWVkaWFfZW5jcnlwdGlvbhgIIA'
    'EoDjIbLmxpdmVraXQuU0lQTWVkaWFFbmNyeXB0aW9uSAdSD21lZGlhRW5jcnlwdGlvbogBAUIK'
    'CghfYWRkcmVzc0IMCgpfdHJhbnNwb3J0QhYKFF9kZXN0aW5hdGlvbl9jb3VudHJ5QhAKDl9hdX'
    'RoX3VzZXJuYW1lQhAKDl9hdXRoX3Bhc3N3b3JkQgcKBV9uYW1lQgsKCV9tZXRhZGF0YUITChFf'
    'bWVkaWFfZW5jcnlwdGlvbg==');

@$core.Deprecated('Use getSIPInboundTrunkRequestDescriptor instead')
const GetSIPInboundTrunkRequest$json = {
  '1': 'GetSIPInboundTrunkRequest',
  '2': [
    {'1': 'sip_trunk_id', '3': 1, '4': 1, '5': 9, '10': 'sipTrunkId'},
  ],
};

/// Descriptor for `GetSIPInboundTrunkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSIPInboundTrunkRequestDescriptor = $convert.base64Decode(
    'ChlHZXRTSVBJbmJvdW5kVHJ1bmtSZXF1ZXN0EiAKDHNpcF90cnVua19pZBgBIAEoCVIKc2lwVH'
    'J1bmtJZA==');

@$core.Deprecated('Use getSIPInboundTrunkResponseDescriptor instead')
const GetSIPInboundTrunkResponse$json = {
  '1': 'GetSIPInboundTrunkResponse',
  '2': [
    {'1': 'trunk', '3': 1, '4': 1, '5': 11, '6': '.livekit.SIPInboundTrunkInfo', '10': 'trunk'},
  ],
};

/// Descriptor for `GetSIPInboundTrunkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSIPInboundTrunkResponseDescriptor = $convert.base64Decode(
    'ChpHZXRTSVBJbmJvdW5kVHJ1bmtSZXNwb25zZRIyCgV0cnVuaxgBIAEoCzIcLmxpdmVraXQuU0'
    'lQSW5ib3VuZFRydW5rSW5mb1IFdHJ1bms=');

@$core.Deprecated('Use getSIPOutboundTrunkRequestDescriptor instead')
const GetSIPOutboundTrunkRequest$json = {
  '1': 'GetSIPOutboundTrunkRequest',
  '2': [
    {'1': 'sip_trunk_id', '3': 1, '4': 1, '5': 9, '10': 'sipTrunkId'},
  ],
};

/// Descriptor for `GetSIPOutboundTrunkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSIPOutboundTrunkRequestDescriptor = $convert.base64Decode(
    'ChpHZXRTSVBPdXRib3VuZFRydW5rUmVxdWVzdBIgCgxzaXBfdHJ1bmtfaWQYASABKAlSCnNpcF'
    'RydW5rSWQ=');

@$core.Deprecated('Use getSIPOutboundTrunkResponseDescriptor instead')
const GetSIPOutboundTrunkResponse$json = {
  '1': 'GetSIPOutboundTrunkResponse',
  '2': [
    {'1': 'trunk', '3': 1, '4': 1, '5': 11, '6': '.livekit.SIPOutboundTrunkInfo', '10': 'trunk'},
  ],
};

/// Descriptor for `GetSIPOutboundTrunkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSIPOutboundTrunkResponseDescriptor = $convert.base64Decode(
    'ChtHZXRTSVBPdXRib3VuZFRydW5rUmVzcG9uc2USMwoFdHJ1bmsYASABKAsyHS5saXZla2l0Ll'
    'NJUE91dGJvdW5kVHJ1bmtJbmZvUgV0cnVuaw==');

@$core.Deprecated('Use listSIPTrunkRequestDescriptor instead')
const ListSIPTrunkRequest$json = {
  '1': 'ListSIPTrunkRequest',
  '2': [
    {'1': 'page', '3': 1, '4': 1, '5': 11, '6': '.livekit.Pagination', '10': 'page'},
  ],
  '7': {'3': true},
};

/// Descriptor for `ListSIPTrunkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSIPTrunkRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0U0lQVHJ1bmtSZXF1ZXN0EicKBHBhZ2UYASABKAsyEy5saXZla2l0LlBhZ2luYXRpb2'
    '5SBHBhZ2U6AhgB');

@$core.Deprecated('Use listSIPTrunkResponseDescriptor instead')
const ListSIPTrunkResponse$json = {
  '1': 'ListSIPTrunkResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.livekit.SIPTrunkInfo', '10': 'items'},
  ],
  '7': {'3': true},
};

/// Descriptor for `ListSIPTrunkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSIPTrunkResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0U0lQVHJ1bmtSZXNwb25zZRIrCgVpdGVtcxgBIAMoCzIVLmxpdmVraXQuU0lQVHJ1bm'
    'tJbmZvUgVpdGVtczoCGAE=');

@$core.Deprecated('Use listSIPInboundTrunkRequestDescriptor instead')
const ListSIPInboundTrunkRequest$json = {
  '1': 'ListSIPInboundTrunkRequest',
  '2': [
    {'1': 'page', '3': 3, '4': 1, '5': 11, '6': '.livekit.Pagination', '10': 'page'},
    {'1': 'trunk_ids', '3': 1, '4': 3, '5': 9, '10': 'trunkIds'},
    {'1': 'numbers', '3': 2, '4': 3, '5': 9, '10': 'numbers'},
  ],
};

/// Descriptor for `ListSIPInboundTrunkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSIPInboundTrunkRequestDescriptor = $convert.base64Decode(
    'ChpMaXN0U0lQSW5ib3VuZFRydW5rUmVxdWVzdBInCgRwYWdlGAMgASgLMhMubGl2ZWtpdC5QYW'
    'dpbmF0aW9uUgRwYWdlEhsKCXRydW5rX2lkcxgBIAMoCVIIdHJ1bmtJZHMSGAoHbnVtYmVycxgC'
    'IAMoCVIHbnVtYmVycw==');

@$core.Deprecated('Use listSIPInboundTrunkResponseDescriptor instead')
const ListSIPInboundTrunkResponse$json = {
  '1': 'ListSIPInboundTrunkResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.livekit.SIPInboundTrunkInfo', '10': 'items'},
  ],
};

/// Descriptor for `ListSIPInboundTrunkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSIPInboundTrunkResponseDescriptor = $convert.base64Decode(
    'ChtMaXN0U0lQSW5ib3VuZFRydW5rUmVzcG9uc2USMgoFaXRlbXMYASADKAsyHC5saXZla2l0Ll'
    'NJUEluYm91bmRUcnVua0luZm9SBWl0ZW1z');

@$core.Deprecated('Use listSIPOutboundTrunkRequestDescriptor instead')
const ListSIPOutboundTrunkRequest$json = {
  '1': 'ListSIPOutboundTrunkRequest',
  '2': [
    {'1': 'page', '3': 3, '4': 1, '5': 11, '6': '.livekit.Pagination', '10': 'page'},
    {'1': 'trunk_ids', '3': 1, '4': 3, '5': 9, '10': 'trunkIds'},
    {'1': 'numbers', '3': 2, '4': 3, '5': 9, '10': 'numbers'},
  ],
};

/// Descriptor for `ListSIPOutboundTrunkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSIPOutboundTrunkRequestDescriptor = $convert.base64Decode(
    'ChtMaXN0U0lQT3V0Ym91bmRUcnVua1JlcXVlc3QSJwoEcGFnZRgDIAEoCzITLmxpdmVraXQuUG'
    'FnaW5hdGlvblIEcGFnZRIbCgl0cnVua19pZHMYASADKAlSCHRydW5rSWRzEhgKB251bWJlcnMY'
    'AiADKAlSB251bWJlcnM=');

@$core.Deprecated('Use listSIPOutboundTrunkResponseDescriptor instead')
const ListSIPOutboundTrunkResponse$json = {
  '1': 'ListSIPOutboundTrunkResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.livekit.SIPOutboundTrunkInfo', '10': 'items'},
  ],
};

/// Descriptor for `ListSIPOutboundTrunkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSIPOutboundTrunkResponseDescriptor = $convert.base64Decode(
    'ChxMaXN0U0lQT3V0Ym91bmRUcnVua1Jlc3BvbnNlEjMKBWl0ZW1zGAEgAygLMh0ubGl2ZWtpdC'
    '5TSVBPdXRib3VuZFRydW5rSW5mb1IFaXRlbXM=');

@$core.Deprecated('Use deleteSIPTrunkRequestDescriptor instead')
const DeleteSIPTrunkRequest$json = {
  '1': 'DeleteSIPTrunkRequest',
  '2': [
    {'1': 'sip_trunk_id', '3': 1, '4': 1, '5': 9, '10': 'sipTrunkId'},
  ],
};

/// Descriptor for `DeleteSIPTrunkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSIPTrunkRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVTSVBUcnVua1JlcXVlc3QSIAoMc2lwX3RydW5rX2lkGAEgASgJUgpzaXBUcnVua0'
    'lk');

@$core.Deprecated('Use sIPDispatchRuleDirectDescriptor instead')
const SIPDispatchRuleDirect$json = {
  '1': 'SIPDispatchRuleDirect',
  '2': [
    {'1': 'room_name', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'pin', '3': 2, '4': 1, '5': 9, '10': 'pin'},
  ],
};

/// Descriptor for `SIPDispatchRuleDirect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPDispatchRuleDirectDescriptor = $convert.base64Decode(
    'ChVTSVBEaXNwYXRjaFJ1bGVEaXJlY3QSGwoJcm9vbV9uYW1lGAEgASgJUghyb29tTmFtZRIQCg'
    'NwaW4YAiABKAlSA3Bpbg==');

@$core.Deprecated('Use sIPDispatchRuleIndividualDescriptor instead')
const SIPDispatchRuleIndividual$json = {
  '1': 'SIPDispatchRuleIndividual',
  '2': [
    {'1': 'room_prefix', '3': 1, '4': 1, '5': 9, '10': 'roomPrefix'},
    {'1': 'pin', '3': 2, '4': 1, '5': 9, '10': 'pin'},
  ],
};

/// Descriptor for `SIPDispatchRuleIndividual`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPDispatchRuleIndividualDescriptor = $convert.base64Decode(
    'ChlTSVBEaXNwYXRjaFJ1bGVJbmRpdmlkdWFsEh8KC3Jvb21fcHJlZml4GAEgASgJUgpyb29tUH'
    'JlZml4EhAKA3BpbhgCIAEoCVIDcGlu');

@$core.Deprecated('Use sIPDispatchRuleCalleeDescriptor instead')
const SIPDispatchRuleCallee$json = {
  '1': 'SIPDispatchRuleCallee',
  '2': [
    {'1': 'room_prefix', '3': 1, '4': 1, '5': 9, '10': 'roomPrefix'},
    {'1': 'pin', '3': 2, '4': 1, '5': 9, '10': 'pin'},
    {'1': 'randomize', '3': 3, '4': 1, '5': 8, '10': 'randomize'},
  ],
};

/// Descriptor for `SIPDispatchRuleCallee`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPDispatchRuleCalleeDescriptor = $convert.base64Decode(
    'ChVTSVBEaXNwYXRjaFJ1bGVDYWxsZWUSHwoLcm9vbV9wcmVmaXgYASABKAlSCnJvb21QcmVmaX'
    'gSEAoDcGluGAIgASgJUgNwaW4SHAoJcmFuZG9taXplGAMgASgIUglyYW5kb21pemU=');

@$core.Deprecated('Use sIPDispatchRuleDescriptor instead')
const SIPDispatchRule$json = {
  '1': 'SIPDispatchRule',
  '2': [
    {'1': 'dispatch_rule_direct', '3': 1, '4': 1, '5': 11, '6': '.livekit.SIPDispatchRuleDirect', '9': 0, '10': 'dispatchRuleDirect'},
    {'1': 'dispatch_rule_individual', '3': 2, '4': 1, '5': 11, '6': '.livekit.SIPDispatchRuleIndividual', '9': 0, '10': 'dispatchRuleIndividual'},
    {'1': 'dispatch_rule_callee', '3': 3, '4': 1, '5': 11, '6': '.livekit.SIPDispatchRuleCallee', '9': 0, '10': 'dispatchRuleCallee'},
  ],
  '8': [
    {'1': 'rule'},
  ],
};

/// Descriptor for `SIPDispatchRule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPDispatchRuleDescriptor = $convert.base64Decode(
    'Cg9TSVBEaXNwYXRjaFJ1bGUSUgoUZGlzcGF0Y2hfcnVsZV9kaXJlY3QYASABKAsyHi5saXZla2'
    'l0LlNJUERpc3BhdGNoUnVsZURpcmVjdEgAUhJkaXNwYXRjaFJ1bGVEaXJlY3QSXgoYZGlzcGF0'
    'Y2hfcnVsZV9pbmRpdmlkdWFsGAIgASgLMiIubGl2ZWtpdC5TSVBEaXNwYXRjaFJ1bGVJbmRpdm'
    'lkdWFsSABSFmRpc3BhdGNoUnVsZUluZGl2aWR1YWwSUgoUZGlzcGF0Y2hfcnVsZV9jYWxsZWUY'
    'AyABKAsyHi5saXZla2l0LlNJUERpc3BhdGNoUnVsZUNhbGxlZUgAUhJkaXNwYXRjaFJ1bGVDYW'
    'xsZWVCBgoEcnVsZQ==');

@$core.Deprecated('Use createSIPDispatchRuleRequestDescriptor instead')
const CreateSIPDispatchRuleRequest$json = {
  '1': 'CreateSIPDispatchRuleRequest',
  '2': [
    {'1': 'dispatch_rule', '3': 10, '4': 1, '5': 11, '6': '.livekit.SIPDispatchRuleInfo', '10': 'dispatchRule'},
    {
      '1': 'rule',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.livekit.SIPDispatchRule',
      '8': {'3': true},
      '10': 'rule',
    },
    {
      '1': 'trunk_ids',
      '3': 2,
      '4': 3,
      '5': 9,
      '8': {'3': true},
      '10': 'trunkIds',
    },
    {
      '1': 'hide_phone_number',
      '3': 3,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'hidePhoneNumber',
    },
    {
      '1': 'inbound_numbers',
      '3': 6,
      '4': 3,
      '5': 9,
      '8': {'3': true},
      '10': 'inboundNumbers',
    },
    {
      '1': 'name',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'name',
    },
    {
      '1': 'metadata',
      '3': 5,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'metadata',
    },
    {
      '1': 'attributes',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.livekit.CreateSIPDispatchRuleRequest.AttributesEntry',
      '8': {'3': true},
      '10': 'attributes',
    },
    {
      '1': 'room_preset',
      '3': 8,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'roomPreset',
    },
    {
      '1': 'room_config',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.livekit.RoomConfiguration',
      '8': {'3': true},
      '10': 'roomConfig',
    },
  ],
  '3': [CreateSIPDispatchRuleRequest_AttributesEntry$json],
};

@$core.Deprecated('Use createSIPDispatchRuleRequestDescriptor instead')
const CreateSIPDispatchRuleRequest_AttributesEntry$json = {
  '1': 'AttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `CreateSIPDispatchRuleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSIPDispatchRuleRequestDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVTSVBEaXNwYXRjaFJ1bGVSZXF1ZXN0EkEKDWRpc3BhdGNoX3J1bGUYCiABKAsyHC'
    '5saXZla2l0LlNJUERpc3BhdGNoUnVsZUluZm9SDGRpc3BhdGNoUnVsZRIwCgRydWxlGAEgASgL'
    'MhgubGl2ZWtpdC5TSVBEaXNwYXRjaFJ1bGVCAhgBUgRydWxlEh8KCXRydW5rX2lkcxgCIAMoCU'
    'ICGAFSCHRydW5rSWRzEi4KEWhpZGVfcGhvbmVfbnVtYmVyGAMgASgIQgIYAVIPaGlkZVBob25l'
    'TnVtYmVyEisKD2luYm91bmRfbnVtYmVycxgGIAMoCUICGAFSDmluYm91bmROdW1iZXJzEhYKBG'
    '5hbWUYBCABKAlCAhgBUgRuYW1lEkQKCG1ldGFkYXRhGAUgASgJQigYAYi1GAGStRgePHJlZGFj'
    'dGVkICh7eyAuU2l6ZSB9fSBieXRlcyk+UghtZXRhZGF0YRJ/CgphdHRyaWJ1dGVzGAcgAygLMj'
    'UubGl2ZWtpdC5DcmVhdGVTSVBEaXNwYXRjaFJ1bGVSZXF1ZXN0LkF0dHJpYnV0ZXNFbnRyeUIo'
    'GAGItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPlIKYXR0cmlidXRlcxIjCg'
    'tyb29tX3ByZXNldBgIIAEoCUICGAFSCnJvb21QcmVzZXQSPwoLcm9vbV9jb25maWcYCSABKAsy'
    'Gi5saXZla2l0LlJvb21Db25maWd1cmF0aW9uQgIYAVIKcm9vbUNvbmZpZxo9Cg9BdHRyaWJ1dG'
    'VzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use updateSIPDispatchRuleRequestDescriptor instead')
const UpdateSIPDispatchRuleRequest$json = {
  '1': 'UpdateSIPDispatchRuleRequest',
  '2': [
    {'1': 'sip_dispatch_rule_id', '3': 1, '4': 1, '5': 9, '10': 'sipDispatchRuleId'},
    {'1': 'replace', '3': 2, '4': 1, '5': 11, '6': '.livekit.SIPDispatchRuleInfo', '9': 0, '10': 'replace'},
    {'1': 'update', '3': 3, '4': 1, '5': 11, '6': '.livekit.SIPDispatchRuleUpdate', '9': 0, '10': 'update'},
  ],
  '8': [
    {'1': 'action'},
  ],
};

/// Descriptor for `UpdateSIPDispatchRuleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSIPDispatchRuleRequestDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVTSVBEaXNwYXRjaFJ1bGVSZXF1ZXN0Ei8KFHNpcF9kaXNwYXRjaF9ydWxlX2lkGA'
    'EgASgJUhFzaXBEaXNwYXRjaFJ1bGVJZBI4CgdyZXBsYWNlGAIgASgLMhwubGl2ZWtpdC5TSVBE'
    'aXNwYXRjaFJ1bGVJbmZvSABSB3JlcGxhY2USOAoGdXBkYXRlGAMgASgLMh4ubGl2ZWtpdC5TSV'
    'BEaXNwYXRjaFJ1bGVVcGRhdGVIAFIGdXBkYXRlQggKBmFjdGlvbg==');

@$core.Deprecated('Use sIPDispatchRuleInfoDescriptor instead')
const SIPDispatchRuleInfo$json = {
  '1': 'SIPDispatchRuleInfo',
  '2': [
    {'1': 'sip_dispatch_rule_id', '3': 1, '4': 1, '5': 9, '10': 'sipDispatchRuleId'},
    {'1': 'rule', '3': 2, '4': 1, '5': 11, '6': '.livekit.SIPDispatchRule', '10': 'rule'},
    {'1': 'trunk_ids', '3': 3, '4': 3, '5': 9, '10': 'trunkIds'},
    {'1': 'hide_phone_number', '3': 4, '4': 1, '5': 8, '10': 'hidePhoneNumber'},
    {'1': 'inbound_numbers', '3': 7, '4': 3, '5': 9, '10': 'inboundNumbers'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    {'1': 'metadata', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'metadata'},
    {'1': 'attributes', '3': 8, '4': 3, '5': 11, '6': '.livekit.SIPDispatchRuleInfo.AttributesEntry', '8': {}, '10': 'attributes'},
    {'1': 'room_preset', '3': 9, '4': 1, '5': 9, '10': 'roomPreset'},
    {'1': 'room_config', '3': 10, '4': 1, '5': 11, '6': '.livekit.RoomConfiguration', '10': 'roomConfig'},
    {'1': 'krisp_enabled', '3': 11, '4': 1, '5': 8, '10': 'krispEnabled'},
    {'1': 'media_encryption', '3': 12, '4': 1, '5': 14, '6': '.livekit.SIPMediaEncryption', '10': 'mediaEncryption'},
  ],
  '3': [SIPDispatchRuleInfo_AttributesEntry$json],
};

@$core.Deprecated('Use sIPDispatchRuleInfoDescriptor instead')
const SIPDispatchRuleInfo_AttributesEntry$json = {
  '1': 'AttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SIPDispatchRuleInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPDispatchRuleInfoDescriptor = $convert.base64Decode(
    'ChNTSVBEaXNwYXRjaFJ1bGVJbmZvEi8KFHNpcF9kaXNwYXRjaF9ydWxlX2lkGAEgASgJUhFzaX'
    'BEaXNwYXRjaFJ1bGVJZBIsCgRydWxlGAIgASgLMhgubGl2ZWtpdC5TSVBEaXNwYXRjaFJ1bGVS'
    'BHJ1bGUSGwoJdHJ1bmtfaWRzGAMgAygJUgh0cnVua0lkcxIqChFoaWRlX3Bob25lX251bWJlch'
    'gEIAEoCFIPaGlkZVBob25lTnVtYmVyEicKD2luYm91bmRfbnVtYmVycxgHIAMoCVIOaW5ib3Vu'
    'ZE51bWJlcnMSEgoEbmFtZRgFIAEoCVIEbmFtZRJCCghtZXRhZGF0YRgGIAEoCUImiLUYAZK1GB'
    '48cmVkYWN0ZWQgKHt7IC5TaXplIH19IGJ5dGVzKT5SCG1ldGFkYXRhEnQKCmF0dHJpYnV0ZXMY'
    'CCADKAsyLC5saXZla2l0LlNJUERpc3BhdGNoUnVsZUluZm8uQXR0cmlidXRlc0VudHJ5QiaItR'
    'gBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPlIKYXR0cmlidXRlcxIfCgtyb29t'
    'X3ByZXNldBgJIAEoCVIKcm9vbVByZXNldBI7Cgtyb29tX2NvbmZpZxgKIAEoCzIaLmxpdmVraX'
    'QuUm9vbUNvbmZpZ3VyYXRpb25SCnJvb21Db25maWcSIwoNa3Jpc3BfZW5hYmxlZBgLIAEoCFIM'
    'a3Jpc3BFbmFibGVkEkYKEG1lZGlhX2VuY3J5cHRpb24YDCABKA4yGy5saXZla2l0LlNJUE1lZG'
    'lhRW5jcnlwdGlvblIPbWVkaWFFbmNyeXB0aW9uGj0KD0F0dHJpYnV0ZXNFbnRyeRIQCgNrZXkY'
    'ASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use sIPDispatchRuleUpdateDescriptor instead')
const SIPDispatchRuleUpdate$json = {
  '1': 'SIPDispatchRuleUpdate',
  '2': [
    {'1': 'trunk_ids', '3': 1, '4': 1, '5': 11, '6': '.livekit.ListUpdate', '10': 'trunkIds'},
    {'1': 'rule', '3': 2, '4': 1, '5': 11, '6': '.livekit.SIPDispatchRule', '10': 'rule'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    {'1': 'metadata', '3': 4, '4': 1, '5': 9, '8': {}, '9': 1, '10': 'metadata', '17': true},
    {'1': 'attributes', '3': 5, '4': 3, '5': 11, '6': '.livekit.SIPDispatchRuleUpdate.AttributesEntry', '8': {}, '10': 'attributes'},
    {'1': 'media_encryption', '3': 6, '4': 1, '5': 14, '6': '.livekit.SIPMediaEncryption', '9': 2, '10': 'mediaEncryption', '17': true},
  ],
  '3': [SIPDispatchRuleUpdate_AttributesEntry$json],
  '8': [
    {'1': '_name'},
    {'1': '_metadata'},
    {'1': '_media_encryption'},
  ],
};

@$core.Deprecated('Use sIPDispatchRuleUpdateDescriptor instead')
const SIPDispatchRuleUpdate_AttributesEntry$json = {
  '1': 'AttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SIPDispatchRuleUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPDispatchRuleUpdateDescriptor = $convert.base64Decode(
    'ChVTSVBEaXNwYXRjaFJ1bGVVcGRhdGUSMAoJdHJ1bmtfaWRzGAEgASgLMhMubGl2ZWtpdC5MaX'
    'N0VXBkYXRlUgh0cnVua0lkcxIsCgRydWxlGAIgASgLMhgubGl2ZWtpdC5TSVBEaXNwYXRjaFJ1'
    'bGVSBHJ1bGUSFwoEbmFtZRgDIAEoCUgAUgRuYW1liAEBEkcKCG1ldGFkYXRhGAQgASgJQiaItR'
    'gBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPkgBUghtZXRhZGF0YYgBARJ2Cgph'
    'dHRyaWJ1dGVzGAUgAygLMi4ubGl2ZWtpdC5TSVBEaXNwYXRjaFJ1bGVVcGRhdGUuQXR0cmlidX'
    'Rlc0VudHJ5QiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPlIKYXR0cmli'
    'dXRlcxJLChBtZWRpYV9lbmNyeXB0aW9uGAYgASgOMhsubGl2ZWtpdC5TSVBNZWRpYUVuY3J5cH'
    'Rpb25IAlIPbWVkaWFFbmNyeXB0aW9uiAEBGj0KD0F0dHJpYnV0ZXNFbnRyeRIQCgNrZXkYASAB'
    'KAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBQgcKBV9uYW1lQgsKCV9tZXRhZGF0YU'
    'ITChFfbWVkaWFfZW5jcnlwdGlvbg==');

@$core.Deprecated('Use listSIPDispatchRuleRequestDescriptor instead')
const ListSIPDispatchRuleRequest$json = {
  '1': 'ListSIPDispatchRuleRequest',
  '2': [
    {'1': 'page', '3': 3, '4': 1, '5': 11, '6': '.livekit.Pagination', '10': 'page'},
    {'1': 'dispatch_rule_ids', '3': 1, '4': 3, '5': 9, '10': 'dispatchRuleIds'},
    {'1': 'trunk_ids', '3': 2, '4': 3, '5': 9, '10': 'trunkIds'},
  ],
};

/// Descriptor for `ListSIPDispatchRuleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSIPDispatchRuleRequestDescriptor = $convert.base64Decode(
    'ChpMaXN0U0lQRGlzcGF0Y2hSdWxlUmVxdWVzdBInCgRwYWdlGAMgASgLMhMubGl2ZWtpdC5QYW'
    'dpbmF0aW9uUgRwYWdlEioKEWRpc3BhdGNoX3J1bGVfaWRzGAEgAygJUg9kaXNwYXRjaFJ1bGVJ'
    'ZHMSGwoJdHJ1bmtfaWRzGAIgAygJUgh0cnVua0lkcw==');

@$core.Deprecated('Use listSIPDispatchRuleResponseDescriptor instead')
const ListSIPDispatchRuleResponse$json = {
  '1': 'ListSIPDispatchRuleResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.livekit.SIPDispatchRuleInfo', '10': 'items'},
  ],
};

/// Descriptor for `ListSIPDispatchRuleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSIPDispatchRuleResponseDescriptor = $convert.base64Decode(
    'ChtMaXN0U0lQRGlzcGF0Y2hSdWxlUmVzcG9uc2USMgoFaXRlbXMYASADKAsyHC5saXZla2l0Ll'
    'NJUERpc3BhdGNoUnVsZUluZm9SBWl0ZW1z');

@$core.Deprecated('Use deleteSIPDispatchRuleRequestDescriptor instead')
const DeleteSIPDispatchRuleRequest$json = {
  '1': 'DeleteSIPDispatchRuleRequest',
  '2': [
    {'1': 'sip_dispatch_rule_id', '3': 1, '4': 1, '5': 9, '10': 'sipDispatchRuleId'},
  ],
};

/// Descriptor for `DeleteSIPDispatchRuleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSIPDispatchRuleRequestDescriptor = $convert.base64Decode(
    'ChxEZWxldGVTSVBEaXNwYXRjaFJ1bGVSZXF1ZXN0Ei8KFHNpcF9kaXNwYXRjaF9ydWxlX2lkGA'
    'EgASgJUhFzaXBEaXNwYXRjaFJ1bGVJZA==');

@$core.Deprecated('Use sIPOutboundConfigDescriptor instead')
const SIPOutboundConfig$json = {
  '1': 'SIPOutboundConfig',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'destination_country', '3': 7, '4': 1, '5': 9, '10': 'destinationCountry'},
    {'1': 'transport', '3': 2, '4': 1, '5': 14, '6': '.livekit.SIPTransport', '10': 'transport'},
    {'1': 'auth_username', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'authUsername'},
    {'1': 'auth_password', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'authPassword'},
    {'1': 'headers_to_attributes', '3': 5, '4': 3, '5': 11, '6': '.livekit.SIPOutboundConfig.HeadersToAttributesEntry', '10': 'headersToAttributes'},
    {'1': 'attributes_to_headers', '3': 6, '4': 3, '5': 11, '6': '.livekit.SIPOutboundConfig.AttributesToHeadersEntry', '10': 'attributesToHeaders'},
  ],
  '3': [SIPOutboundConfig_HeadersToAttributesEntry$json, SIPOutboundConfig_AttributesToHeadersEntry$json],
};

@$core.Deprecated('Use sIPOutboundConfigDescriptor instead')
const SIPOutboundConfig_HeadersToAttributesEntry$json = {
  '1': 'HeadersToAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use sIPOutboundConfigDescriptor instead')
const SIPOutboundConfig_AttributesToHeadersEntry$json = {
  '1': 'AttributesToHeadersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SIPOutboundConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPOutboundConfigDescriptor = $convert.base64Decode(
    'ChFTSVBPdXRib3VuZENvbmZpZxIaCghob3N0bmFtZRgBIAEoCVIIaG9zdG5hbWUSLwoTZGVzdG'
    'luYXRpb25fY291bnRyeRgHIAEoCVISZGVzdGluYXRpb25Db3VudHJ5EjMKCXRyYW5zcG9ydBgC'
    'IAEoDjIVLmxpdmVraXQuU0lQVHJhbnNwb3J0Ugl0cmFuc3BvcnQSSwoNYXV0aF91c2VybmFtZR'
    'gDIAEoCUImiLUYAZK1GB48cmVkYWN0ZWQgKHt7IC5TaXplIH19IGJ5dGVzKT5SDGF1dGhVc2Vy'
    'bmFtZRJLCg1hdXRoX3Bhc3N3b3JkGAQgASgJQiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpem'
    'UgfX0gYnl0ZXMpPlIMYXV0aFBhc3N3b3JkEmcKFWhlYWRlcnNfdG9fYXR0cmlidXRlcxgFIAMo'
    'CzIzLmxpdmVraXQuU0lQT3V0Ym91bmRDb25maWcuSGVhZGVyc1RvQXR0cmlidXRlc0VudHJ5Uh'
    'NoZWFkZXJzVG9BdHRyaWJ1dGVzEmcKFWF0dHJpYnV0ZXNfdG9faGVhZGVycxgGIAMoCzIzLmxp'
    'dmVraXQuU0lQT3V0Ym91bmRDb25maWcuQXR0cmlidXRlc1RvSGVhZGVyc0VudHJ5UhNhdHRyaW'
    'J1dGVzVG9IZWFkZXJzGkYKGEhlYWRlcnNUb0F0dHJpYnV0ZXNFbnRyeRIQCgNrZXkYASABKAlS'
    'A2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGkYKGEF0dHJpYnV0ZXNUb0hlYWRlcnNFbn'
    'RyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use createSIPParticipantRequestDescriptor instead')
const CreateSIPParticipantRequest$json = {
  '1': 'CreateSIPParticipantRequest',
  '2': [
    {'1': 'sip_trunk_id', '3': 1, '4': 1, '5': 9, '10': 'sipTrunkId'},
    {'1': 'trunk', '3': 20, '4': 1, '5': 11, '6': '.livekit.SIPOutboundConfig', '10': 'trunk'},
    {'1': 'sip_call_to', '3': 2, '4': 1, '5': 9, '10': 'sipCallTo'},
    {'1': 'sip_number', '3': 15, '4': 1, '5': 9, '10': 'sipNumber'},
    {'1': 'room_name', '3': 3, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'participant_identity', '3': 4, '4': 1, '5': 9, '10': 'participantIdentity'},
    {'1': 'participant_name', '3': 7, '4': 1, '5': 9, '8': {}, '10': 'participantName'},
    {'1': 'participant_metadata', '3': 8, '4': 1, '5': 9, '8': {}, '10': 'participantMetadata'},
    {'1': 'participant_attributes', '3': 9, '4': 3, '5': 11, '6': '.livekit.CreateSIPParticipantRequest.ParticipantAttributesEntry', '8': {}, '10': 'participantAttributes'},
    {'1': 'dtmf', '3': 5, '4': 1, '5': 9, '10': 'dtmf'},
    {
      '1': 'play_ringtone',
      '3': 6,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'playRingtone',
    },
    {'1': 'play_dialtone', '3': 13, '4': 1, '5': 8, '10': 'playDialtone'},
    {'1': 'hide_phone_number', '3': 10, '4': 1, '5': 8, '10': 'hidePhoneNumber'},
    {'1': 'headers', '3': 16, '4': 3, '5': 11, '6': '.livekit.CreateSIPParticipantRequest.HeadersEntry', '8': {}, '10': 'headers'},
    {'1': 'include_headers', '3': 17, '4': 1, '5': 14, '6': '.livekit.SIPHeaderOptions', '10': 'includeHeaders'},
    {'1': 'ringing_timeout', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'ringingTimeout'},
    {'1': 'max_call_duration', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'maxCallDuration'},
    {'1': 'krisp_enabled', '3': 14, '4': 1, '5': 8, '10': 'krispEnabled'},
    {'1': 'media_encryption', '3': 18, '4': 1, '5': 14, '6': '.livekit.SIPMediaEncryption', '10': 'mediaEncryption'},
    {'1': 'wait_until_answered', '3': 19, '4': 1, '5': 8, '10': 'waitUntilAnswered'},
    {'1': 'display_name', '3': 21, '4': 1, '5': 9, '8': {}, '9': 0, '10': 'displayName', '17': true},
    {'1': 'destination', '3': 22, '4': 1, '5': 11, '6': '.livekit.Destination', '9': 1, '10': 'destination', '17': true},
  ],
  '3': [CreateSIPParticipantRequest_ParticipantAttributesEntry$json, CreateSIPParticipantRequest_HeadersEntry$json],
  '8': [
    {'1': '_display_name'},
    {'1': '_destination'},
  ],
};

@$core.Deprecated('Use createSIPParticipantRequestDescriptor instead')
const CreateSIPParticipantRequest_ParticipantAttributesEntry$json = {
  '1': 'ParticipantAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use createSIPParticipantRequestDescriptor instead')
const CreateSIPParticipantRequest_HeadersEntry$json = {
  '1': 'HeadersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `CreateSIPParticipantRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSIPParticipantRequestDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVTSVBQYXJ0aWNpcGFudFJlcXVlc3QSIAoMc2lwX3RydW5rX2lkGAEgASgJUgpzaX'
    'BUcnVua0lkEjAKBXRydW5rGBQgASgLMhoubGl2ZWtpdC5TSVBPdXRib3VuZENvbmZpZ1IFdHJ1'
    'bmsSHgoLc2lwX2NhbGxfdG8YAiABKAlSCXNpcENhbGxUbxIdCgpzaXBfbnVtYmVyGA8gASgJUg'
    'lzaXBOdW1iZXISGwoJcm9vbV9uYW1lGAMgASgJUghyb29tTmFtZRIxChRwYXJ0aWNpcGFudF9p'
    'ZGVudGl0eRgEIAEoCVITcGFydGljaXBhbnRJZGVudGl0eRJRChBwYXJ0aWNpcGFudF9uYW1lGA'
    'cgASgJQiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPlIPcGFydGljaXBh'
    'bnROYW1lElkKFHBhcnRpY2lwYW50X21ldGFkYXRhGAggASgJQiaItRgBkrUYHjxyZWRhY3RlZC'
    'Aoe3sgLlNpemUgfX0gYnl0ZXMpPlITcGFydGljaXBhbnRNZXRhZGF0YRKeAQoWcGFydGljaXBh'
    'bnRfYXR0cmlidXRlcxgJIAMoCzI/LmxpdmVraXQuQ3JlYXRlU0lQUGFydGljaXBhbnRSZXF1ZX'
    'N0LlBhcnRpY2lwYW50QXR0cmlidXRlc0VudHJ5QiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNp'
    'emUgfX0gYnl0ZXMpPlIVcGFydGljaXBhbnRBdHRyaWJ1dGVzEhIKBGR0bWYYBSABKAlSBGR0bW'
    'YSJwoNcGxheV9yaW5ndG9uZRgGIAEoCEICGAFSDHBsYXlSaW5ndG9uZRIjCg1wbGF5X2RpYWx0'
    'b25lGA0gASgIUgxwbGF5RGlhbHRvbmUSKgoRaGlkZV9waG9uZV9udW1iZXIYCiABKAhSD2hpZG'
    'VQaG9uZU51bWJlchJzCgdoZWFkZXJzGBAgAygLMjEubGl2ZWtpdC5DcmVhdGVTSVBQYXJ0aWNp'
    'cGFudFJlcXVlc3QuSGVhZGVyc0VudHJ5QiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX'
    '0gYnl0ZXMpPlIHaGVhZGVycxJCCg9pbmNsdWRlX2hlYWRlcnMYESABKA4yGS5saXZla2l0LlNJ'
    'UEhlYWRlck9wdGlvbnNSDmluY2x1ZGVIZWFkZXJzEkIKD3JpbmdpbmdfdGltZW91dBgLIAEoCz'
    'IZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIOcmluZ2luZ1RpbWVvdXQSRQoRbWF4X2NhbGxf'
    'ZHVyYXRpb24YDCABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25SD21heENhbGxEdXJhdG'
    'lvbhIjCg1rcmlzcF9lbmFibGVkGA4gASgIUgxrcmlzcEVuYWJsZWQSRgoQbWVkaWFfZW5jcnlw'
    'dGlvbhgSIAEoDjIbLmxpdmVraXQuU0lQTWVkaWFFbmNyeXB0aW9uUg9tZWRpYUVuY3J5cHRpb2'
    '4SLgoTd2FpdF91bnRpbF9hbnN3ZXJlZBgTIAEoCFIRd2FpdFVudGlsQW5zd2VyZWQSTgoMZGlz'
    'cGxheV9uYW1lGBUgASgJQiaItRgBkrUYHjxyZWRhY3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPk'
    'gAUgtkaXNwbGF5TmFtZYgBARI7CgtkZXN0aW5hdGlvbhgWIAEoCzIULmxpdmVraXQuRGVzdGlu'
    'YXRpb25IAVILZGVzdGluYXRpb26IAQEaSAoaUGFydGljaXBhbnRBdHRyaWJ1dGVzRW50cnkSEA'
    'oDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4ARo6CgxIZWFkZXJzRW50'
    'cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AUIPCg1fZGlzcG'
    'xheV9uYW1lQg4KDF9kZXN0aW5hdGlvbg==');

@$core.Deprecated('Use sIPParticipantInfoDescriptor instead')
const SIPParticipantInfo$json = {
  '1': 'SIPParticipantInfo',
  '2': [
    {'1': 'participant_id', '3': 1, '4': 1, '5': 9, '10': 'participantId'},
    {'1': 'participant_identity', '3': 2, '4': 1, '5': 9, '10': 'participantIdentity'},
    {'1': 'room_name', '3': 3, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'sip_call_id', '3': 4, '4': 1, '5': 9, '10': 'sipCallId'},
  ],
};

/// Descriptor for `SIPParticipantInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPParticipantInfoDescriptor = $convert.base64Decode(
    'ChJTSVBQYXJ0aWNpcGFudEluZm8SJQoOcGFydGljaXBhbnRfaWQYASABKAlSDXBhcnRpY2lwYW'
    '50SWQSMQoUcGFydGljaXBhbnRfaWRlbnRpdHkYAiABKAlSE3BhcnRpY2lwYW50SWRlbnRpdHkS'
    'GwoJcm9vbV9uYW1lGAMgASgJUghyb29tTmFtZRIeCgtzaXBfY2FsbF9pZBgEIAEoCVIJc2lwQ2'
    'FsbElk');

@$core.Deprecated('Use transferSIPParticipantRequestDescriptor instead')
const TransferSIPParticipantRequest$json = {
  '1': 'TransferSIPParticipantRequest',
  '2': [
    {'1': 'participant_identity', '3': 1, '4': 1, '5': 9, '10': 'participantIdentity'},
    {'1': 'room_name', '3': 2, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'transfer_to', '3': 3, '4': 1, '5': 9, '10': 'transferTo'},
    {'1': 'play_dialtone', '3': 4, '4': 1, '5': 8, '10': 'playDialtone'},
    {'1': 'headers', '3': 5, '4': 3, '5': 11, '6': '.livekit.TransferSIPParticipantRequest.HeadersEntry', '8': {}, '10': 'headers'},
    {'1': 'ringing_timeout', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'ringingTimeout'},
  ],
  '3': [TransferSIPParticipantRequest_HeadersEntry$json],
};

@$core.Deprecated('Use transferSIPParticipantRequestDescriptor instead')
const TransferSIPParticipantRequest_HeadersEntry$json = {
  '1': 'HeadersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `TransferSIPParticipantRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferSIPParticipantRequestDescriptor = $convert.base64Decode(
    'Ch1UcmFuc2ZlclNJUFBhcnRpY2lwYW50UmVxdWVzdBIxChRwYXJ0aWNpcGFudF9pZGVudGl0eR'
    'gBIAEoCVITcGFydGljaXBhbnRJZGVudGl0eRIbCglyb29tX25hbWUYAiABKAlSCHJvb21OYW1l'
    'Eh8KC3RyYW5zZmVyX3RvGAMgASgJUgp0cmFuc2ZlclRvEiMKDXBsYXlfZGlhbHRvbmUYBCABKA'
    'hSDHBsYXlEaWFsdG9uZRJ1CgdoZWFkZXJzGAUgAygLMjMubGl2ZWtpdC5UcmFuc2ZlclNJUFBh'
    'cnRpY2lwYW50UmVxdWVzdC5IZWFkZXJzRW50cnlCJoi1GAGStRgePHJlZGFjdGVkICh7eyAuU2'
    'l6ZSB9fSBieXRlcyk+UgdoZWFkZXJzEkIKD3JpbmdpbmdfdGltZW91dBgGIAEoCzIZLmdvb2ds'
    'ZS5wcm90b2J1Zi5EdXJhdGlvblIOcmluZ2luZ1RpbWVvdXQaOgoMSGVhZGVyc0VudHJ5EhAKA2'
    'tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use sIPCallInfoDescriptor instead')
const SIPCallInfo$json = {
  '1': 'SIPCallInfo',
  '2': [
    {'1': 'call_id', '3': 1, '4': 1, '5': 9, '10': 'callId'},
    {'1': 'trunk_id', '3': 2, '4': 1, '5': 9, '10': 'trunkId'},
    {'1': 'dispatch_rule_id', '3': 16, '4': 1, '5': 9, '10': 'dispatchRuleId'},
    {'1': 'region', '3': 17, '4': 1, '5': 9, '10': 'region'},
    {'1': 'room_name', '3': 3, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'room_id', '3': 4, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'participant_identity', '3': 5, '4': 1, '5': 9, '10': 'participantIdentity'},
    {'1': 'participant_attributes', '3': 18, '4': 3, '5': 11, '6': '.livekit.SIPCallInfo.ParticipantAttributesEntry', '8': {}, '10': 'participantAttributes'},
    {'1': 'from_uri', '3': 6, '4': 1, '5': 11, '6': '.livekit.SIPUri', '10': 'fromUri'},
    {'1': 'to_uri', '3': 7, '4': 1, '5': 11, '6': '.livekit.SIPUri', '10': 'toUri'},
    {
      '1': 'created_at',
      '3': 9,
      '4': 1,
      '5': 3,
      '8': {'3': true},
      '10': 'createdAt',
    },
    {
      '1': 'started_at',
      '3': 10,
      '4': 1,
      '5': 3,
      '8': {'3': true},
      '10': 'startedAt',
    },
    {
      '1': 'ended_at',
      '3': 11,
      '4': 1,
      '5': 3,
      '8': {'3': true},
      '10': 'endedAt',
    },
    {'1': 'enabled_features', '3': 14, '4': 3, '5': 14, '6': '.livekit.SIPFeature', '10': 'enabledFeatures'},
    {'1': 'call_direction', '3': 15, '4': 1, '5': 14, '6': '.livekit.SIPCallDirection', '10': 'callDirection'},
    {'1': 'call_status', '3': 8, '4': 1, '5': 14, '6': '.livekit.SIPCallStatus', '10': 'callStatus'},
    {'1': 'created_at_ns', '3': 22, '4': 1, '5': 3, '10': 'createdAtNs'},
    {'1': 'started_at_ns', '3': 23, '4': 1, '5': 3, '10': 'startedAtNs'},
    {'1': 'ended_at_ns', '3': 24, '4': 1, '5': 3, '10': 'endedAtNs'},
    {'1': 'disconnect_reason', '3': 12, '4': 1, '5': 14, '6': '.livekit.DisconnectReason', '10': 'disconnectReason'},
    {'1': 'error', '3': 13, '4': 1, '5': 9, '10': 'error'},
    {'1': 'call_status_code', '3': 19, '4': 1, '5': 11, '6': '.livekit.SIPStatus', '10': 'callStatusCode'},
    {'1': 'audio_codec', '3': 20, '4': 1, '5': 9, '10': 'audioCodec'},
    {'1': 'media_encryption', '3': 21, '4': 1, '5': 9, '10': 'mediaEncryption'},
    {'1': 'pcap_file_link', '3': 25, '4': 1, '5': 9, '10': 'pcapFileLink'},
    {'1': 'call_context', '3': 26, '4': 3, '5': 11, '6': '.google.protobuf.Any', '10': 'callContext'},
    {'1': 'provider_info', '3': 27, '4': 1, '5': 11, '6': '.livekit.ProviderInfo', '10': 'providerInfo'},
  ],
  '3': [SIPCallInfo_ParticipantAttributesEntry$json],
};

@$core.Deprecated('Use sIPCallInfoDescriptor instead')
const SIPCallInfo_ParticipantAttributesEntry$json = {
  '1': 'ParticipantAttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SIPCallInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPCallInfoDescriptor = $convert.base64Decode(
    'CgtTSVBDYWxsSW5mbxIXCgdjYWxsX2lkGAEgASgJUgZjYWxsSWQSGQoIdHJ1bmtfaWQYAiABKA'
    'lSB3RydW5rSWQSKAoQZGlzcGF0Y2hfcnVsZV9pZBgQIAEoCVIOZGlzcGF0Y2hSdWxlSWQSFgoG'
    'cmVnaW9uGBEgASgJUgZyZWdpb24SGwoJcm9vbV9uYW1lGAMgASgJUghyb29tTmFtZRIXCgdyb2'
    '9tX2lkGAQgASgJUgZyb29tSWQSMQoUcGFydGljaXBhbnRfaWRlbnRpdHkYBSABKAlSE3BhcnRp'
    'Y2lwYW50SWRlbnRpdHkSjgEKFnBhcnRpY2lwYW50X2F0dHJpYnV0ZXMYEiADKAsyLy5saXZla2'
    'l0LlNJUENhbGxJbmZvLlBhcnRpY2lwYW50QXR0cmlidXRlc0VudHJ5QiaItRgBkrUYHjxyZWRh'
    'Y3RlZCAoe3sgLlNpemUgfX0gYnl0ZXMpPlIVcGFydGljaXBhbnRBdHRyaWJ1dGVzEioKCGZyb2'
    '1fdXJpGAYgASgLMg8ubGl2ZWtpdC5TSVBVcmlSB2Zyb21VcmkSJgoGdG9fdXJpGAcgASgLMg8u'
    'bGl2ZWtpdC5TSVBVcmlSBXRvVXJpEiEKCmNyZWF0ZWRfYXQYCSABKANCAhgBUgljcmVhdGVkQX'
    'QSIQoKc3RhcnRlZF9hdBgKIAEoA0ICGAFSCXN0YXJ0ZWRBdBIdCghlbmRlZF9hdBgLIAEoA0IC'
    'GAFSB2VuZGVkQXQSPgoQZW5hYmxlZF9mZWF0dXJlcxgOIAMoDjITLmxpdmVraXQuU0lQRmVhdH'
    'VyZVIPZW5hYmxlZEZlYXR1cmVzEkAKDmNhbGxfZGlyZWN0aW9uGA8gASgOMhkubGl2ZWtpdC5T'
    'SVBDYWxsRGlyZWN0aW9uUg1jYWxsRGlyZWN0aW9uEjcKC2NhbGxfc3RhdHVzGAggASgOMhYubG'
    'l2ZWtpdC5TSVBDYWxsU3RhdHVzUgpjYWxsU3RhdHVzEiIKDWNyZWF0ZWRfYXRfbnMYFiABKANS'
    'C2NyZWF0ZWRBdE5zEiIKDXN0YXJ0ZWRfYXRfbnMYFyABKANSC3N0YXJ0ZWRBdE5zEh4KC2VuZG'
    'VkX2F0X25zGBggASgDUgllbmRlZEF0TnMSRgoRZGlzY29ubmVjdF9yZWFzb24YDCABKA4yGS5s'
    'aXZla2l0LkRpc2Nvbm5lY3RSZWFzb25SEGRpc2Nvbm5lY3RSZWFzb24SFAoFZXJyb3IYDSABKA'
    'lSBWVycm9yEjwKEGNhbGxfc3RhdHVzX2NvZGUYEyABKAsyEi5saXZla2l0LlNJUFN0YXR1c1IO'
    'Y2FsbFN0YXR1c0NvZGUSHwoLYXVkaW9fY29kZWMYFCABKAlSCmF1ZGlvQ29kZWMSKQoQbWVkaW'
    'FfZW5jcnlwdGlvbhgVIAEoCVIPbWVkaWFFbmNyeXB0aW9uEiQKDnBjYXBfZmlsZV9saW5rGBkg'
    'ASgJUgxwY2FwRmlsZUxpbmsSNwoMY2FsbF9jb250ZXh0GBogAygLMhQuZ29vZ2xlLnByb3RvYn'
    'VmLkFueVILY2FsbENvbnRleHQSOgoNcHJvdmlkZXJfaW5mbxgbIAEoCzIVLmxpdmVraXQuUHJv'
    'dmlkZXJJbmZvUgxwcm92aWRlckluZm8aSAoaUGFydGljaXBhbnRBdHRyaWJ1dGVzRW50cnkSEA'
    'oDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use sIPTransferInfoDescriptor instead')
const SIPTransferInfo$json = {
  '1': 'SIPTransferInfo',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {'1': 'call_id', '3': 2, '4': 1, '5': 9, '10': 'callId'},
    {'1': 'transfer_to', '3': 3, '4': 1, '5': 9, '10': 'transferTo'},
    {'1': 'transfer_initiated_at_ns', '3': 4, '4': 1, '5': 3, '10': 'transferInitiatedAtNs'},
    {'1': 'transfer_completed_at_ns', '3': 5, '4': 1, '5': 3, '10': 'transferCompletedAtNs'},
    {'1': 'transfer_status', '3': 6, '4': 1, '5': 14, '6': '.livekit.SIPTransferStatus', '10': 'transferStatus'},
    {'1': 'error', '3': 7, '4': 1, '5': 9, '10': 'error'},
    {'1': 'transfer_status_code', '3': 8, '4': 1, '5': 11, '6': '.livekit.SIPStatus', '10': 'transferStatusCode'},
  ],
};

/// Descriptor for `SIPTransferInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPTransferInfoDescriptor = $convert.base64Decode(
    'Cg9TSVBUcmFuc2ZlckluZm8SHwoLdHJhbnNmZXJfaWQYASABKAlSCnRyYW5zZmVySWQSFwoHY2'
    'FsbF9pZBgCIAEoCVIGY2FsbElkEh8KC3RyYW5zZmVyX3RvGAMgASgJUgp0cmFuc2ZlclRvEjcK'
    'GHRyYW5zZmVyX2luaXRpYXRlZF9hdF9ucxgEIAEoA1IVdHJhbnNmZXJJbml0aWF0ZWRBdE5zEj'
    'cKGHRyYW5zZmVyX2NvbXBsZXRlZF9hdF9ucxgFIAEoA1IVdHJhbnNmZXJDb21wbGV0ZWRBdE5z'
    'EkMKD3RyYW5zZmVyX3N0YXR1cxgGIAEoDjIaLmxpdmVraXQuU0lQVHJhbnNmZXJTdGF0dXNSDn'
    'RyYW5zZmVyU3RhdHVzEhQKBWVycm9yGAcgASgJUgVlcnJvchJEChR0cmFuc2Zlcl9zdGF0dXNf'
    'Y29kZRgIIAEoCzISLmxpdmVraXQuU0lQU3RhdHVzUhJ0cmFuc2ZlclN0YXR1c0NvZGU=');

@$core.Deprecated('Use sIPUriDescriptor instead')
const SIPUri$json = {
  '1': 'SIPUri',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 9, '10': 'user'},
    {'1': 'host', '3': 2, '4': 1, '5': 9, '10': 'host'},
    {'1': 'ip', '3': 3, '4': 1, '5': 9, '10': 'ip'},
    {'1': 'port', '3': 4, '4': 1, '5': 13, '10': 'port'},
    {'1': 'transport', '3': 5, '4': 1, '5': 14, '6': '.livekit.SIPTransport', '10': 'transport'},
  ],
};

/// Descriptor for `SIPUri`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sIPUriDescriptor = $convert.base64Decode(
    'CgZTSVBVcmkSEgoEdXNlchgBIAEoCVIEdXNlchISCgRob3N0GAIgASgJUgRob3N0Eg4KAmlwGA'
    'MgASgJUgJpcBISCgRwb3J0GAQgASgNUgRwb3J0EjMKCXRyYW5zcG9ydBgFIAEoDjIVLmxpdmVr'
    'aXQuU0lQVHJhbnNwb3J0Ugl0cmFuc3BvcnQ=');

@$core.Deprecated('Use destinationDescriptor instead')
const Destination$json = {
  '1': 'Destination',
  '2': [
    {'1': 'city', '3': 1, '4': 1, '5': 9, '10': 'city'},
    {'1': 'country', '3': 2, '4': 1, '5': 9, '10': 'country'},
    {'1': 'region', '3': 3, '4': 1, '5': 9, '10': 'region'},
  ],
};

/// Descriptor for `Destination`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List destinationDescriptor = $convert.base64Decode(
    'CgtEZXN0aW5hdGlvbhISCgRjaXR5GAEgASgJUgRjaXR5EhgKB2NvdW50cnkYAiABKAlSB2NvdW'
    '50cnkSFgoGcmVnaW9uGAMgASgJUgZyZWdpb24=');

const $core.Map<$core.String, $core.dynamic> SIPServiceBase$json = {
  '1': 'SIP',
  '2': [
    {
      '1': 'ListSIPTrunk',
      '2': '.livekit.ListSIPTrunkRequest',
      '3': '.livekit.ListSIPTrunkResponse',
      '4': {'33': true},
    },
    {'1': 'CreateSIPInboundTrunk', '2': '.livekit.CreateSIPInboundTrunkRequest', '3': '.livekit.SIPInboundTrunkInfo'},
    {'1': 'CreateSIPOutboundTrunk', '2': '.livekit.CreateSIPOutboundTrunkRequest', '3': '.livekit.SIPOutboundTrunkInfo'},
    {'1': 'UpdateSIPInboundTrunk', '2': '.livekit.UpdateSIPInboundTrunkRequest', '3': '.livekit.SIPInboundTrunkInfo'},
    {'1': 'UpdateSIPOutboundTrunk', '2': '.livekit.UpdateSIPOutboundTrunkRequest', '3': '.livekit.SIPOutboundTrunkInfo'},
    {'1': 'GetSIPInboundTrunk', '2': '.livekit.GetSIPInboundTrunkRequest', '3': '.livekit.GetSIPInboundTrunkResponse'},
    {'1': 'GetSIPOutboundTrunk', '2': '.livekit.GetSIPOutboundTrunkRequest', '3': '.livekit.GetSIPOutboundTrunkResponse'},
    {'1': 'ListSIPInboundTrunk', '2': '.livekit.ListSIPInboundTrunkRequest', '3': '.livekit.ListSIPInboundTrunkResponse'},
    {'1': 'ListSIPOutboundTrunk', '2': '.livekit.ListSIPOutboundTrunkRequest', '3': '.livekit.ListSIPOutboundTrunkResponse'},
    {'1': 'DeleteSIPTrunk', '2': '.livekit.DeleteSIPTrunkRequest', '3': '.livekit.SIPTrunkInfo'},
    {'1': 'CreateSIPDispatchRule', '2': '.livekit.CreateSIPDispatchRuleRequest', '3': '.livekit.SIPDispatchRuleInfo'},
    {'1': 'UpdateSIPDispatchRule', '2': '.livekit.UpdateSIPDispatchRuleRequest', '3': '.livekit.SIPDispatchRuleInfo'},
    {'1': 'ListSIPDispatchRule', '2': '.livekit.ListSIPDispatchRuleRequest', '3': '.livekit.ListSIPDispatchRuleResponse'},
    {'1': 'DeleteSIPDispatchRule', '2': '.livekit.DeleteSIPDispatchRuleRequest', '3': '.livekit.SIPDispatchRuleInfo'},
    {'1': 'CreateSIPParticipant', '2': '.livekit.CreateSIPParticipantRequest', '3': '.livekit.SIPParticipantInfo'},
    {'1': 'TransferSIPParticipant', '2': '.livekit.TransferSIPParticipantRequest', '3': '.google.protobuf.Empty'},
  ],
};

@$core.Deprecated('Use sIPServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> SIPServiceBase$messageJson = {
  '.livekit.ListSIPTrunkRequest': ListSIPTrunkRequest$json,
  '.livekit.Pagination': $2.Pagination$json,
  '.livekit.ListSIPTrunkResponse': ListSIPTrunkResponse$json,
  '.livekit.SIPTrunkInfo': SIPTrunkInfo$json,
  '.livekit.CreateSIPInboundTrunkRequest': CreateSIPInboundTrunkRequest$json,
  '.livekit.SIPInboundTrunkInfo': SIPInboundTrunkInfo$json,
  '.livekit.SIPInboundTrunkInfo.HeadersEntry': SIPInboundTrunkInfo_HeadersEntry$json,
  '.livekit.SIPInboundTrunkInfo.HeadersToAttributesEntry': SIPInboundTrunkInfo_HeadersToAttributesEntry$json,
  '.google.protobuf.Duration': $10.Duration$json,
  '.livekit.SIPInboundTrunkInfo.AttributesToHeadersEntry': SIPInboundTrunkInfo_AttributesToHeadersEntry$json,
  '.livekit.CreateSIPOutboundTrunkRequest': CreateSIPOutboundTrunkRequest$json,
  '.livekit.SIPOutboundTrunkInfo': SIPOutboundTrunkInfo$json,
  '.livekit.SIPOutboundTrunkInfo.HeadersEntry': SIPOutboundTrunkInfo_HeadersEntry$json,
  '.livekit.SIPOutboundTrunkInfo.HeadersToAttributesEntry': SIPOutboundTrunkInfo_HeadersToAttributesEntry$json,
  '.livekit.SIPOutboundTrunkInfo.AttributesToHeadersEntry': SIPOutboundTrunkInfo_AttributesToHeadersEntry$json,
  '.livekit.UpdateSIPInboundTrunkRequest': UpdateSIPInboundTrunkRequest$json,
  '.livekit.SIPInboundTrunkUpdate': SIPInboundTrunkUpdate$json,
  '.livekit.ListUpdate': $2.ListUpdate$json,
  '.livekit.UpdateSIPOutboundTrunkRequest': UpdateSIPOutboundTrunkRequest$json,
  '.livekit.SIPOutboundTrunkUpdate': SIPOutboundTrunkUpdate$json,
  '.livekit.GetSIPInboundTrunkRequest': GetSIPInboundTrunkRequest$json,
  '.livekit.GetSIPInboundTrunkResponse': GetSIPInboundTrunkResponse$json,
  '.livekit.GetSIPOutboundTrunkRequest': GetSIPOutboundTrunkRequest$json,
  '.livekit.GetSIPOutboundTrunkResponse': GetSIPOutboundTrunkResponse$json,
  '.livekit.ListSIPInboundTrunkRequest': ListSIPInboundTrunkRequest$json,
  '.livekit.ListSIPInboundTrunkResponse': ListSIPInboundTrunkResponse$json,
  '.livekit.ListSIPOutboundTrunkRequest': ListSIPOutboundTrunkRequest$json,
  '.livekit.ListSIPOutboundTrunkResponse': ListSIPOutboundTrunkResponse$json,
  '.livekit.DeleteSIPTrunkRequest': DeleteSIPTrunkRequest$json,
  '.livekit.CreateSIPDispatchRuleRequest': CreateSIPDispatchRuleRequest$json,
  '.livekit.SIPDispatchRule': SIPDispatchRule$json,
  '.livekit.SIPDispatchRuleDirect': SIPDispatchRuleDirect$json,
  '.livekit.SIPDispatchRuleIndividual': SIPDispatchRuleIndividual$json,
  '.livekit.SIPDispatchRuleCallee': SIPDispatchRuleCallee$json,
  '.livekit.CreateSIPDispatchRuleRequest.AttributesEntry': CreateSIPDispatchRuleRequest_AttributesEntry$json,
  '.livekit.RoomConfiguration': $9.RoomConfiguration$json,
  '.livekit.RoomEgress': $9.RoomEgress$json,
  '.livekit.RoomCompositeEgressRequest': $7.RoomCompositeEgressRequest$json,
  '.livekit.EncodedFileOutput': $7.EncodedFileOutput$json,
  '.livekit.S3Upload': $7.S3Upload$json,
  '.livekit.S3Upload.MetadataEntry': $7.S3Upload_MetadataEntry$json,
  '.livekit.ProxyConfig': $7.ProxyConfig$json,
  '.livekit.GCPUpload': $7.GCPUpload$json,
  '.livekit.AzureBlobUpload': $7.AzureBlobUpload$json,
  '.livekit.AliOSSUpload': $7.AliOSSUpload$json,
  '.livekit.StreamOutput': $7.StreamOutput$json,
  '.livekit.EncodingOptions': $7.EncodingOptions$json,
  '.livekit.SegmentedFileOutput': $7.SegmentedFileOutput$json,
  '.livekit.ImageOutput': $7.ImageOutput$json,
  '.livekit.WebhookConfig': $2.WebhookConfig$json,
  '.livekit.FilterParams': $2.FilterParams$json,
  '.livekit.AutoTrackEgress': $7.AutoTrackEgress$json,
  '.livekit.AutoParticipantEgress': $7.AutoParticipantEgress$json,
  '.livekit.RoomAgentDispatch': $6.RoomAgentDispatch$json,
  '.livekit.SIPDispatchRuleInfo': SIPDispatchRuleInfo$json,
  '.livekit.SIPDispatchRuleInfo.AttributesEntry': SIPDispatchRuleInfo_AttributesEntry$json,
  '.livekit.UpdateSIPDispatchRuleRequest': UpdateSIPDispatchRuleRequest$json,
  '.livekit.SIPDispatchRuleUpdate': SIPDispatchRuleUpdate$json,
  '.livekit.SIPDispatchRuleUpdate.AttributesEntry': SIPDispatchRuleUpdate_AttributesEntry$json,
  '.livekit.ListSIPDispatchRuleRequest': ListSIPDispatchRuleRequest$json,
  '.livekit.ListSIPDispatchRuleResponse': ListSIPDispatchRuleResponse$json,
  '.livekit.DeleteSIPDispatchRuleRequest': DeleteSIPDispatchRuleRequest$json,
  '.livekit.CreateSIPParticipantRequest': CreateSIPParticipantRequest$json,
  '.livekit.CreateSIPParticipantRequest.ParticipantAttributesEntry': CreateSIPParticipantRequest_ParticipantAttributesEntry$json,
  '.livekit.CreateSIPParticipantRequest.HeadersEntry': CreateSIPParticipantRequest_HeadersEntry$json,
  '.livekit.SIPOutboundConfig': SIPOutboundConfig$json,
  '.livekit.SIPOutboundConfig.HeadersToAttributesEntry': SIPOutboundConfig_HeadersToAttributesEntry$json,
  '.livekit.SIPOutboundConfig.AttributesToHeadersEntry': SIPOutboundConfig_AttributesToHeadersEntry$json,
  '.livekit.Destination': Destination$json,
  '.livekit.SIPParticipantInfo': SIPParticipantInfo$json,
  '.livekit.TransferSIPParticipantRequest': TransferSIPParticipantRequest$json,
  '.livekit.TransferSIPParticipantRequest.HeadersEntry': TransferSIPParticipantRequest_HeadersEntry$json,
  '.google.protobuf.Empty': $3.Empty$json,
};

/// Descriptor for `SIP`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List sIPServiceDescriptor = $convert.base64Decode(
    'CgNTSVASUAoMTGlzdFNJUFRydW5rEhwubGl2ZWtpdC5MaXN0U0lQVHJ1bmtSZXF1ZXN0Gh0ubG'
    'l2ZWtpdC5MaXN0U0lQVHJ1bmtSZXNwb25zZSIDiAIBElwKFUNyZWF0ZVNJUEluYm91bmRUcnVu'
    'axIlLmxpdmVraXQuQ3JlYXRlU0lQSW5ib3VuZFRydW5rUmVxdWVzdBocLmxpdmVraXQuU0lQSW'
    '5ib3VuZFRydW5rSW5mbxJfChZDcmVhdGVTSVBPdXRib3VuZFRydW5rEiYubGl2ZWtpdC5DcmVh'
    'dGVTSVBPdXRib3VuZFRydW5rUmVxdWVzdBodLmxpdmVraXQuU0lQT3V0Ym91bmRUcnVua0luZm'
    '8SXAoVVXBkYXRlU0lQSW5ib3VuZFRydW5rEiUubGl2ZWtpdC5VcGRhdGVTSVBJbmJvdW5kVHJ1'
    'bmtSZXF1ZXN0GhwubGl2ZWtpdC5TSVBJbmJvdW5kVHJ1bmtJbmZvEl8KFlVwZGF0ZVNJUE91dG'
    'JvdW5kVHJ1bmsSJi5saXZla2l0LlVwZGF0ZVNJUE91dGJvdW5kVHJ1bmtSZXF1ZXN0Gh0ubGl2'
    'ZWtpdC5TSVBPdXRib3VuZFRydW5rSW5mbxJdChJHZXRTSVBJbmJvdW5kVHJ1bmsSIi5saXZla2'
    'l0LkdldFNJUEluYm91bmRUcnVua1JlcXVlc3QaIy5saXZla2l0LkdldFNJUEluYm91bmRUcnVu'
    'a1Jlc3BvbnNlEmAKE0dldFNJUE91dGJvdW5kVHJ1bmsSIy5saXZla2l0LkdldFNJUE91dGJvdW'
    '5kVHJ1bmtSZXF1ZXN0GiQubGl2ZWtpdC5HZXRTSVBPdXRib3VuZFRydW5rUmVzcG9uc2USYAoT'
    'TGlzdFNJUEluYm91bmRUcnVuaxIjLmxpdmVraXQuTGlzdFNJUEluYm91bmRUcnVua1JlcXVlc3'
    'QaJC5saXZla2l0Lkxpc3RTSVBJbmJvdW5kVHJ1bmtSZXNwb25zZRJjChRMaXN0U0lQT3V0Ym91'
    'bmRUcnVuaxIkLmxpdmVraXQuTGlzdFNJUE91dGJvdW5kVHJ1bmtSZXF1ZXN0GiUubGl2ZWtpdC'
    '5MaXN0U0lQT3V0Ym91bmRUcnVua1Jlc3BvbnNlEkcKDkRlbGV0ZVNJUFRydW5rEh4ubGl2ZWtp'
    'dC5EZWxldGVTSVBUcnVua1JlcXVlc3QaFS5saXZla2l0LlNJUFRydW5rSW5mbxJcChVDcmVhdG'
    'VTSVBEaXNwYXRjaFJ1bGUSJS5saXZla2l0LkNyZWF0ZVNJUERpc3BhdGNoUnVsZVJlcXVlc3Qa'
    'HC5saXZla2l0LlNJUERpc3BhdGNoUnVsZUluZm8SXAoVVXBkYXRlU0lQRGlzcGF0Y2hSdWxlEi'
    'UubGl2ZWtpdC5VcGRhdGVTSVBEaXNwYXRjaFJ1bGVSZXF1ZXN0GhwubGl2ZWtpdC5TSVBEaXNw'
    'YXRjaFJ1bGVJbmZvEmAKE0xpc3RTSVBEaXNwYXRjaFJ1bGUSIy5saXZla2l0Lkxpc3RTSVBEaX'
    'NwYXRjaFJ1bGVSZXF1ZXN0GiQubGl2ZWtpdC5MaXN0U0lQRGlzcGF0Y2hSdWxlUmVzcG9uc2US'
    'XAoVRGVsZXRlU0lQRGlzcGF0Y2hSdWxlEiUubGl2ZWtpdC5EZWxldGVTSVBEaXNwYXRjaFJ1bG'
    'VSZXF1ZXN0GhwubGl2ZWtpdC5TSVBEaXNwYXRjaFJ1bGVJbmZvElkKFENyZWF0ZVNJUFBhcnRp'
    'Y2lwYW50EiQubGl2ZWtpdC5DcmVhdGVTSVBQYXJ0aWNpcGFudFJlcXVlc3QaGy5saXZla2l0Ll'
    'NJUFBhcnRpY2lwYW50SW5mbxJYChZUcmFuc2ZlclNJUFBhcnRpY2lwYW50EiYubGl2ZWtpdC5U'
    'cmFuc2ZlclNJUFBhcnRpY2lwYW50UmVxdWVzdBoWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eQ==');

