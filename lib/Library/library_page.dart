import 'package:bilingual_reader/Library/book.dart';
import 'package:bilingual_reader/Setting/settings.dart';
import 'package:flutter/material.dart';

import 'library.dart';

// LibraryPage
// This page is the main entry of the app.
class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final String title = 'Library';
  Library library = Library(Settings.calibrePath);
  int bookCount = 0;

  void _renewLibrary() {
    setState(() {
      bookCount = library.getBookCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('$title : $bookCount Books'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            for (Book book in library.books) Text(book.filename),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _renewLibrary,
        tooltip: 'Renew Library',
        child: const Icon(Icons.sync),
      ),
    );
  }
}
