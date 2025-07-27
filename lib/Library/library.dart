import 'dart:io';

import 'book.dart';

class Library {
  List<String> paths = [];
  List<Book> books = [];

  Library(String path) {
    addPath(path);
  }

  void addPath(String path) {
    paths.add(path);
    _scanPath(path);
  }

  // Refresh the library by rescanning all paths.
  void renew() {
    books.clear();
    for (String path in paths) {
      _scanPath(path);
    }
  }

  // Scan the given path for book files and add them to the library.
  Future<void> _scanPath(String path) async {
    Directory dir = Directory(path);
    await for (var entity in dir.list(recursive: true, followLinks: true)) {
      if (entity is File) {
        String filename = entity.path;
        if (filename.endsWith('.epub') || filename.endsWith('.pdf')) {
          addBook(entity);
        }
      }
    }
  }

  void addBook(File file) {
    Book book = Book(file);
    books.add(book);
  }

  int getBookCount() {
    return books.length;
  }
}
