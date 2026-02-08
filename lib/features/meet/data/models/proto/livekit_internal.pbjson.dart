// This is a generated file - do not edit.
//
// Generated from livekit_internal.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use nodeTypeDescriptor instead')
const NodeType$json = {
  '1': 'NodeType',
  '2': [
    {'1': 'SERVER', '2': 0},
    {'1': 'CONTROLLER', '2': 1},
    {'1': 'MEDIA', '2': 2},
    {'1': 'TURN', '2': 4},
    {'1': 'SWEEPER', '2': 5},
    {'1': 'DIRECTOR', '2': 6},
    {'1': 'HOSTED_AGENT', '2': 7},
    {'1': 'SETTINGS', '2': 8},
  ],
};

/// Descriptor for `NodeType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List nodeTypeDescriptor = $convert.base64Decode(
    'CghOb2RlVHlwZRIKCgZTRVJWRVIQABIOCgpDT05UUk9MTEVSEAESCQoFTUVESUEQAhIICgRUVV'
    'JOEAQSCwoHU1dFRVBFUhAFEgwKCERJUkVDVE9SEAYSEAoMSE9TVEVEX0FHRU5UEAcSDAoIU0VU'
    'VElOR1MQCA==');

@$core.Deprecated('Use nodeStateDescriptor instead')
const NodeState$json = {
  '1': 'NodeState',
  '2': [
    {'1': 'STARTING_UP', '2': 0},
    {'1': 'SERVING', '2': 1},
    {'1': 'SHUTTING_DOWN', '2': 2},
  ],
};

/// Descriptor for `NodeState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List nodeStateDescriptor = $convert.base64Decode(
    'CglOb2RlU3RhdGUSDwoLU1RBUlRJTkdfVVAQABILCgdTRVJWSU5HEAESEQoNU0hVVFRJTkdfRE'
    '9XThAC');

@$core.Deprecated('Use iCECandidateTypeDescriptor instead')
const ICECandidateType$json = {
  '1': 'ICECandidateType',
  '2': [
    {'1': 'ICT_NONE', '2': 0},
    {'1': 'ICT_TCP', '2': 1},
    {'1': 'ICT_TLS', '2': 2},
  ],
};

/// Descriptor for `ICECandidateType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List iCECandidateTypeDescriptor = $convert.base64Decode(
    'ChBJQ0VDYW5kaWRhdGVUeXBlEgwKCElDVF9OT05FEAASCwoHSUNUX1RDUBABEgsKB0lDVF9UTF'
    'MQAg==');

@$core.Deprecated('Use nodeDescriptor instead')
const Node$json = {
  '1': 'Node',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'ip', '3': 2, '4': 1, '5': 9, '10': 'ip'},
    {'1': 'num_cpus', '3': 3, '4': 1, '5': 13, '10': 'numCpus'},
    {
      '1': 'stats',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.livekit.NodeStats',
      '10': 'stats'
    },
    {
      '1': 'type',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.livekit.NodeType',
      '10': 'type'
    },
    {
      '1': 'state',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.livekit.NodeState',
      '10': 'state'
    },
    {'1': 'region', '3': 7, '4': 1, '5': 9, '10': 'region'},
  ],
};

/// Descriptor for `Node`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeDescriptor = $convert.base64Decode(
    'CgROb2RlEg4KAmlkGAEgASgJUgJpZBIOCgJpcBgCIAEoCVICaXASGQoIbnVtX2NwdXMYAyABKA'
    '1SB251bUNwdXMSKAoFc3RhdHMYBCABKAsyEi5saXZla2l0Lk5vZGVTdGF0c1IFc3RhdHMSJQoE'
    'dHlwZRgFIAEoDjIRLmxpdmVraXQuTm9kZVR5cGVSBHR5cGUSKAoFc3RhdGUYBiABKA4yEi5saX'
    'Zla2l0Lk5vZGVTdGF0ZVIFc3RhdGUSFgoGcmVnaW9uGAcgASgJUgZyZWdpb24=');

