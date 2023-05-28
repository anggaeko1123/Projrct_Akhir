import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myflutterapp/bottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myflutterapp/component.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late String _email, _password;
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    // kirim data input ke server PHP
    final response = await http
        .post(Uri.parse("http://127.0.0.1:8000/api/auth/login"), body: {
      "email": _email,
      "password": _password,
    });

    // menerima response dari server
    final data = jsonDecode(response.body);
    String status = data["status"];
    String access_token = data["access_token"];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', access_token);
    print(data);
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
                    SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _login();
                        }
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
      // : Stack(
      //     children: <Widget>[
      //       Container(
      //         color: Colors.blue,
      //         height: size.height * 0.4,
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             Hero(
      //               tag: 'logo',
      //               child: Container(
      //                 child: Image.asset('assets/img/logo_login'),
      //                 height: size.height * 0.3,
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //       Positioned(
      //         bottom: size.height * 0.2,
      //         left: size.width * 0.05,
      //         right: size.width * 0.05,
      //         top: size.height * 0.35,
      //         child: TweenAnimationBuilder(
      //           tween: Tween<double>(begin: 2, end: 1),
      //           duration: Duration(seconds: 1),
      //           builder: (context, double scale, child) {
      //             return Transform.scale(scale: scale, child: child);
      //           },
      //           child: Material(
      //             shadowColor: Colors.black,
      //             elevation: 8,
      //             color: Colors.white,
      //             borderRadius: BorderRadius.all(Radius.circular(10)),
      //             child: Container(
      //               margin: EdgeInsets.symmetric(
      //                   horizontal: size.width * 0.02),
      //               child: Column(
      //                 children: <Widget>[
      //                   Text(
      //                     'Login',
      //                     style: TextStyle(
      //                         color: kPrimaryColorTwo, fontSize: 30),
      //                   ),
      //                   SizedBox(height: size.height * 0.08),
      //                   TextFormField(
      //                     cursorColor: kPrimaryColorTwo,
      //                     decoration: kTextFormFieldDecoration.copyWith(),
      //                     validator: (value) {
      //                       if (value!.isEmpty) {
      //                         return "Please enter your email";
      //                       } else if (!value.contains("@")) {
      //                         return "Please enter a valid email address";
      //                       }
      //                       return null;
      //                     },
      //                   ),
      //                   SizedBox(height: 10),
      //                   TextFormField(
      //                     cursorColor: kPrimaryColorTwo,
      //                     decoration: kTextFormFieldDecoration.copyWith(
      //                       labelText: 'Password',
      //                       prefixIcon: Icon(
      //                         Icons.lock,
      //                         color: kPrimaryColorTwo,
      //                       ),
      //                     ),
      //                     validator: (value) {
      //                       if (value!.isEmpty) {
      //                         return "Please enter your password";
      //                       } else if (value.length < 6) {
      //                         return "Password must be at least 6 characters long";
      //                       }
      //                       return null;
      //                     },
      //                     onSaved: (value) {
      //                       _password = value!;
      //                     },
      //                   ),
      //                   SizedBox(height: 20),
      //                   Align(
      //                     alignment: Alignment.centerRight,
      //                     child: Text(
      //                       'Forgot Password?',
      //                       style: TextStyle(
      //                         color: kPrimaryColorTwo,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       Positioned(
      //         top: size.height * 0.77,
      //         left: size.width * 0.39,
      //         child: ElevatedButton(
      //             onPressed: () {},
      //             child: Text('Login'),
      //             style: ElevatedButton.styleFrom(
      //                 primary: kPrimaryColorTwo)),
      //       ),
      //     ],
      //   )
      //     : Padding(
      //   padding: EdgeInsets.all(16),
      //   child: Form(
      //     key: _formKey,
      //     child: Column(
      //       children: [
      //         TextFormField(
      //           decoration: InputDecoration(labelText: "Email"),
      //           validator: (value) {
      //             if (value!.isEmpty) {
      //               return "Please enter your email";
      //             } else if (!value.contains("@")) {
      //               return "Please enter a valid email address";
      //             }
      //             return null;
      //           },
      //           onSaved: (value) {
      //             _email = value!;
      //           },
      //         ),
      //         TextFormField(
      //           decoration: InputDecoration(labelText: "Password"),
      //           obscureText: true,
      //           validator: (value) {
      //             if (value!.isEmpty) {
      //               return "Please enter your password";
      //             } else if (value.length < 6) {
      //               return "Password must be at least 6 characters long";
      //             }
      //             return null;
      //           },
      //           onSaved: (value) {
      //             _password = value!;
      //           },
      //         ),
      //         SizedBox(height: 32),
      //         ElevatedButton(
      //           onPressed: () {
      //             if (_formKey.currentState!.validate()) {
      //               _formKey.currentState!.save();
      //               _login();
      //             }
      //           },
      //           child: Text("Login"),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
