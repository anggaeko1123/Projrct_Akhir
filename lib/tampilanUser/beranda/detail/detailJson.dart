import 'package:flutter/material.dart';
import 'package:myflutterapp/tampilanUser/beranda/detail/isi.dart';
import 'package:myflutterapp/tampilanUser/beranda/detail/jsonModel.dart';
import 'package:google_fonts/google_fonts.dart';


class DetailView extends StatelessWidget {
  DetailView({Key? key, required this.data}) : super(key: key);

  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(
              data.cover.toString(),
              height: 300,
              width: 70,
              fit: BoxFit.cover,
            ),
            Padding(padding: EdgeInsets.all(10)),

            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                "${data.judul}",
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                    fontSize: 30,
                    color: Colors.teal.shade700
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 92,
                    width: 120,
                    color: Colors.lightGreen.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.category_rounded, color: Colors.green,),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                            data.kategoribuku.toString()
                        )
                      ],
                    ),
                  ),

                  Container(
                    height: 92,
                    width: 120,
                    color: Colors.lightBlue.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.date_range, color: Colors.blue,),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                            "${data.tahun_terbit}"
                        )
                      ],
                    ),
                  ),

                  Container(
                    height: 92,
                    width: 120,
                    color: Colors.yellow.shade400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.star_sharp, color: Colors.yellowAccent,),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                            data.rating.toString()
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                data.deskripsi.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                ),
              ),
            ),

            Container(
              width: 200,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                onPressed: (){
                  // Get.to(PdfViewNew(index: data));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Isi(data: data,)));
                },
                child: Text(
                  'Read',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}