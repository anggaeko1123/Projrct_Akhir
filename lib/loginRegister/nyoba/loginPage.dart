import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myflutterapp/bottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginHome(
      title: 'Login',
    );
  }
}

class LoginHome extends StatefulWidget {
  LoginHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginHome> {
  final _formKey = GlobalKey<FormState>();

  late String _email, _password;
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    // kirim data input ke server PHP
    final response = await http
        .post(Uri.parse("http://127.0.0.1:8000/api/auth/login"),
        body: {
      "email": _email,
      "password": _password,
    });

    // menerima response dari server
    final data = jsonDecode(response.body);
    String status = data["status"];
    String datum = json.encode(data["data"]);
    String access_token = data["access_token"];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', access_token);
    String? token = await prefs.getString('access_token');
    Map<String, dynamic> decodeData = json.decode(datum);
    await prefs.setInt('user_id', decodeData['id']);
    print(prefs.getInt('user_id'));
    // print(token);

    if (data["status"] == "Success") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
      );
    } else if (data["status"] == "Unauthorized") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(status),
        backgroundColor: status == "Unauthorized" ? Colors.red : Colors.green,
      ));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            widget.title,
            style: TextStyle(color: Color(0xff001035)),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 0, left: 20, right: 20),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(),
                              width: 200,
                              height: 200,
                              child: Image.asset('assets/landingPage/login.jpg'),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: TextFormField(
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
                              // child: TextField(
                              //   decoration: InputDecoration(
                              //     hintText: 'Email',
                              //     labelText: 'Email',
                              //     prefixIcon: Icon(
                              //         Icons.person
                              //     ),
                              //   ),
                              // ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: "Password"),
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
                              // child: TextField(
                              //   decoration: InputDecoration(
                              //     hintText: 'Password',
                              //     labelText: 'Password',
                              //     prefixIcon: Icon(
                              //         Icons.lock_outline
                              //     ),
                              //
                              //   ),
                              // ),
                            ),
                            Container(
                              width: 400,
                              height: 80,
                              padding: EdgeInsets.only(top: 20),
                              child: ButtonTheme(
                                // minWidth: 400.0,
                                // height: 100,
                                child: Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        _login();
                                      }
                                    },
                                    child: Text('Log In'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
        );
  }
}
