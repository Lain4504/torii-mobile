class Poll {
  final String id;
  final String question;
  final List<PollOption> options;
  final String createdBy;
  final String createdByName;
  final bool isActive;
  final DateTime createdAt;

  Poll({
    required this.id,
    required this.question,
    required this.options,
    required this.createdBy,
    required this.createdByName,
    this.isActive = true,
    required this.createdAt,
  });

  Poll copyWith({
    String? id,
    String? question,
    List<PollOption>? options,
    String? createdBy,
    String? createdByName,
    bool? isActive,
    DateTime? createdAt,
  }) {
    return Poll(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
      createdBy: createdBy ?? this.createdBy,
      createdByName: createdByName ?? this.createdByName,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Poll.fromJson(Map<String, dynamic> json) {
    return Poll(
      id: json['id'] as String,
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => PollOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBy: json['createdBy'] as String,
      createdByName: json['createdByName'] as String? ?? 'Unknown',
      isActive: json['isActive'] as bool? ?? true,
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'options': options.map((e) => e.toJson()).toList(),
      'createdBy': createdBy,
      'createdByName': createdByName,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class PollOption {
  final String id;
  final String text;
  final List<String> votes; // User IDs

  PollOption({
    required this.id,
    required this.text,
    this.votes = const [],
  });

  PollOption copyWith({
    String? id,
    String? text,
    List<String>? votes,
  }) {
    return PollOption(
      id: id ?? this.id,
      text: text ?? this.text,
      votes: votes ?? this.votes,
    );
  }

  factory PollOption.fromJson(Map<String, dynamic> json) {
    return PollOption(
      id: json['id'] as String? ?? '', // ID might be generated or manual
      text: json['text'] as String,
      votes: (json['votes'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'votes': votes,
    };
  }
}
