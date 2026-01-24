//
//  Generated code. Do not modify.
//  source: livekit_egress.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class EncodedFileType extends $pb.ProtobufEnum {
  static const EncodedFileType DEFAULT_FILETYPE = EncodedFileType._(0, _omitEnumNames ? '' : 'DEFAULT_FILETYPE');
  static const EncodedFileType MP4 = EncodedFileType._(1, _omitEnumNames ? '' : 'MP4');
  static const EncodedFileType OGG = EncodedFileType._(2, _omitEnumNames ? '' : 'OGG');
  static const EncodedFileType MP3 = EncodedFileType._(3, _omitEnumNames ? '' : 'MP3');

  static const $core.List<EncodedFileType> values = <EncodedFileType> [
    DEFAULT_FILETYPE,
    MP4,
    OGG,
    MP3,
  ];

  static final $core.Map<$core.int, EncodedFileType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EncodedFileType? valueOf($core.int value) => _byValue[value];

  const EncodedFileType._($core.int v, $core.String n) : super(v, n);
}

class SegmentedFileProtocol extends $pb.ProtobufEnum {
  static const SegmentedFileProtocol DEFAULT_SEGMENTED_FILE_PROTOCOL = SegmentedFileProtocol._(0, _omitEnumNames ? '' : 'DEFAULT_SEGMENTED_FILE_PROTOCOL');
  static const SegmentedFileProtocol HLS_PROTOCOL = SegmentedFileProtocol._(1, _omitEnumNames ? '' : 'HLS_PROTOCOL');

  static const $core.List<SegmentedFileProtocol> values = <SegmentedFileProtocol> [
    DEFAULT_SEGMENTED_FILE_PROTOCOL,
    HLS_PROTOCOL,
  ];

  static final $core.Map<$core.int, SegmentedFileProtocol> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SegmentedFileProtocol? valueOf($core.int value) => _byValue[value];

  const SegmentedFileProtocol._($core.int v, $core.String n) : super(v, n);
}

class SegmentedFileSuffix extends $pb.ProtobufEnum {
  static const SegmentedFileSuffix INDEX = SegmentedFileSuffix._(0, _omitEnumNames ? '' : 'INDEX');
  static const SegmentedFileSuffix TIMESTAMP = SegmentedFileSuffix._(1, _omitEnumNames ? '' : 'TIMESTAMP');

  static const $core.List<SegmentedFileSuffix> values = <SegmentedFileSuffix> [
    INDEX,
    TIMESTAMP,
  ];

  static final $core.Map<$core.int, SegmentedFileSuffix> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SegmentedFileSuffix? valueOf($core.int value) => _byValue[value];

  const SegmentedFileSuffix._($core.int v, $core.String n) : super(v, n);
}

class ImageFileSuffix extends $pb.ProtobufEnum {
  static const ImageFileSuffix IMAGE_SUFFIX_INDEX = ImageFileSuffix._(0, _omitEnumNames ? '' : 'IMAGE_SUFFIX_INDEX');
  static const ImageFileSuffix IMAGE_SUFFIX_TIMESTAMP = ImageFileSuffix._(1, _omitEnumNames ? '' : 'IMAGE_SUFFIX_TIMESTAMP');
  static const ImageFileSuffix IMAGE_SUFFIX_NONE_OVERWRITE = ImageFileSuffix._(2, _omitEnumNames ? '' : 'IMAGE_SUFFIX_NONE_OVERWRITE');

  static const $core.List<ImageFileSuffix> values = <ImageFileSuffix> [
    IMAGE_SUFFIX_INDEX,
    IMAGE_SUFFIX_TIMESTAMP,
    IMAGE_SUFFIX_NONE_OVERWRITE,
  ];

  static final $core.Map<$core.int, ImageFileSuffix> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ImageFileSuffix? valueOf($core.int value) => _byValue[value];

  const ImageFileSuffix._($core.int v, $core.String n) : super(v, n);
}

class StreamProtocol extends $pb.ProtobufEnum {
  static const StreamProtocol DEFAULT_PROTOCOL = StreamProtocol._(0, _omitEnumNames ? '' : 'DEFAULT_PROTOCOL');
  static const StreamProtocol RTMP = StreamProtocol._(1, _omitEnumNames ? '' : 'RTMP');
  static const StreamProtocol SRT = StreamProtocol._(2, _omitEnumNames ? '' : 'SRT');

  static const $core.List<StreamProtocol> values = <StreamProtocol> [
    DEFAULT_PROTOCOL,
    RTMP,
    SRT,
  ];

  static final $core.Map<$core.int, StreamProtocol> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StreamProtocol? valueOf($core.int value) => _byValue[value];

  const StreamProtocol._($core.int v, $core.String n) : super(v, n);
}

class AudioMixing extends $pb.ProtobufEnum {
  static const AudioMixing DEFAULT_MIXING = AudioMixing._(0, _omitEnumNames ? '' : 'DEFAULT_MIXING');
  static const AudioMixing DUAL_CHANNEL_AGENT = AudioMixing._(1, _omitEnumNames ? '' : 'DUAL_CHANNEL_AGENT');
  static const AudioMixing DUAL_CHANNEL_ALTERNATE = AudioMixing._(2, _omitEnumNames ? '' : 'DUAL_CHANNEL_ALTERNATE');

  static const $core.List<AudioMixing> values = <AudioMixing> [
    DEFAULT_MIXING,
    DUAL_CHANNEL_AGENT,
    DUAL_CHANNEL_ALTERNATE,
  ];

