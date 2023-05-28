import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflutterapp/dataEbook/ebookData.dart';
import 'package:myflutterapp/pdfView/pdfViewer.dart';


class EbookDetail extends StatelessWidget{

  final EbookData ebook;

  EbookDetail({required this.ebook});


  @override
  Widget build(BuildContext context){

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Hero(
              tag: ebook.judul,
              child: Image.network(
                ebook.cover,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 48, left: 32,),
            child: GestureDetector(
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
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.5,
              padding: EdgeInsets.only(top: 64),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30)
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 32, left: 32, bottom: 16,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          Text(
                            ebook.judul,
                            style: GoogleFonts.catamaran(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              height: 0.5,
                            ),
                          ),

                          Text(
                            ebook.halaman + 'halaman',
                            style: GoogleFonts.catamaran(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [

                                Row(
                                  children: <Widget>[

                                    Icon(Icons.star, size: 20, color: Colors.yellowAccent,),
                                    Icon(Icons.star, size: 20, color: Colors.yellowAccent,),
                                    Icon(Icons.star, size: 20, color: Colors.yellowAccent,),
                                    Icon(Icons.star, size: 20, color: Colors.yellowAccent,),
                                    Icon(Icons.star, size: 20, color: Colors.yellowAccent,),

                                  ],
                                ),

                                SizedBox(
                                  width: 12,
                                ),

                                Text(
                                  ebook.rating,
                                  style: GoogleFonts.catamaran(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                              ],
                            ),
                          ),

                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Text(
                                ebook.deskripsi,
                                style: GoogleFonts.catamaran(
                                    fontSize: 16,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  // Container(
                  //   height: 100,
                  //   width: size.width,
                  //   padding: EdgeInsets.only(top: 16, left: 32, right: 32, bottom: 32,),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(30),
                  //     ),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     children: [
                  //
                  //       Container(
                  //         width: size.width / 2 - 44,
                  //         decoration: BoxDecoration(
                  //           color: Colors.orangeAccent,
                  //           borderRadius: BorderRadius.all(
                  //             Radius.circular(15),
                  //           ),
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.white,
                  //               spreadRadius: 2,
                  //               blurRadius: 2,
                  //               offset: Offset(0, 0),
                  //             ),
                  //           ],
                  //         ),
                  //         child: Center(
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Text(
                  //                 "Want to read",
                  //                 style: GoogleFonts.catamaran(
                  //                   fontSize: 18,
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 width: 8,
                  //               ),
                  //               Icon(
                  //                 Icons.keyboard_arrow_down,
                  //                 color: Colors.white,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //
                  //       Container(
                  //         width: size.width / 2 - 44,
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.all(
                  //             Radius.circular(15),
                  //           ),
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.grey.withOpacity(0.4),
                  //               spreadRadius: 2,
                  //               blurRadius: 2,
                  //               offset: Offset(0, 0),
                  //             ),
                  //           ],
                  //           border: Border.all(
                  //             color: Colors.grey,
                  //             width: 1,
                  //           ),
                  //         ),
                  //         child: Center(
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Text(
                  //                 "Get a copy",
                  //                 style: GoogleFonts.catamaran(
                  //                   fontSize: 18,
                  //                   color: Colors.grey,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 width: 8,
                  //               ),
                  //               Icon(
                  //                 Icons.content_copy,
                  //                 color: Colors.purpleAccent,
                  //                 size: 20,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //
                  //     ],
                  //   ),
                  // ),

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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PdfViewNew(index: ebook)));
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
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 32, bottom: (size.height * 0.5) - (75 / 2)),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(ebook.cover),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}