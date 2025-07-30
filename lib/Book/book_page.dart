import 'dart:io';

import 'package:flutter/material.dart';

import 'book.dart';

class BookPage extends StatefulWidget {
  final Book book;

  const BookPage({super.key, required this.book});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.book.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(
              File(widget.book.coverImageFilename),
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.book, size: 100);
              },
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(widget.book.title, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
