// This is a generated file - do not edit.
//
// Generated from livekit_analytics.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StreamType extends $pb.ProtobufEnum {
  static const StreamType UPSTREAM =
      StreamType._(0, _omitEnumNames ? '' : 'UPSTREAM');
  static const StreamType DOWNSTREAM =
      StreamType._(1, _omitEnumNames ? '' : 'DOWNSTREAM');

  static const $core.List<StreamType> values = <StreamType>[
    UPSTREAM,
    DOWNSTREAM,
  ];

  static final $core.List<StreamType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static StreamType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StreamType._(super.value, super.name);
}

class AnalyticsEventType extends $pb.ProtobufEnum {
  static const AnalyticsEventType ROOM_CREATED =
      AnalyticsEventType._(0, _omitEnumNames ? '' : 'ROOM_CREATED');
  static const AnalyticsEventType ROOM_ENDED =
      AnalyticsEventType._(1, _omitEnumNames ? '' : 'ROOM_ENDED');
  static const AnalyticsEventType PARTICIPANT_JOINED =
      AnalyticsEventType._(2, _omitEnumNames ? '' : 'PARTICIPANT_JOINED');
  static const AnalyticsEventType PARTICIPANT_LEFT =
      AnalyticsEventType._(3, _omitEnumNames ? '' : 'PARTICIPANT_LEFT');
  static const AnalyticsEventType PARTICIPANT_CONNECTION_ABORTED =
      AnalyticsEventType._(
          45, _omitEnumNames ? '' : 'PARTICIPANT_CONNECTION_ABORTED');
  static const AnalyticsEventType TRACK_PUBLISHED =
      AnalyticsEventType._(4, _omitEnumNames ? '' : 'TRACK_PUBLISHED');
  static const AnalyticsEventType TRACK_PUBLISH_REQUESTED =
      AnalyticsEventType._(20, _omitEnumNames ? '' : 'TRACK_PUBLISH_REQUESTED');
  static const AnalyticsEventType TRACK_UNPUBLISHED =
      AnalyticsEventType._(5, _omitEnumNames ? '' : 'TRACK_UNPUBLISHED');
  static const AnalyticsEventType TRACK_SUBSCRIBED =
      AnalyticsEventType._(6, _omitEnumNames ? '' : 'TRACK_SUBSCRIBED');
  static const AnalyticsEventType TRACK_SUBSCRIBE_REQUESTED =
      AnalyticsEventType._(
          21, _omitEnumNames ? '' : 'TRACK_SUBSCRIBE_REQUESTED');
  static const AnalyticsEventType TRACK_SUBSCRIBE_FAILED =
      AnalyticsEventType._(25, _omitEnumNames ? '' : 'TRACK_SUBSCRIBE_FAILED');
  static const AnalyticsEventType TRACK_UNSUBSCRIBED =
      AnalyticsEventType._(7, _omitEnumNames ? '' : 'TRACK_UNSUBSCRIBED');
  static const AnalyticsEventType TRACK_PUBLISHED_UPDATE =
      AnalyticsEventType._(10, _omitEnumNames ? '' : 'TRACK_PUBLISHED_UPDATE');
  static const AnalyticsEventType TRACK_MUTED =
      AnalyticsEventType._(23, _omitEnumNames ? '' : 'TRACK_MUTED');
  static const AnalyticsEventType TRACK_UNMUTED =
      AnalyticsEventType._(24, _omitEnumNames ? '' : 'TRACK_UNMUTED');
  static const AnalyticsEventType TRACK_PUBLISH_STATS =
      AnalyticsEventType._(26, _omitEnumNames ? '' : 'TRACK_PUBLISH_STATS');
  static const AnalyticsEventType TRACK_SUBSCRIBE_STATS =
      AnalyticsEventType._(27, _omitEnumNames ? '' : 'TRACK_SUBSCRIBE_STATS');
  static const AnalyticsEventType PARTICIPANT_ACTIVE =
      AnalyticsEventType._(11, _omitEnumNames ? '' : 'PARTICIPANT_ACTIVE');
  static const AnalyticsEventType PARTICIPANT_RESUMED =
      AnalyticsEventType._(22, _omitEnumNames ? '' : 'PARTICIPANT_RESUMED');
  static const AnalyticsEventType EGRESS_STARTED =
      AnalyticsEventType._(12, _omitEnumNames ? '' : 'EGRESS_STARTED');
  static const AnalyticsEventType EGRESS_ENDED =
      AnalyticsEventType._(13, _omitEnumNames ? '' : 'EGRESS_ENDED');
  static const AnalyticsEventType EGRESS_UPDATED =
      AnalyticsEventType._(28, _omitEnumNames ? '' : 'EGRESS_UPDATED');
  static const AnalyticsEventType TRACK_MAX_SUBSCRIBED_VIDEO_QUALITY =
      AnalyticsEventType._(
          14, _omitEnumNames ? '' : 'TRACK_MAX_SUBSCRIBED_VIDEO_QUALITY');
  static const AnalyticsEventType RECONNECTED =
      AnalyticsEventType._(15, _omitEnumNames ? '' : 'RECONNECTED');
  static const AnalyticsEventType INGRESS_CREATED =
      AnalyticsEventType._(18, _omitEnumNames ? '' : 'INGRESS_CREATED');
  static const AnalyticsEventType INGRESS_DELETED =
      AnalyticsEventType._(19, _omitEnumNames ? '' : 'INGRESS_DELETED');
  static const AnalyticsEventType INGRESS_STARTED =
      AnalyticsEventType._(16, _omitEnumNames ? '' : 'INGRESS_STARTED');
  static const AnalyticsEventType INGRESS_ENDED =
      AnalyticsEventType._(17, _omitEnumNames ? '' : 'INGRESS_ENDED');
  static const AnalyticsEventType INGRESS_UPDATED =
      AnalyticsEventType._(29, _omitEnumNames ? '' : 'INGRESS_UPDATED');
  static const AnalyticsEventType SIP_INBOUND_TRUNK_CREATED =
      AnalyticsEventType._(
          30, _omitEnumNames ? '' : 'SIP_INBOUND_TRUNK_CREATED');
  static const AnalyticsEventType SIP_INBOUND_TRUNK_DELETED =
      AnalyticsEventType._(
          31, _omitEnumNames ? '' : 'SIP_INBOUND_TRUNK_DELETED');
  static const AnalyticsEventType SIP_OUTBOUND_TRUNK_CREATED =
      AnalyticsEventType._(
          32, _omitEnumNames ? '' : 'SIP_OUTBOUND_TRUNK_CREATED');
  static const AnalyticsEventType SIP_OUTBOUND_TRUNK_DELETED =
      AnalyticsEventType._(
          33, _omitEnumNames ? '' : 'SIP_OUTBOUND_TRUNK_DELETED');
  static const AnalyticsEventType SIP_DISPATCH_RULE_CREATED =
      AnalyticsEventType._(
          34, _omitEnumNames ? '' : 'SIP_DISPATCH_RULE_CREATED');
  static const AnalyticsEventType SIP_DISPATCH_RULE_DELETED =
      AnalyticsEventType._(
          35, _omitEnumNames ? '' : 'SIP_DISPATCH_RULE_DELETED');
  static const AnalyticsEventType SIP_PARTICIPANT_CREATED =
      AnalyticsEventType._(36, _omitEnumNames ? '' : 'SIP_PARTICIPANT_CREATED');
  static const AnalyticsEventType SIP_CALL_INCOMING =
      AnalyticsEventType._(37, _omitEnumNames ? '' : 'SIP_CALL_INCOMING');
  static const AnalyticsEventType SIP_CALL_STARTED =
      AnalyticsEventType._(38, _omitEnumNames ? '' : 'SIP_CALL_STARTED');
  static const AnalyticsEventType SIP_CALL_ENDED =
      AnalyticsEventType._(39, _omitEnumNames ? '' : 'SIP_CALL_ENDED');
  static const AnalyticsEventType SIP_TRANSFER_REQUESTED =
      AnalyticsEventType._(43, _omitEnumNames ? '' : 'SIP_TRANSFER_REQUESTED');
  static const AnalyticsEventType SIP_TRANSFER_COMPLETE =
      AnalyticsEventType._(44, _omitEnumNames ? '' : 'SIP_TRANSFER_COMPLETE');
  static const AnalyticsEventType SIP_CALL_UPDATE =
      AnalyticsEventType._(46, _omitEnumNames ? '' : 'SIP_CALL_UPDATE');
  static const AnalyticsEventType REPORT =
      AnalyticsEventType._(40, _omitEnumNames ? '' : 'REPORT');
  static const AnalyticsEventType API_CALL =
      AnalyticsEventType._(41, _omitEnumNames ? '' : 'API_CALL');
  static const AnalyticsEventType WEBHOOK =
      AnalyticsEventType._(42, _omitEnumNames ? '' : 'WEBHOOK');

