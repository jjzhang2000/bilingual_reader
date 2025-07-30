import 'dart:io';

import 'package:bilingual_reader/Setting/settings.dart';
import 'package:flutter/material.dart';

import '../Book/book_page.dart';
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
      body: ListView.builder(
        itemCount: bookCount,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(5.0),
            height: 180,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookPage(book: library.books[index]),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.file(
                    File(library.books[index].coverImageFilename),
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.book, size: 180);
                    },
                    width: 180,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    library.books[index].title,
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _renewLibrary,
        tooltip: 'Renew Library',
        child: const Icon(Icons.sync),
      ),
    );
  }
}