  static final $core.Map<$core.int, AudioMixing> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AudioMixing? valueOf($core.int value) => _byValue[value];

  const AudioMixing._($core.int v, $core.String n) : super(v, n);
}

class EncodingOptionsPreset extends $pb.ProtobufEnum {
  static const EncodingOptionsPreset H264_720P_30 = EncodingOptionsPreset._(0, _omitEnumNames ? '' : 'H264_720P_30');
  static const EncodingOptionsPreset H264_720P_60 = EncodingOptionsPreset._(1, _omitEnumNames ? '' : 'H264_720P_60');
  static const EncodingOptionsPreset H264_1080P_30 = EncodingOptionsPreset._(2, _omitEnumNames ? '' : 'H264_1080P_30');
  static const EncodingOptionsPreset H264_1080P_60 = EncodingOptionsPreset._(3, _omitEnumNames ? '' : 'H264_1080P_60');
  static const EncodingOptionsPreset PORTRAIT_H264_720P_30 = EncodingOptionsPreset._(4, _omitEnumNames ? '' : 'PORTRAIT_H264_720P_30');
  static const EncodingOptionsPreset PORTRAIT_H264_720P_60 = EncodingOptionsPreset._(5, _omitEnumNames ? '' : 'PORTRAIT_H264_720P_60');
  static const EncodingOptionsPreset PORTRAIT_H264_1080P_30 = EncodingOptionsPreset._(6, _omitEnumNames ? '' : 'PORTRAIT_H264_1080P_30');
  static const EncodingOptionsPreset PORTRAIT_H264_1080P_60 = EncodingOptionsPreset._(7, _omitEnumNames ? '' : 'PORTRAIT_H264_1080P_60');

  static const $core.List<EncodingOptionsPreset> values = <EncodingOptionsPreset> [
    H264_720P_30,
    H264_720P_60,
    H264_1080P_30,
    H264_1080P_60,
    PORTRAIT_H264_720P_30,
    PORTRAIT_H264_720P_60,
    PORTRAIT_H264_1080P_30,
    PORTRAIT_H264_1080P_60,
  ];

  static final $core.Map<$core.int, EncodingOptionsPreset> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EncodingOptionsPreset? valueOf($core.int value) => _byValue[value];

  const EncodingOptionsPreset._($core.int v, $core.String n) : super(v, n);
}

class EgressStatus extends $pb.ProtobufEnum {
  static const EgressStatus EGRESS_STARTING = EgressStatus._(0, _omitEnumNames ? '' : 'EGRESS_STARTING');
  static const EgressStatus EGRESS_ACTIVE = EgressStatus._(1, _omitEnumNames ? '' : 'EGRESS_ACTIVE');
  static const EgressStatus EGRESS_ENDING = EgressStatus._(2, _omitEnumNames ? '' : 'EGRESS_ENDING');
  static const EgressStatus EGRESS_COMPLETE = EgressStatus._(3, _omitEnumNames ? '' : 'EGRESS_COMPLETE');
  static const EgressStatus EGRESS_FAILED = EgressStatus._(4, _omitEnumNames ? '' : 'EGRESS_FAILED');
  static const EgressStatus EGRESS_ABORTED = EgressStatus._(5, _omitEnumNames ? '' : 'EGRESS_ABORTED');
  static const EgressStatus EGRESS_LIMIT_REACHED = EgressStatus._(6, _omitEnumNames ? '' : 'EGRESS_LIMIT_REACHED');

  static const $core.List<EgressStatus> values = <EgressStatus> [
    EGRESS_STARTING,
    EGRESS_ACTIVE,
    EGRESS_ENDING,
    EGRESS_COMPLETE,
    EGRESS_FAILED,
    EGRESS_ABORTED,
    EGRESS_LIMIT_REACHED,
  ];

  static final $core.Map<$core.int, EgressStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EgressStatus? valueOf($core.int value) => _byValue[value];

  const EgressStatus._($core.int v, $core.String n) : super(v, n);
}

class EgressSourceType extends $pb.ProtobufEnum {
  static const EgressSourceType EGRESS_SOURCE_TYPE_WEB = EgressSourceType._(0, _omitEnumNames ? '' : 'EGRESS_SOURCE_TYPE_WEB');
  static const EgressSourceType EGRESS_SOURCE_TYPE_SDK = EgressSourceType._(1, _omitEnumNames ? '' : 'EGRESS_SOURCE_TYPE_SDK');

  static const $core.List<EgressSourceType> values = <EgressSourceType> [
    EGRESS_SOURCE_TYPE_WEB,
    EGRESS_SOURCE_TYPE_SDK,
  ];

  static final $core.Map<$core.int, EgressSourceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EgressSourceType? valueOf($core.int value) => _byValue[value];

  const EgressSourceType._($core.int v, $core.String n) : super(v, n);
}

class StreamInfo_Status extends $pb.ProtobufEnum {
  static const StreamInfo_Status ACTIVE = StreamInfo_Status._(0, _omitEnumNames ? '' : 'ACTIVE');
  static const StreamInfo_Status FINISHED = StreamInfo_Status._(1, _omitEnumNames ? '' : 'FINISHED');
  static const StreamInfo_Status FAILED = StreamInfo_Status._(2, _omitEnumNames ? '' : 'FAILED');

  static const $core.List<StreamInfo_Status> values = <StreamInfo_Status> [
    ACTIVE,
    FINISHED,
    FAILED,
  ];

  static final $core.Map<$core.int, StreamInfo_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StreamInfo_Status? valueOf($core.int value) => _byValue[value];

  const StreamInfo_Status._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
