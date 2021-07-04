import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class PdfViewerPage extends StatelessWidget {
  final String path;
  const PdfViewerPage({Key key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        body: PDFViewerScaffold(
          appBar: AppBar(
            title: Text(
              'Meter Report',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          path: path,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          foregroundColor: Colors.green,
          child: Icon(Icons.share),
        ),
      ),
    ]);
  }
}
