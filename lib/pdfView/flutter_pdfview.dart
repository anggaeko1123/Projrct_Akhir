// import 'package:flutter_page_transition/flutter_page_transition.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// class MyPdfView extends StatefulWidget {
//   @override
//   _MyPdfViewState createState() => _MyPdfViewState();
// }
//
// class _MyPdfViewState extends State<MyPdfView> {
//   late PDFViewController _pdfViewController;
//   int _currentPageNumber = 0;
//   int _totalPages = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: PDFView(
//         filePath: 'assets/pdf/Buku Bisnis Ala Nabi.pdf',
//         enableSwipe: true,
//         swipeHorizontal: true,
//         autoSpacing: true,
//         pageFling: true,
//         onRender: (_pages) {
//           setState(() {
//             _totalPages = _pages!;
//           });
//         },
//         onViewCreated: (PDFViewController vc) {
//           _pdfViewController = vc;
//         },
//         onPageChanged: (int? page, int? total) {
//           setState(() {
//             _currentPageNumber = page!;
//           });
//         },
//         pageSnapping: true,
//         transition: new SlideTransition(),
//         swipeNavigation: false,
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           _currentPageNumber > 0
//               ? FloatingActionButton(
//             onPressed: () async {
//               final isPreviousPageRendered =
//               await _pdfViewController.setPage(_currentPageNumber - 1);
//               if (!isPreviousPageRendered!) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text("Previous page hasn't been rendered yet"),
//                   ),
//                 );
//               }
//             },
//             child: Icon(Icons.arrow_back),
//           )
//               : Offstage(),
//           SizedBox(width: 20),
//           _currentPageNumber < _totalPages - 1
//               ? FloatingActionButton(
//             onPressed: () async {
//               final isNextPageRendered =
//               await _pdfViewController.setPage(_currentPageNumber + 1);
//               if (!isNextPageRendered!) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text("Next page hasn't been rendered yet"),
//                   ),
//                 );
//               }
//             },
//             child: Icon(Icons.arrow_forward),
//           )
//               : Offstage(),
//         ],
//       ),
//     );
//   }
// }
