import 'academy_models.dart';
import 'live_product_detail_model.dart';

class AcademyProductDetailModel {
  final AcademyProductModel product;
  final List<CurriculumModuleModel> modules;
  final String? instructorName;
  final List<LiveClassModel> siblingClasses;

  const AcademyProductDetailModel({
    required this.product,
    required this.modules,
    this.instructorName,
    this.siblingClasses = const [],
  });

  // Getter tiện dùng (cùng dữ liệu với AcademyProductModel)
  bool get isLive => product.isLive;
  String get name => product.name;
  String? get code => product.code;
  String? get description => product.description;
  List<dynamic>? get liveClasses => siblingClasses.isEmpty ? null : siblingClasses;
  String get id => product.id;
  String? get thumbnailUrl => product.thumbnailUrl;
  String? get jlptLevel => product.jlptLevel;
  Map<String, dynamic>? get instructor => product.instructor;
  String get mode => product.mode;

  factory AcademyProductDetailModel.fromJson(Map<String, dynamic> json) {
    // The gateway may wrap detail in many shapes; keep it defensive.
    final product = AcademyProductModel.fromJson(json);

    // Try to locate curriculum modules
    final modules = <CurriculumModuleModel>[];
    
    // Robust module extraction
    List<dynamic>? findModules(dynamic current) {
      if (current is! Map) return null;
      final map = Map<String, dynamic>.from(current);
      
      // 1. Direct modules
      if (map['modules'] is List) return map['modules'] as List;
      
      // 2. Inside courseProfile or syllabus
      final p = map['courseProfile'] ?? map['syllabus'] ?? map['productDetail'];
      if (p is Map) {
        final m = findModules(p);
        if (m != null) return m;
      }
      
      // 3. Trong item / product
      final item = map['item'] ?? map['product'];
      if (item is Map) {
        final m = findModules(item);
        if (m != null) return m;
      }

      // 4. Inside classes list (common for LIVE)
      final classes = map['classes'];
      if (classes is List && classes.isNotEmpty) {
        for (final c in classes) {
          final m = findModules(c);
          if (m != null) return m;
        }
      }

      return null;
    }

    final rawModules = findModules(json);
    if (rawModules != null) {
      modules.addAll(
        rawModules
            .whereType<Map>()
            .map((m) => CurriculumModuleModel.fromJson(m.cast<String, dynamic>())),
      );
    }

    final source = json['item'] is Map ? json['item'] as Map : json;
    final instructorName = _findInstructorName(json);

    final rawSiblingClasses = source['siblingClasses'] ?? source['classes'] ?? source['liveClasses'];
    final siblingClasses = (rawSiblingClasses is List)
        ? rawSiblingClasses
            .whereType<Map>()
            .map((c) => LiveClassModel.fromJson(c.cast<String, dynamic>()))
            .toList()
        : <LiveClassModel>[];

    return AcademyProductDetailModel(
      product: product,
      modules: modules..sort((a, b) => a.orderIndex.compareTo(b.orderIndex)),
      instructorName: instructorName,
      siblingClasses: siblingClasses,
    );
  }
}

class CurriculumModuleModel {
  final String id;
  final String title;
  final int orderIndex;
  final List<CurriculumLessonModel> lessons;

  const CurriculumModuleModel({
    required this.id,
    required this.title,
    required this.orderIndex,
    required this.lessons,
  });

