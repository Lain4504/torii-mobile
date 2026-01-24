// This is a generated file - do not edit.
//
// Generated from cloud_replay.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'package:protobuf/well_known_types/google/protobuf/empty.pbjson.dart'
    as $1;

import 'livekit_models.pbjson.dart' as $0;

@$core.Deprecated('Use listReplaysRequestDescriptor instead')
const ListReplaysRequest$json = {
  '1': 'ListReplaysRequest',
  '2': [
    {'1': 'room_name', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
    {
      '1': 'page_token',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.livekit.TokenPagination',
      '10': 'pageToken'
    },
  ],
};

/// Descriptor for `ListReplaysRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listReplaysRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0UmVwbGF5c1JlcXVlc3QSGwoJcm9vbV9uYW1lGAEgASgJUghyb29tTmFtZRI3CgpwYW'
    'dlX3Rva2VuGAIgASgLMhgubGl2ZWtpdC5Ub2tlblBhZ2luYXRpb25SCXBhZ2VUb2tlbg==');

@$core.Deprecated('Use listReplaysResponseDescriptor instead')
const ListReplaysResponse$json = {
  '1': 'ListReplaysResponse',
  '2': [
    {
      '1': 'replays',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.replay.ReplayInfo',
      '10': 'replays'
    },
    {
      '1': 'next_page_token',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.livekit.TokenPagination',
      '10': 'nextPageToken'
    },
  ],
};

/// Descriptor for `ListReplaysResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listReplaysResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0UmVwbGF5c1Jlc3BvbnNlEiwKB3JlcGxheXMYASADKAsyEi5yZXBsYXkuUmVwbGF5SW'
    '5mb1IHcmVwbGF5cxJACg9uZXh0X3BhZ2VfdG9rZW4YAiABKAsyGC5saXZla2l0LlRva2VuUGFn'
    'aW5hdGlvblINbmV4dFBhZ2VUb2tlbg==');

@$core.Deprecated('Use replayInfoDescriptor instead')
const ReplayInfo$json = {
  '1': 'ReplayInfo',
  '2': [
    {'1': 'replay_id', '3': 1, '4': 1, '5': 9, '10': 'replayId'},
    {'1': 'room_name', '3': 2, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'start_time', '3': 3, '4': 1, '5': 3, '10': 'startTime'},
    {'1': 'duration', '3': 4, '4': 1, '5': 3, '10': 'duration'},
  ],
};

/// Descriptor for `ReplayInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replayInfoDescriptor = $convert.base64Decode(
    'CgpSZXBsYXlJbmZvEhsKCXJlcGxheV9pZBgBIAEoCVIIcmVwbGF5SWQSGwoJcm9vbV9uYW1lGA'
    'IgASgJUghyb29tTmFtZRIdCgpzdGFydF90aW1lGAMgASgDUglzdGFydFRpbWUSGgoIZHVyYXRp'
    'b24YBCABKANSCGR1cmF0aW9u');

@$core.Deprecated('Use deleteReplayRequestDescriptor instead')
const DeleteReplayRequest$json = {
  '1': 'DeleteReplayRequest',
  '2': [
    {'1': 'replay_id', '3': 1, '4': 1, '5': 9, '10': 'replayId'},
  ],
};

/// Descriptor for `DeleteReplayRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteReplayRequestDescriptor =
    $convert.base64Decode(
        'ChNEZWxldGVSZXBsYXlSZXF1ZXN0EhsKCXJlcGxheV9pZBgBIAEoCVIIcmVwbGF5SWQ=');

@$core.Deprecated('Use playbackRequestDescriptor instead')
const PlaybackRequest$json = {
  '1': 'PlaybackRequest',
  '2': [
    {'1': 'replay_id', '3': 1, '4': 1, '5': 9, '10': 'replayId'},
    {'1': 'playback_room', '3': 2, '4': 1, '5': 9, '10': 'playbackRoom'},
    {'1': 'seek_offset', '3': 3, '4': 1, '5': 3, '10': 'seekOffset'},
  ],
};

/// Descriptor for `PlaybackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playbackRequestDescriptor = $convert.base64Decode(
    'Cg9QbGF5YmFja1JlcXVlc3QSGwoJcmVwbGF5X2lkGAEgASgJUghyZXBsYXlJZBIjCg1wbGF5Ym'
    'Fja19yb29tGAIgASgJUgxwbGF5YmFja1Jvb20SHwoLc2Vla19vZmZzZXQYAyABKANSCnNlZWtP'
    'ZmZzZXQ=');