@$core.Deprecated('Use nodeStatsDescriptor instead')
const NodeStats$json = {
  '1': 'NodeStats',
  '2': [
    {'1': 'started_at', '3': 1, '4': 1, '5': 3, '10': 'startedAt'},
    {'1': 'updated_at', '3': 2, '4': 1, '5': 3, '10': 'updatedAt'},
    {'1': 'num_rooms', '3': 3, '4': 1, '5': 5, '10': 'numRooms'},
    {'1': 'num_clients', '3': 4, '4': 1, '5': 5, '10': 'numClients'},
    {'1': 'num_tracks_in', '3': 5, '4': 1, '5': 5, '10': 'numTracksIn'},
    {'1': 'num_tracks_out', '3': 6, '4': 1, '5': 5, '10': 'numTracksOut'},
    {
      '1': 'num_track_publish_attempts',
      '3': 36,
      '4': 1,
      '5': 5,
      '10': 'numTrackPublishAttempts'
    },
    {
      '1': 'track_publish_attempts_per_sec',
      '3': 37,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'trackPublishAttemptsPerSec',
    },
    {
      '1': 'num_track_publish_success',
      '3': 38,
      '4': 1,
      '5': 5,
      '10': 'numTrackPublishSuccess'
    },
    {
      '1': 'track_publish_success_per_sec',
      '3': 39,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'trackPublishSuccessPerSec',
    },
    {
      '1': 'num_track_publish_cancels',
      '3': 51,
      '4': 1,
      '5': 5,
      '10': 'numTrackPublishCancels'
    },
    {
      '1': 'num_track_subscribe_attempts',
      '3': 40,
      '4': 1,
      '5': 5,
      '10': 'numTrackSubscribeAttempts'
    },
    {
      '1': 'track_subscribe_attempts_per_sec',
      '3': 41,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'trackSubscribeAttemptsPerSec',
    },
    {
      '1': 'num_track_subscribe_success',
      '3': 42,
      '4': 1,
      '5': 5,
      '10': 'numTrackSubscribeSuccess'
    },
    {
      '1': 'track_subscribe_success_per_sec',
      '3': 43,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'trackSubscribeSuccessPerSec',
    },
    {
      '1': 'num_track_subscribe_cancels',
      '3': 52,
      '4': 1,
      '5': 5,
      '10': 'numTrackSubscribeCancels'
    },
    {'1': 'bytes_in', '3': 7, '4': 1, '5': 4, '10': 'bytesIn'},
    {'1': 'bytes_out', '3': 8, '4': 1, '5': 4, '10': 'bytesOut'},
    {'1': 'packets_in', '3': 9, '4': 1, '5': 4, '10': 'packetsIn'},
    {'1': 'packets_out', '3': 10, '4': 1, '5': 4, '10': 'packetsOut'},
    {'1': 'nack_total', '3': 11, '4': 1, '5': 4, '10': 'nackTotal'},
    {
      '1': 'bytes_in_per_sec',
      '3': 12,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'bytesInPerSec',
    },
    {
      '1': 'bytes_out_per_sec',
      '3': 13,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'bytesOutPerSec',
    },
    {
      '1': 'packets_in_per_sec',
      '3': 14,
      '4': 1,
      '5': 2,
      '10': 'packetsInPerSec'
    },
    {
      '1': 'packets_out_per_sec',
      '3': 15,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'packetsOutPerSec',
    },
    {
      '1': 'nack_per_sec',
      '3': 16,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'nackPerSec',
    },
    {'1': 'num_cpus', '3': 17, '4': 1, '5': 13, '10': 'numCpus'},
    {
      '1': 'load_avg_last1min',
      '3': 18,
      '4': 1,
      '5': 2,
      '10': 'loadAvgLast1min'
    },
    {
      '1': 'load_avg_last5min',
      '3': 19,
      '4': 1,
      '5': 2,
      '10': 'loadAvgLast5min'
    },
    {
      '1': 'load_avg_last15min',
      '3': 20,
      '4': 1,
      '5': 2,
      '10': 'loadAvgLast15min'
    },
    {'1': 'cpu_load', '3': 21, '4': 1, '5': 2, '10': 'cpuLoad'},
    {
      '1': 'memory_load',
      '3': 33,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'memoryLoad',
    },
    {'1': 'memory_total', '3': 34, '4': 1, '5': 4, '10': 'memoryTotal'},
    {'1': 'memory_used', '3': 35, '4': 1, '5': 4, '10': 'memoryUsed'},
    {'1': 'sys_packets_out', '3': 28, '4': 1, '5': 13, '10': 'sysPacketsOut'},
    {
      '1': 'sys_packets_dropped',
      '3': 29,
      '4': 1,
      '5': 13,
      '10': 'sysPacketsDropped'
    },
    {
      '1': 'sys_packets_out_per_sec',
      '3': 30,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'sysPacketsOutPerSec',
    },
    {
      '1': 'sys_packets_dropped_per_sec',
      '3': 31,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'sysPacketsDroppedPerSec',
    },
    {
      '1': 'sys_packets_dropped_pct_per_sec',
      '3': 32,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'sysPacketsDroppedPctPerSec',
    },
    {
      '1': 'retransmit_bytes_out',
      '3': 22,
      '4': 1,
      '5': 4,
      '10': 'retransmitBytesOut'
    },
    {
      '1': 'retransmit_packets_out',
      '3': 23,
      '4': 1,
      '5': 4,
      '10': 'retransmitPacketsOut'
    },
    {
      '1': 'retransmit_bytes_out_per_sec',
      '3': 24,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'retransmitBytesOutPerSec',
    },
    {
      '1': 'retransmit_packets_out_per_sec',
      '3': 25,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'retransmitPacketsOutPerSec',
    },
    {
      '1': 'participant_signal_connected',
      '3': 26,
      '4': 1,
      '5': 4,
      '10': 'participantSignalConnected'
    },
    {
      '1': 'participant_signal_connected_per_sec',
      '3': 27,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'participantSignalConnectedPerSec',
    },
    {
      '1': 'participant_rtc_connected',
      '3': 44,
      '4': 1,
      '5': 4,
      '10': 'participantRtcConnected'
    },
    {
      '1': 'participant_rtc_connected_per_sec',
      '3': 45,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'participantRtcConnectedPerSec',
    },
    {
      '1': 'participant_rtc_init',
      '3': 46,
      '4': 1,
      '5': 4,
      '10': 'participantRtcInit'
    },
    {
      '1': 'participant_rtc_init_per_sec',
      '3': 47,
      '4': 1,
      '5': 2,
      '8': {'3': true},
      '10': 'participantRtcInitPerSec',
    },
    {
      '1': 'participant_rtc_canceled',
      '3': 53,
      '4': 1,
      '5': 4,
      '10': 'participantRtcCanceled'
    },
    {'1': 'forward_latency', '3': 48, '4': 1, '5': 13, '10': 'forwardLatency'},
    {'1': 'forward_jitter', '3': 49, '4': 1, '5': 13, '10': 'forwardJitter'},
    {
      '1': 'rates',
      '3': 50,
      '4': 3,
      '5': 11,
      '6': '.livekit.NodeStatsRate',
      '10': 'rates'
    },
  ],
};