  factory CurriculumModuleModel.fromJson(Map<String, dynamic> json) {
    final lessonsRaw = json['lessons'];
    final lessons = (lessonsRaw is List)
        ? lessonsRaw
            .whereType<Map>()
            .map((l) => CurriculumLessonModel.fromJson(l.cast<String, dynamic>()))
            .toList()
        : <CurriculumLessonModel>[];

    return CurriculumModuleModel(
      id: (json['id'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      orderIndex: (json['orderIndex'] is num)
          ? (json['orderIndex'] as num).toInt()
          : int.tryParse((json['orderIndex'] ?? '').toString()) ?? 0,
      lessons: lessons..sort((a, b) => a.orderIndex.compareTo(b.orderIndex)),
    );
  }
}

class CurriculumLessonModel {
  final String id;
  final String moduleId;
  final String title;
  final String type;
  final int orderIndex;
  final String? videoUrl;
  final String? videoFileId;
  final String? content;

  const CurriculumLessonModel({
    required this.id,
    required this.moduleId,
    required this.title,
    required this.type,
    required this.orderIndex,
    this.videoUrl,
    this.videoFileId,
    this.content,
  });

  factory CurriculumLessonModel.fromJson(Map<String, dynamic> json) {
    return CurriculumLessonModel(
      id: (json['id'] ?? '').toString(),
      moduleId: (json['moduleId'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      type: (json['type'] ?? 'VIDEO').toString(),
      orderIndex: (json['orderIndex'] is num)
          ? (json['orderIndex'] as num).toInt()
          : int.tryParse((json['orderIndex'] ?? '').toString()) ?? 0,
      videoUrl: _extractLessonVideoUrl(json),
      videoFileId: _extractLessonVideoFileId(json),
      content: json['content'] as String?,
    );
  }
}

String? _asNonEmptyString(dynamic value) {
  if (value == null) return null;
  final text = value.toString().trim();
  return text.isEmpty ? null : text;
}

String? _firstNonEmptyString(Iterable<dynamic> values) {
  for (final value in values) {
    final text = _asNonEmptyString(value);
    if (text != null) return text;
  }
  return null;
}

String? _extractLessonVideoUrl(Map<String, dynamic> json) {
  final direct = _firstNonEmptyString([
    json['videoUrl'],
    json['videoURL'],
    json['video_url'],
    json['playbackUrl'],
    json['streamUrl'],
    json['hlsUrl'],
    json['signedUrl'],
    json['url'],
  ]);
  if (direct != null) return direct;

  final video = json['video'];
  if (video is String) {
    final url = _asNonEmptyString(video);
    if (url != null) return url;
  }

  if (video is Map) {
    final videoMap = Map<String, dynamic>.from(video);
    final nested = _firstNonEmptyString([
      videoMap['videoUrl'],
      videoMap['playbackUrl'],
      videoMap['streamUrl'],
      videoMap['hlsUrl'],
      videoMap['signedUrl'],
      videoMap['url'],
    ]);
    if (nested != null) return nested;

    final file = videoMap['file'];
    if (file is Map) {
      return _firstNonEmptyString([
        file['signedUrl'],
        file['url'],
      ]);
    }
  }

  return null;
}

String? _extractLessonVideoFileId(Map<String, dynamic> json) {
  final direct = _firstNonEmptyString([
    json['videoFileId'],
    json['fileId'],
    json['storageFileId'],
  ]);
  if (direct != null) return direct;

  final video = json['video'];
  if (video is Map) {
    final videoMap = Map<String, dynamic>.from(video);
    final nested = _firstNonEmptyString([
      videoMap['videoFileId'],
      videoMap['fileId'],
      videoMap['storageFileId'],
    ]);
    if (nested != null) return nested;

    final file = videoMap['file'];
    if (file is Map) {
      return _firstNonEmptyString([
        file['id'],
        file['fileId'],
      ]);
    }
  }

  return null;
}

String? _findInstructorName(Map<String, dynamic> json) {
  final product = json['product'] ?? json;
  final instructor = product['instructor'] ?? product['class']?['instructor'];
  if (instructor is Map) {
    final name = instructor['displayName'];
    if (name != null) return name.toString();
  }

  final classes = json['classes'] ?? json['siblingClasses'];
  if (classes is List) {
    for (final c in classes) {
      if (c is! Map) continue;
      final klass = c['class'] ?? c;
      if (klass is! Map) continue;
      final instr = klass['instructor'];
      if (instr is Map) {
        final name = instr['displayName'];
        if (name != null) return name.toString();
      }
    }
  }
  return null;
}