  static const $core.List<AnalyticsEventType> values = <AnalyticsEventType>[
    ROOM_CREATED,
    ROOM_ENDED,
    PARTICIPANT_JOINED,
    PARTICIPANT_LEFT,
    PARTICIPANT_CONNECTION_ABORTED,
    TRACK_PUBLISHED,
    TRACK_PUBLISH_REQUESTED,
    TRACK_UNPUBLISHED,
    TRACK_SUBSCRIBED,
    TRACK_SUBSCRIBE_REQUESTED,
    TRACK_SUBSCRIBE_FAILED,
    TRACK_UNSUBSCRIBED,
    TRACK_PUBLISHED_UPDATE,
    TRACK_MUTED,
    TRACK_UNMUTED,
    TRACK_PUBLISH_STATS,
    TRACK_SUBSCRIBE_STATS,
    PARTICIPANT_ACTIVE,
    PARTICIPANT_RESUMED,
    EGRESS_STARTED,
    EGRESS_ENDED,
    EGRESS_UPDATED,
    TRACK_MAX_SUBSCRIBED_VIDEO_QUALITY,
    RECONNECTED,
    INGRESS_CREATED,
    INGRESS_DELETED,
    INGRESS_STARTED,
    INGRESS_ENDED,
    INGRESS_UPDATED,
    SIP_INBOUND_TRUNK_CREATED,
    SIP_INBOUND_TRUNK_DELETED,
    SIP_OUTBOUND_TRUNK_CREATED,
    SIP_OUTBOUND_TRUNK_DELETED,
    SIP_DISPATCH_RULE_CREATED,
    SIP_DISPATCH_RULE_DELETED,
    SIP_PARTICIPANT_CREATED,
    SIP_CALL_INCOMING,
    SIP_CALL_STARTED,
    SIP_CALL_ENDED,
    SIP_TRANSFER_REQUESTED,
    SIP_TRANSFER_COMPLETE,
    SIP_CALL_UPDATE,
    REPORT,
    API_CALL,
    WEBHOOK,
  ];

