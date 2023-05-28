import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FeedbackPage extends StatelessWidget {
  TextEditingController feedbackController = TextEditingController();

  final String apiUrl = 'http://127.0.0.1:8000/api/auth/create_feedback';


  Future<void> sendFeedback() async {
    String _feedback = feedbackController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('access_token');
    print(prefs.getInt('user_id'));
    int? user_id = await prefs.getInt('user_id');
    String id = user_id.toString();
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          "feedback": _feedback,
          "user_id": id
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Berhasil mengirim feedback
        print('Feedback berhasil dikirim');
      } else {
        // Gagal mengirim feedback
        print('Gagal mengirim feedback');
      }
    } catch (e) {
      // Error saat melakukan permintaan HTTP
      print('Terjadi kesalahan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Feedback'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Berikan Feedback',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Kami sangat menghargai masukan Anda. Silakan berikan feedback Anda mengenai aplikasi ini:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // Container(
            //   padding: EdgeInsets.only(top: 20),
            //   child: TextFormField(
            //     decoration: InputDecoration(labelText: "Email"),
            //     onSaved: (value) {
            //       _feedback = value!;
            //     },
            //   ),
            // ),
            TextField(
              controller: feedbackController,
              decoration: InputDecoration(
                labelText: 'Feedback',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                sendFeedback();
              },
              child: Text('Kirim Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
