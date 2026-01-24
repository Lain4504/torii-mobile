//
//  Generated code. Do not modify.
//  source: livekit_analytics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use streamTypeDescriptor instead')
const StreamType$json = {
  '1': 'StreamType',
  '2': [
    {'1': 'UPSTREAM', '2': 0},
    {'1': 'DOWNSTREAM', '2': 1},
  ],
};

/// Descriptor for `StreamType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List streamTypeDescriptor = $convert.base64Decode(
    'CgpTdHJlYW1UeXBlEgwKCFVQU1RSRUFNEAASDgoKRE9XTlNUUkVBTRAB');

@$core.Deprecated('Use analyticsEventTypeDescriptor instead')
const AnalyticsEventType$json = {
  '1': 'AnalyticsEventType',
  '2': [
    {'1': 'ROOM_CREATED', '2': 0},
    {'1': 'ROOM_ENDED', '2': 1},
    {'1': 'PARTICIPANT_JOINED', '2': 2},
    {'1': 'PARTICIPANT_LEFT', '2': 3},
    {'1': 'PARTICIPANT_CONNECTION_ABORTED', '2': 45},
    {'1': 'TRACK_PUBLISHED', '2': 4},
    {'1': 'TRACK_PUBLISH_REQUESTED', '2': 20},
    {'1': 'TRACK_UNPUBLISHED', '2': 5},
    {'1': 'TRACK_SUBSCRIBED', '2': 6},
    {'1': 'TRACK_SUBSCRIBE_REQUESTED', '2': 21},
    {'1': 'TRACK_SUBSCRIBE_FAILED', '2': 25},
    {'1': 'TRACK_UNSUBSCRIBED', '2': 7},
    {'1': 'TRACK_PUBLISHED_UPDATE', '2': 10},
    {'1': 'TRACK_MUTED', '2': 23},
    {'1': 'TRACK_UNMUTED', '2': 24},
    {'1': 'TRACK_PUBLISH_STATS', '2': 26},
    {'1': 'TRACK_SUBSCRIBE_STATS', '2': 27},
    {'1': 'PARTICIPANT_ACTIVE', '2': 11},
    {'1': 'PARTICIPANT_RESUMED', '2': 22},
    {'1': 'EGRESS_STARTED', '2': 12},
    {'1': 'EGRESS_ENDED', '2': 13},
    {'1': 'EGRESS_UPDATED', '2': 28},
    {'1': 'TRACK_MAX_SUBSCRIBED_VIDEO_QUALITY', '2': 14},
    {'1': 'RECONNECTED', '2': 15},
    {'1': 'INGRESS_CREATED', '2': 18},
    {'1': 'INGRESS_DELETED', '2': 19},
    {'1': 'INGRESS_STARTED', '2': 16},
    {'1': 'INGRESS_ENDED', '2': 17},
    {'1': 'INGRESS_UPDATED', '2': 29},
    {'1': 'SIP_INBOUND_TRUNK_CREATED', '2': 30},
    {'1': 'SIP_INBOUND_TRUNK_DELETED', '2': 31},
    {'1': 'SIP_OUTBOUND_TRUNK_CREATED', '2': 32},
    {'1': 'SIP_OUTBOUND_TRUNK_DELETED', '2': 33},
    {'1': 'SIP_DISPATCH_RULE_CREATED', '2': 34},
    {'1': 'SIP_DISPATCH_RULE_DELETED', '2': 35},
    {'1': 'SIP_PARTICIPANT_CREATED', '2': 36},
    {'1': 'SIP_CALL_INCOMING', '2': 37},
    {'1': 'SIP_CALL_STARTED', '2': 38},
    {'1': 'SIP_CALL_ENDED', '2': 39},
    {'1': 'SIP_TRANSFER_REQUESTED', '2': 43},
    {'1': 'SIP_TRANSFER_COMPLETE', '2': 44},
    {'1': 'SIP_CALL_UPDATE', '2': 46},
    {'1': 'REPORT', '2': 40},
    {'1': 'API_CALL', '2': 41},
    {'1': 'WEBHOOK', '2': 42},
  ],
};

/// Descriptor for `AnalyticsEventType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List analyticsEventTypeDescriptor = $convert.base64Decode(
    'ChJBbmFseXRpY3NFdmVudFR5cGUSEAoMUk9PTV9DUkVBVEVEEAASDgoKUk9PTV9FTkRFRBABEh'
    'YKElBBUlRJQ0lQQU5UX0pPSU5FRBACEhQKEFBBUlRJQ0lQQU5UX0xFRlQQAxIiCh5QQVJUSUNJ'
    'UEFOVF9DT05ORUNUSU9OX0FCT1JURUQQLRITCg9UUkFDS19QVUJMSVNIRUQQBBIbChdUUkFDS1'
    '9QVUJMSVNIX1JFUVVFU1RFRBAUEhUKEVRSQUNLX1VOUFVCTElTSEVEEAUSFAoQVFJBQ0tfU1VC'
    'U0NSSUJFRBAGEh0KGVRSQUNLX1NVQlNDUklCRV9SRVFVRVNURUQQFRIaChZUUkFDS19TVUJTQ1'
    'JJQkVfRkFJTEVEEBkSFgoSVFJBQ0tfVU5TVUJTQ1JJQkVEEAcSGgoWVFJBQ0tfUFVCTElTSEVE'
    'X1VQREFURRAKEg8KC1RSQUNLX01VVEVEEBcSEQoNVFJBQ0tfVU5NVVRFRBAYEhcKE1RSQUNLX1'
    'BVQkxJU0hfU1RBVFMQGhIZChVUUkFDS19TVUJTQ1JJQkVfU1RBVFMQGxIWChJQQVJUSUNJUEFO'
    'VF9BQ1RJVkUQCxIXChNQQVJUSUNJUEFOVF9SRVNVTUVEEBYSEgoORUdSRVNTX1NUQVJURUQQDB'
    'IQCgxFR1JFU1NfRU5ERUQQDRISCg5FR1JFU1NfVVBEQVRFRBAcEiYKIlRSQUNLX01BWF9TVUJT'
    'Q1JJQkVEX1ZJREVPX1FVQUxJVFkQDhIPCgtSRUNPTk5FQ1RFRBAPEhMKD0lOR1JFU1NfQ1JFQV'
    'RFRBASEhMKD0lOR1JFU1NfREVMRVRFRBATEhMKD0lOR1JFU1NfU1RBUlRFRBAQEhEKDUlOR1JF'
    'U1NfRU5ERUQQERITCg9JTkdSRVNTX1VQREFURUQQHRIdChlTSVBfSU5CT1VORF9UUlVOS19DUk'
    'VBVEVEEB4SHQoZU0lQX0lOQk9VTkRfVFJVTktfREVMRVRFRBAfEh4KGlNJUF9PVVRCT1VORF9U'
    'UlVOS19DUkVBVEVEECASHgoaU0lQX09VVEJPVU5EX1RSVU5LX0RFTEVURUQQIRIdChlTSVBfRE'
    'lTUEFUQ0hfUlVMRV9DUkVBVEVEECISHQoZU0lQX0RJU1BBVENIX1JVTEVfREVMRVRFRBAjEhsK'
    'F1NJUF9QQVJUSUNJUEFOVF9DUkVBVEVEECQSFQoRU0lQX0NBTExfSU5DT01JTkcQJRIUChBTSV'
    'BfQ0FMTF9TVEFSVEVEECYSEgoOU0lQX0NBTExfRU5ERUQQJxIaChZTSVBfVFJBTlNGRVJfUkVR'
    'VUVTVEVEECsSGQoVU0lQX1RSQU5TRkVSX0NPTVBMRVRFECwSEwoPU0lQX0NBTExfVVBEQVRFEC'
    '4SCgoGUkVQT1JUECgSDAoIQVBJX0NBTEwQKRILCgdXRUJIT09LECo=');

