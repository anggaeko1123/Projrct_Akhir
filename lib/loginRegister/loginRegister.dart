// import 'package:flutter/material.dart';
// import 'package:paproject/loginRegister/loginJWT.dart';
//
// // void main() {
// //   runApp(MyApp());
// // }
//
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Login Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: LoginPage(),
// //     );
// //   }
// // }
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   late String _email;
//   late String _password;
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   bool _secureText = true;
//
//   showHide() {
//     setState(() {
//       _secureText = !_secureText;
//     });
//   }
//
//   check(){
//     final form = _key.currentState;
//     if(form.validate()){
//       from.save();
//       login();
//     }
//   }
//
//   login() async {
//     final response = await http.post("",
//       body: {"email": _email})
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               validator: (input) {
//                 if (input!.isEmpty) {
//                   return 'Please type an email';
//                 }
//                 return null;
//               },
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//               onSaved: (input) => _email = input!,
//             ),
//             TextFormField(
//               validator: (input) {
//                 if (input!.length < 6) {
//                   return 'Your password needs to be at least 6 characters';
//                 }
//                 return null;
//               },
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//               onSaved: (input) => _password = input!,
//             ),
//             RaisedButton(
//               onPressed: _submit,
//               child: Text('Login'),
//             ),
//             FlatButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => RegisterPage()),
//                 );
//               },
//               child: Text('New user? Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _submit() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState?.save();
//       print('email: $_email');
//       print('password: $_password');
//       await login(_email, _password);
//     }
//   }
// }
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   late String _email;
//   late String _password;
//   late String _confirmPassword;
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//     Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'),
//       ),
//       body: Form(
//         key: _formKey,
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 validator: (input){
//                   if(input!.isEmpty){
//                     return 'Please type an email';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//                 onSaved: (input) => _email = input!,
//               ),
//
//               TextFormField(
//                 validator: (input) {
//                   if (input!.length < 6) {
//                     return 'Your password needs to be at least 6 characters';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                 ),
//                 obscureText: true,
//                 onSaved: (input) => _password = input!,
//               ),
//
//               TextFormField(
//                 validator: (input) {
//                   if (input != _password) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Confirm Password',
//                 ),
//                 obscureText: true,
//                 onSaved: (input) => _confirmPassword = input!,
//               )
//             ],
//           )
//       ),
//     );
//   }
//   }