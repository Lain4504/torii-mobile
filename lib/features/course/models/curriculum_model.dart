/// Curriculum from GET /api/academy/classes/:id/curriculum.
/// Backend: { curriculum: { classId, courseProfileId?, modules: [{ id, title, orderIndex, items: [{ id, kind, referenceId?, orderIndex, title?, ... }] }] } }
/// Prisma: Class → Syllabus → Module → Lesson. Gateway returns modules with items (lesson/assignment refs).

class Curriculum {
  final String? classId;
  final String? courseProfileId;
  final List<CurriculumModule> modules;

  const Curriculum({
    this.classId,
    this.courseProfileId,
    this.modules = const [],
  });

  factory Curriculum.fromJson(Map<String, dynamic> json) {
    final mods = json['modules'] as List<dynamic>? ?? [];
    return Curriculum(
      classId: json['classId']?.toString(),
      courseProfileId: json['courseProfileId']?.toString(),
      modules: mods
          .map((m) => CurriculumModule.fromJson(m as Map<String, dynamic>))
          .toList(),
    );
  }

  int get totalLessons =>
      modules.fold<int>(0, (s, m) => s + m.items.where((i) => i.kind == 'lesson').length);
}

class CurriculumModule {
  final String id;
  final String title;
  final int orderIndex;
  final List<CurriculumItem> items;

  const CurriculumModule({
    required this.id,
    required this.title,
    required this.orderIndex,
    this.items = const [],
  });

  factory CurriculumModule.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'] as List<dynamic>? ?? [];
    return CurriculumModule(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
      items: rawItems
          .map((i) => CurriculumItem.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Lesson entries only (kind == 'lesson'); referenceId = lesson id for GET /api/academy/lessons/:id
  List<CurriculumItem> get lessonItems =>
      items.where((i) => i.kind == 'lesson').toList();
}

class CurriculumItem {
  final String id;
  final String kind;
  final String? referenceId;
  final int orderIndex;
  final String? title;
  final int? videoDurationSeconds;
  final bool isUnlocked;
  final bool isPreview;
  final String? status;

  const CurriculumItem({
    required this.id,
    required this.kind,
    this.referenceId,
    required this.orderIndex,
    this.title,
    this.videoDurationSeconds,
    this.isUnlocked = true,
    this.isPreview = false,
    this.status,
  });

  factory CurriculumItem.fromJson(Map<String, dynamic> json) {
    return CurriculumItem(
      id: json['id']?.toString() ?? '',
      kind: json['kind']?.toString() ?? 'lesson',
      referenceId: json['referenceId']?.toString(),
      orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
      title: json['title']?.toString(),
      videoDurationSeconds: (json['videoDurationSeconds'] as num?)?.toInt(),
      isUnlocked: json['isUnlocked'] as bool? ?? true,
      isPreview: json['isPreview'] as bool? ?? false,
      status: json['status']?.toString(),
    );
  }

  /// For lesson items, use referenceId as lesson id when opening lesson screen
  String? get lessonId => kind == 'lesson' ? (referenceId ?? id) : null;
}
