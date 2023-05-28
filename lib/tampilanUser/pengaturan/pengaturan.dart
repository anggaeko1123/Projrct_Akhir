import 'package:flutter/material.dart';
import 'package:myflutterapp/tampilanAwal/setelahSplashScreen.dart';
import 'package:myflutterapp/tampilanUser/pengaturan/isi_Pengaturan/feedback.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Pengaturan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pengaturan')),
      body: _myListView(context),
    );
    // return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  bool isDarkModeEnabled = false;

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? access_token = prefs.getString('access_token');
    final url = Uri.parse('http://127.0.0.1:8000/api/auth/logout');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $access_token',
      },
    );
    if (response.statusCode == 200) {
      // Berhasil logout
      print('Logout berhasil.');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => TampilanAwal()),
            (Route<dynamic> route) => false,
      );
    } else {
      // Terjadi kesalahan saat logout
      print('Logout gagal dengan status: ${response.statusCode}.');
    }
  }
  return ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.account_balance),
        title: Text('Akun'),
        subtitle: Text('Pengaturan akun'),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
      ListTile(
          leading: Icon(Icons.wb_sunny),
          title: Text('Sun'),
          subtitle: Text('Mode Terang'),
          onTap: (){
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => SfPdf()
            // )
            // );
          }
      ),
      ListTile(
        leading: Icon(Icons.brightness_6),
        title: Text('Moon'),
        subtitle: Text('Mode Gelap'),
        // trailing: Switch(
        //   value: isDarkModeEnabled,
        //   // onChanged: (value) {
        //   //   // setState(() {
        //   //   //   isDarkModeEnabled = value;
        //   //   // }
        //   //   );
        //   },
        // ),
      ),
      ListTile(
        leading: Icon(Icons.add_comment_sharp),
        title: Text('FeedBack'),
        subtitle: Text('FeedBack aplikasi'),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FeedbackPage()
            )
            );
          }
      ),
      ListTile(
        leading: Icon(Icons.align_vertical_bottom_sharp),
        title: Text('Lainnya'),
        subtitle: Text('lain-lain'),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Logout'),
        onTap: () async {
          logout();
        },
      ),
    ],
  );
}