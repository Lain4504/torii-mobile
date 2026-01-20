class FlashcardDeck {
  final String id;
  final String name; 
  final String description;
  final String? icon; 
  final String? color;
  final String? jlptLevel;
  final int cardCount;
  final double masteryPercentage; // 0-100 in DB
  final int? studiedCount;

  const FlashcardDeck({
    required this.id,
    required this.name,
    required this.description,
    this.icon,
    this.color,
    this.jlptLevel,
    this.cardCount = 0,
    this.masteryPercentage = 0.0,
    this.studiedCount,
  });

  factory FlashcardDeck.fromJson(Map<String, dynamic> json) {
    return FlashcardDeck(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'], // Parse icon/emoji from API
      color: json['color'], // Parse color if provided
      jlptLevel: json['jlptLevel'],
      cardCount: json['cardCount'] is int ? json['cardCount'] : 0,
      studiedCount: json['studiedCount'] as int?,
      // Docs say masteryPercentage is Decimal.
      masteryPercentage: (json['masteryPercentage'] is num) 
          ? (json['masteryPercentage'] as num).toDouble() 
          : 0.0,
    );
  }

  // --- UI COMPATIBILITY GETTERS ---
  String get title => name;
  String? get emoji => icon ?? '📚'; // Default icon
  double get progress => masteryPercentage / 100.0; // UI expects 0.0-1.0
  int get totalCards => cardCount;

  FlashcardDeck copyWith({
    String? id,
    String? name,
    String? description,
    String? icon,
    String? color,
    String? jlptLevel,
    int? cardCount,
    double? masteryPercentage,
    int? studiedCount,
  }) {
    return FlashcardDeck(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      jlptLevel: jlptLevel ?? this.jlptLevel,
      cardCount: cardCount ?? this.cardCount,
      masteryPercentage: masteryPercentage ?? this.masteryPercentage,
      studiedCount: studiedCount ?? this.studiedCount,
    );
  }
}

class Flashcard {
  final String id;
  final String frontText; 
  final String backText; 
  final String? pronunciation; 
  final String? exampleSentence; 
  final String? wordJlptLevel; // Docs say wordJlptLevel
  final String? partOfSpeech;
  final List<String> tags;
  final String? furigana;

  // Progress/Review data might be nested or flattened depending on endpoint.
  // /api/flashcards/reviews/due returns { flashcard: {...}, userProgress: {...} }
  // Standard /api/flashcards returns flat object.

  const Flashcard({
    required this.id,
    required this.frontText,
    required this.backText,
    this.pronunciation,
    this.exampleSentence,
    this.wordJlptLevel,
    this.partOfSpeech,
    this.tags = const [],
    this.furigana,
  });

  factory Flashcard.fromJson(Map<String, dynamic> json) {
    // Check if wrapped in 'flashcard' key (common in some responses)
    final data = json.containsKey('flashcard') ? json['flashcard'] : json;
    
    return Flashcard(
      id: data['id'].toString(),
      frontText: data['frontText'] ?? '',
      backText: data['backText'] ?? '',
      pronunciation: data['pronunciation'],
      exampleSentence: data['exampleSentence'],
      wordJlptLevel: data['wordJlptLevel'],
      partOfSpeech: data['partOfSpeech'],
      tags: (data['tags'] as List?)?.map((e) => e.toString()).toList() ?? [],
      furigana: data['furigana'],
    );
  }

  // --- UI COMPATIBILITY GETTERS ---
  String get front => frontText;
  String get back => backText;
  String? get reading => pronunciation ?? furigana;
  String? get example => exampleSentence;
}
