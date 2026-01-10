import 'module_model.dart';

/// Curriculum model containing all modules and lessons for a course
class Curriculum {
  final List<Module> modules;

  const Curriculum({
    this.modules = const [],
  });

  factory Curriculum.fromJson(Map<String, dynamic> json) {
    return Curriculum(
      modules: (json['modules'] as List<dynamic>?)
              ?.map((module) => Module.fromJson(module as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'modules': modules.map((module) => module.toJson()).toList(),
    };
  }

  /// Get total number of lessons
  int get totalLessons {
    return modules.fold<int>(
      0,
      (sum, module) => sum + module.lessons.length,
    );
  }

  /// Get total duration in minutes
  int get totalDurationMinutes {
    return modules.fold<int>(
      0,
      (sum, module) => sum + module.totalDurationMinutes,
    );
  }

  /// Format total duration label
  String get totalDurationLabel {
    final minutes = totalDurationMinutes;
    if (minutes < 60) {
      return '$minutes min';
    }
    final hours = (minutes / 60).toStringAsFixed(1);
    return '$hours hours';
  }
}