/// Descriptor for `NodeStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeStatsDescriptor = $convert.base64Decode(
    'CglOb2RlU3RhdHMSHQoKc3RhcnRlZF9hdBgBIAEoA1IJc3RhcnRlZEF0Eh0KCnVwZGF0ZWRfYX'
    'QYAiABKANSCXVwZGF0ZWRBdBIbCgludW1fcm9vbXMYAyABKAVSCG51bVJvb21zEh8KC251bV9j'
    'bGllbnRzGAQgASgFUgpudW1DbGllbnRzEiIKDW51bV90cmFja3NfaW4YBSABKAVSC251bVRyYW'
    'Nrc0luEiQKDm51bV90cmFja3Nfb3V0GAYgASgFUgxudW1UcmFja3NPdXQSOwoabnVtX3RyYWNr'
    'X3B1Ymxpc2hfYXR0ZW1wdHMYJCABKAVSF251bVRyYWNrUHVibGlzaEF0dGVtcHRzEkYKHnRyYW'
    'NrX3B1Ymxpc2hfYXR0ZW1wdHNfcGVyX3NlYxglIAEoAkICGAFSGnRyYWNrUHVibGlzaEF0dGVt'
    'cHRzUGVyU2VjEjkKGW51bV90cmFja19wdWJsaXNoX3N1Y2Nlc3MYJiABKAVSFm51bVRyYWNrUH'
    'VibGlzaFN1Y2Nlc3MSRAoddHJhY2tfcHVibGlzaF9zdWNjZXNzX3Blcl9zZWMYJyABKAJCAhgB'
    'Uhl0cmFja1B1Ymxpc2hTdWNjZXNzUGVyU2VjEjkKGW51bV90cmFja19wdWJsaXNoX2NhbmNlbH'
    'MYMyABKAVSFm51bVRyYWNrUHVibGlzaENhbmNlbHMSPwocbnVtX3RyYWNrX3N1YnNjcmliZV9h'
    'dHRlbXB0cxgoIAEoBVIZbnVtVHJhY2tTdWJzY3JpYmVBdHRlbXB0cxJKCiB0cmFja19zdWJzY3'
    'JpYmVfYXR0ZW1wdHNfcGVyX3NlYxgpIAEoAkICGAFSHHRyYWNrU3Vic2NyaWJlQXR0ZW1wdHNQ'
    'ZXJTZWMSPQobbnVtX3RyYWNrX3N1YnNjcmliZV9zdWNjZXNzGCogASgFUhhudW1UcmFja1N1Yn'
    'NjcmliZVN1Y2Nlc3MSSAofdHJhY2tfc3Vic2NyaWJlX3N1Y2Nlc3NfcGVyX3NlYxgrIAEoAkIC'
    'GAFSG3RyYWNrU3Vic2NyaWJlU3VjY2Vzc1BlclNlYxI9ChtudW1fdHJhY2tfc3Vic2NyaWJlX2'
    'NhbmNlbHMYNCABKAVSGG51bVRyYWNrU3Vic2NyaWJlQ2FuY2VscxIZCghieXRlc19pbhgHIAEo'
    'BFIHYnl0ZXNJbhIbCglieXRlc19vdXQYCCABKARSCGJ5dGVzT3V0Eh0KCnBhY2tldHNfaW4YCS'
    'ABKARSCXBhY2tldHNJbhIfCgtwYWNrZXRzX291dBgKIAEoBFIKcGFja2V0c091dBIdCgpuYWNr'
    'X3RvdGFsGAsgASgEUgluYWNrVG90YWwSKwoQYnl0ZXNfaW5fcGVyX3NlYxgMIAEoAkICGAFSDW'
    'J5dGVzSW5QZXJTZWMSLQoRYnl0ZXNfb3V0X3Blcl9zZWMYDSABKAJCAhgBUg5ieXRlc091dFBl'
    'clNlYxIrChJwYWNrZXRzX2luX3Blcl9zZWMYDiABKAJSD3BhY2tldHNJblBlclNlYxIxChNwYW'
    'NrZXRzX291dF9wZXJfc2VjGA8gASgCQgIYAVIQcGFja2V0c091dFBlclNlYxIkCgxuYWNrX3Bl'
    'cl9zZWMYECABKAJCAhgBUgpuYWNrUGVyU2VjEhkKCG51bV9jcHVzGBEgASgNUgdudW1DcHVzEi'
    'oKEWxvYWRfYXZnX2xhc3QxbWluGBIgASgCUg9sb2FkQXZnTGFzdDFtaW4SKgoRbG9hZF9hdmdf'
    'bGFzdDVtaW4YEyABKAJSD2xvYWRBdmdMYXN0NW1pbhIsChJsb2FkX2F2Z19sYXN0MTVtaW4YFC'
    'ABKAJSEGxvYWRBdmdMYXN0MTVtaW4SGQoIY3B1X2xvYWQYFSABKAJSB2NwdUxvYWQSIwoLbWVt'
    'b3J5X2xvYWQYISABKAJCAhgBUgptZW1vcnlMb2FkEiEKDG1lbW9yeV90b3RhbBgiIAEoBFILbW'
    'Vtb3J5VG90YWwSHwoLbWVtb3J5X3VzZWQYIyABKARSCm1lbW9yeVVzZWQSJgoPc3lzX3BhY2tl'
    'dHNfb3V0GBwgASgNUg1zeXNQYWNrZXRzT3V0Ei4KE3N5c19wYWNrZXRzX2Ryb3BwZWQYHSABKA'
    '1SEXN5c1BhY2tldHNEcm9wcGVkEjgKF3N5c19wYWNrZXRzX291dF9wZXJfc2VjGB4gASgCQgIY'
    'AVITc3lzUGFja2V0c091dFBlclNlYxJAChtzeXNfcGFja2V0c19kcm9wcGVkX3Blcl9zZWMYHy'
    'ABKAJCAhgBUhdzeXNQYWNrZXRzRHJvcHBlZFBlclNlYxJHCh9zeXNfcGFja2V0c19kcm9wcGVk'
    'X3BjdF9wZXJfc2VjGCAgASgCQgIYAVIac3lzUGFja2V0c0Ryb3BwZWRQY3RQZXJTZWMSMAoUcm'
    'V0cmFuc21pdF9ieXRlc19vdXQYFiABKARSEnJldHJhbnNtaXRCeXRlc091dBI0ChZyZXRyYW5z'
    'bWl0X3BhY2tldHNfb3V0GBcgASgEUhRyZXRyYW5zbWl0UGFja2V0c091dBJCChxyZXRyYW5zbW'
    'l0X2J5dGVzX291dF9wZXJfc2VjGBggASgCQgIYAVIYcmV0cmFuc21pdEJ5dGVzT3V0UGVyU2Vj'
    'EkYKHnJldHJhbnNtaXRfcGFja2V0c19vdXRfcGVyX3NlYxgZIAEoAkICGAFSGnJldHJhbnNtaX'
    'RQYWNrZXRzT3V0UGVyU2VjEkAKHHBhcnRpY2lwYW50X3NpZ25hbF9jb25uZWN0ZWQYGiABKARS'
    'GnBhcnRpY2lwYW50U2lnbmFsQ29ubmVjdGVkElIKJHBhcnRpY2lwYW50X3NpZ25hbF9jb25uZW'
    'N0ZWRfcGVyX3NlYxgbIAEoAkICGAFSIHBhcnRpY2lwYW50U2lnbmFsQ29ubmVjdGVkUGVyU2Vj'
    'EjoKGXBhcnRpY2lwYW50X3J0Y19jb25uZWN0ZWQYLCABKARSF3BhcnRpY2lwYW50UnRjQ29ubm'
    'VjdGVkEkwKIXBhcnRpY2lwYW50X3J0Y19jb25uZWN0ZWRfcGVyX3NlYxgtIAEoAkICGAFSHXBh'
    'cnRpY2lwYW50UnRjQ29ubmVjdGVkUGVyU2VjEjAKFHBhcnRpY2lwYW50X3J0Y19pbml0GC4gAS'
    'gEUhJwYXJ0aWNpcGFudFJ0Y0luaXQSQgoccGFydGljaXBhbnRfcnRjX2luaXRfcGVyX3NlYxgv'
    'IAEoAkICGAFSGHBhcnRpY2lwYW50UnRjSW5pdFBlclNlYxI4ChhwYXJ0aWNpcGFudF9ydGNfY2'
    'FuY2VsZWQYNSABKARSFnBhcnRpY2lwYW50UnRjQ2FuY2VsZWQSJwoPZm9yd2FyZF9sYXRlbmN5'
    'GDAgASgNUg5mb3J3YXJkTGF0ZW5jeRIlCg5mb3J3YXJkX2ppdHRlchgxIAEoDVINZm9yd2FyZE'
    'ppdHRlchIsCgVyYXRlcxgyIAMoCzIWLmxpdmVraXQuTm9kZVN0YXRzUmF0ZVIFcmF0ZXM=');

