//
//  Generated code. Do not modify.
//  source: livekit_phone_number.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;
import 'livekit_models.pb.dart' as $2;
import 'livekit_phone_number.pbenum.dart';

export 'livekit_phone_number.pbenum.dart';

/// SearchPhoneNumbersRequest - Request to search available phone numbers
class SearchPhoneNumbersRequest extends $pb.GeneratedMessage {
  factory SearchPhoneNumbersRequest({
    $core.String? countryCode,
    $core.String? areaCode,
    $core.int? limit,
    $2.TokenPagination? pageToken,
  }) {
    final $result = create();
    if (countryCode != null) {
      $result.countryCode = countryCode;
    }
    if (areaCode != null) {
      $result.areaCode = areaCode;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  SearchPhoneNumbersRequest._() : super();
  factory SearchPhoneNumbersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchPhoneNumbersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchPhoneNumbersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'countryCode')
    ..aOS(2, _omitFieldNames ? '' : 'areaCode')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..aOM<$2.TokenPagination>(4, _omitFieldNames ? '' : 'pageToken', subBuilder: $2.TokenPagination.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchPhoneNumbersRequest clone() => SearchPhoneNumbersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchPhoneNumbersRequest copyWith(void Function(SearchPhoneNumbersRequest) updates) => super.copyWith((message) => updates(message as SearchPhoneNumbersRequest)) as SearchPhoneNumbersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchPhoneNumbersRequest create() => SearchPhoneNumbersRequest._();
  SearchPhoneNumbersRequest createEmptyInstance() => create();
  static $pb.PbList<SearchPhoneNumbersRequest> createRepeated() => $pb.PbList<SearchPhoneNumbersRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchPhoneNumbersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchPhoneNumbersRequest>(create);
  static SearchPhoneNumbersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get countryCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set countryCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCountryCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCountryCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get areaCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set areaCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAreaCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearAreaCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get limit => $_getIZ(2);
  @$pb.TagNumber(3)
  set limit($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => clearField(3);

  @$pb.TagNumber(4)
  $2.TokenPagination get pageToken => $_getN(3);
  @$pb.TagNumber(4)
  set pageToken($2.TokenPagination v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPageToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearPageToken() => clearField(4);
  @$pb.TagNumber(4)
  $2.TokenPagination ensurePageToken() => $_ensure(3);
}

/// SearchPhoneNumbersResponse - Response containing available phone numbers
class SearchPhoneNumbersResponse extends $pb.GeneratedMessage {
  factory SearchPhoneNumbersResponse({
    $core.Iterable<PhoneNumber>? items,
    $2.TokenPagination? nextPageToken,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  SearchPhoneNumbersResponse._() : super();
  factory SearchPhoneNumbersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchPhoneNumbersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchPhoneNumbersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<PhoneNumber>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: PhoneNumber.create)
    ..aOM<$2.TokenPagination>(2, _omitFieldNames ? '' : 'nextPageToken', subBuilder: $2.TokenPagination.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchPhoneNumbersResponse clone() => SearchPhoneNumbersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchPhoneNumbersResponse copyWith(void Function(SearchPhoneNumbersResponse) updates) => super.copyWith((message) => updates(message as SearchPhoneNumbersResponse)) as SearchPhoneNumbersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchPhoneNumbersResponse create() => SearchPhoneNumbersResponse._();
  SearchPhoneNumbersResponse createEmptyInstance() => create();
  static $pb.PbList<SearchPhoneNumbersResponse> createRepeated() => $pb.PbList<SearchPhoneNumbersResponse>();
  @$core.pragma('dart2js:noInline')
  static SearchPhoneNumbersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchPhoneNumbersResponse>(create);
  static SearchPhoneNumbersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PhoneNumber> get items => $_getList(0);

  @$pb.TagNumber(2)
  $2.TokenPagination get nextPageToken => $_getN(1);
  @$pb.TagNumber(2)
  set nextPageToken($2.TokenPagination v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => clearField(2);
  @$pb.TagNumber(2)
  $2.TokenPagination ensureNextPageToken() => $_ensure(1);
}

/// PurchasePhoneNumberRequest - Request to purchase phone numbers
class PurchasePhoneNumberRequest extends $pb.GeneratedMessage {
  factory PurchasePhoneNumberRequest({
    $core.Iterable<$core.String>? phoneNumbers,
    $core.String? sipDispatchRuleId,
  }) {
    final $result = create();
    if (phoneNumbers != null) {
      $result.phoneNumbers.addAll(phoneNumbers);
    }
    if (sipDispatchRuleId != null) {
      $result.sipDispatchRuleId = sipDispatchRuleId;
    }
    return $result;
  }
  PurchasePhoneNumberRequest._() : super();
  factory PurchasePhoneNumberRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PurchasePhoneNumberRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PurchasePhoneNumberRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'phoneNumbers')
    ..aOS(2, _omitFieldNames ? '' : 'sipDispatchRuleId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PurchasePhoneNumberRequest clone() => PurchasePhoneNumberRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PurchasePhoneNumberRequest copyWith(void Function(PurchasePhoneNumberRequest) updates) => super.copyWith((message) => updates(message as PurchasePhoneNumberRequest)) as PurchasePhoneNumberRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PurchasePhoneNumberRequest create() => PurchasePhoneNumberRequest._();
  PurchasePhoneNumberRequest createEmptyInstance() => create();
  static $pb.PbList<PurchasePhoneNumberRequest> createRepeated() => $pb.PbList<PurchasePhoneNumberRequest>();
  @$core.pragma('dart2js:noInline')
  static PurchasePhoneNumberRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PurchasePhoneNumberRequest>(create);
  static PurchasePhoneNumberRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get phoneNumbers => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get sipDispatchRuleId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sipDispatchRuleId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSipDispatchRuleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSipDispatchRuleId() => clearField(2);
}

/// PurchasePhoneNumberResponse - Response containing the purchased phone numbers
class PurchasePhoneNumberResponse extends $pb.GeneratedMessage {
  factory PurchasePhoneNumberResponse({
    $core.Iterable<PhoneNumber>? phoneNumbers,
  }) {
    final $result = create();
    if (phoneNumbers != null) {
      $result.phoneNumbers.addAll(phoneNumbers);
    }
    return $result;
  }
  PurchasePhoneNumberResponse._() : super();
  factory PurchasePhoneNumberResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PurchasePhoneNumberResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PurchasePhoneNumberResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<PhoneNumber>(1, _omitFieldNames ? '' : 'phoneNumbers', $pb.PbFieldType.PM, subBuilder: PhoneNumber.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PurchasePhoneNumberResponse clone() => PurchasePhoneNumberResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PurchasePhoneNumberResponse copyWith(void Function(PurchasePhoneNumberResponse) updates) => super.copyWith((message) => updates(message as PurchasePhoneNumberResponse)) as PurchasePhoneNumberResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PurchasePhoneNumberResponse create() => PurchasePhoneNumberResponse._();
  PurchasePhoneNumberResponse createEmptyInstance() => create();
  static $pb.PbList<PurchasePhoneNumberResponse> createRepeated() => $pb.PbList<PurchasePhoneNumberResponse>();
  @$core.pragma('dart2js:noInline')
  static PurchasePhoneNumberResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PurchasePhoneNumberResponse>(create);
  static PurchasePhoneNumberResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PhoneNumber> get phoneNumbers => $_getList(0);
}

/// ListPhoneNumbersRequest - Request to list phone numbers
class ListPhoneNumbersRequest extends $pb.GeneratedMessage {
  factory ListPhoneNumbersRequest({
    $core.int? limit,
    $core.Iterable<PhoneNumberStatus>? statuses,
    $2.TokenPagination? pageToken,
    $core.String? sipDispatchRuleId,
  }) {
    final $result = create();
    if (limit != null) {
      $result.limit = limit;
    }
    if (statuses != null) {
      $result.statuses.addAll(statuses);
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    if (sipDispatchRuleId != null) {
      $result.sipDispatchRuleId = sipDispatchRuleId;
    }
    return $result;
  }
  ListPhoneNumbersRequest._() : super();
  factory ListPhoneNumbersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPhoneNumbersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPhoneNumbersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..pc<PhoneNumberStatus>(2, _omitFieldNames ? '' : 'statuses', $pb.PbFieldType.KE, valueOf: PhoneNumberStatus.valueOf, enumValues: PhoneNumberStatus.values, defaultEnumValue: PhoneNumberStatus.PHONE_NUMBER_STATUS_UNSPECIFIED)
    ..aOM<$2.TokenPagination>(3, _omitFieldNames ? '' : 'pageToken', subBuilder: $2.TokenPagination.create)
    ..aOS(4, _omitFieldNames ? '' : 'sipDispatchRuleId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPhoneNumbersRequest clone() => ListPhoneNumbersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPhoneNumbersRequest copyWith(void Function(ListPhoneNumbersRequest) updates) => super.copyWith((message) => updates(message as ListPhoneNumbersRequest)) as ListPhoneNumbersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPhoneNumbersRequest create() => ListPhoneNumbersRequest._();
  ListPhoneNumbersRequest createEmptyInstance() => create();
  static $pb.PbList<ListPhoneNumbersRequest> createRepeated() => $pb.PbList<ListPhoneNumbersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListPhoneNumbersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPhoneNumbersRequest>(create);
  static ListPhoneNumbersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<PhoneNumberStatus> get statuses => $_getList(1);

  @$pb.TagNumber(3)
  $2.TokenPagination get pageToken => $_getN(2);
  @$pb.TagNumber(3)
  set pageToken($2.TokenPagination v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageToken() => clearField(3);
  @$pb.TagNumber(3)
  $2.TokenPagination ensurePageToken() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get sipDispatchRuleId => $_getSZ(3);
  @$pb.TagNumber(4)
  set sipDispatchRuleId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSipDispatchRuleId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSipDispatchRuleId() => clearField(4);
}

/// ListPhoneNumbersResponse - Response containing phone numbers
class ListPhoneNumbersResponse extends $pb.GeneratedMessage {
  factory ListPhoneNumbersResponse({
    $core.Iterable<PhoneNumber>? items,
    $2.TokenPagination? nextPageToken,
    $core.int? totalCount,
    $core.int? offlineCount,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    if (totalCount != null) {
      $result.totalCount = totalCount;
    }
    if (offlineCount != null) {
      $result.offlineCount = offlineCount;
    }
    return $result;
  }
  ListPhoneNumbersResponse._() : super();
  factory ListPhoneNumbersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPhoneNumbersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPhoneNumbersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pc<PhoneNumber>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: PhoneNumber.create)
    ..aOM<$2.TokenPagination>(2, _omitFieldNames ? '' : 'nextPageToken', subBuilder: $2.TokenPagination.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'offlineCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPhoneNumbersResponse clone() => ListPhoneNumbersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPhoneNumbersResponse copyWith(void Function(ListPhoneNumbersResponse) updates) => super.copyWith((message) => updates(message as ListPhoneNumbersResponse)) as ListPhoneNumbersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPhoneNumbersResponse create() => ListPhoneNumbersResponse._();
  ListPhoneNumbersResponse createEmptyInstance() => create();
  static $pb.PbList<ListPhoneNumbersResponse> createRepeated() => $pb.PbList<ListPhoneNumbersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPhoneNumbersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPhoneNumbersResponse>(create);
  static ListPhoneNumbersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PhoneNumber> get items => $_getList(0);

  @$pb.TagNumber(2)
  $2.TokenPagination get nextPageToken => $_getN(1);
  @$pb.TagNumber(2)
  set nextPageToken($2.TokenPagination v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => clearField(2);
  @$pb.TagNumber(2)
  $2.TokenPagination ensureNextPageToken() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get totalCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get offlineCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set offlineCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOfflineCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearOfflineCount() => clearField(4);
}

/// GetPhoneNumberRequest - Request to get a phone number
class GetPhoneNumberRequest extends $pb.GeneratedMessage {
  factory GetPhoneNumberRequest({
    $core.String? id,
    $core.String? phoneNumber,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    return $result;
  }
  GetPhoneNumberRequest._() : super();
  factory GetPhoneNumberRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPhoneNumberRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPhoneNumberRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'phoneNumber')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPhoneNumberRequest clone() => GetPhoneNumberRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPhoneNumberRequest copyWith(void Function(GetPhoneNumberRequest) updates) => super.copyWith((message) => updates(message as GetPhoneNumberRequest)) as GetPhoneNumberRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPhoneNumberRequest create() => GetPhoneNumberRequest._();
  GetPhoneNumberRequest createEmptyInstance() => create();
  static $pb.PbList<GetPhoneNumberRequest> createRepeated() => $pb.PbList<GetPhoneNumberRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPhoneNumberRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPhoneNumberRequest>(create);
  static GetPhoneNumberRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get phoneNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set phoneNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhoneNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhoneNumber() => clearField(2);
}

/// GetPhoneNumberResponse - Response containing the phone number
class GetPhoneNumberResponse extends $pb.GeneratedMessage {
  factory GetPhoneNumberResponse({
    PhoneNumber? phoneNumber,
  }) {
    final $result = create();
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    return $result;
  }
  GetPhoneNumberResponse._() : super();
  factory GetPhoneNumberResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPhoneNumberResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPhoneNumberResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<PhoneNumber>(1, _omitFieldNames ? '' : 'phoneNumber', subBuilder: PhoneNumber.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPhoneNumberResponse clone() => GetPhoneNumberResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPhoneNumberResponse copyWith(void Function(GetPhoneNumberResponse) updates) => super.copyWith((message) => updates(message as GetPhoneNumberResponse)) as GetPhoneNumberResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPhoneNumberResponse create() => GetPhoneNumberResponse._();
  GetPhoneNumberResponse createEmptyInstance() => create();
  static $pb.PbList<GetPhoneNumberResponse> createRepeated() => $pb.PbList<GetPhoneNumberResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPhoneNumberResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPhoneNumberResponse>(create);
  static GetPhoneNumberResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PhoneNumber get phoneNumber => $_getN(0);
  @$pb.TagNumber(1)
  set phoneNumber(PhoneNumber v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhoneNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhoneNumber() => clearField(1);
  @$pb.TagNumber(1)
  PhoneNumber ensurePhoneNumber() => $_ensure(0);
}

/// UpdatePhoneNumberRequest - Request to update a phone number
class UpdatePhoneNumberRequest extends $pb.GeneratedMessage {
  factory UpdatePhoneNumberRequest({
    $core.String? id,
    $core.String? phoneNumber,
    $core.String? sipDispatchRuleId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    if (sipDispatchRuleId != null) {
      $result.sipDispatchRuleId = sipDispatchRuleId;
    }
    return $result;
  }
  UpdatePhoneNumberRequest._() : super();
  factory UpdatePhoneNumberRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePhoneNumberRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePhoneNumberRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(3, _omitFieldNames ? '' : 'sipDispatchRuleId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePhoneNumberRequest clone() => UpdatePhoneNumberRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePhoneNumberRequest copyWith(void Function(UpdatePhoneNumberRequest) updates) => super.copyWith((message) => updates(message as UpdatePhoneNumberRequest)) as UpdatePhoneNumberRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePhoneNumberRequest create() => UpdatePhoneNumberRequest._();
  UpdatePhoneNumberRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePhoneNumberRequest> createRepeated() => $pb.PbList<UpdatePhoneNumberRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePhoneNumberRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePhoneNumberRequest>(create);
  static UpdatePhoneNumberRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get phoneNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set phoneNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhoneNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhoneNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sipDispatchRuleId => $_getSZ(2);
  @$pb.TagNumber(3)
  set sipDispatchRuleId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSipDispatchRuleId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSipDispatchRuleId() => clearField(3);
}

/// UpdatePhoneNumberResponse - Response containing the updated phone number
class UpdatePhoneNumberResponse extends $pb.GeneratedMessage {
  factory UpdatePhoneNumberResponse({
    PhoneNumber? phoneNumber,
  }) {
    final $result = create();
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    return $result;
  }
  UpdatePhoneNumberResponse._() : super();
  factory UpdatePhoneNumberResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePhoneNumberResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePhoneNumberResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOM<PhoneNumber>(1, _omitFieldNames ? '' : 'phoneNumber', subBuilder: PhoneNumber.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePhoneNumberResponse clone() => UpdatePhoneNumberResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePhoneNumberResponse copyWith(void Function(UpdatePhoneNumberResponse) updates) => super.copyWith((message) => updates(message as UpdatePhoneNumberResponse)) as UpdatePhoneNumberResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePhoneNumberResponse create() => UpdatePhoneNumberResponse._();
  UpdatePhoneNumberResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePhoneNumberResponse> createRepeated() => $pb.PbList<UpdatePhoneNumberResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePhoneNumberResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePhoneNumberResponse>(create);
  static UpdatePhoneNumberResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PhoneNumber get phoneNumber => $_getN(0);
  @$pb.TagNumber(1)
  set phoneNumber(PhoneNumber v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhoneNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhoneNumber() => clearField(1);
  @$pb.TagNumber(1)
  PhoneNumber ensurePhoneNumber() => $_ensure(0);
}

/// ReleasePhoneNumbersRequest - Request to release phone numbers
class ReleasePhoneNumbersRequest extends $pb.GeneratedMessage {
  factory ReleasePhoneNumbersRequest({
    $core.Iterable<$core.String>? ids,
    $core.Iterable<$core.String>? phoneNumbers,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    if (phoneNumbers != null) {
      $result.phoneNumbers.addAll(phoneNumbers);
    }
    return $result;
  }
  ReleasePhoneNumbersRequest._() : super();
  factory ReleasePhoneNumbersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReleasePhoneNumbersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReleasePhoneNumbersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..pPS(2, _omitFieldNames ? '' : 'phoneNumbers')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReleasePhoneNumbersRequest clone() => ReleasePhoneNumbersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReleasePhoneNumbersRequest copyWith(void Function(ReleasePhoneNumbersRequest) updates) => super.copyWith((message) => updates(message as ReleasePhoneNumbersRequest)) as ReleasePhoneNumbersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReleasePhoneNumbersRequest create() => ReleasePhoneNumbersRequest._();
  ReleasePhoneNumbersRequest createEmptyInstance() => create();
  static $pb.PbList<ReleasePhoneNumbersRequest> createRepeated() => $pb.PbList<ReleasePhoneNumbersRequest>();
  @$core.pragma('dart2js:noInline')
  static ReleasePhoneNumbersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReleasePhoneNumbersRequest>(create);
  static ReleasePhoneNumbersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get phoneNumbers => $_getList(1);
}

/// ReleasePhoneNumbersResponse - Response for releasing phone numbers
class ReleasePhoneNumbersResponse extends $pb.GeneratedMessage {
  factory ReleasePhoneNumbersResponse() => create();
  ReleasePhoneNumbersResponse._() : super();
  factory ReleasePhoneNumbersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReleasePhoneNumbersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReleasePhoneNumbersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReleasePhoneNumbersResponse clone() => ReleasePhoneNumbersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReleasePhoneNumbersResponse copyWith(void Function(ReleasePhoneNumbersResponse) updates) => super.copyWith((message) => updates(message as ReleasePhoneNumbersResponse)) as ReleasePhoneNumbersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReleasePhoneNumbersResponse create() => ReleasePhoneNumbersResponse._();
  ReleasePhoneNumbersResponse createEmptyInstance() => create();
  static $pb.PbList<ReleasePhoneNumbersResponse> createRepeated() => $pb.PbList<ReleasePhoneNumbersResponse>();
  @$core.pragma('dart2js:noInline')
  static ReleasePhoneNumbersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReleasePhoneNumbersResponse>(create);
  static ReleasePhoneNumbersResponse? _defaultInstance;
}

/// PhoneNumber - Unified phone number type for inventory and purchased numbers
class PhoneNumber extends $pb.GeneratedMessage {
  factory PhoneNumber({
    $core.String? id,
    $core.String? e164Format,
    $core.String? countryCode,
    $core.String? areaCode,
    PhoneNumberType? numberType,
    $core.String? locality,
    $core.String? region,
    $core.double? spamScore,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
    $core.Iterable<$core.String>? capabilities,
    PhoneNumberStatus? status,
    $0.Timestamp? assignedAt,
    $0.Timestamp? releasedAt,
  @$core.Deprecated('This field is deprecated.')
    $core.String? sipDispatchRuleId,
    $core.Iterable<$core.String>? sipDispatchRuleIds,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (e164Format != null) {
      $result.e164Format = e164Format;
    }
    if (countryCode != null) {
      $result.countryCode = countryCode;
    }
    if (areaCode != null) {
      $result.areaCode = areaCode;
    }
    if (numberType != null) {
      $result.numberType = numberType;
    }
    if (locality != null) {
      $result.locality = locality;
    }
    if (region != null) {
      $result.region = region;
    }
    if (spamScore != null) {
      $result.spamScore = spamScore;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (capabilities != null) {
      $result.capabilities.addAll(capabilities);
    }
    if (status != null) {
      $result.status = status;
    }
    if (assignedAt != null) {
      $result.assignedAt = assignedAt;
    }
    if (releasedAt != null) {
      $result.releasedAt = releasedAt;
    }
    if (sipDispatchRuleId != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.sipDispatchRuleId = sipDispatchRuleId;
    }
    if (sipDispatchRuleIds != null) {
      $result.sipDispatchRuleIds.addAll(sipDispatchRuleIds);
    }
    return $result;
  }
  PhoneNumber._() : super();
  factory PhoneNumber.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PhoneNumber.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PhoneNumber', package: const $pb.PackageName(_omitMessageNames ? '' : 'livekit'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'e164Format')
    ..aOS(3, _omitFieldNames ? '' : 'countryCode')
    ..aOS(4, _omitFieldNames ? '' : 'areaCode')
    ..e<PhoneNumberType>(5, _omitFieldNames ? '' : 'numberType', $pb.PbFieldType.OE, defaultOrMaker: PhoneNumberType.PHONE_NUMBER_TYPE_UNKNOWN, valueOf: PhoneNumberType.valueOf, enumValues: PhoneNumberType.values)
    ..aOS(6, _omitFieldNames ? '' : 'locality')
    ..aOS(7, _omitFieldNames ? '' : 'region')
    ..a<$core.double>(8, _omitFieldNames ? '' : 'spamScore', $pb.PbFieldType.OD)
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(10, _omitFieldNames ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..pPS(11, _omitFieldNames ? '' : 'capabilities')
    ..e<PhoneNumberStatus>(12, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: PhoneNumberStatus.PHONE_NUMBER_STATUS_UNSPECIFIED, valueOf: PhoneNumberStatus.valueOf, enumValues: PhoneNumberStatus.values)
    ..aOM<$0.Timestamp>(13, _omitFieldNames ? '' : 'assignedAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(14, _omitFieldNames ? '' : 'releasedAt', subBuilder: $0.Timestamp.create)
    ..aOS(15, _omitFieldNames ? '' : 'sipDispatchRuleId')
    ..pPS(16, _omitFieldNames ? '' : 'sipDispatchRuleIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PhoneNumber clone() => PhoneNumber()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PhoneNumber copyWith(void Function(PhoneNumber) updates) => super.copyWith((message) => updates(message as PhoneNumber)) as PhoneNumber;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhoneNumber create() => PhoneNumber._();
  PhoneNumber createEmptyInstance() => create();
  static $pb.PbList<PhoneNumber> createRepeated() => $pb.PbList<PhoneNumber>();
  @$core.pragma('dart2js:noInline')
  static PhoneNumber getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhoneNumber>(create);
  static PhoneNumber? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get e164Format => $_getSZ(1);
  @$pb.TagNumber(2)
  set e164Format($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasE164Format() => $_has(1);
  @$pb.TagNumber(2)
  void clearE164Format() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get countryCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set countryCode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCountryCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCountryCode() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get areaCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set areaCode($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAreaCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearAreaCode() => clearField(4);

  @$pb.TagNumber(5)
  PhoneNumberType get numberType => $_getN(4);
  @$pb.TagNumber(5)
  set numberType(PhoneNumberType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasNumberType() => $_has(4);
  @$pb.TagNumber(5)
  void clearNumberType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get locality => $_getSZ(5);
  @$pb.TagNumber(6)
  set locality($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLocality() => $_has(5);
  @$pb.TagNumber(6)
  void clearLocality() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get region => $_getSZ(6);
  @$pb.TagNumber(7)
  set region($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRegion() => $_has(6);
  @$pb.TagNumber(7)
  void clearRegion() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get spamScore => $_getN(7);
  @$pb.TagNumber(8)
  set spamScore($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSpamScore() => $_has(7);
  @$pb.TagNumber(8)
  void clearSpamScore() => clearField(8);

  @$pb.TagNumber(9)
  $0.Timestamp get createdAt => $_getN(8);
  @$pb.TagNumber(9)
  set createdAt($0.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedAt() => clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureCreatedAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $0.Timestamp get updatedAt => $_getN(9);
  @$pb.TagNumber(10)
  set updatedAt($0.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasUpdatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdatedAt() => clearField(10);
  @$pb.TagNumber(10)
  $0.Timestamp ensureUpdatedAt() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.List<$core.String> get capabilities => $_getList(10);

  @$pb.TagNumber(12)
  PhoneNumberStatus get status => $_getN(11);
  @$pb.TagNumber(12)
  set status(PhoneNumberStatus v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasStatus() => $_has(11);
  @$pb.TagNumber(12)
  void clearStatus() => clearField(12);

  @$pb.TagNumber(13)
  $0.Timestamp get assignedAt => $_getN(12);
  @$pb.TagNumber(13)
  set assignedAt($0.Timestamp v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasAssignedAt() => $_has(12);
  @$pb.TagNumber(13)
  void clearAssignedAt() => clearField(13);
  @$pb.TagNumber(13)
  $0.Timestamp ensureAssignedAt() => $_ensure(12);

  @$pb.TagNumber(14)
  $0.Timestamp get releasedAt => $_getN(13);
  @$pb.TagNumber(14)
  set releasedAt($0.Timestamp v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasReleasedAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearReleasedAt() => clearField(14);
  @$pb.TagNumber(14)
  $0.Timestamp ensureReleasedAt() => $_ensure(13);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(15)
  $core.String get sipDispatchRuleId => $_getSZ(14);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(15)
  set sipDispatchRuleId($core.String v) { $_setString(14, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(15)
  $core.bool hasSipDispatchRuleId() => $_has(14);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(15)
  void clearSipDispatchRuleId() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<$core.String> get sipDispatchRuleIds => $_getList(15);
}

class PhoneNumberServiceApi {
  $pb.RpcClient _client;
  PhoneNumberServiceApi(this._client);

  $async.Future<SearchPhoneNumbersResponse> searchPhoneNumbers($pb.ClientContext? ctx, SearchPhoneNumbersRequest request) =>
    _client.invoke<SearchPhoneNumbersResponse>(ctx, 'PhoneNumberService', 'SearchPhoneNumbers', request, SearchPhoneNumbersResponse())
  ;
  $async.Future<PurchasePhoneNumberResponse> purchasePhoneNumber($pb.ClientContext? ctx, PurchasePhoneNumberRequest request) =>
    _client.invoke<PurchasePhoneNumberResponse>(ctx, 'PhoneNumberService', 'PurchasePhoneNumber', request, PurchasePhoneNumberResponse())
  ;
  $async.Future<ListPhoneNumbersResponse> listPhoneNumbers($pb.ClientContext? ctx, ListPhoneNumbersRequest request) =>
    _client.invoke<ListPhoneNumbersResponse>(ctx, 'PhoneNumberService', 'ListPhoneNumbers', request, ListPhoneNumbersResponse())
  ;
  $async.Future<GetPhoneNumberResponse> getPhoneNumber($pb.ClientContext? ctx, GetPhoneNumberRequest request) =>
    _client.invoke<GetPhoneNumberResponse>(ctx, 'PhoneNumberService', 'GetPhoneNumber', request, GetPhoneNumberResponse())
  ;
  $async.Future<UpdatePhoneNumberResponse> updatePhoneNumber($pb.ClientContext? ctx, UpdatePhoneNumberRequest request) =>
    _client.invoke<UpdatePhoneNumberResponse>(ctx, 'PhoneNumberService', 'UpdatePhoneNumber', request, UpdatePhoneNumberResponse())
  ;
  $async.Future<ReleasePhoneNumbersResponse> releasePhoneNumbers($pb.ClientContext? ctx, ReleasePhoneNumbersRequest request) =>
    _client.invoke<ReleasePhoneNumbersResponse>(ctx, 'PhoneNumberService', 'ReleasePhoneNumbers', request, ReleasePhoneNumbersResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
