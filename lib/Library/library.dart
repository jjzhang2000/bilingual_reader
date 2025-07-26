import 'package:flutter/material.dart';

const String kCalibrePath =
    'D:\\OneDrive\\Books\\Calibre Portable\\Calibre Library';

// LibraryPage
// This page is the main entry of the app.
class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  final String title = 'Library';

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  String calibrePath = kCalibrePath;
  int bookCount = 0;

  void _refreshLibrary() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${calibrePath}'),
            Text(
              '${bookCount} Books',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshLibrary,
        tooltip: 'Refresh Library',
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}