@$core.Deprecated('Use nodeStatsRateDescriptor instead')
const NodeStatsRate$json = {
  '1': 'NodeStatsRate',
  '2': [
    {'1': 'started_at', '3': 1, '4': 1, '5': 3, '10': 'startedAt'},
    {'1': 'ended_at', '3': 2, '4': 1, '5': 3, '10': 'endedAt'},
    {'1': 'duration', '3': 3, '4': 1, '5': 3, '10': 'duration'},
    {
      '1': 'track_publish_attempts',
      '3': 4,
      '4': 1,
      '5': 2,
      '10': 'trackPublishAttempts'
    },
    {
      '1': 'track_publish_success',
      '3': 5,
      '4': 1,
      '5': 2,
      '10': 'trackPublishSuccess'
    },
    {
      '1': 'track_publish_cancels',
      '3': 24,
      '4': 1,
      '5': 2,
      '10': 'trackPublishCancels'
    },
    {
      '1': 'track_subscribe_attempts',
      '3': 6,
      '4': 1,
      '5': 2,
      '10': 'trackSubscribeAttempts'
    },
    {
      '1': 'track_subscribe_success',
      '3': 7,
      '4': 1,
      '5': 2,
      '10': 'trackSubscribeSuccess'
    },
    {
      '1': 'track_subscribe_cancels',
      '3': 25,
      '4': 1,
      '5': 2,
      '10': 'trackSubscribeCancels'
    },
    {'1': 'bytes_in', '3': 8, '4': 1, '5': 2, '10': 'bytesIn'},
    {'1': 'bytes_out', '3': 9, '4': 1, '5': 2, '10': 'bytesOut'},
    {'1': 'packets_in', '3': 10, '4': 1, '5': 2, '10': 'packetsIn'},
    {'1': 'packets_out', '3': 11, '4': 1, '5': 2, '10': 'packetsOut'},
    {'1': 'nack_total', '3': 12, '4': 1, '5': 2, '10': 'nackTotal'},
    {'1': 'sys_packets_out', '3': 13, '4': 1, '5': 2, '10': 'sysPacketsOut'},
    {
      '1': 'sys_packets_dropped',
      '3': 14,
      '4': 1,
      '5': 2,
      '10': 'sysPacketsDropped'
    },
    {
      '1': 'retransmit_bytes_out',
      '3': 15,
      '4': 1,
      '5': 2,
      '10': 'retransmitBytesOut'
    },
    {
      '1': 'retransmit_packets_out',
      '3': 16,
      '4': 1,
      '5': 2,
      '10': 'retransmitPacketsOut'
    },
    {
      '1': 'participant_signal_connected',
      '3': 17,
      '4': 1,
      '5': 2,
      '10': 'participantSignalConnected'
    },
    {
      '1': 'participant_rtc_connected',
      '3': 18,
      '4': 1,
      '5': 2,
      '10': 'participantRtcConnected'
    },
    {
      '1': 'participant_rtc_init',
      '3': 19,
      '4': 1,
      '5': 2,
      '10': 'participantRtcInit'
    },
    {
      '1': 'participant_rtc_canceled',
      '3': 26,
      '4': 1,
      '5': 2,
      '10': 'participantRtcCanceled'
    },
    {'1': 'cpu_load', '3': 20, '4': 1, '5': 2, '10': 'cpuLoad'},
    {'1': 'memory_load', '3': 21, '4': 1, '5': 2, '10': 'memoryLoad'},
    {'1': 'memory_used', '3': 22, '4': 1, '5': 2, '10': 'memoryUsed'},
    {'1': 'memory_total', '3': 23, '4': 1, '5': 2, '10': 'memoryTotal'},
  ],
};

