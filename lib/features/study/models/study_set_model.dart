class StudySet {
  final String id;
  final String title;
  final String description;
  final int cardCount;
  final List<StudyCard>? setCards;

  StudySet({
    required this.id,
    required this.title,
    required this.description,
    required this.cardCount,
    this.setCards,
  });

  factory StudySet.fromJson(Map<String, dynamic> json) {
    return StudySet(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      cardCount: json['_count']?['setCards'] ?? 0,
      setCards: json['setCards'] != null
          ? (json['setCards'] as List).map((i) => StudyCard.fromJson(i)).toList()
          : null,
    );
  }
}

class StudyCard {
  final String id;
  final String term;
  final String definition;
  final String? hint;

  StudyCard({
    required this.id,
    required this.term,
    required this.definition,
    this.hint,
  });

  factory StudyCard.fromJson(Map<String, dynamic> json) {
    return StudyCard(
      id: json['id'] ?? '',
      term: json['term'] ?? '',
      definition: json['definition'] ?? '',
      hint: json['hint'],
    );
  }
}
