import 'academy_models.dart';

class CourseOfferingDetailModel {
  final CourseOfferingModel offering;
  final List<SyllabusModuleModel> modules;
  final String? instructorName;

  const CourseOfferingDetailModel({
    required this.offering,
    required this.modules,
    this.instructorName,
  });

  factory CourseOfferingDetailModel.fromJson(Map<String, dynamic> json) {
    // The gateway may wrap detail in many shapes; keep it defensive.
    final offering = CourseOfferingModel.fromJson(json);

    // Try to locate syllabus modules from nested class -> syllabus -> modules
    final modules = <SyllabusModuleModel>[];
    final classes = json['classes'];
    if (classes is List) {
      for (final c in classes) {
        if (c is! Map) continue;
        final klass = c['class'];
        if (klass is! Map) continue;
        final syllabus = klass['syllabus'];
        if (syllabus is! Map) continue;
        final rawModules = syllabus['modules'];
        if (rawModules is List) {
          modules.addAll(
            rawModules
                .whereType<Map>()
                .map((m) => SyllabusModuleModel.fromJson(m.cast<String, dynamic>())),
          );
          break; // take the first syllabus found
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

class SyllabusModuleModel {
  final String id;
  final String title;
  final int orderIndex;
  final List<SyllabusLessonModel> lessons;

  const SyllabusModuleModel({
    required this.id,
    required this.title,
    required this.orderIndex,
    required this.lessons,
  });

  factory SyllabusModuleModel.fromJson(Map<String, dynamic> json) {
    final lessonsRaw = json['lessons'];
    final lessons = (lessonsRaw is List)
        ? lessonsRaw
            .whereType<Map>()
            .map((l) => SyllabusLessonModel.fromJson(l.cast<String, dynamic>()))
            .toList()
        : <SyllabusLessonModel>[];

    return SyllabusModuleModel(
      id: (json['id'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      orderIndex: (json['orderIndex'] is num)
          ? (json['orderIndex'] as num).toInt()
          : int.tryParse((json['orderIndex'] ?? '').toString()) ?? 0,
      lessons: lessons,
    );
  }
}

class SyllabusLessonModel {
  final String id;
  final String title;

  const SyllabusLessonModel({
    required this.id,
    required this.title,
  });

  factory SyllabusLessonModel.fromJson(Map<String, dynamic> json) {
    return SyllabusLessonModel(
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