/// Descriptor for `NodeStatsRate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeStatsRateDescriptor = $convert.base64Decode(
    'Cg1Ob2RlU3RhdHNSYXRlEh0KCnN0YXJ0ZWRfYXQYASABKANSCXN0YXJ0ZWRBdBIZCghlbmRlZF'
    '9hdBgCIAEoA1IHZW5kZWRBdBIaCghkdXJhdGlvbhgDIAEoA1IIZHVyYXRpb24SNAoWdHJhY2tf'
    'cHVibGlzaF9hdHRlbXB0cxgEIAEoAlIUdHJhY2tQdWJsaXNoQXR0ZW1wdHMSMgoVdHJhY2tfcH'
    'VibGlzaF9zdWNjZXNzGAUgASgCUhN0cmFja1B1Ymxpc2hTdWNjZXNzEjIKFXRyYWNrX3B1Ymxp'
    'c2hfY2FuY2VscxgYIAEoAlITdHJhY2tQdWJsaXNoQ2FuY2VscxI4Chh0cmFja19zdWJzY3JpYm'
    'VfYXR0ZW1wdHMYBiABKAJSFnRyYWNrU3Vic2NyaWJlQXR0ZW1wdHMSNgoXdHJhY2tfc3Vic2Ny'
    'aWJlX3N1Y2Nlc3MYByABKAJSFXRyYWNrU3Vic2NyaWJlU3VjY2VzcxI2Chd0cmFja19zdWJzY3'
    'JpYmVfY2FuY2VscxgZIAEoAlIVdHJhY2tTdWJzY3JpYmVDYW5jZWxzEhkKCGJ5dGVzX2luGAgg'
    'ASgCUgdieXRlc0luEhsKCWJ5dGVzX291dBgJIAEoAlIIYnl0ZXNPdXQSHQoKcGFja2V0c19pbh'
    'gKIAEoAlIJcGFja2V0c0luEh8KC3BhY2tldHNfb3V0GAsgASgCUgpwYWNrZXRzT3V0Eh0KCm5h'
    'Y2tfdG90YWwYDCABKAJSCW5hY2tUb3RhbBImCg9zeXNfcGFja2V0c19vdXQYDSABKAJSDXN5c1'
    'BhY2tldHNPdXQSLgoTc3lzX3BhY2tldHNfZHJvcHBlZBgOIAEoAlIRc3lzUGFja2V0c0Ryb3Bw'
    'ZWQSMAoUcmV0cmFuc21pdF9ieXRlc19vdXQYDyABKAJSEnJldHJhbnNtaXRCeXRlc091dBI0Ch'
    'ZyZXRyYW5zbWl0X3BhY2tldHNfb3V0GBAgASgCUhRyZXRyYW5zbWl0UGFja2V0c091dBJAChxw'
    'YXJ0aWNpcGFudF9zaWduYWxfY29ubmVjdGVkGBEgASgCUhpwYXJ0aWNpcGFudFNpZ25hbENvbm'
    '5lY3RlZBI6ChlwYXJ0aWNpcGFudF9ydGNfY29ubmVjdGVkGBIgASgCUhdwYXJ0aWNpcGFudFJ0'
    'Y0Nvbm5lY3RlZBIwChRwYXJ0aWNpcGFudF9ydGNfaW5pdBgTIAEoAlIScGFydGljaXBhbnRSdG'
    'NJbml0EjgKGHBhcnRpY2lwYW50X3J0Y19jYW5jZWxlZBgaIAEoAlIWcGFydGljaXBhbnRSdGND'
    'YW5jZWxlZBIZCghjcHVfbG9hZBgUIAEoAlIHY3B1TG9hZBIfCgttZW1vcnlfbG9hZBgVIAEoAl'
    'IKbWVtb3J5TG9hZBIfCgttZW1vcnlfdXNlZBgWIAEoAlIKbWVtb3J5VXNlZBIhCgxtZW1vcnlf'
    'dG90YWwYFyABKAJSC21lbW9yeVRvdGFs');

