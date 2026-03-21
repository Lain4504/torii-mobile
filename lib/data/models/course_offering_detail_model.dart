import 'academy_models.dart';
import 'live_offering_detail_model.dart';

class CourseOfferingDetailModel {
  final CourseOfferingModel offering;
  final List<CurriculumModuleModel> modules;
  final String? instructorName;
  final List<LiveClassModel> siblingClasses;

  const CourseOfferingDetailModel({
    required this.offering,
    required this.modules,
    this.instructorName,
    this.siblingClasses = const [],
  });

  factory CourseOfferingDetailModel.fromJson(Map<String, dynamic> json) {
    // The gateway may wrap detail in many shapes; keep it defensive.
    final offering = CourseOfferingModel.fromJson(json);

    // Try to locate curriculum modules
    final modules = <CurriculumModuleModel>[];
    
    // Modern structure: courseProfile is at top level or inside offering
    final profile = json['courseProfile'] ?? json['offering']?['courseProfile'];
    
    if (profile is Map) {
      final rawModules = profile['modules'];
      if (rawModules is List) {
        modules.addAll(
          rawModules
              .whereType<Map>()
              .map((m) => CurriculumModuleModel.fromJson(m.cast<String, dynamic>())),
        );
      }
    } else {
      // Legacy fallback
      final classes = json['classes'];
      if (classes is List) {
        for (final c in classes) {
          if (c is! Map) continue;
          final klass = (c is Map<String, dynamic>) ? (c['class'] ?? c) : c;
          if (klass is! Map) continue;
          
          final p = klass['courseProfile'] ?? klass['syllabus'];
          if (p is! Map) continue;
          
          final rawModules = p['modules'];
          if (rawModules is List) {
            modules.addAll(
              rawModules
                  .whereType<Map>()
                  .map((m) => CurriculumModuleModel.fromJson(m.cast<String, dynamic>())),
            );
            break;
          }
        }
      }
    }

    final instructorName = _findInstructorName(json);

    final rawSiblingClasses = json['siblingClasses'] ?? json['classes'];
    final siblingClasses = (rawSiblingClasses is List)
        ? rawSiblingClasses
            .whereType<Map>()
            .map((c) => LiveClassModel.fromJson(c.cast<String, dynamic>()))
            .toList()
        : <LiveClassModel>[];

    return CourseOfferingDetailModel(
      offering: offering,
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
  final String? content;

  const CurriculumLessonModel({
    required this.id,
    required this.moduleId,
    required this.title,
    required this.type,
    required this.orderIndex,
    this.videoUrl,
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
      videoUrl: json['videoUrl'] as String?,
      content: json['content'] as String?,
    );
  }
}

String? _findInstructorName(Map<String, dynamic> json) {
  final offering = json['offering'] ?? json;
  final instructor = offering['instructor'] ?? offering['class']?['instructor'];
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

