import 'package:flutter/material.dart';

import 'Library/library_page.dart';

void main() {
  runApp(const BilingualReaderApp());
}

class BilingualReaderApp extends StatelessWidget {
  const BilingualReaderApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bilingual Reader',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LibraryPage(),
    );
  }
}
