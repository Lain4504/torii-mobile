import 'lesson_model.dart';

/// Module model representing a course module/chapter
class Module {
  final String id;
  final String title;
  final String? description;
  final int order;
  final int? durationMinutes;
  final List<Lesson> lessons;

  const Module({
    required this.id,
    required this.title,
    this.description,
    required this.order,
    this.durationMinutes,
    this.lessons = const [],
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      order: json['order'] as int? ?? 0,
      durationMinutes: json['durationMinutes'] as int?,
      lessons: (json['lessons'] as List<dynamic>?)
              ?.map((lesson) => Lesson.fromJson(lesson as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'order': order,
      'durationMinutes': durationMinutes,
      'lessons': lessons.map((lesson) => lesson.toJson()).toList(),
    };
  }

  /// Calculate total duration from lessons if not provided
  int get totalDurationMinutes {
    if (durationMinutes != null) return durationMinutes!;
    
    final totalSeconds = lessons.fold<int>(
      0,
      (sum, lesson) => sum + (lesson.videoDuration ?? 0),
    );
    return (totalSeconds / 60).ceil();
  }

  /// Format duration label
  String get durationLabel {
    final minutes = totalDurationMinutes;
    if (minutes < 60) {
      return '$minutes min';
    }
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    if (remainingMinutes == 0) {
      return '$hours hour${hours > 1 ? 's' : ''}';
    }
    return '$hours h $remainingMinutes min';
  }
}