@$core.Deprecated('Use startSessionDescriptor instead')
const StartSession$json = {
  '1': 'StartSession',
  '2': [
    {'1': 'room_name', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'identity', '3': 2, '4': 1, '5': 9, '10': 'identity'},
    {'1': 'connection_id', '3': 3, '4': 1, '5': 9, '10': 'connectionId'},
    {'1': 'reconnect', '3': 4, '4': 1, '5': 8, '10': 'reconnect'},
    {'1': 'auto_subscribe', '3': 9, '4': 1, '5': 8, '10': 'autoSubscribe'},
    {
      '1': 'hidden',
      '3': 10,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'hidden',
    },
    {
      '1': 'client',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.livekit.ClientInfo',
      '10': 'client'
    },
    {
      '1': 'recorder',
      '3': 12,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'recorder',
    },
    {'1': 'name', '3': 13, '4': 1, '5': 9, '10': 'name'},
    {'1': 'grants_json', '3': 14, '4': 1, '5': 9, '10': 'grantsJson'},
    {'1': 'adaptive_stream', '3': 15, '4': 1, '5': 8, '10': 'adaptiveStream'},
    {'1': 'participant_id', '3': 16, '4': 1, '5': 9, '10': 'participantId'},
    {
      '1': 'reconnect_reason',
      '3': 17,
      '4': 1,
      '5': 14,
      '6': '.livekit.ReconnectReason',
      '10': 'reconnectReason'
    },
    {
      '1': 'subscriber_allow_pause',
      '3': 18,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'subscriberAllowPause',
      '17': true
    },
    {'1': 'disable_ice_lite', '3': 19, '4': 1, '5': 8, '10': 'disableIceLite'},
    {
      '1': 'create_room',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.livekit.CreateRoomRequest',
      '10': 'createRoom'
    },
    {
      '1': 'add_track_requests',
      '3': 21,
      '4': 3,
      '5': 11,
      '6': '.livekit.AddTrackRequest',
      '10': 'addTrackRequests'
    },
    {
      '1': 'publisher_offer',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.livekit.SessionDescription',
      '10': 'publisherOffer'
    },
    {
      '1': 'sync_state',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.livekit.SyncState',
      '10': 'syncState'
    },
    {
      '1': 'use_single_peer_connection',
      '3': 24,
      '4': 1,
      '5': 8,
      '10': 'useSinglePeerConnection'
    },
  ],
  '8': [
    {'1': '_subscriber_allow_pause'},
  ],
};

