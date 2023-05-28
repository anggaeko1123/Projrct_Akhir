// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../bottomNavBar.dart';
//
//
// class LoginPrefences extends StatefulWidget{
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<LoginPrefences>{
//   TextEditingController _username = TextEditingController();
//   TextEditingController _password = TextEditingController();
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin Login'),
//       ),
//       body: Container(
//         margin: EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(10),
//             ),
//             TextField(
//               controller: _username,
//               decoration: InputDecoration(
//                   hintText: 'Username',
//                   hintStyle: const TextStyle(color: Colors.black),
//                   labelText: "masukkan username",
//                   labelStyle: const TextStyle(color: Colors.black),
//                   prefixIcon: const Icon(
//                     Icons.person,
//                     color: Colors.black,
//                   ),
//                   fillColor: Colors.black,
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                     borderSide: const BorderSide(
//                         color: Colors.black
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(
//                         color: Colors.black,
//                         width: 2,
//                       )
//                   )
//               ),
//               style: const TextStyle(fontSize: 16,color: Colors.black),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//             ),
//             TextField(
//               obscureText: true,
//               controller: _password,
//               decoration: InputDecoration(
//                   hintText: 'Password',
//                   hintStyle: const TextStyle(color: Colors.black),
//                   labelText: "masukkan password",
//                   labelStyle: const TextStyle(color: Colors.black),
//                   prefixIcon: const Icon(
//                     Icons.person,
//                     color: Colors.black,
//                   ),
//                   fillColor: Colors.black,
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                     borderSide: const BorderSide(
//                         color: Colors.black
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: const BorderSide(
//                         color: Colors.black,
//                         width: 2,
//                       )
//                   )
//               ),
//             ),
//             SizedBox(height: 20,),
//             RaisedButton(
//               child: Text('Login'),
//               onPressed: _Login,
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// email
//   void _Login(){
//     if(_username.text.isNotEmpty && _password.text.isNotEmpty){
//       if(_username.text == 'admin' && _password.text == '12345678'){
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (c) => BottomNavBar())
//         );
//       }
//     }
//   }
//
//   logout() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       preferences.remove("_Login");
//       preferences.remove("_username");
//     });
//
//     // Navigator.pushAndRemoveUntil(
//     //     context, MaterialPageRoute(
//     //     builder: (BuildContext context) => HomeAwal()),
//     //         (route) => false);
//
//     // BottomNavigationBarItem(
//     //     icon: GestureDetector(
//     //       onTap: () async{
//     //         Dialogs.materialDialog(msg: 'Apakah anda yakin ingin keluar dari aplikasi ?',
//     //             title: "Log Out",
//     //             color: Colors.black,
//     //             context: context,
//     //             actions: [
//     //               IconsOutlineButton(
//     //                 onPressed: (){
//     //                   Navigator.of(context).pop();
//     //                 },
//     //                 text: 'Batal',
//     //                 iconData: Icons.cancel_outlined,
//     //                 textStyle: TextStyle(color: Colors.grey),
//     //                 iconColor: Colors.grey,
//     //               ),
//     //               IconsButton(
//     //                 onPressed: () async{
//     //                   logout();
//     //                 },
//     //                 text: 'keluar',
//     //                 iconData: Icons.logout,
//     //                 color: Colors.red,
//     //                 textStyle: TextStyle(color: Colors.white),
//     //                 iconColor: Colors.white,
//     //
//     //               )
//     //             ]
//     //         );
//     //       },
//     //     )
//     // );
//   }
// }
//
// abstract class Logout extends StatelessWidget{
//
// }
