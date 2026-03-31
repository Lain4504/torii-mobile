class StudySetModel {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final bool isPublic;
  final int cardCount;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  final String? sourceType; // 'USER', 'SYSTEM' etc

  const StudySetModel({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    required this.isPublic,
    required this.cardCount,
    this.createdAt,
    this.updatedAt,
    this.sourceType,
  });

  bool isMine(String? currentUserId) => userId == currentUserId && sourceType != 'SYSTEM';

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
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'].toString()) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt'].toString()) : null,
      sourceType: json['sourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'title': title,
        'description': description,
        'isPublic': isPublic,
        'cardCount': cardCount,
        'sourceType': sourceType,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
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

  final DateTime? createdAt;
  final DateTime? updatedAt;

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
    this.createdAt,
    this.updatedAt,
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
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'].toString()) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'studySetId': studySetId,
        'term': term,
        'definition': definition,
        'hint': hint,
        'mediaUrl': mediaUrl,
        'tags': tags,
        'srsState': srsState,
        'interval': interval,
        'nextReviewAt': nextReviewAt?.toIso8601String(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
