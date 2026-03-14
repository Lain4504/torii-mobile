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
    final cards = json['setCards'];
    final list = cards is List ? cards.map((i) => StudyCard.fromJson(i as Map<String, dynamic>)).toList() : null;
    final count = json['_count']?['setCards'] as int? ?? list?.length ?? 0;
    return StudySet(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      cardCount: count,
      setCards: list,
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
      id: json['id']?.toString() ?? '',
      term: json['term']?.toString() ?? '',
      definition: json['definition']?.toString() ?? '',
      hint: json['hint']?.toString(),
    );
  }
}
