class FlashcardDeck {
  final String id;
  final String title;
  final String description;
  final int totalCards;
  final int learnedCards;
  final String? emoji;

  const FlashcardDeck({
    required this.id,
    required this.title,
    required this.description,
    required this.totalCards,
    required this.learnedCards,
    this.emoji,
  });

  double get progress => totalCards > 0 ? learnedCards / totalCards : 0.0;
}

class Flashcard {
  final String id;
  final String front; // e.g. Kanji
  final String back;  // e.g. Meaning
  final String? reading; // e.g. Hiragana
  final String? example;

  const Flashcard({
    required this.id,
    required this.front,
    required this.back,
    this.reading,
    this.example,
  });
}