@$core.Deprecated('Use analyticsVideoLayerDescriptor instead')
const AnalyticsVideoLayer$json = {
  '1': 'AnalyticsVideoLayer',
  '2': [
    {'1': 'layer', '3': 1, '4': 1, '5': 5, '10': 'layer'},
    {'1': 'packets', '3': 2, '4': 1, '5': 13, '10': 'packets'},
    {'1': 'bytes', '3': 3, '4': 1, '5': 4, '10': 'bytes'},
    {'1': 'frames', '3': 4, '4': 1, '5': 13, '10': 'frames'},
  ],
};

/// Descriptor for `AnalyticsVideoLayer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsVideoLayerDescriptor = $convert.base64Decode(
    'ChNBbmFseXRpY3NWaWRlb0xheWVyEhQKBWxheWVyGAEgASgFUgVsYXllchIYCgdwYWNrZXRzGA'
    'IgASgNUgdwYWNrZXRzEhQKBWJ5dGVzGAMgASgEUgVieXRlcxIWCgZmcmFtZXMYBCABKA1SBmZy'
    'YW1lcw==');

@$core.Deprecated('Use analyticsStreamDescriptor instead')
const AnalyticsStream$json = {
  '1': 'AnalyticsStream',
  '2': [
    {'1': 'ssrc', '3': 1, '4': 1, '5': 13, '10': 'ssrc'},
    {'1': 'primary_packets', '3': 2, '4': 1, '5': 13, '10': 'primaryPackets'},
    {'1': 'primary_bytes', '3': 3, '4': 1, '5': 4, '10': 'primaryBytes'},
    {'1': 'retransmit_packets', '3': 4, '4': 1, '5': 13, '10': 'retransmitPackets'},
    {'1': 'retransmit_bytes', '3': 5, '4': 1, '5': 4, '10': 'retransmitBytes'},
    {'1': 'padding_packets', '3': 6, '4': 1, '5': 13, '10': 'paddingPackets'},
    {'1': 'padding_bytes', '3': 7, '4': 1, '5': 4, '10': 'paddingBytes'},
    {'1': 'packets_lost', '3': 8, '4': 1, '5': 13, '10': 'packetsLost'},
    {'1': 'frames', '3': 9, '4': 1, '5': 13, '10': 'frames'},
    {'1': 'rtt', '3': 10, '4': 1, '5': 13, '10': 'rtt'},
    {'1': 'jitter', '3': 11, '4': 1, '5': 13, '10': 'jitter'},
    {'1': 'nacks', '3': 12, '4': 1, '5': 13, '10': 'nacks'},
    {'1': 'plis', '3': 13, '4': 1, '5': 13, '10': 'plis'},
    {'1': 'firs', '3': 14, '4': 1, '5': 13, '10': 'firs'},
    {'1': 'video_layers', '3': 15, '4': 3, '5': 11, '6': '.livekit.AnalyticsVideoLayer', '10': 'videoLayers'},
    {'1': 'start_time', '3': 17, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    {'1': 'end_time', '3': 18, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
    {'1': 'packets_out_of_order', '3': 19, '4': 1, '5': 13, '10': 'packetsOutOfOrder'},
  ],
};

/// Descriptor for `AnalyticsStream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsStreamDescriptor = $convert.base64Decode(
    'Cg9BbmFseXRpY3NTdHJlYW0SEgoEc3NyYxgBIAEoDVIEc3NyYxInCg9wcmltYXJ5X3BhY2tldH'
    'MYAiABKA1SDnByaW1hcnlQYWNrZXRzEiMKDXByaW1hcnlfYnl0ZXMYAyABKARSDHByaW1hcnlC'
    'eXRlcxItChJyZXRyYW5zbWl0X3BhY2tldHMYBCABKA1SEXJldHJhbnNtaXRQYWNrZXRzEikKEH'
    'JldHJhbnNtaXRfYnl0ZXMYBSABKARSD3JldHJhbnNtaXRCeXRlcxInCg9wYWRkaW5nX3BhY2tl'
    'dHMYBiABKA1SDnBhZGRpbmdQYWNrZXRzEiMKDXBhZGRpbmdfYnl0ZXMYByABKARSDHBhZGRpbm'
    'dCeXRlcxIhCgxwYWNrZXRzX2xvc3QYCCABKA1SC3BhY2tldHNMb3N0EhYKBmZyYW1lcxgJIAEo'
    'DVIGZnJhbWVzEhAKA3J0dBgKIAEoDVIDcnR0EhYKBmppdHRlchgLIAEoDVIGaml0dGVyEhQKBW'
    '5hY2tzGAwgASgNUgVuYWNrcxISCgRwbGlzGA0gASgNUgRwbGlzEhIKBGZpcnMYDiABKA1SBGZp'
    'cnMSPwoMdmlkZW9fbGF5ZXJzGA8gAygLMhwubGl2ZWtpdC5BbmFseXRpY3NWaWRlb0xheWVyUg'
    't2aWRlb0xheWVycxI5CgpzdGFydF90aW1lGBEgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVz'
    'dGFtcFIJc3RhcnRUaW1lEjUKCGVuZF90aW1lGBIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbW'
    'VzdGFtcFIHZW5kVGltZRIvChRwYWNrZXRzX291dF9vZl9vcmRlchgTIAEoDVIRcGFja2V0c091'
    'dE9mT3JkZXI=');

@$core.Deprecated('Use analyticsStatDescriptor instead')
const AnalyticsStat$json = {
  '1': 'AnalyticsStat',
  '2': [
    {'1': 'id', '3': 14, '4': 1, '5': 9, '10': 'id'},
    {'1': 'analytics_key', '3': 1, '4': 1, '5': 9, '10': 'analyticsKey'},
    {'1': 'kind', '3': 2, '4': 1, '5': 14, '6': '.livekit.StreamType', '10': 'kind'},
    {'1': 'time_stamp', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timeStamp'},
    {'1': 'node', '3': 4, '4': 1, '5': 9, '10': 'node'},
    {'1': 'room_id', '3': 5, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_name', '3': 6, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'participant_id', '3': 7, '4': 1, '5': 9, '10': 'participantId'},
    {'1': 'track_id', '3': 8, '4': 1, '5': 9, '10': 'trackId'},
    {'1': 'score', '3': 9, '4': 1, '5': 2, '10': 'score'},
    {'1': 'streams', '3': 10, '4': 3, '5': 11, '6': '.livekit.AnalyticsStream', '10': 'streams'},
    {'1': 'mime', '3': 11, '4': 1, '5': 9, '10': 'mime'},
    {'1': 'min_score', '3': 12, '4': 1, '5': 2, '10': 'minScore'},
    {'1': 'median_score', '3': 13, '4': 1, '5': 2, '10': 'medianScore'},
  ],
};

/// Descriptor for `AnalyticsStat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsStatDescriptor = $convert.base64Decode(
    'Cg1BbmFseXRpY3NTdGF0Eg4KAmlkGA4gASgJUgJpZBIjCg1hbmFseXRpY3Nfa2V5GAEgASgJUg'
    'xhbmFseXRpY3NLZXkSJwoEa2luZBgCIAEoDjITLmxpdmVraXQuU3RyZWFtVHlwZVIEa2luZBI5'
    'Cgp0aW1lX3N0YW1wGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdGltZVN0YW'
    '1wEhIKBG5vZGUYBCABKAlSBG5vZGUSFwoHcm9vbV9pZBgFIAEoCVIGcm9vbUlkEhsKCXJvb21f'
    'bmFtZRgGIAEoCVIIcm9vbU5hbWUSJQoOcGFydGljaXBhbnRfaWQYByABKAlSDXBhcnRpY2lwYW'
    '50SWQSGQoIdHJhY2tfaWQYCCABKAlSB3RyYWNrSWQSFAoFc2NvcmUYCSABKAJSBXNjb3JlEjIK'
    'B3N0cmVhbXMYCiADKAsyGC5saXZla2l0LkFuYWx5dGljc1N0cmVhbVIHc3RyZWFtcxISCgRtaW'
    '1lGAsgASgJUgRtaW1lEhsKCW1pbl9zY29yZRgMIAEoAlIIbWluU2NvcmUSIQoMbWVkaWFuX3Nj'
    'b3JlGA0gASgCUgttZWRpYW5TY29yZQ==');

@$core.Deprecated('Use analyticsStatsDescriptor instead')
const AnalyticsStats$json = {
  '1': 'AnalyticsStats',
  '2': [
    {'1': 'stats', '3': 1, '4': 3, '5': 11, '6': '.livekit.AnalyticsStat', '10': 'stats'},
  ],
};

/// Descriptor for `AnalyticsStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsStatsDescriptor = $convert.base64Decode(
    'Cg5BbmFseXRpY3NTdGF0cxIsCgVzdGF0cxgBIAMoCzIWLmxpdmVraXQuQW5hbHl0aWNzU3RhdF'
    'IFc3RhdHM=');

@$core.Deprecated('Use analyticsClientMetaDescriptor instead')
const AnalyticsClientMeta$json = {
  '1': 'AnalyticsClientMeta',
  '2': [
    {'1': 'region', '3': 1, '4': 1, '5': 9, '10': 'region'},
    {'1': 'node', '3': 2, '4': 1, '5': 9, '10': 'node'},
    {'1': 'client_addr', '3': 3, '4': 1, '5': 9, '10': 'clientAddr'},
    {'1': 'client_connect_time', '3': 4, '4': 1, '5': 13, '10': 'clientConnectTime'},
    {'1': 'connection_type', '3': 5, '4': 1, '5': 9, '10': 'connectionType'},
    {'1': 'reconnect_reason', '3': 6, '4': 1, '5': 14, '6': '.livekit.ReconnectReason', '10': 'reconnectReason'},
    {'1': 'geo_hash', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'geoHash', '17': true},
    {'1': 'country', '3': 8, '4': 1, '5': 9, '9': 1, '10': 'country', '17': true},
    {'1': 'isp_asn', '3': 9, '4': 1, '5': 13, '9': 2, '10': 'ispAsn', '17': true},
  ],
  '8': [
    {'1': '_geo_hash'},
    {'1': '_country'},
    {'1': '_isp_asn'},
  ],
};

/// Descriptor for `AnalyticsClientMeta`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsClientMetaDescriptor = $convert.base64Decode(
    'ChNBbmFseXRpY3NDbGllbnRNZXRhEhYKBnJlZ2lvbhgBIAEoCVIGcmVnaW9uEhIKBG5vZGUYAi'
    'ABKAlSBG5vZGUSHwoLY2xpZW50X2FkZHIYAyABKAlSCmNsaWVudEFkZHISLgoTY2xpZW50X2Nv'
    'bm5lY3RfdGltZRgEIAEoDVIRY2xpZW50Q29ubmVjdFRpbWUSJwoPY29ubmVjdGlvbl90eXBlGA'
    'UgASgJUg5jb25uZWN0aW9uVHlwZRJDChByZWNvbm5lY3RfcmVhc29uGAYgASgOMhgubGl2ZWtp'
    'dC5SZWNvbm5lY3RSZWFzb25SD3JlY29ubmVjdFJlYXNvbhIeCghnZW9faGFzaBgHIAEoCUgAUg'
    'dnZW9IYXNoiAEBEh0KB2NvdW50cnkYCCABKAlIAVIHY291bnRyeYgBARIcCgdpc3BfYXNuGAkg'
    'ASgNSAJSBmlzcEFzbogBAUILCglfZ2VvX2hhc2hCCgoIX2NvdW50cnlCCgoIX2lzcF9hc24=');

