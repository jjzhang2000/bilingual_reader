import 'dart:io';

class Book {
  final File file;
  late String directory;
  late String filename;
  late String coverImageFilename;
  late String title;

  Book(this.file) {
    directory = file.parent.path;
    filename = file.path;
    coverImageFilename = '';
    title = filename
        .split('/')
        .last
        .split('.')
        .first; // Extract title from filename
  }

  @override
  String toString() {
    return 'Book(title: $title)';
  }
}
