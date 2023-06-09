import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('http://localhost/flutter/login.php'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data from server');
  }
}