@$core.Deprecated('Use analyticsEventDescriptor instead')
const AnalyticsEvent$json = {
  '1': 'AnalyticsEvent',
  '2': [
    {'1': 'id', '3': 25, '4': 1, '5': 9, '10': 'id'},
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.livekit.AnalyticsEventType', '10': 'type'},
    {'1': 'timestamp', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
    {'1': 'room_id', '3': 3, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room', '3': 4, '4': 1, '5': 11, '6': '.livekit.Room', '10': 'room'},
    {'1': 'participant_id', '3': 5, '4': 1, '5': 9, '10': 'participantId'},
    {'1': 'participant', '3': 6, '4': 1, '5': 11, '6': '.livekit.ParticipantInfo', '10': 'participant'},
    {'1': 'track_id', '3': 7, '4': 1, '5': 9, '10': 'trackId'},
    {'1': 'track', '3': 8, '4': 1, '5': 11, '6': '.livekit.TrackInfo', '10': 'track'},
    {'1': 'analytics_key', '3': 10, '4': 1, '5': 9, '10': 'analyticsKey'},
    {'1': 'client_info', '3': 11, '4': 1, '5': 11, '6': '.livekit.ClientInfo', '10': 'clientInfo'},
    {'1': 'client_meta', '3': 12, '4': 1, '5': 11, '6': '.livekit.AnalyticsClientMeta', '10': 'clientMeta'},
    {'1': 'egress_id', '3': 13, '4': 1, '5': 9, '10': 'egressId'},
    {'1': 'ingress_id', '3': 19, '4': 1, '5': 9, '10': 'ingressId'},
    {'1': 'max_subscribed_video_quality', '3': 14, '4': 1, '5': 14, '6': '.livekit.VideoQuality', '10': 'maxSubscribedVideoQuality'},
    {'1': 'publisher', '3': 15, '4': 1, '5': 11, '6': '.livekit.ParticipantInfo', '10': 'publisher'},
    {'1': 'mime', '3': 16, '4': 1, '5': 9, '10': 'mime'},
    {'1': 'egress', '3': 17, '4': 1, '5': 11, '6': '.livekit.EgressInfo', '10': 'egress'},
    {'1': 'ingress', '3': 18, '4': 1, '5': 11, '6': '.livekit.IngressInfo', '10': 'ingress'},
    {'1': 'error', '3': 20, '4': 1, '5': 9, '10': 'error'},
    {'1': 'rtp_stats', '3': 21, '4': 1, '5': 11, '6': '.livekit.RTPStats', '10': 'rtpStats'},
    {'1': 'video_layer', '3': 22, '4': 1, '5': 5, '10': 'videoLayer'},
    {'1': 'node_id', '3': 24, '4': 1, '5': 9, '10': 'nodeId'},
    {'1': 'sip_call_id', '3': 26, '4': 1, '5': 9, '10': 'sipCallId'},
    {'1': 'sip_call', '3': 27, '4': 1, '5': 11, '6': '.livekit.SIPCallInfo', '10': 'sipCall'},
    {'1': 'sip_trunk_id', '3': 28, '4': 1, '5': 9, '10': 'sipTrunkId'},
    {'1': 'sip_inbound_trunk', '3': 29, '4': 1, '5': 11, '6': '.livekit.SIPInboundTrunkInfo', '10': 'sipInboundTrunk'},
    {'1': 'sip_outbound_trunk', '3': 30, '4': 1, '5': 11, '6': '.livekit.SIPOutboundTrunkInfo', '10': 'sipOutboundTrunk'},
    {'1': 'sip_dispatch_rule_id', '3': 31, '4': 1, '5': 9, '10': 'sipDispatchRuleId'},
    {'1': 'sip_dispatch_rule', '3': 32, '4': 1, '5': 11, '6': '.livekit.SIPDispatchRuleInfo', '10': 'sipDispatchRule'},
    {'1': 'sip_transfer', '3': 36, '4': 1, '5': 11, '6': '.livekit.SIPTransferInfo', '10': 'sipTransfer'},
    {'1': 'report', '3': 33, '4': 1, '5': 11, '6': '.livekit.ReportInfo', '10': 'report'},
    {'1': 'api_call', '3': 34, '4': 1, '5': 11, '6': '.livekit.APICallInfo', '10': 'apiCall'},
    {'1': 'webhook', '3': 35, '4': 1, '5': 11, '6': '.livekit.WebhookInfo', '10': 'webhook'},
  ],
};

/// Descriptor for `AnalyticsEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsEventDescriptor = $convert.base64Decode(
    'Cg5BbmFseXRpY3NFdmVudBIOCgJpZBgZIAEoCVICaWQSLwoEdHlwZRgBIAEoDjIbLmxpdmVraX'
    'QuQW5hbHl0aWNzRXZlbnRUeXBlUgR0eXBlEjgKCXRpbWVzdGFtcBgCIAEoCzIaLmdvb2dsZS5w'
    'cm90b2J1Zi5UaW1lc3RhbXBSCXRpbWVzdGFtcBIXCgdyb29tX2lkGAMgASgJUgZyb29tSWQSIQ'
    'oEcm9vbRgEIAEoCzINLmxpdmVraXQuUm9vbVIEcm9vbRIlCg5wYXJ0aWNpcGFudF9pZBgFIAEo'
    'CVINcGFydGljaXBhbnRJZBI6CgtwYXJ0aWNpcGFudBgGIAEoCzIYLmxpdmVraXQuUGFydGljaX'
    'BhbnRJbmZvUgtwYXJ0aWNpcGFudBIZCgh0cmFja19pZBgHIAEoCVIHdHJhY2tJZBIoCgV0cmFj'
    'axgIIAEoCzISLmxpdmVraXQuVHJhY2tJbmZvUgV0cmFjaxIjCg1hbmFseXRpY3Nfa2V5GAogAS'
    'gJUgxhbmFseXRpY3NLZXkSNAoLY2xpZW50X2luZm8YCyABKAsyEy5saXZla2l0LkNsaWVudElu'
    'Zm9SCmNsaWVudEluZm8SPQoLY2xpZW50X21ldGEYDCABKAsyHC5saXZla2l0LkFuYWx5dGljc0'
    'NsaWVudE1ldGFSCmNsaWVudE1ldGESGwoJZWdyZXNzX2lkGA0gASgJUghlZ3Jlc3NJZBIdCgpp'
    'bmdyZXNzX2lkGBMgASgJUglpbmdyZXNzSWQSVgocbWF4X3N1YnNjcmliZWRfdmlkZW9fcXVhbG'
    'l0eRgOIAEoDjIVLmxpdmVraXQuVmlkZW9RdWFsaXR5UhltYXhTdWJzY3JpYmVkVmlkZW9RdWFs'
    'aXR5EjYKCXB1Ymxpc2hlchgPIAEoCzIYLmxpdmVraXQuUGFydGljaXBhbnRJbmZvUglwdWJsaX'
    'NoZXISEgoEbWltZRgQIAEoCVIEbWltZRIrCgZlZ3Jlc3MYESABKAsyEy5saXZla2l0LkVncmVz'
    'c0luZm9SBmVncmVzcxIuCgdpbmdyZXNzGBIgASgLMhQubGl2ZWtpdC5JbmdyZXNzSW5mb1IHaW'
    '5ncmVzcxIUCgVlcnJvchgUIAEoCVIFZXJyb3ISLgoJcnRwX3N0YXRzGBUgASgLMhEubGl2ZWtp'
    'dC5SVFBTdGF0c1IIcnRwU3RhdHMSHwoLdmlkZW9fbGF5ZXIYFiABKAVSCnZpZGVvTGF5ZXISFw'
    'oHbm9kZV9pZBgYIAEoCVIGbm9kZUlkEh4KC3NpcF9jYWxsX2lkGBogASgJUglzaXBDYWxsSWQS'
    'LwoIc2lwX2NhbGwYGyABKAsyFC5saXZla2l0LlNJUENhbGxJbmZvUgdzaXBDYWxsEiAKDHNpcF'
    '90cnVua19pZBgcIAEoCVIKc2lwVHJ1bmtJZBJIChFzaXBfaW5ib3VuZF90cnVuaxgdIAEoCzIc'
    'LmxpdmVraXQuU0lQSW5ib3VuZFRydW5rSW5mb1IPc2lwSW5ib3VuZFRydW5rEksKEnNpcF9vdX'
    'Rib3VuZF90cnVuaxgeIAEoCzIdLmxpdmVraXQuU0lQT3V0Ym91bmRUcnVua0luZm9SEHNpcE91'
    'dGJvdW5kVHJ1bmsSLwoUc2lwX2Rpc3BhdGNoX3J1bGVfaWQYHyABKAlSEXNpcERpc3BhdGNoUn'
    'VsZUlkEkgKEXNpcF9kaXNwYXRjaF9ydWxlGCAgASgLMhwubGl2ZWtpdC5TSVBEaXNwYXRjaFJ1'
    'bGVJbmZvUg9zaXBEaXNwYXRjaFJ1bGUSOwoMc2lwX3RyYW5zZmVyGCQgASgLMhgubGl2ZWtpdC'
    '5TSVBUcmFuc2ZlckluZm9SC3NpcFRyYW5zZmVyEisKBnJlcG9ydBghIAEoCzITLmxpdmVraXQu'
    'UmVwb3J0SW5mb1IGcmVwb3J0Ei8KCGFwaV9jYWxsGCIgASgLMhQubGl2ZWtpdC5BUElDYWxsSW'
    '5mb1IHYXBpQ2FsbBIuCgd3ZWJob29rGCMgASgLMhQubGl2ZWtpdC5XZWJob29rSW5mb1IHd2Vi'
    'aG9vaw==');

@$core.Deprecated('Use analyticsEventsDescriptor instead')
const AnalyticsEvents$json = {
  '1': 'AnalyticsEvents',
  '2': [
    {'1': 'events', '3': 1, '4': 3, '5': 11, '6': '.livekit.AnalyticsEvent', '10': 'events'},
  ],
};

/// Descriptor for `AnalyticsEvents`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsEventsDescriptor = $convert.base64Decode(
    'Cg9BbmFseXRpY3NFdmVudHMSLwoGZXZlbnRzGAEgAygLMhcubGl2ZWtpdC5BbmFseXRpY3NFdm'
    'VudFIGZXZlbnRz');

