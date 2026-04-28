class JlptMockTemplateItemModel {
  const JlptMockTemplateItemModel({
    required this.id,
    required this.code,
    required this.title,
    required this.levelCode,
    this.totalDurationMinutes,
  });

  final String id;
  final String code;
  final String title;
  final String levelCode;
  final int? totalDurationMinutes;

  factory JlptMockTemplateItemModel.fromJson(Map<String, dynamic> json) {
    return JlptMockTemplateItemModel(
      id: (json['id'] ?? '').toString(),
      code: (json['code'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      levelCode: (json['levelCode'] ?? json['level'] ?? '').toString(),
      totalDurationMinutes: (json['totalDurationMinutes'] as num?)?.toInt(),
    );
  }
}

class JlptMockTemplateSectionModel {
  const JlptMockTemplateSectionModel({
    required this.id,
    required this.code,
    required this.title,
    required this.durationMinutes,
    required this.orderIndex,
    required this.isListening,
    this.mondai = const <JlptMockMondaiModel>[],
  });

  final String id;
  final String code;
  final String title;
  final int durationMinutes;
  final int orderIndex;
  final bool isListening;
  final List<JlptMockMondaiModel> mondai;

  factory JlptMockTemplateSectionModel.fromJson(Map<String, dynamic> json) {
    final rawMondai = json['mondai'] as List<dynamic>? ?? const [];
    final mondai =
        rawMondai
            .map(
              (e) => JlptMockMondaiModel.fromJson(
                (e as Map).cast<String, dynamic>(),
              ),
            )
            .toList()
          ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    return JlptMockTemplateSectionModel(
      id: (json['id'] ?? '').toString(),
      code: (json['code'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      durationMinutes: (json['durationMinutes'] as num?)?.toInt() ?? 0,
      orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
      isListening: json['isListening'] == true,
      mondai: mondai,
    );
  }
}

class JlptMockMondaiModel {
  const JlptMockMondaiModel({
    required this.id,
    required this.code,
    this.titleVi,
    this.titleJa,
    this.descriptionVi,
    required this.orderIndex,
    this.recommendedQuestionCount,
  });

  final String id;
  final String code;
  final String? titleVi;
  final String? titleJa;
  final String? descriptionVi;
  final int orderIndex;
  final int? recommendedQuestionCount;

  factory JlptMockMondaiModel.fromJson(Map<String, dynamic> json) {
    return JlptMockMondaiModel(
      id: (json['id'] ?? '').toString(),
      code: (json['code'] ?? '').toString(),
      titleVi: json['titleVi']?.toString(),
      titleJa: json['titleJa']?.toString(),
      descriptionVi: json['descriptionVi']?.toString(),
      orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
      recommendedQuestionCount:
          (json['recommendedQuestionCount'] as num?)?.toInt(),
    );
  }
}

class JlptMockQuestionOptionModel {
  const JlptMockQuestionOptionModel({
    required this.id,
    required this.key,
    required this.contentText,
    required this.orderIndex,
  });

  final String id;
  final String key;
  final String contentText;
  final int orderIndex;

  factory JlptMockQuestionOptionModel.fromJson(Map<String, dynamic> json) {
    return JlptMockQuestionOptionModel(
      id: (json['id'] ?? '').toString(),
      key: (json['key'] ?? '').toString(),
      contentText: (json['contentText'] ?? '').toString(),
      orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
    );
  }
}

class JlptMockQuestionModel {
  const JlptMockQuestionModel({
    required this.id,
    required this.stemText,
    this.contextText,
    required this.sectionCode,
    this.audioAssetId,
    this.imageAssetId,
    required this.options,
    this.explanation,
  });

  final String id;
  final String stemText;
  final String? contextText;
  final String sectionCode;
  final String? audioAssetId;
  final String? imageAssetId;
  final List<JlptMockQuestionOptionModel> options;
  final String? explanation;

  factory JlptMockQuestionModel.fromJson(Map<String, dynamic> json) {
    final dynamic optionsData = json['options'];
    List<JlptMockQuestionOptionModel> options = [];

    if (optionsData is List) {
      options = optionsData
          .map(
            (e) => JlptMockQuestionOptionModel.fromJson(
              (e as Map).cast<String, dynamic>(),
            ),
          )
          .toList()
        ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    } else if (optionsData is Map) {
      options = optionsData.entries.map((entry) {
        return JlptMockQuestionOptionModel(
          id: entry.key,
          key: entry.key,
          contentText: entry.value.toString(),
          orderIndex: entry.key.codeUnitAt(0), // Basic sort by A, B, C...
        );
      }).toList();
      options.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    }

    return JlptMockQuestionModel(
      id: (json['id'] ?? '').toString(),
      stemText: (json['stemText'] ?? '').toString(),
      contextText: json['contextText']?.toString(),
      sectionCode: (json['sectionCode'] ?? '').toString(),
      audioAssetId: json['audioAssetId']?.toString(),
      imageAssetId: json['imageAssetId']?.toString(),
      options: options,
      explanation: json['explanation']?.toString(),
    );
  }
}

class JlptMockTemplateQuestionModel {
  const JlptMockTemplateQuestionModel({
    required this.id,
    required this.sectionId,
    required this.mondaiId,
    this.mondai,
    required this.questionId,
    required this.orderIndex,
    required this.question,
  });

  final String id;
  final String sectionId;
  final String? mondaiId;
  final JlptMockMondaiModel? mondai;
  final String questionId;
  final int orderIndex;
  final JlptMockQuestionModel question;

  factory JlptMockTemplateQuestionModel.fromJson(Map<String, dynamic> json) {
    final rawMondai = json['mondai'];
    return JlptMockTemplateQuestionModel(
      id: (json['id'] ?? '').toString(),
      sectionId: (json['sectionId'] ?? '').toString(),
      mondaiId: json['mondaiId']?.toString(),
      mondai: rawMondai is Map
          ? JlptMockMondaiModel.fromJson(rawMondai.cast<String, dynamic>())
          : null,
      questionId: (json['questionId'] ?? '').toString(),
      orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
      question: JlptMockQuestionModel.fromJson(
        ((json['question'] as Map?) ?? const <String, dynamic>{})
            .cast<String, dynamic>(),
      ),
    );
  }
}

class JlptMockTemplateModel {
  const JlptMockTemplateModel({
    required this.id,
    required this.code,
    required this.title,
    required this.levelCode,
    required this.sections,
    required this.questions,
  });

  final String id;
  final String code;
  final String title;
  final String levelCode;
  final List<JlptMockTemplateSectionModel> sections;
  final List<JlptMockTemplateQuestionModel> questions;

  factory JlptMockTemplateModel.fromJson(Map<String, dynamic> json) {
    final rawLevel = json['level'];
    final levelCode = rawLevel is Map
        ? (rawLevel['code'] ?? '').toString()
        : '';
    final rawSections = json['sections'] as List<dynamic>? ?? const [];
    final sections =
        rawSections
            .map(
              (e) => JlptMockTemplateSectionModel.fromJson(
                (e as Map).cast<String, dynamic>(),
              ),
            )
            .toList()
          ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));

    final rawQuestions = json['questions'] as List<dynamic>? ?? const [];
    final questions =
        rawQuestions
            .map(
              (e) => JlptMockTemplateQuestionModel.fromJson(
                (e as Map).cast<String, dynamic>(),
              ),
            )
            .toList()
          ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));

    return JlptMockTemplateModel(
      id: (json['id'] ?? '').toString(),
      code: (json['code'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      levelCode: levelCode,
      sections: sections,
      questions: questions,
    );
  }
}

class JlptMockAttemptStartModel {
  const JlptMockAttemptStartModel({required this.attemptId, this.endsAt});

  final String attemptId;
  final String? endsAt;

  factory JlptMockAttemptStartModel.fromJson(Map<String, dynamic> json) {
    return JlptMockAttemptStartModel(
      attemptId: (json['attemptId'] ?? '').toString(),
      endsAt: json['endsAt']?.toString(),
    );
  }
}

class JlptMockNextSectionModel {
  const JlptMockNextSectionModel({
    required this.currentSectionOrder,
    this.endsAt,
  });

  final int currentSectionOrder;
  final String? endsAt;

  factory JlptMockNextSectionModel.fromJson(Map<String, dynamic> json) {
    return JlptMockNextSectionModel(
      currentSectionOrder: (json['currentSectionOrder'] as num?)?.toInt() ?? 1,
      endsAt: json['endsAt']?.toString(),
    );
  }
}

class JlptMockAttemptHistoryItemModel {
  const JlptMockAttemptHistoryItemModel({
    required this.id,
    required this.templateId,
    required this.status,
    required this.level,
    required this.startedAt,
    required this.submittedAt,
    required this.templateTitle,
    required this.templateCode,
  });

  final String id;
  final String templateId;
  final String status;
  final String level;
  final String? startedAt;
  final String? submittedAt;
  final String templateTitle;
  final String templateCode;

  factory JlptMockAttemptHistoryItemModel.fromJson(Map<String, dynamic> json) {
    final rawTemplate =
        ((json['template'] as Map?) ?? const <String, dynamic>{})
            .cast<String, dynamic>();
    return JlptMockAttemptHistoryItemModel(
      id: (json['id'] ?? '').toString(),
      templateId: (json['templateId'] ?? '').toString(),
      status: (json['status'] ?? '').toString(),
      level: (json['level'] ?? '').toString(),
      startedAt: json['startedAt']?.toString(),
      submittedAt: json['submittedAt']?.toString(),
      templateTitle: (rawTemplate['title'] ?? '').toString(),
      templateCode: (rawTemplate['code'] ?? '').toString(),
    );
  }
}

class JlptMockAttemptResultModel {
  const JlptMockAttemptResultModel({
    required this.id,
    required this.level,
    required this.status,
    required this.startedAt,
    required this.submittedAt,
    required this.languageScaled,
    required this.readingScaled,
    required this.listeningScaled,
    required this.totalScaled,
    required this.passMock,
    this.answers = const [],
    this.templateId,
  });

  final String id;
  final String level;
  final String status;
  final String? startedAt;
  final String? submittedAt;
  final int? languageScaled;
  final int? readingScaled;
  final int? listeningScaled;
  final int? totalScaled;
  final bool? passMock;
  final List<JlptMockAttemptAnswerModel> answers;
  final String? templateId;

  factory JlptMockAttemptResultModel.fromJson(Map<String, dynamic> json) {
    final attempt = ((json['attempt'] as Map?) ?? const <String, dynamic>{})
        .cast<String, dynamic>();
    final scores = ((json['scores'] as Map?) ?? const <String, dynamic>{})
        .cast<String, dynamic>();
    final rawAnswers = json['answers'] as List<dynamic>? ?? const [];
    final answers = rawAnswers
        .map((e) => JlptMockAttemptAnswerModel.fromJson((e as Map).cast<String, dynamic>()))
        .toList();
    
    return JlptMockAttemptResultModel(
      id: (attempt['id'] ?? '').toString(),
      templateId: (attempt['templateId'] ?? json['templateId'] ?? '').toString().isEmpty 
          ? null 
          : (attempt['templateId'] ?? json['templateId']).toString(),
      level: (attempt['level'] ?? '').toString(),
      status: (attempt['status'] ?? '').toString(),
      startedAt: attempt['startedAt']?.toString(),
      submittedAt: attempt['submittedAt']?.toString(),
      languageScaled: (scores['languageScaled'] as num?)?.toInt(),
      readingScaled: (scores['readingScaled'] as num?)?.toInt(),
      listeningScaled: (scores['listeningScaled'] as num?)?.toInt(),
      totalScaled: (scores['totalScaled'] as num?)?.toInt(),
      passMock: scores['passMock'] is bool ? scores['passMock'] as bool : null,
      answers: answers,
    );
  }
}

class JlptMockAttemptAnswerModel {
  const JlptMockAttemptAnswerModel({
    required this.templateQuestionId,
    this.questionId,
    this.selectedOptionId,
    this.correctOptionId,
    this.isCorrect,
    this.review,
    this.sectionCode,
    this.mondaiTitleVi,
    this.mondaiTitleJa,
  });

  final String templateQuestionId;
  final String? questionId;
  final String? selectedOptionId;
  final String? correctOptionId;
  final bool? isCorrect;
  final JlptMockQuestionModel? review;
  final String? sectionCode;
  final String? mondaiTitleVi;
  final String? mondaiTitleJa;

  factory JlptMockAttemptAnswerModel.fromJson(Map<String, dynamic> json) {
    final rawReview = json['review'];
    final section = json['section'] as Map?;
    final sectionCode = (section?['code'] ?? '').toString();
    final mondai = json['mondai'] as Map?;
    final mondaiTitleVi = mondai?['titleVi']?.toString();
    final mondaiTitleJa = mondai?['titleJa']?.toString();

    JlptMockQuestionModel? review;
    if (rawReview is Map) {
      review = JlptMockQuestionModel.fromJson({
        ...rawReview.cast<String, dynamic>(),
        'id': json['questionId'] ?? json['templateQuestionId'],
        'sectionCode': sectionCode,
      });
    }

    return JlptMockAttemptAnswerModel(
      templateQuestionId: (json['templateQuestionId'] ?? '').toString(),
      questionId: json['questionId']?.toString(),
      selectedOptionId: json['selectedOptionId']?.toString(),
      correctOptionId: json['correctOptionId']?.toString(),
      isCorrect: json['isCorrect'] is bool ? json['isCorrect'] as bool : null,
      review: review,
      sectionCode: sectionCode,
      mondaiTitleVi: mondaiTitleVi,
      mondaiTitleJa: mondaiTitleJa,
    );
  }
}
