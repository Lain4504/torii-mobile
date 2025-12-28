import 'package:flutter/material.dart';

class FlashcardTile extends StatelessWidget {
  const FlashcardTile({super.key, required this.front, required this.back});

  final String front;
  final String back;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(front),
        subtitle: Text(back),
        trailing: const Icon(Icons.swap_horiz),
      ),
    );
  }
}