@$core.Deprecated('Use analyticsRoomParticipantDescriptor instead')
const AnalyticsRoomParticipant$json = {
  '1': 'AnalyticsRoomParticipant',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'identity', '3': 2, '4': 1, '5': 9, '10': 'identity'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'state', '3': 4, '4': 1, '5': 14, '6': '.livekit.ParticipantInfo.State', '10': 'state'},
    {'1': 'joined_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'joinedAt'},
  ],
};

/// Descriptor for `AnalyticsRoomParticipant`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsRoomParticipantDescriptor = $convert.base64Decode(
    'ChhBbmFseXRpY3NSb29tUGFydGljaXBhbnQSDgoCaWQYASABKAlSAmlkEhoKCGlkZW50aXR5GA'
    'IgASgJUghpZGVudGl0eRISCgRuYW1lGAMgASgJUgRuYW1lEjQKBXN0YXRlGAQgASgOMh4ubGl2'
    'ZWtpdC5QYXJ0aWNpcGFudEluZm8uU3RhdGVSBXN0YXRlEjcKCWpvaW5lZF9hdBgFIAEoCzIaLm'
    'dvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCGpvaW5lZEF0');

@$core.Deprecated('Use analyticsRoomDescriptor instead')
const AnalyticsRoom$json = {
  '1': 'AnalyticsRoom',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'project_id', '3': 5, '4': 1, '5': 9, '10': 'projectId'},
    {'1': 'created_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'participants', '3': 4, '4': 3, '5': 11, '6': '.livekit.AnalyticsRoomParticipant', '10': 'participants'},
  ],
};

