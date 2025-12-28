import 'package:flutter/material.dart';
import 'app/app.dart';

void main() {
  runApp(const ToriiApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // This class is superseded by ToriiApp but kept to avoid breaking references.
    return const ToriiApp();
  }
}
