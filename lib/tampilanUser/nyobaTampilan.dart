import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myflutterapp/pdfView/pdf_page_transition.dart';

void main() {
  runApp(TampilanApi());
}

class Book {
  final int id;
  final String title;
  final String cover;
  final String year;
  final String category1;
  final String category2;
  final int rating;
  final String jenis;
  final String penulis;
  final String description;
  final String fileUrl;

  Book({
    required this.id,
    required this.title,
    required this.cover,
    required this.year,
    required this.category1,
    required this.category2,
    required this.rating,
    required this.jenis,
    required this.penulis,
    required this.description,
    required this.fileUrl,
  });
}

class TampilanApi extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<TampilanApi> {
  List<Book> books = [];
  bool isListView = true;

  Future<List<Book>> fetchBooksFromApi() async {
    // final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/auth/dataEbook'));
    final url = Uri.parse('http://127.0.0.1:8000/api/auth/dataEbook');
    final headers = {'Access-Control-Allow-Origin': '*'};

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<Book> fetchedBooks = data.map((item) {
        return Book(
          id: item['id'],
          title: item['judul'],
          cover: item['image_url'],
          year: item['terbit'],
          category1: item['kategori_1'],
          category2: item['kategori_2'],
          rating: item['rating'],
          jenis: item['jenis'],
          penulis: item['penulis'],
          description: item['deskripsi'],
          fileUrl: item['pdf_url'],
        );
      }).toList();
      print(response.body);

      return fetchedBooks;
    } else {
      throw Exception('Failed to fetch books');
    }
  }
  linkpdf(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('link', url);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchBooksFromApi().then((fetchedBooks) {
      setState(() {
        books = fetchedBooks;
      });
    });
  }

  void toggleView() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/auth/dataEbook'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<Book> fetchedBooks = data.map((item) {
        return Book(
          id: item['id'],
          title: item['judul'],
          cover: item['image_url'],
          year: item['terbit'],
          category1: item['kategori_1'],
          category2: item['kategori_2'],
          rating: item['rating'],
          jenis: item['jenis'],
          penulis: item['penulis'],
          description: item['deskripsi'],
          fileUrl: item['pdf_url'],
        );
      }).toList();
      print(response.body);
    } else {
      throw Exception('Failed to fetch books');
    }
    setState(() {
      isListView = !isListView;
    });
  }

  Widget buildView() {
    if (isListView) {
      return ListView.builder(
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          final book = books[index];
          String url = book.cover.replaceFirst("public", "");

          return ListTile(
            title: Text(
              book.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            subtitle: Text('Year: ${book.year}'),
            leading: Transform.scale(
              scale: 1.2,
              child: Image.network(
                'http://127.0.0.1:8000' + books[index].cover,
                fit: BoxFit.cover,
                width: 50,
                height: 100,
              ),
            ),
            onTap: () {
              linkpdf(books[index].fileUrl);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFViewerScreen(),
                ),
              );
            },
          );
        },
      );
    }
    else {
      return SingleChildScrollView(
        child: GridView.builder(
          padding: EdgeInsets.all(16),
          itemCount: books.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            final book = books[index];
            String url = book.cover.replaceFirst("public", "");

            return GestureDetector(
              onTap: () {
                linkpdf(books[index].fileUrl);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        child: Image.network(
                          'http://127.0.0.1:8000' + books[index].cover,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text('Year: ${book.year}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookshelf',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bookshelf'),
          actions: [
            IconButton(
              icon: Icon(isListView ? Icons.grid_view : Icons.list),
              onPressed: toggleView,
            ),
          ],
        ),
        body: buildView(),
      ),
    );
  }
}