/// Descriptor for `AnalyticsRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsRoomDescriptor = $convert.base64Decode(
    'Cg1BbmFseXRpY3NSb29tEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEh0KCn'
    'Byb2plY3RfaWQYBSABKAlSCXByb2plY3RJZBI5CgpjcmVhdGVkX2F0GAMgASgLMhouZ29vZ2xl'
    'LnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EkUKDHBhcnRpY2lwYW50cxgEIAMoCzIhLm'
    'xpdmVraXQuQW5hbHl0aWNzUm9vbVBhcnRpY2lwYW50UgxwYXJ0aWNpcGFudHM=');

@$core.Deprecated('Use analyticsNodeRoomsDescriptor instead')
const AnalyticsNodeRooms$json = {
  '1': 'AnalyticsNodeRooms',
  '2': [
    {'1': 'node_id', '3': 1, '4': 1, '5': 9, '10': 'nodeId'},
    {'1': 'sequence_number', '3': 2, '4': 1, '5': 4, '10': 'sequenceNumber'},
    {'1': 'timestamp', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
    {'1': 'rooms', '3': 4, '4': 3, '5': 11, '6': '.livekit.AnalyticsRoom', '10': 'rooms'},
  ],
};

/// Descriptor for `AnalyticsNodeRooms`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyticsNodeRoomsDescriptor = $convert.base64Decode(
    'ChJBbmFseXRpY3NOb2RlUm9vbXMSFwoHbm9kZV9pZBgBIAEoCVIGbm9kZUlkEicKD3NlcXVlbm'
    'NlX251bWJlchgCIAEoBFIOc2VxdWVuY2VOdW1iZXISOAoJdGltZXN0YW1wGAMgASgLMhouZ29v'
    'Z2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdGltZXN0YW1wEiwKBXJvb21zGAQgAygLMhYubGl2ZW'
    'tpdC5BbmFseXRpY3NSb29tUgVyb29tcw==');

