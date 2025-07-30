import 'dart:io';

import 'package:logger/logger.dart';

class Book {
  final log = Logger();

  final File file;
  late String directory;
  late String filename;
  late String coverImageFilename;
  late String title;

  Book(this.file) {
    directory = file.parent.path;
    filename = file.path;
    coverImageFilename =
        directory +
        Platform.pathSeparator +
        'cover.jpg'; // Assuming cover image is named 'cover.jpg'
    title = filename
        .split(Platform.pathSeparator)
        .last
        .split('.')
        .first; // Extract title from filename
    log.d('Directory: $directory');
    log.d('Filename: $filename');
    log.d('Cover Image Filename: $coverImageFilename');
    log.d('Title: $title');
  }

  @override
  String toString() {
    return 'Book(title: $title)';
  }
}
