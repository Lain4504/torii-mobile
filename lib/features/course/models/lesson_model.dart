/// Lesson from GET /api/academy/lessons/:id.
/// Prisma: Lesson (id, moduleId, type VIDEO|READING, title, orderIndex, videoUrl, createdAt, updatedAt).

enum LessonType { video, reading }

class Lesson {
  final String id;
  final String? moduleId;
  final LessonType type;
  final String title;
  final int orderIndex;
  final String? videoUrl;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Lesson({
    required this.id,
    this.moduleId,
    required this.type,
    required this.title,
    required this.orderIndex,
    this.videoUrl,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    final typeStr = (json['type'] ?? json['contentType'] ?? 'VIDEO').toString().toUpperCase();
    final type = typeStr == 'READING' ? LessonType.reading : LessonType.video;
    return Lesson(
      id: json['id']?.toString() ?? '',
      moduleId: json['moduleId']?.toString(),
      type: type,
      title: json['title']?.toString() ?? '',
      orderIndex: (json['orderIndex'] as num?)?.toInt() ?? (json['order'] as num?)?.toInt() ?? 0,
      videoUrl: json['videoUrl']?.toString(),
      description: json['description']?.toString(),
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'].toString()) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt'].toString()) : null,
    );
  }

  String get contentType => type == LessonType.video ? 'video' : 'article';
  bool get isVideo => type == LessonType.video;
  bool get isArticle => type == LessonType.reading;
  int? get videoDuration => null;
  String get durationLabel => 'N/A';
  int get order => orderIndex;
  /// For READING lessons, HTML content; falls back to description. UI uses this for article display.
  String? get articleContent => description;
}