@$core.Deprecated('Use reportInfoDescriptor instead')
const ReportInfo$json = {
  '1': 'ReportInfo',
  '2': [
    {'1': 'feature_usage', '3': 1, '4': 1, '5': 11, '6': '.livekit.FeatureUsageInfo', '9': 0, '10': 'featureUsage'},
  ],
  '8': [
    {'1': 'message'},
  ],
};

/// Descriptor for `ReportInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportInfoDescriptor = $convert.base64Decode(
    'CgpSZXBvcnRJbmZvEkAKDWZlYXR1cmVfdXNhZ2UYASABKAsyGS5saXZla2l0LkZlYXR1cmVVc2'
    'FnZUluZm9IAFIMZmVhdHVyZVVzYWdlQgkKB21lc3NhZ2U=');

@$core.Deprecated('Use timeRangeDescriptor instead')
const TimeRange$json = {
  '1': 'TimeRange',
  '2': [
    {'1': 'started_at', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startedAt'},
    {'1': 'ended_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endedAt'},
  ],
};

/// Descriptor for `TimeRange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeRangeDescriptor = $convert.base64Decode(
    'CglUaW1lUmFuZ2USOQoKc3RhcnRlZF9hdBgBIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3'
    'RhbXBSCXN0YXJ0ZWRBdBI1CghlbmRlZF9hdBgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1l'
    'c3RhbXBSB2VuZGVkQXQ=');

@$core.Deprecated('Use featureUsageInfoDescriptor instead')
const FeatureUsageInfo$json = {
  '1': 'FeatureUsageInfo',
  '2': [
    {'1': 'feature', '3': 1, '4': 1, '5': 14, '6': '.livekit.FeatureUsageInfo.Feature', '10': 'feature'},
    {'1': 'project_id', '3': 2, '4': 1, '5': 9, '10': 'projectId'},
    {'1': 'room_name', '3': 3, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'room_id', '3': 4, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'participant_identity', '3': 5, '4': 1, '5': 9, '10': 'participantIdentity'},
    {'1': 'participant_id', '3': 6, '4': 1, '5': 9, '10': 'participantId'},
    {'1': 'track_id', '3': 7, '4': 1, '5': 9, '10': 'trackId'},
    {'1': 'time_ranges', '3': 8, '4': 3, '5': 11, '6': '.livekit.TimeRange', '10': 'timeRanges'},
  ],
  '4': [FeatureUsageInfo_Feature$json],
};

@$core.Deprecated('Use featureUsageInfoDescriptor instead')
const FeatureUsageInfo_Feature$json = {
  '1': 'Feature',
  '2': [
    {'1': 'KRISP_NOISE_CANCELLATION', '2': 0},
    {'1': 'KRISP_BACKGROUND_VOICE_CANCELLATION', '2': 1},
    {'1': 'AIC_AUDIO_ENHANCEMENT', '2': 2},
  ],
};

/// Descriptor for `FeatureUsageInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List featureUsageInfoDescriptor = $convert.base64Decode(
    'ChBGZWF0dXJlVXNhZ2VJbmZvEjsKB2ZlYXR1cmUYASABKA4yIS5saXZla2l0LkZlYXR1cmVVc2'
    'FnZUluZm8uRmVhdHVyZVIHZmVhdHVyZRIdCgpwcm9qZWN0X2lkGAIgASgJUglwcm9qZWN0SWQS'
    'GwoJcm9vbV9uYW1lGAMgASgJUghyb29tTmFtZRIXCgdyb29tX2lkGAQgASgJUgZyb29tSWQSMQ'
    'oUcGFydGljaXBhbnRfaWRlbnRpdHkYBSABKAlSE3BhcnRpY2lwYW50SWRlbnRpdHkSJQoOcGFy'
    'dGljaXBhbnRfaWQYBiABKAlSDXBhcnRpY2lwYW50SWQSGQoIdHJhY2tfaWQYByABKAlSB3RyYW'
    'NrSWQSMwoLdGltZV9yYW5nZXMYCCADKAsyEi5saXZla2l0LlRpbWVSYW5nZVIKdGltZVJhbmdl'
    'cyJrCgdGZWF0dXJlEhwKGEtSSVNQX05PSVNFX0NBTkNFTExBVElPThAAEicKI0tSSVNQX0JBQ0'
    'tHUk9VTkRfVk9JQ0VfQ0FOQ0VMTEFUSU9OEAESGQoVQUlDX0FVRElPX0VOSEFOQ0VNRU5UEAI=');

