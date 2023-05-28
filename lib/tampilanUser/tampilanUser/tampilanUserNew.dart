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


class TampilanUserNew extends StatefulWidget {
  TampilanUserNew({Key? key}) : super(key: key);

  @override
  _TampilanUserNew createState() => _TampilanUserNew();
}

class _TampilanUserNew extends State<TampilanUserNew> {

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

        // title: Text('ebook'),
        // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.bookmark),
        //     onPressed: () {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context){
        //             return Wishlist();
        //           })
        //       );
        //     },
        //   )
        // ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextField(
              //   // controller: controller,
              //   decoration: InputDecoration(
              //       hintText: 'cari buku',
              //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(20)
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20),
              //         borderSide: BorderSide(
              //             color: Colors.lightGreen,
              //             width: 2.5
              //         ),
              //       )
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Text(
                'My Ebooks',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    myEbook(ebooks[0]),
                    myEbook(ebooks[1]),
                    myEbook(ebooks[2]),
                    myEbook(ebooks[3]),
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