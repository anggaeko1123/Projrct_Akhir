import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflutterapp/bottomNavBar.dart';
import 'package:myflutterapp/loginDanRegister/loginPreferences.dart';
import 'package:myflutterapp/loginRegister/nyoba/registerNew.dart';
import 'package:myflutterapp/pdfView/flutter_pdfview.dart';
import 'package:myflutterapp/pdfView/pdf_page_transition.dart';
import 'package:myflutterapp/tampilanAwal/landing_page/landingPage.dart';
import 'package:myflutterapp/tampilanAwal/premium.dart';
import 'package:myflutterapp/tampilanAwal/tampilanPremium.dart';
import 'package:myflutterapp/tampilanUser/nyobaTampilan.dart';
import '../loginRegister/nyoba/login.dart';
import '../loginRegister/nyoba/loginPage.dart';
import '../loginRegister/nyoba/registerPage.dart';

class TampilanAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(8),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Selamat Datang',
                      style: GoogleFonts.bangers(
                          fontSize: 30,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text('Verifikasi identitas otomatis yang memungkinkan Anda memverifikasi identitas Anda',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                      ),
                    )
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/splashScreen/splashScreen.jpg')),
                  ),
                ),

                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen())
                    );
                  },
                  color: Colors.blue[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),

                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen())
                    );
                  },
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),

                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TampilanApi())
                    );
                  },
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "p",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),

                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TampilanPremium())
                    );
                  },
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "premium",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),

              ],
            ),
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white
              // image: DecorationImage(
              //     image:
              //     // AssetImage('assets/img/background/backgroundLogin.jpg'),
              //     fit: BoxFit.cover,
              //     colorFilter:
              //     ColorFilter.mode(Colors.black45, BlendMode.dstATop))
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
