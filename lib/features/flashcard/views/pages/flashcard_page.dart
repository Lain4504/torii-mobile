import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/flashcard_providers.dart';
import '../widgets/flashcard_tile.dart';

class FlashcardPage extends ConsumerWidget {
  const FlashcardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(flashcardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcards'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Add new flashcard
            },
          ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(child: Text('Error: ${state.error}'))
              : state.flashcards.isEmpty
                  ? const Center(child: Text('No flashcards yet'))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.flashcards.length,
                      itemBuilder: (context, index) {
                        // TODO: Use actual flashcard data
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: FlashcardTile(
                            front: 'こんにちは',
                            back: 'Hello',
                          ),
                        );
                      },
                    ),
    );
  }
}