@$core.Deprecated('Use playbackResponseDescriptor instead')
const PlaybackResponse$json = {
  '1': 'PlaybackResponse',
  '2': [
    {'1': 'playback_id', '3': 1, '4': 1, '5': 9, '10': 'playbackId'},
  ],
};

/// Descriptor for `PlaybackResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playbackResponseDescriptor = $convert.base64Decode(
    'ChBQbGF5YmFja1Jlc3BvbnNlEh8KC3BsYXliYWNrX2lkGAEgASgJUgpwbGF5YmFja0lk');

@$core.Deprecated('Use seekRequestDescriptor instead')
const SeekRequest$json = {
  '1': 'SeekRequest',
  '2': [
    {'1': 'playback_id', '3': 1, '4': 1, '5': 9, '10': 'playbackId'},
    {'1': 'seek_offset', '3': 2, '4': 1, '5': 3, '10': 'seekOffset'},
  ],
};

/// Descriptor for `SeekRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List seekRequestDescriptor = $convert.base64Decode(
    'CgtTZWVrUmVxdWVzdBIfCgtwbGF5YmFja19pZBgBIAEoCVIKcGxheWJhY2tJZBIfCgtzZWVrX2'
    '9mZnNldBgCIAEoA1IKc2Vla09mZnNldA==');

@$core.Deprecated('Use closePlaybackRequestDescriptor instead')
const ClosePlaybackRequest$json = {
  '1': 'ClosePlaybackRequest',
  '2': [
    {'1': 'playback_id', '3': 1, '4': 1, '5': 9, '10': 'playbackId'},
  ],
};

/// Descriptor for `ClosePlaybackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List closePlaybackRequestDescriptor = $convert.base64Decode(
    'ChRDbG9zZVBsYXliYWNrUmVxdWVzdBIfCgtwbGF5YmFja19pZBgBIAEoCVIKcGxheWJhY2tJZA'
    '==');

const $core.Map<$core.String, $core.dynamic> ReplayServiceBase$json = {
  '1': 'Replay',
  '2': [
    {
      '1': 'ListReplays',
      '2': '.replay.ListReplaysRequest',
      '3': '.replay.ListReplaysResponse'
    },
    {
      '1': 'DeleteReplay',
      '2': '.replay.DeleteReplayRequest',
      '3': '.google.protobuf.Empty'
    },
    {
      '1': 'Playback',
      '2': '.replay.PlaybackRequest',
      '3': '.replay.PlaybackResponse'
    },
    {'1': 'Seek', '2': '.replay.SeekRequest', '3': '.google.protobuf.Empty'},
    {
      '1': 'Close',
      '2': '.replay.ClosePlaybackRequest',
      '3': '.google.protobuf.Empty'
    },
  ],
};

@$core.Deprecated('Use replayServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    ReplayServiceBase$messageJson = {
  '.replay.ListReplaysRequest': ListReplaysRequest$json,
  '.livekit.TokenPagination': $0.TokenPagination$json,
  '.replay.ListReplaysResponse': ListReplaysResponse$json,
  '.replay.ReplayInfo': ReplayInfo$json,
  '.replay.DeleteReplayRequest': DeleteReplayRequest$json,
  '.google.protobuf.Empty': $1.Empty$json,
  '.replay.PlaybackRequest': PlaybackRequest$json,
  '.replay.PlaybackResponse': PlaybackResponse$json,
  '.replay.SeekRequest': SeekRequest$json,
  '.replay.ClosePlaybackRequest': ClosePlaybackRequest$json,
};

/// Descriptor for `Replay`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List replayServiceDescriptor = $convert.base64Decode(
    'CgZSZXBsYXkSRgoLTGlzdFJlcGxheXMSGi5yZXBsYXkuTGlzdFJlcGxheXNSZXF1ZXN0Ghsucm'
    'VwbGF5Lkxpc3RSZXBsYXlzUmVzcG9uc2USQwoMRGVsZXRlUmVwbGF5EhsucmVwbGF5LkRlbGV0'
    'ZVJlcGxheVJlcXVlc3QaFi5nb29nbGUucHJvdG9idWYuRW1wdHkSPQoIUGxheWJhY2sSFy5yZX'
    'BsYXkuUGxheWJhY2tSZXF1ZXN0GhgucmVwbGF5LlBsYXliYWNrUmVzcG9uc2USMwoEU2VlaxIT'
    'LnJlcGxheS5TZWVrUmVxdWVzdBoWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eRI9CgVDbG9zZRIcLn'
    'JlcGxheS5DbG9zZVBsYXliYWNrUmVxdWVzdBoWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eQ==');
