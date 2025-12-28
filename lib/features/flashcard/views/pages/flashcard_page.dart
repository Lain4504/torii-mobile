import 'package:flutter/material.dart';
import '../../viewmodels/flashcard_vm.dart';
import '../widgets/flashcard_tile.dart';

class FlashcardPage extends StatelessWidget {
  const FlashcardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: wire FlashcardVM
    return Scaffold(
      appBar: AppBar(title: const Text('Flashcards')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          FlashcardTile(front: 'こんにちは', back: 'Hello'),
        ],
      ),
    );
  }
}

