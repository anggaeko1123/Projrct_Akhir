import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflutterapp/tampilanUser/beranda/detail/jsonModel.dart';


class Isi extends StatelessWidget{
  Isi({Key? key, required this.data}) : super(key: key);

  final DataModel data;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.tealAccent,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "Kategori " + data.kategoribuku.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.lobster(
                  fontSize: 30,
                  color: Colors.blue
              ),
            ),
            Image.network(
              data.cover.toString(),
              height: 300,
              width: 70,
              fit: BoxFit.cover,
            ),
            Padding(
                padding: EdgeInsets.only(top: 16)
            ),

            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                data.judul.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.lobster(
                    fontSize: 30,
                    color: Colors.blue
                ),
              ),
            ),

            Container(
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.green.shade200,
                    padding: EdgeInsets.all(40),
                    child: Text(
                      data.isi.toString(),
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}