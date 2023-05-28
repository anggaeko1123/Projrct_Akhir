import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myflutterapp/bottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myflutterapp/loginRegister/nyoba/loginPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  late String _username, _email, _password, password_confirmation;
  bool _isLoading = false;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    // kirim data input ke server PHP
    final response = await http.post(Uri.parse("http://127.0.0.1:8000/api/auth/register"),
        body: {
          "firstname": 'angga',
          "lastname": 'eko',
          "username": _username,
          "email": _email,
          "password": _password,
          "password_confirmation": password_confirmation,
          "address": 'ngw',
          "role": 'admin',
    });

    // menerima response dari server
    final data = jsonDecode(response.body);
    String status = data["status"];
    String message = data["message"];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(response);
    print(data);

    if (data["status"] == "Success") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
      );
    }
    else if (data["status"] == "Unauthorized") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(status),
        backgroundColor: status == "Unauthorized" ? Colors.red : Colors.green,
      ));
    }
    setState(() {
      _isLoading = false;
    });

    // tampilkan snackbar dengan pesan response
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: status == "success" ? Colors.green : Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  } else if (!value.contains("@")) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password Confirmation"),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
                onSaved: (value) {
                  password_confirmation = value!;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _register();
                  }
                },
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
