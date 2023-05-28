import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:http/http.dart' as http;
import 'package:myflutterapp/bottomNavBar.dart';
import 'package:myflutterapp/loginRegister/nyoba/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(RegisterScreen());
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RegisterHome(title: 'Register',);
  }
}

class RegisterHome extends StatefulWidget {
  RegisterHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState  extends State<RegisterHome> {

  final _formKey = GlobalKey<FormState>();

  late String _name, _email, _password, password_confirmation;
  bool _isLoading = false;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    // kirim data input ke server PHP
    final response = await http.post(Uri.parse("http://127.0.0.1:8000/api/auth/register"),
        body: {
          "name": _name,
          "email": _email,
          "password": _password,
          "password_confirmation": password_confirmation,
          "role": 'user',
        });

    // menerima response dari server
    final data = jsonDecode(response.body);
    String status = data["status"];
    String message = 'Berhasil Registrasi';
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    print(response);
    print(data);

    if (data["status"] == "Success") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(widget.title,style: TextStyle(color: Color(0xff001035)),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () =>  Navigator.pop(context),
          ),
        ),
        body: _isLoading
          ? Center(child: CircularProgressIndicator())
            : Padding(
            padding: EdgeInsets.all(0),
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
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/landingPage/register.jpg'),
                      // child: Image.network(
                      //     'https://cdn.iconscout.com/icon/free/png-512/flutter-2038877-1720090.png'
                      // ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Name"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name = value!;
                        },
                      ),
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
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
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
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
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
                    ),
                    Container(
                      width: 400,
                      height: 80,
                      padding: EdgeInsets.only(top: 20),
                      child: ButtonTheme(
                        // minWidth: 400.0,
                        // height: 80,
                        child: Container(
                          child: ElevatedButton(
                            onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                _register();
                              }
                            },
                            child: new Text("Sign Up"),
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