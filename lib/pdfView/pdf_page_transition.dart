import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(PDFViewerScreen());
}

class PDFViewerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String apiUrl = 'http://127.0.0.1:8000/api/auth/dataEbook';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('View PDF'),
          onPressed: () => fetchPdf(context),
        ),
      ),
    );
  }

  void fetchPdf(BuildContext context) async {
    final response = await http.get(Uri.parse(apiUrl));
    final pdfUrl = response.body;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfScreen(pdfUrl: pdfUrl),
      ),
    );
  }
}

class PdfScreen extends StatelessWidget {
  final String pdfUrl;

  PdfScreen({required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: SfPdfViewer.network(
        pdfUrl,
      ),
    );
  }
}













// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// class PDFViewerScreen extends StatefulWidget {
//   @override
//   _PDFViewerScreenState createState() => _PDFViewerScreenState();
// }
//
// class _PDFViewerScreenState extends State<PDFViewerScreen> {
//   String pdfUrl = '';
//
//   @override
//   void initState() {
//     _getPDFUrl();
//     super.initState();
//   }
//
//   Future<void> _getPDFUrl() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? url = await prefs.getString('link');
//
//     setState(() {
//       pdfUrl = url!;
//       print(pdfUrl);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: SfPdfViewer.network(
//           'http://127.0.0.1:8000' + pdfUrl,
//       ),
//     );
//   }
// }
