import 'academy_models.dart';

class CourseOfferingDetailModel {
  final CourseOfferingModel offering;
  final List<CurriculumModuleModel> modules;
  final String? instructorName;

  const CourseOfferingDetailModel({
    required this.offering,
    required this.modules,
    this.instructorName,
  });

  factory CourseOfferingDetailModel.fromJson(Map<String, dynamic> json) {
    // The gateway may wrap detail in many shapes; keep it defensive.
    final offering = CourseOfferingModel.fromJson(json);

    // Try to locate curriculum modules from nested class -> courseProfile -> modules
    final modules = <CurriculumModuleModel>[];
    final classes = json['classes'];
    if (classes is List) {
      for (final c in classes) {
        if (c is! Map) continue;
        final klass = c['class'];
        if (klass is! Map) continue;
        
        // Use courseProfile instead of syllabus
        final profile = klass['courseProfile'] ?? klass['syllabus']; // Fallback for transition
        if (profile is! Map) continue;
        
        final rawModules = profile['modules'];
        if (rawModules is List) {
          modules.addAll(
            rawModules
                .whereType<Map>()
                .map((m) => CurriculumModuleModel.fromJson(m.cast<String, dynamic>())),
          );
          break; // Take the first profile found
        }
      }
    }

    final instructorName = _findInstructorName(json);

    return CourseOfferingDetailModel(
      offering: offering,
      modules: modules..sort((a, b) => a.orderIndex.compareTo(b.orderIndex)),
      instructorName: instructorName,
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
      lessons: lessons,
    );
  }
}

class CurriculumLessonModel {
  final String id;
  final String title;

  const CurriculumLessonModel({
    required this.id,
    required this.title,
  });

  factory CurriculumLessonModel.fromJson(Map<String, dynamic> json) {
    return CurriculumLessonModel(
      id: (json['id'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
    );
  }
}

String? _findInstructorName(Map<String, dynamic> json) {
  final classes = json['classes'];
  if (classes is List) {
    for (final c in classes) {
      if (c is! Map) continue;
      final klass = c['class'];
      if (klass is! Map) continue;
      final instructor = klass['instructor'];
      if (instructor is Map) {
        final name = instructor['displayName'];
        if (name != null) return name.toString();
      }
    }
  }
  return null;
}

