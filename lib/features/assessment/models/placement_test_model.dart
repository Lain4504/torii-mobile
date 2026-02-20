class PlacementTest {
  final String testId;
  final List<PlacementQuestion> questions;

  PlacementTest({
    required this.testId,
    required this.questions,
  });

  factory PlacementTest.fromJson(Map<String, dynamic> json) {
    return PlacementTest(
      testId: json['testId'] ?? '',
      questions: (json['questions'] as List? ?? [])
          .map((q) => PlacementQuestion.fromJson(q))
          .toList(),
    );
  }
}

class PlacementQuestion {
  final String id;
  final String type;
  final String content;
  final List<String> options;

  PlacementQuestion({
    required this.id,
    required this.type,
    required this.content,
    required this.options,
  });

  factory PlacementQuestion.fromJson(Map<String, dynamic> json) {
    return PlacementQuestion(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
      content: json['content'] ?? '',
      options: List<String>.from(json['options'] ?? []),
    );
  }
}

class PlacementEvaluation {
  final String testId;
  final double score;
  final int maxScore;
  final String feedback;
  final String? suggestedLevel;
  final String? analysis;

  PlacementEvaluation({
    required this.testId,
    required this.score,
    required this.maxScore,
    required this.feedback,
    this.suggestedLevel,
    this.analysis,
  });

  factory PlacementEvaluation.fromJson(Map<String, dynamic> json) {
    return PlacementEvaluation(
      testId: json['testId'] ?? '',
      score: (json['score'] as num? ?? 0).toDouble(),
      maxScore: json['maxScore'] ?? 0,
      feedback: json['feedback'] ?? '',
      suggestedLevel: json['suggestedLevel'],
      analysis: json['analysis'],
    );
  }
}