/// Descriptor for `StartSession`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startSessionDescriptor = $convert.base64Decode(
    'CgxTdGFydFNlc3Npb24SGwoJcm9vbV9uYW1lGAEgASgJUghyb29tTmFtZRIaCghpZGVudGl0eR'
    'gCIAEoCVIIaWRlbnRpdHkSIwoNY29ubmVjdGlvbl9pZBgDIAEoCVIMY29ubmVjdGlvbklkEhwK'
    'CXJlY29ubmVjdBgEIAEoCFIJcmVjb25uZWN0EiUKDmF1dG9fc3Vic2NyaWJlGAkgASgIUg1hdX'
    'RvU3Vic2NyaWJlEhoKBmhpZGRlbhgKIAEoCEICGAFSBmhpZGRlbhIrCgZjbGllbnQYCyABKAsy'
    'Ey5saXZla2l0LkNsaWVudEluZm9SBmNsaWVudBIeCghyZWNvcmRlchgMIAEoCEICGAFSCHJlY2'
    '9yZGVyEhIKBG5hbWUYDSABKAlSBG5hbWUSHwoLZ3JhbnRzX2pzb24YDiABKAlSCmdyYW50c0pz'
    'b24SJwoPYWRhcHRpdmVfc3RyZWFtGA8gASgIUg5hZGFwdGl2ZVN0cmVhbRIlCg5wYXJ0aWNpcG'
    'FudF9pZBgQIAEoCVINcGFydGljaXBhbnRJZBJDChByZWNvbm5lY3RfcmVhc29uGBEgASgOMhgu'
    'bGl2ZWtpdC5SZWNvbm5lY3RSZWFzb25SD3JlY29ubmVjdFJlYXNvbhI5ChZzdWJzY3JpYmVyX2'
    'FsbG93X3BhdXNlGBIgASgISABSFHN1YnNjcmliZXJBbGxvd1BhdXNliAEBEigKEGRpc2FibGVf'
    'aWNlX2xpdGUYEyABKAhSDmRpc2FibGVJY2VMaXRlEjsKC2NyZWF0ZV9yb29tGBQgASgLMhoubG'
    'l2ZWtpdC5DcmVhdGVSb29tUmVxdWVzdFIKY3JlYXRlUm9vbRJGChJhZGRfdHJhY2tfcmVxdWVz'
    'dHMYFSADKAsyGC5saXZla2l0LkFkZFRyYWNrUmVxdWVzdFIQYWRkVHJhY2tSZXF1ZXN0cxJECg'
    '9wdWJsaXNoZXJfb2ZmZXIYFiABKAsyGy5saXZla2l0LlNlc3Npb25EZXNjcmlwdGlvblIOcHVi'
    'bGlzaGVyT2ZmZXISMQoKc3luY19zdGF0ZRgXIAEoCzISLmxpdmVraXQuU3luY1N0YXRlUglzeW'
    '5jU3RhdGUSOwoadXNlX3NpbmdsZV9wZWVyX2Nvbm5lY3Rpb24YGCABKAhSF3VzZVNpbmdsZVBl'
    'ZXJDb25uZWN0aW9uQhkKF19zdWJzY3JpYmVyX2FsbG93X3BhdXNl');

