class Notebook {
  final String id;
  final String name;
  final String? description;
  final String userId;
  final bool isPublic;
  final int entryCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<NoteEntry> entries;

  const Notebook({
    required this.id,
    required this.name,
    this.description,
    required this.userId,
    this.isPublic = false,
    this.entryCount = 0,
    required this.createdAt,
    required this.updatedAt,
    this.entries = const [],
  });

  factory Notebook.fromJson(Map<String, dynamic> json) {
    return Notebook(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      userId: json['userId'] as String,
      isPublic: json['isPublic'] ?? false,
      entryCount: json['entryCount'] as int? ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      entries: json['entries'] != null
          ? (json['entries'] as List).map((i) => NoteEntry.fromJson(i)).toList()
          : [],
    );
  }

  Notebook copyWith({
    String? id,
    String? name,
    String? description,
    String? userId,
    bool? isPublic,
    int? entryCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<NoteEntry>? entries,
  }) {
    return Notebook(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      isPublic: isPublic ?? this.isPublic,
      entryCount: entryCount ?? this.entryCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      entries: entries ?? this.entries,
    );
  }
}

class NoteEntry {
  final String id;
  final String notebookId;
  final String word;
  final String? phonetic;
  final String meaning;
  final String? note;
  final String partOfSpeech;
  final DateTime createdAt;
  final DateTime updatedAt;

  const NoteEntry({
    required this.id,
    required this.notebookId,
    required this.word,
    this.phonetic,
    required this.meaning,
    this.note,
    this.partOfSpeech = 'noun',
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteEntry.fromJson(Map<String, dynamic> json) {
    return NoteEntry(
      id: json['id'] as String,
      notebookId: json['notebookId'] as String,
      word: json['word'] as String,
      phonetic: json['phonetic'] as String?,
      meaning: json['meaning'] as String,
      note: json['note'] as String?,
      partOfSpeech: json['partOfSpeech'] as String? ?? 'noun',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