@$core.Deprecated('Use aPICallRequestDescriptor instead')
const APICallRequest$json = {
  '1': 'APICallRequest',
  '2': [
    {'1': 'create_room_request', '3': 1, '4': 1, '5': 11, '6': '.livekit.CreateRoomRequest', '9': 0, '10': 'createRoomRequest'},
    {'1': 'list_rooms_request', '3': 2, '4': 1, '5': 11, '6': '.livekit.ListRoomsRequest', '9': 0, '10': 'listRoomsRequest'},
    {'1': 'delete_room_request', '3': 3, '4': 1, '5': 11, '6': '.livekit.DeleteRoomRequest', '9': 0, '10': 'deleteRoomRequest'},
    {'1': 'list_participants_request', '3': 4, '4': 1, '5': 11, '6': '.livekit.ListParticipantsRequest', '9': 0, '10': 'listParticipantsRequest'},
    {'1': 'room_participant_identity', '3': 5, '4': 1, '5': 11, '6': '.livekit.RoomParticipantIdentity', '9': 0, '10': 'roomParticipantIdentity'},
    {'1': 'mute_room_track_request', '3': 6, '4': 1, '5': 11, '6': '.livekit.MuteRoomTrackRequest', '9': 0, '10': 'muteRoomTrackRequest'},
    {'1': 'update_participant_request', '3': 7, '4': 1, '5': 11, '6': '.livekit.UpdateParticipantRequest', '9': 0, '10': 'updateParticipantRequest'},
    {'1': 'update_subscriptions_request', '3': 8, '4': 1, '5': 11, '6': '.livekit.UpdateSubscriptionsRequest', '9': 0, '10': 'updateSubscriptionsRequest'},
    {'1': 'send_data_request', '3': 9, '4': 1, '5': 11, '6': '.livekit.SendDataRequest', '9': 0, '10': 'sendDataRequest'},
    {'1': 'update_room_metadata_request', '3': 10, '4': 1, '5': 11, '6': '.livekit.UpdateRoomMetadataRequest', '9': 0, '10': 'updateRoomMetadataRequest'},
  ],
  '8': [
    {'1': 'message'},
  ],
};

/// Descriptor for `APICallRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aPICallRequestDescriptor = $convert.base64Decode(
    'Cg5BUElDYWxsUmVxdWVzdBJMChNjcmVhdGVfcm9vbV9yZXF1ZXN0GAEgASgLMhoubGl2ZWtpdC'
    '5DcmVhdGVSb29tUmVxdWVzdEgAUhFjcmVhdGVSb29tUmVxdWVzdBJJChJsaXN0X3Jvb21zX3Jl'
    'cXVlc3QYAiABKAsyGS5saXZla2l0Lkxpc3RSb29tc1JlcXVlc3RIAFIQbGlzdFJvb21zUmVxdW'
    'VzdBJMChNkZWxldGVfcm9vbV9yZXF1ZXN0GAMgASgLMhoubGl2ZWtpdC5EZWxldGVSb29tUmVx'
    'dWVzdEgAUhFkZWxldGVSb29tUmVxdWVzdBJeChlsaXN0X3BhcnRpY2lwYW50c19yZXF1ZXN0GA'
    'QgASgLMiAubGl2ZWtpdC5MaXN0UGFydGljaXBhbnRzUmVxdWVzdEgAUhdsaXN0UGFydGljaXBh'
    'bnRzUmVxdWVzdBJeChlyb29tX3BhcnRpY2lwYW50X2lkZW50aXR5GAUgASgLMiAubGl2ZWtpdC'
    '5Sb29tUGFydGljaXBhbnRJZGVudGl0eUgAUhdyb29tUGFydGljaXBhbnRJZGVudGl0eRJWChdt'
    'dXRlX3Jvb21fdHJhY2tfcmVxdWVzdBgGIAEoCzIdLmxpdmVraXQuTXV0ZVJvb21UcmFja1JlcX'
    'Vlc3RIAFIUbXV0ZVJvb21UcmFja1JlcXVlc3QSYQoadXBkYXRlX3BhcnRpY2lwYW50X3JlcXVl'
    'c3QYByABKAsyIS5saXZla2l0LlVwZGF0ZVBhcnRpY2lwYW50UmVxdWVzdEgAUhh1cGRhdGVQYX'
    'J0aWNpcGFudFJlcXVlc3QSZwocdXBkYXRlX3N1YnNjcmlwdGlvbnNfcmVxdWVzdBgIIAEoCzIj'
    'LmxpdmVraXQuVXBkYXRlU3Vic2NyaXB0aW9uc1JlcXVlc3RIAFIadXBkYXRlU3Vic2NyaXB0aW'
    '9uc1JlcXVlc3QSRgoRc2VuZF9kYXRhX3JlcXVlc3QYCSABKAsyGC5saXZla2l0LlNlbmREYXRh'
    'UmVxdWVzdEgAUg9zZW5kRGF0YVJlcXVlc3QSZQocdXBkYXRlX3Jvb21fbWV0YWRhdGFfcmVxdW'
    'VzdBgKIAEoCzIiLmxpdmVraXQuVXBkYXRlUm9vbU1ldGFkYXRhUmVxdWVzdEgAUhl1cGRhdGVS'
    'b29tTWV0YWRhdGFSZXF1ZXN0QgkKB21lc3NhZ2U=');

