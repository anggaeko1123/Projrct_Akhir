import 'package:flutter/material.dart';
import 'package:myflutterapp/dataEbook/ebookData.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewNew extends StatelessWidget {
  final EbookData index;

  PdfViewNew({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
            index.judul
        ),
      ),
      body: SfPdfViewer.asset(index.isi.toString()),
    );
  }
}