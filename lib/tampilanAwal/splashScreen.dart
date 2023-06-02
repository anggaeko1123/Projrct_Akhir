import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myflutterapp/tampilanAwal/landing_page/landingPage.dart';
import 'package:myflutterapp/tampilanAwal/setelahSplashScreen.dart';

// import 'package:myflutterapp/home/home.dart';
// import 'package:myflutterapp/tampilanAwal/loginRegister/tampilanLogin.dart';

class SplashScreenPage extends StatefulWidget{
  SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState  createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState(){
    super.initState();
    openSplashScreen();
  }

  openSplashScreen() async{
    var durasi = Duration(seconds: 2);

    return Timer(durasi, (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_){
            return LandingPage();
            // return TampilanAwal();
          })
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/splashScreen/splashScreens.jpg',
          width: 500,
          height: 200,
        ),
      ),
    );
  }
}