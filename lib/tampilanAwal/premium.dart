import 'package:flutter/material.dart';

class EbookApp extends StatelessWidget {
  final bool isPremium;

  EbookApp({required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ebook App'),
        ),
        body: Center(
          child: isPremium ? PremiumContent() : FreeContent(),
        ),
      ),
    );
  }
}

class PremiumContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'This is premium content.',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class FreeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'This is free content.',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

void main() {
  bool isPremiumUser = false; // Ganti menjadi true jika pengguna adalah pengguna berbayar
  runApp(EbookApp(isPremium: isPremiumUser));
}