@$core.Deprecated('Use aPICallInfoDescriptor instead')
const APICallInfo$json = {
  '1': 'APICallInfo',
  '2': [
    {'1': 'project_id', '3': 1, '4': 1, '5': 9, '10': 'projectId'},
    {'1': 'request', '3': 2, '4': 1, '5': 11, '6': '.livekit.APICallRequest', '10': 'request'},
    {'1': 'service', '3': 3, '4': 1, '5': 9, '10': 'service'},
    {'1': 'method', '3': 4, '4': 1, '5': 9, '10': 'method'},
    {'1': 'node_id', '3': 5, '4': 1, '5': 9, '10': 'nodeId'},
    {'1': 'status', '3': 6, '4': 1, '5': 5, '10': 'status'},
    {'1': 'twirp_error_code', '3': 7, '4': 1, '5': 9, '10': 'twirpErrorCode'},
    {'1': 'twirp_error_message', '3': 8, '4': 1, '5': 9, '10': 'twirpErrorMessage'},
    {'1': 'room_name', '3': 9, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'room_id', '3': 10, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'participant_identity', '3': 11, '4': 1, '5': 9, '10': 'participantIdentity'},
    {'1': 'participant_id', '3': 12, '4': 1, '5': 9, '10': 'participantId'},
    {'1': 'track_id', '3': 13, '4': 1, '5': 9, '10': 'trackId'},
    {'1': 'started_at', '3': 14, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startedAt'},
    {'1': 'duration_ns', '3': 15, '4': 1, '5': 3, '10': 'durationNs'},
  ],
};

/// Descriptor for `APICallInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aPICallInfoDescriptor = $convert.base64Decode(
    'CgtBUElDYWxsSW5mbxIdCgpwcm9qZWN0X2lkGAEgASgJUglwcm9qZWN0SWQSMQoHcmVxdWVzdB'
    'gCIAEoCzIXLmxpdmVraXQuQVBJQ2FsbFJlcXVlc3RSB3JlcXVlc3QSGAoHc2VydmljZRgDIAEo'
    'CVIHc2VydmljZRIWCgZtZXRob2QYBCABKAlSBm1ldGhvZBIXCgdub2RlX2lkGAUgASgJUgZub2'
    'RlSWQSFgoGc3RhdHVzGAYgASgFUgZzdGF0dXMSKAoQdHdpcnBfZXJyb3JfY29kZRgHIAEoCVIO'
    'dHdpcnBFcnJvckNvZGUSLgoTdHdpcnBfZXJyb3JfbWVzc2FnZRgIIAEoCVIRdHdpcnBFcnJvck'
    '1lc3NhZ2USGwoJcm9vbV9uYW1lGAkgASgJUghyb29tTmFtZRIXCgdyb29tX2lkGAogASgJUgZy'
    'b29tSWQSMQoUcGFydGljaXBhbnRfaWRlbnRpdHkYCyABKAlSE3BhcnRpY2lwYW50SWRlbnRpdH'
    'kSJQoOcGFydGljaXBhbnRfaWQYDCABKAlSDXBhcnRpY2lwYW50SWQSGQoIdHJhY2tfaWQYDSAB'
    'KAlSB3RyYWNrSWQSOQoKc3RhcnRlZF9hdBgOIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3'
    'RhbXBSCXN0YXJ0ZWRBdBIfCgtkdXJhdGlvbl9ucxgPIAEoA1IKZHVyYXRpb25Ocw==');

@$core.Deprecated('Use webhookInfoDescriptor instead')
const WebhookInfo$json = {
  '1': 'WebhookInfo',
  '2': [
    {'1': 'event_id', '3': 1, '4': 1, '5': 9, '10': 'eventId'},
    {'1': 'event', '3': 2, '4': 1, '5': 9, '10': 'event'},
    {'1': 'project_id', '3': 3, '4': 1, '5': 9, '10': 'projectId'},
    {'1': 'room_name', '3': 4, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'room_id', '3': 5, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'participant_identity', '3': 6, '4': 1, '5': 9, '10': 'participantIdentity'},
    {'1': 'participant_id', '3': 7, '4': 1, '5': 9, '10': 'participantId'},
    {'1': 'track_id', '3': 8, '4': 1, '5': 9, '10': 'trackId'},
    {'1': 'egress_id', '3': 9, '4': 1, '5': 9, '10': 'egressId'},
    {'1': 'ingress_id', '3': 10, '4': 1, '5': 9, '10': 'ingressId'},
    {'1': 'created_at', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'queued_at', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'queuedAt'},
    {'1': 'queue_duration_ns', '3': 13, '4': 1, '5': 3, '10': 'queueDurationNs'},
    {'1': 'sent_at', '3': 14, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'sentAt'},
    {'1': 'send_duration_ns', '3': 15, '4': 1, '5': 3, '10': 'sendDurationNs'},
    {'1': 'url', '3': 16, '4': 1, '5': 9, '10': 'url'},
    {'1': 'num_dropped', '3': 17, '4': 1, '5': 5, '10': 'numDropped'},
    {'1': 'is_dropped', '3': 18, '4': 1, '5': 8, '10': 'isDropped'},
    {'1': 'service_status', '3': 19, '4': 1, '5': 9, '10': 'serviceStatus'},
    {'1': 'service_error_code', '3': 20, '4': 1, '5': 5, '10': 'serviceErrorCode'},
    {'1': 'service_error', '3': 21, '4': 1, '5': 9, '10': 'serviceError'},
    {'1': 'send_error', '3': 22, '4': 1, '5': 9, '10': 'sendError'},
  ],
};

/// Descriptor for `WebhookInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List webhookInfoDescriptor = $convert.base64Decode(
    'CgtXZWJob29rSW5mbxIZCghldmVudF9pZBgBIAEoCVIHZXZlbnRJZBIUCgVldmVudBgCIAEoCV'
    'IFZXZlbnQSHQoKcHJvamVjdF9pZBgDIAEoCVIJcHJvamVjdElkEhsKCXJvb21fbmFtZRgEIAEo'
    'CVIIcm9vbU5hbWUSFwoHcm9vbV9pZBgFIAEoCVIGcm9vbUlkEjEKFHBhcnRpY2lwYW50X2lkZW'
    '50aXR5GAYgASgJUhNwYXJ0aWNpcGFudElkZW50aXR5EiUKDnBhcnRpY2lwYW50X2lkGAcgASgJ'
    'Ug1wYXJ0aWNpcGFudElkEhkKCHRyYWNrX2lkGAggASgJUgd0cmFja0lkEhsKCWVncmVzc19pZB'
    'gJIAEoCVIIZWdyZXNzSWQSHQoKaW5ncmVzc19pZBgKIAEoCVIJaW5ncmVzc0lkEjkKCmNyZWF0'
    'ZWRfYXQYCyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSNwoJcX'
    'VldWVkX2F0GAwgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIIcXVldWVkQXQSKgoR'
    'cXVldWVfZHVyYXRpb25fbnMYDSABKANSD3F1ZXVlRHVyYXRpb25OcxIzCgdzZW50X2F0GA4gAS'
    'gLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIGc2VudEF0EigKEHNlbmRfZHVyYXRpb25f'
    'bnMYDyABKANSDnNlbmREdXJhdGlvbk5zEhAKA3VybBgQIAEoCVIDdXJsEh8KC251bV9kcm9wcG'
    'VkGBEgASgFUgpudW1Ecm9wcGVkEh0KCmlzX2Ryb3BwZWQYEiABKAhSCWlzRHJvcHBlZBIlCg5z'
    'ZXJ2aWNlX3N0YXR1cxgTIAEoCVINc2VydmljZVN0YXR1cxIsChJzZXJ2aWNlX2Vycm9yX2NvZG'
    'UYFCABKAVSEHNlcnZpY2VFcnJvckNvZGUSIwoNc2VydmljZV9lcnJvchgVIAEoCVIMc2Vydmlj'
    'ZUVycm9yEh0KCnNlbmRfZXJyb3IYFiABKAlSCXNlbmRFcnJvcg==');

