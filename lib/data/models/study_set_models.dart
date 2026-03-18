class StudySetModel {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final bool isPublic;
  final int cardCount;

  const StudySetModel({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    required this.isPublic,
    required this.cardCount,
  });

  factory StudySetModel.fromJson(Map<String, dynamic> json) {
    final count = json['_count'];
    final c = (count is Map) ? (count['setCards'] as num?)?.toInt() : null;
    return StudySetModel(
      id: (json['id'] ?? '').toString(),
      userId: (json['userId'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      description: json['description'] as String?,
      isPublic: json['isPublic'] == true,
      cardCount: c ?? (json['cardCount'] as num?)?.toInt() ?? 0,
    );
  }
}

class SetCardModel {
  final String id;
  final String studySetId;
  final String term;
  final String definition;
  final String? hint;
  final String? mediaUrl;
  final List<String> tags;
  final String? srsState;
  final int? interval;
  final DateTime? nextReviewAt;

  const SetCardModel({
    required this.id,
    required this.studySetId,
    required this.term,
    required this.definition,
    this.hint,
    this.mediaUrl,
    this.tags = const [],
    this.srsState,
    this.interval,
    this.nextReviewAt,
  });

  factory SetCardModel.fromJson(Map<String, dynamic> json) {
    return SetCardModel(
      id: (json['id'] ?? '').toString(),
      studySetId: (json['studySetId'] ?? '').toString(),
      term: (json['term'] ?? '').toString(),
      definition: (json['definition'] ?? '').toString(),
      hint: json['hint'] as String?,
      mediaUrl: json['mediaUrl'] as String?,
      tags: List<String>.from(json['tags'] ?? const []),
      srsState: json['srsState'] as String?,
      interval: (json['interval'] as num?)?.toInt(),
      nextReviewAt: json['nextReviewAt'] != null ? DateTime.tryParse(json['nextReviewAt'].toString()) : null,
    );
  }
}

