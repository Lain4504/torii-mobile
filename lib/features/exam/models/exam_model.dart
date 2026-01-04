class Exam {
  final String id;
  final String title;
  final String description;
  final String level;       // e.g. N5, N4
  final int questionCount;
  final int durationMinutes;
  final String difficulty;  // e.g. Beginner, Intermediate
  final List<Question>? questions; // Optional, loaded when starting

  const Exam({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.questionCount,
    required this.durationMinutes,
    required this.difficulty,
    this.questions,
  });

  String get durationLabel => '$durationMinutes min';
}

class Question {
  final String id;
  final String text;
  final List<String> options;
  final int correctIndex;
  final String? audioUrl;
  final String? imageUrl;

  const Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctIndex,
    this.audioUrl,
    this.imageUrl,
  });
}