  static final $core.List<AnalyticsEventType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 46);
  static AnalyticsEventType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AnalyticsEventType._(super.value, super.name);
}

class FeatureUsageInfo_Feature extends $pb.ProtobufEnum {
  static const FeatureUsageInfo_Feature KRISP_NOISE_CANCELLATION =
      FeatureUsageInfo_Feature._(
          0, _omitEnumNames ? '' : 'KRISP_NOISE_CANCELLATION');
  static const FeatureUsageInfo_Feature KRISP_BACKGROUND_VOICE_CANCELLATION =
      FeatureUsageInfo_Feature._(
          1, _omitEnumNames ? '' : 'KRISP_BACKGROUND_VOICE_CANCELLATION');
  static const FeatureUsageInfo_Feature AIC_AUDIO_ENHANCEMENT =
      FeatureUsageInfo_Feature._(
          2, _omitEnumNames ? '' : 'AIC_AUDIO_ENHANCEMENT');

  static const $core.List<FeatureUsageInfo_Feature> values =
      <FeatureUsageInfo_Feature>[
    KRISP_NOISE_CANCELLATION,
    KRISP_BACKGROUND_VOICE_CANCELLATION,
    AIC_AUDIO_ENHANCEMENT,
  ];

  static final $core.List<FeatureUsageInfo_Feature?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static FeatureUsageInfo_Feature? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FeatureUsageInfo_Feature._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
