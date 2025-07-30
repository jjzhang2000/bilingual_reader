import 'dart:io';

import 'package:logger/logger.dart';
import 'package:xml/xml.dart';

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
        '$directory${Platform.pathSeparator}cover.jpg'; // Assuming cover image is named 'cover.jpg'
    title = _getBookTitle('$directory${Platform.pathSeparator}metadata.opf');
  }

  String _getBookTitle(String metaFilename) {
    try {
      final metaFile = File(metaFilename);
      if (metaFile.existsSync()) {
        final content = metaFile.readAsStringSync();
        final document = XmlDocument.parse(content);
        final titleElement = document.findAllElements('dc:title').first;
        return titleElement.text;
      } else {
        log.w('Metadata file not found: $metaFilename');
        return file.uri.pathSegments.last
            .split('.')
            .first; // Fallback to filename without extension
      }
    } catch (e) {
      log.e('Error parsing book title: $e');
      return file.uri.pathSegments.last
          .split('.')
          .first; // Fallback to filename if parsing fails
    }
  }

  @override
  String toString() {
    return 'Book(title: $title)';
  }
}