@$core.Deprecated('Use roomInternalDescriptor instead')
const RoomInternal$json = {
  '1': 'RoomInternal',
  '2': [
    {
      '1': 'track_egress',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.livekit.AutoTrackEgress',
      '10': 'trackEgress'
    },
    {
      '1': 'participant_egress',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.livekit.AutoParticipantEgress',
      '10': 'participantEgress'
    },
    {
      '1': 'playout_delay',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.livekit.PlayoutDelay',
      '10': 'playoutDelay'
    },
    {
      '1': 'agent_dispatches',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.livekit.RoomAgentDispatch',
      '10': 'agentDispatches'
    },
    {'1': 'sync_streams', '3': 4, '4': 1, '5': 8, '10': 'syncStreams'},
    {'1': 'replay_enabled', '3': 6, '4': 1, '5': 8, '10': 'replayEnabled'},
  ],
};

/// Descriptor for `RoomInternal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomInternalDescriptor = $convert.base64Decode(
    'CgxSb29tSW50ZXJuYWwSOwoMdHJhY2tfZWdyZXNzGAEgASgLMhgubGl2ZWtpdC5BdXRvVHJhY2'
    'tFZ3Jlc3NSC3RyYWNrRWdyZXNzEk0KEnBhcnRpY2lwYW50X2VncmVzcxgCIAEoCzIeLmxpdmVr'
    'aXQuQXV0b1BhcnRpY2lwYW50RWdyZXNzUhFwYXJ0aWNpcGFudEVncmVzcxI6Cg1wbGF5b3V0X2'
    'RlbGF5GAMgASgLMhUubGl2ZWtpdC5QbGF5b3V0RGVsYXlSDHBsYXlvdXREZWxheRJFChBhZ2Vu'
    'dF9kaXNwYXRjaGVzGAUgAygLMhoubGl2ZWtpdC5Sb29tQWdlbnREaXNwYXRjaFIPYWdlbnREaX'
    'NwYXRjaGVzEiEKDHN5bmNfc3RyZWFtcxgEIAEoCFILc3luY1N0cmVhbXMSJQoOcmVwbGF5X2Vu'
    'YWJsZWQYBiABKAhSDXJlcGxheUVuYWJsZWQ=');

@$core.Deprecated('Use iCEConfigDescriptor instead')
const ICEConfig$json = {
  '1': 'ICEConfig',
  '2': [
    {
      '1': 'preference_subscriber',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.livekit.ICECandidateType',
      '10': 'preferenceSubscriber'
    },
    {
      '1': 'preference_publisher',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.livekit.ICECandidateType',
      '10': 'preferencePublisher'
    },
  ],
};

/// Descriptor for `ICEConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iCEConfigDescriptor = $convert.base64Decode(
    'CglJQ0VDb25maWcSTgoVcHJlZmVyZW5jZV9zdWJzY3JpYmVyGAEgASgOMhkubGl2ZWtpdC5JQ0'
    'VDYW5kaWRhdGVUeXBlUhRwcmVmZXJlbmNlU3Vic2NyaWJlchJMChRwcmVmZXJlbmNlX3B1Ymxp'
    'c2hlchgCIAEoDjIZLmxpdmVraXQuSUNFQ2FuZGlkYXRlVHlwZVITcHJlZmVyZW5jZVB1Ymxpc2'
    'hlcg==');
