import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflutterapp/dataEbook/dummyData.dart';
import 'package:myflutterapp/dataEbook/ebookData.dart';
import 'package:myflutterapp/provider/list_provider.dart';
import 'package:myflutterapp/tampilanUser/tampilanUser/api/apiModel.dart';
import 'package:myflutterapp/tampilanUser/tampilanUser/detailEbook.dart';
import 'package:myflutterapp/tampilanUser/tampilanUser/list_item.dart';
import 'package:myflutterapp/tampilanUser/wishlist/wishlist.dart';
import 'package:provider/provider.dart';
import 'package:myflutterapp/tampilanUser/tampilanUser/api/apiService.dart';
import 'package:carousel_slider/carousel_slider.dart';


class TampilanUserNew extends StatefulWidget {
  TampilanUserNew({Key? key}) : super(key: key);

  @override
  _TampilanUserNew createState() => _TampilanUserNew();
}

class _TampilanUserNew extends State<TampilanUserNew> {

  final List<String> imageUrls = [
    'data:image/jpeg;base64,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',
    'data:image/jpeg;base64,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',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvvatenVBGv85BqdvwYnvpsIUb9uHCD1zm1g&usqp=CAU',
    // Tambahkan URL gambar sesuai kebutuhan
  ];

  List<DataDummy> listdatamodel = [];
  ApiService apiKey = ApiService();


  getData() async{
    listdatamodel = await apiKey.getData();
    setState((){});
  }

  @override
  void initState(){
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var myList = context.watch<ListProvider>().myList;

    // Widget SearchField(){
    //   return Container(
    //     margin: EdgeInsets.symmetric(horizontal: 30),
    //     child: TextField(
    //       decoration: InputDecoration(
    //           hintText: 'search your favorite book',
    //           // hintStyle: ,
    //           fillColor: Colors.grey,
    //           filled: true,
    //           border: OutlineInputBorder(
    //               borderSide: BorderSide.none,
    //               borderRadius: BorderRadius.all(
    //                   Radius.circular(12)
    //               )
    //           ),
    //           isCollapsed: true,
    //           contentPadding: EdgeInsets.all(18),
    //           suffixIcon: InkWell(
    //               onTap: () {},
    //               child: Container(
    //                 padding: EdgeInsets.all(15),
    //                 decoration: BoxDecoration(
    //                     color: Colors.green,
    //                     borderRadius: BorderRadius.all(
    //                         Radius.circular(12)
    //                     )
    //                 ),
    //                 child: Icon(
    //                   Icons.search,
    //                   color: Colors.white,
    //                 ),
    //               )
    //           )
    //       ),
    //     ),
    //   );
    // }

    Widget atas() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Container(
                width: 260,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2016/10/19/08/57/mountains-1752433__340.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2016/08/27/14/38/mountains-1624284__340.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      );
    }

    Widget bawah(){
      return ListView.builder(
        itemBuilder: (context, int index) {
          final EbookData ebook = ebooks[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EbookDetail(
                  ebook: ebooks[index],
                );
              }));
            },
            child: Consumer<ListProvider>(
              builder: (context, ListProvider data, widget) {
                return ListItem(
                    ebook: ebook,
                    isDone: data.myList.contains(ebook),
                    onCheckboxClick: (bool? value) {
                      setState(() {
                        if (value != null) {
                          value
                              ? data.myList.add(ebook)
                              : data.myList.remove(ebook);
                        }
                      });
                    });
              },
            ),
          );
        },
        itemCount: ebooks.length,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // centerTitle: true,
        // leading: Image.asset('assets/splashScreen-removebg-preview.png'),
        title: Text(
          'Ebook',
          style: GoogleFonts.lobster(
            textStyle: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  // items: items,
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                ),
                items: imageUrls.map((url){
                  return Builder(
                    builder: (BuildContext context){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              SizedBox(
                height: 15,
              ),

              /// kategori
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    kategori("rekomendasi"),
                    SizedBox(width: 7,),
                    kategori("terbaru"),
                    SizedBox(width: 7,),
                    kategori("terpopuler"),
                    SizedBox(width: 7,),
                    kategori("terlaris"),
                    SizedBox(width: 7,),
                    kategori("bisnis"),
                    SizedBox(width: 7,),
                    kategori("histori"),
                    SizedBox(width: 7,),
                  ],
                ),
              ),

              Text(
                'see also',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 12,
              ),

              Container(
                width: double.infinity,
                height: 600,
                child: ListView.builder(
                  itemCount: listdatamodel.length,
                  itemBuilder: (context, int index) {
                    // final currentList = read[index];
                    final EbookData data = ebooks[index];
                    return Container(
                      width: double.infinity,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            ///beralih ke halaman detail
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EbookDetail(
                                          ebook: ebooks[index],
                                        )));
                              },
                            ),
                            margin: EdgeInsets.only(right: 8),
                            height: 125,
                            width: 83,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(listdatamodel[index].cover),
                                    fit: BoxFit.cover)),
                          ),
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listdatamodel[index].judul,
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'rating : ' + listdatamodel[index].rating,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.content_copy),
                                      Text(ebooks[index].halaman),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Icon(Icons.star_sharp),
                                      IconButton(
                                        icon: Icon(
                                          Icons.favorite_outlined,
                                          color: myList.contains(data)
                                              ? Colors.red
                                              : Colors.black,
                                          size: 20,
                                        ),
                                        onPressed: (){
                                          if(!myList.contains(data)){
                                            context
                                                .read<ListProvider>()
                                                .addToList(data);
                                          }
                                          else{
                                            context
                                                .read<ListProvider>()
                                                .removeFromList(data);
                                          }
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 10, bottom: 10)
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// widget kategori
  Widget kategori(String title) {
    return Container(
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.blue,
      ),
      child: Center(
        child: Text(title, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black)),
      ),
    );
  }

  ///widget atas scroll ke samping
  Widget myEbook(EbookData ebook) {
    return Container(
      width: 122,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            ///beralih ke halaman detail
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EbookDetail(ebook: ebook)));
              },
            ),
            width: 121.66,
            height: 180.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(ebook.cover), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            ebook.judul,
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}